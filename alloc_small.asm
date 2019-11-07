
_alloc_small:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "pagingtestlib.h"

int main() {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
    setup();
      11:	e8 6a 00 00 00       	call   80 <setup>
    test_allocation_no_fork(4096, "4K", "1K", 512, 1024, 1024+512,512, 1);
      16:	6a 01                	push   $0x1
      18:	68 00 02 00 00       	push   $0x200
      1d:	68 00 06 00 00       	push   $0x600
      22:	68 00 04 00 00       	push   $0x400
      27:	68 00 02 00 00       	push   $0x200
      2c:	68 0a 23 00 00       	push   $0x230a
      31:	68 0d 23 00 00       	push   $0x230d
      36:	68 00 10 00 00       	push   $0x1000
      3b:	e8 b0 01 00 00       	call   1f0 <test_allocation_no_fork>
    shutdown();
      40:	83 c4 20             	add    $0x20,%esp
      43:	e8 b2 1d 00 00       	call   1dfa <shutdown>
}
      48:	8b 4d fc             	mov    -0x4(%ebp),%ecx
      4b:	31 c0                	xor    %eax,%eax
      4d:	c9                   	leave  
      4e:	8d 61 fc             	lea    -0x4(%ecx),%esp
      51:	c3                   	ret    
      52:	66 90                	xchg   %ax,%ax
      54:	66 90                	xchg   %ax,%ax
      56:	66 90                	xchg   %ax,%ax
      58:	66 90                	xchg   %ax,%ax
      5a:	66 90                	xchg   %ax,%ax
      5c:	66 90                	xchg   %ax,%ax
      5e:	66 90                	xchg   %ax,%ax

00000060 <test_out_of_bounds_internal>:
        }
    }
}

static unsigned out_of_bounds_offset = 1;
void test_out_of_bounds_internal() {
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	83 ec 14             	sub    $0x14,%esp
    volatile char *end_of_heap = sbrk(0);
      66:	6a 00                	push   $0x0
      68:	e8 6d 1d 00 00       	call   1dda <sbrk>
    (void) end_of_heap[out_of_bounds_offset];
      6d:	03 05 84 31 00 00    	add    0x3184,%eax
}
      73:	83 c4 10             	add    $0x10,%esp
    (void) end_of_heap[out_of_bounds_offset];
      76:	0f b6 00             	movzbl (%eax),%eax
}
      79:	c9                   	leave  
      7a:	c3                   	ret    
      7b:	90                   	nop
      7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000080 <setup>:
void setup() {
      80:	55                   	push   %ebp
      81:	89 e5                	mov    %esp,%ebp
      83:	83 ec 0c             	sub    $0xc,%esp
    mknod("console", 1, 1);
      86:	6a 01                	push   $0x1
      88:	6a 01                	push   $0x1
      8a:	68 28 22 00 00       	push   $0x2228
      8f:	e8 06 1d 00 00       	call   1d9a <mknod>
    open("console", O_RDWR);
      94:	58                   	pop    %eax
      95:	5a                   	pop    %edx
      96:	6a 02                	push   $0x2
      98:	68 28 22 00 00       	push   $0x2228
      9d:	e8 f0 1c 00 00       	call   1d92 <open>
    dup(0);
      a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      a9:	e8 1c 1d 00 00       	call   1dca <dup>
    dup(0);
      ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      b5:	e8 10 1d 00 00       	call   1dca <dup>
}
      ba:	83 c4 10             	add    $0x10,%esp
      bd:	c9                   	leave  
      be:	c3                   	ret    
      bf:	90                   	nop

000000c0 <test_simple_crash_no_fork>:
void test_simple_crash_no_fork(void (*test_func)(), const char *no_crash_message) {
      c0:	55                   	push   %ebp
      c1:	89 e5                	mov    %esp,%ebp
      c3:	83 ec 08             	sub    $0x8,%esp
    test_func();
      c6:	ff 55 08             	call   *0x8(%ebp)
    printf(1, "%s\n", no_crash_message);
      c9:	83 ec 04             	sub    $0x4,%esp
      cc:	ff 75 0c             	pushl  0xc(%ebp)
      cf:	68 30 22 00 00       	push   $0x2230
      d4:	6a 01                	push   $0x1
      d6:	e8 f5 1d 00 00       	call   1ed0 <printf>
}
      db:	83 c4 10             	add    $0x10,%esp
      de:	c9                   	leave  
      df:	c3                   	ret    

