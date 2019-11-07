// Physical memory allocator, intended to allocate
// memory for user processes, kernel stacks, page table pages,
// and pipe buffers. Allocates 4096-byte pages.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "spinlock.h"

void freerange(void *vstart, void *vend);
extern char end[]; // first address after kernel loaded from ELF file
                   // defined by the kernel linker script in kernel.ld

struct run {
  struct run *next;
};

struct {
  struct spinlock lock;
  int use_lock;
  struct run *freelist;
  uint physpage_refcnt[PHYSTOP / PGSIZE];
  uint freepp_cnt; 
} kmem;

// Initialization happens in two phases.
// 1. main() calls kinit1() while still using entrypgdir to place just
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
  char *p;
  kmem.freepp_cnt = 0; 
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE) {
    kmem.physpage_refcnt[V2P(p) / PGSIZE] = 0; // initialize all to 0
    kfree(p);
  }
}
//PAGEBREAK: 21
// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
  struct run *r;
  uint pa = V2P(v);

  if((uint)v % PGSIZE || v < end || pa >= PHYSTOP)
    panic("kfree");

  if(kmem.use_lock)
    acquire(&kmem.lock);

  if(kmem.physpage_refcnt[pa / PGSIZE] > 0)
    kmem.physpage_refcnt[pa / PGSIZE]--;

  if(kmem.physpage_refcnt[pa / PGSIZE] == 0) {
    // Fill with junk to catch dangling refs.
    memset(v, 1, PGSIZE);
    r = (struct run*)v;
    r->next = kmem.freelist;
    kmem.freelist = r;
    kmem.freepp_cnt++; 
  }

  if(kmem.use_lock)
    release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);

  r = kmem.freelist;
  if(r) {
    kmem.freelist = r->next;
    kmem.physpage_refcnt[V2P((char*)r) / PGSIZE] = 1;
    kmem.freepp_cnt--;
  }

  if(kmem.use_lock)
    release(&kmem.lock);


  return (char*)r;
}



uint 
get_rc(uint pa) {
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("get_rc");

  if(kmem.use_lock) acquire(&kmem.lock);
    uint rc = kmem.physpage_refcnt[pa / PGSIZE];
  if(kmem.use_lock) release(&kmem.lock);

  return rc;
}


void 
dec_rc(uint pa) {
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("dec_rc");

  if(kmem.use_lock) acquire(&kmem.lock);
    kmem.physpage_refcnt[pa / PGSIZE]--;
  if(kmem.use_lock) release(&kmem.lock);
}


void 
inc_rc(uint pa) {
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("inc_rc");

  if(kmem.use_lock) acquire(&kmem.lock);
    kmem.physpage_refcnt[pa / PGSIZE]++;
  if(kmem.use_lock) release(&kmem.lock);
}



uint 
n_free_pp(void) {
  if(kmem.use_lock) acquire(&kmem.lock);
    uint fc = kmem.freepp_cnt;
  if(kmem.use_lock) release(&kmem.lock);
  return fc;
}