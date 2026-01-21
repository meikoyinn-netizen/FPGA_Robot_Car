
firmware.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	10004117          	auipc	sp,0x10004
   4:	00010113          	mv	sp,sp
   8:	148000ef          	jal	150 <main>

0000000c <loop_forever>:
   c:	0000006f          	j	c <loop_forever>

00000010 <delay>:
  10:	fe010113          	addi	sp,sp,-32 # 10003fe0 <__modsi3+0x10003d94>
  14:	00112e23          	sw	ra,28(sp)
  18:	00812c23          	sw	s0,24(sp)
  1c:	02010413          	addi	s0,sp,32
  20:	fea42623          	sw	a0,-20(s0)
  24:	0080006f          	j	2c <delay+0x1c>
  28:	00000013          	nop
  2c:	fec42783          	lw	a5,-20(s0)
  30:	fff78713          	addi	a4,a5,-1
  34:	fee42623          	sw	a4,-20(s0)
  38:	fe0798e3          	bnez	a5,28 <delay+0x18>
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	01c12083          	lw	ra,28(sp)
  48:	01812403          	lw	s0,24(sp)
  4c:	02010113          	addi	sp,sp,32
  50:	00008067          	ret

00000054 <uart_putc>:
  54:	fe010113          	addi	sp,sp,-32
  58:	00112e23          	sw	ra,28(sp)
  5c:	00812c23          	sw	s0,24(sp)
  60:	02010413          	addi	s0,sp,32
  64:	00050793          	mv	a5,a0
  68:	fef407a3          	sb	a5,-17(s0)
  6c:	300007b7          	lui	a5,0x30000
  70:	fef44703          	lbu	a4,-17(s0)
  74:	00e7a023          	sw	a4,0(a5) # 30000000 <_stack_top+0x1fffc000>
  78:	00000013          	nop
  7c:	01c12083          	lw	ra,28(sp)
  80:	01812403          	lw	s0,24(sp)
  84:	02010113          	addi	sp,sp,32
  88:	00008067          	ret

0000008c <print_str>:
  8c:	fd010113          	addi	sp,sp,-48
  90:	02112623          	sw	ra,44(sp)
  94:	02812423          	sw	s0,40(sp)
  98:	03010413          	addi	s0,sp,48
  9c:	fca42e23          	sw	a0,-36(s0)
  a0:	03c0006f          	j	dc <print_str+0x50>
  a4:	fdc42783          	lw	a5,-36(s0)
  a8:	0007c783          	lbu	a5,0(a5)
  ac:	fef407a3          	sb	a5,-17(s0)
  b0:	fef44703          	lbu	a4,-17(s0)
  b4:	00a00793          	li	a5,10
  b8:	00f71663          	bne	a4,a5,c4 <print_str+0x38>
  bc:	00d00513          	li	a0,13
  c0:	f95ff0ef          	jal	54 <uart_putc>
  c4:	fef44783          	lbu	a5,-17(s0)
  c8:	00078513          	mv	a0,a5
  cc:	f89ff0ef          	jal	54 <uart_putc>
  d0:	fdc42783          	lw	a5,-36(s0)
  d4:	00178793          	addi	a5,a5,1
  d8:	fcf42e23          	sw	a5,-36(s0)
  dc:	fdc42783          	lw	a5,-36(s0)
  e0:	0007c783          	lbu	a5,0(a5)
  e4:	fc0790e3          	bnez	a5,a4 <print_str+0x18>
  e8:	00000013          	nop
  ec:	00000013          	nop
  f0:	02c12083          	lw	ra,44(sp)
  f4:	02812403          	lw	s0,40(sp)
  f8:	03010113          	addi	sp,sp,48
  fc:	00008067          	ret

00000100 <print_digit>:
 100:	fe010113          	addi	sp,sp,-32
 104:	00112e23          	sw	ra,28(sp)
 108:	00812c23          	sw	s0,24(sp)
 10c:	02010413          	addi	s0,sp,32
 110:	fea42623          	sw	a0,-20(s0)
 114:	fec42783          	lw	a5,-20(s0)
 118:	00a00593          	li	a1,10
 11c:	00078513          	mv	a0,a5
 120:	12c000ef          	jal	24c <__modsi3>
 124:	00050793          	mv	a5,a0
 128:	0ff7f793          	zext.b	a5,a5
 12c:	03078793          	addi	a5,a5,48
 130:	0ff7f793          	zext.b	a5,a5
 134:	00078513          	mv	a0,a5
 138:	f1dff0ef          	jal	54 <uart_putc>
 13c:	00000013          	nop
 140:	01c12083          	lw	ra,28(sp)
 144:	01812403          	lw	s0,24(sp)
 148:	02010113          	addi	sp,sp,32
 14c:	00008067          	ret

