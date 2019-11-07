
_shutdown:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  shutdown();
  11:	e8 04 03 00 00       	call   31a <shutdown>
  exit();
  16:	e8 57 02 00 00       	call   272 <exit>
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	90                   	nop

00000020 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	8b 45 08             	mov    0x8(%ebp),%eax
  27:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  2a:	89 c2                	mov    %eax,%edx
  2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  30:	83 c1 01             	add    $0x1,%ecx
  33:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  37:	83 c2 01             	add    $0x1,%edx
  3a:	84 db                	test   %bl,%bl
  3c:	88 5a ff             	mov    %bl,-0x1(%edx)
  3f:	75 ef                	jne    30 <strcpy+0x10>
    ;
  return os;
}
  41:	5b                   	pop    %ebx
  42:	5d                   	pop    %ebp
  43:	c3                   	ret    
  44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000050 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  54:	8b 55 08             	mov    0x8(%ebp),%edx
  57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  5a:	0f b6 02             	movzbl (%edx),%eax
  5d:	0f b6 19             	movzbl (%ecx),%ebx
  60:	84 c0                	test   %al,%al
  62:	75 1c                	jne    80 <strcmp+0x30>
  64:	eb 2a                	jmp    90 <strcmp+0x40>
  66:	8d 76 00             	lea    0x0(%esi),%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  70:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  73:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  76:	83 c1 01             	add    $0x1,%ecx
  79:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  7c:	84 c0                	test   %al,%al
  7e:	74 10                	je     90 <strcmp+0x40>
  80:	38 d8                	cmp    %bl,%al
  82:	74 ec                	je     70 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  84:	29 d8                	sub    %ebx,%eax
}
  86:	5b                   	pop    %ebx
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    
  89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  90:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  92:	29 d8                	sub    %ebx,%eax
}
  94:	5b                   	pop    %ebx
  95:	5d                   	pop    %ebp
  96:	c3                   	ret    
  97:	89 f6                	mov    %esi,%esi
  99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000a0 <strlen>:

uint
strlen(char *s)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  a6:	80 39 00             	cmpb   $0x0,(%ecx)
  a9:	74 15                	je     c0 <strlen+0x20>
  ab:	31 d2                	xor    %edx,%edx
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  b0:	83 c2 01             	add    $0x1,%edx
  b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  b7:	89 d0                	mov    %edx,%eax
  b9:	75 f5                	jne    b0 <strlen+0x10>
    ;
  return n;
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  c0:	31 c0                	xor    %eax,%eax
}
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  da:	8b 45 0c             	mov    0xc(%ebp),%eax
  dd:	89 d7                	mov    %edx,%edi
  df:	fc                   	cld    
  e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e2:	89 d0                	mov    %edx,%eax
  e4:	5f                   	pop    %edi
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
  fa:	0f b6 10             	movzbl (%eax),%edx
  fd:	84 d2                	test   %dl,%dl
  ff:	74 1d                	je     11e <strchr+0x2e>
    if(*s == c)
 101:	38 d3                	cmp    %dl,%bl
 103:	89 d9                	mov    %ebx,%ecx
 105:	75 0d                	jne    114 <strchr+0x24>
 107:	eb 17                	jmp    120 <strchr+0x30>
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 110:	38 ca                	cmp    %cl,%dl
 112:	74 0c                	je     120 <strchr+0x30>
  for(; *s; s++)
 114:	83 c0 01             	add    $0x1,%eax
 117:	0f b6 10             	movzbl (%eax),%edx
 11a:	84 d2                	test   %dl,%dl
 11c:	75 f2                	jne    110 <strchr+0x20>
      return (char*)s;
  return 0;
 11e:	31 c0                	xor    %eax,%eax
}
 120:	5b                   	pop    %ebx
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    
 123:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <gets>:

char*
gets(char *buf, int max)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 136:	31 f6                	xor    %esi,%esi
 138:	89 f3                	mov    %esi,%ebx
{
 13a:	83 ec 1c             	sub    $0x1c,%esp
 13d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 140:	eb 2f                	jmp    171 <gets+0x41>
 142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 148:	8d 45 e7             	lea    -0x19(%ebp),%eax
 14b:	83 ec 04             	sub    $0x4,%esp
 14e:	6a 01                	push   $0x1
 150:	50                   	push   %eax
 151:	6a 00                	push   $0x0
 153:	e8 32 01 00 00       	call   28a <read>
    if(cc < 1)
 158:	83 c4 10             	add    $0x10,%esp
 15b:	85 c0                	test   %eax,%eax
 15d:	7e 1c                	jle    17b <gets+0x4b>
      break;
    buf[i++] = c;
 15f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 163:	83 c7 01             	add    $0x1,%edi
 166:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 169:	3c 0a                	cmp    $0xa,%al
 16b:	74 23                	je     190 <gets+0x60>
 16d:	3c 0d                	cmp    $0xd,%al
 16f:	74 1f                	je     190 <gets+0x60>
  for(i=0; i+1 < max; ){
 171:	83 c3 01             	add    $0x1,%ebx
 174:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 177:	89 fe                	mov    %edi,%esi
 179:	7c cd                	jl     148 <gets+0x18>
 17b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 180:	c6 03 00             	movb   $0x0,(%ebx)
}
 183:	8d 65 f4             	lea    -0xc(%ebp),%esp
 186:	5b                   	pop    %ebx
 187:	5e                   	pop    %esi
 188:	5f                   	pop    %edi
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    
 18b:	90                   	nop
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	8b 75 08             	mov    0x8(%ebp),%esi
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	01 de                	add    %ebx,%esi
 198:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 19a:	c6 03 00             	movb   $0x0,(%ebx)
}
 19d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a0:	5b                   	pop    %ebx
 1a1:	5e                   	pop    %esi
 1a2:	5f                   	pop    %edi
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    
 1a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <stat>:

int
stat(char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	pushl  0x8(%ebp)
 1bd:	e8 f0 00 00 00       	call   2b2 <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	pushl  0xc(%ebp)
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	50                   	push   %eax
 1d2:	e8 f3 00 00 00       	call   2ca <fstat>
  close(fd);
 1d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1da:	89 c6                	mov    %eax,%esi
  close(fd);
 1dc:	e8 b9 00 00 00       	call   29a <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e7:	89 f0                	mov    %esi,%eax
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f5:	eb ed                	jmp    1e4 <stat+0x34>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 11             	movsbl (%ecx),%edx
 20a:	8d 42 d0             	lea    -0x30(%edx),%eax
 20d:	3c 09                	cmp    $0x9,%al
  n = 0;
 20f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 214:	77 1f                	ja     235 <atoi+0x35>
 216:	8d 76 00             	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 220:	8d 04 80             	lea    (%eax,%eax,4),%eax
 223:	83 c1 01             	add    $0x1,%ecx
 226:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 22a:	0f be 11             	movsbl (%ecx),%edx
 22d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
  return n;
}
 235:	5b                   	pop    %ebx
 236:	5d                   	pop    %ebp
 237:	c3                   	ret    
 238:	90                   	nop
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
 245:	8b 5d 10             	mov    0x10(%ebp),%ebx
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 24e:	85 db                	test   %ebx,%ebx
 250:	7e 14                	jle    266 <memmove+0x26>
 252:	31 d2                	xor    %edx,%edx
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 258:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 25c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 25f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 262:	39 d3                	cmp    %edx,%ebx
 264:	75 f2                	jne    258 <memmove+0x18>
  return vdst;
}
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26a:	b8 01 00 00 00       	mov    $0x1,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <exit>:
SYSCALL(exit)
 272:	b8 02 00 00 00       	mov    $0x2,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <wait>:
SYSCALL(wait)
 27a:	b8 03 00 00 00       	mov    $0x3,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <pipe>:
SYSCALL(pipe)
 282:	b8 04 00 00 00       	mov    $0x4,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <read>:
SYSCALL(read)
 28a:	b8 05 00 00 00       	mov    $0x5,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <write>:
SYSCALL(write)
 292:	b8 10 00 00 00       	mov    $0x10,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <close>:
