
_copy_on_write_large_plus_alloc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "pagingtestlib.h"

int main(void) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
    setup();
       f:	e8 ac 00 00 00       	call   c0 <setup>
    printf(1,"TEST:EXPECTCOUNT:8\n");
      14:	83 ec 08             	sub    $0x8,%esp
      17:	68 4a 23 00 00       	push   $0x234a
      1c:	6a 01                	push   $0x1
      1e:	e8 ed 1e 00 00       	call   1f10 <printf>
    char *p = sbrk(500 * 1024 * 1024);
      23:	c7 04 24 00 00 40 1f 	movl   $0x1f400000,(%esp)
      2a:	e8 eb 1d 00 00       	call   1e1a <sbrk>
    p[250 * 1024 * 1024] = 'A';
      2f:	c6 80 00 00 a0 0f 41 	movb   $0x41,0xfa00000(%eax)
    int pid = fork();
      36:	e8 4f 1d 00 00       	call   1d8a <fork>
    if (pid == 0) {
      3b:	83 c4 10             	add    $0x10,%esp
      3e:	85 c0                	test   %eax,%eax
      40:	74 25                	je     67 <main+0x67>
        for (int i = 0; i < 7; ++i) {
            test_copy_on_write(100 * 1024 * 1024, "100MB", 12);
        }
        exit();
    } else {
        wait();
      42:	e8 53 1d 00 00       	call   1d9a <wait>
        printf(1, PASS_MSG "\n");
      47:	83 ec 08             	sub    $0x8,%esp
      4a:	68 b8 22 00 00       	push   $0x22b8
      4f:	6a 01                	push   $0x1
      51:	e8 ba 1e 00 00       	call   1f10 <printf>
        shutdown();
      56:	e8 df 1d 00 00       	call   1e3a <shutdown>
    }
}
      5b:	8d 65 f8             	lea    -0x8(%ebp),%esp
      5e:	31 c0                	xor    %eax,%eax
      60:	59                   	pop    %ecx
      61:	5b                   	pop    %ebx
      62:	5d                   	pop    %ebp
      63:	8d 61 fc             	lea    -0x4(%ecx),%esp
      66:	c3                   	ret    
      67:	bb 07 00 00 00       	mov    $0x7,%ebx
  }
  return 0;
}

