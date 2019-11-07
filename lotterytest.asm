
_lotterytest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
    printf(1, "%s: passed %d of %d\n", test->name, test->total_tests - test->errors, test->total_tests);
}

int main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	83 ec 08             	sub    $0x8,%esp
    int total_tests = 0;
    int passed_tests = 0;
    for (int i = 0; tests[i].name; ++i) {
      14:	8b 15 00 1e 00 00    	mov    0x1e00,%edx
      1a:	85 d2                	test   %edx,%edx
      1c:	74 4d                	je     6b <main+0x6b>
      1e:	bb 00 1e 00 00       	mov    $0x1e00,%ebx
    int passed_tests = 0;
      23:	31 f6                	xor    %esi,%esi
    int total_tests = 0;
      25:	31 ff                	xor    %edi,%edi
      27:	89 f6                	mov    %esi,%esi
      29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        struct test_case *test = &tests[i];
        run_test_case(test);
      30:	83 ec 0c             	sub    $0xc,%esp
      33:	53                   	push   %ebx
      34:	81 c3 14 02 00 00    	add    $0x214,%ebx
      3a:	e8 31 09 00 00       	call   970 <run_test_case>
        total_tests += test->total_tests;
      3f:	8b 83 f0 fd ff ff    	mov    -0x210(%ebx),%eax
    for (int i = 0; tests[i].name; ++i) {
      45:	83 c4 10             	add    $0x10,%esp
        total_tests += test->total_tests;
      48:	01 c7                	add    %eax,%edi
        passed_tests += test->total_tests - test->errors;
      4a:	2b 83 f4 fd ff ff    	sub    -0x20c(%ebx),%eax
      50:	01 c6                	add    %eax,%esi
    for (int i = 0; tests[i].name; ++i) {
      52:	8b 03                	mov    (%ebx),%eax
      54:	85 c0                	test   %eax,%eax
      56:	75 d8                	jne    30 <main+0x30>
    }
    printf(1, "overall: passed %d of %d\n", passed_tests, total_tests);
      58:	57                   	push   %edi
      59:	56                   	push   %esi
      5a:	68 a1 17 00 00       	push   $0x17a1
      5f:	6a 01                	push   $0x1
      61:	e8 aa 0d 00 00       	call   e10 <printf>
    exit();
      66:	e8 27 0c 00 00       	call   c92 <exit>
    int passed_tests = 0;
      6b:	31 f6                	xor    %esi,%esi
    int total_tests = 0;
      6d:	31 ff                	xor    %edi,%edi
      6f:	eb e7                	jmp    58 <main+0x58>
      71:	66 90                	xchg   %ax,%ax
      73:	66 90                	xchg   %ax,%ax
      75:	66 90                	xchg   %ax,%ax
      77:	66 90                	xchg   %ax,%ax
      79:	66 90                	xchg   %ax,%ax
      7b:	66 90                	xchg   %ax,%ax
      7d:	66 90                	xchg   %ax,%ax
      7f:	90                   	nop

00000080 <run_forever>:
void run_forever() {
      80:	55                   	push   %ebp
      81:	89 e5                	mov    %esp,%ebp
        __asm__("");
      83:	eb fe                	jmp    83 <run_forever+0x3>
      85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000090 <yield_forever>:
void yield_forever() {
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	83 ec 08             	sub    $0x8,%esp
      96:	8d 76 00             	lea    0x0(%esi),%esi
      99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        yield();
      a0:	e8 8d 0c 00 00       	call   d32 <yield>
      a5:	eb f9                	jmp    a0 <yield_forever+0x10>
      a7:	89 f6                	mov    %esi,%esi
      a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <iowait_forever>:
void iowait_forever() {
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	53                   	push   %ebx
    pipe(fds);
      b4:	8d 45 f0             	lea    -0x10(%ebp),%eax
      b7:	8d 5d ef             	lea    -0x11(%ebp),%ebx
void iowait_forever() {
      ba:	83 ec 20             	sub    $0x20,%esp
    pipe(fds);
      bd:	50                   	push   %eax
      be:	e8 df 0b 00 00       	call   ca2 <pipe>
      c3:	83 c4 10             	add    $0x10,%esp
      c6:	8d 76 00             	lea    0x0(%esi),%esi
      c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        read(fds[0], temp, 0);
      d0:	83 ec 04             	sub    $0x4,%esp
      d3:	6a 00                	push   $0x0
      d5:	53                   	push   %ebx
      d6:	ff 75 f0             	pushl  -0x10(%ebp)
      d9:	e8 cc 0b 00 00       	call   caa <read>
      de:	83 c4 10             	add    $0x10,%esp
      e1:	eb ed                	jmp    d0 <iowait_forever+0x20>
      e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <exit_fast>:
void exit_fast() {
      f0:	55                   	push   %ebp
      f1:	89 e5                	mov    %esp,%ebp
      f3:	83 ec 08             	sub    $0x8,%esp
    exit();
      f6:	e8 97 0b 00 00       	call   c92 <exit>
      fb:	90                   	nop
      fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <check.part.1>:
void check(struct test_case* test, int passed_p, const char *description) {
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	83 ec 08             	sub    $0x8,%esp
        test->errors++;
     106:	83 40 08 01          	addl   $0x1,0x8(%eax)
        printf(1, "*** TEST FAILURE: for scenario '%s': %s\n", test->name, description);
     10a:	52                   	push   %edx
     10b:	ff 30                	pushl  (%eax)
     10d:	68 c0 12 00 00       	push   $0x12c0
     112:	6a 01                	push   $0x1
     114:	e8 f7 0c 00 00       	call   e10 <printf>
     119:	83 c4 10             	add    $0x10,%esp
}
     11c:	c9                   	leave  
     11d:	c3                   	ret    
     11e:	66 90                	xchg   %ax,%ax

00000120 <spawn>:
int spawn(int tickets, function_type function) {
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 18             	sub    $0x18,%esp
    int pid = fork();
     126:	e8 5f 0b 00 00       	call   c8a <fork>
    if (pid == 0) {
     12b:	85 c0                	test   %eax,%eax
     12d:	74 21                	je     150 <spawn+0x30>
    } else if (pid != -1) {
     12f:	83 f8 ff             	cmp    $0xffffffff,%eax
     132:	74 02                	je     136 <spawn+0x16>
}
     134:	c9                   	leave  
     135:	c3                   	ret    
        printf(2, "error in fork\n");
     136:	83 ec 08             	sub    $0x8,%esp
     139:	89 45 f4             	mov    %eax,-0xc(%ebp)
     13c:	68 40 17 00 00       	push   $0x1740
     141:	6a 02                	push   $0x2
     143:	e8 c8 0c 00 00       	call   e10 <printf>
        return -1;
     148:	8b 45 f4             	mov    -0xc(%ebp),%eax
     14b:	83 c4 10             	add    $0x10,%esp
}
     14e:	c9                   	leave  
     14f:	c3                   	ret    
        settickets(tickets);
     150:	83 ec 0c             	sub    $0xc,%esp
     153:	ff 75 08             	pushl  0x8(%ebp)
     156:	e8 ef 0b 00 00       	call   d4a <settickets>
        yield();
     15b:	e8 d2 0b 00 00       	call   d32 <yield>
        (*function)();
     160:	ff 55 0c             	call   *0xc(%ebp)
        exit();
     163:	e8 2a 0b 00 00       	call   c92 <exit>
     168:	90                   	nop
     169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000170 <find_index_of_pid>:
int find_index_of_pid(int *list, int list_size, int pid) {
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	53                   	push   %ebx
     174:	8b 55 0c             	mov    0xc(%ebp),%edx
     177:	8b 4d 08             	mov    0x8(%ebp),%ecx
     17a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    for (int i = 0; i < list_size; ++i) {
     17d:	85 d2                	test   %edx,%edx
     17f:	7e 1b                	jle    19c <find_index_of_pid+0x2c>
     181:	31 c0                	xor    %eax,%eax
        if (list[i] == pid)
     183:	3b 19                	cmp    (%ecx),%ebx
     185:	75 0e                	jne    195 <find_index_of_pid+0x25>
     187:	eb 18                	jmp    1a1 <find_index_of_pid+0x31>
     189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     190:	39 1c 81             	cmp    %ebx,(%ecx,%eax,4)
     193:	74 0c                	je     1a1 <find_index_of_pid+0x31>
    for (int i = 0; i < list_size; ++i) {
     195:	83 c0 01             	add    $0x1,%eax
     198:	39 c2                	cmp    %eax,%edx
     19a:	75 f4                	jne    190 <find_index_of_pid+0x20>
    return -1;
     19c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     1a1:	5b                   	pop    %ebx
     1a2:	5d                   	pop    %ebp
     1a3:	c3                   	ret    
     1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <wait_for_ticket_counts>:
void wait_for_ticket_counts(int num_children, int *pids, int *tickets) {
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	57                   	push   %edi
     1b4:	56                   	push   %esi
     1b5:	53                   	push   %ebx
     1b6:	8d bd e4 fc ff ff    	lea    -0x31c(%ebp),%edi
     1bc:	81 ec 38 03 00 00    	sub    $0x338,%esp
    settickets(NOT_AS_LARGE_TICKET_COUNT);
     1c2:	68 10 27 00 00       	push   $0x2710
     1c7:	e8 7e 0b 00 00       	call   d4a <settickets>
     1cc:	83 c4 10             	add    $0x10,%esp
     1cf:	c7 85 d0 fc ff ff 64 	movl   $0x64,-0x330(%ebp)
     1d6:	00 00 00 
     1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        yield();
     1e0:	e8 4d 0b 00 00       	call   d32 <yield>
        getprocessesinfo(&info);
     1e5:	83 ec 0c             	sub    $0xc,%esp
     1e8:	57                   	push   %edi
     1e9:	e8 64 0b 00 00       	call   d52 <getprocessesinfo>
        for (int i = 0; i < num_children; ++i) {
     1ee:	8b 45 08             	mov    0x8(%ebp),%eax
     1f1:	83 c4 10             	add    $0x10,%esp
     1f4:	85 c0                	test   %eax,%eax
     1f6:	7e 78                	jle    270 <wait_for_ticket_counts+0xc0>
        if (list[i] == pid)
     1f8:	8b 85 e8 fc ff ff    	mov    -0x318(%ebp),%eax
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
     1fe:	8b 8d e4 fc ff ff    	mov    -0x31c(%ebp),%ecx
        for (int i = 0; i < num_children; ++i) {
     204:	31 db                	xor    %ebx,%ebx
        int done = 1;
     206:	be 01 00 00 00       	mov    $0x1,%esi
        if (list[i] == pid)
     20b:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
     211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
     218:	8b 45 0c             	mov    0xc(%ebp),%eax
    for (int i = 0; i < list_size; ++i) {
     21b:	85 c9                	test   %ecx,%ecx
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
     21d:	8b 14 98             	mov    (%eax,%ebx,4),%edx
    for (int i = 0; i < list_size; ++i) {
     220:	7e 1b                	jle    23d <wait_for_ticket_counts+0x8d>
     222:	31 c0                	xor    %eax,%eax
        if (list[i] == pid)
     224:	3b 95 d4 fc ff ff    	cmp    -0x32c(%ebp),%edx
     22a:	75 0a                	jne    236 <wait_for_ticket_counts+0x86>
     22c:	eb 14                	jmp    242 <wait_for_ticket_counts+0x92>
     22e:	66 90                	xchg   %ax,%ax
     230:	3b 54 87 04          	cmp    0x4(%edi,%eax,4),%edx
     234:	74 0c                	je     242 <wait_for_ticket_counts+0x92>
    for (int i = 0; i < list_size; ++i) {
     236:	83 c0 01             	add    $0x1,%eax
     239:	39 c1                	cmp    %eax,%ecx
     23b:	75 f3                	jne    230 <wait_for_ticket_counts+0x80>
    return -1;
     23d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
            if (info.tickets[index] != tickets[i]) done = 0;
     242:	8b 55 10             	mov    0x10(%ebp),%edx
     245:	8b 14 9a             	mov    (%edx,%ebx,4),%edx
     248:	39 94 85 e8 fe ff ff 	cmp    %edx,-0x118(%ebp,%eax,4)
     24f:	b8 00 00 00 00       	mov    $0x0,%eax
     254:	0f 45 f0             	cmovne %eax,%esi
        for (int i = 0; i < num_children; ++i) {
     257:	83 c3 01             	add    $0x1,%ebx
     25a:	39 5d 08             	cmp    %ebx,0x8(%ebp)
     25d:	75 b9                	jne    218 <wait_for_ticket_counts+0x68>
        if (done)
     25f:	85 f6                	test   %esi,%esi
     261:	75 0d                	jne    270 <wait_for_ticket_counts+0xc0>
    for (int yield_count = 0; yield_count < MAX_YIELDS_FOR_SETUP; ++yield_count) {
     263:	83 ad d0 fc ff ff 01 	subl   $0x1,-0x330(%ebp)
     26a:	0f 85 70 ff ff ff    	jne    1e0 <wait_for_ticket_counts+0x30>
    settickets(LARGE_TICKET_COUNT);
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	68 a0 86 01 00       	push   $0x186a0
     278:	e8 cd 0a 00 00       	call   d4a <settickets>
}
     27d:	83 c4 10             	add    $0x10,%esp
     280:	8d 65 f4             	lea    -0xc(%ebp),%esp
     283:	5b                   	pop    %ebx
     284:	5e                   	pop    %esi
     285:	5f                   	pop    %edi
     286:	5d                   	pop    %ebp
     287:	c3                   	ret    
     288:	90                   	nop
     289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <check>:
void check(struct test_case* test, int passed_p, const char *description) {
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	8b 45 08             	mov    0x8(%ebp),%eax
    if (!passed_p) {
     296:	8b 4d 0c             	mov    0xc(%ebp),%ecx
void check(struct test_case* test, int passed_p, const char *description) {
     299:	8b 55 10             	mov    0x10(%ebp),%edx
    test->total_tests++;
     29c:	83 40 04 01          	addl   $0x1,0x4(%eax)
    if (!passed_p) {
     2a0:	85 c9                	test   %ecx,%ecx
     2a2:	74 0c                	je     2b0 <check+0x20>
}
     2a4:	5d                   	pop    %ebp
     2a5:	c3                   	ret    
     2a6:	8d 76 00             	lea    0x0(%esi),%esi
     2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     2b0:	5d                   	pop    %ebp
     2b1:	e9 4a fe ff ff       	jmp    100 <check.part.1>
     2b6:	8d 76 00             	lea    0x0(%esi),%esi
     2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <execute_and_get_info>:
        struct processes_info *after) {
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	57                   	push   %edi
     2c4:	56                   	push   %esi
     2c5:	53                   	push   %ebx
     2c6:	83 ec 18             	sub    $0x18,%esp
     2c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     2cc:	8b 75 0c             	mov    0xc(%ebp),%esi
    settickets(LARGE_TICKET_COUNT);
     2cf:	68 a0 86 01 00       	push   $0x186a0
     2d4:	e8 71 0a 00 00       	call   d4a <settickets>
    for (int i = 0; i < test->num_children; ++i) {
     2d9:	8b 43 0c             	mov    0xc(%ebx),%eax
     2dc:	83 c4 10             	add    $0x10,%esp
     2df:	85 c0                	test   %eax,%eax
     2e1:	7e 28                	jle    30b <execute_and_get_info+0x4b>
     2e3:	31 ff                	xor    %edi,%edi
     2e5:	8d 76 00             	lea    0x0(%esi),%esi
        pids[i] = spawn(test->tickets[i], test->functions[i]);
     2e8:	83 ec 08             	sub    $0x8,%esp
     2eb:	ff b4 bb 94 01 00 00 	pushl  0x194(%ebx,%edi,4)
     2f2:	ff 74 bb 10          	pushl  0x10(%ebx,%edi,4)
     2f6:	e8 25 fe ff ff       	call   120 <spawn>
     2fb:	89 04 be             	mov    %eax,(%esi,%edi,4)
    for (int i = 0; i < test->num_children; ++i) {
     2fe:	8b 43 0c             	mov    0xc(%ebx),%eax
     301:	83 c7 01             	add    $0x1,%edi
     304:	83 c4 10             	add    $0x10,%esp
     307:	39 f8                	cmp    %edi,%eax
     309:	7f dd                	jg     2e8 <execute_and_get_info+0x28>
    wait_for_ticket_counts(test->num_children, pids, test->tickets);
     30b:	8d 53 10             	lea    0x10(%ebx),%edx
     30e:	83 ec 04             	sub    $0x4,%esp
     311:	52                   	push   %edx
     312:	56                   	push   %esi
     313:	50                   	push   %eax
     314:	e8 97 fe ff ff       	call   1b0 <wait_for_ticket_counts>
    before->num_processes = after->num_processes = -1;
     319:	8b 45 14             	mov    0x14(%ebp),%eax
     31c:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     322:	8b 45 10             	mov    0x10(%ebp),%eax
     325:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    sleep(WARMUP_TIME);
     32b:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     332:	e8 eb 09 00 00       	call   d22 <sleep>
    getprocessesinfo(before);
     337:	58                   	pop    %eax
     338:	ff 75 10             	pushl  0x10(%ebp)
     33b:	e8 12 0a 00 00       	call   d52 <getprocessesinfo>
    sleep(SLEEP_TIME);
     340:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
     347:	e8 d6 09 00 00       	call   d22 <sleep>
    getprocessesinfo(after);
     34c:	5a                   	pop    %edx
     34d:	ff 75 14             	pushl  0x14(%ebp)
     350:	e8 fd 09 00 00       	call   d52 <getprocessesinfo>
    for (int i = 0; i < test->num_children; ++i) {
     355:	8b 4b 0c             	mov    0xc(%ebx),%ecx
     358:	83 c4 10             	add    $0x10,%esp
     35b:	85 c9                	test   %ecx,%ecx
     35d:	7e 3e                	jle    39d <execute_and_get_info+0xdd>
     35f:	31 ff                	xor    %edi,%edi
     361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        kill(pids[i]);
     368:	83 ec 0c             	sub    $0xc,%esp
     36b:	ff 34 be             	pushl  (%esi,%edi,4)
    for (int i = 0; i < test->num_children; ++i) {
     36e:	83 c7 01             	add    $0x1,%edi
        kill(pids[i]);
     371:	e8 4c 09 00 00       	call   cc2 <kill>
    for (int i = 0; i < test->num_children; ++i) {
     376:	8b 43 0c             	mov    0xc(%ebx),%eax
     379:	83 c4 10             	add    $0x10,%esp
     37c:	39 f8                	cmp    %edi,%eax
     37e:	7f e8                	jg     368 <execute_and_get_info+0xa8>
    for (int i = 0; i < test->num_children; ++i) {
     380:	85 c0                	test   %eax,%eax
     382:	7e 19                	jle    39d <execute_and_get_info+0xdd>
     384:	31 f6                	xor    %esi,%esi
     386:	8d 76 00             	lea    0x0(%esi),%esi
     389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        wait();
     390:	e8 05 09 00 00       	call   c9a <wait>
    for (int i = 0; i < test->num_children; ++i) {
     395:	83 c6 01             	add    $0x1,%esi
     398:	39 73 0c             	cmp    %esi,0xc(%ebx)
     39b:	7f f3                	jg     390 <execute_and_get_info+0xd0>
}
     39d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3a0:	5b                   	pop    %ebx
     3a1:	5e                   	pop    %esi
     3a2:	5f                   	pop    %edi
     3a3:	5d                   	pop    %ebp
     3a4:	c3                   	ret    
     3a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <count_ticks>:
        struct processes_info *after) {
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	57                   	push   %edi
     3b4:	56                   	push   %esi
     3b5:	53                   	push   %ebx
     3b6:	83 ec 1c             	sub    $0x1c,%esp
     3b9:	8b 75 08             	mov    0x8(%ebp),%esi
    for (int i = 0; i < test->num_children; ++i) {
     3bc:	8b 46 0c             	mov    0xc(%esi),%eax
    test->total_actual_ticks = 0;
     3bf:	c7 86 90 01 00 00 00 	movl   $0x0,0x190(%esi)
     3c6:	00 00 00 
    for (int i = 0; i < test->num_children; ++i) {
     3c9:	85 c0                	test   %eax,%eax
     3cb:	0f 8e a9 00 00 00    	jle    47a <count_ticks+0xca>
     3d1:	8b 45 10             	mov    0x10(%ebp),%eax
     3d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     3db:	8d 78 04             	lea    0x4(%eax),%edi
     3de:	8b 45 14             	mov    0x14(%ebp),%eax
     3e1:	83 c0 04             	add    $0x4,%eax
     3e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
     3e7:	89 f6                	mov    %esi,%esi
     3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        int before_index = find_index_of_pid(before->pids, before->num_processes, pids[i]);
     3f0:	8b 55 10             	mov    0x10(%ebp),%edx
     3f3:	8b 45 0c             	mov    0xc(%ebp),%eax
     3f6:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
     3f9:	8b 12                	mov    (%edx),%edx
     3fb:	8b 04 98             	mov    (%eax,%ebx,4),%eax
    for (int i = 0; i < list_size; ++i) {
     3fe:	85 d2                	test   %edx,%edx
     400:	7e 1a                	jle    41c <count_ticks+0x6c>
        if (list[i] == pid)
     402:	8b 5d 10             	mov    0x10(%ebp),%ebx
    for (int i = 0; i < list_size; ++i) {
     405:	31 c9                	xor    %ecx,%ecx
        if (list[i] == pid)
     407:	3b 43 04             	cmp    0x4(%ebx),%eax
     40a:	75 09                	jne    415 <count_ticks+0x65>
     40c:	eb 13                	jmp    421 <count_ticks+0x71>
     40e:	66 90                	xchg   %ax,%ax
     410:	3b 04 8f             	cmp    (%edi,%ecx,4),%eax
     413:	74 0c                	je     421 <count_ticks+0x71>
    for (int i = 0; i < list_size; ++i) {
     415:	83 c1 01             	add    $0x1,%ecx
     418:	39 ca                	cmp    %ecx,%edx
     41a:	75 f4                	jne    410 <count_ticks+0x60>
    return -1;
     41c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
        int after_index = find_index_of_pid(after->pids, after->num_processes, pids[i]);
     421:	8b 5d 14             	mov    0x14(%ebp),%ebx
     424:	8b 13                	mov    (%ebx),%edx
    for (int i = 0; i < list_size; ++i) {
     426:	85 d2                	test   %edx,%edx
     428:	7e 22                	jle    44c <count_ticks+0x9c>
        if (list[i] == pid)
     42a:	3b 43 04             	cmp    0x4(%ebx),%eax
    for (int i = 0; i < list_size; ++i) {
     42d:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (list[i] == pid)
     432:	74 57                	je     48b <count_ticks+0xdb>
     434:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     437:	8b 4d d8             	mov    -0x28(%ebp),%ecx
     43a:	eb 09                	jmp    445 <count_ticks+0x95>
     43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     440:	3b 04 99             	cmp    (%ecx,%ebx,4),%eax
     443:	74 43                	je     488 <count_ticks+0xd8>
    for (int i = 0; i < list_size; ++i) {
     445:	83 c3 01             	add    $0x1,%ebx
     448:	39 da                	cmp    %ebx,%edx
     44a:	75 f4                	jne    440 <count_ticks+0x90>
    test->total_tests++;
     44c:	83 46 04 01          	addl   $0x1,0x4(%esi)
     450:	89 f0                	mov    %esi,%eax
     452:	ba ec 12 00 00       	mov    $0x12ec,%edx
     457:	e8 a4 fc ff ff       	call   100 <check.part.1>
            test->actual_ticks[i] = -99999; // obviously bogus count that will fail checks later
     45c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     45f:	c7 84 86 10 01 00 00 	movl   $0xfffe7961,0x110(%esi,%eax,4)
     466:	61 79 fe ff 
    for (int i = 0; i < test->num_children; ++i) {
     46a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     46e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     471:	39 46 0c             	cmp    %eax,0xc(%esi)
     474:	0f 8f 76 ff ff ff    	jg     3f0 <count_ticks+0x40>
}
     47a:	83 c4 1c             	add    $0x1c,%esp
     47d:	5b                   	pop    %ebx
     47e:	5e                   	pop    %esi
     47f:	5f                   	pop    %edi
     480:	5d                   	pop    %ebp
     481:	c3                   	ret    
     482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     488:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    test->total_tests++;
     48b:	8b 46 04             	mov    0x4(%esi),%eax
    if (!passed_p) {
     48e:	85 c9                	test   %ecx,%ecx
    test->total_tests++;
     490:	8d 50 01             	lea    0x1(%eax),%edx
     493:	89 56 04             	mov    %edx,0x4(%esi)
    if (!passed_p) {
     496:	78 b8                	js     450 <count_ticks+0xa0>
                  test->tickets[i] == before->tickets[before_index] &&
     498:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     49b:	83 c0 02             	add    $0x2,%eax
     49e:	89 45 dc             	mov    %eax,-0x24(%ebp)
     4a1:	8b 54 96 10          	mov    0x10(%esi,%edx,4),%edx
     4a5:	89 55 e0             	mov    %edx,-0x20(%ebp)
     4a8:	8b 55 10             	mov    0x10(%ebp),%edx
     4ab:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
            check(test,
     4ae:	8b 55 e0             	mov    -0x20(%ebp),%edx
     4b1:	3b 91 04 02 00 00    	cmp    0x204(%ecx),%edx
     4b7:	74 47                	je     500 <count_ticks+0x150>
    test->total_tests++;
     4b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
     4bc:	ba 24 13 00 00       	mov    $0x1324,%edx
     4c1:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     4c4:	89 46 04             	mov    %eax,0x4(%esi)
     4c7:	89 f0                	mov    %esi,%eax
     4c9:	e8 32 fc ff ff       	call   100 <check.part.1>
     4ce:	8b 4d e0             	mov    -0x20(%ebp),%ecx
            test->actual_ticks[i] = after->ticks[after_index] - before->ticks[before_index];
     4d1:	8b 45 14             	mov    0x14(%ebp),%eax
     4d4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     4d7:	8b 84 98 04 01 00 00 	mov    0x104(%eax,%ebx,4),%eax
     4de:	2b 81 04 01 00 00    	sub    0x104(%ecx),%eax
     4e4:	89 84 96 10 01 00 00 	mov    %eax,0x110(%esi,%edx,4)
            test->total_actual_ticks += test->actual_ticks[i];
     4eb:	01 86 90 01 00 00    	add    %eax,0x190(%esi)
     4f1:	e9 74 ff ff ff       	jmp    46a <count_ticks+0xba>
     4f6:	8d 76 00             	lea    0x0(%esi),%esi
     4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            check(test,
     500:	8b 55 14             	mov    0x14(%ebp),%edx
     503:	8b 45 e0             	mov    -0x20(%ebp),%eax
     506:	3b 84 9a 04 02 00 00 	cmp    0x204(%edx,%ebx,4),%eax
     50d:	75 aa                	jne    4b9 <count_ticks+0x109>
    test->total_tests++;
     50f:	8b 45 dc             	mov    -0x24(%ebp),%eax
     512:	89 46 04             	mov    %eax,0x4(%esi)
     515:	eb ba                	jmp    4d1 <count_ticks+0x121>
     517:	89 f6                	mov    %esi,%esi
     519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000520 <dump_test_timings>:
void dump_test_timings(struct test_case *test) {
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	56                   	push   %esi
     524:	53                   	push   %ebx
     525:	8b 75 08             	mov    0x8(%ebp),%esi
    printf(1, "-----------------------------------------\n");
     528:	83 ec 08             	sub    $0x8,%esp
     52b:	68 54 13 00 00       	push   $0x1354
     530:	6a 01                	push   $0x1
     532:	e8 d9 08 00 00       	call   e10 <printf>
    printf(1, "%s expected ticks ratios and observations\n", test->name);
     537:	83 c4 0c             	add    $0xc,%esp
     53a:	ff 36                	pushl  (%esi)
     53c:	68 80 13 00 00       	push   $0x1380
     541:	6a 01                	push   $0x1
     543:	e8 c8 08 00 00       	call   e10 <printf>
    printf(1, "#\texpect\tobserve\t(description)\n");
     548:	59                   	pop    %ecx
     549:	5b                   	pop    %ebx
     54a:	68 ac 13 00 00       	push   $0x13ac
     54f:	6a 01                	push   $0x1
     551:	e8 ba 08 00 00       	call   e10 <printf>
    for (int i = 0; i < test->num_children; ++i) {
     556:	8b 46 0c             	mov    0xc(%esi),%eax
     559:	83 c4 10             	add    $0x10,%esp
     55c:	85 c0                	test   %eax,%eax
     55e:	7e 77                	jle    5d7 <dump_test_timings+0xb7>
     560:	31 db                	xor    %ebx,%ebx
     562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (test->functions[i] == yield_forever) {
     568:	8b 94 9e 94 01 00 00 	mov    0x194(%esi,%ebx,4),%edx
            assigned_function = "yield_forever";
     56f:	b8 4f 17 00 00       	mov    $0x174f,%eax
        if (test->functions[i] == yield_forever) {
     574:	81 fa 90 00 00 00    	cmp    $0x90,%edx
     57a:	74 2d                	je     5a9 <dump_test_timings+0x89>
        } else if (test->functions[i] == run_forever) {
     57c:	81 fa 80 00 00 00    	cmp    $0x80,%edx
            assigned_function = "run_forever";
     582:	b8 5d 17 00 00       	mov    $0x175d,%eax
        } else if (test->functions[i] == run_forever) {
     587:	74 20                	je     5a9 <dump_test_timings+0x89>
        } else if (test->functions[i] == iowait_forever) {
     589:	81 fa b0 00 00 00    	cmp    $0xb0,%edx
            assigned_function = "iowait_forever";
     58f:	b8 69 17 00 00       	mov    $0x1769,%eax
        } else if (test->functions[i] == iowait_forever) {
     594:	74 13                	je     5a9 <dump_test_timings+0x89>
            assigned_function = "exit_fast";
     596:	81 fa f0 00 00 00    	cmp    $0xf0,%edx
     59c:	b8 78 17 00 00       	mov    $0x1778,%eax
     5a1:	ba 82 17 00 00       	mov    $0x1782,%edx
     5a6:	0f 44 c2             	cmove  %edx,%eax
        printf(1, "%d\t%d\t%d\t(assigned %d tickets; running %s)\n",
     5a9:	83 ec 04             	sub    $0x4,%esp
     5ac:	50                   	push   %eax
     5ad:	ff 74 9e 10          	pushl  0x10(%esi,%ebx,4)
     5b1:	ff b4 9e 10 01 00 00 	pushl  0x110(%esi,%ebx,4)
     5b8:	ff b4 9e 90 00 00 00 	pushl  0x90(%esi,%ebx,4)
     5bf:	53                   	push   %ebx
     5c0:	68 cc 13 00 00       	push   $0x13cc
    for (int i = 0; i < test->num_children; ++i) {
     5c5:	83 c3 01             	add    $0x1,%ebx
        printf(1, "%d\t%d\t%d\t(assigned %d tickets; running %s)\n",
     5c8:	6a 01                	push   $0x1
     5ca:	e8 41 08 00 00       	call   e10 <printf>
    for (int i = 0; i < test->num_children; ++i) {
     5cf:	83 c4 20             	add    $0x20,%esp
     5d2:	39 5e 0c             	cmp    %ebx,0xc(%esi)
     5d5:	7f 91                	jg     568 <dump_test_timings+0x48>
    printf(1, "\nNOTE: the 'expect' values above represent the expected\n"
     5d7:	83 ec 08             	sub    $0x8,%esp
     5da:	68 f8 13 00 00       	push   $0x13f8
     5df:	6a 01                	push   $0x1
     5e1:	e8 2a 08 00 00       	call   e10 <printf>
    printf(1, "-----------------------------------------\n");
     5e6:	58                   	pop    %eax
     5e7:	5a                   	pop    %edx
     5e8:	68 54 13 00 00       	push   $0x1354
     5ed:	6a 01                	push   $0x1
     5ef:	e8 1c 08 00 00       	call   e10 <printf>
}
     5f4:	83 c4 10             	add    $0x10,%esp
     5f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5fa:	5b                   	pop    %ebx
     5fb:	5e                   	pop    %esi
     5fc:	5d                   	pop    %ebp
     5fd:	c3                   	ret    
     5fe:	66 90                	xchg   %ax,%ax

00000600 <compare_ticks_chi_squared>:
int compare_ticks_chi_squared(struct test_case *test) {
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	57                   	push   %edi
     604:	56                   	push   %esi
     605:	53                   	push   %ebx
        return 1;
     606:	bb 01 00 00 00       	mov    $0x1,%ebx
int compare_ticks_chi_squared(struct test_case *test) {
     60b:	83 ec 3c             	sub    $0x3c,%esp
    if (test->num_children < 2) {
     60e:	8b 45 08             	mov    0x8(%ebp),%eax
     611:	8b 40 0c             	mov    0xc(%eax),%eax
     614:	83 f8 01             	cmp    $0x1,%eax
     617:	89 45 c0             	mov    %eax,-0x40(%ebp)
     61a:	0f 8e 61 01 00 00    	jle    781 <compare_ticks_chi_squared+0x181>
     620:	8b 5d 08             	mov    0x8(%ebp),%ebx
    long long expect_ticks_total = 0;
     623:	31 f6                	xor    %esi,%esi
     625:	31 ff                	xor    %edi,%edi
     627:	89 f2                	mov    %esi,%edx
     629:	81 c3 90 00 00 00    	add    $0x90,%ebx
     62f:	8d 0c 83             	lea    (%ebx,%eax,4),%ecx
    if (test->num_children < 2) {
     632:	89 d8                	mov    %ebx,%eax
    long long expect_ticks_total = 0;
     634:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
     637:	89 f9                	mov    %edi,%ecx
     639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        expect_ticks_total += test->expect_ticks_unscaled[i];
     640:	8b 30                	mov    (%eax),%esi
     642:	89 f7                	mov    %esi,%edi
     644:	c1 ff 1f             	sar    $0x1f,%edi
     647:	01 f2                	add    %esi,%edx
     649:	11 f9                	adc    %edi,%ecx
     64b:	83 c0 04             	add    $0x4,%eax
    for (int i = 0; i < test->num_children; ++i) {
     64e:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
     651:	75 ed                	jne    640 <compare_ticks_chi_squared+0x40>
     653:	89 45 e0             	mov    %eax,-0x20(%ebp)
                             * test->total_actual_ticks;
     656:	8b 45 08             	mov    0x8(%ebp),%eax
     659:	89 55 c8             	mov    %edx,-0x38(%ebp)
     65c:	89 4d cc             	mov    %ecx,-0x34(%ebp)
    int skipped = 0;
     65f:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    long long delta = 0;
     666:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
                             * test->total_actual_ticks;
     66d:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    long long delta = 0;
     673:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
     67a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
                             * test->total_actual_ticks;
     67d:	89 45 bc             	mov    %eax,-0x44(%ebp)
     680:	89 45 d0             	mov    %eax,-0x30(%ebp)
     683:	c1 f8 1f             	sar    $0x1f,%eax
     686:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     689:	eb 54                	jmp    6df <compare_ticks_chi_squared+0xdf>
     68b:	90                   	nop
     68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        long long cur_delta = scaled_expected - (test->actual_ticks[i] << FIXED_POINT_COUNT);
     690:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        if (scaled_expected > 0) {
     693:	83 ff 00             	cmp    $0x0,%edi
        long long cur_delta = scaled_expected - (test->actual_ticks[i] << FIXED_POINT_COUNT);
     696:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
        if (scaled_expected > 0) {
     69c:	0f 8c f7 00 00 00    	jl     799 <compare_ticks_chi_squared+0x199>
     6a2:	0f 8e e8 00 00 00    	jle    790 <compare_ticks_chi_squared+0x190>
        long long cur_delta = scaled_expected - (test->actual_ticks[i] << FIXED_POINT_COUNT);
     6a8:	c1 e0 0a             	shl    $0xa,%eax
     6ab:	89 f1                	mov    %esi,%ecx
     6ad:	89 fb                	mov    %edi,%ebx
     6af:	99                   	cltd   
     6b0:	29 c1                	sub    %eax,%ecx
            cur_delta /= scaled_expected;
     6b2:	57                   	push   %edi
        long long cur_delta = scaled_expected - (test->actual_ticks[i] << FIXED_POINT_COUNT);
     6b3:	19 d3                	sbb    %edx,%ebx
     6b5:	89 c8                	mov    %ecx,%eax
            cur_delta /= scaled_expected;
     6b7:	56                   	push   %esi
        cur_delta *= cur_delta;
     6b8:	89 d9                	mov    %ebx,%ecx
     6ba:	0f af c8             	imul   %eax,%ecx
     6bd:	f7 e0                	mul    %eax
     6bf:	01 c9                	add    %ecx,%ecx
     6c1:	01 ca                	add    %ecx,%edx
            cur_delta /= scaled_expected;
     6c3:	52                   	push   %edx
     6c4:	50                   	push   %eax
     6c5:	e8 a6 0a 00 00       	call   1170 <__divdi3>
     6ca:	83 c4 10             	add    $0x10,%esp
        delta += cur_delta;
     6cd:	01 45 d8             	add    %eax,-0x28(%ebp)
     6d0:	11 55 dc             	adc    %edx,-0x24(%ebp)
     6d3:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
     6d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    for (int i = 0; i < test->num_children; ++i) {
     6da:	39 45 e0             	cmp    %eax,-0x20(%ebp)
     6dd:	74 4d                	je     72c <compare_ticks_chi_squared+0x12c>
        long long scaled_expected = (test->expect_ticks_unscaled[i] << FIXED_POINT_COUNT) / expect_ticks_total
     6df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6e2:	8b 00                	mov    (%eax),%eax
     6e4:	ff 75 cc             	pushl  -0x34(%ebp)
     6e7:	ff 75 c8             	pushl  -0x38(%ebp)
     6ea:	c1 e0 0a             	shl    $0xa,%eax
     6ed:	99                   	cltd   
     6ee:	52                   	push   %edx
     6ef:	50                   	push   %eax
     6f0:	e8 7b 0a 00 00       	call   1170 <__divdi3>
     6f5:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     6f8:	8b 75 d0             	mov    -0x30(%ebp),%esi
     6fb:	89 c3                	mov    %eax,%ebx
     6fd:	89 d8                	mov    %ebx,%eax
     6ff:	83 c4 10             	add    $0x10,%esp
     702:	89 f9                	mov    %edi,%ecx
     704:	0f af d6             	imul   %esi,%edx
     707:	0f af cb             	imul   %ebx,%ecx
     70a:	01 d1                	add    %edx,%ecx
     70c:	f7 e6                	mul    %esi
     70e:	01 d1                	add    %edx,%ecx
     710:	89 c6                	mov    %eax,%esi
     712:	89 cf                	mov    %ecx,%edi
        if (scaled_expected == 0) {
     714:	09 c1                	or     %eax,%ecx
     716:	0f 85 74 ff ff ff    	jne    690 <compare_ticks_chi_squared+0x90>
     71c:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
            ++skipped;
     720:	83 45 c4 01          	addl   $0x1,-0x3c(%ebp)
     724:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    for (int i = 0; i < test->num_children; ++i) {
     727:	39 45 e0             	cmp    %eax,-0x20(%ebp)
     72a:	75 b3                	jne    6df <compare_ticks_chi_squared+0xdf>
    int degrees_of_freedom = test->num_children - 1 - skipped;
     72c:	8b 45 c0             	mov    -0x40(%ebp),%eax
     72f:	2b 45 c4             	sub    -0x3c(%ebp),%eax
    int passed_threshold = delta < expected_value;
     732:	bb 01 00 00 00       	mov    $0x1,%ebx
     737:	8b 7d dc             	mov    -0x24(%ebp),%edi
     73a:	8b 75 d8             	mov    -0x28(%ebp),%esi
    long long expected_value = chi_squared_thresholds[degrees_of_freedom - 1];
     73d:	83 e8 02             	sub    $0x2,%eax
     740:	8b 14 c5 44 18 00 00 	mov    0x1844(,%eax,8),%edx
     747:	8b 0c c5 40 18 00 00 	mov    0x1840(,%eax,8),%ecx
    int passed_threshold = delta < expected_value;
     74e:	39 d7                	cmp    %edx,%edi
     750:	0f 8d 9a 00 00 00    	jge    7f0 <compare_ticks_chi_squared+0x1f0>
    test->total_tests++;
     756:	8b 45 08             	mov    0x8(%ebp),%eax
     759:	8b 7d 08             	mov    0x8(%ebp),%edi
    if (!passed_p) {
     75c:	8b 75 d8             	mov    -0x28(%ebp),%esi
    test->total_tests++;
     75f:	8b 40 04             	mov    0x4(%eax),%eax
     762:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     765:	83 c0 01             	add    $0x1,%eax
     768:	89 47 04             	mov    %eax,0x4(%edi)
    if (!passed_p) {
     76b:	8b 7d dc             	mov    -0x24(%ebp),%edi
     76e:	39 d7                	cmp    %edx,%edi
     770:	7d 36                	jge    7a8 <compare_ticks_chi_squared+0x1a8>
    test->total_tests++;
     772:	83 c0 01             	add    $0x1,%eax
    if (!passed_p) {
     775:	83 7d bc 0a          	cmpl   $0xa,-0x44(%ebp)
    test->total_tests++;
     779:	8b 7d 08             	mov    0x8(%ebp),%edi
     77c:	89 47 04             	mov    %eax,0x4(%edi)
    if (!passed_p) {
     77f:	7e 7f                	jle    800 <compare_ticks_chi_squared+0x200>
}
     781:	8d 65 f4             	lea    -0xc(%ebp),%esp
     784:	89 d8                	mov    %ebx,%eax
     786:	5b                   	pop    %ebx
     787:	5e                   	pop    %esi
     788:	5f                   	pop    %edi
     789:	5d                   	pop    %ebp
     78a:	c3                   	ret    
     78b:	90                   	nop
     78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (scaled_expected > 0) {
     790:	83 fe 00             	cmp    $0x0,%esi
     793:	0f 87 0f ff ff ff    	ja     6a8 <compare_ticks_chi_squared+0xa8>
            cur_delta = FIXED_POINT_BASE * 100000LL;
     799:	b8 00 80 1a 06       	mov    $0x61a8000,%eax
     79e:	31 d2                	xor    %edx,%edx
     7a0:	e9 28 ff ff ff       	jmp    6cd <compare_ticks_chi_squared+0xcd>
     7a5:	8d 76 00             	lea    0x0(%esi),%esi
    if (!passed_p) {
     7a8:	7e 76                	jle    820 <compare_ticks_chi_squared+0x220>
     7aa:	8b 45 08             	mov    0x8(%ebp),%eax
     7ad:	ba e0 14 00 00       	mov    $0x14e0,%edx
     7b2:	e8 49 f9 ff ff       	call   100 <check.part.1>
        dump_test_timings(test);
     7b7:	83 ec 0c             	sub    $0xc,%esp
     7ba:	ff 75 08             	pushl  0x8(%ebp)
     7bd:	e8 5e fd ff ff       	call   520 <dump_test_timings>
     7c2:	8b 45 08             	mov    0x8(%ebp),%eax
     7c5:	83 c4 10             	add    $0x10,%esp
    test->total_tests++;
     7c8:	8b 7d 08             	mov    0x8(%ebp),%edi
     7cb:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
     7d1:	89 45 bc             	mov    %eax,-0x44(%ebp)
     7d4:	8b 45 08             	mov    0x8(%ebp),%eax
     7d7:	8b 40 04             	mov    0x4(%eax),%eax
     7da:	83 c0 01             	add    $0x1,%eax
    if (!passed_p) {
     7dd:	83 7d bc 0a          	cmpl   $0xa,-0x44(%ebp)
    test->total_tests++;
     7e1:	89 47 04             	mov    %eax,0x4(%edi)
    if (!passed_p) {
     7e4:	7f 9b                	jg     781 <compare_ticks_chi_squared+0x181>
     7e6:	eb 18                	jmp    800 <compare_ticks_chi_squared+0x200>
     7e8:	90                   	nop
     7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    int passed_threshold = delta < expected_value;
     7f0:	7e 3e                	jle    830 <compare_ticks_chi_squared+0x230>
     7f2:	31 db                	xor    %ebx,%ebx
     7f4:	e9 5d ff ff ff       	jmp    756 <compare_ticks_chi_squared+0x156>
     7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     800:	89 f8                	mov    %edi,%eax
     802:	ba 30 15 00 00       	mov    $0x1530,%edx
     807:	e8 f4 f8 ff ff       	call   100 <check.part.1>
}
     80c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     80f:	89 d8                	mov    %ebx,%eax
     811:	5b                   	pop    %ebx
     812:	5e                   	pop    %esi
     813:	5f                   	pop    %edi
     814:	5d                   	pop    %ebp
     815:	c3                   	ret    
     816:	8d 76 00             	lea    0x0(%esi),%esi
     819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (!passed_p) {
     820:	39 ce                	cmp    %ecx,%esi
     822:	0f 82 4a ff ff ff    	jb     772 <compare_ticks_chi_squared+0x172>
     828:	eb 80                	jmp    7aa <compare_ticks_chi_squared+0x1aa>
     82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int passed_threshold = delta < expected_value;
     830:	39 ce                	cmp    %ecx,%esi
     832:	0f 82 1e ff ff ff    	jb     756 <compare_ticks_chi_squared+0x156>
     838:	eb b8                	jmp    7f2 <compare_ticks_chi_squared+0x1f2>
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000840 <compare_ticks_naive>:
void compare_ticks_naive(struct test_case *test) {
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	57                   	push   %edi
     844:	56                   	push   %esi
     845:	53                   	push   %ebx
     846:	83 ec 2c             	sub    $0x2c,%esp
     849:	8b 75 08             	mov    0x8(%ebp),%esi
    if (test->num_children < 2) {
     84c:	8b 46 0c             	mov    0xc(%esi),%eax
void compare_ticks_naive(struct test_case *test) {
     84f:	89 75 cc             	mov    %esi,-0x34(%ebp)
    if (test->num_children < 2) {
     852:	83 f8 01             	cmp    $0x1,%eax
     855:	0f 8e ed 00 00 00    	jle    948 <compare_ticks_naive+0x108>
     85b:	8d be 90 00 00 00    	lea    0x90(%esi),%edi
     861:	8d 14 87             	lea    (%edi,%eax,4),%edx
     864:	89 fb                	mov    %edi,%ebx
    int expect_ticks_total = 0;
     866:	31 c0                	xor    %eax,%eax
     868:	90                   	nop
     869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        expect_ticks_total += test->expect_ticks_unscaled[i];
     870:	03 03                	add    (%ebx),%eax
     872:	83 c3 04             	add    $0x4,%ebx
    for (int i = 0; i < test->num_children; ++i) {
     875:	39 da                	cmp    %ebx,%edx
     877:	75 f7                	jne    870 <compare_ticks_naive+0x30>
        long long scaled_expected = ((long long) test->expect_ticks_unscaled[i] * test->total_actual_ticks) / expect_ticks_total;
     879:	8b 4d cc             	mov    -0x34(%ebp),%ecx
     87c:	89 45 d8             	mov    %eax,-0x28(%ebp)
     87f:	c1 f8 1f             	sar    $0x1f,%eax
     882:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int failed_any = 0;
     885:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
        int max_expected = scaled_expected * 11 / 10 + 10;
     88c:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
        long long scaled_expected = ((long long) test->expect_ticks_unscaled[i] * test->total_actual_ticks) / expect_ticks_total;
     88f:	8b 89 90 01 00 00    	mov    0x190(%ecx),%ecx
     895:	89 4d e0             	mov    %ecx,-0x20(%ebp)
     898:	90                   	nop
     899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     8a3:	f7 2f                	imull  (%edi)
     8a5:	ff 75 dc             	pushl  -0x24(%ebp)
     8a8:	ff 75 d8             	pushl  -0x28(%ebp)
     8ab:	52                   	push   %edx
     8ac:	50                   	push   %eax
     8ad:	e8 be 08 00 00       	call   1170 <__divdi3>
     8b2:	89 c3                	mov    %eax,%ebx
        int in_range = (test->actual_ticks[i] >= min_expected && test->actual_ticks[i] <= max_expected);
     8b4:	8b 87 80 00 00 00    	mov    0x80(%edi),%eax
        long long scaled_expected = ((long long) test->expect_ticks_unscaled[i] * test->total_actual_ticks) / expect_ticks_total;
     8ba:	89 d6                	mov    %edx,%esi
        int max_expected = scaled_expected * 11 / 10 + 10;
     8bc:	6b ca 0b             	imul   $0xb,%edx,%ecx
        long long scaled_expected = ((long long) test->expect_ticks_unscaled[i] * test->total_actual_ticks) / expect_ticks_total;
     8bf:	83 c4 10             	add    $0x10,%esp
        int max_expected = scaled_expected * 11 / 10 + 10;
     8c2:	6a 00                	push   $0x0
     8c4:	6a 0a                	push   $0xa
        int in_range = (test->actual_ticks[i] >= min_expected && test->actual_ticks[i] <= max_expected);
     8c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        int max_expected = scaled_expected * 11 / 10 + 10;
     8c9:	b8 0b 00 00 00       	mov    $0xb,%eax
     8ce:	f7 e3                	mul    %ebx
     8d0:	01 ca                	add    %ecx,%edx
     8d2:	52                   	push   %edx
     8d3:	50                   	push   %eax
     8d4:	e8 97 08 00 00       	call   1170 <__divdi3>
     8d9:	83 c4 10             	add    $0x10,%esp
     8dc:	83 c0 0a             	add    $0xa,%eax
        int in_range = (test->actual_ticks[i] >= min_expected && test->actual_ticks[i] <= max_expected);
     8df:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
     8e2:	7f 22                	jg     906 <compare_ticks_naive+0xc6>
        int min_expected = scaled_expected * 9 / 10 - 10;
     8e4:	b8 09 00 00 00       	mov    $0x9,%eax
     8e9:	8d 34 f6             	lea    (%esi,%esi,8),%esi
     8ec:	6a 00                	push   $0x0
     8ee:	f7 e3                	mul    %ebx
     8f0:	6a 0a                	push   $0xa
     8f2:	01 f2                	add    %esi,%edx
     8f4:	52                   	push   %edx
     8f5:	50                   	push   %eax
     8f6:	e8 75 08 00 00       	call   1170 <__divdi3>
     8fb:	83 c4 10             	add    $0x10,%esp
     8fe:	83 e8 0a             	sub    $0xa,%eax
        int in_range = (test->actual_ticks[i] >= min_expected && test->actual_ticks[i] <= max_expected);
     901:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
     904:	7d 07                	jge    90d <compare_ticks_naive+0xcd>
            failed_any = 1;
     906:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
     90d:	83 c7 04             	add    $0x4,%edi
    for (int i = 0; i < test->num_children; ++i) {
     910:	39 7d d4             	cmp    %edi,-0x2c(%ebp)
     913:	75 8b                	jne    8a0 <compare_ticks_naive+0x60>
    test->total_tests++;
     915:	8b 45 cc             	mov    -0x34(%ebp),%eax
    if (!passed_p) {
     918:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    test->total_tests++;
     91b:	83 40 04 01          	addl   $0x1,0x4(%eax)
    if (!passed_p) {
     91f:	85 c9                	test   %ecx,%ecx
     921:	75 2d                	jne    950 <compare_ticks_naive+0x110>
        printf(1, "*** %s failed chi-squared test, but was w/in 10% of expected\n", test->name);
     923:	8b 45 cc             	mov    -0x34(%ebp),%eax
     926:	83 ec 04             	sub    $0x4,%esp
     929:	ff 30                	pushl  (%eax)
     92b:	68 98 15 00 00       	push   $0x1598
     930:	6a 01                	push   $0x1
     932:	e8 d9 04 00 00       	call   e10 <printf>
        printf(1, "*** a likely cause is bias in random number generation\n");
     937:	58                   	pop    %eax
     938:	5a                   	pop    %edx
     939:	68 d8 15 00 00       	push   $0x15d8
     93e:	6a 01                	push   $0x1
     940:	e8 cb 04 00 00       	call   e10 <printf>
     945:	83 c4 10             	add    $0x10,%esp
}
     948:	8d 65 f4             	lea    -0xc(%ebp),%esp
     94b:	5b                   	pop    %ebx
     94c:	5e                   	pop    %esi
     94d:	5f                   	pop    %edi
     94e:	5d                   	pop    %ebp
     94f:	c3                   	ret    
     950:	8d 65 f4             	lea    -0xc(%ebp),%esp
     953:	ba 64 15 00 00       	mov    $0x1564,%edx
     958:	5b                   	pop    %ebx
     959:	5e                   	pop    %esi
     95a:	5f                   	pop    %edi
     95b:	5d                   	pop    %ebp
     95c:	e9 9f f7 ff ff       	jmp    100 <check.part.1>
     961:	eb 0d                	jmp    970 <run_test_case>
     963:	90                   	nop
     964:	90                   	nop
     965:	90                   	nop
     966:	90                   	nop
     967:	90                   	nop
     968:	90                   	nop
     969:	90                   	nop
     96a:	90                   	nop
     96b:	90                   	nop
     96c:	90                   	nop
     96d:	90                   	nop
     96e:	90                   	nop
     96f:	90                   	nop

00000970 <run_test_case>:
void run_test_case(struct test_case* test) {
     970:	55                   	push   %ebp
     971:	89 e5                	mov    %esp,%ebp
     973:	57                   	push   %edi
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
    execute_and_get_info(test, pids, &before, &after);
     976:	8d 85 60 f9 ff ff    	lea    -0x6a0(%ebp),%eax
     97c:	8d bd e4 fc ff ff    	lea    -0x31c(%ebp),%edi
     982:	8d b5 e0 f9 ff ff    	lea    -0x620(%ebp),%esi
void run_test_case(struct test_case* test) {
     988:	81 ec 9c 06 00 00    	sub    $0x69c,%esp
     98e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    test->total_tests = test->errors = 0;
     991:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
     998:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    execute_and_get_info(test, pids, &before, &after);
     99f:	57                   	push   %edi
     9a0:	56                   	push   %esi
     9a1:	50                   	push   %eax
     9a2:	53                   	push   %ebx
     9a3:	e8 18 f9 ff ff       	call   2c0 <execute_and_get_info>
          before.num_processes < NPROC && after.num_processes < NPROC &&
     9a8:	8b 95 e0 f9 ff ff    	mov    -0x620(%ebp),%edx
    check(test, 
     9ae:	83 c4 10             	add    $0x10,%esp
     9b1:	83 fa 3f             	cmp    $0x3f,%edx
     9b4:	7f 72                	jg     a28 <run_test_case+0xb8>
          before.num_processes < NPROC && after.num_processes < NPROC &&
     9b6:	8b 8d e4 fc ff ff    	mov    -0x31c(%ebp),%ecx
     9bc:	8b 43 04             	mov    0x4(%ebx),%eax
     9bf:	83 c0 01             	add    $0x1,%eax
     9c2:	83 f9 3f             	cmp    $0x3f,%ecx
     9c5:	7e 69                	jle    a30 <run_test_case+0xc0>
    test->total_tests++;
     9c7:	89 43 04             	mov    %eax,0x4(%ebx)
     9ca:	ba 10 16 00 00       	mov    $0x1610,%edx
     9cf:	89 d8                	mov    %ebx,%eax
     9d1:	e8 2a f7 ff ff       	call   100 <check.part.1>
    count_ticks(test, pids, &before, &after);
     9d6:	8d 85 60 f9 ff ff    	lea    -0x6a0(%ebp),%eax
     9dc:	57                   	push   %edi
     9dd:	56                   	push   %esi
     9de:	50                   	push   %eax
     9df:	53                   	push   %ebx
     9e0:	e8 cb f9 ff ff       	call   3b0 <count_ticks>
    if (!compare_ticks_chi_squared(test)) {
     9e5:	89 1c 24             	mov    %ebx,(%esp)
     9e8:	e8 13 fc ff ff       	call   600 <compare_ticks_chi_squared>
     9ed:	83 c4 10             	add    $0x10,%esp
     9f0:	85 c0                	test   %eax,%eax
     9f2:	75 0c                	jne    a00 <run_test_case+0x90>
        compare_ticks_naive(test);
     9f4:	83 ec 0c             	sub    $0xc,%esp
     9f7:	53                   	push   %ebx
     9f8:	e8 43 fe ff ff       	call   840 <compare_ticks_naive>
     9fd:	83 c4 10             	add    $0x10,%esp
    printf(1, "%s: passed %d of %d\n", test->name, test->total_tests - test->errors, test->total_tests);
     a00:	8b 43 04             	mov    0x4(%ebx),%eax
     a03:	83 ec 0c             	sub    $0xc,%esp
     a06:	50                   	push   %eax
     a07:	2b 43 08             	sub    0x8(%ebx),%eax
     a0a:	50                   	push   %eax
     a0b:	ff 33                	pushl  (%ebx)
     a0d:	68 8c 17 00 00       	push   $0x178c
     a12:	6a 01                	push   $0x1
     a14:	e8 f7 03 00 00       	call   e10 <printf>
}
     a19:	83 c4 20             	add    $0x20,%esp
     a1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a1f:	5b                   	pop    %ebx
     a20:	5e                   	pop    %esi
     a21:	5f                   	pop    %edi
     a22:	5d                   	pop    %ebp
     a23:	c3                   	ret    
     a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a28:	8b 43 04             	mov    0x4(%ebx),%eax
     a2b:	83 c0 01             	add    $0x1,%eax
     a2e:	eb 97                	jmp    9c7 <run_test_case+0x57>
    check(test, 
     a30:	39 ca                	cmp    %ecx,%edx
     a32:	0f 4f d1             	cmovg  %ecx,%edx
     a35:	39 53 0c             	cmp    %edx,0xc(%ebx)
     a38:	7d 8d                	jge    9c7 <run_test_case+0x57>
    test->total_tests++;
     a3a:	89 43 04             	mov    %eax,0x4(%ebx)
     a3d:	eb 97                	jmp    9d6 <run_test_case+0x66>
     a3f:	90                   	nop

00000a40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	53                   	push   %ebx
     a44:	8b 45 08             	mov    0x8(%ebp),%eax
     a47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a4a:	89 c2                	mov    %eax,%edx
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a50:	83 c1 01             	add    $0x1,%ecx
     a53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     a57:	83 c2 01             	add    $0x1,%edx
     a5a:	84 db                	test   %bl,%bl
     a5c:	88 5a ff             	mov    %bl,-0x1(%edx)
     a5f:	75 ef                	jne    a50 <strcpy+0x10>
    ;
  return os;
}
     a61:	5b                   	pop    %ebx
     a62:	5d                   	pop    %ebp
     a63:	c3                   	ret    
     a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	53                   	push   %ebx
     a74:	8b 55 08             	mov    0x8(%ebp),%edx
     a77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     a7a:	0f b6 02             	movzbl (%edx),%eax
     a7d:	0f b6 19             	movzbl (%ecx),%ebx
     a80:	84 c0                	test   %al,%al
     a82:	75 1c                	jne    aa0 <strcmp+0x30>
     a84:	eb 2a                	jmp    ab0 <strcmp+0x40>
     a86:	8d 76 00             	lea    0x0(%esi),%esi
     a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     a90:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     a93:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     a96:	83 c1 01             	add    $0x1,%ecx
     a99:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
     a9c:	84 c0                	test   %al,%al
     a9e:	74 10                	je     ab0 <strcmp+0x40>
     aa0:	38 d8                	cmp    %bl,%al
     aa2:	74 ec                	je     a90 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     aa4:	29 d8                	sub    %ebx,%eax
}
     aa6:	5b                   	pop    %ebx
     aa7:	5d                   	pop    %ebp
     aa8:	c3                   	ret    
     aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ab0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     ab2:	29 d8                	sub    %ebx,%eax
}
     ab4:	5b                   	pop    %ebx
     ab5:	5d                   	pop    %ebp
     ab6:	c3                   	ret    
     ab7:	89 f6                	mov    %esi,%esi
     ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ac0 <strlen>:

uint
strlen(char *s)
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ac6:	80 39 00             	cmpb   $0x0,(%ecx)
     ac9:	74 15                	je     ae0 <strlen+0x20>
     acb:	31 d2                	xor    %edx,%edx
     acd:	8d 76 00             	lea    0x0(%esi),%esi
     ad0:	83 c2 01             	add    $0x1,%edx
     ad3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ad7:	89 d0                	mov    %edx,%eax
     ad9:	75 f5                	jne    ad0 <strlen+0x10>
    ;
  return n;
}
     adb:	5d                   	pop    %ebp
     adc:	c3                   	ret    
     add:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
     ae0:	31 c0                	xor    %eax,%eax
}
     ae2:	5d                   	pop    %ebp
     ae3:	c3                   	ret    
     ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000af0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     af7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     afa:	8b 45 0c             	mov    0xc(%ebp),%eax
     afd:	89 d7                	mov    %edx,%edi
     aff:	fc                   	cld    
     b00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b02:	89 d0                	mov    %edx,%eax
     b04:	5f                   	pop    %edi
     b05:	5d                   	pop    %ebp
     b06:	c3                   	ret    
     b07:	89 f6                	mov    %esi,%esi
     b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <strchr>:

char*
strchr(const char *s, char c)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	53                   	push   %ebx
     b14:	8b 45 08             	mov    0x8(%ebp),%eax
     b17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     b1a:	0f b6 10             	movzbl (%eax),%edx
     b1d:	84 d2                	test   %dl,%dl
     b1f:	74 1d                	je     b3e <strchr+0x2e>
    if(*s == c)
     b21:	38 d3                	cmp    %dl,%bl
     b23:	89 d9                	mov    %ebx,%ecx
     b25:	75 0d                	jne    b34 <strchr+0x24>
     b27:	eb 17                	jmp    b40 <strchr+0x30>
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b30:	38 ca                	cmp    %cl,%dl
     b32:	74 0c                	je     b40 <strchr+0x30>
  for(; *s; s++)
     b34:	83 c0 01             	add    $0x1,%eax
     b37:	0f b6 10             	movzbl (%eax),%edx
     b3a:	84 d2                	test   %dl,%dl
     b3c:	75 f2                	jne    b30 <strchr+0x20>
      return (char*)s;
  return 0;
     b3e:	31 c0                	xor    %eax,%eax
}
     b40:	5b                   	pop    %ebx
     b41:	5d                   	pop    %ebp
     b42:	c3                   	ret    
     b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <gets>:

char*
gets(char *buf, int max)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	57                   	push   %edi
     b54:	56                   	push   %esi
     b55:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b56:	31 f6                	xor    %esi,%esi
     b58:	89 f3                	mov    %esi,%ebx
{
     b5a:	83 ec 1c             	sub    $0x1c,%esp
     b5d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     b60:	eb 2f                	jmp    b91 <gets+0x41>
     b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     b68:	8d 45 e7             	lea    -0x19(%ebp),%eax
     b6b:	83 ec 04             	sub    $0x4,%esp
     b6e:	6a 01                	push   $0x1
     b70:	50                   	push   %eax
     b71:	6a 00                	push   $0x0
     b73:	e8 32 01 00 00       	call   caa <read>
    if(cc < 1)
     b78:	83 c4 10             	add    $0x10,%esp
     b7b:	85 c0                	test   %eax,%eax
     b7d:	7e 1c                	jle    b9b <gets+0x4b>
      break;
    buf[i++] = c;
     b7f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b83:	83 c7 01             	add    $0x1,%edi
     b86:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     b89:	3c 0a                	cmp    $0xa,%al
     b8b:	74 23                	je     bb0 <gets+0x60>
     b8d:	3c 0d                	cmp    $0xd,%al
     b8f:	74 1f                	je     bb0 <gets+0x60>
  for(i=0; i+1 < max; ){
     b91:	83 c3 01             	add    $0x1,%ebx
     b94:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b97:	89 fe                	mov    %edi,%esi
     b99:	7c cd                	jl     b68 <gets+0x18>
     b9b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     ba0:	c6 03 00             	movb   $0x0,(%ebx)
}
     ba3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba6:	5b                   	pop    %ebx
     ba7:	5e                   	pop    %esi
     ba8:	5f                   	pop    %edi
     ba9:	5d                   	pop    %ebp
     baa:	c3                   	ret    
     bab:	90                   	nop
     bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bb0:	8b 75 08             	mov    0x8(%ebp),%esi
     bb3:	8b 45 08             	mov    0x8(%ebp),%eax
     bb6:	01 de                	add    %ebx,%esi
     bb8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     bba:	c6 03 00             	movb   $0x0,(%ebx)
}
     bbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bc0:	5b                   	pop    %ebx
     bc1:	5e                   	pop    %esi
     bc2:	5f                   	pop    %edi
     bc3:	5d                   	pop    %ebp
     bc4:	c3                   	ret    
     bc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bd0 <stat>:

int
stat(char *n, struct stat *st)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	56                   	push   %esi
     bd4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     bd5:	83 ec 08             	sub    $0x8,%esp
     bd8:	6a 00                	push   $0x0
     bda:	ff 75 08             	pushl  0x8(%ebp)
     bdd:	e8 f0 00 00 00       	call   cd2 <open>
  if(fd < 0)
     be2:	83 c4 10             	add    $0x10,%esp
     be5:	85 c0                	test   %eax,%eax
     be7:	78 27                	js     c10 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     be9:	83 ec 08             	sub    $0x8,%esp
     bec:	ff 75 0c             	pushl  0xc(%ebp)
     bef:	89 c3                	mov    %eax,%ebx
     bf1:	50                   	push   %eax
     bf2:	e8 f3 00 00 00       	call   cea <fstat>
  close(fd);
     bf7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     bfa:	89 c6                	mov    %eax,%esi
  close(fd);
     bfc:	e8 b9 00 00 00       	call   cba <close>
  return r;
     c01:	83 c4 10             	add    $0x10,%esp
}
     c04:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c07:	89 f0                	mov    %esi,%eax
     c09:	5b                   	pop    %ebx
     c0a:	5e                   	pop    %esi
     c0b:	5d                   	pop    %ebp
     c0c:	c3                   	ret    
     c0d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     c10:	be ff ff ff ff       	mov    $0xffffffff,%esi
     c15:	eb ed                	jmp    c04 <stat+0x34>
     c17:	89 f6                	mov    %esi,%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c20 <atoi>:

int
atoi(const char *s)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	53                   	push   %ebx
     c24:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c27:	0f be 11             	movsbl (%ecx),%edx
     c2a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c2d:	3c 09                	cmp    $0x9,%al
  n = 0;
     c2f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     c34:	77 1f                	ja     c55 <atoi+0x35>
     c36:	8d 76 00             	lea    0x0(%esi),%esi
     c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     c40:	8d 04 80             	lea    (%eax,%eax,4),%eax
     c43:	83 c1 01             	add    $0x1,%ecx
     c46:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     c4a:	0f be 11             	movsbl (%ecx),%edx
     c4d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     c50:	80 fb 09             	cmp    $0x9,%bl
     c53:	76 eb                	jbe    c40 <atoi+0x20>
  return n;
}
     c55:	5b                   	pop    %ebx
     c56:	5d                   	pop    %ebp
     c57:	c3                   	ret    
     c58:	90                   	nop
     c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	56                   	push   %esi
     c64:	53                   	push   %ebx
     c65:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c68:	8b 45 08             	mov    0x8(%ebp),%eax
     c6b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c6e:	85 db                	test   %ebx,%ebx
     c70:	7e 14                	jle    c86 <memmove+0x26>
     c72:	31 d2                	xor    %edx,%edx
     c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     c78:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     c7c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c7f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     c82:	39 d3                	cmp    %edx,%ebx
     c84:	75 f2                	jne    c78 <memmove+0x18>
  return vdst;
}
     c86:	5b                   	pop    %ebx
     c87:	5e                   	pop    %esi
     c88:	5d                   	pop    %ebp
     c89:	c3                   	ret    

00000c8a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c8a:	b8 01 00 00 00       	mov    $0x1,%eax
     c8f:	cd 40                	int    $0x40
     c91:	c3                   	ret    

00000c92 <exit>:
SYSCALL(exit)
     c92:	b8 02 00 00 00       	mov    $0x2,%eax
     c97:	cd 40                	int    $0x40
     c99:	c3                   	ret    

00000c9a <wait>:
SYSCALL(wait)
     c9a:	b8 03 00 00 00       	mov    $0x3,%eax
     c9f:	cd 40                	int    $0x40
     ca1:	c3                   	ret    

00000ca2 <pipe>:
SYSCALL(pipe)
     ca2:	b8 04 00 00 00       	mov    $0x4,%eax
     ca7:	cd 40                	int    $0x40
     ca9:	c3                   	ret    

00000caa <read>:
SYSCALL(read)
     caa:	b8 05 00 00 00       	mov    $0x5,%eax
     caf:	cd 40                	int    $0x40
     cb1:	c3                   	ret    

00000cb2 <write>:
SYSCALL(write)
     cb2:	b8 10 00 00 00       	mov    $0x10,%eax
     cb7:	cd 40                	int    $0x40
     cb9:	c3                   	ret    

00000cba <close>:
SYSCALL(close)
     cba:	b8 15 00 00 00       	mov    $0x15,%eax
     cbf:	cd 40                	int    $0x40
     cc1:	c3                   	ret    

00000cc2 <kill>:
SYSCALL(kill)
     cc2:	b8 06 00 00 00       	mov    $0x6,%eax
     cc7:	cd 40                	int    $0x40
     cc9:	c3                   	ret    

00000cca <exec>:
SYSCALL(exec)
     cca:	b8 07 00 00 00       	mov    $0x7,%eax
     ccf:	cd 40                	int    $0x40
     cd1:	c3                   	ret    

00000cd2 <open>:
SYSCALL(open)
     cd2:	b8 0f 00 00 00       	mov    $0xf,%eax
     cd7:	cd 40                	int    $0x40
     cd9:	c3                   	ret    

00000cda <mknod>:
SYSCALL(mknod)
     cda:	b8 11 00 00 00       	mov    $0x11,%eax
     cdf:	cd 40                	int    $0x40
     ce1:	c3                   	ret    

00000ce2 <unlink>:
SYSCALL(unlink)
     ce2:	b8 12 00 00 00       	mov    $0x12,%eax
     ce7:	cd 40                	int    $0x40
     ce9:	c3                   	ret    

00000cea <fstat>:
SYSCALL(fstat)
     cea:	b8 08 00 00 00       	mov    $0x8,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <link>:
SYSCALL(link)
     cf2:	b8 13 00 00 00       	mov    $0x13,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <mkdir>:
SYSCALL(mkdir)
     cfa:	b8 14 00 00 00       	mov    $0x14,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <chdir>:
SYSCALL(chdir)
     d02:	b8 09 00 00 00       	mov    $0x9,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <dup>:
SYSCALL(dup)
     d0a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <getpid>:
SYSCALL(getpid)
     d12:	b8 0b 00 00 00       	mov    $0xb,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <sbrk>:
SYSCALL(sbrk)
     d1a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <sleep>:
SYSCALL(sleep)
     d22:	b8 0d 00 00 00       	mov    $0xd,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <uptime>:
SYSCALL(uptime)
     d2a:	b8 0e 00 00 00       	mov    $0xe,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <yield>:
SYSCALL(yield)
     d32:	b8 16 00 00 00       	mov    $0x16,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <shutdown>:
SYSCALL(shutdown)
     d3a:	b8 17 00 00 00       	mov    $0x17,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <writecount>:
SYSCALL(writecount)
     d42:	b8 18 00 00 00       	mov    $0x18,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <settickets>:
SYSCALL(settickets)
     d4a:	b8 19 00 00 00       	mov    $0x19,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
     d52:	b8 1a 00 00 00       	mov    $0x1a,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <dumppagetable>:
     d5a:	b8 1b 00 00 00       	mov    $0x1b,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    
     d62:	66 90                	xchg   %ax,%ax
     d64:	66 90                	xchg   %ax,%ax
     d66:	66 90                	xchg   %ax,%ax
     d68:	66 90                	xchg   %ax,%ax
     d6a:	66 90                	xchg   %ax,%ax
     d6c:	66 90                	xchg   %ax,%ax
     d6e:	66 90                	xchg   %ax,%ax

00000d70 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     d79:	85 d2                	test   %edx,%edx
{
     d7b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
     d7e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
     d80:	79 76                	jns    df8 <printint+0x88>
     d82:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     d86:	74 70                	je     df8 <printint+0x88>
    x = -xx;
     d88:	f7 d8                	neg    %eax
    neg = 1;
     d8a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     d91:	31 f6                	xor    %esi,%esi
     d93:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     d96:	eb 0a                	jmp    da2 <printint+0x32>
     d98:	90                   	nop
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
     da0:	89 fe                	mov    %edi,%esi
     da2:	31 d2                	xor    %edx,%edx
     da4:	8d 7e 01             	lea    0x1(%esi),%edi
     da7:	f7 f1                	div    %ecx
     da9:	0f b6 92 98 18 00 00 	movzbl 0x1898(%edx),%edx
  }while((x /= base) != 0);
     db0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     db2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
     db5:	75 e9                	jne    da0 <printint+0x30>
  if(neg)
     db7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     dba:	85 c0                	test   %eax,%eax
     dbc:	74 08                	je     dc6 <printint+0x56>
    buf[i++] = '-';
     dbe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
     dc3:	8d 7e 02             	lea    0x2(%esi),%edi
     dc6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
     dca:	8b 7d c0             	mov    -0x40(%ebp),%edi
     dcd:	8d 76 00             	lea    0x0(%esi),%esi
     dd0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
     dd3:	83 ec 04             	sub    $0x4,%esp
     dd6:	83 ee 01             	sub    $0x1,%esi
     dd9:	6a 01                	push   $0x1
     ddb:	53                   	push   %ebx
     ddc:	57                   	push   %edi
     ddd:	88 45 d7             	mov    %al,-0x29(%ebp)
     de0:	e8 cd fe ff ff       	call   cb2 <write>

  while(--i >= 0)
     de5:	83 c4 10             	add    $0x10,%esp
     de8:	39 de                	cmp    %ebx,%esi
     dea:	75 e4                	jne    dd0 <printint+0x60>
    putc(fd, buf[i]);
}
     dec:	8d 65 f4             	lea    -0xc(%ebp),%esp
     def:	5b                   	pop    %ebx
     df0:	5e                   	pop    %esi
     df1:	5f                   	pop    %edi
     df2:	5d                   	pop    %ebp
     df3:	c3                   	ret    
     df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     df8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     dff:	eb 90                	jmp    d91 <printint+0x21>
     e01:	eb 0d                	jmp    e10 <printf>
     e03:	90                   	nop
     e04:	90                   	nop
     e05:	90                   	nop
     e06:	90                   	nop
     e07:	90                   	nop
     e08:	90                   	nop
     e09:	90                   	nop
     e0a:	90                   	nop
     e0b:	90                   	nop
     e0c:	90                   	nop
     e0d:	90                   	nop
     e0e:	90                   	nop
     e0f:	90                   	nop

00000e10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	57                   	push   %edi
     e14:	56                   	push   %esi
     e15:	53                   	push   %ebx
     e16:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e19:	8b 75 0c             	mov    0xc(%ebp),%esi
     e1c:	0f b6 1e             	movzbl (%esi),%ebx
     e1f:	84 db                	test   %bl,%bl
     e21:	0f 84 b3 00 00 00    	je     eda <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
     e27:	8d 45 10             	lea    0x10(%ebp),%eax
     e2a:	83 c6 01             	add    $0x1,%esi
  state = 0;
     e2d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
     e2f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     e32:	eb 2f                	jmp    e63 <printf+0x53>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e38:	83 f8 25             	cmp    $0x25,%eax
     e3b:	0f 84 a7 00 00 00    	je     ee8 <printf+0xd8>
  write(fd, &c, 1);
     e41:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     e44:	83 ec 04             	sub    $0x4,%esp
     e47:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     e4a:	6a 01                	push   $0x1
     e4c:	50                   	push   %eax
     e4d:	ff 75 08             	pushl  0x8(%ebp)
     e50:	e8 5d fe ff ff       	call   cb2 <write>
     e55:	83 c4 10             	add    $0x10,%esp
     e58:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
     e5b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     e5f:	84 db                	test   %bl,%bl
     e61:	74 77                	je     eda <printf+0xca>
    if(state == 0){
     e63:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
     e65:	0f be cb             	movsbl %bl,%ecx
     e68:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     e6b:	74 cb                	je     e38 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     e6d:	83 ff 25             	cmp    $0x25,%edi
     e70:	75 e6                	jne    e58 <printf+0x48>
      if(c == 'd'){
     e72:	83 f8 64             	cmp    $0x64,%eax
     e75:	0f 84 05 01 00 00    	je     f80 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     e7b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     e81:	83 f9 70             	cmp    $0x70,%ecx
     e84:	74 72                	je     ef8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     e86:	83 f8 73             	cmp    $0x73,%eax
     e89:	0f 84 99 00 00 00    	je     f28 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     e8f:	83 f8 63             	cmp    $0x63,%eax
     e92:	0f 84 08 01 00 00    	je     fa0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     e98:	83 f8 25             	cmp    $0x25,%eax
     e9b:	0f 84 ef 00 00 00    	je     f90 <printf+0x180>
  write(fd, &c, 1);
     ea1:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ea4:	83 ec 04             	sub    $0x4,%esp
     ea7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     eab:	6a 01                	push   $0x1
     ead:	50                   	push   %eax
     eae:	ff 75 08             	pushl  0x8(%ebp)
     eb1:	e8 fc fd ff ff       	call   cb2 <write>
     eb6:	83 c4 0c             	add    $0xc,%esp
     eb9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     ebc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     ebf:	6a 01                	push   $0x1
     ec1:	50                   	push   %eax
     ec2:	ff 75 08             	pushl  0x8(%ebp)
     ec5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     ec8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
     eca:	e8 e3 fd ff ff       	call   cb2 <write>
  for(i = 0; fmt[i]; i++){
     ecf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
     ed3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     ed6:	84 db                	test   %bl,%bl
     ed8:	75 89                	jne    e63 <printf+0x53>
    }
  }
}
     eda:	8d 65 f4             	lea    -0xc(%ebp),%esp
     edd:	5b                   	pop    %ebx
     ede:	5e                   	pop    %esi
     edf:	5f                   	pop    %edi
     ee0:	5d                   	pop    %ebp
     ee1:	c3                   	ret    
     ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
     ee8:	bf 25 00 00 00       	mov    $0x25,%edi
     eed:	e9 66 ff ff ff       	jmp    e58 <printf+0x48>
     ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     ef8:	83 ec 0c             	sub    $0xc,%esp
     efb:	b9 10 00 00 00       	mov    $0x10,%ecx
     f00:	6a 00                	push   $0x0
     f02:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     f05:	8b 45 08             	mov    0x8(%ebp),%eax
     f08:	8b 17                	mov    (%edi),%edx
     f0a:	e8 61 fe ff ff       	call   d70 <printint>
        ap++;
     f0f:	89 f8                	mov    %edi,%eax
     f11:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f14:	31 ff                	xor    %edi,%edi
        ap++;
     f16:	83 c0 04             	add    $0x4,%eax
     f19:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     f1c:	e9 37 ff ff ff       	jmp    e58 <printf+0x48>
     f21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     f28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     f2b:	8b 08                	mov    (%eax),%ecx
        ap++;
     f2d:	83 c0 04             	add    $0x4,%eax
     f30:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
     f33:	85 c9                	test   %ecx,%ecx
     f35:	0f 84 8e 00 00 00    	je     fc9 <printf+0x1b9>
        while(*s != 0){
     f3b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
     f3e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
     f40:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
     f42:	84 c0                	test   %al,%al
     f44:	0f 84 0e ff ff ff    	je     e58 <printf+0x48>
     f4a:	89 75 d0             	mov    %esi,-0x30(%ebp)
     f4d:	89 de                	mov    %ebx,%esi
     f4f:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f52:	8d 7d e3             	lea    -0x1d(%ebp),%edi
     f55:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     f58:	83 ec 04             	sub    $0x4,%esp
          s++;
     f5b:	83 c6 01             	add    $0x1,%esi
     f5e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
     f61:	6a 01                	push   $0x1
     f63:	57                   	push   %edi
     f64:	53                   	push   %ebx
     f65:	e8 48 fd ff ff       	call   cb2 <write>
        while(*s != 0){
     f6a:	0f b6 06             	movzbl (%esi),%eax
     f6d:	83 c4 10             	add    $0x10,%esp
     f70:	84 c0                	test   %al,%al
     f72:	75 e4                	jne    f58 <printf+0x148>
     f74:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
     f77:	31 ff                	xor    %edi,%edi
     f79:	e9 da fe ff ff       	jmp    e58 <printf+0x48>
     f7e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
     f80:	83 ec 0c             	sub    $0xc,%esp
     f83:	b9 0a 00 00 00       	mov    $0xa,%ecx
     f88:	6a 01                	push   $0x1
     f8a:	e9 73 ff ff ff       	jmp    f02 <printf+0xf2>
     f8f:	90                   	nop
  write(fd, &c, 1);
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     f96:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     f99:	6a 01                	push   $0x1
     f9b:	e9 21 ff ff ff       	jmp    ec1 <printf+0xb1>
        putc(fd, *ap);
     fa0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
     fa3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     fa6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
     fa8:	6a 01                	push   $0x1
        ap++;
     faa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
     fad:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
     fb0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     fb3:	50                   	push   %eax
     fb4:	ff 75 08             	pushl  0x8(%ebp)
     fb7:	e8 f6 fc ff ff       	call   cb2 <write>
        ap++;
     fbc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
     fbf:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fc2:	31 ff                	xor    %edi,%edi
     fc4:	e9 8f fe ff ff       	jmp    e58 <printf+0x48>
          s = "(null)";
     fc9:	bb 90 18 00 00       	mov    $0x1890,%ebx
        while(*s != 0){
     fce:	b8 28 00 00 00       	mov    $0x28,%eax
     fd3:	e9 72 ff ff ff       	jmp    f4a <printf+0x13a>
     fd8:	66 90                	xchg   %ax,%ax
     fda:	66 90                	xchg   %ax,%ax
     fdc:	66 90                	xchg   %ax,%ax
     fde:	66 90                	xchg   %ax,%ax

00000fe0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fe0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fe1:	a1 f0 36 00 00       	mov    0x36f0,%eax
{
     fe6:	89 e5                	mov    %esp,%ebp
     fe8:	57                   	push   %edi
     fe9:	56                   	push   %esi
     fea:	53                   	push   %ebx
     feb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     fee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
     ff1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ff8:	39 c8                	cmp    %ecx,%eax
     ffa:	8b 10                	mov    (%eax),%edx
     ffc:	73 32                	jae    1030 <free+0x50>
     ffe:	39 d1                	cmp    %edx,%ecx
    1000:	72 04                	jb     1006 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1002:	39 d0                	cmp    %edx,%eax
    1004:	72 32                	jb     1038 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1006:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1009:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    100c:	39 fa                	cmp    %edi,%edx
    100e:	74 30                	je     1040 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1010:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1013:	8b 50 04             	mov    0x4(%eax),%edx
    1016:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1019:	39 f1                	cmp    %esi,%ecx
    101b:	74 3a                	je     1057 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    101d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    101f:	a3 f0 36 00 00       	mov    %eax,0x36f0
}
    1024:	5b                   	pop    %ebx
    1025:	5e                   	pop    %esi
    1026:	5f                   	pop    %edi
    1027:	5d                   	pop    %ebp
    1028:	c3                   	ret    
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1030:	39 d0                	cmp    %edx,%eax
    1032:	72 04                	jb     1038 <free+0x58>
    1034:	39 d1                	cmp    %edx,%ecx
    1036:	72 ce                	jb     1006 <free+0x26>
{
    1038:	89 d0                	mov    %edx,%eax
    103a:	eb bc                	jmp    ff8 <free+0x18>
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1040:	03 72 04             	add    0x4(%edx),%esi
    1043:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1046:	8b 10                	mov    (%eax),%edx
    1048:	8b 12                	mov    (%edx),%edx
    104a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    104d:	8b 50 04             	mov    0x4(%eax),%edx
    1050:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1053:	39 f1                	cmp    %esi,%ecx
    1055:	75 c6                	jne    101d <free+0x3d>
    p->s.size += bp->s.size;
    1057:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    105a:	a3 f0 36 00 00       	mov    %eax,0x36f0
    p->s.size += bp->s.size;
    105f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1062:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1065:	89 10                	mov    %edx,(%eax)
}
    1067:	5b                   	pop    %ebx
    1068:	5e                   	pop    %esi
    1069:	5f                   	pop    %edi
    106a:	5d                   	pop    %ebp
    106b:	c3                   	ret    
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001070 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	57                   	push   %edi
    1074:	56                   	push   %esi
    1075:	53                   	push   %ebx
    1076:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1079:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    107c:	8b 15 f0 36 00 00    	mov    0x36f0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1082:	8d 78 07             	lea    0x7(%eax),%edi
    1085:	c1 ef 03             	shr    $0x3,%edi
    1088:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    108b:	85 d2                	test   %edx,%edx
    108d:	0f 84 9d 00 00 00    	je     1130 <malloc+0xc0>
    1093:	8b 02                	mov    (%edx),%eax
    1095:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1098:	39 cf                	cmp    %ecx,%edi
    109a:	76 6c                	jbe    1108 <malloc+0x98>
    109c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    10a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    10a7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    10aa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    10b1:	eb 0e                	jmp    10c1 <malloc+0x51>
    10b3:	90                   	nop
    10b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    10ba:	8b 48 04             	mov    0x4(%eax),%ecx
    10bd:	39 f9                	cmp    %edi,%ecx
    10bf:	73 47                	jae    1108 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    10c1:	39 05 f0 36 00 00    	cmp    %eax,0x36f0
    10c7:	89 c2                	mov    %eax,%edx
    10c9:	75 ed                	jne    10b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    10cb:	83 ec 0c             	sub    $0xc,%esp
    10ce:	56                   	push   %esi
    10cf:	e8 46 fc ff ff       	call   d1a <sbrk>
  if(p == (char*)-1)
    10d4:	83 c4 10             	add    $0x10,%esp
    10d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    10da:	74 1c                	je     10f8 <malloc+0x88>
  hp->s.size = nu;
    10dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    10df:	83 ec 0c             	sub    $0xc,%esp
    10e2:	83 c0 08             	add    $0x8,%eax
    10e5:	50                   	push   %eax
    10e6:	e8 f5 fe ff ff       	call   fe0 <free>
  return freep;
    10eb:	8b 15 f0 36 00 00    	mov    0x36f0,%edx
      if((p = morecore(nunits)) == 0)
    10f1:	83 c4 10             	add    $0x10,%esp
    10f4:	85 d2                	test   %edx,%edx
    10f6:	75 c0                	jne    10b8 <malloc+0x48>
        return 0;
  }
}
    10f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    10fb:	31 c0                	xor    %eax,%eax
}
    10fd:	5b                   	pop    %ebx
    10fe:	5e                   	pop    %esi
    10ff:	5f                   	pop    %edi
    1100:	5d                   	pop    %ebp
    1101:	c3                   	ret    
    1102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1108:	39 cf                	cmp    %ecx,%edi
    110a:	74 54                	je     1160 <malloc+0xf0>
        p->s.size -= nunits;
    110c:	29 f9                	sub    %edi,%ecx
    110e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1111:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1114:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1117:	89 15 f0 36 00 00    	mov    %edx,0x36f0
}
    111d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1120:	83 c0 08             	add    $0x8,%eax
}
    1123:	5b                   	pop    %ebx
    1124:	5e                   	pop    %esi
    1125:	5f                   	pop    %edi
    1126:	5d                   	pop    %ebp
    1127:	c3                   	ret    
    1128:	90                   	nop
    1129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1130:	c7 05 f0 36 00 00 f4 	movl   $0x36f4,0x36f0
    1137:	36 00 00 
    113a:	c7 05 f4 36 00 00 f4 	movl   $0x36f4,0x36f4
    1141:	36 00 00 
    base.s.size = 0;
    1144:	b8 f4 36 00 00       	mov    $0x36f4,%eax
    1149:	c7 05 f8 36 00 00 00 	movl   $0x0,0x36f8
    1150:	00 00 00 
    1153:	e9 44 ff ff ff       	jmp    109c <malloc+0x2c>
    1158:	90                   	nop
    1159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1160:	8b 08                	mov    (%eax),%ecx
    1162:	89 0a                	mov    %ecx,(%edx)
    1164:	eb b1                	jmp    1117 <malloc+0xa7>
    1166:	66 90                	xchg   %ax,%ax
    1168:	66 90                	xchg   %ax,%ax
    116a:	66 90                	xchg   %ax,%ax
    116c:	66 90                	xchg   %ax,%ax
    116e:	66 90                	xchg   %ax,%ax

00001170 <__divdi3>:
    1170:	55                   	push   %ebp
    1171:	57                   	push   %edi
    1172:	56                   	push   %esi
    1173:	53                   	push   %ebx
    1174:	83 ec 1c             	sub    $0x1c,%esp
    1177:	8b 54 24 34          	mov    0x34(%esp),%edx
    117b:	8b 44 24 30          	mov    0x30(%esp),%eax
    117f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1186:	00 
    1187:	89 d5                	mov    %edx,%ebp
    1189:	89 04 24             	mov    %eax,(%esp)
    118c:	89 54 24 04          	mov    %edx,0x4(%esp)
    1190:	85 ed                	test   %ebp,%ebp
    1192:	8b 44 24 38          	mov    0x38(%esp),%eax
    1196:	8b 54 24 3c          	mov    0x3c(%esp),%edx
    119a:	79 1a                	jns    11b6 <__divdi3+0x46>
    119c:	f7 1c 24             	negl   (%esp)
    119f:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
    11a6:	ff 
    11a7:	83 54 24 04 00       	adcl   $0x0,0x4(%esp)
    11ac:	f7 5c 24 04          	negl   0x4(%esp)
    11b0:	8b 7c 24 04          	mov    0x4(%esp),%edi
    11b4:	89 fd                	mov    %edi,%ebp
    11b6:	85 d2                	test   %edx,%edx
    11b8:	89 d3                	mov    %edx,%ebx
    11ba:	79 0d                	jns    11c9 <__divdi3+0x59>
    11bc:	f7 d8                	neg    %eax
    11be:	f7 54 24 08          	notl   0x8(%esp)
    11c2:	83 d2 00             	adc    $0x0,%edx
    11c5:	f7 da                	neg    %edx
    11c7:	89 d3                	mov    %edx,%ebx
    11c9:	85 db                	test   %ebx,%ebx
    11cb:	89 c7                	mov    %eax,%edi
    11cd:	8b 04 24             	mov    (%esp),%eax
    11d0:	75 0e                	jne    11e0 <__divdi3+0x70>
    11d2:	39 ef                	cmp    %ebp,%edi
    11d4:	76 52                	jbe    1228 <__divdi3+0xb8>
    11d6:	89 ea                	mov    %ebp,%edx
    11d8:	31 f6                	xor    %esi,%esi
    11da:	f7 f7                	div    %edi
    11dc:	89 c1                	mov    %eax,%ecx
    11de:	eb 08                	jmp    11e8 <__divdi3+0x78>
    11e0:	39 eb                	cmp    %ebp,%ebx
    11e2:	76 24                	jbe    1208 <__divdi3+0x98>
    11e4:	31 f6                	xor    %esi,%esi
    11e6:	31 c9                	xor    %ecx,%ecx
    11e8:	89 c8                	mov    %ecx,%eax
    11ea:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    11ee:	89 f2                	mov    %esi,%edx
    11f0:	85 c9                	test   %ecx,%ecx
    11f2:	74 07                	je     11fb <__divdi3+0x8b>
    11f4:	f7 d8                	neg    %eax
    11f6:	83 d2 00             	adc    $0x0,%edx
    11f9:	f7 da                	neg    %edx
    11fb:	83 c4 1c             	add    $0x1c,%esp
    11fe:	5b                   	pop    %ebx
    11ff:	5e                   	pop    %esi
    1200:	5f                   	pop    %edi
    1201:	5d                   	pop    %ebp
    1202:	c3                   	ret    
    1203:	90                   	nop
    1204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1208:	0f bd f3             	bsr    %ebx,%esi
    120b:	83 f6 1f             	xor    $0x1f,%esi
    120e:	75 40                	jne    1250 <__divdi3+0xe0>
    1210:	39 eb                	cmp    %ebp,%ebx
    1212:	72 07                	jb     121b <__divdi3+0xab>
    1214:	31 c9                	xor    %ecx,%ecx
    1216:	3b 3c 24             	cmp    (%esp),%edi
    1219:	77 cd                	ja     11e8 <__divdi3+0x78>
    121b:	b9 01 00 00 00       	mov    $0x1,%ecx
    1220:	eb c6                	jmp    11e8 <__divdi3+0x78>
    1222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1228:	85 ff                	test   %edi,%edi
    122a:	75 0b                	jne    1237 <__divdi3+0xc7>
    122c:	b8 01 00 00 00       	mov    $0x1,%eax
    1231:	31 d2                	xor    %edx,%edx
    1233:	f7 f3                	div    %ebx
    1235:	89 c7                	mov    %eax,%edi
    1237:	31 d2                	xor    %edx,%edx
    1239:	89 e8                	mov    %ebp,%eax
    123b:	f7 f7                	div    %edi
    123d:	89 c6                	mov    %eax,%esi
    123f:	8b 04 24             	mov    (%esp),%eax
    1242:	f7 f7                	div    %edi
    1244:	89 c1                	mov    %eax,%ecx
    1246:	eb a0                	jmp    11e8 <__divdi3+0x78>
    1248:	90                   	nop
    1249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1250:	b8 20 00 00 00       	mov    $0x20,%eax
    1255:	89 f1                	mov    %esi,%ecx
    1257:	89 fa                	mov    %edi,%edx
    1259:	29 f0                	sub    %esi,%eax
    125b:	d3 e3                	shl    %cl,%ebx
    125d:	89 c1                	mov    %eax,%ecx
    125f:	d3 ea                	shr    %cl,%edx
    1261:	89 f1                	mov    %esi,%ecx
    1263:	09 da                	or     %ebx,%edx
    1265:	d3 e7                	shl    %cl,%edi
    1267:	89 eb                	mov    %ebp,%ebx
    1269:	89 c1                	mov    %eax,%ecx
    126b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    126f:	8b 14 24             	mov    (%esp),%edx
    1272:	d3 eb                	shr    %cl,%ebx
    1274:	89 f1                	mov    %esi,%ecx
    1276:	d3 e5                	shl    %cl,%ebp
    1278:	89 c1                	mov    %eax,%ecx
    127a:	d3 ea                	shr    %cl,%edx
    127c:	09 d5                	or     %edx,%ebp
    127e:	89 da                	mov    %ebx,%edx
    1280:	89 e8                	mov    %ebp,%eax
    1282:	f7 74 24 0c          	divl   0xc(%esp)
    1286:	89 d3                	mov    %edx,%ebx
    1288:	89 c5                	mov    %eax,%ebp
    128a:	f7 e7                	mul    %edi
    128c:	39 d3                	cmp    %edx,%ebx
    128e:	72 20                	jb     12b0 <__divdi3+0x140>
    1290:	8b 3c 24             	mov    (%esp),%edi
    1293:	89 f1                	mov    %esi,%ecx
    1295:	d3 e7                	shl    %cl,%edi
    1297:	39 c7                	cmp    %eax,%edi
    1299:	73 04                	jae    129f <__divdi3+0x12f>
    129b:	39 d3                	cmp    %edx,%ebx
    129d:	74 11                	je     12b0 <__divdi3+0x140>
    129f:	89 e9                	mov    %ebp,%ecx
    12a1:	31 f6                	xor    %esi,%esi
    12a3:	e9 40 ff ff ff       	jmp    11e8 <__divdi3+0x78>
    12a8:	90                   	nop
    12a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12b0:	8d 4d ff             	lea    -0x1(%ebp),%ecx
    12b3:	31 f6                	xor    %esi,%esi
    12b5:	e9 2e ff ff ff       	jmp    11e8 <__divdi3+0x78>
