
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc a0 cf 10 80       	mov    $0x8010cfa0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 e0 30 10 80       	mov    $0x801030e0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb d4 cf 10 80       	mov    $0x8010cfd4,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 60 77 10 80       	push   $0x80107760
80100051:	68 a0 cf 10 80       	push   $0x8010cfa0
80100056:	e8 f5 45 00 00       	call   80104650 <initlock>
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 ec 16 11 80 9c 	movl   $0x8011169c,0x801116ec
80100062:	16 11 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 f0 16 11 80 9c 	movl   $0x8011169c,0x801116f0
8010006c:	16 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba 9c 16 11 80       	mov    $0x8011169c,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 67 77 10 80       	push   $0x80107767
80100097:	50                   	push   %eax
80100098:	e8 a3 44 00 00       	call   80104540 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 f0 16 11 80       	mov    0x801116f0,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    bcache.head.next = b;
801000b0:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d 9c 16 11 80       	cmp    $0x8011169c,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 a0 cf 10 80       	push   $0x8010cfa0
801000e4:	e8 57 46 00 00       	call   80104740 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d f0 16 11 80    	mov    0x801116f0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d ec 16 11 80    	mov    0x801116ec,%ebx
80100126:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 9c 16 11 80    	cmp    $0x8011169c,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 a0 cf 10 80       	push   $0x8010cfa0
80100162:	e8 f9 46 00 00       	call   80104860 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 0e 44 00 00       	call   80104580 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 6e 77 10 80       	push   $0x8010776e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 6d 44 00 00       	call   80104620 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
  iderw(b);
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 7f 77 10 80       	push   $0x8010777f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 2c 44 00 00       	call   80104620 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 dc 43 00 00       	call   801045e0 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 a0 cf 10 80 	movl   $0x8010cfa0,(%esp)
8010020b:	e8 30 45 00 00       	call   80104740 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 f0 16 11 80       	mov    0x801116f0,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 9c 16 11 80 	movl   $0x8011169c,0x50(%ebx)
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100241:	a1 f0 16 11 80       	mov    0x801116f0,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d f0 16 11 80    	mov    %ebx,0x801116f0
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 a0 cf 10 80 	movl   $0x8010cfa0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010025c:	e9 ff 45 00 00       	jmp    80104860 <release>
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 86 77 10 80       	push   $0x80107786
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 af 44 00 00       	call   80104740 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
    while(input.r == input.w){
801002a1:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002a7:	39 15 84 19 11 80    	cmp    %edx,0x80111984
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 b5 10 80       	push   $0x8010b520
801002c0:	68 80 19 11 80       	push   $0x80111980
801002c5:	e8 56 3d 00 00       	call   80104020 <sleep>
    while(input.r == input.w){
801002ca:	8b 15 80 19 11 80    	mov    0x80111980,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 84 19 11 80    	cmp    0x80111984,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
      if(myproc()->killed){
801002db:	e8 60 37 00 00       	call   80103a40 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
        release(&cons.lock);
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 b5 10 80       	push   $0x8010b520
801002ef:	e8 6c 45 00 00       	call   80104860 <release>
        ilock(ip);
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 94 13 00 00       	call   80101690 <ilock>
        return -1;
801002fc:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 80 19 11 80       	mov    %eax,0x80111980
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 00 19 11 80 	movsbl -0x7feee700(%eax),%eax
    if(c == C('D')){  // EOF
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
    *dst++ = c;
80100329:	83 c6 01             	add    $0x1,%esi
    --n;
8010032c:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
8010032f:	83 f8 0a             	cmp    $0xa,%eax
    *dst++ = c;
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
    if(c == '\n')
80100335:	74 43                	je     8010037a <consoleread+0x10a>
  while(n > 0){
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
  release(&cons.lock);
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 b5 10 80       	push   $0x8010b520
8010034d:	e8 0e 45 00 00       	call   80104860 <release>
  ilock(ip);
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 36 13 00 00       	call   80101690 <ilock>
  return target - n;
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
}
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
      if(n < target){
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
        input.r--;
80100372:	89 15 80 19 11 80    	mov    %edx,0x80111980
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
{
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100398:	fa                   	cli    
  cons.locking = 0;
80100399:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
801003a0:	00 00 00 
  getcallerpcs(&s, pcs);
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
801003a9:	e8 c2 25 00 00       	call   80102970 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 8d 77 10 80       	push   $0x8010778d
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003c5:	c7 04 24 b9 7d 10 80 	movl   $0x80107db9,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 93 42 00 00       	call   80104670 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 a1 77 10 80       	push   $0x801077a1
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
  for(i=0; i<10; i++)
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003f9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
  if(panicked){
80100410:	8b 0d 58 b5 10 80    	mov    0x8010b558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
{
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
  if(c == BACKSPACE){
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
    uartputc(c);
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 61 5d 00 00       	call   801061a0 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100457:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
  pos |= inb(CRTPORT+1);
8010046d:	09 fb                	or     %edi,%ebx
  if(c == '\n')
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
  else if(c == BACKSPACE){
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
  if(pos < 0 || pos > 25*80)
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
  if((pos/80) >= 24){  // Scroll up.
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  outb(CRTPORT+1, pos>>8);
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
}
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 af 5c 00 00       	call   801061a0 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 a3 5c 00 00       	call   801061a0 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 97 5c 00 00       	call   801061a0 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
    pos -= 80;
80100517:	83 eb 50             	sub    $0x50,%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 47 44 00 00       	call   80104970 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 7a 43 00 00       	call   801048c0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
    panic("pos under/overflow");
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 a5 77 10 80       	push   $0x801077a5
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
    if(pos > 0) --pos;
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
    pos += 80 - pos%80;
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  if(sign && (sign = xx < 0))
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
    x = xx;
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  i = 0;
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    buf[i++] = digits[x % base];
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 d0 77 10 80 	movzbl -0x7fef8830(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    consputc(buf[i]);
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
  while(--i >= 0)
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
    x = -xx;
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 20 41 00 00       	call   80104740 <acquire>
  for(i = 0; i < n; i++)
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
  for(i = 0; i < n; i++)
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 14 42 00 00       	call   80104860 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(locking)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
  argp = (uint*)(void*)(&fmt + 1);
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010068c:	31 db                	xor    %ebx,%ebx
  argp = (uint*)(void*)(&fmt + 1);
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[++i] & 0xff;
801006a0:	0f b6 16             	movzbl (%esi),%edx
    if(c == 0)
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
    switch(c){
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 10, 1);
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
    if(c != '%'){
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
      consputc(c);
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fe:	0f b6 06             	movzbl (%esi),%eax
      continue;
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(locking)
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
    release(&cons.lock);
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 b5 10 80       	push   $0x8010b520
8010071f:	e8 3c 41 00 00       	call   80104860 <release>
80100724:	83 c4 10             	add    $0x10,%esp
}
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
    switch(c){
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
      printint(*argp++, 16, 0);
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
      break;
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
      consputc(c);
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
      break;
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if((s = (char*)*argp++) == 0)
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
      for(; *s; s++)
80100787:	0f be 02             	movsbl (%edx),%eax
      if((s = (char*)*argp++) == 0)
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      for(; *s; s++)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
      for(; *s; s++)
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
      if((s = (char*)*argp++) == 0)
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
      consputc('%');
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
      break;
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
        s = "(null)";
801007d0:	ba b8 77 10 80       	mov    $0x801077b8,%edx
      for(; *s; s++)
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 b5 10 80       	push   $0x8010b520
801007f0:	e8 4b 3f 00 00       	call   80104740 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
    panic("null fmt");
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 bf 77 10 80       	push   $0x801077bf
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
{
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
  int c, doprocdump = 0;
80100816:	31 f6                	xor    %esi,%esi
{
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
8010081e:	68 20 b5 10 80       	push   $0x8010b520
80100823:	e8 18 3f 00 00       	call   80104740 <acquire>
  while((c = getc()) >= 0){
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
    switch(c){
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
      if(input.e != input.w){
80100851:	a1 88 19 11 80       	mov    0x80111988,%eax
80100856:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
        input.e--;
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 88 19 11 80       	mov    %eax,0x80111988
        consputc(BACKSPACE);
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
  while((c = getc()) >= 0){
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 b5 10 80       	push   $0x8010b520
80100888:	e8 d3 3f 00 00       	call   80104860 <release>
  if(doprocdump) {
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
}
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
    switch(c){
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 88 19 11 80       	mov    0x80111988,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 80 19 11 80    	sub    0x80111980,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
801008c5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008c8:	89 15 88 19 11 80    	mov    %edx,0x80111988
        c = (c == '\r') ? '\n' : c;
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
        input.buf[input.e++ % INPUT_BUF] = c;
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 00 19 11 80    	mov    %cl,-0x7feee700(%eax)
        consputc(c);
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 80 19 11 80       	mov    0x80111980,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 88 19 11 80    	cmp    %eax,0x80111988
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
          wakeup(&input.r);
80100909:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
8010090c:	a3 84 19 11 80       	mov    %eax,0x80111984
          wakeup(&input.r);
80100911:	68 80 19 11 80       	push   $0x80111980
80100916:	e8 c5 38 00 00       	call   801041e0 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      doprocdump = 1;
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      while(input.e != input.w &&
80100938:	a1 88 19 11 80       	mov    0x80111988,%eax
8010093d:	39 05 84 19 11 80    	cmp    %eax,0x80111984
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100950:	a3 88 19 11 80       	mov    %eax,0x80111988
        consputc(BACKSPACE);
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
      while(input.e != input.w &&
8010095f:	a1 88 19 11 80       	mov    0x80111988,%eax
80100964:	3b 05 84 19 11 80    	cmp    0x80111984,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100978:	80 ba 00 19 11 80 0a 	cmpb   $0xa,-0x7feee700(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100997:	e9 24 39 00 00       	jmp    801042c0 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        input.buf[input.e++ % INPUT_BUF] = c;
801009a0:	c6 80 00 19 11 80 0a 	movb   $0xa,-0x7feee700(%eax)
        consputc(c);
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 88 19 11 80       	mov    0x80111988,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:

void
consoleinit(void)
{
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009c6:	68 c8 77 10 80       	push   $0x801077c8
801009cb:	68 20 b5 10 80       	push   $0x8010b520
801009d0:	e8 7b 3c 00 00       	call   80104650 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
801009db:	c7 05 4c 23 11 80 00 	movl   $0x80100600,0x8011234c
801009e2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009e5:	c7 05 48 23 11 80 70 	movl   $0x80100270,0x80112348
801009ec:	02 10 80 
  cons.locking = 1;
801009ef:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
801009f6:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801009f9:	e8 e2 18 00 00       	call   801022e0 <ioapicenable>
}
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a1c:	e8 1f 30 00 00       	call   80103a40 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a27:	e8 b4 23 00 00       	call   80102de0 <begin_op>

  if((ip = namei(path)) == 0){
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 43 0c 00 00       	call   80101690 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 12 0f 00 00       	call   80101970 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 b1 0e 00 00       	call   80101920 <iunlockput>
    end_op();
80100a6f:	e8 dc 23 00 00       	call   80102e50 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100a94:	e8 77 68 00 00       	call   80107310 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
  sz = 0;
80100aa3:	31 ff                	xor    %edi,%edi
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 8c 02 00 00    	je     80100d4b <exec+0x33b>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ph.type != ELF_PROG_LOAD)
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
    if(ph.memsz < ph.filesz)
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 45 66 00 00       	call   80107140 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
    if(ph.vaddr % PGSIZE != 0)
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 53 65 00 00       	call   80107080 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 13 0e 00 00       	call   80101970 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
    freevm(pgdir);
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 19 67 00 00       	call   80107290 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 86 0d 00 00       	call   80101920 <iunlockput>
  end_op();
80100b9a:	e8 b1 22 00 00       	call   80102e50 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 91 65 00 00       	call   80107140 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
    freevm(pgdir);
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 ca 66 00 00       	call   80107290 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
  return -1;
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
    end_op();
80100bd3:	e8 78 22 00 00       	call   80102e50 <end_op>
    cprintf("exec: fail\n");
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 e1 77 10 80       	push   $0x801077e1
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
    return -1;
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
  for(argc = 0; argv[argc]; argc++) {
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 a5 67 00 00       	call   801073b0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(argc >= MAXARG)
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 a2 3e 00 00       	call   80104ae0 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 8f 3e 00 00       	call   80104ae0 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 8e 68 00 00       	call   801074f0 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
  for(argc = 0; argv[argc]; argc++) {
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c77:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
  ustack[1] = argc;
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb1:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cc7:	e8 24 68 00 00       	call   801074f0 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
  for(last=s=path; *s; s++)
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	83 c0 6c             	add    $0x6c,%eax
80100d09:	50                   	push   %eax
80100d0a:	e8 91 3d 00 00       	call   80104aa0 <safestrcpy>
  curproc->pgdir = pgdir;
80100d0f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  oldpgdir = curproc->pgdir;
80100d15:	89 f9                	mov    %edi,%ecx
80100d17:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->tf->eip = elf.entry;  // main
80100d1a:	8b 41 18             	mov    0x18(%ecx),%eax
  curproc->sz = sz;
80100d1d:	89 31                	mov    %esi,(%ecx)
  curproc->pgdir = pgdir;
80100d1f:	89 51 04             	mov    %edx,0x4(%ecx)
  curproc->tf->eip = elf.entry;  // main
80100d22:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d28:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d2b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d2e:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d31:	89 0c 24             	mov    %ecx,(%esp)
80100d34:	e8 b7 61 00 00       	call   80106ef0 <switchuvm>
  freevm(oldpgdir);
80100d39:	89 3c 24             	mov    %edi,(%esp)
80100d3c:	e8 4f 65 00 00       	call   80107290 <freevm>
  return 0;
80100d41:	83 c4 10             	add    $0x10,%esp
80100d44:	31 c0                	xor    %eax,%eax
80100d46:	e9 31 fd ff ff       	jmp    80100a7c <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d4b:	be 00 20 00 00       	mov    $0x2000,%esi
80100d50:	e9 3c fe ff ff       	jmp    80100b91 <exec+0x181>
80100d55:	66 90                	xchg   %ax,%ax
80100d57:	66 90                	xchg   %ax,%ax
80100d59:	66 90                	xchg   %ax,%ax
80100d5b:	66 90                	xchg   %ax,%ax
80100d5d:	66 90                	xchg   %ax,%ax
80100d5f:	90                   	nop

80100d60 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d66:	68 ed 77 10 80       	push   $0x801077ed
80100d6b:	68 a0 19 11 80       	push   $0x801119a0
80100d70:	e8 db 38 00 00       	call   80104650 <initlock>
}
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d84:	bb d4 19 11 80       	mov    $0x801119d4,%ebx
{
80100d89:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100d8c:	68 a0 19 11 80       	push   $0x801119a0
80100d91:	e8 aa 39 00 00       	call   80104740 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 34 23 11 80    	cmp    $0x80112334,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
    if(f->ref == 0){
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100db2:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dbc:	68 a0 19 11 80       	push   $0x801119a0
80100dc1:	e8 9a 3a 00 00       	call   80104860 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dc6:	89 d8                	mov    %ebx,%eax
      return f;
80100dc8:	83 c4 10             	add    $0x10,%esp
}
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
  release(&ftable.lock);
80100dd0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100dd3:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100dd5:	68 a0 19 11 80       	push   $0x801119a0
80100dda:	e8 81 3a 00 00       	call   80104860 <release>
}
80100ddf:	89 d8                	mov    %ebx,%eax
  return 0;
80100de1:	83 c4 10             	add    $0x10,%esp
}
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dfa:	68 a0 19 11 80       	push   $0x801119a0
80100dff:	e8 3c 39 00 00       	call   80104740 <acquire>
  if(f->ref < 1)
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e0e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e11:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e17:	68 a0 19 11 80       	push   $0x801119a0
80100e1c:	e8 3f 3a 00 00       	call   80104860 <release>
  return f;
}
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
    panic("filedup");
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 f4 77 10 80       	push   $0x801077f4
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100e4c:	68 a0 19 11 80       	push   $0x801119a0
80100e51:	e8 ea 38 00 00       	call   80104740 <acquire>
  if(f->ref < 1)
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
    release(&ftable.lock);
80100e6e:	c7 45 08 a0 19 11 80 	movl   $0x801119a0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e7c:	e9 df 39 00 00       	jmp    80104860 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff = *f;
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
  release(&ftable.lock);
80100e8e:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
  f->type = FD_NONE;
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100ea0:	68 a0 19 11 80       	push   $0x801119a0
  ff = *f;
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ea8:	e8 b3 39 00 00       	call   80104860 <release>
  if(ff.type == FD_PIPE)
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
  else if(ff.type == FD_INODE){
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
}
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pipeclose(ff.pipe, ff.writable);
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 ba 26 00 00       	call   80103590 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    begin_op();
80100ee0:	e8 fb 1e 00 00       	call   80102de0 <begin_op>
    iput(ff.ip);
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 d0 08 00 00       	call   801017c0 <iput>
    end_op();
80100ef0:	83 c4 10             	add    $0x10,%esp
}
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
    end_op();
80100efa:	e9 51 1f 00 00       	jmp    80102e50 <end_op>
    panic("fileclose");
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 fc 77 10 80       	push   $0x801077fc
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
    ilock(f->ip);
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 66 07 00 00       	call   80101690 <ilock>
    stati(f->ip, st);
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 09 0a 00 00       	call   80101940 <stati>
    iunlock(f->ip);
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 30 08 00 00       	call   80101770 <iunlock>
    return 0;
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return -1;
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
    ilock(f->ip);
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 01 07 00 00       	call   80101690 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 d4 09 00 00       	call   80101970 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
      f->off += r;
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 bd 07 00 00       	call   80101770 <iunlock>
    return r;
80100fb3:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fcd:	e9 6e 27 00 00       	jmp    80103740 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
  panic("fileread");
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 06 78 10 80       	push   $0x80107806
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
{
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101029:	31 ff                	xor    %edi,%edi
    while(i < n){
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101038:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
        f->off += r;
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101044:	e8 27 07 00 00       	call   80101770 <iunlock>
      end_op();
80101049:	e8 02 1e 00 00       	call   80102e50 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
        panic("short filewrite");
      i += r;
8010105c:	01 df                	add    %ebx,%edi
    while(i < n){
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
      int n1 = n - i;
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 06 00 00       	mov    $0x600,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
      begin_op();
80101076:	e8 65 1d 00 00       	call   80102de0 <begin_op>
      ilock(f->ip);
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 0a 06 00 00       	call   80101690 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 d8 09 00 00       	call   80101a70 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
      iunlock(f->ip);
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 c3 06 00 00       	call   80101770 <iunlock>
      end_op();
801010ad:	e8 9e 1d 00 00       	call   80102e50 <end_op>
      if(r < 0)
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
}
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return i == n ? n : -1;
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
}
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
    return pipewrite(f->pipe, addr, n);
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010ed:	e9 3e 25 00 00       	jmp    80103630 <pipewrite>
        panic("short filewrite");
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 0f 78 10 80       	push   $0x8010780f
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
  panic("filewrite");
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 15 78 10 80       	push   $0x80107815
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	57                   	push   %edi
80101114:	56                   	push   %esi
80101115:	53                   	push   %ebx
80101116:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101119:	8b 0d a0 23 11 80    	mov    0x801123a0,%ecx
{
8010111f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101122:	85 c9                	test   %ecx,%ecx
80101124:	0f 84 87 00 00 00    	je     801011b1 <balloc+0xa1>
8010112a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101131:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101134:	83 ec 08             	sub    $0x8,%esp
80101137:	89 f0                	mov    %esi,%eax
80101139:	c1 f8 0c             	sar    $0xc,%eax
8010113c:	03 05 b8 23 11 80    	add    0x801123b8,%eax
80101142:	50                   	push   %eax
80101143:	ff 75 d8             	pushl  -0x28(%ebp)
80101146:	e8 85 ef ff ff       	call   801000d0 <bread>
8010114b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010114e:	a1 a0 23 11 80       	mov    0x801123a0,%eax
80101153:	83 c4 10             	add    $0x10,%esp
80101156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101159:	31 c0                	xor    %eax,%eax
8010115b:	eb 2f                	jmp    8010118c <balloc+0x7c>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101160:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101162:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101165:	bb 01 00 00 00       	mov    $0x1,%ebx
8010116a:	83 e1 07             	and    $0x7,%ecx
8010116d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010116f:	89 c1                	mov    %eax,%ecx
80101171:	c1 f9 03             	sar    $0x3,%ecx
80101174:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101179:	85 df                	test   %ebx,%edi
8010117b:	89 fa                	mov    %edi,%edx
8010117d:	74 41                	je     801011c0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010117f:	83 c0 01             	add    $0x1,%eax
80101182:	83 c6 01             	add    $0x1,%esi
80101185:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010118a:	74 05                	je     80101191 <balloc+0x81>
8010118c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010118f:	77 cf                	ja     80101160 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	ff 75 e4             	pushl  -0x1c(%ebp)
80101197:	e8 44 f0 ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010119c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011a3:	83 c4 10             	add    $0x10,%esp
801011a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011a9:	39 05 a0 23 11 80    	cmp    %eax,0x801123a0
801011af:	77 80                	ja     80101131 <balloc+0x21>
  }
  panic("balloc: out of blocks");
801011b1:	83 ec 0c             	sub    $0xc,%esp
801011b4:	68 1f 78 10 80       	push   $0x8010781f
801011b9:	e8 d2 f1 ff ff       	call   80100390 <panic>
801011be:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801011c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011c3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801011c6:	09 da                	or     %ebx,%edx
801011c8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011cc:	57                   	push   %edi
801011cd:	e8 de 1d 00 00       	call   80102fb0 <log_write>
        brelse(bp);
801011d2:	89 3c 24             	mov    %edi,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
801011da:	58                   	pop    %eax
801011db:	5a                   	pop    %edx
801011dc:	56                   	push   %esi
801011dd:	ff 75 d8             	pushl  -0x28(%ebp)
801011e0:	e8 eb ee ff ff       	call   801000d0 <bread>
801011e5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ea:	83 c4 0c             	add    $0xc,%esp
801011ed:	68 00 02 00 00       	push   $0x200
801011f2:	6a 00                	push   $0x0
801011f4:	50                   	push   %eax
801011f5:	e8 c6 36 00 00       	call   801048c0 <memset>
  log_write(bp);
801011fa:	89 1c 24             	mov    %ebx,(%esp)
801011fd:	e8 ae 1d 00 00       	call   80102fb0 <log_write>
  brelse(bp);
80101202:	89 1c 24             	mov    %ebx,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
}
8010120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010120d:	89 f0                	mov    %esi,%eax
8010120f:	5b                   	pop    %ebx
80101210:	5e                   	pop    %esi
80101211:	5f                   	pop    %edi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010121a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101220 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	56                   	push   %esi
80101225:	53                   	push   %ebx
80101226:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101228:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010122a:	bb f4 23 11 80       	mov    $0x801123f4,%ebx
{
8010122f:	83 ec 28             	sub    $0x28,%esp
80101232:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101235:	68 c0 23 11 80       	push   $0x801123c0
8010123a:	e8 01 35 00 00       	call   80104740 <acquire>
8010123f:	83 c4 10             	add    $0x10,%esp
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101245:	eb 17                	jmp    8010125e <iget+0x3e>
80101247:	89 f6                	mov    %esi,%esi
80101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101250:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101256:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010125c:	73 22                	jae    80101280 <iget+0x60>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010125e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101261:	85 c9                	test   %ecx,%ecx
80101263:	7e 04                	jle    80101269 <iget+0x49>
80101265:	39 3b                	cmp    %edi,(%ebx)
80101267:	74 4f                	je     801012b8 <iget+0x98>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101269:	85 f6                	test   %esi,%esi
8010126b:	75 e3                	jne    80101250 <iget+0x30>
8010126d:	85 c9                	test   %ecx,%ecx
8010126f:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101272:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101278:	81 fb 14 40 11 80    	cmp    $0x80114014,%ebx
8010127e:	72 de                	jb     8010125e <iget+0x3e>
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101280:	85 f6                	test   %esi,%esi
80101282:	74 5b                	je     801012df <iget+0xbf>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
80101284:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
80101287:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101289:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
8010129a:	68 c0 23 11 80       	push   $0x801123c0
8010129f:	e8 bc 35 00 00       	call   80104860 <release>

  return ip;
801012a4:	83 c4 10             	add    $0x10,%esp
}
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801012b8:	39 53 04             	cmp    %edx,0x4(%ebx)
801012bb:	75 ac                	jne    80101269 <iget+0x49>
      release(&icache.lock);
801012bd:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
801012c0:	83 c1 01             	add    $0x1,%ecx
      return ip;
801012c3:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
801012c5:	68 c0 23 11 80       	push   $0x801123c0
      ip->ref++;
801012ca:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801012cd:	e8 8e 35 00 00       	call   80104860 <release>
      return ip;
801012d2:	83 c4 10             	add    $0x10,%esp
}
801012d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012d8:	89 f0                	mov    %esi,%eax
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
    panic("iget: no inodes");
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 35 78 10 80       	push   $0x80107835
801012e7:	e8 a4 f0 ff ff       	call   80100390 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	56                   	push   %esi
801012f5:	53                   	push   %ebx
801012f6:	89 c6                	mov    %eax,%esi
801012f8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012fb:	83 fa 0b             	cmp    $0xb,%edx
801012fe:	77 18                	ja     80101318 <bmap+0x28>
80101300:	8d 3c 90             	lea    (%eax,%edx,4),%edi
    if((addr = ip->addrs[bn]) == 0)
80101303:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101306:	85 db                	test   %ebx,%ebx
80101308:	74 76                	je     80101380 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010130a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130d:	89 d8                	mov    %ebx,%eax
8010130f:	5b                   	pop    %ebx
80101310:	5e                   	pop    %esi
80101311:	5f                   	pop    %edi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
80101318:	8d 5a f4             	lea    -0xc(%edx),%ebx
  if(bn < NINDIRECT){
8010131b:	83 fb 7f             	cmp    $0x7f,%ebx
8010131e:	0f 87 90 00 00 00    	ja     801013b4 <bmap+0xc4>
    if((addr = ip->addrs[NDIRECT]) == 0)
80101324:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010132a:	8b 00                	mov    (%eax),%eax
8010132c:	85 d2                	test   %edx,%edx
8010132e:	74 70                	je     801013a0 <bmap+0xb0>
    bp = bread(ip->dev, addr);
80101330:	83 ec 08             	sub    $0x8,%esp
80101333:	52                   	push   %edx
80101334:	50                   	push   %eax
80101335:	e8 96 ed ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
8010133a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010133e:	83 c4 10             	add    $0x10,%esp
    bp = bread(ip->dev, addr);
80101341:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
80101343:	8b 1a                	mov    (%edx),%ebx
80101345:	85 db                	test   %ebx,%ebx
80101347:	75 1d                	jne    80101366 <bmap+0x76>
      a[bn] = addr = balloc(ip->dev);
80101349:	8b 06                	mov    (%esi),%eax
8010134b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010134e:	e8 bd fd ff ff       	call   80101110 <balloc>
80101353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101356:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101359:	89 c3                	mov    %eax,%ebx
8010135b:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010135d:	57                   	push   %edi
8010135e:	e8 4d 1c 00 00       	call   80102fb0 <log_write>
80101363:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
80101366:	83 ec 0c             	sub    $0xc,%esp
80101369:	57                   	push   %edi
8010136a:	e8 71 ee ff ff       	call   801001e0 <brelse>
8010136f:	83 c4 10             	add    $0x10,%esp
}
80101372:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101375:	89 d8                	mov    %ebx,%eax
80101377:	5b                   	pop    %ebx
80101378:	5e                   	pop    %esi
80101379:	5f                   	pop    %edi
8010137a:	5d                   	pop    %ebp
8010137b:	c3                   	ret    
8010137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ip->addrs[bn] = addr = balloc(ip->dev);
80101380:	8b 00                	mov    (%eax),%eax
80101382:	e8 89 fd ff ff       	call   80101110 <balloc>
80101387:	89 47 5c             	mov    %eax,0x5c(%edi)
}
8010138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ip->addrs[bn] = addr = balloc(ip->dev);
8010138d:	89 c3                	mov    %eax,%ebx
}
8010138f:	89 d8                	mov    %ebx,%eax
80101391:	5b                   	pop    %ebx
80101392:	5e                   	pop    %esi
80101393:	5f                   	pop    %edi
80101394:	5d                   	pop    %ebp
80101395:	c3                   	ret    
80101396:	8d 76 00             	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013a0:	e8 6b fd ff ff       	call   80101110 <balloc>
801013a5:	89 c2                	mov    %eax,%edx
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	8b 06                	mov    (%esi),%eax
801013af:	e9 7c ff ff ff       	jmp    80101330 <bmap+0x40>
  panic("bmap: out of range");
801013b4:	83 ec 0c             	sub    $0xc,%esp
801013b7:	68 45 78 10 80       	push   $0x80107845
801013bc:	e8 cf ef ff ff       	call   80100390 <panic>
801013c1:	eb 0d                	jmp    801013d0 <readsb>
801013c3:	90                   	nop
801013c4:	90                   	nop
801013c5:	90                   	nop
801013c6:	90                   	nop
801013c7:	90                   	nop
801013c8:	90                   	nop
801013c9:	90                   	nop
801013ca:	90                   	nop
801013cb:	90                   	nop
801013cc:	90                   	nop
801013cd:	90                   	nop
801013ce:	90                   	nop
801013cf:	90                   	nop

801013d0 <readsb>:
{
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 7a 35 00 00       	call   80104970 <memmove>
  brelse(bp);
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
}
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
  brelse(bp);
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
{
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
  readsb(dev, &sb);
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 a0 23 11 80       	push   $0x801123a0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 b8 23 11 80    	add    0x801123b8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
8010143b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010143d:	c1 fb 03             	sar    $0x3,%ebx
  m = 1 << (bi % 8);
80101440:	ba 01 00 00 00       	mov    $0x1,%edx
80101445:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101448:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
  m = 1 << (bi % 8);
80101451:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 25                	je     80101481 <bfree+0x71>
  bp->data[bi/8] &= ~m;
8010145c:	f7 d2                	not    %edx
8010145e:	89 c6                	mov    %eax,%esi
  log_write(bp);
80101460:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101463:	21 ca                	and    %ecx,%edx
80101465:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
  log_write(bp);
80101469:	56                   	push   %esi
8010146a:	e8 41 1b 00 00       	call   80102fb0 <log_write>
  brelse(bp);
8010146f:	89 34 24             	mov    %esi,(%esp)
80101472:	e8 69 ed ff ff       	call   801001e0 <brelse>
}
80101477:	83 c4 10             	add    $0x10,%esp
8010147a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147d:	5b                   	pop    %ebx
8010147e:	5e                   	pop    %esi
8010147f:	5d                   	pop    %ebp
80101480:	c3                   	ret    
    panic("freeing free block");
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	68 58 78 10 80       	push   $0x80107858
80101489:	e8 02 ef ff ff       	call   80100390 <panic>
8010148e:	66 90                	xchg   %ax,%ax

80101490 <iinit>:
{
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 00 24 11 80       	mov    $0x80112400,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010149c:	68 6b 78 10 80       	push   $0x8010786b
801014a1:	68 c0 23 11 80       	push   $0x801123c0
801014a6:	e8 a5 31 00 00       	call   80104650 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 72 78 10 80       	push   $0x80107872
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 7c 30 00 00       	call   80104540 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 20 40 11 80    	cmp    $0x80114020,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
  readsb(dev, &sb);
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 a0 23 11 80       	push   $0x801123a0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014df:	ff 35 b8 23 11 80    	pushl  0x801123b8
801014e5:	ff 35 b4 23 11 80    	pushl  0x801123b4
801014eb:	ff 35 b0 23 11 80    	pushl  0x801123b0
801014f1:	ff 35 ac 23 11 80    	pushl  0x801123ac
801014f7:	ff 35 a8 23 11 80    	pushl  0x801123a8
801014fd:	ff 35 a4 23 11 80    	pushl  0x801123a4
80101503:	ff 35 a0 23 11 80    	pushl  0x801123a0
80101509:	68 d8 78 10 80       	push   $0x801078d8
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
}
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101529:	83 3d a8 23 11 80 01 	cmpl   $0x1,0x801123a8
{
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    brelse(bp);
80101550:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101553:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d a8 23 11 80    	cmp    %ebx,0x801123a8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 b4 23 11 80    	add    0x801123b4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010157e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101580:	83 c4 10             	add    $0x10,%esp
    dip = (struct dinode*)bp->data + inum%IPB;
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 1d 33 00 00       	call   801048c0 <memset>
      dip->type = type;
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 fb 19 00 00       	call   80102fb0 <log_write>
      brelse(bp);
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015bd:	83 c4 10             	add    $0x10,%esp
}
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
}
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
      return iget(dev, inum);
801015cb:	e9 50 fc ff ff       	jmp    80101220 <iget>
  panic("ialloc: no inodes");
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 78 78 10 80       	push   $0x80107878
801015d8:	e8 b3 ed ff ff       	call   80100390 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
{
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ee:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 b4 23 11 80    	add    0x801123b4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010160c:	83 c4 0c             	add    $0xc,%esp
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101619:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101620:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 2a 33 00 00       	call   80104970 <memmove>
  log_write(bp);
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 62 19 00 00       	call   80102fb0 <log_write>
  brelse(bp);
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
}
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
  brelse(bp);
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:
{
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010166a:	68 c0 23 11 80       	push   $0x801123c0
8010166f:	e8 cc 30 00 00       	call   80104740 <acquire>
  ip->ref++;
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101678:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
8010167f:	e8 dc 31 00 00       	call   80104860 <release>
}
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:
{
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
  acquiresleep(&ip->lock);
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 c9 2e 00 00       	call   80104580 <acquiresleep>
  if(ip->valid == 0){
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
}
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 b4 23 11 80    	add    0x801123b4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016ec:	83 c4 0c             	add    $0xc,%esp
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016f9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016fc:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 43 32 00 00       	call   80104970 <memmove>
    brelse(bp);
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
      panic("ilock: no type");
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 90 78 10 80       	push   $0x80107890
80101752:	e8 39 ec ff ff       	call   80100390 <panic>
    panic("ilock");
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 8a 78 10 80       	push   $0x8010788a
8010175f:	e8 2c ec ff ff       	call   80100390 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
{
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 98 2e 00 00       	call   80104620 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
  releasesleep(&ip->lock);
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010179f:	e9 3c 2e 00 00       	jmp    801045e0 <releasesleep>
    panic("iunlock");
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 9f 78 10 80       	push   $0x8010789f
801017ac:	e8 df eb ff ff       	call   80100390 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801017cc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 ab 2d 00 00       	call   80104580 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017d5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017e4:	74 32                	je     80101818 <iput+0x58>
  releasesleep(&ip->lock);
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 f1 2d 00 00       	call   801045e0 <releasesleep>
  acquire(&icache.lock);
801017ef:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
801017f6:	e8 45 2f 00 00       	call   80104740 <acquire>
  ip->ref--;
801017fb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 c0 23 11 80 	movl   $0x801123c0,0x8(%ebp)
}
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
  release(&icache.lock);
80101810:	e9 4b 30 00 00       	jmp    80104860 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 c0 23 11 80       	push   $0x801123c0
80101820:	e8 1b 2f 00 00       	call   80104740 <acquire>
    int r = ip->ref;
80101825:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101828:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
8010182f:	e8 2c 30 00 00       	call   80104860 <release>
    if(r == 1){
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fe 01             	cmp    $0x1,%esi
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c6 04             	add    $0x4,%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101853:	39 fe                	cmp    %edi,%esi
80101855:	74 19                	je     80101870 <iput+0xb0>
    if(ip->addrs[i]){
80101857:	8b 16                	mov    (%esi),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010185d:	8b 03                	mov    (%ebx),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
      ip->addrs[i] = 0;
80101864:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101870:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010187d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101880:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101887:	53                   	push   %ebx
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
      ip->type = 0;
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101893:	89 1c 24             	mov    %ebx,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
      ip->valid = 0;
8010189b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 33                	pushl  (%ebx)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018c7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c6 04             	add    $0x4,%esi
    for(j = 0; j < NINDIRECT; j++){
801018db:	39 fe                	cmp    %edi,%esi
801018dd:	74 0f                	je     801018ee <iput+0x12e>
      if(a[j])
801018df:	8b 16                	mov    (%esi),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018e5:	8b 03                	mov    (%ebx),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
    brelse(bp);
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018fc:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101902:	8b 03                	mov    (%ebx),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
    ip->addrs[NDIRECT] = 0;
80101909:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
  iput(ip);
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
}
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
  iput(ip);
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
}
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010197f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101987:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010198d:	8b 75 10             	mov    0x10(%ebp),%esi
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 c6                	cmp    %eax,%esi
801019a1:	0f 87 ba 00 00 00    	ja     80101a61 <readi+0xf1>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 f9                	mov    %edi,%ecx
801019ac:	01 f1                	add    %esi,%ecx
801019ae:	0f 82 ad 00 00 00    	jb     80101a61 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019b4:	89 c2                	mov    %eax,%edx
801019b6:	29 f2                	sub    %esi,%edx
801019b8:	39 c8                	cmp    %ecx,%eax
801019ba:	0f 43 d7             	cmovae %edi,%edx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 d2                	test   %edx,%edx
    n = ip->size - off;
801019c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019c4:	74 6c                	je     80101a32 <readi+0xc2>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 11 f9 ff ff       	call   801012f0 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	e8 e6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ed:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019ef:	89 f0                	mov    %esi,%eax
801019f1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019f6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019fb:	83 c4 0c             	add    $0xc,%esp
801019fe:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101a00:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a04:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101a07:	29 fb                	sub    %edi,%ebx
80101a09:	39 d9                	cmp    %ebx,%ecx
80101a0b:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a0e:	53                   	push   %ebx
80101a0f:	50                   	push   %eax
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a10:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a12:	ff 75 e0             	pushl  -0x20(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a15:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a17:	e8 54 2f 00 00       	call   80104970 <memmove>
    brelse(bp);
80101a1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a1f:	89 14 24             	mov    %edx,(%esp)
80101a22:	e8 b9 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a27:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a30:	77 9e                	ja     801019d0 <readi+0x60>
  }
  return n;
80101a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a38:	5b                   	pop    %ebx
80101a39:	5e                   	pop    %esi
80101a3a:	5f                   	pop    %edi
80101a3b:	5d                   	pop    %ebp
80101a3c:	c3                   	ret    
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 17                	ja     80101a61 <readi+0xf1>
80101a4a:	8b 04 c5 40 23 11 80 	mov    -0x7feedcc0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 0c                	je     80101a61 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a5f:	ff e0                	jmp    *%eax
      return -1;
80101a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a66:	eb cd                	jmp    80101a35 <readi+0xc5>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a70 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
  if(ip->type == T_DEV){
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	31 d2                	xor    %edx,%edx
80101aaa:	89 f8                	mov    %edi,%eax
80101aac:	01 f0                	add    %esi,%eax
80101aae:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101ab1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab6:	0f 87 d4 00 00 00    	ja     80101b90 <writei+0x120>
80101abc:	85 d2                	test   %edx,%edx
80101abe:	0f 85 cc 00 00 00    	jne    80101b90 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ac4:	85 ff                	test   %edi,%edi
80101ac6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101acd:	74 72                	je     80101b41 <writei+0xd1>
80101acf:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 f8                	mov    %edi,%eax
80101ada:	e8 11 f8 ff ff       	call   801012f0 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 37                	pushl  (%edi)
80101ae5:	e8 e6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101aea:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101aed:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101af0:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101af2:	89 f0                	mov    %esi,%eax
80101af4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b01:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101b03:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b07:	39 d9                	cmp    %ebx,%ecx
80101b09:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b0c:	53                   	push   %ebx
80101b0d:	ff 75 dc             	pushl  -0x24(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b10:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b12:	50                   	push   %eax
80101b13:	e8 58 2e 00 00       	call   80104970 <memmove>
    log_write(bp);
80101b18:	89 3c 24             	mov    %edi,(%esp)
80101b1b:	e8 90 14 00 00       	call   80102fb0 <log_write>
    brelse(bp);
80101b20:	89 3c 24             	mov    %edi,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b28:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2e:	83 c4 10             	add    $0x10,%esp
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b37:	77 97                	ja     80101ad0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b3f:	77 37                	ja     80101b78 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b47:	5b                   	pop    %ebx
80101b48:	5e                   	pop    %esi
80101b49:	5f                   	pop    %edi
80101b4a:	5d                   	pop    %ebp
80101b4b:	c3                   	ret    
80101b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 44 23 11 80 	mov    -0x7feedcbc(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
    return devsw[ip->major].write(ip, src, n);
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b7b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b5                	jmp    80101b41 <writei+0xd1>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ad                	jmp    80101b44 <writei+0xd4>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 2d 2e 00 00       	call   801049e0 <strncmp>
}
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 85 00 00 00    	jne    80101c5c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	74 3e                	je     80101c21 <dirlookup+0x61>
80101be3:	90                   	nop
80101be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101be8:	6a 10                	push   $0x10
80101bea:	57                   	push   %edi
80101beb:	56                   	push   %esi
80101bec:	53                   	push   %ebx
80101bed:	e8 7e fd ff ff       	call   80101970 <readi>
80101bf2:	83 c4 10             	add    $0x10,%esp
80101bf5:	83 f8 10             	cmp    $0x10,%eax
80101bf8:	75 55                	jne    80101c4f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101bfa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bff:	74 18                	je     80101c19 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101c01:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c04:	83 ec 04             	sub    $0x4,%esp
80101c07:	6a 0e                	push   $0xe
80101c09:	50                   	push   %eax
80101c0a:	ff 75 0c             	pushl  0xc(%ebp)
80101c0d:	e8 ce 2d 00 00       	call   801049e0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c12:	83 c4 10             	add    $0x10,%esp
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 17                	je     80101c30 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101c19:	83 c7 10             	add    $0x10,%edi
80101c1c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c1f:	72 c7                	jb     80101be8 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101c24:	31 c0                	xor    %eax,%eax
}
80101c26:	5b                   	pop    %ebx
80101c27:	5e                   	pop    %esi
80101c28:	5f                   	pop    %edi
80101c29:	5d                   	pop    %ebp
80101c2a:	c3                   	ret    
80101c2b:	90                   	nop
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(poff)
80101c30:	8b 45 10             	mov    0x10(%ebp),%eax
80101c33:	85 c0                	test   %eax,%eax
80101c35:	74 05                	je     80101c3c <dirlookup+0x7c>
        *poff = off;
80101c37:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c3c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c40:	8b 03                	mov    (%ebx),%eax
80101c42:	e8 d9 f5 ff ff       	call   80101220 <iget>
}
80101c47:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4a:	5b                   	pop    %ebx
80101c4b:	5e                   	pop    %esi
80101c4c:	5f                   	pop    %edi
80101c4d:	5d                   	pop    %ebp
80101c4e:	c3                   	ret    
      panic("dirlookup read");
80101c4f:	83 ec 0c             	sub    $0xc,%esp
80101c52:	68 b9 78 10 80       	push   $0x801078b9
80101c57:	e8 34 e7 ff ff       	call   80100390 <panic>
    panic("dirlookup not DIR");
80101c5c:	83 ec 0c             	sub    $0xc,%esp
80101c5f:	68 a7 78 10 80       	push   $0x801078a7
80101c64:	e8 27 e7 ff ff       	call   80100390 <panic>
80101c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c70 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101c83:	0f 84 67 01 00 00    	je     80101df0 <namex+0x180>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c89:	e8 b2 1d 00 00       	call   80103a40 <myproc>
  acquire(&icache.lock);
80101c8e:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101c94:	68 c0 23 11 80       	push   $0x801123c0
80101c99:	e8 a2 2a 00 00       	call   80104740 <acquire>
  ip->ref++;
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101ca2:	c7 04 24 c0 23 11 80 	movl   $0x801123c0,(%esp)
80101ca9:	e8 b2 2b 00 00       	call   80104860 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101cb8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
  if(*path == 0)
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 ee 00 00 00    	je     80101db8 <namex+0x148>
  while(*path != '/' && *path != 0)
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	3c 2f                	cmp    $0x2f,%al
80101ccf:	0f 84 b3 00 00 00    	je     80101d88 <namex+0x118>
80101cd5:	84 c0                	test   %al,%al
80101cd7:	89 da                	mov    %ebx,%edx
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a8 00 00 00       	jmp    80101d88 <namex+0x118>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
    path++;
80101ce4:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x11c>
    memmove(name, s, DIRSIZ);
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 66 2c 00 00       	call   80104970 <memmove>
    path++;
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    memmove(name, s, DIRSIZ);
80101d0d:	83 c4 10             	add    $0x10,%esp
    path++;
80101d10:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
    if(ip->type != T_DIR){
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x160>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x196>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x160>
  iunlock(ip);
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
  iput(ip);
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path != '/' && *path != 0)
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
    memmove(name, s, len);
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 d3 2b 00 00       	call   80104970 <memmove>
    name[len] = 0;
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1ac>
    iput(ip);
    return 0;
  }
  return ip;
}
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  iunlock(ip);
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 97 f9 ff ff       	call   80101770 <iunlock>
  iput(ip);
80101dd9:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101ddc:	31 f6                	xor    %esi,%esi
  iput(ip);
80101dde:	e8 dd f9 ff ff       	call   801017c0 <iput>
      return 0;
80101de3:	83 c4 10             	add    $0x10,%esp
}
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 21 f4 ff ff       	call   80101220 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 b5 fe ff ff       	jmp    80101cbb <namex+0x4b>
      iunlock(ip);
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 61 f9 ff ff       	call   80101770 <iunlock>
      return ip;
80101e0f:	83 c4 10             	add    $0x10,%esp
}
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
    iput(ip);
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
    return 0;
80101e20:	31 f6                	xor    %esi,%esi
    iput(ip);
80101e22:	e8 99 f9 ff ff       	call   801017c0 <iput>
    return 0;
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x14f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
{
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 79 fd ff ff       	call   80101bc0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 fe fa ff ff       	call   80101970 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
    if(de.inum == 0)
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 ae 2b 00 00       	call   80104a40 <strncpy>
  de.inum = inum;
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
  de.inum = inum;
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e9e:	e8 cd fb ff ff       	call   80101a70 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
  return 0;
80101eab:	31 c0                	xor    %eax,%eax
}
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
    iput(ip);
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
    return -1;
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
      panic("dirlink read");
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 c8 78 10 80       	push   $0x801078c8
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
    panic("dirlink");
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 56 7f 10 80       	push   $0x80107f56
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:

struct inode*
namei(char *path)
{
80101ef0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ef1:	31 d2                	xor    %edx,%edx
{
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
}
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f10:	55                   	push   %ebp
  return namex(path, 1, name);
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f16:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f1e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80101f39:	85 c0                	test   %eax,%eax
80101f3b:	0f 84 b4 00 00 00    	je     80101ff5 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f41:	8b 58 08             	mov    0x8(%eax),%ebx
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f4c:	0f 87 96 00 00 00    	ja     80101fe8 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f52:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f57:	89 f6                	mov    %esi,%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	89 ca                	mov    %ecx,%edx
80101f62:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f63:	83 e0 c0             	and    $0xffffffc0,%eax
80101f66:	3c 40                	cmp    $0x40,%al
80101f68:	75 f6                	jne    80101f60 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f6a:	31 ff                	xor    %edi,%edi
80101f6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f71:	89 f8                	mov    %edi,%eax
80101f73:	ee                   	out    %al,(%dx)
80101f74:	b8 01 00 00 00       	mov    $0x1,%eax
80101f79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7e:	ee                   	out    %al,(%dx)
80101f7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f84:	89 d8                	mov    %ebx,%eax
80101f86:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101f87:	89 d8                	mov    %ebx,%eax
80101f89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f8e:	c1 f8 08             	sar    $0x8,%eax
80101f91:	ee                   	out    %al,(%dx)
80101f92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f97:	89 f8                	mov    %edi,%eax
80101f99:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101f9a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa3:	c1 e0 04             	shl    $0x4,%eax
80101fa6:	83 e0 10             	and    $0x10,%eax
80101fa9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fac:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fad:	f6 06 04             	testb  $0x4,(%esi)
80101fb0:	75 16                	jne    80101fc8 <idestart+0x98>
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	89 ca                	mov    %ecx,%edx
80101fb9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	5b                   	pop    %ebx
80101fbe:	5e                   	pop    %esi
80101fbf:	5f                   	pop    %edi
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret    
80101fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
80101fcd:	89 ca                	mov    %ecx,%edx
80101fcf:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101fd0:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80101fd5:	83 c6 5c             	add    $0x5c,%esi
80101fd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdd:	fc                   	cld    
80101fde:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80101fe0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe3:	5b                   	pop    %ebx
80101fe4:	5e                   	pop    %esi
80101fe5:	5f                   	pop    %edi
80101fe6:	5d                   	pop    %ebp
80101fe7:	c3                   	ret    
    panic("incorrect blockno");
80101fe8:	83 ec 0c             	sub    $0xc,%esp
80101feb:	68 34 79 10 80       	push   $0x80107934
80101ff0:	e8 9b e3 ff ff       	call   80100390 <panic>
    panic("idestart");
80101ff5:	83 ec 0c             	sub    $0xc,%esp
80101ff8:	68 2b 79 10 80       	push   $0x8010792b
80101ffd:	e8 8e e3 ff ff       	call   80100390 <panic>
80102002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
{
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102016:	68 46 79 10 80       	push   $0x80107946
8010201b:	68 80 b5 10 80       	push   $0x8010b580
80102020:	e8 2b 26 00 00       	call   80104650 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102025:	58                   	pop    %eax
80102026:	a1 00 c7 14 80       	mov    0x8014c700,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102048:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
  for(i=0; i<1000; i++){
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
      havedisk1 = 1;
8010206a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
80102071:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102074:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102079:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010207e:	ee                   	out    %al,(%dx)
}
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102099:	68 80 b5 10 80       	push   $0x8010b580
8010209e:	e8 9d 26 00 00       	call   80104740 <acquire>

  if((b = idequeue) == 0){
801020a3:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 67                	je     80102117 <ideintr+0x87>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 b5 10 80       	mov    %eax,0x8010b564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020b8:	8b 3b                	mov    (%ebx),%edi
801020ba:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020c0:	75 31                	jne    801020f3 <ideintr+0x63>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c7:	89 f6                	mov    %esi,%esi
801020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801020d0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020d1:	89 c6                	mov    %eax,%esi
801020d3:	83 e6 c0             	and    $0xffffffc0,%esi
801020d6:	89 f1                	mov    %esi,%ecx
801020d8:	80 f9 40             	cmp    $0x40,%cl
801020db:	75 f3                	jne    801020d0 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020dd:	a8 21                	test   $0x21,%al
801020df:	75 12                	jne    801020f3 <ideintr+0x63>
    insl(0x1f0, b->data, BSIZE/4);
801020e1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
801020e4:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ee:	fc                   	cld    
801020ef:	f3 6d                	rep insl (%dx),%es:(%edi)
801020f1:	8b 3b                	mov    (%ebx),%edi

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020f3:	83 e7 fb             	and    $0xfffffffb,%edi
  wakeup(b);
801020f6:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
801020f9:	89 f9                	mov    %edi,%ecx
801020fb:	83 c9 02             	or     $0x2,%ecx
801020fe:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102100:	53                   	push   %ebx
80102101:	e8 da 20 00 00       	call   801041e0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102106:	a1 64 b5 10 80       	mov    0x8010b564,%eax
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	85 c0                	test   %eax,%eax
80102110:	74 05                	je     80102117 <ideintr+0x87>
    idestart(idequeue);
80102112:	e8 19 fe ff ff       	call   80101f30 <idestart>
    release(&idelock);
80102117:	83 ec 0c             	sub    $0xc,%esp
8010211a:	68 80 b5 10 80       	push   $0x8010b580
8010211f:	e8 3c 27 00 00       	call   80104860 <release>

  release(&idelock);
}
80102124:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102127:	5b                   	pop    %ebx
80102128:	5e                   	pop    %esi
80102129:	5f                   	pop    %edi
8010212a:	5d                   	pop    %ebp
8010212b:	c3                   	ret    
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 dd 24 00 00       	call   80104620 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 c6 00 00 00    	je     80102214 <iderw+0xe4>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 ab 00 00 00    	je     80102207 <iderw+0xd7>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 b1 00 00 00    	je     80102221 <iderw+0xf1>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 b5 10 80       	push   $0x8010b580
80102178:	e8 c3 25 00 00       	call   80104740 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010217d:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
  b->qnext = 0;
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 6d                	jmp    80102200 <iderw+0xd0>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
801021a4:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801021a6:	39 1d 64 b5 10 80    	cmp    %ebx,0x8010b564
801021ac:	74 42                	je     801021f0 <iderw+0xc0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 b5 10 80       	push   $0x8010b580
801021c8:	53                   	push   %ebx
801021c9:	e8 52 1e 00 00       	call   80104020 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
  }


  release(&idelock);
801021db:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
}
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
  release(&idelock);
801021e6:	e9 75 26 00 00       	jmp    80104860 <release>
801021eb:	90                   	nop
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    idestart(b);
801021f0:	89 d8                	mov    %ebx,%eax
801021f2:	e8 39 fd ff ff       	call   80101f30 <idestart>
801021f7:	eb b5                	jmp    801021ae <iderw+0x7e>
801021f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102200:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
80102205:	eb 9d                	jmp    801021a4 <iderw+0x74>
    panic("iderw: nothing to do");
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 60 79 10 80       	push   $0x80107960
8010220f:	e8 7c e1 ff ff       	call   80100390 <panic>
    panic("iderw: buf not locked");
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 4a 79 10 80       	push   $0x8010794a
8010221c:	e8 6f e1 ff ff       	call   80100390 <panic>
    panic("iderw: ide disk 1 not present");
80102221:	83 ec 0c             	sub    $0xc,%esp
80102224:	68 75 79 10 80       	push   $0x80107975
80102229:	e8 62 e1 ff ff       	call   80100390 <panic>
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102230:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102231:	c7 05 14 40 11 80 00 	movl   $0xfec00000,0x80114014
80102238:	00 c0 fe 
{
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
  ioapic->reg = reg;
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
  return ioapic->data;
80102249:	a1 14 40 11 80       	mov    0x80114014,%eax
8010224e:	8b 58 10             	mov    0x10(%eax),%ebx
  ioapic->reg = reg;
80102251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return ioapic->data;
80102257:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010225d:	0f b6 15 60 c1 14 80 	movzbl 0x8014c160,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102264:	c1 eb 10             	shr    $0x10,%ebx
  return ioapic->data;
80102267:	8b 41 10             	mov    0x10(%ecx),%eax
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
8010226a:	0f b6 db             	movzbl %bl,%ebx
  id = ioapicread(REG_ID) >> 24;
8010226d:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102270:	39 c2                	cmp    %eax,%edx
80102272:	74 16                	je     8010228a <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 94 79 10 80       	push   $0x80107994
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c3 21             	add    $0x21,%ebx
{
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ioapic->reg = reg;
801022a0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801022a2:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022a8:	89 c6                	mov    %eax,%esi
801022aa:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022b0:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022b3:	89 71 10             	mov    %esi,0x10(%ecx)
801022b6:	8d 72 01             	lea    0x1(%edx),%esi
801022b9:	83 c2 02             	add    $0x2,%edx
  for(i = 0; i <= maxintr; i++){
801022bc:	39 d8                	cmp    %ebx,%eax
  ioapic->reg = reg;
801022be:	89 31                	mov    %esi,(%ecx)
  ioapic->data = data;
801022c0:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022e0:	55                   	push   %ebp
  ioapic->reg = reg;
801022e1:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
{
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
801022f3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022f5:	8b 0d 14 40 11 80    	mov    0x80114014,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022fb:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102304:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102306:	a1 14 40 11 80       	mov    0x80114014,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010230b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
}
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	56                   	push   %esi
80102324:	53                   	push   %ebx
80102325:	8b 75 08             	mov    0x8(%ebp),%esi
  struct run *r;
  uint pa = V2P(v);
80102328:	8d 9e 00 00 00 80    	lea    -0x80000000(%esi),%ebx

  if((uint)v % PGSIZE || v < end || pa >= PHYSTOP)
8010232e:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
80102334:	0f 95 c2             	setne  %dl
80102337:	81 fb ff ff ff 0d    	cmp    $0xdffffff,%ebx
8010233d:	0f 97 c0             	seta   %al
80102340:	08 c2                	or     %al,%dl
80102342:	0f 85 ad 00 00 00    	jne    801023f5 <kfree+0xd5>
80102348:	81 fe a8 f0 14 80    	cmp    $0x8014f0a8,%esi
8010234e:	0f 82 a1 00 00 00    	jb     801023f5 <kfree+0xd5>
    panic("kfree");

  if(kmem.use_lock)
80102354:	8b 15 54 40 11 80    	mov    0x80114054,%edx
8010235a:	85 d2                	test   %edx,%edx
8010235c:	0f 85 7e 00 00 00    	jne    801023e0 <kfree+0xc0>
    acquire(&kmem.lock);

  if(kmem.physpage_refcnt[pa / PGSIZE] > 0)
80102362:	c1 eb 0c             	shr    $0xc,%ebx
80102365:	83 c3 0c             	add    $0xc,%ebx
80102368:	8b 04 9d 2c 40 11 80 	mov    -0x7feebfd4(,%ebx,4),%eax
8010236f:	85 c0                	test   %eax,%eax
80102371:	75 3d                	jne    801023b0 <kfree+0x90>
    kmem.physpage_refcnt[pa / PGSIZE]--;

  if(kmem.physpage_refcnt[pa / PGSIZE] == 0) {
    // Fill with junk to catch dangling refs.
    memset(v, 1, PGSIZE);
80102373:	83 ec 04             	sub    $0x4,%esp
80102376:	68 00 10 00 00       	push   $0x1000
8010237b:	6a 01                	push   $0x1
8010237d:	56                   	push   %esi
8010237e:	e8 3d 25 00 00       	call   801048c0 <memset>
    r = (struct run*)v;
    r->next = kmem.freelist;
80102383:	a1 58 40 11 80       	mov    0x80114058,%eax
    kmem.freelist = r;
    kmem.freepp_cnt++; 
80102388:	83 c4 10             	add    $0x10,%esp
    r->next = kmem.freelist;
8010238b:	89 06                	mov    %eax,(%esi)
  }

  if(kmem.use_lock)
8010238d:	a1 54 40 11 80       	mov    0x80114054,%eax
    kmem.freepp_cnt++; 
80102392:	83 05 5c c0 14 80 01 	addl   $0x1,0x8014c05c
    kmem.freelist = r;
80102399:	89 35 58 40 11 80    	mov    %esi,0x80114058
  if(kmem.use_lock)
8010239f:	85 c0                	test   %eax,%eax
801023a1:	75 24                	jne    801023c7 <kfree+0xa7>
    release(&kmem.lock);
}
801023a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a6:	5b                   	pop    %ebx
801023a7:	5e                   	pop    %esi
801023a8:	5d                   	pop    %ebp
801023a9:	c3                   	ret    
801023aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    kmem.physpage_refcnt[pa / PGSIZE]--;
801023b0:	83 e8 01             	sub    $0x1,%eax
  if(kmem.physpage_refcnt[pa / PGSIZE] == 0) {
801023b3:	85 c0                	test   %eax,%eax
    kmem.physpage_refcnt[pa / PGSIZE]--;
801023b5:	89 04 9d 2c 40 11 80 	mov    %eax,-0x7feebfd4(,%ebx,4)
  if(kmem.physpage_refcnt[pa / PGSIZE] == 0) {
801023bc:	74 b5                	je     80102373 <kfree+0x53>
  if(kmem.use_lock)
801023be:	a1 54 40 11 80       	mov    0x80114054,%eax
801023c3:	85 c0                	test   %eax,%eax
801023c5:	74 dc                	je     801023a3 <kfree+0x83>
    release(&kmem.lock);
801023c7:	c7 45 08 20 40 11 80 	movl   $0x80114020,0x8(%ebp)
}
801023ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023d1:	5b                   	pop    %ebx
801023d2:	5e                   	pop    %esi
801023d3:	5d                   	pop    %ebp
    release(&kmem.lock);
801023d4:	e9 87 24 00 00       	jmp    80104860 <release>
801023d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&kmem.lock);
801023e0:	83 ec 0c             	sub    $0xc,%esp
801023e3:	68 20 40 11 80       	push   $0x80114020
801023e8:	e8 53 23 00 00       	call   80104740 <acquire>
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	e9 6d ff ff ff       	jmp    80102362 <kfree+0x42>
    panic("kfree");
801023f5:	83 ec 0c             	sub    $0xc,%esp
801023f8:	68 c6 79 10 80       	push   $0x801079c6
801023fd:	e8 8e df ff ff       	call   80100390 <panic>
80102402:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102410 <freerange>:
{
80102410:	55                   	push   %ebp
  kmem.freepp_cnt = 0; 
80102411:	c7 05 5c c0 14 80 00 	movl   $0x0,0x8014c05c
80102418:	00 00 00 
{
8010241b:	89 e5                	mov    %esp,%ebp
8010241d:	56                   	push   %esi
8010241e:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
8010241f:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102422:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
80102425:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
8010242b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE) {
80102431:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102437:	39 de                	cmp    %ebx,%esi
80102439:	72 35                	jb     80102470 <freerange+0x60>
8010243b:	90                   	nop
8010243c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kmem.physpage_refcnt[V2P(p) / PGSIZE] = 0; // initialize all to 0
80102440:	8d 83 00 f0 ff 7f    	lea    0x7ffff000(%ebx),%eax
    kfree(p);
80102446:	83 ec 0c             	sub    $0xc,%esp
    kmem.physpage_refcnt[V2P(p) / PGSIZE] = 0; // initialize all to 0
80102449:	c1 e8 0c             	shr    $0xc,%eax
8010244c:	c7 04 85 5c 40 11 80 	movl   $0x0,-0x7feebfa4(,%eax,4)
80102453:	00 00 00 00 
    kfree(p);
80102457:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE) {
8010245d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102463:	50                   	push   %eax
80102464:	e8 b7 fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE) {
80102469:	83 c4 10             	add    $0x10,%esp
8010246c:	39 f3                	cmp    %esi,%ebx
8010246e:	76 d0                	jbe    80102440 <freerange+0x30>
}
80102470:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102473:	5b                   	pop    %ebx
80102474:	5e                   	pop    %esi
80102475:	5d                   	pop    %ebp
80102476:	c3                   	ret    
80102477:	89 f6                	mov    %esi,%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kinit1>:
{
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	56                   	push   %esi
80102484:	53                   	push   %ebx
80102485:	8b 75 0c             	mov    0xc(%ebp),%esi
80102488:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&kmem.lock, "kmem");
8010248b:	83 ec 08             	sub    $0x8,%esp
8010248e:	68 cc 79 10 80       	push   $0x801079cc
80102493:	68 20 40 11 80       	push   $0x80114020
80102498:	e8 b3 21 00 00       	call   80104650 <initlock>
  freerange(vstart, vend);
8010249d:	89 75 0c             	mov    %esi,0xc(%ebp)
801024a0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801024a3:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
801024a6:	c7 05 54 40 11 80 00 	movl   $0x0,0x80114054
801024ad:	00 00 00 
}
801024b0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024b3:	5b                   	pop    %ebx
801024b4:	5e                   	pop    %esi
801024b5:	5d                   	pop    %ebp
  freerange(vstart, vend);
801024b6:	e9 55 ff ff ff       	jmp    80102410 <freerange>
801024bb:	90                   	nop
801024bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801024c0 <kinit2>:
{
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	83 ec 10             	sub    $0x10,%esp
  freerange(vstart, vend);
801024c6:	ff 75 0c             	pushl  0xc(%ebp)
801024c9:	ff 75 08             	pushl  0x8(%ebp)
801024cc:	e8 3f ff ff ff       	call   80102410 <freerange>
  kmem.use_lock = 1;
801024d1:	c7 05 54 40 11 80 01 	movl   $0x1,0x80114054
801024d8:	00 00 00 
}
801024db:	83 c4 10             	add    $0x10,%esp
801024de:	c9                   	leave  
801024df:	c3                   	ret    

801024e0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024e0:	55                   	push   %ebp
801024e1:	89 e5                	mov    %esp,%ebp
801024e3:	83 ec 18             	sub    $0x18,%esp
  struct run *r;

  if(kmem.use_lock)
801024e6:	8b 15 54 40 11 80    	mov    0x80114054,%edx
801024ec:	85 d2                	test   %edx,%edx
801024ee:	75 50                	jne    80102540 <kalloc+0x60>
    acquire(&kmem.lock);

  r = kmem.freelist;
801024f0:	a1 58 40 11 80       	mov    0x80114058,%eax
  if(r) {
801024f5:	85 c0                	test   %eax,%eax
801024f7:	74 27                	je     80102520 <kalloc+0x40>
    kmem.freelist = r->next;
801024f9:	8b 08                	mov    (%eax),%ecx
    kmem.physpage_refcnt[V2P((char*)r) / PGSIZE] = 1;
    kmem.freepp_cnt--;
801024fb:	83 2d 5c c0 14 80 01 	subl   $0x1,0x8014c05c
    kmem.freelist = r->next;
80102502:	89 0d 58 40 11 80    	mov    %ecx,0x80114058
    kmem.physpage_refcnt[V2P((char*)r) / PGSIZE] = 1;
80102508:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
8010250e:	c1 e9 0c             	shr    $0xc,%ecx
80102511:	c7 04 8d 5c 40 11 80 	movl   $0x1,-0x7feebfa4(,%ecx,4)
80102518:	01 00 00 00 
  }

  if(kmem.use_lock)
8010251c:	85 d2                	test   %edx,%edx
8010251e:	75 08                	jne    80102528 <kalloc+0x48>
    release(&kmem.lock);


  return (char*)r;
}
80102520:	c9                   	leave  
80102521:	c3                   	ret    
80102522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102528:	83 ec 0c             	sub    $0xc,%esp
8010252b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010252e:	68 20 40 11 80       	push   $0x80114020
80102533:	e8 28 23 00 00       	call   80104860 <release>
  return (char*)r;
80102538:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
8010253b:	83 c4 10             	add    $0x10,%esp
}
8010253e:	c9                   	leave  
8010253f:	c3                   	ret    
    acquire(&kmem.lock);
80102540:	83 ec 0c             	sub    $0xc,%esp
80102543:	68 20 40 11 80       	push   $0x80114020
80102548:	e8 f3 21 00 00       	call   80104740 <acquire>
  r = kmem.freelist;
8010254d:	a1 58 40 11 80       	mov    0x80114058,%eax
  if(r) {
80102552:	83 c4 10             	add    $0x10,%esp
80102555:	8b 15 54 40 11 80    	mov    0x80114054,%edx
8010255b:	85 c0                	test   %eax,%eax
8010255d:	75 9a                	jne    801024f9 <kalloc+0x19>
8010255f:	eb bb                	jmp    8010251c <kalloc+0x3c>
80102561:	eb 0d                	jmp    80102570 <get_rc>
80102563:	90                   	nop
80102564:	90                   	nop
80102565:	90                   	nop
80102566:	90                   	nop
80102567:	90                   	nop
80102568:	90                   	nop
80102569:	90                   	nop
8010256a:	90                   	nop
8010256b:	90                   	nop
8010256c:	90                   	nop
8010256d:	90                   	nop
8010256e:	90                   	nop
8010256f:	90                   	nop

80102570 <get_rc>:



uint 
get_rc(uint pa) {
80102570:	55                   	push   %ebp
80102571:	89 e5                	mov    %esp,%ebp
80102573:	53                   	push   %ebx
80102574:	83 ec 14             	sub    $0x14,%esp
80102577:	8b 45 08             	mov    0x8(%ebp),%eax
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("get_rc");
8010257a:	3d a8 f0 14 00       	cmp    $0x14f0a8,%eax
8010257f:	72 63                	jb     801025e4 <get_rc+0x74>
80102581:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102586:	77 5c                	ja     801025e4 <get_rc+0x74>

  if(kmem.use_lock) acquire(&kmem.lock);
80102588:	8b 0d 54 40 11 80    	mov    0x80114054,%ecx
8010258e:	c1 e8 0c             	shr    $0xc,%eax
80102591:	89 c3                	mov    %eax,%ebx
80102593:	85 c9                	test   %ecx,%ecx
80102595:	75 11                	jne    801025a8 <get_rc+0x38>
    uint rc = kmem.physpage_refcnt[pa / PGSIZE];
80102597:	8b 04 85 5c 40 11 80 	mov    -0x7feebfa4(,%eax,4),%eax
  if(kmem.use_lock) release(&kmem.lock);

  return rc;
}
8010259e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801025a1:	c9                   	leave  
801025a2:	c3                   	ret    
801025a3:	90                   	nop
801025a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock) acquire(&kmem.lock);
801025a8:	83 ec 0c             	sub    $0xc,%esp
801025ab:	68 20 40 11 80       	push   $0x80114020
801025b0:	e8 8b 21 00 00       	call   80104740 <acquire>
  if(kmem.use_lock) release(&kmem.lock);
801025b5:	8b 15 54 40 11 80    	mov    0x80114054,%edx
801025bb:	83 c4 10             	add    $0x10,%esp
    uint rc = kmem.physpage_refcnt[pa / PGSIZE];
801025be:	8b 04 9d 5c 40 11 80 	mov    -0x7feebfa4(,%ebx,4),%eax
  if(kmem.use_lock) release(&kmem.lock);
801025c5:	85 d2                	test   %edx,%edx
801025c7:	74 d5                	je     8010259e <get_rc+0x2e>
801025c9:	83 ec 0c             	sub    $0xc,%esp
801025cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
801025cf:	68 20 40 11 80       	push   $0x80114020
801025d4:	e8 87 22 00 00       	call   80104860 <release>
  return rc;
801025d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  if(kmem.use_lock) release(&kmem.lock);
801025dc:	83 c4 10             	add    $0x10,%esp
}
801025df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801025e2:	c9                   	leave  
801025e3:	c3                   	ret    
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("get_rc");
801025e4:	83 ec 0c             	sub    $0xc,%esp
801025e7:	68 d1 79 10 80       	push   $0x801079d1
801025ec:	e8 9f dd ff ff       	call   80100390 <panic>
801025f1:	eb 0d                	jmp    80102600 <dec_rc>
801025f3:	90                   	nop
801025f4:	90                   	nop
801025f5:	90                   	nop
801025f6:	90                   	nop
801025f7:	90                   	nop
801025f8:	90                   	nop
801025f9:	90                   	nop
801025fa:	90                   	nop
801025fb:	90                   	nop
801025fc:	90                   	nop
801025fd:	90                   	nop
801025fe:	90                   	nop
801025ff:	90                   	nop

80102600 <dec_rc>:


void 
dec_rc(uint pa) {
80102600:	55                   	push   %ebp
80102601:	89 e5                	mov    %esp,%ebp
80102603:	53                   	push   %ebx
80102604:	83 ec 04             	sub    $0x4,%esp
80102607:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("dec_rc");
8010260a:	81 fb a8 f0 14 00    	cmp    $0x14f0a8,%ebx
80102610:	72 5a                	jb     8010266c <dec_rc+0x6c>
80102612:	81 fb ff ff ff 0d    	cmp    $0xdffffff,%ebx
80102618:	77 52                	ja     8010266c <dec_rc+0x6c>

  if(kmem.use_lock) acquire(&kmem.lock);
8010261a:	8b 15 54 40 11 80    	mov    0x80114054,%edx
80102620:	85 d2                	test   %edx,%edx
80102622:	75 14                	jne    80102638 <dec_rc+0x38>
    kmem.physpage_refcnt[pa / PGSIZE]--;
80102624:	c1 eb 0c             	shr    $0xc,%ebx
80102627:	83 2c 9d 5c 40 11 80 	subl   $0x1,-0x7feebfa4(,%ebx,4)
8010262e:	01 
  if(kmem.use_lock) release(&kmem.lock);
}
8010262f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102632:	c9                   	leave  
80102633:	c3                   	ret    
80102634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock) acquire(&kmem.lock);
80102638:	83 ec 0c             	sub    $0xc,%esp
    kmem.physpage_refcnt[pa / PGSIZE]--;
8010263b:	c1 eb 0c             	shr    $0xc,%ebx
  if(kmem.use_lock) acquire(&kmem.lock);
8010263e:	68 20 40 11 80       	push   $0x80114020
80102643:	e8 f8 20 00 00       	call   80104740 <acquire>
  if(kmem.use_lock) release(&kmem.lock);
80102648:	a1 54 40 11 80       	mov    0x80114054,%eax
    kmem.physpage_refcnt[pa / PGSIZE]--;
8010264d:	83 2c 9d 5c 40 11 80 	subl   $0x1,-0x7feebfa4(,%ebx,4)
80102654:	01 
  if(kmem.use_lock) release(&kmem.lock);
80102655:	83 c4 10             	add    $0x10,%esp
80102658:	85 c0                	test   %eax,%eax
8010265a:	74 d3                	je     8010262f <dec_rc+0x2f>
8010265c:	c7 45 08 20 40 11 80 	movl   $0x80114020,0x8(%ebp)
}
80102663:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102666:	c9                   	leave  
  if(kmem.use_lock) release(&kmem.lock);
80102667:	e9 f4 21 00 00       	jmp    80104860 <release>
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("dec_rc");
8010266c:	83 ec 0c             	sub    $0xc,%esp
8010266f:	68 d8 79 10 80       	push   $0x801079d8
80102674:	e8 17 dd ff ff       	call   80100390 <panic>
80102679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102680 <inc_rc>:


void 
inc_rc(uint pa) {
80102680:	55                   	push   %ebp
80102681:	89 e5                	mov    %esp,%ebp
80102683:	53                   	push   %ebx
80102684:	83 ec 04             	sub    $0x4,%esp
80102687:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("inc_rc");
8010268a:	81 fb a8 f0 14 00    	cmp    $0x14f0a8,%ebx
80102690:	72 5a                	jb     801026ec <inc_rc+0x6c>
80102692:	81 fb ff ff ff 0d    	cmp    $0xdffffff,%ebx
80102698:	77 52                	ja     801026ec <inc_rc+0x6c>

  if(kmem.use_lock) acquire(&kmem.lock);
8010269a:	8b 15 54 40 11 80    	mov    0x80114054,%edx
801026a0:	85 d2                	test   %edx,%edx
801026a2:	75 14                	jne    801026b8 <inc_rc+0x38>
    kmem.physpage_refcnt[pa / PGSIZE]++;
801026a4:	c1 eb 0c             	shr    $0xc,%ebx
801026a7:	83 04 9d 5c 40 11 80 	addl   $0x1,-0x7feebfa4(,%ebx,4)
801026ae:	01 
  if(kmem.use_lock) release(&kmem.lock);
}
801026af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026b2:	c9                   	leave  
801026b3:	c3                   	ret    
801026b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(kmem.use_lock) acquire(&kmem.lock);
801026b8:	83 ec 0c             	sub    $0xc,%esp
    kmem.physpage_refcnt[pa / PGSIZE]++;
801026bb:	c1 eb 0c             	shr    $0xc,%ebx
  if(kmem.use_lock) acquire(&kmem.lock);
801026be:	68 20 40 11 80       	push   $0x80114020
801026c3:	e8 78 20 00 00       	call   80104740 <acquire>
  if(kmem.use_lock) release(&kmem.lock);
801026c8:	a1 54 40 11 80       	mov    0x80114054,%eax
    kmem.physpage_refcnt[pa / PGSIZE]++;
801026cd:	83 04 9d 5c 40 11 80 	addl   $0x1,-0x7feebfa4(,%ebx,4)
801026d4:	01 
  if(kmem.use_lock) release(&kmem.lock);
801026d5:	83 c4 10             	add    $0x10,%esp
801026d8:	85 c0                	test   %eax,%eax
801026da:	74 d3                	je     801026af <inc_rc+0x2f>
801026dc:	c7 45 08 20 40 11 80 	movl   $0x80114020,0x8(%ebp)
}
801026e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026e6:	c9                   	leave  
  if(kmem.use_lock) release(&kmem.lock);
801026e7:	e9 74 21 00 00       	jmp    80104860 <release>
  if(pa < (uint)V2P(end) || pa >= PHYSTOP) panic("inc_rc");
801026ec:	83 ec 0c             	sub    $0xc,%esp
801026ef:	68 df 79 10 80       	push   $0x801079df
801026f4:	e8 97 dc ff ff       	call   80100390 <panic>
801026f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102700 <n_free_pp>:



uint 
n_free_pp(void) {
  if(kmem.use_lock) acquire(&kmem.lock);
80102700:	8b 0d 54 40 11 80    	mov    0x80114054,%ecx
    uint fc = kmem.freepp_cnt;
80102706:	a1 5c c0 14 80       	mov    0x8014c05c,%eax
  if(kmem.use_lock) acquire(&kmem.lock);
8010270b:	85 c9                	test   %ecx,%ecx
8010270d:	75 09                	jne    80102718 <n_free_pp+0x18>
  if(kmem.use_lock) release(&kmem.lock);
  return fc;
8010270f:	f3 c3                	repz ret 
80102711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
n_free_pp(void) {
80102718:	55                   	push   %ebp
80102719:	89 e5                	mov    %esp,%ebp
8010271b:	83 ec 24             	sub    $0x24,%esp
  if(kmem.use_lock) acquire(&kmem.lock);
8010271e:	68 20 40 11 80       	push   $0x80114020
80102723:	e8 18 20 00 00       	call   80104740 <acquire>
  if(kmem.use_lock) release(&kmem.lock);
80102728:	8b 15 54 40 11 80    	mov    0x80114054,%edx
8010272e:	83 c4 10             	add    $0x10,%esp
    uint fc = kmem.freepp_cnt;
80102731:	a1 5c c0 14 80       	mov    0x8014c05c,%eax
  if(kmem.use_lock) release(&kmem.lock);
80102736:	85 d2                	test   %edx,%edx
80102738:	74 16                	je     80102750 <n_free_pp+0x50>
8010273a:	83 ec 0c             	sub    $0xc,%esp
8010273d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102740:	68 20 40 11 80       	push   $0x80114020
80102745:	e8 16 21 00 00       	call   80104860 <release>
8010274a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010274d:	83 c4 10             	add    $0x10,%esp
80102750:	c9                   	leave  
80102751:	c3                   	ret    
80102752:	66 90                	xchg   %ax,%ax
80102754:	66 90                	xchg   %ax,%ax
80102756:	66 90                	xchg   %ax,%ax
80102758:	66 90                	xchg   %ax,%ax
8010275a:	66 90                	xchg   %ax,%ax
8010275c:	66 90                	xchg   %ax,%ax
8010275e:	66 90                	xchg   %ax,%ax

80102760 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102760:	ba 64 00 00 00       	mov    $0x64,%edx
80102765:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102766:	a8 01                	test   $0x1,%al
80102768:	0f 84 c2 00 00 00    	je     80102830 <kbdgetc+0xd0>
8010276e:	ba 60 00 00 00       	mov    $0x60,%edx
80102773:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102774:	0f b6 d0             	movzbl %al,%edx
80102777:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx

  if(data == 0xE0){
8010277d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102783:	0f 84 7f 00 00 00    	je     80102808 <kbdgetc+0xa8>
{
80102789:	55                   	push   %ebp
8010278a:	89 e5                	mov    %esp,%ebp
8010278c:	53                   	push   %ebx
8010278d:	89 cb                	mov    %ecx,%ebx
8010278f:	83 e3 40             	and    $0x40,%ebx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102792:	84 c0                	test   %al,%al
80102794:	78 4a                	js     801027e0 <kbdgetc+0x80>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102796:	85 db                	test   %ebx,%ebx
80102798:	74 09                	je     801027a3 <kbdgetc+0x43>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010279a:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
8010279d:	83 e1 bf             	and    $0xffffffbf,%ecx
    data |= 0x80;
801027a0:	0f b6 d0             	movzbl %al,%edx
  }

  shift |= shiftcode[data];
801027a3:	0f b6 82 20 7b 10 80 	movzbl -0x7fef84e0(%edx),%eax
801027aa:	09 c1                	or     %eax,%ecx
  shift ^= togglecode[data];
801027ac:	0f b6 82 20 7a 10 80 	movzbl -0x7fef85e0(%edx),%eax
801027b3:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801027b5:	89 c8                	mov    %ecx,%eax
  shift ^= togglecode[data];
801027b7:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801027bd:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801027c0:	83 e1 08             	and    $0x8,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801027c3:	8b 04 85 00 7a 10 80 	mov    -0x7fef8600(,%eax,4),%eax
801027ca:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801027ce:	74 31                	je     80102801 <kbdgetc+0xa1>
    if('a' <= c && c <= 'z')
801027d0:	8d 50 9f             	lea    -0x61(%eax),%edx
801027d3:	83 fa 19             	cmp    $0x19,%edx
801027d6:	77 40                	ja     80102818 <kbdgetc+0xb8>
      c += 'A' - 'a';
801027d8:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801027db:	5b                   	pop    %ebx
801027dc:	5d                   	pop    %ebp
801027dd:	c3                   	ret    
801027de:	66 90                	xchg   %ax,%ax
    data = (shift & E0ESC ? data : data & 0x7F);
801027e0:	83 e0 7f             	and    $0x7f,%eax
801027e3:	85 db                	test   %ebx,%ebx
801027e5:	0f 44 d0             	cmove  %eax,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801027e8:	0f b6 82 20 7b 10 80 	movzbl -0x7fef84e0(%edx),%eax
801027ef:	83 c8 40             	or     $0x40,%eax
801027f2:	0f b6 c0             	movzbl %al,%eax
801027f5:	f7 d0                	not    %eax
801027f7:	21 c1                	and    %eax,%ecx
    return 0;
801027f9:	31 c0                	xor    %eax,%eax
    shift &= ~(shiftcode[data] | E0ESC);
801027fb:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
}
80102801:	5b                   	pop    %ebx
80102802:	5d                   	pop    %ebp
80102803:	c3                   	ret    
80102804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
80102808:	83 c9 40             	or     $0x40,%ecx
    return 0;
8010280b:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
8010280d:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
    return 0;
80102813:	c3                   	ret    
80102814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    else if('A' <= c && c <= 'Z')
80102818:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010281b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010281e:	5b                   	pop    %ebx
      c += 'a' - 'A';
8010281f:	83 f9 1a             	cmp    $0x1a,%ecx
80102822:	0f 42 c2             	cmovb  %edx,%eax
}
80102825:	5d                   	pop    %ebp
80102826:	c3                   	ret    
80102827:	89 f6                	mov    %esi,%esi
80102829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80102830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102835:	c3                   	ret    
80102836:	8d 76 00             	lea    0x0(%esi),%esi
80102839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102840 <kbdintr>:

void
kbdintr(void)
{
80102840:	55                   	push   %ebp
80102841:	89 e5                	mov    %esp,%ebp
80102843:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102846:	68 60 27 10 80       	push   $0x80102760
8010284b:	e8 c0 df ff ff       	call   80100810 <consoleintr>
}
80102850:	83 c4 10             	add    $0x10,%esp
80102853:	c9                   	leave  
80102854:	c3                   	ret    
80102855:	66 90                	xchg   %ax,%ax
80102857:	66 90                	xchg   %ax,%ax
80102859:	66 90                	xchg   %ax,%ax
8010285b:	66 90                	xchg   %ax,%ax
8010285d:	66 90                	xchg   %ax,%ax
8010285f:	90                   	nop

80102860 <shutdown>:
#include "types.h"
#include "x86.h"

void
shutdown(void)
{
80102860:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102861:	31 c0                	xor    %eax,%eax
80102863:	ba 01 05 00 00       	mov    $0x501,%edx
80102868:	89 e5                	mov    %esp,%ebp
8010286a:	ee                   	out    %al,(%dx)
  /*
     This only works in QEMU and assumes QEMU was run 
     with -device isa-debug-exit
   */
  outb(0x501, 0x0);
}
8010286b:	5d                   	pop    %ebp
8010286c:	c3                   	ret    
8010286d:	66 90                	xchg   %ax,%ax
8010286f:	90                   	nop

80102870 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102870:	a1 60 c0 14 80       	mov    0x8014c060,%eax
{
80102875:	55                   	push   %ebp
80102876:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102878:	85 c0                	test   %eax,%eax
8010287a:	0f 84 c8 00 00 00    	je     80102948 <lapicinit+0xd8>
  lapic[index] = value;
80102880:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102887:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010288a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010288d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102894:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102897:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010289a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801028a1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801028a4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801028ae:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801028b1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801028bb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801028be:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801028c8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801028cb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801028ce:	8b 50 30             	mov    0x30(%eax),%edx
801028d1:	c1 ea 10             	shr    $0x10,%edx
801028d4:	80 fa 03             	cmp    $0x3,%dl
801028d7:	77 77                	ja     80102950 <lapicinit+0xe0>
  lapic[index] = value;
801028d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801028e0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028e3:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801028ed:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028f0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801028fa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028fd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102900:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102907:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010290a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010290d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102914:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102917:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010291a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102921:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102924:	8b 50 20             	mov    0x20(%eax),%edx
80102927:	89 f6                	mov    %esi,%esi
80102929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102930:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102936:	80 e6 10             	and    $0x10,%dh
80102939:	75 f5                	jne    80102930 <lapicinit+0xc0>
  lapic[index] = value;
8010293b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102942:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102945:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102948:	5d                   	pop    %ebp
80102949:	c3                   	ret    
8010294a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102950:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102957:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010295a:	8b 50 20             	mov    0x20(%eax),%edx
8010295d:	e9 77 ff ff ff       	jmp    801028d9 <lapicinit+0x69>
80102962:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102970 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102970:	8b 15 60 c0 14 80    	mov    0x8014c060,%edx
{
80102976:	55                   	push   %ebp
80102977:	31 c0                	xor    %eax,%eax
80102979:	89 e5                	mov    %esp,%ebp
  if (!lapic)
8010297b:	85 d2                	test   %edx,%edx
8010297d:	74 06                	je     80102985 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
8010297f:	8b 42 20             	mov    0x20(%edx),%eax
80102982:	c1 e8 18             	shr    $0x18,%eax
}
80102985:	5d                   	pop    %ebp
80102986:	c3                   	ret    
80102987:	89 f6                	mov    %esi,%esi
80102989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102990 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102990:	a1 60 c0 14 80       	mov    0x8014c060,%eax
{
80102995:	55                   	push   %ebp
80102996:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102998:	85 c0                	test   %eax,%eax
8010299a:	74 0d                	je     801029a9 <lapiceoi+0x19>
  lapic[index] = value;
8010299c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801029a3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029a6:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
801029a9:	5d                   	pop    %ebp
801029aa:	c3                   	ret    
801029ab:	90                   	nop
801029ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801029b0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801029b0:	55                   	push   %ebp
801029b1:	89 e5                	mov    %esp,%ebp
}
801029b3:	5d                   	pop    %ebp
801029b4:	c3                   	ret    
801029b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801029b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801029c0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801029c0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029c1:	b8 0f 00 00 00       	mov    $0xf,%eax
801029c6:	ba 70 00 00 00       	mov    $0x70,%edx
801029cb:	89 e5                	mov    %esp,%ebp
801029cd:	53                   	push   %ebx
801029ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801029d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801029d4:	ee                   	out    %al,(%dx)
801029d5:	b8 0a 00 00 00       	mov    $0xa,%eax
801029da:	ba 71 00 00 00       	mov    $0x71,%edx
801029df:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801029e0:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
801029e2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801029e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801029eb:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801029ed:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[1] = addr >> 4;
801029f0:	c1 e8 04             	shr    $0x4,%eax
  lapicw(ICRHI, apicid<<24);
801029f3:	89 da                	mov    %ebx,%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
801029f5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801029f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801029fe:	a1 60 c0 14 80       	mov    0x8014c060,%eax
80102a03:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a09:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a0c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102a13:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a16:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a19:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102a20:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a23:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a26:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a2c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a2f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a35:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a38:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a3e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a41:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a47:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
80102a4a:	5b                   	pop    %ebx
80102a4b:	5d                   	pop    %ebp
80102a4c:	c3                   	ret    
80102a4d:	8d 76 00             	lea    0x0(%esi),%esi

80102a50 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102a50:	55                   	push   %ebp
80102a51:	b8 0b 00 00 00       	mov    $0xb,%eax
80102a56:	ba 70 00 00 00       	mov    $0x70,%edx
80102a5b:	89 e5                	mov    %esp,%ebp
80102a5d:	57                   	push   %edi
80102a5e:	56                   	push   %esi
80102a5f:	53                   	push   %ebx
80102a60:	83 ec 4c             	sub    $0x4c,%esp
80102a63:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a64:	ba 71 00 00 00       	mov    $0x71,%edx
80102a69:	ec                   	in     (%dx),%al
80102a6a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a6d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102a72:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102a75:	8d 76 00             	lea    0x0(%esi),%esi
80102a78:	31 c0                	xor    %eax,%eax
80102a7a:	89 da                	mov    %ebx,%edx
80102a7c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a7d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a82:	89 ca                	mov    %ecx,%edx
80102a84:	ec                   	in     (%dx),%al
80102a85:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a88:	89 da                	mov    %ebx,%edx
80102a8a:	b8 02 00 00 00       	mov    $0x2,%eax
80102a8f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a90:	89 ca                	mov    %ecx,%edx
80102a92:	ec                   	in     (%dx),%al
80102a93:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a96:	89 da                	mov    %ebx,%edx
80102a98:	b8 04 00 00 00       	mov    $0x4,%eax
80102a9d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a9e:	89 ca                	mov    %ecx,%edx
80102aa0:	ec                   	in     (%dx),%al
80102aa1:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aa4:	89 da                	mov    %ebx,%edx
80102aa6:	b8 07 00 00 00       	mov    $0x7,%eax
80102aab:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102aac:	89 ca                	mov    %ecx,%edx
80102aae:	ec                   	in     (%dx),%al
80102aaf:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ab2:	89 da                	mov    %ebx,%edx
80102ab4:	b8 08 00 00 00       	mov    $0x8,%eax
80102ab9:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102aba:	89 ca                	mov    %ecx,%edx
80102abc:	ec                   	in     (%dx),%al
80102abd:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102abf:	89 da                	mov    %ebx,%edx
80102ac1:	b8 09 00 00 00       	mov    $0x9,%eax
80102ac6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ac7:	89 ca                	mov    %ecx,%edx
80102ac9:	ec                   	in     (%dx),%al
80102aca:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102acc:	89 da                	mov    %ebx,%edx
80102ace:	b8 0a 00 00 00       	mov    $0xa,%eax
80102ad3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ad4:	89 ca                	mov    %ecx,%edx
80102ad6:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102ad7:	84 c0                	test   %al,%al
80102ad9:	78 9d                	js     80102a78 <cmostime+0x28>
  return inb(CMOS_RETURN);
80102adb:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102adf:	89 fa                	mov    %edi,%edx
80102ae1:	0f b6 fa             	movzbl %dl,%edi
80102ae4:	89 f2                	mov    %esi,%edx
80102ae6:	0f b6 f2             	movzbl %dl,%esi
80102ae9:	89 7d c8             	mov    %edi,-0x38(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aec:	89 da                	mov    %ebx,%edx
80102aee:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102af1:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102af4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102af8:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102afb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102aff:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102b02:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102b06:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102b09:	31 c0                	xor    %eax,%eax
80102b0b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b0c:	89 ca                	mov    %ecx,%edx
80102b0e:	ec                   	in     (%dx),%al
80102b0f:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b12:	89 da                	mov    %ebx,%edx
80102b14:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102b17:	b8 02 00 00 00       	mov    $0x2,%eax
80102b1c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b1d:	89 ca                	mov    %ecx,%edx
80102b1f:	ec                   	in     (%dx),%al
80102b20:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b23:	89 da                	mov    %ebx,%edx
80102b25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102b28:	b8 04 00 00 00       	mov    $0x4,%eax
80102b2d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b2e:	89 ca                	mov    %ecx,%edx
80102b30:	ec                   	in     (%dx),%al
80102b31:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b34:	89 da                	mov    %ebx,%edx
80102b36:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102b39:	b8 07 00 00 00       	mov    $0x7,%eax
80102b3e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b3f:	89 ca                	mov    %ecx,%edx
80102b41:	ec                   	in     (%dx),%al
80102b42:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b45:	89 da                	mov    %ebx,%edx
80102b47:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102b4a:	b8 08 00 00 00       	mov    $0x8,%eax
80102b4f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b50:	89 ca                	mov    %ecx,%edx
80102b52:	ec                   	in     (%dx),%al
80102b53:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b56:	89 da                	mov    %ebx,%edx
80102b58:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102b5b:	b8 09 00 00 00       	mov    $0x9,%eax
80102b60:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b61:	89 ca                	mov    %ecx,%edx
80102b63:	ec                   	in     (%dx),%al
80102b64:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b67:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
80102b6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b6d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102b70:	6a 18                	push   $0x18
80102b72:	50                   	push   %eax
80102b73:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102b76:	50                   	push   %eax
80102b77:	e8 94 1d 00 00       	call   80104910 <memcmp>
80102b7c:	83 c4 10             	add    $0x10,%esp
80102b7f:	85 c0                	test   %eax,%eax
80102b81:	0f 85 f1 fe ff ff    	jne    80102a78 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102b87:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102b8b:	75 78                	jne    80102c05 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102b8d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b90:	89 c2                	mov    %eax,%edx
80102b92:	83 e0 0f             	and    $0xf,%eax
80102b95:	c1 ea 04             	shr    $0x4,%edx
80102b98:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b9b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b9e:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102ba1:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102ba4:	89 c2                	mov    %eax,%edx
80102ba6:	83 e0 0f             	and    $0xf,%eax
80102ba9:	c1 ea 04             	shr    $0x4,%edx
80102bac:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102baf:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bb2:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102bb5:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102bb8:	89 c2                	mov    %eax,%edx
80102bba:	83 e0 0f             	and    $0xf,%eax
80102bbd:	c1 ea 04             	shr    $0x4,%edx
80102bc0:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bc3:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bc6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102bc9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102bcc:	89 c2                	mov    %eax,%edx
80102bce:	83 e0 0f             	and    $0xf,%eax
80102bd1:	c1 ea 04             	shr    $0x4,%edx
80102bd4:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bd7:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bda:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102bdd:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102be0:	89 c2                	mov    %eax,%edx
80102be2:	83 e0 0f             	and    $0xf,%eax
80102be5:	c1 ea 04             	shr    $0x4,%edx
80102be8:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102beb:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bee:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102bf1:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102bf4:	89 c2                	mov    %eax,%edx
80102bf6:	83 e0 0f             	and    $0xf,%eax
80102bf9:	c1 ea 04             	shr    $0x4,%edx
80102bfc:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102c02:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102c05:	8b 75 08             	mov    0x8(%ebp),%esi
80102c08:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102c0b:	89 06                	mov    %eax,(%esi)
80102c0d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102c10:	89 46 04             	mov    %eax,0x4(%esi)
80102c13:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102c16:	89 46 08             	mov    %eax,0x8(%esi)
80102c19:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102c1c:	89 46 0c             	mov    %eax,0xc(%esi)
80102c1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102c22:	89 46 10             	mov    %eax,0x10(%esi)
80102c25:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102c28:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102c2b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102c32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c35:	5b                   	pop    %ebx
80102c36:	5e                   	pop    %esi
80102c37:	5f                   	pop    %edi
80102c38:	5d                   	pop    %ebp
80102c39:	c3                   	ret    
80102c3a:	66 90                	xchg   %ax,%ax
80102c3c:	66 90                	xchg   %ax,%ax
80102c3e:	66 90                	xchg   %ax,%ax

80102c40 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c40:	8b 0d c8 c0 14 80    	mov    0x8014c0c8,%ecx
80102c46:	85 c9                	test   %ecx,%ecx
80102c48:	0f 8e 8a 00 00 00    	jle    80102cd8 <install_trans+0x98>
{
80102c4e:	55                   	push   %ebp
80102c4f:	89 e5                	mov    %esp,%ebp
80102c51:	57                   	push   %edi
80102c52:	56                   	push   %esi
80102c53:	53                   	push   %ebx
  for (tail = 0; tail < log.lh.n; tail++) {
80102c54:	31 db                	xor    %ebx,%ebx
{
80102c56:	83 ec 0c             	sub    $0xc,%esp
80102c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102c60:	a1 b4 c0 14 80       	mov    0x8014c0b4,%eax
80102c65:	83 ec 08             	sub    $0x8,%esp
80102c68:	01 d8                	add    %ebx,%eax
80102c6a:	83 c0 01             	add    $0x1,%eax
80102c6d:	50                   	push   %eax
80102c6e:	ff 35 c4 c0 14 80    	pushl  0x8014c0c4
80102c74:	e8 57 d4 ff ff       	call   801000d0 <bread>
80102c79:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c7b:	58                   	pop    %eax
80102c7c:	5a                   	pop    %edx
80102c7d:	ff 34 9d cc c0 14 80 	pushl  -0x7feb3f34(,%ebx,4)
80102c84:	ff 35 c4 c0 14 80    	pushl  0x8014c0c4
  for (tail = 0; tail < log.lh.n; tail++) {
80102c8a:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c8d:	e8 3e d4 ff ff       	call   801000d0 <bread>
80102c92:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c94:	8d 47 5c             	lea    0x5c(%edi),%eax
80102c97:	83 c4 0c             	add    $0xc,%esp
80102c9a:	68 00 02 00 00       	push   $0x200
80102c9f:	50                   	push   %eax
80102ca0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ca3:	50                   	push   %eax
80102ca4:	e8 c7 1c 00 00       	call   80104970 <memmove>
    bwrite(dbuf);  // write dst to disk
80102ca9:	89 34 24             	mov    %esi,(%esp)
80102cac:	e8 ef d4 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102cb1:	89 3c 24             	mov    %edi,(%esp)
80102cb4:	e8 27 d5 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102cb9:	89 34 24             	mov    %esi,(%esp)
80102cbc:	e8 1f d5 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102cc1:	83 c4 10             	add    $0x10,%esp
80102cc4:	39 1d c8 c0 14 80    	cmp    %ebx,0x8014c0c8
80102cca:	7f 94                	jg     80102c60 <install_trans+0x20>
  }
}
80102ccc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ccf:	5b                   	pop    %ebx
80102cd0:	5e                   	pop    %esi
80102cd1:	5f                   	pop    %edi
80102cd2:	5d                   	pop    %ebp
80102cd3:	c3                   	ret    
80102cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cd8:	f3 c3                	repz ret 
80102cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ce0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102ce0:	55                   	push   %ebp
80102ce1:	89 e5                	mov    %esp,%ebp
80102ce3:	56                   	push   %esi
80102ce4:	53                   	push   %ebx
  struct buf *buf = bread(log.dev, log.start);
80102ce5:	83 ec 08             	sub    $0x8,%esp
80102ce8:	ff 35 b4 c0 14 80    	pushl  0x8014c0b4
80102cee:	ff 35 c4 c0 14 80    	pushl  0x8014c0c4
80102cf4:	e8 d7 d3 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102cf9:	8b 1d c8 c0 14 80    	mov    0x8014c0c8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102cff:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102d02:	89 c6                	mov    %eax,%esi
  for (i = 0; i < log.lh.n; i++) {
80102d04:	85 db                	test   %ebx,%ebx
  hb->n = log.lh.n;
80102d06:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102d09:	7e 16                	jle    80102d21 <write_head+0x41>
80102d0b:	c1 e3 02             	shl    $0x2,%ebx
80102d0e:	31 d2                	xor    %edx,%edx
    hb->block[i] = log.lh.block[i];
80102d10:	8b 8a cc c0 14 80    	mov    -0x7feb3f34(%edx),%ecx
80102d16:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102d1a:	83 c2 04             	add    $0x4,%edx
  for (i = 0; i < log.lh.n; i++) {
80102d1d:	39 da                	cmp    %ebx,%edx
80102d1f:	75 ef                	jne    80102d10 <write_head+0x30>
  }
  bwrite(buf);
80102d21:	83 ec 0c             	sub    $0xc,%esp
80102d24:	56                   	push   %esi
80102d25:	e8 76 d4 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102d2a:	89 34 24             	mov    %esi,(%esp)
80102d2d:	e8 ae d4 ff ff       	call   801001e0 <brelse>
}
80102d32:	83 c4 10             	add    $0x10,%esp
80102d35:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102d38:	5b                   	pop    %ebx
80102d39:	5e                   	pop    %esi
80102d3a:	5d                   	pop    %ebp
80102d3b:	c3                   	ret    
80102d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102d40 <initlog>:
{
80102d40:	55                   	push   %ebp
80102d41:	89 e5                	mov    %esp,%ebp
80102d43:	53                   	push   %ebx
80102d44:	83 ec 2c             	sub    $0x2c,%esp
80102d47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102d4a:	68 20 7c 10 80       	push   $0x80107c20
80102d4f:	68 80 c0 14 80       	push   $0x8014c080
80102d54:	e8 f7 18 00 00       	call   80104650 <initlock>
  readsb(dev, &sb);
80102d59:	58                   	pop    %eax
80102d5a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102d5d:	5a                   	pop    %edx
80102d5e:	50                   	push   %eax
80102d5f:	53                   	push   %ebx
80102d60:	e8 6b e6 ff ff       	call   801013d0 <readsb>
  log.size = sb.nlog;
80102d65:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102d68:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102d6b:	59                   	pop    %ecx
  log.dev = dev;
80102d6c:	89 1d c4 c0 14 80    	mov    %ebx,0x8014c0c4
  log.size = sb.nlog;
80102d72:	89 15 b8 c0 14 80    	mov    %edx,0x8014c0b8
  log.start = sb.logstart;
80102d78:	a3 b4 c0 14 80       	mov    %eax,0x8014c0b4
  struct buf *buf = bread(log.dev, log.start);
80102d7d:	5a                   	pop    %edx
80102d7e:	50                   	push   %eax
80102d7f:	53                   	push   %ebx
80102d80:	e8 4b d3 ff ff       	call   801000d0 <bread>
  log.lh.n = lh->n;
80102d85:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102d88:	83 c4 10             	add    $0x10,%esp
80102d8b:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102d8d:	89 1d c8 c0 14 80    	mov    %ebx,0x8014c0c8
  for (i = 0; i < log.lh.n; i++) {
80102d93:	7e 1c                	jle    80102db1 <initlog+0x71>
80102d95:	c1 e3 02             	shl    $0x2,%ebx
80102d98:	31 d2                	xor    %edx,%edx
80102d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    log.lh.block[i] = lh->block[i];
80102da0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102da4:	83 c2 04             	add    $0x4,%edx
80102da7:	89 8a c8 c0 14 80    	mov    %ecx,-0x7feb3f38(%edx)
  for (i = 0; i < log.lh.n; i++) {
80102dad:	39 d3                	cmp    %edx,%ebx
80102daf:	75 ef                	jne    80102da0 <initlog+0x60>
  brelse(buf);
80102db1:	83 ec 0c             	sub    $0xc,%esp
80102db4:	50                   	push   %eax
80102db5:	e8 26 d4 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102dba:	e8 81 fe ff ff       	call   80102c40 <install_trans>
  log.lh.n = 0;
80102dbf:	c7 05 c8 c0 14 80 00 	movl   $0x0,0x8014c0c8
80102dc6:	00 00 00 
  write_head(); // clear the log
80102dc9:	e8 12 ff ff ff       	call   80102ce0 <write_head>
}
80102dce:	83 c4 10             	add    $0x10,%esp
80102dd1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dd4:	c9                   	leave  
80102dd5:	c3                   	ret    
80102dd6:	8d 76 00             	lea    0x0(%esi),%esi
80102dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102de0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102de0:	55                   	push   %ebp
80102de1:	89 e5                	mov    %esp,%ebp
80102de3:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102de6:	68 80 c0 14 80       	push   $0x8014c080
80102deb:	e8 50 19 00 00       	call   80104740 <acquire>
80102df0:	83 c4 10             	add    $0x10,%esp
80102df3:	eb 18                	jmp    80102e0d <begin_op+0x2d>
80102df5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102df8:	83 ec 08             	sub    $0x8,%esp
80102dfb:	68 80 c0 14 80       	push   $0x8014c080
80102e00:	68 80 c0 14 80       	push   $0x8014c080
80102e05:	e8 16 12 00 00       	call   80104020 <sleep>
80102e0a:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102e0d:	a1 c0 c0 14 80       	mov    0x8014c0c0,%eax
80102e12:	85 c0                	test   %eax,%eax
80102e14:	75 e2                	jne    80102df8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102e16:	a1 bc c0 14 80       	mov    0x8014c0bc,%eax
80102e1b:	8b 15 c8 c0 14 80    	mov    0x8014c0c8,%edx
80102e21:	83 c0 01             	add    $0x1,%eax
80102e24:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102e27:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102e2a:	83 fa 1e             	cmp    $0x1e,%edx
80102e2d:	7f c9                	jg     80102df8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102e2f:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102e32:	a3 bc c0 14 80       	mov    %eax,0x8014c0bc
      release(&log.lock);
80102e37:	68 80 c0 14 80       	push   $0x8014c080
80102e3c:	e8 1f 1a 00 00       	call   80104860 <release>
      break;
    }
  }
}
80102e41:	83 c4 10             	add    $0x10,%esp
80102e44:	c9                   	leave  
80102e45:	c3                   	ret    
80102e46:	8d 76 00             	lea    0x0(%esi),%esi
80102e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102e50 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	57                   	push   %edi
80102e54:	56                   	push   %esi
80102e55:	53                   	push   %ebx
80102e56:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102e59:	68 80 c0 14 80       	push   $0x8014c080
80102e5e:	e8 dd 18 00 00       	call   80104740 <acquire>
  log.outstanding -= 1;
80102e63:	a1 bc c0 14 80       	mov    0x8014c0bc,%eax
  if(log.committing)
80102e68:	8b 35 c0 c0 14 80    	mov    0x8014c0c0,%esi
80102e6e:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102e71:	8d 58 ff             	lea    -0x1(%eax),%ebx
  if(log.committing)
80102e74:	85 f6                	test   %esi,%esi
  log.outstanding -= 1;
80102e76:	89 1d bc c0 14 80    	mov    %ebx,0x8014c0bc
  if(log.committing)
80102e7c:	0f 85 1a 01 00 00    	jne    80102f9c <end_op+0x14c>
    panic("log.committing");
  if(log.outstanding == 0){
80102e82:	85 db                	test   %ebx,%ebx
80102e84:	0f 85 ee 00 00 00    	jne    80102f78 <end_op+0x128>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102e8a:	83 ec 0c             	sub    $0xc,%esp
    log.committing = 1;
80102e8d:	c7 05 c0 c0 14 80 01 	movl   $0x1,0x8014c0c0
80102e94:	00 00 00 
  release(&log.lock);
80102e97:	68 80 c0 14 80       	push   $0x8014c080
80102e9c:	e8 bf 19 00 00       	call   80104860 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102ea1:	8b 0d c8 c0 14 80    	mov    0x8014c0c8,%ecx
80102ea7:	83 c4 10             	add    $0x10,%esp
80102eaa:	85 c9                	test   %ecx,%ecx
80102eac:	0f 8e 85 00 00 00    	jle    80102f37 <end_op+0xe7>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102eb2:	a1 b4 c0 14 80       	mov    0x8014c0b4,%eax
80102eb7:	83 ec 08             	sub    $0x8,%esp
80102eba:	01 d8                	add    %ebx,%eax
80102ebc:	83 c0 01             	add    $0x1,%eax
80102ebf:	50                   	push   %eax
80102ec0:	ff 35 c4 c0 14 80    	pushl  0x8014c0c4
80102ec6:	e8 05 d2 ff ff       	call   801000d0 <bread>
80102ecb:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102ecd:	58                   	pop    %eax
80102ece:	5a                   	pop    %edx
80102ecf:	ff 34 9d cc c0 14 80 	pushl  -0x7feb3f34(,%ebx,4)
80102ed6:	ff 35 c4 c0 14 80    	pushl  0x8014c0c4
  for (tail = 0; tail < log.lh.n; tail++) {
80102edc:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102edf:	e8 ec d1 ff ff       	call   801000d0 <bread>
80102ee4:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102ee6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102ee9:	83 c4 0c             	add    $0xc,%esp
80102eec:	68 00 02 00 00       	push   $0x200
80102ef1:	50                   	push   %eax
80102ef2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ef5:	50                   	push   %eax
80102ef6:	e8 75 1a 00 00       	call   80104970 <memmove>
    bwrite(to);  // write the log
80102efb:	89 34 24             	mov    %esi,(%esp)
80102efe:	e8 9d d2 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102f03:	89 3c 24             	mov    %edi,(%esp)
80102f06:	e8 d5 d2 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102f0b:	89 34 24             	mov    %esi,(%esp)
80102f0e:	e8 cd d2 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102f13:	83 c4 10             	add    $0x10,%esp
80102f16:	3b 1d c8 c0 14 80    	cmp    0x8014c0c8,%ebx
80102f1c:	7c 94                	jl     80102eb2 <end_op+0x62>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102f1e:	e8 bd fd ff ff       	call   80102ce0 <write_head>
    install_trans(); // Now install writes to home locations
80102f23:	e8 18 fd ff ff       	call   80102c40 <install_trans>
    log.lh.n = 0;
80102f28:	c7 05 c8 c0 14 80 00 	movl   $0x0,0x8014c0c8
80102f2f:	00 00 00 
    write_head();    // Erase the transaction from the log
80102f32:	e8 a9 fd ff ff       	call   80102ce0 <write_head>
    acquire(&log.lock);
80102f37:	83 ec 0c             	sub    $0xc,%esp
80102f3a:	68 80 c0 14 80       	push   $0x8014c080
80102f3f:	e8 fc 17 00 00       	call   80104740 <acquire>
    wakeup(&log);
80102f44:	c7 04 24 80 c0 14 80 	movl   $0x8014c080,(%esp)
    log.committing = 0;
80102f4b:	c7 05 c0 c0 14 80 00 	movl   $0x0,0x8014c0c0
80102f52:	00 00 00 
    wakeup(&log);
80102f55:	e8 86 12 00 00       	call   801041e0 <wakeup>
    release(&log.lock);
80102f5a:	c7 04 24 80 c0 14 80 	movl   $0x8014c080,(%esp)
80102f61:	e8 fa 18 00 00       	call   80104860 <release>
80102f66:	83 c4 10             	add    $0x10,%esp
}
80102f69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f6c:	5b                   	pop    %ebx
80102f6d:	5e                   	pop    %esi
80102f6e:	5f                   	pop    %edi
80102f6f:	5d                   	pop    %ebp
80102f70:	c3                   	ret    
80102f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&log);
80102f78:	83 ec 0c             	sub    $0xc,%esp
80102f7b:	68 80 c0 14 80       	push   $0x8014c080
80102f80:	e8 5b 12 00 00       	call   801041e0 <wakeup>
  release(&log.lock);
80102f85:	c7 04 24 80 c0 14 80 	movl   $0x8014c080,(%esp)
80102f8c:	e8 cf 18 00 00       	call   80104860 <release>
80102f91:	83 c4 10             	add    $0x10,%esp
}
80102f94:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f97:	5b                   	pop    %ebx
80102f98:	5e                   	pop    %esi
80102f99:	5f                   	pop    %edi
80102f9a:	5d                   	pop    %ebp
80102f9b:	c3                   	ret    
    panic("log.committing");
80102f9c:	83 ec 0c             	sub    $0xc,%esp
80102f9f:	68 24 7c 10 80       	push   $0x80107c24
80102fa4:	e8 e7 d3 ff ff       	call   80100390 <panic>
80102fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102fb0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102fb0:	55                   	push   %ebp
80102fb1:	89 e5                	mov    %esp,%ebp
80102fb3:	53                   	push   %ebx
80102fb4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fb7:	8b 15 c8 c0 14 80    	mov    0x8014c0c8,%edx
{
80102fbd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fc0:	83 fa 1d             	cmp    $0x1d,%edx
80102fc3:	0f 8f 9d 00 00 00    	jg     80103066 <log_write+0xb6>
80102fc9:	a1 b8 c0 14 80       	mov    0x8014c0b8,%eax
80102fce:	83 e8 01             	sub    $0x1,%eax
80102fd1:	39 c2                	cmp    %eax,%edx
80102fd3:	0f 8d 8d 00 00 00    	jge    80103066 <log_write+0xb6>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102fd9:	a1 bc c0 14 80       	mov    0x8014c0bc,%eax
80102fde:	85 c0                	test   %eax,%eax
80102fe0:	0f 8e 8d 00 00 00    	jle    80103073 <log_write+0xc3>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102fe6:	83 ec 0c             	sub    $0xc,%esp
80102fe9:	68 80 c0 14 80       	push   $0x8014c080
80102fee:	e8 4d 17 00 00       	call   80104740 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102ff3:	8b 0d c8 c0 14 80    	mov    0x8014c0c8,%ecx
80102ff9:	83 c4 10             	add    $0x10,%esp
80102ffc:	83 f9 00             	cmp    $0x0,%ecx
80102fff:	7e 57                	jle    80103058 <log_write+0xa8>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80103001:	8b 53 08             	mov    0x8(%ebx),%edx
  for (i = 0; i < log.lh.n; i++) {
80103004:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80103006:	3b 15 cc c0 14 80    	cmp    0x8014c0cc,%edx
8010300c:	75 0b                	jne    80103019 <log_write+0x69>
8010300e:	eb 38                	jmp    80103048 <log_write+0x98>
80103010:	39 14 85 cc c0 14 80 	cmp    %edx,-0x7feb3f34(,%eax,4)
80103017:	74 2f                	je     80103048 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80103019:	83 c0 01             	add    $0x1,%eax
8010301c:	39 c1                	cmp    %eax,%ecx
8010301e:	75 f0                	jne    80103010 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80103020:	89 14 85 cc c0 14 80 	mov    %edx,-0x7feb3f34(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
80103027:	83 c0 01             	add    $0x1,%eax
8010302a:	a3 c8 c0 14 80       	mov    %eax,0x8014c0c8
  b->flags |= B_DIRTY; // prevent eviction
8010302f:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80103032:	c7 45 08 80 c0 14 80 	movl   $0x8014c080,0x8(%ebp)
}
80103039:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010303c:	c9                   	leave  
  release(&log.lock);
8010303d:	e9 1e 18 00 00       	jmp    80104860 <release>
80103042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80103048:	89 14 85 cc c0 14 80 	mov    %edx,-0x7feb3f34(,%eax,4)
8010304f:	eb de                	jmp    8010302f <log_write+0x7f>
80103051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103058:	8b 43 08             	mov    0x8(%ebx),%eax
8010305b:	a3 cc c0 14 80       	mov    %eax,0x8014c0cc
  if (i == log.lh.n)
80103060:	75 cd                	jne    8010302f <log_write+0x7f>
80103062:	31 c0                	xor    %eax,%eax
80103064:	eb c1                	jmp    80103027 <log_write+0x77>
    panic("too big a transaction");
80103066:	83 ec 0c             	sub    $0xc,%esp
80103069:	68 33 7c 10 80       	push   $0x80107c33
8010306e:	e8 1d d3 ff ff       	call   80100390 <panic>
    panic("log_write outside of trans");
80103073:	83 ec 0c             	sub    $0xc,%esp
80103076:	68 49 7c 10 80       	push   $0x80107c49
8010307b:	e8 10 d3 ff ff       	call   80100390 <panic>

80103080 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80103080:	55                   	push   %ebp
80103081:	89 e5                	mov    %esp,%ebp
80103083:	53                   	push   %ebx
80103084:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80103087:	e8 94 09 00 00       	call   80103a20 <cpuid>
8010308c:	89 c3                	mov    %eax,%ebx
8010308e:	e8 8d 09 00 00       	call   80103a20 <cpuid>
80103093:	83 ec 04             	sub    $0x4,%esp
80103096:	53                   	push   %ebx
80103097:	50                   	push   %eax
80103098:	68 64 7c 10 80       	push   $0x80107c64
8010309d:	e8 be d5 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
801030a2:	e8 89 2b 00 00       	call   80105c30 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
801030a7:	e8 f4 08 00 00       	call   801039a0 <mycpu>
801030ac:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801030ae:	b8 01 00 00 00       	mov    $0x1,%eax
801030b3:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
801030ba:	e8 31 0c 00 00       	call   80103cf0 <scheduler>
801030bf:	90                   	nop

801030c0 <mpenter>:
{
801030c0:	55                   	push   %ebp
801030c1:	89 e5                	mov    %esp,%ebp
801030c3:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
801030c6:	e8 05 3e 00 00       	call   80106ed0 <switchkvm>
  seginit();
801030cb:	e8 90 3b 00 00       	call   80106c60 <seginit>
  lapicinit();
801030d0:	e8 9b f7 ff ff       	call   80102870 <lapicinit>
  mpmain();
801030d5:	e8 a6 ff ff ff       	call   80103080 <mpmain>
801030da:	66 90                	xchg   %ax,%ax
801030dc:	66 90                	xchg   %ax,%ax
801030de:	66 90                	xchg   %ax,%ax

801030e0 <main>:
{
801030e0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
801030e4:	83 e4 f0             	and    $0xfffffff0,%esp
801030e7:	ff 71 fc             	pushl  -0x4(%ecx)
801030ea:	55                   	push   %ebp
801030eb:	89 e5                	mov    %esp,%ebp
801030ed:	53                   	push   %ebx
801030ee:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
801030ef:	83 ec 08             	sub    $0x8,%esp
801030f2:	68 00 00 40 80       	push   $0x80400000
801030f7:	68 a8 f0 14 80       	push   $0x8014f0a8
801030fc:	e8 7f f3 ff ff       	call   80102480 <kinit1>
  kvmalloc();      // kernel page table
80103101:	e8 8a 42 00 00       	call   80107390 <kvmalloc>
  mpinit();        // detect other processors
80103106:	e8 75 01 00 00       	call   80103280 <mpinit>
  lapicinit();     // interrupt controller
8010310b:	e8 60 f7 ff ff       	call   80102870 <lapicinit>
  seginit();       // segment descriptors
80103110:	e8 4b 3b 00 00       	call   80106c60 <seginit>
  picinit();       // disable pic
80103115:	e8 46 03 00 00       	call   80103460 <picinit>
  ioapicinit();    // another interrupt controller
8010311a:	e8 11 f1 ff ff       	call   80102230 <ioapicinit>
  consoleinit();   // console hardware
8010311f:	e8 9c d8 ff ff       	call   801009c0 <consoleinit>
  uartinit();      // serial port
80103124:	e8 b7 2f 00 00       	call   801060e0 <uartinit>
  pinit();         // process table
80103129:	e8 52 08 00 00       	call   80103980 <pinit>
  tvinit();        // trap vectors
8010312e:	e8 7d 2a 00 00       	call   80105bb0 <tvinit>
  binit();         // buffer cache
80103133:	e8 08 cf ff ff       	call   80100040 <binit>
  fileinit();      // file table
80103138:	e8 23 dc ff ff       	call   80100d60 <fileinit>
  ideinit();       // disk 
8010313d:	e8 ce ee ff ff       	call   80102010 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103142:	83 c4 0c             	add    $0xc,%esp
80103145:	68 8a 00 00 00       	push   $0x8a
8010314a:	68 90 b4 10 80       	push   $0x8010b490
8010314f:	68 00 70 00 80       	push   $0x80007000
80103154:	e8 17 18 00 00       	call   80104970 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103159:	69 05 00 c7 14 80 b0 	imul   $0xb0,0x8014c700,%eax
80103160:	00 00 00 
80103163:	83 c4 10             	add    $0x10,%esp
80103166:	05 80 c1 14 80       	add    $0x8014c180,%eax
8010316b:	3d 80 c1 14 80       	cmp    $0x8014c180,%eax
80103170:	76 71                	jbe    801031e3 <main+0x103>
80103172:	bb 80 c1 14 80       	mov    $0x8014c180,%ebx
80103177:	89 f6                	mov    %esi,%esi
80103179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == mycpu())  // We've started already.
80103180:	e8 1b 08 00 00       	call   801039a0 <mycpu>
80103185:	39 d8                	cmp    %ebx,%eax
80103187:	74 41                	je     801031ca <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103189:	e8 52 f3 ff ff       	call   801024e0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
8010318e:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80103193:	c7 05 f8 6f 00 80 c0 	movl   $0x801030c0,0x80006ff8
8010319a:	30 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
8010319d:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
801031a4:	a0 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
801031a7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
801031ac:	0f b6 03             	movzbl (%ebx),%eax
801031af:	83 ec 08             	sub    $0x8,%esp
801031b2:	68 00 70 00 00       	push   $0x7000
801031b7:	50                   	push   %eax
801031b8:	e8 03 f8 ff ff       	call   801029c0 <lapicstartap>
801031bd:	83 c4 10             	add    $0x10,%esp

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801031c0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801031c6:	85 c0                	test   %eax,%eax
801031c8:	74 f6                	je     801031c0 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
801031ca:	69 05 00 c7 14 80 b0 	imul   $0xb0,0x8014c700,%eax
801031d1:	00 00 00 
801031d4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
801031da:	05 80 c1 14 80       	add    $0x8014c180,%eax
801031df:	39 c3                	cmp    %eax,%ebx
801031e1:	72 9d                	jb     80103180 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
801031e3:	83 ec 08             	sub    $0x8,%esp
801031e6:	68 00 00 00 8e       	push   $0x8e000000
801031eb:	68 00 00 40 80       	push   $0x80400000
801031f0:	e8 cb f2 ff ff       	call   801024c0 <kinit2>
  userinit();      // first user process
801031f5:	e8 76 08 00 00       	call   80103a70 <userinit>
  mpmain();        // finish this processor's setup
801031fa:	e8 81 fe ff ff       	call   80103080 <mpmain>
801031ff:	90                   	nop

80103200 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103200:	55                   	push   %ebp
80103201:	89 e5                	mov    %esp,%ebp
80103203:	57                   	push   %edi
80103204:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103205:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010320b:	53                   	push   %ebx
  e = addr+len;
8010320c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010320f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103212:	39 de                	cmp    %ebx,%esi
80103214:	72 10                	jb     80103226 <mpsearch1+0x26>
80103216:	eb 50                	jmp    80103268 <mpsearch1+0x68>
80103218:	90                   	nop
80103219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103220:	39 fb                	cmp    %edi,%ebx
80103222:	89 fe                	mov    %edi,%esi
80103224:	76 42                	jbe    80103268 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103226:	83 ec 04             	sub    $0x4,%esp
80103229:	8d 7e 10             	lea    0x10(%esi),%edi
8010322c:	6a 04                	push   $0x4
8010322e:	68 78 7c 10 80       	push   $0x80107c78
80103233:	56                   	push   %esi
80103234:	e8 d7 16 00 00       	call   80104910 <memcmp>
80103239:	83 c4 10             	add    $0x10,%esp
8010323c:	85 c0                	test   %eax,%eax
8010323e:	75 e0                	jne    80103220 <mpsearch1+0x20>
80103240:	89 f1                	mov    %esi,%ecx
80103242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
80103248:	0f b6 11             	movzbl (%ecx),%edx
8010324b:	83 c1 01             	add    $0x1,%ecx
8010324e:	01 d0                	add    %edx,%eax
  for(i=0; i<len; i++)
80103250:	39 f9                	cmp    %edi,%ecx
80103252:	75 f4                	jne    80103248 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103254:	84 c0                	test   %al,%al
80103256:	75 c8                	jne    80103220 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
80103258:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010325b:	89 f0                	mov    %esi,%eax
8010325d:	5b                   	pop    %ebx
8010325e:	5e                   	pop    %esi
8010325f:	5f                   	pop    %edi
80103260:	5d                   	pop    %ebp
80103261:	c3                   	ret    
80103262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103268:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010326b:	31 f6                	xor    %esi,%esi
}
8010326d:	89 f0                	mov    %esi,%eax
8010326f:	5b                   	pop    %ebx
80103270:	5e                   	pop    %esi
80103271:	5f                   	pop    %edi
80103272:	5d                   	pop    %ebp
80103273:	c3                   	ret    
80103274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010327a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103280 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103280:	55                   	push   %ebp
80103281:	89 e5                	mov    %esp,%ebp
80103283:	57                   	push   %edi
80103284:	56                   	push   %esi
80103285:	53                   	push   %ebx
80103286:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103289:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103290:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103297:	c1 e0 08             	shl    $0x8,%eax
8010329a:	09 d0                	or     %edx,%eax
8010329c:	c1 e0 04             	shl    $0x4,%eax
8010329f:	85 c0                	test   %eax,%eax
801032a1:	75 1b                	jne    801032be <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
801032a3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801032aa:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801032b1:	c1 e0 08             	shl    $0x8,%eax
801032b4:	09 d0                	or     %edx,%eax
801032b6:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
801032b9:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
801032be:	ba 00 04 00 00       	mov    $0x400,%edx
801032c3:	e8 38 ff ff ff       	call   80103200 <mpsearch1>
801032c8:	85 c0                	test   %eax,%eax
801032ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801032cd:	0f 84 3d 01 00 00    	je     80103410 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801032d6:	8b 58 04             	mov    0x4(%eax),%ebx
801032d9:	85 db                	test   %ebx,%ebx
801032db:	0f 84 4f 01 00 00    	je     80103430 <mpinit+0x1b0>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801032e1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
801032e7:	83 ec 04             	sub    $0x4,%esp
801032ea:	6a 04                	push   $0x4
801032ec:	68 95 7c 10 80       	push   $0x80107c95
801032f1:	56                   	push   %esi
801032f2:	e8 19 16 00 00       	call   80104910 <memcmp>
801032f7:	83 c4 10             	add    $0x10,%esp
801032fa:	85 c0                	test   %eax,%eax
801032fc:	0f 85 2e 01 00 00    	jne    80103430 <mpinit+0x1b0>
  if(conf->version != 1 && conf->version != 4)
80103302:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103309:	3c 01                	cmp    $0x1,%al
8010330b:	0f 95 c2             	setne  %dl
8010330e:	3c 04                	cmp    $0x4,%al
80103310:	0f 95 c0             	setne  %al
80103313:	20 c2                	and    %al,%dl
80103315:	0f 85 15 01 00 00    	jne    80103430 <mpinit+0x1b0>
  if(sum((uchar*)conf, conf->length) != 0)
8010331b:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
  for(i=0; i<len; i++)
80103322:	66 85 ff             	test   %di,%di
80103325:	74 1a                	je     80103341 <mpinit+0xc1>
80103327:	89 f0                	mov    %esi,%eax
80103329:	01 f7                	add    %esi,%edi
  sum = 0;
8010332b:	31 d2                	xor    %edx,%edx
8010332d:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
80103330:	0f b6 08             	movzbl (%eax),%ecx
80103333:	83 c0 01             	add    $0x1,%eax
80103336:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80103338:	39 c7                	cmp    %eax,%edi
8010333a:	75 f4                	jne    80103330 <mpinit+0xb0>
8010333c:	84 d2                	test   %dl,%dl
8010333e:	0f 95 c2             	setne  %dl
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103341:	85 f6                	test   %esi,%esi
80103343:	0f 84 e7 00 00 00    	je     80103430 <mpinit+0x1b0>
80103349:	84 d2                	test   %dl,%dl
8010334b:	0f 85 df 00 00 00    	jne    80103430 <mpinit+0x1b0>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
80103351:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103357:	a3 60 c0 14 80       	mov    %eax,0x8014c060
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010335c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103363:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  ismp = 1;
80103369:	bb 01 00 00 00       	mov    $0x1,%ebx
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010336e:	01 d6                	add    %edx,%esi
80103370:	39 c6                	cmp    %eax,%esi
80103372:	76 23                	jbe    80103397 <mpinit+0x117>
    switch(*p){
80103374:	0f b6 10             	movzbl (%eax),%edx
80103377:	80 fa 04             	cmp    $0x4,%dl
8010337a:	0f 87 ca 00 00 00    	ja     8010344a <mpinit+0x1ca>
80103380:	ff 24 95 bc 7c 10 80 	jmp    *-0x7fef8344(,%edx,4)
80103387:	89 f6                	mov    %esi,%esi
80103389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103390:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103393:	39 c6                	cmp    %eax,%esi
80103395:	77 dd                	ja     80103374 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103397:	85 db                	test   %ebx,%ebx
80103399:	0f 84 9e 00 00 00    	je     8010343d <mpinit+0x1bd>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010339f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801033a2:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
801033a6:	74 15                	je     801033bd <mpinit+0x13d>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033a8:	b8 70 00 00 00       	mov    $0x70,%eax
801033ad:	ba 22 00 00 00       	mov    $0x22,%edx
801033b2:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801033b3:	ba 23 00 00 00       	mov    $0x23,%edx
801033b8:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801033b9:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033bc:	ee                   	out    %al,(%dx)
  }
}
801033bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033c0:	5b                   	pop    %ebx
801033c1:	5e                   	pop    %esi
801033c2:	5f                   	pop    %edi
801033c3:	5d                   	pop    %ebp
801033c4:	c3                   	ret    
801033c5:	8d 76 00             	lea    0x0(%esi),%esi
      if(ncpu < NCPU) {
801033c8:	8b 0d 00 c7 14 80    	mov    0x8014c700,%ecx
801033ce:	83 f9 07             	cmp    $0x7,%ecx
801033d1:	7f 19                	jg     801033ec <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801033d3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801033d7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
801033dd:	83 c1 01             	add    $0x1,%ecx
801033e0:	89 0d 00 c7 14 80    	mov    %ecx,0x8014c700
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801033e6:	88 97 80 c1 14 80    	mov    %dl,-0x7feb3e80(%edi)
      p += sizeof(struct mpproc);
801033ec:	83 c0 14             	add    $0x14,%eax
      continue;
801033ef:	e9 7c ff ff ff       	jmp    80103370 <mpinit+0xf0>
801033f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
801033f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801033fc:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
801033ff:	88 15 60 c1 14 80    	mov    %dl,0x8014c160
      continue;
80103405:	e9 66 ff ff ff       	jmp    80103370 <mpinit+0xf0>
8010340a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return mpsearch1(0xF0000, 0x10000);
80103410:	ba 00 00 01 00       	mov    $0x10000,%edx
80103415:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010341a:	e8 e1 fd ff ff       	call   80103200 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010341f:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
80103421:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103424:	0f 85 a9 fe ff ff    	jne    801032d3 <mpinit+0x53>
8010342a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("Expect to run on an SMP");
80103430:	83 ec 0c             	sub    $0xc,%esp
80103433:	68 7d 7c 10 80       	push   $0x80107c7d
80103438:	e8 53 cf ff ff       	call   80100390 <panic>
    panic("Didn't find a suitable machine");
8010343d:	83 ec 0c             	sub    $0xc,%esp
80103440:	68 9c 7c 10 80       	push   $0x80107c9c
80103445:	e8 46 cf ff ff       	call   80100390 <panic>
      ismp = 0;
8010344a:	31 db                	xor    %ebx,%ebx
8010344c:	e9 26 ff ff ff       	jmp    80103377 <mpinit+0xf7>
80103451:	66 90                	xchg   %ax,%ax
80103453:	66 90                	xchg   %ax,%ax
80103455:	66 90                	xchg   %ax,%ax
80103457:	66 90                	xchg   %ax,%ax
80103459:	66 90                	xchg   %ax,%ax
8010345b:	66 90                	xchg   %ax,%ax
8010345d:	66 90                	xchg   %ax,%ax
8010345f:	90                   	nop

80103460 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103460:	55                   	push   %ebp
80103461:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103466:	ba 21 00 00 00       	mov    $0x21,%edx
8010346b:	89 e5                	mov    %esp,%ebp
8010346d:	ee                   	out    %al,(%dx)
8010346e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103473:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103474:	5d                   	pop    %ebp
80103475:	c3                   	ret    
80103476:	66 90                	xchg   %ax,%ax
80103478:	66 90                	xchg   %ax,%ax
8010347a:	66 90                	xchg   %ax,%ax
8010347c:	66 90                	xchg   %ax,%ax
8010347e:	66 90                	xchg   %ax,%ax

80103480 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 0c             	sub    $0xc,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010348f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103495:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010349b:	e8 e0 d8 ff ff       	call   80100d80 <filealloc>
801034a0:	85 c0                	test   %eax,%eax
801034a2:	89 03                	mov    %eax,(%ebx)
801034a4:	74 22                	je     801034c8 <pipealloc+0x48>
801034a6:	e8 d5 d8 ff ff       	call   80100d80 <filealloc>
801034ab:	85 c0                	test   %eax,%eax
801034ad:	89 06                	mov    %eax,(%esi)
801034af:	74 3f                	je     801034f0 <pipealloc+0x70>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801034b1:	e8 2a f0 ff ff       	call   801024e0 <kalloc>
801034b6:	85 c0                	test   %eax,%eax
801034b8:	89 c7                	mov    %eax,%edi
801034ba:	75 54                	jne    80103510 <pipealloc+0x90>

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801034bc:	8b 03                	mov    (%ebx),%eax
801034be:	85 c0                	test   %eax,%eax
801034c0:	75 34                	jne    801034f6 <pipealloc+0x76>
801034c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    fileclose(*f0);
  if(*f1)
801034c8:	8b 06                	mov    (%esi),%eax
801034ca:	85 c0                	test   %eax,%eax
801034cc:	74 0c                	je     801034da <pipealloc+0x5a>
    fileclose(*f1);
801034ce:	83 ec 0c             	sub    $0xc,%esp
801034d1:	50                   	push   %eax
801034d2:	e8 69 d9 ff ff       	call   80100e40 <fileclose>
801034d7:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801034da:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801034dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801034e2:	5b                   	pop    %ebx
801034e3:	5e                   	pop    %esi
801034e4:	5f                   	pop    %edi
801034e5:	5d                   	pop    %ebp
801034e6:	c3                   	ret    
801034e7:	89 f6                	mov    %esi,%esi
801034e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(*f0)
801034f0:	8b 03                	mov    (%ebx),%eax
801034f2:	85 c0                	test   %eax,%eax
801034f4:	74 e4                	je     801034da <pipealloc+0x5a>
    fileclose(*f0);
801034f6:	83 ec 0c             	sub    $0xc,%esp
801034f9:	50                   	push   %eax
801034fa:	e8 41 d9 ff ff       	call   80100e40 <fileclose>
  if(*f1)
801034ff:	8b 06                	mov    (%esi),%eax
    fileclose(*f0);
80103501:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103504:	85 c0                	test   %eax,%eax
80103506:	75 c6                	jne    801034ce <pipealloc+0x4e>
80103508:	eb d0                	jmp    801034da <pipealloc+0x5a>
8010350a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  initlock(&p->lock, "pipe");
80103510:	83 ec 08             	sub    $0x8,%esp
  p->readopen = 1;
80103513:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010351a:	00 00 00 
  p->writeopen = 1;
8010351d:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103524:	00 00 00 
  p->nwrite = 0;
80103527:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010352e:	00 00 00 
  p->nread = 0;
80103531:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103538:	00 00 00 
  initlock(&p->lock, "pipe");
8010353b:	68 d0 7c 10 80       	push   $0x80107cd0
80103540:	50                   	push   %eax
80103541:	e8 0a 11 00 00       	call   80104650 <initlock>
  (*f0)->type = FD_PIPE;
80103546:	8b 03                	mov    (%ebx),%eax
  return 0;
80103548:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
8010354b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103551:	8b 03                	mov    (%ebx),%eax
80103553:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103557:	8b 03                	mov    (%ebx),%eax
80103559:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
8010355d:	8b 03                	mov    (%ebx),%eax
8010355f:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103562:	8b 06                	mov    (%esi),%eax
80103564:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010356a:	8b 06                	mov    (%esi),%eax
8010356c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103570:	8b 06                	mov    (%esi),%eax
80103572:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103576:	8b 06                	mov    (%esi),%eax
80103578:	89 78 0c             	mov    %edi,0xc(%eax)
}
8010357b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010357e:	31 c0                	xor    %eax,%eax
}
80103580:	5b                   	pop    %ebx
80103581:	5e                   	pop    %esi
80103582:	5f                   	pop    %edi
80103583:	5d                   	pop    %ebp
80103584:	c3                   	ret    
80103585:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103590 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103590:	55                   	push   %ebp
80103591:	89 e5                	mov    %esp,%ebp
80103593:	56                   	push   %esi
80103594:	53                   	push   %ebx
80103595:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103598:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010359b:	83 ec 0c             	sub    $0xc,%esp
8010359e:	53                   	push   %ebx
8010359f:	e8 9c 11 00 00       	call   80104740 <acquire>
  if(writable){
801035a4:	83 c4 10             	add    $0x10,%esp
801035a7:	85 f6                	test   %esi,%esi
801035a9:	74 45                	je     801035f0 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801035ab:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801035b1:	83 ec 0c             	sub    $0xc,%esp
    p->writeopen = 0;
801035b4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801035bb:	00 00 00 
    wakeup(&p->nread);
801035be:	50                   	push   %eax
801035bf:	e8 1c 0c 00 00       	call   801041e0 <wakeup>
801035c4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801035c7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801035cd:	85 d2                	test   %edx,%edx
801035cf:	75 0a                	jne    801035db <pipeclose+0x4b>
801035d1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801035d7:	85 c0                	test   %eax,%eax
801035d9:	74 35                	je     80103610 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801035db:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801035de:	8d 65 f8             	lea    -0x8(%ebp),%esp
801035e1:	5b                   	pop    %ebx
801035e2:	5e                   	pop    %esi
801035e3:	5d                   	pop    %ebp
    release(&p->lock);
801035e4:	e9 77 12 00 00       	jmp    80104860 <release>
801035e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801035f0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801035f6:	83 ec 0c             	sub    $0xc,%esp
    p->readopen = 0;
801035f9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103600:	00 00 00 
    wakeup(&p->nwrite);
80103603:	50                   	push   %eax
80103604:	e8 d7 0b 00 00       	call   801041e0 <wakeup>
80103609:	83 c4 10             	add    $0x10,%esp
8010360c:	eb b9                	jmp    801035c7 <pipeclose+0x37>
8010360e:	66 90                	xchg   %ax,%ax
    release(&p->lock);
80103610:	83 ec 0c             	sub    $0xc,%esp
80103613:	53                   	push   %ebx
80103614:	e8 47 12 00 00       	call   80104860 <release>
    kfree((char*)p);
80103619:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010361c:	83 c4 10             	add    $0x10,%esp
}
8010361f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103622:	5b                   	pop    %ebx
80103623:	5e                   	pop    %esi
80103624:	5d                   	pop    %ebp
    kfree((char*)p);
80103625:	e9 f6 ec ff ff       	jmp    80102320 <kfree>
8010362a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103630 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103630:	55                   	push   %ebp
80103631:	89 e5                	mov    %esp,%ebp
80103633:	57                   	push   %edi
80103634:	56                   	push   %esi
80103635:	53                   	push   %ebx
80103636:	83 ec 28             	sub    $0x28,%esp
80103639:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010363c:	53                   	push   %ebx
8010363d:	e8 fe 10 00 00       	call   80104740 <acquire>
  for(i = 0; i < n; i++){
80103642:	8b 45 10             	mov    0x10(%ebp),%eax
80103645:	83 c4 10             	add    $0x10,%esp
80103648:	85 c0                	test   %eax,%eax
8010364a:	0f 8e c9 00 00 00    	jle    80103719 <pipewrite+0xe9>
80103650:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103653:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103659:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010365f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103662:	03 4d 10             	add    0x10(%ebp),%ecx
80103665:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103668:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010366e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103674:	39 d0                	cmp    %edx,%eax
80103676:	75 71                	jne    801036e9 <pipewrite+0xb9>
      if(p->readopen == 0 || myproc()->killed){
80103678:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010367e:	85 c0                	test   %eax,%eax
80103680:	74 4e                	je     801036d0 <pipewrite+0xa0>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103682:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103688:	eb 3a                	jmp    801036c4 <pipewrite+0x94>
8010368a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      wakeup(&p->nread);
80103690:	83 ec 0c             	sub    $0xc,%esp
80103693:	57                   	push   %edi
80103694:	e8 47 0b 00 00       	call   801041e0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103699:	5a                   	pop    %edx
8010369a:	59                   	pop    %ecx
8010369b:	53                   	push   %ebx
8010369c:	56                   	push   %esi
8010369d:	e8 7e 09 00 00       	call   80104020 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801036a2:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801036a8:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801036ae:	83 c4 10             	add    $0x10,%esp
801036b1:	05 00 02 00 00       	add    $0x200,%eax
801036b6:	39 c2                	cmp    %eax,%edx
801036b8:	75 36                	jne    801036f0 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
801036ba:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801036c0:	85 c0                	test   %eax,%eax
801036c2:	74 0c                	je     801036d0 <pipewrite+0xa0>
801036c4:	e8 77 03 00 00       	call   80103a40 <myproc>
801036c9:	8b 40 24             	mov    0x24(%eax),%eax
801036cc:	85 c0                	test   %eax,%eax
801036ce:	74 c0                	je     80103690 <pipewrite+0x60>
        release(&p->lock);
801036d0:	83 ec 0c             	sub    $0xc,%esp
801036d3:	53                   	push   %ebx
801036d4:	e8 87 11 00 00       	call   80104860 <release>
        return -1;
801036d9:	83 c4 10             	add    $0x10,%esp
801036dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801036e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036e4:	5b                   	pop    %ebx
801036e5:	5e                   	pop    %esi
801036e6:	5f                   	pop    %edi
801036e7:	5d                   	pop    %ebp
801036e8:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801036e9:	89 c2                	mov    %eax,%edx
801036eb:	90                   	nop
801036ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801036f0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801036f3:	8d 42 01             	lea    0x1(%edx),%eax
801036f6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801036fc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103702:	83 c6 01             	add    $0x1,%esi
80103705:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
  for(i = 0; i < n; i++){
80103709:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010370c:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010370f:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
80103713:	0f 85 4f ff ff ff    	jne    80103668 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103719:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010371f:	83 ec 0c             	sub    $0xc,%esp
80103722:	50                   	push   %eax
80103723:	e8 b8 0a 00 00       	call   801041e0 <wakeup>
  release(&p->lock);
80103728:	89 1c 24             	mov    %ebx,(%esp)
8010372b:	e8 30 11 00 00       	call   80104860 <release>
  return n;
80103730:	83 c4 10             	add    $0x10,%esp
80103733:	8b 45 10             	mov    0x10(%ebp),%eax
80103736:	eb a9                	jmp    801036e1 <pipewrite+0xb1>
80103738:	90                   	nop
80103739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103740 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	57                   	push   %edi
80103744:	56                   	push   %esi
80103745:	53                   	push   %ebx
80103746:	83 ec 18             	sub    $0x18,%esp
80103749:	8b 75 08             	mov    0x8(%ebp),%esi
8010374c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010374f:	56                   	push   %esi
80103750:	e8 eb 0f 00 00       	call   80104740 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103755:	83 c4 10             	add    $0x10,%esp
80103758:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010375e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103764:	75 6a                	jne    801037d0 <piperead+0x90>
80103766:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010376c:	85 db                	test   %ebx,%ebx
8010376e:	0f 84 c4 00 00 00    	je     80103838 <piperead+0xf8>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103774:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010377a:	eb 2d                	jmp    801037a9 <piperead+0x69>
8010377c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103780:	83 ec 08             	sub    $0x8,%esp
80103783:	56                   	push   %esi
80103784:	53                   	push   %ebx
80103785:	e8 96 08 00 00       	call   80104020 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010378a:	83 c4 10             	add    $0x10,%esp
8010378d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103793:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103799:	75 35                	jne    801037d0 <piperead+0x90>
8010379b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801037a1:	85 d2                	test   %edx,%edx
801037a3:	0f 84 8f 00 00 00    	je     80103838 <piperead+0xf8>
    if(myproc()->killed){
801037a9:	e8 92 02 00 00       	call   80103a40 <myproc>
801037ae:	8b 48 24             	mov    0x24(%eax),%ecx
801037b1:	85 c9                	test   %ecx,%ecx
801037b3:	74 cb                	je     80103780 <piperead+0x40>
      release(&p->lock);
801037b5:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801037b8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
801037bd:	56                   	push   %esi
801037be:	e8 9d 10 00 00       	call   80104860 <release>
      return -1;
801037c3:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801037c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801037c9:	89 d8                	mov    %ebx,%eax
801037cb:	5b                   	pop    %ebx
801037cc:	5e                   	pop    %esi
801037cd:	5f                   	pop    %edi
801037ce:	5d                   	pop    %ebp
801037cf:	c3                   	ret    
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801037d0:	8b 45 10             	mov    0x10(%ebp),%eax
801037d3:	85 c0                	test   %eax,%eax
801037d5:	7e 61                	jle    80103838 <piperead+0xf8>
    if(p->nread == p->nwrite)
801037d7:	31 db                	xor    %ebx,%ebx
801037d9:	eb 13                	jmp    801037ee <piperead+0xae>
801037db:	90                   	nop
801037dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037e0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801037e6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801037ec:	74 1f                	je     8010380d <piperead+0xcd>
    addr[i] = p->data[p->nread++ % PIPESIZE];
801037ee:	8d 41 01             	lea    0x1(%ecx),%eax
801037f1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801037f7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801037fd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
80103802:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103805:	83 c3 01             	add    $0x1,%ebx
80103808:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010380b:	75 d3                	jne    801037e0 <piperead+0xa0>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010380d:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103813:	83 ec 0c             	sub    $0xc,%esp
80103816:	50                   	push   %eax
80103817:	e8 c4 09 00 00       	call   801041e0 <wakeup>
  release(&p->lock);
8010381c:	89 34 24             	mov    %esi,(%esp)
8010381f:	e8 3c 10 00 00       	call   80104860 <release>
  return i;
80103824:	83 c4 10             	add    $0x10,%esp
}
80103827:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010382a:	89 d8                	mov    %ebx,%eax
8010382c:	5b                   	pop    %ebx
8010382d:	5e                   	pop    %esi
8010382e:	5f                   	pop    %edi
8010382f:	5d                   	pop    %ebp
80103830:	c3                   	ret    
80103831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103838:	31 db                	xor    %ebx,%ebx
8010383a:	eb d1                	jmp    8010380d <piperead+0xcd>
8010383c:	66 90                	xchg   %ax,%ax
8010383e:	66 90                	xchg   %ax,%ax

80103840 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103840:	55                   	push   %ebp
80103841:	89 e5                	mov    %esp,%ebp
80103843:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103844:	bb 54 c7 14 80       	mov    $0x8014c754,%ebx
{
80103849:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010384c:	68 20 c7 14 80       	push   $0x8014c720
80103851:	e8 ea 0e 00 00       	call   80104740 <acquire>
80103856:	83 c4 10             	add    $0x10,%esp
80103859:	eb 17                	jmp    80103872 <allocproc+0x32>
8010385b:	90                   	nop
8010385c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103860:	81 c3 84 00 00 00    	add    $0x84,%ebx
80103866:	81 fb 54 e8 14 80    	cmp    $0x8014e854,%ebx
8010386c:	0f 83 8e 00 00 00    	jae    80103900 <allocproc+0xc0>
    if(p->state == UNUSED)
80103872:	8b 43 0c             	mov    0xc(%ebx),%eax
80103875:	85 c0                	test   %eax,%eax
80103877:	75 e7                	jne    80103860 <allocproc+0x20>
  return 0;

found:

  p->state = EMBRYO;
  p->pid = nextpid++;
80103879:	a1 04 b0 10 80       	mov    0x8010b004,%eax

  // !!
  p->tickets = 10;
  p->ticks = 0;

  release(&ptable.lock);
8010387e:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
80103881:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->tickets = 10;
80103888:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->ticks = 0;
8010388f:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
80103896:	00 00 00 
  p->pid = nextpid++;
80103899:	8d 50 01             	lea    0x1(%eax),%edx
8010389c:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
8010389f:	68 20 c7 14 80       	push   $0x8014c720
  p->pid = nextpid++;
801038a4:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
  release(&ptable.lock);
801038aa:	e8 b1 0f 00 00       	call   80104860 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801038af:	e8 2c ec ff ff       	call   801024e0 <kalloc>
801038b4:	83 c4 10             	add    $0x10,%esp
801038b7:	85 c0                	test   %eax,%eax
801038b9:	89 43 08             	mov    %eax,0x8(%ebx)
801038bc:	74 5b                	je     80103919 <allocproc+0xd9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801038be:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801038c4:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
801038c7:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
801038cc:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
801038cf:	c7 40 14 9f 5b 10 80 	movl   $0x80105b9f,0x14(%eax)
  p->context = (struct context*)sp;
801038d6:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801038d9:	6a 14                	push   $0x14
801038db:	6a 00                	push   $0x0
801038dd:	50                   	push   %eax
801038de:	e8 dd 0f 00 00       	call   801048c0 <memset>
  p->context->eip = (uint)forkret;
801038e3:	8b 43 1c             	mov    0x1c(%ebx),%eax

  // !

  return p;
801038e6:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
801038e9:	c7 40 10 30 39 10 80 	movl   $0x80103930,0x10(%eax)
}
801038f0:	89 d8                	mov    %ebx,%eax
801038f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038f5:	c9                   	leave  
801038f6:	c3                   	ret    
801038f7:	89 f6                	mov    %esi,%esi
801038f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&ptable.lock);
80103900:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103903:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103905:	68 20 c7 14 80       	push   $0x8014c720
8010390a:	e8 51 0f 00 00       	call   80104860 <release>
}
8010390f:	89 d8                	mov    %ebx,%eax
  return 0;
80103911:	83 c4 10             	add    $0x10,%esp
}
80103914:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103917:	c9                   	leave  
80103918:	c3                   	ret    
    p->state = UNUSED;
80103919:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103920:	31 db                	xor    %ebx,%ebx
80103922:	eb cc                	jmp    801038f0 <allocproc+0xb0>
80103924:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010392a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103930 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103930:	55                   	push   %ebp
80103931:	89 e5                	mov    %esp,%ebp
80103933:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103936:	68 20 c7 14 80       	push   $0x8014c720
8010393b:	e8 20 0f 00 00       	call   80104860 <release>

  if (first) {
80103940:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103945:	83 c4 10             	add    $0x10,%esp
80103948:	85 c0                	test   %eax,%eax
8010394a:	75 04                	jne    80103950 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010394c:	c9                   	leave  
8010394d:	c3                   	ret    
8010394e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103950:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103953:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
8010395a:	00 00 00 
    iinit(ROOTDEV);
8010395d:	6a 01                	push   $0x1
8010395f:	e8 2c db ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
80103964:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010396b:	e8 d0 f3 ff ff       	call   80102d40 <initlog>
80103970:	83 c4 10             	add    $0x10,%esp
}
80103973:	c9                   	leave  
80103974:	c3                   	ret    
80103975:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103980 <pinit>:
{
80103980:	55                   	push   %ebp
80103981:	89 e5                	mov    %esp,%ebp
80103983:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103986:	68 d5 7c 10 80       	push   $0x80107cd5
8010398b:	68 20 c7 14 80       	push   $0x8014c720
80103990:	e8 bb 0c 00 00       	call   80104650 <initlock>
}
80103995:	83 c4 10             	add    $0x10,%esp
80103998:	c9                   	leave  
80103999:	c3                   	ret    
8010399a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801039a0 <mycpu>:
{
801039a0:	55                   	push   %ebp
801039a1:	89 e5                	mov    %esp,%ebp
801039a3:	56                   	push   %esi
801039a4:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801039a5:	9c                   	pushf  
801039a6:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801039a7:	f6 c4 02             	test   $0x2,%ah
801039aa:	75 5e                	jne    80103a0a <mycpu+0x6a>
  apicid = lapicid();
801039ac:	e8 bf ef ff ff       	call   80102970 <lapicid>
  for (i = 0; i < ncpu; ++i) {
801039b1:	8b 35 00 c7 14 80    	mov    0x8014c700,%esi
801039b7:	85 f6                	test   %esi,%esi
801039b9:	7e 42                	jle    801039fd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801039bb:	0f b6 15 80 c1 14 80 	movzbl 0x8014c180,%edx
801039c2:	39 d0                	cmp    %edx,%eax
801039c4:	74 30                	je     801039f6 <mycpu+0x56>
801039c6:	b9 30 c2 14 80       	mov    $0x8014c230,%ecx
  for (i = 0; i < ncpu; ++i) {
801039cb:	31 d2                	xor    %edx,%edx
801039cd:	8d 76 00             	lea    0x0(%esi),%esi
801039d0:	83 c2 01             	add    $0x1,%edx
801039d3:	39 f2                	cmp    %esi,%edx
801039d5:	74 26                	je     801039fd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801039d7:	0f b6 19             	movzbl (%ecx),%ebx
801039da:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801039e0:	39 c3                	cmp    %eax,%ebx
801039e2:	75 ec                	jne    801039d0 <mycpu+0x30>
801039e4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
801039ea:	05 80 c1 14 80       	add    $0x8014c180,%eax
}
801039ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039f2:	5b                   	pop    %ebx
801039f3:	5e                   	pop    %esi
801039f4:	5d                   	pop    %ebp
801039f5:	c3                   	ret    
    if (cpus[i].apicid == apicid)
801039f6:	b8 80 c1 14 80       	mov    $0x8014c180,%eax
      return &cpus[i];
801039fb:	eb f2                	jmp    801039ef <mycpu+0x4f>
  panic("unknown apicid\n");
801039fd:	83 ec 0c             	sub    $0xc,%esp
80103a00:	68 dc 7c 10 80       	push   $0x80107cdc
80103a05:	e8 86 c9 ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
80103a0a:	83 ec 0c             	sub    $0xc,%esp
80103a0d:	68 10 7e 10 80       	push   $0x80107e10
80103a12:	e8 79 c9 ff ff       	call   80100390 <panic>
80103a17:	89 f6                	mov    %esi,%esi
80103a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a20 <cpuid>:
cpuid() {
80103a20:	55                   	push   %ebp
80103a21:	89 e5                	mov    %esp,%ebp
80103a23:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103a26:	e8 75 ff ff ff       	call   801039a0 <mycpu>
80103a2b:	2d 80 c1 14 80       	sub    $0x8014c180,%eax
}
80103a30:	c9                   	leave  
  return mycpu()-cpus;
80103a31:	c1 f8 04             	sar    $0x4,%eax
80103a34:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
80103a3a:	c3                   	ret    
80103a3b:	90                   	nop
80103a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103a40 <myproc>:
myproc(void) {
80103a40:	55                   	push   %ebp
80103a41:	89 e5                	mov    %esp,%ebp
80103a43:	53                   	push   %ebx
80103a44:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103a47:	e8 b4 0c 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103a4c:	e8 4f ff ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103a51:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a57:	e8 a4 0d 00 00       	call   80104800 <popcli>
}
80103a5c:	83 c4 04             	add    $0x4,%esp
80103a5f:	89 d8                	mov    %ebx,%eax
80103a61:	5b                   	pop    %ebx
80103a62:	5d                   	pop    %ebp
80103a63:	c3                   	ret    
80103a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103a70 <userinit>:
{
80103a70:	55                   	push   %ebp
80103a71:	89 e5                	mov    %esp,%ebp
80103a73:	53                   	push   %ebx
80103a74:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103a77:	e8 c4 fd ff ff       	call   80103840 <allocproc>
80103a7c:	89 c3                	mov    %eax,%ebx
  initproc = p;
80103a7e:	a3 b8 b5 10 80       	mov    %eax,0x8010b5b8
  if((p->pgdir = setupkvm()) == 0)
80103a83:	e8 88 38 00 00       	call   80107310 <setupkvm>
80103a88:	85 c0                	test   %eax,%eax
80103a8a:	89 43 04             	mov    %eax,0x4(%ebx)
80103a8d:	0f 84 bd 00 00 00    	je     80103b50 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103a93:	83 ec 04             	sub    $0x4,%esp
80103a96:	68 2c 00 00 00       	push   $0x2c
80103a9b:	68 64 b4 10 80       	push   $0x8010b464
80103aa0:	50                   	push   %eax
80103aa1:	e8 5a 35 00 00       	call   80107000 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103aa6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103aa9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103aaf:	6a 4c                	push   $0x4c
80103ab1:	6a 00                	push   $0x0
80103ab3:	ff 73 18             	pushl  0x18(%ebx)
80103ab6:	e8 05 0e 00 00       	call   801048c0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103abb:	8b 43 18             	mov    0x18(%ebx),%eax
80103abe:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103ac3:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103ac8:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103acb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103acf:	8b 43 18             	mov    0x18(%ebx),%eax
80103ad2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103ad6:	8b 43 18             	mov    0x18(%ebx),%eax
80103ad9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103add:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103ae1:	8b 43 18             	mov    0x18(%ebx),%eax
80103ae4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103ae8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103aec:	8b 43 18             	mov    0x18(%ebx),%eax
80103aef:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103af6:	8b 43 18             	mov    0x18(%ebx),%eax
80103af9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103b00:	8b 43 18             	mov    0x18(%ebx),%eax
80103b03:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103b0a:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103b0d:	6a 10                	push   $0x10
80103b0f:	68 05 7d 10 80       	push   $0x80107d05
80103b14:	50                   	push   %eax
80103b15:	e8 86 0f 00 00       	call   80104aa0 <safestrcpy>
  p->cwd = namei("/");
80103b1a:	c7 04 24 0e 7d 10 80 	movl   $0x80107d0e,(%esp)
80103b21:	e8 ca e3 ff ff       	call   80101ef0 <namei>
80103b26:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103b29:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103b30:	e8 0b 0c 00 00       	call   80104740 <acquire>
  p->state = RUNNABLE;
80103b35:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103b3c:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103b43:	e8 18 0d 00 00       	call   80104860 <release>
}
80103b48:	83 c4 10             	add    $0x10,%esp
80103b4b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b4e:	c9                   	leave  
80103b4f:	c3                   	ret    
    panic("userinit: out of memory?");
80103b50:	83 ec 0c             	sub    $0xc,%esp
80103b53:	68 ec 7c 10 80       	push   $0x80107cec
80103b58:	e8 33 c8 ff ff       	call   80100390 <panic>
80103b5d:	8d 76 00             	lea    0x0(%esi),%esi

80103b60 <growproc>:
{
80103b60:	55                   	push   %ebp
80103b61:	89 e5                	mov    %esp,%ebp
80103b63:	56                   	push   %esi
80103b64:	53                   	push   %ebx
80103b65:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103b68:	e8 93 0b 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103b6d:	e8 2e fe ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103b72:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b78:	e8 83 0c 00 00       	call   80104800 <popcli>
  if(n > 0) {
80103b7d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103b80:	8b 03                	mov    (%ebx),%eax
  if(n > 0) {
80103b82:	7e 1c                	jle    80103ba0 <growproc+0x40>
      if(sz >= KERNBASE) 
80103b84:	01 f0                	add    %esi,%eax
80103b86:	78 30                	js     80103bb8 <growproc+0x58>
  switchuvm(curproc);
80103b88:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103b8b:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103b8d:	53                   	push   %ebx
80103b8e:	e8 5d 33 00 00       	call   80106ef0 <switchuvm>
  return 0;
80103b93:	83 c4 10             	add    $0x10,%esp
80103b96:	31 c0                	xor    %eax,%eax
}
80103b98:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b9b:	5b                   	pop    %ebx
80103b9c:	5e                   	pop    %esi
80103b9d:	5d                   	pop    %ebp
80103b9e:	c3                   	ret    
80103b9f:	90                   	nop
  } else if(n < 0) {
80103ba0:	74 e6                	je     80103b88 <growproc+0x28>
      if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ba2:	83 ec 04             	sub    $0x4,%esp
80103ba5:	01 c6                	add    %eax,%esi
80103ba7:	56                   	push   %esi
80103ba8:	50                   	push   %eax
80103ba9:	ff 73 04             	pushl  0x4(%ebx)
80103bac:	e8 af 36 00 00       	call   80107260 <deallocuvm>
80103bb1:	83 c4 10             	add    $0x10,%esp
80103bb4:	85 c0                	test   %eax,%eax
80103bb6:	75 d0                	jne    80103b88 <growproc+0x28>
        return -1;
80103bb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103bbd:	eb d9                	jmp    80103b98 <growproc+0x38>
80103bbf:	90                   	nop

80103bc0 <fork>:
{
80103bc0:	55                   	push   %ebp
80103bc1:	89 e5                	mov    %esp,%ebp
80103bc3:	57                   	push   %edi
80103bc4:	56                   	push   %esi
80103bc5:	53                   	push   %ebx
80103bc6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103bc9:	e8 32 0b 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103bce:	e8 cd fd ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103bd3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103bd9:	e8 22 0c 00 00       	call   80104800 <popcli>
  if((np = allocproc()) == 0){
80103bde:	e8 5d fc ff ff       	call   80103840 <allocproc>
80103be3:	85 c0                	test   %eax,%eax
80103be5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103be8:	0f 84 cf 00 00 00    	je     80103cbd <fork+0xfd>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103bee:	83 ec 08             	sub    $0x8,%esp
80103bf1:	ff 33                	pushl  (%ebx)
80103bf3:	ff 73 04             	pushl  0x4(%ebx)
80103bf6:	89 c7                	mov    %eax,%edi
80103bf8:	e8 e3 37 00 00       	call   801073e0 <copyuvm>
80103bfd:	83 c4 10             	add    $0x10,%esp
80103c00:	85 c0                	test   %eax,%eax
80103c02:	89 47 04             	mov    %eax,0x4(%edi)
80103c05:	0f 84 b9 00 00 00    	je     80103cc4 <fork+0x104>
  np->sz = curproc->sz;
80103c0b:	8b 03                	mov    (%ebx),%eax
80103c0d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  *np->tf = *curproc->tf;
80103c10:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = curproc->sz;
80103c15:	89 07                	mov    %eax,(%edi)
  np->parent = curproc;
80103c17:	89 5f 14             	mov    %ebx,0x14(%edi)
80103c1a:	89 f8                	mov    %edi,%eax
  *np->tf = *curproc->tf;
80103c1c:	8b 73 18             	mov    0x18(%ebx),%esi
80103c1f:	8b 7f 18             	mov    0x18(%edi),%edi
80103c22:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->ticks = 0;
80103c24:	89 c1                	mov    %eax,%ecx
80103c26:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80103c2d:	00 00 00 
  for(i = 0; i < NOFILE; i++)
80103c30:	31 f6                	xor    %esi,%esi
  np->tickets = curproc->tickets;
80103c32:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103c35:	89 41 7c             	mov    %eax,0x7c(%ecx)
  np->tf->eax = 0;
80103c38:	8b 41 18             	mov    0x18(%ecx),%eax
80103c3b:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103c42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(curproc->ofile[i])
80103c48:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103c4c:	85 c0                	test   %eax,%eax
80103c4e:	74 13                	je     80103c63 <fork+0xa3>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103c50:	83 ec 0c             	sub    $0xc,%esp
80103c53:	50                   	push   %eax
80103c54:	e8 97 d1 ff ff       	call   80100df0 <filedup>
80103c59:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103c5c:	83 c4 10             	add    $0x10,%esp
80103c5f:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103c63:	83 c6 01             	add    $0x1,%esi
80103c66:	83 fe 10             	cmp    $0x10,%esi
80103c69:	75 dd                	jne    80103c48 <fork+0x88>
  np->cwd = idup(curproc->cwd);
80103c6b:	83 ec 0c             	sub    $0xc,%esp
80103c6e:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103c71:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103c74:	e8 e7 d9 ff ff       	call   80101660 <idup>
80103c79:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103c7c:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103c7f:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103c82:	8d 47 6c             	lea    0x6c(%edi),%eax
80103c85:	6a 10                	push   $0x10
80103c87:	53                   	push   %ebx
80103c88:	50                   	push   %eax
80103c89:	e8 12 0e 00 00       	call   80104aa0 <safestrcpy>
  pid = np->pid;
80103c8e:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103c91:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103c98:	e8 a3 0a 00 00       	call   80104740 <acquire>
  np->state = RUNNABLE;
80103c9d:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103ca4:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103cab:	e8 b0 0b 00 00       	call   80104860 <release>
  return pid;
80103cb0:	83 c4 10             	add    $0x10,%esp
}
80103cb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103cb6:	89 d8                	mov    %ebx,%eax
80103cb8:	5b                   	pop    %ebx
80103cb9:	5e                   	pop    %esi
80103cba:	5f                   	pop    %edi
80103cbb:	5d                   	pop    %ebp
80103cbc:	c3                   	ret    
    return -1;
80103cbd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103cc2:	eb ef                	jmp    80103cb3 <fork+0xf3>
    kfree(np->kstack);
80103cc4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103cc7:	83 ec 0c             	sub    $0xc,%esp
80103cca:	ff 73 08             	pushl  0x8(%ebx)
80103ccd:	e8 4e e6 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103cd2:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103cd9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103ce0:	83 c4 10             	add    $0x10,%esp
80103ce3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103ce8:	eb c9                	jmp    80103cb3 <fork+0xf3>
80103cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103cf0 <scheduler>:
{
80103cf0:	55                   	push   %ebp
80103cf1:	89 e5                	mov    %esp,%ebp
80103cf3:	57                   	push   %edi
80103cf4:	56                   	push   %esi
80103cf5:	53                   	push   %ebx
80103cf6:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103cf9:	e8 a2 fc ff ff       	call   801039a0 <mycpu>
80103cfe:	8d 70 04             	lea    0x4(%eax),%esi
80103d01:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103d03:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103d0a:	00 00 00 
80103d0d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103d10:	fb                   	sti    
    acquire(&ptable.lock);
80103d11:	83 ec 0c             	sub    $0xc,%esp
80103d14:	68 20 c7 14 80       	push   $0x8014c720
80103d19:	e8 22 0a 00 00       	call   80104740 <acquire>
80103d1e:	83 c4 10             	add    $0x10,%esp
    int totnumtic = 0;
80103d21:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d23:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
80103d28:	90                   	nop
80103d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      totnumtic += (p->state == RUNNABLE ? p->tickets : 0);
80103d30:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103d34:	75 03                	jne    80103d39 <scheduler+0x49>
80103d36:	03 50 7c             	add    0x7c(%eax),%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d39:	05 84 00 00 00       	add    $0x84,%eax
80103d3e:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
80103d43:	72 eb                	jb     80103d30 <scheduler+0x40>
    if(totnumtic == 0) goto no_runnable;
80103d45:	85 d2                	test   %edx,%edx
80103d47:	74 7d                	je     80103dc6 <scheduler+0xd6>
    long drawn_ticket = random_at_most(totnumtic);
80103d49:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103d4c:	bf 54 c7 14 80       	mov    $0x8014c754,%edi
    long drawn_ticket = random_at_most(totnumtic);
80103d51:	52                   	push   %edx
80103d52:	e8 c9 39 00 00       	call   80107720 <random_at_most>
80103d57:	83 c4 10             	add    $0x10,%esp
    uint ct = 0;
80103d5a:	31 d2                	xor    %edx,%edx
80103d5c:	eb 10                	jmp    80103d6e <scheduler+0x7e>
80103d5e:	66 90                	xchg   %ax,%ax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103d60:	81 c7 84 00 00 00    	add    $0x84,%edi
80103d66:	81 ff 54 e8 14 80    	cmp    $0x8014e854,%edi
80103d6c:	73 58                	jae    80103dc6 <scheduler+0xd6>
      if(p->state != RUNNABLE) continue;
80103d6e:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103d72:	75 ec                	jne    80103d60 <scheduler+0x70>
      ct += p->tickets;
80103d74:	03 57 7c             	add    0x7c(%edi),%edx
      if(ct > drawn_ticket) goto found; 
80103d77:	39 d0                	cmp    %edx,%eax
80103d79:	73 e5                	jae    80103d60 <scheduler+0x70>
    switchuvm(p);
80103d7b:	83 ec 0c             	sub    $0xc,%esp
    c->proc = p;
80103d7e:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
    p->ticks++; 
80103d84:	83 87 80 00 00 00 01 	addl   $0x1,0x80(%edi)
    switchuvm(p);
80103d8b:	57                   	push   %edi
80103d8c:	e8 5f 31 00 00       	call   80106ef0 <switchuvm>
    swtch(&(c->scheduler), p->context);
80103d91:	58                   	pop    %eax
80103d92:	5a                   	pop    %edx
80103d93:	ff 77 1c             	pushl  0x1c(%edi)
80103d96:	56                   	push   %esi
    p->state = RUNNING;
80103d97:	c7 47 0c 04 00 00 00 	movl   $0x4,0xc(%edi)
    swtch(&(c->scheduler), p->context);
80103d9e:	e8 58 0d 00 00       	call   80104afb <swtch>
    switchkvm();
80103da3:	e8 28 31 00 00       	call   80106ed0 <switchkvm>
    c->proc = 0;
80103da8:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103daf:	00 00 00 
    release(&ptable.lock);
80103db2:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103db9:	e8 a2 0a 00 00       	call   80104860 <release>
80103dbe:	83 c4 10             	add    $0x10,%esp
80103dc1:	e9 4a ff ff ff       	jmp    80103d10 <scheduler+0x20>
    release(&ptable.lock);
80103dc6:	83 ec 0c             	sub    $0xc,%esp
80103dc9:	68 20 c7 14 80       	push   $0x8014c720
80103dce:	e8 8d 0a 00 00       	call   80104860 <release>
    continue;
80103dd3:	83 c4 10             	add    $0x10,%esp
80103dd6:	e9 35 ff ff ff       	jmp    80103d10 <scheduler+0x20>
80103ddb:	90                   	nop
80103ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103de0 <sched>:
{
80103de0:	55                   	push   %ebp
80103de1:	89 e5                	mov    %esp,%ebp
80103de3:	56                   	push   %esi
80103de4:	53                   	push   %ebx
  pushcli();
80103de5:	e8 16 09 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103dea:	e8 b1 fb ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103def:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103df5:	e8 06 0a 00 00       	call   80104800 <popcli>
  if(!holding(&ptable.lock))
80103dfa:	83 ec 0c             	sub    $0xc,%esp
80103dfd:	68 20 c7 14 80       	push   $0x8014c720
80103e02:	e8 b9 08 00 00       	call   801046c0 <holding>
80103e07:	83 c4 10             	add    $0x10,%esp
80103e0a:	85 c0                	test   %eax,%eax
80103e0c:	74 4f                	je     80103e5d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103e0e:	e8 8d fb ff ff       	call   801039a0 <mycpu>
80103e13:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103e1a:	75 68                	jne    80103e84 <sched+0xa4>
  if(p->state == RUNNING)
80103e1c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103e20:	74 55                	je     80103e77 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103e22:	9c                   	pushf  
80103e23:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103e24:	f6 c4 02             	test   $0x2,%ah
80103e27:	75 41                	jne    80103e6a <sched+0x8a>
  intena = mycpu()->intena;
80103e29:	e8 72 fb ff ff       	call   801039a0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103e2e:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103e31:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103e37:	e8 64 fb ff ff       	call   801039a0 <mycpu>
80103e3c:	83 ec 08             	sub    $0x8,%esp
80103e3f:	ff 70 04             	pushl  0x4(%eax)
80103e42:	53                   	push   %ebx
80103e43:	e8 b3 0c 00 00       	call   80104afb <swtch>
  mycpu()->intena = intena;
80103e48:	e8 53 fb ff ff       	call   801039a0 <mycpu>
}
80103e4d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103e50:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103e56:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e59:	5b                   	pop    %ebx
80103e5a:	5e                   	pop    %esi
80103e5b:	5d                   	pop    %ebp
80103e5c:	c3                   	ret    
    panic("sched ptable.lock");
80103e5d:	83 ec 0c             	sub    $0xc,%esp
80103e60:	68 10 7d 10 80       	push   $0x80107d10
80103e65:	e8 26 c5 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103e6a:	83 ec 0c             	sub    $0xc,%esp
80103e6d:	68 3c 7d 10 80       	push   $0x80107d3c
80103e72:	e8 19 c5 ff ff       	call   80100390 <panic>
    panic("sched running");
80103e77:	83 ec 0c             	sub    $0xc,%esp
80103e7a:	68 2e 7d 10 80       	push   $0x80107d2e
80103e7f:	e8 0c c5 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103e84:	83 ec 0c             	sub    $0xc,%esp
80103e87:	68 22 7d 10 80       	push   $0x80107d22
80103e8c:	e8 ff c4 ff ff       	call   80100390 <panic>
80103e91:	eb 0d                	jmp    80103ea0 <exit>
80103e93:	90                   	nop
80103e94:	90                   	nop
80103e95:	90                   	nop
80103e96:	90                   	nop
80103e97:	90                   	nop
80103e98:	90                   	nop
80103e99:	90                   	nop
80103e9a:	90                   	nop
80103e9b:	90                   	nop
80103e9c:	90                   	nop
80103e9d:	90                   	nop
80103e9e:	90                   	nop
80103e9f:	90                   	nop

80103ea0 <exit>:
{
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	57                   	push   %edi
80103ea4:	56                   	push   %esi
80103ea5:	53                   	push   %ebx
80103ea6:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103ea9:	e8 52 08 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103eae:	e8 ed fa ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103eb3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103eb9:	e8 42 09 00 00       	call   80104800 <popcli>
  if(curproc == initproc)
80103ebe:	39 35 b8 b5 10 80    	cmp    %esi,0x8010b5b8
80103ec4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103ec7:	8d 7e 68             	lea    0x68(%esi),%edi
80103eca:	0f 84 f1 00 00 00    	je     80103fc1 <exit+0x121>
    if(curproc->ofile[fd]){
80103ed0:	8b 03                	mov    (%ebx),%eax
80103ed2:	85 c0                	test   %eax,%eax
80103ed4:	74 12                	je     80103ee8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103ed6:	83 ec 0c             	sub    $0xc,%esp
80103ed9:	50                   	push   %eax
80103eda:	e8 61 cf ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
80103edf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103ee5:	83 c4 10             	add    $0x10,%esp
80103ee8:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103eeb:	39 fb                	cmp    %edi,%ebx
80103eed:	75 e1                	jne    80103ed0 <exit+0x30>
  begin_op();
80103eef:	e8 ec ee ff ff       	call   80102de0 <begin_op>
  iput(curproc->cwd);
80103ef4:	83 ec 0c             	sub    $0xc,%esp
80103ef7:	ff 76 68             	pushl  0x68(%esi)
80103efa:	e8 c1 d8 ff ff       	call   801017c0 <iput>
  end_op();
80103eff:	e8 4c ef ff ff       	call   80102e50 <end_op>
  curproc->cwd = 0;
80103f04:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103f0b:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80103f12:	e8 29 08 00 00       	call   80104740 <acquire>
  wakeup1(curproc->parent);
80103f17:	8b 56 14             	mov    0x14(%esi),%edx
80103f1a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f1d:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
80103f22:	eb 10                	jmp    80103f34 <exit+0x94>
80103f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f28:	05 84 00 00 00       	add    $0x84,%eax
80103f2d:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
80103f32:	73 1e                	jae    80103f52 <exit+0xb2>
    if(p->state == SLEEPING && p->chan == chan)
80103f34:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f38:	75 ee                	jne    80103f28 <exit+0x88>
80103f3a:	3b 50 20             	cmp    0x20(%eax),%edx
80103f3d:	75 e9                	jne    80103f28 <exit+0x88>
      p->state = RUNNABLE;
80103f3f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f46:	05 84 00 00 00       	add    $0x84,%eax
80103f4b:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
80103f50:	72 e2                	jb     80103f34 <exit+0x94>
      p->parent = initproc;
80103f52:	8b 0d b8 b5 10 80    	mov    0x8010b5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f58:	ba 54 c7 14 80       	mov    $0x8014c754,%edx
80103f5d:	eb 0f                	jmp    80103f6e <exit+0xce>
80103f5f:	90                   	nop
80103f60:	81 c2 84 00 00 00    	add    $0x84,%edx
80103f66:	81 fa 54 e8 14 80    	cmp    $0x8014e854,%edx
80103f6c:	73 3a                	jae    80103fa8 <exit+0x108>
    if(p->parent == curproc){
80103f6e:	39 72 14             	cmp    %esi,0x14(%edx)
80103f71:	75 ed                	jne    80103f60 <exit+0xc0>
      if(p->state == ZOMBIE)
80103f73:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103f77:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103f7a:	75 e4                	jne    80103f60 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f7c:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
80103f81:	eb 11                	jmp    80103f94 <exit+0xf4>
80103f83:	90                   	nop
80103f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f88:	05 84 00 00 00       	add    $0x84,%eax
80103f8d:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
80103f92:	73 cc                	jae    80103f60 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103f94:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f98:	75 ee                	jne    80103f88 <exit+0xe8>
80103f9a:	3b 48 20             	cmp    0x20(%eax),%ecx
80103f9d:	75 e9                	jne    80103f88 <exit+0xe8>
      p->state = RUNNABLE;
80103f9f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fa6:	eb e0                	jmp    80103f88 <exit+0xe8>
  curproc->state = ZOMBIE;
80103fa8:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103faf:	e8 2c fe ff ff       	call   80103de0 <sched>
  panic("zombie exit");
80103fb4:	83 ec 0c             	sub    $0xc,%esp
80103fb7:	68 5d 7d 10 80       	push   $0x80107d5d
80103fbc:	e8 cf c3 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103fc1:	83 ec 0c             	sub    $0xc,%esp
80103fc4:	68 50 7d 10 80       	push   $0x80107d50
80103fc9:	e8 c2 c3 ff ff       	call   80100390 <panic>
80103fce:	66 90                	xchg   %ax,%ax

80103fd0 <yield>:
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	53                   	push   %ebx
80103fd4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103fd7:	68 20 c7 14 80       	push   $0x8014c720
80103fdc:	e8 5f 07 00 00       	call   80104740 <acquire>
  pushcli();
80103fe1:	e8 1a 07 00 00       	call   80104700 <pushcli>
  c = mycpu();
80103fe6:	e8 b5 f9 ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80103feb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ff1:	e8 0a 08 00 00       	call   80104800 <popcli>
  myproc()->state = RUNNABLE;
80103ff6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103ffd:	e8 de fd ff ff       	call   80103de0 <sched>
  release(&ptable.lock);
80104002:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
80104009:	e8 52 08 00 00       	call   80104860 <release>
}
8010400e:	83 c4 10             	add    $0x10,%esp
80104011:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104014:	c9                   	leave  
80104015:	c3                   	ret    
80104016:	8d 76 00             	lea    0x0(%esi),%esi
80104019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104020 <sleep>:
{
80104020:	55                   	push   %ebp
80104021:	89 e5                	mov    %esp,%ebp
80104023:	57                   	push   %edi
80104024:	56                   	push   %esi
80104025:	53                   	push   %ebx
80104026:	83 ec 0c             	sub    $0xc,%esp
80104029:	8b 7d 08             	mov    0x8(%ebp),%edi
8010402c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
8010402f:	e8 cc 06 00 00       	call   80104700 <pushcli>
  c = mycpu();
80104034:	e8 67 f9 ff ff       	call   801039a0 <mycpu>
  p = c->proc;
80104039:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010403f:	e8 bc 07 00 00       	call   80104800 <popcli>
  if(p == 0)
80104044:	85 db                	test   %ebx,%ebx
80104046:	0f 84 87 00 00 00    	je     801040d3 <sleep+0xb3>
  if(lk == 0)
8010404c:	85 f6                	test   %esi,%esi
8010404e:	74 76                	je     801040c6 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104050:	81 fe 20 c7 14 80    	cmp    $0x8014c720,%esi
80104056:	74 50                	je     801040a8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80104058:	83 ec 0c             	sub    $0xc,%esp
8010405b:	68 20 c7 14 80       	push   $0x8014c720
80104060:	e8 db 06 00 00       	call   80104740 <acquire>
    release(lk);
80104065:	89 34 24             	mov    %esi,(%esp)
80104068:	e8 f3 07 00 00       	call   80104860 <release>
  p->chan = chan;
8010406d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80104070:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80104077:	e8 64 fd ff ff       	call   80103de0 <sched>
  p->chan = 0;
8010407c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80104083:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
8010408a:	e8 d1 07 00 00       	call   80104860 <release>
    acquire(lk);
8010408f:	89 75 08             	mov    %esi,0x8(%ebp)
80104092:	83 c4 10             	add    $0x10,%esp
}
80104095:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104098:	5b                   	pop    %ebx
80104099:	5e                   	pop    %esi
8010409a:	5f                   	pop    %edi
8010409b:	5d                   	pop    %ebp
    acquire(lk);
8010409c:	e9 9f 06 00 00       	jmp    80104740 <acquire>
801040a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
801040a8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
801040ab:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
801040b2:	e8 29 fd ff ff       	call   80103de0 <sched>
  p->chan = 0;
801040b7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
801040be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040c1:	5b                   	pop    %ebx
801040c2:	5e                   	pop    %esi
801040c3:	5f                   	pop    %edi
801040c4:	5d                   	pop    %ebp
801040c5:	c3                   	ret    
    panic("sleep without lk");
801040c6:	83 ec 0c             	sub    $0xc,%esp
801040c9:	68 6f 7d 10 80       	push   $0x80107d6f
801040ce:	e8 bd c2 ff ff       	call   80100390 <panic>
    panic("sleep");
801040d3:	83 ec 0c             	sub    $0xc,%esp
801040d6:	68 69 7d 10 80       	push   $0x80107d69
801040db:	e8 b0 c2 ff ff       	call   80100390 <panic>

801040e0 <wait>:
{
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	56                   	push   %esi
801040e4:	53                   	push   %ebx
  pushcli();
801040e5:	e8 16 06 00 00       	call   80104700 <pushcli>
  c = mycpu();
801040ea:	e8 b1 f8 ff ff       	call   801039a0 <mycpu>
  p = c->proc;
801040ef:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801040f5:	e8 06 07 00 00       	call   80104800 <popcli>
  acquire(&ptable.lock);
801040fa:	83 ec 0c             	sub    $0xc,%esp
801040fd:	68 20 c7 14 80       	push   $0x8014c720
80104102:	e8 39 06 00 00       	call   80104740 <acquire>
80104107:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
8010410a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010410c:	bb 54 c7 14 80       	mov    $0x8014c754,%ebx
80104111:	eb 13                	jmp    80104126 <wait+0x46>
80104113:	90                   	nop
80104114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104118:	81 c3 84 00 00 00    	add    $0x84,%ebx
8010411e:	81 fb 54 e8 14 80    	cmp    $0x8014e854,%ebx
80104124:	73 1e                	jae    80104144 <wait+0x64>
      if(p->parent != curproc)
80104126:	39 73 14             	cmp    %esi,0x14(%ebx)
80104129:	75 ed                	jne    80104118 <wait+0x38>
      if(p->state == ZOMBIE){
8010412b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010412f:	74 37                	je     80104168 <wait+0x88>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104131:	81 c3 84 00 00 00    	add    $0x84,%ebx
      havekids = 1;
80104137:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010413c:	81 fb 54 e8 14 80    	cmp    $0x8014e854,%ebx
80104142:	72 e2                	jb     80104126 <wait+0x46>
    if(!havekids || curproc->killed){
80104144:	85 c0                	test   %eax,%eax
80104146:	74 76                	je     801041be <wait+0xde>
80104148:	8b 46 24             	mov    0x24(%esi),%eax
8010414b:	85 c0                	test   %eax,%eax
8010414d:	75 6f                	jne    801041be <wait+0xde>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
8010414f:	83 ec 08             	sub    $0x8,%esp
80104152:	68 20 c7 14 80       	push   $0x8014c720
80104157:	56                   	push   %esi
80104158:	e8 c3 fe ff ff       	call   80104020 <sleep>
    havekids = 0;
8010415d:	83 c4 10             	add    $0x10,%esp
80104160:	eb a8                	jmp    8010410a <wait+0x2a>
80104162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104168:	83 ec 0c             	sub    $0xc,%esp
8010416b:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
8010416e:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104171:	e8 aa e1 ff ff       	call   80102320 <kfree>
        freevm(p->pgdir);
80104176:	5a                   	pop    %edx
80104177:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
8010417a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104181:	e8 0a 31 00 00       	call   80107290 <freevm>
        release(&ptable.lock);
80104186:	c7 04 24 20 c7 14 80 	movl   $0x8014c720,(%esp)
        p->pid = 0;
8010418d:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80104194:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
8010419b:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
8010419f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801041a6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801041ad:	e8 ae 06 00 00       	call   80104860 <release>
        return pid;
801041b2:	83 c4 10             	add    $0x10,%esp
}
801041b5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041b8:	89 f0                	mov    %esi,%eax
801041ba:	5b                   	pop    %ebx
801041bb:	5e                   	pop    %esi
801041bc:	5d                   	pop    %ebp
801041bd:	c3                   	ret    
      release(&ptable.lock);
801041be:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801041c1:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
801041c6:	68 20 c7 14 80       	push   $0x8014c720
801041cb:	e8 90 06 00 00       	call   80104860 <release>
      return -1;
801041d0:	83 c4 10             	add    $0x10,%esp
801041d3:	eb e0                	jmp    801041b5 <wait+0xd5>
801041d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801041d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041e0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	53                   	push   %ebx
801041e4:	83 ec 10             	sub    $0x10,%esp
801041e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801041ea:	68 20 c7 14 80       	push   $0x8014c720
801041ef:	e8 4c 05 00 00       	call   80104740 <acquire>
801041f4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801041f7:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
801041fc:	eb 0e                	jmp    8010420c <wakeup+0x2c>
801041fe:	66 90                	xchg   %ax,%ax
80104200:	05 84 00 00 00       	add    $0x84,%eax
80104205:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
8010420a:	73 1e                	jae    8010422a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
8010420c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104210:	75 ee                	jne    80104200 <wakeup+0x20>
80104212:	3b 58 20             	cmp    0x20(%eax),%ebx
80104215:	75 e9                	jne    80104200 <wakeup+0x20>
      p->state = RUNNABLE;
80104217:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010421e:	05 84 00 00 00       	add    $0x84,%eax
80104223:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
80104228:	72 e2                	jb     8010420c <wakeup+0x2c>
  wakeup1(chan);
  release(&ptable.lock);
8010422a:	c7 45 08 20 c7 14 80 	movl   $0x8014c720,0x8(%ebp)
}
80104231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104234:	c9                   	leave  
  release(&ptable.lock);
80104235:	e9 26 06 00 00       	jmp    80104860 <release>
8010423a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104240 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	53                   	push   %ebx
80104244:	83 ec 10             	sub    $0x10,%esp
80104247:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010424a:	68 20 c7 14 80       	push   $0x8014c720
8010424f:	e8 ec 04 00 00       	call   80104740 <acquire>
80104254:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104257:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
8010425c:	eb 0e                	jmp    8010426c <kill+0x2c>
8010425e:	66 90                	xchg   %ax,%ax
80104260:	05 84 00 00 00       	add    $0x84,%eax
80104265:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
8010426a:	73 34                	jae    801042a0 <kill+0x60>
    if(p->pid == pid){
8010426c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010426f:	75 ef                	jne    80104260 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104271:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104275:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010427c:	75 07                	jne    80104285 <kill+0x45>
        p->state = RUNNABLE;
8010427e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104285:	83 ec 0c             	sub    $0xc,%esp
80104288:	68 20 c7 14 80       	push   $0x8014c720
8010428d:	e8 ce 05 00 00       	call   80104860 <release>
      return 0;
80104292:	83 c4 10             	add    $0x10,%esp
80104295:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104297:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010429a:	c9                   	leave  
8010429b:	c3                   	ret    
8010429c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
801042a0:	83 ec 0c             	sub    $0xc,%esp
801042a3:	68 20 c7 14 80       	push   $0x8014c720
801042a8:	e8 b3 05 00 00       	call   80104860 <release>
  return -1;
801042ad:	83 c4 10             	add    $0x10,%esp
801042b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801042b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042b8:	c9                   	leave  
801042b9:	c3                   	ret    
801042ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801042c0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	57                   	push   %edi
801042c4:	56                   	push   %esi
801042c5:	53                   	push   %ebx
801042c6:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801042c9:	bb 54 c7 14 80       	mov    $0x8014c754,%ebx
{
801042ce:	83 ec 3c             	sub    $0x3c,%esp
801042d1:	eb 27                	jmp    801042fa <procdump+0x3a>
801042d3:	90                   	nop
801042d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801042d8:	83 ec 0c             	sub    $0xc,%esp
801042db:	68 b9 7d 10 80       	push   $0x80107db9
801042e0:	e8 7b c3 ff ff       	call   80100660 <cprintf>
801042e5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801042e8:	81 c3 84 00 00 00    	add    $0x84,%ebx
801042ee:	81 fb 54 e8 14 80    	cmp    $0x8014e854,%ebx
801042f4:	0f 83 86 00 00 00    	jae    80104380 <procdump+0xc0>
    if(p->state == UNUSED)
801042fa:	8b 43 0c             	mov    0xc(%ebx),%eax
801042fd:	85 c0                	test   %eax,%eax
801042ff:	74 e7                	je     801042e8 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104301:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104304:	ba 80 7d 10 80       	mov    $0x80107d80,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104309:	77 11                	ja     8010431c <procdump+0x5c>
8010430b:	8b 14 85 38 7e 10 80 	mov    -0x7fef81c8(,%eax,4),%edx
      state = "???";
80104312:	b8 80 7d 10 80       	mov    $0x80107d80,%eax
80104317:	85 d2                	test   %edx,%edx
80104319:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
8010431c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010431f:	50                   	push   %eax
80104320:	52                   	push   %edx
80104321:	ff 73 10             	pushl  0x10(%ebx)
80104324:	68 84 7d 10 80       	push   $0x80107d84
80104329:	e8 32 c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010432e:	83 c4 10             	add    $0x10,%esp
80104331:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104335:	75 a1                	jne    801042d8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104337:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010433a:	83 ec 08             	sub    $0x8,%esp
8010433d:	8d 7d c0             	lea    -0x40(%ebp),%edi
80104340:	50                   	push   %eax
80104341:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104344:	8b 40 0c             	mov    0xc(%eax),%eax
80104347:	83 c0 08             	add    $0x8,%eax
8010434a:	50                   	push   %eax
8010434b:	e8 20 03 00 00       	call   80104670 <getcallerpcs>
80104350:	83 c4 10             	add    $0x10,%esp
80104353:	90                   	nop
80104354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104358:	8b 17                	mov    (%edi),%edx
8010435a:	85 d2                	test   %edx,%edx
8010435c:	0f 84 76 ff ff ff    	je     801042d8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104362:	83 ec 08             	sub    $0x8,%esp
80104365:	83 c7 04             	add    $0x4,%edi
80104368:	52                   	push   %edx
80104369:	68 a1 77 10 80       	push   $0x801077a1
8010436e:	e8 ed c2 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104373:	83 c4 10             	add    $0x10,%esp
80104376:	39 fe                	cmp    %edi,%esi
80104378:	75 de                	jne    80104358 <procdump+0x98>
8010437a:	e9 59 ff ff ff       	jmp    801042d8 <procdump+0x18>
8010437f:	90                   	nop
  }
}
80104380:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104383:	5b                   	pop    %ebx
80104384:	5e                   	pop    %esi
80104385:	5f                   	pop    %edi
80104386:	5d                   	pop    %ebp
80104387:	c3                   	ret    
80104388:	90                   	nop
80104389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104390 <gpi>:



void 
gpi(struct processes_info* spi)
{
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	56                   	push   %esi
80104394:	53                   	push   %ebx
80104395:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;
  int i = 0;

  acquire(&ptable.lock);
80104398:	83 ec 0c             	sub    $0xc,%esp
8010439b:	68 20 c7 14 80       	push   $0x8014c720
801043a0:	e8 9b 03 00 00       	call   80104740 <acquire>
801043a5:	83 c4 10             	add    $0x10,%esp
  int i = 0;
801043a8:	31 c9                	xor    %ecx,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801043aa:	b8 54 c7 14 80       	mov    $0x8014c754,%eax
801043af:	90                   	nop
    if(p->state == UNUSED) continue;
801043b0:	8b 50 0c             	mov    0xc(%eax),%edx
801043b3:	85 d2                	test   %edx,%edx
801043b5:	74 21                	je     801043d8 <gpi+0x48>

    spi->pids[i] = p->pid;
801043b7:	8b 70 10             	mov    0x10(%eax),%esi
801043ba:	8d 14 8b             	lea    (%ebx,%ecx,4),%edx
    spi->ticks[i] = p->ticks;
    spi->tickets[i] = p->tickets;

    i++;
801043bd:	83 c1 01             	add    $0x1,%ecx
    spi->pids[i] = p->pid;
801043c0:	89 72 04             	mov    %esi,0x4(%edx)
    spi->ticks[i] = p->ticks;
801043c3:	8b b0 80 00 00 00    	mov    0x80(%eax),%esi
801043c9:	89 b2 04 01 00 00    	mov    %esi,0x104(%edx)
    spi->tickets[i] = p->tickets;
801043cf:	8b 70 7c             	mov    0x7c(%eax),%esi
801043d2:	89 b2 04 02 00 00    	mov    %esi,0x204(%edx)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801043d8:	05 84 00 00 00       	add    $0x84,%eax
801043dd:	3d 54 e8 14 80       	cmp    $0x8014e854,%eax
801043e2:	72 cc                	jb     801043b0 <gpi+0x20>
  }
  spi->num_processes = i;
801043e4:	89 0b                	mov    %ecx,(%ebx)
  release(&ptable.lock);
801043e6:	c7 45 08 20 c7 14 80 	movl   $0x8014c720,0x8(%ebp)
}
801043ed:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043f0:	5b                   	pop    %ebx
801043f1:	5e                   	pop    %esi
801043f2:	5d                   	pop    %ebp
  release(&ptable.lock);
801043f3:	e9 68 04 00 00       	jmp    80104860 <release>
801043f8:	90                   	nop
801043f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104400 <dumppagetable>:




int 
dumppagetable(int pid) {
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	56                   	push   %esi
80104405:	53                   	push   %ebx

  struct proc *p; 

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104406:	bb 54 c7 14 80       	mov    $0x8014c754,%ebx
dumppagetable(int pid) {
8010440b:	83 ec 28             	sub    $0x28,%esp
8010440e:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&ptable.lock);
80104411:	68 20 c7 14 80       	push   $0x8014c720
80104416:	e8 25 03 00 00       	call   80104740 <acquire>
8010441b:	83 c4 10             	add    $0x10,%esp
8010441e:	eb 12                	jmp    80104432 <dumppagetable+0x32>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104420:	81 c3 84 00 00 00    	add    $0x84,%ebx
80104426:	81 fb 54 e8 14 80    	cmp    $0x8014e854,%ebx
8010442c:	0f 83 e6 00 00 00    	jae    80104518 <dumppagetable+0x118>
      if(p->pid == pid) goto found;
80104432:	39 73 10             	cmp    %esi,0x10(%ebx)
80104435:	75 e9                	jne    80104420 <dumppagetable+0x20>
  // pid_not_present
  release(&ptable.lock);
  return -1;

  found:
    release(&ptable.lock);
80104437:	83 ec 0c             	sub    $0xc,%esp
8010443a:	68 20 c7 14 80       	push   $0x8014c720
8010443f:	e8 1c 04 00 00       	call   80104860 <release>


  cprintf("START PAGE TABLE (pid %d)\n", pid); 
80104444:	58                   	pop    %eax
80104445:	5a                   	pop    %edx
80104446:	56                   	push   %esi
80104447:	68 93 7d 10 80       	push   $0x80107d93
8010444c:	e8 0f c2 ff ff       	call   80100660 <cprintf>

  // vpn present writable usermode ppn

  for(uint v = 0; v < PGROUNDUP(p->sz); v += PGSIZE) {
80104451:	8b 13                	mov    (%ebx),%edx
80104453:	83 c4 10             	add    $0x10,%esp
80104456:	8d 82 ff 0f 00 00    	lea    0xfff(%edx),%eax
8010445c:	a9 00 f0 ff ff       	test   $0xfffff000,%eax
80104461:	0f 84 91 00 00 00    	je     801044f8 <dumppagetable+0xf8>
80104467:	31 f6                	xor    %esi,%esi
80104469:	eb 5b                	jmp    801044c6 <dumppagetable+0xc6>
8010446b:	90                   	nop
8010446c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(!(*pte & PTE_P)) {
        cprintf("%x - - - - \n", (v / PGSIZE));
        continue;
      }

      cprintf("%x %s %s %s %x \n", (v / PGSIZE)
80104470:	89 c7                	mov    %eax,%edi
80104472:	b9 8d 7d 10 80       	mov    $0x80107d8d,%ecx
80104477:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010447d:	a8 04                	test   $0x4,%al
8010447f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80104482:	bf 8f 7d 10 80       	mov    $0x80107d8f,%edi
80104487:	0f 44 cf             	cmove  %edi,%ecx
8010448a:	a8 02                	test   $0x2,%al
8010448c:	b8 91 7d 10 80       	mov    $0x80107d91,%eax
80104491:	0f 44 c7             	cmove  %edi,%eax
80104494:	83 ec 08             	sub    $0x8,%esp
80104497:	ff 75 e4             	pushl  -0x1c(%ebp)
8010449a:	51                   	push   %ecx
8010449b:	50                   	push   %eax
8010449c:	68 98 7c 10 80       	push   $0x80107c98
801044a1:	52                   	push   %edx
801044a2:	68 bb 7d 10 80       	push   $0x80107dbb
801044a7:	e8 b4 c1 ff ff       	call   80100660 <cprintf>
801044ac:	83 c4 20             	add    $0x20,%esp
  for(uint v = 0; v < PGROUNDUP(p->sz); v += PGSIZE) {
801044af:	8b 13                	mov    (%ebx),%edx
801044b1:	81 c6 00 10 00 00    	add    $0x1000,%esi
801044b7:	8d 82 ff 0f 00 00    	lea    0xfff(%edx),%eax
801044bd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801044c2:	39 f0                	cmp    %esi,%eax
801044c4:	76 32                	jbe    801044f8 <dumppagetable+0xf8>
      pte_t* pte = walkpgdir(p->pgdir, (char*) v, 0);
801044c6:	83 ec 04             	sub    $0x4,%esp
801044c9:	6a 00                	push   $0x0
801044cb:	56                   	push   %esi
801044cc:	ff 73 04             	pushl  0x4(%ebx)
801044cf:	e8 1c 28 00 00       	call   80106cf0 <walkpgdir>
      if(!(*pte & PTE_P)) {
801044d4:	8b 00                	mov    (%eax),%eax
801044d6:	89 f2                	mov    %esi,%edx
801044d8:	83 c4 10             	add    $0x10,%esp
801044db:	c1 ea 0c             	shr    $0xc,%edx
801044de:	a8 01                	test   $0x1,%al
801044e0:	75 8e                	jne    80104470 <dumppagetable+0x70>
        cprintf("%x - - - - \n", (v / PGSIZE));
801044e2:	83 ec 08             	sub    $0x8,%esp
801044e5:	52                   	push   %edx
801044e6:	68 ae 7d 10 80       	push   $0x80107dae
801044eb:	e8 70 c1 ff ff       	call   80100660 <cprintf>
        continue;
801044f0:	83 c4 10             	add    $0x10,%esp
801044f3:	eb ba                	jmp    801044af <dumppagetable+0xaf>
801044f5:	8d 76 00             	lea    0x0(%esi),%esi
                                 , *pte & PTE_W ? "W" : "-"
                                 , *pte & PTE_U ? "U" : "-"
                                 , PTE_ADDR(*pte));
  }

  cprintf("END PAGE TABLE; sz = %d\n", p->sz);
801044f8:	83 ec 08             	sub    $0x8,%esp
801044fb:	52                   	push   %edx
801044fc:	68 cc 7d 10 80       	push   $0x80107dcc
80104501:	e8 5a c1 ff ff       	call   80100660 <cprintf>

  return 0;
80104506:	83 c4 10             	add    $0x10,%esp
80104509:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010450c:	31 c0                	xor    %eax,%eax
8010450e:	5b                   	pop    %ebx
8010450f:	5e                   	pop    %esi
80104510:	5f                   	pop    %edi
80104511:	5d                   	pop    %ebp
80104512:	c3                   	ret    
80104513:	90                   	nop
80104514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104518:	83 ec 0c             	sub    $0xc,%esp
8010451b:	68 20 c7 14 80       	push   $0x8014c720
80104520:	e8 3b 03 00 00       	call   80104860 <release>
  return -1;
80104525:	83 c4 10             	add    $0x10,%esp
80104528:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010452b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104530:	5b                   	pop    %ebx
80104531:	5e                   	pop    %esi
80104532:	5f                   	pop    %edi
80104533:	5d                   	pop    %ebp
80104534:	c3                   	ret    
80104535:	66 90                	xchg   %ax,%ax
80104537:	66 90                	xchg   %ax,%ax
80104539:	66 90                	xchg   %ax,%ax
8010453b:	66 90                	xchg   %ax,%ax
8010453d:	66 90                	xchg   %ax,%ax
8010453f:	90                   	nop

80104540 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	53                   	push   %ebx
80104544:	83 ec 0c             	sub    $0xc,%esp
80104547:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010454a:	68 50 7e 10 80       	push   $0x80107e50
8010454f:	8d 43 04             	lea    0x4(%ebx),%eax
80104552:	50                   	push   %eax
80104553:	e8 f8 00 00 00       	call   80104650 <initlock>
  lk->name = name;
80104558:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010455b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104561:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104564:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010456b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010456e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104571:	c9                   	leave  
80104572:	c3                   	ret    
80104573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104580 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104580:	55                   	push   %ebp
80104581:	89 e5                	mov    %esp,%ebp
80104583:	56                   	push   %esi
80104584:	53                   	push   %ebx
80104585:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104588:	83 ec 0c             	sub    $0xc,%esp
8010458b:	8d 73 04             	lea    0x4(%ebx),%esi
8010458e:	56                   	push   %esi
8010458f:	e8 ac 01 00 00       	call   80104740 <acquire>
  while (lk->locked) {
80104594:	8b 13                	mov    (%ebx),%edx
80104596:	83 c4 10             	add    $0x10,%esp
80104599:	85 d2                	test   %edx,%edx
8010459b:	74 16                	je     801045b3 <acquiresleep+0x33>
8010459d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801045a0:	83 ec 08             	sub    $0x8,%esp
801045a3:	56                   	push   %esi
801045a4:	53                   	push   %ebx
801045a5:	e8 76 fa ff ff       	call   80104020 <sleep>
  while (lk->locked) {
801045aa:	8b 03                	mov    (%ebx),%eax
801045ac:	83 c4 10             	add    $0x10,%esp
801045af:	85 c0                	test   %eax,%eax
801045b1:	75 ed                	jne    801045a0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801045b3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801045b9:	e8 82 f4 ff ff       	call   80103a40 <myproc>
801045be:	8b 40 10             	mov    0x10(%eax),%eax
801045c1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801045c4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801045c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801045ca:	5b                   	pop    %ebx
801045cb:	5e                   	pop    %esi
801045cc:	5d                   	pop    %ebp
  release(&lk->lk);
801045cd:	e9 8e 02 00 00       	jmp    80104860 <release>
801045d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045e0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	56                   	push   %esi
801045e4:	53                   	push   %ebx
801045e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801045e8:	83 ec 0c             	sub    $0xc,%esp
801045eb:	8d 73 04             	lea    0x4(%ebx),%esi
801045ee:	56                   	push   %esi
801045ef:	e8 4c 01 00 00       	call   80104740 <acquire>
  lk->locked = 0;
801045f4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801045fa:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104601:	89 1c 24             	mov    %ebx,(%esp)
80104604:	e8 d7 fb ff ff       	call   801041e0 <wakeup>
  release(&lk->lk);
80104609:	89 75 08             	mov    %esi,0x8(%ebp)
8010460c:	83 c4 10             	add    $0x10,%esp
}
8010460f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104612:	5b                   	pop    %ebx
80104613:	5e                   	pop    %esi
80104614:	5d                   	pop    %ebp
  release(&lk->lk);
80104615:	e9 46 02 00 00       	jmp    80104860 <release>
8010461a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104620 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	56                   	push   %esi
80104624:	53                   	push   %ebx
80104625:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104628:	83 ec 0c             	sub    $0xc,%esp
8010462b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010462e:	53                   	push   %ebx
8010462f:	e8 0c 01 00 00       	call   80104740 <acquire>
  r = lk->locked;
80104634:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104636:	89 1c 24             	mov    %ebx,(%esp)
80104639:	e8 22 02 00 00       	call   80104860 <release>
  return r;
}
8010463e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104641:	89 f0                	mov    %esi,%eax
80104643:	5b                   	pop    %ebx
80104644:	5e                   	pop    %esi
80104645:	5d                   	pop    %ebp
80104646:	c3                   	ret    
80104647:	66 90                	xchg   %ax,%ax
80104649:	66 90                	xchg   %ax,%ax
8010464b:	66 90                	xchg   %ax,%ax
8010464d:	66 90                	xchg   %ax,%ax
8010464f:	90                   	nop

80104650 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104656:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104659:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010465f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80104662:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104669:	5d                   	pop    %ebp
8010466a:	c3                   	ret    
8010466b:	90                   	nop
8010466c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104670 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104670:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104671:	31 d2                	xor    %edx,%edx
{
80104673:	89 e5                	mov    %esp,%ebp
80104675:	53                   	push   %ebx
  ebp = (uint*)v - 2;
80104676:	8b 45 08             	mov    0x8(%ebp),%eax
{
80104679:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
8010467c:	83 e8 08             	sub    $0x8,%eax
8010467f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104680:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104686:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010468c:	77 1a                	ja     801046a8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010468e:	8b 58 04             	mov    0x4(%eax),%ebx
80104691:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
80104694:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80104697:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80104699:	83 fa 0a             	cmp    $0xa,%edx
8010469c:	75 e2                	jne    80104680 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010469e:	5b                   	pop    %ebx
8010469f:	5d                   	pop    %ebp
801046a0:	c3                   	ret    
801046a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046a8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801046ab:	83 c1 28             	add    $0x28,%ecx
801046ae:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
801046b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801046b6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801046b9:	39 c1                	cmp    %eax,%ecx
801046bb:	75 f3                	jne    801046b0 <getcallerpcs+0x40>
}
801046bd:	5b                   	pop    %ebx
801046be:	5d                   	pop    %ebp
801046bf:	c3                   	ret    

801046c0 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	53                   	push   %ebx
801046c4:	83 ec 04             	sub    $0x4,%esp
801046c7:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
801046ca:	8b 02                	mov    (%edx),%eax
801046cc:	85 c0                	test   %eax,%eax
801046ce:	75 10                	jne    801046e0 <holding+0x20>
}
801046d0:	83 c4 04             	add    $0x4,%esp
801046d3:	31 c0                	xor    %eax,%eax
801046d5:	5b                   	pop    %ebx
801046d6:	5d                   	pop    %ebp
801046d7:	c3                   	ret    
801046d8:	90                   	nop
801046d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return lock->locked && lock->cpu == mycpu();
801046e0:	8b 5a 08             	mov    0x8(%edx),%ebx
801046e3:	e8 b8 f2 ff ff       	call   801039a0 <mycpu>
801046e8:	39 c3                	cmp    %eax,%ebx
801046ea:	0f 94 c0             	sete   %al
}
801046ed:	83 c4 04             	add    $0x4,%esp
  return lock->locked && lock->cpu == mycpu();
801046f0:	0f b6 c0             	movzbl %al,%eax
}
801046f3:	5b                   	pop    %ebx
801046f4:	5d                   	pop    %ebp
801046f5:	c3                   	ret    
801046f6:	8d 76 00             	lea    0x0(%esi),%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104700 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104700:	55                   	push   %ebp
80104701:	89 e5                	mov    %esp,%ebp
80104703:	53                   	push   %ebx
80104704:	83 ec 04             	sub    $0x4,%esp
80104707:	9c                   	pushf  
80104708:	5b                   	pop    %ebx
  asm volatile("cli");
80104709:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010470a:	e8 91 f2 ff ff       	call   801039a0 <mycpu>
8010470f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104715:	85 c0                	test   %eax,%eax
80104717:	75 11                	jne    8010472a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104719:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010471f:	e8 7c f2 ff ff       	call   801039a0 <mycpu>
80104724:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010472a:	e8 71 f2 ff ff       	call   801039a0 <mycpu>
8010472f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104736:	83 c4 04             	add    $0x4,%esp
80104739:	5b                   	pop    %ebx
8010473a:	5d                   	pop    %ebp
8010473b:	c3                   	ret    
8010473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104740 <acquire>:
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	56                   	push   %esi
80104744:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80104745:	e8 b6 ff ff ff       	call   80104700 <pushcli>
  if(holding(lk))
8010474a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return lock->locked && lock->cpu == mycpu();
8010474d:	8b 03                	mov    (%ebx),%eax
8010474f:	85 c0                	test   %eax,%eax
80104751:	0f 85 81 00 00 00    	jne    801047d8 <acquire+0x98>
  asm volatile("lock; xchgl %0, %1" :
80104757:	ba 01 00 00 00       	mov    $0x1,%edx
8010475c:	eb 05                	jmp    80104763 <acquire+0x23>
8010475e:	66 90                	xchg   %ax,%ax
80104760:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104763:	89 d0                	mov    %edx,%eax
80104765:	f0 87 03             	lock xchg %eax,(%ebx)
  while(xchg(&lk->locked, 1) != 0)
80104768:	85 c0                	test   %eax,%eax
8010476a:	75 f4                	jne    80104760 <acquire+0x20>
  __sync_synchronize();
8010476c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80104771:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104774:	e8 27 f2 ff ff       	call   801039a0 <mycpu>
  for(i = 0; i < 10; i++){
80104779:	31 d2                	xor    %edx,%edx
  getcallerpcs(&lk, lk->pcs);
8010477b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  lk->cpu = mycpu();
8010477e:	89 43 08             	mov    %eax,0x8(%ebx)
  ebp = (uint*)v - 2;
80104781:	89 e8                	mov    %ebp,%eax
80104783:	90                   	nop
80104784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104788:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010478e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104794:	77 1a                	ja     801047b0 <acquire+0x70>
    pcs[i] = ebp[1];     // saved %eip
80104796:	8b 58 04             	mov    0x4(%eax),%ebx
80104799:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
8010479c:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
8010479f:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801047a1:	83 fa 0a             	cmp    $0xa,%edx
801047a4:	75 e2                	jne    80104788 <acquire+0x48>
}
801047a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047a9:	5b                   	pop    %ebx
801047aa:	5e                   	pop    %esi
801047ab:	5d                   	pop    %ebp
801047ac:	c3                   	ret    
801047ad:	8d 76 00             	lea    0x0(%esi),%esi
801047b0:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801047b3:	83 c1 28             	add    $0x28,%ecx
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    pcs[i] = 0;
801047c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801047c6:	83 c0 04             	add    $0x4,%eax
  for(; i < 10; i++)
801047c9:	39 c8                	cmp    %ecx,%eax
801047cb:	75 f3                	jne    801047c0 <acquire+0x80>
}
801047cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047d0:	5b                   	pop    %ebx
801047d1:	5e                   	pop    %esi
801047d2:	5d                   	pop    %ebp
801047d3:	c3                   	ret    
801047d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return lock->locked && lock->cpu == mycpu();
801047d8:	8b 73 08             	mov    0x8(%ebx),%esi
801047db:	e8 c0 f1 ff ff       	call   801039a0 <mycpu>
801047e0:	39 c6                	cmp    %eax,%esi
801047e2:	0f 85 6f ff ff ff    	jne    80104757 <acquire+0x17>
    panic("acquire");
801047e8:	83 ec 0c             	sub    $0xc,%esp
801047eb:	68 5b 7e 10 80       	push   $0x80107e5b
801047f0:	e8 9b bb ff ff       	call   80100390 <panic>
801047f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104800 <popcli>:

void
popcli(void)
{
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104806:	9c                   	pushf  
80104807:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104808:	f6 c4 02             	test   $0x2,%ah
8010480b:	75 35                	jne    80104842 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010480d:	e8 8e f1 ff ff       	call   801039a0 <mycpu>
80104812:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104819:	78 34                	js     8010484f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010481b:	e8 80 f1 ff ff       	call   801039a0 <mycpu>
80104820:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104826:	85 d2                	test   %edx,%edx
80104828:	74 06                	je     80104830 <popcli+0x30>
    sti();
}
8010482a:	c9                   	leave  
8010482b:	c3                   	ret    
8010482c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104830:	e8 6b f1 ff ff       	call   801039a0 <mycpu>
80104835:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010483b:	85 c0                	test   %eax,%eax
8010483d:	74 eb                	je     8010482a <popcli+0x2a>
  asm volatile("sti");
8010483f:	fb                   	sti    
}
80104840:	c9                   	leave  
80104841:	c3                   	ret    
    panic("popcli - interruptible");
80104842:	83 ec 0c             	sub    $0xc,%esp
80104845:	68 63 7e 10 80       	push   $0x80107e63
8010484a:	e8 41 bb ff ff       	call   80100390 <panic>
    panic("popcli");
8010484f:	83 ec 0c             	sub    $0xc,%esp
80104852:	68 7a 7e 10 80       	push   $0x80107e7a
80104857:	e8 34 bb ff ff       	call   80100390 <panic>
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104860 <release>:
{
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	56                   	push   %esi
80104864:	53                   	push   %ebx
80104865:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return lock->locked && lock->cpu == mycpu();
80104868:	8b 03                	mov    (%ebx),%eax
8010486a:	85 c0                	test   %eax,%eax
8010486c:	74 0c                	je     8010487a <release+0x1a>
8010486e:	8b 73 08             	mov    0x8(%ebx),%esi
80104871:	e8 2a f1 ff ff       	call   801039a0 <mycpu>
80104876:	39 c6                	cmp    %eax,%esi
80104878:	74 16                	je     80104890 <release+0x30>
    panic("release");
8010487a:	83 ec 0c             	sub    $0xc,%esp
8010487d:	68 81 7e 10 80       	push   $0x80107e81
80104882:	e8 09 bb ff ff       	call   80100390 <panic>
80104887:	89 f6                	mov    %esi,%esi
80104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lk->pcs[0] = 0;
80104890:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104897:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
8010489e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801048a3:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801048a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048ac:	5b                   	pop    %ebx
801048ad:	5e                   	pop    %esi
801048ae:	5d                   	pop    %ebp
  popcli();
801048af:	e9 4c ff ff ff       	jmp    80104800 <popcli>
801048b4:	66 90                	xchg   %ax,%ax
801048b6:	66 90                	xchg   %ax,%ax
801048b8:	66 90                	xchg   %ax,%ax
801048ba:	66 90                	xchg   %ax,%ax
801048bc:	66 90                	xchg   %ax,%ax
801048be:	66 90                	xchg   %ax,%ax

801048c0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801048c0:	55                   	push   %ebp
801048c1:	89 e5                	mov    %esp,%ebp
801048c3:	57                   	push   %edi
801048c4:	53                   	push   %ebx
801048c5:	8b 55 08             	mov    0x8(%ebp),%edx
801048c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801048cb:	f6 c2 03             	test   $0x3,%dl
801048ce:	75 05                	jne    801048d5 <memset+0x15>
801048d0:	f6 c1 03             	test   $0x3,%cl
801048d3:	74 13                	je     801048e8 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
801048d5:	89 d7                	mov    %edx,%edi
801048d7:	8b 45 0c             	mov    0xc(%ebp),%eax
801048da:	fc                   	cld    
801048db:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
801048dd:	5b                   	pop    %ebx
801048de:	89 d0                	mov    %edx,%eax
801048e0:	5f                   	pop    %edi
801048e1:	5d                   	pop    %ebp
801048e2:	c3                   	ret    
801048e3:	90                   	nop
801048e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
801048e8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
801048ec:	c1 e9 02             	shr    $0x2,%ecx
801048ef:	89 f8                	mov    %edi,%eax
801048f1:	89 fb                	mov    %edi,%ebx
801048f3:	c1 e0 18             	shl    $0x18,%eax
801048f6:	c1 e3 10             	shl    $0x10,%ebx
801048f9:	09 d8                	or     %ebx,%eax
801048fb:	09 f8                	or     %edi,%eax
801048fd:	c1 e7 08             	shl    $0x8,%edi
80104900:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
80104902:	89 d7                	mov    %edx,%edi
80104904:	fc                   	cld    
80104905:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104907:	5b                   	pop    %ebx
80104908:	89 d0                	mov    %edx,%eax
8010490a:	5f                   	pop    %edi
8010490b:	5d                   	pop    %ebp
8010490c:	c3                   	ret    
8010490d:	8d 76 00             	lea    0x0(%esi),%esi

80104910 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	57                   	push   %edi
80104914:	56                   	push   %esi
80104915:	53                   	push   %ebx
80104916:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104919:	8b 75 08             	mov    0x8(%ebp),%esi
8010491c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010491f:	85 db                	test   %ebx,%ebx
80104921:	74 29                	je     8010494c <memcmp+0x3c>
    if(*s1 != *s2)
80104923:	0f b6 16             	movzbl (%esi),%edx
80104926:	0f b6 0f             	movzbl (%edi),%ecx
80104929:	38 d1                	cmp    %dl,%cl
8010492b:	75 2b                	jne    80104958 <memcmp+0x48>
8010492d:	b8 01 00 00 00       	mov    $0x1,%eax
80104932:	eb 14                	jmp    80104948 <memcmp+0x38>
80104934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104938:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010493c:	83 c0 01             	add    $0x1,%eax
8010493f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104944:	38 ca                	cmp    %cl,%dl
80104946:	75 10                	jne    80104958 <memcmp+0x48>
  while(n-- > 0){
80104948:	39 d8                	cmp    %ebx,%eax
8010494a:	75 ec                	jne    80104938 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010494c:	5b                   	pop    %ebx
  return 0;
8010494d:	31 c0                	xor    %eax,%eax
}
8010494f:	5e                   	pop    %esi
80104950:	5f                   	pop    %edi
80104951:	5d                   	pop    %ebp
80104952:	c3                   	ret    
80104953:	90                   	nop
80104954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return *s1 - *s2;
80104958:	0f b6 c2             	movzbl %dl,%eax
}
8010495b:	5b                   	pop    %ebx
      return *s1 - *s2;
8010495c:	29 c8                	sub    %ecx,%eax
}
8010495e:	5e                   	pop    %esi
8010495f:	5f                   	pop    %edi
80104960:	5d                   	pop    %ebp
80104961:	c3                   	ret    
80104962:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104970 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	56                   	push   %esi
80104974:	53                   	push   %ebx
80104975:	8b 45 08             	mov    0x8(%ebp),%eax
80104978:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010497b:	8b 75 10             	mov    0x10(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010497e:	39 c3                	cmp    %eax,%ebx
80104980:	73 26                	jae    801049a8 <memmove+0x38>
80104982:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104985:	39 c8                	cmp    %ecx,%eax
80104987:	73 1f                	jae    801049a8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
80104989:	85 f6                	test   %esi,%esi
8010498b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010498e:	74 0f                	je     8010499f <memmove+0x2f>
      *--d = *--s;
80104990:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104994:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    while(n-- > 0)
80104997:	83 ea 01             	sub    $0x1,%edx
8010499a:	83 fa ff             	cmp    $0xffffffff,%edx
8010499d:	75 f1                	jne    80104990 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
8010499f:	5b                   	pop    %ebx
801049a0:	5e                   	pop    %esi
801049a1:	5d                   	pop    %ebp
801049a2:	c3                   	ret    
801049a3:	90                   	nop
801049a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
801049a8:	31 d2                	xor    %edx,%edx
801049aa:	85 f6                	test   %esi,%esi
801049ac:	74 f1                	je     8010499f <memmove+0x2f>
801049ae:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
801049b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801049b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801049b7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
801049ba:	39 d6                	cmp    %edx,%esi
801049bc:	75 f2                	jne    801049b0 <memmove+0x40>
}
801049be:	5b                   	pop    %ebx
801049bf:	5e                   	pop    %esi
801049c0:	5d                   	pop    %ebp
801049c1:	c3                   	ret    
801049c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049d0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801049d0:	55                   	push   %ebp
801049d1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
801049d3:	5d                   	pop    %ebp
  return memmove(dst, src, n);
801049d4:	eb 9a                	jmp    80104970 <memmove>
801049d6:	8d 76 00             	lea    0x0(%esi),%esi
801049d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049e0 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	57                   	push   %edi
801049e4:	56                   	push   %esi
801049e5:	8b 7d 10             	mov    0x10(%ebp),%edi
801049e8:	53                   	push   %ebx
801049e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801049ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
801049ef:	85 ff                	test   %edi,%edi
801049f1:	74 2f                	je     80104a22 <strncmp+0x42>
801049f3:	0f b6 01             	movzbl (%ecx),%eax
801049f6:	0f b6 1e             	movzbl (%esi),%ebx
801049f9:	84 c0                	test   %al,%al
801049fb:	74 37                	je     80104a34 <strncmp+0x54>
801049fd:	38 c3                	cmp    %al,%bl
801049ff:	75 33                	jne    80104a34 <strncmp+0x54>
80104a01:	01 f7                	add    %esi,%edi
80104a03:	eb 13                	jmp    80104a18 <strncmp+0x38>
80104a05:	8d 76 00             	lea    0x0(%esi),%esi
80104a08:	0f b6 01             	movzbl (%ecx),%eax
80104a0b:	84 c0                	test   %al,%al
80104a0d:	74 21                	je     80104a30 <strncmp+0x50>
80104a0f:	0f b6 1a             	movzbl (%edx),%ebx
80104a12:	89 d6                	mov    %edx,%esi
80104a14:	38 d8                	cmp    %bl,%al
80104a16:	75 1c                	jne    80104a34 <strncmp+0x54>
    n--, p++, q++;
80104a18:	8d 56 01             	lea    0x1(%esi),%edx
80104a1b:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80104a1e:	39 fa                	cmp    %edi,%edx
80104a20:	75 e6                	jne    80104a08 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104a22:	5b                   	pop    %ebx
    return 0;
80104a23:	31 c0                	xor    %eax,%eax
}
80104a25:	5e                   	pop    %esi
80104a26:	5f                   	pop    %edi
80104a27:	5d                   	pop    %ebp
80104a28:	c3                   	ret    
80104a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a30:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
  return (uchar)*p - (uchar)*q;
80104a34:	29 d8                	sub    %ebx,%eax
}
80104a36:	5b                   	pop    %ebx
80104a37:	5e                   	pop    %esi
80104a38:	5f                   	pop    %edi
80104a39:	5d                   	pop    %ebp
80104a3a:	c3                   	ret    
80104a3b:	90                   	nop
80104a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a40 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104a40:	55                   	push   %ebp
80104a41:	89 e5                	mov    %esp,%ebp
80104a43:	56                   	push   %esi
80104a44:	53                   	push   %ebx
80104a45:	8b 45 08             	mov    0x8(%ebp),%eax
80104a48:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104a4b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104a4e:	89 c2                	mov    %eax,%edx
80104a50:	eb 19                	jmp    80104a6b <strncpy+0x2b>
80104a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a58:	83 c3 01             	add    $0x1,%ebx
80104a5b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104a5f:	83 c2 01             	add    $0x1,%edx
80104a62:	84 c9                	test   %cl,%cl
80104a64:	88 4a ff             	mov    %cl,-0x1(%edx)
80104a67:	74 09                	je     80104a72 <strncpy+0x32>
80104a69:	89 f1                	mov    %esi,%ecx
80104a6b:	85 c9                	test   %ecx,%ecx
80104a6d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104a70:	7f e6                	jg     80104a58 <strncpy+0x18>
    ;
  while(n-- > 0)
80104a72:	31 c9                	xor    %ecx,%ecx
80104a74:	85 f6                	test   %esi,%esi
80104a76:	7e 17                	jle    80104a8f <strncpy+0x4f>
80104a78:	90                   	nop
80104a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104a80:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104a84:	89 f3                	mov    %esi,%ebx
80104a86:	83 c1 01             	add    $0x1,%ecx
80104a89:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
80104a8b:	85 db                	test   %ebx,%ebx
80104a8d:	7f f1                	jg     80104a80 <strncpy+0x40>
  return os;
}
80104a8f:	5b                   	pop    %ebx
80104a90:	5e                   	pop    %esi
80104a91:	5d                   	pop    %ebp
80104a92:	c3                   	ret    
80104a93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104aa0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	56                   	push   %esi
80104aa4:	53                   	push   %ebx
80104aa5:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104aa8:	8b 45 08             	mov    0x8(%ebp),%eax
80104aab:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104aae:	85 c9                	test   %ecx,%ecx
80104ab0:	7e 26                	jle    80104ad8 <safestrcpy+0x38>
80104ab2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104ab6:	89 c1                	mov    %eax,%ecx
80104ab8:	eb 17                	jmp    80104ad1 <safestrcpy+0x31>
80104aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104ac0:	83 c2 01             	add    $0x1,%edx
80104ac3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104ac7:	83 c1 01             	add    $0x1,%ecx
80104aca:	84 db                	test   %bl,%bl
80104acc:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104acf:	74 04                	je     80104ad5 <safestrcpy+0x35>
80104ad1:	39 f2                	cmp    %esi,%edx
80104ad3:	75 eb                	jne    80104ac0 <safestrcpy+0x20>
    ;
  *s = 0;
80104ad5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104ad8:	5b                   	pop    %ebx
80104ad9:	5e                   	pop    %esi
80104ada:	5d                   	pop    %ebp
80104adb:	c3                   	ret    
80104adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104ae0 <strlen>:

int
strlen(const char *s)
{
80104ae0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104ae1:	31 c0                	xor    %eax,%eax
{
80104ae3:	89 e5                	mov    %esp,%ebp
80104ae5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104ae8:	80 3a 00             	cmpb   $0x0,(%edx)
80104aeb:	74 0c                	je     80104af9 <strlen+0x19>
80104aed:	8d 76 00             	lea    0x0(%esi),%esi
80104af0:	83 c0 01             	add    $0x1,%eax
80104af3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104af7:	75 f7                	jne    80104af0 <strlen+0x10>
    ;
  return n;
}
80104af9:	5d                   	pop    %ebp
80104afa:	c3                   	ret    

80104afb <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104afb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104aff:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104b03:	55                   	push   %ebp
  pushl %ebx
80104b04:	53                   	push   %ebx
  pushl %esi
80104b05:	56                   	push   %esi
  pushl %edi
80104b06:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104b07:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104b09:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
80104b0b:	5f                   	pop    %edi
  popl %esi
80104b0c:	5e                   	pop    %esi
  popl %ebx
80104b0d:	5b                   	pop    %ebx
  popl %ebp
80104b0e:	5d                   	pop    %ebp
  ret
80104b0f:	c3                   	ret    

80104b10 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	53                   	push   %ebx
80104b14:	83 ec 04             	sub    $0x4,%esp
80104b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104b1a:	e8 21 ef ff ff       	call   80103a40 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104b1f:	8b 00                	mov    (%eax),%eax
80104b21:	39 d8                	cmp    %ebx,%eax
80104b23:	76 1b                	jbe    80104b40 <fetchint+0x30>
80104b25:	8d 53 04             	lea    0x4(%ebx),%edx
80104b28:	39 d0                	cmp    %edx,%eax
80104b2a:	72 14                	jb     80104b40 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
80104b2c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b2f:	8b 13                	mov    (%ebx),%edx
80104b31:	89 10                	mov    %edx,(%eax)
  return 0;
80104b33:	31 c0                	xor    %eax,%eax
}
80104b35:	83 c4 04             	add    $0x4,%esp
80104b38:	5b                   	pop    %ebx
80104b39:	5d                   	pop    %ebp
80104b3a:	c3                   	ret    
80104b3b:	90                   	nop
80104b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b45:	eb ee                	jmp    80104b35 <fetchint+0x25>
80104b47:	89 f6                	mov    %esi,%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b50 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	53                   	push   %ebx
80104b54:	83 ec 04             	sub    $0x4,%esp
80104b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104b5a:	e8 e1 ee ff ff       	call   80103a40 <myproc>

  if(addr >= curproc->sz)
80104b5f:	39 18                	cmp    %ebx,(%eax)
80104b61:	76 29                	jbe    80104b8c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104b63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104b66:	89 da                	mov    %ebx,%edx
80104b68:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
80104b6a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
80104b6c:	39 c3                	cmp    %eax,%ebx
80104b6e:	73 1c                	jae    80104b8c <fetchstr+0x3c>
    if(*s == 0)
80104b70:	80 3b 00             	cmpb   $0x0,(%ebx)
80104b73:	75 10                	jne    80104b85 <fetchstr+0x35>
80104b75:	eb 39                	jmp    80104bb0 <fetchstr+0x60>
80104b77:	89 f6                	mov    %esi,%esi
80104b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104b80:	80 3a 00             	cmpb   $0x0,(%edx)
80104b83:	74 1b                	je     80104ba0 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104b85:	83 c2 01             	add    $0x1,%edx
80104b88:	39 d0                	cmp    %edx,%eax
80104b8a:	77 f4                	ja     80104b80 <fetchstr+0x30>
    return -1;
80104b8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
80104b91:	83 c4 04             	add    $0x4,%esp
80104b94:	5b                   	pop    %ebx
80104b95:	5d                   	pop    %ebp
80104b96:	c3                   	ret    
80104b97:	89 f6                	mov    %esi,%esi
80104b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ba0:	83 c4 04             	add    $0x4,%esp
80104ba3:	89 d0                	mov    %edx,%eax
80104ba5:	29 d8                	sub    %ebx,%eax
80104ba7:	5b                   	pop    %ebx
80104ba8:	5d                   	pop    %ebp
80104ba9:	c3                   	ret    
80104baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
80104bb0:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104bb2:	eb dd                	jmp    80104b91 <fetchstr+0x41>
80104bb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104bba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104bc0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104bc0:	55                   	push   %ebp
80104bc1:	89 e5                	mov    %esp,%ebp
80104bc3:	56                   	push   %esi
80104bc4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104bc5:	e8 76 ee ff ff       	call   80103a40 <myproc>
80104bca:	8b 40 18             	mov    0x18(%eax),%eax
80104bcd:	8b 55 08             	mov    0x8(%ebp),%edx
80104bd0:	8b 40 44             	mov    0x44(%eax),%eax
80104bd3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104bd6:	e8 65 ee ff ff       	call   80103a40 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104bdb:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104bdd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104be0:	39 c6                	cmp    %eax,%esi
80104be2:	73 1c                	jae    80104c00 <argint+0x40>
80104be4:	8d 53 08             	lea    0x8(%ebx),%edx
80104be7:	39 d0                	cmp    %edx,%eax
80104be9:	72 15                	jb     80104c00 <argint+0x40>
  *ip = *(int*)(addr);
80104beb:	8b 45 0c             	mov    0xc(%ebp),%eax
80104bee:	8b 53 04             	mov    0x4(%ebx),%edx
80104bf1:	89 10                	mov    %edx,(%eax)
  return 0;
80104bf3:	31 c0                	xor    %eax,%eax
}
80104bf5:	5b                   	pop    %ebx
80104bf6:	5e                   	pop    %esi
80104bf7:	5d                   	pop    %ebp
80104bf8:	c3                   	ret    
80104bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104c00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104c05:	eb ee                	jmp    80104bf5 <argint+0x35>
80104c07:	89 f6                	mov    %esi,%esi
80104c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c10 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104c10:	55                   	push   %ebp
80104c11:	89 e5                	mov    %esp,%ebp
80104c13:	56                   	push   %esi
80104c14:	53                   	push   %ebx
80104c15:	83 ec 10             	sub    $0x10,%esp
80104c18:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104c1b:	e8 20 ee ff ff       	call   80103a40 <myproc>
80104c20:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104c22:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c25:	83 ec 08             	sub    $0x8,%esp
80104c28:	50                   	push   %eax
80104c29:	ff 75 08             	pushl  0x8(%ebp)
80104c2c:	e8 8f ff ff ff       	call   80104bc0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104c31:	83 c4 10             	add    $0x10,%esp
80104c34:	85 c0                	test   %eax,%eax
80104c36:	78 28                	js     80104c60 <argptr+0x50>
80104c38:	85 db                	test   %ebx,%ebx
80104c3a:	78 24                	js     80104c60 <argptr+0x50>
80104c3c:	8b 16                	mov    (%esi),%edx
80104c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c41:	39 c2                	cmp    %eax,%edx
80104c43:	76 1b                	jbe    80104c60 <argptr+0x50>
80104c45:	01 c3                	add    %eax,%ebx
80104c47:	39 da                	cmp    %ebx,%edx
80104c49:	72 15                	jb     80104c60 <argptr+0x50>
    return -1;
  *pp = (char*)i;
80104c4b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104c4e:	89 02                	mov    %eax,(%edx)
  return 0;
80104c50:	31 c0                	xor    %eax,%eax
}
80104c52:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c55:	5b                   	pop    %ebx
80104c56:	5e                   	pop    %esi
80104c57:	5d                   	pop    %ebp
80104c58:	c3                   	ret    
80104c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104c60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c65:	eb eb                	jmp    80104c52 <argptr+0x42>
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c70 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104c70:	55                   	push   %ebp
80104c71:	89 e5                	mov    %esp,%ebp
80104c73:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104c76:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c79:	50                   	push   %eax
80104c7a:	ff 75 08             	pushl  0x8(%ebp)
80104c7d:	e8 3e ff ff ff       	call   80104bc0 <argint>
80104c82:	83 c4 10             	add    $0x10,%esp
80104c85:	85 c0                	test   %eax,%eax
80104c87:	78 17                	js     80104ca0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104c89:	83 ec 08             	sub    $0x8,%esp
80104c8c:	ff 75 0c             	pushl  0xc(%ebp)
80104c8f:	ff 75 f4             	pushl  -0xc(%ebp)
80104c92:	e8 b9 fe ff ff       	call   80104b50 <fetchstr>
80104c97:	83 c4 10             	add    $0x10,%esp
}
80104c9a:	c9                   	leave  
80104c9b:	c3                   	ret    
80104c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cb0 <syscall>:
[SYS_dumppagetable] sys_dumppagetable,
};

void
syscall(void)
{
80104cb0:	55                   	push   %ebp
80104cb1:	89 e5                	mov    %esp,%ebp
80104cb3:	53                   	push   %ebx
80104cb4:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104cb7:	e8 84 ed ff ff       	call   80103a40 <myproc>
80104cbc:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104cbe:	8b 40 18             	mov    0x18(%eax),%eax
80104cc1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104cc4:	8d 50 ff             	lea    -0x1(%eax),%edx
80104cc7:	83 fa 1a             	cmp    $0x1a,%edx
80104cca:	77 1c                	ja     80104ce8 <syscall+0x38>
80104ccc:	8b 14 85 c0 7e 10 80 	mov    -0x7fef8140(,%eax,4),%edx
80104cd3:	85 d2                	test   %edx,%edx
80104cd5:	74 11                	je     80104ce8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104cd7:	ff d2                	call   *%edx
80104cd9:	8b 53 18             	mov    0x18(%ebx),%edx
80104cdc:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104cdf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ce2:	c9                   	leave  
80104ce3:	c3                   	ret    
80104ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104ce8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104ce9:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104cec:	50                   	push   %eax
80104ced:	ff 73 10             	pushl  0x10(%ebx)
80104cf0:	68 89 7e 10 80       	push   $0x80107e89
80104cf5:	e8 66 b9 ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
80104cfa:	8b 43 18             	mov    0x18(%ebx),%eax
80104cfd:	83 c4 10             	add    $0x10,%esp
80104d00:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104d07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d0a:	c9                   	leave  
80104d0b:	c3                   	ret    
80104d0c:	66 90                	xchg   %ax,%ax
80104d0e:	66 90                	xchg   %ax,%ax

80104d10 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104d10:	55                   	push   %ebp
80104d11:	89 e5                	mov    %esp,%ebp
80104d13:	57                   	push   %edi
80104d14:	56                   	push   %esi
80104d15:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104d16:	8d 75 da             	lea    -0x26(%ebp),%esi
{
80104d19:	83 ec 44             	sub    $0x44,%esp
80104d1c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104d1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104d22:	56                   	push   %esi
80104d23:	50                   	push   %eax
{
80104d24:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104d27:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104d2a:	e8 e1 d1 ff ff       	call   80101f10 <nameiparent>
80104d2f:	83 c4 10             	add    $0x10,%esp
80104d32:	85 c0                	test   %eax,%eax
80104d34:	0f 84 46 01 00 00    	je     80104e80 <create+0x170>
    return 0;
  ilock(dp);
80104d3a:	83 ec 0c             	sub    $0xc,%esp
80104d3d:	89 c3                	mov    %eax,%ebx
80104d3f:	50                   	push   %eax
80104d40:	e8 4b c9 ff ff       	call   80101690 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104d45:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104d48:	83 c4 0c             	add    $0xc,%esp
80104d4b:	50                   	push   %eax
80104d4c:	56                   	push   %esi
80104d4d:	53                   	push   %ebx
80104d4e:	e8 6d ce ff ff       	call   80101bc0 <dirlookup>
80104d53:	83 c4 10             	add    $0x10,%esp
80104d56:	85 c0                	test   %eax,%eax
80104d58:	89 c7                	mov    %eax,%edi
80104d5a:	74 34                	je     80104d90 <create+0x80>
    iunlockput(dp);
80104d5c:	83 ec 0c             	sub    $0xc,%esp
80104d5f:	53                   	push   %ebx
80104d60:	e8 bb cb ff ff       	call   80101920 <iunlockput>
    ilock(ip);
80104d65:	89 3c 24             	mov    %edi,(%esp)
80104d68:	e8 23 c9 ff ff       	call   80101690 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104d6d:	83 c4 10             	add    $0x10,%esp
80104d70:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104d75:	0f 85 95 00 00 00    	jne    80104e10 <create+0x100>
80104d7b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104d80:	0f 85 8a 00 00 00    	jne    80104e10 <create+0x100>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104d86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d89:	89 f8                	mov    %edi,%eax
80104d8b:	5b                   	pop    %ebx
80104d8c:	5e                   	pop    %esi
80104d8d:	5f                   	pop    %edi
80104d8e:	5d                   	pop    %ebp
80104d8f:	c3                   	ret    
  if((ip = ialloc(dp->dev, type)) == 0)
80104d90:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104d94:	83 ec 08             	sub    $0x8,%esp
80104d97:	50                   	push   %eax
80104d98:	ff 33                	pushl  (%ebx)
80104d9a:	e8 81 c7 ff ff       	call   80101520 <ialloc>
80104d9f:	83 c4 10             	add    $0x10,%esp
80104da2:	85 c0                	test   %eax,%eax
80104da4:	89 c7                	mov    %eax,%edi
80104da6:	0f 84 e8 00 00 00    	je     80104e94 <create+0x184>
  ilock(ip);
80104dac:	83 ec 0c             	sub    $0xc,%esp
80104daf:	50                   	push   %eax
80104db0:	e8 db c8 ff ff       	call   80101690 <ilock>
  ip->major = major;
80104db5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104db9:	66 89 47 52          	mov    %ax,0x52(%edi)
  ip->minor = minor;
80104dbd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104dc1:	66 89 47 54          	mov    %ax,0x54(%edi)
  ip->nlink = 1;
80104dc5:	b8 01 00 00 00       	mov    $0x1,%eax
80104dca:	66 89 47 56          	mov    %ax,0x56(%edi)
  iupdate(ip);
80104dce:	89 3c 24             	mov    %edi,(%esp)
80104dd1:	e8 0a c8 ff ff       	call   801015e0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104dd6:	83 c4 10             	add    $0x10,%esp
80104dd9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104dde:	74 50                	je     80104e30 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104de0:	83 ec 04             	sub    $0x4,%esp
80104de3:	ff 77 04             	pushl  0x4(%edi)
80104de6:	56                   	push   %esi
80104de7:	53                   	push   %ebx
80104de8:	e8 43 d0 ff ff       	call   80101e30 <dirlink>
80104ded:	83 c4 10             	add    $0x10,%esp
80104df0:	85 c0                	test   %eax,%eax
80104df2:	0f 88 8f 00 00 00    	js     80104e87 <create+0x177>
  iunlockput(dp);
80104df8:	83 ec 0c             	sub    $0xc,%esp
80104dfb:	53                   	push   %ebx
80104dfc:	e8 1f cb ff ff       	call   80101920 <iunlockput>
  return ip;
80104e01:	83 c4 10             	add    $0x10,%esp
}
80104e04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e07:	89 f8                	mov    %edi,%eax
80104e09:	5b                   	pop    %ebx
80104e0a:	5e                   	pop    %esi
80104e0b:	5f                   	pop    %edi
80104e0c:	5d                   	pop    %ebp
80104e0d:	c3                   	ret    
80104e0e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104e10:	83 ec 0c             	sub    $0xc,%esp
80104e13:	57                   	push   %edi
    return 0;
80104e14:	31 ff                	xor    %edi,%edi
    iunlockput(ip);
80104e16:	e8 05 cb ff ff       	call   80101920 <iunlockput>
    return 0;
80104e1b:	83 c4 10             	add    $0x10,%esp
}
80104e1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e21:	89 f8                	mov    %edi,%eax
80104e23:	5b                   	pop    %ebx
80104e24:	5e                   	pop    %esi
80104e25:	5f                   	pop    %edi
80104e26:	5d                   	pop    %ebp
80104e27:	c3                   	ret    
80104e28:	90                   	nop
80104e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink++;  // for ".."
80104e30:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104e35:	83 ec 0c             	sub    $0xc,%esp
80104e38:	53                   	push   %ebx
80104e39:	e8 a2 c7 ff ff       	call   801015e0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104e3e:	83 c4 0c             	add    $0xc,%esp
80104e41:	ff 77 04             	pushl  0x4(%edi)
80104e44:	68 4c 7f 10 80       	push   $0x80107f4c
80104e49:	57                   	push   %edi
80104e4a:	e8 e1 cf ff ff       	call   80101e30 <dirlink>
80104e4f:	83 c4 10             	add    $0x10,%esp
80104e52:	85 c0                	test   %eax,%eax
80104e54:	78 1c                	js     80104e72 <create+0x162>
80104e56:	83 ec 04             	sub    $0x4,%esp
80104e59:	ff 73 04             	pushl  0x4(%ebx)
80104e5c:	68 4b 7f 10 80       	push   $0x80107f4b
80104e61:	57                   	push   %edi
80104e62:	e8 c9 cf ff ff       	call   80101e30 <dirlink>
80104e67:	83 c4 10             	add    $0x10,%esp
80104e6a:	85 c0                	test   %eax,%eax
80104e6c:	0f 89 6e ff ff ff    	jns    80104de0 <create+0xd0>
      panic("create dots");
80104e72:	83 ec 0c             	sub    $0xc,%esp
80104e75:	68 3f 7f 10 80       	push   $0x80107f3f
80104e7a:	e8 11 b5 ff ff       	call   80100390 <panic>
80104e7f:	90                   	nop
    return 0;
80104e80:	31 ff                	xor    %edi,%edi
80104e82:	e9 ff fe ff ff       	jmp    80104d86 <create+0x76>
    panic("create: dirlink");
80104e87:	83 ec 0c             	sub    $0xc,%esp
80104e8a:	68 4e 7f 10 80       	push   $0x80107f4e
80104e8f:	e8 fc b4 ff ff       	call   80100390 <panic>
    panic("create: ialloc");
80104e94:	83 ec 0c             	sub    $0xc,%esp
80104e97:	68 30 7f 10 80       	push   $0x80107f30
80104e9c:	e8 ef b4 ff ff       	call   80100390 <panic>
80104ea1:	eb 0d                	jmp    80104eb0 <argfd.constprop.0>
80104ea3:	90                   	nop
80104ea4:	90                   	nop
80104ea5:	90                   	nop
80104ea6:	90                   	nop
80104ea7:	90                   	nop
80104ea8:	90                   	nop
80104ea9:	90                   	nop
80104eaa:	90                   	nop
80104eab:	90                   	nop
80104eac:	90                   	nop
80104ead:	90                   	nop
80104eae:	90                   	nop
80104eaf:	90                   	nop

80104eb0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
80104eb0:	55                   	push   %ebp
80104eb1:	89 e5                	mov    %esp,%ebp
80104eb3:	56                   	push   %esi
80104eb4:	53                   	push   %ebx
80104eb5:	89 c3                	mov    %eax,%ebx
  if(argint(n, &fd) < 0)
80104eb7:	8d 45 f4             	lea    -0xc(%ebp),%eax
argfd(int n, int *pfd, struct file **pf)
80104eba:	89 d6                	mov    %edx,%esi
80104ebc:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104ebf:	50                   	push   %eax
80104ec0:	6a 00                	push   $0x0
80104ec2:	e8 f9 fc ff ff       	call   80104bc0 <argint>
80104ec7:	83 c4 10             	add    $0x10,%esp
80104eca:	85 c0                	test   %eax,%eax
80104ecc:	78 2a                	js     80104ef8 <argfd.constprop.0+0x48>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104ece:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ed2:	77 24                	ja     80104ef8 <argfd.constprop.0+0x48>
80104ed4:	e8 67 eb ff ff       	call   80103a40 <myproc>
80104ed9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104edc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ee0:	85 c0                	test   %eax,%eax
80104ee2:	74 14                	je     80104ef8 <argfd.constprop.0+0x48>
  if(pfd)
80104ee4:	85 db                	test   %ebx,%ebx
80104ee6:	74 02                	je     80104eea <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ee8:	89 13                	mov    %edx,(%ebx)
    *pf = f;
80104eea:	89 06                	mov    %eax,(%esi)
  return 0;
80104eec:	31 c0                	xor    %eax,%eax
}
80104eee:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ef1:	5b                   	pop    %ebx
80104ef2:	5e                   	pop    %esi
80104ef3:	5d                   	pop    %ebp
80104ef4:	c3                   	ret    
80104ef5:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104efd:	eb ef                	jmp    80104eee <argfd.constprop.0+0x3e>
80104eff:	90                   	nop

80104f00 <sys_dup>:
{
80104f00:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80104f01:	31 c0                	xor    %eax,%eax
{
80104f03:	89 e5                	mov    %esp,%ebp
80104f05:	56                   	push   %esi
80104f06:	53                   	push   %ebx
  if(argfd(0, 0, &f) < 0)
80104f07:	8d 55 f4             	lea    -0xc(%ebp),%edx
{
80104f0a:	83 ec 10             	sub    $0x10,%esp
  if(argfd(0, 0, &f) < 0)
80104f0d:	e8 9e ff ff ff       	call   80104eb0 <argfd.constprop.0>
80104f12:	85 c0                	test   %eax,%eax
80104f14:	78 42                	js     80104f58 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
80104f16:	8b 75 f4             	mov    -0xc(%ebp),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104f19:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80104f1b:	e8 20 eb ff ff       	call   80103a40 <myproc>
80104f20:	eb 0e                	jmp    80104f30 <sys_dup+0x30>
80104f22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
80104f28:	83 c3 01             	add    $0x1,%ebx
80104f2b:	83 fb 10             	cmp    $0x10,%ebx
80104f2e:	74 28                	je     80104f58 <sys_dup+0x58>
    if(curproc->ofile[fd] == 0){
80104f30:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104f34:	85 d2                	test   %edx,%edx
80104f36:	75 f0                	jne    80104f28 <sys_dup+0x28>
      curproc->ofile[fd] = f;
80104f38:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
  filedup(f);
80104f3c:	83 ec 0c             	sub    $0xc,%esp
80104f3f:	ff 75 f4             	pushl  -0xc(%ebp)
80104f42:	e8 a9 be ff ff       	call   80100df0 <filedup>
  return fd;
80104f47:	83 c4 10             	add    $0x10,%esp
}
80104f4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f4d:	89 d8                	mov    %ebx,%eax
80104f4f:	5b                   	pop    %ebx
80104f50:	5e                   	pop    %esi
80104f51:	5d                   	pop    %ebp
80104f52:	c3                   	ret    
80104f53:	90                   	nop
80104f54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f58:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104f5b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104f60:	89 d8                	mov    %ebx,%eax
80104f62:	5b                   	pop    %ebx
80104f63:	5e                   	pop    %esi
80104f64:	5d                   	pop    %ebp
80104f65:	c3                   	ret    
80104f66:	8d 76 00             	lea    0x0(%esi),%esi
80104f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f70 <sys_read>:
{
80104f70:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104f71:	31 c0                	xor    %eax,%eax
{
80104f73:	89 e5                	mov    %esp,%ebp
80104f75:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104f78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104f7b:	e8 30 ff ff ff       	call   80104eb0 <argfd.constprop.0>
80104f80:	85 c0                	test   %eax,%eax
80104f82:	78 4c                	js     80104fd0 <sys_read+0x60>
80104f84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f87:	83 ec 08             	sub    $0x8,%esp
80104f8a:	50                   	push   %eax
80104f8b:	6a 02                	push   $0x2
80104f8d:	e8 2e fc ff ff       	call   80104bc0 <argint>
80104f92:	83 c4 10             	add    $0x10,%esp
80104f95:	85 c0                	test   %eax,%eax
80104f97:	78 37                	js     80104fd0 <sys_read+0x60>
80104f99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f9c:	83 ec 04             	sub    $0x4,%esp
80104f9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104fa2:	50                   	push   %eax
80104fa3:	6a 01                	push   $0x1
80104fa5:	e8 66 fc ff ff       	call   80104c10 <argptr>
80104faa:	83 c4 10             	add    $0x10,%esp
80104fad:	85 c0                	test   %eax,%eax
80104faf:	78 1f                	js     80104fd0 <sys_read+0x60>
  return fileread(f, p, n);
80104fb1:	83 ec 04             	sub    $0x4,%esp
80104fb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104fb7:	ff 75 f4             	pushl  -0xc(%ebp)
80104fba:	ff 75 ec             	pushl  -0x14(%ebp)
80104fbd:	e8 9e bf ff ff       	call   80100f60 <fileread>
80104fc2:	83 c4 10             	add    $0x10,%esp
}
80104fc5:	c9                   	leave  
80104fc6:	c3                   	ret    
80104fc7:	89 f6                	mov    %esi,%esi
80104fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
80104fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104fd5:	c9                   	leave  
80104fd6:	c3                   	ret    
80104fd7:	89 f6                	mov    %esi,%esi
80104fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fe0 <sys_write>:
{
80104fe0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104fe1:	31 c0                	xor    %eax,%eax
{
80104fe3:	89 e5                	mov    %esp,%ebp
80104fe5:	83 ec 18             	sub    $0x18,%esp
  nwrite++;
80104fe8:	83 05 bc b5 10 80 01 	addl   $0x1,0x8010b5bc
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104fef:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ff2:	e8 b9 fe ff ff       	call   80104eb0 <argfd.constprop.0>
80104ff7:	85 c0                	test   %eax,%eax
80104ff9:	78 45                	js     80105040 <sys_write+0x60>
80104ffb:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ffe:	83 ec 08             	sub    $0x8,%esp
80105001:	50                   	push   %eax
80105002:	6a 02                	push   $0x2
80105004:	e8 b7 fb ff ff       	call   80104bc0 <argint>
80105009:	83 c4 10             	add    $0x10,%esp
8010500c:	85 c0                	test   %eax,%eax
8010500e:	78 30                	js     80105040 <sys_write+0x60>
80105010:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105013:	83 ec 04             	sub    $0x4,%esp
80105016:	ff 75 f0             	pushl  -0x10(%ebp)
80105019:	50                   	push   %eax
8010501a:	6a 01                	push   $0x1
8010501c:	e8 ef fb ff ff       	call   80104c10 <argptr>
80105021:	83 c4 10             	add    $0x10,%esp
80105024:	85 c0                	test   %eax,%eax
80105026:	78 18                	js     80105040 <sys_write+0x60>
  return filewrite(f, p, n);
80105028:	83 ec 04             	sub    $0x4,%esp
8010502b:	ff 75 f0             	pushl  -0x10(%ebp)
8010502e:	ff 75 f4             	pushl  -0xc(%ebp)
80105031:	ff 75 ec             	pushl  -0x14(%ebp)
80105034:	e8 b7 bf ff ff       	call   80100ff0 <filewrite>
80105039:	83 c4 10             	add    $0x10,%esp
}
8010503c:	c9                   	leave  
8010503d:	c3                   	ret    
8010503e:	66 90                	xchg   %ax,%ax
    return -1;
80105040:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105045:	c9                   	leave  
80105046:	c3                   	ret    
80105047:	89 f6                	mov    %esi,%esi
80105049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105050 <sys_writecount>:
{
80105050:	55                   	push   %ebp
}
80105051:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
{
80105056:	89 e5                	mov    %esp,%ebp
}
80105058:	5d                   	pop    %ebp
80105059:	c3                   	ret    
8010505a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105060 <sys_close>:
{
80105060:	55                   	push   %ebp
80105061:	89 e5                	mov    %esp,%ebp
80105063:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, &fd, &f) < 0)
80105066:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105069:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010506c:	e8 3f fe ff ff       	call   80104eb0 <argfd.constprop.0>
80105071:	85 c0                	test   %eax,%eax
80105073:	78 2b                	js     801050a0 <sys_close+0x40>
  myproc()->ofile[fd] = 0;
80105075:	e8 c6 e9 ff ff       	call   80103a40 <myproc>
8010507a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
8010507d:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80105080:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80105087:	00 
  fileclose(f);
80105088:	ff 75 f4             	pushl  -0xc(%ebp)
8010508b:	e8 b0 bd ff ff       	call   80100e40 <fileclose>
  return 0;
80105090:	83 c4 10             	add    $0x10,%esp
80105093:	31 c0                	xor    %eax,%eax
}
80105095:	c9                   	leave  
80105096:	c3                   	ret    
80105097:	89 f6                	mov    %esi,%esi
80105099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
801050a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050a5:	c9                   	leave  
801050a6:	c3                   	ret    
801050a7:	89 f6                	mov    %esi,%esi
801050a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050b0 <sys_fstat>:
{
801050b0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801050b1:	31 c0                	xor    %eax,%eax
{
801050b3:	89 e5                	mov    %esp,%ebp
801050b5:	83 ec 18             	sub    $0x18,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801050b8:	8d 55 f0             	lea    -0x10(%ebp),%edx
801050bb:	e8 f0 fd ff ff       	call   80104eb0 <argfd.constprop.0>
801050c0:	85 c0                	test   %eax,%eax
801050c2:	78 2c                	js     801050f0 <sys_fstat+0x40>
801050c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050c7:	83 ec 04             	sub    $0x4,%esp
801050ca:	6a 14                	push   $0x14
801050cc:	50                   	push   %eax
801050cd:	6a 01                	push   $0x1
801050cf:	e8 3c fb ff ff       	call   80104c10 <argptr>
801050d4:	83 c4 10             	add    $0x10,%esp
801050d7:	85 c0                	test   %eax,%eax
801050d9:	78 15                	js     801050f0 <sys_fstat+0x40>
  return filestat(f, st);
801050db:	83 ec 08             	sub    $0x8,%esp
801050de:	ff 75 f4             	pushl  -0xc(%ebp)
801050e1:	ff 75 f0             	pushl  -0x10(%ebp)
801050e4:	e8 27 be ff ff       	call   80100f10 <filestat>
801050e9:	83 c4 10             	add    $0x10,%esp
}
801050ec:	c9                   	leave  
801050ed:	c3                   	ret    
801050ee:	66 90                	xchg   %ax,%ax
    return -1;
801050f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801050f5:	c9                   	leave  
801050f6:	c3                   	ret    
801050f7:	89 f6                	mov    %esi,%esi
801050f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105100 <sys_link>:
{
80105100:	55                   	push   %ebp
80105101:	89 e5                	mov    %esp,%ebp
80105103:	57                   	push   %edi
80105104:	56                   	push   %esi
80105105:	53                   	push   %ebx
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105106:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80105109:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010510c:	50                   	push   %eax
8010510d:	6a 00                	push   $0x0
8010510f:	e8 5c fb ff ff       	call   80104c70 <argstr>
80105114:	83 c4 10             	add    $0x10,%esp
80105117:	85 c0                	test   %eax,%eax
80105119:	0f 88 fb 00 00 00    	js     8010521a <sys_link+0x11a>
8010511f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105122:	83 ec 08             	sub    $0x8,%esp
80105125:	50                   	push   %eax
80105126:	6a 01                	push   $0x1
80105128:	e8 43 fb ff ff       	call   80104c70 <argstr>
8010512d:	83 c4 10             	add    $0x10,%esp
80105130:	85 c0                	test   %eax,%eax
80105132:	0f 88 e2 00 00 00    	js     8010521a <sys_link+0x11a>
  begin_op();
80105138:	e8 a3 dc ff ff       	call   80102de0 <begin_op>
  if((ip = namei(old)) == 0){
8010513d:	83 ec 0c             	sub    $0xc,%esp
80105140:	ff 75 d4             	pushl  -0x2c(%ebp)
80105143:	e8 a8 cd ff ff       	call   80101ef0 <namei>
80105148:	83 c4 10             	add    $0x10,%esp
8010514b:	85 c0                	test   %eax,%eax
8010514d:	89 c3                	mov    %eax,%ebx
8010514f:	0f 84 ea 00 00 00    	je     8010523f <sys_link+0x13f>
  ilock(ip);
80105155:	83 ec 0c             	sub    $0xc,%esp
80105158:	50                   	push   %eax
80105159:	e8 32 c5 ff ff       	call   80101690 <ilock>
  if(ip->type == T_DIR){
8010515e:	83 c4 10             	add    $0x10,%esp
80105161:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105166:	0f 84 bb 00 00 00    	je     80105227 <sys_link+0x127>
  ip->nlink++;
8010516c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80105171:	83 ec 0c             	sub    $0xc,%esp
  if((dp = nameiparent(new, name)) == 0)
80105174:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80105177:	53                   	push   %ebx
80105178:	e8 63 c4 ff ff       	call   801015e0 <iupdate>
  iunlock(ip);
8010517d:	89 1c 24             	mov    %ebx,(%esp)
80105180:	e8 eb c5 ff ff       	call   80101770 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80105185:	58                   	pop    %eax
80105186:	5a                   	pop    %edx
80105187:	57                   	push   %edi
80105188:	ff 75 d0             	pushl  -0x30(%ebp)
8010518b:	e8 80 cd ff ff       	call   80101f10 <nameiparent>
80105190:	83 c4 10             	add    $0x10,%esp
80105193:	85 c0                	test   %eax,%eax
80105195:	89 c6                	mov    %eax,%esi
80105197:	74 5b                	je     801051f4 <sys_link+0xf4>
  ilock(dp);
80105199:	83 ec 0c             	sub    $0xc,%esp
8010519c:	50                   	push   %eax
8010519d:	e8 ee c4 ff ff       	call   80101690 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
801051a2:	83 c4 10             	add    $0x10,%esp
801051a5:	8b 03                	mov    (%ebx),%eax
801051a7:	39 06                	cmp    %eax,(%esi)
801051a9:	75 3d                	jne    801051e8 <sys_link+0xe8>
801051ab:	83 ec 04             	sub    $0x4,%esp
801051ae:	ff 73 04             	pushl  0x4(%ebx)
801051b1:	57                   	push   %edi
801051b2:	56                   	push   %esi
801051b3:	e8 78 cc ff ff       	call   80101e30 <dirlink>
801051b8:	83 c4 10             	add    $0x10,%esp
801051bb:	85 c0                	test   %eax,%eax
801051bd:	78 29                	js     801051e8 <sys_link+0xe8>
  iunlockput(dp);
801051bf:	83 ec 0c             	sub    $0xc,%esp
801051c2:	56                   	push   %esi
801051c3:	e8 58 c7 ff ff       	call   80101920 <iunlockput>
  iput(ip);
801051c8:	89 1c 24             	mov    %ebx,(%esp)
801051cb:	e8 f0 c5 ff ff       	call   801017c0 <iput>
  end_op();
801051d0:	e8 7b dc ff ff       	call   80102e50 <end_op>
  return 0;
801051d5:	83 c4 10             	add    $0x10,%esp
801051d8:	31 c0                	xor    %eax,%eax
}
801051da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051dd:	5b                   	pop    %ebx
801051de:	5e                   	pop    %esi
801051df:	5f                   	pop    %edi
801051e0:	5d                   	pop    %ebp
801051e1:	c3                   	ret    
801051e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
801051e8:	83 ec 0c             	sub    $0xc,%esp
801051eb:	56                   	push   %esi
801051ec:	e8 2f c7 ff ff       	call   80101920 <iunlockput>
    goto bad;
801051f1:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
801051f4:	83 ec 0c             	sub    $0xc,%esp
801051f7:	53                   	push   %ebx
801051f8:	e8 93 c4 ff ff       	call   80101690 <ilock>
  ip->nlink--;
801051fd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105202:	89 1c 24             	mov    %ebx,(%esp)
80105205:	e8 d6 c3 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
8010520a:	89 1c 24             	mov    %ebx,(%esp)
8010520d:	e8 0e c7 ff ff       	call   80101920 <iunlockput>
  end_op();
80105212:	e8 39 dc ff ff       	call   80102e50 <end_op>
  return -1;
80105217:	83 c4 10             	add    $0x10,%esp
}
8010521a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
8010521d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105222:	5b                   	pop    %ebx
80105223:	5e                   	pop    %esi
80105224:	5f                   	pop    %edi
80105225:	5d                   	pop    %ebp
80105226:	c3                   	ret    
    iunlockput(ip);
80105227:	83 ec 0c             	sub    $0xc,%esp
8010522a:	53                   	push   %ebx
8010522b:	e8 f0 c6 ff ff       	call   80101920 <iunlockput>
    end_op();
80105230:	e8 1b dc ff ff       	call   80102e50 <end_op>
    return -1;
80105235:	83 c4 10             	add    $0x10,%esp
80105238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010523d:	eb 9b                	jmp    801051da <sys_link+0xda>
    end_op();
8010523f:	e8 0c dc ff ff       	call   80102e50 <end_op>
    return -1;
80105244:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105249:	eb 8f                	jmp    801051da <sys_link+0xda>
8010524b:	90                   	nop
8010524c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105250 <sys_unlink>:
{
80105250:	55                   	push   %ebp
80105251:	89 e5                	mov    %esp,%ebp
80105253:	57                   	push   %edi
80105254:	56                   	push   %esi
80105255:	53                   	push   %ebx
  if(argstr(0, &path) < 0)
80105256:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80105259:	83 ec 44             	sub    $0x44,%esp
  if(argstr(0, &path) < 0)
8010525c:	50                   	push   %eax
8010525d:	6a 00                	push   $0x0
8010525f:	e8 0c fa ff ff       	call   80104c70 <argstr>
80105264:	83 c4 10             	add    $0x10,%esp
80105267:	85 c0                	test   %eax,%eax
80105269:	0f 88 77 01 00 00    	js     801053e6 <sys_unlink+0x196>
  if((dp = nameiparent(path, name)) == 0){
8010526f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  begin_op();
80105272:	e8 69 db ff ff       	call   80102de0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105277:	83 ec 08             	sub    $0x8,%esp
8010527a:	53                   	push   %ebx
8010527b:	ff 75 c0             	pushl  -0x40(%ebp)
8010527e:	e8 8d cc ff ff       	call   80101f10 <nameiparent>
80105283:	83 c4 10             	add    $0x10,%esp
80105286:	85 c0                	test   %eax,%eax
80105288:	89 c6                	mov    %eax,%esi
8010528a:	0f 84 60 01 00 00    	je     801053f0 <sys_unlink+0x1a0>
  ilock(dp);
80105290:	83 ec 0c             	sub    $0xc,%esp
80105293:	50                   	push   %eax
80105294:	e8 f7 c3 ff ff       	call   80101690 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105299:	58                   	pop    %eax
8010529a:	5a                   	pop    %edx
8010529b:	68 4c 7f 10 80       	push   $0x80107f4c
801052a0:	53                   	push   %ebx
801052a1:	e8 fa c8 ff ff       	call   80101ba0 <namecmp>
801052a6:	83 c4 10             	add    $0x10,%esp
801052a9:	85 c0                	test   %eax,%eax
801052ab:	0f 84 03 01 00 00    	je     801053b4 <sys_unlink+0x164>
801052b1:	83 ec 08             	sub    $0x8,%esp
801052b4:	68 4b 7f 10 80       	push   $0x80107f4b
801052b9:	53                   	push   %ebx
801052ba:	e8 e1 c8 ff ff       	call   80101ba0 <namecmp>
801052bf:	83 c4 10             	add    $0x10,%esp
801052c2:	85 c0                	test   %eax,%eax
801052c4:	0f 84 ea 00 00 00    	je     801053b4 <sys_unlink+0x164>
  if((ip = dirlookup(dp, name, &off)) == 0)
801052ca:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801052cd:	83 ec 04             	sub    $0x4,%esp
801052d0:	50                   	push   %eax
801052d1:	53                   	push   %ebx
801052d2:	56                   	push   %esi
801052d3:	e8 e8 c8 ff ff       	call   80101bc0 <dirlookup>
801052d8:	83 c4 10             	add    $0x10,%esp
801052db:	85 c0                	test   %eax,%eax
801052dd:	89 c3                	mov    %eax,%ebx
801052df:	0f 84 cf 00 00 00    	je     801053b4 <sys_unlink+0x164>
  ilock(ip);
801052e5:	83 ec 0c             	sub    $0xc,%esp
801052e8:	50                   	push   %eax
801052e9:	e8 a2 c3 ff ff       	call   80101690 <ilock>
  if(ip->nlink < 1)
801052ee:	83 c4 10             	add    $0x10,%esp
801052f1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801052f6:	0f 8e 10 01 00 00    	jle    8010540c <sys_unlink+0x1bc>
  if(ip->type == T_DIR && !isdirempty(ip)){
801052fc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105301:	74 6d                	je     80105370 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80105303:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105306:	83 ec 04             	sub    $0x4,%esp
80105309:	6a 10                	push   $0x10
8010530b:	6a 00                	push   $0x0
8010530d:	50                   	push   %eax
8010530e:	e8 ad f5 ff ff       	call   801048c0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105313:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105316:	6a 10                	push   $0x10
80105318:	ff 75 c4             	pushl  -0x3c(%ebp)
8010531b:	50                   	push   %eax
8010531c:	56                   	push   %esi
8010531d:	e8 4e c7 ff ff       	call   80101a70 <writei>
80105322:	83 c4 20             	add    $0x20,%esp
80105325:	83 f8 10             	cmp    $0x10,%eax
80105328:	0f 85 eb 00 00 00    	jne    80105419 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010532e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105333:	0f 84 97 00 00 00    	je     801053d0 <sys_unlink+0x180>
  iunlockput(dp);
80105339:	83 ec 0c             	sub    $0xc,%esp
8010533c:	56                   	push   %esi
8010533d:	e8 de c5 ff ff       	call   80101920 <iunlockput>
  ip->nlink--;
80105342:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105347:	89 1c 24             	mov    %ebx,(%esp)
8010534a:	e8 91 c2 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
8010534f:	89 1c 24             	mov    %ebx,(%esp)
80105352:	e8 c9 c5 ff ff       	call   80101920 <iunlockput>
  end_op();
80105357:	e8 f4 da ff ff       	call   80102e50 <end_op>
  return 0;
8010535c:	83 c4 10             	add    $0x10,%esp
8010535f:	31 c0                	xor    %eax,%eax
}
80105361:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105364:	5b                   	pop    %ebx
80105365:	5e                   	pop    %esi
80105366:	5f                   	pop    %edi
80105367:	5d                   	pop    %ebp
80105368:	c3                   	ret    
80105369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105370:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105374:	76 8d                	jbe    80105303 <sys_unlink+0xb3>
80105376:	bf 20 00 00 00       	mov    $0x20,%edi
8010537b:	eb 0f                	jmp    8010538c <sys_unlink+0x13c>
8010537d:	8d 76 00             	lea    0x0(%esi),%esi
80105380:	83 c7 10             	add    $0x10,%edi
80105383:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105386:	0f 83 77 ff ff ff    	jae    80105303 <sys_unlink+0xb3>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010538c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010538f:	6a 10                	push   $0x10
80105391:	57                   	push   %edi
80105392:	50                   	push   %eax
80105393:	53                   	push   %ebx
80105394:	e8 d7 c5 ff ff       	call   80101970 <readi>
80105399:	83 c4 10             	add    $0x10,%esp
8010539c:	83 f8 10             	cmp    $0x10,%eax
8010539f:	75 5e                	jne    801053ff <sys_unlink+0x1af>
    if(de.inum != 0)
801053a1:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801053a6:	74 d8                	je     80105380 <sys_unlink+0x130>
    iunlockput(ip);
801053a8:	83 ec 0c             	sub    $0xc,%esp
801053ab:	53                   	push   %ebx
801053ac:	e8 6f c5 ff ff       	call   80101920 <iunlockput>
    goto bad;
801053b1:	83 c4 10             	add    $0x10,%esp
  iunlockput(dp);
801053b4:	83 ec 0c             	sub    $0xc,%esp
801053b7:	56                   	push   %esi
801053b8:	e8 63 c5 ff ff       	call   80101920 <iunlockput>
  end_op();
801053bd:	e8 8e da ff ff       	call   80102e50 <end_op>
  return -1;
801053c2:	83 c4 10             	add    $0x10,%esp
801053c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053ca:	eb 95                	jmp    80105361 <sys_unlink+0x111>
801053cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dp->nlink--;
801053d0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
    iupdate(dp);
801053d5:	83 ec 0c             	sub    $0xc,%esp
801053d8:	56                   	push   %esi
801053d9:	e8 02 c2 ff ff       	call   801015e0 <iupdate>
801053de:	83 c4 10             	add    $0x10,%esp
801053e1:	e9 53 ff ff ff       	jmp    80105339 <sys_unlink+0xe9>
    return -1;
801053e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053eb:	e9 71 ff ff ff       	jmp    80105361 <sys_unlink+0x111>
    end_op();
801053f0:	e8 5b da ff ff       	call   80102e50 <end_op>
    return -1;
801053f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053fa:	e9 62 ff ff ff       	jmp    80105361 <sys_unlink+0x111>
      panic("isdirempty: readi");
801053ff:	83 ec 0c             	sub    $0xc,%esp
80105402:	68 70 7f 10 80       	push   $0x80107f70
80105407:	e8 84 af ff ff       	call   80100390 <panic>
    panic("unlink: nlink < 1");
8010540c:	83 ec 0c             	sub    $0xc,%esp
8010540f:	68 5e 7f 10 80       	push   $0x80107f5e
80105414:	e8 77 af ff ff       	call   80100390 <panic>
    panic("unlink: writei");
80105419:	83 ec 0c             	sub    $0xc,%esp
8010541c:	68 82 7f 10 80       	push   $0x80107f82
80105421:	e8 6a af ff ff       	call   80100390 <panic>
80105426:	8d 76 00             	lea    0x0(%esi),%esi
80105429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105430 <sys_open>:

int
sys_open(void)
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	57                   	push   %edi
80105434:	56                   	push   %esi
80105435:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105436:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80105439:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010543c:	50                   	push   %eax
8010543d:	6a 00                	push   $0x0
8010543f:	e8 2c f8 ff ff       	call   80104c70 <argstr>
80105444:	83 c4 10             	add    $0x10,%esp
80105447:	85 c0                	test   %eax,%eax
80105449:	0f 88 1d 01 00 00    	js     8010556c <sys_open+0x13c>
8010544f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105452:	83 ec 08             	sub    $0x8,%esp
80105455:	50                   	push   %eax
80105456:	6a 01                	push   $0x1
80105458:	e8 63 f7 ff ff       	call   80104bc0 <argint>
8010545d:	83 c4 10             	add    $0x10,%esp
80105460:	85 c0                	test   %eax,%eax
80105462:	0f 88 04 01 00 00    	js     8010556c <sys_open+0x13c>
    return -1;

  begin_op();
80105468:	e8 73 d9 ff ff       	call   80102de0 <begin_op>

  if(omode & O_CREATE){
8010546d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105471:	0f 85 a9 00 00 00    	jne    80105520 <sys_open+0xf0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105477:	83 ec 0c             	sub    $0xc,%esp
8010547a:	ff 75 e0             	pushl  -0x20(%ebp)
8010547d:	e8 6e ca ff ff       	call   80101ef0 <namei>
80105482:	83 c4 10             	add    $0x10,%esp
80105485:	85 c0                	test   %eax,%eax
80105487:	89 c6                	mov    %eax,%esi
80105489:	0f 84 b2 00 00 00    	je     80105541 <sys_open+0x111>
      end_op();
      return -1;
    }
    ilock(ip);
8010548f:	83 ec 0c             	sub    $0xc,%esp
80105492:	50                   	push   %eax
80105493:	e8 f8 c1 ff ff       	call   80101690 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105498:	83 c4 10             	add    $0x10,%esp
8010549b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801054a0:	0f 84 aa 00 00 00    	je     80105550 <sys_open+0x120>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801054a6:	e8 d5 b8 ff ff       	call   80100d80 <filealloc>
801054ab:	85 c0                	test   %eax,%eax
801054ad:	89 c7                	mov    %eax,%edi
801054af:	0f 84 a6 00 00 00    	je     8010555b <sys_open+0x12b>
  struct proc *curproc = myproc();
801054b5:	e8 86 e5 ff ff       	call   80103a40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801054ba:	31 db                	xor    %ebx,%ebx
801054bc:	eb 0e                	jmp    801054cc <sys_open+0x9c>
801054be:	66 90                	xchg   %ax,%ax
801054c0:	83 c3 01             	add    $0x1,%ebx
801054c3:	83 fb 10             	cmp    $0x10,%ebx
801054c6:	0f 84 ac 00 00 00    	je     80105578 <sys_open+0x148>
    if(curproc->ofile[fd] == 0){
801054cc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801054d0:	85 d2                	test   %edx,%edx
801054d2:	75 ec                	jne    801054c0 <sys_open+0x90>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801054d4:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
801054d7:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
  iunlock(ip);
801054db:	56                   	push   %esi
801054dc:	e8 8f c2 ff ff       	call   80101770 <iunlock>
  end_op();
801054e1:	e8 6a d9 ff ff       	call   80102e50 <end_op>

  f->type = FD_INODE;
801054e6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801054ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801054ef:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801054f2:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
801054f5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801054fc:	89 d0                	mov    %edx,%eax
801054fe:	f7 d0                	not    %eax
80105500:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105503:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80105506:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105509:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
8010550d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105510:	89 d8                	mov    %ebx,%eax
80105512:	5b                   	pop    %ebx
80105513:	5e                   	pop    %esi
80105514:	5f                   	pop    %edi
80105515:	5d                   	pop    %ebp
80105516:	c3                   	ret    
80105517:	89 f6                	mov    %esi,%esi
80105519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ip = create(path, T_FILE, 0, 0);
80105520:	83 ec 0c             	sub    $0xc,%esp
80105523:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105526:	31 c9                	xor    %ecx,%ecx
80105528:	6a 00                	push   $0x0
8010552a:	ba 02 00 00 00       	mov    $0x2,%edx
8010552f:	e8 dc f7 ff ff       	call   80104d10 <create>
    if(ip == 0){
80105534:	83 c4 10             	add    $0x10,%esp
80105537:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105539:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010553b:	0f 85 65 ff ff ff    	jne    801054a6 <sys_open+0x76>
      end_op();
80105541:	e8 0a d9 ff ff       	call   80102e50 <end_op>
      return -1;
80105546:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010554b:	eb c0                	jmp    8010550d <sys_open+0xdd>
8010554d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105550:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105553:	85 c9                	test   %ecx,%ecx
80105555:	0f 84 4b ff ff ff    	je     801054a6 <sys_open+0x76>
    iunlockput(ip);
8010555b:	83 ec 0c             	sub    $0xc,%esp
8010555e:	56                   	push   %esi
8010555f:	e8 bc c3 ff ff       	call   80101920 <iunlockput>
    end_op();
80105564:	e8 e7 d8 ff ff       	call   80102e50 <end_op>
    return -1;
80105569:	83 c4 10             	add    $0x10,%esp
8010556c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105571:	eb 9a                	jmp    8010550d <sys_open+0xdd>
80105573:	90                   	nop
80105574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
80105578:	83 ec 0c             	sub    $0xc,%esp
8010557b:	57                   	push   %edi
8010557c:	e8 bf b8 ff ff       	call   80100e40 <fileclose>
80105581:	83 c4 10             	add    $0x10,%esp
80105584:	eb d5                	jmp    8010555b <sys_open+0x12b>
80105586:	8d 76 00             	lea    0x0(%esi),%esi
80105589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105590 <sys_mkdir>:

int
sys_mkdir(void)
{
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105596:	e8 45 d8 ff ff       	call   80102de0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010559b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010559e:	83 ec 08             	sub    $0x8,%esp
801055a1:	50                   	push   %eax
801055a2:	6a 00                	push   $0x0
801055a4:	e8 c7 f6 ff ff       	call   80104c70 <argstr>
801055a9:	83 c4 10             	add    $0x10,%esp
801055ac:	85 c0                	test   %eax,%eax
801055ae:	78 30                	js     801055e0 <sys_mkdir+0x50>
801055b0:	83 ec 0c             	sub    $0xc,%esp
801055b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801055b6:	31 c9                	xor    %ecx,%ecx
801055b8:	6a 00                	push   $0x0
801055ba:	ba 01 00 00 00       	mov    $0x1,%edx
801055bf:	e8 4c f7 ff ff       	call   80104d10 <create>
801055c4:	83 c4 10             	add    $0x10,%esp
801055c7:	85 c0                	test   %eax,%eax
801055c9:	74 15                	je     801055e0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801055cb:	83 ec 0c             	sub    $0xc,%esp
801055ce:	50                   	push   %eax
801055cf:	e8 4c c3 ff ff       	call   80101920 <iunlockput>
  end_op();
801055d4:	e8 77 d8 ff ff       	call   80102e50 <end_op>
  return 0;
801055d9:	83 c4 10             	add    $0x10,%esp
801055dc:	31 c0                	xor    %eax,%eax
}
801055de:	c9                   	leave  
801055df:	c3                   	ret    
    end_op();
801055e0:	e8 6b d8 ff ff       	call   80102e50 <end_op>
    return -1;
801055e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055ea:	c9                   	leave  
801055eb:	c3                   	ret    
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055f0 <sys_mknod>:

int
sys_mknod(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801055f6:	e8 e5 d7 ff ff       	call   80102de0 <begin_op>
  if((argstr(0, &path)) < 0 ||
801055fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801055fe:	83 ec 08             	sub    $0x8,%esp
80105601:	50                   	push   %eax
80105602:	6a 00                	push   $0x0
80105604:	e8 67 f6 ff ff       	call   80104c70 <argstr>
80105609:	83 c4 10             	add    $0x10,%esp
8010560c:	85 c0                	test   %eax,%eax
8010560e:	78 60                	js     80105670 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105610:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105613:	83 ec 08             	sub    $0x8,%esp
80105616:	50                   	push   %eax
80105617:	6a 01                	push   $0x1
80105619:	e8 a2 f5 ff ff       	call   80104bc0 <argint>
  if((argstr(0, &path)) < 0 ||
8010561e:	83 c4 10             	add    $0x10,%esp
80105621:	85 c0                	test   %eax,%eax
80105623:	78 4b                	js     80105670 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105625:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105628:	83 ec 08             	sub    $0x8,%esp
8010562b:	50                   	push   %eax
8010562c:	6a 02                	push   $0x2
8010562e:	e8 8d f5 ff ff       	call   80104bc0 <argint>
     argint(1, &major) < 0 ||
80105633:	83 c4 10             	add    $0x10,%esp
80105636:	85 c0                	test   %eax,%eax
80105638:	78 36                	js     80105670 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
8010563a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
8010563e:	83 ec 0c             	sub    $0xc,%esp
     (ip = create(path, T_DEV, major, minor)) == 0){
80105641:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
     argint(2, &minor) < 0 ||
80105645:	ba 03 00 00 00       	mov    $0x3,%edx
8010564a:	50                   	push   %eax
8010564b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010564e:	e8 bd f6 ff ff       	call   80104d10 <create>
80105653:	83 c4 10             	add    $0x10,%esp
80105656:	85 c0                	test   %eax,%eax
80105658:	74 16                	je     80105670 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010565a:	83 ec 0c             	sub    $0xc,%esp
8010565d:	50                   	push   %eax
8010565e:	e8 bd c2 ff ff       	call   80101920 <iunlockput>
  end_op();
80105663:	e8 e8 d7 ff ff       	call   80102e50 <end_op>
  return 0;
80105668:	83 c4 10             	add    $0x10,%esp
8010566b:	31 c0                	xor    %eax,%eax
}
8010566d:	c9                   	leave  
8010566e:	c3                   	ret    
8010566f:	90                   	nop
    end_op();
80105670:	e8 db d7 ff ff       	call   80102e50 <end_op>
    return -1;
80105675:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010567a:	c9                   	leave  
8010567b:	c3                   	ret    
8010567c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105680 <sys_chdir>:

int
sys_chdir(void)
{
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
80105683:	56                   	push   %esi
80105684:	53                   	push   %ebx
80105685:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105688:	e8 b3 e3 ff ff       	call   80103a40 <myproc>
8010568d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010568f:	e8 4c d7 ff ff       	call   80102de0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105694:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105697:	83 ec 08             	sub    $0x8,%esp
8010569a:	50                   	push   %eax
8010569b:	6a 00                	push   $0x0
8010569d:	e8 ce f5 ff ff       	call   80104c70 <argstr>
801056a2:	83 c4 10             	add    $0x10,%esp
801056a5:	85 c0                	test   %eax,%eax
801056a7:	78 77                	js     80105720 <sys_chdir+0xa0>
801056a9:	83 ec 0c             	sub    $0xc,%esp
801056ac:	ff 75 f4             	pushl  -0xc(%ebp)
801056af:	e8 3c c8 ff ff       	call   80101ef0 <namei>
801056b4:	83 c4 10             	add    $0x10,%esp
801056b7:	85 c0                	test   %eax,%eax
801056b9:	89 c3                	mov    %eax,%ebx
801056bb:	74 63                	je     80105720 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801056bd:	83 ec 0c             	sub    $0xc,%esp
801056c0:	50                   	push   %eax
801056c1:	e8 ca bf ff ff       	call   80101690 <ilock>
  if(ip->type != T_DIR){
801056c6:	83 c4 10             	add    $0x10,%esp
801056c9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056ce:	75 30                	jne    80105700 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056d0:	83 ec 0c             	sub    $0xc,%esp
801056d3:	53                   	push   %ebx
801056d4:	e8 97 c0 ff ff       	call   80101770 <iunlock>
  iput(curproc->cwd);
801056d9:	58                   	pop    %eax
801056da:	ff 76 68             	pushl  0x68(%esi)
801056dd:	e8 de c0 ff ff       	call   801017c0 <iput>
  end_op();
801056e2:	e8 69 d7 ff ff       	call   80102e50 <end_op>
  curproc->cwd = ip;
801056e7:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
801056ea:	83 c4 10             	add    $0x10,%esp
801056ed:	31 c0                	xor    %eax,%eax
}
801056ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801056f2:	5b                   	pop    %ebx
801056f3:	5e                   	pop    %esi
801056f4:	5d                   	pop    %ebp
801056f5:	c3                   	ret    
801056f6:	8d 76 00             	lea    0x0(%esi),%esi
801056f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    iunlockput(ip);
80105700:	83 ec 0c             	sub    $0xc,%esp
80105703:	53                   	push   %ebx
80105704:	e8 17 c2 ff ff       	call   80101920 <iunlockput>
    end_op();
80105709:	e8 42 d7 ff ff       	call   80102e50 <end_op>
    return -1;
8010570e:	83 c4 10             	add    $0x10,%esp
80105711:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105716:	eb d7                	jmp    801056ef <sys_chdir+0x6f>
80105718:	90                   	nop
80105719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105720:	e8 2b d7 ff ff       	call   80102e50 <end_op>
    return -1;
80105725:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010572a:	eb c3                	jmp    801056ef <sys_chdir+0x6f>
8010572c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105730 <sys_exec>:

int
sys_exec(void)
{
80105730:	55                   	push   %ebp
80105731:	89 e5                	mov    %esp,%ebp
80105733:	57                   	push   %edi
80105734:	56                   	push   %esi
80105735:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105736:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
8010573c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105742:	50                   	push   %eax
80105743:	6a 00                	push   $0x0
80105745:	e8 26 f5 ff ff       	call   80104c70 <argstr>
8010574a:	83 c4 10             	add    $0x10,%esp
8010574d:	85 c0                	test   %eax,%eax
8010574f:	0f 88 87 00 00 00    	js     801057dc <sys_exec+0xac>
80105755:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010575b:	83 ec 08             	sub    $0x8,%esp
8010575e:	50                   	push   %eax
8010575f:	6a 01                	push   $0x1
80105761:	e8 5a f4 ff ff       	call   80104bc0 <argint>
80105766:	83 c4 10             	add    $0x10,%esp
80105769:	85 c0                	test   %eax,%eax
8010576b:	78 6f                	js     801057dc <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010576d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105773:	83 ec 04             	sub    $0x4,%esp
  for(i=0;; i++){
80105776:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80105778:	68 80 00 00 00       	push   $0x80
8010577d:	6a 00                	push   $0x0
8010577f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105785:	50                   	push   %eax
80105786:	e8 35 f1 ff ff       	call   801048c0 <memset>
8010578b:	83 c4 10             	add    $0x10,%esp
8010578e:	eb 2c                	jmp    801057bc <sys_exec+0x8c>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
80105790:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105796:	85 c0                	test   %eax,%eax
80105798:	74 56                	je     801057f0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010579a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
801057a0:	83 ec 08             	sub    $0x8,%esp
801057a3:	8d 14 31             	lea    (%ecx,%esi,1),%edx
801057a6:	52                   	push   %edx
801057a7:	50                   	push   %eax
801057a8:	e8 a3 f3 ff ff       	call   80104b50 <fetchstr>
801057ad:	83 c4 10             	add    $0x10,%esp
801057b0:	85 c0                	test   %eax,%eax
801057b2:	78 28                	js     801057dc <sys_exec+0xac>
  for(i=0;; i++){
801057b4:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
801057b7:	83 fb 20             	cmp    $0x20,%ebx
801057ba:	74 20                	je     801057dc <sys_exec+0xac>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801057bc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801057c2:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
801057c9:	83 ec 08             	sub    $0x8,%esp
801057cc:	57                   	push   %edi
801057cd:	01 f0                	add    %esi,%eax
801057cf:	50                   	push   %eax
801057d0:	e8 3b f3 ff ff       	call   80104b10 <fetchint>
801057d5:	83 c4 10             	add    $0x10,%esp
801057d8:	85 c0                	test   %eax,%eax
801057da:	79 b4                	jns    80105790 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
801057dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
801057df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057e4:	5b                   	pop    %ebx
801057e5:	5e                   	pop    %esi
801057e6:	5f                   	pop    %edi
801057e7:	5d                   	pop    %ebp
801057e8:	c3                   	ret    
801057e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return exec(path, argv);
801057f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801057f6:	83 ec 08             	sub    $0x8,%esp
      argv[i] = 0;
801057f9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105800:	00 00 00 00 
  return exec(path, argv);
80105804:	50                   	push   %eax
80105805:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010580b:	e8 00 b2 ff ff       	call   80100a10 <exec>
80105810:	83 c4 10             	add    $0x10,%esp
}
80105813:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105816:	5b                   	pop    %ebx
80105817:	5e                   	pop    %esi
80105818:	5f                   	pop    %edi
80105819:	5d                   	pop    %ebp
8010581a:	c3                   	ret    
8010581b:	90                   	nop
8010581c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105820 <sys_pipe>:

int
sys_pipe(void)
{
80105820:	55                   	push   %ebp
80105821:	89 e5                	mov    %esp,%ebp
80105823:	57                   	push   %edi
80105824:	56                   	push   %esi
80105825:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105826:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105829:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010582c:	6a 08                	push   $0x8
8010582e:	50                   	push   %eax
8010582f:	6a 00                	push   $0x0
80105831:	e8 da f3 ff ff       	call   80104c10 <argptr>
80105836:	83 c4 10             	add    $0x10,%esp
80105839:	85 c0                	test   %eax,%eax
8010583b:	0f 88 ae 00 00 00    	js     801058ef <sys_pipe+0xcf>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105841:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105844:	83 ec 08             	sub    $0x8,%esp
80105847:	50                   	push   %eax
80105848:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010584b:	50                   	push   %eax
8010584c:	e8 2f dc ff ff       	call   80103480 <pipealloc>
80105851:	83 c4 10             	add    $0x10,%esp
80105854:	85 c0                	test   %eax,%eax
80105856:	0f 88 93 00 00 00    	js     801058ef <sys_pipe+0xcf>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010585c:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010585f:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
80105861:	e8 da e1 ff ff       	call   80103a40 <myproc>
80105866:	eb 10                	jmp    80105878 <sys_pipe+0x58>
80105868:	90                   	nop
80105869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(fd = 0; fd < NOFILE; fd++){
80105870:	83 c3 01             	add    $0x1,%ebx
80105873:	83 fb 10             	cmp    $0x10,%ebx
80105876:	74 60                	je     801058d8 <sys_pipe+0xb8>
    if(curproc->ofile[fd] == 0){
80105878:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010587c:	85 f6                	test   %esi,%esi
8010587e:	75 f0                	jne    80105870 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
80105880:	8d 73 08             	lea    0x8(%ebx),%esi
80105883:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105887:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
8010588a:	e8 b1 e1 ff ff       	call   80103a40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010588f:	31 d2                	xor    %edx,%edx
80105891:	eb 0d                	jmp    801058a0 <sys_pipe+0x80>
80105893:	90                   	nop
80105894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105898:	83 c2 01             	add    $0x1,%edx
8010589b:	83 fa 10             	cmp    $0x10,%edx
8010589e:	74 28                	je     801058c8 <sys_pipe+0xa8>
    if(curproc->ofile[fd] == 0){
801058a0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801058a4:	85 c9                	test   %ecx,%ecx
801058a6:	75 f0                	jne    80105898 <sys_pipe+0x78>
      curproc->ofile[fd] = f;
801058a8:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801058ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058af:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801058b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058b4:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801058b7:	31 c0                	xor    %eax,%eax
}
801058b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058bc:	5b                   	pop    %ebx
801058bd:	5e                   	pop    %esi
801058be:	5f                   	pop    %edi
801058bf:	5d                   	pop    %ebp
801058c0:	c3                   	ret    
801058c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
801058c8:	e8 73 e1 ff ff       	call   80103a40 <myproc>
801058cd:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801058d4:	00 
801058d5:	8d 76 00             	lea    0x0(%esi),%esi
    fileclose(rf);
801058d8:	83 ec 0c             	sub    $0xc,%esp
801058db:	ff 75 e0             	pushl  -0x20(%ebp)
801058de:	e8 5d b5 ff ff       	call   80100e40 <fileclose>
    fileclose(wf);
801058e3:	58                   	pop    %eax
801058e4:	ff 75 e4             	pushl  -0x1c(%ebp)
801058e7:	e8 54 b5 ff ff       	call   80100e40 <fileclose>
    return -1;
801058ec:	83 c4 10             	add    $0x10,%esp
801058ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058f4:	eb c3                	jmp    801058b9 <sys_pipe+0x99>
801058f6:	66 90                	xchg   %ax,%ax
801058f8:	66 90                	xchg   %ax,%ax
801058fa:	66 90                	xchg   %ax,%ax
801058fc:	66 90                	xchg   %ax,%ax
801058fe:	66 90                	xchg   %ax,%ax

80105900 <sys_fork>:
#include "proc.h"
#include "processes_info.h"

int
sys_fork(void)
{
80105900:	55                   	push   %ebp
80105901:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105903:	5d                   	pop    %ebp
  return fork();
80105904:	e9 b7 e2 ff ff       	jmp    80103bc0 <fork>
80105909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105910 <sys_exit>:

int
sys_exit(void)
{
80105910:	55                   	push   %ebp
80105911:	89 e5                	mov    %esp,%ebp
80105913:	83 ec 08             	sub    $0x8,%esp
  exit();
80105916:	e8 85 e5 ff ff       	call   80103ea0 <exit>
  return 0;  // not reached
}
8010591b:	31 c0                	xor    %eax,%eax
8010591d:	c9                   	leave  
8010591e:	c3                   	ret    
8010591f:	90                   	nop

80105920 <sys_wait>:

int
sys_wait(void)
{
80105920:	55                   	push   %ebp
80105921:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105923:	5d                   	pop    %ebp
  return wait();
80105924:	e9 b7 e7 ff ff       	jmp    801040e0 <wait>
80105929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105930 <sys_kill>:

int
sys_kill(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105936:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105939:	50                   	push   %eax
8010593a:	6a 00                	push   $0x0
8010593c:	e8 7f f2 ff ff       	call   80104bc0 <argint>
80105941:	83 c4 10             	add    $0x10,%esp
80105944:	85 c0                	test   %eax,%eax
80105946:	78 18                	js     80105960 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105948:	83 ec 0c             	sub    $0xc,%esp
8010594b:	ff 75 f4             	pushl  -0xc(%ebp)
8010594e:	e8 ed e8 ff ff       	call   80104240 <kill>
80105953:	83 c4 10             	add    $0x10,%esp
}
80105956:	c9                   	leave  
80105957:	c3                   	ret    
80105958:	90                   	nop
80105959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105960:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105965:	c9                   	leave  
80105966:	c3                   	ret    
80105967:	89 f6                	mov    %esi,%esi
80105969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105970 <sys_getpid>:

int
sys_getpid(void)
{
80105970:	55                   	push   %ebp
80105971:	89 e5                	mov    %esp,%ebp
80105973:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105976:	e8 c5 e0 ff ff       	call   80103a40 <myproc>
8010597b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010597e:	c9                   	leave  
8010597f:	c3                   	ret    

80105980 <sys_sbrk>:

int
sys_sbrk(void)
{
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105984:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105987:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010598a:	50                   	push   %eax
8010598b:	6a 00                	push   $0x0
8010598d:	e8 2e f2 ff ff       	call   80104bc0 <argint>
80105992:	83 c4 10             	add    $0x10,%esp
80105995:	85 c0                	test   %eax,%eax
80105997:	78 27                	js     801059c0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105999:	e8 a2 e0 ff ff       	call   80103a40 <myproc>
  if(growproc(n) < 0)
8010599e:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801059a1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801059a3:	ff 75 f4             	pushl  -0xc(%ebp)
801059a6:	e8 b5 e1 ff ff       	call   80103b60 <growproc>
801059ab:	83 c4 10             	add    $0x10,%esp
801059ae:	85 c0                	test   %eax,%eax
801059b0:	78 0e                	js     801059c0 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801059b2:	89 d8                	mov    %ebx,%eax
801059b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059b7:	c9                   	leave  
801059b8:	c3                   	ret    
801059b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801059c0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801059c5:	eb eb                	jmp    801059b2 <sys_sbrk+0x32>
801059c7:	89 f6                	mov    %esi,%esi
801059c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801059d0 <sys_sleep>:

int
sys_sleep(void)
{
801059d0:	55                   	push   %ebp
801059d1:	89 e5                	mov    %esp,%ebp
801059d3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801059d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801059d7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801059da:	50                   	push   %eax
801059db:	6a 00                	push   $0x0
801059dd:	e8 de f1 ff ff       	call   80104bc0 <argint>
801059e2:	83 c4 10             	add    $0x10,%esp
801059e5:	85 c0                	test   %eax,%eax
801059e7:	0f 88 8a 00 00 00    	js     80105a77 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801059ed:	83 ec 0c             	sub    $0xc,%esp
801059f0:	68 60 e8 14 80       	push   $0x8014e860
801059f5:	e8 46 ed ff ff       	call   80104740 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801059fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801059fd:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
80105a00:	8b 1d a0 f0 14 80    	mov    0x8014f0a0,%ebx
  while(ticks - ticks0 < n){
80105a06:	85 d2                	test   %edx,%edx
80105a08:	75 27                	jne    80105a31 <sys_sleep+0x61>
80105a0a:	eb 54                	jmp    80105a60 <sys_sleep+0x90>
80105a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105a10:	83 ec 08             	sub    $0x8,%esp
80105a13:	68 60 e8 14 80       	push   $0x8014e860
80105a18:	68 a0 f0 14 80       	push   $0x8014f0a0
80105a1d:	e8 fe e5 ff ff       	call   80104020 <sleep>
  while(ticks - ticks0 < n){
80105a22:	a1 a0 f0 14 80       	mov    0x8014f0a0,%eax
80105a27:	83 c4 10             	add    $0x10,%esp
80105a2a:	29 d8                	sub    %ebx,%eax
80105a2c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105a2f:	73 2f                	jae    80105a60 <sys_sleep+0x90>
    if(myproc()->killed){
80105a31:	e8 0a e0 ff ff       	call   80103a40 <myproc>
80105a36:	8b 40 24             	mov    0x24(%eax),%eax
80105a39:	85 c0                	test   %eax,%eax
80105a3b:	74 d3                	je     80105a10 <sys_sleep+0x40>
      release(&tickslock);
80105a3d:	83 ec 0c             	sub    $0xc,%esp
80105a40:	68 60 e8 14 80       	push   $0x8014e860
80105a45:	e8 16 ee ff ff       	call   80104860 <release>
      return -1;
80105a4a:	83 c4 10             	add    $0x10,%esp
80105a4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105a52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a55:	c9                   	leave  
80105a56:	c3                   	ret    
80105a57:	89 f6                	mov    %esi,%esi
80105a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105a60:	83 ec 0c             	sub    $0xc,%esp
80105a63:	68 60 e8 14 80       	push   $0x8014e860
80105a68:	e8 f3 ed ff ff       	call   80104860 <release>
  return 0;
80105a6d:	83 c4 10             	add    $0x10,%esp
80105a70:	31 c0                	xor    %eax,%eax
}
80105a72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a75:	c9                   	leave  
80105a76:	c3                   	ret    
    return -1;
80105a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a7c:	eb f4                	jmp    80105a72 <sys_sleep+0xa2>
80105a7e:	66 90                	xchg   %ax,%ax

80105a80 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105a80:	55                   	push   %ebp
80105a81:	89 e5                	mov    %esp,%ebp
80105a83:	53                   	push   %ebx
80105a84:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105a87:	68 60 e8 14 80       	push   $0x8014e860
80105a8c:	e8 af ec ff ff       	call   80104740 <acquire>
  xticks = ticks;
80105a91:	8b 1d a0 f0 14 80    	mov    0x8014f0a0,%ebx
  release(&tickslock);
80105a97:	c7 04 24 60 e8 14 80 	movl   $0x8014e860,(%esp)
80105a9e:	e8 bd ed ff ff       	call   80104860 <release>
  return xticks;
}
80105aa3:	89 d8                	mov    %ebx,%eax
80105aa5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105aa8:	c9                   	leave  
80105aa9:	c3                   	ret    
80105aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105ab0 <sys_yield>:

int
sys_yield(void)
{
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	83 ec 08             	sub    $0x8,%esp
  yield();
80105ab6:	e8 15 e5 ff ff       	call   80103fd0 <yield>
  return 0;
}
80105abb:	31 c0                	xor    %eax,%eax
80105abd:	c9                   	leave  
80105abe:	c3                   	ret    
80105abf:	90                   	nop

80105ac0 <sys_shutdown>:

int sys_shutdown(void)
{
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
80105ac3:	83 ec 08             	sub    $0x8,%esp
  shutdown();
80105ac6:	e8 95 cd ff ff       	call   80102860 <shutdown>
  return 0;
}
80105acb:	31 c0                	xor    %eax,%eax
80105acd:	c9                   	leave  
80105ace:	c3                   	ret    
80105acf:	90                   	nop

80105ad0 <sys_settickets>:



int 
sys_settickets(void) 
{
80105ad0:	55                   	push   %ebp
80105ad1:	89 e5                	mov    %esp,%ebp
80105ad3:	83 ec 20             	sub    $0x20,%esp
  int ntk; 

  if(argint(0, &ntk) < 0 || ntk < 1 || ntk > 100000) return -1; 
80105ad6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ad9:	50                   	push   %eax
80105ada:	6a 00                	push   $0x0
80105adc:	e8 df f0 ff ff       	call   80104bc0 <argint>
80105ae1:	83 c4 10             	add    $0x10,%esp
80105ae4:	85 c0                	test   %eax,%eax
80105ae6:	78 20                	js     80105b08 <sys_settickets+0x38>
80105ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105aeb:	83 e8 01             	sub    $0x1,%eax
80105aee:	3d 9f 86 01 00       	cmp    $0x1869f,%eax
80105af3:	77 13                	ja     80105b08 <sys_settickets+0x38>

  myproc()->tickets = ntk;
80105af5:	e8 46 df ff ff       	call   80103a40 <myproc>
80105afa:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105afd:	89 50 7c             	mov    %edx,0x7c(%eax)

  return 0;
80105b00:	31 c0                	xor    %eax,%eax
}
80105b02:	c9                   	leave  
80105b03:	c3                   	ret    
80105b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argint(0, &ntk) < 0 || ntk < 1 || ntk > 100000) return -1; 
80105b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b0d:	c9                   	leave  
80105b0e:	c3                   	ret    
80105b0f:	90                   	nop

80105b10 <sys_getprocessesinfo>:


int 
sys_getprocessesinfo(void)
{
80105b10:	55                   	push   %ebp
80105b11:	89 e5                	mov    %esp,%ebp
80105b13:	83 ec 1c             	sub    $0x1c,%esp
  struct processes_info *spi; 

  if(argptr(0, (void*)&spi, sizeof(*spi)) < 0) return -1;
80105b16:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b19:	68 04 03 00 00       	push   $0x304
80105b1e:	50                   	push   %eax
80105b1f:	6a 00                	push   $0x0
80105b21:	e8 ea f0 ff ff       	call   80104c10 <argptr>
80105b26:	83 c4 10             	add    $0x10,%esp
80105b29:	85 c0                	test   %eax,%eax
80105b2b:	78 13                	js     80105b40 <sys_getprocessesinfo+0x30>

  gpi(spi);
80105b2d:	83 ec 0c             	sub    $0xc,%esp
80105b30:	ff 75 f4             	pushl  -0xc(%ebp)
80105b33:	e8 58 e8 ff ff       	call   80104390 <gpi>

  return 0;
80105b38:	83 c4 10             	add    $0x10,%esp
80105b3b:	31 c0                	xor    %eax,%eax
}
80105b3d:	c9                   	leave  
80105b3e:	c3                   	ret    
80105b3f:	90                   	nop
  if(argptr(0, (void*)&spi, sizeof(*spi)) < 0) return -1;
80105b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105b45:	c9                   	leave  
80105b46:	c3                   	ret    
80105b47:	89 f6                	mov    %esi,%esi
80105b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b50 <sys_dumppagetable>:

int 
sys_dumppagetable(void) 
{
80105b50:	55                   	push   %ebp
80105b51:	89 e5                	mov    %esp,%ebp
80105b53:	83 ec 20             	sub    $0x20,%esp
  int pid; 

  if(argint(0, &pid) < 0 || dumppagetable(pid) < 0) return -1;
80105b56:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b59:	50                   	push   %eax
80105b5a:	6a 00                	push   $0x0
80105b5c:	e8 5f f0 ff ff       	call   80104bc0 <argint>
80105b61:	83 c4 10             	add    $0x10,%esp
80105b64:	85 c0                	test   %eax,%eax
80105b66:	78 18                	js     80105b80 <sys_dumppagetable+0x30>
80105b68:	83 ec 0c             	sub    $0xc,%esp
80105b6b:	ff 75 f4             	pushl  -0xc(%ebp)
80105b6e:	e8 8d e8 ff ff       	call   80104400 <dumppagetable>
80105b73:	83 c4 10             	add    $0x10,%esp
80105b76:	c1 f8 1f             	sar    $0x1f,%eax

  return 0;
80105b79:	c9                   	leave  
80105b7a:	c3                   	ret    
80105b7b:	90                   	nop
80105b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(argint(0, &pid) < 0 || dumppagetable(pid) < 0) return -1;
80105b80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b85:	c9                   	leave  
80105b86:	c3                   	ret    

80105b87 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105b87:	1e                   	push   %ds
  pushl %es
80105b88:	06                   	push   %es
  pushl %fs
80105b89:	0f a0                	push   %fs
  pushl %gs
80105b8b:	0f a8                	push   %gs
  pushal
80105b8d:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105b8e:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105b92:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105b94:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105b96:	54                   	push   %esp
  call trap
80105b97:	e8 c4 00 00 00       	call   80105c60 <trap>
  addl $4, %esp
80105b9c:	83 c4 04             	add    $0x4,%esp

80105b9f <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105b9f:	61                   	popa   
  popl %gs
80105ba0:	0f a9                	pop    %gs
  popl %fs
80105ba2:	0f a1                	pop    %fs
  popl %es
80105ba4:	07                   	pop    %es
  popl %ds
80105ba5:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105ba6:	83 c4 08             	add    $0x8,%esp
  iret
80105ba9:	cf                   	iret   
80105baa:	66 90                	xchg   %ax,%ax
80105bac:	66 90                	xchg   %ax,%ax
80105bae:	66 90                	xchg   %ax,%ax

80105bb0 <tvinit>:

extern char cow_count[];

void
tvinit(void)
{
80105bb0:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105bb1:	31 c0                	xor    %eax,%eax
{
80105bb3:	89 e5                	mov    %esp,%ebp
80105bb5:	83 ec 08             	sub    $0x8,%esp
80105bb8:	90                   	nop
80105bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105bc0:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105bc7:	c7 04 c5 a2 e8 14 80 	movl   $0x8e000008,-0x7feb175e(,%eax,8)
80105bce:	08 00 00 8e 
80105bd2:	66 89 14 c5 a0 e8 14 	mov    %dx,-0x7feb1760(,%eax,8)
80105bd9:	80 
80105bda:	c1 ea 10             	shr    $0x10,%edx
80105bdd:	66 89 14 c5 a6 e8 14 	mov    %dx,-0x7feb175a(,%eax,8)
80105be4:	80 
  for(i = 0; i < 256; i++)
80105be5:	83 c0 01             	add    $0x1,%eax
80105be8:	3d 00 01 00 00       	cmp    $0x100,%eax
80105bed:	75 d1                	jne    80105bc0 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105bef:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105bf4:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105bf7:	c7 05 a2 ea 14 80 08 	movl   $0xef000008,0x8014eaa2
80105bfe:	00 00 ef 
  initlock(&tickslock, "time");
80105c01:	68 91 7f 10 80       	push   $0x80107f91
80105c06:	68 60 e8 14 80       	push   $0x8014e860
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105c0b:	66 a3 a0 ea 14 80    	mov    %ax,0x8014eaa0
80105c11:	c1 e8 10             	shr    $0x10,%eax
80105c14:	66 a3 a6 ea 14 80    	mov    %ax,0x8014eaa6
  initlock(&tickslock, "time");
80105c1a:	e8 31 ea ff ff       	call   80104650 <initlock>
}
80105c1f:	83 c4 10             	add    $0x10,%esp
80105c22:	c9                   	leave  
80105c23:	c3                   	ret    
80105c24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105c30 <idtinit>:

void
idtinit(void)
{
80105c30:	55                   	push   %ebp
  pd[0] = size-1;
80105c31:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105c36:	89 e5                	mov    %esp,%ebp
80105c38:	83 ec 10             	sub    $0x10,%esp
80105c3b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105c3f:	b8 a0 e8 14 80       	mov    $0x8014e8a0,%eax
80105c44:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105c48:	c1 e8 10             	shr    $0x10,%eax
80105c4b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105c4f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105c52:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105c55:	c9                   	leave  
80105c56:	c3                   	ret    
80105c57:	89 f6                	mov    %esi,%esi
80105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c60 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105c60:	55                   	push   %ebp
80105c61:	89 e5                	mov    %esp,%ebp
80105c63:	57                   	push   %edi
80105c64:	56                   	push   %esi
80105c65:	53                   	push   %ebx
80105c66:	83 ec 1c             	sub    $0x1c,%esp
80105c69:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
80105c6c:	8b 47 30             	mov    0x30(%edi),%eax
80105c6f:	83 f8 40             	cmp    $0x40,%eax
80105c72:	0f 84 f8 00 00 00    	je     80105d70 <trap+0x110>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105c78:	83 e8 0e             	sub    $0xe,%eax
80105c7b:	83 f8 31             	cmp    $0x31,%eax
80105c7e:	0f 87 cc 01 00 00    	ja     80105e50 <trap+0x1f0>
80105c84:	ff 24 85 c8 80 10 80 	jmp    *-0x7fef7f38(,%eax,4)
80105c8b:	90                   	nop
80105c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105c90:	0f 20 d6             	mov    %cr2,%esi

  case T_PGFLT:
  {

    void *va = (void*) rcr2();
    struct proc *curproc = myproc();
80105c93:	e8 a8 dd ff ff       	call   80103a40 <myproc>
    char *mem;
    pte_t *pte = walkpgdir(curproc->pgdir, va, 1);
80105c98:	83 ec 04             	sub    $0x4,%esp
    struct proc *curproc = myproc();
80105c9b:	89 c3                	mov    %eax,%ebx
    pte_t *pte = walkpgdir(curproc->pgdir, va, 1);
80105c9d:	6a 01                	push   $0x1
80105c9f:	56                   	push   %esi
80105ca0:	ff 70 04             	pushl  0x4(%eax)
80105ca3:	e8 48 10 00 00       	call   80106cf0 <walkpgdir>
    uint pa = PTE_ADDR(*pte), noref;


    if((uint)va >= curproc->sz) {
80105ca8:	83 c4 10             	add    $0x10,%esp
80105cab:	39 33                	cmp    %esi,(%ebx)
    pte_t *pte = walkpgdir(curproc->pgdir, va, 1);
80105cad:	89 c2                	mov    %eax,%edx
    if((uint)va >= curproc->sz) {
80105caf:	0f 86 13 02 00 00    	jbe    80105ec8 <trap+0x268>
    uint pa = PTE_ADDR(*pte), noref;
80105cb5:	8b 00                	mov    (%eax),%eax
    */

  

    // AOD 
    if(!(*pte & PTE_P)) {
80105cb7:	a8 01                	test   $0x1,%al
80105cb9:	0f 84 51 02 00 00    	je     80105f10 <trap+0x2b0>
               PTE_W | PTE_U) < 0) {
        kfree(mem); goto bad;
      }

    }
    else if(!(*pte & PTE_U)) {
80105cbf:	a8 04                	test   $0x4,%al
80105cc1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80105cc4:	0f 84 fe 01 00 00    	je     80105ec8 <trap+0x268>
      goto segfault;
    }
    else if(!(*pte & PTE_W)) {
80105cca:	a8 02                	test   $0x2,%al
80105ccc:	0f 85 74 03 00 00    	jne    80106046 <trap+0x3e6>
    uint pa = PTE_ADDR(*pte), noref;
80105cd2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      
      noref = get_rc(pa); 
80105cd7:	83 ec 0c             	sub    $0xc,%esp
80105cda:	50                   	push   %eax
80105cdb:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105cde:	e8 8d c8 ff ff       	call   80102570 <get_rc>

      // cprintf("not writable \n");

      if(noref > 1) { 
80105ce3:	83 c4 10             	add    $0x10,%esp
80105ce6:	83 f8 01             	cmp    $0x1,%eax
80105ce9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105cec:	0f 87 de 02 00 00    	ja     80105fd0 <trap+0x370>
        memmove(mem, (char*) PGROUNDDOWN((uint)va), PGSIZE);

        *pte = V2P(mem) | PTE_P | PTE_W | PTE_U;

      } 
      else if(noref == 1) {
80105cf2:	75 03                	jne    80105cf7 <trap+0x97>
        *pte |= PTE_W; 
80105cf4:	83 0a 02             	orl    $0x2,(%edx)
      } 

      lcr3(V2P(curproc->pgdir));
80105cf7:	8b 43 04             	mov    0x4(%ebx),%eax
80105cfa:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80105cff:	0f 22 d8             	mov    %eax,%cr3
80105d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)

  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105d08:	e8 33 dd ff ff       	call   80103a40 <myproc>
80105d0d:	85 c0                	test   %eax,%eax
80105d0f:	74 1d                	je     80105d2e <trap+0xce>
80105d11:	e8 2a dd ff ff       	call   80103a40 <myproc>
80105d16:	8b 50 24             	mov    0x24(%eax),%edx
80105d19:	85 d2                	test   %edx,%edx
80105d1b:	74 11                	je     80105d2e <trap+0xce>
80105d1d:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105d21:	83 e0 03             	and    $0x3,%eax
80105d24:	66 83 f8 03          	cmp    $0x3,%ax
80105d28:	0f 84 d2 01 00 00    	je     80105f00 <trap+0x2a0>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105d2e:	e8 0d dd ff ff       	call   80103a40 <myproc>
80105d33:	85 c0                	test   %eax,%eax
80105d35:	74 0b                	je     80105d42 <trap+0xe2>
80105d37:	e8 04 dd ff ff       	call   80103a40 <myproc>
80105d3c:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105d40:	74 66                	je     80105da8 <trap+0x148>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105d42:	e8 f9 dc ff ff       	call   80103a40 <myproc>
80105d47:	85 c0                	test   %eax,%eax
80105d49:	74 19                	je     80105d64 <trap+0x104>
80105d4b:	e8 f0 dc ff ff       	call   80103a40 <myproc>
80105d50:	8b 40 24             	mov    0x24(%eax),%eax
80105d53:	85 c0                	test   %eax,%eax
80105d55:	74 0d                	je     80105d64 <trap+0x104>
80105d57:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105d5b:	83 e0 03             	and    $0x3,%eax
80105d5e:	66 83 f8 03          	cmp    $0x3,%ax
80105d62:	74 35                	je     80105d99 <trap+0x139>
    exit();
}
80105d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d67:	5b                   	pop    %ebx
80105d68:	5e                   	pop    %esi
80105d69:	5f                   	pop    %edi
80105d6a:	5d                   	pop    %ebp
80105d6b:	c3                   	ret    
80105d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
80105d70:	e8 cb dc ff ff       	call   80103a40 <myproc>
80105d75:	8b 58 24             	mov    0x24(%eax),%ebx
80105d78:	85 db                	test   %ebx,%ebx
80105d7a:	0f 85 c0 00 00 00    	jne    80105e40 <trap+0x1e0>
    myproc()->tf = tf;
80105d80:	e8 bb dc ff ff       	call   80103a40 <myproc>
80105d85:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105d88:	e8 23 ef ff ff       	call   80104cb0 <syscall>
    if(myproc()->killed)
80105d8d:	e8 ae dc ff ff       	call   80103a40 <myproc>
80105d92:	8b 48 24             	mov    0x24(%eax),%ecx
80105d95:	85 c9                	test   %ecx,%ecx
80105d97:	74 cb                	je     80105d64 <trap+0x104>
}
80105d99:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d9c:	5b                   	pop    %ebx
80105d9d:	5e                   	pop    %esi
80105d9e:	5f                   	pop    %edi
80105d9f:	5d                   	pop    %ebp
      exit();
80105da0:	e9 fb e0 ff ff       	jmp    80103ea0 <exit>
80105da5:	8d 76 00             	lea    0x0(%esi),%esi
  if(myproc() && myproc()->state == RUNNING &&
80105da8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105dac:	75 94                	jne    80105d42 <trap+0xe2>
    yield();
80105dae:	e8 1d e2 ff ff       	call   80103fd0 <yield>
80105db3:	eb 8d                	jmp    80105d42 <trap+0xe2>
80105db5:	8d 76 00             	lea    0x0(%esi),%esi
    if(cpuid() == 0){
80105db8:	e8 63 dc ff ff       	call   80103a20 <cpuid>
80105dbd:	85 c0                	test   %eax,%eax
80105dbf:	0f 84 b3 01 00 00    	je     80105f78 <trap+0x318>
    lapiceoi();
80105dc5:	e8 c6 cb ff ff       	call   80102990 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105dca:	e8 71 dc ff ff       	call   80103a40 <myproc>
80105dcf:	85 c0                	test   %eax,%eax
80105dd1:	0f 85 3a ff ff ff    	jne    80105d11 <trap+0xb1>
80105dd7:	e9 52 ff ff ff       	jmp    80105d2e <trap+0xce>
80105ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105de0:	e8 eb 03 00 00       	call   801061d0 <uartintr>
    lapiceoi();
80105de5:	e8 a6 cb ff ff       	call   80102990 <lapiceoi>
    break;
80105dea:	e9 19 ff ff ff       	jmp    80105d08 <trap+0xa8>
80105def:	90                   	nop
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105df0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105df4:	8b 77 38             	mov    0x38(%edi),%esi
80105df7:	e8 24 dc ff ff       	call   80103a20 <cpuid>
80105dfc:	56                   	push   %esi
80105dfd:	53                   	push   %ebx
80105dfe:	50                   	push   %eax
80105dff:	68 ac 7f 10 80       	push   $0x80107fac
80105e04:	e8 57 a8 ff ff       	call   80100660 <cprintf>
    lapiceoi();
80105e09:	e8 82 cb ff ff       	call   80102990 <lapiceoi>
    break;
80105e0e:	83 c4 10             	add    $0x10,%esp
80105e11:	e9 f2 fe ff ff       	jmp    80105d08 <trap+0xa8>
80105e16:	8d 76 00             	lea    0x0(%esi),%esi
80105e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    ideintr();
80105e20:	e8 6b c2 ff ff       	call   80102090 <ideintr>
80105e25:	eb 9e                	jmp    80105dc5 <trap+0x165>
80105e27:	89 f6                	mov    %esi,%esi
80105e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    kbdintr();
80105e30:	e8 0b ca ff ff       	call   80102840 <kbdintr>
    lapiceoi();
80105e35:	e8 56 cb ff ff       	call   80102990 <lapiceoi>
    break;
80105e3a:	e9 c9 fe ff ff       	jmp    80105d08 <trap+0xa8>
80105e3f:	90                   	nop
      exit();
80105e40:	e8 5b e0 ff ff       	call   80103ea0 <exit>
80105e45:	e9 36 ff ff ff       	jmp    80105d80 <trap+0x120>
80105e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(myproc() == 0 || (tf->cs&3) == 0){
80105e50:	e8 eb db ff ff       	call   80103a40 <myproc>
80105e55:	85 c0                	test   %eax,%eax
80105e57:	0f 84 be 01 00 00    	je     8010601b <trap+0x3bb>
80105e5d:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105e61:	0f 84 b4 01 00 00    	je     8010601b <trap+0x3bb>
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105e67:	0f 20 d1             	mov    %cr2,%ecx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e6a:	8b 57 38             	mov    0x38(%edi),%edx
80105e6d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105e70:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105e73:	e8 a8 db ff ff       	call   80103a20 <cpuid>
80105e78:	8b 77 34             	mov    0x34(%edi),%esi
80105e7b:	8b 5f 30             	mov    0x30(%edi),%ebx
80105e7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            myproc()->pid, myproc()->name, tf->trapno,
80105e81:	e8 ba db ff ff       	call   80103a40 <myproc>
80105e86:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105e89:	e8 b2 db ff ff       	call   80103a40 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e8e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105e91:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105e94:	51                   	push   %ecx
80105e95:	52                   	push   %edx
            myproc()->pid, myproc()->name, tf->trapno,
80105e96:	8b 55 e0             	mov    -0x20(%ebp),%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105e99:	ff 75 e4             	pushl  -0x1c(%ebp)
80105e9c:	56                   	push   %esi
80105e9d:	53                   	push   %ebx
            myproc()->pid, myproc()->name, tf->trapno,
80105e9e:	83 c2 6c             	add    $0x6c,%edx
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ea1:	52                   	push   %edx
80105ea2:	ff 70 10             	pushl  0x10(%eax)
80105ea5:	68 84 80 10 80       	push   $0x80108084
80105eaa:	e8 b1 a7 ff ff       	call   80100660 <cprintf>
    myproc()->killed = 1;
80105eaf:	83 c4 20             	add    $0x20,%esp
80105eb2:	e8 89 db ff ff       	call   80103a40 <myproc>
80105eb7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105ebe:	e9 45 fe ff ff       	jmp    80105d08 <trap+0xa8>
80105ec3:	90                   	nop
80105ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      cprintf("Segfault; pid %d %s: trap %d err %d on cpu %d "
80105ec8:	8b 57 38             	mov    0x38(%edi),%edx
80105ecb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80105ece:	e8 4d db ff ff       	call   80103a20 <cpuid>
80105ed3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105ed6:	56                   	push   %esi
80105ed7:	52                   	push   %edx
80105ed8:	50                   	push   %eax
              curproc->pid, curproc->name, T_PGFLT,
80105ed9:	8d 43 6c             	lea    0x6c(%ebx),%eax
      cprintf("Segfault; pid %d %s: trap %d err %d on cpu %d "
80105edc:	ff 77 34             	pushl  0x34(%edi)
80105edf:	6a 0e                	push   $0xe
80105ee1:	50                   	push   %eax
80105ee2:	ff 73 10             	pushl  0x10(%ebx)
80105ee5:	68 d0 7f 10 80       	push   $0x80107fd0
80105eea:	e8 71 a7 ff ff       	call   80100660 <cprintf>
      goto bad;
80105eef:	83 c4 20             	add    $0x20,%esp
    curproc->killed = 1;
80105ef2:	c7 43 24 01 00 00 00 	movl   $0x1,0x24(%ebx)
    break;
80105ef9:	e9 0a fe ff ff       	jmp    80105d08 <trap+0xa8>
80105efe:	66 90                	xchg   %ax,%ax
    exit();
80105f00:	e8 9b df ff ff       	call   80103ea0 <exit>
80105f05:	e9 24 fe ff ff       	jmp    80105d2e <trap+0xce>
80105f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(!(mem = kalloc())) goto bad_oom;
80105f10:	e8 cb c5 ff ff       	call   801024e0 <kalloc>
80105f15:	85 c0                	test   %eax,%eax
80105f17:	0f 84 93 00 00 00    	je     80105fb0 <trap+0x350>
      memset(mem, 0, PGSIZE);
80105f1d:	83 ec 04             	sub    $0x4,%esp
80105f20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
               (char*) PGROUNDDOWN((uint)va), 
80105f23:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
      memset(mem, 0, PGSIZE);
80105f29:	68 00 10 00 00       	push   $0x1000
80105f2e:	6a 00                	push   $0x0
80105f30:	50                   	push   %eax
80105f31:	e8 8a e9 ff ff       	call   801048c0 <memset>
      if(mappages(curproc->pgdir, 
80105f36:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105f39:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80105f40:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
80105f46:	50                   	push   %eax
80105f47:	68 00 10 00 00       	push   $0x1000
80105f4c:	56                   	push   %esi
80105f4d:	ff 73 04             	pushl  0x4(%ebx)
80105f50:	e8 db 0e 00 00       	call   80106e30 <mappages>
80105f55:	83 c4 20             	add    $0x20,%esp
80105f58:	85 c0                	test   %eax,%eax
80105f5a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105f5d:	0f 89 a5 fd ff ff    	jns    80105d08 <trap+0xa8>
        kfree(mem); goto bad;
80105f63:	83 ec 0c             	sub    $0xc,%esp
80105f66:	52                   	push   %edx
80105f67:	e8 b4 c3 ff ff       	call   80102320 <kfree>
80105f6c:	83 c4 10             	add    $0x10,%esp
80105f6f:	eb 81                	jmp    80105ef2 <trap+0x292>
80105f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      acquire(&tickslock);
80105f78:	83 ec 0c             	sub    $0xc,%esp
80105f7b:	68 60 e8 14 80       	push   $0x8014e860
80105f80:	e8 bb e7 ff ff       	call   80104740 <acquire>
      wakeup(&ticks);
80105f85:	c7 04 24 a0 f0 14 80 	movl   $0x8014f0a0,(%esp)
      ticks++;
80105f8c:	83 05 a0 f0 14 80 01 	addl   $0x1,0x8014f0a0
      wakeup(&ticks);
80105f93:	e8 48 e2 ff ff       	call   801041e0 <wakeup>
      release(&tickslock);
80105f98:	c7 04 24 60 e8 14 80 	movl   $0x8014e860,(%esp)
80105f9f:	e8 bc e8 ff ff       	call   80104860 <release>
80105fa4:	83 c4 10             	add    $0x10,%esp
80105fa7:	e9 19 fe ff ff       	jmp    80105dc5 <trap+0x165>
80105fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("OOM; pid %d (%s) killed; allocated %d bytes\n", curproc->pid, curproc->name,  curproc->sz);
80105fb0:	8d 43 6c             	lea    0x6c(%ebx),%eax
80105fb3:	ff 33                	pushl  (%ebx)
80105fb5:	50                   	push   %eax
80105fb6:	ff 73 10             	pushl  0x10(%ebx)
80105fb9:	68 20 80 10 80       	push   $0x80108020
80105fbe:	e8 9d a6 ff ff       	call   80100660 <cprintf>
80105fc3:	83 c4 10             	add    $0x10,%esp
80105fc6:	e9 27 ff ff ff       	jmp    80105ef2 <trap+0x292>
80105fcb:	90                   	nop
80105fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105fd0:	89 55 dc             	mov    %edx,-0x24(%ebp)
        if(!(mem = kalloc())) goto bad_oom;
80105fd3:	e8 08 c5 ff ff       	call   801024e0 <kalloc>
80105fd8:	85 c0                	test   %eax,%eax
80105fda:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105fdd:	74 d1                	je     80105fb0 <trap+0x350>
        dec_rc(pa);
80105fdf:	83 ec 0c             	sub    $0xc,%esp
80105fe2:	ff 75 e0             	pushl  -0x20(%ebp)
        memmove(mem, (char*) PGROUNDDOWN((uint)va), PGSIZE);
80105fe5:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
        dec_rc(pa);
80105feb:	e8 10 c6 ff ff       	call   80102600 <dec_rc>
        memmove(mem, (char*) PGROUNDDOWN((uint)va), PGSIZE);
80105ff0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105ff3:	83 c4 0c             	add    $0xc,%esp
80105ff6:	68 00 10 00 00       	push   $0x1000
80105ffb:	56                   	push   %esi
80105ffc:	51                   	push   %ecx
80105ffd:	e8 6e e9 ff ff       	call   80104970 <memmove>
        *pte = V2P(mem) | PTE_P | PTE_W | PTE_U;
80106002:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106005:	8b 55 dc             	mov    -0x24(%ebp),%edx
80106008:	83 c4 10             	add    $0x10,%esp
8010600b:	81 c1 00 00 00 80    	add    $0x80000000,%ecx
80106011:	83 c9 07             	or     $0x7,%ecx
80106014:	89 0a                	mov    %ecx,(%edx)
80106016:	e9 dc fc ff ff       	jmp    80105cf7 <trap+0x97>
8010601b:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010601e:	8b 5f 38             	mov    0x38(%edi),%ebx
80106021:	e8 fa d9 ff ff       	call   80103a20 <cpuid>
80106026:	83 ec 0c             	sub    $0xc,%esp
80106029:	56                   	push   %esi
8010602a:	53                   	push   %ebx
8010602b:	50                   	push   %eax
8010602c:	ff 77 30             	pushl  0x30(%edi)
8010602f:	68 50 80 10 80       	push   $0x80108050
80106034:	e8 27 a6 ff ff       	call   80100660 <cprintf>
      panic("trap");
80106039:	83 c4 14             	add    $0x14,%esp
8010603c:	68 a4 7f 10 80       	push   $0x80107fa4
80106041:	e8 4a a3 ff ff       	call   80100390 <panic>
      panic("trap refcount");
80106046:	83 ec 0c             	sub    $0xc,%esp
80106049:	68 96 7f 10 80       	push   $0x80107f96
8010604e:	e8 3d a3 ff ff       	call   80100390 <panic>
80106053:	66 90                	xchg   %ax,%ax
80106055:	66 90                	xchg   %ax,%ax
80106057:	66 90                	xchg   %ax,%ax
80106059:	66 90                	xchg   %ax,%ax
8010605b:	66 90                	xchg   %ax,%ax
8010605d:	66 90                	xchg   %ax,%ax
8010605f:	90                   	nop

80106060 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80106060:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
{
80106065:	55                   	push   %ebp
80106066:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106068:	85 c0                	test   %eax,%eax
8010606a:	74 1c                	je     80106088 <uartgetc+0x28>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010606c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106071:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80106072:	a8 01                	test   $0x1,%al
80106074:	74 12                	je     80106088 <uartgetc+0x28>
80106076:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010607b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
8010607c:	0f b6 c0             	movzbl %al,%eax
}
8010607f:	5d                   	pop    %ebp
80106080:	c3                   	ret    
80106081:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80106088:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010608d:	5d                   	pop    %ebp
8010608e:	c3                   	ret    
8010608f:	90                   	nop

80106090 <uartputc.part.0>:
uartputc(int c)
80106090:	55                   	push   %ebp
80106091:	89 e5                	mov    %esp,%ebp
80106093:	57                   	push   %edi
80106094:	56                   	push   %esi
80106095:	53                   	push   %ebx
80106096:	89 c7                	mov    %eax,%edi
80106098:	bb 80 00 00 00       	mov    $0x80,%ebx
8010609d:	be fd 03 00 00       	mov    $0x3fd,%esi
801060a2:	83 ec 0c             	sub    $0xc,%esp
801060a5:	eb 1b                	jmp    801060c2 <uartputc.part.0+0x32>
801060a7:	89 f6                	mov    %esi,%esi
801060a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    microdelay(10);
801060b0:	83 ec 0c             	sub    $0xc,%esp
801060b3:	6a 0a                	push   $0xa
801060b5:	e8 f6 c8 ff ff       	call   801029b0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801060ba:	83 c4 10             	add    $0x10,%esp
801060bd:	83 eb 01             	sub    $0x1,%ebx
801060c0:	74 07                	je     801060c9 <uartputc.part.0+0x39>
801060c2:	89 f2                	mov    %esi,%edx
801060c4:	ec                   	in     (%dx),%al
801060c5:	a8 20                	test   $0x20,%al
801060c7:	74 e7                	je     801060b0 <uartputc.part.0+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801060c9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801060ce:	89 f8                	mov    %edi,%eax
801060d0:	ee                   	out    %al,(%dx)
}
801060d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060d4:	5b                   	pop    %ebx
801060d5:	5e                   	pop    %esi
801060d6:	5f                   	pop    %edi
801060d7:	5d                   	pop    %ebp
801060d8:	c3                   	ret    
801060d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801060e0 <uartinit>:
{
801060e0:	55                   	push   %ebp
801060e1:	31 c9                	xor    %ecx,%ecx
801060e3:	89 c8                	mov    %ecx,%eax
801060e5:	89 e5                	mov    %esp,%ebp
801060e7:	57                   	push   %edi
801060e8:	56                   	push   %esi
801060e9:	53                   	push   %ebx
801060ea:	bb fa 03 00 00       	mov    $0x3fa,%ebx
801060ef:	89 da                	mov    %ebx,%edx
801060f1:	83 ec 0c             	sub    $0xc,%esp
801060f4:	ee                   	out    %al,(%dx)
801060f5:	bf fb 03 00 00       	mov    $0x3fb,%edi
801060fa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801060ff:	89 fa                	mov    %edi,%edx
80106101:	ee                   	out    %al,(%dx)
80106102:	b8 0c 00 00 00       	mov    $0xc,%eax
80106107:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010610c:	ee                   	out    %al,(%dx)
8010610d:	be f9 03 00 00       	mov    $0x3f9,%esi
80106112:	89 c8                	mov    %ecx,%eax
80106114:	89 f2                	mov    %esi,%edx
80106116:	ee                   	out    %al,(%dx)
80106117:	b8 03 00 00 00       	mov    $0x3,%eax
8010611c:	89 fa                	mov    %edi,%edx
8010611e:	ee                   	out    %al,(%dx)
8010611f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80106124:	89 c8                	mov    %ecx,%eax
80106126:	ee                   	out    %al,(%dx)
80106127:	b8 01 00 00 00       	mov    $0x1,%eax
8010612c:	89 f2                	mov    %esi,%edx
8010612e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010612f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106134:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80106135:	3c ff                	cmp    $0xff,%al
80106137:	74 5a                	je     80106193 <uartinit+0xb3>
  uart = 1;
80106139:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
80106140:	00 00 00 
80106143:	89 da                	mov    %ebx,%edx
80106145:	ec                   	in     (%dx),%al
80106146:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010614b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
8010614c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
8010614f:	bb 90 81 10 80       	mov    $0x80108190,%ebx
  ioapicenable(IRQ_COM1, 0);
80106154:	6a 00                	push   $0x0
80106156:	6a 04                	push   $0x4
80106158:	e8 83 c1 ff ff       	call   801022e0 <ioapicenable>
8010615d:	83 c4 10             	add    $0x10,%esp
  for(p="xv6...\n"; *p; p++)
80106160:	b8 78 00 00 00       	mov    $0x78,%eax
80106165:	eb 13                	jmp    8010617a <uartinit+0x9a>
80106167:	89 f6                	mov    %esi,%esi
80106169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106170:	83 c3 01             	add    $0x1,%ebx
80106173:	0f be 03             	movsbl (%ebx),%eax
80106176:	84 c0                	test   %al,%al
80106178:	74 19                	je     80106193 <uartinit+0xb3>
  if(!uart)
8010617a:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
80106180:	85 d2                	test   %edx,%edx
80106182:	74 ec                	je     80106170 <uartinit+0x90>
  for(p="xv6...\n"; *p; p++)
80106184:	83 c3 01             	add    $0x1,%ebx
80106187:	e8 04 ff ff ff       	call   80106090 <uartputc.part.0>
8010618c:	0f be 03             	movsbl (%ebx),%eax
8010618f:	84 c0                	test   %al,%al
80106191:	75 e7                	jne    8010617a <uartinit+0x9a>
}
80106193:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106196:	5b                   	pop    %ebx
80106197:	5e                   	pop    %esi
80106198:	5f                   	pop    %edi
80106199:	5d                   	pop    %ebp
8010619a:	c3                   	ret    
8010619b:	90                   	nop
8010619c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801061a0 <uartputc>:
  if(!uart)
801061a0:	8b 15 c0 b5 10 80    	mov    0x8010b5c0,%edx
{
801061a6:	55                   	push   %ebp
801061a7:	89 e5                	mov    %esp,%ebp
  if(!uart)
801061a9:	85 d2                	test   %edx,%edx
{
801061ab:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!uart)
801061ae:	74 10                	je     801061c0 <uartputc+0x20>
}
801061b0:	5d                   	pop    %ebp
801061b1:	e9 da fe ff ff       	jmp    80106090 <uartputc.part.0>
801061b6:	8d 76 00             	lea    0x0(%esi),%esi
801061b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801061c0:	5d                   	pop    %ebp
801061c1:	c3                   	ret    
801061c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801061c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801061d0 <uartintr>:

void
uartintr(void)
{
801061d0:	55                   	push   %ebp
801061d1:	89 e5                	mov    %esp,%ebp
801061d3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
801061d6:	68 60 60 10 80       	push   $0x80106060
801061db:	e8 30 a6 ff ff       	call   80100810 <consoleintr>
}
801061e0:	83 c4 10             	add    $0x10,%esp
801061e3:	c9                   	leave  
801061e4:	c3                   	ret    

801061e5 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
801061e5:	6a 00                	push   $0x0
  pushl $0
801061e7:	6a 00                	push   $0x0
  jmp alltraps
801061e9:	e9 99 f9 ff ff       	jmp    80105b87 <alltraps>

801061ee <vector1>:
.globl vector1
vector1:
  pushl $0
801061ee:	6a 00                	push   $0x0
  pushl $1
801061f0:	6a 01                	push   $0x1
  jmp alltraps
801061f2:	e9 90 f9 ff ff       	jmp    80105b87 <alltraps>

801061f7 <vector2>:
.globl vector2
vector2:
  pushl $0
801061f7:	6a 00                	push   $0x0
  pushl $2
801061f9:	6a 02                	push   $0x2
  jmp alltraps
801061fb:	e9 87 f9 ff ff       	jmp    80105b87 <alltraps>

80106200 <vector3>:
.globl vector3
vector3:
  pushl $0
80106200:	6a 00                	push   $0x0
  pushl $3
80106202:	6a 03                	push   $0x3
  jmp alltraps
80106204:	e9 7e f9 ff ff       	jmp    80105b87 <alltraps>

80106209 <vector4>:
.globl vector4
vector4:
  pushl $0
80106209:	6a 00                	push   $0x0
  pushl $4
8010620b:	6a 04                	push   $0x4
  jmp alltraps
8010620d:	e9 75 f9 ff ff       	jmp    80105b87 <alltraps>

80106212 <vector5>:
.globl vector5
vector5:
  pushl $0
80106212:	6a 00                	push   $0x0
  pushl $5
80106214:	6a 05                	push   $0x5
  jmp alltraps
80106216:	e9 6c f9 ff ff       	jmp    80105b87 <alltraps>

8010621b <vector6>:
.globl vector6
vector6:
  pushl $0
8010621b:	6a 00                	push   $0x0
  pushl $6
8010621d:	6a 06                	push   $0x6
  jmp alltraps
8010621f:	e9 63 f9 ff ff       	jmp    80105b87 <alltraps>

80106224 <vector7>:
.globl vector7
vector7:
  pushl $0
80106224:	6a 00                	push   $0x0
  pushl $7
80106226:	6a 07                	push   $0x7
  jmp alltraps
80106228:	e9 5a f9 ff ff       	jmp    80105b87 <alltraps>

8010622d <vector8>:
.globl vector8
vector8:
  pushl $8
8010622d:	6a 08                	push   $0x8
  jmp alltraps
8010622f:	e9 53 f9 ff ff       	jmp    80105b87 <alltraps>

80106234 <vector9>:
.globl vector9
vector9:
  pushl $0
80106234:	6a 00                	push   $0x0
  pushl $9
80106236:	6a 09                	push   $0x9
  jmp alltraps
80106238:	e9 4a f9 ff ff       	jmp    80105b87 <alltraps>

8010623d <vector10>:
.globl vector10
vector10:
  pushl $10
8010623d:	6a 0a                	push   $0xa
  jmp alltraps
8010623f:	e9 43 f9 ff ff       	jmp    80105b87 <alltraps>

80106244 <vector11>:
.globl vector11
vector11:
  pushl $11
80106244:	6a 0b                	push   $0xb
  jmp alltraps
80106246:	e9 3c f9 ff ff       	jmp    80105b87 <alltraps>

8010624b <vector12>:
.globl vector12
vector12:
  pushl $12
8010624b:	6a 0c                	push   $0xc
  jmp alltraps
8010624d:	e9 35 f9 ff ff       	jmp    80105b87 <alltraps>

80106252 <vector13>:
.globl vector13
vector13:
  pushl $13
80106252:	6a 0d                	push   $0xd
  jmp alltraps
80106254:	e9 2e f9 ff ff       	jmp    80105b87 <alltraps>

80106259 <vector14>:
.globl vector14
vector14:
  pushl $14
80106259:	6a 0e                	push   $0xe
  jmp alltraps
8010625b:	e9 27 f9 ff ff       	jmp    80105b87 <alltraps>

80106260 <vector15>:
.globl vector15
vector15:
  pushl $0
80106260:	6a 00                	push   $0x0
  pushl $15
80106262:	6a 0f                	push   $0xf
  jmp alltraps
80106264:	e9 1e f9 ff ff       	jmp    80105b87 <alltraps>

80106269 <vector16>:
.globl vector16
vector16:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $16
8010626b:	6a 10                	push   $0x10
  jmp alltraps
8010626d:	e9 15 f9 ff ff       	jmp    80105b87 <alltraps>

80106272 <vector17>:
.globl vector17
vector17:
  pushl $17
80106272:	6a 11                	push   $0x11
  jmp alltraps
80106274:	e9 0e f9 ff ff       	jmp    80105b87 <alltraps>

80106279 <vector18>:
.globl vector18
vector18:
  pushl $0
80106279:	6a 00                	push   $0x0
  pushl $18
8010627b:	6a 12                	push   $0x12
  jmp alltraps
8010627d:	e9 05 f9 ff ff       	jmp    80105b87 <alltraps>

80106282 <vector19>:
.globl vector19
vector19:
  pushl $0
80106282:	6a 00                	push   $0x0
  pushl $19
80106284:	6a 13                	push   $0x13
  jmp alltraps
80106286:	e9 fc f8 ff ff       	jmp    80105b87 <alltraps>

8010628b <vector20>:
.globl vector20
vector20:
  pushl $0
8010628b:	6a 00                	push   $0x0
  pushl $20
8010628d:	6a 14                	push   $0x14
  jmp alltraps
8010628f:	e9 f3 f8 ff ff       	jmp    80105b87 <alltraps>

80106294 <vector21>:
.globl vector21
vector21:
  pushl $0
80106294:	6a 00                	push   $0x0
  pushl $21
80106296:	6a 15                	push   $0x15
  jmp alltraps
80106298:	e9 ea f8 ff ff       	jmp    80105b87 <alltraps>

8010629d <vector22>:
.globl vector22
vector22:
  pushl $0
8010629d:	6a 00                	push   $0x0
  pushl $22
8010629f:	6a 16                	push   $0x16
  jmp alltraps
801062a1:	e9 e1 f8 ff ff       	jmp    80105b87 <alltraps>

801062a6 <vector23>:
.globl vector23
vector23:
  pushl $0
801062a6:	6a 00                	push   $0x0
  pushl $23
801062a8:	6a 17                	push   $0x17
  jmp alltraps
801062aa:	e9 d8 f8 ff ff       	jmp    80105b87 <alltraps>

801062af <vector24>:
.globl vector24
vector24:
  pushl $0
801062af:	6a 00                	push   $0x0
  pushl $24
801062b1:	6a 18                	push   $0x18
  jmp alltraps
801062b3:	e9 cf f8 ff ff       	jmp    80105b87 <alltraps>

801062b8 <vector25>:
.globl vector25
vector25:
  pushl $0
801062b8:	6a 00                	push   $0x0
  pushl $25
801062ba:	6a 19                	push   $0x19
  jmp alltraps
801062bc:	e9 c6 f8 ff ff       	jmp    80105b87 <alltraps>

801062c1 <vector26>:
.globl vector26
vector26:
  pushl $0
801062c1:	6a 00                	push   $0x0
  pushl $26
801062c3:	6a 1a                	push   $0x1a
  jmp alltraps
801062c5:	e9 bd f8 ff ff       	jmp    80105b87 <alltraps>

801062ca <vector27>:
.globl vector27
vector27:
  pushl $0
801062ca:	6a 00                	push   $0x0
  pushl $27
801062cc:	6a 1b                	push   $0x1b
  jmp alltraps
801062ce:	e9 b4 f8 ff ff       	jmp    80105b87 <alltraps>

801062d3 <vector28>:
.globl vector28
vector28:
  pushl $0
801062d3:	6a 00                	push   $0x0
  pushl $28
801062d5:	6a 1c                	push   $0x1c
  jmp alltraps
801062d7:	e9 ab f8 ff ff       	jmp    80105b87 <alltraps>

801062dc <vector29>:
.globl vector29
vector29:
  pushl $0
801062dc:	6a 00                	push   $0x0
  pushl $29
801062de:	6a 1d                	push   $0x1d
  jmp alltraps
801062e0:	e9 a2 f8 ff ff       	jmp    80105b87 <alltraps>

801062e5 <vector30>:
.globl vector30
vector30:
  pushl $0
801062e5:	6a 00                	push   $0x0
  pushl $30
801062e7:	6a 1e                	push   $0x1e
  jmp alltraps
801062e9:	e9 99 f8 ff ff       	jmp    80105b87 <alltraps>

801062ee <vector31>:
.globl vector31
vector31:
  pushl $0
801062ee:	6a 00                	push   $0x0
  pushl $31
801062f0:	6a 1f                	push   $0x1f
  jmp alltraps
801062f2:	e9 90 f8 ff ff       	jmp    80105b87 <alltraps>

801062f7 <vector32>:
.globl vector32
vector32:
  pushl $0
801062f7:	6a 00                	push   $0x0
  pushl $32
801062f9:	6a 20                	push   $0x20
  jmp alltraps
801062fb:	e9 87 f8 ff ff       	jmp    80105b87 <alltraps>

80106300 <vector33>:
.globl vector33
vector33:
  pushl $0
80106300:	6a 00                	push   $0x0
  pushl $33
80106302:	6a 21                	push   $0x21
  jmp alltraps
80106304:	e9 7e f8 ff ff       	jmp    80105b87 <alltraps>

80106309 <vector34>:
.globl vector34
vector34:
  pushl $0
80106309:	6a 00                	push   $0x0
  pushl $34
8010630b:	6a 22                	push   $0x22
  jmp alltraps
8010630d:	e9 75 f8 ff ff       	jmp    80105b87 <alltraps>

80106312 <vector35>:
.globl vector35
vector35:
  pushl $0
80106312:	6a 00                	push   $0x0
  pushl $35
80106314:	6a 23                	push   $0x23
  jmp alltraps
80106316:	e9 6c f8 ff ff       	jmp    80105b87 <alltraps>

8010631b <vector36>:
.globl vector36
vector36:
  pushl $0
8010631b:	6a 00                	push   $0x0
  pushl $36
8010631d:	6a 24                	push   $0x24
  jmp alltraps
8010631f:	e9 63 f8 ff ff       	jmp    80105b87 <alltraps>

80106324 <vector37>:
.globl vector37
vector37:
  pushl $0
80106324:	6a 00                	push   $0x0
  pushl $37
80106326:	6a 25                	push   $0x25
  jmp alltraps
80106328:	e9 5a f8 ff ff       	jmp    80105b87 <alltraps>

8010632d <vector38>:
.globl vector38
vector38:
  pushl $0
8010632d:	6a 00                	push   $0x0
  pushl $38
8010632f:	6a 26                	push   $0x26
  jmp alltraps
80106331:	e9 51 f8 ff ff       	jmp    80105b87 <alltraps>

80106336 <vector39>:
.globl vector39
vector39:
  pushl $0
80106336:	6a 00                	push   $0x0
  pushl $39
80106338:	6a 27                	push   $0x27
  jmp alltraps
8010633a:	e9 48 f8 ff ff       	jmp    80105b87 <alltraps>

8010633f <vector40>:
.globl vector40
vector40:
  pushl $0
8010633f:	6a 00                	push   $0x0
  pushl $40
80106341:	6a 28                	push   $0x28
  jmp alltraps
80106343:	e9 3f f8 ff ff       	jmp    80105b87 <alltraps>

80106348 <vector41>:
.globl vector41
vector41:
  pushl $0
80106348:	6a 00                	push   $0x0
  pushl $41
8010634a:	6a 29                	push   $0x29
  jmp alltraps
8010634c:	e9 36 f8 ff ff       	jmp    80105b87 <alltraps>

80106351 <vector42>:
.globl vector42
vector42:
  pushl $0
80106351:	6a 00                	push   $0x0
  pushl $42
80106353:	6a 2a                	push   $0x2a
  jmp alltraps
80106355:	e9 2d f8 ff ff       	jmp    80105b87 <alltraps>

8010635a <vector43>:
.globl vector43
vector43:
  pushl $0
8010635a:	6a 00                	push   $0x0
  pushl $43
8010635c:	6a 2b                	push   $0x2b
  jmp alltraps
8010635e:	e9 24 f8 ff ff       	jmp    80105b87 <alltraps>

80106363 <vector44>:
.globl vector44
vector44:
  pushl $0
80106363:	6a 00                	push   $0x0
  pushl $44
80106365:	6a 2c                	push   $0x2c
  jmp alltraps
80106367:	e9 1b f8 ff ff       	jmp    80105b87 <alltraps>

8010636c <vector45>:
.globl vector45
vector45:
  pushl $0
8010636c:	6a 00                	push   $0x0
  pushl $45
8010636e:	6a 2d                	push   $0x2d
  jmp alltraps
80106370:	e9 12 f8 ff ff       	jmp    80105b87 <alltraps>

80106375 <vector46>:
.globl vector46
vector46:
  pushl $0
80106375:	6a 00                	push   $0x0
  pushl $46
80106377:	6a 2e                	push   $0x2e
  jmp alltraps
80106379:	e9 09 f8 ff ff       	jmp    80105b87 <alltraps>

8010637e <vector47>:
.globl vector47
vector47:
  pushl $0
8010637e:	6a 00                	push   $0x0
  pushl $47
80106380:	6a 2f                	push   $0x2f
  jmp alltraps
80106382:	e9 00 f8 ff ff       	jmp    80105b87 <alltraps>

80106387 <vector48>:
.globl vector48
vector48:
  pushl $0
80106387:	6a 00                	push   $0x0
  pushl $48
80106389:	6a 30                	push   $0x30
  jmp alltraps
8010638b:	e9 f7 f7 ff ff       	jmp    80105b87 <alltraps>

80106390 <vector49>:
.globl vector49
vector49:
  pushl $0
80106390:	6a 00                	push   $0x0
  pushl $49
80106392:	6a 31                	push   $0x31
  jmp alltraps
80106394:	e9 ee f7 ff ff       	jmp    80105b87 <alltraps>

80106399 <vector50>:
.globl vector50
vector50:
  pushl $0
80106399:	6a 00                	push   $0x0
  pushl $50
8010639b:	6a 32                	push   $0x32
  jmp alltraps
8010639d:	e9 e5 f7 ff ff       	jmp    80105b87 <alltraps>

801063a2 <vector51>:
.globl vector51
vector51:
  pushl $0
801063a2:	6a 00                	push   $0x0
  pushl $51
801063a4:	6a 33                	push   $0x33
  jmp alltraps
801063a6:	e9 dc f7 ff ff       	jmp    80105b87 <alltraps>

801063ab <vector52>:
.globl vector52
vector52:
  pushl $0
801063ab:	6a 00                	push   $0x0
  pushl $52
801063ad:	6a 34                	push   $0x34
  jmp alltraps
801063af:	e9 d3 f7 ff ff       	jmp    80105b87 <alltraps>

801063b4 <vector53>:
.globl vector53
vector53:
  pushl $0
801063b4:	6a 00                	push   $0x0
  pushl $53
801063b6:	6a 35                	push   $0x35
  jmp alltraps
801063b8:	e9 ca f7 ff ff       	jmp    80105b87 <alltraps>

801063bd <vector54>:
.globl vector54
vector54:
  pushl $0
801063bd:	6a 00                	push   $0x0
  pushl $54
801063bf:	6a 36                	push   $0x36
  jmp alltraps
801063c1:	e9 c1 f7 ff ff       	jmp    80105b87 <alltraps>

801063c6 <vector55>:
.globl vector55
vector55:
  pushl $0
801063c6:	6a 00                	push   $0x0
  pushl $55
801063c8:	6a 37                	push   $0x37
  jmp alltraps
801063ca:	e9 b8 f7 ff ff       	jmp    80105b87 <alltraps>

801063cf <vector56>:
.globl vector56
vector56:
  pushl $0
801063cf:	6a 00                	push   $0x0
  pushl $56
801063d1:	6a 38                	push   $0x38
  jmp alltraps
801063d3:	e9 af f7 ff ff       	jmp    80105b87 <alltraps>

801063d8 <vector57>:
.globl vector57
vector57:
  pushl $0
801063d8:	6a 00                	push   $0x0
  pushl $57
801063da:	6a 39                	push   $0x39
  jmp alltraps
801063dc:	e9 a6 f7 ff ff       	jmp    80105b87 <alltraps>

801063e1 <vector58>:
.globl vector58
vector58:
  pushl $0
801063e1:	6a 00                	push   $0x0
  pushl $58
801063e3:	6a 3a                	push   $0x3a
  jmp alltraps
801063e5:	e9 9d f7 ff ff       	jmp    80105b87 <alltraps>

801063ea <vector59>:
.globl vector59
vector59:
  pushl $0
801063ea:	6a 00                	push   $0x0
  pushl $59
801063ec:	6a 3b                	push   $0x3b
  jmp alltraps
801063ee:	e9 94 f7 ff ff       	jmp    80105b87 <alltraps>

801063f3 <vector60>:
.globl vector60
vector60:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $60
801063f5:	6a 3c                	push   $0x3c
  jmp alltraps
801063f7:	e9 8b f7 ff ff       	jmp    80105b87 <alltraps>

801063fc <vector61>:
.globl vector61
vector61:
  pushl $0
801063fc:	6a 00                	push   $0x0
  pushl $61
801063fe:	6a 3d                	push   $0x3d
  jmp alltraps
80106400:	e9 82 f7 ff ff       	jmp    80105b87 <alltraps>

80106405 <vector62>:
.globl vector62
vector62:
  pushl $0
80106405:	6a 00                	push   $0x0
  pushl $62
80106407:	6a 3e                	push   $0x3e
  jmp alltraps
80106409:	e9 79 f7 ff ff       	jmp    80105b87 <alltraps>

8010640e <vector63>:
.globl vector63
vector63:
  pushl $0
8010640e:	6a 00                	push   $0x0
  pushl $63
80106410:	6a 3f                	push   $0x3f
  jmp alltraps
80106412:	e9 70 f7 ff ff       	jmp    80105b87 <alltraps>

80106417 <vector64>:
.globl vector64
vector64:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $64
80106419:	6a 40                	push   $0x40
  jmp alltraps
8010641b:	e9 67 f7 ff ff       	jmp    80105b87 <alltraps>

80106420 <vector65>:
.globl vector65
vector65:
  pushl $0
80106420:	6a 00                	push   $0x0
  pushl $65
80106422:	6a 41                	push   $0x41
  jmp alltraps
80106424:	e9 5e f7 ff ff       	jmp    80105b87 <alltraps>

80106429 <vector66>:
.globl vector66
vector66:
  pushl $0
80106429:	6a 00                	push   $0x0
  pushl $66
8010642b:	6a 42                	push   $0x42
  jmp alltraps
8010642d:	e9 55 f7 ff ff       	jmp    80105b87 <alltraps>

80106432 <vector67>:
.globl vector67
vector67:
  pushl $0
80106432:	6a 00                	push   $0x0
  pushl $67
80106434:	6a 43                	push   $0x43
  jmp alltraps
80106436:	e9 4c f7 ff ff       	jmp    80105b87 <alltraps>

8010643b <vector68>:
.globl vector68
vector68:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $68
8010643d:	6a 44                	push   $0x44
  jmp alltraps
8010643f:	e9 43 f7 ff ff       	jmp    80105b87 <alltraps>

80106444 <vector69>:
.globl vector69
vector69:
  pushl $0
80106444:	6a 00                	push   $0x0
  pushl $69
80106446:	6a 45                	push   $0x45
  jmp alltraps
80106448:	e9 3a f7 ff ff       	jmp    80105b87 <alltraps>

8010644d <vector70>:
.globl vector70
vector70:
  pushl $0
8010644d:	6a 00                	push   $0x0
  pushl $70
8010644f:	6a 46                	push   $0x46
  jmp alltraps
80106451:	e9 31 f7 ff ff       	jmp    80105b87 <alltraps>

80106456 <vector71>:
.globl vector71
vector71:
  pushl $0
80106456:	6a 00                	push   $0x0
  pushl $71
80106458:	6a 47                	push   $0x47
  jmp alltraps
8010645a:	e9 28 f7 ff ff       	jmp    80105b87 <alltraps>

8010645f <vector72>:
.globl vector72
vector72:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $72
80106461:	6a 48                	push   $0x48
  jmp alltraps
80106463:	e9 1f f7 ff ff       	jmp    80105b87 <alltraps>

80106468 <vector73>:
.globl vector73
vector73:
  pushl $0
80106468:	6a 00                	push   $0x0
  pushl $73
8010646a:	6a 49                	push   $0x49
  jmp alltraps
8010646c:	e9 16 f7 ff ff       	jmp    80105b87 <alltraps>

80106471 <vector74>:
.globl vector74
vector74:
  pushl $0
80106471:	6a 00                	push   $0x0
  pushl $74
80106473:	6a 4a                	push   $0x4a
  jmp alltraps
80106475:	e9 0d f7 ff ff       	jmp    80105b87 <alltraps>

8010647a <vector75>:
.globl vector75
vector75:
  pushl $0
8010647a:	6a 00                	push   $0x0
  pushl $75
8010647c:	6a 4b                	push   $0x4b
  jmp alltraps
8010647e:	e9 04 f7 ff ff       	jmp    80105b87 <alltraps>

80106483 <vector76>:
.globl vector76
vector76:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $76
80106485:	6a 4c                	push   $0x4c
  jmp alltraps
80106487:	e9 fb f6 ff ff       	jmp    80105b87 <alltraps>

8010648c <vector77>:
.globl vector77
vector77:
  pushl $0
8010648c:	6a 00                	push   $0x0
  pushl $77
8010648e:	6a 4d                	push   $0x4d
  jmp alltraps
80106490:	e9 f2 f6 ff ff       	jmp    80105b87 <alltraps>

80106495 <vector78>:
.globl vector78
vector78:
  pushl $0
80106495:	6a 00                	push   $0x0
  pushl $78
80106497:	6a 4e                	push   $0x4e
  jmp alltraps
80106499:	e9 e9 f6 ff ff       	jmp    80105b87 <alltraps>

8010649e <vector79>:
.globl vector79
vector79:
  pushl $0
8010649e:	6a 00                	push   $0x0
  pushl $79
801064a0:	6a 4f                	push   $0x4f
  jmp alltraps
801064a2:	e9 e0 f6 ff ff       	jmp    80105b87 <alltraps>

801064a7 <vector80>:
.globl vector80
vector80:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $80
801064a9:	6a 50                	push   $0x50
  jmp alltraps
801064ab:	e9 d7 f6 ff ff       	jmp    80105b87 <alltraps>

801064b0 <vector81>:
.globl vector81
vector81:
  pushl $0
801064b0:	6a 00                	push   $0x0
  pushl $81
801064b2:	6a 51                	push   $0x51
  jmp alltraps
801064b4:	e9 ce f6 ff ff       	jmp    80105b87 <alltraps>

801064b9 <vector82>:
.globl vector82
vector82:
  pushl $0
801064b9:	6a 00                	push   $0x0
  pushl $82
801064bb:	6a 52                	push   $0x52
  jmp alltraps
801064bd:	e9 c5 f6 ff ff       	jmp    80105b87 <alltraps>

801064c2 <vector83>:
.globl vector83
vector83:
  pushl $0
801064c2:	6a 00                	push   $0x0
  pushl $83
801064c4:	6a 53                	push   $0x53
  jmp alltraps
801064c6:	e9 bc f6 ff ff       	jmp    80105b87 <alltraps>

801064cb <vector84>:
.globl vector84
vector84:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $84
801064cd:	6a 54                	push   $0x54
  jmp alltraps
801064cf:	e9 b3 f6 ff ff       	jmp    80105b87 <alltraps>

801064d4 <vector85>:
.globl vector85
vector85:
  pushl $0
801064d4:	6a 00                	push   $0x0
  pushl $85
801064d6:	6a 55                	push   $0x55
  jmp alltraps
801064d8:	e9 aa f6 ff ff       	jmp    80105b87 <alltraps>

801064dd <vector86>:
.globl vector86
vector86:
  pushl $0
801064dd:	6a 00                	push   $0x0
  pushl $86
801064df:	6a 56                	push   $0x56
  jmp alltraps
801064e1:	e9 a1 f6 ff ff       	jmp    80105b87 <alltraps>

801064e6 <vector87>:
.globl vector87
vector87:
  pushl $0
801064e6:	6a 00                	push   $0x0
  pushl $87
801064e8:	6a 57                	push   $0x57
  jmp alltraps
801064ea:	e9 98 f6 ff ff       	jmp    80105b87 <alltraps>

801064ef <vector88>:
.globl vector88
vector88:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $88
801064f1:	6a 58                	push   $0x58
  jmp alltraps
801064f3:	e9 8f f6 ff ff       	jmp    80105b87 <alltraps>

801064f8 <vector89>:
.globl vector89
vector89:
  pushl $0
801064f8:	6a 00                	push   $0x0
  pushl $89
801064fa:	6a 59                	push   $0x59
  jmp alltraps
801064fc:	e9 86 f6 ff ff       	jmp    80105b87 <alltraps>

80106501 <vector90>:
.globl vector90
vector90:
  pushl $0
80106501:	6a 00                	push   $0x0
  pushl $90
80106503:	6a 5a                	push   $0x5a
  jmp alltraps
80106505:	e9 7d f6 ff ff       	jmp    80105b87 <alltraps>

8010650a <vector91>:
.globl vector91
vector91:
  pushl $0
8010650a:	6a 00                	push   $0x0
  pushl $91
8010650c:	6a 5b                	push   $0x5b
  jmp alltraps
8010650e:	e9 74 f6 ff ff       	jmp    80105b87 <alltraps>

80106513 <vector92>:
.globl vector92
vector92:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $92
80106515:	6a 5c                	push   $0x5c
  jmp alltraps
80106517:	e9 6b f6 ff ff       	jmp    80105b87 <alltraps>

8010651c <vector93>:
.globl vector93
vector93:
  pushl $0
8010651c:	6a 00                	push   $0x0
  pushl $93
8010651e:	6a 5d                	push   $0x5d
  jmp alltraps
80106520:	e9 62 f6 ff ff       	jmp    80105b87 <alltraps>

80106525 <vector94>:
.globl vector94
vector94:
  pushl $0
80106525:	6a 00                	push   $0x0
  pushl $94
80106527:	6a 5e                	push   $0x5e
  jmp alltraps
80106529:	e9 59 f6 ff ff       	jmp    80105b87 <alltraps>

8010652e <vector95>:
.globl vector95
vector95:
  pushl $0
8010652e:	6a 00                	push   $0x0
  pushl $95
80106530:	6a 5f                	push   $0x5f
  jmp alltraps
80106532:	e9 50 f6 ff ff       	jmp    80105b87 <alltraps>

80106537 <vector96>:
.globl vector96
vector96:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $96
80106539:	6a 60                	push   $0x60
  jmp alltraps
8010653b:	e9 47 f6 ff ff       	jmp    80105b87 <alltraps>

80106540 <vector97>:
.globl vector97
vector97:
  pushl $0
80106540:	6a 00                	push   $0x0
  pushl $97
80106542:	6a 61                	push   $0x61
  jmp alltraps
80106544:	e9 3e f6 ff ff       	jmp    80105b87 <alltraps>

80106549 <vector98>:
.globl vector98
vector98:
  pushl $0
80106549:	6a 00                	push   $0x0
  pushl $98
8010654b:	6a 62                	push   $0x62
  jmp alltraps
8010654d:	e9 35 f6 ff ff       	jmp    80105b87 <alltraps>

80106552 <vector99>:
.globl vector99
vector99:
  pushl $0
80106552:	6a 00                	push   $0x0
  pushl $99
80106554:	6a 63                	push   $0x63
  jmp alltraps
80106556:	e9 2c f6 ff ff       	jmp    80105b87 <alltraps>

8010655b <vector100>:
.globl vector100
vector100:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $100
8010655d:	6a 64                	push   $0x64
  jmp alltraps
8010655f:	e9 23 f6 ff ff       	jmp    80105b87 <alltraps>

80106564 <vector101>:
.globl vector101
vector101:
  pushl $0
80106564:	6a 00                	push   $0x0
  pushl $101
80106566:	6a 65                	push   $0x65
  jmp alltraps
80106568:	e9 1a f6 ff ff       	jmp    80105b87 <alltraps>

8010656d <vector102>:
.globl vector102
vector102:
  pushl $0
8010656d:	6a 00                	push   $0x0
  pushl $102
8010656f:	6a 66                	push   $0x66
  jmp alltraps
80106571:	e9 11 f6 ff ff       	jmp    80105b87 <alltraps>

80106576 <vector103>:
.globl vector103
vector103:
  pushl $0
80106576:	6a 00                	push   $0x0
  pushl $103
80106578:	6a 67                	push   $0x67
  jmp alltraps
8010657a:	e9 08 f6 ff ff       	jmp    80105b87 <alltraps>

8010657f <vector104>:
.globl vector104
vector104:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $104
80106581:	6a 68                	push   $0x68
  jmp alltraps
80106583:	e9 ff f5 ff ff       	jmp    80105b87 <alltraps>

80106588 <vector105>:
.globl vector105
vector105:
  pushl $0
80106588:	6a 00                	push   $0x0
  pushl $105
8010658a:	6a 69                	push   $0x69
  jmp alltraps
8010658c:	e9 f6 f5 ff ff       	jmp    80105b87 <alltraps>

80106591 <vector106>:
.globl vector106
vector106:
  pushl $0
80106591:	6a 00                	push   $0x0
  pushl $106
80106593:	6a 6a                	push   $0x6a
  jmp alltraps
80106595:	e9 ed f5 ff ff       	jmp    80105b87 <alltraps>

8010659a <vector107>:
.globl vector107
vector107:
  pushl $0
8010659a:	6a 00                	push   $0x0
  pushl $107
8010659c:	6a 6b                	push   $0x6b
  jmp alltraps
8010659e:	e9 e4 f5 ff ff       	jmp    80105b87 <alltraps>

801065a3 <vector108>:
.globl vector108
vector108:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $108
801065a5:	6a 6c                	push   $0x6c
  jmp alltraps
801065a7:	e9 db f5 ff ff       	jmp    80105b87 <alltraps>

801065ac <vector109>:
.globl vector109
vector109:
  pushl $0
801065ac:	6a 00                	push   $0x0
  pushl $109
801065ae:	6a 6d                	push   $0x6d
  jmp alltraps
801065b0:	e9 d2 f5 ff ff       	jmp    80105b87 <alltraps>

801065b5 <vector110>:
.globl vector110
vector110:
  pushl $0
801065b5:	6a 00                	push   $0x0
  pushl $110
801065b7:	6a 6e                	push   $0x6e
  jmp alltraps
801065b9:	e9 c9 f5 ff ff       	jmp    80105b87 <alltraps>

801065be <vector111>:
.globl vector111
vector111:
  pushl $0
801065be:	6a 00                	push   $0x0
  pushl $111
801065c0:	6a 6f                	push   $0x6f
  jmp alltraps
801065c2:	e9 c0 f5 ff ff       	jmp    80105b87 <alltraps>

801065c7 <vector112>:
.globl vector112
vector112:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $112
801065c9:	6a 70                	push   $0x70
  jmp alltraps
801065cb:	e9 b7 f5 ff ff       	jmp    80105b87 <alltraps>

801065d0 <vector113>:
.globl vector113
vector113:
  pushl $0
801065d0:	6a 00                	push   $0x0
  pushl $113
801065d2:	6a 71                	push   $0x71
  jmp alltraps
801065d4:	e9 ae f5 ff ff       	jmp    80105b87 <alltraps>

801065d9 <vector114>:
.globl vector114
vector114:
  pushl $0
801065d9:	6a 00                	push   $0x0
  pushl $114
801065db:	6a 72                	push   $0x72
  jmp alltraps
801065dd:	e9 a5 f5 ff ff       	jmp    80105b87 <alltraps>

801065e2 <vector115>:
.globl vector115
vector115:
  pushl $0
801065e2:	6a 00                	push   $0x0
  pushl $115
801065e4:	6a 73                	push   $0x73
  jmp alltraps
801065e6:	e9 9c f5 ff ff       	jmp    80105b87 <alltraps>

801065eb <vector116>:
.globl vector116
vector116:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $116
801065ed:	6a 74                	push   $0x74
  jmp alltraps
801065ef:	e9 93 f5 ff ff       	jmp    80105b87 <alltraps>

801065f4 <vector117>:
.globl vector117
vector117:
  pushl $0
801065f4:	6a 00                	push   $0x0
  pushl $117
801065f6:	6a 75                	push   $0x75
  jmp alltraps
801065f8:	e9 8a f5 ff ff       	jmp    80105b87 <alltraps>

801065fd <vector118>:
.globl vector118
vector118:
  pushl $0
801065fd:	6a 00                	push   $0x0
  pushl $118
801065ff:	6a 76                	push   $0x76
  jmp alltraps
80106601:	e9 81 f5 ff ff       	jmp    80105b87 <alltraps>

80106606 <vector119>:
.globl vector119
vector119:
  pushl $0
80106606:	6a 00                	push   $0x0
  pushl $119
80106608:	6a 77                	push   $0x77
  jmp alltraps
8010660a:	e9 78 f5 ff ff       	jmp    80105b87 <alltraps>

8010660f <vector120>:
.globl vector120
vector120:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $120
80106611:	6a 78                	push   $0x78
  jmp alltraps
80106613:	e9 6f f5 ff ff       	jmp    80105b87 <alltraps>

80106618 <vector121>:
.globl vector121
vector121:
  pushl $0
80106618:	6a 00                	push   $0x0
  pushl $121
8010661a:	6a 79                	push   $0x79
  jmp alltraps
8010661c:	e9 66 f5 ff ff       	jmp    80105b87 <alltraps>

80106621 <vector122>:
.globl vector122
vector122:
  pushl $0
80106621:	6a 00                	push   $0x0
  pushl $122
80106623:	6a 7a                	push   $0x7a
  jmp alltraps
80106625:	e9 5d f5 ff ff       	jmp    80105b87 <alltraps>

8010662a <vector123>:
.globl vector123
vector123:
  pushl $0
8010662a:	6a 00                	push   $0x0
  pushl $123
8010662c:	6a 7b                	push   $0x7b
  jmp alltraps
8010662e:	e9 54 f5 ff ff       	jmp    80105b87 <alltraps>

80106633 <vector124>:
.globl vector124
vector124:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $124
80106635:	6a 7c                	push   $0x7c
  jmp alltraps
80106637:	e9 4b f5 ff ff       	jmp    80105b87 <alltraps>

8010663c <vector125>:
.globl vector125
vector125:
  pushl $0
8010663c:	6a 00                	push   $0x0
  pushl $125
8010663e:	6a 7d                	push   $0x7d
  jmp alltraps
80106640:	e9 42 f5 ff ff       	jmp    80105b87 <alltraps>

80106645 <vector126>:
.globl vector126
vector126:
  pushl $0
80106645:	6a 00                	push   $0x0
  pushl $126
80106647:	6a 7e                	push   $0x7e
  jmp alltraps
80106649:	e9 39 f5 ff ff       	jmp    80105b87 <alltraps>

8010664e <vector127>:
.globl vector127
vector127:
  pushl $0
8010664e:	6a 00                	push   $0x0
  pushl $127
80106650:	6a 7f                	push   $0x7f
  jmp alltraps
80106652:	e9 30 f5 ff ff       	jmp    80105b87 <alltraps>

80106657 <vector128>:
.globl vector128
vector128:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $128
80106659:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010665e:	e9 24 f5 ff ff       	jmp    80105b87 <alltraps>

80106663 <vector129>:
.globl vector129
vector129:
  pushl $0
80106663:	6a 00                	push   $0x0
  pushl $129
80106665:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010666a:	e9 18 f5 ff ff       	jmp    80105b87 <alltraps>

8010666f <vector130>:
.globl vector130
vector130:
  pushl $0
8010666f:	6a 00                	push   $0x0
  pushl $130
80106671:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106676:	e9 0c f5 ff ff       	jmp    80105b87 <alltraps>

8010667b <vector131>:
.globl vector131
vector131:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $131
8010667d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80106682:	e9 00 f5 ff ff       	jmp    80105b87 <alltraps>

80106687 <vector132>:
.globl vector132
vector132:
  pushl $0
80106687:	6a 00                	push   $0x0
  pushl $132
80106689:	68 84 00 00 00       	push   $0x84
  jmp alltraps
8010668e:	e9 f4 f4 ff ff       	jmp    80105b87 <alltraps>

80106693 <vector133>:
.globl vector133
vector133:
  pushl $0
80106693:	6a 00                	push   $0x0
  pushl $133
80106695:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010669a:	e9 e8 f4 ff ff       	jmp    80105b87 <alltraps>

8010669f <vector134>:
.globl vector134
vector134:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $134
801066a1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801066a6:	e9 dc f4 ff ff       	jmp    80105b87 <alltraps>

801066ab <vector135>:
.globl vector135
vector135:
  pushl $0
801066ab:	6a 00                	push   $0x0
  pushl $135
801066ad:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801066b2:	e9 d0 f4 ff ff       	jmp    80105b87 <alltraps>

801066b7 <vector136>:
.globl vector136
vector136:
  pushl $0
801066b7:	6a 00                	push   $0x0
  pushl $136
801066b9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801066be:	e9 c4 f4 ff ff       	jmp    80105b87 <alltraps>

801066c3 <vector137>:
.globl vector137
vector137:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $137
801066c5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801066ca:	e9 b8 f4 ff ff       	jmp    80105b87 <alltraps>

801066cf <vector138>:
.globl vector138
vector138:
  pushl $0
801066cf:	6a 00                	push   $0x0
  pushl $138
801066d1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801066d6:	e9 ac f4 ff ff       	jmp    80105b87 <alltraps>

801066db <vector139>:
.globl vector139
vector139:
  pushl $0
801066db:	6a 00                	push   $0x0
  pushl $139
801066dd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801066e2:	e9 a0 f4 ff ff       	jmp    80105b87 <alltraps>

801066e7 <vector140>:
.globl vector140
vector140:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $140
801066e9:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801066ee:	e9 94 f4 ff ff       	jmp    80105b87 <alltraps>

801066f3 <vector141>:
.globl vector141
vector141:
  pushl $0
801066f3:	6a 00                	push   $0x0
  pushl $141
801066f5:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801066fa:	e9 88 f4 ff ff       	jmp    80105b87 <alltraps>

801066ff <vector142>:
.globl vector142
vector142:
  pushl $0
801066ff:	6a 00                	push   $0x0
  pushl $142
80106701:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106706:	e9 7c f4 ff ff       	jmp    80105b87 <alltraps>

8010670b <vector143>:
.globl vector143
vector143:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $143
8010670d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106712:	e9 70 f4 ff ff       	jmp    80105b87 <alltraps>

80106717 <vector144>:
.globl vector144
vector144:
  pushl $0
80106717:	6a 00                	push   $0x0
  pushl $144
80106719:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010671e:	e9 64 f4 ff ff       	jmp    80105b87 <alltraps>

80106723 <vector145>:
.globl vector145
vector145:
  pushl $0
80106723:	6a 00                	push   $0x0
  pushl $145
80106725:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010672a:	e9 58 f4 ff ff       	jmp    80105b87 <alltraps>

8010672f <vector146>:
.globl vector146
vector146:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $146
80106731:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106736:	e9 4c f4 ff ff       	jmp    80105b87 <alltraps>

8010673b <vector147>:
.globl vector147
vector147:
  pushl $0
8010673b:	6a 00                	push   $0x0
  pushl $147
8010673d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106742:	e9 40 f4 ff ff       	jmp    80105b87 <alltraps>

80106747 <vector148>:
.globl vector148
vector148:
  pushl $0
80106747:	6a 00                	push   $0x0
  pushl $148
80106749:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010674e:	e9 34 f4 ff ff       	jmp    80105b87 <alltraps>

80106753 <vector149>:
.globl vector149
vector149:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $149
80106755:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010675a:	e9 28 f4 ff ff       	jmp    80105b87 <alltraps>

8010675f <vector150>:
.globl vector150
vector150:
  pushl $0
8010675f:	6a 00                	push   $0x0
  pushl $150
80106761:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106766:	e9 1c f4 ff ff       	jmp    80105b87 <alltraps>

8010676b <vector151>:
.globl vector151
vector151:
  pushl $0
8010676b:	6a 00                	push   $0x0
  pushl $151
8010676d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106772:	e9 10 f4 ff ff       	jmp    80105b87 <alltraps>

80106777 <vector152>:
.globl vector152
vector152:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $152
80106779:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010677e:	e9 04 f4 ff ff       	jmp    80105b87 <alltraps>

80106783 <vector153>:
.globl vector153
vector153:
  pushl $0
80106783:	6a 00                	push   $0x0
  pushl $153
80106785:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010678a:	e9 f8 f3 ff ff       	jmp    80105b87 <alltraps>

8010678f <vector154>:
.globl vector154
vector154:
  pushl $0
8010678f:	6a 00                	push   $0x0
  pushl $154
80106791:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106796:	e9 ec f3 ff ff       	jmp    80105b87 <alltraps>

8010679b <vector155>:
.globl vector155
vector155:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $155
8010679d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801067a2:	e9 e0 f3 ff ff       	jmp    80105b87 <alltraps>

801067a7 <vector156>:
.globl vector156
vector156:
  pushl $0
801067a7:	6a 00                	push   $0x0
  pushl $156
801067a9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801067ae:	e9 d4 f3 ff ff       	jmp    80105b87 <alltraps>

801067b3 <vector157>:
.globl vector157
vector157:
  pushl $0
801067b3:	6a 00                	push   $0x0
  pushl $157
801067b5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801067ba:	e9 c8 f3 ff ff       	jmp    80105b87 <alltraps>

801067bf <vector158>:
.globl vector158
vector158:
  pushl $0
801067bf:	6a 00                	push   $0x0
  pushl $158
801067c1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801067c6:	e9 bc f3 ff ff       	jmp    80105b87 <alltraps>

801067cb <vector159>:
.globl vector159
vector159:
  pushl $0
801067cb:	6a 00                	push   $0x0
  pushl $159
801067cd:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801067d2:	e9 b0 f3 ff ff       	jmp    80105b87 <alltraps>

801067d7 <vector160>:
.globl vector160
vector160:
  pushl $0
801067d7:	6a 00                	push   $0x0
  pushl $160
801067d9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801067de:	e9 a4 f3 ff ff       	jmp    80105b87 <alltraps>

801067e3 <vector161>:
.globl vector161
vector161:
  pushl $0
801067e3:	6a 00                	push   $0x0
  pushl $161
801067e5:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801067ea:	e9 98 f3 ff ff       	jmp    80105b87 <alltraps>

801067ef <vector162>:
.globl vector162
vector162:
  pushl $0
801067ef:	6a 00                	push   $0x0
  pushl $162
801067f1:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801067f6:	e9 8c f3 ff ff       	jmp    80105b87 <alltraps>

801067fb <vector163>:
.globl vector163
vector163:
  pushl $0
801067fb:	6a 00                	push   $0x0
  pushl $163
801067fd:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106802:	e9 80 f3 ff ff       	jmp    80105b87 <alltraps>

80106807 <vector164>:
.globl vector164
vector164:
  pushl $0
80106807:	6a 00                	push   $0x0
  pushl $164
80106809:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010680e:	e9 74 f3 ff ff       	jmp    80105b87 <alltraps>

80106813 <vector165>:
.globl vector165
vector165:
  pushl $0
80106813:	6a 00                	push   $0x0
  pushl $165
80106815:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010681a:	e9 68 f3 ff ff       	jmp    80105b87 <alltraps>

8010681f <vector166>:
.globl vector166
vector166:
  pushl $0
8010681f:	6a 00                	push   $0x0
  pushl $166
80106821:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106826:	e9 5c f3 ff ff       	jmp    80105b87 <alltraps>

8010682b <vector167>:
.globl vector167
vector167:
  pushl $0
8010682b:	6a 00                	push   $0x0
  pushl $167
8010682d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106832:	e9 50 f3 ff ff       	jmp    80105b87 <alltraps>

80106837 <vector168>:
.globl vector168
vector168:
  pushl $0
80106837:	6a 00                	push   $0x0
  pushl $168
80106839:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010683e:	e9 44 f3 ff ff       	jmp    80105b87 <alltraps>

80106843 <vector169>:
.globl vector169
vector169:
  pushl $0
80106843:	6a 00                	push   $0x0
  pushl $169
80106845:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010684a:	e9 38 f3 ff ff       	jmp    80105b87 <alltraps>

8010684f <vector170>:
.globl vector170
vector170:
  pushl $0
8010684f:	6a 00                	push   $0x0
  pushl $170
80106851:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106856:	e9 2c f3 ff ff       	jmp    80105b87 <alltraps>

8010685b <vector171>:
.globl vector171
vector171:
  pushl $0
8010685b:	6a 00                	push   $0x0
  pushl $171
8010685d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106862:	e9 20 f3 ff ff       	jmp    80105b87 <alltraps>

80106867 <vector172>:
.globl vector172
vector172:
  pushl $0
80106867:	6a 00                	push   $0x0
  pushl $172
80106869:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010686e:	e9 14 f3 ff ff       	jmp    80105b87 <alltraps>

80106873 <vector173>:
.globl vector173
vector173:
  pushl $0
80106873:	6a 00                	push   $0x0
  pushl $173
80106875:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010687a:	e9 08 f3 ff ff       	jmp    80105b87 <alltraps>

8010687f <vector174>:
.globl vector174
vector174:
  pushl $0
8010687f:	6a 00                	push   $0x0
  pushl $174
80106881:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106886:	e9 fc f2 ff ff       	jmp    80105b87 <alltraps>

8010688b <vector175>:
.globl vector175
vector175:
  pushl $0
8010688b:	6a 00                	push   $0x0
  pushl $175
8010688d:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106892:	e9 f0 f2 ff ff       	jmp    80105b87 <alltraps>

80106897 <vector176>:
.globl vector176
vector176:
  pushl $0
80106897:	6a 00                	push   $0x0
  pushl $176
80106899:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010689e:	e9 e4 f2 ff ff       	jmp    80105b87 <alltraps>

801068a3 <vector177>:
.globl vector177
vector177:
  pushl $0
801068a3:	6a 00                	push   $0x0
  pushl $177
801068a5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801068aa:	e9 d8 f2 ff ff       	jmp    80105b87 <alltraps>

801068af <vector178>:
.globl vector178
vector178:
  pushl $0
801068af:	6a 00                	push   $0x0
  pushl $178
801068b1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801068b6:	e9 cc f2 ff ff       	jmp    80105b87 <alltraps>

801068bb <vector179>:
.globl vector179
vector179:
  pushl $0
801068bb:	6a 00                	push   $0x0
  pushl $179
801068bd:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801068c2:	e9 c0 f2 ff ff       	jmp    80105b87 <alltraps>

801068c7 <vector180>:
.globl vector180
vector180:
  pushl $0
801068c7:	6a 00                	push   $0x0
  pushl $180
801068c9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801068ce:	e9 b4 f2 ff ff       	jmp    80105b87 <alltraps>

801068d3 <vector181>:
.globl vector181
vector181:
  pushl $0
801068d3:	6a 00                	push   $0x0
  pushl $181
801068d5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801068da:	e9 a8 f2 ff ff       	jmp    80105b87 <alltraps>

801068df <vector182>:
.globl vector182
vector182:
  pushl $0
801068df:	6a 00                	push   $0x0
  pushl $182
801068e1:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801068e6:	e9 9c f2 ff ff       	jmp    80105b87 <alltraps>

801068eb <vector183>:
.globl vector183
vector183:
  pushl $0
801068eb:	6a 00                	push   $0x0
  pushl $183
801068ed:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801068f2:	e9 90 f2 ff ff       	jmp    80105b87 <alltraps>

801068f7 <vector184>:
.globl vector184
vector184:
  pushl $0
801068f7:	6a 00                	push   $0x0
  pushl $184
801068f9:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801068fe:	e9 84 f2 ff ff       	jmp    80105b87 <alltraps>

80106903 <vector185>:
.globl vector185
vector185:
  pushl $0
80106903:	6a 00                	push   $0x0
  pushl $185
80106905:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010690a:	e9 78 f2 ff ff       	jmp    80105b87 <alltraps>

8010690f <vector186>:
.globl vector186
vector186:
  pushl $0
8010690f:	6a 00                	push   $0x0
  pushl $186
80106911:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106916:	e9 6c f2 ff ff       	jmp    80105b87 <alltraps>

8010691b <vector187>:
.globl vector187
vector187:
  pushl $0
8010691b:	6a 00                	push   $0x0
  pushl $187
8010691d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106922:	e9 60 f2 ff ff       	jmp    80105b87 <alltraps>

80106927 <vector188>:
.globl vector188
vector188:
  pushl $0
80106927:	6a 00                	push   $0x0
  pushl $188
80106929:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010692e:	e9 54 f2 ff ff       	jmp    80105b87 <alltraps>

80106933 <vector189>:
.globl vector189
vector189:
  pushl $0
80106933:	6a 00                	push   $0x0
  pushl $189
80106935:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010693a:	e9 48 f2 ff ff       	jmp    80105b87 <alltraps>

8010693f <vector190>:
.globl vector190
vector190:
  pushl $0
8010693f:	6a 00                	push   $0x0
  pushl $190
80106941:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106946:	e9 3c f2 ff ff       	jmp    80105b87 <alltraps>

8010694b <vector191>:
.globl vector191
vector191:
  pushl $0
8010694b:	6a 00                	push   $0x0
  pushl $191
8010694d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106952:	e9 30 f2 ff ff       	jmp    80105b87 <alltraps>

80106957 <vector192>:
.globl vector192
vector192:
  pushl $0
80106957:	6a 00                	push   $0x0
  pushl $192
80106959:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010695e:	e9 24 f2 ff ff       	jmp    80105b87 <alltraps>

80106963 <vector193>:
.globl vector193
vector193:
  pushl $0
80106963:	6a 00                	push   $0x0
  pushl $193
80106965:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010696a:	e9 18 f2 ff ff       	jmp    80105b87 <alltraps>

8010696f <vector194>:
.globl vector194
vector194:
  pushl $0
8010696f:	6a 00                	push   $0x0
  pushl $194
80106971:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106976:	e9 0c f2 ff ff       	jmp    80105b87 <alltraps>

8010697b <vector195>:
.globl vector195
vector195:
  pushl $0
8010697b:	6a 00                	push   $0x0
  pushl $195
8010697d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106982:	e9 00 f2 ff ff       	jmp    80105b87 <alltraps>

80106987 <vector196>:
.globl vector196
vector196:
  pushl $0
80106987:	6a 00                	push   $0x0
  pushl $196
80106989:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010698e:	e9 f4 f1 ff ff       	jmp    80105b87 <alltraps>

80106993 <vector197>:
.globl vector197
vector197:
  pushl $0
80106993:	6a 00                	push   $0x0
  pushl $197
80106995:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010699a:	e9 e8 f1 ff ff       	jmp    80105b87 <alltraps>

8010699f <vector198>:
.globl vector198
vector198:
  pushl $0
8010699f:	6a 00                	push   $0x0
  pushl $198
801069a1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801069a6:	e9 dc f1 ff ff       	jmp    80105b87 <alltraps>

801069ab <vector199>:
.globl vector199
vector199:
  pushl $0
801069ab:	6a 00                	push   $0x0
  pushl $199
801069ad:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801069b2:	e9 d0 f1 ff ff       	jmp    80105b87 <alltraps>

801069b7 <vector200>:
.globl vector200
vector200:
  pushl $0
801069b7:	6a 00                	push   $0x0
  pushl $200
801069b9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801069be:	e9 c4 f1 ff ff       	jmp    80105b87 <alltraps>

801069c3 <vector201>:
.globl vector201
vector201:
  pushl $0
801069c3:	6a 00                	push   $0x0
  pushl $201
801069c5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801069ca:	e9 b8 f1 ff ff       	jmp    80105b87 <alltraps>

801069cf <vector202>:
.globl vector202
vector202:
  pushl $0
801069cf:	6a 00                	push   $0x0
  pushl $202
801069d1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801069d6:	e9 ac f1 ff ff       	jmp    80105b87 <alltraps>

801069db <vector203>:
.globl vector203
vector203:
  pushl $0
801069db:	6a 00                	push   $0x0
  pushl $203
801069dd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801069e2:	e9 a0 f1 ff ff       	jmp    80105b87 <alltraps>

801069e7 <vector204>:
.globl vector204
vector204:
  pushl $0
801069e7:	6a 00                	push   $0x0
  pushl $204
801069e9:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801069ee:	e9 94 f1 ff ff       	jmp    80105b87 <alltraps>

801069f3 <vector205>:
.globl vector205
vector205:
  pushl $0
801069f3:	6a 00                	push   $0x0
  pushl $205
801069f5:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801069fa:	e9 88 f1 ff ff       	jmp    80105b87 <alltraps>

801069ff <vector206>:
.globl vector206
vector206:
  pushl $0
801069ff:	6a 00                	push   $0x0
  pushl $206
80106a01:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106a06:	e9 7c f1 ff ff       	jmp    80105b87 <alltraps>

80106a0b <vector207>:
.globl vector207
vector207:
  pushl $0
80106a0b:	6a 00                	push   $0x0
  pushl $207
80106a0d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106a12:	e9 70 f1 ff ff       	jmp    80105b87 <alltraps>

80106a17 <vector208>:
.globl vector208
vector208:
  pushl $0
80106a17:	6a 00                	push   $0x0
  pushl $208
80106a19:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106a1e:	e9 64 f1 ff ff       	jmp    80105b87 <alltraps>

80106a23 <vector209>:
.globl vector209
vector209:
  pushl $0
80106a23:	6a 00                	push   $0x0
  pushl $209
80106a25:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106a2a:	e9 58 f1 ff ff       	jmp    80105b87 <alltraps>

80106a2f <vector210>:
.globl vector210
vector210:
  pushl $0
80106a2f:	6a 00                	push   $0x0
  pushl $210
80106a31:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106a36:	e9 4c f1 ff ff       	jmp    80105b87 <alltraps>

80106a3b <vector211>:
.globl vector211
vector211:
  pushl $0
80106a3b:	6a 00                	push   $0x0
  pushl $211
80106a3d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106a42:	e9 40 f1 ff ff       	jmp    80105b87 <alltraps>

80106a47 <vector212>:
.globl vector212
vector212:
  pushl $0
80106a47:	6a 00                	push   $0x0
  pushl $212
80106a49:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106a4e:	e9 34 f1 ff ff       	jmp    80105b87 <alltraps>

80106a53 <vector213>:
.globl vector213
vector213:
  pushl $0
80106a53:	6a 00                	push   $0x0
  pushl $213
80106a55:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106a5a:	e9 28 f1 ff ff       	jmp    80105b87 <alltraps>

80106a5f <vector214>:
.globl vector214
vector214:
  pushl $0
80106a5f:	6a 00                	push   $0x0
  pushl $214
80106a61:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106a66:	e9 1c f1 ff ff       	jmp    80105b87 <alltraps>

80106a6b <vector215>:
.globl vector215
vector215:
  pushl $0
80106a6b:	6a 00                	push   $0x0
  pushl $215
80106a6d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106a72:	e9 10 f1 ff ff       	jmp    80105b87 <alltraps>

80106a77 <vector216>:
.globl vector216
vector216:
  pushl $0
80106a77:	6a 00                	push   $0x0
  pushl $216
80106a79:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106a7e:	e9 04 f1 ff ff       	jmp    80105b87 <alltraps>

80106a83 <vector217>:
.globl vector217
vector217:
  pushl $0
80106a83:	6a 00                	push   $0x0
  pushl $217
80106a85:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106a8a:	e9 f8 f0 ff ff       	jmp    80105b87 <alltraps>

80106a8f <vector218>:
.globl vector218
vector218:
  pushl $0
80106a8f:	6a 00                	push   $0x0
  pushl $218
80106a91:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106a96:	e9 ec f0 ff ff       	jmp    80105b87 <alltraps>

80106a9b <vector219>:
.globl vector219
vector219:
  pushl $0
80106a9b:	6a 00                	push   $0x0
  pushl $219
80106a9d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106aa2:	e9 e0 f0 ff ff       	jmp    80105b87 <alltraps>

80106aa7 <vector220>:
.globl vector220
vector220:
  pushl $0
80106aa7:	6a 00                	push   $0x0
  pushl $220
80106aa9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106aae:	e9 d4 f0 ff ff       	jmp    80105b87 <alltraps>

80106ab3 <vector221>:
.globl vector221
vector221:
  pushl $0
80106ab3:	6a 00                	push   $0x0
  pushl $221
80106ab5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106aba:	e9 c8 f0 ff ff       	jmp    80105b87 <alltraps>

80106abf <vector222>:
.globl vector222
vector222:
  pushl $0
80106abf:	6a 00                	push   $0x0
  pushl $222
80106ac1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106ac6:	e9 bc f0 ff ff       	jmp    80105b87 <alltraps>

80106acb <vector223>:
.globl vector223
vector223:
  pushl $0
80106acb:	6a 00                	push   $0x0
  pushl $223
80106acd:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106ad2:	e9 b0 f0 ff ff       	jmp    80105b87 <alltraps>

80106ad7 <vector224>:
.globl vector224
vector224:
  pushl $0
80106ad7:	6a 00                	push   $0x0
  pushl $224
80106ad9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106ade:	e9 a4 f0 ff ff       	jmp    80105b87 <alltraps>

80106ae3 <vector225>:
.globl vector225
vector225:
  pushl $0
80106ae3:	6a 00                	push   $0x0
  pushl $225
80106ae5:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106aea:	e9 98 f0 ff ff       	jmp    80105b87 <alltraps>

80106aef <vector226>:
.globl vector226
vector226:
  pushl $0
80106aef:	6a 00                	push   $0x0
  pushl $226
80106af1:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106af6:	e9 8c f0 ff ff       	jmp    80105b87 <alltraps>

80106afb <vector227>:
.globl vector227
vector227:
  pushl $0
80106afb:	6a 00                	push   $0x0
  pushl $227
80106afd:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106b02:	e9 80 f0 ff ff       	jmp    80105b87 <alltraps>

80106b07 <vector228>:
.globl vector228
vector228:
  pushl $0
80106b07:	6a 00                	push   $0x0
  pushl $228
80106b09:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106b0e:	e9 74 f0 ff ff       	jmp    80105b87 <alltraps>

80106b13 <vector229>:
.globl vector229
vector229:
  pushl $0
80106b13:	6a 00                	push   $0x0
  pushl $229
80106b15:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106b1a:	e9 68 f0 ff ff       	jmp    80105b87 <alltraps>

80106b1f <vector230>:
.globl vector230
vector230:
  pushl $0
80106b1f:	6a 00                	push   $0x0
  pushl $230
80106b21:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106b26:	e9 5c f0 ff ff       	jmp    80105b87 <alltraps>

80106b2b <vector231>:
.globl vector231
vector231:
  pushl $0
80106b2b:	6a 00                	push   $0x0
  pushl $231
80106b2d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106b32:	e9 50 f0 ff ff       	jmp    80105b87 <alltraps>

80106b37 <vector232>:
.globl vector232
vector232:
  pushl $0
80106b37:	6a 00                	push   $0x0
  pushl $232
80106b39:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106b3e:	e9 44 f0 ff ff       	jmp    80105b87 <alltraps>

80106b43 <vector233>:
.globl vector233
vector233:
  pushl $0
80106b43:	6a 00                	push   $0x0
  pushl $233
80106b45:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106b4a:	e9 38 f0 ff ff       	jmp    80105b87 <alltraps>

80106b4f <vector234>:
.globl vector234
vector234:
  pushl $0
80106b4f:	6a 00                	push   $0x0
  pushl $234
80106b51:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106b56:	e9 2c f0 ff ff       	jmp    80105b87 <alltraps>

80106b5b <vector235>:
.globl vector235
vector235:
  pushl $0
80106b5b:	6a 00                	push   $0x0
  pushl $235
80106b5d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106b62:	e9 20 f0 ff ff       	jmp    80105b87 <alltraps>

80106b67 <vector236>:
.globl vector236
vector236:
  pushl $0
80106b67:	6a 00                	push   $0x0
  pushl $236
80106b69:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106b6e:	e9 14 f0 ff ff       	jmp    80105b87 <alltraps>

80106b73 <vector237>:
.globl vector237
vector237:
  pushl $0
80106b73:	6a 00                	push   $0x0
  pushl $237
80106b75:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106b7a:	e9 08 f0 ff ff       	jmp    80105b87 <alltraps>

80106b7f <vector238>:
.globl vector238
vector238:
  pushl $0
80106b7f:	6a 00                	push   $0x0
  pushl $238
80106b81:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106b86:	e9 fc ef ff ff       	jmp    80105b87 <alltraps>

80106b8b <vector239>:
.globl vector239
vector239:
  pushl $0
80106b8b:	6a 00                	push   $0x0
  pushl $239
80106b8d:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106b92:	e9 f0 ef ff ff       	jmp    80105b87 <alltraps>

80106b97 <vector240>:
.globl vector240
vector240:
  pushl $0
80106b97:	6a 00                	push   $0x0
  pushl $240
80106b99:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106b9e:	e9 e4 ef ff ff       	jmp    80105b87 <alltraps>

80106ba3 <vector241>:
.globl vector241
vector241:
  pushl $0
80106ba3:	6a 00                	push   $0x0
  pushl $241
80106ba5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106baa:	e9 d8 ef ff ff       	jmp    80105b87 <alltraps>

80106baf <vector242>:
.globl vector242
vector242:
  pushl $0
80106baf:	6a 00                	push   $0x0
  pushl $242
80106bb1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106bb6:	e9 cc ef ff ff       	jmp    80105b87 <alltraps>

80106bbb <vector243>:
.globl vector243
vector243:
  pushl $0
80106bbb:	6a 00                	push   $0x0
  pushl $243
80106bbd:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106bc2:	e9 c0 ef ff ff       	jmp    80105b87 <alltraps>

80106bc7 <vector244>:
.globl vector244
vector244:
  pushl $0
80106bc7:	6a 00                	push   $0x0
  pushl $244
80106bc9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106bce:	e9 b4 ef ff ff       	jmp    80105b87 <alltraps>

80106bd3 <vector245>:
.globl vector245
vector245:
  pushl $0
80106bd3:	6a 00                	push   $0x0
  pushl $245
80106bd5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106bda:	e9 a8 ef ff ff       	jmp    80105b87 <alltraps>

80106bdf <vector246>:
.globl vector246
vector246:
  pushl $0
80106bdf:	6a 00                	push   $0x0
  pushl $246
80106be1:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106be6:	e9 9c ef ff ff       	jmp    80105b87 <alltraps>

80106beb <vector247>:
.globl vector247
vector247:
  pushl $0
80106beb:	6a 00                	push   $0x0
  pushl $247
80106bed:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106bf2:	e9 90 ef ff ff       	jmp    80105b87 <alltraps>

80106bf7 <vector248>:
.globl vector248
vector248:
  pushl $0
80106bf7:	6a 00                	push   $0x0
  pushl $248
80106bf9:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106bfe:	e9 84 ef ff ff       	jmp    80105b87 <alltraps>

80106c03 <vector249>:
.globl vector249
vector249:
  pushl $0
80106c03:	6a 00                	push   $0x0
  pushl $249
80106c05:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106c0a:	e9 78 ef ff ff       	jmp    80105b87 <alltraps>

80106c0f <vector250>:
.globl vector250
vector250:
  pushl $0
80106c0f:	6a 00                	push   $0x0
  pushl $250
80106c11:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106c16:	e9 6c ef ff ff       	jmp    80105b87 <alltraps>

80106c1b <vector251>:
.globl vector251
vector251:
  pushl $0
80106c1b:	6a 00                	push   $0x0
  pushl $251
80106c1d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106c22:	e9 60 ef ff ff       	jmp    80105b87 <alltraps>

80106c27 <vector252>:
.globl vector252
vector252:
  pushl $0
80106c27:	6a 00                	push   $0x0
  pushl $252
80106c29:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106c2e:	e9 54 ef ff ff       	jmp    80105b87 <alltraps>

80106c33 <vector253>:
.globl vector253
vector253:
  pushl $0
80106c33:	6a 00                	push   $0x0
  pushl $253
80106c35:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106c3a:	e9 48 ef ff ff       	jmp    80105b87 <alltraps>

80106c3f <vector254>:
.globl vector254
vector254:
  pushl $0
80106c3f:	6a 00                	push   $0x0
  pushl $254
80106c41:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106c46:	e9 3c ef ff ff       	jmp    80105b87 <alltraps>

80106c4b <vector255>:
.globl vector255
vector255:
  pushl $0
80106c4b:	6a 00                	push   $0x0
  pushl $255
80106c4d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106c52:	e9 30 ef ff ff       	jmp    80105b87 <alltraps>
80106c57:	66 90                	xchg   %ax,%ax
80106c59:	66 90                	xchg   %ax,%ax
80106c5b:	66 90                	xchg   %ax,%ax
80106c5d:	66 90                	xchg   %ax,%ax
80106c5f:	90                   	nop

80106c60 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106c60:	55                   	push   %ebp
80106c61:	89 e5                	mov    %esp,%ebp
80106c63:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106c66:	e8 b5 cd ff ff       	call   80103a20 <cpuid>
80106c6b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
  pd[0] = size-1;
80106c71:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106c76:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106c7a:	c7 80 f8 c1 14 80 ff 	movl   $0xffff,-0x7feb3e08(%eax)
80106c81:	ff 00 00 
80106c84:	c7 80 fc c1 14 80 00 	movl   $0xcf9a00,-0x7feb3e04(%eax)
80106c8b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106c8e:	c7 80 00 c2 14 80 ff 	movl   $0xffff,-0x7feb3e00(%eax)
80106c95:	ff 00 00 
80106c98:	c7 80 04 c2 14 80 00 	movl   $0xcf9200,-0x7feb3dfc(%eax)
80106c9f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ca2:	c7 80 08 c2 14 80 ff 	movl   $0xffff,-0x7feb3df8(%eax)
80106ca9:	ff 00 00 
80106cac:	c7 80 0c c2 14 80 00 	movl   $0xcffa00,-0x7feb3df4(%eax)
80106cb3:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106cb6:	c7 80 10 c2 14 80 ff 	movl   $0xffff,-0x7feb3df0(%eax)
80106cbd:	ff 00 00 
80106cc0:	c7 80 14 c2 14 80 00 	movl   $0xcff200,-0x7feb3dec(%eax)
80106cc7:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106cca:	05 f0 c1 14 80       	add    $0x8014c1f0,%eax
  pd[1] = (uint)p;
80106ccf:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106cd3:	c1 e8 10             	shr    $0x10,%eax
80106cd6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106cda:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106cdd:	0f 01 10             	lgdtl  (%eax)
}
80106ce0:	c9                   	leave  
80106ce1:	c3                   	ret    
80106ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cf0 <walkpgdir>:
// create any required page table pages.

// static
pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	83 ec 0c             	sub    $0xc,%esp
80106cf9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106cfc:	8b 55 08             	mov    0x8(%ebp),%edx
80106cff:	89 fe                	mov    %edi,%esi
80106d01:	c1 ee 16             	shr    $0x16,%esi
80106d04:	8d 34 b2             	lea    (%edx,%esi,4),%esi
  if(*pde & PTE_P){
80106d07:	8b 1e                	mov    (%esi),%ebx
80106d09:	f6 c3 01             	test   $0x1,%bl
80106d0c:	74 22                	je     80106d30 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106d0e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106d14:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106d1a:	89 f8                	mov    %edi,%eax
}
80106d1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return &pgtab[PTX(va)];
80106d1f:	c1 e8 0a             	shr    $0xa,%eax
80106d22:	25 fc 0f 00 00       	and    $0xffc,%eax
80106d27:	01 d8                	add    %ebx,%eax
}
80106d29:	5b                   	pop    %ebx
80106d2a:	5e                   	pop    %esi
80106d2b:	5f                   	pop    %edi
80106d2c:	5d                   	pop    %ebp
80106d2d:	c3                   	ret    
80106d2e:	66 90                	xchg   %ax,%ax
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106d30:	8b 45 10             	mov    0x10(%ebp),%eax
80106d33:	85 c0                	test   %eax,%eax
80106d35:	74 31                	je     80106d68 <walkpgdir+0x78>
80106d37:	e8 a4 b7 ff ff       	call   801024e0 <kalloc>
80106d3c:	85 c0                	test   %eax,%eax
80106d3e:	89 c3                	mov    %eax,%ebx
80106d40:	74 26                	je     80106d68 <walkpgdir+0x78>
    memset(pgtab, 0, PGSIZE);
80106d42:	83 ec 04             	sub    $0x4,%esp
80106d45:	68 00 10 00 00       	push   $0x1000
80106d4a:	6a 00                	push   $0x0
80106d4c:	50                   	push   %eax
80106d4d:	e8 6e db ff ff       	call   801048c0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106d52:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d58:	83 c4 10             	add    $0x10,%esp
80106d5b:	83 c8 07             	or     $0x7,%eax
80106d5e:	89 06                	mov    %eax,(%esi)
80106d60:	eb b8                	jmp    80106d1a <walkpgdir+0x2a>
80106d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
80106d68:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
80106d6b:	31 c0                	xor    %eax,%eax
}
80106d6d:	5b                   	pop    %ebx
80106d6e:	5e                   	pop    %esi
80106d6f:	5f                   	pop    %edi
80106d70:	5d                   	pop    %ebp
80106d71:	c3                   	ret    
80106d72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d80 <deallocuvm.part.0>:
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.

// do not free pages that have references; need lock
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d80:	55                   	push   %ebp
80106d81:	89 e5                	mov    %esp,%ebp
80106d83:	57                   	push   %edi
80106d84:	56                   	push   %esi
80106d85:	53                   	push   %ebx
80106d86:	89 d3                	mov    %edx,%ebx
  // char shared;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106d88:	8d 91 ff 0f 00 00    	lea    0xfff(%ecx),%edx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d8e:	89 c6                	mov    %eax,%esi
  a = PGROUNDUP(newsz);
80106d90:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106d96:	83 ec 1c             	sub    $0x1c,%esp
80106d99:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106d9c:	39 da                	cmp    %ebx,%edx
80106d9e:	73 6a                	jae    80106e0a <deallocuvm.part.0+0x8a>
80106da0:	89 d7                	mov    %edx,%edi
80106da2:	eb 3b                	jmp    80106ddf <deallocuvm.part.0+0x5f>
80106da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106da8:	8b 08                	mov    (%eax),%ecx
80106daa:	f6 c1 01             	test   $0x1,%cl
80106dad:	74 26                	je     80106dd5 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106daf:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
80106db5:	74 5e                	je     80106e15 <deallocuvm.part.0+0x95>
      if(!shared) { 
        cprintf("Freeing page at va = %p\n", P2V(pa));
        char *v = P2V(pa);
        kfree(v);
      } */
      kfree((char*) P2V(pa));
80106db7:	83 ec 0c             	sub    $0xc,%esp
80106dba:	81 c1 00 00 00 80    	add    $0x80000000,%ecx
80106dc0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106dc3:	51                   	push   %ecx
80106dc4:	e8 57 b5 ff ff       	call   80102320 <kfree>

      *pte = 0;
80106dc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106dcc:	83 c4 10             	add    $0x10,%esp
80106dcf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106dd5:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106ddb:	39 df                	cmp    %ebx,%edi
80106ddd:	73 2b                	jae    80106e0a <deallocuvm.part.0+0x8a>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106ddf:	83 ec 04             	sub    $0x4,%esp
80106de2:	6a 00                	push   $0x0
80106de4:	57                   	push   %edi
80106de5:	56                   	push   %esi
80106de6:	e8 05 ff ff ff       	call   80106cf0 <walkpgdir>
    if(!pte)
80106deb:	83 c4 10             	add    $0x10,%esp
80106dee:	85 c0                	test   %eax,%eax
80106df0:	75 b6                	jne    80106da8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106df2:	89 fa                	mov    %edi,%edx
80106df4:	81 e2 00 00 c0 ff    	and    $0xffc00000,%edx
80106dfa:	8d ba 00 f0 3f 00    	lea    0x3ff000(%edx),%edi
  for(; a  < oldsz; a += PGSIZE){
80106e00:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106e06:	39 df                	cmp    %ebx,%edi
80106e08:	72 d5                	jb     80106ddf <deallocuvm.part.0+0x5f>
    }
  }
 

  return newsz;
}
80106e0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e10:	5b                   	pop    %ebx
80106e11:	5e                   	pop    %esi
80106e12:	5f                   	pop    %edi
80106e13:	5d                   	pop    %ebp
80106e14:	c3                   	ret    
        panic("kfree");
80106e15:	83 ec 0c             	sub    $0xc,%esp
80106e18:	68 c6 79 10 80       	push   $0x801079c6
80106e1d:	e8 6e 95 ff ff       	call   80100390 <panic>
80106e22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e30 <mappages>:
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	57                   	push   %edi
80106e34:	56                   	push   %esi
80106e35:	53                   	push   %ebx
80106e36:	83 ec 1c             	sub    $0x1c,%esp
80106e39:	8b 45 0c             	mov    0xc(%ebp),%eax
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106e3c:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106e3f:	8b 75 14             	mov    0x14(%ebp),%esi
  a = (char*)PGROUNDDOWN((uint)va);
80106e42:	89 c7                	mov    %eax,%edi
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106e44:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
  a = (char*)PGROUNDDOWN((uint)va);
80106e48:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106e4e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e53:	29 fe                	sub    %edi,%esi
80106e55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    *pte = pa | perm | PTE_P;
80106e58:	8b 45 18             	mov    0x18(%ebp),%eax
80106e5b:	83 c8 01             	or     $0x1,%eax
80106e5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e61:	89 f0                	mov    %esi,%eax
80106e63:	89 fe                	mov    %edi,%esi
80106e65:	89 c7                	mov    %eax,%edi
80106e67:	eb 1c                	jmp    80106e85 <mappages+0x55>
80106e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(*pte & PTE_P)
80106e70:	f6 00 01             	testb  $0x1,(%eax)
80106e73:	75 45                	jne    80106eba <mappages+0x8a>
    *pte = pa | perm | PTE_P;
80106e75:	0b 5d e0             	or     -0x20(%ebp),%ebx
    if(a == last)
80106e78:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
    *pte = pa | perm | PTE_P;
80106e7b:	89 18                	mov    %ebx,(%eax)
    if(a == last)
80106e7d:	74 31                	je     80106eb0 <mappages+0x80>
    a += PGSIZE;
80106e7f:	81 c6 00 10 00 00    	add    $0x1000,%esi
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106e85:	83 ec 04             	sub    $0x4,%esp
80106e88:	8d 1c 3e             	lea    (%esi,%edi,1),%ebx
80106e8b:	6a 01                	push   $0x1
80106e8d:	56                   	push   %esi
80106e8e:	ff 75 08             	pushl  0x8(%ebp)
80106e91:	e8 5a fe ff ff       	call   80106cf0 <walkpgdir>
80106e96:	83 c4 10             	add    $0x10,%esp
80106e99:	85 c0                	test   %eax,%eax
80106e9b:	75 d3                	jne    80106e70 <mappages+0x40>
}
80106e9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106ea0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106ea5:	5b                   	pop    %ebx
80106ea6:	5e                   	pop    %esi
80106ea7:	5f                   	pop    %edi
80106ea8:	5d                   	pop    %ebp
80106ea9:	c3                   	ret    
80106eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eb0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106eb3:	31 c0                	xor    %eax,%eax
}
80106eb5:	5b                   	pop    %ebx
80106eb6:	5e                   	pop    %esi
80106eb7:	5f                   	pop    %edi
80106eb8:	5d                   	pop    %ebp
80106eb9:	c3                   	ret    
      panic("remap");
80106eba:	83 ec 0c             	sub    $0xc,%esp
80106ebd:	68 98 81 10 80       	push   $0x80108198
80106ec2:	e8 c9 94 ff ff       	call   80100390 <panic>
80106ec7:	89 f6                	mov    %esi,%esi
80106ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ed0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106ed0:	a1 a4 f0 14 80       	mov    0x8014f0a4,%eax
{
80106ed5:	55                   	push   %ebp
80106ed6:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106ed8:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106edd:	0f 22 d8             	mov    %eax,%cr3
}
80106ee0:	5d                   	pop    %ebp
80106ee1:	c3                   	ret    
80106ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ef0 <switchuvm>:
{
80106ef0:	55                   	push   %ebp
80106ef1:	89 e5                	mov    %esp,%ebp
80106ef3:	57                   	push   %edi
80106ef4:	56                   	push   %esi
80106ef5:	53                   	push   %ebx
80106ef6:	83 ec 1c             	sub    $0x1c,%esp
80106ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(p == 0)
80106efc:	85 db                	test   %ebx,%ebx
80106efe:	0f 84 cb 00 00 00    	je     80106fcf <switchuvm+0xdf>
  if(p->kstack == 0)
80106f04:	8b 43 08             	mov    0x8(%ebx),%eax
80106f07:	85 c0                	test   %eax,%eax
80106f09:	0f 84 da 00 00 00    	je     80106fe9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106f0f:	8b 43 04             	mov    0x4(%ebx),%eax
80106f12:	85 c0                	test   %eax,%eax
80106f14:	0f 84 c2 00 00 00    	je     80106fdc <switchuvm+0xec>
  pushcli();
80106f1a:	e8 e1 d7 ff ff       	call   80104700 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106f1f:	e8 7c ca ff ff       	call   801039a0 <mycpu>
80106f24:	89 c6                	mov    %eax,%esi
80106f26:	e8 75 ca ff ff       	call   801039a0 <mycpu>
80106f2b:	89 c7                	mov    %eax,%edi
80106f2d:	e8 6e ca ff ff       	call   801039a0 <mycpu>
80106f32:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106f35:	83 c7 08             	add    $0x8,%edi
80106f38:	e8 63 ca ff ff       	call   801039a0 <mycpu>
80106f3d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f40:	83 c0 08             	add    $0x8,%eax
80106f43:	ba 67 00 00 00       	mov    $0x67,%edx
80106f48:	c1 e8 18             	shr    $0x18,%eax
80106f4b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106f52:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106f59:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106f5f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106f64:	83 c1 08             	add    $0x8,%ecx
80106f67:	c1 e9 10             	shr    $0x10,%ecx
80106f6a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106f70:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106f75:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f7c:	be 10 00 00 00       	mov    $0x10,%esi
  mycpu()->gdt[SEG_TSS].s = 0;
80106f81:	e8 1a ca ff ff       	call   801039a0 <mycpu>
80106f86:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106f8d:	e8 0e ca ff ff       	call   801039a0 <mycpu>
80106f92:	66 89 70 10          	mov    %si,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106f96:	8b 73 08             	mov    0x8(%ebx),%esi
80106f99:	e8 02 ca ff ff       	call   801039a0 <mycpu>
80106f9e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106fa4:	89 70 0c             	mov    %esi,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106fa7:	e8 f4 c9 ff ff       	call   801039a0 <mycpu>
80106fac:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106fb0:	b8 28 00 00 00       	mov    $0x28,%eax
80106fb5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106fb8:	8b 43 04             	mov    0x4(%ebx),%eax
80106fbb:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106fc0:	0f 22 d8             	mov    %eax,%cr3
}
80106fc3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fc6:	5b                   	pop    %ebx
80106fc7:	5e                   	pop    %esi
80106fc8:	5f                   	pop    %edi
80106fc9:	5d                   	pop    %ebp
  popcli();
80106fca:	e9 31 d8 ff ff       	jmp    80104800 <popcli>
    panic("switchuvm: no process");
80106fcf:	83 ec 0c             	sub    $0xc,%esp
80106fd2:	68 9e 81 10 80       	push   $0x8010819e
80106fd7:	e8 b4 93 ff ff       	call   80100390 <panic>
    panic("switchuvm: no pgdir");
80106fdc:	83 ec 0c             	sub    $0xc,%esp
80106fdf:	68 c9 81 10 80       	push   $0x801081c9
80106fe4:	e8 a7 93 ff ff       	call   80100390 <panic>
    panic("switchuvm: no kstack");
80106fe9:	83 ec 0c             	sub    $0xc,%esp
80106fec:	68 b4 81 10 80       	push   $0x801081b4
80106ff1:	e8 9a 93 ff ff       	call   80100390 <panic>
80106ff6:	8d 76 00             	lea    0x0(%esi),%esi
80106ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107000 <inituvm>:
{
80107000:	55                   	push   %ebp
80107001:	89 e5                	mov    %esp,%ebp
80107003:	57                   	push   %edi
80107004:	56                   	push   %esi
80107005:	53                   	push   %ebx
80107006:	83 ec 1c             	sub    $0x1c,%esp
80107009:	8b 75 10             	mov    0x10(%ebp),%esi
8010700c:	8b 55 08             	mov    0x8(%ebp),%edx
8010700f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80107012:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107018:	77 50                	ja     8010706a <inituvm+0x6a>
8010701a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  mem = kalloc();
8010701d:	e8 be b4 ff ff       	call   801024e0 <kalloc>
  memset(mem, 0, PGSIZE);
80107022:	83 ec 04             	sub    $0x4,%esp
  mem = kalloc();
80107025:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80107027:	68 00 10 00 00       	push   $0x1000
8010702c:	6a 00                	push   $0x0
8010702e:	50                   	push   %eax
8010702f:	e8 8c d8 ff ff       	call   801048c0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80107034:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107037:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010703d:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80107044:	50                   	push   %eax
80107045:	68 00 10 00 00       	push   $0x1000
8010704a:	6a 00                	push   $0x0
8010704c:	52                   	push   %edx
8010704d:	e8 de fd ff ff       	call   80106e30 <mappages>
  memmove(mem, init, sz);
80107052:	89 75 10             	mov    %esi,0x10(%ebp)
80107055:	89 7d 0c             	mov    %edi,0xc(%ebp)
80107058:	83 c4 20             	add    $0x20,%esp
8010705b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010705e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107061:	5b                   	pop    %ebx
80107062:	5e                   	pop    %esi
80107063:	5f                   	pop    %edi
80107064:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80107065:	e9 06 d9 ff ff       	jmp    80104970 <memmove>
    panic("inituvm: more than a page");
8010706a:	83 ec 0c             	sub    $0xc,%esp
8010706d:	68 dd 81 10 80       	push   $0x801081dd
80107072:	e8 19 93 ff ff       	call   80100390 <panic>
80107077:	89 f6                	mov    %esi,%esi
80107079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107080 <loaduvm>:
{
80107080:	55                   	push   %ebp
80107081:	89 e5                	mov    %esp,%ebp
80107083:	57                   	push   %edi
80107084:	56                   	push   %esi
80107085:	53                   	push   %ebx
80107086:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80107089:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107090:	0f 85 99 00 00 00    	jne    8010712f <loaduvm+0xaf>
  for(i = 0; i < sz; i += PGSIZE){
80107096:	8b 5d 18             	mov    0x18(%ebp),%ebx
80107099:	31 ff                	xor    %edi,%edi
8010709b:	85 db                	test   %ebx,%ebx
8010709d:	75 1a                	jne    801070b9 <loaduvm+0x39>
8010709f:	eb 77                	jmp    80107118 <loaduvm+0x98>
801070a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070a8:	81 c7 00 10 00 00    	add    $0x1000,%edi
801070ae:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
801070b4:	39 7d 18             	cmp    %edi,0x18(%ebp)
801070b7:	76 5f                	jbe    80107118 <loaduvm+0x98>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801070b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801070bc:	83 ec 04             	sub    $0x4,%esp
801070bf:	6a 00                	push   $0x0
801070c1:	01 f8                	add    %edi,%eax
801070c3:	50                   	push   %eax
801070c4:	ff 75 08             	pushl  0x8(%ebp)
801070c7:	e8 24 fc ff ff       	call   80106cf0 <walkpgdir>
801070cc:	83 c4 10             	add    $0x10,%esp
801070cf:	85 c0                	test   %eax,%eax
801070d1:	74 4f                	je     80107122 <loaduvm+0xa2>
    pa = PTE_ADDR(*pte);
801070d3:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
801070d5:	8b 4d 14             	mov    0x14(%ebp),%ecx
    if(sz - i < PGSIZE)
801070d8:	be 00 10 00 00       	mov    $0x1000,%esi
    pa = PTE_ADDR(*pte);
801070dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
801070e2:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
801070e8:	0f 46 f3             	cmovbe %ebx,%esi
    if(readi(ip, P2V(pa), offset+i, n) != n)
801070eb:	01 f9                	add    %edi,%ecx
801070ed:	05 00 00 00 80       	add    $0x80000000,%eax
801070f2:	56                   	push   %esi
801070f3:	51                   	push   %ecx
801070f4:	50                   	push   %eax
801070f5:	ff 75 10             	pushl  0x10(%ebp)
801070f8:	e8 73 a8 ff ff       	call   80101970 <readi>
801070fd:	83 c4 10             	add    $0x10,%esp
80107100:	39 f0                	cmp    %esi,%eax
80107102:	74 a4                	je     801070a8 <loaduvm+0x28>
}
80107104:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107107:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010710c:	5b                   	pop    %ebx
8010710d:	5e                   	pop    %esi
8010710e:	5f                   	pop    %edi
8010710f:	5d                   	pop    %ebp
80107110:	c3                   	ret    
80107111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107118:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010711b:	31 c0                	xor    %eax,%eax
}
8010711d:	5b                   	pop    %ebx
8010711e:	5e                   	pop    %esi
8010711f:	5f                   	pop    %edi
80107120:	5d                   	pop    %ebp
80107121:	c3                   	ret    
      panic("loaduvm: address should exist");
80107122:	83 ec 0c             	sub    $0xc,%esp
80107125:	68 f7 81 10 80       	push   $0x801081f7
8010712a:	e8 61 92 ff ff       	call   80100390 <panic>
    panic("loaduvm: addr must be page aligned");
8010712f:	83 ec 0c             	sub    $0xc,%esp
80107132:	68 64 82 10 80       	push   $0x80108264
80107137:	e8 54 92 ff ff       	call   80100390 <panic>
8010713c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107140 <allocuvm>:
{
80107140:	55                   	push   %ebp
80107141:	89 e5                	mov    %esp,%ebp
80107143:	57                   	push   %edi
80107144:	56                   	push   %esi
80107145:	53                   	push   %ebx
80107146:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80107149:	8b 7d 10             	mov    0x10(%ebp),%edi
8010714c:	85 ff                	test   %edi,%edi
8010714e:	0f 88 8f 00 00 00    	js     801071e3 <allocuvm+0xa3>
  if(newsz < oldsz)
80107154:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107157:	0f 82 93 00 00 00    	jb     801071f0 <allocuvm+0xb0>
  a = PGROUNDUP(oldsz);
8010715d:	8b 45 0c             	mov    0xc(%ebp),%eax
80107160:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80107166:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
8010716c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010716f:	0f 86 7e 00 00 00    	jbe    801071f3 <allocuvm+0xb3>
80107175:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80107178:	8b 75 08             	mov    0x8(%ebp),%esi
8010717b:	eb 43                	jmp    801071c0 <allocuvm+0x80>
8010717d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(mem, 0, PGSIZE);
80107180:	83 ec 04             	sub    $0x4,%esp
80107183:	68 00 10 00 00       	push   $0x1000
80107188:	6a 00                	push   $0x0
8010718a:	50                   	push   %eax
8010718b:	e8 30 d7 ff ff       	call   801048c0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80107190:	8d 87 00 00 00 80    	lea    -0x80000000(%edi),%eax
80107196:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
8010719d:	50                   	push   %eax
8010719e:	68 00 10 00 00       	push   $0x1000
801071a3:	53                   	push   %ebx
801071a4:	56                   	push   %esi
801071a5:	e8 86 fc ff ff       	call   80106e30 <mappages>
801071aa:	83 c4 20             	add    $0x20,%esp
801071ad:	85 c0                	test   %eax,%eax
801071af:	78 4f                	js     80107200 <allocuvm+0xc0>
  for(; a < newsz; a += PGSIZE){
801071b1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801071b7:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801071ba:	0f 86 80 00 00 00    	jbe    80107240 <allocuvm+0x100>
    mem = kalloc();
801071c0:	e8 1b b3 ff ff       	call   801024e0 <kalloc>
    if(mem == 0){
801071c5:	85 c0                	test   %eax,%eax
    mem = kalloc();
801071c7:	89 c7                	mov    %eax,%edi
    if(mem == 0){
801071c9:	75 b5                	jne    80107180 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
801071cb:	83 ec 0c             	sub    $0xc,%esp
801071ce:	68 15 82 10 80       	push   $0x80108215
801071d3:	e8 88 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
801071d8:	83 c4 10             	add    $0x10,%esp
801071db:	8b 45 0c             	mov    0xc(%ebp),%eax
801071de:	39 45 10             	cmp    %eax,0x10(%ebp)
801071e1:	77 6d                	ja     80107250 <allocuvm+0x110>
}
801071e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
801071e6:	31 ff                	xor    %edi,%edi
}
801071e8:	89 f8                	mov    %edi,%eax
801071ea:	5b                   	pop    %ebx
801071eb:	5e                   	pop    %esi
801071ec:	5f                   	pop    %edi
801071ed:	5d                   	pop    %ebp
801071ee:	c3                   	ret    
801071ef:	90                   	nop
    return oldsz;
801071f0:	8b 7d 0c             	mov    0xc(%ebp),%edi
}
801071f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071f6:	89 f8                	mov    %edi,%eax
801071f8:	5b                   	pop    %ebx
801071f9:	5e                   	pop    %esi
801071fa:	5f                   	pop    %edi
801071fb:	5d                   	pop    %ebp
801071fc:	c3                   	ret    
801071fd:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80107200:	83 ec 0c             	sub    $0xc,%esp
80107203:	89 fe                	mov    %edi,%esi
80107205:	68 2d 82 10 80       	push   $0x8010822d
8010720a:	e8 51 94 ff ff       	call   80100660 <cprintf>
  if(newsz >= oldsz)
8010720f:	83 c4 10             	add    $0x10,%esp
80107212:	8b 45 0c             	mov    0xc(%ebp),%eax
80107215:	39 45 10             	cmp    %eax,0x10(%ebp)
80107218:	76 0d                	jbe    80107227 <allocuvm+0xe7>
8010721a:	89 c1                	mov    %eax,%ecx
8010721c:	8b 55 10             	mov    0x10(%ebp),%edx
8010721f:	8b 45 08             	mov    0x8(%ebp),%eax
80107222:	e8 59 fb ff ff       	call   80106d80 <deallocuvm.part.0>
      kfree(mem);
80107227:	83 ec 0c             	sub    $0xc,%esp
      return 0;
8010722a:	31 ff                	xor    %edi,%edi
      kfree(mem);
8010722c:	56                   	push   %esi
8010722d:	e8 ee b0 ff ff       	call   80102320 <kfree>
      return 0;
80107232:	83 c4 10             	add    $0x10,%esp
}
80107235:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107238:	89 f8                	mov    %edi,%eax
8010723a:	5b                   	pop    %ebx
8010723b:	5e                   	pop    %esi
8010723c:	5f                   	pop    %edi
8010723d:	5d                   	pop    %ebp
8010723e:	c3                   	ret    
8010723f:	90                   	nop
80107240:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80107243:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107246:	5b                   	pop    %ebx
80107247:	89 f8                	mov    %edi,%eax
80107249:	5e                   	pop    %esi
8010724a:	5f                   	pop    %edi
8010724b:	5d                   	pop    %ebp
8010724c:	c3                   	ret    
8010724d:	8d 76 00             	lea    0x0(%esi),%esi
80107250:	89 c1                	mov    %eax,%ecx
80107252:	8b 55 10             	mov    0x10(%ebp),%edx
80107255:	8b 45 08             	mov    0x8(%ebp),%eax
80107258:	e8 23 fb ff ff       	call   80106d80 <deallocuvm.part.0>
8010725d:	eb 94                	jmp    801071f3 <allocuvm+0xb3>
8010725f:	90                   	nop

80107260 <deallocuvm>:
{
80107260:	55                   	push   %ebp
80107261:	89 e5                	mov    %esp,%ebp
80107263:	8b 55 0c             	mov    0xc(%ebp),%edx
80107266:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107269:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010726c:	39 d1                	cmp    %edx,%ecx
8010726e:	73 10                	jae    80107280 <deallocuvm+0x20>
}
80107270:	5d                   	pop    %ebp
80107271:	e9 0a fb ff ff       	jmp    80106d80 <deallocuvm.part.0>
80107276:	8d 76 00             	lea    0x0(%esi),%esi
80107279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107280:	89 d0                	mov    %edx,%eax
80107282:	5d                   	pop    %ebp
80107283:	c3                   	ret    
80107284:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010728a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107290 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107290:	55                   	push   %ebp
80107291:	89 e5                	mov    %esp,%ebp
80107293:	57                   	push   %edi
80107294:	56                   	push   %esi
80107295:	53                   	push   %ebx
80107296:	83 ec 0c             	sub    $0xc,%esp
80107299:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010729c:	85 f6                	test   %esi,%esi
8010729e:	74 59                	je     801072f9 <freevm+0x69>
801072a0:	31 c9                	xor    %ecx,%ecx
801072a2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801072a7:	89 f0                	mov    %esi,%eax
801072a9:	e8 d2 fa ff ff       	call   80106d80 <deallocuvm.part.0>
801072ae:	89 f3                	mov    %esi,%ebx
801072b0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
801072b6:	eb 0f                	jmp    801072c7 <freevm+0x37>
801072b8:	90                   	nop
801072b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801072c0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++) { 
801072c3:	39 fb                	cmp    %edi,%ebx
801072c5:	74 23                	je     801072ea <freevm+0x5a>

    if(pgdir[i] & PTE_P){
801072c7:	8b 03                	mov    (%ebx),%eax
801072c9:	a8 01                	test   $0x1,%al
801072cb:	74 f3                	je     801072c0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
801072cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
801072d2:	83 ec 0c             	sub    $0xc,%esp
801072d5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
801072d8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801072dd:	50                   	push   %eax
801072de:	e8 3d b0 ff ff       	call   80102320 <kfree>
801072e3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++) { 
801072e6:	39 fb                	cmp    %edi,%ebx
801072e8:	75 dd                	jne    801072c7 <freevm+0x37>
    }

  }
  kfree((char*)pgdir);
801072ea:	89 75 08             	mov    %esi,0x8(%ebp)
}
801072ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072f0:	5b                   	pop    %ebx
801072f1:	5e                   	pop    %esi
801072f2:	5f                   	pop    %edi
801072f3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
801072f4:	e9 27 b0 ff ff       	jmp    80102320 <kfree>
    panic("freevm: no pgdir");
801072f9:	83 ec 0c             	sub    $0xc,%esp
801072fc:	68 49 82 10 80       	push   $0x80108249
80107301:	e8 8a 90 ff ff       	call   80100390 <panic>
80107306:	8d 76 00             	lea    0x0(%esi),%esi
80107309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107310 <setupkvm>:
{
80107310:	55                   	push   %ebp
80107311:	89 e5                	mov    %esp,%ebp
80107313:	56                   	push   %esi
80107314:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80107315:	e8 c6 b1 ff ff       	call   801024e0 <kalloc>
8010731a:	85 c0                	test   %eax,%eax
8010731c:	89 c6                	mov    %eax,%esi
8010731e:	74 42                	je     80107362 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80107320:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107323:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
80107328:	68 00 10 00 00       	push   $0x1000
8010732d:	6a 00                	push   $0x0
8010732f:	50                   	push   %eax
80107330:	e8 8b d5 ff ff       	call   801048c0 <memset>
80107335:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107338:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010733b:	8b 53 08             	mov    0x8(%ebx),%edx
8010733e:	83 ec 0c             	sub    $0xc,%esp
80107341:	ff 73 0c             	pushl  0xc(%ebx)
80107344:	29 c2                	sub    %eax,%edx
80107346:	50                   	push   %eax
80107347:	52                   	push   %edx
80107348:	ff 33                	pushl  (%ebx)
8010734a:	56                   	push   %esi
8010734b:	e8 e0 fa ff ff       	call   80106e30 <mappages>
80107350:	83 c4 20             	add    $0x20,%esp
80107353:	85 c0                	test   %eax,%eax
80107355:	78 19                	js     80107370 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107357:	83 c3 10             	add    $0x10,%ebx
8010735a:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107360:	75 d6                	jne    80107338 <setupkvm+0x28>
}
80107362:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107365:	89 f0                	mov    %esi,%eax
80107367:	5b                   	pop    %ebx
80107368:	5e                   	pop    %esi
80107369:	5d                   	pop    %ebp
8010736a:	c3                   	ret    
8010736b:	90                   	nop
8010736c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107370:	83 ec 0c             	sub    $0xc,%esp
80107373:	56                   	push   %esi
      return 0;
80107374:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
80107376:	e8 15 ff ff ff       	call   80107290 <freevm>
      return 0;
8010737b:	83 c4 10             	add    $0x10,%esp
}
8010737e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107381:	89 f0                	mov    %esi,%eax
80107383:	5b                   	pop    %ebx
80107384:	5e                   	pop    %esi
80107385:	5d                   	pop    %ebp
80107386:	c3                   	ret    
80107387:	89 f6                	mov    %esi,%esi
80107389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107390 <kvmalloc>:
{
80107390:	55                   	push   %ebp
80107391:	89 e5                	mov    %esp,%ebp
80107393:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107396:	e8 75 ff ff ff       	call   80107310 <setupkvm>
8010739b:	a3 a4 f0 14 80       	mov    %eax,0x8014f0a4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801073a0:	05 00 00 00 80       	add    $0x80000000,%eax
801073a5:	0f 22 d8             	mov    %eax,%cr3
}
801073a8:	c9                   	leave  
801073a9:	c3                   	ret    
801073aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801073b0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801073b0:	55                   	push   %ebp
801073b1:	89 e5                	mov    %esp,%ebp
801073b3:	83 ec 0c             	sub    $0xc,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801073b6:	6a 00                	push   $0x0
801073b8:	ff 75 0c             	pushl  0xc(%ebp)
801073bb:	ff 75 08             	pushl  0x8(%ebp)
801073be:	e8 2d f9 ff ff       	call   80106cf0 <walkpgdir>
  if(pte == 0)
801073c3:	83 c4 10             	add    $0x10,%esp
801073c6:	85 c0                	test   %eax,%eax
801073c8:	74 05                	je     801073cf <clearpteu+0x1f>
    panic("clearpteu");
  *pte &= ~PTE_U;
801073ca:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801073cd:	c9                   	leave  
801073ce:	c3                   	ret    
    panic("clearpteu");
801073cf:	83 ec 0c             	sub    $0xc,%esp
801073d2:	68 5a 82 10 80       	push   $0x8010825a
801073d7:	e8 b4 8f ff ff       	call   80100390 <panic>
801073dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801073e0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801073e0:	55                   	push   %ebp
801073e1:	89 e5                	mov    %esp,%ebp
801073e3:	57                   	push   %edi
801073e4:	56                   	push   %esi
801073e5:	53                   	push   %ebx
801073e6:	83 ec 1c             	sub    $0x1c,%esp
801073e9:	8b 75 08             	mov    0x8(%ebp),%esi
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  // char *mem;

  if((d = setupkvm()) == 0)
801073ec:	e8 1f ff ff ff       	call   80107310 <setupkvm>
801073f1:	85 c0                	test   %eax,%eax
801073f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801073f6:	74 79                	je     80107471 <copyuvm+0x91>
    return 0;


  for(i = 0; i < sz; i += PGSIZE){
801073f8:	8b 45 0c             	mov    0xc(%ebp),%eax
801073fb:	85 c0                	test   %eax,%eax
801073fd:	74 69                	je     80107468 <copyuvm+0x88>
801073ff:	31 db                	xor    %ebx,%ebx
80107401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107408:	83 ec 04             	sub    $0x4,%esp
8010740b:	6a 00                	push   $0x0
8010740d:	53                   	push   %ebx
8010740e:	56                   	push   %esi
8010740f:	e8 dc f8 ff ff       	call   80106cf0 <walkpgdir>
80107414:	83 c4 10             	add    $0x10,%esp
80107417:	85 c0                	test   %eax,%eax
80107419:	74 42                	je     8010745d <copyuvm+0x7d>
      // panic("copyuvm: pte should exist");
      continue; 
    
    if(!(*pte & PTE_P))
8010741b:	8b 10                	mov    (%eax),%edx
8010741d:	f6 c2 01             	test   $0x1,%dl
80107420:	74 3b                	je     8010745d <copyuvm+0x7d>
      // panic("copyuvm: page not present");
      continue;

    *pte &= ~PTE_W;
80107422:	89 d1                	mov    %edx,%ecx
    pa = PTE_ADDR(*pte);
80107424:	89 d7                	mov    %edx,%edi
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
      goto bad;

    */

    if(mappages(d, (void*) i, PGSIZE, pa, flags) < 0) 
80107426:	83 ec 0c             	sub    $0xc,%esp
    *pte &= ~PTE_W;
80107429:	83 e1 fd             	and    $0xfffffffd,%ecx
    flags = PTE_FLAGS(*pte);
8010742c:	81 e2 fd 0f 00 00    	and    $0xffd,%edx
    pa = PTE_ADDR(*pte);
80107432:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    *pte &= ~PTE_W;
80107438:	89 08                	mov    %ecx,(%eax)
    if(mappages(d, (void*) i, PGSIZE, pa, flags) < 0) 
8010743a:	52                   	push   %edx
8010743b:	57                   	push   %edi
8010743c:	68 00 10 00 00       	push   $0x1000
80107441:	53                   	push   %ebx
80107442:	ff 75 e4             	pushl  -0x1c(%ebp)
80107445:	e8 e6 f9 ff ff       	call   80106e30 <mappages>
8010744a:	83 c4 20             	add    $0x20,%esp
8010744d:	85 c0                	test   %eax,%eax
8010744f:	78 2f                	js     80107480 <copyuvm+0xa0>
      goto bad;

    inc_rc(pa);
80107451:	83 ec 0c             	sub    $0xc,%esp
80107454:	57                   	push   %edi
80107455:	e8 26 b2 ff ff       	call   80102680 <inc_rc>
8010745a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sz; i += PGSIZE){
8010745d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107463:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
80107466:	77 a0                	ja     80107408 <copyuvm+0x28>
  }

  lcr3(V2P(pgdir));
80107468:	81 c6 00 00 00 80    	add    $0x80000000,%esi
8010746e:	0f 22 de             	mov    %esi,%cr3
  freevm(d);

  lcr3(V2P(pgdir));

  return 0;
}
80107471:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107474:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107477:	5b                   	pop    %ebx
80107478:	5e                   	pop    %esi
80107479:	5f                   	pop    %edi
8010747a:	5d                   	pop    %ebp
8010747b:	c3                   	ret    
8010747c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  freevm(d);
80107480:	83 ec 0c             	sub    $0xc,%esp
80107483:	ff 75 e4             	pushl  -0x1c(%ebp)
  lcr3(V2P(pgdir));
80107486:	81 c6 00 00 00 80    	add    $0x80000000,%esi
  freevm(d);
8010748c:	e8 ff fd ff ff       	call   80107290 <freevm>
80107491:	0f 22 de             	mov    %esi,%cr3
  return 0;
80107494:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010749b:	83 c4 10             	add    $0x10,%esp
}
8010749e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801074a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801074a4:	5b                   	pop    %ebx
801074a5:	5e                   	pop    %esi
801074a6:	5f                   	pop    %edi
801074a7:	5d                   	pop    %ebp
801074a8:	c3                   	ret    
801074a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801074b0 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801074b0:	55                   	push   %ebp
801074b1:	89 e5                	mov    %esp,%ebp
801074b3:	83 ec 0c             	sub    $0xc,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801074b6:	6a 00                	push   $0x0
801074b8:	ff 75 0c             	pushl  0xc(%ebp)
801074bb:	ff 75 08             	pushl  0x8(%ebp)
801074be:	e8 2d f8 ff ff       	call   80106cf0 <walkpgdir>
  if((*pte & PTE_P) == 0)
801074c3:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
801074c5:	83 c4 10             	add    $0x10,%esp
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
801074c8:	c9                   	leave  
  if((*pte & PTE_U) == 0)
801074c9:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801074cb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
801074d0:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
801074d3:	05 00 00 00 80       	add    $0x80000000,%eax
801074d8:	83 fa 05             	cmp    $0x5,%edx
801074db:	ba 00 00 00 00       	mov    $0x0,%edx
801074e0:	0f 45 c2             	cmovne %edx,%eax
}
801074e3:	c3                   	ret    
801074e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801074ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801074f0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801074f0:	55                   	push   %ebp
801074f1:	89 e5                	mov    %esp,%ebp
801074f3:	57                   	push   %edi
801074f4:	56                   	push   %esi
801074f5:	53                   	push   %ebx
801074f6:	83 ec 1c             	sub    $0x1c,%esp
801074f9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801074fc:	8b 55 0c             	mov    0xc(%ebp),%edx
801074ff:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107502:	85 db                	test   %ebx,%ebx
80107504:	75 40                	jne    80107546 <copyout+0x56>
80107506:	eb 70                	jmp    80107578 <copyout+0x88>
80107508:	90                   	nop
80107509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107510:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107513:	89 f1                	mov    %esi,%ecx
80107515:	29 d1                	sub    %edx,%ecx
80107517:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010751d:	39 d9                	cmp    %ebx,%ecx
8010751f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80107522:	29 f2                	sub    %esi,%edx
80107524:	83 ec 04             	sub    $0x4,%esp
80107527:	01 d0                	add    %edx,%eax
80107529:	51                   	push   %ecx
8010752a:	57                   	push   %edi
8010752b:	50                   	push   %eax
8010752c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010752f:	e8 3c d4 ff ff       	call   80104970 <memmove>
    len -= n;
    buf += n;
80107534:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
80107537:	83 c4 10             	add    $0x10,%esp
    va = va0 + PGSIZE;
8010753a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    buf += n;
80107540:	01 cf                	add    %ecx,%edi
  while(len > 0){
80107542:	29 cb                	sub    %ecx,%ebx
80107544:	74 32                	je     80107578 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80107546:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107548:	83 ec 08             	sub    $0x8,%esp
    va0 = (uint)PGROUNDDOWN(va);
8010754b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010754e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80107554:	56                   	push   %esi
80107555:	ff 75 08             	pushl  0x8(%ebp)
80107558:	e8 53 ff ff ff       	call   801074b0 <uva2ka>
    if(pa0 == 0)
8010755d:	83 c4 10             	add    $0x10,%esp
80107560:	85 c0                	test   %eax,%eax
80107562:	75 ac                	jne    80107510 <copyout+0x20>
  }
  return 0;
}
80107564:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80107567:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010756c:	5b                   	pop    %ebx
8010756d:	5e                   	pop    %esi
8010756e:	5f                   	pop    %edi
8010756f:	5d                   	pop    %ebp
80107570:	c3                   	ret    
80107571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107578:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010757b:	31 c0                	xor    %eax,%eax
}
8010757d:	5b                   	pop    %ebx
8010757e:	5e                   	pop    %esi
8010757f:	5f                   	pop    %edi
80107580:	5d                   	pop    %ebp
80107581:	c3                   	ret    
80107582:	66 90                	xchg   %ax,%ax
80107584:	66 90                	xchg   %ax,%ax
80107586:	66 90                	xchg   %ax,%ax
80107588:	66 90                	xchg   %ax,%ax
8010758a:	66 90                	xchg   %ax,%ax
8010758c:	66 90                	xchg   %ax,%ax
8010758e:	66 90                	xchg   %ax,%ax

80107590 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
80107590:	55                   	push   %ebp
80107591:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
80107596:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
8010759b:	89 e5                	mov    %esp,%ebp
8010759d:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
801075a0:	89 15 e0 b5 10 80    	mov    %edx,0x8010b5e0
801075a6:	eb 0b                	jmp    801075b3 <sgenrand+0x23>
801075a8:	90                   	nop
801075a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801075b0:	83 c0 04             	add    $0x4,%eax
    for (mti=1; mti<N; mti++)
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801075b3:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
801075b9:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
801075bb:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
801075bd:	75 f1                	jne    801075b0 <sgenrand+0x20>
801075bf:	c7 05 60 b4 10 80 70 	movl   $0x270,0x8010b460
801075c6:	02 00 00 
}
801075c9:	5d                   	pop    %ebp
801075ca:	c3                   	ret    
801075cb:	90                   	nop
801075cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801075d0 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
801075d0:	a1 60 b4 10 80       	mov    0x8010b460,%eax
{
801075d5:	55                   	push   %ebp
801075d6:	89 e5                	mov    %esp,%ebp
801075d8:	56                   	push   %esi
801075d9:	53                   	push   %ebx
    if (mti >= N) { /* generate N words at one time */
801075da:	3d 6f 02 00 00       	cmp    $0x26f,%eax
801075df:	0f 8e f9 00 00 00    	jle    801076de <genrand+0x10e>
        int kk;

        if (mti == N+1)   /* if sgenrand() has not been called, */
801075e5:	3d 71 02 00 00       	cmp    $0x271,%eax
801075ea:	0f 84 fa 00 00 00    	je     801076ea <genrand+0x11a>
801075f0:	ba e0 b5 10 80       	mov    $0x8010b5e0,%edx
801075f5:	bb 6c b9 10 80       	mov    $0x8010b96c,%ebx
    mt[0]= seed & 0xffffffff;
801075fa:	89 d1                	mov    %edx,%ecx
801075fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            sgenrand(4357); /* a default initial seed is used   */

        for (kk=0;kk<N-M;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
80107600:	8b 01                	mov    (%ecx),%eax
80107602:	8b 71 04             	mov    0x4(%ecx),%esi
80107605:	83 c1 04             	add    $0x4,%ecx
80107608:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
8010760e:	25 00 00 00 80       	and    $0x80000000,%eax
80107613:	09 f0                	or     %esi,%eax
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
80107615:	89 c6                	mov    %eax,%esi
80107617:	83 e0 01             	and    $0x1,%eax
8010761a:	d1 ee                	shr    %esi
8010761c:	33 b1 30 06 00 00    	xor    0x630(%ecx),%esi
80107622:	33 34 85 88 82 10 80 	xor    -0x7fef7d78(,%eax,4),%esi
80107629:	89 71 fc             	mov    %esi,-0x4(%ecx)
        for (kk=0;kk<N-M;kk++) {
8010762c:	39 cb                	cmp    %ecx,%ebx
8010762e:	75 d0                	jne    80107600 <genrand+0x30>
80107630:	b9 10 bc 10 80       	mov    $0x8010bc10,%ecx
80107635:	8d 76 00             	lea    0x0(%esi),%esi
        }
        for (;kk<N-1;kk++) {
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
80107638:	8b 82 8c 03 00 00    	mov    0x38c(%edx),%eax
8010763e:	8b 9a 90 03 00 00    	mov    0x390(%edx),%ebx
80107644:	83 c2 04             	add    $0x4,%edx
80107647:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
8010764d:	25 00 00 00 80       	and    $0x80000000,%eax
80107652:	09 d8                	or     %ebx,%eax
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
80107654:	89 c3                	mov    %eax,%ebx
80107656:	83 e0 01             	and    $0x1,%eax
80107659:	d1 eb                	shr    %ebx
8010765b:	33 5a fc             	xor    -0x4(%edx),%ebx
8010765e:	33 1c 85 88 82 10 80 	xor    -0x7fef7d78(,%eax,4),%ebx
80107665:	89 9a 88 03 00 00    	mov    %ebx,0x388(%edx)
        for (;kk<N-1;kk++) {
8010766b:	39 d1                	cmp    %edx,%ecx
8010766d:	75 c9                	jne    80107638 <genrand+0x68>
        }
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
8010766f:	a1 e0 b5 10 80       	mov    0x8010b5e0,%eax
80107674:	8b 0d 9c bf 10 80    	mov    0x8010bf9c,%ecx
8010767a:	89 c2                	mov    %eax,%edx
8010767c:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
80107682:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
80107688:	09 d1                	or     %edx,%ecx
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
8010768a:	89 ca                	mov    %ecx,%edx
8010768c:	83 e1 01             	and    $0x1,%ecx
8010768f:	d1 ea                	shr    %edx
80107691:	33 15 10 bc 10 80    	xor    0x8010bc10,%edx
80107697:	33 14 8d 88 82 10 80 	xor    -0x7fef7d78(,%ecx,4),%edx
8010769e:	89 15 9c bf 10 80    	mov    %edx,0x8010bf9c
801076a4:	ba 01 00 00 00       	mov    $0x1,%edx

        mti = 0;
    }
  
    y = mt[mti++];
801076a9:	89 15 60 b4 10 80    	mov    %edx,0x8010b460
    y ^= TEMPERING_SHIFT_U(y);
801076af:	89 c2                	mov    %eax,%edx
801076b1:	c1 ea 0b             	shr    $0xb,%edx
801076b4:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
801076b6:	89 d0                	mov    %edx,%eax
801076b8:	c1 e0 07             	shl    $0x7,%eax
801076bb:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
801076c0:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
801076c2:	89 d0                	mov    %edx,%eax
801076c4:	c1 e0 0f             	shl    $0xf,%eax
801076c7:	25 00 00 c6 ef       	and    $0xefc60000,%eax
801076cc:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_L(y);
801076ce:	89 c2                	mov    %eax,%edx
801076d0:	c1 ea 12             	shr    $0x12,%edx
801076d3:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
}
801076d5:	5b                   	pop    %ebx
    return y & RAND_MAX;
801076d6:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
801076db:	5e                   	pop    %esi
801076dc:	5d                   	pop    %ebp
801076dd:	c3                   	ret    
801076de:	8d 50 01             	lea    0x1(%eax),%edx
801076e1:	8b 04 85 e0 b5 10 80 	mov    -0x7fef4a20(,%eax,4),%eax
801076e8:	eb bf                	jmp    801076a9 <genrand+0xd9>
    mt[0]= seed & 0xffffffff;
801076ea:	c7 05 e0 b5 10 80 05 	movl   $0x1105,0x8010b5e0
801076f1:	11 00 00 
801076f4:	b8 e4 b5 10 80       	mov    $0x8010b5e4,%eax
801076f9:	b9 9c bf 10 80       	mov    $0x8010bf9c,%ecx
801076fe:	ba 05 11 00 00       	mov    $0x1105,%edx
80107703:	eb 06                	jmp    8010770b <genrand+0x13b>
80107705:	8d 76 00             	lea    0x0(%esi),%esi
80107708:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
8010770b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
    for (mti=1; mti<N; mti++)
80107711:	39 c1                	cmp    %eax,%ecx
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
80107713:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
80107715:	75 f1                	jne    80107708 <genrand+0x138>
80107717:	e9 d4 fe ff ff       	jmp    801075f0 <genrand+0x20>
8010771c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107720 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
80107720:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
80107721:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
80107723:	89 e5                	mov    %esp,%ebp
80107725:	56                   	push   %esi
80107726:	53                   	push   %ebx
    num_bins = (unsigned long) max + 1,
80107727:	8b 45 08             	mov    0x8(%ebp),%eax
    bin_size = num_rand / num_bins,
8010772a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
8010772f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
80107732:	89 d8                	mov    %ebx,%eax
80107734:	f7 f1                	div    %ecx
80107736:	89 c6                	mov    %eax,%esi
80107738:	29 d3                	sub    %edx,%ebx
8010773a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    defect   = num_rand % num_bins;

  long x;
  do {
   x = genrand();
80107740:	e8 8b fe ff ff       	call   801075d0 <genrand>
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
80107745:	39 d8                	cmp    %ebx,%eax
80107747:	73 f7                	jae    80107740 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
80107749:	31 d2                	xor    %edx,%edx
8010774b:	f7 f6                	div    %esi
}
8010774d:	5b                   	pop    %ebx
8010774e:	5e                   	pop    %esi
8010774f:	5d                   	pop    %ebp
80107750:	c3                   	ret    