SYSCALL(close)
 29a:	b8 15 00 00 00       	mov    $0x15,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <kill>:
SYSCALL(kill)
 2a2:	b8 06 00 00 00       	mov    $0x6,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <exec>:
SYSCALL(exec)
 2aa:	b8 07 00 00 00       	mov    $0x7,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <open>:
SYSCALL(open)
 2b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mknod>:
SYSCALL(mknod)
 2ba:	b8 11 00 00 00       	mov    $0x11,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <unlink>:
SYSCALL(unlink)
 2c2:	b8 12 00 00 00       	mov    $0x12,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <fstat>:
SYSCALL(fstat)
 2ca:	b8 08 00 00 00       	mov    $0x8,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <link>:
SYSCALL(link)
 2d2:	b8 13 00 00 00       	mov    $0x13,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mkdir>:
SYSCALL(mkdir)
 2da:	b8 14 00 00 00       	mov    $0x14,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <chdir>:
SYSCALL(chdir)
 2e2:	b8 09 00 00 00       	mov    $0x9,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <dup>:
SYSCALL(dup)
 2ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <getpid>:
SYSCALL(getpid)
 2f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <sbrk>:
SYSCALL(sbrk)
 2fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <sleep>:
SYSCALL(sleep)
 302:	b8 0d 00 00 00       	mov    $0xd,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <uptime>:
SYSCALL(uptime)
 30a:	b8 0e 00 00 00       	mov    $0xe,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <yield>:
SYSCALL(yield)
 312:	b8 16 00 00 00       	mov    $0x16,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <shutdown>:
SYSCALL(shutdown)
 31a:	b8 17 00 00 00       	mov    $0x17,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <writecount>:
SYSCALL(writecount)
 322:	b8 18 00 00 00       	mov    $0x18,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <settickets>:
SYSCALL(settickets)
 32a:	b8 19 00 00 00       	mov    $0x19,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getprocessesinfo>:
SYSCALL(getprocessesinfo)
 332:	b8 1a 00 00 00       	mov    $0x1a,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <dumppagetable>:
 33a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    
 342:	66 90                	xchg   %ax,%ax
 344:	66 90                	xchg   %ax,%ax
 346:	66 90                	xchg   %ax,%ax
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax

00000350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 359:	85 d2                	test   %edx,%edx
{
 35b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 35e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 360:	79 76                	jns    3d8 <printint+0x88>
 362:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 366:	74 70                	je     3d8 <printint+0x88>
    x = -xx;
 368:	f7 d8                	neg    %eax
    neg = 1;
 36a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 371:	31 f6                	xor    %esi,%esi
 373:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 376:	eb 0a                	jmp    382 <printint+0x32>
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 380:	89 fe                	mov    %edi,%esi
 382:	31 d2                	xor    %edx,%edx
 384:	8d 7e 01             	lea    0x1(%esi),%edi
 387:	f7 f1                	div    %ecx
 389:	0f b6 92 50 07 00 00 	movzbl 0x750(%edx),%edx
  }while((x /= base) != 0);
 390:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 392:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 395:	75 e9                	jne    380 <printint+0x30>
  if(neg)
 397:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 39a:	85 c0                	test   %eax,%eax
 39c:	74 08                	je     3a6 <printint+0x56>
    buf[i++] = '-';
 39e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3a3:	8d 7e 02             	lea    0x2(%esi),%edi
 3a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 3b3:	83 ec 04             	sub    $0x4,%esp
 3b6:	83 ee 01             	sub    $0x1,%esi
 3b9:	6a 01                	push   $0x1
 3bb:	53                   	push   %ebx
 3bc:	57                   	push   %edi
 3bd:	88 45 d7             	mov    %al,-0x29(%ebp)
 3c0:	e8 cd fe ff ff       	call   292 <write>

  while(--i >= 0)
 3c5:	83 c4 10             	add    $0x10,%esp
 3c8:	39 de                	cmp    %ebx,%esi
 3ca:	75 e4                	jne    3b0 <printint+0x60>
    putc(fd, buf[i]);
}
 3cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cf:	5b                   	pop    %ebx
 3d0:	5e                   	pop    %esi
 3d1:	5f                   	pop    %edi
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3df:	eb 90                	jmp    371 <printint+0x21>
 3e1:	eb 0d                	jmp    3f0 <printf>
 3e3:	90                   	nop
 3e4:	90                   	nop
 3e5:	90                   	nop
 3e6:	90                   	nop
 3e7:	90                   	nop
 3e8:	90                   	nop
 3e9:	90                   	nop
 3ea:	90                   	nop
 3eb:	90                   	nop
 3ec:	90                   	nop
 3ed:	90                   	nop
 3ee:	90                   	nop
 3ef:	90                   	nop