00000150 <main>:
 150:	fe010113          	addi	sp,sp,-32
 154:	00112e23          	sw	ra,28(sp)
 158:	00812c23          	sw	s0,24(sp)
 15c:	02010413          	addi	s0,sp,32
 160:	6c6c67b7          	lui	a5,0x6c6c6
 164:	54878793          	addi	a5,a5,1352 # 6c6c6548 <_stack_top+0x5c6c2548>
 168:	fef42223          	sw	a5,-28(s0)
 16c:	000017b7          	lui	a5,0x1
 170:	a6f78793          	addi	a5,a5,-1425 # a6f <__modsi3+0x823>
 174:	fef41423          	sh	a5,-24(s0)
 178:	fe040523          	sb	zero,-22(s0)
 17c:	fe440793          	addi	a5,s0,-28
 180:	00078513          	mv	a0,a5
 184:	f09ff0ef          	jal	8c <print_str>
 188:	fe042623          	sw	zero,-20(s0)
 18c:	02c0006f          	j	1b8 <main+0x68>
 190:	fec42503          	lw	a0,-20(s0)
 194:	f6dff0ef          	jal	100 <print_digit>
 198:	00a00513          	li	a0,10
 19c:	eb9ff0ef          	jal	54 <uart_putc>
 1a0:	000497b7          	lui	a5,0x49
 1a4:	3e078513          	addi	a0,a5,992 # 493e0 <__modsi3+0x49194>
 1a8:	e69ff0ef          	jal	10 <delay>
 1ac:	fec42783          	lw	a5,-20(s0)
 1b0:	00178793          	addi	a5,a5,1
 1b4:	fef42623          	sw	a5,-20(s0)
 1b8:	fec42703          	lw	a4,-20(s0)
 1bc:	00900793          	li	a5,9
 1c0:	fce7d8e3          	bge	a5,a4,190 <main+0x40>
 1c4:	fc5ff06f          	j	188 <main+0x38>

000001c8 <__divsi3>:
 1c8:	06054063          	bltz	a0,228 <__umodsi3+0x10>
 1cc:	0605c663          	bltz	a1,238 <__umodsi3+0x20>

000001d0 <__hidden___udivsi3>:
 1d0:	00058613          	mv	a2,a1
 1d4:	00050593          	mv	a1,a0
 1d8:	fff00513          	li	a0,-1
 1dc:	02060c63          	beqz	a2,214 <__hidden___udivsi3+0x44>
 1e0:	00100693          	li	a3,1
 1e4:	00b67a63          	bgeu	a2,a1,1f8 <__hidden___udivsi3+0x28>
 1e8:	00c05863          	blez	a2,1f8 <__hidden___udivsi3+0x28>
 1ec:	00161613          	slli	a2,a2,0x1
 1f0:	00169693          	slli	a3,a3,0x1
 1f4:	feb66ae3          	bltu	a2,a1,1e8 <__hidden___udivsi3+0x18>
 1f8:	00000513          	li	a0,0
 1fc:	00c5e663          	bltu	a1,a2,208 <__hidden___udivsi3+0x38>
 200:	40c585b3          	sub	a1,a1,a2
 204:	00d56533          	or	a0,a0,a3
 208:	0016d693          	srli	a3,a3,0x1
 20c:	00165613          	srli	a2,a2,0x1
 210:	fe0696e3          	bnez	a3,1fc <__hidden___udivsi3+0x2c>
 214:	00008067          	ret

00000218 <__umodsi3>:
 218:	00008293          	mv	t0,ra
 21c:	fb5ff0ef          	jal	1d0 <__hidden___udivsi3>
 220:	00058513          	mv	a0,a1
 224:	00028067          	jr	t0
 228:	40a00533          	neg	a0,a0
 22c:	00b04863          	bgtz	a1,23c <__umodsi3+0x24>
 230:	40b005b3          	neg	a1,a1
 234:	f9dff06f          	j	1d0 <__hidden___udivsi3>
 238:	40b005b3          	neg	a1,a1
 23c:	00008293          	mv	t0,ra
 240:	f91ff0ef          	jal	1d0 <__hidden___udivsi3>
 244:	40a00533          	neg	a0,a0
 248:	00028067          	jr	t0

0000024c <__modsi3>:
 24c:	00008293          	mv	t0,ra
 250:	0005ca63          	bltz	a1,264 <__modsi3+0x18>
 254:	00054c63          	bltz	a0,26c <__modsi3+0x20>
 258:	f79ff0ef          	jal	1d0 <__hidden___udivsi3>
 25c:	00058513          	mv	a0,a1
 260:	00028067          	jr	t0
 264:	40b005b3          	neg	a1,a1
 268:	fe0558e3          	bgez	a0,258 <__modsi3+0xc>
 26c:	40a00533          	neg	a0,a0
 270:	f61ff0ef          	jal	1d0 <__hidden___udivsi3>
 274:	40b00533          	neg	a0,a1
 278:	00028067          	jr	t0
