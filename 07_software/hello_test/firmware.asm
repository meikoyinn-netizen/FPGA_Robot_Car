
firmware.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	10004117          	auipc	sp,0x10004
   4:	00010113          	mv	sp,sp
   8:	0f8000ef          	jal	100 <main>

0000000c <loop_forever>:
   c:	0000006f          	j	c <loop_forever>

00000010 <delay>:
  10:	fe010113          	addi	sp,sp,-32 # 10003fe0 <main+0x10003ee0>
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

00000100 <main>:
 100:	fd010113          	addi	sp,sp,-48
 104:	02112623          	sw	ra,44(sp)
 108:	02812423          	sw	s0,40(sp)
 10c:	03010413          	addi	s0,sp,48
 110:	16800793          	li	a5,360
 114:	0007a803          	lw	a6,0(a5)
 118:	0047a503          	lw	a0,4(a5)
 11c:	0087a583          	lw	a1,8(a5)
 120:	00c7a603          	lw	a2,12(a5)
 124:	0107a683          	lw	a3,16(a5)
 128:	0147a703          	lw	a4,20(a5)
 12c:	fd042a23          	sw	a6,-44(s0)
 130:	fca42c23          	sw	a0,-40(s0)
 134:	fcb42e23          	sw	a1,-36(s0)
 138:	fec42023          	sw	a2,-32(s0)
 13c:	fed42223          	sw	a3,-28(s0)
 140:	fee42423          	sw	a4,-24(s0)
 144:	0187a783          	lw	a5,24(a5)
 148:	fef42623          	sw	a5,-20(s0)
 14c:	fd440793          	addi	a5,s0,-44
 150:	00078513          	mv	a0,a5
 154:	f39ff0ef          	jal	8c <print_str>
 158:	000f47b7          	lui	a5,0xf4
 15c:	24078513          	addi	a0,a5,576 # f4240 <main+0xf4140>
 160:	eb1ff0ef          	jal	10 <delay>
 164:	fe9ff06f          	j	14c <main+0x4c>