000003f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3fc:	0f b6 1e             	movzbl (%esi),%ebx
 3ff:	84 db                	test   %bl,%bl
 401:	0f 84 b3 00 00 00    	je     4ba <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 407:	8d 45 10             	lea    0x10(%ebp),%eax
 40a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 40d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 40f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 412:	eb 2f                	jmp    443 <printf+0x53>
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	0f 84 a7 00 00 00    	je     4c8 <printf+0xd8>
  write(fd, &c, 1);
 421:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 424:	83 ec 04             	sub    $0x4,%esp
 427:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 42a:	6a 01                	push   $0x1
 42c:	50                   	push   %eax
 42d:	ff 75 08             	pushl  0x8(%ebp)
 430:	e8 5d fe ff ff       	call   292 <write>
 435:	83 c4 10             	add    $0x10,%esp
 438:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 43b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 43f:	84 db                	test   %bl,%bl
 441:	74 77                	je     4ba <printf+0xca>
    if(state == 0){
 443:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 445:	0f be cb             	movsbl %bl,%ecx
 448:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 44b:	74 cb                	je     418 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 44d:	83 ff 25             	cmp    $0x25,%edi
 450:	75 e6                	jne    438 <printf+0x48>
      if(c == 'd'){
 452:	83 f8 64             	cmp    $0x64,%eax
 455:	0f 84 05 01 00 00    	je     560 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 45b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 461:	83 f9 70             	cmp    $0x70,%ecx
 464:	74 72                	je     4d8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 466:	83 f8 73             	cmp    $0x73,%eax
 469:	0f 84 99 00 00 00    	je     508 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 46f:	83 f8 63             	cmp    $0x63,%eax
 472:	0f 84 08 01 00 00    	je     580 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 478:	83 f8 25             	cmp    $0x25,%eax
 47b:	0f 84 ef 00 00 00    	je     570 <printf+0x180>
  write(fd, &c, 1);
 481:	8d 45 e7             	lea    -0x19(%ebp),%eax
 484:	83 ec 04             	sub    $0x4,%esp
 487:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 48b:	6a 01                	push   $0x1
 48d:	50                   	push   %eax
 48e:	ff 75 08             	pushl  0x8(%ebp)
 491:	e8 fc fd ff ff       	call   292 <write>
 496:	83 c4 0c             	add    $0xc,%esp
 499:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 49c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 49f:	6a 01                	push   $0x1
 4a1:	50                   	push   %eax
 4a2:	ff 75 08             	pushl  0x8(%ebp)
 4a5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4aa:	e8 e3 fd ff ff       	call   292 <write>
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 4b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4b6:	84 db                	test   %bl,%bl
 4b8:	75 89                	jne    443 <printf+0x53>
    }
  }
}
 4ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bd:	5b                   	pop    %ebx
 4be:	5e                   	pop    %esi
 4bf:	5f                   	pop    %edi
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret    
 4c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 4c8:	bf 25 00 00 00       	mov    $0x25,%edi
 4cd:	e9 66 ff ff ff       	jmp    438 <printf+0x48>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4d8:	83 ec 0c             	sub    $0xc,%esp
 4db:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e0:	6a 00                	push   $0x0
 4e2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4e5:	8b 45 08             	mov    0x8(%ebp),%eax
 4e8:	8b 17                	mov    (%edi),%edx
 4ea:	e8 61 fe ff ff       	call   350 <printint>
        ap++;
 4ef:	89 f8                	mov    %edi,%eax
 4f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4f4:	31 ff                	xor    %edi,%edi
        ap++;
 4f6:	83 c0 04             	add    $0x4,%eax
 4f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4fc:	e9 37 ff ff ff       	jmp    438 <printf+0x48>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 508:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 50b:	8b 08                	mov    (%eax),%ecx
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 513:	85 c9                	test   %ecx,%ecx
 515:	0f 84 8e 00 00 00    	je     5a9 <printf+0x1b9>
        while(*s != 0){
 51b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 51e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 520:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 522:	84 c0                	test   %al,%al
 524:	0f 84 0e ff ff ff    	je     438 <printf+0x48>
 52a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 52d:	89 de                	mov    %ebx,%esi
 52f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 532:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 535:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 538:	83 ec 04             	sub    $0x4,%esp
          s++;
 53b:	83 c6 01             	add    $0x1,%esi
 53e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 541:	6a 01                	push   $0x1
 543:	57                   	push   %edi
 544:	53                   	push   %ebx
 545:	e8 48 fd ff ff       	call   292 <write>
        while(*s != 0){
 54a:	0f b6 06             	movzbl (%esi),%eax
 54d:	83 c4 10             	add    $0x10,%esp
 550:	84 c0                	test   %al,%al
 552:	75 e4                	jne    538 <printf+0x148>
 554:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 557:	31 ff                	xor    %edi,%edi
 559:	e9 da fe ff ff       	jmp    438 <printf+0x48>
 55e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 0a 00 00 00       	mov    $0xa,%ecx
 568:	6a 01                	push   $0x1
 56a:	e9 73 ff ff ff       	jmp    4e2 <printf+0xf2>
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 576:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 579:	6a 01                	push   $0x1
 57b:	e9 21 ff ff ff       	jmp    4a1 <printf+0xb1>
        putc(fd, *ap);
 580:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 586:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 588:	6a 01                	push   $0x1
        ap++;
 58a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 58d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 590:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 593:	50                   	push   %eax
 594:	ff 75 08             	pushl  0x8(%ebp)
 597:	e8 f6 fc ff ff       	call   292 <write>
        ap++;
 59c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 59f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a2:	31 ff                	xor    %edi,%edi
 5a4:	e9 8f fe ff ff       	jmp    438 <printf+0x48>
          s = "(null)";
 5a9:	bb 48 07 00 00       	mov    $0x748,%ebx
        while(*s != 0){
 5ae:	b8 28 00 00 00       	mov    $0x28,%eax
 5b3:	e9 72 ff ff ff       	jmp    52a <printf+0x13a>
 5b8:	66 90                	xchg   %ax,%ax
 5ba:	66 90                	xchg   %ax,%ax
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 f4 09 00 00       	mov    0x9f4,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d8:	39 c8                	cmp    %ecx,%eax
 5da:	8b 10                	mov    (%eax),%edx
 5dc:	73 32                	jae    610 <free+0x50>
 5de:	39 d1                	cmp    %edx,%ecx
 5e0:	72 04                	jb     5e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e2:	39 d0                	cmp    %edx,%eax
 5e4:	72 32                	jb     618 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ec:	39 fa                	cmp    %edi,%edx
 5ee:	74 30                	je     620 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f3:	8b 50 04             	mov    0x4(%eax),%edx
 5f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f9:	39 f1                	cmp    %esi,%ecx
 5fb:	74 3a                	je     637 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5ff:	a3 f4 09 00 00       	mov    %eax,0x9f4
}
 604:	5b                   	pop    %ebx
 605:	5e                   	pop    %esi
 606:	5f                   	pop    %edi
 607:	5d                   	pop    %ebp
 608:	c3                   	ret    
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	39 d0                	cmp    %edx,%eax
 612:	72 04                	jb     618 <free+0x58>
 614:	39 d1                	cmp    %edx,%ecx
 616:	72 ce                	jb     5e6 <free+0x26>
{
 618:	89 d0                	mov    %edx,%eax
 61a:	eb bc                	jmp    5d8 <free+0x18>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 620:	03 72 04             	add    0x4(%edx),%esi
 623:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 626:	8b 10                	mov    (%eax),%edx
 628:	8b 12                	mov    (%edx),%edx
 62a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 62d:	8b 50 04             	mov    0x4(%eax),%edx
 630:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 633:	39 f1                	cmp    %esi,%ecx
 635:	75 c6                	jne    5fd <free+0x3d>
    p->s.size += bp->s.size;
 637:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 63a:	a3 f4 09 00 00       	mov    %eax,0x9f4
    p->s.size += bp->s.size;
 63f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 642:	8b 53 f8             	mov    -0x8(%ebx),%edx
 645:	89 10                	mov    %edx,(%eax)
}
 647:	5b                   	pop    %ebx
 648:	5e                   	pop    %esi
 649:	5f                   	pop    %edi
 64a:	5d                   	pop    %ebp
 64b:	c3                   	ret    
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 15 f4 09 00 00    	mov    0x9f4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 78 07             	lea    0x7(%eax),%edi
 665:	c1 ef 03             	shr    $0x3,%edi
 668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 66b:	85 d2                	test   %edx,%edx
 66d:	0f 84 9d 00 00 00    	je     710 <malloc+0xc0>
 673:	8b 02                	mov    (%edx),%eax
 675:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 678:	39 cf                	cmp    %ecx,%edi
 67a:	76 6c                	jbe    6e8 <malloc+0x98>
 67c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 682:	bb 00 10 00 00       	mov    $0x1000,%ebx
 687:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 68a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 691:	eb 0e                	jmp    6a1 <malloc+0x51>
 693:	90                   	nop
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 f9                	cmp    %edi,%ecx
 69f:	73 47                	jae    6e8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	39 05 f4 09 00 00    	cmp    %eax,0x9f4
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	75 ed                	jne    698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	56                   	push   %esi
 6af:	e8 46 fc ff ff       	call   2fa <sbrk>
  if(p == (char*)-1)
 6b4:	83 c4 10             	add    $0x10,%esp
 6b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ba:	74 1c                	je     6d8 <malloc+0x88>
  hp->s.size = nu;
 6bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6bf:	83 ec 0c             	sub    $0xc,%esp
 6c2:	83 c0 08             	add    $0x8,%eax
 6c5:	50                   	push   %eax
 6c6:	e8 f5 fe ff ff       	call   5c0 <free>
  return freep;
 6cb:	8b 15 f4 09 00 00    	mov    0x9f4,%edx
      if((p = morecore(nunits)) == 0)
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	85 d2                	test   %edx,%edx
 6d6:	75 c0                	jne    698 <malloc+0x48>
        return 0;
  }
}
 6d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6db:	31 c0                	xor    %eax,%eax
}
 6dd:	5b                   	pop    %ebx
 6de:	5e                   	pop    %esi
 6df:	5f                   	pop    %edi
 6e0:	5d                   	pop    %ebp
 6e1:	c3                   	ret    
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6e8:	39 cf                	cmp    %ecx,%edi
 6ea:	74 54                	je     740 <malloc+0xf0>
        p->s.size -= nunits;
 6ec:	29 f9                	sub    %edi,%ecx
 6ee:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6f4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6f7:	89 15 f4 09 00 00    	mov    %edx,0x9f4
}
 6fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 700:	83 c0 08             	add    $0x8,%eax
}
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
 708:	90                   	nop
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 f4 09 00 00 f8 	movl   $0x9f8,0x9f4
 717:	09 00 00 
 71a:	c7 05 f8 09 00 00 f8 	movl   $0x9f8,0x9f8
 721:	09 00 00 
    base.s.size = 0;
 724:	b8 f8 09 00 00       	mov    $0x9f8,%eax
 729:	c7 05 fc 09 00 00 00 	movl   $0x0,0x9fc
 730:	00 00 00 
 733:	e9 44 ff ff ff       	jmp    67c <malloc+0x2c>
 738:	90                   	nop
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b1                	jmp    6f7 <malloc+0xa7>
