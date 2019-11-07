
_pagingtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}


int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
    passed += test_copy_on_write_alt(32 * 1024, "32KB", 2); 
    passed += test_copy_on_write_alloc_unused(4 * 1024, "4KB", 32 * 1024, "32KB", 2); 
    passed += test_copy_on_write_alloc_unused(512 * 1024 * 1024, "512MB", 32 * 1024, "32KB", 2); 
    passed += test_copy_on_write(64 * 1024 * 1024, "64MB", 7); 
    passed += test_copy_on_write_alt(64 * 1024 * 1024, "64MB", 4); 
    printf(1, "running repeated copy-on-write tests to make sure "
      10:	be 0a 00 00 00       	mov    $0xa,%esi
{
      15:	83 ec 10             	sub    $0x10,%esp
    out_of_bounds_offset = offset;
      18:	c7 05 f8 32 00 00 01 	movl   $0x1,0x32f8
      1f:	00 00 00 
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
      22:	68 08 2b 00 00       	push   $0x2b08
      27:	68 44 2b 00 00       	push   $0x2b44
      2c:	68 50 02 00 00       	push   $0x250
      31:	e8 5a 02 00 00       	call   290 <test_simple_crash>
      36:	83 c4 0c             	add    $0xc,%esp
      39:	89 c3                	mov    %eax,%ebx
    out_of_bounds_offset = offset;
      3b:	c7 05 f8 32 00 00 00 	movl   $0x80000000,0x32f8
      42:	00 00 80 
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
      45:	68 7c 2b 00 00       	push   $0x2b7c
      4a:	68 b0 2b 00 00       	push   $0x2bb0
      4f:	68 50 02 00 00       	push   $0x250
      54:	e8 37 02 00 00       	call   290 <test_simple_crash>
    passed += test_allocation_fork(32 * 1024, "32KB", "two 4KB", 4 * 1024,  4096, 16 * 1024, 4096); 
      59:	83 c4 0c             	add    $0xc,%esp
    passed += test_out_of_bounds_fork(1024 * 1024 * 1024 * 2U, 
      5c:	01 c3                	add    %eax,%ebx
    passed += test_allocation_fork(32 * 1024, "32KB", "two 4KB", 4 * 1024,  4096, 16 * 1024, 4096); 
      5e:	68 00 10 00 00       	push   $0x1000
      63:	68 00 40 00 00       	push   $0x4000
      68:	68 00 10 00 00       	push   $0x1000
      6d:	68 00 10 00 00       	push   $0x1000
      72:	68 a0 23 00 00       	push   $0x23a0
      77:	68 ba 23 00 00       	push   $0x23ba
      7c:	68 00 80 00 00       	push   $0x8000
      81:	e8 ba 04 00 00       	call   540 <test_allocation_fork>
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 8KB", 0, 8192, 256 * 1024 * 1024, 8192); 
      86:	83 c4 1c             	add    $0x1c,%esp
    passed += test_allocation_fork(32 * 1024, "32KB", "two 4KB", 4 * 1024,  4096, 16 * 1024, 4096); 
      89:	01 c3                	add    %eax,%ebx
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 8KB", 0, 8192, 256 * 1024 * 1024, 8192); 
      8b:	68 00 20 00 00       	push   $0x2000
      90:	68 00 00 00 10       	push   $0x10000000
      95:	68 00 20 00 00       	push   $0x2000
      9a:	6a 00                	push   $0x0
      9c:	68 a8 23 00 00       	push   $0x23a8
      a1:	68 b0 23 00 00       	push   $0x23b0
      a6:	68 00 00 00 30       	push   $0x30000000
      ab:	e8 90 04 00 00       	call   540 <test_allocation_fork>
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 32KB", 128 * 1024 * 1024, 32 * 1024, 384 * 1024 * 1024, 32 * 1024); 
      b0:	83 c4 1c             	add    $0x1c,%esp
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 8KB", 0, 8192, 256 * 1024 * 1024, 8192); 
      b3:	01 c3                	add    %eax,%ebx
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 32KB", 128 * 1024 * 1024, 32 * 1024, 384 * 1024 * 1024, 32 * 1024); 
      b5:	68 00 80 00 00       	push   $0x8000
      ba:	68 00 00 00 18       	push   $0x18000000
      bf:	68 00 80 00 00       	push   $0x8000
      c4:	68 00 00 00 08       	push   $0x8000000
      c9:	68 b6 23 00 00       	push   $0x23b6
      ce:	68 b0 23 00 00       	push   $0x23b0
      d3:	68 00 00 00 30       	push   $0x30000000
      d8:	e8 63 04 00 00       	call   540 <test_allocation_fork>
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
      dd:	83 c4 1c             	add    $0x1c,%esp
    passed += test_allocation_fork(768 * 1024 * 1024, "768MB", "two 32KB", 128 * 1024 * 1024, 32 * 1024, 384 * 1024 * 1024, 32 * 1024); 
      e0:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
      e2:	68 3f 23 00 00       	push   $0x233f
      e7:	6a 00                	push   $0x0
      e9:	6a 00                	push   $0x0
      eb:	6a 00                	push   $0x0
      ed:	6a 02                	push   $0x2
      ef:	68 ba 23 00 00       	push   $0x23ba
      f4:	68 00 80 00 00       	push   $0x8000
      f9:	e8 52 11 00 00       	call   1250 <_test_copy_on_write>
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
      fe:	83 c4 1c             	add    $0x1c,%esp
    passed += test_copy_on_write(32 * 1024, "32KB", 2); 
     101:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
     103:	68 3f 23 00 00       	push   $0x233f
     108:	6a 00                	push   $0x0
     10a:	6a 00                	push   $0x0
     10c:	6a 01                	push   $0x1
     10e:	6a 02                	push   $0x2
     110:	68 ba 23 00 00       	push   $0x23ba
     115:	68 00 80 00 00       	push   $0x8000
     11a:	e8 31 11 00 00       	call   1250 <_test_copy_on_write>
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
     11f:	83 c4 1c             	add    $0x1c,%esp
    passed += test_copy_on_write_alt(32 * 1024, "32KB", 2); 
     122:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
     124:	68 a4 23 00 00       	push   $0x23a4
     129:	68 00 10 00 00       	push   $0x1000
     12e:	6a 00                	push   $0x0
     130:	6a 00                	push   $0x0
     132:	6a 02                	push   $0x2
     134:	68 ba 23 00 00       	push   $0x23ba
     139:	68 00 80 00 00       	push   $0x8000
     13e:	e8 0d 11 00 00       	call   1250 <_test_copy_on_write>
     143:	83 c4 1c             	add    $0x1c,%esp
    passed += test_copy_on_write_alloc_unused(4 * 1024, "4KB", 32 * 1024, "32KB", 2); 
     146:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
     148:	68 bf 23 00 00       	push   $0x23bf
     14d:	68 00 00 00 20       	push   $0x20000000
     152:	6a 00                	push   $0x0
     154:	6a 00                	push   $0x0
     156:	6a 02                	push   $0x2
     158:	68 ba 23 00 00       	push   $0x23ba
     15d:	68 00 80 00 00       	push   $0x8000
     162:	e8 e9 10 00 00       	call   1250 <_test_copy_on_write>
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
     167:	83 c4 1c             	add    $0x1c,%esp
    passed += test_copy_on_write_alloc_unused(512 * 1024 * 1024, "512MB", 32 * 1024, "32KB", 2); 
     16a:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
     16c:	68 3f 23 00 00       	push   $0x233f
     171:	6a 00                	push   $0x0
     173:	6a 00                	push   $0x0
     175:	6a 00                	push   $0x0
     177:	6a 07                	push   $0x7
     179:	68 c5 23 00 00       	push   $0x23c5
     17e:	68 00 00 00 04       	push   $0x4000000
     183:	e8 c8 10 00 00       	call   1250 <_test_copy_on_write>
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
     188:	83 c4 1c             	add    $0x1c,%esp
    passed += test_copy_on_write(64 * 1024 * 1024, "64MB", 7); 
     18b:	01 c3                	add    %eax,%ebx
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
     18d:	68 3f 23 00 00       	push   $0x233f
     192:	6a 00                	push   $0x0
     194:	6a 00                	push   $0x0
     196:	6a 01                	push   $0x1
     198:	6a 04                	push   $0x4
     19a:	68 c5 23 00 00       	push   $0x23c5
     19f:	68 00 00 00 04       	push   $0x4000000
     1a4:	e8 a7 10 00 00       	call   1250 <_test_copy_on_write>
    passed += test_copy_on_write_alt(64 * 1024 * 1024, "64MB", 4); 
     1a9:	01 c3                	add    %eax,%ebx
    printf(1, "running repeated copy-on-write tests to make sure "
     1ab:	83 c4 18             	add    $0x18,%esp
     1ae:	68 e0 2b 00 00       	push   $0x2be0
     1b3:	6a 01                	push   $0x1
     1b5:	e8 a6 1d 00 00       	call   1f60 <printf>
     1ba:	83 c4 10             	add    $0x10,%esp
     1bd:	8d 76 00             	lea    0x0(%esi),%esi
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
     1c0:	83 ec 04             	sub    $0x4,%esp
     1c3:	68 3f 23 00 00       	push   $0x233f
     1c8:	6a 00                	push   $0x0
     1ca:	6a 00                	push   $0x0
     1cc:	6a 00                	push   $0x0
     1ce:	6a 02                	push   $0x2
     1d0:	68 ca 23 00 00       	push   $0x23ca
     1d5:	68 00 00 40 06       	push   $0x6400000
     1da:	e8 71 10 00 00       	call   1250 <_test_copy_on_write>
              "memory is eventually reclaimed\n");
    for (int i = 0; i < 10; ++i) {
     1df:	83 c4 20             	add    $0x20,%esp
        passed += test_copy_on_write(100 * 1024 * 1024, "100MB", 2); 
     1e2:	01 c3                	add    %eax,%ebx
    for (int i = 0; i < 10; ++i) {
     1e4:	83 ee 01             	sub    $0x1,%esi
     1e7:	75 d7                	jne    1c0 <main+0x1c0>
    }
    passed += test_read_into_alloc(
     1e9:	83 ec 0c             	sub    $0xc,%esp
     1ec:	68 ba 23 00 00       	push   $0x23ba
     1f1:	68 d0 23 00 00       	push   $0x23d0
     1f6:	68 80 00 00 00       	push   $0x80
     1fb:	68 00 80 00 00       	push   $0x8000
     200:	68 00 00 01 00       	push   $0x10000
     205:	e8 96 15 00 00       	call   17a0 <test_read_into_alloc>
        4096 * 16, 4096 * 8, 128, "128KB", "32KB"
    );
    passed += test_read_into_cow(
     20a:	83 c4 14             	add    $0x14,%esp
    passed += test_read_into_alloc(
     20d:	01 c3                	add    %eax,%ebx
    passed += test_read_into_cow(
     20f:	68 ba 23 00 00       	push   $0x23ba
     214:	68 d0 23 00 00       	push   $0x23d0
     219:	68 80 00 00 00       	push   $0x80
     21e:	68 00 80 00 00       	push   $0x8000
     223:	68 00 00 01 00       	push   $0x10000
     228:	e8 c3 18 00 00       	call   1af0 <test_read_into_cow>
        4096 * 16, 4096 * 8, 128, "128KB", "32KB"
    );
    printf(1, "passed %d tests of 23\n", passed);
     22d:	83 c4 1c             	add    $0x1c,%esp
    passed += test_read_into_cow(
     230:	01 c3                	add    %eax,%ebx
    printf(1, "passed %d tests of 23\n", passed);
     232:	53                   	push   %ebx
     233:	68 d6 23 00 00       	push   $0x23d6
     238:	6a 01                	push   $0x1
     23a:	e8 21 1d 00 00       	call   1f60 <printf>
    exit();
     23f:	e8 9e 1b 00 00       	call   1de2 <exit>
     244:	66 90                	xchg   %ax,%ax
     246:	66 90                	xchg   %ax,%ax
     248:	66 90                	xchg   %ax,%ax
     24a:	66 90                	xchg   %ax,%ax
     24c:	66 90                	xchg   %ax,%ax
     24e:	66 90                	xchg   %ax,%ax

00000250 <test_out_of_bounds_internal>:
void test_out_of_bounds_internal() {
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	83 ec 14             	sub    $0x14,%esp
    volatile char *end_of_heap = sbrk(0);
     256:	6a 00                	push   $0x0
     258:	e8 0d 1c 00 00       	call   1e6a <sbrk>
    (void) end_of_heap[out_of_bounds_offset];
     25d:	03 05 f8 32 00 00    	add    0x32f8,%eax
}
     263:	83 c4 10             	add    $0x10,%esp
    (void) end_of_heap[out_of_bounds_offset];
     266:	0f b6 00             	movzbl (%eax),%eax
}
     269:	c9                   	leave  
     26a:	c3                   	ret    
     26b:	90                   	nop
     26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <test_simple_crash_no_fork>:
void test_simple_crash_no_fork(void (*test_func)(), const char *no_crash_message) {
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	83 ec 08             	sub    $0x8,%esp
    test_func();
     276:	ff 55 08             	call   *0x8(%ebp)
    printf(1, "%s\n", no_crash_message);
     279:	83 ec 04             	sub    $0x4,%esp
     27c:	ff 75 0c             	pushl  0xc(%ebp)
     27f:	68 b8 22 00 00       	push   $0x22b8
     284:	6a 01                	push   $0x1
     286:	e8 d5 1c 00 00       	call   1f60 <printf>
}
     28b:	83 c4 10             	add    $0x10,%esp
     28e:	c9                   	leave  
     28f:	c3                   	ret    

00000290 <test_simple_crash>:
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	53                   	push   %ebx
    pipe(fds);
     294:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
     297:	83 ec 20             	sub    $0x20,%esp
    pipe(fds);
     29a:	50                   	push   %eax
     29b:	e8 52 1b 00 00       	call   1df2 <pipe>
    int pid = fork();
     2a0:	e8 35 1b 00 00       	call   1dda <fork>
    if (pid == 0) {
     2a5:	83 c4 10             	add    $0x10,%esp
     2a8:	85 c0                	test   %eax,%eax
     2aa:	74 78                	je     324 <test_simple_crash+0x94>
        close(fds[1]);
     2ac:	83 ec 0c             	sub    $0xc,%esp
     2af:	ff 75 f4             	pushl  -0xc(%ebp)
        char text[1] = {'Q'};
     2b2:	c6 45 ef 51          	movb   $0x51,-0x11(%ebp)
        close(fds[1]);
     2b6:	e8 4f 1b 00 00       	call   1e0a <close>
        int size = read(fds[0], text, 1);
     2bb:	8d 45 ef             	lea    -0x11(%ebp),%eax
     2be:	83 c4 0c             	add    $0xc,%esp
     2c1:	6a 01                	push   $0x1
     2c3:	50                   	push   %eax
     2c4:	ff 75 f0             	pushl  -0x10(%ebp)
     2c7:	e8 2e 1b 00 00       	call   1dfa <read>
     2cc:	89 c3                	mov    %eax,%ebx
        wait();
     2ce:	e8 17 1b 00 00       	call   1dea <wait>
        close(fds[0]);
     2d3:	58                   	pop    %eax
     2d4:	ff 75 f0             	pushl  -0x10(%ebp)
     2d7:	e8 2e 1b 00 00       	call   1e0a <close>
        if (size == 1) {
     2dc:	83 c4 10             	add    $0x10,%esp
     2df:	83 fb 01             	cmp    $0x1,%ebx
     2e2:	74 24                	je     308 <test_simple_crash+0x78>
            printf(1, "%s\n", crash_message);
     2e4:	83 ec 04             	sub    $0x4,%esp
     2e7:	ff 75 0c             	pushl  0xc(%ebp)
     2ea:	68 b8 22 00 00       	push   $0x22b8
     2ef:	6a 01                	push   $0x1
     2f1:	e8 6a 1c 00 00       	call   1f60 <printf>
            return 1;
     2f6:	83 c4 10             	add    $0x10,%esp
     2f9:	b8 01 00 00 00       	mov    $0x1,%eax
}
     2fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     301:	c9                   	leave  
     302:	c3                   	ret    
     303:	90                   	nop
     304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, "%s\n", no_crash_message);
     308:	83 ec 04             	sub    $0x4,%esp
     30b:	ff 75 10             	pushl  0x10(%ebp)
     30e:	68 b8 22 00 00       	push   $0x22b8
     313:	6a 01                	push   $0x1
     315:	e8 46 1c 00 00       	call   1f60 <printf>
            return 0;
     31a:	83 c4 10             	add    $0x10,%esp
     31d:	31 c0                	xor    %eax,%eax
}
     31f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     322:	c9                   	leave  
     323:	c3                   	ret    
        close(1);
     324:	83 ec 0c             	sub    $0xc,%esp
     327:	6a 01                	push   $0x1
     329:	e8 dc 1a 00 00       	call   1e0a <close>
        dup(fds[1]);
     32e:	5a                   	pop    %edx
     32f:	ff 75 f4             	pushl  -0xc(%ebp)
     332:	e8 23 1b 00 00       	call   1e5a <dup>
        test_func();
     337:	ff 55 08             	call   *0x8(%ebp)
        write(1, "X", 1);
     33a:	83 c4 0c             	add    $0xc,%esp
     33d:	6a 01                	push   $0x1
     33f:	68 bc 22 00 00       	push   $0x22bc
     344:	6a 01                	push   $0x1
     346:	e8 b7 1a 00 00       	call   1e02 <write>
        exit();
     34b:	e8 92 1a 00 00       	call   1de2 <exit>

00000350 <test_out_of_bounds_fork>:
int test_out_of_bounds_fork(int offset, const char *crash_message, const char *no_crash_message) {
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
    out_of_bounds_offset = offset;
     353:	8b 45 08             	mov    0x8(%ebp),%eax
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     356:	c7 45 08 50 02 00 00 	movl   $0x250,0x8(%ebp)
}
     35d:	5d                   	pop    %ebp
    out_of_bounds_offset = offset;
     35e:	a3 f8 32 00 00       	mov    %eax,0x32f8
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     363:	e9 28 ff ff ff       	jmp    290 <test_simple_crash>
     368:	90                   	nop
     369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <test_out_of_bounds_no_fork>:
void test_out_of_bounds_no_fork(int offset, const char *no_crash_message) {
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	83 ec 08             	sub    $0x8,%esp
    out_of_bounds_offset = offset;
     376:	8b 45 08             	mov    0x8(%ebp),%eax
     379:	a3 f8 32 00 00       	mov    %eax,0x32f8
    test_func();
     37e:	e8 cd fe ff ff       	call   250 <test_out_of_bounds_internal>
    printf(1, "%s\n", no_crash_message);
     383:	83 ec 04             	sub    $0x4,%esp
     386:	ff 75 0c             	pushl  0xc(%ebp)
     389:	68 b8 22 00 00       	push   $0x22b8
     38e:	6a 01                	push   $0x1
     390:	e8 cb 1b 00 00       	call   1f60 <printf>
}
     395:	83 c4 10             	add    $0x10,%esp
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <test_allocation_no_fork>:
int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	57                   	push   %edi
     3a4:	56                   	push   %esi
     3a5:	53                   	push   %ebx
     3a6:	83 ec 1c             	sub    $0x1c,%esp
     3a9:	8b 75 08             	mov    0x8(%ebp),%esi
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     3ac:	ff 75 10             	pushl  0x10(%ebp)
     3af:	ff 75 0c             	pushl  0xc(%ebp)
     3b2:	68 f0 23 00 00       	push   $0x23f0
     3b7:	6a 01                	push   $0x1
int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     3b9:	8b 5d 24             	mov    0x24(%ebp),%ebx
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     3bc:	e8 9f 1b 00 00       	call   1f60 <printf>
    char *old_end_of_heap = sbrk(size);
     3c1:	89 34 24             	mov    %esi,(%esp)
     3c4:	e8 a1 1a 00 00       	call   1e6a <sbrk>
     3c9:	89 c7                	mov    %eax,%edi
    char *new_end_of_heap = sbrk(0);
     3cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3d2:	e8 93 1a 00 00       	call   1e6a <sbrk>
    if (old_end_of_heap == (char*) -1) {
     3d7:	83 c4 10             	add    $0x10,%esp
     3da:	83 ff ff             	cmp    $0xffffffff,%edi
     3dd:	0f 84 1d 01 00 00    	je     500 <test_allocation_no_fork+0x160>
    } else if (new_end_of_heap - old_end_of_heap != size) {
     3e3:	29 f8                	sub    %edi,%eax
     3e5:	39 f0                	cmp    %esi,%eax
     3e7:	0f 85 d3 00 00 00    	jne    4c0 <test_allocation_no_fork+0x120>
        char *place_one = &old_end_of_heap[offset1];
     3ed:	8b 75 14             	mov    0x14(%ebp),%esi
        char *place_two = &old_end_of_heap[offset2];
     3f0:	8b 45 1c             	mov    0x1c(%ebp),%eax
        char *place_one = &old_end_of_heap[offset1];
     3f3:	01 fe                	add    %edi,%esi
        char *place_two = &old_end_of_heap[offset2];
     3f5:	01 f8                	add    %edi,%eax
        for (i = 0; i < count1; ++i) {
     3f7:	8b 7d 18             	mov    0x18(%ebp),%edi
     3fa:	85 ff                	test   %edi,%edi
     3fc:	0f 8e 1e 01 00 00    	jle    520 <test_allocation_no_fork+0x180>
     402:	8b 7d 18             	mov    0x18(%ebp),%edi
     405:	89 f1                	mov    %esi,%ecx
        int failed = 0;
     407:	31 d2                	xor    %edx,%edx
                failed = 1;
     409:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     40c:	01 f7                	add    %esi,%edi
     40e:	66 90                	xchg   %ax,%ax
            if (check_zero && place_one[i] != '\0') {
     410:	85 db                	test   %ebx,%ebx
     412:	74 0b                	je     41f <test_allocation_no_fork+0x7f>
                failed = 1;
     414:	80 39 00             	cmpb   $0x0,(%ecx)
     417:	b8 01 00 00 00       	mov    $0x1,%eax
     41c:	0f 45 d0             	cmovne %eax,%edx
            place_one[i] = 'A';
     41f:	c6 01 41             	movb   $0x41,(%ecx)
     422:	83 c1 01             	add    $0x1,%ecx
        for (i = 0; i < count1; ++i) {
     425:	39 cf                	cmp    %ecx,%edi
     427:	75 e7                	jne    410 <test_allocation_no_fork+0x70>
        for (i = 0; i < count2; ++i) {
     429:	8b 7d 20             	mov    0x20(%ebp),%edi
     42c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     42f:	85 ff                	test   %edi,%edi
     431:	7e 2d                	jle    460 <test_allocation_no_fork+0xc0>
                failed = 1;
     433:	89 75 e4             	mov    %esi,-0x1c(%ebp)
     436:	8b 75 20             	mov    0x20(%ebp),%esi
        int failed = 0;
     439:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     43b:	bf 01 00 00 00       	mov    $0x1,%edi
            if (check_zero && place_two[i] != '\0') {
     440:	85 db                	test   %ebx,%ebx
     442:	74 07                	je     44b <test_allocation_no_fork+0xab>
                failed = 1;
     444:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     448:	0f 45 d7             	cmovne %edi,%edx
            place_two[i] = 'B';
     44b:	c6 04 08 42          	movb   $0x42,(%eax,%ecx,1)
        for (i = 0; i < count2; ++i) {
     44f:	83 c1 01             	add    $0x1,%ecx
     452:	39 ce                	cmp    %ecx,%esi
     454:	7f ea                	jg     440 <test_allocation_no_fork+0xa0>
        for (i = 0; i < count1; ++i) {
     456:	8b 5d 18             	mov    0x18(%ebp),%ebx
     459:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     45c:	85 db                	test   %ebx,%ebx
     45e:	7e 25                	jle    485 <test_allocation_no_fork+0xe5>
                failed = 1;
     460:	8b 7d 18             	mov    0x18(%ebp),%edi
                failed = 1;
     463:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     465:	bb 01 00 00 00       	mov    $0x1,%ebx
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     470:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     474:	0f 45 d3             	cmovne %ebx,%edx
        for (i = 0; i < count1; ++i) {
     477:	83 c1 01             	add    $0x1,%ecx
     47a:	39 cf                	cmp    %ecx,%edi
     47c:	7f f2                	jg     470 <test_allocation_no_fork+0xd0>
        for (i = 0; i < count2; ++i) {
     47e:	8b 4d 20             	mov    0x20(%ebp),%ecx
     481:	85 c9                	test   %ecx,%ecx
     483:	7e 18                	jle    49d <test_allocation_no_fork+0xfd>
     485:	8b 4d 20             	mov    0x20(%ebp),%ecx
                failed = 1;
     488:	bb 01 00 00 00       	mov    $0x1,%ebx
     48d:	01 c1                	add    %eax,%ecx
     48f:	90                   	nop
     490:	80 38 42             	cmpb   $0x42,(%eax)
     493:	0f 45 d3             	cmovne %ebx,%edx
     496:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     499:	39 c8                	cmp    %ecx,%eax
     49b:	75 f3                	jne    490 <test_allocation_no_fork+0xf0>
        if (failed) {
     49d:	85 d2                	test   %edx,%edx
     49f:	75 3f                	jne    4e0 <test_allocation_no_fork+0x140>
            printf(1, PASS_MSG "\n");
     4a1:	83 ec 08             	sub    $0x8,%esp
     4a4:	68 00 23 00 00       	push   $0x2300
     4a9:	6a 01                	push   $0x1
     4ab:	e8 b0 1a 00 00       	call   1f60 <printf>
            return 1;
     4b0:	83 c4 10             	add    $0x10,%esp
}
     4b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 1;
     4b6:	b8 01 00 00 00       	mov    $0x1,%eax
}
     4bb:	5b                   	pop    %ebx
     4bc:	5e                   	pop    %esi
     4bd:	5f                   	pop    %edi
     4be:	5d                   	pop    %ebp
     4bf:	c3                   	ret    
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     4c0:	83 ec 08             	sub    $0x8,%esp
     4c3:	68 d4 22 00 00       	push   $0x22d4
     4c8:	6a 01                	push   $0x1
     4ca:	e8 91 1a 00 00       	call   1f60 <printf>
        return 0;
     4cf:	83 c4 10             	add    $0x10,%esp
}
     4d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     4d5:	31 c0                	xor    %eax,%eax
}
     4d7:	5b                   	pop    %ebx
     4d8:	5e                   	pop    %esi
     4d9:	5f                   	pop    %edi
     4da:	5d                   	pop    %ebp
     4db:	c3                   	ret    
     4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, FAIL_MSG "HEAP_VALUES\n");
     4e0:	83 ec 08             	sub    $0x8,%esp
     4e3:	68 e9 22 00 00       	push   $0x22e9
     4e8:	6a 01                	push   $0x1
     4ea:	e8 71 1a 00 00       	call   1f60 <printf>
            return 0;
     4ef:	83 c4 10             	add    $0x10,%esp
}
     4f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 0;
     4f5:	31 c0                	xor    %eax,%eax
}
     4f7:	5b                   	pop    %ebx
     4f8:	5e                   	pop    %esi
     4f9:	5f                   	pop    %edi
     4fa:	5d                   	pop    %ebp
     4fb:	c3                   	ret    
     4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     500:	83 ec 08             	sub    $0x8,%esp
     503:	68 be 22 00 00       	push   $0x22be
     508:	6a 01                	push   $0x1
     50a:	e8 51 1a 00 00       	call   1f60 <printf>
        return 0;
     50f:	83 c4 10             	add    $0x10,%esp
}
     512:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     515:	31 c0                	xor    %eax,%eax
}
     517:	5b                   	pop    %ebx
     518:	5e                   	pop    %esi
     519:	5f                   	pop    %edi
     51a:	5d                   	pop    %ebp
     51b:	c3                   	ret    
     51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (i = 0; i < count2; ++i) {
     520:	8b 4d 20             	mov    0x20(%ebp),%ecx
        int failed = 0;
     523:	31 d2                	xor    %edx,%edx
        for (i = 0; i < count2; ++i) {
     525:	85 c9                	test   %ecx,%ecx
     527:	0f 8f 06 ff ff ff    	jg     433 <test_allocation_no_fork+0x93>
     52d:	e9 6f ff ff ff       	jmp    4a1 <test_allocation_no_fork+0x101>
     532:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000540 <test_allocation_fork>:
int test_allocation_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2) {
     540:	55                   	push   %ebp
     541:	89 e5                	mov    %esp,%ebp
     543:	57                   	push   %edi
     544:	56                   	push   %esi
     545:	53                   	push   %ebx
     546:	83 ec 2c             	sub    $0x2c,%esp
     549:	8b 75 0c             	mov    0xc(%ebp),%esi
     54c:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     54f:	57                   	push   %edi
     550:	56                   	push   %esi
     551:	68 f0 23 00 00       	push   $0x23f0
     556:	6a 01                	push   $0x1
     558:	e8 03 1a 00 00       	call   1f60 <printf>
    pipe(fds);
     55d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     560:	89 04 24             	mov    %eax,(%esp)
     563:	e8 8a 18 00 00       	call   1df2 <pipe>
    int pid = fork();
     568:	e8 6d 18 00 00       	call   1dda <fork>
    if (pid == 0) {
     56d:	83 c4 10             	add    $0x10,%esp
     570:	83 f8 00             	cmp    $0x0,%eax
     573:	0f 84 99 01 00 00    	je     712 <test_allocation_fork+0x1d2>
    } else if (pid > 0) {
     579:	0f 8e b9 00 00 00    	jle    638 <test_allocation_fork+0xf8>
        close(fds[1]);
     57f:	83 ec 0c             	sub    $0xc,%esp
     582:	ff 75 d8             	pushl  -0x28(%ebp)
     585:	e8 80 18 00 00       	call   1e0a <close>
        int size = read(fds[0], text, 10);
     58a:	8d 45 de             	lea    -0x22(%ebp),%eax
     58d:	83 c4 0c             	add    $0xc,%esp
     590:	6a 0a                	push   $0xa
     592:	50                   	push   %eax
     593:	ff 75 d4             	pushl  -0x2c(%ebp)
     596:	e8 5f 18 00 00       	call   1dfa <read>
     59b:	89 c3                	mov    %eax,%ebx
        wait();
     59d:	e8 48 18 00 00       	call   1dea <wait>
        close(fds[0]);
     5a2:	58                   	pop    %eax
     5a3:	ff 75 d4             	pushl  -0x2c(%ebp)
     5a6:	e8 5f 18 00 00       	call   1e0a <close>
        if (size == 2 && text[0] == 'N') {
     5ab:	83 c4 10             	add    $0x10,%esp
     5ae:	83 fb 02             	cmp    $0x2,%ebx
     5b1:	74 3d                	je     5f0 <test_allocation_fork+0xb0>
        } else if (size == 0) {
     5b3:	83 fb 00             	cmp    $0x0,%ebx
     5b6:	0f 84 a4 00 00 00    	je     660 <test_allocation_fork+0x120>
        } else if (size >= 1 && text[0] == 'Y') {
     5bc:	7e 0c                	jle    5ca <test_allocation_fork+0x8a>
     5be:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     5c2:	3c 59                	cmp    $0x59,%al
     5c4:	0f 84 b6 00 00 00    	je     680 <test_allocation_fork+0x140>
            printf(1, FAIL_MSG "unknown error\n");
     5ca:	83 ec 08             	sub    $0x8,%esp
            return 0;
     5cd:	31 db                	xor    %ebx,%ebx
            printf(1, FAIL_MSG "unknown error\n");
     5cf:	68 15 23 00 00       	push   $0x2315
     5d4:	6a 01                	push   $0x1
     5d6:	e8 85 19 00 00       	call   1f60 <printf>
            return 0;
     5db:	83 c4 10             	add    $0x10,%esp
}
     5de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5e1:	89 d8                	mov    %ebx,%eax
     5e3:	5b                   	pop    %ebx
     5e4:	5e                   	pop    %esi
     5e5:	5f                   	pop    %edi
     5e6:	5d                   	pop    %ebp
     5e7:	c3                   	ret    
     5e8:	90                   	nop
     5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (size == 2 && text[0] == 'N') {
     5f0:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     5f4:	3c 4e                	cmp    $0x4e,%al
     5f6:	75 ca                	jne    5c2 <test_allocation_fork+0x82>
            if (text[1] == 'A') {
     5f8:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
     5fc:	3c 41                	cmp    $0x41,%al
     5fe:	0f 84 bc 00 00 00    	je     6c0 <test_allocation_fork+0x180>
            } else if (text[1] == 'I') {
     604:	3c 49                	cmp    $0x49,%al
     606:	0f 84 94 00 00 00    	je     6a0 <test_allocation_fork+0x160>
            } else if (text[1] == 'R') {
     60c:	3c 52                	cmp    $0x52,%al
     60e:	0f 84 e6 00 00 00    	je     6fa <test_allocation_fork+0x1ba>
            } else if (text[1] == 'S') {
     614:	3c 53                	cmp    $0x53,%al
     616:	0f 84 c4 00 00 00    	je     6e0 <test_allocation_fork+0x1a0>
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     61c:	56                   	push   %esi
     61d:	57                   	push   %edi
            return 0;
     61e:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     620:	68 18 25 00 00       	push   $0x2518
     625:	6a 01                	push   $0x1
     627:	e8 34 19 00 00       	call   1f60 <printf>
     62c:	83 c4 10             	add    $0x10,%esp
     62f:	eb ad                	jmp    5de <test_allocation_fork+0x9e>
     631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     638:	83 ec 08             	sub    $0x8,%esp
        return 0;
     63b:	31 db                	xor    %ebx,%ebx
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     63d:	68 dc 25 00 00       	push   $0x25dc
     642:	6a 01                	push   $0x1
     644:	e8 17 19 00 00       	call   1f60 <printf>
        return 0;
     649:	83 c4 10             	add    $0x10,%esp
}
     64c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     64f:	89 d8                	mov    %ebx,%eax
     651:	5b                   	pop    %ebx
     652:	5e                   	pop    %esi
     653:	5f                   	pop    %edi
     654:	5d                   	pop    %ebp
     655:	c3                   	ret    
     656:	8d 76 00             	lea    0x0(%esi),%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
     660:	57                   	push   %edi
     661:	56                   	push   %esi
     662:	68 54 25 00 00       	push   $0x2554
     667:	6a 01                	push   $0x1
     669:	e8 f2 18 00 00       	call   1f60 <printf>
            return 0;
     66e:	83 c4 10             	add    $0x10,%esp
}
     671:	8d 65 f4             	lea    -0xc(%ebp),%esp
     674:	89 d8                	mov    %ebx,%eax
     676:	5b                   	pop    %ebx
     677:	5e                   	pop    %esi
     678:	5f                   	pop    %edi
     679:	5d                   	pop    %ebp
     67a:	c3                   	ret    
     67b:	90                   	nop
     67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     680:	57                   	push   %edi
     681:	56                   	push   %esi
            return 1;
     682:	bb 01 00 00 00       	mov    $0x1,%ebx
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     687:	68 98 25 00 00       	push   $0x2598
     68c:	6a 01                	push   $0x1
     68e:	e8 cd 18 00 00       	call   1f60 <printf>
            return 1;
     693:	83 c4 10             	add    $0x10,%esp
     696:	e9 43 ff ff ff       	jmp    5de <test_allocation_fork+0x9e>
     69b:	90                   	nop
     69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     6a0:	83 ec 08             	sub    $0x8,%esp
            return 0;
     6a3:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     6a5:	68 74 24 00 00       	push   $0x2474
     6aa:	6a 01                	push   $0x1
     6ac:	e8 af 18 00 00       	call   1f60 <printf>
     6b1:	83 c4 10             	add    $0x10,%esp
     6b4:	e9 25 ff ff ff       	jmp    5de <test_allocation_fork+0x9e>
     6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     6c0:	83 ec 04             	sub    $0x4,%esp
            return 0;
     6c3:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     6c5:	56                   	push   %esi
     6c6:	68 30 24 00 00       	push   $0x2430
     6cb:	6a 01                	push   $0x1
     6cd:	e8 8e 18 00 00       	call   1f60 <printf>
     6d2:	83 c4 10             	add    $0x10,%esp
     6d5:	e9 04 ff ff ff       	jmp    5de <test_allocation_fork+0x9e>
     6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     6e0:	83 ec 04             	sub    $0x4,%esp
            return 0;
     6e3:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     6e5:	56                   	push   %esi
     6e6:	68 e4 24 00 00       	push   $0x24e4
     6eb:	6a 01                	push   $0x1
     6ed:	e8 6e 18 00 00       	call   1f60 <printf>
     6f2:	83 c4 10             	add    $0x10,%esp
     6f5:	e9 e4 fe ff ff       	jmp    5de <test_allocation_fork+0x9e>
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6fa:	56                   	push   %esi
     6fb:	57                   	push   %edi
            return 0;
     6fc:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6fe:	68 a8 24 00 00       	push   $0x24a8
     703:	6a 01                	push   $0x1
     705:	e8 56 18 00 00       	call   1f60 <printf>
     70a:	83 c4 10             	add    $0x10,%esp
     70d:	e9 cc fe ff ff       	jmp    5de <test_allocation_fork+0x9e>
        char *old_end_of_heap = sbrk(size);
     712:	83 ec 0c             	sub    $0xc,%esp
     715:	ff 75 08             	pushl  0x8(%ebp)
     718:	89 c3                	mov    %eax,%ebx
     71a:	e8 4b 17 00 00       	call   1e6a <sbrk>
     71f:	89 c7                	mov    %eax,%edi
        char *new_end_of_heap = sbrk(0);
     721:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     728:	e8 3d 17 00 00       	call   1e6a <sbrk>
        if (old_end_of_heap == (char*) -1) {
     72d:	83 c4 10             	add    $0x10,%esp
     730:	83 ff ff             	cmp    $0xffffffff,%edi
     733:	0f 84 d5 00 00 00    	je     80e <test_allocation_fork+0x2ce>
        } else if (new_end_of_heap - old_end_of_heap != size) {
     739:	29 f8                	sub    %edi,%eax
     73b:	3b 45 08             	cmp    0x8(%ebp),%eax
     73e:	74 18                	je     758 <test_allocation_fork+0x218>
            write(fds[1], "NS", 2);
     740:	53                   	push   %ebx
     741:	6a 02                	push   $0x2
     743:	68 12 23 00 00       	push   $0x2312
     748:	ff 75 d8             	pushl  -0x28(%ebp)
     74b:	e8 b2 16 00 00       	call   1e02 <write>
     750:	83 c4 10             	add    $0x10,%esp
        exit();
     753:	e8 8a 16 00 00       	call   1de2 <exit>
            char *place_one = &old_end_of_heap[offset1];
     758:	8b 75 14             	mov    0x14(%ebp),%esi
            char *place_two = &old_end_of_heap[offset2];
     75b:	8b 55 1c             	mov    0x1c(%ebp),%edx
            char failed_text[2] = "NR";
     75e:	66 c7 45 de 4e 52    	movw   $0x524e,-0x22(%ebp)
            char *place_one = &old_end_of_heap[offset1];
     764:	01 fe                	add    %edi,%esi
            char *place_two = &old_end_of_heap[offset2];
     766:	01 fa                	add    %edi,%edx
            for (i = 0; i < count1; ++i) {
     768:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     76c:	0f 8e b4 00 00 00    	jle    826 <test_allocation_fork+0x2e6>
     772:	8b 7d 18             	mov    0x18(%ebp),%edi
     775:	89 f1                	mov    %esi,%ecx
            int failed = 0;
     777:	31 c0                	xor    %eax,%eax
     779:	01 f7                	add    %esi,%edi
                if (place_one[i] != 0) {
     77b:	80 39 00             	cmpb   $0x0,(%ecx)
     77e:	74 09                	je     789 <test_allocation_fork+0x249>
                    failed_text[1] = 'I';
     780:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     784:	b8 01 00 00 00       	mov    $0x1,%eax
                place_one[i] = 'A';
     789:	c6 01 41             	movb   $0x41,(%ecx)
     78c:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count1; ++i) {
     78f:	39 f9                	cmp    %edi,%ecx
     791:	75 e8                	jne    77b <test_allocation_fork+0x23b>
            for (i = 0; i < count2; ++i) {
     793:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     797:	7e 25                	jle    7be <test_allocation_fork+0x27e>
     799:	8b 7d 20             	mov    0x20(%ebp),%edi
     79c:	89 d1                	mov    %edx,%ecx
     79e:	01 d7                	add    %edx,%edi
                if (place_two[i] != 0) {
     7a0:	80 39 00             	cmpb   $0x0,(%ecx)
     7a3:	74 09                	je     7ae <test_allocation_fork+0x26e>
                    failed_text[1] = 'I';
     7a5:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     7a9:	b8 01 00 00 00       	mov    $0x1,%eax
                place_two[i] = 'B';
     7ae:	c6 01 42             	movb   $0x42,(%ecx)
     7b1:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count2; ++i) {
     7b4:	39 f9                	cmp    %edi,%ecx
     7b6:	75 e8                	jne    7a0 <test_allocation_fork+0x260>
            for (i = 0; i < count1; ++i) {
     7b8:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     7bc:	7e 1c                	jle    7da <test_allocation_fork+0x29a>
                    failed = 1;
     7be:	31 c9                	xor    %ecx,%ecx
                    failed = 1;
     7c0:	bf 01 00 00 00       	mov    $0x1,%edi
     7c5:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     7c9:	0f 45 c7             	cmovne %edi,%eax
            for (i = 0; i < count1; ++i) {
     7cc:	83 c1 01             	add    $0x1,%ecx
     7cf:	39 4d 18             	cmp    %ecx,0x18(%ebp)
     7d2:	7f f1                	jg     7c5 <test_allocation_fork+0x285>
            for (i = 0; i < count2; ++i) {
     7d4:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     7d8:	7e 14                	jle    7ee <test_allocation_fork+0x2ae>
                    failed = 1;
     7da:	b9 01 00 00 00       	mov    $0x1,%ecx
     7df:	80 3c 1a 42          	cmpb   $0x42,(%edx,%ebx,1)
     7e3:	0f 45 c1             	cmovne %ecx,%eax
            for (i = 0; i < count2; ++i) {
     7e6:	83 c3 01             	add    $0x1,%ebx
     7e9:	39 5d 20             	cmp    %ebx,0x20(%ebp)
     7ec:	7f f1                	jg     7df <test_allocation_fork+0x29f>
            write(fds[1], failed ? failed_text : "YY", 2);
     7ee:	85 c0                	test   %eax,%eax
     7f0:	8d 55 de             	lea    -0x22(%ebp),%edx
     7f3:	75 05                	jne    7fa <test_allocation_fork+0x2ba>
     7f5:	ba 0c 23 00 00       	mov    $0x230c,%edx
     7fa:	51                   	push   %ecx
     7fb:	6a 02                	push   $0x2
     7fd:	52                   	push   %edx
     7fe:	ff 75 d8             	pushl  -0x28(%ebp)
     801:	e8 fc 15 00 00       	call   1e02 <write>
     806:	83 c4 10             	add    $0x10,%esp
     809:	e9 45 ff ff ff       	jmp    753 <test_allocation_fork+0x213>
            write(fds[1], "NA", 2);
     80e:	56                   	push   %esi
     80f:	6a 02                	push   $0x2
     811:	68 0f 23 00 00       	push   $0x230f
     816:	ff 75 d8             	pushl  -0x28(%ebp)
     819:	e8 e4 15 00 00       	call   1e02 <write>
     81e:	83 c4 10             	add    $0x10,%esp
     821:	e9 2d ff ff ff       	jmp    753 <test_allocation_fork+0x213>
            int failed = 0;
     826:	31 c0                	xor    %eax,%eax
            for (i = 0; i < count2; ++i) {
     828:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     82c:	0f 8f 67 ff ff ff    	jg     799 <test_allocation_fork+0x259>
     832:	eb c1                	jmp    7f5 <test_allocation_fork+0x2b5>
     834:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     83a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000840 <wait_forever>:
void wait_forever() {
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	83 ec 08             	sub    $0x8,%esp
     846:	8d 76 00             	lea    0x0(%esi),%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while (1) { sleep(1000); }
     850:	83 ec 0c             	sub    $0xc,%esp
     853:	68 e8 03 00 00       	push   $0x3e8
     858:	e8 15 16 00 00       	call   1e72 <sleep>
     85d:	83 c4 10             	add    $0x10,%esp
     860:	eb ee                	jmp    850 <wait_forever+0x10>
     862:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000870 <test_copy_on_write_main_child>:
void test_copy_on_write_main_child(int result_fd, int size, const char *describe_size, int forks) {
     870:	55                   	push   %ebp
     871:	89 e5                	mov    %esp,%ebp
     873:	57                   	push   %edi
     874:	56                   	push   %esi
     875:	53                   	push   %ebx
     876:	83 ec 78             	sub    $0x78,%esp
  char *old_end_of_heap = sbrk(size);
     879:	ff 75 0c             	pushl  0xc(%ebp)
     87c:	e8 e9 15 00 00       	call   1e6a <sbrk>
     881:	89 c7                	mov    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     883:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  char *old_end_of_heap = sbrk(size);
     88a:	89 45 94             	mov    %eax,-0x6c(%ebp)
  char *new_end_of_heap = sbrk(0);
     88d:	e8 d8 15 00 00       	call   1e6a <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     892:	83 c4 10             	add    $0x10,%esp
     895:	39 c7                	cmp    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     897:	89 45 90             	mov    %eax,-0x70(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     89a:	73 0e                	jae    8aa <test_copy_on_write_main_child+0x3a>
     89c:	89 c2                	mov    %eax,%edx
     89e:	89 f8                	mov    %edi,%eax
      *p = 'A';
     8a0:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     8a3:	83 c0 01             	add    $0x1,%eax
     8a6:	39 c2                	cmp    %eax,%edx
     8a8:	75 f6                	jne    8a0 <test_copy_on_write_main_child+0x30>
  int children[MAX_CHILDREN] = {0};
     8aa:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     8ac:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     8b0:	8d 7d a8             	lea    -0x58(%ebp),%edi
     8b3:	b9 10 00 00 00       	mov    $0x10,%ecx
     8b8:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     8ba:	0f 8f 80 01 00 00    	jg     a40 <test_copy_on_write_main_child+0x1d0>
  for (int i = 0; i < forks; ++i) {
     8c0:	8b 4d 14             	mov    0x14(%ebp),%ecx
     8c3:	85 c9                	test   %ecx,%ecx
     8c5:	0f 8e 8c 01 00 00    	jle    a57 <test_copy_on_write_main_child+0x1e7>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     8cb:	31 db                	xor    %ebx,%ebx
     8cd:	bf 20 00 00 00       	mov    $0x20,%edi
     8d2:	31 f6                	xor    %esi,%esi
     8d4:	eb 6a                	jmp    940 <test_copy_on_write_main_child+0xd0>
     8d6:	8d 76 00             	lea    0x0(%esi),%esi
     8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    children[i] = fork();
     8e0:	e8 f5 14 00 00       	call   1dda <fork>
    if (children[i] == -1) {
     8e5:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     8e8:	89 44 9d a8          	mov    %eax,-0x58(%ebp,%ebx,4)
    if (children[i] == -1) {
     8ec:	0f 84 85 00 00 00    	je     977 <test_copy_on_write_main_child+0x107>
    } else if (children[i] == 0) {
     8f2:	85 c0                	test   %eax,%eax
     8f4:	0f 84 72 01 00 00    	je     a6c <test_copy_on_write_main_child+0x1fc>
      read(child_fds[0], buffer, 1);
     8fa:	8d 45 9f             	lea    -0x61(%ebp),%eax
     8fd:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     900:	c6 45 9f 58          	movb   $0x58,-0x61(%ebp)
      read(child_fds[0], buffer, 1);
     904:	6a 01                	push   $0x1
     906:	50                   	push   %eax
     907:	ff 75 a0             	pushl  -0x60(%ebp)
     90a:	e8 eb 14 00 00       	call   1dfa <read>
        failed_code = 'c';
     90f:	80 7d 9f 2b          	cmpb   $0x2b,-0x61(%ebp)
      if (buffer[0] != '+') {
     913:	58                   	pop    %eax
        failed_code = 'c';
     914:	b8 63 00 00 00       	mov    $0x63,%eax
      close(child_fds[0]); close(child_fds[1]);
     919:	ff 75 a0             	pushl  -0x60(%ebp)
        failed_code = 'c';
     91c:	0f 45 f8             	cmovne %eax,%edi
     91f:	b8 01 00 00 00       	mov    $0x1,%eax
     924:	0f 45 f0             	cmovne %eax,%esi
  for (int i = 0; i < forks; ++i) {
     927:	83 c3 01             	add    $0x1,%ebx
      close(child_fds[0]); close(child_fds[1]);
     92a:	e8 db 14 00 00       	call   1e0a <close>
     92f:	5a                   	pop    %edx
     930:	ff 75 a4             	pushl  -0x5c(%ebp)
     933:	e8 d2 14 00 00       	call   1e0a <close>
  for (int i = 0; i < forks; ++i) {
     938:	83 c4 10             	add    $0x10,%esp
     93b:	39 5d 14             	cmp    %ebx,0x14(%ebp)
     93e:	74 53                	je     993 <test_copy_on_write_main_child+0x123>
    if (pipe(child_fds) < 0) {
     940:	8d 45 a0             	lea    -0x60(%ebp),%eax
     943:	83 ec 0c             	sub    $0xc,%esp
     946:	50                   	push   %eax
     947:	e8 a6 14 00 00       	call   1df2 <pipe>
     94c:	83 c4 10             	add    $0x10,%esp
     94f:	85 c0                	test   %eax,%eax
     951:	79 8d                	jns    8e0 <test_copy_on_write_main_child+0x70>
      printf(2, "pipe failed!\n");
     953:	83 ec 08             	sub    $0x8,%esp
     956:	68 32 23 00 00       	push   $0x2332
     95b:	6a 02                	push   $0x2
     95d:	e8 fe 15 00 00       	call   1f60 <printf>
     962:	83 c4 10             	add    $0x10,%esp
    children[i] = fork();
     965:	e8 70 14 00 00       	call   1dda <fork>
    if (children[i] == -1) {
     96a:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     96d:	89 44 9d a8          	mov    %eax,-0x58(%ebp,%ebx,4)
    if (children[i] == -1) {
     971:	0f 85 7b ff ff ff    	jne    8f2 <test_copy_on_write_main_child+0x82>
      printf(2, "fork failed\n");
     977:	83 ec 08             	sub    $0x8,%esp
      failed_code = 'f';
     97a:	bf 66 00 00 00       	mov    $0x66,%edi
      failed = 1;
     97f:	be 01 00 00 00       	mov    $0x1,%esi
      printf(2, "fork failed\n");
     984:	68 40 23 00 00       	push   $0x2340
     989:	6a 02                	push   $0x2
     98b:	e8 d0 15 00 00       	call   1f60 <printf>
      break;
     990:	83 c4 10             	add    $0x10,%esp
     993:	8b 45 14             	mov    0x14(%ebp),%eax
     996:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     999:	89 75 8c             	mov    %esi,-0x74(%ebp)
     99c:	89 de                	mov    %ebx,%esi
     99e:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     9a1:	89 c3                	mov    %eax,%ebx
     9a3:	90                   	nop
     9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kill(children[i]);
     9a8:	83 ec 0c             	sub    $0xc,%esp
     9ab:	ff 36                	pushl  (%esi)
     9ad:	83 c6 04             	add    $0x4,%esi
     9b0:	e8 5d 14 00 00       	call   1e12 <kill>
    wait();
     9b5:	e8 30 14 00 00       	call   1dea <wait>
  for (int i = 0; i < forks; ++i) {
     9ba:	83 c4 10             	add    $0x10,%esp
     9bd:	39 de                	cmp    %ebx,%esi
     9bf:	75 e7                	jne    9a8 <test_copy_on_write_main_child+0x138>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9c1:	8b 55 90             	mov    -0x70(%ebp),%edx
     9c4:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     9c7:	8b 75 8c             	mov    -0x74(%ebp),%esi
     9ca:	73 24                	jae    9f0 <test_copy_on_write_main_child+0x180>
      failed_code = 'p';
     9cc:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
     9cf:	8b 5d 90             	mov    -0x70(%ebp),%ebx
     9d2:	ba 70 00 00 00       	mov    $0x70,%edx
     9d7:	b8 01 00 00 00       	mov    $0x1,%eax
     9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9e0:	80 39 41             	cmpb   $0x41,(%ecx)
     9e3:	0f 45 fa             	cmovne %edx,%edi
     9e6:	0f 45 f0             	cmovne %eax,%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9e9:	83 c1 01             	add    $0x1,%ecx
     9ec:	39 cb                	cmp    %ecx,%ebx
     9ee:	75 f0                	jne    9e0 <test_copy_on_write_main_child+0x170>
  if (failed) {
     9f0:	85 f6                	test   %esi,%esi
     9f2:	75 24                	jne    a18 <test_copy_on_write_main_child+0x1a8>
    write(result_fd, "YY", 2);
     9f4:	83 ec 04             	sub    $0x4,%esp
     9f7:	6a 02                	push   $0x2
     9f9:	68 0c 23 00 00       	push   $0x230c
     9fe:	ff 75 08             	pushl  0x8(%ebp)
     a01:	e8 fc 13 00 00       	call   1e02 <write>
     a06:	83 c4 10             	add    $0x10,%esp
}
     a09:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a0c:	5b                   	pop    %ebx
     a0d:	5e                   	pop    %esi
     a0e:	5f                   	pop    %edi
     a0f:	5d                   	pop    %ebp
     a10:	c3                   	ret    
     a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buffer[1] = failed_code;
     a18:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     a1a:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     a1d:	c6 45 a0 4e          	movb   $0x4e,-0x60(%ebp)
    buffer[1] = failed_code;
     a21:	88 45 a1             	mov    %al,-0x5f(%ebp)
    write(result_fd, buffer, 2);
     a24:	8d 45 a0             	lea    -0x60(%ebp),%eax
     a27:	6a 02                	push   $0x2
     a29:	50                   	push   %eax
     a2a:	ff 75 08             	pushl  0x8(%ebp)
     a2d:	e8 d0 13 00 00       	call   1e02 <write>
     a32:	83 c4 10             	add    $0x10,%esp
}
     a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a38:	5b                   	pop    %ebx
     a39:	5e                   	pop    %esi
     a3a:	5f                   	pop    %edi
     a3b:	5d                   	pop    %ebp
     a3c:	c3                   	ret    
     a3d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     a40:	83 ec 08             	sub    $0x8,%esp
     a43:	68 0c 26 00 00       	push   $0x260c
     a48:	6a 02                	push   $0x2
     a4a:	e8 11 15 00 00       	call   1f60 <printf>
     a4f:	83 c4 10             	add    $0x10,%esp
     a52:	e9 74 fe ff ff       	jmp    8cb <test_copy_on_write_main_child+0x5b>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a57:	31 f6                	xor    %esi,%esi
     a59:	8b 55 90             	mov    -0x70(%ebp),%edx
     a5c:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     a5f:	bf 20 00 00 00       	mov    $0x20,%edi
     a64:	0f 82 62 ff ff ff    	jb     9cc <test_copy_on_write_main_child+0x15c>
     a6a:	eb 88                	jmp    9f4 <test_copy_on_write_main_child+0x184>
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a6c:	8b 55 94             	mov    -0x6c(%ebp),%edx
     a6f:	8b 4d 90             	mov    -0x70(%ebp),%ecx
     a72:	39 ca                	cmp    %ecx,%edx
     a74:	73 13                	jae    a89 <test_copy_on_write_main_child+0x219>
          found_wrong_memory = 1;
     a76:	b9 01 00 00 00       	mov    $0x1,%ecx
     a7b:	80 3a 41             	cmpb   $0x41,(%edx)
     a7e:	0f 45 c1             	cmovne %ecx,%eax
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a81:	83 c2 01             	add    $0x1,%edx
     a84:	39 55 90             	cmp    %edx,-0x70(%ebp)
     a87:	75 f2                	jne    a7b <test_copy_on_write_main_child+0x20b>
      int place_one = size / 2;
     a89:	8b 7d 0c             	mov    0xc(%ebp),%edi
      old_end_of_heap[place_one] = 'B' + i;
     a8c:	8b 75 94             	mov    -0x6c(%ebp),%esi
     a8f:	8d 53 42             	lea    0x42(%ebx),%edx
      int place_one = size / 2;
     a92:	c1 ef 1f             	shr    $0x1f,%edi
     a95:	03 7d 0c             	add    0xc(%ebp),%edi
     a98:	d1 ff                	sar    %edi
      old_end_of_heap[place_one] = 'B' + i;
     a9a:	8d 0c 37             	lea    (%edi,%esi,1),%ecx
     a9d:	88 11                	mov    %dl,(%ecx)
     a9f:	89 4d 90             	mov    %ecx,-0x70(%ebp)
      int place_two = 4096 * i;
     aa2:	89 da                	mov    %ebx,%edx
          place_two = size - 1;
     aa4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_two = 4096 * i;
     aa7:	c1 e2 0c             	shl    $0xc,%edx
          place_two = size - 1;
     aaa:	83 e9 01             	sub    $0x1,%ecx
     aad:	39 55 0c             	cmp    %edx,0xc(%ebp)
     ab0:	0f 4f ca             	cmovg  %edx,%ecx
      old_end_of_heap[place_two] = 'C';
     ab3:	c6 04 0e 43          	movb   $0x43,(%esi,%ecx,1)
      int place_three = 4096 * (i - 1);
     ab7:	8d b2 00 f0 ff ff    	lea    -0x1000(%edx),%esi
      if (place_three >= size || place_three < 0) {
     abd:	39 75 0c             	cmp    %esi,0xc(%ebp)
     ac0:	7e 37                	jle    af9 <test_copy_on_write_main_child+0x289>
     ac2:	85 f6                	test   %esi,%esi
     ac4:	78 33                	js     af9 <test_copy_on_write_main_child+0x289>
          place_four = size - 3;
     ac6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_four = 4096 * (i + 1);
     ac9:	81 c2 00 10 00 00    	add    $0x1000,%edx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     acf:	8b 7d 94             	mov    -0x6c(%ebp),%edi
          place_four = size - 3;
     ad2:	83 e9 03             	sub    $0x3,%ecx
     ad5:	39 55 0c             	cmp    %edx,0xc(%ebp)
     ad8:	0f 4e d1             	cmovle %ecx,%edx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     adb:	80 3c 37 41          	cmpb   $0x41,(%edi,%esi,1)
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     adf:	b9 2e 23 00 00       	mov    $0x232e,%ecx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ae4:	74 1b                	je     b01 <test_copy_on_write_main_child+0x291>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     ae6:	83 ec 04             	sub    $0x4,%esp
     ae9:	6a 01                	push   $0x1
     aeb:	51                   	push   %ecx
     aec:	ff 75 a4             	pushl  -0x5c(%ebp)
     aef:	e8 0e 13 00 00       	call   1e02 <write>
      wait_forever();
     af4:	e8 47 fd ff ff       	call   840 <wait_forever>
          place_three = size - 2;
     af9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     afc:	8d 71 fe             	lea    -0x2(%ecx),%esi
     aff:	eb c5                	jmp    ac6 <test_copy_on_write_main_child+0x256>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     b01:	8b 7d 90             	mov    -0x70(%ebp),%edi
     b04:	83 c3 42             	add    $0x42,%ebx
     b07:	0f be 37             	movsbl (%edi),%esi
     b0a:	39 de                	cmp    %ebx,%esi
     b0c:	75 d8                	jne    ae6 <test_copy_on_write_main_child+0x276>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     b0e:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
     b11:	80 3c 11 41          	cmpb   $0x41,(%ecx,%edx,1)
     b15:	75 09                	jne    b20 <test_copy_on_write_main_child+0x2b0>
     b17:	a8 01                	test   $0x1,%al
     b19:	b9 30 23 00 00       	mov    $0x2330,%ecx
     b1e:	74 c6                	je     ae6 <test_copy_on_write_main_child+0x276>
     b20:	b9 2e 23 00 00       	mov    $0x232e,%ecx
     b25:	eb bf                	jmp    ae6 <test_copy_on_write_main_child+0x276>
     b27:	89 f6                	mov    %esi,%esi
     b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b30 <test_copy_on_write_main_child_alt>:
void test_copy_on_write_main_child_alt(int result_fd, int size, const char *describe_size, int forks, int early_term) {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	81 ec f8 00 00 00    	sub    $0xf8,%esp
  char *old_end_of_heap = sbrk(size);
     b3c:	ff 75 0c             	pushl  0xc(%ebp)
     b3f:	e8 26 13 00 00       	call   1e6a <sbrk>
     b44:	89 c6                	mov    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     b46:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b4d:	e8 18 13 00 00       	call   1e6a <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b52:	83 c4 10             	add    $0x10,%esp
     b55:	39 c6                	cmp    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     b57:	89 85 10 ff ff ff    	mov    %eax,-0xf0(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b5d:	73 13                	jae    b72 <test_copy_on_write_main_child_alt+0x42>
     b5f:	89 c2                	mov    %eax,%edx
     b61:	89 f0                	mov    %esi,%eax
     b63:	90                   	nop
     b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *p = 'A';
     b68:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b6b:	83 c0 01             	add    $0x1,%eax
     b6e:	39 c2                	cmp    %eax,%edx
     b70:	75 f6                	jne    b68 <test_copy_on_write_main_child_alt+0x38>
  int children[MAX_CHILDREN] = {0};
     b72:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     b74:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     b78:	8d 9d 28 ff ff ff    	lea    -0xd8(%ebp),%ebx
     b7e:	b9 10 00 00 00       	mov    $0x10,%ecx
     b83:	89 df                	mov    %ebx,%edi
     b85:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     b87:	0f 8f db 01 00 00    	jg     d68 <test_copy_on_write_main_child_alt+0x238>
  for (int i = 0; i < forks; ++i) {
     b8d:	8b 45 14             	mov    0x14(%ebp),%eax
     b90:	85 c0                	test   %eax,%eax
     b92:	0f 8e 07 04 00 00    	jle    f9f <test_copy_on_write_main_child_alt+0x46f>
     b98:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b9e:	31 ff                	xor    %edi,%edi
     ba0:	8b 75 14             	mov    0x14(%ebp),%esi
     ba3:	eb 25                	jmp    bca <test_copy_on_write_main_child_alt+0x9a>
     ba5:	8d 76 00             	lea    0x0(%esi),%esi
    children[i] = fork();
     ba8:	e8 2d 12 00 00       	call   1dda <fork>
    if (children[i] == -1) {
     bad:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     bb0:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
    if (children[i] == -1) {
     bb3:	74 54                	je     c09 <test_copy_on_write_main_child_alt+0xd9>
    } else if (children[i] == 0) {
     bb5:	85 c0                	test   %eax,%eax
     bb7:	8d 4f 01             	lea    0x1(%edi),%ecx
     bba:	0f 84 c0 01 00 00    	je     d80 <test_copy_on_write_main_child_alt+0x250>
  for (int i = 0; i < forks; ++i) {
     bc0:	39 ce                	cmp    %ecx,%esi
     bc2:	89 cf                	mov    %ecx,%edi
     bc4:	0f 84 26 03 00 00    	je     ef0 <test_copy_on_write_main_child_alt+0x3c0>
    sleep(1);
     bca:	83 ec 0c             	sub    $0xc,%esp
     bcd:	6a 01                	push   $0x1
     bcf:	e8 9e 12 00 00       	call   1e72 <sleep>
    if (pipe(child_fds[i]) < 0) {
     bd4:	8d 84 fd 68 ff ff ff 	lea    -0x98(%ebp,%edi,8),%eax
     bdb:	89 04 24             	mov    %eax,(%esp)
     bde:	e8 0f 12 00 00       	call   1df2 <pipe>
     be3:	83 c4 10             	add    $0x10,%esp
     be6:	85 c0                	test   %eax,%eax
     be8:	79 be                	jns    ba8 <test_copy_on_write_main_child_alt+0x78>
        printf(2, "pipe failed!\n");
     bea:	83 ec 08             	sub    $0x8,%esp
     bed:	68 32 23 00 00       	push   $0x2332
     bf2:	6a 02                	push   $0x2
     bf4:	e8 67 13 00 00       	call   1f60 <printf>
     bf9:	83 c4 10             	add    $0x10,%esp
    children[i] = fork();
     bfc:	e8 d9 11 00 00       	call   1dda <fork>
    if (children[i] == -1) {
     c01:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     c04:	89 04 bb             	mov    %eax,(%ebx,%edi,4)
    if (children[i] == -1) {
     c07:	75 ac                	jne    bb5 <test_copy_on_write_main_child_alt+0x85>
      close(child_fds[i][1]);
     c09:	83 ec 0c             	sub    $0xc,%esp
     c0c:	ff b4 fd 6c ff ff ff 	pushl  -0x94(%ebp,%edi,8)
     c13:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
     c19:	e8 ec 11 00 00       	call   1e0a <close>
      printf(2, "fork failed\n");
     c1e:	59                   	pop    %ecx
     c1f:	5f                   	pop    %edi
     c20:	68 40 23 00 00       	push   $0x2340
     c25:	6a 02                	push   $0x2
      failed_code = 'f';
     c27:	bf 66 00 00 00       	mov    $0x66,%edi
      printf(2, "fork failed\n");
     c2c:	e8 2f 13 00 00       	call   1f60 <printf>
      break;
     c31:	83 c4 10             	add    $0x10,%esp
      failed = 1;
     c34:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     c3b:	00 00 00 
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     c3e:	31 d2                	xor    %edx,%edx
     c40:	89 b5 0c ff ff ff    	mov    %esi,-0xf4(%ebp)
     c46:	89 d6                	mov    %edx,%esi
     c48:	eb 3c                	jmp    c86 <test_copy_on_write_main_child_alt+0x156>
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        failed_code = 'c';
     c50:	3c 2b                	cmp    $0x2b,%al
     c52:	b8 01 00 00 00       	mov    $0x1,%eax
     c57:	0f 44 85 14 ff ff ff 	cmove  -0xec(%ebp),%eax
     c5e:	ba 63 00 00 00       	mov    $0x63,%edx
     c63:	0f 45 fa             	cmovne %edx,%edi
     c66:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
      close(child_fds[i][0]);
     c6c:	83 ec 0c             	sub    $0xc,%esp
     c6f:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     c76:	e8 8f 11 00 00       	call   1e0a <close>
     c7b:	83 c4 10             	add    $0x10,%esp
  for (int i = 0; i < forks; ++i) {
     c7e:	83 c6 01             	add    $0x1,%esi
     c81:	39 75 14             	cmp    %esi,0x14(%ebp)
     c84:	74 4a                	je     cd0 <test_copy_on_write_main_child_alt+0x1a0>
    if (children[i] != -1) {
     c86:	83 3c b3 ff          	cmpl   $0xffffffff,(%ebx,%esi,4)
     c8a:	74 f2                	je     c7e <test_copy_on_write_main_child_alt+0x14e>
      read(child_fds[i][0], buffer, 1);
     c8c:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     c92:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     c95:	c6 85 26 ff ff ff 58 	movb   $0x58,-0xda(%ebp)
      read(child_fds[i][0], buffer, 1);
     c9c:	6a 01                	push   $0x1
     c9e:	50                   	push   %eax
     c9f:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     ca6:	e8 4f 11 00 00       	call   1dfa <read>
      if (buffer[0] == 'X') {
     cab:	0f b6 85 26 ff ff ff 	movzbl -0xda(%ebp),%eax
     cb2:	83 c4 10             	add    $0x10,%esp
     cb5:	3c 58                	cmp    $0x58,%al
     cb7:	75 97                	jne    c50 <test_copy_on_write_main_child_alt+0x120>
        failed_code = 'P';
     cb9:	bf 50 00 00 00       	mov    $0x50,%edi
        failed = 1;
     cbe:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     cc5:	00 00 00 
     cc8:	eb a2                	jmp    c6c <test_copy_on_write_main_child_alt+0x13c>
     cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cd0:	8b 45 14             	mov    0x14(%ebp),%eax
     cd3:	89 de                	mov    %ebx,%esi
     cd5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     cd8:	89 c3                	mov    %eax,%ebx
     cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    kill(children[i]);
     ce0:	83 ec 0c             	sub    $0xc,%esp
     ce3:	ff 36                	pushl  (%esi)
     ce5:	83 c6 04             	add    $0x4,%esi
     ce8:	e8 25 11 00 00       	call   1e12 <kill>
    wait();
     ced:	e8 f8 10 00 00       	call   1dea <wait>
  for (int i = 0; i < forks; ++i) {
     cf2:	83 c4 10             	add    $0x10,%esp
     cf5:	39 f3                	cmp    %esi,%ebx
     cf7:	75 e7                	jne    ce0 <test_copy_on_write_main_child_alt+0x1b0>
     cf9:	8b b5 0c ff ff ff    	mov    -0xf4(%ebp),%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     cff:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
     d05:	73 2f                	jae    d36 <test_copy_on_write_main_child_alt+0x206>
      failed_code = 'p';
     d07:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     d0d:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
     d13:	ba 70 00 00 00       	mov    $0x70,%edx
     d18:	b8 01 00 00 00       	mov    $0x1,%eax
     d1d:	8d 76 00             	lea    0x0(%esi),%esi
     d20:	80 3e 41             	cmpb   $0x41,(%esi)
     d23:	0f 45 fa             	cmovne %edx,%edi
     d26:	0f 45 c8             	cmovne %eax,%ecx
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d29:	83 c6 01             	add    $0x1,%esi
     d2c:	39 f3                	cmp    %esi,%ebx
     d2e:	75 f0                	jne    d20 <test_copy_on_write_main_child_alt+0x1f0>
     d30:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  if (failed) {
     d36:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     d3c:	85 c0                	test   %eax,%eax
     d3e:	0f 85 74 01 00 00    	jne    eb8 <test_copy_on_write_main_child_alt+0x388>
    write(result_fd, "YY", 2);
     d44:	83 ec 04             	sub    $0x4,%esp
     d47:	6a 02                	push   $0x2
     d49:	68 0c 23 00 00       	push   $0x230c
     d4e:	ff 75 08             	pushl  0x8(%ebp)
     d51:	e8 ac 10 00 00       	call   1e02 <write>
     d56:	83 c4 10             	add    $0x10,%esp
}
     d59:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d5c:	5b                   	pop    %ebx
     d5d:	5e                   	pop    %esi
     d5e:	5f                   	pop    %edi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    
     d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     d68:	83 ec 08             	sub    $0x8,%esp
     d6b:	68 0c 26 00 00       	push   $0x260c
     d70:	6a 02                	push   $0x2
     d72:	e8 e9 11 00 00       	call   1f60 <printf>
     d77:	83 c4 10             	add    $0x10,%esp
     d7a:	e9 19 fe ff ff       	jmp    b98 <test_copy_on_write_main_child_alt+0x68>
     d7f:	90                   	nop
      close(child_fds[i][0]);
     d80:	83 ec 0c             	sub    $0xc,%esp
     d83:	ff b4 fd 68 ff ff ff 	pushl  -0x98(%ebp,%edi,8)
     d8a:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
     d90:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
     d96:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
     d9c:	e8 69 10 00 00       	call   1e0a <close>
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     da1:	83 c4 10             	add    $0x10,%esp
     da4:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
     daa:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     db0:	8b 95 0c ff ff ff    	mov    -0xf4(%ebp),%edx
     db6:	73 23                	jae    ddb <test_copy_on_write_main_child_alt+0x2ab>
          found_wrong_memory = 1;
     db8:	8b 8d 10 ff ff ff    	mov    -0xf0(%ebp),%ecx
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     dbe:	89 f0                	mov    %esi,%eax
          found_wrong_memory = 1;
     dc0:	bb 01 00 00 00       	mov    $0x1,%ebx
     dc5:	8d 76 00             	lea    0x0(%esi),%esi
     dc8:	80 38 41             	cmpb   $0x41,(%eax)
     dcb:	0f 45 d3             	cmovne %ebx,%edx
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     dce:	83 c0 01             	add    $0x1,%eax
     dd1:	39 c1                	cmp    %eax,%ecx
     dd3:	75 f3                	jne    dc8 <test_copy_on_write_main_child_alt+0x298>
     dd5:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
      int place_one = size / 2;
     ddb:	8b 45 0c             	mov    0xc(%ebp),%eax
     dde:	c1 e8 1f             	shr    $0x1f,%eax
     de1:	03 45 0c             	add    0xc(%ebp),%eax
     de4:	d1 f8                	sar    %eax
      old_end_of_heap[place_one] = 'B' + i;
     de6:	01 f0                	add    %esi,%eax
     de8:	89 c3                	mov    %eax,%ebx
     dea:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
     df0:	8d 47 42             	lea    0x42(%edi),%eax
     df3:	88 03                	mov    %al,(%ebx)
      int place_two = 4096 * i;
     df5:	89 f8                	mov    %edi,%eax
     df7:	c1 e0 0c             	shl    $0xc,%eax
     dfa:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
          place_two = size - 1;
     e00:	8b 45 0c             	mov    0xc(%ebp),%eax
     e03:	8d 58 ff             	lea    -0x1(%eax),%ebx
     e06:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     e0c:	39 45 0c             	cmp    %eax,0xc(%ebp)
     e0f:	0f 4f d8             	cmovg  %eax,%ebx
      old_end_of_heap[place_two] = 'C' + i;
     e12:	01 f3                	add    %esi,%ebx
     e14:	89 d8                	mov    %ebx,%eax
     e16:	89 9d 08 ff ff ff    	mov    %ebx,-0xf8(%ebp)
     e1c:	8d 5f 43             	lea    0x43(%edi),%ebx
     e1f:	88 18                	mov    %bl,(%eax)
      int place_three = 4096 * (i - 1);
     e21:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     e27:	2d 00 10 00 00       	sub    $0x1000,%eax
      if (place_three >= size || place_three < 0) {
     e2c:	39 45 0c             	cmp    %eax,0xc(%ebp)
     e2f:	0f 8e e3 00 00 00    	jle    f18 <test_copy_on_write_main_child_alt+0x3e8>
     e35:	85 c0                	test   %eax,%eax
     e37:	0f 88 db 00 00 00    	js     f18 <test_copy_on_write_main_child_alt+0x3e8>
      int place_four = 4096 * (i + 1);
     e3d:	c1 e1 0c             	shl    $0xc,%ecx
     e40:	89 cb                	mov    %ecx,%ebx
          place_four = size - 3;
     e42:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     e45:	83 e9 03             	sub    $0x3,%ecx
     e48:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
     e4b:	0f 4e d9             	cmovle %ecx,%ebx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     e4e:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
     e51:	80 39 41             	cmpb   $0x41,(%ecx)
     e54:	0f 84 16 01 00 00    	je     f70 <test_copy_on_write_main_child_alt+0x440>
          found_wrong_memory = 1;
     e5a:	ba 01 00 00 00       	mov    $0x1,%edx
      sleep(5);
     e5f:	83 ec 0c             	sub    $0xc,%esp
     e62:	89 95 10 ff ff ff    	mov    %edx,-0xf0(%ebp)
     e68:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
     e6e:	6a 05                	push   $0x5
     e70:	e8 fd 0f 00 00       	call   1e72 <sleep>
      if (old_end_of_heap[place_three] != 'A' || 
     e75:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     e7b:	83 c4 10             	add    $0x10,%esp
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     e7e:	b8 2e 23 00 00       	mov    $0x232e,%eax
      if (old_end_of_heap[place_three] != 'A' || 
     e83:	8b 95 10 ff ff ff    	mov    -0xf0(%ebp),%edx
     e89:	80 39 41             	cmpb   $0x41,(%ecx)
     e8c:	0f 84 96 00 00 00    	je     f28 <test_copy_on_write_main_child_alt+0x3f8>
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     e92:	83 ec 04             	sub    $0x4,%esp
     e95:	6a 01                	push   $0x1
     e97:	50                   	push   %eax
     e98:	ff b4 fd 6c ff ff ff 	pushl  -0x94(%ebp,%edi,8)
     e9f:	e8 5e 0f 00 00       	call   1e02 <write>
      if (early_term) {
     ea4:	8b 55 18             	mov    0x18(%ebp),%edx
     ea7:	83 c4 10             	add    $0x10,%esp
     eaa:	85 d2                	test   %edx,%edx
     eac:	74 62                	je     f10 <test_copy_on_write_main_child_alt+0x3e0>
          exit();
     eae:	e8 2f 0f 00 00       	call   1de2 <exit>
     eb3:	90                   	nop
     eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    buffer[1] = failed_code;
     eb8:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     eba:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     ebd:	c6 85 26 ff ff ff 4e 	movb   $0x4e,-0xda(%ebp)
    buffer[1] = failed_code;
     ec4:	88 85 27 ff ff ff    	mov    %al,-0xd9(%ebp)
    write(result_fd, buffer, 2);
     eca:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     ed0:	6a 02                	push   $0x2
     ed2:	50                   	push   %eax
     ed3:	ff 75 08             	pushl  0x8(%ebp)
     ed6:	e8 27 0f 00 00       	call   1e02 <write>
     edb:	83 c4 10             	add    $0x10,%esp
}
     ede:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ee1:	5b                   	pop    %ebx
     ee2:	5e                   	pop    %esi
     ee3:	5f                   	pop    %edi
     ee4:	5d                   	pop    %ebp
     ee5:	c3                   	ret    
     ee6:	8d 76 00             	lea    0x0(%esi),%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     ef0:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
  char failed_code = ' ';
     ef6:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     efb:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     f02:	00 00 00 
     f05:	e9 34 fd ff ff       	jmp    c3e <test_copy_on_write_main_child_alt+0x10e>
     f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          wait_forever();
     f10:	e8 2b f9 ff ff       	call   840 <wait_forever>
     f15:	8d 76 00             	lea    0x0(%esi),%esi
          place_three = size - 2;
     f18:	8b 45 0c             	mov    0xc(%ebp),%eax
     f1b:	83 e8 02             	sub    $0x2,%eax
     f1e:	e9 1a ff ff ff       	jmp    e3d <test_copy_on_write_main_child_alt+0x30d>
     f23:	90                   	nop
     f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (old_end_of_heap[place_three] != 'A' || 
     f28:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     f2c:	0f 85 60 ff ff ff    	jne    e92 <test_copy_on_write_main_child_alt+0x362>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     f32:	8b 8d 08 ff ff ff    	mov    -0xf8(%ebp),%ecx
     f38:	0f be 19             	movsbl (%ecx),%ebx
     f3b:	8d 4f 43             	lea    0x43(%edi),%ecx
          old_end_of_heap[place_four] != 'A' ||
     f3e:	39 cb                	cmp    %ecx,%ebx
     f40:	0f 85 4c ff ff ff    	jne    e92 <test_copy_on_write_main_child_alt+0x362>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     f46:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
     f4c:	0f be 08             	movsbl (%eax),%ecx
     f4f:	8d 47 42             	lea    0x42(%edi),%eax
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     f52:	39 c1                	cmp    %eax,%ecx
     f54:	75 0e                	jne    f64 <test_copy_on_write_main_child_alt+0x434>
     f56:	83 e2 01             	and    $0x1,%edx
     f59:	b8 30 23 00 00       	mov    $0x2330,%eax
     f5e:	0f 84 2e ff ff ff    	je     e92 <test_copy_on_write_main_child_alt+0x362>
     f64:	b8 2e 23 00 00       	mov    $0x232e,%eax
     f69:	e9 24 ff ff ff       	jmp    e92 <test_copy_on_write_main_child_alt+0x362>
     f6e:	66 90                	xchg   %ax,%ax
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     f70:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
     f76:	0f be 00             	movsbl (%eax),%eax
     f79:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
     f7f:	8d 47 42             	lea    0x42(%edi),%eax
     f82:	39 85 14 ff ff ff    	cmp    %eax,-0xec(%ebp)
     f88:	0f 85 cc fe ff ff    	jne    e5a <test_copy_on_write_main_child_alt+0x32a>
          found_wrong_memory = 1;
     f8e:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     f92:	b8 01 00 00 00       	mov    $0x1,%eax
     f97:	0f 45 d0             	cmovne %eax,%edx
     f9a:	e9 c0 fe ff ff       	jmp    e5f <test_copy_on_write_main_child_alt+0x32f>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     f9f:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
  char failed_code = ' ';
     fa5:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     faa:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     fb1:	00 00 00 
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     fb4:	0f 82 4d fd ff ff    	jb     d07 <test_copy_on_write_main_child_alt+0x1d7>
     fba:	e9 85 fd ff ff       	jmp    d44 <test_copy_on_write_main_child_alt+0x214>
     fbf:	90                   	nop

00000fc0 <test_copy_on_write_less_forks>:
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	56                   	push   %esi
     fc4:	53                   	push   %ebx
  pipe(fds);
     fc5:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     fc8:	83 ec 1c             	sub    $0x1c,%esp
     fcb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     fce:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
     fd1:	50                   	push   %eax
     fd2:	e8 1b 0e 00 00       	call   1df2 <pipe>
  test_copy_on_write_main_child(fds[1], size, describe_size, forks);
     fd7:	56                   	push   %esi
     fd8:	53                   	push   %ebx
     fd9:	ff 75 08             	pushl  0x8(%ebp)
     fdc:	ff 75 f4             	pushl  -0xc(%ebp)
     fdf:	e8 8c f8 ff ff       	call   870 <test_copy_on_write_main_child>
  char text[2] = {'X', 'X'};
     fe4:	b8 58 58 00 00       	mov    $0x5858,%eax
  read(fds[0], text, 2);
     fe9:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
     fec:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  read(fds[0], text, 2);
     ff0:	8d 45 ee             	lea    -0x12(%ebp),%eax
     ff3:	6a 02                	push   $0x2
     ff5:	50                   	push   %eax
     ff6:	ff 75 f0             	pushl  -0x10(%ebp)
     ff9:	e8 fc 0d 00 00       	call   1dfa <read>
  close(fds[0]); close(fds[1]);
     ffe:	5a                   	pop    %edx
     fff:	ff 75 f0             	pushl  -0x10(%ebp)
    1002:	e8 03 0e 00 00       	call   1e0a <close>
    1007:	59                   	pop    %ecx
    1008:	ff 75 f4             	pushl  -0xc(%ebp)
    100b:	e8 fa 0d 00 00       	call   1e0a <close>
  if (text[0] == 'X') {
    1010:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1014:	83 c4 10             	add    $0x10,%esp
    1017:	3c 58                	cmp    $0x58,%al
    1019:	74 75                	je     1090 <test_copy_on_write_less_forks+0xd0>
  } else if (text[0] == 'N') {
    101b:	3c 4e                	cmp    $0x4e,%al
    101d:	75 39                	jne    1058 <test_copy_on_write_less_forks+0x98>
    switch (text[1]) {
    101f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1023:	3c 63                	cmp    $0x63,%al
    1025:	0f 84 a5 00 00 00    	je     10d0 <test_copy_on_write_less_forks+0x110>
    102b:	0f 8e 7f 00 00 00    	jle    10b0 <test_copy_on_write_less_forks+0xf0>
    1031:	3c 66                	cmp    $0x66,%al
    1033:	74 43                	je     1078 <test_copy_on_write_less_forks+0xb8>
    1035:	3c 70                	cmp    $0x70,%al
    1037:	0f 85 b3 00 00 00    	jne    10f0 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    103d:	83 ec 08             	sub    $0x8,%esp
    1040:	68 ac 26 00 00       	push   $0x26ac
    1045:	6a 01                	push   $0x1
    1047:	e8 14 0f 00 00       	call   1f60 <printf>
      break;
    104c:	83 c4 10             	add    $0x10,%esp
    return 0;
    104f:	31 c0                	xor    %eax,%eax
      break;
    1051:	eb 1b                	jmp    106e <test_copy_on_write_less_forks+0xae>
    1053:	90                   	nop
    1054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
    1058:	56                   	push   %esi
    1059:	53                   	push   %ebx
    105a:	68 b8 27 00 00       	push   $0x27b8
    105f:	6a 01                	push   $0x1
    1061:	e8 fa 0e 00 00       	call   1f60 <printf>
    return 1;
    1066:	83 c4 10             	add    $0x10,%esp
    1069:	b8 01 00 00 00       	mov    $0x1,%eax
}
    106e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1071:	5b                   	pop    %ebx
    1072:	5e                   	pop    %esi
    1073:	5d                   	pop    %ebp
    1074:	c3                   	ret    
    1075:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1078:	83 ec 08             	sub    $0x8,%esp
    107b:	68 74 26 00 00       	push   $0x2674
    1080:	6a 01                	push   $0x1
    1082:	e8 d9 0e 00 00       	call   1f60 <printf>
      break;
    1087:	83 c4 10             	add    $0x10,%esp
    return 0;
    108a:	31 c0                	xor    %eax,%eax
      break;
    108c:	eb e0                	jmp    106e <test_copy_on_write_less_forks+0xae>
    108e:	66 90                	xchg   %ax,%ax
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1090:	83 ec 08             	sub    $0x8,%esp
    1093:	68 44 26 00 00       	push   $0x2644
    1098:	6a 01                	push   $0x1
    109a:	e8 c1 0e 00 00       	call   1f60 <printf>
    return 0;
    109f:	83 c4 10             	add    $0x10,%esp
}
    10a2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    10a5:	31 c0                	xor    %eax,%eax
}
    10a7:	5b                   	pop    %ebx
    10a8:	5e                   	pop    %esi
    10a9:	5d                   	pop    %ebp
    10aa:	c3                   	ret    
    10ab:	90                   	nop
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch (text[1]) {
    10b0:	3c 50                	cmp    $0x50,%al
    10b2:	75 3c                	jne    10f0 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- pipe read problem\n");
    10b4:	83 ec 08             	sub    $0x8,%esp
    10b7:	68 f8 26 00 00       	push   $0x26f8
    10bc:	6a 01                	push   $0x1
    10be:	e8 9d 0e 00 00       	call   1f60 <printf>
      break;
    10c3:	83 c4 10             	add    $0x10,%esp
    return 0;
    10c6:	31 c0                	xor    %eax,%eax
      break;
    10c8:	eb a4                	jmp    106e <test_copy_on_write_less_forks+0xae>
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    10d0:	83 ec 08             	sub    $0x8,%esp
    10d3:	68 34 27 00 00       	push   $0x2734
    10d8:	6a 01                	push   $0x1
    10da:	e8 81 0e 00 00       	call   1f60 <printf>
      break;
    10df:	83 c4 10             	add    $0x10,%esp
    return 0;
    10e2:	31 c0                	xor    %eax,%eax
      break;
    10e4:	eb 88                	jmp    106e <test_copy_on_write_less_forks+0xae>
    10e6:	8d 76 00             	lea    0x0(%esi),%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    10f0:	83 ec 08             	sub    $0x8,%esp
    10f3:	68 80 27 00 00       	push   $0x2780
    10f8:	6a 01                	push   $0x1
    10fa:	e8 61 0e 00 00       	call   1f60 <printf>
      break;
    10ff:	83 c4 10             	add    $0x10,%esp
    return 0;
    1102:	31 c0                	xor    %eax,%eax
      break;
    1104:	e9 65 ff ff ff       	jmp    106e <test_copy_on_write_less_forks+0xae>
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001110 <test_copy_on_write_less_forks_alt>:
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	56                   	push   %esi
    1114:	53                   	push   %ebx
  pipe(fds);
    1115:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1118:	83 ec 1c             	sub    $0x1c,%esp
    111b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    111e:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
    1121:	50                   	push   %eax
    1122:	e8 cb 0c 00 00       	call   1df2 <pipe>
  test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    1127:	58                   	pop    %eax
    1128:	ff 75 14             	pushl  0x14(%ebp)
    112b:	56                   	push   %esi
    112c:	53                   	push   %ebx
    112d:	ff 75 08             	pushl  0x8(%ebp)
    1130:	ff 75 f4             	pushl  -0xc(%ebp)
    1133:	e8 f8 f9 ff ff       	call   b30 <test_copy_on_write_main_child_alt>
  read(fds[0], text, 2);
    1138:	8d 45 ee             	lea    -0x12(%ebp),%eax
    113b:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
    113e:	ba 58 58 00 00       	mov    $0x5858,%edx
  read(fds[0], text, 2);
    1143:	6a 02                	push   $0x2
  char text[2] = {'X', 'X'};
    1145:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  read(fds[0], text, 2);
    1149:	50                   	push   %eax
    114a:	ff 75 f0             	pushl  -0x10(%ebp)
    114d:	e8 a8 0c 00 00       	call   1dfa <read>
  close(fds[0]); close(fds[1]);
    1152:	59                   	pop    %ecx
    1153:	ff 75 f0             	pushl  -0x10(%ebp)
    1156:	e8 af 0c 00 00       	call   1e0a <close>
    115b:	58                   	pop    %eax
    115c:	ff 75 f4             	pushl  -0xc(%ebp)
    115f:	e8 a6 0c 00 00       	call   1e0a <close>
  if (text[0] == 'X') {
    1164:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1168:	83 c4 10             	add    $0x10,%esp
    116b:	3c 58                	cmp    $0x58,%al
    116d:	0f 84 7d 00 00 00    	je     11f0 <test_copy_on_write_less_forks_alt+0xe0>
  } else if (text[0] == 'N') {
    1173:	3c 4e                	cmp    $0x4e,%al
    1175:	75 39                	jne    11b0 <test_copy_on_write_less_forks_alt+0xa0>
    switch (text[1]) {
    1177:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    117b:	3c 66                	cmp    $0x66,%al
    117d:	0f 84 ad 00 00 00    	je     1230 <test_copy_on_write_less_forks_alt+0x120>
    1183:	3c 70                	cmp    $0x70,%al
    1185:	0f 84 85 00 00 00    	je     1210 <test_copy_on_write_less_forks_alt+0x100>
    118b:	3c 63                	cmp    $0x63,%al
    118d:	74 41                	je     11d0 <test_copy_on_write_less_forks_alt+0xc0>
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    118f:	83 ec 08             	sub    $0x8,%esp
    1192:	68 80 27 00 00       	push   $0x2780
    1197:	6a 01                	push   $0x1
    1199:	e8 c2 0d 00 00       	call   1f60 <printf>
      break;
    119e:	83 c4 10             	add    $0x10,%esp
}
    11a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    11a4:	31 c0                	xor    %eax,%eax
}
    11a6:	5b                   	pop    %ebx
    11a7:	5e                   	pop    %esi
    11a8:	5d                   	pop    %ebp
    11a9:	c3                   	ret    
    11aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
    11b0:	56                   	push   %esi
    11b1:	53                   	push   %ebx
    11b2:	68 b8 27 00 00       	push   $0x27b8
    11b7:	6a 01                	push   $0x1
    11b9:	e8 a2 0d 00 00       	call   1f60 <printf>
    return 1;
    11be:	83 c4 10             	add    $0x10,%esp
}
    11c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 1;
    11c4:	b8 01 00 00 00       	mov    $0x1,%eax
}
    11c9:	5b                   	pop    %ebx
    11ca:	5e                   	pop    %esi
    11cb:	5d                   	pop    %ebp
    11cc:	c3                   	ret    
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    11d0:	83 ec 08             	sub    $0x8,%esp
    11d3:	68 34 27 00 00       	push   $0x2734
    11d8:	6a 01                	push   $0x1
    11da:	e8 81 0d 00 00       	call   1f60 <printf>
      break;
    11df:	83 c4 10             	add    $0x10,%esp
}
    11e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    11e5:	31 c0                	xor    %eax,%eax
}
    11e7:	5b                   	pop    %ebx
    11e8:	5e                   	pop    %esi
    11e9:	5d                   	pop    %ebp
    11ea:	c3                   	ret    
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    11f0:	83 ec 08             	sub    $0x8,%esp
    11f3:	68 44 26 00 00       	push   $0x2644
    11f8:	6a 01                	push   $0x1
    11fa:	e8 61 0d 00 00       	call   1f60 <printf>
    return 0;
    11ff:	83 c4 10             	add    $0x10,%esp
}
    1202:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1205:	31 c0                	xor    %eax,%eax
}
    1207:	5b                   	pop    %ebx
    1208:	5e                   	pop    %esi
    1209:	5d                   	pop    %ebp
    120a:	c3                   	ret    
    120b:	90                   	nop
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1210:	83 ec 08             	sub    $0x8,%esp
    1213:	68 ac 26 00 00       	push   $0x26ac
    1218:	6a 01                	push   $0x1
    121a:	e8 41 0d 00 00       	call   1f60 <printf>
      break;
    121f:	83 c4 10             	add    $0x10,%esp
}
    1222:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1225:	31 c0                	xor    %eax,%eax
}
    1227:	5b                   	pop    %ebx
    1228:	5e                   	pop    %esi
    1229:	5d                   	pop    %ebp
    122a:	c3                   	ret    
    122b:	90                   	nop
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1230:	83 ec 08             	sub    $0x8,%esp
    1233:	68 74 26 00 00       	push   $0x2674
    1238:	6a 01                	push   $0x1
    123a:	e8 21 0d 00 00       	call   1f60 <printf>
      break;
    123f:	83 c4 10             	add    $0x10,%esp
}
    1242:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1245:	31 c0                	xor    %eax,%eax
}
    1247:	5b                   	pop    %ebx
    1248:	5e                   	pop    %esi
    1249:	5d                   	pop    %ebp
    124a:	c3                   	ret    
    124b:	90                   	nop
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001250 <_test_copy_on_write>:
int _test_copy_on_write(int size,  const char *describe_size, int forks, int use_alt, int early_term, int pre_alloc, const char* describe_prealloc) {
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	83 ec 44             	sub    $0x44,%esp
  pipe(fds);
    1256:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1259:	50                   	push   %eax
    125a:	e8 93 0b 00 00       	call   1df2 <pipe>
  int pid = fork();
    125f:	e8 76 0b 00 00       	call   1dda <fork>
  if (pid == 0) {
    1264:	83 c4 10             	add    $0x10,%esp
    1267:	83 f8 00             	cmp    $0x0,%eax
    126a:	0f 84 d6 01 00 00    	je     1446 <_test_copy_on_write+0x1f6>
  } else if (pid > 0) {
    1270:	7f 16                	jg     1288 <_test_copy_on_write+0x38>
    1272:	89 c2                	mov    %eax,%edx
  return 0;
    1274:	31 c0                	xor    %eax,%eax
  } else if (pid == -1) {
    1276:	83 fa ff             	cmp    $0xffffffff,%edx
    1279:	0f 84 11 01 00 00    	je     1390 <_test_copy_on_write+0x140>
}
    127f:	c9                   	leave  
    1280:	c3                   	ret    
    1281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "running copy on write test: ");
    1288:	83 ec 08             	sub    $0x8,%esp
    128b:	68 4d 23 00 00       	push   $0x234d
    1290:	6a 01                	push   $0x1
    1292:	e8 c9 0c 00 00       	call   1f60 <printf>
    if (pre_alloc > 0) {
    1297:	8b 45 1c             	mov    0x1c(%ebp),%eax
    129a:	83 c4 10             	add    $0x10,%esp
    129d:	85 c0                	test   %eax,%eax
    129f:	7e 15                	jle    12b6 <_test_copy_on_write+0x66>
      printf(1, "allocate but do not use %s; ", describe_prealloc);
    12a1:	83 ec 04             	sub    $0x4,%esp
    12a4:	ff 75 20             	pushl  0x20(%ebp)
    12a7:	68 6a 23 00 00       	push   $0x236a
    12ac:	6a 01                	push   $0x1
    12ae:	e8 ad 0c 00 00       	call   1f60 <printf>
    12b3:	83 c4 10             	add    $0x10,%esp
    printf(1, "allocate and use %s; fork %d children; read+write small parts in each child",
    12b6:	ff 75 10             	pushl  0x10(%ebp)
    12b9:	ff 75 0c             	pushl  0xc(%ebp)
    12bc:	68 28 28 00 00       	push   $0x2828
    12c1:	6a 01                	push   $0x1
    12c3:	e8 98 0c 00 00       	call   1f60 <printf>
    if (use_alt) {
    12c8:	8b 45 14             	mov    0x14(%ebp),%eax
    12cb:	83 c4 10             	add    $0x10,%esp
    12ce:	85 c0                	test   %eax,%eax
    12d0:	0f 85 da 00 00 00    	jne    13b0 <_test_copy_on_write+0x160>
    printf(1, "\n");
    12d6:	83 ec 08             	sub    $0x8,%esp
    12d9:	68 3e 23 00 00       	push   $0x233e
    12de:	6a 01                	push   $0x1
    12e0:	e8 7b 0c 00 00       	call   1f60 <printf>
    close(fds[1]);
    12e5:	5a                   	pop    %edx
    12e6:	ff 75 e8             	pushl  -0x18(%ebp)
    char text[10] = {'X', 'X'};
    12e9:	b8 58 58 00 00       	mov    $0x5858,%eax
    12ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    12f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12fc:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    close(fds[1]);
    1300:	e8 05 0b 00 00       	call   1e0a <close>
    read(fds[0], text, 10);
    1305:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1308:	83 c4 0c             	add    $0xc,%esp
    130b:	6a 0a                	push   $0xa
    130d:	50                   	push   %eax
    130e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1311:	e8 e4 0a 00 00       	call   1dfa <read>
    wait();
    1316:	e8 cf 0a 00 00       	call   1dea <wait>
    close(fds[0]);
    131b:	59                   	pop    %ecx
    131c:	ff 75 e4             	pushl  -0x1c(%ebp)
    131f:	e8 e6 0a 00 00       	call   1e0a <close>
    if (text[0] == 'X') {
    1324:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1328:	83 c4 10             	add    $0x10,%esp
    132b:	3c 58                	cmp    $0x58,%al
    132d:	0f 84 9d 00 00 00    	je     13d0 <_test_copy_on_write+0x180>
    } else if (text[0] == 'N') {
    1333:	3c 4e                	cmp    $0x4e,%al
    1335:	75 39                	jne    1370 <_test_copy_on_write+0x120>
      switch (text[1]) {
    1337:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    133b:	3c 66                	cmp    $0x66,%al
    133d:	0f 84 ad 00 00 00    	je     13f0 <_test_copy_on_write+0x1a0>
    1343:	3c 70                	cmp    $0x70,%al
    1345:	0f 84 e5 00 00 00    	je     1430 <_test_copy_on_write+0x1e0>
    134b:	3c 63                	cmp    $0x63,%al
    134d:	0f 84 bd 00 00 00    	je     1410 <_test_copy_on_write+0x1c0>
        printf(1, FAIL_MSG "copy on write test failed --- unknown reason\n");
    1353:	83 ec 08             	sub    $0x8,%esp
    1356:	68 80 27 00 00       	push   $0x2780
    135b:	6a 01                	push   $0x1
    135d:	e8 fe 0b 00 00       	call   1f60 <printf>
        break;
    1362:	83 c4 10             	add    $0x10,%esp
      return 0;
    1365:	31 c0                	xor    %eax,%eax
}
    1367:	c9                   	leave  
    1368:	c3                   	ret    
    1369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, PASS_MSG "copy on write test passed\n");
    1370:	83 ec 08             	sub    $0x8,%esp
    1373:	68 a4 28 00 00       	push   $0x28a4
    1378:	6a 01                	push   $0x1
    137a:	e8 e1 0b 00 00       	call   1f60 <printf>
      return 1;
    137f:	83 c4 10             	add    $0x10,%esp
    1382:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1387:	c9                   	leave  
    1388:	c3                   	ret    
    1389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
    1390:	83 ec 08             	sub    $0x8,%esp
    1393:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1396:	68 cc 28 00 00       	push   $0x28cc
    139b:	6a 01                	push   $0x1
    139d:	e8 be 0b 00 00       	call   1f60 <printf>
    13a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    13a5:	83 c4 10             	add    $0x10,%esp
}
    13a8:	c9                   	leave  
    13a9:	c3                   	ret    
    13aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, " [and try to keep children running in parallel]");
    13b0:	83 ec 08             	sub    $0x8,%esp
    13b3:	68 74 28 00 00       	push   $0x2874
    13b8:	6a 01                	push   $0x1
    13ba:	e8 a1 0b 00 00       	call   1f60 <printf>
    13bf:	83 c4 10             	add    $0x10,%esp
    13c2:	e9 0f ff ff ff       	jmp    12d6 <_test_copy_on_write+0x86>
    13c7:	89 f6                	mov    %esi,%esi
    13c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    13d0:	83 ec 08             	sub    $0x8,%esp
    13d3:	68 44 26 00 00       	push   $0x2644
    13d8:	6a 01                	push   $0x1
    13da:	e8 81 0b 00 00       	call   1f60 <printf>
      return 0;
    13df:	83 c4 10             	add    $0x10,%esp
    13e2:	31 c0                	xor    %eax,%eax
}
    13e4:	c9                   	leave  
    13e5:	c3                   	ret    
    13e6:	8d 76 00             	lea    0x0(%esi),%esi
    13e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    13f0:	83 ec 08             	sub    $0x8,%esp
    13f3:	68 74 26 00 00       	push   $0x2674
    13f8:	6a 01                	push   $0x1
    13fa:	e8 61 0b 00 00       	call   1f60 <printf>
        break;
    13ff:	83 c4 10             	add    $0x10,%esp
      return 0;
    1402:	31 c0                	xor    %eax,%eax
}
    1404:	c9                   	leave  
    1405:	c3                   	ret    
    1406:	8d 76 00             	lea    0x0(%esi),%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1410:	83 ec 08             	sub    $0x8,%esp
    1413:	68 34 27 00 00       	push   $0x2734
    1418:	6a 01                	push   $0x1
    141a:	e8 41 0b 00 00       	call   1f60 <printf>
        break;
    141f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1422:	31 c0                	xor    %eax,%eax
}
    1424:	c9                   	leave  
    1425:	c3                   	ret    
    1426:	8d 76 00             	lea    0x0(%esi),%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1430:	83 ec 08             	sub    $0x8,%esp
    1433:	68 ac 26 00 00       	push   $0x26ac
    1438:	6a 01                	push   $0x1
    143a:	e8 21 0b 00 00       	call   1f60 <printf>
        break;
    143f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1442:	31 c0                	xor    %eax,%eax
}
    1444:	c9                   	leave  
    1445:	c3                   	ret    
    if (pre_alloc > 0) {
    1446:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
    144a:	7e 0e                	jle    145a <_test_copy_on_write+0x20a>
      sbrk(pre_alloc);
    144c:	83 ec 0c             	sub    $0xc,%esp
    144f:	ff 75 1c             	pushl  0x1c(%ebp)
    1452:	e8 13 0a 00 00       	call   1e6a <sbrk>
    1457:	83 c4 10             	add    $0x10,%esp
    if (use_alt) {
    145a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    145e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1461:	74 1d                	je     1480 <_test_copy_on_write+0x230>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    1463:	83 ec 0c             	sub    $0xc,%esp
    1466:	ff 75 18             	pushl  0x18(%ebp)
    1469:	ff 75 10             	pushl  0x10(%ebp)
    146c:	ff 75 0c             	pushl  0xc(%ebp)
    146f:	ff 75 08             	pushl  0x8(%ebp)
    1472:	50                   	push   %eax
    1473:	e8 b8 f6 ff ff       	call   b30 <test_copy_on_write_main_child_alt>
    1478:	83 c4 20             	add    $0x20,%esp
    exit();
    147b:	e8 62 09 00 00       	call   1de2 <exit>
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    1480:	ff 75 10             	pushl  0x10(%ebp)
    1483:	ff 75 0c             	pushl  0xc(%ebp)
    1486:	ff 75 08             	pushl  0x8(%ebp)
    1489:	50                   	push   %eax
    148a:	e8 e1 f3 ff ff       	call   870 <test_copy_on_write_main_child>
    148f:	83 c4 10             	add    $0x10,%esp
    1492:	eb e7                	jmp    147b <_test_copy_on_write+0x22b>
    1494:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    149a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000014a0 <test_copy_on_write>:
int test_copy_on_write(int size, const char *describe_size, int forks) {
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
    14a6:	68 3f 23 00 00       	push   $0x233f
    14ab:	6a 00                	push   $0x0
    14ad:	6a 00                	push   $0x0
    14af:	6a 00                	push   $0x0
    14b1:	ff 75 10             	pushl  0x10(%ebp)
    14b4:	ff 75 0c             	pushl  0xc(%ebp)
    14b7:	ff 75 08             	pushl  0x8(%ebp)
    14ba:	e8 91 fd ff ff       	call   1250 <_test_copy_on_write>
}
    14bf:	c9                   	leave  
    14c0:	c3                   	ret    
    14c1:	eb 0d                	jmp    14d0 <test_copy_on_write_alloc_unused>
    14c3:	90                   	nop
    14c4:	90                   	nop
    14c5:	90                   	nop
    14c6:	90                   	nop
    14c7:	90                   	nop
    14c8:	90                   	nop
    14c9:	90                   	nop
    14ca:	90                   	nop
    14cb:	90                   	nop
    14cc:	90                   	nop
    14cd:	90                   	nop
    14ce:	90                   	nop
    14cf:	90                   	nop

000014d0 <test_copy_on_write_alloc_unused>:
int test_copy_on_write_alloc_unused(int unused_size, const char *describe_unused_size, int size, const char *describe_size, int forks) {
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
    14d6:	ff 75 0c             	pushl  0xc(%ebp)
    14d9:	ff 75 08             	pushl  0x8(%ebp)
    14dc:	6a 00                	push   $0x0
    14de:	6a 00                	push   $0x0
    14e0:	ff 75 18             	pushl  0x18(%ebp)
    14e3:	ff 75 14             	pushl  0x14(%ebp)
    14e6:	ff 75 10             	pushl  0x10(%ebp)
    14e9:	e8 62 fd ff ff       	call   1250 <_test_copy_on_write>
}
    14ee:	c9                   	leave  
    14ef:	c3                   	ret    

000014f0 <test_copy_on_write_alt>:
int test_copy_on_write_alt(int size, const char *describe_size, int forks) {
    14f0:	55                   	push   %ebp
    14f1:	89 e5                	mov    %esp,%ebp
    14f3:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
    14f6:	68 3f 23 00 00       	push   $0x233f
    14fb:	6a 00                	push   $0x0
    14fd:	6a 00                	push   $0x0
    14ff:	6a 01                	push   $0x1
    1501:	ff 75 10             	pushl  0x10(%ebp)
    1504:	ff 75 0c             	pushl  0xc(%ebp)
    1507:	ff 75 08             	pushl  0x8(%ebp)
    150a:	e8 41 fd ff ff       	call   1250 <_test_copy_on_write>
}
    150f:	c9                   	leave  
    1510:	c3                   	ret    
    1511:	eb 0d                	jmp    1520 <test_read_into_alloc_no_fork>
    1513:	90                   	nop
    1514:	90                   	nop
    1515:	90                   	nop
    1516:	90                   	nop
    1517:	90                   	nop
    1518:	90                   	nop
    1519:	90                   	nop
    151a:	90                   	nop
    151b:	90                   	nop
    151c:	90                   	nop
    151d:	90                   	nop
    151e:	90                   	nop
    151f:	90                   	nop

00001520 <test_read_into_alloc_no_fork>:
int test_read_into_alloc_no_fork(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	57                   	push   %edi
    1524:	56                   	push   %esi
    1525:	53                   	push   %ebx
    1526:	83 ec 28             	sub    $0x28,%esp
    1529:	8b 5d 10             	mov    0x10(%ebp),%ebx
    printf(1, "testing read(), writing %d bytes to a location %s into a %s allocation\n",
    152c:	ff 75 14             	pushl  0x14(%ebp)
    152f:	ff 75 18             	pushl  0x18(%ebp)
    1532:	53                   	push   %ebx
    1533:	68 08 29 00 00       	push   $0x2908
    1538:	6a 01                	push   $0x1
    153a:	e8 21 0a 00 00       	call   1f60 <printf>
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    153f:	83 c4 18             	add    $0x18,%esp
    1542:	68 01 02 00 00       	push   $0x201
    1547:	68 95 23 00 00       	push   $0x2395
    154c:	e8 d1 08 00 00       	call   1e22 <open>
    1551:	83 c4 10             	add    $0x10,%esp
    1554:	89 c6                	mov    %eax,%esi
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1556:	31 c0                	xor    %eax,%eax
    1558:	90                   	nop
    1559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    1560:	c6 80 80 33 00 00 58 	movb   $0x58,0x3380(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1567:	83 c0 01             	add    $0x1,%eax
    156a:	3d 80 00 00 00       	cmp    $0x80,%eax
    156f:	75 ef                	jne    1560 <test_read_into_alloc_no_fork+0x40>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1571:	85 db                	test   %ebx,%ebx
    1573:	0f 8e 8d 01 00 00    	jle    1706 <test_read_into_alloc_no_fork+0x1e6>
    1579:	31 ff                	xor    %edi,%edi
    157b:	90                   	nop
    157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        write(fd, buffer, sizeof buffer);
    1580:	83 ec 04             	sub    $0x4,%esp
    1583:	83 ef 80             	sub    $0xffffff80,%edi
    1586:	68 80 00 00 00       	push   $0x80
    158b:	68 80 33 00 00       	push   $0x3380
    1590:	56                   	push   %esi
    1591:	e8 6c 08 00 00       	call   1e02 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1596:	83 c4 10             	add    $0x10,%esp
    1599:	39 fb                	cmp    %edi,%ebx
    159b:	7f e3                	jg     1580 <test_read_into_alloc_no_fork+0x60>
    close(fd);
    159d:	83 ec 0c             	sub    $0xc,%esp
    15a0:	56                   	push   %esi
    15a1:	e8 64 08 00 00       	call   1e0a <close>
    fd = open("tempfile", O_RDONLY);
    15a6:	58                   	pop    %eax
    15a7:	5a                   	pop    %edx
    15a8:	6a 00                	push   $0x0
    15aa:	68 95 23 00 00       	push   $0x2395
    15af:	e8 6e 08 00 00       	call   1e22 <open>
    if (fd == -1) {
    15b4:	83 c4 10             	add    $0x10,%esp
    15b7:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    15ba:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    15bc:	0f 84 0a 01 00 00    	je     16cc <test_read_into_alloc_no_fork+0x1ac>
    char *heap = sbrk(0);
    15c2:	83 ec 0c             	sub    $0xc,%esp
    15c5:	6a 00                	push   $0x0
    15c7:	e8 9e 08 00 00       	call   1e6a <sbrk>
    sbrk(size);
    15cc:	59                   	pop    %ecx
    15cd:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    15d0:	89 c7                	mov    %eax,%edi
    sbrk(size);
    15d2:	e8 93 08 00 00       	call   1e6a <sbrk>
    char *loc = heap + offset;
    15d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    15da:	83 c4 0c             	add    $0xc,%esp
    15dd:	53                   	push   %ebx
    char *loc = heap + offset;
    15de:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    15e0:	51                   	push   %ecx
    15e1:	56                   	push   %esi
    15e2:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    15e5:	e8 10 08 00 00       	call   1dfa <read>
    failed_value = loc[-1] != '\0';
    15ea:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    int count = read(fd, loc, read_count);
    15ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    15f0:	31 d2                	xor    %edx,%edx
    15f2:	83 c4 10             	add    $0x10,%esp
            failed_value = 1;
    15f5:	bf 01 00 00 00       	mov    $0x1,%edi
    failed_value = loc[-1] != '\0';
    15fa:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    15fe:	0f 95 c2             	setne  %dl
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1601:	31 c0                	xor    %eax,%eax
    1603:	90                   	nop
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            failed_value = 1;
    1608:	80 3c 01 58          	cmpb   $0x58,(%ecx,%eax,1)
    160c:	0f 45 d7             	cmovne %edi,%edx
    for (int i = 0; i < read_count; ++i) {
    160f:	83 c0 01             	add    $0x1,%eax
    1612:	39 c3                	cmp    %eax,%ebx
    1614:	7f f2                	jg     1608 <test_read_into_alloc_no_fork+0xe8>
    1616:	8b 7d 08             	mov    0x8(%ebp),%edi
    1619:	89 55 e0             	mov    %edx,-0x20(%ebp)
    161c:	f7 df                	neg    %edi
    if (loc[read_count] != '\0') {
    161e:	80 3c 19 00          	cmpb   $0x0,(%ecx,%ebx,1)
    1622:	75 4b                	jne    166f <test_read_into_alloc_no_fork+0x14f>
    close(fd);
    1624:	83 ec 0c             	sub    $0xc,%esp
    1627:	56                   	push   %esi
    1628:	e8 dd 07 00 00       	call   1e0a <close>
    unlink("tempfile");
    162d:	c7 04 24 95 23 00 00 	movl   $0x2395,(%esp)
    1634:	e8 f9 07 00 00       	call   1e32 <unlink>
    sbrk(-size);
    1639:	89 3c 24             	mov    %edi,(%esp)
    163c:	e8 29 08 00 00       	call   1e6a <sbrk>
    if (count != read_count) {
    1641:	83 c4 10             	add    $0x10,%esp
    1644:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    1647:	8b 55 e0             	mov    -0x20(%ebp),%edx
    164a:	75 64                	jne    16b0 <test_read_into_alloc_no_fork+0x190>
    } else if (failed_value) {
    164c:	85 d2                	test   %edx,%edx
    164e:	75 44                	jne    1694 <test_read_into_alloc_no_fork+0x174>
        printf(1, PASS_MSG "\n");
    1650:	83 ec 08             	sub    $0x8,%esp
    1653:	68 00 23 00 00       	push   $0x2300
    1658:	6a 01                	push   $0x1
    165a:	e8 01 09 00 00       	call   1f60 <printf>
        return 1;
    165f:	83 c4 10             	add    $0x10,%esp
}
    1662:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 1;
    1665:	b8 01 00 00 00       	mov    $0x1,%eax
}
    166a:	5b                   	pop    %ebx
    166b:	5e                   	pop    %esi
    166c:	5f                   	pop    %edi
    166d:	5d                   	pop    %ebp
    166e:	c3                   	ret    
    close(fd);
    166f:	83 ec 0c             	sub    $0xc,%esp
    1672:	56                   	push   %esi
    1673:	e8 92 07 00 00       	call   1e0a <close>
    unlink("tempfile");
    1678:	c7 04 24 95 23 00 00 	movl   $0x2395,(%esp)
    167f:	e8 ae 07 00 00       	call   1e32 <unlink>
    sbrk(-size);
    1684:	89 3c 24             	mov    %edi,(%esp)
    1687:	e8 de 07 00 00       	call   1e6a <sbrk>
    if (count != read_count) {
    168c:	83 c4 10             	add    $0x10,%esp
    168f:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    1692:	75 1c                	jne    16b0 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1694:	83 ec 08             	sub    $0x8,%esp
    1697:	68 7c 29 00 00       	push   $0x297c
    169c:	6a 01                	push   $0x1
    169e:	e8 bd 08 00 00       	call   1f60 <printf>
        return 0;
    16a3:	83 c4 10             	add    $0x10,%esp
}
    16a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16a9:	31 c0                	xor    %eax,%eax
}
    16ab:	5b                   	pop    %ebx
    16ac:	5e                   	pop    %esi
    16ad:	5f                   	pop    %edi
    16ae:	5d                   	pop    %ebp
    16af:	c3                   	ret    
        printf(1, FAIL_MSG "wrong return value from read()\n");
    16b0:	83 ec 08             	sub    $0x8,%esp
    16b3:	68 50 29 00 00       	push   $0x2950
    16b8:	6a 01                	push   $0x1
    16ba:	e8 a1 08 00 00       	call   1f60 <printf>
        return 0;
    16bf:	83 c4 10             	add    $0x10,%esp
}
    16c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16c5:	31 c0                	xor    %eax,%eax
}
    16c7:	5b                   	pop    %ebx
    16c8:	5e                   	pop    %esi
    16c9:	5f                   	pop    %edi
    16ca:	5d                   	pop    %ebp
    16cb:	c3                   	ret    
        printf(2, "error opening tempfile");
    16cc:	83 ec 08             	sub    $0x8,%esp
    16cf:	68 87 23 00 00       	push   $0x2387
    16d4:	6a 02                	push   $0x2
    16d6:	e8 85 08 00 00       	call   1f60 <printf>
    char *heap = sbrk(0);
    16db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16e2:	e8 83 07 00 00       	call   1e6a <sbrk>
    sbrk(size);
    16e7:	59                   	pop    %ecx
    16e8:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    16eb:	89 c7                	mov    %eax,%edi
    sbrk(size);
    16ed:	e8 78 07 00 00       	call   1e6a <sbrk>
    char *loc = heap + offset;
    16f2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    16f5:	83 c4 0c             	add    $0xc,%esp
    16f8:	53                   	push   %ebx
    char *loc = heap + offset;
    16f9:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    16fb:	51                   	push   %ecx
    16fc:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    16ff:	6a ff                	push   $0xffffffff
    1701:	e9 df fe ff ff       	jmp    15e5 <test_read_into_alloc_no_fork+0xc5>
    close(fd);
    1706:	83 ec 0c             	sub    $0xc,%esp
    1709:	56                   	push   %esi
    170a:	e8 fb 06 00 00       	call   1e0a <close>
    fd = open("tempfile", O_RDONLY);
    170f:	5e                   	pop    %esi
    1710:	5f                   	pop    %edi
    1711:	6a 00                	push   $0x0
    1713:	68 95 23 00 00       	push   $0x2395
    1718:	e8 05 07 00 00       	call   1e22 <open>
    if (fd == -1) {
    171d:	83 c4 10             	add    $0x10,%esp
    1720:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    1723:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    1725:	74 3f                	je     1766 <test_read_into_alloc_no_fork+0x246>
    char *heap = sbrk(0);
    1727:	83 ec 0c             	sub    $0xc,%esp
    172a:	6a 00                	push   $0x0
    172c:	e8 39 07 00 00       	call   1e6a <sbrk>
    1731:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1733:	58                   	pop    %eax
    1734:	ff 75 08             	pushl  0x8(%ebp)
    1737:	e8 2e 07 00 00       	call   1e6a <sbrk>
    char *loc = heap + offset;
    173c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    173f:	83 c4 0c             	add    $0xc,%esp
    1742:	53                   	push   %ebx
    char *loc = heap + offset;
    1743:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1745:	51                   	push   %ecx
    1746:	56                   	push   %esi
    1747:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    174a:	e8 ab 06 00 00       	call   1dfa <read>
    failed_value = loc[-1] != '\0';
    174f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    1752:	31 d2                	xor    %edx,%edx
    int count = read(fd, loc, read_count);
    1754:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    1757:	83 c4 10             	add    $0x10,%esp
    175a:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    175e:	0f 95 c2             	setne  %dl
    1761:	e9 b0 fe ff ff       	jmp    1616 <test_read_into_alloc_no_fork+0xf6>
        printf(2, "error opening tempfile");
    1766:	50                   	push   %eax
    1767:	50                   	push   %eax
    1768:	68 87 23 00 00       	push   $0x2387
    176d:	6a 02                	push   $0x2
    176f:	e8 ec 07 00 00       	call   1f60 <printf>
    char *heap = sbrk(0);
    1774:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    177b:	e8 ea 06 00 00       	call   1e6a <sbrk>
    sbrk(size);
    1780:	5a                   	pop    %edx
    1781:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    1784:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1786:	e8 df 06 00 00       	call   1e6a <sbrk>
    char *loc = heap + offset;
    178b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    178e:	83 c4 0c             	add    $0xc,%esp
    1791:	53                   	push   %ebx
    char *loc = heap + offset;
    1792:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1794:	51                   	push   %ecx
    1795:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1798:	6a ff                	push   $0xffffffff
    179a:	eb ae                	jmp    174a <test_read_into_alloc_no_fork+0x22a>
    179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000017a0 <test_read_into_alloc>:
int test_read_into_alloc(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	83 ec 24             	sub    $0x24,%esp
    pipe(pipe_fds);
    17a6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    17a9:	50                   	push   %eax
    17aa:	e8 43 06 00 00       	call   1df2 <pipe>
    int pid = fork();
    17af:	e8 26 06 00 00       	call   1dda <fork>
    if (pid == 0) {
    17b4:	83 c4 10             	add    $0x10,%esp
    17b7:	85 c0                	test   %eax,%eax
    17b9:	74 33                	je     17ee <test_read_into_alloc+0x4e>
        close(pipe_fds[1]);
    17bb:	83 ec 0c             	sub    $0xc,%esp
    17be:	ff 75 f4             	pushl  -0xc(%ebp)
    17c1:	e8 44 06 00 00       	call   1e0a <close>
        read(pipe_fds[0], result_str, 1);
    17c6:	8d 45 ef             	lea    -0x11(%ebp),%eax
    17c9:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    17cc:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    17d0:	6a 01                	push   $0x1
    17d2:	50                   	push   %eax
    17d3:	ff 75 f0             	pushl  -0x10(%ebp)
    17d6:	e8 1f 06 00 00       	call   1dfa <read>
        wait();
    17db:	e8 0a 06 00 00       	call   1dea <wait>
        return result_str[0] == 'Y';
    17e0:	83 c4 10             	add    $0x10,%esp
    17e3:	31 c0                	xor    %eax,%eax
    17e5:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
}
    17e9:	c9                   	leave  
        return result_str[0] == 'Y';
    17ea:	0f 94 c0             	sete   %al
}
    17ed:	c3                   	ret    
        close(pipe_fds[0]);
    17ee:	83 ec 0c             	sub    $0xc,%esp
    17f1:	ff 75 f0             	pushl  -0x10(%ebp)
    17f4:	e8 11 06 00 00       	call   1e0a <close>
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    17f9:	5a                   	pop    %edx
    17fa:	ff 75 18             	pushl  0x18(%ebp)
    17fd:	ff 75 14             	pushl  0x14(%ebp)
    1800:	ff 75 10             	pushl  0x10(%ebp)
    1803:	ff 75 0c             	pushl  0xc(%ebp)
    1806:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1809:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    180d:	e8 0e fd ff ff       	call   1520 <test_read_into_alloc_no_fork>
    1812:	83 c4 20             	add    $0x20,%esp
    1815:	85 c0                	test   %eax,%eax
    1817:	74 04                	je     181d <test_read_into_alloc+0x7d>
            result_str[0] = 'Y';
    1819:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    181d:	50                   	push   %eax
    181e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1821:	6a 01                	push   $0x1
    1823:	50                   	push   %eax
    1824:	ff 75 f4             	pushl  -0xc(%ebp)
    1827:	e8 d6 05 00 00       	call   1e02 <write>
        exit();
    182c:	e8 b1 05 00 00       	call   1de2 <exit>
    1831:	eb 0d                	jmp    1840 <test_read_into_cow_less_forks>
    1833:	90                   	nop
    1834:	90                   	nop
    1835:	90                   	nop
    1836:	90                   	nop
    1837:	90                   	nop
    1838:	90                   	nop
    1839:	90                   	nop
    183a:	90                   	nop
    183b:	90                   	nop
    183c:	90                   	nop
    183d:	90                   	nop
    183e:	90                   	nop
    183f:	90                   	nop

00001840 <test_read_into_cow_less_forks>:
int test_read_into_cow_less_forks(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1840:	55                   	push   %ebp
    1841:	89 e5                	mov    %esp,%ebp
    1843:	57                   	push   %edi
    1844:	56                   	push   %esi
    1845:	53                   	push   %ebx
    1846:	83 ec 38             	sub    $0x38,%esp
    1849:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing read(), writing %d bytes to a location %s into a %s copy-on-write allocation\n",
    184c:	ff 75 14             	pushl  0x14(%ebp)
    184f:	ff 75 18             	pushl  0x18(%ebp)
    1852:	57                   	push   %edi
    1853:	68 b0 29 00 00       	push   $0x29b0
    1858:	6a 01                	push   $0x1
    185a:	e8 01 07 00 00       	call   1f60 <printf>
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    185f:	83 c4 18             	add    $0x18,%esp
    1862:	68 01 02 00 00       	push   $0x201
    1867:	68 95 23 00 00       	push   $0x2395
    186c:	e8 b1 05 00 00       	call   1e22 <open>
    1871:	83 c4 10             	add    $0x10,%esp
    1874:	89 c3                	mov    %eax,%ebx
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1876:	31 c0                	xor    %eax,%eax
    1878:	90                   	nop
    1879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    1880:	c6 80 00 33 00 00 58 	movb   $0x58,0x3300(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1887:	83 c0 01             	add    $0x1,%eax
    188a:	3d 80 00 00 00       	cmp    $0x80,%eax
    188f:	75 ef                	jne    1880 <test_read_into_cow_less_forks+0x40>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1891:	85 ff                	test   %edi,%edi
    1893:	7e 28                	jle    18bd <test_read_into_cow_less_forks+0x7d>
    1895:	31 f6                	xor    %esi,%esi
    1897:	89 f6                	mov    %esi,%esi
    1899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        write(fd, buffer, sizeof buffer);
    18a0:	83 ec 04             	sub    $0x4,%esp
    18a3:	83 ee 80             	sub    $0xffffff80,%esi
    18a6:	68 80 00 00 00       	push   $0x80
    18ab:	68 00 33 00 00       	push   $0x3300
    18b0:	53                   	push   %ebx
    18b1:	e8 4c 05 00 00       	call   1e02 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    18b6:	83 c4 10             	add    $0x10,%esp
    18b9:	39 f7                	cmp    %esi,%edi
    18bb:	7f e3                	jg     18a0 <test_read_into_cow_less_forks+0x60>
    close(fd);
    18bd:	83 ec 0c             	sub    $0xc,%esp
    18c0:	53                   	push   %ebx
    18c1:	e8 44 05 00 00       	call   1e0a <close>
    fd = open("tempfile", O_RDONLY);
    18c6:	58                   	pop    %eax
    18c7:	5a                   	pop    %edx
    18c8:	6a 00                	push   $0x0
    18ca:	68 95 23 00 00       	push   $0x2395
    18cf:	e8 4e 05 00 00       	call   1e22 <open>
    if (fd == -1) {
    18d4:	83 c4 10             	add    $0x10,%esp
    18d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    18da:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    if (fd == -1) {
    18dd:	0f 84 03 01 00 00    	je     19e6 <test_read_into_cow_less_forks+0x1a6>
    char *heap = sbrk(0);
    18e3:	83 ec 0c             	sub    $0xc,%esp
    18e6:	6a 00                	push   $0x0
    18e8:	e8 7d 05 00 00       	call   1e6a <sbrk>
    18ed:	89 c3                	mov    %eax,%ebx
    sbrk(size);
    18ef:	58                   	pop    %eax
    18f0:	ff 75 08             	pushl  0x8(%ebp)
    18f3:	e8 72 05 00 00       	call   1e6a <sbrk>
    for (int i = 0; i < size; ++i) {
    18f8:	8b 45 08             	mov    0x8(%ebp),%eax
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	85 c0                	test   %eax,%eax
    1900:	7e 18                	jle    191a <test_read_into_cow_less_forks+0xda>
    1902:	8b 55 08             	mov    0x8(%ebp),%edx
    1905:	89 d8                	mov    %ebx,%eax
    1907:	01 da                	add    %ebx,%edx
    1909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        heap[i] = 'Y';
    1910:	c6 00 59             	movb   $0x59,(%eax)
    1913:	83 c0 01             	add    $0x1,%eax
    for (int i = 0; i < size; ++i) {
    1916:	39 c2                	cmp    %eax,%edx
    1918:	75 f6                	jne    1910 <test_read_into_cow_less_forks+0xd0>
    pipe(pipe_fds);
    191a:	8d 45 e0             	lea    -0x20(%ebp),%eax
    191d:	83 ec 0c             	sub    $0xc,%esp
    1920:	50                   	push   %eax
    1921:	e8 cc 04 00 00       	call   1df2 <pipe>
    int pid = fork();
    1926:	e8 af 04 00 00       	call   1dda <fork>
    if (pid == 0) {
    192b:	83 c4 10             	add    $0x10,%esp
    192e:	85 c0                	test   %eax,%eax
    1930:	0f 84 c7 00 00 00    	je     19fd <test_read_into_cow_less_forks+0x1bd>
        close(pipe_fds[1]);
    1936:	83 ec 0c             	sub    $0xc,%esp
    1939:	ff 75 e4             	pushl  -0x1c(%ebp)
    193c:	e8 c9 04 00 00       	call   1e0a <close>
        read(pipe_fds[0], result_buf, 1);
    1941:	8d 45 df             	lea    -0x21(%ebp),%eax
    1944:	83 c4 0c             	add    $0xc,%esp
        char result_buf[1] = {'N'};
    1947:	c6 45 df 4e          	movb   $0x4e,-0x21(%ebp)
        read(pipe_fds[0], result_buf, 1);
    194b:	6a 01                	push   $0x1
    194d:	50                   	push   %eax
    194e:	ff 75 e0             	pushl  -0x20(%ebp)
    1951:	e8 a4 04 00 00       	call   1dfa <read>
        close(pipe_fds[0]);
    1956:	58                   	pop    %eax
    1957:	ff 75 e0             	pushl  -0x20(%ebp)
    195a:	e8 ab 04 00 00       	call   1e0a <close>
        wait();
    195f:	e8 86 04 00 00       	call   1dea <wait>
        printf(1, "testing correct value for heap in parent after read() in child\n");
    1964:	5a                   	pop    %edx
    1965:	59                   	pop    %ecx
    1966:	68 44 2a 00 00       	push   $0x2a44
    196b:	6a 01                	push   $0x1
    196d:	e8 ee 05 00 00       	call   1f60 <printf>
        for (int i = 0; i < size; ++i) {
    1972:	8b 75 08             	mov    0x8(%ebp),%esi
    1975:	83 c4 10             	add    $0x10,%esp
    1978:	85 f6                	test   %esi,%esi
    197a:	7e 40                	jle    19bc <test_read_into_cow_less_forks+0x17c>
    197c:	8b 75 08             	mov    0x8(%ebp),%esi
        int found_wrong = 0;
    197f:	31 c0                	xor    %eax,%eax
                found_wrong = 1;
    1981:	ba 01 00 00 00       	mov    $0x1,%edx
    1986:	01 de                	add    %ebx,%esi
    1988:	90                   	nop
    1989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1990:	80 3b 59             	cmpb   $0x59,(%ebx)
    1993:	0f 45 c2             	cmovne %edx,%eax
    1996:	83 c3 01             	add    $0x1,%ebx
        for (int i = 0; i < size; ++i) {
    1999:	39 de                	cmp    %ebx,%esi
    199b:	75 f3                	jne    1990 <test_read_into_cow_less_forks+0x150>
    199d:	89 c3                	mov    %eax,%ebx
    199f:	83 f3 01             	xor    $0x1,%ebx
        if (found_wrong) { 
    19a2:	85 c0                	test   %eax,%eax
    19a4:	74 1b                	je     19c1 <test_read_into_cow_less_forks+0x181>
            printf(1, FAIL_MSG "wrong value in parent after read() in child\n");
    19a6:	83 ec 08             	sub    $0x8,%esp
    19a9:	31 db                	xor    %ebx,%ebx
    19ab:	68 84 2a 00 00       	push   $0x2a84
    19b0:	6a 01                	push   $0x1
    19b2:	e8 a9 05 00 00       	call   1f60 <printf>
    19b7:	83 c4 10             	add    $0x10,%esp
    19ba:	eb 17                	jmp    19d3 <test_read_into_cow_less_forks+0x193>
        for (int i = 0; i < size; ++i) {
    19bc:	bb 01 00 00 00       	mov    $0x1,%ebx
            printf(1, PASS_MSG "correct value in parent after read into copy-on-write allocation\n");
    19c1:	83 ec 08             	sub    $0x8,%esp
    19c4:	68 bc 2a 00 00       	push   $0x2abc
    19c9:	6a 01                	push   $0x1
    19cb:	e8 90 05 00 00       	call   1f60 <printf>
    19d0:	83 c4 10             	add    $0x10,%esp
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    19d3:	31 c0                	xor    %eax,%eax
    19d5:	80 7d df 59          	cmpb   $0x59,-0x21(%ebp)
    19d9:	0f 94 c0             	sete   %al
}
    19dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    19df:	01 d8                	add    %ebx,%eax
}
    19e1:	5b                   	pop    %ebx
    19e2:	5e                   	pop    %esi
    19e3:	5f                   	pop    %edi
    19e4:	5d                   	pop    %ebp
    19e5:	c3                   	ret    
        printf(2, "error opening tempfile");
    19e6:	83 ec 08             	sub    $0x8,%esp
    19e9:	68 87 23 00 00       	push   $0x2387
    19ee:	6a 02                	push   $0x2
    19f0:	e8 6b 05 00 00       	call   1f60 <printf>
    19f5:	83 c4 10             	add    $0x10,%esp
    19f8:	e9 e6 fe ff ff       	jmp    18e3 <test_read_into_cow_less_forks+0xa3>
    char *loc = heap + offset;
    19fd:	03 5d 0c             	add    0xc(%ebp),%ebx
        close(pipe_fds[0]);
    1a00:	83 ec 0c             	sub    $0xc,%esp
    1a03:	ff 75 e0             	pushl  -0x20(%ebp)
    1a06:	89 45 cc             	mov    %eax,-0x34(%ebp)
    1a09:	e8 fc 03 00 00       	call   1e0a <close>
        int count = read(fd, loc, read_count);
    1a0e:	83 c4 0c             	add    $0xc,%esp
    1a11:	57                   	push   %edi
    1a12:	53                   	push   %ebx
    1a13:	ff 75 d4             	pushl  -0x2c(%ebp)
    1a16:	e8 df 03 00 00       	call   1dfa <read>
        failed_value = loc[-1] != 'Y';
    1a1b:	83 c4 10             	add    $0x10,%esp
        int count = read(fd, loc, read_count);
    1a1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        failed_value = loc[-1] != 'Y';
    1a21:	31 c0                	xor    %eax,%eax
    1a23:	80 7b ff 59          	cmpb   $0x59,-0x1(%ebx)
    1a27:	8b 55 cc             	mov    -0x34(%ebp),%edx
    1a2a:	0f 95 c0             	setne  %al
    1a2d:	89 c6                	mov    %eax,%esi
                failed_value = 1;
    1a2f:	b8 01 00 00 00       	mov    $0x1,%eax
        for (int i = 0; i < read_count; ++i) {
    1a34:	39 fa                	cmp    %edi,%edx
    1a36:	7d 0c                	jge    1a44 <test_read_into_cow_less_forks+0x204>
                failed_value = 1;
    1a38:	80 3c 13 58          	cmpb   $0x58,(%ebx,%edx,1)
    1a3c:	0f 45 f0             	cmovne %eax,%esi
        for (int i = 0; i < read_count; ++i) {
    1a3f:	83 c2 01             	add    $0x1,%edx
    1a42:	eb f0                	jmp    1a34 <test_read_into_cow_less_forks+0x1f4>
        if (loc[read_count] != 'Y') {
    1a44:	80 3c 3b 59          	cmpb   $0x59,(%ebx,%edi,1)
    1a48:	74 52                	je     1a9c <test_read_into_cow_less_forks+0x25c>
        close(fd);
    1a4a:	83 ec 0c             	sub    $0xc,%esp
    1a4d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1a50:	e8 b5 03 00 00       	call   1e0a <close>
        unlink("tempfile");
    1a55:	c7 04 24 95 23 00 00 	movl   $0x2395,(%esp)
    1a5c:	e8 d1 03 00 00       	call   1e32 <unlink>
        if (count != read_count) {
    1a61:	83 c4 10             	add    $0x10,%esp
    1a64:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    1a67:	74 56                	je     1abf <test_read_into_cow_less_forks+0x27f>
            printf(1, FAIL_MSG "wrong return value from read()\n");
    1a69:	50                   	push   %eax
    1a6a:	50                   	push   %eax
    1a6b:	68 50 29 00 00       	push   $0x2950
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1a70:	6a 01                	push   $0x1
    1a72:	e8 e9 04 00 00       	call   1f60 <printf>
            write(pipe_fds[1], "N", 1);
    1a77:	83 c4 0c             	add    $0xc,%esp
    1a7a:	6a 01                	push   $0x1
    1a7c:	68 9e 23 00 00       	push   $0x239e
    1a81:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a84:	e8 79 03 00 00       	call   1e02 <write>
    1a89:	83 c4 10             	add    $0x10,%esp
        close(pipe_fds[1]);
    1a8c:	83 ec 0c             	sub    $0xc,%esp
    1a8f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a92:	e8 73 03 00 00       	call   1e0a <close>
        exit();
    1a97:	e8 46 03 00 00       	call   1de2 <exit>
        close(fd);
    1a9c:	83 ec 0c             	sub    $0xc,%esp
    1a9f:	ff 75 d4             	pushl  -0x2c(%ebp)
    1aa2:	e8 63 03 00 00       	call   1e0a <close>
        unlink("tempfile");
    1aa7:	c7 04 24 95 23 00 00 	movl   $0x2395,(%esp)
    1aae:	e8 7f 03 00 00       	call   1e32 <unlink>
        if (count != read_count) {
    1ab3:	83 c4 10             	add    $0x10,%esp
    1ab6:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    1ab9:	75 ae                	jne    1a69 <test_read_into_cow_less_forks+0x229>
        } else if (failed_value) {
    1abb:	85 f6                	test   %esi,%esi
    1abd:	74 09                	je     1ac8 <test_read_into_cow_less_forks+0x288>
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1abf:	50                   	push   %eax
    1ac0:	50                   	push   %eax
    1ac1:	68 7c 29 00 00       	push   $0x297c
    1ac6:	eb a8                	jmp    1a70 <test_read_into_cow_less_forks+0x230>
            printf(1, PASS_MSG "correct value read into copy-on-write allocation\n");
    1ac8:	57                   	push   %edi
    1ac9:	57                   	push   %edi
    1aca:	68 08 2a 00 00       	push   $0x2a08
    1acf:	6a 01                	push   $0x1
    1ad1:	e8 8a 04 00 00       	call   1f60 <printf>
            write(pipe_fds[1], "Y", 1);
    1ad6:	83 c4 0c             	add    $0xc,%esp
    1ad9:	6a 01                	push   $0x1
    1adb:	68 0d 23 00 00       	push   $0x230d
    1ae0:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ae3:	e8 1a 03 00 00       	call   1e02 <write>
    1ae8:	83 c4 10             	add    $0x10,%esp
    1aeb:	eb 9f                	jmp    1a8c <test_read_into_cow_less_forks+0x24c>
    1aed:	8d 76 00             	lea    0x0(%esi),%esi

00001af0 <test_read_into_cow>:
int test_read_into_cow(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1af0:	55                   	push   %ebp
    1af1:	89 e5                	mov    %esp,%ebp
    1af3:	83 ec 24             	sub    $0x24,%esp
    pipe(pipe_fds);
    1af6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1af9:	50                   	push   %eax
    1afa:	e8 f3 02 00 00       	call   1df2 <pipe>
    int pid = fork();
    1aff:	e8 d6 02 00 00       	call   1dda <fork>
    if (pid == 0) {
    1b04:	83 c4 10             	add    $0x10,%esp
    1b07:	85 c0                	test   %eax,%eax
    1b09:	74 33                	je     1b3e <test_read_into_cow+0x4e>
        close(pipe_fds[1]);
    1b0b:	83 ec 0c             	sub    $0xc,%esp
    1b0e:	ff 75 f4             	pushl  -0xc(%ebp)
    1b11:	e8 f4 02 00 00       	call   1e0a <close>
        read(pipe_fds[0], result_str, 1);
    1b16:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1b19:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    1b1c:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1b20:	6a 01                	push   $0x1
    1b22:	50                   	push   %eax
    1b23:	ff 75 f0             	pushl  -0x10(%ebp)
    1b26:	e8 cf 02 00 00       	call   1dfa <read>
        wait();
    1b2b:	e8 ba 02 00 00       	call   1dea <wait>
        return result_str[0] == 'Y';
    1b30:	83 c4 10             	add    $0x10,%esp
    1b33:	31 c0                	xor    %eax,%eax
    1b35:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
}
    1b39:	c9                   	leave  
        return result_str[0] == 'Y';
    1b3a:	0f 94 c0             	sete   %al
}
    1b3d:	c3                   	ret    
        close(pipe_fds[0]);
    1b3e:	83 ec 0c             	sub    $0xc,%esp
    1b41:	ff 75 f0             	pushl  -0x10(%ebp)
    1b44:	e8 c1 02 00 00       	call   1e0a <close>
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1b49:	5a                   	pop    %edx
    1b4a:	ff 75 18             	pushl  0x18(%ebp)
    1b4d:	ff 75 14             	pushl  0x14(%ebp)
    1b50:	ff 75 10             	pushl  0x10(%ebp)
    1b53:	ff 75 0c             	pushl  0xc(%ebp)
    1b56:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1b59:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1b5d:	e8 de fc ff ff       	call   1840 <test_read_into_cow_less_forks>
    1b62:	83 c4 20             	add    $0x20,%esp
    1b65:	85 c0                	test   %eax,%eax
    1b67:	74 04                	je     1b6d <test_read_into_cow+0x7d>
            result_str[0] = 'Y';
    1b69:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    1b6d:	50                   	push   %eax
    1b6e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1b71:	6a 01                	push   $0x1
    1b73:	50                   	push   %eax
    1b74:	ff 75 f4             	pushl  -0xc(%ebp)
    1b77:	e8 86 02 00 00       	call   1e02 <write>
        exit();
    1b7c:	e8 61 02 00 00       	call   1de2 <exit>
    1b81:	66 90                	xchg   %ax,%ax
    1b83:	66 90                	xchg   %ax,%ax
    1b85:	66 90                	xchg   %ax,%ax
    1b87:	66 90                	xchg   %ax,%ax
    1b89:	66 90                	xchg   %ax,%ax
    1b8b:	66 90                	xchg   %ax,%ax
    1b8d:	66 90                	xchg   %ax,%ax
    1b8f:	90                   	nop

00001b90 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	53                   	push   %ebx
    1b94:	8b 45 08             	mov    0x8(%ebp),%eax
    1b97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1b9a:	89 c2                	mov    %eax,%edx
    1b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ba0:	83 c1 01             	add    $0x1,%ecx
    1ba3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1ba7:	83 c2 01             	add    $0x1,%edx
    1baa:	84 db                	test   %bl,%bl
    1bac:	88 5a ff             	mov    %bl,-0x1(%edx)
    1baf:	75 ef                	jne    1ba0 <strcpy+0x10>
    ;
  return os;
}
    1bb1:	5b                   	pop    %ebx
    1bb2:	5d                   	pop    %ebp
    1bb3:	c3                   	ret    
    1bb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001bc0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	53                   	push   %ebx
    1bc4:	8b 55 08             	mov    0x8(%ebp),%edx
    1bc7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1bca:	0f b6 02             	movzbl (%edx),%eax
    1bcd:	0f b6 19             	movzbl (%ecx),%ebx
    1bd0:	84 c0                	test   %al,%al
    1bd2:	75 1c                	jne    1bf0 <strcmp+0x30>
    1bd4:	eb 2a                	jmp    1c00 <strcmp+0x40>
    1bd6:	8d 76 00             	lea    0x0(%esi),%esi
    1bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1be0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1be3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1be6:	83 c1 01             	add    $0x1,%ecx
    1be9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    1bec:	84 c0                	test   %al,%al
    1bee:	74 10                	je     1c00 <strcmp+0x40>
    1bf0:	38 d8                	cmp    %bl,%al
    1bf2:	74 ec                	je     1be0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1bf4:	29 d8                	sub    %ebx,%eax
}
    1bf6:	5b                   	pop    %ebx
    1bf7:	5d                   	pop    %ebp
    1bf8:	c3                   	ret    
    1bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c00:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1c02:	29 d8                	sub    %ebx,%eax
}
    1c04:	5b                   	pop    %ebx
    1c05:	5d                   	pop    %ebp
    1c06:	c3                   	ret    
    1c07:	89 f6                	mov    %esi,%esi
    1c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c10 <strlen>:

uint
strlen(char *s)
{
    1c10:	55                   	push   %ebp
    1c11:	89 e5                	mov    %esp,%ebp
    1c13:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1c16:	80 39 00             	cmpb   $0x0,(%ecx)
    1c19:	74 15                	je     1c30 <strlen+0x20>
    1c1b:	31 d2                	xor    %edx,%edx
    1c1d:	8d 76 00             	lea    0x0(%esi),%esi
    1c20:	83 c2 01             	add    $0x1,%edx
    1c23:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1c27:	89 d0                	mov    %edx,%eax
    1c29:	75 f5                	jne    1c20 <strlen+0x10>
    ;
  return n;
}
    1c2b:	5d                   	pop    %ebp
    1c2c:	c3                   	ret    
    1c2d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1c30:	31 c0                	xor    %eax,%eax
}
    1c32:	5d                   	pop    %ebp
    1c33:	c3                   	ret    
    1c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001c40 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1c40:	55                   	push   %ebp
    1c41:	89 e5                	mov    %esp,%ebp
    1c43:	57                   	push   %edi
    1c44:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1c47:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c4d:	89 d7                	mov    %edx,%edi
    1c4f:	fc                   	cld    
    1c50:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1c52:	89 d0                	mov    %edx,%eax
    1c54:	5f                   	pop    %edi
    1c55:	5d                   	pop    %ebp
    1c56:	c3                   	ret    
    1c57:	89 f6                	mov    %esi,%esi
    1c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c60 <strchr>:

char*
strchr(const char *s, char c)
{
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    1c63:	53                   	push   %ebx
    1c64:	8b 45 08             	mov    0x8(%ebp),%eax
    1c67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1c6a:	0f b6 10             	movzbl (%eax),%edx
    1c6d:	84 d2                	test   %dl,%dl
    1c6f:	74 1d                	je     1c8e <strchr+0x2e>
    if(*s == c)
    1c71:	38 d3                	cmp    %dl,%bl
    1c73:	89 d9                	mov    %ebx,%ecx
    1c75:	75 0d                	jne    1c84 <strchr+0x24>
    1c77:	eb 17                	jmp    1c90 <strchr+0x30>
    1c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c80:	38 ca                	cmp    %cl,%dl
    1c82:	74 0c                	je     1c90 <strchr+0x30>
  for(; *s; s++)
    1c84:	83 c0 01             	add    $0x1,%eax
    1c87:	0f b6 10             	movzbl (%eax),%edx
    1c8a:	84 d2                	test   %dl,%dl
    1c8c:	75 f2                	jne    1c80 <strchr+0x20>
      return (char*)s;
  return 0;
    1c8e:	31 c0                	xor    %eax,%eax
}
    1c90:	5b                   	pop    %ebx
    1c91:	5d                   	pop    %ebp
    1c92:	c3                   	ret    
    1c93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ca0 <gets>:

char*
gets(char *buf, int max)
{
    1ca0:	55                   	push   %ebp
    1ca1:	89 e5                	mov    %esp,%ebp
    1ca3:	57                   	push   %edi
    1ca4:	56                   	push   %esi
    1ca5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1ca6:	31 f6                	xor    %esi,%esi
    1ca8:	89 f3                	mov    %esi,%ebx
{
    1caa:	83 ec 1c             	sub    $0x1c,%esp
    1cad:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1cb0:	eb 2f                	jmp    1ce1 <gets+0x41>
    1cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1cb8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1cbb:	83 ec 04             	sub    $0x4,%esp
    1cbe:	6a 01                	push   $0x1
    1cc0:	50                   	push   %eax
    1cc1:	6a 00                	push   $0x0
    1cc3:	e8 32 01 00 00       	call   1dfa <read>
    if(cc < 1)
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	85 c0                	test   %eax,%eax
    1ccd:	7e 1c                	jle    1ceb <gets+0x4b>
      break;
    buf[i++] = c;
    1ccf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1cd3:	83 c7 01             	add    $0x1,%edi
    1cd6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1cd9:	3c 0a                	cmp    $0xa,%al
    1cdb:	74 23                	je     1d00 <gets+0x60>
    1cdd:	3c 0d                	cmp    $0xd,%al
    1cdf:	74 1f                	je     1d00 <gets+0x60>
  for(i=0; i+1 < max; ){
    1ce1:	83 c3 01             	add    $0x1,%ebx
    1ce4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1ce7:	89 fe                	mov    %edi,%esi
    1ce9:	7c cd                	jl     1cb8 <gets+0x18>
    1ceb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1ced:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1cf0:	c6 03 00             	movb   $0x0,(%ebx)
}
    1cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cf6:	5b                   	pop    %ebx
    1cf7:	5e                   	pop    %esi
    1cf8:	5f                   	pop    %edi
    1cf9:	5d                   	pop    %ebp
    1cfa:	c3                   	ret    
    1cfb:	90                   	nop
    1cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d00:	8b 75 08             	mov    0x8(%ebp),%esi
    1d03:	8b 45 08             	mov    0x8(%ebp),%eax
    1d06:	01 de                	add    %ebx,%esi
    1d08:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1d0a:	c6 03 00             	movb   $0x0,(%ebx)
}
    1d0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d10:	5b                   	pop    %ebx
    1d11:	5e                   	pop    %esi
    1d12:	5f                   	pop    %edi
    1d13:	5d                   	pop    %ebp
    1d14:	c3                   	ret    
    1d15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d20 <stat>:

int
stat(char *n, struct stat *st)
{
    1d20:	55                   	push   %ebp
    1d21:	89 e5                	mov    %esp,%ebp
    1d23:	56                   	push   %esi
    1d24:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1d25:	83 ec 08             	sub    $0x8,%esp
    1d28:	6a 00                	push   $0x0
    1d2a:	ff 75 08             	pushl  0x8(%ebp)
    1d2d:	e8 f0 00 00 00       	call   1e22 <open>
  if(fd < 0)
    1d32:	83 c4 10             	add    $0x10,%esp
    1d35:	85 c0                	test   %eax,%eax
    1d37:	78 27                	js     1d60 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1d39:	83 ec 08             	sub    $0x8,%esp
    1d3c:	ff 75 0c             	pushl  0xc(%ebp)
    1d3f:	89 c3                	mov    %eax,%ebx
    1d41:	50                   	push   %eax
    1d42:	e8 f3 00 00 00       	call   1e3a <fstat>
  close(fd);
    1d47:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1d4a:	89 c6                	mov    %eax,%esi
  close(fd);
    1d4c:	e8 b9 00 00 00       	call   1e0a <close>
  return r;
    1d51:	83 c4 10             	add    $0x10,%esp
}
    1d54:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d57:	89 f0                	mov    %esi,%eax
    1d59:	5b                   	pop    %ebx
    1d5a:	5e                   	pop    %esi
    1d5b:	5d                   	pop    %ebp
    1d5c:	c3                   	ret    
    1d5d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1d60:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1d65:	eb ed                	jmp    1d54 <stat+0x34>
    1d67:	89 f6                	mov    %esi,%esi
    1d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d70 <atoi>:

int
atoi(const char *s)
{
    1d70:	55                   	push   %ebp
    1d71:	89 e5                	mov    %esp,%ebp
    1d73:	53                   	push   %ebx
    1d74:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1d77:	0f be 11             	movsbl (%ecx),%edx
    1d7a:	8d 42 d0             	lea    -0x30(%edx),%eax
    1d7d:	3c 09                	cmp    $0x9,%al
  n = 0;
    1d7f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1d84:	77 1f                	ja     1da5 <atoi+0x35>
    1d86:	8d 76 00             	lea    0x0(%esi),%esi
    1d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1d90:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1d93:	83 c1 01             	add    $0x1,%ecx
    1d96:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1d9a:	0f be 11             	movsbl (%ecx),%edx
    1d9d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1da0:	80 fb 09             	cmp    $0x9,%bl
    1da3:	76 eb                	jbe    1d90 <atoi+0x20>
  return n;
}
    1da5:	5b                   	pop    %ebx
    1da6:	5d                   	pop    %ebp
    1da7:	c3                   	ret    
    1da8:	90                   	nop
    1da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001db0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1db0:	55                   	push   %ebp
    1db1:	89 e5                	mov    %esp,%ebp
    1db3:	56                   	push   %esi
    1db4:	53                   	push   %ebx
    1db5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1db8:	8b 45 08             	mov    0x8(%ebp),%eax
    1dbb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1dbe:	85 db                	test   %ebx,%ebx
    1dc0:	7e 14                	jle    1dd6 <memmove+0x26>
    1dc2:	31 d2                	xor    %edx,%edx
    1dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1dc8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1dcc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1dcf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1dd2:	39 d3                	cmp    %edx,%ebx
    1dd4:	75 f2                	jne    1dc8 <memmove+0x18>
  return vdst;
}
    1dd6:	5b                   	pop    %ebx
    1dd7:	5e                   	pop    %esi
    1dd8:	5d                   	pop    %ebp
    1dd9:	c3                   	ret    

00001dda <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1dda:	b8 01 00 00 00       	mov    $0x1,%eax
    1ddf:	cd 40                	int    $0x40
    1de1:	c3                   	ret    

00001de2 <exit>:
SYSCALL(exit)
    1de2:	b8 02 00 00 00       	mov    $0x2,%eax
    1de7:	cd 40                	int    $0x40
    1de9:	c3                   	ret    

00001dea <wait>:
SYSCALL(wait)
    1dea:	b8 03 00 00 00       	mov    $0x3,%eax
    1def:	cd 40                	int    $0x40
    1df1:	c3                   	ret    

00001df2 <pipe>:
SYSCALL(pipe)
    1df2:	b8 04 00 00 00       	mov    $0x4,%eax
    1df7:	cd 40                	int    $0x40
    1df9:	c3                   	ret    

00001dfa <read>:
SYSCALL(read)
    1dfa:	b8 05 00 00 00       	mov    $0x5,%eax
    1dff:	cd 40                	int    $0x40
    1e01:	c3                   	ret    

00001e02 <write>:
SYSCALL(write)
    1e02:	b8 10 00 00 00       	mov    $0x10,%eax
    1e07:	cd 40                	int    $0x40
    1e09:	c3                   	ret    

00001e0a <close>:
SYSCALL(close)
    1e0a:	b8 15 00 00 00       	mov    $0x15,%eax
    1e0f:	cd 40                	int    $0x40
    1e11:	c3                   	ret    

00001e12 <kill>:
SYSCALL(kill)
    1e12:	b8 06 00 00 00       	mov    $0x6,%eax
    1e17:	cd 40                	int    $0x40
    1e19:	c3                   	ret    

00001e1a <exec>:
SYSCALL(exec)
    1e1a:	b8 07 00 00 00       	mov    $0x7,%eax
    1e1f:	cd 40                	int    $0x40
    1e21:	c3                   	ret    

00001e22 <open>:
SYSCALL(open)
    1e22:	b8 0f 00 00 00       	mov    $0xf,%eax
    1e27:	cd 40                	int    $0x40
    1e29:	c3                   	ret    

00001e2a <mknod>:
SYSCALL(mknod)
    1e2a:	b8 11 00 00 00       	mov    $0x11,%eax
    1e2f:	cd 40                	int    $0x40
    1e31:	c3                   	ret    

00001e32 <unlink>:
SYSCALL(unlink)
    1e32:	b8 12 00 00 00       	mov    $0x12,%eax
    1e37:	cd 40                	int    $0x40
    1e39:	c3                   	ret    

00001e3a <fstat>:
SYSCALL(fstat)
    1e3a:	b8 08 00 00 00       	mov    $0x8,%eax
    1e3f:	cd 40                	int    $0x40
    1e41:	c3                   	ret    

00001e42 <link>:
SYSCALL(link)
    1e42:	b8 13 00 00 00       	mov    $0x13,%eax
    1e47:	cd 40                	int    $0x40
    1e49:	c3                   	ret    

00001e4a <mkdir>:
SYSCALL(mkdir)
    1e4a:	b8 14 00 00 00       	mov    $0x14,%eax
    1e4f:	cd 40                	int    $0x40
    1e51:	c3                   	ret    

00001e52 <chdir>:
SYSCALL(chdir)
    1e52:	b8 09 00 00 00       	mov    $0x9,%eax
    1e57:	cd 40                	int    $0x40
    1e59:	c3                   	ret    

00001e5a <dup>:
SYSCALL(dup)
    1e5a:	b8 0a 00 00 00       	mov    $0xa,%eax
    1e5f:	cd 40                	int    $0x40
    1e61:	c3                   	ret    

00001e62 <getpid>:
SYSCALL(getpid)
    1e62:	b8 0b 00 00 00       	mov    $0xb,%eax
    1e67:	cd 40                	int    $0x40
    1e69:	c3                   	ret    

00001e6a <sbrk>:
SYSCALL(sbrk)
    1e6a:	b8 0c 00 00 00       	mov    $0xc,%eax
    1e6f:	cd 40                	int    $0x40
    1e71:	c3                   	ret    

00001e72 <sleep>:
SYSCALL(sleep)
    1e72:	b8 0d 00 00 00       	mov    $0xd,%eax
    1e77:	cd 40                	int    $0x40
    1e79:	c3                   	ret    

00001e7a <uptime>:
SYSCALL(uptime)
    1e7a:	b8 0e 00 00 00       	mov    $0xe,%eax
    1e7f:	cd 40                	int    $0x40
    1e81:	c3                   	ret    

00001e82 <yield>:
SYSCALL(yield)
    1e82:	b8 16 00 00 00       	mov    $0x16,%eax
    1e87:	cd 40                	int    $0x40
    1e89:	c3                   	ret    

00001e8a <shutdown>:
SYSCALL(shutdown)
    1e8a:	b8 17 00 00 00       	mov    $0x17,%eax
    1e8f:	cd 40                	int    $0x40
    1e91:	c3                   	ret    

00001e92 <writecount>:
SYSCALL(writecount)
    1e92:	b8 18 00 00 00       	mov    $0x18,%eax
    1e97:	cd 40                	int    $0x40
    1e99:	c3                   	ret    

00001e9a <settickets>:
SYSCALL(settickets)
    1e9a:	b8 19 00 00 00       	mov    $0x19,%eax
    1e9f:	cd 40                	int    $0x40
    1ea1:	c3                   	ret    

00001ea2 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
    1ea2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1ea7:	cd 40                	int    $0x40
    1ea9:	c3                   	ret    

00001eaa <dumppagetable>:
    1eaa:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1eaf:	cd 40                	int    $0x40
    1eb1:	c3                   	ret    
    1eb2:	66 90                	xchg   %ax,%ax
    1eb4:	66 90                	xchg   %ax,%ax
    1eb6:	66 90                	xchg   %ax,%ax
    1eb8:	66 90                	xchg   %ax,%ax
    1eba:	66 90                	xchg   %ax,%ax
    1ebc:	66 90                	xchg   %ax,%ax
    1ebe:	66 90                	xchg   %ax,%ax

00001ec0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1ec0:	55                   	push   %ebp
    1ec1:	89 e5                	mov    %esp,%ebp
    1ec3:	57                   	push   %edi
    1ec4:	56                   	push   %esi
    1ec5:	53                   	push   %ebx
    1ec6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1ec9:	85 d2                	test   %edx,%edx
{
    1ecb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    1ece:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1ed0:	79 76                	jns    1f48 <printint+0x88>
    1ed2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1ed6:	74 70                	je     1f48 <printint+0x88>
    x = -xx;
    1ed8:	f7 d8                	neg    %eax
    neg = 1;
    1eda:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1ee1:	31 f6                	xor    %esi,%esi
    1ee3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1ee6:	eb 0a                	jmp    1ef2 <printint+0x32>
    1ee8:	90                   	nop
    1ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1ef0:	89 fe                	mov    %edi,%esi
    1ef2:	31 d2                	xor    %edx,%edx
    1ef4:	8d 7e 01             	lea    0x1(%esi),%edi
    1ef7:	f7 f1                	div    %ecx
    1ef9:	0f b6 92 3c 2c 00 00 	movzbl 0x2c3c(%edx),%edx
  }while((x /= base) != 0);
    1f00:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1f02:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1f05:	75 e9                	jne    1ef0 <printint+0x30>
  if(neg)
    1f07:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1f0a:	85 c0                	test   %eax,%eax
    1f0c:	74 08                	je     1f16 <printint+0x56>
    buf[i++] = '-';
    1f0e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1f13:	8d 7e 02             	lea    0x2(%esi),%edi
    1f16:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    1f1a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    1f1d:	8d 76 00             	lea    0x0(%esi),%esi
    1f20:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1f23:	83 ec 04             	sub    $0x4,%esp
    1f26:	83 ee 01             	sub    $0x1,%esi
    1f29:	6a 01                	push   $0x1
    1f2b:	53                   	push   %ebx
    1f2c:	57                   	push   %edi
    1f2d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1f30:	e8 cd fe ff ff       	call   1e02 <write>

  while(--i >= 0)
    1f35:	83 c4 10             	add    $0x10,%esp
    1f38:	39 de                	cmp    %ebx,%esi
    1f3a:	75 e4                	jne    1f20 <printint+0x60>
    putc(fd, buf[i]);
}
    1f3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f3f:	5b                   	pop    %ebx
    1f40:	5e                   	pop    %esi
    1f41:	5f                   	pop    %edi
    1f42:	5d                   	pop    %ebp
    1f43:	c3                   	ret    
    1f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1f48:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1f4f:	eb 90                	jmp    1ee1 <printint+0x21>
    1f51:	eb 0d                	jmp    1f60 <printf>
    1f53:	90                   	nop
    1f54:	90                   	nop
    1f55:	90                   	nop
    1f56:	90                   	nop
    1f57:	90                   	nop
    1f58:	90                   	nop
    1f59:	90                   	nop
    1f5a:	90                   	nop
    1f5b:	90                   	nop
    1f5c:	90                   	nop
    1f5d:	90                   	nop
    1f5e:	90                   	nop
    1f5f:	90                   	nop

00001f60 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1f60:	55                   	push   %ebp
    1f61:	89 e5                	mov    %esp,%ebp
    1f63:	57                   	push   %edi
    1f64:	56                   	push   %esi
    1f65:	53                   	push   %ebx
    1f66:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f69:	8b 75 0c             	mov    0xc(%ebp),%esi
    1f6c:	0f b6 1e             	movzbl (%esi),%ebx
    1f6f:	84 db                	test   %bl,%bl
    1f71:	0f 84 b3 00 00 00    	je     202a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    1f77:	8d 45 10             	lea    0x10(%ebp),%eax
    1f7a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    1f7d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    1f7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1f82:	eb 2f                	jmp    1fb3 <printf+0x53>
    1f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1f88:	83 f8 25             	cmp    $0x25,%eax
    1f8b:	0f 84 a7 00 00 00    	je     2038 <printf+0xd8>
  write(fd, &c, 1);
    1f91:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1f94:	83 ec 04             	sub    $0x4,%esp
    1f97:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1f9a:	6a 01                	push   $0x1
    1f9c:	50                   	push   %eax
    1f9d:	ff 75 08             	pushl  0x8(%ebp)
    1fa0:	e8 5d fe ff ff       	call   1e02 <write>
    1fa5:	83 c4 10             	add    $0x10,%esp
    1fa8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1fab:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1faf:	84 db                	test   %bl,%bl
    1fb1:	74 77                	je     202a <printf+0xca>
    if(state == 0){
    1fb3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1fb5:	0f be cb             	movsbl %bl,%ecx
    1fb8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1fbb:	74 cb                	je     1f88 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1fbd:	83 ff 25             	cmp    $0x25,%edi
    1fc0:	75 e6                	jne    1fa8 <printf+0x48>
      if(c == 'd'){
    1fc2:	83 f8 64             	cmp    $0x64,%eax
    1fc5:	0f 84 05 01 00 00    	je     20d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1fcb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1fd1:	83 f9 70             	cmp    $0x70,%ecx
    1fd4:	74 72                	je     2048 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1fd6:	83 f8 73             	cmp    $0x73,%eax
    1fd9:	0f 84 99 00 00 00    	je     2078 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1fdf:	83 f8 63             	cmp    $0x63,%eax
    1fe2:	0f 84 08 01 00 00    	je     20f0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1fe8:	83 f8 25             	cmp    $0x25,%eax
    1feb:	0f 84 ef 00 00 00    	je     20e0 <printf+0x180>
  write(fd, &c, 1);
    1ff1:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1ff4:	83 ec 04             	sub    $0x4,%esp
    1ff7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1ffb:	6a 01                	push   $0x1
    1ffd:	50                   	push   %eax
    1ffe:	ff 75 08             	pushl  0x8(%ebp)
    2001:	e8 fc fd ff ff       	call   1e02 <write>
    2006:	83 c4 0c             	add    $0xc,%esp
    2009:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    200c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    200f:	6a 01                	push   $0x1
    2011:	50                   	push   %eax
    2012:	ff 75 08             	pushl  0x8(%ebp)
    2015:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    2018:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    201a:	e8 e3 fd ff ff       	call   1e02 <write>
  for(i = 0; fmt[i]; i++){
    201f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    2023:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    2026:	84 db                	test   %bl,%bl
    2028:	75 89                	jne    1fb3 <printf+0x53>
    }
  }
}
    202a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    202d:	5b                   	pop    %ebx
    202e:	5e                   	pop    %esi
    202f:	5f                   	pop    %edi
    2030:	5d                   	pop    %ebp
    2031:	c3                   	ret    
    2032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    2038:	bf 25 00 00 00       	mov    $0x25,%edi
    203d:	e9 66 ff ff ff       	jmp    1fa8 <printf+0x48>
    2042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	b9 10 00 00 00       	mov    $0x10,%ecx
    2050:	6a 00                	push   $0x0
    2052:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    2055:	8b 45 08             	mov    0x8(%ebp),%eax
    2058:	8b 17                	mov    (%edi),%edx
    205a:	e8 61 fe ff ff       	call   1ec0 <printint>
        ap++;
    205f:	89 f8                	mov    %edi,%eax
    2061:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2064:	31 ff                	xor    %edi,%edi
        ap++;
    2066:	83 c0 04             	add    $0x4,%eax
    2069:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    206c:	e9 37 ff ff ff       	jmp    1fa8 <printf+0x48>
    2071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    2078:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    207b:	8b 08                	mov    (%eax),%ecx
        ap++;
    207d:	83 c0 04             	add    $0x4,%eax
    2080:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    2083:	85 c9                	test   %ecx,%ecx
    2085:	0f 84 8e 00 00 00    	je     2119 <printf+0x1b9>
        while(*s != 0){
    208b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    208e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    2090:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    2092:	84 c0                	test   %al,%al
    2094:	0f 84 0e ff ff ff    	je     1fa8 <printf+0x48>
    209a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    209d:	89 de                	mov    %ebx,%esi
    209f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    20a2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    20a5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    20a8:	83 ec 04             	sub    $0x4,%esp
          s++;
    20ab:	83 c6 01             	add    $0x1,%esi
    20ae:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    20b1:	6a 01                	push   $0x1
    20b3:	57                   	push   %edi
    20b4:	53                   	push   %ebx
    20b5:	e8 48 fd ff ff       	call   1e02 <write>
        while(*s != 0){
    20ba:	0f b6 06             	movzbl (%esi),%eax
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	84 c0                	test   %al,%al
    20c2:	75 e4                	jne    20a8 <printf+0x148>
    20c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    20c7:	31 ff                	xor    %edi,%edi
    20c9:	e9 da fe ff ff       	jmp    1fa8 <printf+0x48>
    20ce:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    20d0:	83 ec 0c             	sub    $0xc,%esp
    20d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    20d8:	6a 01                	push   $0x1
    20da:	e9 73 ff ff ff       	jmp    2052 <printf+0xf2>
    20df:	90                   	nop
  write(fd, &c, 1);
    20e0:	83 ec 04             	sub    $0x4,%esp
    20e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    20e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    20e9:	6a 01                	push   $0x1
    20eb:	e9 21 ff ff ff       	jmp    2011 <printf+0xb1>
        putc(fd, *ap);
    20f0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    20f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    20f6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    20f8:	6a 01                	push   $0x1
        ap++;
    20fa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    20fd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    2100:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2103:	50                   	push   %eax
    2104:	ff 75 08             	pushl  0x8(%ebp)
    2107:	e8 f6 fc ff ff       	call   1e02 <write>
        ap++;
    210c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    210f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2112:	31 ff                	xor    %edi,%edi
    2114:	e9 8f fe ff ff       	jmp    1fa8 <printf+0x48>
          s = "(null)";
    2119:	bb 34 2c 00 00       	mov    $0x2c34,%ebx
        while(*s != 0){
    211e:	b8 28 00 00 00       	mov    $0x28,%eax
    2123:	e9 72 ff ff ff       	jmp    209a <printf+0x13a>
    2128:	66 90                	xchg   %ax,%ax
    212a:	66 90                	xchg   %ax,%ax
    212c:	66 90                	xchg   %ax,%ax
    212e:	66 90                	xchg   %ax,%ax

00002130 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2130:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2131:	a1 00 34 00 00       	mov    0x3400,%eax
{
    2136:	89 e5                	mov    %esp,%ebp
    2138:	57                   	push   %edi
    2139:	56                   	push   %esi
    213a:	53                   	push   %ebx
    213b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    213e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    2141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2148:	39 c8                	cmp    %ecx,%eax
    214a:	8b 10                	mov    (%eax),%edx
    214c:	73 32                	jae    2180 <free+0x50>
    214e:	39 d1                	cmp    %edx,%ecx
    2150:	72 04                	jb     2156 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2152:	39 d0                	cmp    %edx,%eax
    2154:	72 32                	jb     2188 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2156:	8b 73 fc             	mov    -0x4(%ebx),%esi
    2159:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    215c:	39 fa                	cmp    %edi,%edx
    215e:	74 30                	je     2190 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    2160:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    2163:	8b 50 04             	mov    0x4(%eax),%edx
    2166:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2169:	39 f1                	cmp    %esi,%ecx
    216b:	74 3a                	je     21a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    216d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    216f:	a3 00 34 00 00       	mov    %eax,0x3400
}
    2174:	5b                   	pop    %ebx
    2175:	5e                   	pop    %esi
    2176:	5f                   	pop    %edi
    2177:	5d                   	pop    %ebp
    2178:	c3                   	ret    
    2179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2180:	39 d0                	cmp    %edx,%eax
    2182:	72 04                	jb     2188 <free+0x58>
    2184:	39 d1                	cmp    %edx,%ecx
    2186:	72 ce                	jb     2156 <free+0x26>
{
    2188:	89 d0                	mov    %edx,%eax
    218a:	eb bc                	jmp    2148 <free+0x18>
    218c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    2190:	03 72 04             	add    0x4(%edx),%esi
    2193:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2196:	8b 10                	mov    (%eax),%edx
    2198:	8b 12                	mov    (%edx),%edx
    219a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    219d:	8b 50 04             	mov    0x4(%eax),%edx
    21a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    21a3:	39 f1                	cmp    %esi,%ecx
    21a5:	75 c6                	jne    216d <free+0x3d>
    p->s.size += bp->s.size;
    21a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    21aa:	a3 00 34 00 00       	mov    %eax,0x3400
    p->s.size += bp->s.size;
    21af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    21b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    21b5:	89 10                	mov    %edx,(%eax)
}
    21b7:	5b                   	pop    %ebx
    21b8:	5e                   	pop    %esi
    21b9:	5f                   	pop    %edi
    21ba:	5d                   	pop    %ebp
    21bb:	c3                   	ret    
    21bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000021c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    21c0:	55                   	push   %ebp
    21c1:	89 e5                	mov    %esp,%ebp
    21c3:	57                   	push   %edi
    21c4:	56                   	push   %esi
    21c5:	53                   	push   %ebx
    21c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    21cc:	8b 15 00 34 00 00    	mov    0x3400,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    21d2:	8d 78 07             	lea    0x7(%eax),%edi
    21d5:	c1 ef 03             	shr    $0x3,%edi
    21d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    21db:	85 d2                	test   %edx,%edx
    21dd:	0f 84 9d 00 00 00    	je     2280 <malloc+0xc0>
    21e3:	8b 02                	mov    (%edx),%eax
    21e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    21e8:	39 cf                	cmp    %ecx,%edi
    21ea:	76 6c                	jbe    2258 <malloc+0x98>
    21ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    21f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    21f7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    21fa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    2201:	eb 0e                	jmp    2211 <malloc+0x51>
    2203:	90                   	nop
    2204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2208:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    220a:	8b 48 04             	mov    0x4(%eax),%ecx
    220d:	39 f9                	cmp    %edi,%ecx
    220f:	73 47                	jae    2258 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    2211:	39 05 00 34 00 00    	cmp    %eax,0x3400
    2217:	89 c2                	mov    %eax,%edx
    2219:	75 ed                	jne    2208 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    221b:	83 ec 0c             	sub    $0xc,%esp
    221e:	56                   	push   %esi
    221f:	e8 46 fc ff ff       	call   1e6a <sbrk>
  if(p == (char*)-1)
    2224:	83 c4 10             	add    $0x10,%esp
    2227:	83 f8 ff             	cmp    $0xffffffff,%eax
    222a:	74 1c                	je     2248 <malloc+0x88>
  hp->s.size = nu;
    222c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    222f:	83 ec 0c             	sub    $0xc,%esp
    2232:	83 c0 08             	add    $0x8,%eax
    2235:	50                   	push   %eax
    2236:	e8 f5 fe ff ff       	call   2130 <free>
  return freep;
    223b:	8b 15 00 34 00 00    	mov    0x3400,%edx
      if((p = morecore(nunits)) == 0)
    2241:	83 c4 10             	add    $0x10,%esp
    2244:	85 d2                	test   %edx,%edx
    2246:	75 c0                	jne    2208 <malloc+0x48>
        return 0;
  }
}
    2248:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    224b:	31 c0                	xor    %eax,%eax
}
    224d:	5b                   	pop    %ebx
    224e:	5e                   	pop    %esi
    224f:	5f                   	pop    %edi
    2250:	5d                   	pop    %ebp
    2251:	c3                   	ret    
    2252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    2258:	39 cf                	cmp    %ecx,%edi
    225a:	74 54                	je     22b0 <malloc+0xf0>
        p->s.size -= nunits;
    225c:	29 f9                	sub    %edi,%ecx
    225e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    2261:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    2264:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    2267:	89 15 00 34 00 00    	mov    %edx,0x3400
}
    226d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    2270:	83 c0 08             	add    $0x8,%eax
}
    2273:	5b                   	pop    %ebx
    2274:	5e                   	pop    %esi
    2275:	5f                   	pop    %edi
    2276:	5d                   	pop    %ebp
    2277:	c3                   	ret    
    2278:	90                   	nop
    2279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    2280:	c7 05 00 34 00 00 04 	movl   $0x3404,0x3400
    2287:	34 00 00 
    228a:	c7 05 04 34 00 00 04 	movl   $0x3404,0x3404
    2291:	34 00 00 
    base.s.size = 0;
    2294:	b8 04 34 00 00       	mov    $0x3404,%eax
    2299:	c7 05 08 34 00 00 00 	movl   $0x0,0x3408
    22a0:	00 00 00 
    22a3:	e9 44 ff ff ff       	jmp    21ec <malloc+0x2c>
    22a8:	90                   	nop
    22a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    22b0:	8b 08                	mov    (%eax),%ecx
    22b2:	89 0a                	mov    %ecx,(%edx)
    22b4:	eb b1                	jmp    2267 <malloc+0xa7>
