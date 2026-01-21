
firmware.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	10004117          	auipc	sp,0x10004
   4:	00010113          	mv	sp,sp
   8:	154000ef          	jal	15c <main>

0000000c <loop_forever>:
   c:	0000006f          	j	c <loop_forever>

00000010 <delay>:
  10:	fe010113          	addi	sp,sp,-32 # 10003fe0 <main+0x10003e84>
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
  6c:	0080006f          	j	74 <uart_putc+0x20>
  70:	00000013          	nop
  74:	300007b7          	lui	a5,0x30000
  78:	00478793          	addi	a5,a5,4 # 30000004 <_stack_top+0x1fffc004>
  7c:	0007a783          	lw	a5,0(a5)
  80:	0087f793          	andi	a5,a5,8
  84:	fe0786e3          	beqz	a5,70 <uart_putc+0x1c>
  88:	300007b7          	lui	a5,0x30000
  8c:	fef44703          	lbu	a4,-17(s0)
  90:	00e7a023          	sw	a4,0(a5) # 30000000 <_stack_top+0x1fffc000>
  94:	00000013          	nop
  98:	01c12083          	lw	ra,28(sp)
  9c:	01812403          	lw	s0,24(sp)
  a0:	02010113          	addi	sp,sp,32
  a4:	00008067          	ret

000000a8 <print_str>:
  a8:	fd010113          	addi	sp,sp,-48
  ac:	02112623          	sw	ra,44(sp)
  b0:	02812423          	sw	s0,40(sp)
  b4:	03010413          	addi	s0,sp,48
  b8:	fca42e23          	sw	a0,-36(s0)
  bc:	03c0006f          	j	f8 <print_str+0x50>
  c0:	fdc42783          	lw	a5,-36(s0)
  c4:	0007c783          	lbu	a5,0(a5)
  c8:	fef407a3          	sb	a5,-17(s0)
  cc:	fef44703          	lbu	a4,-17(s0)
  d0:	00a00793          	li	a5,10
  d4:	00f71663          	bne	a4,a5,e0 <print_str+0x38>
  d8:	00d00513          	li	a0,13
  dc:	f79ff0ef          	jal	54 <uart_putc>
  e0:	fef44783          	lbu	a5,-17(s0)
  e4:	00078513          	mv	a0,a5
  e8:	f6dff0ef          	jal	54 <uart_putc>
  ec:	fdc42783          	lw	a5,-36(s0)
  f0:	00178793          	addi	a5,a5,1
  f4:	fcf42e23          	sw	a5,-36(s0)
  f8:	fdc42783          	lw	a5,-36(s0)
  fc:	0007c783          	lbu	a5,0(a5)
 100:	fc0790e3          	bnez	a5,c0 <print_str+0x18>
 104:	00000013          	nop
 108:	00000013          	nop
 10c:	02c12083          	lw	ra,44(sp)
 110:	02812403          	lw	s0,40(sp)
 114:	03010113          	addi	sp,sp,48
 118:	00008067          	ret

0000011c <print_digit>:
 11c:	fe010113          	addi	sp,sp,-32
 120:	00112e23          	sw	ra,28(sp)
 124:	00812c23          	sw	s0,24(sp)
 128:	02010413          	addi	s0,sp,32
 12c:	fea42623          	sw	a0,-20(s0)
 130:	fec42783          	lw	a5,-20(s0)
 134:	0ff7f793          	zext.b	a5,a5
 138:	03078793          	addi	a5,a5,48
 13c:	0ff7f793          	zext.b	a5,a5
 140:	00078513          	mv	a0,a5
 144:	f11ff0ef          	jal	54 <uart_putc>
 148:	00000013          	nop
 14c:	01c12083          	lw	ra,28(sp)
 150:	01812403          	lw	s0,24(sp)
 154:	02010113          	addi	sp,sp,32
 158:	00008067          	ret

0000015c <main>:
 15c:	fe010113          	addi	sp,sp,-32
 160:	00112e23          	sw	ra,28(sp)
 164:	00812c23          	sw	s0,24(sp)
 168:	02010413          	addi	s0,sp,32
 16c:	6c6c67b7          	lui	a5,0x6c6c6
 170:	54878793          	addi	a5,a5,1352 # 6c6c6548 <_stack_top+0x5c6c2548>
 174:	fef42223          	sw	a5,-28(s0)
 178:	000017b7          	lui	a5,0x1
 17c:	a6f78793          	addi	a5,a5,-1425 # a6f <main+0x913>
 180:	fef41423          	sh	a5,-24(s0)
 184:	fe040523          	sb	zero,-22(s0)
 188:	fe440793          	addi	a5,s0,-28
 18c:	00078513          	mv	a0,a5
 190:	f19ff0ef          	jal	a8 <print_str>
 194:	fe042623          	sw	zero,-20(s0)
 198:	02c0006f          	j	1c4 <main+0x68>
 19c:	fec42503          	lw	a0,-20(s0)
 1a0:	f7dff0ef          	jal	11c <print_digit>
 1a4:	00a00513          	li	a0,10
 1a8:	eadff0ef          	jal	54 <uart_putc>
 1ac:	000497b7          	lui	a5,0x49
 1b0:	3e078513          	addi	a0,a5,992 # 493e0 <main+0x49284>
 1b4:	e5dff0ef          	jal	10 <delay>
 1b8:	fec42783          	lw	a5,-20(s0)
 1bc:	00178793          	addi	a5,a5,1
 1c0:	fef42623          	sw	a5,-20(s0)
 1c4:	fec42703          	lw	a4,-20(s0)
 1c8:	00900793          	li	a5,9
 1cc:	fce7d8e3          	bge	a5,a4,19c <main+0x40>
 1d0:	fc5ff06f          	j	194 <main+0x38>
