#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

extern char cow_count[];

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;

  case T_PGFLT:
  {

    void *va = (void*) rcr2();
    struct proc *curproc = myproc();
    char *mem;
    pte_t *pte = walkpgdir(curproc->pgdir, va, 1);
    uint pa = PTE_ADDR(*pte), noref;


    if((uint)va >= curproc->sz) {
      segfault:
      cprintf("Segfault; pid %d %s: trap %d err %d on cpu %d "
              "eip 0x%x addr 0x%x--kill proc\n",
              curproc->pid, curproc->name, T_PGFLT,
              tf->err, cpuid(), tf->eip, va);

      goto bad;
    } 



    /*

    if(pte) {
      // COW 
      if( (*pte & PTE_P)  && (*pte & PTE_U)  && !(*pte & PTE_W)  ) {
        noref = get_rc(pa); 

        if(noref > 1) {
          if(!(mem = kalloc())) goto bad_oom;
          dec_rc(pa);
          memmove(mem, (char*) PGROUNDDOWN((uint)va), PGSIZE);
          *pte = V2P(mem) | PTE_P | PTE_W | PTE_U; 
        } else if(noref == 1) {
          *pte |= PTE_W;
        } else {
          dumppagetable(curproc->pid);
          panic("Wonky reference count! ");
        }

        lcr3(V2P(curproc->pgdir));
      } 

      else if( (*pte & PTE_P) && !(*pte && PTE_U)   ) {
        cprintf("Segfault (possible stack overflow); pid %d (%s) killed. ", curproc->pid, curproc->name);
        goto bad;
      }

      else if(!(*pte & PTE_P)) { 
        if(!(mem = kalloc())) goto bad_oom;

        memset(mem, 0, PGSIZE);

        if(mappages(curproc->pgdir, (char*) PGROUNDDOWN((uint)va), PGSIZE, V2P(mem), PTE_W | PTE_U) < 0) 
          { kfree(mem); goto bad; } 

      }
 
    }
    // AOD 
    else {
      if(!(mem = kalloc())) goto bad_oom;

      memset(mem, 0, PGSIZE);

      if(mappages(curproc->pgdir, (char*) PGROUNDDOWN((uint)va), PGSIZE, V2P(mem), PTE_W | PTE_U) < 0) 
        { kfree(mem); goto bad; } 

    }
    */

  

    // AOD 
    if(!(*pte & PTE_P)) {

      if(!(mem = kalloc())) goto bad_oom;

      memset(mem, 0, PGSIZE);

      if(mappages(curproc->pgdir, 
               (char*) PGROUNDDOWN((uint)va), 
               PGSIZE,
               V2P(mem),
               PTE_W | PTE_U) < 0) {
        kfree(mem); goto bad;
      }

    }
    else if(!(*pte & PTE_U)) {
      goto segfault;
    }
    else if(!(*pte & PTE_W)) {
      
      noref = get_rc(pa); 

      // cprintf("not writable \n");

      if(noref > 1) { 
        if(!(mem = kalloc())) goto bad_oom;

        dec_rc(pa);

        memmove(mem, (char*) PGROUNDDOWN((uint)va), PGSIZE);

        *pte = V2P(mem) | PTE_P | PTE_W | PTE_U;

      } 
      else if(noref == 1) {
        *pte |= PTE_W; 
      } 

      lcr3(V2P(curproc->pgdir));
      
    } else {
      panic("trap refcount");
    }
    
    break;    

  bad_oom:

    cprintf("OOM; pid %d (%s) killed; allocated %d bytes\n", curproc->pid, curproc->name,  curproc->sz);

  bad: 
    
    curproc->killed = 1;

    break;



  }
  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)

  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