000000e0 <test_simple_crash>:
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
      e0:	55                   	push   %ebp
      e1:	89 e5                	mov    %esp,%ebp
      e3:	53                   	push   %ebx
    pipe(fds);
      e4:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_simple_crash(void (*test_func)(), const char *crash_message, const char *no_crash_message) {
      e7:	83 ec 20             	sub    $0x20,%esp
    pipe(fds);
      ea:	50                   	push   %eax
      eb:	e8 72 1c 00 00       	call   1d62 <pipe>
    int pid = fork();
      f0:	e8 55 1c 00 00       	call   1d4a <fork>
    if (pid == 0) {
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	74 70                	je     16c <test_simple_crash+0x8c>
        close(fds[1]);
      fc:	83 ec 0c             	sub    $0xc,%esp
      ff:	ff 75 f4             	pushl  -0xc(%ebp)
     102:	e8 73 1c 00 00       	call   1d7a <close>
        int size = read(fds[0], text, 1);
     107:	8d 45 ef             	lea    -0x11(%ebp),%eax
     10a:	83 c4 0c             	add    $0xc,%esp
     10d:	6a 01                	push   $0x1
     10f:	50                   	push   %eax
     110:	ff 75 f0             	pushl  -0x10(%ebp)
     113:	e8 52 1c 00 00       	call   1d6a <read>
     118:	89 c3                	mov    %eax,%ebx
        wait();
     11a:	e8 3b 1c 00 00       	call   1d5a <wait>
        close(fds[0]);
     11f:	58                   	pop    %eax
     120:	ff 75 f0             	pushl  -0x10(%ebp)
     123:	e8 52 1c 00 00       	call   1d7a <close>
        if (size == 1) {
     128:	83 c4 10             	add    $0x10,%esp
     12b:	83 fb 01             	cmp    $0x1,%ebx
     12e:	74 20                	je     150 <test_simple_crash+0x70>
            printf(1, "%s\n", crash_message);
     130:	83 ec 04             	sub    $0x4,%esp
     133:	ff 75 0c             	pushl  0xc(%ebp)
     136:	68 30 22 00 00       	push   $0x2230
     13b:	6a 01                	push   $0x1
     13d:	e8 8e 1d 00 00       	call   1ed0 <printf>
            return 1;
     142:	83 c4 10             	add    $0x10,%esp
     145:	b8 01 00 00 00       	mov    $0x1,%eax
}
     14a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     14d:	c9                   	leave  
     14e:	c3                   	ret    
     14f:	90                   	nop
            printf(1, "%s\n", no_crash_message);
     150:	83 ec 04             	sub    $0x4,%esp
     153:	ff 75 10             	pushl  0x10(%ebp)
     156:	68 30 22 00 00       	push   $0x2230
     15b:	6a 01                	push   $0x1
     15d:	e8 6e 1d 00 00       	call   1ed0 <printf>
            return 0;
     162:	83 c4 10             	add    $0x10,%esp
     165:	31 c0                	xor    %eax,%eax
}
     167:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     16a:	c9                   	leave  
     16b:	c3                   	ret    
        close(1);
     16c:	83 ec 0c             	sub    $0xc,%esp
     16f:	6a 01                	push   $0x1
     171:	e8 04 1c 00 00       	call   1d7a <close>
        dup(fds[1]);
     176:	5a                   	pop    %edx
     177:	ff 75 f4             	pushl  -0xc(%ebp)
     17a:	e8 4b 1c 00 00       	call   1dca <dup>
        test_func();
     17f:	ff 55 08             	call   *0x8(%ebp)
        write(1, "X", 1);
     182:	83 c4 0c             	add    $0xc,%esp
     185:	6a 01                	push   $0x1
     187:	68 34 22 00 00       	push   $0x2234
     18c:	6a 01                	push   $0x1
     18e:	e8 df 1b 00 00       	call   1d72 <write>
        exit();
     193:	e8 ba 1b 00 00       	call   1d52 <exit>
     198:	90                   	nop
     199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <test_out_of_bounds_fork>:

int test_out_of_bounds_fork(int offset, const char *crash_message, const char *no_crash_message) {
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
    out_of_bounds_offset = offset;
     1a3:	8b 45 08             	mov    0x8(%ebp),%eax
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     1a6:	c7 45 08 60 00 00 00 	movl   $0x60,0x8(%ebp)
}
     1ad:	5d                   	pop    %ebp
    out_of_bounds_offset = offset;
     1ae:	a3 84 31 00 00       	mov    %eax,0x3184
    return test_simple_crash(test_out_of_bounds_internal, crash_message, no_crash_message);
     1b3:	e9 28 ff ff ff       	jmp    e0 <test_simple_crash>
     1b8:	90                   	nop
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <test_out_of_bounds_no_fork>:

void test_out_of_bounds_no_fork(int offset, const char *no_crash_message) {
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	83 ec 08             	sub    $0x8,%esp
    out_of_bounds_offset = offset;
     1c6:	8b 45 08             	mov    0x8(%ebp),%eax
     1c9:	a3 84 31 00 00       	mov    %eax,0x3184
    test_func();
     1ce:	e8 8d fe ff ff       	call   60 <test_out_of_bounds_internal>
    printf(1, "%s\n", no_crash_message);
     1d3:	83 ec 04             	sub    $0x4,%esp
     1d6:	ff 75 0c             	pushl  0xc(%ebp)
     1d9:	68 30 22 00 00       	push   $0x2230
     1de:	6a 01                	push   $0x1
     1e0:	e8 eb 1c 00 00       	call   1ed0 <printf>
    test_simple_crash_no_fork(test_out_of_bounds_internal, no_crash_message);
}
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	c9                   	leave  
     1e9:	c3                   	ret    
     1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <test_allocation_no_fork>:

int test_allocation_no_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	57                   	push   %edi
     1f4:	56                   	push   %esi
     1f5:	53                   	push   %ebx
     1f6:	83 ec 28             	sub    $0x28,%esp
     1f9:	8b 75 08             	mov    0x8(%ebp),%esi
     1fc:	8b 5d 24             	mov    0x24(%ebp),%ebx
    char *old_end_of_heap = sbrk(size);
     1ff:	56                   	push   %esi
     200:	e8 d5 1b 00 00       	call   1dda <sbrk>
     205:	89 c7                	mov    %eax,%edi
    char *new_end_of_heap = sbrk(0);
     207:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     20e:	e8 c7 1b 00 00       	call   1dda <sbrk>
    if (old_end_of_heap == (char*) -1) {
     213:	83 c4 10             	add    $0x10,%esp
     216:	83 ff ff             	cmp    $0xffffffff,%edi
     219:	0f 84 21 01 00 00    	je     340 <test_allocation_no_fork+0x150>
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
        return 0;
    } else if (new_end_of_heap - old_end_of_heap != size) {
     21f:	29 f8                	sub    %edi,%eax
     221:	39 f0                	cmp    %esi,%eax
     223:	0f 85 d7 00 00 00    	jne    300 <test_allocation_no_fork+0x110>
        printf(1, FAIL_MSG "HEAP_SIZE\n");
        return 0;
    } else {
        int failed = 0;
        char *place_one = &old_end_of_heap[offset1];
     229:	8b 75 14             	mov    0x14(%ebp),%esi
        char *place_two = &old_end_of_heap[offset2];
     22c:	8b 45 1c             	mov    0x1c(%ebp),%eax
        char *place_one = &old_end_of_heap[offset1];
     22f:	01 fe                	add    %edi,%esi
        char *place_two = &old_end_of_heap[offset2];
     231:	01 f8                	add    %edi,%eax
        int i;
        for (i = 0; i < count1; ++i) {
     233:	8b 7d 18             	mov    0x18(%ebp),%edi
     236:	85 ff                	test   %edi,%edi
     238:	0f 8e 22 01 00 00    	jle    360 <test_allocation_no_fork+0x170>
     23e:	8b 7d 18             	mov    0x18(%ebp),%edi
     241:	89 f1                	mov    %esi,%ecx
        int failed = 0;
     243:	31 d2                	xor    %edx,%edx
            if (check_zero && place_one[i] != '\0') {
                failed = 1;
     245:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     248:	01 f7                	add    %esi,%edi
     24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            if (check_zero && place_one[i] != '\0') {
     250:	85 db                	test   %ebx,%ebx
     252:	74 0b                	je     25f <test_allocation_no_fork+0x6f>
                failed = 1;
     254:	80 39 00             	cmpb   $0x0,(%ecx)
     257:	b8 01 00 00 00       	mov    $0x1,%eax
     25c:	0f 45 d0             	cmovne %eax,%edx
            }
            place_one[i] = 'A';
     25f:	c6 01 41             	movb   $0x41,(%ecx)
     262:	83 c1 01             	add    $0x1,%ecx
        for (i = 0; i < count1; ++i) {
     265:	39 cf                	cmp    %ecx,%edi
     267:	75 e7                	jne    250 <test_allocation_no_fork+0x60>
        }
        for (i = 0; i < count2; ++i) {
     269:	8b 7d 20             	mov    0x20(%ebp),%edi
     26c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     26f:	85 ff                	test   %edi,%edi
     271:	7e 2d                	jle    2a0 <test_allocation_no_fork+0xb0>
            if (check_zero && place_two[i] != '\0') {
                failed = 1;
     273:	89 75 e4             	mov    %esi,-0x1c(%ebp)
     276:	8b 75 20             	mov    0x20(%ebp),%esi
        int failed = 0;
     279:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     27b:	bf 01 00 00 00       	mov    $0x1,%edi
            if (check_zero && place_two[i] != '\0') {
     280:	85 db                	test   %ebx,%ebx
     282:	74 07                	je     28b <test_allocation_no_fork+0x9b>
                failed = 1;
     284:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
     288:	0f 45 d7             	cmovne %edi,%edx
            }
            place_two[i] = 'B';
     28b:	c6 04 08 42          	movb   $0x42,(%eax,%ecx,1)
        for (i = 0; i < count2; ++i) {
     28f:	83 c1 01             	add    $0x1,%ecx
     292:	39 ce                	cmp    %ecx,%esi
     294:	7f ea                	jg     280 <test_allocation_no_fork+0x90>
        }
        for (i = 0; i < count1; ++i) {
     296:	8b 5d 18             	mov    0x18(%ebp),%ebx
     299:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     29c:	85 db                	test   %ebx,%ebx
     29e:	7e 25                	jle    2c5 <test_allocation_no_fork+0xd5>
            if (place_one[i] != 'A')
                failed = 1;
     2a0:	8b 7d 18             	mov    0x18(%ebp),%edi
                failed = 1;
     2a3:	31 c9                	xor    %ecx,%ecx
                failed = 1;
     2a5:	bb 01 00 00 00       	mov    $0x1,%ebx
     2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     2b0:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     2b4:	0f 45 d3             	cmovne %ebx,%edx
        for (i = 0; i < count1; ++i) {
     2b7:	83 c1 01             	add    $0x1,%ecx
     2ba:	39 cf                	cmp    %ecx,%edi
     2bc:	7f f2                	jg     2b0 <test_allocation_no_fork+0xc0>
        } 
        for (i = 0; i < count2; ++i) {
     2be:	8b 4d 20             	mov    0x20(%ebp),%ecx
     2c1:	85 c9                	test   %ecx,%ecx
     2c3:	7e 18                	jle    2dd <test_allocation_no_fork+0xed>
     2c5:	8b 4d 20             	mov    0x20(%ebp),%ecx
            if (place_two[i] != 'B')
                failed = 1;
     2c8:	bb 01 00 00 00       	mov    $0x1,%ebx
     2cd:	01 c1                	add    %eax,%ecx
     2cf:	90                   	nop
     2d0:	80 38 42             	cmpb   $0x42,(%eax)
     2d3:	0f 45 d3             	cmovne %ebx,%edx
     2d6:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     2d9:	39 c8                	cmp    %ecx,%eax
     2db:	75 f3                	jne    2d0 <test_allocation_no_fork+0xe0>
        }
        if (failed) {
     2dd:	85 d2                	test   %edx,%edx
     2df:	75 3f                	jne    320 <test_allocation_no_fork+0x130>
            printf(1, FAIL_MSG "HEAP_VALUES\n");
            return 0;
        } else {
            printf(1, PASS_MSG "\n");
     2e1:	83 ec 08             	sub    $0x8,%esp
     2e4:	68 78 22 00 00       	push   $0x2278
     2e9:	6a 01                	push   $0x1
     2eb:	e8 e0 1b 00 00       	call   1ed0 <printf>
            return 1;
     2f0:	83 c4 10             	add    $0x10,%esp
        }
    }
}
     2f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 1;
     2f6:	b8 01 00 00 00       	mov    $0x1,%eax
}
     2fb:	5b                   	pop    %ebx
     2fc:	5e                   	pop    %esi
     2fd:	5f                   	pop    %edi
     2fe:	5d                   	pop    %ebp
     2ff:	c3                   	ret    
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     300:	83 ec 08             	sub    $0x8,%esp
     303:	68 4c 22 00 00       	push   $0x224c
     308:	6a 01                	push   $0x1
     30a:	e8 c1 1b 00 00       	call   1ed0 <printf>
        return 0;
     30f:	83 c4 10             	add    $0x10,%esp
}
     312:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
     315:	31 c0                	xor    %eax,%eax
}
     317:	5b                   	pop    %ebx
     318:	5e                   	pop    %esi
     319:	5f                   	pop    %edi
     31a:	5d                   	pop    %ebp
     31b:	c3                   	ret    
     31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, FAIL_MSG "HEAP_VALUES\n");
     320:	83 ec 08             	sub    $0x8,%esp
     323:	68 61 22 00 00       	push   $0x2261
     328:	6a 01                	push   $0x1
     32a:	e8 a1 1b 00 00       	call   1ed0 <printf>
            return 0;
     32f:	83 c4 10             	add    $0x10,%esp
}
     332:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return 0;
     335:	31 c0                	xor    %eax,%eax
}
     337:	5b                   	pop    %ebx
     338:	5e                   	pop    %esi
     339:	5f                   	pop    %edi
     33a:	5d                   	pop    %ebp
     33b:	c3                   	ret    
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     340:	83 ec 08             	sub    $0x8,%esp
     343:	68 36 22 00 00       	push   $0x2236
     348:	6a 01                	push   $0x1
     34a:	e8 81 1b 00 00       	call   1ed0 <printf>
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
        for (i = 0; i < count2; ++i) {
     360:	8b 4d 20             	mov    0x20(%ebp),%ecx
        int failed = 0;
     363:	31 d2                	xor    %edx,%edx
        for (i = 0; i < count2; ++i) {
     365:	85 c9                	test   %ecx,%ecx
     367:	0f 8f 06 ff ff ff    	jg     273 <test_allocation_no_fork+0x83>
     36d:	e9 6f ff ff ff       	jmp    2e1 <test_allocation_no_fork+0xf1>
     372:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <test_allocation_then_fork>:

void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	57                   	push   %edi
     384:	56                   	push   %esi
     385:	53                   	push   %ebx
     386:	83 ec 28             	sub    $0x28,%esp
     389:	8b 45 14             	mov    0x14(%ebp),%eax
     38c:	8b 7d 08             	mov    0x8(%ebp),%edi
     38f:	8b 5d 24             	mov    0x24(%ebp),%ebx
     392:	89 45 dc             	mov    %eax,-0x24(%ebp)
     395:	8b 45 18             	mov    0x18(%ebp),%eax
    char *old_end_of_heap = sbrk(size);
     398:	57                   	push   %edi
void test_allocation_then_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2, int check_zero) {
     399:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     39c:	8b 45 1c             	mov    0x1c(%ebp),%eax
     39f:	89 45 d8             	mov    %eax,-0x28(%ebp)
     3a2:	8b 45 20             	mov    0x20(%ebp),%eax
     3a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    char *old_end_of_heap = sbrk(size);
     3a8:	e8 2d 1a 00 00       	call   1dda <sbrk>
     3ad:	89 c6                	mov    %eax,%esi
    char *new_end_of_heap = sbrk(0);
     3af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3b6:	e8 1f 1a 00 00       	call   1dda <sbrk>
    if (old_end_of_heap == (char*) -1) {
     3bb:	83 c4 10             	add    $0x10,%esp
     3be:	83 fe ff             	cmp    $0xffffffff,%esi
     3c1:	0f 84 a9 00 00 00    	je     470 <test_allocation_then_fork+0xf0>
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
        return;
    } else if (new_end_of_heap - old_end_of_heap != size) {
     3c7:	29 f0                	sub    %esi,%eax
     3c9:	39 f8                	cmp    %edi,%eax
     3cb:	0f 85 7f 00 00 00    	jne    450 <test_allocation_then_fork+0xd0>
        printf(1, FAIL_MSG "HEAP_SIZE\n");
        return;
    } else {
        int failed = 0;
        char *place_one = &old_end_of_heap[offset1];
     3d1:	8b 7d dc             	mov    -0x24(%ebp),%edi
        char *place_two = &old_end_of_heap[offset2];
        int i;
        for (i = 0; i < count1; ++i) {
     3d4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
        char *place_one = &old_end_of_heap[offset1];
     3d7:	01 f7                	add    %esi,%edi
        char *place_two = &old_end_of_heap[offset2];
     3d9:	03 75 d8             	add    -0x28(%ebp),%esi
        for (i = 0; i < count1; ++i) {
     3dc:	85 c9                	test   %ecx,%ecx
        char *place_two = &old_end_of_heap[offset2];
     3de:	89 75 dc             	mov    %esi,-0x24(%ebp)
        for (i = 0; i < count1; ++i) {
     3e1:	0f 8e 99 00 00 00    	jle    480 <test_allocation_then_fork+0x100>
     3e7:	8d 14 39             	lea    (%ecx,%edi,1),%edx
     3ea:	89 f8                	mov    %edi,%eax
        int failed = 0;
     3ec:	31 f6                	xor    %esi,%esi
            if (check_zero && place_one[i] != '\0') {
                failed = 1;
     3ee:	b9 01 00 00 00       	mov    $0x1,%ecx
     3f3:	90                   	nop
     3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (check_zero && place_one[i] != '\0') {
     3f8:	85 db                	test   %ebx,%ebx
     3fa:	74 06                	je     402 <test_allocation_then_fork+0x82>
                failed = 1;
     3fc:	80 38 00             	cmpb   $0x0,(%eax)
     3ff:	0f 45 f1             	cmovne %ecx,%esi
            }
            place_one[i] = 'A';
     402:	c6 00 41             	movb   $0x41,(%eax)
     405:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count1; ++i) {
     408:	39 d0                	cmp    %edx,%eax
     40a:	75 ec                	jne    3f8 <test_allocation_then_fork+0x78>
        }
        for (i = 0; i < count2; ++i) {
     40c:	8b 55 e0             	mov    -0x20(%ebp),%edx
     40f:	85 d2                	test   %edx,%edx
     411:	7e 21                	jle    434 <test_allocation_then_fork+0xb4>
     413:	8b 4d dc             	mov    -0x24(%ebp),%ecx
     416:	89 c8                	mov    %ecx,%eax
     418:	01 ca                	add    %ecx,%edx
            if (check_zero && place_two[i] != '\0') {
                failed = 1;
     41a:	b9 01 00 00 00       	mov    $0x1,%ecx
     41f:	90                   	nop
            if (check_zero && place_two[i] != '\0') {
     420:	85 db                	test   %ebx,%ebx
     422:	74 06                	je     42a <test_allocation_then_fork+0xaa>
                failed = 1;
     424:	80 38 00             	cmpb   $0x0,(%eax)
     427:	0f 45 f1             	cmovne %ecx,%esi
            }
            place_two[i] = 'B';
     42a:	c6 00 42             	movb   $0x42,(%eax)
     42d:	83 c0 01             	add    $0x1,%eax
        for (i = 0; i < count2; ++i) {
     430:	39 d0                	cmp    %edx,%eax
     432:	75 ec                	jne    420 <test_allocation_then_fork+0xa0>
        }
        int pid = fork();
     434:	e8 11 19 00 00       	call   1d4a <fork>
        if (pid == 0) {
     439:	85 c0                	test   %eax,%eax
     43b:	74 47                	je     484 <test_allocation_then_fork+0x104>
            exit();
        } else {
            wait();
        }
    }
}
     43d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     440:	5b                   	pop    %ebx
     441:	5e                   	pop    %esi
     442:	5f                   	pop    %edi
     443:	5d                   	pop    %ebp
            wait();
     444:	e9 11 19 00 00       	jmp    1d5a <wait>
     449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     450:	c7 45 0c 4c 22 00 00 	movl   $0x224c,0xc(%ebp)
     457:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
}
     45e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     461:	5b                   	pop    %ebx
     462:	5e                   	pop    %esi
     463:	5f                   	pop    %edi
     464:	5d                   	pop    %ebp
        printf(1, FAIL_MSG "HEAP_SIZE\n");
     465:	e9 66 1a 00 00       	jmp    1ed0 <printf>
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, FAIL_MSG "HEAP_ALLOC\n");
     470:	c7 45 0c 36 22 00 00 	movl   $0x2236,0xc(%ebp)
     477:	eb de                	jmp    457 <test_allocation_then_fork+0xd7>
     479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        int failed = 0;
     480:	31 f6                	xor    %esi,%esi
     482:	eb 88                	jmp    40c <test_allocation_then_fork+0x8c>
            for (i = 0; i < count1; ++i) {
     484:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     487:	85 c0                	test   %eax,%eax
     489:	7e 14                	jle    49f <test_allocation_then_fork+0x11f>
     48b:	01 f8                	add    %edi,%eax
                    failed = 1;
     48d:	ba 01 00 00 00       	mov    $0x1,%edx
     492:	80 3f 41             	cmpb   $0x41,(%edi)
     495:	0f 45 f2             	cmovne %edx,%esi
     498:	83 c7 01             	add    $0x1,%edi
            for (i = 0; i < count1; ++i) {
     49b:	39 c7                	cmp    %eax,%edi
     49d:	75 f3                	jne    492 <test_allocation_then_fork+0x112>
            for (i = 0; i < count2; ++i) {
     49f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     4a2:	85 c0                	test   %eax,%eax
     4a4:	7e 17                	jle    4bd <test_allocation_then_fork+0x13d>
     4a6:	8b 55 dc             	mov    -0x24(%ebp),%edx
                    failed = 1;
     4a9:	b9 01 00 00 00       	mov    $0x1,%ecx
     4ae:	01 d0                	add    %edx,%eax
     4b0:	80 3a 42             	cmpb   $0x42,(%edx)
     4b3:	0f 45 f1             	cmovne %ecx,%esi
     4b6:	83 c2 01             	add    $0x1,%edx
            for (i = 0; i < count2; ++i) {
     4b9:	39 d0                	cmp    %edx,%eax
     4bb:	75 f3                	jne    4b0 <test_allocation_then_fork+0x130>
            if (failed) {
     4bd:	85 f6                	test   %esi,%esi
     4bf:	74 16                	je     4d7 <test_allocation_then_fork+0x157>
                printf(1, FAIL_MSG "HEAP_VALUES\n");
     4c1:	52                   	push   %edx
     4c2:	52                   	push   %edx
     4c3:	68 61 22 00 00       	push   $0x2261
     4c8:	6a 01                	push   $0x1
     4ca:	e8 01 1a 00 00       	call   1ed0 <printf>
     4cf:	83 c4 10             	add    $0x10,%esp
            exit();
     4d2:	e8 7b 18 00 00       	call   1d52 <exit>
                printf(1, PASS_MSG "\n");
     4d7:	50                   	push   %eax
     4d8:	50                   	push   %eax
     4d9:	68 78 22 00 00       	push   $0x2278
     4de:	6a 01                	push   $0x1
     4e0:	e8 eb 19 00 00       	call   1ed0 <printf>
     4e5:	83 c4 10             	add    $0x10,%esp
     4e8:	eb e8                	jmp    4d2 <test_allocation_then_fork+0x152>
     4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004f0 <test_allocation_fork>:


int test_allocation_fork(int size, const char *describe_size, const char *describe_amount, int offset1, int count1, int offset2, int count2) {
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
     4f6:	83 ec 2c             	sub    $0x2c,%esp
     4f9:	8b 75 0c             	mov    0xc(%ebp),%esi
     4fc:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing allocating %s and reading/writing to %s segments of it\n", describe_size, describe_amount);
     4ff:	57                   	push   %edi
     500:	56                   	push   %esi
     501:	68 10 23 00 00       	push   $0x2310
     506:	6a 01                	push   $0x1
     508:	e8 c3 19 00 00       	call   1ed0 <printf>
    int fds[2];
    pipe(fds);
     50d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     510:	89 04 24             	mov    %eax,(%esp)
     513:	e8 4a 18 00 00       	call   1d62 <pipe>
    int pid = fork();
     518:	e8 2d 18 00 00       	call   1d4a <fork>
    if (pid == 0) {
     51d:	83 c4 10             	add    $0x10,%esp
     520:	83 f8 00             	cmp    $0x0,%eax
     523:	0f 84 99 01 00 00    	je     6c2 <test_allocation_fork+0x1d2>
                    failed = 1;
            }
            write(fds[1], failed ? failed_text : "YY", 2);
        }
        exit();
    } else if (pid > 0) {
     529:	0f 8e b9 00 00 00    	jle    5e8 <test_allocation_fork+0xf8>
        char text[10];
        close(fds[1]);
     52f:	83 ec 0c             	sub    $0xc,%esp
     532:	ff 75 d8             	pushl  -0x28(%ebp)
     535:	e8 40 18 00 00       	call   1d7a <close>
        int size = read(fds[0], text, 10);
     53a:	8d 45 de             	lea    -0x22(%ebp),%eax
     53d:	83 c4 0c             	add    $0xc,%esp
     540:	6a 0a                	push   $0xa
     542:	50                   	push   %eax
     543:	ff 75 d4             	pushl  -0x2c(%ebp)
     546:	e8 1f 18 00 00       	call   1d6a <read>
     54b:	89 c3                	mov    %eax,%ebx
        wait();
     54d:	e8 08 18 00 00       	call   1d5a <wait>
        close(fds[0]);
     552:	58                   	pop    %eax
     553:	ff 75 d4             	pushl  -0x2c(%ebp)
     556:	e8 1f 18 00 00       	call   1d7a <close>
        if (size == 2 && text[0] == 'N') {
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	83 fb 02             	cmp    $0x2,%ebx
     561:	74 3d                	je     5a0 <test_allocation_fork+0xb0>
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
            } else {
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
            }
            return 0;
        } else if (size == 0) {
     563:	83 fb 00             	cmp    $0x0,%ebx
     566:	0f 84 a4 00 00 00    	je     610 <test_allocation_fork+0x120>
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
            return 0;
        } else if (size >= 1 && text[0] == 'Y') {
     56c:	7e 0c                	jle    57a <test_allocation_fork+0x8a>
     56e:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     572:	3c 59                	cmp    $0x59,%al
     574:	0f 84 b6 00 00 00    	je     630 <test_allocation_fork+0x140>
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
            return 1;
        } else {
            printf(1, FAIL_MSG "unknown error\n");
     57a:	83 ec 08             	sub    $0x8,%esp
            return 0;
     57d:	31 db                	xor    %ebx,%ebx
            printf(1, FAIL_MSG "unknown error\n");
     57f:	68 8d 22 00 00       	push   $0x228d
     584:	6a 01                	push   $0x1
     586:	e8 45 19 00 00       	call   1ed0 <printf>
            return 0;
     58b:	83 c4 10             	add    $0x10,%esp
        }
    } else {
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
        return 0;
    }
}
     58e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     591:	89 d8                	mov    %ebx,%eax
     593:	5b                   	pop    %ebx
     594:	5e                   	pop    %esi
     595:	5f                   	pop    %edi
     596:	5d                   	pop    %ebp
     597:	c3                   	ret    
     598:	90                   	nop
     599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (size == 2 && text[0] == 'N') {
     5a0:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
     5a4:	3c 4e                	cmp    $0x4e,%al
     5a6:	75 ca                	jne    572 <test_allocation_fork+0x82>
            if (text[1] == 'A') {
     5a8:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
     5ac:	3c 41                	cmp    $0x41,%al
     5ae:	0f 84 bc 00 00 00    	je     670 <test_allocation_fork+0x180>
            } else if (text[1] == 'I') {
     5b4:	3c 49                	cmp    $0x49,%al
     5b6:	0f 84 94 00 00 00    	je     650 <test_allocation_fork+0x160>
            } else if (text[1] == 'R') {
     5bc:	3c 52                	cmp    $0x52,%al
     5be:	0f 84 e6 00 00 00    	je     6aa <test_allocation_fork+0x1ba>
            } else if (text[1] == 'S') {
     5c4:	3c 53                	cmp    $0x53,%al
     5c6:	0f 84 c4 00 00 00    	je     690 <test_allocation_fork+0x1a0>
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     5cc:	56                   	push   %esi
     5cd:	57                   	push   %edi
            return 0;
     5ce:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "unknown error using %s parts of %s allocation\n", describe_amount, describe_size);
     5d0:	68 38 24 00 00       	push   $0x2438
     5d5:	6a 01                	push   $0x1
     5d7:	e8 f4 18 00 00       	call   1ed0 <printf>
     5dc:	83 c4 10             	add    $0x10,%esp
     5df:	eb ad                	jmp    58e <test_allocation_fork+0x9e>
     5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     5e8:	83 ec 08             	sub    $0x8,%esp
        return 0;
     5eb:	31 db                	xor    %ebx,%ebx
        printf(1, FAIL_MSG "allocation test: first fork failed\n");
     5ed:	68 fc 24 00 00       	push   $0x24fc
     5f2:	6a 01                	push   $0x1
     5f4:	e8 d7 18 00 00       	call   1ed0 <printf>
        return 0;
     5f9:	83 c4 10             	add    $0x10,%esp
}
     5fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5ff:	89 d8                	mov    %ebx,%eax
     601:	5b                   	pop    %ebx
     602:	5e                   	pop    %esi
     603:	5f                   	pop    %edi
     604:	5d                   	pop    %ebp
     605:	c3                   	ret    
     606:	8d 76 00             	lea    0x0(%esi),%esi
     609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            printf(1, FAIL_MSG "allocating %s and using %s parts of allocation crashed\n", describe_size, describe_amount);
     610:	57                   	push   %edi
     611:	56                   	push   %esi
     612:	68 74 24 00 00       	push   $0x2474
     617:	6a 01                	push   $0x1
     619:	e8 b2 18 00 00       	call   1ed0 <printf>
            return 0;
     61e:	83 c4 10             	add    $0x10,%esp
}
     621:	8d 65 f4             	lea    -0xc(%ebp),%esp
     624:	89 d8                	mov    %ebx,%eax
     626:	5b                   	pop    %ebx
     627:	5e                   	pop    %esi
     628:	5f                   	pop    %edi
     629:	5d                   	pop    %ebp
     62a:	c3                   	ret    
     62b:	90                   	nop
     62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     630:	57                   	push   %edi
     631:	56                   	push   %esi
            return 1;
     632:	bb 01 00 00 00       	mov    $0x1,%ebx
            printf(1, PASS_MSG "allocating %s and using %s parts of allocation passed\n", describe_size, describe_amount );
     637:	68 b8 24 00 00       	push   $0x24b8
     63c:	6a 01                	push   $0x1
     63e:	e8 8d 18 00 00       	call   1ed0 <printf>
            return 1;
     643:	83 c4 10             	add    $0x10,%esp
     646:	e9 43 ff ff ff       	jmp    58e <test_allocation_fork+0x9e>
     64b:	90                   	nop
     64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     650:	83 ec 08             	sub    $0x8,%esp
            return 0;
     653:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocation initialized to non-zero value\n");
     655:	68 94 23 00 00       	push   $0x2394
     65a:	6a 01                	push   $0x1
     65c:	e8 6f 18 00 00       	call   1ed0 <printf>
     661:	83 c4 10             	add    $0x10,%esp
     664:	e9 25 ff ff ff       	jmp    58e <test_allocation_fork+0x9e>
     669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     670:	83 ec 04             	sub    $0x4,%esp
            return 0;
     673:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "allocating (but not using) %s with sbrk() returned error\n", describe_size);
     675:	56                   	push   %esi
     676:	68 50 23 00 00       	push   $0x2350
     67b:	6a 01                	push   $0x1
     67d:	e8 4e 18 00 00       	call   1ed0 <printf>
     682:	83 c4 10             	add    $0x10,%esp
     685:	e9 04 ff ff ff       	jmp    58e <test_allocation_fork+0x9e>
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     690:	83 ec 04             	sub    $0x4,%esp
            return 0;
     693:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "wrong size allocated by %s allocation\n", describe_size);
     695:	56                   	push   %esi
     696:	68 04 24 00 00       	push   $0x2404
     69b:	6a 01                	push   $0x1
     69d:	e8 2e 18 00 00       	call   1ed0 <printf>
     6a2:	83 c4 10             	add    $0x10,%esp
     6a5:	e9 e4 fe ff ff       	jmp    58e <test_allocation_fork+0x9e>
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6aa:	56                   	push   %esi
     6ab:	57                   	push   %edi
            return 0;
     6ac:	31 db                	xor    %ebx,%ebx
                printf(1, FAIL_MSG "using %s parts of %s allocation read wrong value\n", describe_amount, describe_size);
     6ae:	68 c8 23 00 00       	push   $0x23c8
     6b3:	6a 01                	push   $0x1
     6b5:	e8 16 18 00 00       	call   1ed0 <printf>
     6ba:	83 c4 10             	add    $0x10,%esp
     6bd:	e9 cc fe ff ff       	jmp    58e <test_allocation_fork+0x9e>
        char *old_end_of_heap = sbrk(size);
     6c2:	83 ec 0c             	sub    $0xc,%esp
     6c5:	ff 75 08             	pushl  0x8(%ebp)
     6c8:	89 c3                	mov    %eax,%ebx
     6ca:	e8 0b 17 00 00       	call   1dda <sbrk>
     6cf:	89 c7                	mov    %eax,%edi
        char *new_end_of_heap = sbrk(0);
     6d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6d8:	e8 fd 16 00 00       	call   1dda <sbrk>
        if (old_end_of_heap == (char*) -1) {
     6dd:	83 c4 10             	add    $0x10,%esp
     6e0:	83 ff ff             	cmp    $0xffffffff,%edi
     6e3:	0f 84 d5 00 00 00    	je     7be <test_allocation_fork+0x2ce>
        } else if (new_end_of_heap - old_end_of_heap != size) {
     6e9:	29 f8                	sub    %edi,%eax
     6eb:	3b 45 08             	cmp    0x8(%ebp),%eax
     6ee:	74 18                	je     708 <test_allocation_fork+0x218>
            write(fds[1], "NS", 2);
     6f0:	53                   	push   %ebx
     6f1:	6a 02                	push   $0x2
     6f3:	68 8a 22 00 00       	push   $0x228a
     6f8:	ff 75 d8             	pushl  -0x28(%ebp)
     6fb:	e8 72 16 00 00       	call   1d72 <write>
     700:	83 c4 10             	add    $0x10,%esp
        exit();
     703:	e8 4a 16 00 00       	call   1d52 <exit>
            char *place_one = &old_end_of_heap[offset1];
     708:	8b 75 14             	mov    0x14(%ebp),%esi
            char *place_two = &old_end_of_heap[offset2];
     70b:	8b 55 1c             	mov    0x1c(%ebp),%edx
            char failed_text[2] = "NR";
     70e:	66 c7 45 de 4e 52    	movw   $0x524e,-0x22(%ebp)
            char *place_one = &old_end_of_heap[offset1];
     714:	01 fe                	add    %edi,%esi
            char *place_two = &old_end_of_heap[offset2];
     716:	01 fa                	add    %edi,%edx
            for (i = 0; i < count1; ++i) {
     718:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     71c:	0f 8e b4 00 00 00    	jle    7d6 <test_allocation_fork+0x2e6>
     722:	8b 7d 18             	mov    0x18(%ebp),%edi
     725:	89 f1                	mov    %esi,%ecx
            int failed = 0;
     727:	31 c0                	xor    %eax,%eax
     729:	01 f7                	add    %esi,%edi
                if (place_one[i] != 0) {
     72b:	80 39 00             	cmpb   $0x0,(%ecx)
     72e:	74 09                	je     739 <test_allocation_fork+0x249>
                    failed_text[1] = 'I';
     730:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     734:	b8 01 00 00 00       	mov    $0x1,%eax
                place_one[i] = 'A';
     739:	c6 01 41             	movb   $0x41,(%ecx)
     73c:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count1; ++i) {
     73f:	39 f9                	cmp    %edi,%ecx
     741:	75 e8                	jne    72b <test_allocation_fork+0x23b>
            for (i = 0; i < count2; ++i) {
     743:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     747:	7e 25                	jle    76e <test_allocation_fork+0x27e>
     749:	8b 7d 20             	mov    0x20(%ebp),%edi
     74c:	89 d1                	mov    %edx,%ecx
     74e:	01 d7                	add    %edx,%edi
                if (place_two[i] != 0) {
     750:	80 39 00             	cmpb   $0x0,(%ecx)
     753:	74 09                	je     75e <test_allocation_fork+0x26e>
                    failed_text[1] = 'I';
     755:	c6 45 df 49          	movb   $0x49,-0x21(%ebp)
                    failed = 1;
     759:	b8 01 00 00 00       	mov    $0x1,%eax
                place_two[i] = 'B';
     75e:	c6 01 42             	movb   $0x42,(%ecx)
     761:	83 c1 01             	add    $0x1,%ecx
            for (i = 0; i < count2; ++i) {
     764:	39 f9                	cmp    %edi,%ecx
     766:	75 e8                	jne    750 <test_allocation_fork+0x260>
            for (i = 0; i < count1; ++i) {
     768:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
     76c:	7e 1c                	jle    78a <test_allocation_fork+0x29a>
                    failed = 1;
     76e:	31 c9                	xor    %ecx,%ecx
                    failed = 1;
     770:	bf 01 00 00 00       	mov    $0x1,%edi
     775:	80 3c 0e 41          	cmpb   $0x41,(%esi,%ecx,1)
     779:	0f 45 c7             	cmovne %edi,%eax
            for (i = 0; i < count1; ++i) {
     77c:	83 c1 01             	add    $0x1,%ecx
     77f:	39 4d 18             	cmp    %ecx,0x18(%ebp)
     782:	7f f1                	jg     775 <test_allocation_fork+0x285>
            for (i = 0; i < count2; ++i) {
     784:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     788:	7e 14                	jle    79e <test_allocation_fork+0x2ae>
                    failed = 1;
     78a:	b9 01 00 00 00       	mov    $0x1,%ecx
     78f:	80 3c 1a 42          	cmpb   $0x42,(%edx,%ebx,1)
     793:	0f 45 c1             	cmovne %ecx,%eax
            for (i = 0; i < count2; ++i) {
     796:	83 c3 01             	add    $0x1,%ebx
     799:	39 5d 20             	cmp    %ebx,0x20(%ebp)
     79c:	7f f1                	jg     78f <test_allocation_fork+0x29f>
            write(fds[1], failed ? failed_text : "YY", 2);
     79e:	85 c0                	test   %eax,%eax
     7a0:	8d 55 de             	lea    -0x22(%ebp),%edx
     7a3:	75 05                	jne    7aa <test_allocation_fork+0x2ba>
     7a5:	ba 84 22 00 00       	mov    $0x2284,%edx
     7aa:	51                   	push   %ecx
     7ab:	6a 02                	push   $0x2
     7ad:	52                   	push   %edx
     7ae:	ff 75 d8             	pushl  -0x28(%ebp)
     7b1:	e8 bc 15 00 00       	call   1d72 <write>
     7b6:	83 c4 10             	add    $0x10,%esp
     7b9:	e9 45 ff ff ff       	jmp    703 <test_allocation_fork+0x213>
            write(fds[1], "NA", 2);
     7be:	56                   	push   %esi
     7bf:	6a 02                	push   $0x2
     7c1:	68 87 22 00 00       	push   $0x2287
     7c6:	ff 75 d8             	pushl  -0x28(%ebp)
     7c9:	e8 a4 15 00 00       	call   1d72 <write>
     7ce:	83 c4 10             	add    $0x10,%esp
     7d1:	e9 2d ff ff ff       	jmp    703 <test_allocation_fork+0x213>
            int failed = 0;
     7d6:	31 c0                	xor    %eax,%eax
            for (i = 0; i < count2; ++i) {
     7d8:	83 7d 20 00          	cmpl   $0x0,0x20(%ebp)
     7dc:	0f 8f 67 ff ff ff    	jg     749 <test_allocation_fork+0x259>
     7e2:	eb c1                	jmp    7a5 <test_allocation_fork+0x2b5>
     7e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007f0 <wait_forever>:

void wait_forever() {
     7f0:	55                   	push   %ebp
     7f1:	89 e5                	mov    %esp,%ebp
     7f3:	83 ec 08             	sub    $0x8,%esp
     7f6:	8d 76 00             	lea    0x0(%esi),%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while (1) { sleep(1000); }
     800:	83 ec 0c             	sub    $0xc,%esp
     803:	68 e8 03 00 00       	push   $0x3e8
     808:	e8 d5 15 00 00       	call   1de2 <sleep>
     80d:	83 c4 10             	add    $0x10,%esp
     810:	eb ee                	jmp    800 <wait_forever+0x10>
     812:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000820 <test_copy_on_write_main_child>:
}

void test_copy_on_write_main_child(int result_fd, int size, const char *describe_size, int forks) {
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	57                   	push   %edi
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	83 ec 78             	sub    $0x78,%esp
  char *old_end_of_heap = sbrk(size);
     829:	ff 75 0c             	pushl  0xc(%ebp)
     82c:	e8 a9 15 00 00       	call   1dda <sbrk>
     831:	89 c7                	mov    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     833:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  char *old_end_of_heap = sbrk(size);
     83a:	89 45 94             	mov    %eax,-0x6c(%ebp)
  char *new_end_of_heap = sbrk(0);
     83d:	e8 98 15 00 00       	call   1dda <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     842:	83 c4 10             	add    $0x10,%esp
     845:	39 c7                	cmp    %eax,%edi
  char *new_end_of_heap = sbrk(0);
     847:	89 45 90             	mov    %eax,-0x70(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     84a:	73 0e                	jae    85a <test_copy_on_write_main_child+0x3a>
     84c:	89 c2                	mov    %eax,%edx
     84e:	89 f8                	mov    %edi,%eax
      *p = 'A';
     850:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     853:	83 c0 01             	add    $0x1,%eax
     856:	39 c2                	cmp    %eax,%edx
     858:	75 f6                	jne    850 <test_copy_on_write_main_child+0x30>
  }
  int children[MAX_CHILDREN] = {0};
     85a:	31 c0                	xor    %eax,%eax
  if (forks > MAX_CHILDREN) {
     85c:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     860:	8d 7d a8             	lea    -0x58(%ebp),%edi
     863:	b9 10 00 00 00       	mov    $0x10,%ecx
     868:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     86a:	0f 8f 58 01 00 00    	jg     9c8 <test_copy_on_write_main_child+0x1a8>
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
     870:	8b 4d 14             	mov    0x14(%ebp),%ecx
     873:	85 c9                	test   %ecx,%ecx
     875:	0f 8e 64 01 00 00    	jle    9df <test_copy_on_write_main_child+0x1bf>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     87b:	31 db                	xor    %ebx,%ebx
     87d:	bf 20 00 00 00       	mov    $0x20,%edi
     882:	31 f6                	xor    %esi,%esi
     884:	eb 58                	jmp    8de <test_copy_on_write_main_child+0xbe>
     886:	8d 76 00             	lea    0x0(%esi),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (children[i] == -1) {
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
     890:	85 c0                	test   %eax,%eax
     892:	0f 84 5c 01 00 00    	je     9f4 <test_copy_on_write_main_child+0x1d4>
      }
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
      wait_forever();
    } else {
      char buffer[1] = {'X'};
      read(child_fds[0], buffer, 1);
     898:	8d 45 9f             	lea    -0x61(%ebp),%eax
     89b:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     89e:	c6 45 9f 58          	movb   $0x58,-0x61(%ebp)
      read(child_fds[0], buffer, 1);
     8a2:	6a 01                	push   $0x1
     8a4:	50                   	push   %eax
     8a5:	ff 75 a0             	pushl  -0x60(%ebp)
     8a8:	e8 bd 14 00 00       	call   1d6a <read>
      if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
     8ad:	80 7d 9f 2b          	cmpb   $0x2b,-0x61(%ebp)
      if (buffer[0] != '+') {
     8b1:	58                   	pop    %eax
        failed_code = 'c';
     8b2:	b8 63 00 00 00       	mov    $0x63,%eax
      }
      close(child_fds[0]); close(child_fds[1]);
     8b7:	ff 75 a0             	pushl  -0x60(%ebp)
        failed_code = 'c';
     8ba:	0f 45 f8             	cmovne %eax,%edi
     8bd:	b8 01 00 00 00       	mov    $0x1,%eax
     8c2:	0f 45 f0             	cmovne %eax,%esi
  for (int i = 0; i < forks; ++i) {
     8c5:	83 c3 01             	add    $0x1,%ebx
      close(child_fds[0]); close(child_fds[1]);
     8c8:	e8 ad 14 00 00       	call   1d7a <close>
     8cd:	5a                   	pop    %edx
     8ce:	ff 75 a4             	pushl  -0x5c(%ebp)
     8d1:	e8 a4 14 00 00       	call   1d7a <close>
  for (int i = 0; i < forks; ++i) {
     8d6:	83 c4 10             	add    $0x10,%esp
     8d9:	39 5d 14             	cmp    %ebx,0x14(%ebp)
     8dc:	74 39                	je     917 <test_copy_on_write_main_child+0xf7>
    pipe(child_fds);
     8de:	8d 45 a0             	lea    -0x60(%ebp),%eax
     8e1:	83 ec 0c             	sub    $0xc,%esp
     8e4:	50                   	push   %eax
     8e5:	e8 78 14 00 00       	call   1d62 <pipe>
    children[i] = fork();
     8ea:	e8 5b 14 00 00       	call   1d4a <fork>
    if (children[i] == -1) {
     8ef:	83 c4 10             	add    $0x10,%esp
     8f2:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     8f5:	89 44 9d a8          	mov    %eax,-0x58(%ebp,%ebx,4)
    if (children[i] == -1) {
     8f9:	75 95                	jne    890 <test_copy_on_write_main_child+0x70>
      printf(2, "fork failed\n");
     8fb:	83 ec 08             	sub    $0x8,%esp
      failed_code = 'f';
     8fe:	bf 66 00 00 00       	mov    $0x66,%edi
      failed = 1;
     903:	be 01 00 00 00       	mov    $0x1,%esi
      printf(2, "fork failed\n");
     908:	68 aa 22 00 00       	push   $0x22aa
     90d:	6a 02                	push   $0x2
     90f:	e8 bc 15 00 00       	call   1ed0 <printf>
      break;
     914:	83 c4 10             	add    $0x10,%esp
     917:	8b 45 14             	mov    0x14(%ebp),%eax
     91a:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     91d:	89 75 8c             	mov    %esi,-0x74(%ebp)
     920:	89 de                	mov    %ebx,%esi
     922:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     925:	89 c3                	mov    %eax,%ebx
     927:	89 f6                	mov    %esi,%esi
     929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
     930:	83 ec 0c             	sub    $0xc,%esp
     933:	ff 36                	pushl  (%esi)
     935:	83 c6 04             	add    $0x4,%esi
     938:	e8 45 14 00 00       	call   1d82 <kill>
    wait();
     93d:	e8 18 14 00 00       	call   1d5a <wait>
  for (int i = 0; i < forks; ++i) {
     942:	83 c4 10             	add    $0x10,%esp
     945:	39 f3                	cmp    %esi,%ebx
     947:	75 e7                	jne    930 <test_copy_on_write_main_child+0x110>
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     949:	8b 55 90             	mov    -0x70(%ebp),%edx
     94c:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     94f:	8b 75 8c             	mov    -0x74(%ebp),%esi
     952:	73 24                	jae    978 <test_copy_on_write_main_child+0x158>
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
     954:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
     957:	8b 5d 90             	mov    -0x70(%ebp),%ebx
     95a:	ba 70 00 00 00       	mov    $0x70,%edx
     95f:	b8 01 00 00 00       	mov    $0x1,%eax
     964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     968:	80 39 41             	cmpb   $0x41,(%ecx)
     96b:	0f 45 fa             	cmovne %edx,%edi
     96e:	0f 45 f0             	cmovne %eax,%esi
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     971:	83 c1 01             	add    $0x1,%ecx
     974:	39 cb                	cmp    %ecx,%ebx
     976:	75 f0                	jne    968 <test_copy_on_write_main_child+0x148>
    }
  }
  if (failed) {
     978:	85 f6                	test   %esi,%esi
     97a:	75 24                	jne    9a0 <test_copy_on_write_main_child+0x180>
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
     97c:	83 ec 04             	sub    $0x4,%esp
     97f:	6a 02                	push   $0x2
     981:	68 84 22 00 00       	push   $0x2284
     986:	ff 75 08             	pushl  0x8(%ebp)
     989:	e8 e4 13 00 00       	call   1d72 <write>
     98e:	83 c4 10             	add    $0x10,%esp
  }
}
     991:	8d 65 f4             	lea    -0xc(%ebp),%esp
     994:	5b                   	pop    %ebx
     995:	5e                   	pop    %esi
     996:	5f                   	pop    %edi
     997:	5d                   	pop    %ebp
     998:	c3                   	ret    
     999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    buffer[1] = failed_code;
     9a0:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     9a2:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     9a5:	c6 45 a0 4e          	movb   $0x4e,-0x60(%ebp)
    buffer[1] = failed_code;
     9a9:	88 45 a1             	mov    %al,-0x5f(%ebp)
    write(result_fd, buffer, 2);
     9ac:	8d 45 a0             	lea    -0x60(%ebp),%eax
     9af:	6a 02                	push   $0x2
     9b1:	50                   	push   %eax
     9b2:	ff 75 08             	pushl  0x8(%ebp)
     9b5:	e8 b8 13 00 00       	call   1d72 <write>
     9ba:	83 c4 10             	add    $0x10,%esp
}
     9bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c0:	5b                   	pop    %ebx
     9c1:	5e                   	pop    %esi
     9c2:	5f                   	pop    %edi
     9c3:	5d                   	pop    %ebp
     9c4:	c3                   	ret    
     9c5:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     9c8:	83 ec 08             	sub    $0x8,%esp
     9cb:	68 2c 25 00 00       	push   $0x252c
     9d0:	6a 02                	push   $0x2
     9d2:	e8 f9 14 00 00       	call   1ed0 <printf>
     9d7:	83 c4 10             	add    $0x10,%esp
     9da:	e9 9c fe ff ff       	jmp    87b <test_copy_on_write_main_child+0x5b>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9df:	31 f6                	xor    %esi,%esi
     9e1:	8b 55 90             	mov    -0x70(%ebp),%edx
     9e4:	39 55 94             	cmp    %edx,-0x6c(%ebp)
     9e7:	bf 20 00 00 00       	mov    $0x20,%edi
     9ec:	0f 82 62 ff ff ff    	jb     954 <test_copy_on_write_main_child+0x134>
     9f2:	eb 88                	jmp    97c <test_copy_on_write_main_child+0x15c>
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     9f4:	8b 55 94             	mov    -0x6c(%ebp),%edx
     9f7:	8b 4d 90             	mov    -0x70(%ebp),%ecx
     9fa:	39 ca                	cmp    %ecx,%edx
     9fc:	73 13                	jae    a11 <test_copy_on_write_main_child+0x1f1>
          found_wrong_memory = 1;
     9fe:	b9 01 00 00 00       	mov    $0x1,%ecx
     a03:	80 3a 41             	cmpb   $0x41,(%edx)
     a06:	0f 45 c1             	cmovne %ecx,%eax
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     a09:	83 c2 01             	add    $0x1,%edx
     a0c:	39 55 90             	cmp    %edx,-0x70(%ebp)
     a0f:	75 f2                	jne    a03 <test_copy_on_write_main_child+0x1e3>
      int place_one = size / 2;
     a11:	8b 7d 0c             	mov    0xc(%ebp),%edi
      old_end_of_heap[place_one] = 'B' + i;
     a14:	8b 75 94             	mov    -0x6c(%ebp),%esi
     a17:	8d 53 42             	lea    0x42(%ebx),%edx
          place_two = size - 1;
     a1a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_one = size / 2;
     a1d:	c1 ef 1f             	shr    $0x1f,%edi
     a20:	03 7d 0c             	add    0xc(%ebp),%edi
          place_two = size - 1;
     a23:	83 e9 01             	sub    $0x1,%ecx
      int place_one = size / 2;
     a26:	d1 ff                	sar    %edi
      old_end_of_heap[place_one] = 'B' + i;
     a28:	01 f7                	add    %esi,%edi
     a2a:	88 17                	mov    %dl,(%edi)
      int place_two = 4096 * i;
     a2c:	89 da                	mov    %ebx,%edx
     a2e:	c1 e2 0c             	shl    $0xc,%edx
          place_two = size - 1;
     a31:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a34:	0f 4f ca             	cmovg  %edx,%ecx
      old_end_of_heap[place_two] = 'C';
     a37:	c6 04 0e 43          	movb   $0x43,(%esi,%ecx,1)
      int place_three = 4096 * (i - 1);
     a3b:	8d b2 00 f0 ff ff    	lea    -0x1000(%edx),%esi
      if (place_three >= size || place_three < 0) {
     a41:	39 75 0c             	cmp    %esi,0xc(%ebp)
     a44:	7e 66                	jle    aac <test_copy_on_write_main_child+0x28c>
     a46:	85 f6                	test   %esi,%esi
     a48:	78 62                	js     aac <test_copy_on_write_main_child+0x28c>
          place_four = size - 3;
     a4a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
      int place_four = 4096 * (i + 1);
     a4d:	81 c2 00 10 00 00    	add    $0x1000,%edx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a53:	89 45 90             	mov    %eax,-0x70(%ebp)
          place_four = size - 3;
     a56:	83 e9 03             	sub    $0x3,%ecx
     a59:	39 55 0c             	cmp    %edx,0xc(%ebp)
     a5c:	0f 4e d1             	cmovle %ecx,%edx
        old_end_of_heap[place_four],
     a5f:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a62:	83 ec 04             	sub    $0x4,%esp
     a65:	53                   	push   %ebx
     a66:	50                   	push   %eax
        old_end_of_heap[place_four],
     a67:	01 ca                	add    %ecx,%edx
        old_end_of_heap[place_three],
     a69:	01 ce                	add    %ecx,%esi
      printf(1, "three: %c; one: %c; four: %c; already_wrong: %d; i: %d\n",
     a6b:	0f be 0a             	movsbl (%edx),%ecx
     a6e:	89 55 94             	mov    %edx,-0x6c(%ebp)
     a71:	51                   	push   %ecx
     a72:	0f be 0f             	movsbl (%edi),%ecx
     a75:	51                   	push   %ecx
     a76:	0f be 0e             	movsbl (%esi),%ecx
     a79:	51                   	push   %ecx
     a7a:	68 64 25 00 00       	push   $0x2564
     a7f:	6a 01                	push   $0x1
     a81:	e8 4a 14 00 00       	call   1ed0 <printf>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     a86:	83 c4 20             	add    $0x20,%esp
     a89:	80 3e 41             	cmpb   $0x41,(%esi)
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     a8c:	b9 a6 22 00 00       	mov    $0x22a6,%ecx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     a91:	8b 55 94             	mov    -0x6c(%ebp),%edx
     a94:	8b 45 90             	mov    -0x70(%ebp),%eax
     a97:	74 1b                	je     ab4 <test_copy_on_write_main_child+0x294>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     a99:	83 ec 04             	sub    $0x4,%esp
     a9c:	6a 01                	push   $0x1
     a9e:	51                   	push   %ecx
     a9f:	ff 75 a4             	pushl  -0x5c(%ebp)
     aa2:	e8 cb 12 00 00       	call   1d72 <write>
      wait_forever();
     aa7:	e8 44 fd ff ff       	call   7f0 <wait_forever>
          place_three = size - 2;
     aac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     aaf:	8d 71 fe             	lea    -0x2(%ecx),%esi
     ab2:	eb 96                	jmp    a4a <test_copy_on_write_main_child+0x22a>
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ab4:	0f be 37             	movsbl (%edi),%esi
     ab7:	83 c3 42             	add    $0x42,%ebx
     aba:	39 de                	cmp    %ebx,%esi
     abc:	75 db                	jne    a99 <test_copy_on_write_main_child+0x279>
      write(child_fds[1], found_wrong_memory ? "-" : "+", 1);
     abe:	80 3a 41             	cmpb   $0x41,(%edx)
     ac1:	75 09                	jne    acc <test_copy_on_write_main_child+0x2ac>
     ac3:	a8 01                	test   $0x1,%al
     ac5:	b9 a8 22 00 00       	mov    $0x22a8,%ecx
     aca:	74 cd                	je     a99 <test_copy_on_write_main_child+0x279>
     acc:	b9 a6 22 00 00       	mov    $0x22a6,%ecx
     ad1:	eb c6                	jmp    a99 <test_copy_on_write_main_child+0x279>
     ad3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <test_copy_on_write_main_child_alt>:

void test_copy_on_write_main_child_alt(int result_fd, int size, const char *describe_size, int forks, int early_term) {
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	57                   	push   %edi
     ae4:	56                   	push   %esi
     ae5:	53                   	push   %ebx
     ae6:	81 ec 08 01 00 00    	sub    $0x108,%esp
  char *old_end_of_heap = sbrk(size);
     aec:	ff 75 0c             	pushl  0xc(%ebp)
     aef:	e8 e6 12 00 00       	call   1dda <sbrk>
     af4:	89 c6                	mov    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     af6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     afd:	e8 d8 12 00 00       	call   1dda <sbrk>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b02:	83 c4 10             	add    $0x10,%esp
     b05:	39 c6                	cmp    %eax,%esi
  char *new_end_of_heap = sbrk(0);
     b07:	89 85 10 ff ff ff    	mov    %eax,-0xf0(%ebp)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b0d:	73 13                	jae    b22 <test_copy_on_write_main_child_alt+0x42>
     b0f:	89 c2                	mov    %eax,%edx
     b11:	89 f0                	mov    %esi,%eax
     b13:	90                   	nop
     b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *p = 'A';
     b18:	c6 00 41             	movb   $0x41,(%eax)
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b1b:	83 c0 01             	add    $0x1,%eax
     b1e:	39 c2                	cmp    %eax,%edx
     b20:	75 f6                	jne    b18 <test_copy_on_write_main_child_alt+0x38>
  }
  int children[MAX_CHILDREN] = {0};
     b22:	31 c0                	xor    %eax,%eax
  int child_fds[MAX_CHILDREN][2];
  if (forks > MAX_CHILDREN) {
     b24:	83 7d 14 10          	cmpl   $0x10,0x14(%ebp)
  int children[MAX_CHILDREN] = {0};
     b28:	8d 9d 28 ff ff ff    	lea    -0xd8(%ebp),%ebx
     b2e:	b9 10 00 00 00       	mov    $0x10,%ecx
     b33:	89 df                	mov    %ebx,%edi
     b35:	f3 ab                	rep stos %eax,%es:(%edi)
  if (forks > MAX_CHILDREN) {
     b37:	0f 8f bb 01 00 00    	jg     cf8 <test_copy_on_write_main_child_alt+0x218>
    printf(2, "unsupported number of children in test_copy_on_write\n");
  }
  int failed = 0;
  char failed_code = ' ';
  for (int i = 0; i < forks; ++i) {
     b3d:	8b 7d 14             	mov    0x14(%ebp),%edi
     b40:	85 ff                	test   %edi,%edi
     b42:	0f 8e a7 03 00 00    	jle    eef <test_copy_on_write_main_child_alt+0x40f>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     b48:	31 ff                	xor    %edi,%edi
     b4a:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%ebp)
     b50:	89 fe                	mov    %edi,%esi
     b52:	8b 7d 14             	mov    0x14(%ebp),%edi
     b55:	eb 1e                	jmp    b75 <test_copy_on_write_main_child_alt+0x95>
     b57:	89 f6                	mov    %esi,%esi
     b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (children[i] == -1) {
      printf(2, "fork failed\n");
      failed = 1;
      failed_code = 'f';
      break;
    } else if (children[i] == 0) {
     b60:	85 c0                	test   %eax,%eax
     b62:	8d 56 01             	lea    0x1(%esi),%edx
     b65:	0f 84 a5 01 00 00    	je     d10 <test_copy_on_write_main_child_alt+0x230>
  for (int i = 0; i < forks; ++i) {
     b6b:	39 fa                	cmp    %edi,%edx
     b6d:	89 d6                	mov    %edx,%esi
     b6f:	0f 84 cb 02 00 00    	je     e40 <test_copy_on_write_main_child_alt+0x360>
    sleep(1);
     b75:	83 ec 0c             	sub    $0xc,%esp
     b78:	6a 01                	push   $0x1
     b7a:	e8 63 12 00 00       	call   1de2 <sleep>
    pipe(child_fds[i]);
     b7f:	8d 84 f5 68 ff ff ff 	lea    -0x98(%ebp,%esi,8),%eax
     b86:	89 04 24             	mov    %eax,(%esp)
     b89:	e8 d4 11 00 00       	call   1d62 <pipe>
    children[i] = fork();
     b8e:	e8 b7 11 00 00       	call   1d4a <fork>
    if (children[i] == -1) {
     b93:	83 c4 10             	add    $0x10,%esp
     b96:	83 f8 ff             	cmp    $0xffffffff,%eax
    children[i] = fork();
     b99:	89 04 b3             	mov    %eax,(%ebx,%esi,4)
    if (children[i] == -1) {
     b9c:	75 c2                	jne    b60 <test_copy_on_write_main_child_alt+0x80>
      printf(2, "fork failed\n");
     b9e:	83 ec 08             	sub    $0x8,%esp
     ba1:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      failed_code = 'f';
     ba7:	bf 66 00 00 00       	mov    $0x66,%edi
      printf(2, "fork failed\n");
     bac:	68 aa 22 00 00       	push   $0x22aa
     bb1:	6a 02                	push   $0x2
     bb3:	e8 18 13 00 00       	call   1ed0 <printf>
      break;
     bb8:	83 c4 10             	add    $0x10,%esp
      failed = 1;
     bbb:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     bc2:	00 00 00 
      if (old_end_of_heap[place_three] != 'A' || 
          old_end_of_heap[place_four] != 'A' ||
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
          found_wrong_memory = 1;
      }
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     bc5:	31 d2                	xor    %edx,%edx
     bc7:	89 b5 0c ff ff ff    	mov    %esi,-0xf4(%ebp)
     bcd:	89 d6                	mov    %edx,%esi
     bcf:	eb 4a                	jmp    c1b <test_copy_on_write_main_child_alt+0x13b>
     bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if (buffer[0] == 'X') {
        failed = 1;
        failed_code = 'P';
      } else if (buffer[0] != '+') {
        failed = 1;
        failed_code = 'c';
     bd8:	3c 2b                	cmp    $0x2b,%al
     bda:	b8 01 00 00 00       	mov    $0x1,%eax
     bdf:	0f 44 85 14 ff ff ff 	cmove  -0xec(%ebp),%eax
     be6:	b9 63 00 00 00       	mov    $0x63,%ecx
     beb:	0f 45 f9             	cmovne %ecx,%edi
     bee:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
      }
      close(child_fds[i][0]); close(child_fds[i][1]);
     bf4:	83 ec 0c             	sub    $0xc,%esp
     bf7:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     bfe:	e8 77 11 00 00       	call   1d7a <close>
     c03:	5a                   	pop    %edx
     c04:	ff b4 f5 6c ff ff ff 	pushl  -0x94(%ebp,%esi,8)
     c0b:	e8 6a 11 00 00       	call   1d7a <close>
     c10:	83 c4 10             	add    $0x10,%esp
  for (int i = 0; i < forks; ++i) {
     c13:	83 c6 01             	add    $0x1,%esi
     c16:	39 75 14             	cmp    %esi,0x14(%ebp)
     c19:	74 45                	je     c60 <test_copy_on_write_main_child_alt+0x180>
    if (children[i] != -1) {
     c1b:	83 3c b3 ff          	cmpl   $0xffffffff,(%ebx,%esi,4)
     c1f:	74 f2                	je     c13 <test_copy_on_write_main_child_alt+0x133>
      read(child_fds[i][0], buffer, 1);
     c21:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     c27:	83 ec 04             	sub    $0x4,%esp
      char buffer[1] = {'X'};
     c2a:	c6 85 26 ff ff ff 58 	movb   $0x58,-0xda(%ebp)
      read(child_fds[i][0], buffer, 1);
     c31:	6a 01                	push   $0x1
     c33:	50                   	push   %eax
     c34:	ff b4 f5 68 ff ff ff 	pushl  -0x98(%ebp,%esi,8)
     c3b:	e8 2a 11 00 00       	call   1d6a <read>
      if (buffer[0] == 'X') {
     c40:	0f b6 85 26 ff ff ff 	movzbl -0xda(%ebp),%eax
     c47:	83 c4 10             	add    $0x10,%esp
     c4a:	3c 58                	cmp    $0x58,%al
     c4c:	75 8a                	jne    bd8 <test_copy_on_write_main_child_alt+0xf8>
        failed_code = 'P';
     c4e:	bf 50 00 00 00       	mov    $0x50,%edi
        failed = 1;
     c53:	c7 85 14 ff ff ff 01 	movl   $0x1,-0xec(%ebp)
     c5a:	00 00 00 
     c5d:	eb 95                	jmp    bf4 <test_copy_on_write_main_child_alt+0x114>
     c5f:	90                   	nop
     c60:	8b 45 14             	mov    0x14(%ebp),%eax
     c63:	89 de                	mov    %ebx,%esi
     c65:	8d 04 83             	lea    (%ebx,%eax,4),%eax
     c68:	89 c3                	mov    %eax,%ebx
     c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
  }
  for (int i = 0; i < forks; ++i) {
    kill(children[i]);
     c70:	83 ec 0c             	sub    $0xc,%esp
     c73:	ff 36                	pushl  (%esi)
     c75:	83 c6 04             	add    $0x4,%esi
     c78:	e8 05 11 00 00       	call   1d82 <kill>
    wait();
     c7d:	e8 d8 10 00 00       	call   1d5a <wait>
  for (int i = 0; i < forks; ++i) {
     c82:	83 c4 10             	add    $0x10,%esp
     c85:	39 f3                	cmp    %esi,%ebx
     c87:	75 e7                	jne    c70 <test_copy_on_write_main_child_alt+0x190>
     c89:	8b b5 0c ff ff ff    	mov    -0xf4(%ebp),%esi
  }
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     c8f:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
     c95:	73 2f                	jae    cc6 <test_copy_on_write_main_child_alt+0x1e6>
    if (*p != 'A') {
      failed = 1;
      failed_code = 'p';
     c97:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     c9d:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
     ca3:	ba 70 00 00 00       	mov    $0x70,%edx
     ca8:	b8 01 00 00 00       	mov    $0x1,%eax
     cad:	8d 76 00             	lea    0x0(%esi),%esi
     cb0:	80 3e 41             	cmpb   $0x41,(%esi)
     cb3:	0f 45 fa             	cmovne %edx,%edi
     cb6:	0f 45 c8             	cmovne %eax,%ecx
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     cb9:	83 c6 01             	add    $0x1,%esi
     cbc:	39 f3                	cmp    %esi,%ebx
     cbe:	75 f0                	jne    cb0 <test_copy_on_write_main_child_alt+0x1d0>
     cc0:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
    }
  }
  if (failed) {
     cc6:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
     ccc:	85 c0                	test   %eax,%eax
     cce:	0f 85 3c 01 00 00    	jne    e10 <test_copy_on_write_main_child_alt+0x330>
    char buffer[2] = {'N', ' '};
    buffer[1] = failed_code;
    write(result_fd, buffer, 2);
  } else {
    write(result_fd, "YY", 2);
     cd4:	83 ec 04             	sub    $0x4,%esp
     cd7:	6a 02                	push   $0x2
     cd9:	68 84 22 00 00       	push   $0x2284
     cde:	ff 75 08             	pushl  0x8(%ebp)
     ce1:	e8 8c 10 00 00       	call   1d72 <write>
     ce6:	83 c4 10             	add    $0x10,%esp
  }
}
     ce9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cec:	5b                   	pop    %ebx
     ced:	5e                   	pop    %esi
     cee:	5f                   	pop    %edi
     cef:	5d                   	pop    %ebp
     cf0:	c3                   	ret    
     cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "unsupported number of children in test_copy_on_write\n");
     cf8:	83 ec 08             	sub    $0x8,%esp
     cfb:	68 2c 25 00 00       	push   $0x252c
     d00:	6a 02                	push   $0x2
     d02:	e8 c9 11 00 00       	call   1ed0 <printf>
     d07:	83 c4 10             	add    $0x10,%esp
     d0a:	e9 39 fe ff ff       	jmp    b48 <test_copy_on_write_main_child_alt+0x68>
     d0f:	90                   	nop
     d10:	89 95 0c ff ff ff    	mov    %edx,-0xf4(%ebp)
     d16:	89 f7                	mov    %esi,%edi
     d18:	89 c2                	mov    %eax,%edx
     d1a:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d20:	8b 85 10 ff ff ff    	mov    -0xf0(%ebp),%eax
     d26:	39 c6                	cmp    %eax,%esi
     d28:	73 1b                	jae    d45 <test_copy_on_write_main_child_alt+0x265>
     d2a:	89 f1                	mov    %esi,%ecx
          found_wrong_memory = 1;
     d2c:	bb 01 00 00 00       	mov    $0x1,%ebx
     d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d38:	80 39 41             	cmpb   $0x41,(%ecx)
     d3b:	0f 45 d3             	cmovne %ebx,%edx
      for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     d3e:	83 c1 01             	add    $0x1,%ecx
     d41:	39 c8                	cmp    %ecx,%eax
     d43:	75 f3                	jne    d38 <test_copy_on_write_main_child_alt+0x258>
      int place_one = size / 2;
     d45:	8b 4d 0c             	mov    0xc(%ebp),%ecx
          place_two = size - 1;
     d48:	8b 45 0c             	mov    0xc(%ebp),%eax
      int place_one = size / 2;
     d4b:	c1 e9 1f             	shr    $0x1f,%ecx
     d4e:	03 4d 0c             	add    0xc(%ebp),%ecx
     d51:	d1 f9                	sar    %ecx
      old_end_of_heap[place_one] = 'B' + i;
     d53:	01 f1                	add    %esi,%ecx
     d55:	89 cb                	mov    %ecx,%ebx
     d57:	89 8d 08 ff ff ff    	mov    %ecx,-0xf8(%ebp)
     d5d:	8d 4f 42             	lea    0x42(%edi),%ecx
     d60:	88 0b                	mov    %cl,(%ebx)
      int place_two = 4096 * i;
     d62:	89 f9                	mov    %edi,%ecx
          place_two = size - 1;
     d64:	8d 58 ff             	lea    -0x1(%eax),%ebx
      int place_two = 4096 * i;
     d67:	c1 e1 0c             	shl    $0xc,%ecx
          place_two = size - 1;
     d6a:	39 c8                	cmp    %ecx,%eax
     d6c:	0f 4f d9             	cmovg  %ecx,%ebx
      int place_three = 4096 * (i - 1);
     d6f:	81 e9 00 10 00 00    	sub    $0x1000,%ecx
      old_end_of_heap[place_two] = 'C' + i;
     d75:	01 f3                	add    %esi,%ebx
      if (place_three >= size || place_three < 0) {
     d77:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
      old_end_of_heap[place_two] = 'C' + i;
     d7a:	89 d8                	mov    %ebx,%eax
     d7c:	89 9d 04 ff ff ff    	mov    %ebx,-0xfc(%ebp)
     d82:	8d 5f 43             	lea    0x43(%edi),%ebx
     d85:	88 18                	mov    %bl,(%eax)
      if (place_three >= size || place_three < 0) {
     d87:	0f 8e db 00 00 00    	jle    e68 <test_copy_on_write_main_child_alt+0x388>
     d8d:	85 c9                	test   %ecx,%ecx
     d8f:	0f 88 d3 00 00 00    	js     e68 <test_copy_on_write_main_child_alt+0x388>
      int place_four = 4096 * (i + 1);
     d95:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
     d9b:	c1 e0 0c             	shl    $0xc,%eax
     d9e:	89 c3                	mov    %eax,%ebx
          place_four = size - 3;
     da0:	8b 45 0c             	mov    0xc(%ebp),%eax
     da3:	83 e8 03             	sub    $0x3,%eax
     da6:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
     da9:	0f 4e d8             	cmovle %eax,%ebx
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     dac:	01 f1                	add    %esi,%ecx
     dae:	80 39 41             	cmpb   $0x41,(%ecx)
     db1:	0f 84 09 01 00 00    	je     ec0 <test_copy_on_write_main_child_alt+0x3e0>
          found_wrong_memory = 1;
     db7:	ba 01 00 00 00       	mov    $0x1,%edx
      sleep(5);
     dbc:	83 ec 0c             	sub    $0xc,%esp
     dbf:	89 95 10 ff ff ff    	mov    %edx,-0xf0(%ebp)
     dc5:	89 8d 14 ff ff ff    	mov    %ecx,-0xec(%ebp)
     dcb:	6a 05                	push   $0x5
     dcd:	e8 10 10 00 00       	call   1de2 <sleep>
      if (old_end_of_heap[place_three] != 'A' || 
     dd2:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
     dd8:	83 c4 10             	add    $0x10,%esp
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     ddb:	b8 a6 22 00 00       	mov    $0x22a6,%eax
      if (old_end_of_heap[place_three] != 'A' || 
     de0:	8b 95 10 ff ff ff    	mov    -0xf0(%ebp),%edx
     de6:	80 39 41             	cmpb   $0x41,(%ecx)
     de9:	0f 84 89 00 00 00    	je     e78 <test_copy_on_write_main_child_alt+0x398>
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     def:	83 ec 04             	sub    $0x4,%esp
     df2:	6a 01                	push   $0x1
     df4:	50                   	push   %eax
     df5:	ff b4 fd 6c ff ff ff 	pushl  -0x94(%ebp,%edi,8)
     dfc:	e8 71 0f 00 00       	call   1d72 <write>
      if (early_term) {
     e01:	8b 4d 18             	mov    0x18(%ebp),%ecx
     e04:	83 c4 10             	add    $0x10,%esp
     e07:	85 c9                	test   %ecx,%ecx
     e09:	74 55                	je     e60 <test_copy_on_write_main_child_alt+0x380>
          exit();
     e0b:	e8 42 0f 00 00       	call   1d52 <exit>
    buffer[1] = failed_code;
     e10:	89 f8                	mov    %edi,%eax
    write(result_fd, buffer, 2);
     e12:	83 ec 04             	sub    $0x4,%esp
    char buffer[2] = {'N', ' '};
     e15:	c6 85 26 ff ff ff 4e 	movb   $0x4e,-0xda(%ebp)
    buffer[1] = failed_code;
     e1c:	88 85 27 ff ff ff    	mov    %al,-0xd9(%ebp)
    write(result_fd, buffer, 2);
     e22:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
     e28:	6a 02                	push   $0x2
     e2a:	50                   	push   %eax
     e2b:	ff 75 08             	pushl  0x8(%ebp)
     e2e:	e8 3f 0f 00 00       	call   1d72 <write>
     e33:	83 c4 10             	add    $0x10,%esp
}
     e36:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e39:	5b                   	pop    %ebx
     e3a:	5e                   	pop    %esi
     e3b:	5f                   	pop    %edi
     e3c:	5d                   	pop    %ebp
     e3d:	c3                   	ret    
     e3e:	66 90                	xchg   %ax,%ax
     e40:	8b b5 14 ff ff ff    	mov    -0xec(%ebp),%esi
  char failed_code = ' ';
     e46:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     e4b:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     e52:	00 00 00 
     e55:	e9 6b fd ff ff       	jmp    bc5 <test_copy_on_write_main_child_alt+0xe5>
     e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          wait_forever();
     e60:	e8 8b f9 ff ff       	call   7f0 <wait_forever>
     e65:	8d 76 00             	lea    0x0(%esi),%esi
          place_three = size - 2;
     e68:	8b 45 0c             	mov    0xc(%ebp),%eax
     e6b:	8d 48 fe             	lea    -0x2(%eax),%ecx
     e6e:	e9 22 ff ff ff       	jmp    d95 <test_copy_on_write_main_child_alt+0x2b5>
     e73:	90                   	nop
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (old_end_of_heap[place_three] != 'A' || 
     e78:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     e7c:	0f 85 6d ff ff ff    	jne    def <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     e82:	8b 8d 04 ff ff ff    	mov    -0xfc(%ebp),%ecx
     e88:	0f be 19             	movsbl (%ecx),%ebx
     e8b:	8d 4f 43             	lea    0x43(%edi),%ecx
          old_end_of_heap[place_four] != 'A' ||
     e8e:	39 cb                	cmp    %ecx,%ebx
     e90:	0f 85 59 ff ff ff    	jne    def <test_copy_on_write_main_child_alt+0x30f>
          old_end_of_heap[place_two] != 'C' + i || old_end_of_heap[place_one] != 'B' + i) {
     e96:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     e9c:	0f be 08             	movsbl (%eax),%ecx
     e9f:	8d 47 42             	lea    0x42(%edi),%eax
      write(child_fds[i][1], found_wrong_memory ? "-" : "+", 1);
     ea2:	39 c1                	cmp    %eax,%ecx
     ea4:	75 0e                	jne    eb4 <test_copy_on_write_main_child_alt+0x3d4>
     ea6:	83 e2 01             	and    $0x1,%edx
     ea9:	b8 a8 22 00 00       	mov    $0x22a8,%eax
     eae:	0f 84 3b ff ff ff    	je     def <test_copy_on_write_main_child_alt+0x30f>
     eb4:	b8 a6 22 00 00       	mov    $0x22a6,%eax
     eb9:	e9 31 ff ff ff       	jmp    def <test_copy_on_write_main_child_alt+0x30f>
     ebe:	66 90                	xchg   %ax,%ax
      if (old_end_of_heap[place_three] != 'A' || old_end_of_heap[place_one] != 'B' + i ||
     ec0:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
     ec6:	0f be 00             	movsbl (%eax),%eax
     ec9:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
     ecf:	8d 47 42             	lea    0x42(%edi),%eax
     ed2:	39 85 14 ff ff ff    	cmp    %eax,-0xec(%ebp)
     ed8:	0f 85 d9 fe ff ff    	jne    db7 <test_copy_on_write_main_child_alt+0x2d7>
          found_wrong_memory = 1;
     ede:	80 3c 1e 41          	cmpb   $0x41,(%esi,%ebx,1)
     ee2:	b8 01 00 00 00       	mov    $0x1,%eax
     ee7:	0f 45 d0             	cmovne %eax,%edx
     eea:	e9 cd fe ff ff       	jmp    dbc <test_copy_on_write_main_child_alt+0x2dc>
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     eef:	3b b5 10 ff ff ff    	cmp    -0xf0(%ebp),%esi
  char failed_code = ' ';
     ef5:	bf 20 00 00 00       	mov    $0x20,%edi
  int failed = 0;
     efa:	c7 85 14 ff ff ff 00 	movl   $0x0,-0xec(%ebp)
     f01:	00 00 00 
  for (char *p = old_end_of_heap; p < new_end_of_heap; ++p) {
     f04:	0f 82 8d fd ff ff    	jb     c97 <test_copy_on_write_main_child_alt+0x1b7>
     f0a:	e9 c5 fd ff ff       	jmp    cd4 <test_copy_on_write_main_child_alt+0x1f4>
     f0f:	90                   	nop

00000f10 <test_copy_on_write_less_forks>:

int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	56                   	push   %esi
     f14:	53                   	push   %ebx
  int fds[2];
  pipe(fds);
     f15:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks(int size, const char *describe_size, int forks) {
     f18:	83 ec 1c             	sub    $0x1c,%esp
     f1b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f1e:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
     f21:	50                   	push   %eax
     f22:	e8 3b 0e 00 00       	call   1d62 <pipe>
  test_copy_on_write_main_child(fds[1], size, describe_size, forks);
     f27:	56                   	push   %esi
     f28:	53                   	push   %ebx
     f29:	ff 75 08             	pushl  0x8(%ebp)
     f2c:	ff 75 f4             	pushl  -0xc(%ebp)
     f2f:	e8 ec f8 ff ff       	call   820 <test_copy_on_write_main_child>
  char text[2] = {'X', 'X'};
     f34:	b8 58 58 00 00       	mov    $0x5858,%eax
  read(fds[0], text, 2);
     f39:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
     f3c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  read(fds[0], text, 2);
     f40:	8d 45 ee             	lea    -0x12(%ebp),%eax
     f43:	6a 02                	push   $0x2
     f45:	50                   	push   %eax
     f46:	ff 75 f0             	pushl  -0x10(%ebp)
     f49:	e8 1c 0e 00 00       	call   1d6a <read>
  close(fds[0]); close(fds[1]);
     f4e:	5a                   	pop    %edx
     f4f:	ff 75 f0             	pushl  -0x10(%ebp)
     f52:	e8 23 0e 00 00       	call   1d7a <close>
     f57:	59                   	pop    %ecx
     f58:	ff 75 f4             	pushl  -0xc(%ebp)
     f5b:	e8 1a 0e 00 00       	call   1d7a <close>
  if (text[0] == 'X') {
     f60:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
     f64:	83 c4 10             	add    $0x10,%esp
     f67:	3c 58                	cmp    $0x58,%al
     f69:	74 75                	je     fe0 <test_copy_on_write_less_forks+0xd0>
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
     f6b:	3c 4e                	cmp    $0x4e,%al
     f6d:	75 39                	jne    fa8 <test_copy_on_write_less_forks+0x98>
    switch (text[1]) {
     f6f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     f73:	3c 63                	cmp    $0x63,%al
     f75:	0f 84 a5 00 00 00    	je     1020 <test_copy_on_write_less_forks+0x110>
     f7b:	0f 8e 7f 00 00 00    	jle    1000 <test_copy_on_write_less_forks+0xf0>
     f81:	3c 66                	cmp    $0x66,%al
     f83:	74 43                	je     fc8 <test_copy_on_write_less_forks+0xb8>
     f85:	3c 70                	cmp    $0x70,%al
     f87:	0f 85 b3 00 00 00    	jne    1040 <test_copy_on_write_less_forks+0x130>
    case 'f':
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
      break;
    case 'p':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
     f8d:	83 ec 08             	sub    $0x8,%esp
     f90:	68 04 26 00 00       	push   $0x2604
     f95:	6a 01                	push   $0x1
     f97:	e8 34 0f 00 00       	call   1ed0 <printf>
      break;
     f9c:	83 c4 10             	add    $0x10,%esp
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
      break;
    }
    return 0;
     f9f:	31 c0                	xor    %eax,%eax
      break;
     fa1:	eb 1b                	jmp    fbe <test_copy_on_write_less_forks+0xae>
     fa3:	90                   	nop
     fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
     fa8:	56                   	push   %esi
     fa9:	53                   	push   %ebx
     faa:	68 10 27 00 00       	push   $0x2710
     faf:	6a 01                	push   $0x1
     fb1:	e8 1a 0f 00 00       	call   1ed0 <printf>
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
     fb6:	83 c4 10             	add    $0x10,%esp
     fb9:	b8 01 00 00 00       	mov    $0x1,%eax
  }
}
     fbe:	8d 65 f8             	lea    -0x8(%ebp),%esp
     fc1:	5b                   	pop    %ebx
     fc2:	5e                   	pop    %esi
     fc3:	5d                   	pop    %ebp
     fc4:	c3                   	ret    
     fc5:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
     fc8:	83 ec 08             	sub    $0x8,%esp
     fcb:	68 cc 25 00 00       	push   $0x25cc
     fd0:	6a 01                	push   $0x1
     fd2:	e8 f9 0e 00 00       	call   1ed0 <printf>
      break;
     fd7:	83 c4 10             	add    $0x10,%esp
    return 0;
     fda:	31 c0                	xor    %eax,%eax
      break;
     fdc:	eb e0                	jmp    fbe <test_copy_on_write_less_forks+0xae>
     fde:	66 90                	xchg   %ax,%ax
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
     fe0:	83 ec 08             	sub    $0x8,%esp
     fe3:	68 9c 25 00 00       	push   $0x259c
     fe8:	6a 01                	push   $0x1
     fea:	e8 e1 0e 00 00       	call   1ed0 <printf>
    return 0;
     fef:	83 c4 10             	add    $0x10,%esp
}
     ff2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
     ff5:	31 c0                	xor    %eax,%eax
}
     ff7:	5b                   	pop    %ebx
     ff8:	5e                   	pop    %esi
     ff9:	5d                   	pop    %ebp
     ffa:	c3                   	ret    
     ffb:	90                   	nop
     ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch (text[1]) {
    1000:	3c 50                	cmp    $0x50,%al
    1002:	75 3c                	jne    1040 <test_copy_on_write_less_forks+0x130>
      printf(1, FAIL_MSG "copy on write test failed --- pipe read problem\n");
    1004:	83 ec 08             	sub    $0x8,%esp
    1007:	68 50 26 00 00       	push   $0x2650
    100c:	6a 01                	push   $0x1
    100e:	e8 bd 0e 00 00       	call   1ed0 <printf>
      break;
    1013:	83 c4 10             	add    $0x10,%esp
    return 0;
    1016:	31 c0                	xor    %eax,%eax
      break;
    1018:	eb a4                	jmp    fbe <test_copy_on_write_less_forks+0xae>
    101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1020:	83 ec 08             	sub    $0x8,%esp
    1023:	68 8c 26 00 00       	push   $0x268c
    1028:	6a 01                	push   $0x1
    102a:	e8 a1 0e 00 00       	call   1ed0 <printf>
      break;
    102f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1032:	31 c0                	xor    %eax,%eax
      break;
    1034:	eb 88                	jmp    fbe <test_copy_on_write_less_forks+0xae>
    1036:	8d 76 00             	lea    0x0(%esi),%esi
    1039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    1040:	83 ec 08             	sub    $0x8,%esp
    1043:	68 d8 26 00 00       	push   $0x26d8
    1048:	6a 01                	push   $0x1
    104a:	e8 81 0e 00 00       	call   1ed0 <printf>
      break;
    104f:	83 c4 10             	add    $0x10,%esp
    return 0;
    1052:	31 c0                	xor    %eax,%eax
      break;
    1054:	e9 65 ff ff ff       	jmp    fbe <test_copy_on_write_less_forks+0xae>
    1059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001060 <test_copy_on_write_less_forks_alt>:

int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	56                   	push   %esi
    1064:	53                   	push   %ebx
  int fds[2];
  pipe(fds);
    1065:	8d 45 f0             	lea    -0x10(%ebp),%eax
int test_copy_on_write_less_forks_alt(int size, const char *describe_size, int forks, int early_term) {
    1068:	83 ec 1c             	sub    $0x1c,%esp
    106b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    106e:	8b 75 10             	mov    0x10(%ebp),%esi
  pipe(fds);
    1071:	50                   	push   %eax
    1072:	e8 eb 0c 00 00       	call   1d62 <pipe>
  test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    1077:	58                   	pop    %eax
    1078:	ff 75 14             	pushl  0x14(%ebp)
    107b:	56                   	push   %esi
    107c:	53                   	push   %ebx
    107d:	ff 75 08             	pushl  0x8(%ebp)
    1080:	ff 75 f4             	pushl  -0xc(%ebp)
    1083:	e8 58 fa ff ff       	call   ae0 <test_copy_on_write_main_child_alt>
  char text[2] = {'X', 'X'};
  read(fds[0], text, 2);
    1088:	8d 45 ee             	lea    -0x12(%ebp),%eax
    108b:	83 c4 1c             	add    $0x1c,%esp
  char text[2] = {'X', 'X'};
    108e:	ba 58 58 00 00       	mov    $0x5858,%edx
  read(fds[0], text, 2);
    1093:	6a 02                	push   $0x2
  char text[2] = {'X', 'X'};
    1095:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  read(fds[0], text, 2);
    1099:	50                   	push   %eax
    109a:	ff 75 f0             	pushl  -0x10(%ebp)
    109d:	e8 c8 0c 00 00       	call   1d6a <read>
  close(fds[0]); close(fds[1]);
    10a2:	59                   	pop    %ecx
    10a3:	ff 75 f0             	pushl  -0x10(%ebp)
    10a6:	e8 cf 0c 00 00       	call   1d7a <close>
    10ab:	58                   	pop    %eax
    10ac:	ff 75 f4             	pushl  -0xc(%ebp)
    10af:	e8 c6 0c 00 00       	call   1d7a <close>
  if (text[0] == 'X') {
    10b4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    10b8:	83 c4 10             	add    $0x10,%esp
    10bb:	3c 58                	cmp    $0x58,%al
    10bd:	0f 84 7d 00 00 00    	je     1140 <test_copy_on_write_less_forks_alt+0xe0>
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    return 0;
  } else if (text[0] == 'N') {
    10c3:	3c 4e                	cmp    $0x4e,%al
    10c5:	75 39                	jne    1100 <test_copy_on_write_less_forks_alt+0xa0>
    switch (text[1]) {
    10c7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    10cb:	3c 66                	cmp    $0x66,%al
    10cd:	0f 84 ad 00 00 00    	je     1180 <test_copy_on_write_less_forks_alt+0x120>
    10d3:	3c 70                	cmp    $0x70,%al
    10d5:	0f 84 85 00 00 00    	je     1160 <test_copy_on_write_less_forks_alt+0x100>
    10db:	3c 63                	cmp    $0x63,%al
    10dd:	74 41                	je     1120 <test_copy_on_write_less_forks_alt+0xc0>
      break;
    case 'c':
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
      break;
    default:
      printf(1, FAIL_MSG"copy on write test failed --- unknown reason\n");
    10df:	83 ec 08             	sub    $0x8,%esp
    10e2:	68 d8 26 00 00       	push   $0x26d8
    10e7:	6a 01                	push   $0x1
    10e9:	e8 e2 0d 00 00       	call   1ed0 <printf>
      break;
    10ee:	83 c4 10             	add    $0x10,%esp
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
           "fork %d children; read+write small parts in each child\n",
           describe_size, forks);
    return 1;
  }
}
    10f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    10f4:	31 c0                	xor    %eax,%eax
}
    10f6:	5b                   	pop    %ebx
    10f7:	5e                   	pop    %esi
    10f8:	5d                   	pop    %ebp
    10f9:	c3                   	ret    
    10fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, PASS_MSG "copy on write test passed --- allocate %s; "
    1100:	56                   	push   %esi
    1101:	53                   	push   %ebx
    1102:	68 10 27 00 00       	push   $0x2710
    1107:	6a 01                	push   $0x1
    1109:	e8 c2 0d 00 00       	call   1ed0 <printf>
    return 1;
    110e:	83 c4 10             	add    $0x10,%esp
}
    1111:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 1;
    1114:	b8 01 00 00 00       	mov    $0x1,%eax
}
    1119:	5b                   	pop    %ebx
    111a:	5e                   	pop    %esi
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    
    111d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1120:	83 ec 08             	sub    $0x8,%esp
    1123:	68 8c 26 00 00       	push   $0x268c
    1128:	6a 01                	push   $0x1
    112a:	e8 a1 0d 00 00       	call   1ed0 <printf>
      break;
    112f:	83 c4 10             	add    $0x10,%esp
}
    1132:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1135:	31 c0                	xor    %eax,%eax
}
    1137:	5b                   	pop    %ebx
    1138:	5e                   	pop    %esi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret    
    113b:	90                   	nop
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1140:	83 ec 08             	sub    $0x8,%esp
    1143:	68 9c 25 00 00       	push   $0x259c
    1148:	6a 01                	push   $0x1
    114a:	e8 81 0d 00 00       	call   1ed0 <printf>
    return 0;
    114f:	83 c4 10             	add    $0x10,%esp
}
    1152:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
    1155:	31 c0                	xor    %eax,%eax
}
    1157:	5b                   	pop    %ebx
    1158:	5e                   	pop    %esi
    1159:	5d                   	pop    %ebp
    115a:	c3                   	ret    
    115b:	90                   	nop
    115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1160:	83 ec 08             	sub    $0x8,%esp
    1163:	68 04 26 00 00       	push   $0x2604
    1168:	6a 01                	push   $0x1
    116a:	e8 61 0d 00 00       	call   1ed0 <printf>
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
      printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1180:	83 ec 08             	sub    $0x8,%esp
    1183:	68 cc 25 00 00       	push   $0x25cc
    1188:	6a 01                	push   $0x1
    118a:	e8 41 0d 00 00       	call   1ed0 <printf>
      break;
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

000011a0 <_test_copy_on_write>:

int _test_copy_on_write(int size,  const char *describe_size, int forks, int use_alt, int early_term, int pre_alloc, const char* describe_prealloc) {
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	83 ec 44             	sub    $0x44,%esp
  int fds[2];
  pipe(fds);
    11a6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    11a9:	50                   	push   %eax
    11aa:	e8 b3 0b 00 00       	call   1d62 <pipe>
  int pid = fork();
    11af:	e8 96 0b 00 00       	call   1d4a <fork>
  if (pid == 0) {
    11b4:	83 c4 10             	add    $0x10,%esp
    11b7:	83 f8 00             	cmp    $0x0,%eax
    11ba:	0f 84 d6 01 00 00    	je     1396 <_test_copy_on_write+0x1f6>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    } else {
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    }
    exit();
  } else if (pid > 0) {
    11c0:	7f 16                	jg     11d8 <_test_copy_on_write+0x38>
    11c2:	89 c2                	mov    %eax,%edx
      return 1;
    }
  } else if (pid == -1) {
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
  }
  return 0;
    11c4:	31 c0                	xor    %eax,%eax
  } else if (pid == -1) {
    11c6:	83 fa ff             	cmp    $0xffffffff,%edx
    11c9:	0f 84 11 01 00 00    	je     12e0 <_test_copy_on_write+0x140>
}
    11cf:	c9                   	leave  
    11d0:	c3                   	ret    
    11d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "running copy on write test: ");
    11d8:	83 ec 08             	sub    $0x8,%esp
    11db:	68 b7 22 00 00       	push   $0x22b7
    11e0:	6a 01                	push   $0x1
    11e2:	e8 e9 0c 00 00       	call   1ed0 <printf>
    if (pre_alloc > 0) {
    11e7:	8b 45 1c             	mov    0x1c(%ebp),%eax
    11ea:	83 c4 10             	add    $0x10,%esp
    11ed:	85 c0                	test   %eax,%eax
    11ef:	7e 15                	jle    1206 <_test_copy_on_write+0x66>
      printf(1, "allocate but do not use %s; ", describe_prealloc);
    11f1:	83 ec 04             	sub    $0x4,%esp
    11f4:	ff 75 20             	pushl  0x20(%ebp)
    11f7:	68 d4 22 00 00       	push   $0x22d4
    11fc:	6a 01                	push   $0x1
    11fe:	e8 cd 0c 00 00       	call   1ed0 <printf>
    1203:	83 c4 10             	add    $0x10,%esp
    printf(1, "allocate and use %s; fork %d children; read+write small parts in each child",
    1206:	ff 75 10             	pushl  0x10(%ebp)
    1209:	ff 75 0c             	pushl  0xc(%ebp)
    120c:	68 80 27 00 00       	push   $0x2780
    1211:	6a 01                	push   $0x1
    1213:	e8 b8 0c 00 00       	call   1ed0 <printf>
    if (use_alt) {
    1218:	8b 45 14             	mov    0x14(%ebp),%eax
    121b:	83 c4 10             	add    $0x10,%esp
    121e:	85 c0                	test   %eax,%eax
    1220:	0f 85 da 00 00 00    	jne    1300 <_test_copy_on_write+0x160>
    printf(1, "\n");
    1226:	83 ec 08             	sub    $0x8,%esp
    1229:	68 82 22 00 00       	push   $0x2282
    122e:	6a 01                	push   $0x1
    1230:	e8 9b 0c 00 00       	call   1ed0 <printf>
    close(fds[1]);
    1235:	5a                   	pop    %edx
    1236:	ff 75 e8             	pushl  -0x18(%ebp)
    char text[10] = {'X', 'X'};
    1239:	b8 58 58 00 00       	mov    $0x5858,%eax
    123e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1245:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    124c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    close(fds[1]);
    1250:	e8 25 0b 00 00       	call   1d7a <close>
    read(fds[0], text, 10);
    1255:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1258:	83 c4 0c             	add    $0xc,%esp
    125b:	6a 0a                	push   $0xa
    125d:	50                   	push   %eax
    125e:	ff 75 e4             	pushl  -0x1c(%ebp)
    1261:	e8 04 0b 00 00       	call   1d6a <read>
    wait();
    1266:	e8 ef 0a 00 00       	call   1d5a <wait>
    close(fds[0]);
    126b:	59                   	pop    %ecx
    126c:	ff 75 e4             	pushl  -0x1c(%ebp)
    126f:	e8 06 0b 00 00       	call   1d7a <close>
    if (text[0] == 'X') {
    1274:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1278:	83 c4 10             	add    $0x10,%esp
    127b:	3c 58                	cmp    $0x58,%al
    127d:	0f 84 9d 00 00 00    	je     1320 <_test_copy_on_write+0x180>
    } else if (text[0] == 'N') {
    1283:	3c 4e                	cmp    $0x4e,%al
    1285:	75 39                	jne    12c0 <_test_copy_on_write+0x120>
      switch (text[1]) {
    1287:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    128b:	3c 66                	cmp    $0x66,%al
    128d:	0f 84 ad 00 00 00    	je     1340 <_test_copy_on_write+0x1a0>
    1293:	3c 70                	cmp    $0x70,%al
    1295:	0f 84 e5 00 00 00    	je     1380 <_test_copy_on_write+0x1e0>
    129b:	3c 63                	cmp    $0x63,%al
    129d:	0f 84 bd 00 00 00    	je     1360 <_test_copy_on_write+0x1c0>
        printf(1, FAIL_MSG "copy on write test failed --- unknown reason\n");
    12a3:	83 ec 08             	sub    $0x8,%esp
    12a6:	68 d8 26 00 00       	push   $0x26d8
    12ab:	6a 01                	push   $0x1
    12ad:	e8 1e 0c 00 00       	call   1ed0 <printf>
        break;
    12b2:	83 c4 10             	add    $0x10,%esp
      return 0;
    12b5:	31 c0                	xor    %eax,%eax
}
    12b7:	c9                   	leave  
    12b8:	c3                   	ret    
    12b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, PASS_MSG "copy on write test passed\n");
    12c0:	83 ec 08             	sub    $0x8,%esp
    12c3:	68 fc 27 00 00       	push   $0x27fc
    12c8:	6a 01                	push   $0x1
    12ca:	e8 01 0c 00 00       	call   1ed0 <printf>
      return 1;
    12cf:	83 c4 10             	add    $0x10,%esp
    12d2:	b8 01 00 00 00       	mov    $0x1,%eax
}
    12d7:	c9                   	leave  
    12d8:	c3                   	ret    
    12d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     printf(1, FAIL_MSG "copy on write test failed --- first fork failed\n");
    12e0:	83 ec 08             	sub    $0x8,%esp
    12e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    12e6:	68 24 28 00 00       	push   $0x2824
    12eb:	6a 01                	push   $0x1
    12ed:	e8 de 0b 00 00       	call   1ed0 <printf>
    12f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    12f5:	83 c4 10             	add    $0x10,%esp
}
    12f8:	c9                   	leave  
    12f9:	c3                   	ret    
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, " [and try to keep children running in parallel]");
    1300:	83 ec 08             	sub    $0x8,%esp
    1303:	68 cc 27 00 00       	push   $0x27cc
    1308:	6a 01                	push   $0x1
    130a:	e8 c1 0b 00 00       	call   1ed0 <printf>
    130f:	83 c4 10             	add    $0x10,%esp
    1312:	e9 0f ff ff ff       	jmp    1226 <_test_copy_on_write+0x86>
    1317:	89 f6                	mov    %esi,%esi
    1319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, FAIL_MSG "copy on write test failed --- crash?\n");
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	68 9c 25 00 00       	push   $0x259c
    1328:	6a 01                	push   $0x1
    132a:	e8 a1 0b 00 00       	call   1ed0 <printf>
      return 0;
    132f:	83 c4 10             	add    $0x10,%esp
    1332:	31 c0                	xor    %eax,%eax
}
    1334:	c9                   	leave  
    1335:	c3                   	ret    
    1336:	8d 76 00             	lea    0x0(%esi),%esi
    1339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- fork failed\n");
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	68 cc 25 00 00       	push   $0x25cc
    1348:	6a 01                	push   $0x1
    134a:	e8 81 0b 00 00       	call   1ed0 <printf>
        break;
    134f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1352:	31 c0                	xor    %eax,%eax
}
    1354:	c9                   	leave  
    1355:	c3                   	ret    
    1356:	8d 76 00             	lea    0x0(%esi),%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in child\n");
    1360:	83 ec 08             	sub    $0x8,%esp
    1363:	68 8c 26 00 00       	push   $0x268c
    1368:	6a 01                	push   $0x1
    136a:	e8 61 0b 00 00       	call   1ed0 <printf>
        break;
    136f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1372:	31 c0                	xor    %eax,%eax
}
    1374:	c9                   	leave  
    1375:	c3                   	ret    
    1376:	8d 76 00             	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        printf(1, FAIL_MSG "copy on write test failed --- wrong value for memory in parent\n");
    1380:	83 ec 08             	sub    $0x8,%esp
    1383:	68 04 26 00 00       	push   $0x2604
    1388:	6a 01                	push   $0x1
    138a:	e8 41 0b 00 00       	call   1ed0 <printf>
        break;
    138f:	83 c4 10             	add    $0x10,%esp
      return 0;
    1392:	31 c0                	xor    %eax,%eax
}
    1394:	c9                   	leave  
    1395:	c3                   	ret    
    if (pre_alloc > 0) {
    1396:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
    139a:	7e 0e                	jle    13aa <_test_copy_on_write+0x20a>
      sbrk(pre_alloc);
    139c:	83 ec 0c             	sub    $0xc,%esp
    139f:	ff 75 1c             	pushl  0x1c(%ebp)
    13a2:	e8 33 0a 00 00       	call   1dda <sbrk>
    13a7:	83 c4 10             	add    $0x10,%esp
    if (use_alt) {
    13aa:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    13b1:	74 1d                	je     13d0 <_test_copy_on_write+0x230>
      test_copy_on_write_main_child_alt(fds[1], size, describe_size, forks, early_term);
    13b3:	83 ec 0c             	sub    $0xc,%esp
    13b6:	ff 75 18             	pushl  0x18(%ebp)
    13b9:	ff 75 10             	pushl  0x10(%ebp)
    13bc:	ff 75 0c             	pushl  0xc(%ebp)
    13bf:	ff 75 08             	pushl  0x8(%ebp)
    13c2:	50                   	push   %eax
    13c3:	e8 18 f7 ff ff       	call   ae0 <test_copy_on_write_main_child_alt>
    13c8:	83 c4 20             	add    $0x20,%esp
    exit();
    13cb:	e8 82 09 00 00       	call   1d52 <exit>
      test_copy_on_write_main_child(fds[1], size, describe_size, forks);
    13d0:	ff 75 10             	pushl  0x10(%ebp)
    13d3:	ff 75 0c             	pushl  0xc(%ebp)
    13d6:	ff 75 08             	pushl  0x8(%ebp)
    13d9:	50                   	push   %eax
    13da:	e8 41 f4 ff ff       	call   820 <test_copy_on_write_main_child>
    13df:	83 c4 10             	add    $0x10,%esp
    13e2:	eb e7                	jmp    13cb <_test_copy_on_write+0x22b>
    13e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000013f0 <test_copy_on_write>:

int test_copy_on_write(int size, const char *describe_size, int forks) {
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, 0, "");
    13f6:	68 83 22 00 00       	push   $0x2283
    13fb:	6a 00                	push   $0x0
    13fd:	6a 00                	push   $0x0
    13ff:	6a 00                	push   $0x0
    1401:	ff 75 10             	pushl  0x10(%ebp)
    1404:	ff 75 0c             	pushl  0xc(%ebp)
    1407:	ff 75 08             	pushl  0x8(%ebp)
    140a:	e8 91 fd ff ff       	call   11a0 <_test_copy_on_write>
}
    140f:	c9                   	leave  
    1410:	c3                   	ret    
    1411:	eb 0d                	jmp    1420 <test_copy_on_write_alloc_unused>
    1413:	90                   	nop
    1414:	90                   	nop
    1415:	90                   	nop
    1416:	90                   	nop
    1417:	90                   	nop
    1418:	90                   	nop
    1419:	90                   	nop
    141a:	90                   	nop
    141b:	90                   	nop
    141c:	90                   	nop
    141d:	90                   	nop
    141e:	90                   	nop
    141f:	90                   	nop

00001420 <test_copy_on_write_alloc_unused>:

int test_copy_on_write_alloc_unused(int unused_size, const char *describe_unused_size, int size, const char *describe_size, int forks) {
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 0, 0, unused_size, describe_unused_size);
    1426:	ff 75 0c             	pushl  0xc(%ebp)
    1429:	ff 75 08             	pushl  0x8(%ebp)
    142c:	6a 00                	push   $0x0
    142e:	6a 00                	push   $0x0
    1430:	ff 75 18             	pushl  0x18(%ebp)
    1433:	ff 75 14             	pushl  0x14(%ebp)
    1436:	ff 75 10             	pushl  0x10(%ebp)
    1439:	e8 62 fd ff ff       	call   11a0 <_test_copy_on_write>
}
    143e:	c9                   	leave  
    143f:	c3                   	ret    

00001440 <test_copy_on_write_alt>:

int test_copy_on_write_alt(int size, const char *describe_size, int forks) {
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	83 ec 0c             	sub    $0xc,%esp
  return _test_copy_on_write(size, describe_size, forks, 1, 0, 0, "");
    1446:	68 83 22 00 00       	push   $0x2283
    144b:	6a 00                	push   $0x0
    144d:	6a 00                	push   $0x0
    144f:	6a 01                	push   $0x1
    1451:	ff 75 10             	pushl  0x10(%ebp)
    1454:	ff 75 0c             	pushl  0xc(%ebp)
    1457:	ff 75 08             	pushl  0x8(%ebp)
    145a:	e8 41 fd ff ff       	call   11a0 <_test_copy_on_write>
}
    145f:	c9                   	leave  
    1460:	c3                   	ret    
    1461:	eb 0d                	jmp    1470 <test_read_into_alloc_no_fork>
    1463:	90                   	nop
    1464:	90                   	nop
    1465:	90                   	nop
    1466:	90                   	nop
    1467:	90                   	nop
    1468:	90                   	nop
    1469:	90                   	nop
    146a:	90                   	nop
    146b:	90                   	nop
    146c:	90                   	nop
    146d:	90                   	nop
    146e:	90                   	nop
    146f:	90                   	nop

00001470 <test_read_into_alloc_no_fork>:

int test_read_into_alloc_no_fork(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	57                   	push   %edi
    1474:	56                   	push   %esi
    1475:	53                   	push   %ebx
    1476:	83 ec 28             	sub    $0x28,%esp
    1479:	8b 5d 10             	mov    0x10(%ebp),%ebx
    printf(1, "testing read(), writing %d bytes to a location %s into a %s allocation\n",
    147c:	ff 75 14             	pushl  0x14(%ebp)
    147f:	ff 75 18             	pushl  0x18(%ebp)
    1482:	53                   	push   %ebx
    1483:	68 60 28 00 00       	push   $0x2860
    1488:	6a 01                	push   $0x1
    148a:	e8 41 0a 00 00       	call   1ed0 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    148f:	83 c4 18             	add    $0x18,%esp
    1492:	68 01 02 00 00       	push   $0x201
    1497:	68 ff 22 00 00       	push   $0x22ff
    149c:	e8 f1 08 00 00       	call   1d92 <open>
    14a1:	83 c4 10             	add    $0x10,%esp
    14a4:	89 c6                	mov    %eax,%esi
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    14a6:	31 c0                	xor    %eax,%eax
    14a8:	90                   	nop
    14a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    14b0:	c6 80 20 32 00 00 58 	movb   $0x58,0x3220(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    14b7:	83 c0 01             	add    $0x1,%eax
    14ba:	3d 80 00 00 00       	cmp    $0x80,%eax
    14bf:	75 ef                	jne    14b0 <test_read_into_alloc_no_fork+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    14c1:	85 db                	test   %ebx,%ebx
    14c3:	0f 8e 8d 01 00 00    	jle    1656 <test_read_into_alloc_no_fork+0x1e6>
    14c9:	31 ff                	xor    %edi,%edi
    14cb:	90                   	nop
    14cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        write(fd, buffer, sizeof buffer);
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	83 ef 80             	sub    $0xffffff80,%edi
    14d6:	68 80 00 00 00       	push   $0x80
    14db:	68 20 32 00 00       	push   $0x3220
    14e0:	56                   	push   %esi
    14e1:	e8 8c 08 00 00       	call   1d72 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    14e6:	83 c4 10             	add    $0x10,%esp
    14e9:	39 fb                	cmp    %edi,%ebx
    14eb:	7f e3                	jg     14d0 <test_read_into_alloc_no_fork+0x60>
    }
    close(fd);
    14ed:	83 ec 0c             	sub    $0xc,%esp
    14f0:	56                   	push   %esi
    14f1:	e8 84 08 00 00       	call   1d7a <close>
    fd = open("tempfile", O_RDONLY);
    14f6:	58                   	pop    %eax
    14f7:	5a                   	pop    %edx
    14f8:	6a 00                	push   $0x0
    14fa:	68 ff 22 00 00       	push   $0x22ff
    14ff:	e8 8e 08 00 00       	call   1d92 <open>
    if (fd == -1) {
    1504:	83 c4 10             	add    $0x10,%esp
    1507:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    150a:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    150c:	0f 84 0a 01 00 00    	je     161c <test_read_into_alloc_no_fork+0x1ac>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    1512:	83 ec 0c             	sub    $0xc,%esp
    1515:	6a 00                	push   $0x0
    1517:	e8 be 08 00 00       	call   1dda <sbrk>
    sbrk(size);
    151c:	59                   	pop    %ecx
    151d:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    1520:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1522:	e8 b3 08 00 00       	call   1dda <sbrk>
    char *loc = heap + offset;
    1527:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    152a:	83 c4 0c             	add    $0xc,%esp
    152d:	53                   	push   %ebx
    char *loc = heap + offset;
    152e:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1530:	51                   	push   %ecx
    1531:	56                   	push   %esi
    1532:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1535:	e8 30 08 00 00       	call   1d6a <read>
    int failed_value = 0;
    failed_value = loc[-1] != '\0';
    153a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    int count = read(fd, loc, read_count);
    153d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    1540:	31 d2                	xor    %edx,%edx
    1542:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < read_count; ++i) {
        if (loc[i] != 'X') {
            failed_value = 1;
    1545:	bf 01 00 00 00       	mov    $0x1,%edi
    failed_value = loc[-1] != '\0';
    154a:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    154e:	0f 95 c2             	setne  %dl
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1551:	31 c0                	xor    %eax,%eax
    1553:	90                   	nop
    1554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            failed_value = 1;
    1558:	80 3c 01 58          	cmpb   $0x58,(%ecx,%eax,1)
    155c:	0f 45 d7             	cmovne %edi,%edx
    for (int i = 0; i < read_count; ++i) {
    155f:	83 c0 01             	add    $0x1,%eax
    1562:	39 c3                	cmp    %eax,%ebx
    1564:	7f f2                	jg     1558 <test_read_into_alloc_no_fork+0xe8>
    1566:	8b 7d 08             	mov    0x8(%ebp),%edi
    1569:	89 55 e0             	mov    %edx,-0x20(%ebp)
    156c:	f7 df                	neg    %edi
        }
    }
    if (loc[read_count] != '\0') {
    156e:	80 3c 19 00          	cmpb   $0x0,(%ecx,%ebx,1)
    1572:	75 4b                	jne    15bf <test_read_into_alloc_no_fork+0x14f>
        failed_value = 1;
    }
    close(fd);
    1574:	83 ec 0c             	sub    $0xc,%esp
    1577:	56                   	push   %esi
    1578:	e8 fd 07 00 00       	call   1d7a <close>
    unlink("tempfile");
    157d:	c7 04 24 ff 22 00 00 	movl   $0x22ff,(%esp)
    1584:	e8 19 08 00 00       	call   1da2 <unlink>
    sbrk(-size);
    1589:	89 3c 24             	mov    %edi,(%esp)
    158c:	e8 49 08 00 00       	call   1dda <sbrk>
    if (count != read_count) {
    1591:	83 c4 10             	add    $0x10,%esp
    1594:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    1597:	8b 55 e0             	mov    -0x20(%ebp),%edx
    159a:	75 64                	jne    1600 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong return value from read()\n");
        return 0;
    } else if (failed_value) {
    159c:	85 d2                	test   %edx,%edx
    159e:	75 44                	jne    15e4 <test_read_into_alloc_no_fork+0x174>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
        return 0;
    } else {
        printf(1, PASS_MSG "\n");
    15a0:	83 ec 08             	sub    $0x8,%esp
    15a3:	68 78 22 00 00       	push   $0x2278
    15a8:	6a 01                	push   $0x1
    15aa:	e8 21 09 00 00       	call   1ed0 <printf>
        return 1;
    15af:	83 c4 10             	add    $0x10,%esp
    }
}
    15b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 1;
    15b5:	b8 01 00 00 00       	mov    $0x1,%eax
}
    15ba:	5b                   	pop    %ebx
    15bb:	5e                   	pop    %esi
    15bc:	5f                   	pop    %edi
    15bd:	5d                   	pop    %ebp
    15be:	c3                   	ret    
    close(fd);
    15bf:	83 ec 0c             	sub    $0xc,%esp
    15c2:	56                   	push   %esi
    15c3:	e8 b2 07 00 00       	call   1d7a <close>
    unlink("tempfile");
    15c8:	c7 04 24 ff 22 00 00 	movl   $0x22ff,(%esp)
    15cf:	e8 ce 07 00 00       	call   1da2 <unlink>
    sbrk(-size);
    15d4:	89 3c 24             	mov    %edi,(%esp)
    15d7:	e8 fe 07 00 00       	call   1dda <sbrk>
    if (count != read_count) {
    15dc:	83 c4 10             	add    $0x10,%esp
    15df:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    15e2:	75 1c                	jne    1600 <test_read_into_alloc_no_fork+0x190>
        printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    15e4:	83 ec 08             	sub    $0x8,%esp
    15e7:	68 d4 28 00 00       	push   $0x28d4
    15ec:	6a 01                	push   $0x1
    15ee:	e8 dd 08 00 00       	call   1ed0 <printf>
        return 0;
    15f3:	83 c4 10             	add    $0x10,%esp
}
    15f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    15f9:	31 c0                	xor    %eax,%eax
}
    15fb:	5b                   	pop    %ebx
    15fc:	5e                   	pop    %esi
    15fd:	5f                   	pop    %edi
    15fe:	5d                   	pop    %ebp
    15ff:	c3                   	ret    
        printf(1, FAIL_MSG "wrong return value from read()\n");
    1600:	83 ec 08             	sub    $0x8,%esp
    1603:	68 a8 28 00 00       	push   $0x28a8
    1608:	6a 01                	push   $0x1
    160a:	e8 c1 08 00 00       	call   1ed0 <printf>
        return 0;
    160f:	83 c4 10             	add    $0x10,%esp
}
    1612:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1615:	31 c0                	xor    %eax,%eax
}
    1617:	5b                   	pop    %ebx
    1618:	5e                   	pop    %esi
    1619:	5f                   	pop    %edi
    161a:	5d                   	pop    %ebp
    161b:	c3                   	ret    
        printf(2, "error opening tempfile");
    161c:	83 ec 08             	sub    $0x8,%esp
    161f:	68 f1 22 00 00       	push   $0x22f1
    1624:	6a 02                	push   $0x2
    1626:	e8 a5 08 00 00       	call   1ed0 <printf>
    char *heap = sbrk(0);
    162b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1632:	e8 a3 07 00 00       	call   1dda <sbrk>
    sbrk(size);
    1637:	59                   	pop    %ecx
    1638:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    163b:	89 c7                	mov    %eax,%edi
    sbrk(size);
    163d:	e8 98 07 00 00       	call   1dda <sbrk>
    char *loc = heap + offset;
    1642:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    1645:	83 c4 0c             	add    $0xc,%esp
    1648:	53                   	push   %ebx
    char *loc = heap + offset;
    1649:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    164b:	51                   	push   %ecx
    164c:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    164f:	6a ff                	push   $0xffffffff
    1651:	e9 df fe ff ff       	jmp    1535 <test_read_into_alloc_no_fork+0xc5>
    close(fd);
    1656:	83 ec 0c             	sub    $0xc,%esp
    1659:	56                   	push   %esi
    165a:	e8 1b 07 00 00       	call   1d7a <close>
    fd = open("tempfile", O_RDONLY);
    165f:	5e                   	pop    %esi
    1660:	5f                   	pop    %edi
    1661:	6a 00                	push   $0x0
    1663:	68 ff 22 00 00       	push   $0x22ff
    1668:	e8 25 07 00 00       	call   1d92 <open>
    if (fd == -1) {
    166d:	83 c4 10             	add    $0x10,%esp
    1670:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    1673:	89 c6                	mov    %eax,%esi
    if (fd == -1) {
    1675:	74 3f                	je     16b6 <test_read_into_alloc_no_fork+0x246>
    char *heap = sbrk(0);
    1677:	83 ec 0c             	sub    $0xc,%esp
    167a:	6a 00                	push   $0x0
    167c:	e8 59 07 00 00       	call   1dda <sbrk>
    1681:	89 c7                	mov    %eax,%edi
    sbrk(size);
    1683:	58                   	pop    %eax
    1684:	ff 75 08             	pushl  0x8(%ebp)
    1687:	e8 4e 07 00 00       	call   1dda <sbrk>
    char *loc = heap + offset;
    168c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    168f:	83 c4 0c             	add    $0xc,%esp
    1692:	53                   	push   %ebx
    char *loc = heap + offset;
    1693:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    1695:	51                   	push   %ecx
    1696:	56                   	push   %esi
    1697:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    169a:	e8 cb 06 00 00       	call   1d6a <read>
    failed_value = loc[-1] != '\0';
    169f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    16a2:	31 d2                	xor    %edx,%edx
    int count = read(fd, loc, read_count);
    16a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    failed_value = loc[-1] != '\0';
    16a7:	83 c4 10             	add    $0x10,%esp
    16aa:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
    16ae:	0f 95 c2             	setne  %dl
    16b1:	e9 b0 fe ff ff       	jmp    1566 <test_read_into_alloc_no_fork+0xf6>
        printf(2, "error opening tempfile");
    16b6:	50                   	push   %eax
    16b7:	50                   	push   %eax
    16b8:	68 f1 22 00 00       	push   $0x22f1
    16bd:	6a 02                	push   $0x2
    16bf:	e8 0c 08 00 00       	call   1ed0 <printf>
    char *heap = sbrk(0);
    16c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16cb:	e8 0a 07 00 00       	call   1dda <sbrk>
    sbrk(size);
    16d0:	5a                   	pop    %edx
    16d1:	ff 75 08             	pushl  0x8(%ebp)
    char *heap = sbrk(0);
    16d4:	89 c7                	mov    %eax,%edi
    sbrk(size);
    16d6:	e8 ff 06 00 00       	call   1dda <sbrk>
    char *loc = heap + offset;
    16db:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    int count = read(fd, loc, read_count);
    16de:	83 c4 0c             	add    $0xc,%esp
    16e1:	53                   	push   %ebx
    char *loc = heap + offset;
    16e2:	01 f9                	add    %edi,%ecx
    int count = read(fd, loc, read_count);
    16e4:	51                   	push   %ecx
    16e5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    16e8:	6a ff                	push   $0xffffffff
    16ea:	eb ae                	jmp    169a <test_read_into_alloc_no_fork+0x22a>
    16ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016f0 <test_read_into_alloc>:

int test_read_into_alloc(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    16f6:	8d 45 f0             	lea    -0x10(%ebp),%eax
    16f9:	50                   	push   %eax
    16fa:	e8 63 06 00 00       	call   1d62 <pipe>
    int pid = fork();
    16ff:	e8 46 06 00 00       	call   1d4a <fork>
    if (pid == 0) {
    1704:	83 c4 10             	add    $0x10,%esp
    1707:	85 c0                	test   %eax,%eax
    1709:	74 33                	je     173e <test_read_into_alloc+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    170b:	83 ec 0c             	sub    $0xc,%esp
    170e:	ff 75 f4             	pushl  -0xc(%ebp)
    1711:	e8 64 06 00 00       	call   1d7a <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    1716:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1719:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    171c:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1720:	6a 01                	push   $0x1
    1722:	50                   	push   %eax
    1723:	ff 75 f0             	pushl  -0x10(%ebp)
    1726:	e8 3f 06 00 00       	call   1d6a <read>
        wait();
    172b:	e8 2a 06 00 00       	call   1d5a <wait>
        return result_str[0] == 'Y';
    1730:	83 c4 10             	add    $0x10,%esp
    1733:	31 c0                	xor    %eax,%eax
    1735:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1739:	c9                   	leave  
        return result_str[0] == 'Y';
    173a:	0f 94 c0             	sete   %al
}
    173d:	c3                   	ret    
        close(pipe_fds[0]);
    173e:	83 ec 0c             	sub    $0xc,%esp
    1741:	ff 75 f0             	pushl  -0x10(%ebp)
    1744:	e8 31 06 00 00       	call   1d7a <close>
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    1749:	5a                   	pop    %edx
    174a:	ff 75 18             	pushl  0x18(%ebp)
    174d:	ff 75 14             	pushl  0x14(%ebp)
    1750:	ff 75 10             	pushl  0x10(%ebp)
    1753:	ff 75 0c             	pushl  0xc(%ebp)
    1756:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1759:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_alloc_no_fork(size, offset, read_count, describe_size, describe_offset)) {
    175d:	e8 0e fd ff ff       	call   1470 <test_read_into_alloc_no_fork>
    1762:	83 c4 20             	add    $0x20,%esp
    1765:	85 c0                	test   %eax,%eax
    1767:	74 04                	je     176d <test_read_into_alloc+0x7d>
            result_str[0] = 'Y';
    1769:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    176d:	50                   	push   %eax
    176e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1771:	6a 01                	push   $0x1
    1773:	50                   	push   %eax
    1774:	ff 75 f4             	pushl  -0xc(%ebp)
    1777:	e8 f6 05 00 00       	call   1d72 <write>
        exit();
    177c:	e8 d1 05 00 00       	call   1d52 <exit>
    1781:	eb 0d                	jmp    1790 <test_read_into_cow_less_forks>
    1783:	90                   	nop
    1784:	90                   	nop
    1785:	90                   	nop
    1786:	90                   	nop
    1787:	90                   	nop
    1788:	90                   	nop
    1789:	90                   	nop
    178a:	90                   	nop
    178b:	90                   	nop
    178c:	90                   	nop
    178d:	90                   	nop
    178e:	90                   	nop
    178f:	90                   	nop

00001790 <test_read_into_cow_less_forks>:

int test_read_into_cow_less_forks(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1790:	55                   	push   %ebp
    1791:	89 e5                	mov    %esp,%ebp
    1793:	57                   	push   %edi
    1794:	56                   	push   %esi
    1795:	53                   	push   %ebx
    1796:	83 ec 38             	sub    $0x38,%esp
    1799:	8b 7d 10             	mov    0x10(%ebp),%edi
    printf(1, "testing read(), writing %d bytes to a location %s into a %s copy-on-write allocation\n",
    179c:	ff 75 14             	pushl  0x14(%ebp)
    179f:	ff 75 18             	pushl  0x18(%ebp)
    17a2:	57                   	push   %edi
    17a3:	68 08 29 00 00       	push   $0x2908
    17a8:	6a 01                	push   $0x1
    17aa:	e8 21 07 00 00       	call   1ed0 <printf>
        read_count, describe_offset, describe_size);
    int fd = open("tempfile", O_WRONLY | O_CREATE);
    17af:	83 c4 18             	add    $0x18,%esp
    17b2:	68 01 02 00 00       	push   $0x201
    17b7:	68 ff 22 00 00       	push   $0x22ff
    17bc:	e8 d1 05 00 00       	call   1d92 <open>
    17c1:	83 c4 10             	add    $0x10,%esp
    17c4:	89 c3                	mov    %eax,%ebx
    static char buffer[128]; // static to avoid running out of stack space
    for (int i = 0 ; i < sizeof buffer; ++i) {
    17c6:	31 c0                	xor    %eax,%eax
    17c8:	90                   	nop
    17c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buffer[i] = 'X';
    17d0:	c6 80 a0 31 00 00 58 	movb   $0x58,0x31a0(%eax)
    for (int i = 0 ; i < sizeof buffer; ++i) {
    17d7:	83 c0 01             	add    $0x1,%eax
    17da:	3d 80 00 00 00       	cmp    $0x80,%eax
    17df:	75 ef                	jne    17d0 <test_read_into_cow_less_forks+0x40>
    }
    for (int i = 0; i < read_count; i += sizeof buffer) {
    17e1:	85 ff                	test   %edi,%edi
    17e3:	7e 28                	jle    180d <test_read_into_cow_less_forks+0x7d>
    17e5:	31 f6                	xor    %esi,%esi
    17e7:	89 f6                	mov    %esi,%esi
    17e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        write(fd, buffer, sizeof buffer);
    17f0:	83 ec 04             	sub    $0x4,%esp
    17f3:	83 ee 80             	sub    $0xffffff80,%esi
    17f6:	68 80 00 00 00       	push   $0x80
    17fb:	68 a0 31 00 00       	push   $0x31a0
    1800:	53                   	push   %ebx
    1801:	e8 6c 05 00 00       	call   1d72 <write>
    for (int i = 0; i < read_count; i += sizeof buffer) {
    1806:	83 c4 10             	add    $0x10,%esp
    1809:	39 f7                	cmp    %esi,%edi
    180b:	7f e3                	jg     17f0 <test_read_into_cow_less_forks+0x60>
    }
    close(fd);
    180d:	83 ec 0c             	sub    $0xc,%esp
    1810:	53                   	push   %ebx
    1811:	e8 64 05 00 00       	call   1d7a <close>
    fd = open("tempfile", O_RDONLY);
    1816:	58                   	pop    %eax
    1817:	5a                   	pop    %edx
    1818:	6a 00                	push   $0x0
    181a:	68 ff 22 00 00       	push   $0x22ff
    181f:	e8 6e 05 00 00       	call   1d92 <open>
    if (fd == -1) {
    1824:	83 c4 10             	add    $0x10,%esp
    1827:	83 f8 ff             	cmp    $0xffffffff,%eax
    fd = open("tempfile", O_RDONLY);
    182a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    if (fd == -1) {
    182d:	0f 84 03 01 00 00    	je     1936 <test_read_into_cow_less_forks+0x1a6>
        printf(2, "error opening tempfile");
    }
    char *heap = sbrk(0);
    1833:	83 ec 0c             	sub    $0xc,%esp
    1836:	6a 00                	push   $0x0
    1838:	e8 9d 05 00 00       	call   1dda <sbrk>
    183d:	89 c3                	mov    %eax,%ebx
    sbrk(size);
    183f:	58                   	pop    %eax
    1840:	ff 75 08             	pushl  0x8(%ebp)
    1843:	e8 92 05 00 00       	call   1dda <sbrk>
    for (int i = 0; i < size; ++i) {
    1848:	8b 45 08             	mov    0x8(%ebp),%eax
    184b:	83 c4 10             	add    $0x10,%esp
    184e:	85 c0                	test   %eax,%eax
    1850:	7e 18                	jle    186a <test_read_into_cow_less_forks+0xda>
    1852:	8b 55 08             	mov    0x8(%ebp),%edx
    1855:	89 d8                	mov    %ebx,%eax
    1857:	01 da                	add    %ebx,%edx
    1859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        heap[i] = 'Y';
    1860:	c6 00 59             	movb   $0x59,(%eax)
    1863:	83 c0 01             	add    $0x1,%eax
    for (int i = 0; i < size; ++i) {
    1866:	39 c2                	cmp    %eax,%edx
    1868:	75 f6                	jne    1860 <test_read_into_cow_less_forks+0xd0>
    }
    char *loc = heap + offset;
    int pipe_fds[2];
    pipe(pipe_fds);
    186a:	8d 45 e0             	lea    -0x20(%ebp),%eax
    186d:	83 ec 0c             	sub    $0xc,%esp
    1870:	50                   	push   %eax
    1871:	e8 ec 04 00 00       	call   1d62 <pipe>
    int pid = fork();
    1876:	e8 cf 04 00 00       	call   1d4a <fork>
    if (pid == 0) {
    187b:	83 c4 10             	add    $0x10,%esp
    187e:	85 c0                	test   %eax,%eax
    1880:	0f 84 c7 00 00 00    	je     194d <test_read_into_cow_less_forks+0x1bd>
            write(pipe_fds[1], "Y", 1);
        }
        close(pipe_fds[1]);
        exit();
    } else {
        close(pipe_fds[1]);
    1886:	83 ec 0c             	sub    $0xc,%esp
    1889:	ff 75 e4             	pushl  -0x1c(%ebp)
    188c:	e8 e9 04 00 00       	call   1d7a <close>
        char result_buf[1] = {'N'};
        read(pipe_fds[0], result_buf, 1);
    1891:	8d 45 df             	lea    -0x21(%ebp),%eax
    1894:	83 c4 0c             	add    $0xc,%esp
        char result_buf[1] = {'N'};
    1897:	c6 45 df 4e          	movb   $0x4e,-0x21(%ebp)
        read(pipe_fds[0], result_buf, 1);
    189b:	6a 01                	push   $0x1
    189d:	50                   	push   %eax
    189e:	ff 75 e0             	pushl  -0x20(%ebp)
    18a1:	e8 c4 04 00 00       	call   1d6a <read>
        close(pipe_fds[0]);
    18a6:	58                   	pop    %eax
    18a7:	ff 75 e0             	pushl  -0x20(%ebp)
    18aa:	e8 cb 04 00 00       	call   1d7a <close>
        wait();
    18af:	e8 a6 04 00 00       	call   1d5a <wait>
        printf(1, "testing correct value for heap in parent after read() in child\n");
    18b4:	5a                   	pop    %edx
    18b5:	59                   	pop    %ecx
    18b6:	68 9c 29 00 00       	push   $0x299c
    18bb:	6a 01                	push   $0x1
    18bd:	e8 0e 06 00 00       	call   1ed0 <printf>
        int found_wrong = 0;
        for (int i = 0; i < size; ++i) {
    18c2:	8b 75 08             	mov    0x8(%ebp),%esi
    18c5:	83 c4 10             	add    $0x10,%esp
    18c8:	85 f6                	test   %esi,%esi
    18ca:	7e 40                	jle    190c <test_read_into_cow_less_forks+0x17c>
    18cc:	8b 75 08             	mov    0x8(%ebp),%esi
        int found_wrong = 0;
    18cf:	31 c0                	xor    %eax,%eax
            if (heap[i] != 'Y') {
                found_wrong = 1;
    18d1:	ba 01 00 00 00       	mov    $0x1,%edx
    18d6:	01 de                	add    %ebx,%esi
    18d8:	90                   	nop
    18d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18e0:	80 3b 59             	cmpb   $0x59,(%ebx)
    18e3:	0f 45 c2             	cmovne %edx,%eax
    18e6:	83 c3 01             	add    $0x1,%ebx
        for (int i = 0; i < size; ++i) {
    18e9:	39 de                	cmp    %ebx,%esi
    18eb:	75 f3                	jne    18e0 <test_read_into_cow_less_forks+0x150>
    18ed:	89 c3                	mov    %eax,%ebx
    18ef:	83 f3 01             	xor    $0x1,%ebx
            }
        }
        if (found_wrong) { 
    18f2:	85 c0                	test   %eax,%eax
    18f4:	74 1b                	je     1911 <test_read_into_cow_less_forks+0x181>
            printf(1, FAIL_MSG "wrong value in parent after read() in child\n");
    18f6:	83 ec 08             	sub    $0x8,%esp
    18f9:	31 db                	xor    %ebx,%ebx
    18fb:	68 dc 29 00 00       	push   $0x29dc
    1900:	6a 01                	push   $0x1
    1902:	e8 c9 05 00 00       	call   1ed0 <printf>
    1907:	83 c4 10             	add    $0x10,%esp
    190a:	eb 17                	jmp    1923 <test_read_into_cow_less_forks+0x193>
        for (int i = 0; i < size; ++i) {
    190c:	bb 01 00 00 00       	mov    $0x1,%ebx
        } else {
            printf(1, PASS_MSG "correct value in parent after read into copy-on-write allocation\n");
    1911:	83 ec 08             	sub    $0x8,%esp
    1914:	68 14 2a 00 00       	push   $0x2a14
    1919:	6a 01                	push   $0x1
    191b:	e8 b0 05 00 00       	call   1ed0 <printf>
    1920:	83 c4 10             	add    $0x10,%esp
        }
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    1923:	31 c0                	xor    %eax,%eax
    1925:	80 7d df 59          	cmpb   $0x59,-0x21(%ebp)
    1929:	0f 94 c0             	sete   %al
    }
}
    192c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return (found_wrong == 0) + (result_buf[0] == 'Y');
    192f:	01 d8                	add    %ebx,%eax
}
    1931:	5b                   	pop    %ebx
    1932:	5e                   	pop    %esi
    1933:	5f                   	pop    %edi
    1934:	5d                   	pop    %ebp
    1935:	c3                   	ret    
        printf(2, "error opening tempfile");
    1936:	83 ec 08             	sub    $0x8,%esp
    1939:	68 f1 22 00 00       	push   $0x22f1
    193e:	6a 02                	push   $0x2
    1940:	e8 8b 05 00 00       	call   1ed0 <printf>
    1945:	83 c4 10             	add    $0x10,%esp
    1948:	e9 e6 fe ff ff       	jmp    1833 <test_read_into_cow_less_forks+0xa3>
    char *loc = heap + offset;
    194d:	03 5d 0c             	add    0xc(%ebp),%ebx
        close(pipe_fds[0]);
    1950:	83 ec 0c             	sub    $0xc,%esp
    1953:	ff 75 e0             	pushl  -0x20(%ebp)
    1956:	89 45 cc             	mov    %eax,-0x34(%ebp)
    1959:	e8 1c 04 00 00       	call   1d7a <close>
        int count = read(fd, loc, read_count);
    195e:	83 c4 0c             	add    $0xc,%esp
    1961:	57                   	push   %edi
    1962:	53                   	push   %ebx
    1963:	ff 75 d4             	pushl  -0x2c(%ebp)
    1966:	e8 ff 03 00 00       	call   1d6a <read>
        failed_value = loc[-1] != 'Y';
    196b:	31 c9                	xor    %ecx,%ecx
    196d:	83 c4 10             	add    $0x10,%esp
    1970:	80 7b ff 59          	cmpb   $0x59,-0x1(%ebx)
    1974:	8b 55 cc             	mov    -0x34(%ebp),%edx
        int count = read(fd, loc, read_count);
    1977:	89 45 d0             	mov    %eax,-0x30(%ebp)
                failed_value = 1;
    197a:	b8 01 00 00 00       	mov    $0x1,%eax
        failed_value = loc[-1] != 'Y';
    197f:	0f 95 c1             	setne  %cl
        for (int i = 0; i < read_count; ++i) {
    1982:	39 fa                	cmp    %edi,%edx
    1984:	7d 0c                	jge    1992 <test_read_into_cow_less_forks+0x202>
                failed_value = 1;
    1986:	80 3c 13 58          	cmpb   $0x58,(%ebx,%edx,1)
    198a:	0f 45 c8             	cmovne %eax,%ecx
        for (int i = 0; i < read_count; ++i) {
    198d:	83 c2 01             	add    $0x1,%edx
    1990:	eb f0                	jmp    1982 <test_read_into_cow_less_forks+0x1f2>
    1992:	8b 75 08             	mov    0x8(%ebp),%esi
    1995:	f7 de                	neg    %esi
        if (loc[read_count] != 'Y') {
    1997:	80 3c 3b 59          	cmpb   $0x59,(%ebx,%edi,1)
    199b:	74 5a                	je     19f7 <test_read_into_cow_less_forks+0x267>
        close(fd);
    199d:	83 ec 0c             	sub    $0xc,%esp
    19a0:	ff 75 d4             	pushl  -0x2c(%ebp)
    19a3:	e8 d2 03 00 00       	call   1d7a <close>
        unlink("tempfile");
    19a8:	c7 04 24 ff 22 00 00 	movl   $0x22ff,(%esp)
    19af:	e8 ee 03 00 00       	call   1da2 <unlink>
        sbrk(-size);
    19b4:	89 34 24             	mov    %esi,(%esp)
    19b7:	e8 1e 04 00 00       	call   1dda <sbrk>
        if (count != read_count) {
    19bc:	83 c4 10             	add    $0x10,%esp
    19bf:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    19c2:	74 64                	je     1a28 <test_read_into_cow_less_forks+0x298>
            printf(1, FAIL_MSG "wrong return value from read()\n");
    19c4:	50                   	push   %eax
    19c5:	50                   	push   %eax
    19c6:	68 a8 28 00 00       	push   $0x28a8
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    19cb:	6a 01                	push   $0x1
    19cd:	e8 fe 04 00 00       	call   1ed0 <printf>
            write(pipe_fds[1], "N", 1);
    19d2:	83 c4 0c             	add    $0xc,%esp
    19d5:	6a 01                	push   $0x1
    19d7:	68 08 23 00 00       	push   $0x2308
    19dc:	ff 75 e4             	pushl  -0x1c(%ebp)
    19df:	e8 8e 03 00 00       	call   1d72 <write>
    19e4:	83 c4 10             	add    $0x10,%esp
        close(pipe_fds[1]);
    19e7:	83 ec 0c             	sub    $0xc,%esp
    19ea:	ff 75 e4             	pushl  -0x1c(%ebp)
    19ed:	e8 88 03 00 00       	call   1d7a <close>
        exit();
    19f2:	e8 5b 03 00 00       	call   1d52 <exit>
        close(fd);
    19f7:	83 ec 0c             	sub    $0xc,%esp
    19fa:	ff 75 d4             	pushl  -0x2c(%ebp)
    19fd:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    1a00:	e8 75 03 00 00       	call   1d7a <close>
        unlink("tempfile");
    1a05:	c7 04 24 ff 22 00 00 	movl   $0x22ff,(%esp)
    1a0c:	e8 91 03 00 00       	call   1da2 <unlink>
        sbrk(-size);
    1a11:	89 34 24             	mov    %esi,(%esp)
    1a14:	e8 c1 03 00 00       	call   1dda <sbrk>
        if (count != read_count) {
    1a19:	83 c4 10             	add    $0x10,%esp
    1a1c:	3b 7d d0             	cmp    -0x30(%ebp),%edi
    1a1f:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    1a22:	75 a0                	jne    19c4 <test_read_into_cow_less_forks+0x234>
        } else if (failed_value) {
    1a24:	85 c9                	test   %ecx,%ecx
    1a26:	74 09                	je     1a31 <test_read_into_cow_less_forks+0x2a1>
            printf(1, FAIL_MSG "wrong value written to memory by read()\n");
    1a28:	50                   	push   %eax
    1a29:	50                   	push   %eax
    1a2a:	68 d4 28 00 00       	push   $0x28d4
    1a2f:	eb 9a                	jmp    19cb <test_read_into_cow_less_forks+0x23b>
            printf(1, PASS_MSG "correct value read into copy-on-write allocation\n");
    1a31:	57                   	push   %edi
    1a32:	57                   	push   %edi
    1a33:	68 60 29 00 00       	push   $0x2960
    1a38:	6a 01                	push   $0x1
    1a3a:	e8 91 04 00 00       	call   1ed0 <printf>
            write(pipe_fds[1], "Y", 1);
    1a3f:	83 c4 0c             	add    $0xc,%esp
    1a42:	6a 01                	push   $0x1
    1a44:	68 85 22 00 00       	push   $0x2285
    1a49:	ff 75 e4             	pushl  -0x1c(%ebp)
    1a4c:	e8 21 03 00 00       	call   1d72 <write>
    1a51:	83 c4 10             	add    $0x10,%esp
    1a54:	eb 91                	jmp    19e7 <test_read_into_cow_less_forks+0x257>
    1a56:	8d 76 00             	lea    0x0(%esi),%esi
    1a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a60 <test_read_into_cow>:

int test_read_into_cow(int size, int offset, int read_count, char *describe_size, char *describe_offset) {
    1a60:	55                   	push   %ebp
    1a61:	89 e5                	mov    %esp,%ebp
    1a63:	83 ec 24             	sub    $0x24,%esp
    int pipe_fds[2];
    pipe(pipe_fds);
    1a66:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1a69:	50                   	push   %eax
    1a6a:	e8 f3 02 00 00       	call   1d62 <pipe>
    int pid = fork();
    1a6f:	e8 d6 02 00 00       	call   1d4a <fork>
    if (pid == 0) {
    1a74:	83 c4 10             	add    $0x10,%esp
    1a77:	85 c0                	test   %eax,%eax
    1a79:	74 33                	je     1aae <test_read_into_cow+0x4e>
            result_str[0] = 'Y';
        }
        write(pipe_fds[1], result_str, 1);
        exit();
    } else {
        close(pipe_fds[1]);
    1a7b:	83 ec 0c             	sub    $0xc,%esp
    1a7e:	ff 75 f4             	pushl  -0xc(%ebp)
    1a81:	e8 f4 02 00 00       	call   1d7a <close>
        char result_str[1] = {'N'};
        read(pipe_fds[0], result_str, 1);
    1a86:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1a89:	83 c4 0c             	add    $0xc,%esp
        char result_str[1] = {'N'};
    1a8c:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        read(pipe_fds[0], result_str, 1);
    1a90:	6a 01                	push   $0x1
    1a92:	50                   	push   %eax
    1a93:	ff 75 f0             	pushl  -0x10(%ebp)
    1a96:	e8 cf 02 00 00       	call   1d6a <read>
        wait();
    1a9b:	e8 ba 02 00 00       	call   1d5a <wait>
        return result_str[0] == 'Y';
    1aa0:	83 c4 10             	add    $0x10,%esp
    1aa3:	31 c0                	xor    %eax,%eax
    1aa5:	80 7d ef 59          	cmpb   $0x59,-0x11(%ebp)
    }
}
    1aa9:	c9                   	leave  
        return result_str[0] == 'Y';
    1aaa:	0f 94 c0             	sete   %al
}
    1aad:	c3                   	ret    
        close(pipe_fds[0]);
    1aae:	83 ec 0c             	sub    $0xc,%esp
    1ab1:	ff 75 f0             	pushl  -0x10(%ebp)
    1ab4:	e8 c1 02 00 00       	call   1d7a <close>
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1ab9:	5a                   	pop    %edx
    1aba:	ff 75 18             	pushl  0x18(%ebp)
    1abd:	ff 75 14             	pushl  0x14(%ebp)
    1ac0:	ff 75 10             	pushl  0x10(%ebp)
    1ac3:	ff 75 0c             	pushl  0xc(%ebp)
    1ac6:	ff 75 08             	pushl  0x8(%ebp)
        char result_str[1] = {'N'};
    1ac9:	c6 45 ef 4e          	movb   $0x4e,-0x11(%ebp)
        if (test_read_into_cow_less_forks(size, offset, read_count, describe_size, describe_offset)) {
    1acd:	e8 be fc ff ff       	call   1790 <test_read_into_cow_less_forks>
    1ad2:	83 c4 20             	add    $0x20,%esp
    1ad5:	85 c0                	test   %eax,%eax
    1ad7:	74 04                	je     1add <test_read_into_cow+0x7d>
            result_str[0] = 'Y';
    1ad9:	c6 45 ef 59          	movb   $0x59,-0x11(%ebp)
        write(pipe_fds[1], result_str, 1);
    1add:	50                   	push   %eax
    1ade:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1ae1:	6a 01                	push   $0x1
    1ae3:	50                   	push   %eax
    1ae4:	ff 75 f4             	pushl  -0xc(%ebp)
    1ae7:	e8 86 02 00 00       	call   1d72 <write>
        exit();
    1aec:	e8 61 02 00 00       	call   1d52 <exit>
    1af1:	66 90                	xchg   %ax,%ax
    1af3:	66 90                	xchg   %ax,%ax
    1af5:	66 90                	xchg   %ax,%ax
    1af7:	66 90                	xchg   %ax,%ax
    1af9:	66 90                	xchg   %ax,%ax
    1afb:	66 90                	xchg   %ax,%ax
    1afd:	66 90                	xchg   %ax,%ax
    1aff:	90                   	nop

00001b00 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1b00:	55                   	push   %ebp
    1b01:	89 e5                	mov    %esp,%ebp
    1b03:	53                   	push   %ebx
    1b04:	8b 45 08             	mov    0x8(%ebp),%eax
    1b07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1b0a:	89 c2                	mov    %eax,%edx
    1b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1b10:	83 c1 01             	add    $0x1,%ecx
    1b13:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1b17:	83 c2 01             	add    $0x1,%edx
    1b1a:	84 db                	test   %bl,%bl
    1b1c:	88 5a ff             	mov    %bl,-0x1(%edx)
    1b1f:	75 ef                	jne    1b10 <strcpy+0x10>
    ;
  return os;
}
    1b21:	5b                   	pop    %ebx
    1b22:	5d                   	pop    %ebp
    1b23:	c3                   	ret    
    1b24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b30 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1b30:	55                   	push   %ebp
    1b31:	89 e5                	mov    %esp,%ebp
    1b33:	53                   	push   %ebx
    1b34:	8b 55 08             	mov    0x8(%ebp),%edx
    1b37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1b3a:	0f b6 02             	movzbl (%edx),%eax
    1b3d:	0f b6 19             	movzbl (%ecx),%ebx
    1b40:	84 c0                	test   %al,%al
    1b42:	75 1c                	jne    1b60 <strcmp+0x30>
    1b44:	eb 2a                	jmp    1b70 <strcmp+0x40>
    1b46:	8d 76 00             	lea    0x0(%esi),%esi
    1b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1b50:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1b53:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1b56:	83 c1 01             	add    $0x1,%ecx
    1b59:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    1b5c:	84 c0                	test   %al,%al
    1b5e:	74 10                	je     1b70 <strcmp+0x40>
    1b60:	38 d8                	cmp    %bl,%al
    1b62:	74 ec                	je     1b50 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1b64:	29 d8                	sub    %ebx,%eax
}
    1b66:	5b                   	pop    %ebx
    1b67:	5d                   	pop    %ebp
    1b68:	c3                   	ret    
    1b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b70:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1b72:	29 d8                	sub    %ebx,%eax
}
    1b74:	5b                   	pop    %ebx
    1b75:	5d                   	pop    %ebp
    1b76:	c3                   	ret    
    1b77:	89 f6                	mov    %esi,%esi
    1b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001b80 <strlen>:

uint
strlen(char *s)
{
    1b80:	55                   	push   %ebp
    1b81:	89 e5                	mov    %esp,%ebp
    1b83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1b86:	80 39 00             	cmpb   $0x0,(%ecx)
    1b89:	74 15                	je     1ba0 <strlen+0x20>
    1b8b:	31 d2                	xor    %edx,%edx
    1b8d:	8d 76 00             	lea    0x0(%esi),%esi
    1b90:	83 c2 01             	add    $0x1,%edx
    1b93:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1b97:	89 d0                	mov    %edx,%eax
    1b99:	75 f5                	jne    1b90 <strlen+0x10>
    ;
  return n;
}
    1b9b:	5d                   	pop    %ebp
    1b9c:	c3                   	ret    
    1b9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1ba0:	31 c0                	xor    %eax,%eax
}
    1ba2:	5d                   	pop    %ebp
    1ba3:	c3                   	ret    
    1ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001bb0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	57                   	push   %edi
    1bb4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1bb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1bba:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bbd:	89 d7                	mov    %edx,%edi
    1bbf:	fc                   	cld    
    1bc0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1bc2:	89 d0                	mov    %edx,%eax
    1bc4:	5f                   	pop    %edi
    1bc5:	5d                   	pop    %ebp
    1bc6:	c3                   	ret    
    1bc7:	89 f6                	mov    %esi,%esi
    1bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bd0 <strchr>:

char*
strchr(const char *s, char c)
{
    1bd0:	55                   	push   %ebp
    1bd1:	89 e5                	mov    %esp,%ebp
    1bd3:	53                   	push   %ebx
    1bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1bda:	0f b6 10             	movzbl (%eax),%edx
    1bdd:	84 d2                	test   %dl,%dl
    1bdf:	74 1d                	je     1bfe <strchr+0x2e>
    if(*s == c)
    1be1:	38 d3                	cmp    %dl,%bl
    1be3:	89 d9                	mov    %ebx,%ecx
    1be5:	75 0d                	jne    1bf4 <strchr+0x24>
    1be7:	eb 17                	jmp    1c00 <strchr+0x30>
    1be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bf0:	38 ca                	cmp    %cl,%dl
    1bf2:	74 0c                	je     1c00 <strchr+0x30>
  for(; *s; s++)
    1bf4:	83 c0 01             	add    $0x1,%eax
    1bf7:	0f b6 10             	movzbl (%eax),%edx
    1bfa:	84 d2                	test   %dl,%dl
    1bfc:	75 f2                	jne    1bf0 <strchr+0x20>
      return (char*)s;
  return 0;
    1bfe:	31 c0                	xor    %eax,%eax
}
    1c00:	5b                   	pop    %ebx
    1c01:	5d                   	pop    %ebp
    1c02:	c3                   	ret    
    1c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c10 <gets>:

char*
gets(char *buf, int max)
{
    1c10:	55                   	push   %ebp
    1c11:	89 e5                	mov    %esp,%ebp
    1c13:	57                   	push   %edi
    1c14:	56                   	push   %esi
    1c15:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c16:	31 f6                	xor    %esi,%esi
    1c18:	89 f3                	mov    %esi,%ebx
{
    1c1a:	83 ec 1c             	sub    $0x1c,%esp
    1c1d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1c20:	eb 2f                	jmp    1c51 <gets+0x41>
    1c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1c28:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1c2b:	83 ec 04             	sub    $0x4,%esp
    1c2e:	6a 01                	push   $0x1
    1c30:	50                   	push   %eax
    1c31:	6a 00                	push   $0x0
    1c33:	e8 32 01 00 00       	call   1d6a <read>
    if(cc < 1)
    1c38:	83 c4 10             	add    $0x10,%esp
    1c3b:	85 c0                	test   %eax,%eax
    1c3d:	7e 1c                	jle    1c5b <gets+0x4b>
      break;
    buf[i++] = c;
    1c3f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c43:	83 c7 01             	add    $0x1,%edi
    1c46:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1c49:	3c 0a                	cmp    $0xa,%al
    1c4b:	74 23                	je     1c70 <gets+0x60>
    1c4d:	3c 0d                	cmp    $0xd,%al
    1c4f:	74 1f                	je     1c70 <gets+0x60>
  for(i=0; i+1 < max; ){
    1c51:	83 c3 01             	add    $0x1,%ebx
    1c54:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1c57:	89 fe                	mov    %edi,%esi
    1c59:	7c cd                	jl     1c28 <gets+0x18>
    1c5b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1c5d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1c60:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c63:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c66:	5b                   	pop    %ebx
    1c67:	5e                   	pop    %esi
    1c68:	5f                   	pop    %edi
    1c69:	5d                   	pop    %ebp
    1c6a:	c3                   	ret    
    1c6b:	90                   	nop
    1c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c70:	8b 75 08             	mov    0x8(%ebp),%esi
    1c73:	8b 45 08             	mov    0x8(%ebp),%eax
    1c76:	01 de                	add    %ebx,%esi
    1c78:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1c7a:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c80:	5b                   	pop    %ebx
    1c81:	5e                   	pop    %esi
    1c82:	5f                   	pop    %edi
    1c83:	5d                   	pop    %ebp
    1c84:	c3                   	ret    
    1c85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c90 <stat>:

int
stat(char *n, struct stat *st)
{
    1c90:	55                   	push   %ebp
    1c91:	89 e5                	mov    %esp,%ebp
    1c93:	56                   	push   %esi
    1c94:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1c95:	83 ec 08             	sub    $0x8,%esp
    1c98:	6a 00                	push   $0x0
    1c9a:	ff 75 08             	pushl  0x8(%ebp)
    1c9d:	e8 f0 00 00 00       	call   1d92 <open>
  if(fd < 0)
    1ca2:	83 c4 10             	add    $0x10,%esp
    1ca5:	85 c0                	test   %eax,%eax
    1ca7:	78 27                	js     1cd0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1ca9:	83 ec 08             	sub    $0x8,%esp
    1cac:	ff 75 0c             	pushl  0xc(%ebp)
    1caf:	89 c3                	mov    %eax,%ebx
    1cb1:	50                   	push   %eax
    1cb2:	e8 f3 00 00 00       	call   1daa <fstat>
  close(fd);
    1cb7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1cba:	89 c6                	mov    %eax,%esi
  close(fd);
    1cbc:	e8 b9 00 00 00       	call   1d7a <close>
  return r;
    1cc1:	83 c4 10             	add    $0x10,%esp
}
    1cc4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1cc7:	89 f0                	mov    %esi,%eax
    1cc9:	5b                   	pop    %ebx
    1cca:	5e                   	pop    %esi
    1ccb:	5d                   	pop    %ebp
    1ccc:	c3                   	ret    
    1ccd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1cd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1cd5:	eb ed                	jmp    1cc4 <stat+0x34>
    1cd7:	89 f6                	mov    %esi,%esi
    1cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ce0 <atoi>:

int
atoi(const char *s)
{
    1ce0:	55                   	push   %ebp
    1ce1:	89 e5                	mov    %esp,%ebp
    1ce3:	53                   	push   %ebx
    1ce4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1ce7:	0f be 11             	movsbl (%ecx),%edx
    1cea:	8d 42 d0             	lea    -0x30(%edx),%eax
    1ced:	3c 09                	cmp    $0x9,%al
  n = 0;
    1cef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1cf4:	77 1f                	ja     1d15 <atoi+0x35>
    1cf6:	8d 76 00             	lea    0x0(%esi),%esi
    1cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1d00:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1d03:	83 c1 01             	add    $0x1,%ecx
    1d06:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1d0a:	0f be 11             	movsbl (%ecx),%edx
    1d0d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1d10:	80 fb 09             	cmp    $0x9,%bl
    1d13:	76 eb                	jbe    1d00 <atoi+0x20>
  return n;
}
    1d15:	5b                   	pop    %ebx
    1d16:	5d                   	pop    %ebp
    1d17:	c3                   	ret    
    1d18:	90                   	nop
    1d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001d20 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1d20:	55                   	push   %ebp
    1d21:	89 e5                	mov    %esp,%ebp
    1d23:	56                   	push   %esi
    1d24:	53                   	push   %ebx
    1d25:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1d28:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1d2e:	85 db                	test   %ebx,%ebx
    1d30:	7e 14                	jle    1d46 <memmove+0x26>
    1d32:	31 d2                	xor    %edx,%edx
    1d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1d38:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1d3c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1d3f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1d42:	39 d3                	cmp    %edx,%ebx
    1d44:	75 f2                	jne    1d38 <memmove+0x18>
  return vdst;
}
    1d46:	5b                   	pop    %ebx
    1d47:	5e                   	pop    %esi
    1d48:	5d                   	pop    %ebp
    1d49:	c3                   	ret    

00001d4a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1d4a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d4f:	cd 40                	int    $0x40
    1d51:	c3                   	ret    

00001d52 <exit>:
SYSCALL(exit)
    1d52:	b8 02 00 00 00       	mov    $0x2,%eax
    1d57:	cd 40                	int    $0x40
    1d59:	c3                   	ret    

00001d5a <wait>:
SYSCALL(wait)
    1d5a:	b8 03 00 00 00       	mov    $0x3,%eax
    1d5f:	cd 40                	int    $0x40
    1d61:	c3                   	ret    

00001d62 <pipe>:
SYSCALL(pipe)
    1d62:	b8 04 00 00 00       	mov    $0x4,%eax
    1d67:	cd 40                	int    $0x40
    1d69:	c3                   	ret    

00001d6a <read>:
SYSCALL(read)
    1d6a:	b8 05 00 00 00       	mov    $0x5,%eax
    1d6f:	cd 40                	int    $0x40
    1d71:	c3                   	ret    

00001d72 <write>:
SYSCALL(write)
    1d72:	b8 10 00 00 00       	mov    $0x10,%eax
    1d77:	cd 40                	int    $0x40
    1d79:	c3                   	ret    

00001d7a <close>:
SYSCALL(close)
    1d7a:	b8 15 00 00 00       	mov    $0x15,%eax
    1d7f:	cd 40                	int    $0x40
    1d81:	c3                   	ret    

00001d82 <kill>:
SYSCALL(kill)
    1d82:	b8 06 00 00 00       	mov    $0x6,%eax
    1d87:	cd 40                	int    $0x40
    1d89:	c3                   	ret    

00001d8a <exec>:
SYSCALL(exec)
    1d8a:	b8 07 00 00 00       	mov    $0x7,%eax
    1d8f:	cd 40                	int    $0x40
    1d91:	c3                   	ret    

00001d92 <open>:
SYSCALL(open)
    1d92:	b8 0f 00 00 00       	mov    $0xf,%eax
    1d97:	cd 40                	int    $0x40
    1d99:	c3                   	ret    

00001d9a <mknod>:
SYSCALL(mknod)
    1d9a:	b8 11 00 00 00       	mov    $0x11,%eax
    1d9f:	cd 40                	int    $0x40
    1da1:	c3                   	ret    

00001da2 <unlink>:
SYSCALL(unlink)
    1da2:	b8 12 00 00 00       	mov    $0x12,%eax
    1da7:	cd 40                	int    $0x40
    1da9:	c3                   	ret    

00001daa <fstat>:
SYSCALL(fstat)
    1daa:	b8 08 00 00 00       	mov    $0x8,%eax
    1daf:	cd 40                	int    $0x40
    1db1:	c3                   	ret    

00001db2 <link>:
SYSCALL(link)
    1db2:	b8 13 00 00 00       	mov    $0x13,%eax
    1db7:	cd 40                	int    $0x40
    1db9:	c3                   	ret    

00001dba <mkdir>:
SYSCALL(mkdir)
    1dba:	b8 14 00 00 00       	mov    $0x14,%eax
    1dbf:	cd 40                	int    $0x40
    1dc1:	c3                   	ret    

00001dc2 <chdir>:
SYSCALL(chdir)
    1dc2:	b8 09 00 00 00       	mov    $0x9,%eax
    1dc7:	cd 40                	int    $0x40
    1dc9:	c3                   	ret    

00001dca <dup>:
SYSCALL(dup)
    1dca:	b8 0a 00 00 00       	mov    $0xa,%eax
    1dcf:	cd 40                	int    $0x40
    1dd1:	c3                   	ret    

00001dd2 <getpid>:
SYSCALL(getpid)
    1dd2:	b8 0b 00 00 00       	mov    $0xb,%eax
    1dd7:	cd 40                	int    $0x40
    1dd9:	c3                   	ret    

00001dda <sbrk>:
SYSCALL(sbrk)
    1dda:	b8 0c 00 00 00       	mov    $0xc,%eax
    1ddf:	cd 40                	int    $0x40
    1de1:	c3                   	ret    

00001de2 <sleep>:
SYSCALL(sleep)
    1de2:	b8 0d 00 00 00       	mov    $0xd,%eax
    1de7:	cd 40                	int    $0x40
    1de9:	c3                   	ret    

00001dea <uptime>:
SYSCALL(uptime)
    1dea:	b8 0e 00 00 00       	mov    $0xe,%eax
    1def:	cd 40                	int    $0x40
    1df1:	c3                   	ret    

00001df2 <yield>:
SYSCALL(yield)
    1df2:	b8 16 00 00 00       	mov    $0x16,%eax
    1df7:	cd 40                	int    $0x40
    1df9:	c3                   	ret    

00001dfa <shutdown>:
SYSCALL(shutdown)
    1dfa:	b8 17 00 00 00       	mov    $0x17,%eax
    1dff:	cd 40                	int    $0x40
    1e01:	c3                   	ret    

00001e02 <writecount>:
SYSCALL(writecount)
    1e02:	b8 18 00 00 00       	mov    $0x18,%eax
    1e07:	cd 40                	int    $0x40
    1e09:	c3                   	ret    

00001e0a <settickets>:
SYSCALL(settickets)
    1e0a:	b8 19 00 00 00       	mov    $0x19,%eax
    1e0f:	cd 40                	int    $0x40
    1e11:	c3                   	ret    

00001e12 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
    1e12:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1e17:	cd 40                	int    $0x40
    1e19:	c3                   	ret    

00001e1a <dumppagetable>:
    1e1a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1e1f:	cd 40                	int    $0x40
    1e21:	c3                   	ret    
    1e22:	66 90                	xchg   %ax,%ax
    1e24:	66 90                	xchg   %ax,%ax
    1e26:	66 90                	xchg   %ax,%ax
    1e28:	66 90                	xchg   %ax,%ax
    1e2a:	66 90                	xchg   %ax,%ax
    1e2c:	66 90                	xchg   %ax,%ax
    1e2e:	66 90                	xchg   %ax,%ax

00001e30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1e30:	55                   	push   %ebp
    1e31:	89 e5                	mov    %esp,%ebp
    1e33:	57                   	push   %edi
    1e34:	56                   	push   %esi
    1e35:	53                   	push   %ebx
    1e36:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1e39:	85 d2                	test   %edx,%edx
{
    1e3b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    1e3e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1e40:	79 76                	jns    1eb8 <printint+0x88>
    1e42:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1e46:	74 70                	je     1eb8 <printint+0x88>
    x = -xx;
    1e48:	f7 d8                	neg    %eax
    neg = 1;
    1e4a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1e51:	31 f6                	xor    %esi,%esi
    1e53:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1e56:	eb 0a                	jmp    1e62 <printint+0x32>
    1e58:	90                   	nop
    1e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    1e60:	89 fe                	mov    %edi,%esi
    1e62:	31 d2                	xor    %edx,%edx
    1e64:	8d 7e 01             	lea    0x1(%esi),%edi
    1e67:	f7 f1                	div    %ecx
    1e69:	0f b6 92 68 2a 00 00 	movzbl 0x2a68(%edx),%edx
  }while((x /= base) != 0);
    1e70:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1e72:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1e75:	75 e9                	jne    1e60 <printint+0x30>
  if(neg)
    1e77:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1e7a:	85 c0                	test   %eax,%eax
    1e7c:	74 08                	je     1e86 <printint+0x56>
    buf[i++] = '-';
    1e7e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1e83:	8d 7e 02             	lea    0x2(%esi),%edi
    1e86:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    1e8a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    1e8d:	8d 76 00             	lea    0x0(%esi),%esi
    1e90:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    1e93:	83 ec 04             	sub    $0x4,%esp
    1e96:	83 ee 01             	sub    $0x1,%esi
    1e99:	6a 01                	push   $0x1
    1e9b:	53                   	push   %ebx
    1e9c:	57                   	push   %edi
    1e9d:	88 45 d7             	mov    %al,-0x29(%ebp)
    1ea0:	e8 cd fe ff ff       	call   1d72 <write>

  while(--i >= 0)
    1ea5:	83 c4 10             	add    $0x10,%esp
    1ea8:	39 de                	cmp    %ebx,%esi
    1eaa:	75 e4                	jne    1e90 <printint+0x60>
    putc(fd, buf[i]);
}
    1eac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1eaf:	5b                   	pop    %ebx
    1eb0:	5e                   	pop    %esi
    1eb1:	5f                   	pop    %edi
    1eb2:	5d                   	pop    %ebp
    1eb3:	c3                   	ret    
    1eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1eb8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1ebf:	eb 90                	jmp    1e51 <printint+0x21>
    1ec1:	eb 0d                	jmp    1ed0 <printf>
    1ec3:	90                   	nop
    1ec4:	90                   	nop
    1ec5:	90                   	nop
    1ec6:	90                   	nop
    1ec7:	90                   	nop
    1ec8:	90                   	nop
    1ec9:	90                   	nop
    1eca:	90                   	nop
    1ecb:	90                   	nop
    1ecc:	90                   	nop
    1ecd:	90                   	nop
    1ece:	90                   	nop
    1ecf:	90                   	nop

00001ed0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1ed0:	55                   	push   %ebp
    1ed1:	89 e5                	mov    %esp,%ebp
    1ed3:	57                   	push   %edi
    1ed4:	56                   	push   %esi
    1ed5:	53                   	push   %ebx
    1ed6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1ed9:	8b 75 0c             	mov    0xc(%ebp),%esi
    1edc:	0f b6 1e             	movzbl (%esi),%ebx
    1edf:	84 db                	test   %bl,%bl
    1ee1:	0f 84 b3 00 00 00    	je     1f9a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    1ee7:	8d 45 10             	lea    0x10(%ebp),%eax
    1eea:	83 c6 01             	add    $0x1,%esi
  state = 0;
    1eed:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    1eef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1ef2:	eb 2f                	jmp    1f23 <printf+0x53>
    1ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1ef8:	83 f8 25             	cmp    $0x25,%eax
    1efb:	0f 84 a7 00 00 00    	je     1fa8 <printf+0xd8>
  write(fd, &c, 1);
    1f01:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1f04:	83 ec 04             	sub    $0x4,%esp
    1f07:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1f0a:	6a 01                	push   $0x1
    1f0c:	50                   	push   %eax
    1f0d:	ff 75 08             	pushl  0x8(%ebp)
    1f10:	e8 5d fe ff ff       	call   1d72 <write>
    1f15:	83 c4 10             	add    $0x10,%esp
    1f18:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    1f1b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1f1f:	84 db                	test   %bl,%bl
    1f21:	74 77                	je     1f9a <printf+0xca>
    if(state == 0){
    1f23:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    1f25:	0f be cb             	movsbl %bl,%ecx
    1f28:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1f2b:	74 cb                	je     1ef8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1f2d:	83 ff 25             	cmp    $0x25,%edi
    1f30:	75 e6                	jne    1f18 <printf+0x48>
      if(c == 'd'){
    1f32:	83 f8 64             	cmp    $0x64,%eax
    1f35:	0f 84 05 01 00 00    	je     2040 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1f3b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1f41:	83 f9 70             	cmp    $0x70,%ecx
    1f44:	74 72                	je     1fb8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1f46:	83 f8 73             	cmp    $0x73,%eax
    1f49:	0f 84 99 00 00 00    	je     1fe8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1f4f:	83 f8 63             	cmp    $0x63,%eax
    1f52:	0f 84 08 01 00 00    	je     2060 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1f58:	83 f8 25             	cmp    $0x25,%eax
    1f5b:	0f 84 ef 00 00 00    	je     2050 <printf+0x180>
  write(fd, &c, 1);
    1f61:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1f64:	83 ec 04             	sub    $0x4,%esp
    1f67:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1f6b:	6a 01                	push   $0x1
    1f6d:	50                   	push   %eax
    1f6e:	ff 75 08             	pushl  0x8(%ebp)
    1f71:	e8 fc fd ff ff       	call   1d72 <write>
    1f76:	83 c4 0c             	add    $0xc,%esp
    1f79:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f7c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1f7f:	6a 01                	push   $0x1
    1f81:	50                   	push   %eax
    1f82:	ff 75 08             	pushl  0x8(%ebp)
    1f85:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1f88:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1f8a:	e8 e3 fd ff ff       	call   1d72 <write>
  for(i = 0; fmt[i]; i++){
    1f8f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    1f93:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1f96:	84 db                	test   %bl,%bl
    1f98:	75 89                	jne    1f23 <printf+0x53>
    }
  }
}
    1f9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f9d:	5b                   	pop    %ebx
    1f9e:	5e                   	pop    %esi
    1f9f:	5f                   	pop    %edi
    1fa0:	5d                   	pop    %ebp
    1fa1:	c3                   	ret    
    1fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    1fa8:	bf 25 00 00 00       	mov    $0x25,%edi
    1fad:	e9 66 ff ff ff       	jmp    1f18 <printf+0x48>
    1fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1fb8:	83 ec 0c             	sub    $0xc,%esp
    1fbb:	b9 10 00 00 00       	mov    $0x10,%ecx
    1fc0:	6a 00                	push   $0x0
    1fc2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    1fc5:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc8:	8b 17                	mov    (%edi),%edx
    1fca:	e8 61 fe ff ff       	call   1e30 <printint>
        ap++;
    1fcf:	89 f8                	mov    %edi,%eax
    1fd1:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1fd4:	31 ff                	xor    %edi,%edi
        ap++;
    1fd6:	83 c0 04             	add    $0x4,%eax
    1fd9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1fdc:	e9 37 ff ff ff       	jmp    1f18 <printf+0x48>
    1fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1fe8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1feb:	8b 08                	mov    (%eax),%ecx
        ap++;
    1fed:	83 c0 04             	add    $0x4,%eax
    1ff0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    1ff3:	85 c9                	test   %ecx,%ecx
    1ff5:	0f 84 8e 00 00 00    	je     2089 <printf+0x1b9>
        while(*s != 0){
    1ffb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    1ffe:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    2000:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    2002:	84 c0                	test   %al,%al
    2004:	0f 84 0e ff ff ff    	je     1f18 <printf+0x48>
    200a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    200d:	89 de                	mov    %ebx,%esi
    200f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2012:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    2015:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    2018:	83 ec 04             	sub    $0x4,%esp
          s++;
    201b:	83 c6 01             	add    $0x1,%esi
    201e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    2021:	6a 01                	push   $0x1
    2023:	57                   	push   %edi
    2024:	53                   	push   %ebx
    2025:	e8 48 fd ff ff       	call   1d72 <write>
        while(*s != 0){
    202a:	0f b6 06             	movzbl (%esi),%eax
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	84 c0                	test   %al,%al
    2032:	75 e4                	jne    2018 <printf+0x148>
    2034:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    2037:	31 ff                	xor    %edi,%edi
    2039:	e9 da fe ff ff       	jmp    1f18 <printf+0x48>
    203e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    2040:	83 ec 0c             	sub    $0xc,%esp
    2043:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2048:	6a 01                	push   $0x1
    204a:	e9 73 ff ff ff       	jmp    1fc2 <printf+0xf2>
    204f:	90                   	nop
  write(fd, &c, 1);
    2050:	83 ec 04             	sub    $0x4,%esp
    2053:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    2056:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2059:	6a 01                	push   $0x1
    205b:	e9 21 ff ff ff       	jmp    1f81 <printf+0xb1>
        putc(fd, *ap);
    2060:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    2063:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    2066:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    2068:	6a 01                	push   $0x1
        ap++;
    206a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    206d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    2070:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2073:	50                   	push   %eax
    2074:	ff 75 08             	pushl  0x8(%ebp)
    2077:	e8 f6 fc ff ff       	call   1d72 <write>
        ap++;
    207c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    207f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    2082:	31 ff                	xor    %edi,%edi
    2084:	e9 8f fe ff ff       	jmp    1f18 <printf+0x48>
          s = "(null)";
    2089:	bb 60 2a 00 00       	mov    $0x2a60,%ebx
        while(*s != 0){
    208e:	b8 28 00 00 00       	mov    $0x28,%eax
    2093:	e9 72 ff ff ff       	jmp    200a <printf+0x13a>
    2098:	66 90                	xchg   %ax,%ax
    209a:	66 90                	xchg   %ax,%ax
    209c:	66 90                	xchg   %ax,%ax
    209e:	66 90                	xchg   %ax,%ax

000020a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    20a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20a1:	a1 a0 32 00 00       	mov    0x32a0,%eax
{
    20a6:	89 e5                	mov    %esp,%ebp
    20a8:	57                   	push   %edi
    20a9:	56                   	push   %esi
    20aa:	53                   	push   %ebx
    20ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    20ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    20b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20b8:	39 c8                	cmp    %ecx,%eax
    20ba:	8b 10                	mov    (%eax),%edx
    20bc:	73 32                	jae    20f0 <free+0x50>
    20be:	39 d1                	cmp    %edx,%ecx
    20c0:	72 04                	jb     20c6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    20c2:	39 d0                	cmp    %edx,%eax
    20c4:	72 32                	jb     20f8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    20c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    20c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    20cc:	39 fa                	cmp    %edi,%edx
    20ce:	74 30                	je     2100 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    20d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    20d3:	8b 50 04             	mov    0x4(%eax),%edx
    20d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    20d9:	39 f1                	cmp    %esi,%ecx
    20db:	74 3a                	je     2117 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    20dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
    20df:	a3 a0 32 00 00       	mov    %eax,0x32a0
}
    20e4:	5b                   	pop    %ebx
    20e5:	5e                   	pop    %esi
    20e6:	5f                   	pop    %edi
    20e7:	5d                   	pop    %ebp
    20e8:	c3                   	ret    
    20e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    20f0:	39 d0                	cmp    %edx,%eax
    20f2:	72 04                	jb     20f8 <free+0x58>
    20f4:	39 d1                	cmp    %edx,%ecx
    20f6:	72 ce                	jb     20c6 <free+0x26>
{
    20f8:	89 d0                	mov    %edx,%eax
    20fa:	eb bc                	jmp    20b8 <free+0x18>
    20fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    2100:	03 72 04             	add    0x4(%edx),%esi
    2103:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2106:	8b 10                	mov    (%eax),%edx
    2108:	8b 12                	mov    (%edx),%edx
    210a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    210d:	8b 50 04             	mov    0x4(%eax),%edx
    2110:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2113:	39 f1                	cmp    %esi,%ecx
    2115:	75 c6                	jne    20dd <free+0x3d>
    p->s.size += bp->s.size;
    2117:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    211a:	a3 a0 32 00 00       	mov    %eax,0x32a0
    p->s.size += bp->s.size;
    211f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2122:	8b 53 f8             	mov    -0x8(%ebx),%edx
    2125:	89 10                	mov    %edx,(%eax)
}
    2127:	5b                   	pop    %ebx
    2128:	5e                   	pop    %esi
    2129:	5f                   	pop    %edi
    212a:	5d                   	pop    %ebp
    212b:	c3                   	ret    
    212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002130 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    2130:	55                   	push   %ebp
    2131:	89 e5                	mov    %esp,%ebp
    2133:	57                   	push   %edi
    2134:	56                   	push   %esi
    2135:	53                   	push   %ebx
    2136:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2139:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    213c:	8b 15 a0 32 00 00    	mov    0x32a0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2142:	8d 78 07             	lea    0x7(%eax),%edi
    2145:	c1 ef 03             	shr    $0x3,%edi
    2148:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    214b:	85 d2                	test   %edx,%edx
    214d:	0f 84 9d 00 00 00    	je     21f0 <malloc+0xc0>
    2153:	8b 02                	mov    (%edx),%eax
    2155:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    2158:	39 cf                	cmp    %ecx,%edi
    215a:	76 6c                	jbe    21c8 <malloc+0x98>
    215c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    2162:	bb 00 10 00 00       	mov    $0x1000,%ebx
    2167:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    216a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    2171:	eb 0e                	jmp    2181 <malloc+0x51>
    2173:	90                   	nop
    2174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2178:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    217a:	8b 48 04             	mov    0x4(%eax),%ecx
    217d:	39 f9                	cmp    %edi,%ecx
    217f:	73 47                	jae    21c8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    2181:	39 05 a0 32 00 00    	cmp    %eax,0x32a0
    2187:	89 c2                	mov    %eax,%edx
    2189:	75 ed                	jne    2178 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    218b:	83 ec 0c             	sub    $0xc,%esp
    218e:	56                   	push   %esi
    218f:	e8 46 fc ff ff       	call   1dda <sbrk>
  if(p == (char*)-1)
    2194:	83 c4 10             	add    $0x10,%esp
    2197:	83 f8 ff             	cmp    $0xffffffff,%eax
    219a:	74 1c                	je     21b8 <malloc+0x88>
  hp->s.size = nu;
    219c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    219f:	83 ec 0c             	sub    $0xc,%esp
    21a2:	83 c0 08             	add    $0x8,%eax
    21a5:	50                   	push   %eax
    21a6:	e8 f5 fe ff ff       	call   20a0 <free>
  return freep;
    21ab:	8b 15 a0 32 00 00    	mov    0x32a0,%edx
      if((p = morecore(nunits)) == 0)
    21b1:	83 c4 10             	add    $0x10,%esp
    21b4:	85 d2                	test   %edx,%edx
    21b6:	75 c0                	jne    2178 <malloc+0x48>
        return 0;
  }
}
    21b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    21bb:	31 c0                	xor    %eax,%eax
}
    21bd:	5b                   	pop    %ebx
    21be:	5e                   	pop    %esi
    21bf:	5f                   	pop    %edi
    21c0:	5d                   	pop    %ebp
    21c1:	c3                   	ret    
    21c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    21c8:	39 cf                	cmp    %ecx,%edi
    21ca:	74 54                	je     2220 <malloc+0xf0>
        p->s.size -= nunits;
    21cc:	29 f9                	sub    %edi,%ecx
    21ce:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    21d1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    21d4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    21d7:	89 15 a0 32 00 00    	mov    %edx,0x32a0
}
    21dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    21e0:	83 c0 08             	add    $0x8,%eax
}
    21e3:	5b                   	pop    %ebx
    21e4:	5e                   	pop    %esi
    21e5:	5f                   	pop    %edi
    21e6:	5d                   	pop    %ebp
    21e7:	c3                   	ret    
    21e8:	90                   	nop
    21e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    21f0:	c7 05 a0 32 00 00 a4 	movl   $0x32a4,0x32a0
    21f7:	32 00 00 
    21fa:	c7 05 a4 32 00 00 a4 	movl   $0x32a4,0x32a4
    2201:	32 00 00 
    base.s.size = 0;
    2204:	b8 a4 32 00 00       	mov    $0x32a4,%eax
    2209:	c7 05 a8 32 00 00 00 	movl   $0x0,0x32a8
    2210:	00 00 00 
    2213:	e9 44 ff ff ff       	jmp    215c <malloc+0x2c>
    2218:	90                   	nop
    2219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    2220:	8b 08                	mov    (%eax),%ecx
    2222:	89 0a                	mov    %ecx,(%edx)
    2224:	eb b1                	jmp    21d7 <malloc+0xa7>
