
_timewithtickets:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
            break;
    }
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
  11:	81 ec 28 07 00 00    	sub    $0x728,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 71 04             	mov    0x4(%ecx),%esi
    if (argc < 3) {
  1c:	83 f8 02             	cmp    $0x2,%eax
{
  1f:	89 85 d0 f8 ff ff    	mov    %eax,-0x730(%ebp)
    if (argc < 3) {
  25:	0f 8e 64 01 00 00    	jle    18f <main+0x18f>
                  argv[0]);
        exit();
    }
    int tickets_for[MAX_CHILDREN];
    int active_pids[MAX_CHILDREN];
    int num_seconds = atoi(argv[1]);
  2b:	83 ec 0c             	sub    $0xc,%esp
  2e:	ff 76 04             	pushl  0x4(%esi)
  31:	e8 2a 06 00 00       	call   660 <atoi>
  36:	89 85 cc f8 ff ff    	mov    %eax,-0x734(%ebp)
    int num_children = argc - 2;
  3c:	8b 85 d0 f8 ff ff    	mov    -0x730(%ebp),%eax
    if (num_children > MAX_CHILDREN) {
  42:	83 c4 10             	add    $0x10,%esp
    int num_children = argc - 2;
  45:	83 e8 02             	sub    $0x2,%eax
    if (num_children > MAX_CHILDREN) {
  48:	83 f8 20             	cmp    $0x20,%eax
    int num_children = argc - 2;
  4b:	89 85 d4 f8 ff ff    	mov    %eax,-0x72c(%ebp)
    if (num_children > MAX_CHILDREN) {
  51:	0f 8f 4c 01 00 00    	jg     1a3 <main+0x1a3>
        printf(2, "only up to %d supported\n", MAX_CHILDREN);
        exit();
    }
    /* give us a lot of ticket so we don't get starved */
    settickets(LARGE_TICKET_COUNT);
  57:	83 ec 0c             	sub    $0xc,%esp
    for (int i = 0; i < num_children; ++i) {
  5a:	31 db                	xor    %ebx,%ebx
  5c:	8d bd 60 f9 ff ff    	lea    -0x6a0(%ebp),%edi
    settickets(LARGE_TICKET_COUNT);
  62:	68 a0 86 01 00       	push   $0x186a0
  67:	e8 1e 07 00 00       	call   78a <settickets>
  6c:	89 f0                	mov    %esi,%eax
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 de                	mov    %ebx,%esi
  73:	89 c3                	mov    %eax,%ebx
  75:	8d 76 00             	lea    0x0(%esi),%esi
        int tickets = atoi(argv[i + 2]);
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	ff 74 b3 08          	pushl  0x8(%ebx,%esi,4)
  7f:	e8 dc 05 00 00       	call   660 <atoi>
        tickets_for[i] = tickets;
  84:	89 84 b5 e0 f8 ff ff 	mov    %eax,-0x720(%ebp,%esi,4)
        active_pids[i] = spawn(tickets);
  8b:	89 04 24             	mov    %eax,(%esp)
  8e:	e8 9d 02 00 00       	call   330 <spawn>
    for (int i = 0; i < num_children; ++i) {
  93:	83 c4 10             	add    $0x10,%esp
        active_pids[i] = spawn(tickets);
  96:	89 04 b7             	mov    %eax,(%edi,%esi,4)
    for (int i = 0; i < num_children; ++i) {
  99:	83 c6 01             	add    $0x1,%esi
  9c:	3b b5 d4 f8 ff ff    	cmp    -0x72c(%ebp),%esi
  a2:	75 d4                	jne    78 <main+0x78>
    }
    wait_for_ticket_counts(num_children, active_pids, tickets_for);
  a4:	8d 85 e0 f8 ff ff    	lea    -0x720(%ebp),%eax
  aa:	83 ec 04             	sub    $0x4,%esp
  ad:	89 f3                	mov    %esi,%ebx
  af:	50                   	push   %eax
  b0:	57                   	push   %edi
  b1:	56                   	push   %esi
  b2:	e8 09 03 00 00       	call   3c0 <wait_for_ticket_counts>
    struct processes_info before, after;
    before.num_processes = after.num_processes = -1;
    getprocessesinfo(&before);
  b7:	8d 85 e0 f9 ff ff    	lea    -0x620(%ebp),%eax
    before.num_processes = after.num_processes = -1;
  bd:	c7 85 e4 fc ff ff ff 	movl   $0xffffffff,-0x31c(%ebp)
  c4:	ff ff ff 
  c7:	c7 85 e0 f9 ff ff ff 	movl   $0xffffffff,-0x620(%ebp)
  ce:	ff ff ff 
    getprocessesinfo(&before);
  d1:	89 04 24             	mov    %eax,(%esp)
  d4:	e8 b9 06 00 00       	call   792 <getprocessesinfo>
    sleep(num_seconds);
  d9:	58                   	pop    %eax
  da:	ff b5 cc f8 ff ff    	pushl  -0x734(%ebp)
  e0:	e8 7d 06 00 00       	call   762 <sleep>
    getprocessesinfo(&after);
  e5:	8d 85 e4 fc ff ff    	lea    -0x31c(%ebp),%eax
  eb:	89 04 24             	mov    %eax,(%esp)
  ee:	e8 9f 06 00 00       	call   792 <getprocessesinfo>
  f3:	8b 85 d0 f8 ff ff    	mov    -0x730(%ebp),%eax
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	89 9d d0 f8 ff ff    	mov    %ebx,-0x730(%ebp)
 102:	89 fb                	mov    %edi,%ebx
 104:	8d 84 85 58 f9 ff ff 	lea    -0x6a8(%ebp,%eax,4),%eax
 10b:	89 c6                	mov    %eax,%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
    for (int i = 0; i < num_children; ++i) {
        kill(active_pids[i]);
 110:	83 ec 0c             	sub    $0xc,%esp
 113:	ff 33                	pushl  (%ebx)
 115:	83 c3 04             	add    $0x4,%ebx
 118:	e8 e5 05 00 00       	call   702 <kill>
    for (int i = 0; i < num_children; ++i) {
 11d:	83 c4 10             	add    $0x10,%esp
 120:	39 f3                	cmp    %esi,%ebx
 122:	75 ec                	jne    110 <main+0x110>
 124:	8b 9d d0 f8 ff ff    	mov    -0x730(%ebp),%ebx
    }
    for (int i = 0; i < num_children; ++i) {
 12a:	31 f6                	xor    %esi,%esi
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c6 01             	add    $0x1,%esi
        wait();
 133:	e8 a2 05 00 00       	call   6da <wait>
    for (int i = 0; i < num_children; ++i) {
 138:	39 de                	cmp    %ebx,%esi
 13a:	75 f4                	jne    130 <main+0x130>
    }
    if (before.num_processes >= NPROC || after.num_processes >= NPROC) {
 13c:	8b 85 e0 f9 ff ff    	mov    -0x620(%ebp),%eax
 142:	83 f8 3f             	cmp    $0x3f,%eax
 145:	7f 26                	jg     16d <main+0x16d>
 147:	8b 95 e4 fc ff ff    	mov    -0x31c(%ebp),%edx
 14d:	83 fa 3f             	cmp    $0x3f,%edx
 150:	7f 1b                	jg     16d <main+0x16d>
        printf(2, "getprocessesinfo's num_processes is greater than NPROC before parent slept\n");
        return 1;
    }
    if (before.num_processes < 0 || after.num_processes < 0) {
 152:	85 c0                	test   %eax,%eax
 154:	78 04                	js     15a <main+0x15a>
 156:	85 d2                	test   %edx,%edx
 158:	79 5d                	jns    1b7 <main+0x1b7>
        printf(2, "getprocessesinfo's num_processes is negative -- not changed by syscall?\n");
 15a:	50                   	push   %eax
 15b:	50                   	push   %eax
 15c:	68 f0 0c 00 00       	push   $0xcf0
 161:	6a 02                	push   $0x2
 163:	e8 e8 06 00 00       	call   850 <printf>
        return 1;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb 11                	jmp    17e <main+0x17e>
        printf(2, "getprocessesinfo's num_processes is greater than NPROC before parent slept\n");
 16d:	50                   	push   %eax
 16e:	50                   	push   %eax
 16f:	68 a4 0c 00 00       	push   $0xca4
 174:	6a 02                	push   $0x2
 176:	e8 d5 06 00 00       	call   850 <printf>
        return 1;
 17b:	83 c4 10             	add    $0x10,%esp
            }
            printf(1, "%d\t%d\n", tickets_for[i], after.ticks[after_index] - before.ticks[before_index]);
        }
    }
    exit();
}
 17e:	8d 65 f0             	lea    -0x10(%ebp),%esp
 181:	b8 01 00 00 00       	mov    $0x1,%eax
 186:	59                   	pop    %ecx
 187:	5b                   	pop    %ebx
 188:	5e                   	pop    %esi
 189:	5f                   	pop    %edi
 18a:	5d                   	pop    %ebp
 18b:	8d 61 fc             	lea    -0x4(%ecx),%esp
 18e:	c3                   	ret    
        printf(2, "usage: %s seconds tickets1 tickets2 ... ticketsN\n"
 18f:	51                   	push   %ecx
 190:	ff 36                	pushl  (%esi)
 192:	68 f8 0b 00 00       	push   $0xbf8
 197:	6a 02                	push   $0x2
 199:	e8 b2 06 00 00       	call   850 <printf>
        exit();
 19e:	e8 2f 05 00 00       	call   6d2 <exit>
        printf(2, "only up to %d supported\n", MAX_CHILDREN);
 1a3:	52                   	push   %edx
 1a4:	6a 20                	push   $0x20
 1a6:	68 b7 0b 00 00       	push   $0xbb7
 1ab:	6a 02                	push   $0x2
 1ad:	e8 9e 06 00 00       	call   850 <printf>
        exit();
 1b2:	e8 1b 05 00 00       	call   6d2 <exit>
    printf(1, "TICKETS\tTICKS\n");
 1b7:	50                   	push   %eax
 1b8:	50                   	push   %eax
    for (int i = 0; i < num_children; ++i) {
 1b9:	31 db                	xor    %ebx,%ebx
    printf(1, "TICKETS\tTICKS\n");
 1bb:	68 d0 0b 00 00       	push   $0xbd0
 1c0:	6a 01                	push   $0x1
 1c2:	e8 89 06 00 00       	call   850 <printf>
 1c7:	83 c4 10             	add    $0x10,%esp
        int before_index = find_index_of_pid(before.pids, before.num_processes, active_pids[i]);
 1ca:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
 1cd:	8b 85 e0 f9 ff ff    	mov    -0x620(%ebp),%eax
    for (int i = 0; i < list_size; ++i) {
 1d3:	31 f6                	xor    %esi,%esi
 1d5:	eb 0c                	jmp    1e3 <main+0x1e3>
        if (list[i] == pid)
 1d7:	3b 94 b5 e4 f9 ff ff 	cmp    -0x61c(%ebp,%esi,4),%edx
 1de:	74 0a                	je     1ea <main+0x1ea>
    for (int i = 0; i < list_size; ++i) {
 1e0:	83 c6 01             	add    $0x1,%esi
 1e3:	39 f0                	cmp    %esi,%eax
 1e5:	7f f0                	jg     1d7 <main+0x1d7>
    return -1;
 1e7:	83 ce ff             	or     $0xffffffff,%esi
        int after_index = find_index_of_pid(after.pids, after.num_processes, active_pids[i]);
 1ea:	8b 8d e4 fc ff ff    	mov    -0x31c(%ebp),%ecx
    for (int i = 0; i < list_size; ++i) {
 1f0:	31 c0                	xor    %eax,%eax
 1f2:	eb 0c                	jmp    200 <main+0x200>
        if (list[i] == pid)
 1f4:	3b 94 85 e8 fc ff ff 	cmp    -0x318(%ebp,%eax,4),%edx
 1fb:	74 48                	je     245 <main+0x245>
    for (int i = 0; i < list_size; ++i) {
 1fd:	83 c0 01             	add    $0x1,%eax
 200:	39 c1                	cmp    %eax,%ecx
 202:	7f f0                	jg     1f4 <main+0x1f4>
        if (before_index == -1)
 204:	83 c6 01             	add    $0x1,%esi
 207:	0f 84 db 00 00 00    	je     2e8 <main+0x2e8>
            printf(2, "child %d did not exist for getprocessesinfo after parent slept\n", i);
 20d:	50                   	push   %eax
 20e:	53                   	push   %ebx
 20f:	68 80 0d 00 00       	push   $0xd80
 214:	6a 02                	push   $0x2
 216:	e8 35 06 00 00       	call   850 <printf>
 21b:	83 c4 10             	add    $0x10,%esp
            printf(1, "%d\t--unknown--\n", tickets_for[i]);
 21e:	56                   	push   %esi
 21f:	ff b4 9d e0 f8 ff ff 	pushl  -0x720(%ebp,%ebx,4)
 226:	68 df 0b 00 00       	push   $0xbdf
 22b:	6a 01                	push   $0x1
 22d:	e8 1e 06 00 00       	call   850 <printf>
 232:	83 c4 10             	add    $0x10,%esp
    for (int i = 0; i < num_children; ++i) {
 235:	83 c3 01             	add    $0x1,%ebx
 238:	39 9d d4 f8 ff ff    	cmp    %ebx,-0x72c(%ebp)
 23e:	7f 8a                	jg     1ca <main+0x1ca>
    exit();
 240:	e8 8d 04 00 00       	call   6d2 <exit>
        if (before_index == -1)
 245:	83 fe ff             	cmp    $0xffffffff,%esi
 248:	0f 84 84 00 00 00    	je     2d2 <main+0x2d2>
            if (before.tickets[before_index] != tickets_for[i]) {
 24e:	8b 94 9d e0 f8 ff ff 	mov    -0x720(%ebp,%ebx,4),%edx
 255:	39 94 b5 e4 fb ff ff 	cmp    %edx,-0x41c(%ebp,%esi,4)
 25c:	74 1d                	je     27b <main+0x27b>
                printf(2, "child %d had wrong number of tickets in getprocessinfo before parent slept\n", i);
 25e:	51                   	push   %ecx
 25f:	53                   	push   %ebx
 260:	68 c0 0d 00 00       	push   $0xdc0
 265:	6a 02                	push   $0x2
 267:	89 85 d0 f8 ff ff    	mov    %eax,-0x730(%ebp)
 26d:	e8 de 05 00 00       	call   850 <printf>
 272:	8b 85 d0 f8 ff ff    	mov    -0x730(%ebp),%eax
 278:	83 c4 10             	add    $0x10,%esp
            if (after.tickets[after_index] != tickets_for[i]) {
 27b:	8b 94 9d e0 f8 ff ff 	mov    -0x720(%ebp,%ebx,4),%edx
 282:	39 94 85 e8 fe ff ff 	cmp    %edx,-0x118(%ebp,%eax,4)
 289:	74 1d                	je     2a8 <main+0x2a8>
                printf(2, "child %d had wrong number of tickets in getprocessinfo after parent slept\n", i);
 28b:	52                   	push   %edx
 28c:	53                   	push   %ebx
 28d:	68 0c 0e 00 00       	push   $0xe0c
 292:	6a 02                	push   $0x2
 294:	89 85 d0 f8 ff ff    	mov    %eax,-0x730(%ebp)
 29a:	e8 b1 05 00 00       	call   850 <printf>
 29f:	8b 85 d0 f8 ff ff    	mov    -0x730(%ebp),%eax
 2a5:	83 c4 10             	add    $0x10,%esp
            printf(1, "%d\t%d\n", tickets_for[i], after.ticks[after_index] - before.ticks[before_index]);
 2a8:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 2af:	2b 84 b5 e4 fa ff ff 	sub    -0x51c(%ebp,%esi,4),%eax
 2b6:	50                   	push   %eax
 2b7:	ff b4 9d e0 f8 ff ff 	pushl  -0x720(%ebp,%ebx,4)
 2be:	68 ef 0b 00 00       	push   $0xbef
 2c3:	6a 01                	push   $0x1
 2c5:	e8 86 05 00 00       	call   850 <printf>
 2ca:	83 c4 10             	add    $0x10,%esp
 2cd:	e9 63 ff ff ff       	jmp    235 <main+0x235>
            printf(2, "child %d did not exist for getprocessesinfo before parent slept\n", i);
 2d2:	50                   	push   %eax
 2d3:	53                   	push   %ebx
 2d4:	68 3c 0d 00 00       	push   $0xd3c
 2d9:	6a 02                	push   $0x2
 2db:	e8 70 05 00 00       	call   850 <printf>
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	e9 36 ff ff ff       	jmp    21e <main+0x21e>
 2e8:	50                   	push   %eax
 2e9:	53                   	push   %ebx
 2ea:	68 3c 0d 00 00       	push   $0xd3c
 2ef:	6a 02                	push   $0x2
 2f1:	e8 5a 05 00 00       	call   850 <printf>
 2f6:	83 c4 10             	add    $0x10,%esp
 2f9:	e9 0f ff ff ff       	jmp    20d <main+0x20d>
 2fe:	66 90                	xchg   %ax,%ax

00000300 <yield_forever>:
void yield_forever() {
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 08             	sub    $0x8,%esp
 306:	8d 76 00             	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        yield();
 310:	e8 5d 04 00 00       	call   772 <yield>
 315:	eb f9                	jmp    310 <yield_forever+0x10>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <run_forever>:
void run_forever() {
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
        __asm__("");
 323:	eb fe                	jmp    323 <run_forever+0x3>
 325:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <spawn>:
int spawn(int tickets) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	83 ec 04             	sub    $0x4,%esp
    int pid = fork();
 337:	e8 8e 03 00 00       	call   6ca <fork>
    if (pid == 0) {
 33c:	85 c0                	test   %eax,%eax
 33e:	74 10                	je     350 <spawn+0x20>
    } else if (pid != -1) {
 340:	83 f8 ff             	cmp    $0xffffffff,%eax
 343:	89 c3                	mov    %eax,%ebx
 345:	74 1e                	je     365 <spawn+0x35>
}
 347:	89 d8                	mov    %ebx,%eax
 349:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34c:	c9                   	leave  
 34d:	c3                   	ret    
 34e:	66 90                	xchg   %ax,%ax
        settickets(tickets);
 350:	83 ec 0c             	sub    $0xc,%esp
 353:	ff 75 08             	pushl  0x8(%ebp)
 356:	e8 2f 04 00 00       	call   78a <settickets>
        yield();
 35b:	e8 12 04 00 00       	call   772 <yield>
 360:	83 c4 10             	add    $0x10,%esp
        __asm__("");
 363:	eb fe                	jmp    363 <spawn+0x33>
        printf(2, "error in fork\n");
 365:	50                   	push   %eax
 366:	50                   	push   %eax
 367:	68 a8 0b 00 00       	push   $0xba8
 36c:	6a 02                	push   $0x2
 36e:	e8 dd 04 00 00       	call   850 <printf>
 373:	83 c4 10             	add    $0x10,%esp
 376:	eb cf                	jmp    347 <spawn+0x17>
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000380 <find_index_of_pid>:
int find_index_of_pid(int *list, int list_size, int pid) {
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 0c             	mov    0xc(%ebp),%edx
 387:	8b 4d 08             	mov    0x8(%ebp),%ecx
 38a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    for (int i = 0; i < list_size; ++i) {
 38d:	85 d2                	test   %edx,%edx
 38f:	7e 1b                	jle    3ac <find_index_of_pid+0x2c>
 391:	31 c0                	xor    %eax,%eax
        if (list[i] == pid)
 393:	3b 19                	cmp    (%ecx),%ebx
 395:	75 0e                	jne    3a5 <find_index_of_pid+0x25>
 397:	eb 18                	jmp    3b1 <find_index_of_pid+0x31>
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a0:	39 1c 81             	cmp    %ebx,(%ecx,%eax,4)
 3a3:	74 0c                	je     3b1 <find_index_of_pid+0x31>
    for (int i = 0; i < list_size; ++i) {
 3a5:	83 c0 01             	add    $0x1,%eax
 3a8:	39 c2                	cmp    %eax,%edx
 3aa:	75 f4                	jne    3a0 <find_index_of_pid+0x20>
    return -1;
 3ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 3b1:	5b                   	pop    %ebx
 3b2:	5d                   	pop    %ebp
 3b3:	c3                   	ret    
 3b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003c0 <wait_for_ticket_counts>:
void wait_for_ticket_counts(int num_children, int *pids, int *tickets) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	8d bd e4 fc ff ff    	lea    -0x31c(%ebp),%edi
 3cc:	81 ec 2c 03 00 00    	sub    $0x32c,%esp
 3d2:	c7 85 d0 fc ff ff 64 	movl   $0x64,-0x330(%ebp)
 3d9:	00 00 00 
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        yield();
 3e0:	e8 8d 03 00 00       	call   772 <yield>
        getprocessesinfo(&info);
 3e5:	83 ec 0c             	sub    $0xc,%esp
 3e8:	57                   	push   %edi
 3e9:	e8 a4 03 00 00       	call   792 <getprocessesinfo>
        for (int i = 0; i < num_children; ++i) {
 3ee:	8b 45 08             	mov    0x8(%ebp),%eax
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	85 c0                	test   %eax,%eax
 3f6:	7e 78                	jle    470 <wait_for_ticket_counts+0xb0>
        if (list[i] == pid)
 3f8:	8b 85 e8 fc ff ff    	mov    -0x318(%ebp),%eax
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
 3fe:	8b 8d e4 fc ff ff    	mov    -0x31c(%ebp),%ecx
        for (int i = 0; i < num_children; ++i) {
 404:	31 db                	xor    %ebx,%ebx
        int done = 1;
 406:	be 01 00 00 00       	mov    $0x1,%esi
        if (list[i] == pid)
 40b:	89 85 d4 fc ff ff    	mov    %eax,-0x32c(%ebp)
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
 418:	8b 45 0c             	mov    0xc(%ebp),%eax
    for (int i = 0; i < list_size; ++i) {
 41b:	85 c9                	test   %ecx,%ecx
            int index = find_index_of_pid(info.pids, info.num_processes, pids[i]);
 41d:	8b 14 98             	mov    (%eax,%ebx,4),%edx
    for (int i = 0; i < list_size; ++i) {
 420:	7e 1b                	jle    43d <wait_for_ticket_counts+0x7d>
 422:	31 c0                	xor    %eax,%eax
        if (list[i] == pid)
 424:	3b 95 d4 fc ff ff    	cmp    -0x32c(%ebp),%edx
 42a:	75 0a                	jne    436 <wait_for_ticket_counts+0x76>
 42c:	eb 14                	jmp    442 <wait_for_ticket_counts+0x82>
 42e:	66 90                	xchg   %ax,%ax
 430:	3b 54 87 04          	cmp    0x4(%edi,%eax,4),%edx
 434:	74 0c                	je     442 <wait_for_ticket_counts+0x82>
    for (int i = 0; i < list_size; ++i) {
 436:	83 c0 01             	add    $0x1,%eax
 439:	39 c1                	cmp    %eax,%ecx
 43b:	75 f3                	jne    430 <wait_for_ticket_counts+0x70>
    return -1;
 43d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
            if (info.tickets[index] != tickets[i]) done = 0;
 442:	8b 55 10             	mov    0x10(%ebp),%edx
 445:	8b 14 9a             	mov    (%edx,%ebx,4),%edx
 448:	39 94 85 e8 fe ff ff 	cmp    %edx,-0x118(%ebp,%eax,4)
 44f:	b8 00 00 00 00       	mov    $0x0,%eax
 454:	0f 45 f0             	cmovne %eax,%esi
        for (int i = 0; i < num_children; ++i) {
 457:	83 c3 01             	add    $0x1,%ebx
 45a:	39 5d 08             	cmp    %ebx,0x8(%ebp)
 45d:	75 b9                	jne    418 <wait_for_ticket_counts+0x58>
        if (done)
 45f:	85 f6                	test   %esi,%esi
 461:	75 0d                	jne    470 <wait_for_ticket_counts+0xb0>
    for (int yield_count = 0; yield_count < MAX_YIELDS_FOR_SETUP; ++yield_count) {
 463:	83 ad d0 fc ff ff 01 	subl   $0x1,-0x330(%ebp)
 46a:	0f 85 70 ff ff ff    	jne    3e0 <wait_for_ticket_counts+0x20>
}
 470:	8d 65 f4             	lea    -0xc(%ebp),%esp
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5f                   	pop    %edi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
 478:	66 90                	xchg   %ax,%ax
 47a:	66 90                	xchg   %ax,%ax
 47c:	66 90                	xchg   %ax,%ax
 47e:	66 90                	xchg   %ax,%ax

00000480 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 48a:	89 c2                	mov    %eax,%edx
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 490:	83 c1 01             	add    $0x1,%ecx
 493:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 497:	83 c2 01             	add    $0x1,%edx
 49a:	84 db                	test   %bl,%bl
 49c:	88 5a ff             	mov    %bl,-0x1(%edx)
 49f:	75 ef                	jne    490 <strcpy+0x10>
    ;
  return os;
}
 4a1:	5b                   	pop    %ebx
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000004b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	8b 55 08             	mov    0x8(%ebp),%edx
 4b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4ba:	0f b6 02             	movzbl (%edx),%eax
 4bd:	0f b6 19             	movzbl (%ecx),%ebx
 4c0:	84 c0                	test   %al,%al
 4c2:	75 1c                	jne    4e0 <strcmp+0x30>
 4c4:	eb 2a                	jmp    4f0 <strcmp+0x40>
 4c6:	8d 76 00             	lea    0x0(%esi),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 4d0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 4d6:	83 c1 01             	add    $0x1,%ecx
 4d9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 4dc:	84 c0                	test   %al,%al
 4de:	74 10                	je     4f0 <strcmp+0x40>
 4e0:	38 d8                	cmp    %bl,%al
 4e2:	74 ec                	je     4d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 4e4:	29 d8                	sub    %ebx,%eax
}
 4e6:	5b                   	pop    %ebx
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 4f2:	29 d8                	sub    %ebx,%eax
}
 4f4:	5b                   	pop    %ebx
 4f5:	5d                   	pop    %ebp
 4f6:	c3                   	ret    
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000500 <strlen>:

uint
strlen(char *s)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 506:	80 39 00             	cmpb   $0x0,(%ecx)
 509:	74 15                	je     520 <strlen+0x20>
 50b:	31 d2                	xor    %edx,%edx
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	83 c2 01             	add    $0x1,%edx
 513:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 517:	89 d0                	mov    %edx,%eax
 519:	75 f5                	jne    510 <strlen+0x10>
    ;
  return n;
}
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 520:	31 c0                	xor    %eax,%eax
}
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 52a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000530 <memset>:

void*
memset(void *dst, int c, uint n)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 537:	8b 4d 10             	mov    0x10(%ebp),%ecx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	89 d7                	mov    %edx,%edi
 53f:	fc                   	cld    
 540:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 542:	89 d0                	mov    %edx,%eax
 544:	5f                   	pop    %edi
 545:	5d                   	pop    %ebp
 546:	c3                   	ret    
 547:	89 f6                	mov    %esi,%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000550 <strchr>:

char*
strchr(const char *s, char c)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 55a:	0f b6 10             	movzbl (%eax),%edx
 55d:	84 d2                	test   %dl,%dl
 55f:	74 1d                	je     57e <strchr+0x2e>
    if(*s == c)
 561:	38 d3                	cmp    %dl,%bl
 563:	89 d9                	mov    %ebx,%ecx
 565:	75 0d                	jne    574 <strchr+0x24>
 567:	eb 17                	jmp    580 <strchr+0x30>
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 570:	38 ca                	cmp    %cl,%dl
 572:	74 0c                	je     580 <strchr+0x30>
  for(; *s; s++)
 574:	83 c0 01             	add    $0x1,%eax
 577:	0f b6 10             	movzbl (%eax),%edx
 57a:	84 d2                	test   %dl,%dl
 57c:	75 f2                	jne    570 <strchr+0x20>
      return (char*)s;
  return 0;
 57e:	31 c0                	xor    %eax,%eax
}
 580:	5b                   	pop    %ebx
 581:	5d                   	pop    %ebp
 582:	c3                   	ret    
 583:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000590 <gets>:

char*
gets(char *buf, int max)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 596:	31 f6                	xor    %esi,%esi
 598:	89 f3                	mov    %esi,%ebx
{
 59a:	83 ec 1c             	sub    $0x1c,%esp
 59d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 5a0:	eb 2f                	jmp    5d1 <gets+0x41>
 5a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 5a8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	6a 01                	push   $0x1
 5b0:	50                   	push   %eax
 5b1:	6a 00                	push   $0x0
 5b3:	e8 32 01 00 00       	call   6ea <read>
    if(cc < 1)
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	85 c0                	test   %eax,%eax
 5bd:	7e 1c                	jle    5db <gets+0x4b>
      break;
    buf[i++] = c;
 5bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5c3:	83 c7 01             	add    $0x1,%edi
 5c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 5c9:	3c 0a                	cmp    $0xa,%al
 5cb:	74 23                	je     5f0 <gets+0x60>
 5cd:	3c 0d                	cmp    $0xd,%al
 5cf:	74 1f                	je     5f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 5d1:	83 c3 01             	add    $0x1,%ebx
 5d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5d7:	89 fe                	mov    %edi,%esi
 5d9:	7c cd                	jl     5a8 <gets+0x18>
 5db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 5e0:	c6 03 00             	movb   $0x0,(%ebx)
}
 5e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    
 5eb:	90                   	nop
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f0:	8b 75 08             	mov    0x8(%ebp),%esi
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	01 de                	add    %ebx,%esi
 5f8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 5fa:	c6 03 00             	movb   $0x0,(%ebx)
}
 5fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 600:	5b                   	pop    %ebx
 601:	5e                   	pop    %esi
 602:	5f                   	pop    %edi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret    
 605:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000610 <stat>:

int
stat(char *n, struct stat *st)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 615:	83 ec 08             	sub    $0x8,%esp
 618:	6a 00                	push   $0x0
 61a:	ff 75 08             	pushl  0x8(%ebp)
 61d:	e8 f0 00 00 00       	call   712 <open>
  if(fd < 0)
 622:	83 c4 10             	add    $0x10,%esp
 625:	85 c0                	test   %eax,%eax
 627:	78 27                	js     650 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 629:	83 ec 08             	sub    $0x8,%esp
 62c:	ff 75 0c             	pushl  0xc(%ebp)
 62f:	89 c3                	mov    %eax,%ebx
 631:	50                   	push   %eax
 632:	e8 f3 00 00 00       	call   72a <fstat>
  close(fd);
 637:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 63a:	89 c6                	mov    %eax,%esi
  close(fd);
 63c:	e8 b9 00 00 00       	call   6fa <close>
  return r;
 641:	83 c4 10             	add    $0x10,%esp
}
 644:	8d 65 f8             	lea    -0x8(%ebp),%esp
 647:	89 f0                	mov    %esi,%eax
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret    
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 650:	be ff ff ff ff       	mov    $0xffffffff,%esi
 655:	eb ed                	jmp    644 <stat+0x34>
 657:	89 f6                	mov    %esi,%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <atoi>:

int
atoi(const char *s)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 667:	0f be 11             	movsbl (%ecx),%edx
 66a:	8d 42 d0             	lea    -0x30(%edx),%eax
 66d:	3c 09                	cmp    $0x9,%al
  n = 0;
 66f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 674:	77 1f                	ja     695 <atoi+0x35>
 676:	8d 76 00             	lea    0x0(%esi),%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 680:	8d 04 80             	lea    (%eax,%eax,4),%eax
 683:	83 c1 01             	add    $0x1,%ecx
 686:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 68a:	0f be 11             	movsbl (%ecx),%edx
 68d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 690:	80 fb 09             	cmp    $0x9,%bl
 693:	76 eb                	jbe    680 <atoi+0x20>
  return n;
}
 695:	5b                   	pop    %ebx
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ae:	85 db                	test   %ebx,%ebx
 6b0:	7e 14                	jle    6c6 <memmove+0x26>
 6b2:	31 d2                	xor    %edx,%edx
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 6b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 6bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 6bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 6c2:	39 d3                	cmp    %edx,%ebx
 6c4:	75 f2                	jne    6b8 <memmove+0x18>
  return vdst;
}
 6c6:	5b                   	pop    %ebx
 6c7:	5e                   	pop    %esi
 6c8:	5d                   	pop    %ebp
 6c9:	c3                   	ret    

000006ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ca:	b8 01 00 00 00       	mov    $0x1,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <exit>:
SYSCALL(exit)
 6d2:	b8 02 00 00 00       	mov    $0x2,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <wait>:
SYSCALL(wait)
 6da:	b8 03 00 00 00       	mov    $0x3,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <pipe>:
SYSCALL(pipe)
 6e2:	b8 04 00 00 00       	mov    $0x4,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <read>:
SYSCALL(read)
 6ea:	b8 05 00 00 00       	mov    $0x5,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <write>:
SYSCALL(write)
 6f2:	b8 10 00 00 00       	mov    $0x10,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <close>:
SYSCALL(close)
 6fa:	b8 15 00 00 00       	mov    $0x15,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <kill>:
SYSCALL(kill)
 702:	b8 06 00 00 00       	mov    $0x6,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <exec>:
SYSCALL(exec)
 70a:	b8 07 00 00 00       	mov    $0x7,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <open>:
SYSCALL(open)
 712:	b8 0f 00 00 00       	mov    $0xf,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <mknod>:
SYSCALL(mknod)
 71a:	b8 11 00 00 00       	mov    $0x11,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <unlink>:
SYSCALL(unlink)
 722:	b8 12 00 00 00       	mov    $0x12,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <fstat>:
SYSCALL(fstat)
 72a:	b8 08 00 00 00       	mov    $0x8,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <link>:
SYSCALL(link)
 732:	b8 13 00 00 00       	mov    $0x13,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <mkdir>:
SYSCALL(mkdir)
 73a:	b8 14 00 00 00       	mov    $0x14,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <chdir>:
SYSCALL(chdir)
 742:	b8 09 00 00 00       	mov    $0x9,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <dup>:
SYSCALL(dup)
 74a:	b8 0a 00 00 00       	mov    $0xa,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <getpid>:
SYSCALL(getpid)
 752:	b8 0b 00 00 00       	mov    $0xb,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <sbrk>:
SYSCALL(sbrk)
 75a:	b8 0c 00 00 00       	mov    $0xc,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <sleep>:
SYSCALL(sleep)
 762:	b8 0d 00 00 00       	mov    $0xd,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <uptime>:
SYSCALL(uptime)
 76a:	b8 0e 00 00 00       	mov    $0xe,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <yield>:
SYSCALL(yield)
 772:	b8 16 00 00 00       	mov    $0x16,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <shutdown>:
SYSCALL(shutdown)
 77a:	b8 17 00 00 00       	mov    $0x17,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <writecount>:
SYSCALL(writecount)
 782:	b8 18 00 00 00       	mov    $0x18,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <settickets>:
SYSCALL(settickets)
 78a:	b8 19 00 00 00       	mov    $0x19,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
 792:	b8 1a 00 00 00       	mov    $0x1a,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <dumppagetable>:
 79a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    
 7a2:	66 90                	xchg   %ax,%ax
 7a4:	66 90                	xchg   %ax,%ax
 7a6:	66 90                	xchg   %ax,%ax
 7a8:	66 90                	xchg   %ax,%ax
 7aa:	66 90                	xchg   %ax,%ax
 7ac:	66 90                	xchg   %ax,%ax
 7ae:	66 90                	xchg   %ax,%ax

000007b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7b9:	85 d2                	test   %edx,%edx
{
 7bb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 7be:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 7c0:	79 76                	jns    838 <printint+0x88>
 7c2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7c6:	74 70                	je     838 <printint+0x88>
    x = -xx;
 7c8:	f7 d8                	neg    %eax
    neg = 1;
 7ca:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7d1:	31 f6                	xor    %esi,%esi
 7d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 7d6:	eb 0a                	jmp    7e2 <printint+0x32>
 7d8:	90                   	nop
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 7e0:	89 fe                	mov    %edi,%esi
 7e2:	31 d2                	xor    %edx,%edx
 7e4:	8d 7e 01             	lea    0x1(%esi),%edi
 7e7:	f7 f1                	div    %ecx
 7e9:	0f b6 92 60 0e 00 00 	movzbl 0xe60(%edx),%edx
  }while((x /= base) != 0);
 7f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 7f2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 7f5:	75 e9                	jne    7e0 <printint+0x30>
  if(neg)
 7f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 7fa:	85 c0                	test   %eax,%eax
 7fc:	74 08                	je     806 <printint+0x56>
    buf[i++] = '-';
 7fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 803:	8d 7e 02             	lea    0x2(%esi),%edi
 806:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 80a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
 810:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
 816:	83 ee 01             	sub    $0x1,%esi
 819:	6a 01                	push   $0x1
 81b:	53                   	push   %ebx
 81c:	57                   	push   %edi
 81d:	88 45 d7             	mov    %al,-0x29(%ebp)
 820:	e8 cd fe ff ff       	call   6f2 <write>

  while(--i >= 0)
 825:	83 c4 10             	add    $0x10,%esp
 828:	39 de                	cmp    %ebx,%esi
 82a:	75 e4                	jne    810 <printint+0x60>
    putc(fd, buf[i]);
}
 82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82f:	5b                   	pop    %ebx
 830:	5e                   	pop    %esi
 831:	5f                   	pop    %edi
 832:	5d                   	pop    %ebp
 833:	c3                   	ret    
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 838:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 83f:	eb 90                	jmp    7d1 <printint+0x21>
 841:	eb 0d                	jmp    850 <printf>
 843:	90                   	nop
 844:	90                   	nop
 845:	90                   	nop
 846:	90                   	nop
 847:	90                   	nop
 848:	90                   	nop
 849:	90                   	nop
 84a:	90                   	nop
 84b:	90                   	nop
 84c:	90                   	nop
 84d:	90                   	nop
 84e:	90                   	nop
 84f:	90                   	nop

00000850 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 859:	8b 75 0c             	mov    0xc(%ebp),%esi
 85c:	0f b6 1e             	movzbl (%esi),%ebx
 85f:	84 db                	test   %bl,%bl
 861:	0f 84 b3 00 00 00    	je     91a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 867:	8d 45 10             	lea    0x10(%ebp),%eax
 86a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 86d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 86f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 872:	eb 2f                	jmp    8a3 <printf+0x53>
 874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 878:	83 f8 25             	cmp    $0x25,%eax
 87b:	0f 84 a7 00 00 00    	je     928 <printf+0xd8>
  write(fd, &c, 1);
 881:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 884:	83 ec 04             	sub    $0x4,%esp
 887:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 88a:	6a 01                	push   $0x1
 88c:	50                   	push   %eax
 88d:	ff 75 08             	pushl  0x8(%ebp)
 890:	e8 5d fe ff ff       	call   6f2 <write>
 895:	83 c4 10             	add    $0x10,%esp
 898:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 89b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 89f:	84 db                	test   %bl,%bl
 8a1:	74 77                	je     91a <printf+0xca>
    if(state == 0){
 8a3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 8a5:	0f be cb             	movsbl %bl,%ecx
 8a8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8ab:	74 cb                	je     878 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8ad:	83 ff 25             	cmp    $0x25,%edi
 8b0:	75 e6                	jne    898 <printf+0x48>
      if(c == 'd'){
 8b2:	83 f8 64             	cmp    $0x64,%eax
 8b5:	0f 84 05 01 00 00    	je     9c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8c1:	83 f9 70             	cmp    $0x70,%ecx
 8c4:	74 72                	je     938 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c6:	83 f8 73             	cmp    $0x73,%eax
 8c9:	0f 84 99 00 00 00    	je     968 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8cf:	83 f8 63             	cmp    $0x63,%eax
 8d2:	0f 84 08 01 00 00    	je     9e0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d8:	83 f8 25             	cmp    $0x25,%eax
 8db:	0f 84 ef 00 00 00    	je     9d0 <printf+0x180>
  write(fd, &c, 1);
 8e1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8e4:	83 ec 04             	sub    $0x4,%esp
 8e7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8eb:	6a 01                	push   $0x1
 8ed:	50                   	push   %eax
 8ee:	ff 75 08             	pushl  0x8(%ebp)
 8f1:	e8 fc fd ff ff       	call   6f2 <write>
 8f6:	83 c4 0c             	add    $0xc,%esp
 8f9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8fc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 8ff:	6a 01                	push   $0x1
 901:	50                   	push   %eax
 902:	ff 75 08             	pushl  0x8(%ebp)
 905:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 908:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 90a:	e8 e3 fd ff ff       	call   6f2 <write>
  for(i = 0; fmt[i]; i++){
 90f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 913:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 916:	84 db                	test   %bl,%bl
 918:	75 89                	jne    8a3 <printf+0x53>
    }
  }
}
 91a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91d:	5b                   	pop    %ebx
 91e:	5e                   	pop    %esi
 91f:	5f                   	pop    %edi
 920:	5d                   	pop    %ebp
 921:	c3                   	ret    
 922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 928:	bf 25 00 00 00       	mov    $0x25,%edi
 92d:	e9 66 ff ff ff       	jmp    898 <printf+0x48>
 932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 938:	83 ec 0c             	sub    $0xc,%esp
 93b:	b9 10 00 00 00       	mov    $0x10,%ecx
 940:	6a 00                	push   $0x0
 942:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 945:	8b 45 08             	mov    0x8(%ebp),%eax
 948:	8b 17                	mov    (%edi),%edx
 94a:	e8 61 fe ff ff       	call   7b0 <printint>
        ap++;
 94f:	89 f8                	mov    %edi,%eax
 951:	83 c4 10             	add    $0x10,%esp
      state = 0;
 954:	31 ff                	xor    %edi,%edi
        ap++;
 956:	83 c0 04             	add    $0x4,%eax
 959:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 95c:	e9 37 ff ff ff       	jmp    898 <printf+0x48>
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 968:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 96b:	8b 08                	mov    (%eax),%ecx
        ap++;
 96d:	83 c0 04             	add    $0x4,%eax
 970:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 973:	85 c9                	test   %ecx,%ecx
 975:	0f 84 8e 00 00 00    	je     a09 <printf+0x1b9>
        while(*s != 0){
 97b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 97e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 980:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 982:	84 c0                	test   %al,%al
 984:	0f 84 0e ff ff ff    	je     898 <printf+0x48>
 98a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 98d:	89 de                	mov    %ebx,%esi
 98f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 992:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 995:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 998:	83 ec 04             	sub    $0x4,%esp
          s++;
 99b:	83 c6 01             	add    $0x1,%esi
 99e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 9a1:	6a 01                	push   $0x1
 9a3:	57                   	push   %edi
 9a4:	53                   	push   %ebx
 9a5:	e8 48 fd ff ff       	call   6f2 <write>
        while(*s != 0){
 9aa:	0f b6 06             	movzbl (%esi),%eax
 9ad:	83 c4 10             	add    $0x10,%esp
 9b0:	84 c0                	test   %al,%al
 9b2:	75 e4                	jne    998 <printf+0x148>
 9b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 9b7:	31 ff                	xor    %edi,%edi
 9b9:	e9 da fe ff ff       	jmp    898 <printf+0x48>
 9be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 9c0:	83 ec 0c             	sub    $0xc,%esp
 9c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9c8:	6a 01                	push   $0x1
 9ca:	e9 73 ff ff ff       	jmp    942 <printf+0xf2>
 9cf:	90                   	nop
  write(fd, &c, 1);
 9d0:	83 ec 04             	sub    $0x4,%esp
 9d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 9d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 9d9:	6a 01                	push   $0x1
 9db:	e9 21 ff ff ff       	jmp    901 <printf+0xb1>
        putc(fd, *ap);
 9e0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 9e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 9e6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 9e8:	6a 01                	push   $0x1
        ap++;
 9ea:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 9ed:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 9f0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9f3:	50                   	push   %eax
 9f4:	ff 75 08             	pushl  0x8(%ebp)
 9f7:	e8 f6 fc ff ff       	call   6f2 <write>
        ap++;
 9fc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 9ff:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a02:	31 ff                	xor    %edi,%edi
 a04:	e9 8f fe ff ff       	jmp    898 <printf+0x48>
          s = "(null)";
 a09:	bb 58 0e 00 00       	mov    $0xe58,%ebx
        while(*s != 0){
 a0e:	b8 28 00 00 00       	mov    $0x28,%eax
 a13:	e9 72 ff ff ff       	jmp    98a <printf+0x13a>
 a18:	66 90                	xchg   %ax,%ax
 a1a:	66 90                	xchg   %ax,%ax
 a1c:	66 90                	xchg   %ax,%ax
 a1e:	66 90                	xchg   %ax,%ax

00000a20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a21:	a1 d8 11 00 00       	mov    0x11d8,%eax
{
 a26:	89 e5                	mov    %esp,%ebp
 a28:	57                   	push   %edi
 a29:	56                   	push   %esi
 a2a:	53                   	push   %ebx
 a2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a2e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a38:	39 c8                	cmp    %ecx,%eax
 a3a:	8b 10                	mov    (%eax),%edx
 a3c:	73 32                	jae    a70 <free+0x50>
 a3e:	39 d1                	cmp    %edx,%ecx
 a40:	72 04                	jb     a46 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a42:	39 d0                	cmp    %edx,%eax
 a44:	72 32                	jb     a78 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a46:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a49:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a4c:	39 fa                	cmp    %edi,%edx
 a4e:	74 30                	je     a80 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a50:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a53:	8b 50 04             	mov    0x4(%eax),%edx
 a56:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a59:	39 f1                	cmp    %esi,%ecx
 a5b:	74 3a                	je     a97 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a5d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a5f:	a3 d8 11 00 00       	mov    %eax,0x11d8
}
 a64:	5b                   	pop    %ebx
 a65:	5e                   	pop    %esi
 a66:	5f                   	pop    %edi
 a67:	5d                   	pop    %ebp
 a68:	c3                   	ret    
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a70:	39 d0                	cmp    %edx,%eax
 a72:	72 04                	jb     a78 <free+0x58>
 a74:	39 d1                	cmp    %edx,%ecx
 a76:	72 ce                	jb     a46 <free+0x26>
{
 a78:	89 d0                	mov    %edx,%eax
 a7a:	eb bc                	jmp    a38 <free+0x18>
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a80:	03 72 04             	add    0x4(%edx),%esi
 a83:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a86:	8b 10                	mov    (%eax),%edx
 a88:	8b 12                	mov    (%edx),%edx
 a8a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a8d:	8b 50 04             	mov    0x4(%eax),%edx
 a90:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a93:	39 f1                	cmp    %esi,%ecx
 a95:	75 c6                	jne    a5d <free+0x3d>
    p->s.size += bp->s.size;
 a97:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a9a:	a3 d8 11 00 00       	mov    %eax,0x11d8
    p->s.size += bp->s.size;
 a9f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 aa2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 aa5:	89 10                	mov    %edx,(%eax)
}
 aa7:	5b                   	pop    %ebx
 aa8:	5e                   	pop    %esi
 aa9:	5f                   	pop    %edi
 aaa:	5d                   	pop    %ebp
 aab:	c3                   	ret    
 aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
 ab4:	56                   	push   %esi
 ab5:	53                   	push   %ebx
 ab6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 abc:	8b 15 d8 11 00 00    	mov    0x11d8,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac2:	8d 78 07             	lea    0x7(%eax),%edi
 ac5:	c1 ef 03             	shr    $0x3,%edi
 ac8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 acb:	85 d2                	test   %edx,%edx
 acd:	0f 84 9d 00 00 00    	je     b70 <malloc+0xc0>
 ad3:	8b 02                	mov    (%edx),%eax
 ad5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ad8:	39 cf                	cmp    %ecx,%edi
 ada:	76 6c                	jbe    b48 <malloc+0x98>
 adc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 ae2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ae7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 aea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 af1:	eb 0e                	jmp    b01 <malloc+0x51>
 af3:	90                   	nop
 af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 afa:	8b 48 04             	mov    0x4(%eax),%ecx
 afd:	39 f9                	cmp    %edi,%ecx
 aff:	73 47                	jae    b48 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b01:	39 05 d8 11 00 00    	cmp    %eax,0x11d8
 b07:	89 c2                	mov    %eax,%edx
 b09:	75 ed                	jne    af8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 b0b:	83 ec 0c             	sub    $0xc,%esp
 b0e:	56                   	push   %esi
 b0f:	e8 46 fc ff ff       	call   75a <sbrk>
  if(p == (char*)-1)
 b14:	83 c4 10             	add    $0x10,%esp
 b17:	83 f8 ff             	cmp    $0xffffffff,%eax
 b1a:	74 1c                	je     b38 <malloc+0x88>
  hp->s.size = nu;
 b1c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b1f:	83 ec 0c             	sub    $0xc,%esp
 b22:	83 c0 08             	add    $0x8,%eax
 b25:	50                   	push   %eax
 b26:	e8 f5 fe ff ff       	call   a20 <free>
  return freep;
 b2b:	8b 15 d8 11 00 00    	mov    0x11d8,%edx
      if((p = morecore(nunits)) == 0)
 b31:	83 c4 10             	add    $0x10,%esp
 b34:	85 d2                	test   %edx,%edx
 b36:	75 c0                	jne    af8 <malloc+0x48>
        return 0;
  }
}
 b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b3b:	31 c0                	xor    %eax,%eax
}
 b3d:	5b                   	pop    %ebx
 b3e:	5e                   	pop    %esi
 b3f:	5f                   	pop    %edi
 b40:	5d                   	pop    %ebp
 b41:	c3                   	ret    
 b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b48:	39 cf                	cmp    %ecx,%edi
 b4a:	74 54                	je     ba0 <malloc+0xf0>
        p->s.size -= nunits;
 b4c:	29 f9                	sub    %edi,%ecx
 b4e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b51:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b54:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b57:	89 15 d8 11 00 00    	mov    %edx,0x11d8
}
 b5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b60:	83 c0 08             	add    $0x8,%eax
}
 b63:	5b                   	pop    %ebx
 b64:	5e                   	pop    %esi
 b65:	5f                   	pop    %edi
 b66:	5d                   	pop    %ebp
 b67:	c3                   	ret    
 b68:	90                   	nop
 b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 b70:	c7 05 d8 11 00 00 dc 	movl   $0x11dc,0x11d8
 b77:	11 00 00 
 b7a:	c7 05 dc 11 00 00 dc 	movl   $0x11dc,0x11dc
 b81:	11 00 00 
    base.s.size = 0;
 b84:	b8 dc 11 00 00       	mov    $0x11dc,%eax
 b89:	c7 05 e0 11 00 00 00 	movl   $0x0,0x11e0
 b90:	00 00 00 
 b93:	e9 44 ff ff ff       	jmp    adc <malloc+0x2c>
 b98:	90                   	nop
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 ba0:	8b 08                	mov    (%eax),%ecx
 ba2:	89 0a                	mov    %ecx,(%edx)
 ba4:	eb b1                	jmp    b57 <malloc+0xa7>