int test_copy_on_write(int size, const char *describe_size, int forks) {
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
      6c:	50                   	push   %eax
      6d:	68 5d 23 00 00       	push   $0x235d
      72:	6a 00                	push   $0x0
      74:	6a 00                	push   $0x0
      76:	6a 00                	push   $0x0
      78:	6a 0c                	push   $0xc
      7a:	68 5e 23 00 00       	push   $0x235e
      7f:	68 00 00 40 06       	push   $0x6400000
      84:	e8 57 11 00 00       	call   11e0 <_test_copy_on_write>
        for (int i = 0; i < 7; ++i) {
      89:	83 c4 20             	add    $0x20,%esp
      8c:	83 eb 01             	sub    $0x1,%ebx
      8f:	75 db                	jne    6c <main+0x6c>
        exit();
      91:	e8 fc 1c 00 00       	call   1d92 <exit>
      96:	66 90                	xchg   %ax,%ax
      98:	66 90                	xchg   %ax,%ax
      9a:	66 90                	xchg   %ax,%ax
      9c:	66 90                	xchg   %ax,%ax
      9e:	66 90                	xchg   %ax,%ax

000000a0 <test_out_of_bounds_internal>:
void test_out_of_bounds_internal() {
      a0:	55                   	push   %ebp
      a1:	89 e5                	mov    %esp,%ebp
      a3:	83 ec 14             	sub    $0x14,%esp
    volatile char *end_of_heap = sbrk(0);
      a6:	6a 00                	push   $0x0
      a8:	e8 6d 1d 00 00       	call   1e1a <sbrk>
    (void) end_of_heap[out_of_bounds_offset];
      ad:	03 05 e4 31 00 00    	add    0x31e4,%eax
}
      b3:	83 c4 10             	add    $0x10,%esp
    (void) end_of_heap[out_of_bounds_offset];
      b6:	0f b6 00             	movzbl (%eax),%eax
}
      b9:	c9                   	leave  
      ba:	c3                   	ret    
      bb:	90                   	nop
      bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <setup>:
void setup() {
      c0:	55                   	push   %ebp
      c1:	89 e5                	mov    %esp,%ebp
      c3:	83 ec 0c             	sub    $0xc,%esp
    mknod("console", 1, 1);
      c6:	6a 01                	push   $0x1
      c8:	6a 01                	push   $0x1
      ca:	68 68 22 00 00       	push   $0x2268
      cf:	e8 06 1d 00 00       	call   1dda <mknod>
    open("console", O_RDWR);
      d4:	58                   	pop    %eax
      d5:	5a                   	pop    %edx
      d6:	6a 02                	push   $0x2
      d8:	68 68 22 00 00       	push   $0x2268
      dd:	e8 f0 1c 00 00       	call   1dd2 <open>
    dup(0);
      e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      e9:	e8 1c 1d 00 00       	call   1e0a <dup>
    dup(0);
      ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      f5:	e8 10 1d 00 00       	call   1e0a <dup>
}
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	c9                   	leave  
      fe:	c3                   	ret    
      ff:	90                   	nop

00000100 <test_simple_crash_no_fork>:
void test_simple_crash_no_fork(void (*test_func)(), const char *no_crash_message) {
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	83 ec 08             	sub    $0x8,%esp
    test_func();
     106:	ff 55 08             	call   *0x8(%ebp)
    printf(1, "%s\n", no_crash_message);
     109:	83 ec 04             	sub    $0x4,%esp
     10c:	ff 75 0c             	pushl  0xc(%ebp)
     10f:	68 70 22 00 00       	push   $0x2270
     114:	6a 01                	push   $0x1
     116:	e8 f5 1d 00 00       	call   1f10 <printf>
}
     11b:	83 c4 10             	add    $0x10,%esp
     11e:	c9                   	leave  
     11f:	c3                   	ret    

00000120 <test_simple_crash>:
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	53                   	push   %ebx
    pipe(fds);
     124:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
     127:	83 ec 20             	sub    $0x20,%esp
    pipe(fds);
     12a:	50                   	push   %eax
     12b:	e8 72 1c 00 00       	call   1da2 <pipe>
    int pid = fork();
     130:	e8 55 1c 00 00       	call   1d8a <fork>
    if (pid == 0) {
     135:	83 c4 10             	add    $0x10,%esp
     138:	85 c0                	test   %eax,%eax
     13a:	74 70                	je     1ac <test_simple_crash+0x8c>
        close(fds[1]);
     13c:	83 ec 0c             	sub    $0xc,%esp
     13f:	ff 75 f4             	pushl  -0xc(%ebp)
     142:	e8 73 1c 00 00       	call   1dba <close>
        int size = read(fds[0], text, 1);
     147:	8d 45 ef             	lea    -0x11(%ebp),%eax
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	6a 01                	push   $0x1
     14f:	50                   	push   %eax
     150:	ff 75 f0             	pushl  -0x10(%ebp)
     153:	e8 52 1c 00 00       	call   1daa <read>
     158:	89 c3                	mov    %eax,%ebx
        wait();
     15a:	e8 3b 1c 00 00       	call   1d9a <wait>
        close(fds[0]);
     15f:	58                   	pop    %eax
     160:	ff 75 f0             	pushl  -0x10(%ebp)
     163:	e8 52 1c 00 00       	call   1dba <close>
        if (size == 1) {
     168:	83 c4 10             	add    $0x10,%esp
     16b:	83 fb 01             	cmp    $0x1,%ebx
     16e:	74 20                	je     190 <test_simple_crash+0x70>
            printf(1, "%s\n", crash_message);
     170:	83 ec 04             	sub    $0x4,%esp
     173:	ff 75 0c             	pushl  0xc(%ebp)
     176:	68 70 22 00 00       	push   $0x2270
     17b:	6a 01                	push   $0x1
     17d:	e8 8e 1d 00 00       	call   1f10 <printf>
            return 1;
     182:	83 c4 10             	add    $0x10,%esp
     185:	b8 01 00 00 00       	mov    $0x1,%eax
}
     18a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     18d:	c9                   	leave  
     18e:	c3                   	ret    
     18f:	90                   	nop
            printf(1, "%s\n", no_crash_message);
     190:	83 ec 04             	sub    $0x4,%esp
     193:	ff 75 10             	pushl  0x10(%ebp)
     196:	68 70 22 00 00       	push   $0x2270
     19b:	6a 01                	push   $0x1
     19d:	e8 6e 1d 00 00       	call   1f10 <printf>
            return 0;
     1a2:	83 c4 10             	add    $0x10,%esp
     1a5:	31 c0                	xor    %eax,%eax
}
     1a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1aa:	c9                   	leave  
     1ab:	c3                   	ret    
        close(1);
     1ac:	83 ec 0c             	sub    $0xc,%esp
     1af:	6a 01                	push   $0x1
     1b1:	e8 04 1c 00 00       	call   1dba <close>
        dup(fds[1]);
     1b6:	5a                   	pop    %edx
     1b7:	ff 75 f4             	pushl  -0xc(%ebp)
     1ba:	e8 4b 1c 00 00       	call   1e0a <dup>
        test_func();
     1bf:	ff 55 08             	call   *0x8(%ebp)
        write(1, "X", 1);
     1c2:	83 c4 0c             	add    $0xc,%esp
     1c5:	6a 01                	push   $0x1
     1c7:	68 74 22 00 00       	push   $0x2274
     1cc:	6a 01                	push   $0x1
     1ce:	e8 df 1b 00 00       	call   1db2 <write>
        exit();
     1d3:	e8 ba 1b 00 00       	call   1d92 <exit>
     1d8:	90                   	nop
     1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <test_out_of_bounds_fork>:
int test_out_of_bounds_fork(int offset, const char *crash_message, const char *no_crash_message) {
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
    out_of_bounds_offset = offset;
     1e3:	8b 45 08             	mov    0x8(%ebp),%eax
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     1e6:	c7 45 08 a0 00 00 00 	movl   $0xa0,0x8(%ebp)
}
     1ed:	5d                   	pop    %ebp
    out_of_bounds_offset = offset;
     1ee:	a3 e4 31 00 00       	mov    %eax,0x31e4
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     1f3:	e9 28 ff ff ff       	jmp    120 <test_simple_crash>
     1f8:	90                   	nop
     1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <test_out_of_bounds_no_fork>:
void test_out_of_bounds_no_fork(int offset, const char *no_crash_message) {
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 08             	sub    $0x8,%esp
    out_of_bounds_offset = offset;
     206:	8b 45 08             	mov    0x8(%ebp),%eax
     209:	a3 e4 31 00 00       	mov    %eax,0x31e4
    test_func();
     20e:	e8 8d fe ff ff       	call   a0 <test_out_of_bounds_internal>
    printf(1, "%s\n", no_crash_message);
     213:	83 ec 04             	sub    $0x4,%esp
     216:	ff 75 0c             	pushl  0xc(%ebp)
     219:	68 70 22 00 00       	push   $0x2270
     21e:	6a 01                	push   $0x1
     220:	e8 eb 1c 00 00       	call   1f10 <printf>
}
     225:	83 c4 10             	add    $0x10,%esp
     228:	c9                   	leave  
     229:	c3                   	ret    
     22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000230 <test_allocation_no_fork>:
int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	57                   	push   %edi
     234:	56                   	push   %esi
     235:	53                   	push   %ebx
     236:	83 ec 28             	sub    $0x28,%esp
     239:	8b 75 08             	mov    0x8(%ebp),%esi
     23c:	8b 5d 24             	mov    0x24(%ebp),%ebx
    char *old_end_of_heap = sbrk(size);
     23f:	56                   	push   %esi
     240:	e8 d5 1b 00 00       	call   1e1a <sbrk>
     245:	89 c7                	mov    %eax,%edi
    char *new_end_of_heap = sbrk(0);
     247:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     24e:	e8 c7 1b 00 00       	call   1e1a <sbrk>
    if (old_end_of_heap == (char*) -1) {
     253:	83 c4 10             	add    $0x10,%esp
     256:	83 ff ff             	cmp    $0xffffffff,%edi
     259:	0f 84 21 01 00 00    	je     380 <test_allocation_no_fork+0x150>
    } else if (new_end_of_heap - old_end_of_heap != size) {
     25f:	29 f8                	sub    %edi,%eax
     261:	39 f0                	cmp    %esi,%eax
     263:	0f 85 d7 00 00 00    	jne    340 <test_allocation_no_fork+0x110>
        char *place_one = &old_end_of_heap[offset1];
     269:	8b 75 14             	mov    0x14(%ebp),%esi
        char *place_two = &old_end_of_heap[offset2];
     26c:	8b 45 1c             	mov    0x1c(%ebp),%eax
        char *place_one = &old_end_of_heap[offset1];
     26f:	01 fe                	add    %edi,%esi
        char *place_two = &old_end_of_heap[offset2];
     271:	01 f8                	add    %edi,%eax
        for (i = 0; i < count1; ++i) {
     273:	8b 7d 18             	mov    0x18(%ebp),%edi
     276:	85 ff                	test   %edi,%edi
     278:	0f 8e 22 01 00 00    	jle    3a0 <test_allocation_no_fork+0x170>
     27e:	8b 7d 18             	mov    0x18(%ebp),%edi
     281:	89 f1                	mov    %esi,%ecx
        int failed = 0;
     283:	31 d2                	xor    %edx,%edx
                failed = 1;
     285:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     288:	01 f7                	add    %esi,%edi
     28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            if (check_zero && place_one[i] != '\0') {
     290:	85 db                	test   %ebx,%ebx
     292:	74 0b                	je     29f <test_allocation_no_fork+0x6f>
                failed = 1;
     294:	80 39 00             	cmpb   $0x0,(%ecx)
     297:	b8 01 00 00 00       	mov    $0x1,%eax
     29c:	0f 45 d0             	cmovne %eax,%edx
            place_one[i] = 'A';
     29f:	c6 01 41             	movb   $0x41,(%ecx)
     2a2:	83 c1 01             	add    $0x1,%ecx
        for (i = 0; i < count1; ++i) {
     2a5:	39 cf                	cmp    %ecx,%edi
     2a7:	75 e7                	jne    290 <test_allocation_no_fork+0x60>
        for (i = 0; i < count2; ++i) {
     2a9:	8b 7d 20             	mov    0x20(%ebp),%edi
     2ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2af:	85 ff                	test   %edi,%edi
     2b1:	7e 2d                	jle    2e0 <test_allocation_no_fork+0xb0>
                failed = 1;
     2b3:	89 75 e4             	mov    %esi,-0x1c(%ebp)
     2b6:	8b 75 20             	mov    0x20(%ebp),%esi
        int failed = 0;
     2b9:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     2bb:	bf 01 00 00 00       	mov    $0x1,%edi
            if (check_zero && place_two[i] != '\0') {
     2c0:	85 db                	test   %ebx,%ebx
     2c2:	74 07                	je     2cb <test_allocation_no_fork+0x9b>
                failed = 1;
     2c4:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     2c8:	0f 45 d7             	cmovne %edi,%edx
            place_two[i] = 'B';
     2cb:	c6 04 08 42          	movb   $0x42,(%eax,%ecx,1)
        for (i = 0; i < count2; ++i) {
     2cf:	83 c1 01             	add    $0x1,%ecx
     2d2:	39 ce                	cmp    %ecx,%esi
     2d4:	7f ea                	jg     2c0 <test_allocation_no_fork+0x90>
        for (i = 0; i < count1; ++i) {
     2d6:	8b 5d 18             	mov    0x18(%ebp),%ebx
     2d9:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     2dc:	85 db                	test   %ebx,%ebx
     2de:	7e 25                	jle    305 <test_allocation_no_fork+0xd5>
                failed = 1;
     2e0:	8b 7d 18             	mov    0x18(%ebp),%edi
                failed = 1;
     2e3:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     2e5:	bb 01 00 00 00       	mov    $0x1,%ebx
     2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     2f0:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     2f4:	0f 45 d3             	cmovne %ebx,%edx
        for (i = 0; i < count1; ++i) {
     2f7:	83 c1 01             	add    $0x1,%ecx
     2fa:	39 cf                	cmp    %ecx,%edi
     2fc:	7f f2                	jg     2f0 <test_allocation_no_fork+0xc0>
        for (i = 0; i < count2; ++i) {
     2fe:	8b 4d 20             	mov    0x20(%ebp),%ecx
     301:	85 c9                	test   %ecx,%ecx
     303:	7e 18                	jle    31d <test_allocation_no_fork+0xed>
     305:	8b 4d 20             	mov    0x20(%ebp),%ecx
                failed = 1;
     308:	bb 01 00 00 00       	mov    $0x1,%ebx
     30d:	01 c1                	add    %eax,%ecx
     30f:	90                   	nop
     310:	80 38 42             	cmpb   $0x42,(%eax)
     313:	0f 45 d3             	cmovne %ebx,%edx
     316:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     319:	39 c8                	cmp    %ecx,%eax
     31b:	75 f3                	jne    310 <test_allocation_no_fork+0xe0>
        if (failed) {
     31d:	85 d2                	test   %edx,%edx
     31f:	75 3f                	jne    360 <test_allocation_no_fork+0x130>
            printf(1, PASS_MSG "\n");
     321:	83 ec 08             	sub    $0x8,%esp
     324:	68 b8 22 00 00       	push   $0x22b8
     329:	6a 01                	push   $0x1
     32b:	e8 e0 1b 00 00       	call   1f10 <printf>
            return 1;
     330:	83 c4 10             	add    $0x10,%esp
}
     333:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 1;
     336:	b8 01 00 00 00       	mov    $0x1,%eax
}
     33b:	5b                   	pop    %ebx
     33c:	5e                   	pop    %esi
     33d:	5f                   	pop    %edi
     33e:	5d                   	pop    %ebp
     33f:	c3                   	ret    
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     340:	83 ec 08             	sub    $0x8,%esp
     343:	68 8c 22 00 00       	push   $0x228c
     348:	6a 01                	push   $0x1
     34a:	e8 c1 1b 00 00       	call   1f10 <printf>
        return 0;
     34f:	83 c4 10             	add    $0x10,%esp
}
     352:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     355:	31 c0                	xor    %eax,%eax
}
     357:	5b                   	pop    %ebx
     358:	5e                   	pop    %esi
     359:	5f                   	pop    %edi
     35a:	5d                   	pop    %ebp
     35b:	c3                   	ret    
     35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, FAIL_MSG "HEAP_VALUES\n");
     360:	83 ec 08             	sub    $0x8,%esp
     363:	68 a1 22 00 00       	push   $0x22a1
     368:	6a 01                	push   $0x1
     36a:	e8 a1 1b 00 00       	call   1f10 <printf>
            return 0;
     36f:	83 c4 10             	add    $0x10,%esp
}
     372:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 0;
     375:	31 c0                	xor    %eax,%eax
}
     377:	5b                   	pop    %ebx
     378:	5e                   	pop    %esi
     379:	5f                   	pop    %edi
     37a:	5d                   	pop    %ebp
     37b:	c3                   	ret    
     37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     380:	83 ec 08             	sub    $0x8,%esp
     383:	68 76 22 00 00       	push   $0x2276
     388:	6a 01                	push   $0x1
     38a:	e8 81 1b 00 00       	call   1f10 <printf>
        return 0;
     38f:	83 c4 10             	add    $0x10,%esp
}
     392:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     395:	31 c0                	xor    %eax,%eax
}
     397:	5b                   	pop    %ebx
     398:	5e                   	pop    %esi
     399:	5f                   	pop    %edi
     39a:	5d                   	pop    %ebp
     39b:	c3                   	ret    
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (i = 0; i < count2; ++i) {
     3a0:	8b 4d 20             	mov    0x20(%ebp),%ecx
        int failed = 0;
     3a3:	31 d2                	xor    %edx,%edx
        for (i = 0; i < count2; ++i) {
     3a5:	85 c9                	test   %ecx,%ecx
     3a7:	0f 8f 06 ff ff ff    	jg     2b3 <test_allocation_no_fork+0x83>
     3ad:	e9 6f ff ff ff       	jmp    321 <test_allocation_no_fork+0xf1>
     3b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <test_allocation_then_fork>:
void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	57                   	push   %edi
     3c4:	56                   	push   %esi
     3c5:	53                   	push   %ebx
     3c6:	83 ec 28             	sub    $0x28,%esp
     3c9:	8b 45 14             	mov    0x14(%ebp),%eax
     3cc:	8b 7d 08             	mov    0x8(%ebp),%edi
     3cf:	8b 5d 24             	mov    0x24(%ebp),%ebx
     3d2:	89 45 dc             	mov    %eax,-0x24(%ebp)
     3d5:	8b 45 18             	mov    0x18(%ebp),%eax
    char *old_end_of_heap = sbrk(size);
     3d8:	57                   	push   %edi
void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     3d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     3dc:	8b 45 1c             	mov    0x1c(%ebp),%eax
     3df:	89 45 d8             	mov    %eax,-0x28(%ebp)
     3e2:	8b 45 20             	mov    0x20(%ebp),%eax
     3e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    char *old_end_of_heap = sbrk(size);
     3e8:	e8 2d 1a 00 00       	call   1e1a <sbrk>
     3ed:	89 c6                	mov    %eax,%esi
    char *new_end_of_heap = sbrk(0);
     3ef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3f6:	e8 1f 1a 00 00       	call   1e1a <sbrk>
    if (old_end_of_heap == (char*) -1) {
     3fb:	83 c4 10             	add    $0x10,%esp
     3fe:	83 fe ff             	cmp    $0xffffffff,%esi
     401:	0f 84 a9 00 00 00    	je     4b0 <test_allocation_then_fork+0xf0>
    } else if (new_end_of_heap - old_end_of_heap != size) {
     407:	29 f0                	sub    %esi,%eax
     409:	39 f8                	cmp    %edi,%eax
     40b:	0f 85 7f 00 00 00    	jne    490 <test_allocation_then_fork+0xd0>
        char *place_one = &old_end_of_heap[offset1];
     411:	8b 7d dc             	mov    -0x24(%ebp),%edi
        for (i = 0; i < count1; ++i) {
     414:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
        char *place_one = &old_end_of_heap[offset1];
     417:	01 f7                	add    %esi,%edi
        char *place_two = &old_end_of_heap[offset2];
     419:	03 75 d8             	add    -0x28(%ebp),%esi
        for (i = 0; i < count1; ++i) {
     41c:	85 c9                	test   %ecx,%ecx
        char *place_two = &old_end_of_heap[offset2];
     41e:	89 75 dc             	mov    %esi,-0x24(%ebp)
        for (i = 0; i < count1; ++i) {
     421:	0f 8e 99 00 00 00    	jle    4c0 <test_allocation_then_fork+0x100>
     427:	8d 14 39             	lea    (%ecx,%edi,1),%edx
     42a:	89 f8                	mov    %edi,%eax
        int failed = 0;
     42c:	31 f6                	xor    %esi,%esi
                failed = 1;
     42e:	b9 01 00 00 00       	mov    $0x1,%ecx
     433:	90                   	nop
     434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (check_zero && place_one[i] != '\0') {
     438:	85 db                	test   %ebx,%ebx
     43a:	74 06                	je     442 <test_allocation_then_fork+0x82>
                failed = 1;
     43c:	80 38 00             	cmpb   $0x0,(%eax)
     43f:	0f 45 f1             	cmovne %ecx,%esi
            place_one[i] = 'A';
     442:	c6 00 41             	movb   $0x41,(%eax)
     445:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count1; ++i) {
     448:	39 d0                	cmp    %edx,%eax
     44a:	75 ec                	jne    438 <test_allocation_then_fork+0x78>
        for (i = 0; i < count2; ++i) {
     44c:	8b 55 e0             	mov    -0x20(%ebp),%edx
     44f:	85 d2                	test   %edx,%edx
     451:	7e 21                	jle    474 <test_allocation_then_fork+0xb4>
     453:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     456:	89 c8                	mov    %ecx,%eax
     458:	01 ca                	add    %ecx,%edx
                failed = 1;
     45a:	b9 01 00 00 00       	mov    $0x1,%ecx
     45f:	90                   	nop
            if (check_zero && place_two[i] != '\0') {
     460:	85 db                	test   %ebx,%ebx
     462:	74 06                	je     46a <test_allocation_then_fork+0xaa>
                failed = 1;
     464:	80 38 00             	cmpb   $0x0,(%eax)
     467:	0f 45 f1             	cmovne %ecx,%esi
            place_two[i] = 'B';
     46a:	c6 00 42             	movb   $0x42,(%eax)
     46d:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     470:	39 d0                	cmp    %edx,%eax
     472:	75 ec                	jne    460 <test_allocation_then_fork+0xa0>
        int pid = fork();
     474:	e8 11 19 00 00       	call   1d8a <fork>
        if (pid == 0) {
     479:	85 c0                	test   %eax,%eax
     47b:	74 47                	je     4c4 <test_allocation_then_fork+0x104>
}
     47d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     480:	5b                   	pop    %ebx
     481:	5e                   	pop    %esi
     482:	5f                   	pop    %edi
     483:	5d                   	pop    %ebp
            wait();
     484:	e9 11 19 00 00       	jmp    1d9a <wait>
     489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     490:	c7 45 0c 8c 22 00 00 	movl   $0x228c,0xc(%ebp)
     497:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     49e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4a1:	5b                   	pop    %ebx
     4a2:	5e                   	pop    %esi
     4a3:	5f                   	pop    %edi
     4a4:	5d                   	pop    %ebp
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     4a5:	e9 66 1a 00 00       	jmp    1f10 <printf>
     4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     4b0:	c7 45 0c 76 22 00 00 	movl   $0x2276,0xc(%ebp)
     4b7:	eb de                	jmp    497 <test_allocation_then_fork+0xd7>
     4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        int failed = 0;
     4c0:	31 f6                	xor    %esi,%esi
     4c2:	eb 88                	jmp    44c <test_allocation_then_fork+0x8c>
            for (i = 0; i < count1; ++i) {
     4c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     4c7:	85 c0                	test   %eax,%eax
     4c9:	7e 14                	jle    4df <test_allocation_then_fork+0x11f>
     4cb:	01 f8                	add    %edi,%eax
                    failed = 1;
     4cd:	ba 01 00 00 00       	mov    $0x1,%edx
     4d2:	80 3f 41             	cmpb   $0x41,(%edi)
     4d5:	0f 45 f2             	cmovne %edx,%esi
     4d8:	83 c7 01             	add    $0x1,%edi
            for (i = 0; i < count1; ++i) {
     4db:	39 c7                	cmp    %eax,%edi
     4dd:	75 f3                	jne    4d2 <test_allocation_then_fork+0x112>
            for (i = 0; i < count2; ++i) {
     4df:	8b 45 e0             	mov    -0x20(%ebp),%eax
     4e2:	85 c0                	test   %eax,%eax
     4e4:	7e 17                	jle    4fd <test_allocation_then_fork+0x13d>
     4e6:	8b 55 dc             	mov    -0x24(%ebp),%edx
                    failed = 1;
     4e9:	b9 01 00 00 00       	mov    $0x1,%ecx
     4ee:	01 d0                	add    %edx,%eax
     4f0:	80 3a 42             	cmpb   $0x42,(%edx)
     4f3:	0f 45 f1             	cmovne %ecx,%esi
     4f6:	83 c2 01             	add    $0x1,%edx
            for (i = 0; i < count2; ++i) {
     4f9:	39 d0                	cmp    %edx,%eax
     4fb:	75 f3                	jne    4f0 <test_allocation_then_fork+0x130>
            if (failed) {
     4fd:	85 f6                	test   %esi,%esi
     4ff:	74 16                	je     517 <test_allocation_then_fork+0x157>
                printf(1, FAIL_MSG "HEAP_VALUES\n");
     501:	52                   	push   %edx
     502:	52                   	push   %edx
     503:	68 a1 22 00 00       	push   $0x22a1
     508:	6a 01                	push   $0x1
     50a:	e8 01 1a 00 00       	call   1f10 <printf>
     50f:	83 c4 10             	add    $0x10,%esp
            exit();
     512:	e8 7b 18 00 00       	call   1d92 <exit>
                printf(1, PASS_MSG "\n");
     517:	50                   	push   %eax
     518:	50                   	push   %eax
     519:	68 b8 22 00 00       	push   $0x22b8
     51e:	6a 01                	push   $0x1
     520:	e8 eb 19 00 00       	call   1f10 <printf>
     525:	83 c4 10             	add    $0x10,%esp
     528:	eb e8                	jmp    512 <test_allocation_then_fork+0x152>
     52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <test_allocation_fork>:
int test_allocation_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2) {
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	57                   	push   %edi
     534:	56                   	push   %esi
     535:	53                   	push   %ebx
     536:	83 ec 2c             	sub    $0x2c,%esp
     539:	8b 75 0c             	mov    0xc(%ebp),%esi
     53c:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     53f:	57                   	push   %edi
     540:	56                   	push   %esi
     541:	68 64 23 00 00       	push   $0x2364
     546:	6a 01                	push   $0x1
     548:	e8 c3 19 00 00       	call   1f10 <printf>
    pipe(fds);
     54d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     550:	89 04 24             	mov    %eax,(%esp)
     553:	e8 4a 18 00 00       	call   1da2 <pipe>
    int pid = fork();
     558:	e8 2d 18 00 00       	call   1d8a <fork>
    if (pid == 0) {
     55d:	83 c4 10             	add    $0x10,%esp
     560:	83 f8 00             	cmp    $0x0,%eax
     563:	0f 84 99 01 00 00    	je     702 <test_allocation_fork+0x1d2>
    } else if (pid > 0) {
     569:	0f 8e b9 00 00 00    	jle    628 <test_allocation_fork+0xf8>
        close(fds[1]);
     56f:	83 ec 0c             	sub    $0xc,%esp
     572:	ff 75 d8             	pushl  -0x28(%ebp)
     575:	e8 40 18 00 00       	call   1dba <close>
        int size = read(fds[0], text, 10);
     57a:	8d 45 de             	lea    -0x22(%ebp),%eax
     57d:	83 c4 0c             	add    $0xc,%esp
     580:	6a 0a                	push   $0xa
     582:	50                   	push   %eax
     583:	ff 75 d4             	pushl  -0x2c(%ebp)
     586:	e8 1f 18 00 00       	call   1daa <read>
     58b:	89 c3                	mov    %eax,%ebx
        wait();
     58d:	e8 08 18 00 00       	call   1d9a <wait>
        close(fds[0]);
     592:	58                   	pop    %eax
     593:	ff 75 d4             	pushl  -0x2c(%ebp)
     596:	e8 1f 18 00 00       	call   1dba <close>
        if (size == 2 && text[0] == 'N') {
     59b:	83 c4 10             	add    $0x10,%esp
     59e:	83 fb 02             	cmp    $0x2,%ebx
     5a1:	74 3d                	je     5e0 <test_allocation_fork+0xb0>
        } else if (size == 0) {
     5a3:	83 fb 00             	cmp    $0x0,%ebx
     5a6:	0f 84 a4 00 00 00    	je     650 <test_allocation_fork+0x120>
        } else if (size >= 1 && text[0] == 'Y') {
     5ac:	7e 0c                	jle    5ba <test_allocation_fork+0x8a>
     5ae:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     5b2:	3c 59                	cmp    $0x59,%al
     5b4:	0f 84 b6 00 00 00    	je     670 <test_allocation_fork+0x140>
            printf(1, FAIL_MSG "unknown error\n");
     5ba:	83 ec 08             	sub    $0x8,%esp
            return 0;
     5bd:	31 db                	xor    %ebx,%ebx
            printf(1, FAIL_MSG "unknown error\n");
     5bf:	68 cd 22 00 00       	push   $0x22cd
     5c4:	6a 01                	push   $0x1
     5c6:	e8 45 19 00 00       	call   1f10 <printf>
            return 0;
     5cb:	83 c4 10             	add    $0x10,%esp
}
     5ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5d1:	89 d8                	mov    %ebx,%eax
     5d3:	5b                   	pop    %ebx
     5d4:	5e                   	pop    %esi
     5d5:	5f                   	pop    %edi
     5d6:	5d                   	pop    %ebp
     5d7:	c3                   	ret    
     5d8:	90                   	nop
     5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (size == 2 && text[0] == 'N') {
     5e0:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     5e4:	3c 4e                	cmp    $0x4e,%al
     5e6:	75 ca                	jne    5b2 <test_allocation_fork+0x82>
            if (text[1] == 'A') {
     5e8:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
     5ec:	3c 41                	cmp    $0x41,%al
     5ee:	0f 84 bc 00 00 00    	je     6b0 <test_allocation_fork+0x180>
            } else if (text[1] == 'I') {
     5f4:	3c 49                	cmp    $0x49,%al
     5f6:	0f 84 94 00 00 00    	je     690 <test_allocation_fork+0x160>
            } else if (text[1] == 'R') {
     5fc:	3c 52                	cmp    $0x52,%al
     5fe:	0f 84 e6 00 00 00    	je     6ea <test_allocation_fork+0x1ba>
            } else if (text[1] == 'S') {
     604:	3c 53                	cmp    $0x53,%al
     606:	0f 84 c4 00 00 00    	je     6d0 <test_allocation_fork+0x1a0>
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     60c:	56                   	push   %esi
     60d:	57                   	push   %edi
            return 0;
     60e:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     610:	68 8c 24 00 00       	push   $0x248c
     615:	6a 01                	push   $0x1
     617:	e8 f4 18 00 00       	call   1f10 <printf>
     61c:	83 c4 10             	add    $0x10,%esp
     61f:	eb ad                	jmp    5ce <test_allocation_fork+0x9e>
     621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     628:	83 ec 08             	sub    $0x8,%esp
        return 0;
     62b:	31 db                	xor    %ebx,%ebx
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     62d:	68 50 25 00 00       	push   $0x2550
     632:	6a 01                	push   $0x1
     634:	e8 d7 18 00 00       	call   1f10 <printf>
        return 0;
     639:	83 c4 10             	add    $0x10,%esp
}
     63c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     63f:	89 d8                	mov    %ebx,%eax
     641:	5b                   	pop    %ebx
     642:	5e                   	pop    %esi
     643:	5f                   	pop    %edi
     644:	5d                   	pop    %ebp
     645:	c3                   	ret    
     646:	8d 76 00             	lea    0x0(%esi),%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
     650:	57                   	push   %edi
     651:	56                   	push   %esi
     652:	68 c8 24 00 00       	push   $0x24c8
     657:	6a 01                	push   $0x1
     659:	e8 b2 18 00 00       	call   1f10 <printf>
            return 0;
     65e:	83 c4 10             	add    $0x10,%esp
}
     661:	8d 65 f4             	lea    -0xc(%ebp),%esp
     664:	89 d8                	mov    %ebx,%eax
     666:	5b                   	pop    %ebx
     667:	5e                   	pop    %esi
     668:	5f                   	pop    %edi
     669:	5d                   	pop    %ebp
     66a:	c3                   	ret    
     66b:	90                   	nop
     66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     670:	57                   	push   %edi
     671:	56                   	push   %esi
            return 1;
     672:	bb 01 00 00 00       	mov    $0x1,%ebx
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     677:	68 0c 25 00 00       	push   $0x250c
     67c:	6a 01                	push   $0x1
     67e:	e8 8d 18 00 00       	call   1f10 <printf>
            return 1;
     683:	83 c4 10             	add    $0x10,%esp
     686:	e9 43 ff ff ff       	jmp    5ce <test_allocation_fork+0x9e>
     68b:	90                   	nop
     68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     690:	83 ec 08             	sub    $0x8,%esp
            return 0;
     693:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     695:	68 e8 23 00 00       	push   $0x23e8
     69a:	6a 01                	push   $0x1
     69c:	e8 6f 18 00 00       	call   1f10 <printf>
     6a1:	83 c4 10             	add    $0x10,%esp
     6a4:	e9 25 ff ff ff       	jmp    5ce <test_allocation_fork+0x9e>
     6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     6b0:	83 ec 04             	sub    $0x4,%esp
            return 0;
     6b3:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     6b5:	56                   	push   %esi
     6b6:	68 a4 23 00 00       	push   $0x23a4
     6bb:	6a 01                	push   $0x1
     6bd:	e8 4e 18 00 00       	call   1f10 <printf>
     6c2:	83 c4 10             	add    $0x10,%esp
     6c5:	e9 04 ff ff ff       	jmp    5ce <test_allocation_fork+0x9e>
     6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     6d0:	83 ec 04             	sub    $0x4,%esp
            return 0;
     6d3:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     6d5:	56                   	push   %esi
     6d6:	68 58 24 00 00       	push   $0x2458
     6db:	6a 01                	push   $0x1
     6dd:	e8 2e 18 00 00       	call   1f10 <printf>
     6e2:	83 c4 10             	add    $0x10,%esp
     6e5:	e9 e4 fe ff ff       	jmp    5ce <test_allocation_fork+0x9e>
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6ea:	56                   	push   %esi
     6eb:	57                   	push   %edi
            return 0;
     6ec:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6ee:	68 1c 24 00 00       	push   $0x241c
     6f3:	6a 01                	push   $0x1
     6f5:	e8 16 18 00 00       	call   1f10 <printf>
     6fa:	83 c4 10             	add    $0x10,%esp
     6fd:	e9 cc fe ff ff       	jmp    5ce <test_allocation_fork+0x9e>
        char *old_end_of_heap = sbrk(size);
     702:	83 ec 0c             	sub    $0xc,%esp
     705:	ff 75 08             	pushl  0x8(%ebp)
     708:	89 c3                	mov    %eax,%ebx
     70a:	e8 0b 17 00 00       	call   1e1a <sbrk>
     70f:	89 c7                	mov    %eax,%edi
        char *new_end_of_heap = sbrk(0);
     711:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     718:	e8 fd 16 00 00       	call   1e1a <sbrk>
        if (old_end_of_heap == (char*) -1) {
     71d:	83 c4 10             	add    $0x10,%esp
     720:	83 ff ff             	cmp    $0xffffffff,%edi
     723:	0f 84 d5 00 00 00    	je     7fe <test_allocation_fork+0x2ce>
        } else if (new_end_of_heap - old_end_of_heap != size) {
     729:	29 f8                	sub    %edi,%eax
     72b:	3b 45 08             	cmp    0x8(%ebp),%eax
     72e:	74 18                	je     748 <test_allocation_fork+0x218>
            write(fds[1], "NS", 2);
     730:	53                   	push   %ebx
     731:	6a 02                	push   $0x2
     733:	68 ca 22 00 00       	push   $0x22ca
     738:	ff 75 d8             	pushl  -0x28(%ebp)
     73b:	e8 72 16 00 00       	call   1db2 <write>
     740:	83 c4 10             	add    $0x10,%esp
        exit();
     743:	e8 4a 16 00 00       	call   1d92 <exit>
            char *place_one = &old_end_of_heap[offset1];
     748:	8b 75 14             	mov    0x14(%ebp),%esi
            char *place_two = &old_end_of_heap[offset2];
     74b:	8b 55 1c             	mov    0x1c(%ebp),%edx
            char failed_text[2] = "NR";
     74e:	66 c7 45 de 4e 52    	movw   $0x524e,-0x22(%ebp)
            char *place_one = &old_end_of_heap[offset1];
     754:	01 fe                	add    %edi,%esi
            char *place_two = &old_end_of_heap[offset2];
     756:	01 fa                	add    %edi,%edx
            for (i = 0; i < count1; ++i) {
     758:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     75c:	0f 8e b4 00 00 00    	jle    816 <test_allocation_fork+0x2e6>
     762:	8b 7d 18             	mov    0x18(%ebp),%edi
     765:	89 f1                	mov    %esi,%ecx
            int failed = 0;
     767:	31 c0                	xor    %eax,%eax
     769:	01 f7                	add    %esi,%edi
                if (place_one[i] != 0) {
     76b:	80 39 00             	cmpb   $0x0,(%ecx)
     76e:	74 09                	je     779 <test_allocation_fork+0x249>
                    failed_text[1] = 'I';
     770:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     774:	b8 01 00 00 00       	mov    $0x1,%eax
                place_one[i] = 'A';
     779:	c6 01 41             	movb   $0x41,(%ecx)
     77c:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count1; ++i) {
     77f:	39 f9                	cmp    %edi,%ecx
     781:	75 e8                	jne    76b <test_allocation_fork+0x23b>
            for (i = 0; i < count2; ++i) {
     783:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     787:	7e 25                	jle    7ae <test_allocation_fork+0x27e>
     789:	8b 7d 20             	mov    0x20(%ebp),%edi
     78c:	89 d1                	mov    %edx,%ecx
     78e:	01 d7                	add    %edx,%edi
                if (place_two[i] != 0) {
     790:	80 39 00             	cmpb   $0x0,(%ecx)
     793:	74 09                	je     79e <test_allocation_fork+0x26e>
                    failed_text[1] = 'I';
     795:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     799:	b8 01 00 00 00       	mov    $0x1,%eax
                place_two[i] = 'B';
     79e:	c6 01 42             	movb   $0x42,(%ecx)
     7a1:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count2; ++i) {
     7a4:	39 f9                	cmp    %edi,%ecx
     7a6:	75 e8                	jne    790 <test_allocation_fork+0x260>
            for (i = 0; i < count1; ++i) {
     7a8:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     7ac:	7e 1c                	jle    7ca <test_allocation_fork+0x29a>
                    failed = 1;
     7ae:	31 c9                	xor    %ecx,%ecx
                    failed = 1;
     7b0:	bf 01 00 00 00       	mov    $0x1,%edi
     7b5:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     7b9:	0f 45 c7             	cmovne %edi,%eax
            for (i = 0; i < count1; ++i) {
     7bc:	83 c1 01             	add    $0x1,%ecx
     7bf:	39 4d 18             	cmp    %ecx,0x18(%ebp)
     7c2:	7f f1                	jg     7b5 <test_allocation_fork+0x285>
            for (i = 0; i < count2; ++i) {
     7c4:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     7c8:	7e 14                	jle    7de <test_allocation_fork+0x2ae>
                    failed = 1;
     7ca:	b9 01 00 00 00       	mov    $0x1,%ecx
     7cf:	80 3c 1a 42          	cmpb   $0x42,(%edx,%ebx,1)
     7d3:	0f 45 c1             	cmovne %ecx,%eax
            for (i = 0; i < count2; ++i) {
     7d6:	83 c3 01             	add    $0x1,%ebx
     7d9:	39 5d 20             	cmp    %ebx,0x20(%ebp)
     7dc:	7f f1                	jg     7cf <test_allocation_fork+0x29f>
            write(fds[1], failed ? failed_text : "YY", 2);
     7de:	85 c0                	test   %eax,%eax
     7e0:	8d 55 de             	lea    -0x22(%ebp),%edx
     7e3:	75 05                	jne    7ea <test_allocation_fork+0x2ba>
     7e5:	ba c4 22 00 00       	mov    $0x22c4,%edx
     7ea:	51                   	push   %ecx
     7eb:	6a 02                	push   $0x2
     7ed:	52                   	push   %edx
     7ee:	ff 75 d8             	pushl  -0x28(%ebp)
     7f1:	e8 bc 15 00 00       	call   1db2 <write>
     7f6:	83 c4 10             	add    $0x10,%esp
     7f9:	e9 45 ff ff ff       	jmp    743 <test_allocation_fork+0x213>
            write(fds[1], "NA", 2);
     7fe:	56                   	push   %esi
     7ff:	6a 02                	push   $0x2
     801:	68 c7 22 00 00       	push   $0x22c7
     806:	ff 75 d8             	pushl  -0x28(%ebp)
     809:	e8 a4 15 00 00       	call   1db2 <write>
     80e:	83 c4 10             	add    $0x10,%esp
     811:	e9 2d ff ff ff       	jmp    743 <test_allocation_fork+0x213>
            int failed = 0;
     816:	31 c0                	xor    %eax,%eax
            for (i = 0; i < count2; ++i) {
     818:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     81c:	0f 8f 67 ff ff ff    	jg     789 <test_allocation_fork+0x259>
     822:	eb c1                	jmp    7e5 <test_allocation_fork+0x2b5>
     824:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     82a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000830 <wait_forever>:
void wait_forever() {
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	83 ec 08             	sub    $0x8,%esp
     836:	8d 76 00             	lea    0x0(%esi),%esi
     839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while (1) { sleep(1000); }
     840:	83 ec 0c             	sub    $0xc,%esp
     843:	68 e8 03 00 00       	push   $0x3e8
     848:	e8 d5 15 00 00       	call   1e22 <sleep>
     84d:	83 c4 10             	add    $0x10,%esp
     850:	eb ee                	jmp    840 <wait_forever+0x10>
     852:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000860 <test_copy_on_write_main_child>:
void test_copy_on_write_main_child(int result_fd, int size, const char *describe_size, int forks) {
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 78             	sub    $0x78,%esp
  char *old_end_of_heap = sbrk(size);
     869:	ff 75 0c             	pushl  0xc(%ebp)
     86c:	e8 a9 15 00 00       	call   1e1a <sbrk>
     871:	89 c7                	mov    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     873:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  char *old_end_of_heap = sbrk(size);
     87a:	89 45 94             	mov    %eax,-0x6c(%ebp)
  char *new_end_of_heap = sbrk(0);
     87d:	e8 98 15 00 00       	call   1e1a <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     882:	83 c4 10             	add    $0x10,%esp
     885:	39 c7                	cmp    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     887:	89 45 90             	mov    %eax,-0x70(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     88a:	73 0e                	jae    89a <test_copy_on_write_main_child+0x3a>
     88c:	89 c2                	mov    %eax,%edx
     88e:	89 f8                	mov    %edi,%eax
      *p = 'A';
     890:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     893:	83 c0 01             	add    $0x1,%eax
     896:	39 c2                	cmp    %eax,%edx
     898:	75 f6                	jne    890 <test_copy_on_write_main_child+0x30>
  int children[MAX_CHILDREN] = {0};
     89a:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     89c:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     8a0:	8d 7d a8             	lea    -0x58(%ebp),%edi
     8a3:	b9 10 00 00 00       	mov    $0x10,%ecx
     8a8:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     8aa:	0f 8f 58 01 00 00    	jg     a08 <test_copy_on_write_main_child+0x1a8>
  for (int i = 0; i < forks; ++i) {
     8b0:	8b 4d 14             	mov    0x14(%ebp),%ecx
     8b3:	85 c9                	test   %ecx,%ecx
     8b5:	0f 8e 64 01 00 00    	jle    a1f <test_copy_on_write_main_child+0x1bf>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     8bb:	31 db                	xor    %ebx,%ebx
     8bd:	bf 20 00 00 00       	mov    $0x20,%edi
     8c2:	31 f6                	xor    %esi,%esi
     8c4:	eb 58                	jmp    91e <test_copy_on_write_main_child+0xbe>
     8c6:	8d 76 00             	lea    0x0(%esi),%esi
     8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    } else if (children[i] == 0) {
     8d0:	85 c0                	test   %eax,%eax
     8d2:	0f 84 5c 01 00 00    	je     a34 <test_copy_on_write_main_child+0x1d4>
      read(child_fds[0], buffer, 1);
     8d8:	8d 45 9f             	lea    -0x61(%ebp),%eax
     8db:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     8de:	c6 45 9f 58          	movb   $0x58,-0x61(%ebp)
      read(child_fds[0], buffer, 1);
     8e2:	6a 01                	push   $0x1
     8e4:	50                   	push   %eax
     8e5:	ff 75 a0             	pushl  -0x60(%ebp)
     8e8:	e8 bd 14 00 00       	call   1daa <read>
        failed_code = 'c';
     8ed:	80 7d 9f 2b          	cmpb   $0x2b,-0x61(%ebp)
      if (buffer[0] != '+') {
     8f1:	58                   	pop    %eax
        failed_code = 'c';
     8f2:	b8 63 00 00 00       	mov    $0x63,%eax
      close(child_fds[0]); close(child_fds[1]);
     8f7:	ff 75 a0             	pushl  -0x60(%ebp)
        failed_code = 'c';
     8fa:	0f 45 f8             	cmovne %eax,%edi
     8fd:	b8 01 00 00 00       	mov    $0x1,%eax
     902:	0f 45 f0             	cmovne %eax,%esi
  for (int i = 0; i < forks; ++i) {
     905:	83 c3 01             	add    $0x1,%ebx
      close(child_fds[0]); close(child_fds[1]);
     908:	e8 ad 14 00 00       	call   1dba <close>
     90d:	5a                   	pop    %edx
     90e:	ff 75 a4             	pushl  -0x5c(%ebp)
     911:	e8 a4 14 00 00       	call   1dba <close>
  for (int i = 0; i < forks; ++i) {
     916:	83 c4 10             	add    $0x10,%esp
     919:	39 5d 14             	cmp    %ebx,0x14(%ebp)
     91c:	74 39                	je     957 <test_copy_on_write_main_child+0xf7>
    pipe(child_fds);
     91e:	8d 45 a0             	lea    -0x60(%ebp),%eax
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	50                   	push   %eax
     925:	e8 78 14 00 00       	call   1da2 <pipe>
    children[i] = fork();
     92a:	e8 5b 14 00 00       	call   1d8a <fork>
    if (children[i] == -1) {
     92f:	83 c4 10             	add    $0x10,%esp
     932:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     935:	89 44 9d a8          	mov    %eax,-0x58(%ebp,%ebx,4)
    if (children[i] == -1) {
     939:	75 95                	jne    8d0 <test_copy_on_write_main_child+0x70>
      printf(2, "fork failed\n");
     93b:	83 ec 08             	sub    $0x8,%esp
      failed_code = 'f';
     93e:	bf 66 00 00 00       	mov    $0x66,%edi
      failed = 1;
     943:	be 01 00 00 00       	mov    $0x1,%esi
      printf(2, "fork failed\n");
     948:	68 ea 22 00 00       	push   $0x22ea
     94d:	6a 02                	push   $0x2
     94f:	e8 bc 15 00 00       	call   1f10 <printf>
      break;
     954:	83 c4 10             	add    $0x10,%esp
     957:	8b 45 14             	mov    0x14(%ebp),%eax
     95a:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     95d:	89 75 8c             	mov    %esi,-0x74(%ebp)
     960:	89 de                	mov    %ebx,%esi
     962:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     965:	89 c3                	mov    %eax,%ebx
     967:	89 f6                	mov    %esi,%esi
     969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    kill(children[i]);
     970:	83 ec 0c             	sub    $0xc,%esp
     973:	ff 36                	pushl  (%esi)
     975:	83 c6 04             	add    $0x4,%esi
     978:	e8 45 14 00 00       	call   1dc2 <kill>
    wait();
     97d:	e8 18 14 00 00       	call   1d9a <wait>
  for (int i = 0; i < forks; ++i) {
     982:	83 c4 10             	add    $0x10,%esp
     985:	39 f3                	cmp    %esi,%ebx
     987:	75 e7                	jne    970 <test_copy_on_write_main_child+0x110>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     989:	8b 55 90             	mov    -0x70(%ebp),%edx
     98c:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     98f:	8b 75 8c             	mov    -0x74(%ebp),%esi
     992:	73 24                	jae    9b8 <test_copy_on_write_main_child+0x158>
      failed_code = 'p';
     994:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
     997:	8b 5d 90             	mov    -0x70(%ebp),%ebx
     99a:	ba 70 00 00 00       	mov    $0x70,%edx
     99f:	b8 01 00 00 00       	mov    $0x1,%eax
     9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9a8:	80 39 41             	cmpb   $0x41,(%ecx)
     9ab:	0f 45 fa             	cmovne %edx,%edi
     9ae:	0f 45 f0             	cmovne %eax,%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9b1:	83 c1 01             	add    $0x1,%ecx
     9b4:	39 cb                	cmp    %ecx,%ebx
     9b6:	75 f0                	jne    9a8 <test_copy_on_write_main_child+0x148>
  if (failed) {
     9b8:	85 f6                	test   %esi,%esi
     9ba:	75 24                	jne    9e0 <test_copy_on_write_main_child+0x180>
    write(result_fd, "YY", 2);
     9bc:	83 ec 04             	sub    $0x4,%esp
     9bf:	6a 02                	push   $0x2
     9c1:	68 c4 22 00 00       	push   $0x22c4
     9c6:	ff 75 08             	pushl  0x8(%ebp)
     9c9:	e8 e4 13 00 00       	call   1db2 <write>
     9ce:	83 c4 10             	add    $0x10,%esp
}
     9d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9d4:	5b                   	pop    %ebx
     9d5:	5e                   	pop    %esi
     9d6:	5f                   	pop    %edi
     9d7:	5d                   	pop    %ebp
     9d8:	c3                   	ret    
     9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buffer[1] = failed_code;
     9e0:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     9e2:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     9e5:	c6 45 a0 4e          	movb   $0x4e,-0x60(%ebp)
    buffer[1] = failed_code;
     9e9:	88 45 a1             	mov    %al,-0x5f(%ebp)
    write(result_fd, buffer, 2);
     9ec:	8d 45 a0             	lea    -0x60(%ebp),%eax
     9ef:	6a 02                	push   $0x2
     9f1:	50                   	push   %eax
     9f2:	ff 75 08             	pushl  0x8(%ebp)
     9f5:	e8 b8 13 00 00       	call   1db2 <write>
     9fa:	83 c4 10             	add    $0x10,%esp
}
     9fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a00:	5b                   	pop    %ebx
     a01:	5e                   	pop    %esi
     a02:	5f                   	pop    %edi
     a03:	5d                   	pop    %ebp
     a04:	c3                   	ret    
     a05:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     a08:	83 ec 08             	sub    $0x8,%esp
     a0b:	68 80 25 00 00       	push   $0x2580
     a10:	6a 02                	push   $0x2
     a12:	e8 f9 14 00 00       	call   1f10 <printf>
     a17:	83 c4 10             	add    $0x10,%esp
     a1a:	e9 9c fe ff ff       	jmp    8bb <test_copy_on_write_main_child+0x5b>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a1f:	31 f6                	xor    %esi,%esi
     a21:	8b 55 90             	mov    -0x70(%ebp),%edx
     a24:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     a27:	bf 20 00 00 00       	mov    $0x20,%edi
     a2c:	0f 82 62 ff ff ff    	jb     994 <test_copy_on_write_main_child+0x134>
     a32:	eb 88                	jmp    9bc <test_copy_on_write_main_child+0x15c>
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a34:	8b 55 94             	mov    -0x6c(%ebp),%edx
     a37:	8b 4d 90             	mov    -0x70(%ebp),%ecx
     a3a:	39 ca                	cmp    %ecx,%edx
     a3c:	73 13                	jae    a51 <test_copy_on_write_main_child+0x1f1>
          found_wrong_memory = 1;
     a3e:	b9 01 00 00 00       	mov    $0x1,%ecx
     a43:	80 3a 41             	cmpb   $0x41,(%edx)
     a46:	0f 45 c1             	cmovne %ecx,%eax
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a49:	83 c2 01             	add    $0x1,%edx
     a4c:	39 55 90             	cmp    %edx,-0x70(%ebp)
     a4f:	75 f2                	jne    a43 <test_copy_on_write_main_child+0x1e3>
      int place_one = size / 2;
     a51:	8b 7d 0c             	mov    0xc(%ebp),%edi
      old_end_of_heap[place_one] = 'B' + i;
     a54:	8b 75 94             	mov    -0x6c(%ebp),%esi
     a57:	8d 53 42             	lea    0x42(%ebx),%edx
          place_two = size - 1;
     a5a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_one = size / 2;
     a5d:	c1 ef 1f             	shr    $0x1f,%edi
     a60:	03 7d 0c             	add    0xc(%ebp),%edi
          place_two = size - 1;
     a63:	83 e9 01             	sub    $0x1,%ecx
      int place_one = size / 2;
     a66:	d1 ff                	sar    %edi
      old_end_of_heap[place_one] = 'B' + i;
     a68:	01 f7                	add    %esi,%edi
     a6a:	88 17                	mov    %dl,(%edi)
      int place_two = 4096 * i;
     a6c:	89 da                	mov    %ebx,%edx
     a6e:	c1 e2 0c             	shl    $0xc,%edx
          place_two = size - 1;
     a71:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a74:	0f 4f ca             	cmovg  %edx,%ecx
      old_end_of_heap[place_two] = 'C';
     a77:	c6 04 0e 43          	movb   $0x43,(%esi,%ecx,1)
      int place_three = 4096 * (i - 1);
     a7b:	8d b2 00 f0 ff ff    	lea    -0x1000(%edx),%esi
      if (place_three >= size || place_three < 0) {
     a81:	39 75 0c             	cmp    %esi,0xc(%ebp)
     a84:	7e 66                	jle    aec <test_copy_on_write_main_child+0x28c>
     a86:	85 f6                	test   %esi,%esi
     a88:	78 62                	js     aec <test_copy_on_write_main_child+0x28c>
          place_four = size - 3;
     a8a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_four = 4096 * (i + 1);
     a8d:	81 c2 00 10 00 00    	add    $0x1000,%edx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a93:	89 45 90             	mov    %eax,-0x70(%ebp)
          place_four = size - 3;
     a96:	83 e9 03             	sub    $0x3,%ecx
     a99:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a9c:	0f 4e d1             	cmovle %ecx,%edx
        old_end_of_heap[place_four],
     a9f:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     aa2:	83 ec 04             	sub    $0x4,%esp
     aa5:	53                   	push   %ebx
     aa6:	50                   	push   %eax
        old_end_of_heap[place_four],
     aa7:	01 ca                	add    %ecx,%edx
        old_end_of_heap[place_three],
     aa9:	01 ce                	add    %ecx,%esi
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     aab:	0f be 0a             	movsbl (%edx),%ecx
     aae:	89 55 94             	mov    %edx,-0x6c(%ebp)
     ab1:	51                   	push   %ecx
     ab2:	0f be 0f             	movsbl (%edi),%ecx
     ab5:	51                   	push   %ecx
     ab6:	0f be 0e             	movsbl (%esi),%ecx
     ab9:	51                   	push   %ecx
     aba:	68 b8 25 00 00       	push   $0x25b8
     abf:	6a 01                	push   $0x1
     ac1:	e8 4a 14 00 00       	call   1f10 <printf>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ac6:	83 c4 20             	add    $0x20,%esp
     ac9:	80 3e 41             	cmpb   $0x41,(%esi)
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     acc:	b9 e6 22 00 00       	mov    $0x22e6,%ecx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ad1:	8b 55 94             	mov    -0x6c(%ebp),%edx
     ad4:	8b 45 90             	mov    -0x70(%ebp),%eax
     ad7:	74 1b                	je     af4 <test_copy_on_write_main_child+0x294>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     ad9:	83 ec 04             	sub    $0x4,%esp
     adc:	6a 01                	push   $0x1
     ade:	51                   	push   %ecx
     adf:	ff 75 a4             	pushl  -0x5c(%ebp)
     ae2:	e8 cb 12 00 00       	call   1db2 <write>
      wait_forever();
     ae7:	e8 44 fd ff ff       	call   830 <wait_forever>
          place_three = size - 2;
     aec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     aef:	8d 71 fe             	lea    -0x2(%ecx),%esi
     af2:	eb 96                	jmp    a8a <test_copy_on_write_main_child+0x22a>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     af4:	0f be 37             	movsbl (%edi),%esi
     af7:	83 c3 42             	add    $0x42,%ebx
     afa:	39 de                	cmp    %ebx,%esi
     afc:	75 db                	jne    ad9 <test_copy_on_write_main_child+0x279>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     afe:	80 3a 41             	cmpb   $0x41,(%edx)
     b01:	75 09                	jne    b0c <test_copy_on_write_main_child+0x2ac>
     b03:	a8 01                	test   $0x1,%al
     b05:	b9 e8 22 00 00       	mov    $0x22e8,%ecx
     b0a:	74 cd                	je     ad9 <test_copy_on_write_main_child+0x279>
     b0c:	b9 e6 22 00 00       	mov    $0x22e6,%ecx
     b11:	eb c6                	jmp    ad9 <test_copy_on_write_main_child+0x279>
     b13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b20 <test_copy_on_write_main_child_alt>:
void test_copy_on_write_main_child_alt(int result_fd, int size, const char *describe_size, int forks, int early_term) {
     b20:	55                   	push   %ebp
     b21:	89 e5                	mov    %esp,%ebp
     b23:	57                   	push   %edi
     b24:	56                   	push   %esi
     b25:	53                   	push   %ebx
     b26:	81 ec 08 01 00 00    	sub    $0x108,%esp
  char *old_end_of_heap = sbrk(size);
     b2c:	ff 75 0c             	pushl  0xc(%ebp)
     b2f:	e8 e6 12 00 00       	call   1e1a <sbrk>
     b34:	89 c6                	mov    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     b36:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b3d:	e8 d8 12 00 00       	call   1e1a <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b42:	83 c4 10             	add    $0x10,%esp
     b45:	39 c6                	cmp    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     b47:	89 85 10 ff ff ff    	mov    %eax,-0xf0(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b4d:	73 13                	jae    b62 <test_copy_on_write_main_child_alt+0x42>
     b4f:	89 c2                	mov    %eax,%edx
     b51:	89 f0                	mov    %esi,%eax
     b53:	90                   	nop
     b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *p = 'A';
     b58:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b5b:	83 c0 01             	add    $0x1,%eax
     b5e:	39 c2                	cmp    %eax,%edx
     b60:	75 f6                	jne    b58 <test_copy_on_write_main_child_alt+0x38>
  int children[MAX_CHILDREN] = {0};
     b62:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     b64:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     b68:	8d 9d 28 ff ff ff    	lea    -0xd8(%ebp),%ebx
     b6e:	b9 10 00 00 00       	mov    $0x10,%ecx
     b73:	89 df                	mov    %ebx,%edi
     b75:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     b77:	0f 8f bb 01 00 00    	jg     d38 <test_copy_on_write_main_child_alt+0x218>
  for (int i = 0; i < forks; ++i) {
     b7d:	8b 7d 14             	mov    0x14(%ebp),%edi
     b80:	85 ff                	test   %edi,%edi
     b82:	0f 8e a7 03 00 00    	jle    f2f <test_copy_on_write_main_child_alt+0x40f>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b88:	31 ff                	xor    %edi,%edi
     b8a:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
     b90:	89 fe                	mov    %edi,%esi
     b92:	8b 7d 14             	mov    0x14(%ebp),%edi
     b95:	eb 1e                	jmp    bb5 <test_copy_on_write_main_child_alt+0x95>
     b97:	89 f6                	mov    %esi,%esi
     b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    } else if (children[i] == 0) {
     ba0:	85 c0                	test   %eax,%eax
     ba2:	8d 56 01             	lea    0x1(%esi),%edx
     ba5:	0f 84 a5 01 00 00    	je     d50 <test_copy_on_write_main_child_alt+0x230>
  for (int i = 0; i < forks; ++i) {
     bab:	39 fa                	cmp    %edi,%edx
     bad:	89 d6                	mov    %edx,%esi
     baf:	0f 84 cb 02 00 00    	je     e80 <test_copy_on_write_main_child_alt+0x360>
    sleep(1);
     bb5:	83 ec 0c             	sub    $0xc,%esp
     bb8:	6a 01                	push   $0x1
     bba:	e8 63 12 00 00       	call   1e22 <sleep>
    pipe(child_fds[i]);
     bbf:	8d 84 f5 68 ff ff ff 	lea    -0x98(%ebp,%esi,8),%eax
     bc6:	89 04 24             	mov    %eax,(%esp)
     bc9:	e8 d4 11 00 00       	call   1da2 <pipe>
    children[i] = fork();
     bce:	e8 b7 11 00 00       	call   1d8a <fork>
    if (children[i] == -1) {
     bd3:	83 c4 10             	add    $0x10,%esp
     bd6:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     bd9:	89 04 b3             	mov    %eax,(%ebx,%esi,4)
    if (children[i] == -1) {
     bdc:	75 c2                	jne    ba0 <test_copy_on_write_main_child_alt+0x80>
      printf(2, "fork failed\n");
     bde:	83 ec 08             	sub    $0x8,%esp
     be1:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      failed_code = 'f';
     be7:	bf 66 00 00 00       	mov    $0x66,%edi
      printf(2, "fork failed\n");
     bec:	68 ea 22 00 00       	push   $0x22ea
     bf1:	6a 02                	push   $0x2
     bf3:	e8 18 13 00 00       	call   1f10 <printf>
      break;
     bf8:	83 c4 10             	add    $0x10,%esp
      failed = 1;
     bfb:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     c02:	00 00 00 
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     c05:	31 d2                	xor    %edx,%edx
     c07:	89 b5 0c ff ff ff    	mov    %esi,-0xf4(%ebp)
     c0d:	89 d6                	mov    %edx,%esi
     c0f:	eb 4a                	jmp    c5b <test_copy_on_write_main_child_alt+0x13b>
     c11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        failed_code = 'c';
     c18:	3c 2b                	cmp    $0x2b,%al
     c1a:	b8 01 00 00 00       	mov    $0x1,%eax
     c1f:	0f 44 85 14 ff ff ff 	cmove  -0xec(%ebp),%eax
     c26:	b9 63 00 00 00       	mov    $0x63,%ecx
     c2b:	0f 45 f9             	cmovne %ecx,%edi
     c2e:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
      close(child_fds[i][0]); close(child_fds[i][1]);
     c34:	83 ec 0c             	sub    $0xc,%esp
     c37:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     c3e:	e8 77 11 00 00       	call   1dba <close>
     c43:	5a                   	pop    %edx
     c44:	ff b4 f5 6c ff ff ff 	pushl  -0x94(%ebp,%esi,8)
     c4b:	e8 6a 11 00 00       	call   1dba <close>
     c50:	83 c4 10             	add    $0x10,%esp
  for (int i = 0; i < forks; ++i) {
     c53:	83 c6 01             	add    $0x1,%esi
     c56:	39 75 14             	cmp    %esi,0x14(%ebp)
     c59:	74 45                	je     ca0 <test_copy_on_write_main_child_alt+0x180>
    if (children[i] != -1) {
     c5b:	83 3c b3 ff          	cmpl   $0xffffffff,(%ebx,%esi,4)
     c5f:	74 f2                	je     c53 <test_copy_on_write_main_child_alt+0x133>
      read(child_fds[i][0], buffer, 1);
     c61:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     c67:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     c6a:	c6 85 26 ff ff ff 58 	movb   $0x58,-0xda(%ebp)
      read(child_fds[i][0], buffer, 1);
     c71:	6a 01                	push   $0x1
     c73:	50                   	push   %eax
     c74:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     c7b:	e8 2a 11 00 00       	call   1daa <read>
      if (buffer[0] == 'X') {
     c80:	0f b6 85 26 ff ff ff 	movzbl -0xda(%ebp),%eax
     c87:	83 c4 10             	add    $0x10,%esp
     c8a:	3c 58                	cmp    $0x58,%al
     c8c:	75 8a                	jne    c18 <test_copy_on_write_main_child_alt+0xf8>
        failed_code = 'P';
     c8e:	bf 50 00 00 00       	mov    $0x50,%edi
        failed = 1;
     c93:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     c9a:	00 00 00 
     c9d:	eb 95                	jmp    c34 <test_copy_on_write_main_child_alt+0x114>
     c9f:	90                   	nop
     ca0:	8b 45 14             	mov    0x14(%ebp),%eax
     ca3:	89 de                	mov    %ebx,%esi
     ca5:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     ca8:	89 c3                	mov    %eax,%ebx
     caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    kill(children[i]);
     cb0:	83 ec 0c             	sub    $0xc,%esp
     cb3:	ff 36                	pushl  (%esi)
     cb5:	83 c6 04             	add    $0x4,%esi
     cb8:	e8 05 11 00 00       	call   1dc2 <kill>
    wait();
     cbd:	e8 d8 10 00 00       	call   1d9a <wait>
  for (int i = 0; i < forks; ++i) {
     cc2:	83 c4 10             	add    $0x10,%esp
     cc5:	39 f3                	cmp    %esi,%ebx
     cc7:	75 e7                	jne    cb0 <test_copy_on_write_main_child_alt+0x190>
     cc9:	8b b5 0c ff ff ff    	mov    -0xf4(%ebp),%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     ccf:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
     cd5:	73 2f                	jae    d06 <test_copy_on_write_main_child_alt+0x1e6>
      failed_code = 'p';
     cd7:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     cdd:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
     ce3:	ba 70 00 00 00       	mov    $0x70,%edx
     ce8:	b8 01 00 00 00       	mov    $0x1,%eax
     ced:	8d 76 00             	lea    0x0(%esi),%esi
     cf0:	80 3e 41             	cmpb   $0x41,(%esi)
     cf3:	0f 45 fa             	cmovne %edx,%edi
     cf6:	0f 45 c8             	cmovne %eax,%ecx
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     cf9:	83 c6 01             	add    $0x1,%esi
     cfc:	39 f3                	cmp    %esi,%ebx
     cfe:	75 f0                	jne    cf0 <test_copy_on_write_main_child_alt+0x1d0>
     d00:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
  if (failed) {
     d06:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     d0c:	85 c0                	test   %eax,%eax
     d0e:	0f 85 3c 01 00 00    	jne    e50 <test_copy_on_write_main_child_alt+0x330>
    write(result_fd, "YY", 2);
     d14:	83 ec 04             	sub    $0x4,%esp
     d17:	6a 02                	push   $0x2
     d19:	68 c4 22 00 00       	push   $0x22c4
     d1e:	ff 75 08             	pushl  0x8(%ebp)
     d21:	e8 8c 10 00 00       	call   1db2 <write>
     d26:	83 c4 10             	add    $0x10,%esp
}
     d29:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d2c:	5b                   	pop    %ebx
     d2d:	5e                   	pop    %esi
     d2e:	5f                   	pop    %edi
     d2f:	5d                   	pop    %ebp
     d30:	c3                   	ret    
     d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 80 25 00 00       	push   $0x2580
     d40:	6a 02                	push   $0x2
     d42:	e8 c9 11 00 00       	call   1f10 <printf>
     d47:	83 c4 10             	add    $0x10,%esp
     d4a:	e9 39 fe ff ff       	jmp    b88 <test_copy_on_write_main_child_alt+0x68>
     d4f:	90                   	nop
     d50:	89 95 0c ff ff ff    	mov    %edx,-0xf4(%ebp)
     d56:	89 f7                	mov    %esi,%edi
     d58:	89 c2                	mov    %eax,%edx
     d5a:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d60:	8b 85 10 ff ff ff    	mov    -0xf0(%ebp),%eax
     d66:	39 c6                	cmp    %eax,%esi
     d68:	73 1b                	jae    d85 <test_copy_on_write_main_child_alt+0x265>
     d6a:	89 f1                	mov    %esi,%ecx
          found_wrong_memory = 1;
     d6c:	bb 01 00 00 00       	mov    $0x1,%ebx
     d71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d78:	80 39 41             	cmpb   $0x41,(%ecx)
     d7b:	0f 45 d3             	cmovne %ebx,%edx
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d7e:	83 c1 01             	add    $0x1,%ecx
     d81:	39 c8                	cmp    %ecx,%eax
     d83:	75 f3                	jne    d78 <test_copy_on_write_main_child_alt+0x258>
      int place_one = size / 2;
     d85:	8b 4d 0c             	mov    0xc(%ebp),%ecx
          place_two = size - 1;
     d88:	8b 45 0c             	mov    0xc(%ebp),%eax
      int place_one = size / 2;
     d8b:	c1 e9 1f             	shr    $0x1f,%ecx
     d8e:	03 4d 0c             	add    0xc(%ebp),%ecx
     d91:	d1 f9                	sar    %ecx
      old_end_of_heap[place_one] = 'B' + i;
     d93:	01 f1                	add    %esi,%ecx
     d95:	89 cb                	mov    %ecx,%ebx
     d97:	89 8d 08 ff ff ff    	mov    %ecx,-0xf8(%ebp)
     d9d:	8d 4f 42             	lea    0x42(%edi),%ecx
     da0:	88 0b                	mov    %cl,(%ebx)
      int place_two = 4096 * i;
     da2:	89 f9                	mov    %edi,%ecx
          place_two = size - 1;
     da4:	8d 58 ff             	lea    -0x1(%eax),%ebx
      int place_two = 4096 * i;
     da7:	c1 e1 0c             	shl    $0xc,%ecx
          place_two = size - 1;
     daa:	39 c8                	cmp    %ecx,%eax
     dac:	0f 4f d9             	cmovg  %ecx,%ebx
      int place_three = 4096 * (i - 1);
     daf:	81 e9 00 10 00 00    	sub    $0x1000,%ecx
      old_end_of_heap[place_two] = 'C' + i;
     db5:	01 f3                	add    %esi,%ebx
      if (place_three >= size || place_three < 0) {
     db7:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
      old_end_of_heap[place_two] = 'C' + i;
     dba:	89 d8                	mov    %ebx,%eax
     dbc:	89 9d 04 ff ff ff    	mov    %ebx,-0xfc(%ebp)
     dc2:	8d 5f 43             	lea    0x43(%edi),%ebx
     dc5:	88 18                	mov    %bl,(%eax)
      if (place_three >= size || place_three < 0) {
     dc7:	0f 8e db 00 00 00    	jle    ea8 <test_copy_on_write_main_child_alt+0x388>
     dcd:	85 c9                	test   %ecx,%ecx
     dcf:	0f 88 d3 00 00 00    	js     ea8 <test_copy_on_write_main_child_alt+0x388>
      int place_four = 4096 * (i + 1);
     dd5:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
     ddb:	c1 e0 0c             	shl    $0xc,%eax
     dde:	89 c3                	mov    %eax,%ebx
          place_four = size - 3;
     de0:	8b 45 0c             	mov    0xc(%ebp),%eax
     de3:	83 e8 03             	sub    $0x3,%eax
     de6:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
     de9:	0f 4e d8             	cmovle %eax,%ebx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     dec:	01 f1                	add    %esi,%ecx
     dee:	80 39 41             	cmpb   $0x41,(%ecx)
     df1:	0f 84 09 01 00 00    	je     f00 <test_copy_on_write_main_child_alt+0x3e0>
          found_wrong_memory = 1;
     df7:	ba 01 00 00 00       	mov    $0x1,%edx
      sleep(5);
     dfc:	83 ec 0c             	sub    $0xc,%esp
     dff:	89 95 10 ff ff ff    	mov    %edx,-0xf0(%ebp)
     e05:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
     e0b:	6a 05                	push   $0x5
     e0d:	e8 10 10 00 00       	call   1e22 <sleep>
      if (old_end_of_heap[place_three] != 'A' || 
     e12:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     e18:	83 c4 10             	add    $0x10,%esp
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     e1b:	b8 e6 22 00 00       	mov    $0x22e6,%eax
      if (old_end_of_heap[place_three] != 'A' || 
     e20:	8b 95 10 ff ff ff    	mov    -0xf0(%ebp),%edx
     e26:	80 39 41             	cmpb   $0x41,(%ecx)
     e29:	0f 84 89 00 00 00    	je     eb8 <test_copy_on_write_main_child_alt+0x398>
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     e2f:	83 ec 04             	sub    $0x4,%esp
     e32:	6a 01                	push   $0x1
     e34:	50                   	push   %eax
     e35:	ff b4 fd 6c ff ff ff 	pushl  -0x94(%ebp,%edi,8)
     e3c:	e8 71 0f 00 00       	call   1db2 <write>
      if (early_term) {
     e41:	8b 4d 18             	mov    0x18(%ebp),%ecx
     e44:	83 c4 10             	add    $0x10,%esp
     e47:	85 c9                	test   %ecx,%ecx
     e49:	74 55                	je     ea0 <test_copy_on_write_main_child_alt+0x380>
          exit();
     e4b:	e8 42 0f 00 00       	call   1d92 <exit>
    buffer[1] = failed_code;
     e50:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     e52:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     e55:	c6 85 26 ff ff ff 4e 	movb   $0x4e,-0xda(%ebp)
    buffer[1] = failed_code;
     e5c:	88 85 27 ff ff ff    	mov    %al,-0xd9(%ebp)
    write(result_fd, buffer, 2);
     e62:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     e68:	6a 02                	push   $0x2
     e6a:	50                   	push   %eax
     e6b:	ff 75 08             	pushl  0x8(%ebp)
     e6e:	e8 3f 0f 00 00       	call   1db2 <write>
     e73:	83 c4 10             	add    $0x10,%esp
}
     e76:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e79:	5b                   	pop    %ebx
     e7a:	5e                   	pop    %esi
     e7b:	5f                   	pop    %edi
     e7c:	5d                   	pop    %ebp
     e7d:	c3                   	ret    
     e7e:	66 90                	xchg   %ax,%ax
     e80:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
  char failed_code = ' ';
     e86:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     e8b:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     e92:	00 00 00 
     e95:	e9 6b fd ff ff       	jmp    c05 <test_copy_on_write_main_child_alt+0xe5>
     e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          wait_forever();
     ea0:	e8 8b f9 ff ff       	call   830 <wait_forever>
     ea5:	8d 76 00             	lea    0x0(%esi),%esi
          place_three = size - 2;
     ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
     eab:	8d 48 fe             	lea    -0x2(%eax),%ecx
     eae:	e9 22 ff ff ff       	jmp    dd5 <test_copy_on_write_main_child_alt+0x2b5>
     eb3:	90                   	nop
     eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (old_end_of_heap[place_three] != 'A' || 
     eb8:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     ebc:	0f 85 6d ff ff ff    	jne    e2f <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     ec2:	8b 8d 04 ff ff ff    	mov    -0xfc(%ebp),%ecx
     ec8:	0f be 19             	movsbl (%ecx),%ebx
     ecb:	8d 4f 43             	lea    0x43(%edi),%ecx
          old_end_of_heap[place_four] != 'A' ||
     ece:	39 cb                	cmp    %ecx,%ebx
     ed0:	0f 85 59 ff ff ff    	jne    e2f <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     ed6:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     edc:	0f be 08             	movsbl (%eax),%ecx
     edf:	8d 47 42             	lea    0x42(%edi),%eax
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     ee2:	39 c1                	cmp    %eax,%ecx
     ee4:	75 0e                	jne    ef4 <test_copy_on_write_main_child_alt+0x3d4>
     ee6:	83 e2 01             	and    $0x1,%edx
     ee9:	b8 e8 22 00 00       	mov    $0x22e8,%eax
     eee:	0f 84 3b ff ff ff    	je     e2f <test_copy_on_write_main_child_alt+0x30f>
     ef4:	b8 e6 22 00 00       	mov    $0x22e6,%eax
     ef9:	e9 31 ff ff ff       	jmp    e2f <test_copy_on_write_main_child_alt+0x30f>
     efe:	66 90                	xchg   %ax,%ax
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     f00:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     f06:	0f be 00             	movsbl (%eax),%eax
     f09:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
     f0f:	8d 47 42             	lea    0x42(%edi),%eax
     f12:	39 85 14 ff ff ff    	cmp    %eax,-0xec(%ebp)
     f18:	0f 85 d9 fe ff ff    	jne    df7 <test_copy_on_write_main_child_alt+0x2d7>
          found_wrong_memory = 1;
     f1e:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     f22:	b8 01 00 00 00       	mov    $0x1,%eax
     f27:	0f 45 d0             	cmovne %eax,%edx
     f2a:	e9 cd fe ff ff       	jmp    dfc <test_copy_on_write_main_child_alt+0x2dc>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     f2f:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
  char failed_code = ' ';
     f35:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     f3a:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     f41:	00 00 00 
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     f44:	0f 82 8d fd ff ff    	jb     cd7 <test_copy_on_write_main_child_alt+0x1b7>
     f4a:	e9 c5 fd ff ff       	jmp    d14 <test_copy_on_write_main_child_alt+0x1f4>
     f4f:	90                   	nop

00000f50 <test_copy_on_write_less_forks>:
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	56                   	push   %esi
     f54:	53                   	push   %ebx
  pipe(fds);
     f55:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     f58:	83 ec 1c             	sub    $0x1c,%esp
     f5b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f5e:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
     f61:	50                   	push   %eax
     f62:	e8 3b 0e 00 00       	call   1da2 <pipe>
  test_copy_on_write_main_child(fds[1], size, describe_size, forks);
     f67:	56                   	push   %esi
     f68:	53                   	push   %ebx
     f69:	ff 75 08             	pushl  0x8(%ebp)
     f6c:	ff 75 f4             	pushl  -0xc(%ebp)
     f6f:	e8 ec f8 ff ff       	call   860 <test_copy_on_write_main_child>
  char text[2] = {'X', 'X'};
     f74:	b8 58 58 00 00       	mov    $0x5858,%eax
  read(fds[0], text, 2);
     f79:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
     f7c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  read(fds[0], text, 2);
     f80:	8d 45 ee             	lea    -0x12(%ebp),%eax
     f83:	6a 02                	push   $0x2
     f85:	50                   	push   %eax
     f86:	ff 75 f0             	pushl  -0x10(%ebp)
     f89:	e8 1c 0e 00 00       	call   1daa <read>
  close(fds[0]); close(fds[1]);
     f8e:	5a                   	pop    %edx
     f8f:	ff 75 f0             	pushl  -0x10(%ebp)
     f92:	e8 23 0e 00 00       	call   1dba <close>
     f97:	59                   	pop    %ecx
     f98:	ff 75 f4             	pushl  -0xc(%ebp)
     f9b:	e8 1a 0e 00 00       	call   1dba <close>
  if (text[0] == 'X') {
     fa0:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
     fa4:	83 c4 10             	add    $0x10,%esp
     fa7:	3c 58                	cmp    $0x58,%al
     fa9:	74 75                	je     1020 <test_copy_on_write_less_forks+0xd0>
  } else if (text[0] == 'N') {
     fab:	3c 4e                	cmp    $0x4e,%al
     fad:	75 39                	jne    fe8 <test_copy_on_write_less_forks+0x98>
    switch (text[1]) {
     faf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fb3:	3c 63                	cmp    $0x63,%al
     fb5:	0f 84 a5 00 00 00    	je     1060 <test_copy_on_write_less_forks+0x110>
     fbb:	0f 8e 7f 00 00 00    	jle    1040 <test_copy_on_write_less_forks+0xf0>
     fc1:	3c 66                	cmp    $0x66,%al
     fc3:	74 43                	je     1008 <test_copy_on_write_less_forks+0xb8>
     fc5:	3c 70                	cmp    $0x70,%al
     fc7:	0f 85 b3 00 00 00    	jne    1080 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
     fcd:	83 ec 08             	sub    $0x8,%esp
     fd0:	68 58 26 00 00       	push   $0x2658
     fd5:	6a 01                	push   $0x1
     fd7:	e8 34 0f 00 00       	call   1f10 <printf>
      break;
     fdc:	83 c4 10             	add    $0x10,%esp
    return 0;
     fdf:	31 c0                	xor    %eax,%eax
      break;
     fe1:	eb 1b                	jmp    ffe <test_copy_on_write_less_forks+0xae>
     fe3:	90                   	nop
     fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
     fe8:	56                   	push   %esi
     fe9:	53                   	push   %ebx
     fea:	68 64 27 00 00       	push   $0x2764
     fef:	6a 01                	push   $0x1
     ff1:	e8 1a 0f 00 00       	call   1f10 <printf>
    return 1;
     ff6:	83 c4 10             	add    $0x10,%esp
     ff9:	b8 01 00 00 00       	mov    $0x1,%eax
}
     ffe:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1001:	5b                   	pop    %ebx
    1002:	5e                   	pop    %esi
    1003:	5d                   	pop    %ebp
    1004:	c3                   	ret    
    1005:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1008:	83 ec 08             	sub    $0x8,%esp
    100b:	68 20 26 00 00       	push   $0x2620
    1010:	6a 01                	push   $0x1
    1012:	e8 f9 0e 00 00       	call   1f10 <printf>
      break;
    1017:	83 c4 10             	add    $0x10,%esp
    return 0;
    101a:	31 c0                	xor    %eax,%eax
      break;
    101c:	eb e0                	jmp    ffe <test_copy_on_write_less_forks+0xae>
    101e:	66 90                	xchg   %ax,%ax
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1020:	83 ec 08             	sub    $0x8,%esp
    1023:	68 f0 25 00 00       	push   $0x25f0
    1028:	6a 01                	push   $0x1
    102a:	e8 e1 0e 00 00       	call   1f10 <printf>
    return 0;
    102f:	83 c4 10             	add    $0x10,%esp
}
    1032:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1035:	31 c0                	xor    %eax,%eax
}
    1037:	5b                   	pop    %ebx
    1038:	5e                   	pop    %esi
    1039:	5d                   	pop    %ebp
    103a:	c3                   	ret    
    103b:	90                   	nop
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch (text[1]) {
    1040:	3c 50                	cmp    $0x50,%al
    1042:	75 3c                	jne    1080 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- pipe read problem\n");
    1044:	83 ec 08             	sub    $0x8,%esp
    1047:	68 a4 26 00 00       	push   $0x26a4
    104c:	6a 01                	push   $0x1
    104e:	e8 bd 0e 00 00       	call   1f10 <printf>
      break;
    1053:	83 c4 10             	add    $0x10,%esp
    return 0;
    1056:	31 c0                	xor    %eax,%eax
      break;
    1058:	eb a4                	jmp    ffe <test_copy_on_write_less_forks+0xae>
    105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1060:	83 ec 08             	sub    $0x8,%esp
    1063:	68 e0 26 00 00       	push   $0x26e0
    1068:	6a 01                	push   $0x1
    106a:	e8 a1 0e 00 00       	call   1f10 <printf>
      break;
    106f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1072:	31 c0                	xor    %eax,%eax
      break;
    1074:	eb 88                	jmp    ffe <test_copy_on_write_less_forks+0xae>
    1076:	8d 76 00             	lea    0x0(%esi),%esi
    1079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    1080:	83 ec 08             	sub    $0x8,%esp
    1083:	68 2c 27 00 00       	push   $0x272c
    1088:	6a 01                	push   $0x1
    108a:	e8 81 0e 00 00       	call   1f10 <printf>
      break;
    108f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1092:	31 c0                	xor    %eax,%eax
      break;
    1094:	e9 65 ff ff ff       	jmp    ffe <test_copy_on_write_less_forks+0xae>
    1099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010a0 <test_copy_on_write_less_forks_alt>:
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	56                   	push   %esi
    10a4:	53                   	push   %ebx
  pipe(fds);
    10a5:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    10a8:	83 ec 1c             	sub    $0x1c,%esp
    10ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    10ae:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
    10b1:	50                   	push   %eax
    10b2:	e8 eb 0c 00 00       	call   1da2 <pipe>
  test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    10b7:	58                   	pop    %eax
    10b8:	ff 75 14             	pushl  0x14(%ebp)
    10bb:	56                   	push   %esi
    10bc:	53                   	push   %ebx
    10bd:	ff 75 08             	pushl  0x8(%ebp)
    10c0:	ff 75 f4             	pushl  -0xc(%ebp)
    10c3:	e8 58 fa ff ff       	call   b20 <test_copy_on_write_main_child_alt>
  read(fds[0], text, 2);
    10c8:	8d 45 ee             	lea    -0x12(%ebp),%eax
    10cb:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
    10ce:	ba 58 58 00 00       	mov    $0x5858,%edx
  read(fds[0], text, 2);
    10d3:	6a 02                	push   $0x2
  char text[2] = {'X', 'X'};
    10d5:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  read(fds[0], text, 2);
    10d9:	50                   	push   %eax
    10da:	ff 75 f0             	pushl  -0x10(%ebp)
    10dd:	e8 c8 0c 00 00       	call   1daa <read>
  close(fds[0]); close(fds[1]);
    10e2:	59                   	pop    %ecx
    10e3:	ff 75 f0             	pushl  -0x10(%ebp)
    10e6:	e8 cf 0c 00 00       	call   1dba <close>
    10eb:	58                   	pop    %eax
    10ec:	ff 75 f4             	pushl  -0xc(%ebp)
    10ef:	e8 c6 0c 00 00       	call   1dba <close>
  if (text[0] == 'X') {
    10f4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    10f8:	83 c4 10             	add    $0x10,%esp
    10fb:	3c 58                	cmp    $0x58,%al
    10fd:	0f 84 7d 00 00 00    	je     1180 <test_copy_on_write_less_forks_alt+0xe0>
  } else if (text[0] == 'N') {
    1103:	3c 4e                	cmp    $0x4e,%al
    1105:	75 39                	jne    1140 <test_copy_on_write_less_forks_alt+0xa0>
    switch (text[1]) {
    1107:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    110b:	3c 66                	cmp    $0x66,%al
    110d:	0f 84 ad 00 00 00    	je     11c0 <test_copy_on_write_less_forks_alt+0x120>
    1113:	3c 70                	cmp    $0x70,%al
    1115:	0f 84 85 00 00 00    	je     11a0 <test_copy_on_write_less_forks_alt+0x100>
    111b:	3c 63                	cmp    $0x63,%al
    111d:	74 41                	je     1160 <test_copy_on_write_less_forks_alt+0xc0>
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    111f:	83 ec 08             	sub    $0x8,%esp
    1122:	68 2c 27 00 00       	push   $0x272c
    1127:	6a 01                	push   $0x1
    1129:	e8 e2 0d 00 00       	call   1f10 <printf>
      break;
    112e:	83 c4 10             	add    $0x10,%esp
}
    1131:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1134:	31 c0                	xor    %eax,%eax
}
    1136:	5b                   	pop    %ebx
    1137:	5e                   	pop    %esi
    1138:	5d                   	pop    %ebp
    1139:	c3                   	ret    
    113a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
    1140:	56                   	push   %esi
    1141:	53                   	push   %ebx
    1142:	68 64 27 00 00       	push   $0x2764
    1147:	6a 01                	push   $0x1
    1149:	e8 c2 0d 00 00       	call   1f10 <printf>
    return 1;
    114e:	83 c4 10             	add    $0x10,%esp
}
    1151:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 1;
    1154:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1159:	5b                   	pop    %ebx
    115a:	5e                   	pop    %esi
    115b:	5d                   	pop    %ebp
    115c:	c3                   	ret    
    115d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1160:	83 ec 08             	sub    $0x8,%esp
    1163:	68 e0 26 00 00       	push   $0x26e0
    1168:	6a 01                	push   $0x1
    116a:	e8 a1 0d 00 00       	call   1f10 <printf>
      break;
    116f:	83 c4 10             	add    $0x10,%esp
}
    1172:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1175:	31 c0                	xor    %eax,%eax
}
    1177:	5b                   	pop    %ebx
    1178:	5e                   	pop    %esi
    1179:	5d                   	pop    %ebp
    117a:	c3                   	ret    
    117b:	90                   	nop
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1180:	83 ec 08             	sub    $0x8,%esp
    1183:	68 f0 25 00 00       	push   $0x25f0
    1188:	6a 01                	push   $0x1
    118a:	e8 81 0d 00 00       	call   1f10 <printf>
    return 0;
    118f:	83 c4 10             	add    $0x10,%esp
}
    1192:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1195:	31 c0                	xor    %eax,%eax
}
    1197:	5b                   	pop    %ebx
    1198:	5e                   	pop    %esi
    1199:	5d                   	pop    %ebp
    119a:	c3                   	ret    
    119b:	90                   	nop
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    11a0:	83 ec 08             	sub    $0x8,%esp
    11a3:	68 58 26 00 00       	push   $0x2658
    11a8:	6a 01                	push   $0x1
    11aa:	e8 61 0d 00 00       	call   1f10 <printf>
      break;
    11af:	83 c4 10             	add    $0x10,%esp
}
    11b2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    11b5:	31 c0                	xor    %eax,%eax
}
    11b7:	5b                   	pop    %ebx
    11b8:	5e                   	pop    %esi
    11b9:	5d                   	pop    %ebp
    11ba:	c3                   	ret    
    11bb:	90                   	nop
    11bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    11c0:	83 ec 08             	sub    $0x8,%esp
    11c3:	68 20 26 00 00       	push   $0x2620
    11c8:	6a 01                	push   $0x1
    11ca:	e8 41 0d 00 00       	call   1f10 <printf>
      break;
    11cf:	83 c4 10             	add    $0x10,%esp
}
    11d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    11d5:	31 c0                	xor    %eax,%eax
}
    11d7:	5b                   	pop    %ebx
    11d8:	5e                   	pop    %esi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret    
    11db:	90                   	nop
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011e0 <_test_copy_on_write>:
int _test_copy_on_write(int size,  const char *describe_size, int forks, int use_alt, int early_term, int pre_alloc, const char* describe_prealloc) {
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	83 ec 44             	sub    $0x44,%esp
  pipe(fds);
    11e6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    11e9:	50                   	push   %eax
    11ea:	e8 b3 0b 00 00       	call   1da2 <pipe>
  int pid = fork();
    11ef:	e8 96 0b 00 00       	call   1d8a <fork>
  if (pid == 0) {
    11f4:	83 c4 10             	add    $0x10,%esp
    11f7:	83 f8 00             	cmp    $0x0,%eax
    11fa:	0f 84 d6 01 00 00    	je     13d6 <_test_copy_on_write+0x1f6>
  } else if (pid > 0) {
    1200:	7f 16                	jg     1218 <_test_copy_on_write+0x38>
    1202:	89 c2                	mov    %eax,%edx
  return 0;
    1204:	31 c0                	xor    %eax,%eax
  } else if (pid == -1) {
    1206:	83 fa ff             	cmp    $0xffffffff,%edx
    1209:	0f 84 11 01 00 00    	je     1320 <_test_copy_on_write+0x140>
}
    120f:	c9                   	leave  
    1210:	c3                   	ret    
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "running copy on write test: ");
    1218:	83 ec 08             	sub    $0x8,%esp
    121b:	68 f7 22 00 00       	push   $0x22f7
    1220:	6a 01                	push   $0x1
    1222:	e8 e9 0c 00 00       	call   1f10 <printf>
    if (pre_alloc > 0) {
    1227:	8b 45 1c             	mov    0x1c(%ebp),%eax
    122a:	83 c4 10             	add    $0x10,%esp
    122d:	85 c0                	test   %eax,%eax
    122f:	7e 15                	jle    1246 <_test_copy_on_write+0x66>
      printf(1, "allocate but do not use %s; ", describe_prealloc);
    1231:	83 ec 04             	sub    $0x4,%esp
    1234:	ff 75 20             	pushl  0x20(%ebp)
    1237:	68 14 23 00 00       	push   $0x2314
    123c:	6a 01                	push   $0x1
    123e:	e8 cd 0c 00 00       	call   1f10 <printf>
    1243:	83 c4 10             	add    $0x10,%esp
    printf(1, "allocate and use %s; fork %d children; read+write small parts in each child",
    1246:	ff 75 10             	pushl  0x10(%ebp)
    1249:	ff 75 0c             	pushl  0xc(%ebp)
    124c:	68 d4 27 00 00       	push   $0x27d4
    1251:	6a 01                	push   $0x1
    1253:	e8 b8 0c 00 00       	call   1f10 <printf>
    if (use_alt) {
    1258:	8b 45 14             	mov    0x14(%ebp),%eax
    125b:	83 c4 10             	add    $0x10,%esp
    125e:	85 c0                	test   %eax,%eax
    1260:	0f 85 da 00 00 00    	jne    1340 <_test_copy_on_write+0x160>
    printf(1, "\n");
    1266:	83 ec 08             	sub    $0x8,%esp
    1269:	68 5c 23 00 00       	push   $0x235c
    126e:	6a 01                	push   $0x1
    1270:	e8 9b 0c 00 00       	call   1f10 <printf>
    close(fds[1]);
    1275:	5a                   	pop    %edx
    1276:	ff 75 e8             	pushl  -0x18(%ebp)
    char text[10] = {'X', 'X'};
    1279:	b8 58 58 00 00       	mov    $0x5858,%eax
    127e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1285:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    128c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    close(fds[1]);
    1290:	e8 25 0b 00 00       	call   1dba <close>
    read(fds[0], text, 10);
    1295:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1298:	83 c4 0c             	add    $0xc,%esp
    129b:	6a 0a                	push   $0xa
    129d:	50                   	push   %eax
    129e:	ff 75 e4             	pushl  -0x1c(%ebp)
    12a1:	e8 04 0b 00 00       	call   1daa <read>
    wait();
    12a6:	e8 ef 0a 00 00       	call   1d9a <wait>
    close(fds[0]);
    12ab:	59                   	pop    %ecx
    12ac:	ff 75 e4             	pushl  -0x1c(%ebp)
    12af:	e8 06 0b 00 00       	call   1dba <close>
    if (text[0] == 'X') {
    12b4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    12b8:	83 c4 10             	add    $0x10,%esp
    12bb:	3c 58                	cmp    $0x58,%al
    12bd:	0f 84 9d 00 00 00    	je     1360 <_test_copy_on_write+0x180>
    } else if (text[0] == 'N') {
    12c3:	3c 4e                	cmp    $0x4e,%al
    12c5:	75 39                	jne    1300 <_test_copy_on_write+0x120>
      switch (text[1]) {
    12c7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    12cb:	3c 66                	cmp    $0x66,%al
    12cd:	0f 84 ad 00 00 00    	je     1380 <_test_copy_on_write+0x1a0>
    12d3:	3c 70                	cmp    $0x70,%al
    12d5:	0f 84 e5 00 00 00    	je     13c0 <_test_copy_on_write+0x1e0>
    12db:	3c 63                	cmp    $0x63,%al
    12dd:	0f 84 bd 00 00 00    	je     13a0 <_test_copy_on_write+0x1c0>
        printf(1, FAIL_MSG "copy on write test failed --- unknown reason\n");
    12e3:	83 ec 08             	sub    $0x8,%esp
    12e6:	68 2c 27 00 00       	push   $0x272c
    12eb:	6a 01                	push   $0x1
    12ed:	e8 1e 0c 00 00       	call   1f10 <printf>
        break;
    12f2:	83 c4 10             	add    $0x10,%esp
      return 0;
    12f5:	31 c0                	xor    %eax,%eax
}
    12f7:	c9                   	leave  
    12f8:	c3                   	ret    
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, PASS_MSG "copy on write test passed\n");
    1300:	83 ec 08             	sub    $0x8,%esp
    1303:	68 50 28 00 00       	push   $0x2850
    1308:	6a 01                	push   $0x1
    130a:	e8 01 0c 00 00       	call   1f10 <printf>
      return 1;
    130f:	83 c4 10             	add    $0x10,%esp
    1312:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1317:	c9                   	leave  
    1318:	c3                   	ret    
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1326:	68 78 28 00 00       	push   $0x2878
    132b:	6a 01                	push   $0x1
    132d:	e8 de 0b 00 00       	call   1f10 <printf>
    1332:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1335:	83 c4 10             	add    $0x10,%esp
}
    1338:	c9                   	leave  
    1339:	c3                   	ret    
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, " [and try to keep children running in parallel]");
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	68 20 28 00 00       	push   $0x2820
    1348:	6a 01                	push   $0x1
    134a:	e8 c1 0b 00 00       	call   1f10 <printf>
    134f:	83 c4 10             	add    $0x10,%esp
    1352:	e9 0f ff ff ff       	jmp    1266 <_test_copy_on_write+0x86>
    1357:	89 f6                	mov    %esi,%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1360:	83 ec 08             	sub    $0x8,%esp
    1363:	68 f0 25 00 00       	push   $0x25f0
    1368:	6a 01                	push   $0x1
    136a:	e8 a1 0b 00 00       	call   1f10 <printf>
      return 0;
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	31 c0                	xor    %eax,%eax
}
    1374:	c9                   	leave  
    1375:	c3                   	ret    
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1380:	83 ec 08             	sub    $0x8,%esp
    1383:	68 20 26 00 00       	push   $0x2620
    1388:	6a 01                	push   $0x1
    138a:	e8 81 0b 00 00       	call   1f10 <printf>
        break;
    138f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1392:	31 c0                	xor    %eax,%eax
}
    1394:	c9                   	leave  
    1395:	c3                   	ret    
    1396:	8d 76 00             	lea    0x0(%esi),%esi
    1399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    13a0:	83 ec 08             	sub    $0x8,%esp
    13a3:	68 e0 26 00 00       	push   $0x26e0
    13a8:	6a 01                	push   $0x1
    13aa:	e8 61 0b 00 00       	call   1f10 <printf>
        break;
    13af:	83 c4 10             	add    $0x10,%esp
      return 0;
    13b2:	31 c0                	xor    %eax,%eax
}
    13b4:	c9                   	leave  
    13b5:	c3                   	ret    
    13b6:	8d 76 00             	lea    0x0(%esi),%esi
    13b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    13c0:	83 ec 08             	sub    $0x8,%esp
    13c3:	68 58 26 00 00       	push   $0x2658
    13c8:	6a 01                	push   $0x1
    13ca:	e8 41 0b 00 00       	call   1f10 <printf>
        break;
    13cf:	83 c4 10             	add    $0x10,%esp
      return 0;
    13d2:	31 c0                	xor    %eax,%eax
}
    13d4:	c9                   	leave  
    13d5:	c3                   	ret    
    if (pre_alloc > 0) {
    13d6:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
    13da:	7e 0e                	jle    13ea <_test_copy_on_write+0x20a>
      sbrk(pre_alloc);
    13dc:	83 ec 0c             	sub    $0xc,%esp
    13df:	ff 75 1c             	pushl  0x1c(%ebp)
    13e2:	e8 33 0a 00 00       	call   1e1a <sbrk>
    13e7:	83 c4 10             	add    $0x10,%esp
    if (use_alt) {
    13ea:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13f1:	74 1d                	je     1410 <_test_copy_on_write+0x230>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    13f3:	83 ec 0c             	sub    $0xc,%esp
    13f6:	ff 75 18             	pushl  0x18(%ebp)
    13f9:	ff 75 10             	pushl  0x10(%ebp)
    13fc:	ff 75 0c             	pushl  0xc(%ebp)
    13ff:	ff 75 08             	pushl  0x8(%ebp)
    1402:	50                   	push   %eax
    1403:	e8 18 f7 ff ff       	call   b20 <test_copy_on_write_main_child_alt>
    1408:	83 c4 20             	add    $0x20,%esp
    exit();
    140b:	e8 82 09 00 00       	call   1d92 <exit>
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    1410:	ff 75 10             	pushl  0x10(%ebp)
    1413:	ff 75 0c             	pushl  0xc(%ebp)
    1416:	ff 75 08             	pushl  0x8(%ebp)
    1419:	50                   	push   %eax
    141a:	e8 41 f4 ff ff       	call   860 <test_copy_on_write_main_child>
    141f:	83 c4 10             	add    $0x10,%esp
    1422:	eb e7                	jmp    140b <_test_copy_on_write+0x22b>
    1424:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    142a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001430 <test_copy_on_write>:
int test_copy_on_write(int size, const char *describe_size, int forks) {
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
    1436:	68 5d 23 00 00       	push   $0x235d
    143b:	6a 00                	push   $0x0
    143d:	6a 00                	push   $0x0
    143f:	6a 00                	push   $0x0
    1441:	ff 75 10             	pushl  0x10(%ebp)
    1444:	ff 75 0c             	pushl  0xc(%ebp)
    1447:	ff 75 08             	pushl  0x8(%ebp)
    144a:	e8 91 fd ff ff       	call   11e0 <_test_copy_on_write>
}
    144f:	c9                   	leave  
    1450:	c3                   	ret    
    1451:	eb 0d                	jmp    1460 <test_copy_on_write_alloc_unused>
    1453:	90                   	nop
    1454:	90                   	nop
    1455:	90                   	nop
    1456:	90                   	nop
    1457:	90                   	nop
    1458:	90                   	nop
    1459:	90                   	nop
    145a:	90                   	nop
    145b:	90                   	nop
    145c:	90                   	nop
    145d:	90                   	nop
    145e:	90                   	nop
    145f:	90                   	nop

00001460 <test_copy_on_write_alloc_unused>:

int test_copy_on_write_alloc_unused(int unused_size, const char *describe_unused_size, int size, const char *describe_size, int forks) {
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
    1466:	ff 75 0c             	pushl  0xc(%ebp)
    1469:	ff 75 08             	pushl  0x8(%ebp)
    146c:	6a 00                	push   $0x0
    146e:	6a 00                	push   $0x0
    1470:	ff 75 18             	pushl  0x18(%ebp)
    1473:	ff 75 14             	pushl  0x14(%ebp)
    1476:	ff 75 10             	pushl  0x10(%ebp)
    1479:	e8 62 fd ff ff       	call   11e0 <_test_copy_on_write>
}
    147e:	c9                   	leave  
    147f:	c3                   	ret    

00001480 <test_copy_on_write_alt>:

int test_copy_on_write_alt(int size, const char *describe_size, int forks) {
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
    1486:	68 5d 23 00 00       	push   $0x235d
    148b:	6a 00                	push   $0x0
    148d:	6a 00                	push   $0x0
    148f:	6a 01                	push   $0x1
    1491:	ff 75 10             	pushl  0x10(%ebp)
    1494:	ff 75 0c             	pushl  0xc(%ebp)
    1497:	ff 75 08             	pushl  0x8(%ebp)
    149a:	e8 41 fd ff ff       	call   11e0 <_test_copy_on_write>
}
    149f:	c9                   	leave  
    14a0:	c3                   	ret    
    14a1:	eb 0d                	jmp    14b0 <test_read_into_alloc_no_fork>
    14a3:	90                   	nop
    14a4:	90                   	nop
    14a5:	90                   	nop
    14a6:	90                   	nop
    14a7:	90                   	nop
    14a8:	90                   	nop
    14a9:	90                   	nop
    14aa:	90                   	nop
    14ab:	90                   	nop
    14ac:	90                   	nop
    14ad:	90                   	nop
    14ae:	90                   	nop
    14af:	90                   	nop

000014b0 <test_read_into_alloc_no_fork>:

int test_read_into_alloc_no_fork(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	57                   	push   %edi
    14b4:	56                   	push   %esi
    14b5:	53                   	push   %ebx
    14b6:	83 ec 28             	sub    $0x28,%esp
    14b9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    printf(1, "testing read(), writing %d bytes to a location %s into a %s allocation\n",
    14bc:	ff 75 14             	pushl  0x14(%ebp)
    14bf:	ff 75 18             	pushl  0x18(%ebp)
    14c2:	53                   	push   %ebx
    14c3:	68 b4 28 00 00       	push   $0x28b4
    14c8:	6a 01                	push   $0x1
    14ca:	e8 41 0a 00 00       	call   1f10 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    14cf:	83 c4 18             	add    $0x18,%esp
    14d2:	68 01 02 00 00       	push   $0x201
    14d7:	68 3f 23 00 00       	push   $0x233f
    14dc:	e8 f1 08 00 00       	call   1dd2 <open>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	89 c6                	mov    %eax,%esi
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    14e6:	31 c0                	xor    %eax,%eax
    14e8:	90                   	nop
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    14f0:	c6 80 80 32 00 00 58 	movb   $0x58,0x3280(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    14f7:	83 c0 01             	add    $0x1,%eax
    14fa:	3d 80 00 00 00       	cmp    $0x80,%eax
    14ff:	75 ef                	jne    14f0 <test_read_into_alloc_no_fork+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1501:	85 db                	test   %ebx,%ebx
    1503:	0f 8e 8d 01 00 00    	jle    1696 <test_read_into_alloc_no_fork+0x1e6>
    1509:	31 ff                	xor    %edi,%edi
    150b:	90                   	nop
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        write(fd, buffer, sizeof buffer);
    1510:	83 ec 04             	sub    $0x4,%esp
    1513:	83 ef 80             	sub    $0xffffff80,%edi
    1516:	68 80 00 00 00       	push   $0x80
    151b:	68 80 32 00 00       	push   $0x3280
    1520:	56                   	push   %esi
    1521:	e8 8c 08 00 00       	call   1db2 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1526:	83 c4 10             	add    $0x10,%esp
    1529:	39 fb                	cmp    %edi,%ebx
    152b:	7f e3                	jg     1510 <test_read_into_alloc_no_fork+0x60>
    }
    close(fd);
    152d:	83 ec 0c             	sub    $0xc,%esp
    1530:	56                   	push   %esi
    1531:	e8 84 08 00 00       	call   1dba <close>
    fd = open("tempfile", O_RDONLY);
    1536:	58                   	pop    %eax
    1537:	5a                   	pop    %edx
    1538:	6a 00                	push   $0x0
    153a:	68 3f 23 00 00       	push   $0x233f
    153f:	e8 8e 08 00 00       	call   1dd2 <open>
    if (fd == -1) {
    1544:	83 c4 10             	add    $0x10,%esp
    1547:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    154a:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    154c:	0f 84 0a 01 00 00    	je     165c <test_read_into_alloc_no_fork+0x1ac>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    1552:	83 ec 0c             	sub    $0xc,%esp
    1555:	6a 00                	push   $0x0
    1557:	e8 be 08 00 00       	call   1e1a <sbrk>
    sbrk(size);
    155c:	59                   	pop    %ecx
    155d:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    1560:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1562:	e8 b3 08 00 00       	call   1e1a <sbrk>
    char *loc = heap + offset;
    1567:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    156a:	83 c4 0c             	add    $0xc,%esp
    156d:	53                   	push   %ebx
    char *loc = heap + offset;
    156e:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1570:	51                   	push   %ecx
    1571:	56                   	push   %esi
    1572:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1575:	e8 30 08 00 00       	call   1daa <read>
    int failed_value = 0;
    failed_value = loc[-1] != '\0';
    157a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    int count = read(fd, loc, read_count);
    157d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    1580:	31 d2                	xor    %edx,%edx
    1582:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < read_count; ++i) {
        if (loc[i] != 'X') {
            failed_value = 1;
    1585:	bf 01 00 00 00       	mov    $0x1,%edi
    failed_value = loc[-1] != '\0';
    158a:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    158e:	0f 95 c2             	setne  %dl
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1591:	31 c0                	xor    %eax,%eax
    1593:	90                   	nop
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            failed_value = 1;
    1598:	80 3c 01 58          	cmpb   $0x58,(%ecx,%eax,1)
    159c:	0f 45 d7             	cmovne %edi,%edx
    for (int i = 0; i < read_count; ++i) {
    159f:	83 c0 01             	add    $0x1,%eax
    15a2:	39 c3                	cmp    %eax,%ebx
    15a4:	7f f2                	jg     1598 <test_read_into_alloc_no_fork+0xe8>
    15a6:	8b 7d 08             	mov    0x8(%ebp),%edi
    15a9:	89 55 e0             	mov    %edx,-0x20(%ebp)
    15ac:	f7 df                	neg    %edi
        }
    }
    if (loc[read_count] != '\0') {
    15ae:	80 3c 19 00          	cmpb   $0x0,(%ecx,%ebx,1)
    15b2:	75 4b                	jne    15ff <test_read_into_alloc_no_fork+0x14f>
        failed_value = 1;
    }
    close(fd);
    15b4:	83 ec 0c             	sub    $0xc,%esp
    15b7:	56                   	push   %esi
    15b8:	e8 fd 07 00 00       	call   1dba <close>
    unlink("tempfile");
    15bd:	c7 04 24 3f 23 00 00 	movl   $0x233f,(%esp)
    15c4:	e8 19 08 00 00       	call   1de2 <unlink>
    sbrk(-size);
    15c9:	89 3c 24             	mov    %edi,(%esp)
    15cc:	e8 49 08 00 00       	call   1e1a <sbrk>
    if (count != read_count) {
    15d1:	83 c4 10             	add    $0x10,%esp
    15d4:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    15d7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    15da:	75 64                	jne    1640 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong return value from read()\n");
        return 0;
    } else if (failed_value) {
    15dc:	85 d2                	test   %edx,%edx
    15de:	75 44                	jne    1624 <test_read_into_alloc_no_fork+0x174>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
        return 0;
    } else {
        printf(1, PASS_MSG "\n");
    15e0:	83 ec 08             	sub    $0x8,%esp
    15e3:	68 b8 22 00 00       	push   $0x22b8
    15e8:	6a 01                	push   $0x1
    15ea:	e8 21 09 00 00       	call   1f10 <printf>
        return 1;
    15ef:	83 c4 10             	add    $0x10,%esp
    }
}
    15f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 1;
    15f5:	b8 01 00 00 00       	mov    $0x1,%eax
}
    15fa:	5b                   	pop    %ebx
    15fb:	5e                   	pop    %esi
    15fc:	5f                   	pop    %edi
    15fd:	5d                   	pop    %ebp
    15fe:	c3                   	ret    
    close(fd);
    15ff:	83 ec 0c             	sub    $0xc,%esp
    1602:	56                   	push   %esi
    1603:	e8 b2 07 00 00       	call   1dba <close>
    unlink("tempfile");
    1608:	c7 04 24 3f 23 00 00 	movl   $0x233f,(%esp)
    160f:	e8 ce 07 00 00       	call   1de2 <unlink>
    sbrk(-size);
    1614:	89 3c 24             	mov    %edi,(%esp)
    1617:	e8 fe 07 00 00       	call   1e1a <sbrk>
    if (count != read_count) {
    161c:	83 c4 10             	add    $0x10,%esp
    161f:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    1622:	75 1c                	jne    1640 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1624:	83 ec 08             	sub    $0x8,%esp
    1627:	68 28 29 00 00       	push   $0x2928
    162c:	6a 01                	push   $0x1
    162e:	e8 dd 08 00 00       	call   1f10 <printf>
        return 0;
    1633:	83 c4 10             	add    $0x10,%esp
}
    1636:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1639:	31 c0                	xor    %eax,%eax
}
    163b:	5b                   	pop    %ebx
    163c:	5e                   	pop    %esi
    163d:	5f                   	pop    %edi
    163e:	5d                   	pop    %ebp
    163f:	c3                   	ret    
        printf(1, FAIL_MSG "wrong return value from read()\n");
    1640:	83 ec 08             	sub    $0x8,%esp
    1643:	68 fc 28 00 00       	push   $0x28fc
    1648:	6a 01                	push   $0x1
    164a:	e8 c1 08 00 00       	call   1f10 <printf>
        return 0;
    164f:	83 c4 10             	add    $0x10,%esp
}
    1652:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1655:	31 c0                	xor    %eax,%eax
}
    1657:	5b                   	pop    %ebx
    1658:	5e                   	pop    %esi
    1659:	5f                   	pop    %edi
    165a:	5d                   	pop    %ebp
    165b:	c3                   	ret    
        printf(2, "error opening tempfile");
    165c:	83 ec 08             	sub    $0x8,%esp
    165f:	68 31 23 00 00       	push   $0x2331
    1664:	6a 02                	push   $0x2
    1666:	e8 a5 08 00 00       	call   1f10 <printf>
    char *heap = sbrk(0);
    166b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1672:	e8 a3 07 00 00       	call   1e1a <sbrk>
    sbrk(size);
    1677:	59                   	pop    %ecx
    1678:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    167b:	89 c7                	mov    %eax,%edi
    sbrk(size);
    167d:	e8 98 07 00 00       	call   1e1a <sbrk>
    char *loc = heap + offset;
    1682:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    1685:	83 c4 0c             	add    $0xc,%esp
    1688:	53                   	push   %ebx
    char *loc = heap + offset;
    1689:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    168b:	51                   	push   %ecx
    168c:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    168f:	6a ff                	push   $0xffffffff
    1691:	e9 df fe ff ff       	jmp    1575 <test_read_into_alloc_no_fork+0xc5>
    close(fd);
    1696:	83 ec 0c             	sub    $0xc,%esp
    1699:	56                   	push   %esi
    169a:	e8 1b 07 00 00       	call   1dba <close>
    fd = open("tempfile", O_RDONLY);
    169f:	5e                   	pop    %esi
    16a0:	5f                   	pop    %edi
    16a1:	6a 00                	push   $0x0
    16a3:	68 3f 23 00 00       	push   $0x233f
    16a8:	e8 25 07 00 00       	call   1dd2 <open>
    if (fd == -1) {
    16ad:	83 c4 10             	add    $0x10,%esp
    16b0:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    16b3:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    16b5:	74 3f                	je     16f6 <test_read_into_alloc_no_fork+0x246>
    char *heap = sbrk(0);
    16b7:	83 ec 0c             	sub    $0xc,%esp
    16ba:	6a 00                	push   $0x0
    16bc:	e8 59 07 00 00       	call   1e1a <sbrk>
    16c1:	89 c7                	mov    %eax,%edi
    sbrk(size);
    16c3:	58                   	pop    %eax
    16c4:	ff 75 08             	pushl  0x8(%ebp)
    16c7:	e8 4e 07 00 00       	call   1e1a <sbrk>
    char *loc = heap + offset;
    16cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    16cf:	83 c4 0c             	add    $0xc,%esp
    16d2:	53                   	push   %ebx
    char *loc = heap + offset;
    16d3:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    16d5:	51                   	push   %ecx
    16d6:	56                   	push   %esi
    16d7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    16da:	e8 cb 06 00 00       	call   1daa <read>
    failed_value = loc[-1] != '\0';
    16df:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    16e2:	31 d2                	xor    %edx,%edx
    int count = read(fd, loc, read_count);
    16e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    16e7:	83 c4 10             	add    $0x10,%esp
    16ea:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    16ee:	0f 95 c2             	setne  %dl
    16f1:	e9 b0 fe ff ff       	jmp    15a6 <test_read_into_alloc_no_fork+0xf6>
        printf(2, "error opening tempfile");
    16f6:	50                   	push   %eax
    16f7:	50                   	push   %eax
    16f8:	68 31 23 00 00       	push   $0x2331
    16fd:	6a 02                	push   $0x2
    16ff:	e8 0c 08 00 00       	call   1f10 <printf>
    char *heap = sbrk(0);
    1704:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    170b:	e8 0a 07 00 00       	call   1e1a <sbrk>
    sbrk(size);
    1710:	5a                   	pop    %edx
    1711:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    1714:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1716:	e8 ff 06 00 00       	call   1e1a <sbrk>
    char *loc = heap + offset;
    171b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    171e:	83 c4 0c             	add    $0xc,%esp
    1721:	53                   	push   %ebx
    char *loc = heap + offset;
    1722:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1724:	51                   	push   %ecx
    1725:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1728:	6a ff                	push   $0xffffffff
    172a:	eb ae                	jmp    16da <test_read_into_alloc_no_fork+0x22a>
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001730 <test_read_into_alloc>:

int test_read_into_alloc(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1730:	55                   	push   %ebp
    1731:	89 e5                	mov    %esp,%ebp
    1733:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    1736:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1739:	50                   	push   %eax
    173a:	e8 63 06 00 00       	call   1da2 <pipe>
    int pid = fork();
    173f:	e8 46 06 00 00       	call   1d8a <fork>
    if (pid == 0) {
    1744:	83 c4 10             	add    $0x10,%esp
    1747:	85 c0                	test   %eax,%eax
    1749:	74 33                	je     177e <test_read_into_alloc+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	ff 75 f4             	pushl  -0xc(%ebp)
    1751:	e8 64 06 00 00       	call   1dba <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    1756:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1759:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    175c:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1760:	6a 01                	push   $0x1
    1762:	50                   	push   %eax
    1763:	ff 75 f0             	pushl  -0x10(%ebp)
    1766:	e8 3f 06 00 00       	call   1daa <read>
        wait();
    176b:	e8 2a 06 00 00       	call   1d9a <wait>
        return result_str[0] == 'Y';
    1770:	83 c4 10             	add    $0x10,%esp
    1773:	31 c0                	xor    %eax,%eax
    1775:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1779:	c9                   	leave  
        return result_str[0] == 'Y';
    177a:	0f 94 c0             	sete   %al
}
    177d:	c3                   	ret    
        close(pipe_fds[0]);
    177e:	83 ec 0c             	sub    $0xc,%esp
    1781:	ff 75 f0             	pushl  -0x10(%ebp)
    1784:	e8 31 06 00 00       	call   1dba <close>
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    1789:	5a                   	pop    %edx
    178a:	ff 75 18             	pushl  0x18(%ebp)
    178d:	ff 75 14             	pushl  0x14(%ebp)
    1790:	ff 75 10             	pushl  0x10(%ebp)
    1793:	ff 75 0c             	pushl  0xc(%ebp)
    1796:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1799:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    179d:	e8 0e fd ff ff       	call   14b0 <test_read_into_alloc_no_fork>
    17a2:	83 c4 20             	add    $0x20,%esp
    17a5:	85 c0                	test   %eax,%eax
    17a7:	74 04                	je     17ad <test_read_into_alloc+0x7d>
            result_str[0] = 'Y';
    17a9:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    17ad:	50                   	push   %eax
    17ae:	8d 45 ef             	lea    -0x11(%ebp),%eax
    17b1:	6a 01                	push   $0x1
    17b3:	50                   	push   %eax
    17b4:	ff 75 f4             	pushl  -0xc(%ebp)
    17b7:	e8 f6 05 00 00       	call   1db2 <write>
        exit();
    17bc:	e8 d1 05 00 00       	call   1d92 <exit>
    17c1:	eb 0d                	jmp    17d0 <test_read_into_cow_less_forks>
    17c3:	90                   	nop
    17c4:	90                   	nop
    17c5:	90                   	nop
    17c6:	90                   	nop
    17c7:	90                   	nop
    17c8:	90                   	nop
    17c9:	90                   	nop
    17ca:	90                   	nop
    17cb:	90                   	nop
    17cc:	90                   	nop
    17cd:	90                   	nop
    17ce:	90                   	nop
    17cf:	90                   	nop

000017d0 <test_read_into_cow_less_forks>:

int test_read_into_cow_less_forks(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    17d0:	55                   	push   %ebp
    17d1:	89 e5                	mov    %esp,%ebp
    17d3:	57                   	push   %edi
    17d4:	56                   	push   %esi
    17d5:	53                   	push   %ebx
    17d6:	83 ec 38             	sub    $0x38,%esp
    17d9:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing read(), writing %d bytes to a location %s into a %s copy-on-write allocation\n",
    17dc:	ff 75 14             	pushl  0x14(%ebp)
    17df:	ff 75 18             	pushl  0x18(%ebp)
    17e2:	57                   	push   %edi
    17e3:	68 5c 29 00 00       	push   $0x295c
    17e8:	6a 01                	push   $0x1
    17ea:	e8 21 07 00 00       	call   1f10 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    17ef:	83 c4 18             	add    $0x18,%esp
    17f2:	68 01 02 00 00       	push   $0x201
    17f7:	68 3f 23 00 00       	push   $0x233f
    17fc:	e8 d1 05 00 00       	call   1dd2 <open>
    1801:	83 c4 10             	add    $0x10,%esp
    1804:	89 c3                	mov    %eax,%ebx
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1806:	31 c0                	xor    %eax,%eax
    1808:	90                   	nop
    1809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    1810:	c6 80 00 32 00 00 58 	movb   $0x58,0x3200(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    1817:	83 c0 01             	add    $0x1,%eax
    181a:	3d 80 00 00 00       	cmp    $0x80,%eax
    181f:	75 ef                	jne    1810 <test_read_into_cow_less_forks+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1821:	85 ff                	test   %edi,%edi
    1823:	7e 28                	jle    184d <test_read_into_cow_less_forks+0x7d>
    1825:	31 f6                	xor    %esi,%esi
    1827:	89 f6                	mov    %esi,%esi
    1829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        write(fd, buffer, sizeof buffer);
    1830:	83 ec 04             	sub    $0x4,%esp
    1833:	83 ee 80             	sub    $0xffffff80,%esi
    1836:	68 80 00 00 00       	push   $0x80
    183b:	68 00 32 00 00       	push   $0x3200
    1840:	53                   	push   %ebx
    1841:	e8 6c 05 00 00       	call   1db2 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1846:	83 c4 10             	add    $0x10,%esp
    1849:	39 f7                	cmp    %esi,%edi
    184b:	7f e3                	jg     1830 <test_read_into_cow_less_forks+0x60>
    }
    close(fd);
    184d:	83 ec 0c             	sub    $0xc,%esp
    1850:	53                   	push   %ebx
    1851:	e8 64 05 00 00       	call   1dba <close>
    fd = open("tempfile", O_RDONLY);
    1856:	58                   	pop    %eax
    1857:	5a                   	pop    %edx
    1858:	6a 00                	push   $0x0
    185a:	68 3f 23 00 00       	push   $0x233f
    185f:	e8 6e 05 00 00       	call   1dd2 <open>
    if (fd == -1) {
    1864:	83 c4 10             	add    $0x10,%esp
    1867:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    186a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    if (fd == -1) {
    186d:	0f 84 03 01 00 00    	je     1976 <test_read_into_cow_less_forks+0x1a6>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    1873:	83 ec 0c             	sub    $0xc,%esp
    1876:	6a 00                	push   $0x0
    1878:	e8 9d 05 00 00       	call   1e1a <sbrk>
    187d:	89 c3                	mov    %eax,%ebx
    sbrk(size);
    187f:	58                   	pop    %eax
    1880:	ff 75 08             	pushl  0x8(%ebp)
    1883:	e8 92 05 00 00       	call   1e1a <sbrk>
    for (int i = 0; i < size; ++i) {
    1888:	8b 45 08             	mov    0x8(%ebp),%eax
    188b:	83 c4 10             	add    $0x10,%esp
    188e:	85 c0                	test   %eax,%eax
    1890:	7e 18                	jle    18aa <test_read_into_cow_less_forks+0xda>
    1892:	8b 55 08             	mov    0x8(%ebp),%edx
    1895:	89 d8                	mov    %ebx,%eax
    1897:	01 da                	add    %ebx,%edx
    1899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        heap[i] = 'Y';
    18a0:	c6 00 59             	movb   $0x59,(%eax)
    18a3:	83 c0 01             	add    $0x1,%eax
    for (int i = 0; i < size; ++i) {
    18a6:	39 c2                	cmp    %eax,%edx
    18a8:	75 f6                	jne    18a0 <test_read_into_cow_less_forks+0xd0>
    }
    char *loc = heap + offset;
    int pipe_fds[2];
    pipe(pipe_fds);
    18aa:	8d 45 e0             	lea    -0x20(%ebp),%eax
    18ad:	83 ec 0c             	sub    $0xc,%esp
    18b0:	50                   	push   %eax
    18b1:	e8 ec 04 00 00       	call   1da2 <pipe>
    int pid = fork();
    18b6:	e8 cf 04 00 00       	call   1d8a <fork>
    if (pid == 0) {
    18bb:	83 c4 10             	add    $0x10,%esp
    18be:	85 c0                	test   %eax,%eax
    18c0:	0f 84 c7 00 00 00    	je     198d <test_read_into_cow_less_forks+0x1bd>
            write(pipe_fds[1], "Y", 1);
        }
        close(pipe_fds[1]);
        exit();
    } else {
        close(pipe_fds[1]);
    18c6:	83 ec 0c             	sub    $0xc,%esp
    18c9:	ff 75 e4             	pushl  -0x1c(%ebp)
    18cc:	e8 e9 04 00 00       	call   1dba <close>
        char result_buf[1] = {'N'};
        read(pipe_fds[0], result_buf, 1);
    18d1:	8d 45 df             	lea    -0x21(%ebp),%eax
    18d4:	83 c4 0c             	add    $0xc,%esp
        char result_buf[1] = {'N'};
    18d7:	c6 45 df 4e          	movb   $0x4e,-0x21(%ebp)
        read(pipe_fds[0], result_buf, 1);
    18db:	6a 01                	push   $0x1
    18dd:	50                   	push   %eax
    18de:	ff 75 e0             	pushl  -0x20(%ebp)
    18e1:	e8 c4 04 00 00       	call   1daa <read>
        close(pipe_fds[0]);
    18e6:	58                   	pop    %eax
    18e7:	ff 75 e0             	pushl  -0x20(%ebp)
    18ea:	e8 cb 04 00 00       	call   1dba <close>
        wait();
    18ef:	e8 a6 04 00 00       	call   1d9a <wait>
        printf(1, "testing correct value for heap in parent after read() in child\n");
    18f4:	5a                   	pop    %edx
    18f5:	59                   	pop    %ecx
    18f6:	68 f0 29 00 00       	push   $0x29f0
    18fb:	6a 01                	push   $0x1
    18fd:	e8 0e 06 00 00       	call   1f10 <printf>
        int found_wrong = 0;
        for (int i = 0; i < size; ++i) {
    1902:	8b 75 08             	mov    0x8(%ebp),%esi
    1905:	83 c4 10             	add    $0x10,%esp
    1908:	85 f6                	test   %esi,%esi
    190a:	7e 40                	jle    194c <test_read_into_cow_less_forks+0x17c>
    190c:	8b 75 08             	mov    0x8(%ebp),%esi
        int found_wrong = 0;
    190f:	31 c0                	xor    %eax,%eax
            if (heap[i] != 'Y') {
                found_wrong = 1;
    1911:	ba 01 00 00 00       	mov    $0x1,%edx
    1916:	01 de                	add    %ebx,%esi
    1918:	90                   	nop
    1919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1920:	80 3b 59             	cmpb   $0x59,(%ebx)
    1923:	0f 45 c2             	cmovne %edx,%eax
    1926:	83 c3 01             	add    $0x1,%ebx
        for (int i = 0; i < size; ++i) {
    1929:	39 de                	cmp    %ebx,%esi
    192b:	75 f3                	jne    1920 <test_read_into_cow_less_forks+0x150>
    192d:	89 c3                	mov    %eax,%ebx
    192f:	83 f3 01             	xor    $0x1,%ebx
            }
        }
        if (found_wrong) { 
    1932:	85 c0                	test   %eax,%eax
    1934:	74 1b                	je     1951 <test_read_into_cow_less_forks+0x181>
            printf(1, FAIL_MSG "wrong value in parent after read() in child\n");
    1936:	83 ec 08             	sub    $0x8,%esp
    1939:	31 db                	xor    %ebx,%ebx
    193b:	68 30 2a 00 00       	push   $0x2a30
    1940:	6a 01                	push   $0x1
    1942:	e8 c9 05 00 00       	call   1f10 <printf>
    1947:	83 c4 10             	add    $0x10,%esp
    194a:	eb 17                	jmp    1963 <test_read_into_cow_less_forks+0x193>
        for (int i = 0; i < size; ++i) {
    194c:	bb 01 00 00 00       	mov    $0x1,%ebx
        } else {
            printf(1, PASS_MSG "correct value in parent after read into copy-on-write allocation\n");
    1951:	83 ec 08             	sub    $0x8,%esp
    1954:	68 68 2a 00 00       	push   $0x2a68
    1959:	6a 01                	push   $0x1
    195b:	e8 b0 05 00 00       	call   1f10 <printf>
    1960:	83 c4 10             	add    $0x10,%esp
        }
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    1963:	31 c0                	xor    %eax,%eax
    1965:	80 7d df 59          	cmpb   $0x59,-0x21(%ebp)
    1969:	0f 94 c0             	sete   %al
    }
}
    196c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    196f:	01 d8                	add    %ebx,%eax
}
    1971:	5b                   	pop    %ebx
    1972:	5e                   	pop    %esi
    1973:	5f                   	pop    %edi
    1974:	5d                   	pop    %ebp
    1975:	c3                   	ret    
        printf(2, "error opening tempfile");
    1976:	83 ec 08             	sub    $0x8,%esp
    1979:	68 31 23 00 00       	push   $0x2331
    197e:	6a 02                	push   $0x2
    1980:	e8 8b 05 00 00       	call   1f10 <printf>
    1985:	83 c4 10             	add    $0x10,%esp
    1988:	e9 e6 fe ff ff       	jmp    1873 <test_read_into_cow_less_forks+0xa3>
    char *loc = heap + offset;
    198d:	03 5d 0c             	add    0xc(%ebp),%ebx
        close(pipe_fds[0]);
    1990:	83 ec 0c             	sub    $0xc,%esp
    1993:	ff 75 e0             	pushl  -0x20(%ebp)
    1996:	89 45 cc             	mov    %eax,-0x34(%ebp)
    1999:	e8 1c 04 00 00       	call   1dba <close>
        int count = read(fd, loc, read_count);
    199e:	83 c4 0c             	add    $0xc,%esp
    19a1:	57                   	push   %edi
    19a2:	53                   	push   %ebx
    19a3:	ff 75 d4             	pushl  -0x2c(%ebp)
    19a6:	e8 ff 03 00 00       	call   1daa <read>
        failed_value = loc[-1] != 'Y';
    19ab:	31 c9                	xor    %ecx,%ecx
    19ad:	83 c4 10             	add    $0x10,%esp
    19b0:	80 7b ff 59          	cmpb   $0x59,-0x1(%ebx)
    19b4:	8b 55 cc             	mov    -0x34(%ebp),%edx
        int count = read(fd, loc, read_count);
    19b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
                failed_value = 1;
    19ba:	b8 01 00 00 00       	mov    $0x1,%eax
        failed_value = loc[-1] != 'Y';
    19bf:	0f 95 c1             	setne  %cl
        for (int i = 0; i < read_count; ++i) {
    19c2:	39 fa                	cmp    %edi,%edx
    19c4:	7d 0c                	jge    19d2 <test_read_into_cow_less_forks+0x202>
                failed_value = 1;
    19c6:	80 3c 13 58          	cmpb   $0x58,(%ebx,%edx,1)
    19ca:	0f 45 c8             	cmovne %eax,%ecx
        for (int i = 0; i < read_count; ++i) {
    19cd:	83 c2 01             	add    $0x1,%edx
    19d0:	eb f0                	jmp    19c2 <test_read_into_cow_less_forks+0x1f2>
    19d2:	8b 75 08             	mov    0x8(%ebp),%esi
    19d5:	f7 de                	neg    %esi
        if (loc[read_count] != 'Y') {
    19d7:	80 3c 3b 59          	cmpb   $0x59,(%ebx,%edi,1)
    19db:	74 5a                	je     1a37 <test_read_into_cow_less_forks+0x267>
        close(fd);
    19dd:	83 ec 0c             	sub    $0xc,%esp
    19e0:	ff 75 d4             	pushl  -0x2c(%ebp)
    19e3:	e8 d2 03 00 00       	call   1dba <close>
        unlink("tempfile");
    19e8:	c7 04 24 3f 23 00 00 	movl   $0x233f,(%esp)
    19ef:	e8 ee 03 00 00       	call   1de2 <unlink>
        sbrk(-size);
    19f4:	89 34 24             	mov    %esi,(%esp)
    19f7:	e8 1e 04 00 00       	call   1e1a <sbrk>
        if (count != read_count) {
    19fc:	83 c4 10             	add    $0x10,%esp
    19ff:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    1a02:	74 64                	je     1a68 <test_read_into_cow_less_forks+0x298>
            printf(1, FAIL_MSG "wrong return value from read()\n");
    1a04:	50                   	push   %eax
    1a05:	50                   	push   %eax
    1a06:	68 fc 28 00 00       	push   $0x28fc
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1a0b:	6a 01                	push   $0x1
    1a0d:	e8 fe 04 00 00       	call   1f10 <printf>
            write(pipe_fds[1], "N", 1);
    1a12:	83 c4 0c             	add    $0xc,%esp
    1a15:	6a 01                	push   $0x1
    1a17:	68 48 23 00 00       	push   $0x2348
    1a1c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a1f:	e8 8e 03 00 00       	call   1db2 <write>
    1a24:	83 c4 10             	add    $0x10,%esp
        close(pipe_fds[1]);
    1a27:	83 ec 0c             	sub    $0xc,%esp
    1a2a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a2d:	e8 88 03 00 00       	call   1dba <close>
        exit();
    1a32:	e8 5b 03 00 00       	call   1d92 <exit>
        close(fd);
    1a37:	83 ec 0c             	sub    $0xc,%esp
    1a3a:	ff 75 d4             	pushl  -0x2c(%ebp)
    1a3d:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    1a40:	e8 75 03 00 00       	call   1dba <close>
        unlink("tempfile");
    1a45:	c7 04 24 3f 23 00 00 	movl   $0x233f,(%esp)
    1a4c:	e8 91 03 00 00       	call   1de2 <unlink>
        sbrk(-size);
    1a51:	89 34 24             	mov    %esi,(%esp)
    1a54:	e8 c1 03 00 00       	call   1e1a <sbrk>
        if (count != read_count) {
    1a59:	83 c4 10             	add    $0x10,%esp
    1a5c:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    1a5f:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    1a62:	75 a0                	jne    1a04 <test_read_into_cow_less_forks+0x234>
        } else if (failed_value) {
    1a64:	85 c9                	test   %ecx,%ecx
    1a66:	74 09                	je     1a71 <test_read_into_cow_less_forks+0x2a1>
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1a68:	50                   	push   %eax
    1a69:	50                   	push   %eax
    1a6a:	68 28 29 00 00       	push   $0x2928
    1a6f:	eb 9a                	jmp    1a0b <test_read_into_cow_less_forks+0x23b>
            printf(1, PASS_MSG "correct value read into copy-on-write allocation\n");
    1a71:	57                   	push   %edi
    1a72:	57                   	push   %edi
    1a73:	68 b4 29 00 00       	push   $0x29b4
    1a78:	6a 01                	push   $0x1
    1a7a:	e8 91 04 00 00       	call   1f10 <printf>
            write(pipe_fds[1], "Y", 1);
    1a7f:	83 c4 0c             	add    $0xc,%esp
    1a82:	6a 01                	push   $0x1
    1a84:	68 c5 22 00 00       	push   $0x22c5
    1a89:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a8c:	e8 21 03 00 00       	call   1db2 <write>
    1a91:	83 c4 10             	add    $0x10,%esp
    1a94:	eb 91                	jmp    1a27 <test_read_into_cow_less_forks+0x257>
    1a96:	8d 76 00             	lea    0x0(%esi),%esi
    1a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001aa0 <test_read_into_cow>:

int test_read_into_cow(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1aa0:	55                   	push   %ebp
    1aa1:	89 e5                	mov    %esp,%ebp
    1aa3:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    1aa6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1aa9:	50                   	push   %eax
    1aaa:	e8 f3 02 00 00       	call   1da2 <pipe>
    int pid = fork();
    1aaf:	e8 d6 02 00 00       	call   1d8a <fork>
    if (pid == 0) {
    1ab4:	83 c4 10             	add    $0x10,%esp
    1ab7:	85 c0                	test   %eax,%eax
    1ab9:	74 33                	je     1aee <test_read_into_cow+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    1abb:	83 ec 0c             	sub    $0xc,%esp
    1abe:	ff 75 f4             	pushl  -0xc(%ebp)
    1ac1:	e8 f4 02 00 00       	call   1dba <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    1ac6:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1ac9:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    1acc:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1ad0:	6a 01                	push   $0x1
    1ad2:	50                   	push   %eax
    1ad3:	ff 75 f0             	pushl  -0x10(%ebp)
    1ad6:	e8 cf 02 00 00       	call   1daa <read>
        wait();
    1adb:	e8 ba 02 00 00       	call   1d9a <wait>
        return result_str[0] == 'Y';
    1ae0:	83 c4 10             	add    $0x10,%esp
    1ae3:	31 c0                	xor    %eax,%eax
    1ae5:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1ae9:	c9                   	leave  
        return result_str[0] == 'Y';
    1aea:	0f 94 c0             	sete   %al
}
    1aed:	c3                   	ret    
        close(pipe_fds[0]);
    1aee:	83 ec 0c             	sub    $0xc,%esp
    1af1:	ff 75 f0             	pushl  -0x10(%ebp)
    1af4:	e8 c1 02 00 00       	call   1dba <close>
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1af9:	5a                   	pop    %edx
    1afa:	ff 75 18             	pushl  0x18(%ebp)
    1afd:	ff 75 14             	pushl  0x14(%ebp)
    1b00:	ff 75 10             	pushl  0x10(%ebp)
    1b03:	ff 75 0c             	pushl  0xc(%ebp)
    1b06:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1b09:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1b0d:	e8 be fc ff ff       	call   17d0 <test_read_into_cow_less_forks>
    1b12:	83 c4 20             	add    $0x20,%esp
    1b15:	85 c0                	test   %eax,%eax
    1b17:	74 04                	je     1b1d <test_read_into_cow+0x7d>
            result_str[0] = 'Y';
    1b19:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    1b1d:	50                   	push   %eax
    1b1e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1b21:	6a 01                	push   $0x1
    1b23:	50                   	push   %eax
    1b24:	ff 75 f4             	pushl  -0xc(%ebp)
    1b27:	e8 86 02 00 00       	call   1db2 <write>
        exit();
    1b2c:	e8 61 02 00 00       	call   1d92 <exit>
    1b31:	66 90                	xchg   %ax,%ax
    1b33:	66 90                	xchg   %ax,%ax
    1b35:	66 90                	xchg   %ax,%ax
    1b37:	66 90                	xchg   %ax,%ax
    1b39:	66 90                	xchg   %ax,%ax
    1b3b:	66 90                	xchg   %ax,%ax
    1b3d:	66 90                	xchg   %ax,%ax
    1b3f:	90                   	nop

00001b40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	53                   	push   %ebx
    1b44:	8b 45 08             	mov    0x8(%ebp),%eax
    1b47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1b4a:	89 c2                	mov    %eax,%edx
    1b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b50:	83 c1 01             	add    $0x1,%ecx
    1b53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1b57:	83 c2 01             	add    $0x1,%edx
    1b5a:	84 db                	test   %bl,%bl
    1b5c:	88 5a ff             	mov    %bl,-0x1(%edx)
    1b5f:	75 ef                	jne    1b50 <strcpy+0x10>
    ;
  return os;
}
    1b61:	5b                   	pop    %ebx
    1b62:	5d                   	pop    %ebp
    1b63:	c3                   	ret    
    1b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1b70:	55                   	push   %ebp
    1b71:	89 e5                	mov    %esp,%ebp
    1b73:	53                   	push   %ebx
    1b74:	8b 55 08             	mov    0x8(%ebp),%edx
    1b77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1b7a:	0f b6 02             	movzbl (%edx),%eax
    1b7d:	0f b6 19             	movzbl (%ecx),%ebx
    1b80:	84 c0                	test   %al,%al
    1b82:	75 1c                	jne    1ba0 <strcmp+0x30>
    1b84:	eb 2a                	jmp    1bb0 <strcmp+0x40>
    1b86:	8d 76 00             	lea    0x0(%esi),%esi
    1b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1b90:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1b93:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1b96:	83 c1 01             	add    $0x1,%ecx
    1b99:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    1b9c:	84 c0                	test   %al,%al
    1b9e:	74 10                	je     1bb0 <strcmp+0x40>
    1ba0:	38 d8                	cmp    %bl,%al
    1ba2:	74 ec                	je     1b90 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1ba4:	29 d8                	sub    %ebx,%eax
}
    1ba6:	5b                   	pop    %ebx
    1ba7:	5d                   	pop    %ebp
    1ba8:	c3                   	ret    
    1ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bb0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1bb2:	29 d8                	sub    %ebx,%eax
}
    1bb4:	5b                   	pop    %ebx
    1bb5:	5d                   	pop    %ebp
    1bb6:	c3                   	ret    
    1bb7:	89 f6                	mov    %esi,%esi
    1bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bc0 <strlen>:

uint
strlen(char *s)
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1bc6:	80 39 00             	cmpb   $0x0,(%ecx)
    1bc9:	74 15                	je     1be0 <strlen+0x20>
    1bcb:	31 d2                	xor    %edx,%edx
    1bcd:	8d 76 00             	lea    0x0(%esi),%esi
    1bd0:	83 c2 01             	add    $0x1,%edx
    1bd3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1bd7:	89 d0                	mov    %edx,%eax
    1bd9:	75 f5                	jne    1bd0 <strlen+0x10>
    ;
  return n;
}
    1bdb:	5d                   	pop    %ebp
    1bdc:	c3                   	ret    
    1bdd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1be0:	31 c0                	xor    %eax,%eax
}
    1be2:	5d                   	pop    %ebp
    1be3:	c3                   	ret    
    1be4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001bf0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1bf0:	55                   	push   %ebp
    1bf1:	89 e5                	mov    %esp,%ebp
    1bf3:	57                   	push   %edi
    1bf4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1bf7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1bfa:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bfd:	89 d7                	mov    %edx,%edi
    1bff:	fc                   	cld    
    1c00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1c02:	89 d0                	mov    %edx,%eax
    1c04:	5f                   	pop    %edi
    1c05:	5d                   	pop    %ebp
    1c06:	c3                   	ret    
    1c07:	89 f6                	mov    %esi,%esi
    1c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c10 <strchr>:

char*
strchr(const char *s, char c)
{
    1c10:	55                   	push   %ebp
    1c11:	89 e5                	mov    %esp,%ebp
    1c13:	53                   	push   %ebx
    1c14:	8b 45 08             	mov    0x8(%ebp),%eax
    1c17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1c1a:	0f b6 10             	movzbl (%eax),%edx
    1c1d:	84 d2                	test   %dl,%dl
    1c1f:	74 1d                	je     1c3e <strchr+0x2e>
    if(*s == c)
    1c21:	38 d3                	cmp    %dl,%bl
    1c23:	89 d9                	mov    %ebx,%ecx
    1c25:	75 0d                	jne    1c34 <strchr+0x24>
    1c27:	eb 17                	jmp    1c40 <strchr+0x30>
    1c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c30:	38 ca                	cmp    %cl,%dl
    1c32:	74 0c                	je     1c40 <strchr+0x30>
  for(; *s; s++)
    1c34:	83 c0 01             	add    $0x1,%eax
    1c37:	0f b6 10             	movzbl (%eax),%edx
    1c3a:	84 d2                	test   %dl,%dl
    1c3c:	75 f2                	jne    1c30 <strchr+0x20>
      return (char*)s;
  return 0;
    1c3e:	31 c0                	xor    %eax,%eax
}
    1c40:	5b                   	pop    %ebx
    1c41:	5d                   	pop    %ebp
    1c42:	c3                   	ret    
    1c43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c50 <gets>:

char*
gets(char *buf, int max)
{
    1c50:	55                   	push   %ebp
    1c51:	89 e5                	mov    %esp,%ebp
    1c53:	57                   	push   %edi
    1c54:	56                   	push   %esi
    1c55:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c56:	31 f6                	xor    %esi,%esi
    1c58:	89 f3                	mov    %esi,%ebx
{
    1c5a:	83 ec 1c             	sub    $0x1c,%esp
    1c5d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1c60:	eb 2f                	jmp    1c91 <gets+0x41>
    1c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1c68:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1c6b:	83 ec 04             	sub    $0x4,%esp
    1c6e:	6a 01                	push   $0x1
    1c70:	50                   	push   %eax
    1c71:	6a 00                	push   $0x0
    1c73:	e8 32 01 00 00       	call   1daa <read>
    if(cc < 1)
    1c78:	83 c4 10             	add    $0x10,%esp
    1c7b:	85 c0                	test   %eax,%eax
    1c7d:	7e 1c                	jle    1c9b <gets+0x4b>
      break;
    buf[i++] = c;
    1c7f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c83:	83 c7 01             	add    $0x1,%edi
    1c86:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1c89:	3c 0a                	cmp    $0xa,%al
    1c8b:	74 23                	je     1cb0 <gets+0x60>
    1c8d:	3c 0d                	cmp    $0xd,%al
    1c8f:	74 1f                	je     1cb0 <gets+0x60>
  for(i=0; i+1 < max; ){
    1c91:	83 c3 01             	add    $0x1,%ebx
    1c94:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1c97:	89 fe                	mov    %edi,%esi
    1c99:	7c cd                	jl     1c68 <gets+0x18>
    1c9b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1c9d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1ca0:	c6 03 00             	movb   $0x0,(%ebx)
}
    1ca3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ca6:	5b                   	pop    %ebx
    1ca7:	5e                   	pop    %esi
    1ca8:	5f                   	pop    %edi
    1ca9:	5d                   	pop    %ebp
    1caa:	c3                   	ret    
    1cab:	90                   	nop
    1cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1cb0:	8b 75 08             	mov    0x8(%ebp),%esi
    1cb3:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb6:	01 de                	add    %ebx,%esi
    1cb8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1cba:	c6 03 00             	movb   $0x0,(%ebx)
}
    1cbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cc0:	5b                   	pop    %ebx
    1cc1:	5e                   	pop    %esi
    1cc2:	5f                   	pop    %edi
    1cc3:	5d                   	pop    %ebp
    1cc4:	c3                   	ret    
    1cc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001cd0 <stat>:

int
stat(char *n, struct stat *st)
{
    1cd0:	55                   	push   %ebp
    1cd1:	89 e5                	mov    %esp,%ebp
    1cd3:	56                   	push   %esi
    1cd4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1cd5:	83 ec 08             	sub    $0x8,%esp
    1cd8:	6a 00                	push   $0x0
    1cda:	ff 75 08             	pushl  0x8(%ebp)
    1cdd:	e8 f0 00 00 00       	call   1dd2 <open>
  if(fd < 0)
    1ce2:	83 c4 10             	add    $0x10,%esp
    1ce5:	85 c0                	test   %eax,%eax
    1ce7:	78 27                	js     1d10 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1ce9:	83 ec 08             	sub    $0x8,%esp
    1cec:	ff 75 0c             	pushl  0xc(%ebp)
    1cef:	89 c3                	mov    %eax,%ebx
    1cf1:	50                   	push   %eax
    1cf2:	e8 f3 00 00 00       	call   1dea <fstat>
  close(fd);
    1cf7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1cfa:	89 c6                	mov    %eax,%esi
  close(fd);
    1cfc:	e8 b9 00 00 00       	call   1dba <close>
  return r;
    1d01:	83 c4 10             	add    $0x10,%esp
}
    1d04:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d07:	89 f0                	mov    %esi,%eax
    1d09:	5b                   	pop    %ebx
    1d0a:	5e                   	pop    %esi
    1d0b:	5d                   	pop    %ebp
    1d0c:	c3                   	ret    
    1d0d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1d10:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1d15:	eb ed                	jmp    1d04 <stat+0x34>
    1d17:	89 f6                	mov    %esi,%esi
    1d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001d20 <atoi>:

int
atoi(const char *s)
{
    1d20:	55                   	push   %ebp
    1d21:	89 e5                	mov    %esp,%ebp
    1d23:	53                   	push   %ebx
    1d24:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1d27:	0f be 11             	movsbl (%ecx),%edx
    1d2a:	8d 42 d0             	lea    -0x30(%edx),%eax
    1d2d:	3c 09                	cmp    $0x9,%al
  n = 0;
    1d2f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1d34:	77 1f                	ja     1d55 <atoi+0x35>
    1d36:	8d 76 00             	lea    0x0(%esi),%esi
    1d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1d40:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1d43:	83 c1 01             	add    $0x1,%ecx
    1d46:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1d4a:	0f be 11             	movsbl (%ecx),%edx
    1d4d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1d50:	80 fb 09             	cmp    $0x9,%bl
    1d53:	76 eb                	jbe    1d40 <atoi+0x20>
  return n;
}
    1d55:	5b                   	pop    %ebx
    1d56:	5d                   	pop    %ebp
    1d57:	c3                   	ret    
    1d58:	90                   	nop
    1d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001d60 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1d60:	55                   	push   %ebp
    1d61:	89 e5                	mov    %esp,%ebp
    1d63:	56                   	push   %esi
    1d64:	53                   	push   %ebx
    1d65:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1d68:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1d6e:	85 db                	test   %ebx,%ebx
    1d70:	7e 14                	jle    1d86 <memmove+0x26>
    1d72:	31 d2                	xor    %edx,%edx
    1d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1d78:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1d7c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1d7f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1d82:	39 d3                	cmp    %edx,%ebx
    1d84:	75 f2                	jne    1d78 <memmove+0x18>
  return vdst;
}
    1d86:	5b                   	pop    %ebx
    1d87:	5e                   	pop    %esi
    1d88:	5d                   	pop    %ebp
    1d89:	c3                   	ret    

00001d8a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1d8a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d8f:	cd 40                	int    $0x40
    1d91:	c3                   	ret    

00001d92 <exit>:
SYSCALL(exit)
    1d92:	b8 02 00 00 00       	mov    $0x2,%eax
    1d97:	cd 40                	int    $0x40
    1d99:	c3                   	ret    

00001d9a <wait>:
SYSCALL(wait)
    1d9a:	b8 03 00 00 00       	mov    $0x3,%eax
    1d9f:	cd 40                	int    $0x40
    1da1:	c3                   	ret    

00001da2 <pipe>:
SYSCALL(pipe)
    1da2:	b8 04 00 00 00       	mov    $0x4,%eax
    1da7:	cd 40                	int    $0x40
    1da9:	c3                   	ret    

00001daa <read>:
SYSCALL(read)
    1daa:	b8 05 00 00 00       	mov    $0x5,%eax
    1daf:	cd 40                	int    $0x40
    1db1:	c3                   	ret    

00001db2 <write>:
SYSCALL(write)
    1db2:	b8 10 00 00 00       	mov    $0x10,%eax
    1db7:	cd 40                	int    $0x40
    1db9:	c3                   	ret    

00001dba <close>:
SYSCALL(close)
    1dba:	b8 15 00 00 00       	mov    $0x15,%eax
    1dbf:	cd 40                	int    $0x40
    1dc1:	c3                   	ret    

00001dc2 <kill>:
SYSCALL(kill)
    1dc2:	b8 06 00 00 00       	mov    $0x6,%eax
    1dc7:	cd 40                	int    $0x40
    1dc9:	c3                   	ret    

00001dca <exec>:
SYSCALL(exec)
    1dca:	b8 07 00 00 00       	mov    $0x7,%eax
    1dcf:	cd 40                	int    $0x40
    1dd1:	c3                   	ret    

00001dd2 <open>:
SYSCALL(open)
    1dd2:	b8 0f 00 00 00       	mov    $0xf,%eax
    1dd7:	cd 40                	int    $0x40
    1dd9:	c3                   	ret    

00001dda <mknod>:
SYSCALL(mknod)
    1dda:	b8 11 00 00 00       	mov    $0x11,%eax
    1ddf:	cd 40                	int    $0x40
    1de1:	c3                   	ret    

00001de2 <unlink>:
SYSCALL(unlink)
    1de2:	b8 12 00 00 00       	mov    $0x12,%eax
    1de7:	cd 40                	int    $0x40
    1de9:	c3                   	ret    

00001dea <fstat>:
SYSCALL(fstat)
    1dea:	b8 08 00 00 00       	mov    $0x8,%eax
    1def:	cd 40                	int    $0x40
    1df1:	c3                   	ret    

00001df2 <link>:
SYSCALL(link)
    1df2:	b8 13 00 00 00       	mov    $0x13,%eax
    1df7:	cd 40                	int    $0x40
    1df9:	c3                   	ret    

00001dfa <mkdir>:
SYSCALL(mkdir)
    1dfa:	b8 14 00 00 00       	mov    $0x14,%eax
    1dff:	cd 40                	int    $0x40
    1e01:	c3                   	ret    

00001e02 <chdir>:
SYSCALL(chdir)
    1e02:	b8 09 00 00 00       	mov    $0x9,%eax
    1e07:	cd 40                	int    $0x40
    1e09:	c3                   	ret    

00001e0a <dup>:
SYSCALL(dup)
    1e0a:	b8 0a 00 00 00       	mov    $0xa,%eax
    1e0f:	cd 40                	int    $0x40
    1e11:	c3                   	ret    

00001e12 <getpid>:
SYSCALL(getpid)
    1e12:	b8 0b 00 00 00       	mov    $0xb,%eax
    1e17:	cd 40                	int    $0x40
    1e19:	c3                   	ret    

00001e1a <sbrk>:
SYSCALL(sbrk)
    1e1a:	b8 0c 00 00 00       	mov    $0xc,%eax
    1e1f:	cd 40                	int    $0x40
    1e21:	c3                   	ret    

00001e22 <sleep>:
SYSCALL(sleep)
    1e22:	b8 0d 00 00 00       	mov    $0xd,%eax
    1e27:	cd 40                	int    $0x40
    1e29:	c3                   	ret    

00001e2a <uptime>:
SYSCALL(uptime)
    1e2a:	b8 0e 00 00 00       	mov    $0xe,%eax
    1e2f:	cd 40                	int    $0x40
    1e31:	c3                   	ret    

00001e32 <yield>:
SYSCALL(yield)
    1e32:	b8 16 00 00 00       	mov    $0x16,%eax
    1e37:	cd 40                	int    $0x40
    1e39:	c3                   	ret    

00001e3a <shutdown>:
SYSCALL(shutdown)
    1e3a:	b8 17 00 00 00       	mov    $0x17,%eax
    1e3f:	cd 40                	int    $0x40
    1e41:	c3                   	ret    

00001e42 <writecount>:
SYSCALL(writecount)
    1e42:	b8 18 00 00 00       	mov    $0x18,%eax
    1e47:	cd 40                	int    $0x40
    1e49:	c3                   	ret    

00001e4a <settickets>:
SYSCALL(settickets)
    1e4a:	b8 19 00 00 00       	mov    $0x19,%eax
    1e4f:	cd 40                	int    $0x40
    1e51:	c3                   	ret    

00001e52 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
    1e52:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1e57:	cd 40                	int    $0x40
    1e59:	c3                   	ret    

00001e5a <dumppagetable>:
    1e5a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1e5f:	cd 40                	int    $0x40
    1e61:	c3                   	ret    
    1e62:	66 90                	xchg   %ax,%ax
    1e64:	66 90                	xchg   %ax,%ax
    1e66:	66 90                	xchg   %ax,%ax
    1e68:	66 90                	xchg   %ax,%ax
    1e6a:	66 90                	xchg   %ax,%ax
    1e6c:	66 90                	xchg   %ax,%ax
    1e6e:	66 90                	xchg   %ax,%ax

00001e70 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1e70:	55                   	push   %ebp
    1e71:	89 e5                	mov    %esp,%ebp
    1e73:	57                   	push   %edi
    1e74:	56                   	push   %esi
    1e75:	53                   	push   %ebx
    1e76:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1e79:	85 d2                	test   %edx,%edx
{
    1e7b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    1e7e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1e80:	79 76                	jns    1ef8 <printint+0x88>
    1e82:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1e86:	74 70                	je     1ef8 <printint+0x88>
    x = -xx;
    1e88:	f7 d8                	neg    %eax
    neg = 1;
    1e8a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1e91:	31 f6                	xor    %esi,%esi
    1e93:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1e96:	eb 0a                	jmp    1ea2 <printint+0x32>
    1e98:	90                   	nop
    1e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1ea0:	89 fe                	mov    %edi,%esi
    1ea2:	31 d2                	xor    %edx,%edx
    1ea4:	8d 7e 01             	lea    0x1(%esi),%edi
    1ea7:	f7 f1                	div    %ecx
    1ea9:	0f b6 92 bc 2a 00 00 	movzbl 0x2abc(%edx),%edx
  }while((x /= base) != 0);
    1eb0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1eb2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1eb5:	75 e9                	jne    1ea0 <printint+0x30>
  if(neg)
    1eb7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1eba:	85 c0                	test   %eax,%eax
    1ebc:	74 08                	je     1ec6 <printint+0x56>
    buf[i++] = '-';
    1ebe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1ec3:	8d 7e 02             	lea    0x2(%esi),%edi
    1ec6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    1eca:	8b 7d c0             	mov    -0x40(%ebp),%edi
    1ecd:	8d 76 00             	lea    0x0(%esi),%esi
    1ed0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1ed3:	83 ec 04             	sub    $0x4,%esp
    1ed6:	83 ee 01             	sub    $0x1,%esi
    1ed9:	6a 01                	push   $0x1
    1edb:	53                   	push   %ebx
    1edc:	57                   	push   %edi
    1edd:	88 45 d7             	mov    %al,-0x29(%ebp)
    1ee0:	e8 cd fe ff ff       	call   1db2 <write>

  while(--i >= 0)
    1ee5:	83 c4 10             	add    $0x10,%esp
    1ee8:	39 de                	cmp    %ebx,%esi
    1eea:	75 e4                	jne    1ed0 <printint+0x60>
    putc(fd, buf[i]);
}
    1eec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1eef:	5b                   	pop    %ebx
    1ef0:	5e                   	pop    %esi
    1ef1:	5f                   	pop    %edi
    1ef2:	5d                   	pop    %ebp
    1ef3:	c3                   	ret    
    1ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1ef8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1eff:	eb 90                	jmp    1e91 <printint+0x21>
    1f01:	eb 0d                	jmp    1f10 <printf>
    1f03:	90                   	nop
    1f04:	90                   	nop
    1f05:	90                   	nop
    1f06:	90                   	nop
    1f07:	90                   	nop
    1f08:	90                   	nop
    1f09:	90                   	nop
    1f0a:	90                   	nop
    1f0b:	90                   	nop
    1f0c:	90                   	nop
    1f0d:	90                   	nop
    1f0e:	90                   	nop
    1f0f:	90                   	nop

00001f10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1f10:	55                   	push   %ebp
    1f11:	89 e5                	mov    %esp,%ebp
    1f13:	57                   	push   %edi
    1f14:	56                   	push   %esi
    1f15:	53                   	push   %ebx
    1f16:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f19:	8b 75 0c             	mov    0xc(%ebp),%esi
    1f1c:	0f b6 1e             	movzbl (%esi),%ebx
    1f1f:	84 db                	test   %bl,%bl
    1f21:	0f 84 b3 00 00 00    	je     1fda <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    1f27:	8d 45 10             	lea    0x10(%ebp),%eax
    1f2a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    1f2d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    1f2f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1f32:	eb 2f                	jmp    1f63 <printf+0x53>
    1f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1f38:	83 f8 25             	cmp    $0x25,%eax
    1f3b:	0f 84 a7 00 00 00    	je     1fe8 <printf+0xd8>
  write(fd, &c, 1);
    1f41:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1f44:	83 ec 04             	sub    $0x4,%esp
    1f47:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1f4a:	6a 01                	push   $0x1
    1f4c:	50                   	push   %eax
    1f4d:	ff 75 08             	pushl  0x8(%ebp)
    1f50:	e8 5d fe ff ff       	call   1db2 <write>
    1f55:	83 c4 10             	add    $0x10,%esp
    1f58:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1f5b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1f5f:	84 db                	test   %bl,%bl
    1f61:	74 77                	je     1fda <printf+0xca>
    if(state == 0){
    1f63:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1f65:	0f be cb             	movsbl %bl,%ecx
    1f68:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1f6b:	74 cb                	je     1f38 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1f6d:	83 ff 25             	cmp    $0x25,%edi
    1f70:	75 e6                	jne    1f58 <printf+0x48>
      if(c == 'd'){
    1f72:	83 f8 64             	cmp    $0x64,%eax
    1f75:	0f 84 05 01 00 00    	je     2080 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1f7b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1f81:	83 f9 70             	cmp    $0x70,%ecx
    1f84:	74 72                	je     1ff8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1f86:	83 f8 73             	cmp    $0x73,%eax
    1f89:	0f 84 99 00 00 00    	je     2028 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1f8f:	83 f8 63             	cmp    $0x63,%eax
    1f92:	0f 84 08 01 00 00    	je     20a0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1f98:	83 f8 25             	cmp    $0x25,%eax
    1f9b:	0f 84 ef 00 00 00    	je     2090 <printf+0x180>
  write(fd, &c, 1);
    1fa1:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1fa4:	83 ec 04             	sub    $0x4,%esp
    1fa7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1fab:	6a 01                	push   $0x1
    1fad:	50                   	push   %eax
    1fae:	ff 75 08             	pushl  0x8(%ebp)
    1fb1:	e8 fc fd ff ff       	call   1db2 <write>
    1fb6:	83 c4 0c             	add    $0xc,%esp
    1fb9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1fbc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1fbf:	6a 01                	push   $0x1
    1fc1:	50                   	push   %eax
    1fc2:	ff 75 08             	pushl  0x8(%ebp)
    1fc5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1fc8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1fca:	e8 e3 fd ff ff       	call   1db2 <write>
  for(i = 0; fmt[i]; i++){
    1fcf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    1fd3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1fd6:	84 db                	test   %bl,%bl
    1fd8:	75 89                	jne    1f63 <printf+0x53>
    }
  }
}
    1fda:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fdd:	5b                   	pop    %ebx
    1fde:	5e                   	pop    %esi
    1fdf:	5f                   	pop    %edi
    1fe0:	5d                   	pop    %ebp
    1fe1:	c3                   	ret    
    1fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    1fe8:	bf 25 00 00 00       	mov    $0x25,%edi
    1fed:	e9 66 ff ff ff       	jmp    1f58 <printf+0x48>
    1ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1ff8:	83 ec 0c             	sub    $0xc,%esp
    1ffb:	b9 10 00 00 00       	mov    $0x10,%ecx
    2000:	6a 00                	push   $0x0
    2002:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    2005:	8b 45 08             	mov    0x8(%ebp),%eax
    2008:	8b 17                	mov    (%edi),%edx
    200a:	e8 61 fe ff ff       	call   1e70 <printint>
        ap++;
    200f:	89 f8                	mov    %edi,%eax
    2011:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2014:	31 ff                	xor    %edi,%edi
        ap++;
    2016:	83 c0 04             	add    $0x4,%eax
    2019:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    201c:	e9 37 ff ff ff       	jmp    1f58 <printf+0x48>
    2021:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    2028:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    202b:	8b 08                	mov    (%eax),%ecx
        ap++;
    202d:	83 c0 04             	add    $0x4,%eax
    2030:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    2033:	85 c9                	test   %ecx,%ecx
    2035:	0f 84 8e 00 00 00    	je     20c9 <printf+0x1b9>
        while(*s != 0){
    203b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    203e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    2040:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    2042:	84 c0                	test   %al,%al
    2044:	0f 84 0e ff ff ff    	je     1f58 <printf+0x48>
    204a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    204d:	89 de                	mov    %ebx,%esi
    204f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2052:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    2055:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    2058:	83 ec 04             	sub    $0x4,%esp
          s++;
    205b:	83 c6 01             	add    $0x1,%esi
    205e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    2061:	6a 01                	push   $0x1
    2063:	57                   	push   %edi
    2064:	53                   	push   %ebx
    2065:	e8 48 fd ff ff       	call   1db2 <write>
        while(*s != 0){
    206a:	0f b6 06             	movzbl (%esi),%eax
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	84 c0                	test   %al,%al
    2072:	75 e4                	jne    2058 <printf+0x148>
    2074:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    2077:	31 ff                	xor    %edi,%edi
    2079:	e9 da fe ff ff       	jmp    1f58 <printf+0x48>
    207e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2088:	6a 01                	push   $0x1
    208a:	e9 73 ff ff ff       	jmp    2002 <printf+0xf2>
    208f:	90                   	nop
  write(fd, &c, 1);
    2090:	83 ec 04             	sub    $0x4,%esp
    2093:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    2096:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2099:	6a 01                	push   $0x1
    209b:	e9 21 ff ff ff       	jmp    1fc1 <printf+0xb1>
        putc(fd, *ap);
    20a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    20a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    20a6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    20a8:	6a 01                	push   $0x1
        ap++;
    20aa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    20ad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    20b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    20b3:	50                   	push   %eax
    20b4:	ff 75 08             	pushl  0x8(%ebp)
    20b7:	e8 f6 fc ff ff       	call   1db2 <write>
        ap++;
    20bc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    20bf:	83 c4 10             	add    $0x10,%esp
      state = 0;
    20c2:	31 ff                	xor    %edi,%edi
    20c4:	e9 8f fe ff ff       	jmp    1f58 <printf+0x48>
          s = "(null)";
    20c9:	bb b4 2a 00 00       	mov    $0x2ab4,%ebx
        while(*s != 0){
    20ce:	b8 28 00 00 00       	mov    $0x28,%eax
    20d3:	e9 72 ff ff ff       	jmp    204a <printf+0x13a>
    20d8:	66 90                	xchg   %ax,%ax
    20da:	66 90                	xchg   %ax,%ax
    20dc:	66 90                	xchg   %ax,%ax
    20de:	66 90                	xchg   %ax,%ax

000020e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    20e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20e1:	a1 00 33 00 00       	mov    0x3300,%eax
{
    20e6:	89 e5                	mov    %esp,%ebp
    20e8:	57                   	push   %edi
    20e9:	56                   	push   %esi
    20ea:	53                   	push   %ebx
    20eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    20ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    20f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20f8:	39 c8                	cmp    %ecx,%eax
    20fa:	8b 10                	mov    (%eax),%edx
    20fc:	73 32                	jae    2130 <free+0x50>
    20fe:	39 d1                	cmp    %edx,%ecx
    2100:	72 04                	jb     2106 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2102:	39 d0                	cmp    %edx,%eax
    2104:	72 32                	jb     2138 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2106:	8b 73 fc             	mov    -0x4(%ebx),%esi
    2109:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    210c:	39 fa                	cmp    %edi,%edx
    210e:	74 30                	je     2140 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    2110:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    2113:	8b 50 04             	mov    0x4(%eax),%edx
    2116:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2119:	39 f1                	cmp    %esi,%ecx
    211b:	74 3a                	je     2157 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    211d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    211f:	a3 00 33 00 00       	mov    %eax,0x3300
}
    2124:	5b                   	pop    %ebx
    2125:	5e                   	pop    %esi
    2126:	5f                   	pop    %edi
    2127:	5d                   	pop    %ebp
    2128:	c3                   	ret    
    2129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2130:	39 d0                	cmp    %edx,%eax
    2132:	72 04                	jb     2138 <free+0x58>
    2134:	39 d1                	cmp    %edx,%ecx
    2136:	72 ce                	jb     2106 <free+0x26>
{
    2138:	89 d0                	mov    %edx,%eax
    213a:	eb bc                	jmp    20f8 <free+0x18>
    213c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    2140:	03 72 04             	add    0x4(%edx),%esi
    2143:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2146:	8b 10                	mov    (%eax),%edx
    2148:	8b 12                	mov    (%edx),%edx
    214a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    214d:	8b 50 04             	mov    0x4(%eax),%edx
    2150:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2153:	39 f1                	cmp    %esi,%ecx
    2155:	75 c6                	jne    211d <free+0x3d>
    p->s.size += bp->s.size;
    2157:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    215a:	a3 00 33 00 00       	mov    %eax,0x3300
    p->s.size += bp->s.size;
    215f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2162:	8b 53 f8             	mov    -0x8(%ebx),%edx
    2165:	89 10                	mov    %edx,(%eax)
}
    2167:	5b                   	pop    %ebx
    2168:	5e                   	pop    %esi
    2169:	5f                   	pop    %edi
    216a:	5d                   	pop    %ebp
    216b:	c3                   	ret    
    216c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002170 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    2170:	55                   	push   %ebp
    2171:	89 e5                	mov    %esp,%ebp
    2173:	57                   	push   %edi
    2174:	56                   	push   %esi
    2175:	53                   	push   %ebx
    2176:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2179:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    217c:	8b 15 00 33 00 00    	mov    0x3300,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2182:	8d 78 07             	lea    0x7(%eax),%edi
    2185:	c1 ef 03             	shr    $0x3,%edi
    2188:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    218b:	85 d2                	test   %edx,%edx
    218d:	0f 84 9d 00 00 00    	je     2230 <malloc+0xc0>
    2193:	8b 02                	mov    (%edx),%eax
    2195:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    2198:	39 cf                	cmp    %ecx,%edi
    219a:	76 6c                	jbe    2208 <malloc+0x98>
    219c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    21a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    21a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    21aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    21b1:	eb 0e                	jmp    21c1 <malloc+0x51>
    21b3:	90                   	nop
    21b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    21b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    21ba:	8b 48 04             	mov    0x4(%eax),%ecx
    21bd:	39 f9                	cmp    %edi,%ecx
    21bf:	73 47                	jae    2208 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    21c1:	39 05 00 33 00 00    	cmp    %eax,0x3300
    21c7:	89 c2                	mov    %eax,%edx
    21c9:	75 ed                	jne    21b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    21cb:	83 ec 0c             	sub    $0xc,%esp
    21ce:	56                   	push   %esi
    21cf:	e8 46 fc ff ff       	call   1e1a <sbrk>
  if(p == (char*)-1)
    21d4:	83 c4 10             	add    $0x10,%esp
    21d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    21da:	74 1c                	je     21f8 <malloc+0x88>
  hp->s.size = nu;
    21dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    21df:	83 ec 0c             	sub    $0xc,%esp
    21e2:	83 c0 08             	add    $0x8,%eax
    21e5:	50                   	push   %eax
    21e6:	e8 f5 fe ff ff       	call   20e0 <free>
  return freep;
    21eb:	8b 15 00 33 00 00    	mov    0x3300,%edx
      if((p = morecore(nunits)) == 0)
    21f1:	83 c4 10             	add    $0x10,%esp
    21f4:	85 d2                	test   %edx,%edx
    21f6:	75 c0                	jne    21b8 <malloc+0x48>
        return 0;
  }
}
    21f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    21fb:	31 c0                	xor    %eax,%eax
}
    21fd:	5b                   	pop    %ebx
    21fe:	5e                   	pop    %esi
    21ff:	5f                   	pop    %edi
    2200:	5d                   	pop    %ebp
    2201:	c3                   	ret    
    2202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    2208:	39 cf                	cmp    %ecx,%edi
    220a:	74 54                	je     2260 <malloc+0xf0>
        p->s.size -= nunits;
    220c:	29 f9                	sub    %edi,%ecx
    220e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    2211:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    2214:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    2217:	89 15 00 33 00 00    	mov    %edx,0x3300
}
    221d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    2220:	83 c0 08             	add    $0x8,%eax
}
    2223:	5b                   	pop    %ebx
    2224:	5e                   	pop    %esi
    2225:	5f                   	pop    %edi
    2226:	5d                   	pop    %ebp
    2227:	c3                   	ret    
    2228:	90                   	nop
    2229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    2230:	c7 05 00 33 00 00 04 	movl   $0x3304,0x3300
    2237:	33 00 00 
    223a:	c7 05 04 33 00 00 04 	movl   $0x3304,0x3304
    2241:	33 00 00 
    base.s.size = 0;
    2244:	b8 04 33 00 00       	mov    $0x3304,%eax
    2249:	c7 05 08 33 00 00 00 	movl   $0x0,0x3308
    2250:	00 00 00 
    2253:	e9 44 ff ff ff       	jmp    219c <malloc+0x2c>
    2258:	90                   	nop
    2259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    2260:	8b 08                	mov    (%eax),%ecx
    2262:	89 0a                	mov    %ecx,(%edx)
    2264:	eb b1                	jmp    2217 <malloc+0xa7>
