
firmware.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	10004117          	auipc	sp,0x10004
       4:	00010113          	mv	sp,sp
       8:	110000ef          	jal	118 <main>

0000000c <loop_forever>:
       c:	0000006f          	j	c <loop_forever>

00000010 <delay>:
      10:	fe010113          	addi	sp,sp,-32 # 10003fe0 <_ebss+0x34a4>
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

000000a8 <uart_puts>:
      a8:	fd010113          	addi	sp,sp,-48
      ac:	02112623          	sw	ra,44(sp)
      b0:	02812423          	sw	s0,40(sp)
      b4:	03010413          	addi	s0,sp,48
      b8:	fca42e23          	sw	a0,-36(s0)
      bc:	0380006f          	j	f4 <uart_puts+0x4c>
      c0:	fdc42783          	lw	a5,-36(s0)
      c4:	00178713          	addi	a4,a5,1
      c8:	fce42e23          	sw	a4,-36(s0)
      cc:	0007c783          	lbu	a5,0(a5)
      d0:	fef407a3          	sb	a5,-17(s0)
      d4:	fef44703          	lbu	a4,-17(s0)
      d8:	00a00793          	li	a5,10
      dc:	00f71663          	bne	a4,a5,e8 <uart_puts+0x40>
      e0:	00d00513          	li	a0,13
      e4:	f71ff0ef          	jal	54 <uart_putc>
      e8:	fef44783          	lbu	a5,-17(s0)
      ec:	00078513          	mv	a0,a5
      f0:	f65ff0ef          	jal	54 <uart_putc>
      f4:	fdc42783          	lw	a5,-36(s0)
      f8:	0007c783          	lbu	a5,0(a5)
      fc:	fc0792e3          	bnez	a5,c0 <uart_puts+0x18>
     100:	00000013          	nop
     104:	00000013          	nop
     108:	02c12083          	lw	ra,44(sp)
     10c:	02812403          	lw	s0,40(sp)
     110:	03010113          	addi	sp,sp,48
     114:	00008067          	ret

00000118 <main>:
     118:	ff010113          	addi	sp,sp,-16
     11c:	00112623          	sw	ra,12(sp)
     120:	00812423          	sw	s0,8(sp)
     124:	01010413          	addi	s0,sp,16
     128:	000137b7          	lui	a5,0x13
     12c:	85078513          	addi	a0,a5,-1968 # 12850 <__clzsi2+0x88>
     130:	f79ff0ef          	jal	a8 <uart_puts>
     134:	000137b7          	lui	a5,0x13
     138:	86c78513          	addi	a0,a5,-1940 # 1286c <__clzsi2+0xa4>
     13c:	4f0000ef          	jal	62c <puts>
     140:	000137b7          	lui	a5,0x13
     144:	87878513          	addi	a0,a5,-1928 # 12878 <__clzsi2+0xb0>
     148:	4e4000ef          	jal	62c <puts>
     14c:	100007b7          	lui	a5,0x10000
     150:	7d87a783          	lw	a5,2008(a5) # 100007d8 <x.0>
     154:	00178693          	addi	a3,a5,1
     158:	10000737          	lui	a4,0x10000
     15c:	7cd72c23          	sw	a3,2008(a4) # 100007d8 <x.0>
     160:	00078593          	mv	a1,a5
     164:	000137b7          	lui	a5,0x13
     168:	88478513          	addi	a0,a5,-1916 # 12884 <__clzsi2+0xbc>
     16c:	308000ef          	jal	474 <printf>
     170:	100007b7          	lui	a5,0x10000
     174:	7d87a703          	lw	a4,2008(a5) # 100007d8 <x.0>
     178:	00900793          	li	a5,9
     17c:	00e7d663          	bge	a5,a4,188 <main+0x70>
     180:	100007b7          	lui	a5,0x10000
     184:	7c07ac23          	sw	zero,2008(a5) # 100007d8 <x.0>
     188:	000497b7          	lui	a5,0x49
     18c:	3e078513          	addi	a0,a5,992 # 493e0 <_sidata+0x35be8>
     190:	e81ff0ef          	jal	10 <delay>
     194:	fadff06f          	j	140 <main+0x28>

00000198 <_write>:
     198:	fd010113          	addi	sp,sp,-48
     19c:	02112623          	sw	ra,44(sp)
     1a0:	02812423          	sw	s0,40(sp)
     1a4:	03010413          	addi	s0,sp,48
     1a8:	fca42e23          	sw	a0,-36(s0)
     1ac:	fcb42c23          	sw	a1,-40(s0)
     1b0:	fcc42a23          	sw	a2,-44(s0)
     1b4:	fe042623          	sw	zero,-20(s0)
     1b8:	0440006f          	j	1fc <_write+0x64>
     1bc:	fec42783          	lw	a5,-20(s0)
     1c0:	fd842703          	lw	a4,-40(s0)
     1c4:	00f707b3          	add	a5,a4,a5
     1c8:	0007c783          	lbu	a5,0(a5)
     1cc:	fef405a3          	sb	a5,-21(s0)
     1d0:	feb44703          	lbu	a4,-21(s0)
     1d4:	00a00793          	li	a5,10
     1d8:	00f71663          	bne	a4,a5,1e4 <_write+0x4c>
     1dc:	00d00513          	li	a0,13
     1e0:	e75ff0ef          	jal	54 <uart_putc>
     1e4:	feb44783          	lbu	a5,-21(s0)
     1e8:	00078513          	mv	a0,a5
     1ec:	e69ff0ef          	jal	54 <uart_putc>
     1f0:	fec42783          	lw	a5,-20(s0)
     1f4:	00178793          	addi	a5,a5,1
     1f8:	fef42623          	sw	a5,-20(s0)
     1fc:	fec42703          	lw	a4,-20(s0)
     200:	fd442783          	lw	a5,-44(s0)
     204:	faf74ce3          	blt	a4,a5,1bc <_write+0x24>
     208:	fd442783          	lw	a5,-44(s0)
     20c:	00078513          	mv	a0,a5
     210:	02c12083          	lw	ra,44(sp)
     214:	02812403          	lw	s0,40(sp)
     218:	03010113          	addi	sp,sp,48
     21c:	00008067          	ret

00000220 <_sbrk>:
     220:	fd010113          	addi	sp,sp,-48
     224:	02112623          	sw	ra,44(sp)
     228:	02812423          	sw	s0,40(sp)
     22c:	03010413          	addi	s0,sp,48
     230:	fca42e23          	sw	a0,-36(s0)
     234:	100007b7          	lui	a5,0x10000
     238:	7dc7a783          	lw	a5,2012(a5) # 100007dc <heap_end>
     23c:	00079a63          	bnez	a5,250 <_sbrk+0x30>
     240:	100007b7          	lui	a5,0x10000
     244:	10001737          	lui	a4,0x10001
     248:	b3c70713          	addi	a4,a4,-1220 # 10000b3c <_ebss>
     24c:	7ce7ae23          	sw	a4,2012(a5) # 100007dc <heap_end>
     250:	100007b7          	lui	a5,0x10000
     254:	7dc7a783          	lw	a5,2012(a5) # 100007dc <heap_end>
     258:	fef42623          	sw	a5,-20(s0)
     25c:	100007b7          	lui	a5,0x10000
     260:	7dc7a703          	lw	a4,2012(a5) # 100007dc <heap_end>
     264:	fdc42783          	lw	a5,-36(s0)
     268:	00f70733          	add	a4,a4,a5
     26c:	100007b7          	lui	a5,0x10000
     270:	7ce7ae23          	sw	a4,2012(a5) # 100007dc <heap_end>
     274:	fec42783          	lw	a5,-20(s0)
     278:	00078513          	mv	a0,a5
     27c:	02c12083          	lw	ra,44(sp)
     280:	02812403          	lw	s0,40(sp)
     284:	03010113          	addi	sp,sp,48
     288:	00008067          	ret

0000028c <_close>:
     28c:	fe010113          	addi	sp,sp,-32
     290:	00112e23          	sw	ra,28(sp)
     294:	00812c23          	sw	s0,24(sp)
     298:	02010413          	addi	s0,sp,32
     29c:	fea42623          	sw	a0,-20(s0)
     2a0:	fff00793          	li	a5,-1
     2a4:	00078513          	mv	a0,a5
     2a8:	01c12083          	lw	ra,28(sp)
     2ac:	01812403          	lw	s0,24(sp)
     2b0:	02010113          	addi	sp,sp,32
     2b4:	00008067          	ret

000002b8 <_fstat>:
     2b8:	fe010113          	addi	sp,sp,-32
     2bc:	00112e23          	sw	ra,28(sp)
     2c0:	00812c23          	sw	s0,24(sp)
     2c4:	02010413          	addi	s0,sp,32
     2c8:	fea42623          	sw	a0,-20(s0)
     2cc:	feb42423          	sw	a1,-24(s0)
     2d0:	fe842783          	lw	a5,-24(s0)
     2d4:	00002737          	lui	a4,0x2
     2d8:	00e7a223          	sw	a4,4(a5)
     2dc:	00000793          	li	a5,0
     2e0:	00078513          	mv	a0,a5
     2e4:	01c12083          	lw	ra,28(sp)
     2e8:	01812403          	lw	s0,24(sp)
     2ec:	02010113          	addi	sp,sp,32
     2f0:	00008067          	ret

000002f4 <_isatty>:
     2f4:	fe010113          	addi	sp,sp,-32
     2f8:	00112e23          	sw	ra,28(sp)
     2fc:	00812c23          	sw	s0,24(sp)
     300:	02010413          	addi	s0,sp,32
     304:	fea42623          	sw	a0,-20(s0)
     308:	00100793          	li	a5,1
     30c:	00078513          	mv	a0,a5
     310:	01c12083          	lw	ra,28(sp)
     314:	01812403          	lw	s0,24(sp)
     318:	02010113          	addi	sp,sp,32
     31c:	00008067          	ret

00000320 <_lseek>:
     320:	fe010113          	addi	sp,sp,-32
     324:	00112e23          	sw	ra,28(sp)
     328:	00812c23          	sw	s0,24(sp)
     32c:	02010413          	addi	s0,sp,32
     330:	fea42623          	sw	a0,-20(s0)
     334:	feb42423          	sw	a1,-24(s0)
     338:	fec42223          	sw	a2,-28(s0)
     33c:	00000793          	li	a5,0
     340:	00078513          	mv	a0,a5
     344:	01c12083          	lw	ra,28(sp)
     348:	01812403          	lw	s0,24(sp)
     34c:	02010113          	addi	sp,sp,32
     350:	00008067          	ret

00000354 <_read>:
     354:	fe010113          	addi	sp,sp,-32
     358:	00112e23          	sw	ra,28(sp)
     35c:	00812c23          	sw	s0,24(sp)
     360:	02010413          	addi	s0,sp,32
     364:	fea42623          	sw	a0,-20(s0)
     368:	feb42423          	sw	a1,-24(s0)
     36c:	fec42223          	sw	a2,-28(s0)
     370:	00000793          	li	a5,0
     374:	00078513          	mv	a0,a5
     378:	01c12083          	lw	ra,28(sp)
     37c:	01812403          	lw	s0,24(sp)
     380:	02010113          	addi	sp,sp,32
     384:	00008067          	ret

00000388 <_open>:
     388:	fe010113          	addi	sp,sp,-32
     38c:	00112e23          	sw	ra,28(sp)
     390:	00812c23          	sw	s0,24(sp)
     394:	02010413          	addi	s0,sp,32
     398:	fea42623          	sw	a0,-20(s0)
     39c:	feb42423          	sw	a1,-24(s0)
     3a0:	fec42223          	sw	a2,-28(s0)
     3a4:	fff00793          	li	a5,-1
     3a8:	00078513          	mv	a0,a5
     3ac:	01c12083          	lw	ra,28(sp)
     3b0:	01812403          	lw	s0,24(sp)
     3b4:	02010113          	addi	sp,sp,32
     3b8:	00008067          	ret

000003bc <_kill>:
     3bc:	fe010113          	addi	sp,sp,-32
     3c0:	00112e23          	sw	ra,28(sp)
     3c4:	00812c23          	sw	s0,24(sp)
     3c8:	02010413          	addi	s0,sp,32
     3cc:	fea42623          	sw	a0,-20(s0)
     3d0:	feb42423          	sw	a1,-24(s0)
     3d4:	fff00793          	li	a5,-1
     3d8:	00078513          	mv	a0,a5
     3dc:	01c12083          	lw	ra,28(sp)
     3e0:	01812403          	lw	s0,24(sp)
     3e4:	02010113          	addi	sp,sp,32
     3e8:	00008067          	ret

000003ec <_getpid>:
     3ec:	ff010113          	addi	sp,sp,-16
     3f0:	00112623          	sw	ra,12(sp)
     3f4:	00812423          	sw	s0,8(sp)
     3f8:	01010413          	addi	s0,sp,16
     3fc:	00100793          	li	a5,1
     400:	00078513          	mv	a0,a5
     404:	00c12083          	lw	ra,12(sp)
     408:	00812403          	lw	s0,8(sp)
     40c:	01010113          	addi	sp,sp,16
     410:	00008067          	ret

00000414 <_exit>:
     414:	fe010113          	addi	sp,sp,-32
     418:	00112e23          	sw	ra,28(sp)
     41c:	00812c23          	sw	s0,24(sp)
     420:	02010413          	addi	s0,sp,32
     424:	fea42623          	sw	a0,-20(s0)
     428:	0000006f          	j	428 <_exit+0x14>

0000042c <_printf_r>:
     42c:	fc010113          	addi	sp,sp,-64
     430:	00058e13          	mv	t3,a1
     434:	00852583          	lw	a1,8(a0)
     438:	02810313          	addi	t1,sp,40
     43c:	02c12423          	sw	a2,40(sp)
     440:	02d12623          	sw	a3,44(sp)
     444:	000e0613          	mv	a2,t3
     448:	00030693          	mv	a3,t1
     44c:	00112e23          	sw	ra,28(sp)
     450:	02e12823          	sw	a4,48(sp)
     454:	02f12a23          	sw	a5,52(sp)
     458:	03012c23          	sw	a6,56(sp)
     45c:	03112e23          	sw	a7,60(sp)
     460:	00612623          	sw	t1,12(sp)
     464:	294000ef          	jal	6f8 <_vfprintf_r>
     468:	01c12083          	lw	ra,28(sp)
     46c:	04010113          	addi	sp,sp,64
     470:	00008067          	ret

00000474 <printf>:
     474:	10000317          	auipc	t1,0x10000
     478:	35432303          	lw	t1,852(t1) # 100007c8 <_impure_ptr>
     47c:	fc010113          	addi	sp,sp,-64
     480:	02c12423          	sw	a2,40(sp)
     484:	02d12623          	sw	a3,44(sp)
     488:	02b12223          	sw	a1,36(sp)
     48c:	02e12823          	sw	a4,48(sp)
     490:	02f12a23          	sw	a5,52(sp)
     494:	03012c23          	sw	a6,56(sp)
     498:	03112e23          	sw	a7,60(sp)
     49c:	00832583          	lw	a1,8(t1)
     4a0:	02410693          	addi	a3,sp,36
     4a4:	00050613          	mv	a2,a0
     4a8:	00030513          	mv	a0,t1
     4ac:	00112e23          	sw	ra,28(sp)
     4b0:	00d12623          	sw	a3,12(sp)
     4b4:	244000ef          	jal	6f8 <_vfprintf_r>
     4b8:	01c12083          	lw	ra,28(sp)
     4bc:	04010113          	addi	sp,sp,64
     4c0:	00008067          	ret

000004c4 <_puts_r>:
     4c4:	fd010113          	addi	sp,sp,-48
     4c8:	02912223          	sw	s1,36(sp)
     4cc:	00050493          	mv	s1,a0
     4d0:	00058513          	mv	a0,a1
     4d4:	02812423          	sw	s0,40(sp)
     4d8:	02112623          	sw	ra,44(sp)
     4dc:	00058413          	mv	s0,a1
     4e0:	18c000ef          	jal	66c <strlen>
     4e4:	0344a783          	lw	a5,52(s1)
     4e8:	00150813          	addi	a6,a0,1
     4ec:	00012597          	auipc	a1,0x12
     4f0:	3a058593          	addi	a1,a1,928 # 1288c <__clzsi2+0xc4>
     4f4:	00100613          	li	a2,1
     4f8:	01010693          	addi	a3,sp,16
     4fc:	00200713          	li	a4,2
     500:	00812823          	sw	s0,16(sp)
     504:	00a12a23          	sw	a0,20(sp)
     508:	01012623          	sw	a6,12(sp)
     50c:	00b12c23          	sw	a1,24(sp)
     510:	00c12e23          	sw	a2,28(sp)
     514:	00d12223          	sw	a3,4(sp)
     518:	00e12423          	sw	a4,8(sp)
     51c:	0084a403          	lw	s0,8(s1)
     520:	0e078c63          	beqz	a5,618 <_puts_r+0x154>
     524:	06442783          	lw	a5,100(s0)
     528:	00c41703          	lh	a4,12(s0)
     52c:	0017f693          	andi	a3,a5,1
     530:	06068e63          	beqz	a3,5ac <_puts_r+0xe8>
     534:	01271693          	slli	a3,a4,0x12
     538:	0806ca63          	bltz	a3,5cc <_puts_r+0x108>
     53c:	ffffe6b7          	lui	a3,0xffffe
     540:	fff68693          	addi	a3,a3,-1 # ffffdfff <_stack_top+0xefff9fff>
     544:	00002637          	lui	a2,0x2
     548:	00d7f7b3          	and	a5,a5,a3
     54c:	00c76733          	or	a4,a4,a2
     550:	06f42223          	sw	a5,100(s0)
     554:	00e41623          	sh	a4,12(s0)
     558:	01279713          	slli	a4,a5,0x12
     55c:	0c074463          	bltz	a4,624 <_puts_r+0x160>
     560:	00048513          	mv	a0,s1
     564:	00410613          	addi	a2,sp,4
     568:	00040593          	mv	a1,s0
     56c:	0d0040ef          	jal	463c <__sfvwrite_r>
     570:	00a03733          	snez	a4,a0
     574:	06442783          	lw	a5,100(s0)
     578:	40e00733          	neg	a4,a4
     57c:	00a76493          	ori	s1,a4,10
     580:	0017f793          	andi	a5,a5,1
     584:	00079863          	bnez	a5,594 <_puts_r+0xd0>
     588:	00c45783          	lhu	a5,12(s0)
     58c:	2007f793          	andi	a5,a5,512
     590:	04078663          	beqz	a5,5dc <_puts_r+0x118>
     594:	02c12083          	lw	ra,44(sp)
     598:	02812403          	lw	s0,40(sp)
     59c:	00048513          	mv	a0,s1
     5a0:	02412483          	lw	s1,36(sp)
     5a4:	03010113          	addi	sp,sp,48
     5a8:	00008067          	ret
     5ac:	20077693          	andi	a3,a4,512
     5b0:	04068663          	beqz	a3,5fc <_puts_r+0x138>
     5b4:	01271693          	slli	a3,a4,0x12
     5b8:	f806d2e3          	bgez	a3,53c <_puts_r+0x78>
     5bc:	01279713          	slli	a4,a5,0x12
     5c0:	fa0750e3          	bgez	a4,560 <_puts_r+0x9c>
     5c4:	fff00493          	li	s1,-1
     5c8:	fc1ff06f          	j	588 <_puts_r+0xc4>
     5cc:	01279713          	slli	a4,a5,0x12
     5d0:	f80758e3          	bgez	a4,560 <_puts_r+0x9c>
     5d4:	fff00493          	li	s1,-1
     5d8:	fbdff06f          	j	594 <_puts_r+0xd0>
     5dc:	05842503          	lw	a0,88(s0)
     5e0:	088000ef          	jal	668 <__retarget_lock_release_recursive>
     5e4:	02c12083          	lw	ra,44(sp)
     5e8:	02812403          	lw	s0,40(sp)
     5ec:	00048513          	mv	a0,s1
     5f0:	02412483          	lw	s1,36(sp)
     5f4:	03010113          	addi	sp,sp,48
     5f8:	00008067          	ret
     5fc:	05842503          	lw	a0,88(s0)
     600:	050000ef          	jal	650 <__retarget_lock_acquire_recursive>
     604:	00c41703          	lh	a4,12(s0)
     608:	06442783          	lw	a5,100(s0)
     60c:	01271693          	slli	a3,a4,0x12
     610:	f406c4e3          	bltz	a3,558 <_puts_r+0x94>
     614:	f29ff06f          	j	53c <_puts_r+0x78>
     618:	00048513          	mv	a0,s1
     61c:	731030ef          	jal	454c <__sinit>
     620:	f05ff06f          	j	524 <_puts_r+0x60>
     624:	fff00493          	li	s1,-1
     628:	f59ff06f          	j	580 <_puts_r+0xbc>

0000062c <puts>:
     62c:	00050593          	mv	a1,a0
     630:	10000517          	auipc	a0,0x10000
     634:	19852503          	lw	a0,408(a0) # 100007c8 <_impure_ptr>
     638:	e8dff06f          	j	4c4 <_puts_r>

0000063c <__retarget_lock_init>:
     63c:	00008067          	ret

00000640 <__retarget_lock_init_recursive>:
     640:	00008067          	ret

00000644 <__retarget_lock_close>:
     644:	00008067          	ret

00000648 <__retarget_lock_close_recursive>:
     648:	00008067          	ret

0000064c <__retarget_lock_acquire>:
     64c:	00008067          	ret

00000650 <__retarget_lock_acquire_recursive>:
     650:	00008067          	ret

00000654 <__retarget_lock_try_acquire>:
     654:	00100513          	li	a0,1
     658:	00008067          	ret

0000065c <__retarget_lock_try_acquire_recursive>:
     65c:	00100513          	li	a0,1
     660:	00008067          	ret

00000664 <__retarget_lock_release>:
     664:	00008067          	ret

00000668 <__retarget_lock_release_recursive>:
     668:	00008067          	ret

0000066c <strlen>:
     66c:	00357793          	andi	a5,a0,3
     670:	00050713          	mv	a4,a0
     674:	04079c63          	bnez	a5,6cc <strlen+0x60>
     678:	7f7f86b7          	lui	a3,0x7f7f8
     67c:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <_stack_top+0x6f7f3f7f>
     680:	fff00593          	li	a1,-1
     684:	00072603          	lw	a2,0(a4) # 2000 <_vfprintf_r+0x1908>
     688:	00470713          	addi	a4,a4,4
     68c:	00d677b3          	and	a5,a2,a3
     690:	00d787b3          	add	a5,a5,a3
     694:	00c7e7b3          	or	a5,a5,a2
     698:	00d7e7b3          	or	a5,a5,a3
     69c:	feb784e3          	beq	a5,a1,684 <strlen+0x18>
     6a0:	ffc74683          	lbu	a3,-4(a4)
     6a4:	40a707b3          	sub	a5,a4,a0
     6a8:	04068463          	beqz	a3,6f0 <strlen+0x84>
     6ac:	ffd74683          	lbu	a3,-3(a4)
     6b0:	02068c63          	beqz	a3,6e8 <strlen+0x7c>
     6b4:	ffe74503          	lbu	a0,-2(a4)
     6b8:	00a03533          	snez	a0,a0
     6bc:	00f50533          	add	a0,a0,a5
     6c0:	ffe50513          	addi	a0,a0,-2
     6c4:	00008067          	ret
     6c8:	fa0688e3          	beqz	a3,678 <strlen+0xc>
     6cc:	00074783          	lbu	a5,0(a4)
     6d0:	00170713          	addi	a4,a4,1
     6d4:	00377693          	andi	a3,a4,3
     6d8:	fe0798e3          	bnez	a5,6c8 <strlen+0x5c>
     6dc:	40a70733          	sub	a4,a4,a0
     6e0:	fff70513          	addi	a0,a4,-1
     6e4:	00008067          	ret
     6e8:	ffd78513          	addi	a0,a5,-3
     6ec:	00008067          	ret
     6f0:	ffc78513          	addi	a0,a5,-4
     6f4:	00008067          	ret

000006f8 <_vfprintf_r>:
     6f8:	e6010113          	addi	sp,sp,-416
     6fc:	18112e23          	sw	ra,412(sp)
     700:	18912a23          	sw	s1,404(sp)
     704:	19312623          	sw	s3,396(sp)
     708:	19512223          	sw	s5,388(sp)
     70c:	00058993          	mv	s3,a1
     710:	00060a93          	mv	s5,a2
     714:	00d12823          	sw	a3,16(sp)
     718:	00050493          	mv	s1,a0
     71c:	640050ef          	jal	5d5c <_localeconv_r>
     720:	00052783          	lw	a5,0(a0)
     724:	00078513          	mv	a0,a5
     728:	02f12823          	sw	a5,48(sp)
     72c:	f41ff0ef          	jal	66c <strlen>
     730:	02a12623          	sw	a0,44(sp)
     734:	00800613          	li	a2,8
     738:	0a010513          	addi	a0,sp,160
     73c:	00000593          	li	a1,0
     740:	1c9050ef          	jal	6108 <memset>
     744:	00048863          	beqz	s1,754 <_vfprintf_r+0x5c>
     748:	0344a783          	lw	a5,52(s1)
     74c:	00079463          	bnez	a5,754 <_vfprintf_r+0x5c>
     750:	4b50106f          	j	2404 <_vfprintf_r+0x1d0c>
     754:	0649a703          	lw	a4,100(s3)
     758:	00c99783          	lh	a5,12(s3)
     75c:	00177693          	andi	a3,a4,1
     760:	3c068e63          	beqz	a3,b3c <_vfprintf_r+0x444>
     764:	01279693          	slli	a3,a5,0x12
     768:	0006d463          	bgez	a3,770 <_vfprintf_r+0x78>
     76c:	6b00106f          	j	1e1c <_vfprintf_r+0x1724>
     770:	ffffe6b7          	lui	a3,0xffffe
     774:	fff68693          	addi	a3,a3,-1 # ffffdfff <_stack_top+0xefff9fff>
     778:	00002637          	lui	a2,0x2
     77c:	00d77733          	and	a4,a4,a3
     780:	00c7e7b3          	or	a5,a5,a2
     784:	06e9a223          	sw	a4,100(s3)
     788:	00f99623          	sh	a5,12(s3)
     78c:	01271793          	slli	a5,a4,0x12
     790:	0007d463          	bgez	a5,798 <_vfprintf_r+0xa0>
     794:	1b00306f          	j	3944 <_vfprintf_r+0x324c>
     798:	00c99783          	lh	a5,12(s3)
     79c:	0087f713          	andi	a4,a5,8
     7a0:	28070263          	beqz	a4,a24 <_vfprintf_r+0x32c>
     7a4:	0109a703          	lw	a4,16(s3)
     7a8:	26070e63          	beqz	a4,a24 <_vfprintf_r+0x32c>
     7ac:	01a7f713          	andi	a4,a5,26
     7b0:	00a00693          	li	a3,10
     7b4:	28d70a63          	beq	a4,a3,a48 <_vfprintf_r+0x350>
     7b8:	0bc10793          	addi	a5,sp,188
     7bc:	18812c23          	sw	s0,408(sp)
     7c0:	19212823          	sw	s2,400(sp)
     7c4:	17712e23          	sw	s7,380(sp)
     7c8:	17a12823          	sw	s10,368(sp)
     7cc:	17b12623          	sw	s11,364(sp)
     7d0:	19412423          	sw	s4,392(sp)
     7d4:	19612023          	sw	s6,384(sp)
     7d8:	17812c23          	sw	s8,376(sp)
     7dc:	17912a23          	sw	s9,372(sp)
     7e0:	0a012c23          	sw	zero,184(sp)
     7e4:	0a012a23          	sw	zero,180(sp)
     7e8:	0af12823          	sw	a5,176(sp)
     7ec:	00078413          	mv	s0,a5
     7f0:	00012c23          	sw	zero,24(sp)
     7f4:	02012a23          	sw	zero,52(sp)
     7f8:	02012423          	sw	zero,40(sp)
     7fc:	02012c23          	sw	zero,56(sp)
     800:	02012e23          	sw	zero,60(sp)
     804:	04012823          	sw	zero,80(sp)
     808:	04012023          	sw	zero,64(sp)
     80c:	00012623          	sw	zero,12(sp)
     810:	10000917          	auipc	s2,0x10000
     814:	a2490913          	addi	s2,s2,-1500 # 10000234 <__global_locale>
     818:	02500d93          	li	s11,37
     81c:	01000d13          	li	s10,16
     820:	000a8b93          	mv	s7,s5
     824:	01312423          	sw	s3,8(sp)
     828:	000b8a93          	mv	s5,s7
     82c:	0e492983          	lw	s3,228(s2)
     830:	500050ef          	jal	5d30 <__locale_mb_cur_max>
     834:	00050693          	mv	a3,a0
     838:	0a010713          	addi	a4,sp,160
     83c:	000a8613          	mv	a2,s5
     840:	08810593          	addi	a1,sp,136
     844:	00048513          	mv	a0,s1
     848:	000980e7          	jalr	s3
     84c:	26050663          	beqz	a0,ab8 <_vfprintf_r+0x3c0>
     850:	24054663          	bltz	a0,a9c <_vfprintf_r+0x3a4>
     854:	08812783          	lw	a5,136(sp)
     858:	01b78663          	beq	a5,s11,864 <_vfprintf_r+0x16c>
     85c:	00aa8ab3          	add	s5,s5,a0
     860:	fcdff06f          	j	82c <_vfprintf_r+0x134>
     864:	00050a13          	mv	s4,a0
     868:	417a8b33          	sub	s6,s5,s7
     86c:	257a9c63          	bne	s5,s7,ac4 <_vfprintf_r+0x3cc>
     870:	001ac303          	lbu	t1,1(s5)
     874:	001a8b93          	addi	s7,s5,1
     878:	06010fa3          	sb	zero,127(sp)
     87c:	fff00b13          	li	s6,-1
     880:	00000c13          	li	s8,0
     884:	05a00a93          	li	s5,90
     888:	00012a17          	auipc	s4,0x12
     88c:	364a0a13          	addi	s4,s4,868 # 12bec <__clzsi2+0x424>
     890:	00000993          	li	s3,0
     894:	001b8b93          	addi	s7,s7,1
     898:	fe030793          	addi	a5,t1,-32
     89c:	04fae663          	bltu	s5,a5,8e8 <_vfprintf_r+0x1f0>
     8a0:	00279793          	slli	a5,a5,0x2
     8a4:	014787b3          	add	a5,a5,s4
     8a8:	0007a783          	lw	a5,0(a5)
     8ac:	014787b3          	add	a5,a5,s4
     8b0:	00078067          	jr	a5
     8b4:	fd030713          	addi	a4,t1,-48
     8b8:	00000993          	li	s3,0
     8bc:	00900693          	li	a3,9
     8c0:	00299793          	slli	a5,s3,0x2
     8c4:	000bc303          	lbu	t1,0(s7)
     8c8:	013787b3          	add	a5,a5,s3
     8cc:	00179793          	slli	a5,a5,0x1
     8d0:	00f709b3          	add	s3,a4,a5
     8d4:	fd030713          	addi	a4,t1,-48
     8d8:	001b8b93          	addi	s7,s7,1
     8dc:	fee6f2e3          	bgeu	a3,a4,8c0 <_vfprintf_r+0x1c8>
     8e0:	fe030793          	addi	a5,t1,-32
     8e4:	fafafee3          	bgeu	s5,a5,8a0 <_vfprintf_r+0x1a8>
     8e8:	00098e93          	mv	t4,s3
     8ec:	20030a63          	beqz	t1,b00 <_vfprintf_r+0x408>
     8f0:	00100a93          	li	s5,1
     8f4:	0e610e23          	sb	t1,252(sp)
     8f8:	06010fa3          	sb	zero,127(sp)
     8fc:	000a8813          	mv	a6,s5
     900:	00012a23          	sw	zero,20(sp)
     904:	00000b13          	li	s6,0
     908:	02012223          	sw	zero,36(sp)
     90c:	02012023          	sw	zero,32(sp)
     910:	00000e13          	li	t3,0
     914:	0fc10c93          	addi	s9,sp,252
     918:	0b812a03          	lw	s4,184(sp)
     91c:	084c7293          	andi	t0,s8,132
     920:	000a0593          	mv	a1,s4
     924:	68028c63          	beqz	t0,fbc <_vfprintf_r+0x8c4>
     928:	07f14703          	lbu	a4,127(sp)
     92c:	06070863          	beqz	a4,99c <_vfprintf_r+0x2a4>
     930:	0b412503          	lw	a0,180(sp)
     934:	00000713          	li	a4,0
     938:	07f10613          	addi	a2,sp,127
     93c:	001a0a13          	addi	s4,s4,1
     940:	00150513          	addi	a0,a0,1
     944:	00100793          	li	a5,1
     948:	00c42023          	sw	a2,0(s0)
     94c:	00f42223          	sw	a5,4(s0)
     950:	0b412c23          	sw	s4,184(sp)
     954:	0aa12a23          	sw	a0,180(sp)
     958:	00700613          	li	a2,7
     95c:	00840413          	addi	s0,s0,8
     960:	2ea64663          	blt	a2,a0,c4c <_vfprintf_r+0x554>
     964:	02070c63          	beqz	a4,99c <_vfprintf_r+0x2a4>
     968:	0b412503          	lw	a0,180(sp)
     96c:	08010713          	addi	a4,sp,128
     970:	00e42023          	sw	a4,0(s0)
     974:	002a0a13          	addi	s4,s4,2
     978:	00200713          	li	a4,2
     97c:	00150513          	addi	a0,a0,1
     980:	00e42223          	sw	a4,4(s0)
     984:	0b412c23          	sw	s4,184(sp)
     988:	0aa12a23          	sw	a0,180(sp)
     98c:	00700713          	li	a4,7
     990:	00840413          	addi	s0,s0,8
     994:	00a75463          	bge	a4,a0,99c <_vfprintf_r+0x2a4>
     998:	04c0106f          	j	19e4 <_vfprintf_r+0x12ec>
     99c:	08000713          	li	a4,128
     9a0:	54e286e3          	beq	t0,a4,16ec <_vfprintf_r+0xff4>
     9a4:	415b0b33          	sub	s6,s6,s5
     9a8:	63604663          	bgtz	s6,fd4 <_vfprintf_r+0x8dc>
     9ac:	100c7713          	andi	a4,s8,256
     9b0:	74071263          	bnez	a4,10f4 <_vfprintf_r+0x9fc>
     9b4:	0b412783          	lw	a5,180(sp)
     9b8:	015a0a33          	add	s4,s4,s5
     9bc:	0b412c23          	sw	s4,184(sp)
     9c0:	00178793          	addi	a5,a5,1
     9c4:	01942023          	sw	s9,0(s0)
     9c8:	01542223          	sw	s5,4(s0)
     9cc:	00700713          	li	a4,7
     9d0:	0af12a23          	sw	a5,180(sp)
     9d4:	38f74063          	blt	a4,a5,d54 <_vfprintf_r+0x65c>
     9d8:	00840413          	addi	s0,s0,8
     9dc:	004c7f13          	andi	t5,s8,4
     9e0:	000f0663          	beqz	t5,9ec <_vfprintf_r+0x2f4>
     9e4:	410e8ab3          	sub	s5,t4,a6
     9e8:	39504e63          	bgtz	s5,d84 <_vfprintf_r+0x68c>
     9ec:	010ed463          	bge	t4,a6,9f4 <_vfprintf_r+0x2fc>
     9f0:	00080e93          	mv	t4,a6
     9f4:	00c12783          	lw	a5,12(sp)
     9f8:	01d787b3          	add	a5,a5,t4
     9fc:	00f12623          	sw	a5,12(sp)
     a00:	600a18e3          	bnez	s4,1810 <_vfprintf_r+0x1118>
     a04:	01412783          	lw	a5,20(sp)
     a08:	0a012a23          	sw	zero,180(sp)
     a0c:	00078863          	beqz	a5,a1c <_vfprintf_r+0x324>
     a10:	01412583          	lw	a1,20(sp)
     a14:	00048513          	mv	a0,s1
     a18:	0a9070ef          	jal	82c0 <_free_r>
     a1c:	0bc10413          	addi	s0,sp,188
     a20:	e09ff06f          	j	828 <_vfprintf_r+0x130>
     a24:	00098593          	mv	a1,s3
     a28:	00048513          	mv	a0,s1
     a2c:	2e0040ef          	jal	4d0c <__swsetup_r>
     a30:	00050463          	beqz	a0,a38 <_vfprintf_r+0x340>
     a34:	0c00306f          	j	3af4 <_vfprintf_r+0x33fc>
     a38:	00c99783          	lh	a5,12(s3)
     a3c:	00a00693          	li	a3,10
     a40:	01a7f713          	andi	a4,a5,26
     a44:	d6d71ae3          	bne	a4,a3,7b8 <_vfprintf_r+0xc0>
     a48:	00e99703          	lh	a4,14(s3)
     a4c:	d60746e3          	bltz	a4,7b8 <_vfprintf_r+0xc0>
     a50:	0649a703          	lw	a4,100(s3)
     a54:	00177713          	andi	a4,a4,1
     a58:	00071863          	bnez	a4,a68 <_vfprintf_r+0x370>
     a5c:	2007f793          	andi	a5,a5,512
     a60:	00079463          	bnez	a5,a68 <_vfprintf_r+0x370>
     a64:	4840206f          	j	2ee8 <_vfprintf_r+0x27f0>
     a68:	01012683          	lw	a3,16(sp)
     a6c:	000a8613          	mv	a2,s5
     a70:	00098593          	mv	a1,s3
     a74:	00048513          	mv	a0,s1
     a78:	1b0030ef          	jal	3c28 <__sbprintf>
     a7c:	19c12083          	lw	ra,412(sp)
     a80:	00a12623          	sw	a0,12(sp)
     a84:	00c12503          	lw	a0,12(sp)
     a88:	19412483          	lw	s1,404(sp)
     a8c:	18c12983          	lw	s3,396(sp)
     a90:	18412a83          	lw	s5,388(sp)
     a94:	1a010113          	addi	sp,sp,416
     a98:	00008067          	ret
     a9c:	00800613          	li	a2,8
     aa0:	00000593          	li	a1,0
     aa4:	0a010513          	addi	a0,sp,160
     aa8:	660050ef          	jal	6108 <memset>
     aac:	00100513          	li	a0,1
     ab0:	00aa8ab3          	add	s5,s5,a0
     ab4:	d79ff06f          	j	82c <_vfprintf_r+0x134>
     ab8:	00050a13          	mv	s4,a0
     abc:	417a8b33          	sub	s6,s5,s7
     ac0:	057a8063          	beq	s5,s7,b00 <_vfprintf_r+0x408>
     ac4:	0b812783          	lw	a5,184(sp)
     ac8:	0b412603          	lw	a2,180(sp)
     acc:	01742023          	sw	s7,0(s0)
     ad0:	016787b3          	add	a5,a5,s6
     ad4:	00160613          	addi	a2,a2,1 # 2001 <_vfprintf_r+0x1909>
     ad8:	01642223          	sw	s6,4(s0)
     adc:	0af12c23          	sw	a5,184(sp)
     ae0:	0ac12a23          	sw	a2,180(sp)
     ae4:	00700793          	li	a5,7
     ae8:	00840413          	addi	s0,s0,8
     aec:	02c7c863          	blt	a5,a2,b1c <_vfprintf_r+0x424>
     af0:	00c12783          	lw	a5,12(sp)
     af4:	016787b3          	add	a5,a5,s6
     af8:	00f12623          	sw	a5,12(sp)
     afc:	d60a1ae3          	bnez	s4,870 <_vfprintf_r+0x178>
     b00:	0b812783          	lw	a5,184(sp)
     b04:	00812983          	lw	s3,8(sp)
     b08:	00078463          	beqz	a5,b10 <_vfprintf_r+0x418>
     b0c:	3540206f          	j	2e60 <_vfprintf_r+0x2768>
     b10:	00c99783          	lh	a5,12(s3)
     b14:	0a012a23          	sw	zero,180(sp)
     b18:	5290006f          	j	1840 <_vfprintf_r+0x1148>
     b1c:	00812583          	lw	a1,8(sp)
     b20:	0b010613          	addi	a2,sp,176
     b24:	00048513          	mv	a0,s1
     b28:	1e4030ef          	jal	3d0c <__sprint_r>
     b2c:	00050463          	beqz	a0,b34 <_vfprintf_r+0x43c>
     b30:	4250206f          	j	3754 <_vfprintf_r+0x305c>
     b34:	0bc10413          	addi	s0,sp,188
     b38:	fb9ff06f          	j	af0 <_vfprintf_r+0x3f8>
     b3c:	2007f693          	andi	a3,a5,512
     b40:	32068063          	beqz	a3,e60 <_vfprintf_r+0x768>
     b44:	01279693          	slli	a3,a5,0x12
     b48:	c206d4e3          	bgez	a3,770 <_vfprintf_r+0x78>
     b4c:	01271693          	slli	a3,a4,0x12
     b50:	c406d6e3          	bgez	a3,79c <_vfprintf_r+0xa4>
     b54:	5f90206f          	j	394c <_vfprintf_r+0x3254>
     b58:	008c7793          	andi	a5,s8,8
     b5c:	00098e93          	mv	t4,s3
     b60:	00078463          	beqz	a5,b68 <_vfprintf_r+0x470>
     b64:	34c0106f          	j	1eb0 <_vfprintf_r+0x17b8>
     b68:	01012783          	lw	a5,16(sp)
     b6c:	00778793          	addi	a5,a5,7
     b70:	ff87f793          	andi	a5,a5,-8
     b74:	0007a703          	lw	a4,0(a5)
     b78:	00878793          	addi	a5,a5,8
     b7c:	02e12a23          	sw	a4,52(sp)
     b80:	ffc7a703          	lw	a4,-4(a5)
     b84:	00f12823          	sw	a5,16(sp)
     b88:	02e12423          	sw	a4,40(sp)
     b8c:	00013797          	auipc	a5,0x13
     b90:	aa478793          	addi	a5,a5,-1372 # 13630 <__clz_tab+0x100>
     b94:	02812703          	lw	a4,40(sp)
     b98:	0007aa03          	lw	s4,0(a5)
     b9c:	0047aa83          	lw	s5,4(a5)
     ba0:	03412c83          	lw	s9,52(sp)
     ba4:	00171993          	slli	s3,a4,0x1
     ba8:	0019d593          	srli	a1,s3,0x1
     bac:	000c8513          	mv	a0,s9
     bb0:	000a0613          	mv	a2,s4
     bb4:	000a8693          	mv	a3,s5
     bb8:	02612023          	sw	t1,32(sp)
     bbc:	01d12a23          	sw	t4,20(sp)
     bc0:	50c110ef          	jal	120cc <__unorddf2>
     bc4:	01412e83          	lw	t4,20(sp)
     bc8:	02012303          	lw	t1,32(sp)
     bcc:	00050463          	beqz	a0,bd4 <_vfprintf_r+0x4dc>
     bd0:	0410106f          	j	2410 <_vfprintf_r+0x1d18>
     bd4:	000c8513          	mv	a0,s9
     bd8:	0019d593          	srli	a1,s3,0x1
     bdc:	000a0613          	mv	a2,s4
     be0:	000a8693          	mv	a3,s5
     be4:	7d90f0ef          	jal	10bbc <__ledf2>
     be8:	01412e83          	lw	t4,20(sp)
     bec:	02012303          	lw	t1,32(sp)
     bf0:	00a04463          	bgtz	a0,bf8 <_vfprintf_r+0x500>
     bf4:	01d0106f          	j	2410 <_vfprintf_r+0x1d18>
     bf8:	02812583          	lw	a1,40(sp)
     bfc:	000c8513          	mv	a0,s9
     c00:	00000613          	li	a2,0
     c04:	00000693          	li	a3,0
     c08:	7b50f0ef          	jal	10bbc <__ledf2>
     c0c:	01412e83          	lw	t4,20(sp)
     c10:	02012303          	lw	t1,32(sp)
     c14:	f7fc7c13          	andi	s8,s8,-129
     c18:	00055463          	bgez	a0,c20 <_vfprintf_r+0x528>
     c1c:	6b80206f          	j	32d4 <_vfprintf_r+0x2bdc>
     c20:	04700693          	li	a3,71
     c24:	07f14703          	lbu	a4,127(sp)
     c28:	00012c97          	auipc	s9,0x12
     c2c:	c68c8c93          	addi	s9,s9,-920 # 12890 <__clzsi2+0xc8>
     c30:	0066d463          	bge	a3,t1,c38 <_vfprintf_r+0x540>
     c34:	0e80206f          	j	2d1c <_vfprintf_r+0x2624>
     c38:	00070463          	beqz	a4,c40 <_vfprintf_r+0x548>
     c3c:	2b10206f          	j	36ec <_vfprintf_r+0x2ff4>
     c40:	00300a93          	li	s5,3
     c44:	000a8813          	mv	a6,s5
     c48:	3500006f          	j	f98 <_vfprintf_r+0x8a0>
     c4c:	00812583          	lw	a1,8(sp)
     c50:	0b010613          	addi	a2,sp,176
     c54:	00048513          	mv	a0,s1
     c58:	05012e23          	sw	a6,92(sp)
     c5c:	05c12c23          	sw	t3,88(sp)
     c60:	04612a23          	sw	t1,84(sp)
     c64:	04512623          	sw	t0,76(sp)
     c68:	04e12423          	sw	a4,72(sp)
     c6c:	05d12223          	sw	t4,68(sp)
     c70:	09c030ef          	jal	3d0c <__sprint_r>
     c74:	3a0518e3          	bnez	a0,1824 <_vfprintf_r+0x112c>
     c78:	0b812a03          	lw	s4,184(sp)
     c7c:	05c12803          	lw	a6,92(sp)
     c80:	05812e03          	lw	t3,88(sp)
     c84:	05412303          	lw	t1,84(sp)
     c88:	04c12283          	lw	t0,76(sp)
     c8c:	04812703          	lw	a4,72(sp)
     c90:	04412e83          	lw	t4,68(sp)
     c94:	0bc10413          	addi	s0,sp,188
     c98:	ccdff06f          	j	964 <_vfprintf_r+0x26c>
     c9c:	08412603          	lw	a2,132(sp)
     ca0:	00c05463          	blez	a2,ca8 <_vfprintf_r+0x5b0>
     ca4:	7e50006f          	j	1c88 <_vfprintf_r+0x1590>
     ca8:	0b412703          	lw	a4,180(sp)
     cac:	00012697          	auipc	a3,0x12
     cb0:	c2468693          	addi	a3,a3,-988 # 128d0 <__clzsi2+0x108>
     cb4:	00d42023          	sw	a3,0(s0)
     cb8:	001a0a13          	addi	s4,s4,1
     cbc:	00100693          	li	a3,1
     cc0:	00170713          	addi	a4,a4,1
     cc4:	00d42223          	sw	a3,4(s0)
     cc8:	0b412c23          	sw	s4,184(sp)
     ccc:	0ae12a23          	sw	a4,180(sp)
     cd0:	00700693          	li	a3,7
     cd4:	00840413          	addi	s0,s0,8
     cd8:	00e6d463          	bge	a3,a4,ce0 <_vfprintf_r+0x5e8>
     cdc:	6b00206f          	j	338c <_vfprintf_r+0x2c94>
     ce0:	01812783          	lw	a5,24(sp)
     ce4:	00c7e733          	or	a4,a5,a2
     ce8:	00071463          	bnez	a4,cf0 <_vfprintf_r+0x5f8>
     cec:	03c0206f          	j	2d28 <_vfprintf_r+0x2630>
     cf0:	02c12783          	lw	a5,44(sp)
     cf4:	0b412683          	lw	a3,180(sp)
     cf8:	00700713          	li	a4,7
     cfc:	01478a33          	add	s4,a5,s4
     d00:	03012783          	lw	a5,48(sp)
     d04:	00168693          	addi	a3,a3,1
     d08:	0b412c23          	sw	s4,184(sp)
     d0c:	00f42023          	sw	a5,0(s0)
     d10:	02c12783          	lw	a5,44(sp)
     d14:	0ad12a23          	sw	a3,180(sp)
     d18:	00840413          	addi	s0,s0,8
     d1c:	fef42e23          	sw	a5,-4(s0)
     d20:	00d75463          	bge	a4,a3,d28 <_vfprintf_r+0x630>
     d24:	0400206f          	j	2d64 <_vfprintf_r+0x266c>
     d28:	00065463          	bgez	a2,d30 <_vfprintf_r+0x638>
     d2c:	0010206f          	j	352c <_vfprintf_r+0x2e34>
     d30:	01812783          	lw	a5,24(sp)
     d34:	00168693          	addi	a3,a3,1
     d38:	0ad12a23          	sw	a3,180(sp)
     d3c:	01478a33          	add	s4,a5,s4
     d40:	00f42223          	sw	a5,4(s0)
     d44:	0b412c23          	sw	s4,184(sp)
     d48:	01942023          	sw	s9,0(s0)
     d4c:	00700793          	li	a5,7
     d50:	c8d7d4e3          	bge	a5,a3,9d8 <_vfprintf_r+0x2e0>
     d54:	00812583          	lw	a1,8(sp)
     d58:	0b010613          	addi	a2,sp,176
     d5c:	00048513          	mv	a0,s1
     d60:	03012223          	sw	a6,36(sp)
     d64:	03d12023          	sw	t4,32(sp)
     d68:	7a5020ef          	jal	3d0c <__sprint_r>
     d6c:	2a051ce3          	bnez	a0,1824 <_vfprintf_r+0x112c>
     d70:	0b812a03          	lw	s4,184(sp)
     d74:	02012e83          	lw	t4,32(sp)
     d78:	02412803          	lw	a6,36(sp)
     d7c:	0bc10413          	addi	s0,sp,188
     d80:	c5dff06f          	j	9dc <_vfprintf_r+0x2e4>
     d84:	01000b13          	li	s6,16
     d88:	0b412783          	lw	a5,180(sp)
     d8c:	00012897          	auipc	a7,0x12
     d90:	fdc88893          	addi	a7,a7,-36 # 12d68 <blanks.1>
     d94:	095b5063          	bge	s6,s5,e14 <_vfprintf_r+0x71c>
     d98:	000a0713          	mv	a4,s4
     d9c:	00700c93          	li	s9,7
     da0:	000e8c13          	mv	s8,t4
     da4:	00080a13          	mv	s4,a6
     da8:	00012997          	auipc	s3,0x12
     dac:	fc098993          	addi	s3,s3,-64 # 12d68 <blanks.1>
     db0:	00c0006f          	j	dbc <_vfprintf_r+0x6c4>
     db4:	ff0a8a93          	addi	s5,s5,-16
     db8:	055b5663          	bge	s6,s5,e04 <_vfprintf_r+0x70c>
     dbc:	01070713          	addi	a4,a4,16
     dc0:	00178793          	addi	a5,a5,1
     dc4:	01342023          	sw	s3,0(s0)
     dc8:	01642223          	sw	s6,4(s0)
     dcc:	0ae12c23          	sw	a4,184(sp)
     dd0:	0af12a23          	sw	a5,180(sp)
     dd4:	00840413          	addi	s0,s0,8
     dd8:	fcfcdee3          	bge	s9,a5,db4 <_vfprintf_r+0x6bc>
     ddc:	00812583          	lw	a1,8(sp)
     de0:	0b010613          	addi	a2,sp,176
     de4:	00048513          	mv	a0,s1
     de8:	725020ef          	jal	3d0c <__sprint_r>
     dec:	22051ce3          	bnez	a0,1824 <_vfprintf_r+0x112c>
     df0:	ff0a8a93          	addi	s5,s5,-16
     df4:	0b812703          	lw	a4,184(sp)
     df8:	0b412783          	lw	a5,180(sp)
     dfc:	0bc10413          	addi	s0,sp,188
     e00:	fb5b4ee3          	blt	s6,s5,dbc <_vfprintf_r+0x6c4>
     e04:	000a0813          	mv	a6,s4
     e08:	000c0e93          	mv	t4,s8
     e0c:	00070a13          	mv	s4,a4
     e10:	00098893          	mv	a7,s3
     e14:	015a0a33          	add	s4,s4,s5
     e18:	00178793          	addi	a5,a5,1
     e1c:	0b412c23          	sw	s4,184(sp)
     e20:	0af12a23          	sw	a5,180(sp)
     e24:	01142023          	sw	a7,0(s0)
     e28:	01542223          	sw	s5,4(s0)
     e2c:	00700713          	li	a4,7
     e30:	baf75ee3          	bge	a4,a5,9ec <_vfprintf_r+0x2f4>
     e34:	00812583          	lw	a1,8(sp)
     e38:	0b010613          	addi	a2,sp,176
     e3c:	00048513          	mv	a0,s1
     e40:	03012223          	sw	a6,36(sp)
     e44:	03d12023          	sw	t4,32(sp)
     e48:	6c5020ef          	jal	3d0c <__sprint_r>
     e4c:	1c051ce3          	bnez	a0,1824 <_vfprintf_r+0x112c>
     e50:	0b812a03          	lw	s4,184(sp)
     e54:	02412803          	lw	a6,36(sp)
     e58:	02012e83          	lw	t4,32(sp)
     e5c:	b91ff06f          	j	9ec <_vfprintf_r+0x2f4>
     e60:	0589a503          	lw	a0,88(s3)
     e64:	fecff0ef          	jal	650 <__retarget_lock_acquire_recursive>
     e68:	00c99783          	lh	a5,12(s3)
     e6c:	0649a703          	lw	a4,100(s3)
     e70:	01279693          	slli	a3,a5,0x12
     e74:	9006cce3          	bltz	a3,78c <_vfprintf_r+0x94>
     e78:	8f9ff06f          	j	770 <_vfprintf_r+0x78>
     e7c:	000bc303          	lbu	t1,0(s7)
     e80:	a15ff06f          	j	894 <_vfprintf_r+0x19c>
     e84:	000bc303          	lbu	t1,0(s7)
     e88:	020c6c13          	ori	s8,s8,32
     e8c:	a09ff06f          	j	894 <_vfprintf_r+0x19c>
     e90:	020c7793          	andi	a5,s8,32
     e94:	00098e93          	mv	t4,s3
     e98:	74079e63          	bnez	a5,15f4 <_vfprintf_r+0xefc>
     e9c:	01012783          	lw	a5,16(sp)
     ea0:	01012683          	lw	a3,16(sp)
     ea4:	010c7713          	andi	a4,s8,16
     ea8:	00478793          	addi	a5,a5,4
     eac:	0006aa83          	lw	s5,0(a3)
     eb0:	00070463          	beqz	a4,eb8 <_vfprintf_r+0x7c0>
     eb4:	5490206f          	j	3bfc <_vfprintf_r+0x3504>
     eb8:	040c7713          	andi	a4,s8,64
     ebc:	00071463          	bnez	a4,ec4 <_vfprintf_r+0x7cc>
     ec0:	4190106f          	j	2ad8 <_vfprintf_r+0x23e0>
     ec4:	010a9a93          	slli	s5,s5,0x10
     ec8:	410ada93          	srai	s5,s5,0x10
     ecc:	41fad713          	srai	a4,s5,0x1f
     ed0:	00f12823          	sw	a5,16(sp)
     ed4:	00070693          	mv	a3,a4
     ed8:	6e06cc63          	bltz	a3,15d0 <_vfprintf_r+0xed8>
     edc:	4c0b4863          	bltz	s6,13ac <_vfprintf_r+0xcb4>
     ee0:	00eae7b3          	or	a5,s5,a4
     ee4:	f7fc7c13          	andi	s8,s8,-129
     ee8:	4c079263          	bnez	a5,13ac <_vfprintf_r+0xcb4>
     eec:	4c0b1063          	bnez	s6,13ac <_vfprintf_r+0xcb4>
     ef0:	07f14883          	lbu	a7,127(sp)
     ef4:	00089463          	bnez	a7,efc <_vfprintf_r+0x804>
     ef8:	5750106f          	j	2c6c <_vfprintf_r+0x2574>
     efc:	00000813          	li	a6,0
     f00:	00000e13          	li	t3,0
     f04:	00012a23          	sw	zero,20(sp)
     f08:	00000a93          	li	s5,0
     f0c:	00000b13          	li	s6,0
     f10:	16010c93          	addi	s9,sp,352
     f14:	00180813          	addi	a6,a6,1
     f18:	000e1463          	bnez	t3,f20 <_vfprintf_r+0x828>
     f1c:	4590206f          	j	3b74 <_vfprintf_r+0x347c>
     f20:	0b812a03          	lw	s4,184(sp)
     f24:	0b412503          	lw	a0,180(sp)
     f28:	084c7293          	andi	t0,s8,132
     f2c:	00280813          	addi	a6,a6,2
     f30:	000a0593          	mv	a1,s4
     f34:	00050613          	mv	a2,a0
     f38:	160284e3          	beqz	t0,18a0 <_vfprintf_r+0x11a8>
     f3c:	02012223          	sw	zero,36(sp)
     f40:	02012023          	sw	zero,32(sp)
     f44:	00000e13          	li	t3,0
     f48:	a20882e3          	beqz	a7,96c <_vfprintf_r+0x274>
     f4c:	00200713          	li	a4,2
     f50:	9e9ff06f          	j	938 <_vfprintf_r+0x240>
     f54:	04300793          	li	a5,67
     f58:	00098e93          	mv	t4,s3
     f5c:	00f31463          	bne	t1,a5,f64 <_vfprintf_r+0x86c>
     f60:	2fc0106f          	j	225c <_vfprintf_r+0x1b64>
     f64:	010c7793          	andi	a5,s8,16
     f68:	00078463          	beqz	a5,f70 <_vfprintf_r+0x878>
     f6c:	2f00106f          	j	225c <_vfprintf_r+0x1b64>
     f70:	01012783          	lw	a5,16(sp)
     f74:	00100813          	li	a6,1
     f78:	00080a93          	mv	s5,a6
     f7c:	0007a783          	lw	a5,0(a5)
     f80:	0fc10c93          	addi	s9,sp,252
     f84:	0ef10e23          	sb	a5,252(sp)
     f88:	01012783          	lw	a5,16(sp)
     f8c:	06010fa3          	sb	zero,127(sp)
     f90:	00478793          	addi	a5,a5,4
     f94:	00f12823          	sw	a5,16(sp)
     f98:	0b812a03          	lw	s4,184(sp)
     f9c:	00012a23          	sw	zero,20(sp)
     fa0:	02012223          	sw	zero,36(sp)
     fa4:	02012023          	sw	zero,32(sp)
     fa8:	084c7293          	andi	t0,s8,132
     fac:	00000b13          	li	s6,0
     fb0:	00000e13          	li	t3,0
     fb4:	000a0593          	mv	a1,s4
     fb8:	960298e3          	bnez	t0,928 <_vfprintf_r+0x230>
     fbc:	410e8733          	sub	a4,t4,a6
     fc0:	2ee048e3          	bgtz	a4,1ab0 <_vfprintf_r+0x13b8>
     fc4:	07f14703          	lbu	a4,127(sp)
     fc8:	960714e3          	bnez	a4,930 <_vfprintf_r+0x238>
     fcc:	415b0b33          	sub	s6,s6,s5
     fd0:	9d605ee3          	blez	s6,9ac <_vfprintf_r+0x2b4>
     fd4:	0b412603          	lw	a2,180(sp)
     fd8:	00012717          	auipc	a4,0x12
     fdc:	d8070713          	addi	a4,a4,-640 # 12d58 <zeroes.0>
     fe0:	0b6d5663          	bge	s10,s6,108c <_vfprintf_r+0x994>
     fe4:	00040793          	mv	a5,s0
     fe8:	000a0693          	mv	a3,s4
     fec:	000b0413          	mv	s0,s6
     ff0:	00700893          	li	a7,7
     ff4:	000a8b13          	mv	s6,s5
     ff8:	05d12223          	sw	t4,68(sp)
     ffc:	04612423          	sw	t1,72(sp)
    1000:	00080a93          	mv	s5,a6
    1004:	000e0a13          	mv	s4,t3
    1008:	00012997          	auipc	s3,0x12
    100c:	d5098993          	addi	s3,s3,-688 # 12d58 <zeroes.0>
    1010:	00c0006f          	j	101c <_vfprintf_r+0x924>
    1014:	ff040413          	addi	s0,s0,-16
    1018:	048d5863          	bge	s10,s0,1068 <_vfprintf_r+0x970>
    101c:	01068693          	addi	a3,a3,16
    1020:	00160613          	addi	a2,a2,1
    1024:	0137a023          	sw	s3,0(a5)
    1028:	01a7a223          	sw	s10,4(a5)
    102c:	0ad12c23          	sw	a3,184(sp)
    1030:	0ac12a23          	sw	a2,180(sp)
    1034:	00878793          	addi	a5,a5,8
    1038:	fcc8dee3          	bge	a7,a2,1014 <_vfprintf_r+0x91c>
    103c:	00812583          	lw	a1,8(sp)
    1040:	0b010613          	addi	a2,sp,176
    1044:	00048513          	mv	a0,s1
    1048:	4c5020ef          	jal	3d0c <__sprint_r>
    104c:	7c051c63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1050:	ff040413          	addi	s0,s0,-16
    1054:	0b812683          	lw	a3,184(sp)
    1058:	0b412603          	lw	a2,180(sp)
    105c:	0bc10793          	addi	a5,sp,188
    1060:	00700893          	li	a7,7
    1064:	fa8d4ce3          	blt	s10,s0,101c <_vfprintf_r+0x924>
    1068:	04412e83          	lw	t4,68(sp)
    106c:	04812303          	lw	t1,72(sp)
    1070:	000a0e13          	mv	t3,s4
    1074:	000a8813          	mv	a6,s5
    1078:	00068a13          	mv	s4,a3
    107c:	000b0a93          	mv	s5,s6
    1080:	00098713          	mv	a4,s3
    1084:	00040b13          	mv	s6,s0
    1088:	00078413          	mv	s0,a5
    108c:	016a0a33          	add	s4,s4,s6
    1090:	00160613          	addi	a2,a2,1
    1094:	00e42023          	sw	a4,0(s0)
    1098:	01642223          	sw	s6,4(s0)
    109c:	0b412c23          	sw	s4,184(sp)
    10a0:	0ac12a23          	sw	a2,180(sp)
    10a4:	00700713          	li	a4,7
    10a8:	00840413          	addi	s0,s0,8
    10ac:	90c750e3          	bge	a4,a2,9ac <_vfprintf_r+0x2b4>
    10b0:	00812583          	lw	a1,8(sp)
    10b4:	0b010613          	addi	a2,sp,176
    10b8:	00048513          	mv	a0,s1
    10bc:	05012a23          	sw	a6,84(sp)
    10c0:	05c12623          	sw	t3,76(sp)
    10c4:	04612423          	sw	t1,72(sp)
    10c8:	05d12223          	sw	t4,68(sp)
    10cc:	441020ef          	jal	3d0c <__sprint_r>
    10d0:	74051a63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    10d4:	100c7713          	andi	a4,s8,256
    10d8:	0b812a03          	lw	s4,184(sp)
    10dc:	05412803          	lw	a6,84(sp)
    10e0:	04c12e03          	lw	t3,76(sp)
    10e4:	04812303          	lw	t1,72(sp)
    10e8:	04412e83          	lw	t4,68(sp)
    10ec:	0bc10413          	addi	s0,sp,188
    10f0:	8c0702e3          	beqz	a4,9b4 <_vfprintf_r+0x2bc>
    10f4:	06500713          	li	a4,101
    10f8:	7c675463          	bge	a4,t1,18c0 <_vfprintf_r+0x11c8>
    10fc:	03412503          	lw	a0,52(sp)
    1100:	02812583          	lw	a1,40(sp)
    1104:	00000613          	li	a2,0
    1108:	00000693          	li	a3,0
    110c:	05012423          	sw	a6,72(sp)
    1110:	05d12223          	sw	t4,68(sp)
    1114:	05c12623          	sw	t3,76(sp)
    1118:	1050f0ef          	jal	10a1c <__eqdf2>
    111c:	04412e83          	lw	t4,68(sp)
    1120:	04812803          	lw	a6,72(sp)
    1124:	04c12e03          	lw	t3,76(sp)
    1128:	b6051ae3          	bnez	a0,c9c <_vfprintf_r+0x5a4>
    112c:	0b412783          	lw	a5,180(sp)
    1130:	00011717          	auipc	a4,0x11
    1134:	7a070713          	addi	a4,a4,1952 # 128d0 <__clzsi2+0x108>
    1138:	00e42023          	sw	a4,0(s0)
    113c:	001a0a13          	addi	s4,s4,1
    1140:	00100713          	li	a4,1
    1144:	00178793          	addi	a5,a5,1
    1148:	00e42223          	sw	a4,4(s0)
    114c:	0b412c23          	sw	s4,184(sp)
    1150:	0af12a23          	sw	a5,180(sp)
    1154:	00700713          	li	a4,7
    1158:	00840413          	addi	s0,s0,8
    115c:	00f75463          	bge	a4,a5,1164 <_vfprintf_r+0xa6c>
    1160:	6b00106f          	j	2810 <_vfprintf_r+0x2118>
    1164:	08412783          	lw	a5,132(sp)
    1168:	01812703          	lw	a4,24(sp)
    116c:	4ce7d0e3          	bge	a5,a4,1e2c <_vfprintf_r+0x1734>
    1170:	02c12703          	lw	a4,44(sp)
    1174:	0b412783          	lw	a5,180(sp)
    1178:	00840413          	addi	s0,s0,8
    117c:	00ea0a33          	add	s4,s4,a4
    1180:	03012703          	lw	a4,48(sp)
    1184:	00178793          	addi	a5,a5,1
    1188:	0b412c23          	sw	s4,184(sp)
    118c:	fee42c23          	sw	a4,-8(s0)
    1190:	02c12703          	lw	a4,44(sp)
    1194:	0af12a23          	sw	a5,180(sp)
    1198:	fee42e23          	sw	a4,-4(s0)
    119c:	00700713          	li	a4,7
    11a0:	74f74ee3          	blt	a4,a5,20fc <_vfprintf_r+0x1a04>
    11a4:	01812783          	lw	a5,24(sp)
    11a8:	fff78a93          	addi	s5,a5,-1
    11ac:	835058e3          	blez	s5,9dc <_vfprintf_r+0x2e4>
    11b0:	01000b13          	li	s6,16
    11b4:	0b412783          	lw	a5,180(sp)
    11b8:	015b4463          	blt	s6,s5,11c0 <_vfprintf_r+0xac8>
    11bc:	7e00206f          	j	399c <_vfprintf_r+0x32a4>
    11c0:	00040693          	mv	a3,s0
    11c4:	000a0613          	mv	a2,s4
    11c8:	00700c93          	li	s9,7
    11cc:	000e8413          	mv	s0,t4
    11d0:	00080a13          	mv	s4,a6
    11d4:	00012997          	auipc	s3,0x12
    11d8:	b8498993          	addi	s3,s3,-1148 # 12d58 <zeroes.0>
    11dc:	0100006f          	j	11ec <_vfprintf_r+0xaf4>
    11e0:	ff0a8a93          	addi	s5,s5,-16
    11e4:	015b4463          	blt	s6,s5,11ec <_vfprintf_r+0xaf4>
    11e8:	7b00106f          	j	2998 <_vfprintf_r+0x22a0>
    11ec:	01060613          	addi	a2,a2,16
    11f0:	00178793          	addi	a5,a5,1
    11f4:	0136a023          	sw	s3,0(a3)
    11f8:	0166a223          	sw	s6,4(a3)
    11fc:	0ac12c23          	sw	a2,184(sp)
    1200:	0af12a23          	sw	a5,180(sp)
    1204:	00868693          	addi	a3,a3,8
    1208:	fcfcdce3          	bge	s9,a5,11e0 <_vfprintf_r+0xae8>
    120c:	00812583          	lw	a1,8(sp)
    1210:	0b010613          	addi	a2,sp,176
    1214:	00048513          	mv	a0,s1
    1218:	2f5020ef          	jal	3d0c <__sprint_r>
    121c:	60051463          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1220:	0b812603          	lw	a2,184(sp)
    1224:	0b412783          	lw	a5,180(sp)
    1228:	0bc10693          	addi	a3,sp,188
    122c:	fb5ff06f          	j	11e0 <_vfprintf_r+0xae8>
    1230:	01012783          	lw	a5,16(sp)
    1234:	06010fa3          	sb	zero,127(sp)
    1238:	00098e93          	mv	t4,s3
    123c:	0007ac83          	lw	s9,0(a5)
    1240:	00478893          	addi	a7,a5,4
    1244:	700c84e3          	beqz	s9,214c <_vfprintf_r+0x1a54>
    1248:	05300713          	li	a4,83
    124c:	00e31463          	bne	t1,a4,1254 <_vfprintf_r+0xb5c>
    1250:	5f40106f          	j	2844 <_vfprintf_r+0x214c>
    1254:	010c7e13          	andi	t3,s8,16
    1258:	000e0463          	beqz	t3,1260 <_vfprintf_r+0xb68>
    125c:	5e80106f          	j	2844 <_vfprintf_r+0x214c>
    1260:	000b5463          	bgez	s6,1268 <_vfprintf_r+0xb70>
    1264:	3b90106f          	j	2e1c <_vfprintf_r+0x2724>
    1268:	000b0613          	mv	a2,s6
    126c:	00000593          	li	a1,0
    1270:	000c8513          	mv	a0,s9
    1274:	03c12223          	sw	t3,36(sp)
    1278:	03112023          	sw	a7,32(sp)
    127c:	01312823          	sw	s3,16(sp)
    1280:	3f5030ef          	jal	4e74 <memchr>
    1284:	00a12a23          	sw	a0,20(sp)
    1288:	07f14703          	lbu	a4,127(sp)
    128c:	01012e83          	lw	t4,16(sp)
    1290:	02012883          	lw	a7,32(sp)
    1294:	02412e03          	lw	t3,36(sp)
    1298:	00051463          	bnez	a0,12a0 <_vfprintf_r+0xba8>
    129c:	4c00206f          	j	375c <_vfprintf_r+0x3064>
    12a0:	01412783          	lw	a5,20(sp)
    12a4:	41978ab3          	sub	s5,a5,s9
    12a8:	fffac813          	not	a6,s5
    12ac:	41f85813          	srai	a6,a6,0x1f
    12b0:	010af833          	and	a6,s5,a6
    12b4:	00070463          	beqz	a4,12bc <_vfprintf_r+0xbc4>
    12b8:	00180813          	addi	a6,a6,1
    12bc:	01112823          	sw	a7,16(sp)
    12c0:	00000b13          	li	s6,0
    12c4:	02012223          	sw	zero,36(sp)
    12c8:	02012023          	sw	zero,32(sp)
    12cc:	00012a23          	sw	zero,20(sp)
    12d0:	07300313          	li	t1,115
    12d4:	e44ff06f          	j	918 <_vfprintf_r+0x220>
    12d8:	01012783          	lw	a5,16(sp)
    12dc:	0007a983          	lw	s3,0(a5)
    12e0:	3409dee3          	bgez	s3,1e3c <_vfprintf_r+0x1744>
    12e4:	01012783          	lw	a5,16(sp)
    12e8:	413009b3          	neg	s3,s3
    12ec:	00478793          	addi	a5,a5,4
    12f0:	00f12823          	sw	a5,16(sp)
    12f4:	000bc303          	lbu	t1,0(s7)
    12f8:	004c6c13          	ori	s8,s8,4
    12fc:	d98ff06f          	j	894 <_vfprintf_r+0x19c>
    1300:	020c7793          	andi	a5,s8,32
    1304:	00098e93          	mv	t4,s3
    1308:	010c6f13          	ori	t5,s8,16
    130c:	06079663          	bnez	a5,1378 <_vfprintf_r+0xc80>
    1310:	01012783          	lw	a5,16(sp)
    1314:	00478793          	addi	a5,a5,4
    1318:	01012703          	lw	a4,16(sp)
    131c:	06010fa3          	sb	zero,127(sp)
    1320:	00072a83          	lw	s5,0(a4)
    1324:	00000713          	li	a4,0
    1328:	000b5463          	bgez	s6,1330 <_vfprintf_r+0xc38>
    132c:	5550106f          	j	3080 <_vfprintf_r+0x2988>
    1330:	00f12823          	sw	a5,16(sp)
    1334:	f7ff7c13          	andi	s8,t5,-129
    1338:	060a9c63          	bnez	s5,13b0 <_vfprintf_r+0xcb8>
    133c:	060b1a63          	bnez	s6,13b0 <_vfprintf_r+0xcb8>
    1340:	00000e13          	li	t3,0
    1344:	07f14883          	lbu	a7,127(sp)
    1348:	00000b13          	li	s6,0
    134c:	00000813          	li	a6,0
    1350:	00000a93          	li	s5,0
    1354:	16010c93          	addi	s9,sp,352
    1358:	00012a23          	sw	zero,20(sp)
    135c:	ba088ee3          	beqz	a7,f18 <_vfprintf_r+0x820>
    1360:	00180813          	addi	a6,a6,1
    1364:	bb5ff06f          	j	f18 <_vfprintf_r+0x820>
    1368:	020c7793          	andi	a5,s8,32
    136c:	00098e93          	mv	t4,s3
    1370:	3a0780e3          	beqz	a5,1f10 <_vfprintf_r+0x1818>
    1374:	000c0f13          	mv	t5,s8
    1378:	01012783          	lw	a5,16(sp)
    137c:	06010fa3          	sb	zero,127(sp)
    1380:	00778793          	addi	a5,a5,7
    1384:	ff87f793          	andi	a5,a5,-8
    1388:	00878713          	addi	a4,a5,8
    138c:	00e12823          	sw	a4,16(sp)
    1390:	0007aa83          	lw	s5,0(a5)
    1394:	0047a703          	lw	a4,4(a5)
    1398:	400b4ae3          	bltz	s6,1fac <_vfprintf_r+0x18b4>
    139c:	f7ff7c13          	andi	s8,t5,-129
    13a0:	000b1663          	bnez	s6,13ac <_vfprintf_r+0xcb4>
    13a4:	00eae7b3          	or	a5,s5,a4
    13a8:	f8078ce3          	beqz	a5,1340 <_vfprintf_r+0xc48>
    13ac:	5c071ae3          	bnez	a4,2180 <_vfprintf_r+0x1a88>
    13b0:	00900793          	li	a5,9
    13b4:	5d57e6e3          	bltu	a5,s5,2180 <_vfprintf_r+0x1a88>
    13b8:	030a8a93          	addi	s5,s5,48
    13bc:	15510fa3          	sb	s5,351(sp)
    13c0:	000b0813          	mv	a6,s6
    13c4:	3d6058e3          	blez	s6,1f94 <_vfprintf_r+0x189c>
    13c8:	07f14883          	lbu	a7,127(sp)
    13cc:	00000e13          	li	t3,0
    13d0:	00100a93          	li	s5,1
    13d4:	15f10c93          	addi	s9,sp,351
    13d8:	00012a23          	sw	zero,20(sp)
    13dc:	f81ff06f          	j	135c <_vfprintf_r+0xc64>
    13e0:	020c7793          	andi	a5,s8,32
    13e4:	00098e93          	mv	t4,s3
    13e8:	010c6813          	ori	a6,s8,16
    13ec:	2a0784e3          	beqz	a5,1e94 <_vfprintf_r+0x179c>
    13f0:	01012783          	lw	a5,16(sp)
    13f4:	00778793          	addi	a5,a5,7
    13f8:	ff87f793          	andi	a5,a5,-8
    13fc:	00878713          	addi	a4,a5,8
    1400:	00e12823          	sw	a4,16(sp)
    1404:	0047a603          	lw	a2,4(a5)
    1408:	0007a703          	lw	a4,0(a5)
    140c:	06010fa3          	sb	zero,127(sp)
    1410:	bff87c13          	andi	s8,a6,-1025
    1414:	600b4c63          	bltz	s6,1a2c <_vfprintf_r+0x1334>
    1418:	b7f87c13          	andi	s8,a6,-1153
    141c:	600b1863          	bnez	s6,1a2c <_vfprintf_r+0x1334>
    1420:	00c767b3          	or	a5,a4,a2
    1424:	60079463          	bnez	a5,1a2c <_vfprintf_r+0x1334>
    1428:	00187813          	andi	a6,a6,1
    142c:	66080263          	beqz	a6,1a90 <_vfprintf_r+0x1398>
    1430:	03000793          	li	a5,48
    1434:	14f10fa3          	sb	a5,351(sp)
    1438:	00080a93          	mv	s5,a6
    143c:	00012a23          	sw	zero,20(sp)
    1440:	00000b13          	li	s6,0
    1444:	02012223          	sw	zero,36(sp)
    1448:	02012023          	sw	zero,32(sp)
    144c:	00000e13          	li	t3,0
    1450:	15f10c93          	addi	s9,sp,351
    1454:	cc4ff06f          	j	918 <_vfprintf_r+0x220>
    1458:	02b00793          	li	a5,43
    145c:	000bc303          	lbu	t1,0(s7)
    1460:	06f10fa3          	sb	a5,127(sp)
    1464:	c30ff06f          	j	894 <_vfprintf_r+0x19c>
    1468:	000bc303          	lbu	t1,0(s7)
    146c:	06800793          	li	a5,104
    1470:	4af30ee3          	beq	t1,a5,212c <_vfprintf_r+0x1a34>
    1474:	040c6c13          	ori	s8,s8,64
    1478:	c1cff06f          	j	894 <_vfprintf_r+0x19c>
    147c:	020c7793          	andi	a5,s8,32
    1480:	00098e93          	mv	t4,s3
    1484:	280792e3          	bnez	a5,1f08 <_vfprintf_r+0x1810>
    1488:	01012783          	lw	a5,16(sp)
    148c:	01012703          	lw	a4,16(sp)
    1490:	010c7693          	andi	a3,s8,16
    1494:	00478793          	addi	a5,a5,4
    1498:	00072703          	lw	a4,0(a4)
    149c:	00068463          	beqz	a3,14a4 <_vfprintf_r+0xdac>
    14a0:	6cc0206f          	j	3b6c <_vfprintf_r+0x3474>
    14a4:	040c7693          	andi	a3,s8,64
    14a8:	00069463          	bnez	a3,14b0 <_vfprintf_r+0xdb8>
    14ac:	64c0106f          	j	2af8 <_vfprintf_r+0x2400>
    14b0:	01071713          	slli	a4,a4,0x10
    14b4:	01075713          	srli	a4,a4,0x10
    14b8:	00f12823          	sw	a5,16(sp)
    14bc:	000c0813          	mv	a6,s8
    14c0:	00000613          	li	a2,0
    14c4:	f49ff06f          	j	140c <_vfprintf_r+0xd14>
    14c8:	01012703          	lw	a4,16(sp)
    14cc:	020c7793          	andi	a5,s8,32
    14d0:	00470713          	addi	a4,a4,4
    14d4:	18079ee3          	bnez	a5,1e70 <_vfprintf_r+0x1778>
    14d8:	010c7793          	andi	a5,s8,16
    14dc:	00078463          	beqz	a5,14e4 <_vfprintf_r+0xdec>
    14e0:	5080106f          	j	29e8 <_vfprintf_r+0x22f0>
    14e4:	040c7793          	andi	a5,s8,64
    14e8:	00078463          	beqz	a5,14f0 <_vfprintf_r+0xdf8>
    14ec:	0e90106f          	j	2dd4 <_vfprintf_r+0x26dc>
    14f0:	200c7f13          	andi	t5,s8,512
    14f4:	000f1463          	bnez	t5,14fc <_vfprintf_r+0xe04>
    14f8:	4f00106f          	j	29e8 <_vfprintf_r+0x22f0>
    14fc:	01012783          	lw	a5,16(sp)
    1500:	00c12683          	lw	a3,12(sp)
    1504:	00e12823          	sw	a4,16(sp)
    1508:	0007a783          	lw	a5,0(a5)
    150c:	00d78023          	sb	a3,0(a5)
    1510:	b18ff06f          	j	828 <_vfprintf_r+0x130>
    1514:	000087b7          	lui	a5,0x8
    1518:	83078793          	addi	a5,a5,-2000 # 7830 <_dtoa_r+0xfe0>
    151c:	08f11023          	sh	a5,128(sp)
    1520:	01012783          	lw	a5,16(sp)
    1524:	06010fa3          	sb	zero,127(sp)
    1528:	00098e93          	mv	t4,s3
    152c:	0007a703          	lw	a4,0(a5)
    1530:	00478693          	addi	a3,a5,4
    1534:	00000613          	li	a2,0
    1538:	260b4ee3          	bltz	s6,1fb4 <_vfprintf_r+0x18bc>
    153c:	f7fc7f13          	andi	t5,s8,-129
    1540:	002f6c13          	ori	s8,t5,2
    1544:	00070463          	beqz	a4,154c <_vfprintf_r+0xe54>
    1548:	48c0106f          	j	29d4 <_vfprintf_r+0x22dc>
    154c:	000b0463          	beqz	s6,1554 <_vfprintf_r+0xe5c>
    1550:	4840106f          	j	29d4 <_vfprintf_r+0x22dc>
    1554:	00d12823          	sw	a3,16(sp)
    1558:	00200e13          	li	t3,2
    155c:	07800313          	li	t1,120
    1560:	07f14883          	lbu	a7,127(sp)
    1564:	00000b13          	li	s6,0
    1568:	00000813          	li	a6,0
    156c:	00000a93          	li	s5,0
    1570:	16010c93          	addi	s9,sp,352
    1574:	00012a23          	sw	zero,20(sp)
    1578:	de5ff06f          	j	135c <_vfprintf_r+0xc64>
    157c:	000bc303          	lbu	t1,0(s7)
    1580:	06c00793          	li	a5,108
    1584:	3af30ce3          	beq	t1,a5,213c <_vfprintf_r+0x1a44>
    1588:	010c6c13          	ori	s8,s8,16
    158c:	b08ff06f          	j	894 <_vfprintf_r+0x19c>
    1590:	000bc303          	lbu	t1,0(s7)
    1594:	008c6c13          	ori	s8,s8,8
    1598:	afcff06f          	j	894 <_vfprintf_r+0x19c>
    159c:	020c7793          	andi	a5,s8,32
    15a0:	00098e93          	mv	t4,s3
    15a4:	010c6f13          	ori	t5,s8,16
    15a8:	04079863          	bnez	a5,15f8 <_vfprintf_r+0xf00>
    15ac:	01012783          	lw	a5,16(sp)
    15b0:	00478793          	addi	a5,a5,4
    15b4:	01012703          	lw	a4,16(sp)
    15b8:	00f12823          	sw	a5,16(sp)
    15bc:	000f0c13          	mv	s8,t5
    15c0:	00072a83          	lw	s5,0(a4)
    15c4:	41fad713          	srai	a4,s5,0x1f
    15c8:	00070693          	mv	a3,a4
    15cc:	9006d8e3          	bgez	a3,edc <_vfprintf_r+0x7e4>
    15d0:	015037b3          	snez	a5,s5
    15d4:	40e00733          	neg	a4,a4
    15d8:	40f70733          	sub	a4,a4,a5
    15dc:	02d00793          	li	a5,45
    15e0:	06f10fa3          	sb	a5,127(sp)
    15e4:	41500ab3          	neg	s5,s5
    15e8:	dc0b42e3          	bltz	s6,13ac <_vfprintf_r+0xcb4>
    15ec:	f7fc7c13          	andi	s8,s8,-129
    15f0:	dbdff06f          	j	13ac <_vfprintf_r+0xcb4>
    15f4:	000c0f13          	mv	t5,s8
    15f8:	01012783          	lw	a5,16(sp)
    15fc:	000f0c13          	mv	s8,t5
    1600:	00778793          	addi	a5,a5,7
    1604:	ff87f793          	andi	a5,a5,-8
    1608:	0047a683          	lw	a3,4(a5)
    160c:	00878713          	addi	a4,a5,8
    1610:	00e12823          	sw	a4,16(sp)
    1614:	0007aa83          	lw	s5,0(a5)
    1618:	00068713          	mv	a4,a3
    161c:	8bdff06f          	j	ed8 <_vfprintf_r+0x7e0>
    1620:	00048513          	mv	a0,s1
    1624:	738040ef          	jal	5d5c <_localeconv_r>
    1628:	00452783          	lw	a5,4(a0)
    162c:	00078513          	mv	a0,a5
    1630:	04f12023          	sw	a5,64(sp)
    1634:	838ff0ef          	jal	66c <strlen>
    1638:	00050c93          	mv	s9,a0
    163c:	00048513          	mv	a0,s1
    1640:	05912823          	sw	s9,80(sp)
    1644:	718040ef          	jal	5d5c <_localeconv_r>
    1648:	00852703          	lw	a4,8(a0)
    164c:	000bc303          	lbu	t1,0(s7)
    1650:	02e12e23          	sw	a4,60(sp)
    1654:	a40c8063          	beqz	s9,894 <_vfprintf_r+0x19c>
    1658:	a2070e63          	beqz	a4,894 <_vfprintf_r+0x19c>
    165c:	00074783          	lbu	a5,0(a4)
    1660:	a2078a63          	beqz	a5,894 <_vfprintf_r+0x19c>
    1664:	400c6c13          	ori	s8,s8,1024
    1668:	a2cff06f          	j	894 <_vfprintf_r+0x19c>
    166c:	000bc303          	lbu	t1,0(s7)
    1670:	001c6c13          	ori	s8,s8,1
    1674:	a20ff06f          	j	894 <_vfprintf_r+0x19c>
    1678:	07f14783          	lbu	a5,127(sp)
    167c:	000bc303          	lbu	t1,0(s7)
    1680:	a0079a63          	bnez	a5,894 <_vfprintf_r+0x19c>
    1684:	02000793          	li	a5,32
    1688:	06f10fa3          	sb	a5,127(sp)
    168c:	a08ff06f          	j	894 <_vfprintf_r+0x19c>
    1690:	000bc303          	lbu	t1,0(s7)
    1694:	080c6c13          	ori	s8,s8,128
    1698:	9fcff06f          	j	894 <_vfprintf_r+0x19c>
    169c:	000bc303          	lbu	t1,0(s7)
    16a0:	02a00793          	li	a5,42
    16a4:	001b8693          	addi	a3,s7,1
    16a8:	00f31463          	bne	t1,a5,16b0 <_vfprintf_r+0xfb8>
    16ac:	4580206f          	j	3b04 <_vfprintf_r+0x340c>
    16b0:	fd030713          	addi	a4,t1,-48
    16b4:	00900613          	li	a2,9
    16b8:	00000b13          	li	s6,0
    16bc:	02e66463          	bltu	a2,a4,16e4 <_vfprintf_r+0xfec>
    16c0:	002b1793          	slli	a5,s6,0x2
    16c4:	0006c303          	lbu	t1,0(a3)
    16c8:	016787b3          	add	a5,a5,s6
    16cc:	00179793          	slli	a5,a5,0x1
    16d0:	00e78b33          	add	s6,a5,a4
    16d4:	fd030713          	addi	a4,t1,-48
    16d8:	00168693          	addi	a3,a3,1
    16dc:	fee672e3          	bgeu	a2,a4,16c0 <_vfprintf_r+0xfc8>
    16e0:	1a0b42e3          	bltz	s6,2084 <_vfprintf_r+0x198c>
    16e4:	00068b93          	mv	s7,a3
    16e8:	9b0ff06f          	j	898 <_vfprintf_r+0x1a0>
    16ec:	410e88b3          	sub	a7,t4,a6
    16f0:	ab105a63          	blez	a7,9a4 <_vfprintf_r+0x2ac>
    16f4:	01000293          	li	t0,16
    16f8:	0b412603          	lw	a2,180(sp)
    16fc:	00011717          	auipc	a4,0x11
    1700:	65c70713          	addi	a4,a4,1628 # 12d58 <zeroes.0>
    1704:	0b12d463          	bge	t0,a7,17ac <_vfprintf_r+0x10b4>
    1708:	00040793          	mv	a5,s0
    170c:	000a0693          	mv	a3,s4
    1710:	00700393          	li	t2,7
    1714:	05d12223          	sw	t4,68(sp)
    1718:	00088413          	mv	s0,a7
    171c:	04612423          	sw	t1,72(sp)
    1720:	05c12623          	sw	t3,76(sp)
    1724:	00080a13          	mv	s4,a6
    1728:	00011997          	auipc	s3,0x11
    172c:	63098993          	addi	s3,s3,1584 # 12d58 <zeroes.0>
    1730:	00c0006f          	j	173c <_vfprintf_r+0x1044>
    1734:	ff040413          	addi	s0,s0,-16
    1738:	0482da63          	bge	t0,s0,178c <_vfprintf_r+0x1094>
    173c:	01068693          	addi	a3,a3,16
    1740:	00160613          	addi	a2,a2,1
    1744:	0137a023          	sw	s3,0(a5)
    1748:	0057a223          	sw	t0,4(a5)
    174c:	0ad12c23          	sw	a3,184(sp)
    1750:	0ac12a23          	sw	a2,180(sp)
    1754:	00878793          	addi	a5,a5,8
    1758:	fcc3dee3          	bge	t2,a2,1734 <_vfprintf_r+0x103c>
    175c:	00812583          	lw	a1,8(sp)
    1760:	0b010613          	addi	a2,sp,176
    1764:	00048513          	mv	a0,s1
    1768:	5a4020ef          	jal	3d0c <__sprint_r>
    176c:	0a051c63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1770:	01000293          	li	t0,16
    1774:	ff040413          	addi	s0,s0,-16
    1778:	0b812683          	lw	a3,184(sp)
    177c:	0b412603          	lw	a2,180(sp)
    1780:	0bc10793          	addi	a5,sp,188
    1784:	00700393          	li	t2,7
    1788:	fa82cae3          	blt	t0,s0,173c <_vfprintf_r+0x1044>
    178c:	04412e83          	lw	t4,68(sp)
    1790:	04812303          	lw	t1,72(sp)
    1794:	04c12e03          	lw	t3,76(sp)
    1798:	00040893          	mv	a7,s0
    179c:	000a0813          	mv	a6,s4
    17a0:	00078413          	mv	s0,a5
    17a4:	00068a13          	mv	s4,a3
    17a8:	00098713          	mv	a4,s3
    17ac:	011a0a33          	add	s4,s4,a7
    17b0:	00160613          	addi	a2,a2,1
    17b4:	00e42023          	sw	a4,0(s0)
    17b8:	01142223          	sw	a7,4(s0)
    17bc:	0b412c23          	sw	s4,184(sp)
    17c0:	0ac12a23          	sw	a2,180(sp)
    17c4:	00700713          	li	a4,7
    17c8:	00840413          	addi	s0,s0,8
    17cc:	9cc75c63          	bge	a4,a2,9a4 <_vfprintf_r+0x2ac>
    17d0:	00812583          	lw	a1,8(sp)
    17d4:	0b010613          	addi	a2,sp,176
    17d8:	00048513          	mv	a0,s1
    17dc:	05012a23          	sw	a6,84(sp)
    17e0:	05c12623          	sw	t3,76(sp)
    17e4:	04612423          	sw	t1,72(sp)
    17e8:	05d12223          	sw	t4,68(sp)
    17ec:	520020ef          	jal	3d0c <__sprint_r>
    17f0:	02051a63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    17f4:	0b812a03          	lw	s4,184(sp)
    17f8:	04412e83          	lw	t4,68(sp)
    17fc:	04812303          	lw	t1,72(sp)
    1800:	04c12e03          	lw	t3,76(sp)
    1804:	05412803          	lw	a6,84(sp)
    1808:	0bc10413          	addi	s0,sp,188
    180c:	998ff06f          	j	9a4 <_vfprintf_r+0x2ac>
    1810:	00812583          	lw	a1,8(sp)
    1814:	0b010613          	addi	a2,sp,176
    1818:	00048513          	mv	a0,s1
    181c:	4f0020ef          	jal	3d0c <__sprint_r>
    1820:	9e050263          	beqz	a0,a04 <_vfprintf_r+0x30c>
    1824:	01412283          	lw	t0,20(sp)
    1828:	00812983          	lw	s3,8(sp)
    182c:	00028863          	beqz	t0,183c <_vfprintf_r+0x1144>
    1830:	00028593          	mv	a1,t0
    1834:	00048513          	mv	a0,s1
    1838:	289060ef          	jal	82c0 <_free_r>
    183c:	00c99783          	lh	a5,12(s3)
    1840:	0649a703          	lw	a4,100(s3)
    1844:	00177713          	andi	a4,a4,1
    1848:	00071663          	bnez	a4,1854 <_vfprintf_r+0x115c>
    184c:	2007f713          	andi	a4,a5,512
    1850:	340704e3          	beqz	a4,2398 <_vfprintf_r+0x1ca0>
    1854:	0407f793          	andi	a5,a5,64
    1858:	00078463          	beqz	a5,1860 <_vfprintf_r+0x1168>
    185c:	6190106f          	j	3674 <_vfprintf_r+0x2f7c>
    1860:	19812403          	lw	s0,408(sp)
    1864:	19012903          	lw	s2,400(sp)
    1868:	18812a03          	lw	s4,392(sp)
    186c:	18012b03          	lw	s6,384(sp)
    1870:	17c12b83          	lw	s7,380(sp)
    1874:	17812c03          	lw	s8,376(sp)
    1878:	17412c83          	lw	s9,372(sp)
    187c:	17012d03          	lw	s10,368(sp)
    1880:	16c12d83          	lw	s11,364(sp)
    1884:	19c12083          	lw	ra,412(sp)
    1888:	00c12503          	lw	a0,12(sp)
    188c:	19412483          	lw	s1,404(sp)
    1890:	18c12983          	lw	s3,396(sp)
    1894:	18412a83          	lw	s5,388(sp)
    1898:	1a010113          	addi	sp,sp,416
    189c:	00008067          	ret
    18a0:	410e8733          	sub	a4,t4,a6
    18a4:	02012223          	sw	zero,36(sp)
    18a8:	02012023          	sw	zero,32(sp)
    18ac:	00000e13          	li	t3,0
    18b0:	34e04263          	bgtz	a4,1bf4 <_vfprintf_r+0x14fc>
    18b4:	8a088c63          	beqz	a7,96c <_vfprintf_r+0x274>
    18b8:	00200713          	li	a4,2
    18bc:	87cff06f          	j	938 <_vfprintf_r+0x240>
    18c0:	0b412a83          	lw	s5,180(sp)
    18c4:	01812783          	lw	a5,24(sp)
    18c8:	00100713          	li	a4,1
    18cc:	00ea0a33          	add	s4,s4,a4
    18d0:	00ea8ab3          	add	s5,s5,a4
    18d4:	00840b13          	addi	s6,s0,8
    18d8:	2cf75463          	bge	a4,a5,1ba0 <_vfprintf_r+0x14a8>
    18dc:	00100713          	li	a4,1
    18e0:	00e42223          	sw	a4,4(s0)
    18e4:	01942023          	sw	s9,0(s0)
    18e8:	0b412c23          	sw	s4,184(sp)
    18ec:	0b512a23          	sw	s5,180(sp)
    18f0:	00700713          	li	a4,7
    18f4:	235740e3          	blt	a4,s5,2314 <_vfprintf_r+0x1c1c>
    18f8:	02c12783          	lw	a5,44(sp)
    18fc:	001a8a93          	addi	s5,s5,1
    1900:	0b512a23          	sw	s5,180(sp)
    1904:	00fa0a33          	add	s4,s4,a5
    1908:	03012783          	lw	a5,48(sp)
    190c:	0b412c23          	sw	s4,184(sp)
    1910:	00700713          	li	a4,7
    1914:	00fb2023          	sw	a5,0(s6)
    1918:	02c12783          	lw	a5,44(sp)
    191c:	008b0b13          	addi	s6,s6,8
    1920:	fefb2e23          	sw	a5,-4(s6)
    1924:	1b574ee3          	blt	a4,s5,22e0 <_vfprintf_r+0x1be8>
    1928:	01812783          	lw	a5,24(sp)
    192c:	03412503          	lw	a0,52(sp)
    1930:	02812583          	lw	a1,40(sp)
    1934:	00000613          	li	a2,0
    1938:	00000693          	li	a3,0
    193c:	03012223          	sw	a6,36(sp)
    1940:	03d12023          	sw	t4,32(sp)
    1944:	fff78413          	addi	s0,a5,-1
    1948:	0d40f0ef          	jal	10a1c <__eqdf2>
    194c:	02012e83          	lw	t4,32(sp)
    1950:	02412803          	lw	a6,36(sp)
    1954:	2a050463          	beqz	a0,1bfc <_vfprintf_r+0x1504>
    1958:	001a8a93          	addi	s5,s5,1
    195c:	008a0a33          	add	s4,s4,s0
    1960:	001c8793          	addi	a5,s9,1
    1964:	0b512a23          	sw	s5,180(sp)
    1968:	0b412c23          	sw	s4,184(sp)
    196c:	00fb2023          	sw	a5,0(s6)
    1970:	008b2223          	sw	s0,4(s6)
    1974:	00700793          	li	a5,7
    1978:	6d57cc63          	blt	a5,s5,2050 <_vfprintf_r+0x1958>
    197c:	008b0b13          	addi	s6,s6,8
    1980:	03812783          	lw	a5,56(sp)
    1984:	03812683          	lw	a3,56(sp)
    1988:	09010713          	addi	a4,sp,144
    198c:	01478a33          	add	s4,a5,s4
    1990:	001a8793          	addi	a5,s5,1
    1994:	00eb2023          	sw	a4,0(s6)
    1998:	0b412c23          	sw	s4,184(sp)
    199c:	0af12a23          	sw	a5,180(sp)
    19a0:	00db2223          	sw	a3,4(s6)
    19a4:	00700713          	li	a4,7
    19a8:	008b0413          	addi	s0,s6,8
    19ac:	00f74463          	blt	a4,a5,19b4 <_vfprintf_r+0x12bc>
    19b0:	82cff06f          	j	9dc <_vfprintf_r+0x2e4>
    19b4:	00812583          	lw	a1,8(sp)
    19b8:	0b010613          	addi	a2,sp,176
    19bc:	00048513          	mv	a0,s1
    19c0:	03012223          	sw	a6,36(sp)
    19c4:	03d12023          	sw	t4,32(sp)
    19c8:	344020ef          	jal	3d0c <__sprint_r>
    19cc:	e4051ce3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    19d0:	0b812a03          	lw	s4,184(sp)
    19d4:	02412803          	lw	a6,36(sp)
    19d8:	02012e83          	lw	t4,32(sp)
    19dc:	0bc10413          	addi	s0,sp,188
    19e0:	ffdfe06f          	j	9dc <_vfprintf_r+0x2e4>
    19e4:	00812583          	lw	a1,8(sp)
    19e8:	0b010613          	addi	a2,sp,176
    19ec:	00048513          	mv	a0,s1
    19f0:	05012c23          	sw	a6,88(sp)
    19f4:	05c12a23          	sw	t3,84(sp)
    19f8:	04612623          	sw	t1,76(sp)
    19fc:	04512423          	sw	t0,72(sp)
    1a00:	05d12223          	sw	t4,68(sp)
    1a04:	308020ef          	jal	3d0c <__sprint_r>
    1a08:	e0051ee3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1a0c:	0b812a03          	lw	s4,184(sp)
    1a10:	05812803          	lw	a6,88(sp)
    1a14:	05412e03          	lw	t3,84(sp)
    1a18:	04c12303          	lw	t1,76(sp)
    1a1c:	04812283          	lw	t0,72(sp)
    1a20:	04412e83          	lw	t4,68(sp)
    1a24:	0bc10413          	addi	s0,sp,188
    1a28:	f75fe06f          	j	99c <_vfprintf_r+0x2a4>
    1a2c:	16010c93          	addi	s9,sp,352
    1a30:	01d61793          	slli	a5,a2,0x1d
    1a34:	00777693          	andi	a3,a4,7
    1a38:	00375713          	srli	a4,a4,0x3
    1a3c:	000c8513          	mv	a0,s9
    1a40:	00e78733          	add	a4,a5,a4
    1a44:	03068693          	addi	a3,a3,48
    1a48:	00365613          	srli	a2,a2,0x3
    1a4c:	00c767b3          	or	a5,a4,a2
    1a50:	fedc8fa3          	sb	a3,-1(s9)
    1a54:	fffc8c93          	addi	s9,s9,-1
    1a58:	fc079ce3          	bnez	a5,1a30 <_vfprintf_r+0x1338>
    1a5c:	fd068693          	addi	a3,a3,-48
    1a60:	00068663          	beqz	a3,1a6c <_vfprintf_r+0x1374>
    1a64:	001c7713          	andi	a4,s8,1
    1a68:	4e071a63          	bnez	a4,1f5c <_vfprintf_r+0x1864>
    1a6c:	16010793          	addi	a5,sp,352
    1a70:	41978ab3          	sub	s5,a5,s9
    1a74:	000b0813          	mv	a6,s6
    1a78:	3f5b4063          	blt	s6,s5,1e58 <_vfprintf_r+0x1760>
    1a7c:	00012a23          	sw	zero,20(sp)
    1a80:	02012223          	sw	zero,36(sp)
    1a84:	02012023          	sw	zero,32(sp)
    1a88:	00000e13          	li	t3,0
    1a8c:	e8dfe06f          	j	918 <_vfprintf_r+0x220>
    1a90:	00000a93          	li	s5,0
    1a94:	00000b13          	li	s6,0
    1a98:	02012223          	sw	zero,36(sp)
    1a9c:	02012023          	sw	zero,32(sp)
    1aa0:	00000e13          	li	t3,0
    1aa4:	00012a23          	sw	zero,20(sp)
    1aa8:	16010c93          	addi	s9,sp,352
    1aac:	e6dfe06f          	j	918 <_vfprintf_r+0x220>
    1ab0:	0b412603          	lw	a2,180(sp)
    1ab4:	01000a13          	li	s4,16
    1ab8:	00011897          	auipc	a7,0x11
    1abc:	2b088893          	addi	a7,a7,688 # 12d68 <blanks.1>
    1ac0:	0aea5263          	bge	s4,a4,1b64 <_vfprintf_r+0x146c>
    1ac4:	00040793          	mv	a5,s0
    1ac8:	00700393          	li	t2,7
    1acc:	05d12223          	sw	t4,68(sp)
    1ad0:	00070413          	mv	s0,a4
    1ad4:	04512423          	sw	t0,72(sp)
    1ad8:	04612623          	sw	t1,76(sp)
    1adc:	05c12a23          	sw	t3,84(sp)
    1ae0:	05012c23          	sw	a6,88(sp)
    1ae4:	00011997          	auipc	s3,0x11
    1ae8:	28498993          	addi	s3,s3,644 # 12d68 <blanks.1>
    1aec:	00c0006f          	j	1af8 <_vfprintf_r+0x1400>
    1af0:	ff040413          	addi	s0,s0,-16
    1af4:	048a5863          	bge	s4,s0,1b44 <_vfprintf_r+0x144c>
    1af8:	01058593          	addi	a1,a1,16
    1afc:	00160613          	addi	a2,a2,1
    1b00:	0137a023          	sw	s3,0(a5)
    1b04:	0147a223          	sw	s4,4(a5)
    1b08:	0ab12c23          	sw	a1,184(sp)
    1b0c:	0ac12a23          	sw	a2,180(sp)
    1b10:	00878793          	addi	a5,a5,8
    1b14:	fcc3dee3          	bge	t2,a2,1af0 <_vfprintf_r+0x13f8>
    1b18:	00812583          	lw	a1,8(sp)
    1b1c:	0b010613          	addi	a2,sp,176
    1b20:	00048513          	mv	a0,s1
    1b24:	1e8020ef          	jal	3d0c <__sprint_r>
    1b28:	ce051ee3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1b2c:	ff040413          	addi	s0,s0,-16
    1b30:	0b812583          	lw	a1,184(sp)
    1b34:	0b412603          	lw	a2,180(sp)
    1b38:	0bc10793          	addi	a5,sp,188
    1b3c:	00700393          	li	t2,7
    1b40:	fa8a4ce3          	blt	s4,s0,1af8 <_vfprintf_r+0x1400>
    1b44:	04412e83          	lw	t4,68(sp)
    1b48:	04812283          	lw	t0,72(sp)
    1b4c:	04c12303          	lw	t1,76(sp)
    1b50:	05412e03          	lw	t3,84(sp)
    1b54:	05812803          	lw	a6,88(sp)
    1b58:	00040713          	mv	a4,s0
    1b5c:	00098893          	mv	a7,s3
    1b60:	00078413          	mv	s0,a5
    1b64:	00b70a33          	add	s4,a4,a1
    1b68:	00160513          	addi	a0,a2,1
    1b6c:	00e42223          	sw	a4,4(s0)
    1b70:	0b412c23          	sw	s4,184(sp)
    1b74:	0aa12a23          	sw	a0,180(sp)
    1b78:	01142023          	sw	a7,0(s0)
    1b7c:	00700713          	li	a4,7
    1b80:	02a744e3          	blt	a4,a0,23a8 <_vfprintf_r+0x1cb0>
    1b84:	07f14703          	lbu	a4,127(sp)
    1b88:	00840413          	addi	s0,s0,8
    1b8c:	2c071063          	bnez	a4,1e4c <_vfprintf_r+0x1754>
    1b90:	00029463          	bnez	t0,1b98 <_vfprintf_r+0x14a0>
    1b94:	e11fe06f          	j	9a4 <_vfprintf_r+0x2ac>
    1b98:	00000293          	li	t0,0
    1b9c:	dd1fe06f          	j	96c <_vfprintf_r+0x274>
    1ba0:	00ec76b3          	and	a3,s8,a4
    1ba4:	d2069ce3          	bnez	a3,18dc <_vfprintf_r+0x11e4>
    1ba8:	01942023          	sw	s9,0(s0)
    1bac:	00e42223          	sw	a4,4(s0)
    1bb0:	0b412c23          	sw	s4,184(sp)
    1bb4:	0b512a23          	sw	s5,180(sp)
    1bb8:	00700793          	li	a5,7
    1bbc:	dd57d2e3          	bge	a5,s5,1980 <_vfprintf_r+0x1288>
    1bc0:	00812583          	lw	a1,8(sp)
    1bc4:	0b010613          	addi	a2,sp,176
    1bc8:	00048513          	mv	a0,s1
    1bcc:	03012223          	sw	a6,36(sp)
    1bd0:	03d12023          	sw	t4,32(sp)
    1bd4:	138020ef          	jal	3d0c <__sprint_r>
    1bd8:	c40516e3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1bdc:	0b812a03          	lw	s4,184(sp)
    1be0:	0b412a83          	lw	s5,180(sp)
    1be4:	02412803          	lw	a6,36(sp)
    1be8:	02012e83          	lw	t4,32(sp)
    1bec:	0bc10b13          	addi	s6,sp,188
    1bf0:	d91ff06f          	j	1980 <_vfprintf_r+0x1288>
    1bf4:	00200293          	li	t0,2
    1bf8:	ebdff06f          	j	1ab4 <_vfprintf_r+0x13bc>
    1bfc:	01812703          	lw	a4,24(sp)
    1c00:	00100793          	li	a5,1
    1c04:	d6e7dee3          	bge	a5,a4,1980 <_vfprintf_r+0x1288>
    1c08:	01100793          	li	a5,17
    1c0c:	00e7c463          	blt	a5,a4,1c14 <_vfprintf_r+0x151c>
    1c10:	6690106f          	j	3a78 <_vfprintf_r+0x3380>
    1c14:	000a0693          	mv	a3,s4
    1c18:	00040993          	mv	s3,s0
    1c1c:	01000c93          	li	s9,16
    1c20:	00700793          	li	a5,7
    1c24:	03d12023          	sw	t4,32(sp)
    1c28:	00080a13          	mv	s4,a6
    1c2c:	00011417          	auipc	s0,0x11
    1c30:	12c40413          	addi	s0,s0,300 # 12d58 <zeroes.0>
    1c34:	00c0006f          	j	1c40 <_vfprintf_r+0x1548>
    1c38:	ff098993          	addi	s3,s3,-16
    1c3c:	3f3cd063          	bge	s9,s3,201c <_vfprintf_r+0x1924>
    1c40:	01068693          	addi	a3,a3,16
    1c44:	001a8a93          	addi	s5,s5,1
    1c48:	008b2023          	sw	s0,0(s6)
    1c4c:	019b2223          	sw	s9,4(s6)
    1c50:	0ad12c23          	sw	a3,184(sp)
    1c54:	0b512a23          	sw	s5,180(sp)
    1c58:	008b0b13          	addi	s6,s6,8
    1c5c:	fd57dee3          	bge	a5,s5,1c38 <_vfprintf_r+0x1540>
    1c60:	00812583          	lw	a1,8(sp)
    1c64:	0b010613          	addi	a2,sp,176
    1c68:	00048513          	mv	a0,s1
    1c6c:	0a0020ef          	jal	3d0c <__sprint_r>
    1c70:	ba051ae3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1c74:	0b812683          	lw	a3,184(sp)
    1c78:	0b412a83          	lw	s5,180(sp)
    1c7c:	0bc10b13          	addi	s6,sp,188
    1c80:	00700793          	li	a5,7
    1c84:	fb5ff06f          	j	1c38 <_vfprintf_r+0x1540>
    1c88:	01812783          	lw	a5,24(sp)
    1c8c:	000e0b13          	mv	s6,t3
    1c90:	01c7d463          	bge	a5,t3,1c98 <_vfprintf_r+0x15a0>
    1c94:	00078b13          	mv	s6,a5
    1c98:	03605863          	blez	s6,1cc8 <_vfprintf_r+0x15d0>
    1c9c:	0b412703          	lw	a4,180(sp)
    1ca0:	016a0a33          	add	s4,s4,s6
    1ca4:	01942023          	sw	s9,0(s0)
    1ca8:	00170713          	addi	a4,a4,1
    1cac:	01642223          	sw	s6,4(s0)
    1cb0:	0b412c23          	sw	s4,184(sp)
    1cb4:	0ae12a23          	sw	a4,180(sp)
    1cb8:	00700693          	li	a3,7
    1cbc:	00840413          	addi	s0,s0,8
    1cc0:	00e6d463          	bge	a3,a4,1cc8 <_vfprintf_r+0x15d0>
    1cc4:	7380106f          	j	33fc <_vfprintf_r+0x2d04>
    1cc8:	fffb4713          	not	a4,s6
    1ccc:	41f75713          	srai	a4,a4,0x1f
    1cd0:	00eb7b33          	and	s6,s6,a4
    1cd4:	416e0b33          	sub	s6,t3,s6
    1cd8:	536044e3          	bgtz	s6,2a00 <_vfprintf_r+0x2308>
    1cdc:	400c7713          	andi	a4,s8,1024
    1ce0:	01cc8fb3          	add	t6,s9,t3
    1ce4:	00070463          	beqz	a4,1cec <_vfprintf_r+0x15f4>
    1ce8:	3a40106f          	j	308c <_vfprintf_r+0x2994>
    1cec:	08412a83          	lw	s5,132(sp)
    1cf0:	01812783          	lw	a5,24(sp)
    1cf4:	00fac863          	blt	s5,a5,1d04 <_vfprintf_r+0x160c>
    1cf8:	001c7713          	andi	a4,s8,1
    1cfc:	00071463          	bnez	a4,1d04 <_vfprintf_r+0x160c>
    1d00:	0a80106f          	j	2da8 <_vfprintf_r+0x26b0>
    1d04:	02c12783          	lw	a5,44(sp)
    1d08:	0b412703          	lw	a4,180(sp)
    1d0c:	00700693          	li	a3,7
    1d10:	00fa0a33          	add	s4,s4,a5
    1d14:	03012783          	lw	a5,48(sp)
    1d18:	00170713          	addi	a4,a4,1
    1d1c:	0b412c23          	sw	s4,184(sp)
    1d20:	00f42023          	sw	a5,0(s0)
    1d24:	02c12783          	lw	a5,44(sp)
    1d28:	0ae12a23          	sw	a4,180(sp)
    1d2c:	00840413          	addi	s0,s0,8
    1d30:	fef42e23          	sw	a5,-4(s0)
    1d34:	00e6d463          	bge	a3,a4,1d3c <_vfprintf_r+0x1644>
    1d38:	7000106f          	j	3438 <_vfprintf_r+0x2d40>
    1d3c:	01812783          	lw	a5,24(sp)
    1d40:	00fc87b3          	add	a5,s9,a5
    1d44:	41f78b33          	sub	s6,a5,t6
    1d48:	01812783          	lw	a5,24(sp)
    1d4c:	41578ab3          	sub	s5,a5,s5
    1d50:	016ad463          	bge	s5,s6,1d58 <_vfprintf_r+0x1660>
    1d54:	000a8b13          	mv	s6,s5
    1d58:	03605863          	blez	s6,1d88 <_vfprintf_r+0x1690>
    1d5c:	0b412783          	lw	a5,180(sp)
    1d60:	016a0a33          	add	s4,s4,s6
    1d64:	01f42023          	sw	t6,0(s0)
    1d68:	00178793          	addi	a5,a5,1
    1d6c:	01642223          	sw	s6,4(s0)
    1d70:	0b412c23          	sw	s4,184(sp)
    1d74:	0af12a23          	sw	a5,180(sp)
    1d78:	00700713          	li	a4,7
    1d7c:	00840413          	addi	s0,s0,8
    1d80:	00f75463          	bge	a4,a5,1d88 <_vfprintf_r+0x1690>
    1d84:	7300106f          	j	34b4 <_vfprintf_r+0x2dbc>
    1d88:	fffb4793          	not	a5,s6
    1d8c:	41f7d793          	srai	a5,a5,0x1f
    1d90:	00fb7b33          	and	s6,s6,a5
    1d94:	416a8ab3          	sub	s5,s5,s6
    1d98:	01504463          	bgtz	s5,1da0 <_vfprintf_r+0x16a8>
    1d9c:	c41fe06f          	j	9dc <_vfprintf_r+0x2e4>
    1da0:	01000b13          	li	s6,16
    1da4:	0b412783          	lw	a5,180(sp)
    1da8:	015b4463          	blt	s6,s5,1db0 <_vfprintf_r+0x16b8>
    1dac:	3f10106f          	j	399c <_vfprintf_r+0x32a4>
    1db0:	00040693          	mv	a3,s0
    1db4:	000a0613          	mv	a2,s4
    1db8:	00700c93          	li	s9,7
    1dbc:	000e8413          	mv	s0,t4
    1dc0:	00080a13          	mv	s4,a6
    1dc4:	00011997          	auipc	s3,0x11
    1dc8:	f9498993          	addi	s3,s3,-108 # 12d58 <zeroes.0>
    1dcc:	00c0006f          	j	1dd8 <_vfprintf_r+0x16e0>
    1dd0:	ff0a8a93          	addi	s5,s5,-16
    1dd4:	3d5b52e3          	bge	s6,s5,2998 <_vfprintf_r+0x22a0>
    1dd8:	01060613          	addi	a2,a2,16
    1ddc:	00178793          	addi	a5,a5,1
    1de0:	0136a023          	sw	s3,0(a3)
    1de4:	0166a223          	sw	s6,4(a3)
    1de8:	0ac12c23          	sw	a2,184(sp)
    1dec:	0af12a23          	sw	a5,180(sp)
    1df0:	00868693          	addi	a3,a3,8
    1df4:	fcfcdee3          	bge	s9,a5,1dd0 <_vfprintf_r+0x16d8>
    1df8:	00812583          	lw	a1,8(sp)
    1dfc:	0b010613          	addi	a2,sp,176
    1e00:	00048513          	mv	a0,s1
    1e04:	709010ef          	jal	3d0c <__sprint_r>
    1e08:	a0051ee3          	bnez	a0,1824 <_vfprintf_r+0x112c>
    1e0c:	0b812603          	lw	a2,184(sp)
    1e10:	0b412783          	lw	a5,180(sp)
    1e14:	0bc10693          	addi	a3,sp,188
    1e18:	fb9ff06f          	j	1dd0 <_vfprintf_r+0x16d8>
    1e1c:	01271693          	slli	a3,a4,0x12
    1e20:	0006c463          	bltz	a3,1e28 <_vfprintf_r+0x1730>
    1e24:	979fe06f          	j	79c <_vfprintf_r+0xa4>
    1e28:	0710106f          	j	3698 <_vfprintf_r+0x2fa0>
    1e2c:	001c7793          	andi	a5,s8,1
    1e30:	00079463          	bnez	a5,1e38 <_vfprintf_r+0x1740>
    1e34:	ba9fe06f          	j	9dc <_vfprintf_r+0x2e4>
    1e38:	b38ff06f          	j	1170 <_vfprintf_r+0xa78>
    1e3c:	00478793          	addi	a5,a5,4
    1e40:	000bc303          	lbu	t1,0(s7)
    1e44:	00f12823          	sw	a5,16(sp)
    1e48:	a4dfe06f          	j	894 <_vfprintf_r+0x19c>
    1e4c:	00028713          	mv	a4,t0
    1e50:	00000293          	li	t0,0
    1e54:	ae5fe06f          	j	938 <_vfprintf_r+0x240>
    1e58:	000a8813          	mv	a6,s5
    1e5c:	00012a23          	sw	zero,20(sp)
    1e60:	02012223          	sw	zero,36(sp)
    1e64:	02012023          	sw	zero,32(sp)
    1e68:	00000e13          	li	t3,0
    1e6c:	aadfe06f          	j	918 <_vfprintf_r+0x220>
    1e70:	01012783          	lw	a5,16(sp)
    1e74:	00c12683          	lw	a3,12(sp)
    1e78:	00c12603          	lw	a2,12(sp)
    1e7c:	0007a783          	lw	a5,0(a5)
    1e80:	41f6d693          	srai	a3,a3,0x1f
    1e84:	00e12823          	sw	a4,16(sp)
    1e88:	00c7a023          	sw	a2,0(a5)
    1e8c:	00d7a223          	sw	a3,4(a5)
    1e90:	999fe06f          	j	828 <_vfprintf_r+0x130>
    1e94:	01012783          	lw	a5,16(sp)
    1e98:	00478793          	addi	a5,a5,4
    1e9c:	01012703          	lw	a4,16(sp)
    1ea0:	00000613          	li	a2,0
    1ea4:	00f12823          	sw	a5,16(sp)
    1ea8:	00072703          	lw	a4,0(a4)
    1eac:	d60ff06f          	j	140c <_vfprintf_r+0xd14>
    1eb0:	01012783          	lw	a5,16(sp)
    1eb4:	06010513          	addi	a0,sp,96
    1eb8:	02612023          	sw	t1,32(sp)
    1ebc:	0007a783          	lw	a5,0(a5)
    1ec0:	01312a23          	sw	s3,20(sp)
    1ec4:	0007a703          	lw	a4,0(a5)
    1ec8:	06e12023          	sw	a4,96(sp)
    1ecc:	0047a703          	lw	a4,4(a5)
    1ed0:	06e12223          	sw	a4,100(sp)
    1ed4:	0087a703          	lw	a4,8(a5)
    1ed8:	06e12423          	sw	a4,104(sp)
    1edc:	00c7a783          	lw	a5,12(a5)
    1ee0:	06f12623          	sw	a5,108(sp)
    1ee4:	43c100ef          	jal	12320 <__trunctfdf2>
    1ee8:	01012783          	lw	a5,16(sp)
    1eec:	02012303          	lw	t1,32(sp)
    1ef0:	02b12423          	sw	a1,40(sp)
    1ef4:	00478793          	addi	a5,a5,4
    1ef8:	00f12823          	sw	a5,16(sp)
    1efc:	02a12a23          	sw	a0,52(sp)
    1f00:	00098e93          	mv	t4,s3
    1f04:	c89fe06f          	j	b8c <_vfprintf_r+0x494>
    1f08:	000c0813          	mv	a6,s8
    1f0c:	ce4ff06f          	j	13f0 <_vfprintf_r+0xcf8>
    1f10:	01012783          	lw	a5,16(sp)
    1f14:	01012683          	lw	a3,16(sp)
    1f18:	010c7713          	andi	a4,s8,16
    1f1c:	00478793          	addi	a5,a5,4
    1f20:	0006a683          	lw	a3,0(a3)
    1f24:	00070463          	beqz	a4,1f2c <_vfprintf_r+0x1834>
    1f28:	4650106f          	j	3b8c <_vfprintf_r+0x3494>
    1f2c:	040c7713          	andi	a4,s8,64
    1f30:	36070ae3          	beqz	a4,2aa4 <_vfprintf_r+0x23ac>
    1f34:	01069a93          	slli	s5,a3,0x10
    1f38:	06010fa3          	sb	zero,127(sp)
    1f3c:	010ada93          	srli	s5,s5,0x10
    1f40:	00000713          	li	a4,0
    1f44:	6a0b48e3          	bltz	s6,2df4 <_vfprintf_r+0x26fc>
    1f48:	015b6e33          	or	t3,s6,s5
    1f4c:	00f12823          	sw	a5,16(sp)
    1f50:	f7fc7c13          	andi	s8,s8,-129
    1f54:	c40e1c63          	bnez	t3,13ac <_vfprintf_r+0xcb4>
    1f58:	e08ff06f          	j	1560 <_vfprintf_r+0xe68>
    1f5c:	ffe50513          	addi	a0,a0,-2
    1f60:	03000713          	li	a4,48
    1f64:	16010793          	addi	a5,sp,352
    1f68:	40a78ab3          	sub	s5,a5,a0
    1f6c:	feec8fa3          	sb	a4,-1(s9)
    1f70:	000b0813          	mv	a6,s6
    1f74:	015b5463          	bge	s6,s5,1f7c <_vfprintf_r+0x1884>
    1f78:	000a8813          	mv	a6,s5
    1f7c:	00050c93          	mv	s9,a0
    1f80:	00012a23          	sw	zero,20(sp)
    1f84:	02012223          	sw	zero,36(sp)
    1f88:	02012023          	sw	zero,32(sp)
    1f8c:	00000e13          	li	t3,0
    1f90:	989fe06f          	j	918 <_vfprintf_r+0x220>
    1f94:	07f14883          	lbu	a7,127(sp)
    1f98:	00100813          	li	a6,1
    1f9c:	00000e13          	li	t3,0
    1fa0:	00100a93          	li	s5,1
    1fa4:	15f10c93          	addi	s9,sp,351
    1fa8:	c30ff06f          	j	13d8 <_vfprintf_r+0xce0>
    1fac:	000f0c13          	mv	s8,t5
    1fb0:	bfcff06f          	j	13ac <_vfprintf_r+0xcb4>
    1fb4:	002c6c13          	ori	s8,s8,2
    1fb8:	00d12823          	sw	a3,16(sp)
    1fbc:	00200e13          	li	t3,2
    1fc0:	00000893          	li	a7,0
    1fc4:	00011597          	auipc	a1,0x11
    1fc8:	8dc58593          	addi	a1,a1,-1828 # 128a0 <__clzsi2+0xd8>
    1fcc:	07800313          	li	t1,120
    1fd0:	16010c93          	addi	s9,sp,352
    1fd4:	00f77793          	andi	a5,a4,15
    1fd8:	00f587b3          	add	a5,a1,a5
    1fdc:	0007c783          	lbu	a5,0(a5)
    1fe0:	00475713          	srli	a4,a4,0x4
    1fe4:	fffc8c93          	addi	s9,s9,-1
    1fe8:	00fc8023          	sb	a5,0(s9)
    1fec:	01c61793          	slli	a5,a2,0x1c
    1ff0:	00e78733          	add	a4,a5,a4
    1ff4:	00465613          	srli	a2,a2,0x4
    1ff8:	00c767b3          	or	a5,a4,a2
    1ffc:	fc079ce3          	bnez	a5,1fd4 <_vfprintf_r+0x18dc>
    2000:	16010793          	addi	a5,sp,352
    2004:	41978ab3          	sub	s5,a5,s9
    2008:	000b0813          	mv	a6,s6
    200c:	b55b5663          	bge	s6,s5,1358 <_vfprintf_r+0xc60>
    2010:	000a8813          	mv	a6,s5
    2014:	00012a23          	sw	zero,20(sp)
    2018:	b44ff06f          	j	135c <_vfprintf_r+0xc64>
    201c:	02012e83          	lw	t4,32(sp)
    2020:	000a0813          	mv	a6,s4
    2024:	00040713          	mv	a4,s0
    2028:	00068a13          	mv	s4,a3
    202c:	00098413          	mv	s0,s3
    2030:	008a0a33          	add	s4,s4,s0
    2034:	001a8a93          	addi	s5,s5,1
    2038:	0b412c23          	sw	s4,184(sp)
    203c:	0b512a23          	sw	s5,180(sp)
    2040:	00eb2023          	sw	a4,0(s6)
    2044:	008b2223          	sw	s0,4(s6)
    2048:	00700793          	li	a5,7
    204c:	9357d8e3          	bge	a5,s5,197c <_vfprintf_r+0x1284>
    2050:	00812583          	lw	a1,8(sp)
    2054:	0b010613          	addi	a2,sp,176
    2058:	00048513          	mv	a0,s1
    205c:	03012223          	sw	a6,36(sp)
    2060:	03d12023          	sw	t4,32(sp)
    2064:	4a9010ef          	jal	3d0c <__sprint_r>
    2068:	fa051e63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    206c:	0b812a03          	lw	s4,184(sp)
    2070:	0b412a83          	lw	s5,180(sp)
    2074:	02012e83          	lw	t4,32(sp)
    2078:	02412803          	lw	a6,36(sp)
    207c:	0bc10b13          	addi	s6,sp,188
    2080:	901ff06f          	j	1980 <_vfprintf_r+0x1288>
    2084:	fff00b13          	li	s6,-1
    2088:	00068b93          	mv	s7,a3
    208c:	80dfe06f          	j	898 <_vfprintf_r+0x1a0>
    2090:	00098e93          	mv	t4,s3
    2094:	00011597          	auipc	a1,0x11
    2098:	82058593          	addi	a1,a1,-2016 # 128b4 <__clzsi2+0xec>
    209c:	020c7793          	andi	a5,s8,32
    20a0:	20078a63          	beqz	a5,22b4 <_vfprintf_r+0x1bbc>
    20a4:	01012783          	lw	a5,16(sp)
    20a8:	00778793          	addi	a5,a5,7
    20ac:	ff87f793          	andi	a5,a5,-8
    20b0:	0007a703          	lw	a4,0(a5)
    20b4:	0047a603          	lw	a2,4(a5)
    20b8:	00878693          	addi	a3,a5,8
    20bc:	001c7793          	andi	a5,s8,1
    20c0:	00c76533          	or	a0,a4,a2
    20c4:	00078463          	beqz	a5,20cc <_vfprintf_r+0x19d4>
    20c8:	70051a63          	bnez	a0,27dc <_vfprintf_r+0x20e4>
    20cc:	06010fa3          	sb	zero,127(sp)
    20d0:	280b4463          	bltz	s6,2358 <_vfprintf_r+0x1c60>
    20d4:	b7fc7c13          	andi	s8,s8,-1153
    20d8:	720b1863          	bnez	s6,2808 <_vfprintf_r+0x2110>
    20dc:	72051663          	bnez	a0,2808 <_vfprintf_r+0x2110>
    20e0:	00d12823          	sw	a3,16(sp)
    20e4:	00000e13          	li	t3,0
    20e8:	a5cff06f          	j	1344 <_vfprintf_r+0xc4c>
    20ec:	00098e93          	mv	t4,s3
    20f0:	00010597          	auipc	a1,0x10
    20f4:	7b058593          	addi	a1,a1,1968 # 128a0 <__clzsi2+0xd8>
    20f8:	fa5ff06f          	j	209c <_vfprintf_r+0x19a4>
    20fc:	00812583          	lw	a1,8(sp)
    2100:	0b010613          	addi	a2,sp,176
    2104:	00048513          	mv	a0,s1
    2108:	03012223          	sw	a6,36(sp)
    210c:	03d12023          	sw	t4,32(sp)
    2110:	3fd010ef          	jal	3d0c <__sprint_r>
    2114:	f0051863          	bnez	a0,1824 <_vfprintf_r+0x112c>
    2118:	0b812a03          	lw	s4,184(sp)
    211c:	02412803          	lw	a6,36(sp)
    2120:	02012e83          	lw	t4,32(sp)
    2124:	0bc10413          	addi	s0,sp,188
    2128:	87cff06f          	j	11a4 <_vfprintf_r+0xaac>
    212c:	001bc303          	lbu	t1,1(s7)
    2130:	200c6c13          	ori	s8,s8,512
    2134:	001b8b93          	addi	s7,s7,1
    2138:	f5cfe06f          	j	894 <_vfprintf_r+0x19c>
    213c:	001bc303          	lbu	t1,1(s7)
    2140:	020c6c13          	ori	s8,s8,32
    2144:	001b8b93          	addi	s7,s7,1
    2148:	f4cfe06f          	j	894 <_vfprintf_r+0x19c>
    214c:	00600793          	li	a5,6
    2150:	000b0813          	mv	a6,s6
    2154:	3d67e0e3          	bltu	a5,s6,2d14 <_vfprintf_r+0x261c>
    2158:	01112823          	sw	a7,16(sp)
    215c:	00012a23          	sw	zero,20(sp)
    2160:	00080a93          	mv	s5,a6
    2164:	00000b13          	li	s6,0
    2168:	02012223          	sw	zero,36(sp)
    216c:	02012023          	sw	zero,32(sp)
    2170:	00000e13          	li	t3,0
    2174:	00010c97          	auipc	s9,0x10
    2178:	754c8c93          	addi	s9,s9,1876 # 128c8 <__clzsi2+0x100>
    217c:	f9cfe06f          	j	918 <_vfprintf_r+0x220>
    2180:	400c7793          	andi	a5,s8,1024
    2184:	02812223          	sw	s0,36(sp)
    2188:	04912423          	sw	s1,72(sp)
    218c:	00f12a23          	sw	a5,20(sp)
    2190:	16010993          	addi	s3,sp,352
    2194:	03d12023          	sw	t4,32(sp)
    2198:	04612223          	sw	t1,68(sp)
    219c:	00000413          	li	s0,0
    21a0:	00070a13          	mv	s4,a4
    21a4:	000a8493          	mv	s1,s5
    21a8:	0340006f          	j	21dc <_vfprintf_r+0x1ae4>
    21ac:	00048513          	mv	a0,s1
    21b0:	000a0593          	mv	a1,s4
    21b4:	00a00613          	li	a2,10
    21b8:	00000693          	li	a3,0
    21bc:	00912c23          	sw	s1,24(sp)
    21c0:	000a0a93          	mv	s5,s4
    21c4:	4f00c0ef          	jal	e6b4 <__udivdi3>
    21c8:	000c8993          	mv	s3,s9
    21cc:	00050493          	mv	s1,a0
    21d0:	00058a13          	mv	s4,a1
    21d4:	000a9463          	bnez	s5,21dc <_vfprintf_r+0x1ae4>
    21d8:	2a80106f          	j	3480 <_vfprintf_r+0x2d88>
    21dc:	00a00613          	li	a2,10
    21e0:	00000693          	li	a3,0
    21e4:	00048513          	mv	a0,s1
    21e8:	000a0593          	mv	a1,s4
    21ec:	3710c0ef          	jal	ed5c <__umoddi3>
    21f0:	03050793          	addi	a5,a0,48
    21f4:	fef98fa3          	sb	a5,-1(s3)
    21f8:	01412783          	lw	a5,20(sp)
    21fc:	fff98c93          	addi	s9,s3,-1
    2200:	00140413          	addi	s0,s0,1
    2204:	fa0784e3          	beqz	a5,21ac <_vfprintf_r+0x1ab4>
    2208:	03c12783          	lw	a5,60(sp)
    220c:	0007c783          	lbu	a5,0(a5)
    2210:	f0178713          	addi	a4,a5,-255
    2214:	f8070ce3          	beqz	a4,21ac <_vfprintf_r+0x1ab4>
    2218:	f8879ae3          	bne	a5,s0,21ac <_vfprintf_r+0x1ab4>
    221c:	460a10e3          	bnez	s4,2e7c <_vfprintf_r+0x2784>
    2220:	00900793          	li	a5,9
    2224:	4497ece3          	bltu	a5,s1,2e7c <_vfprintf_r+0x2784>
    2228:	16010793          	addi	a5,sp,352
    222c:	00812c23          	sw	s0,24(sp)
    2230:	41978ab3          	sub	s5,a5,s9
    2234:	02012e83          	lw	t4,32(sp)
    2238:	04412303          	lw	t1,68(sp)
    223c:	02412403          	lw	s0,36(sp)
    2240:	04812483          	lw	s1,72(sp)
    2244:	000b0813          	mv	a6,s6
    2248:	2d5b42e3          	blt	s6,s5,2d0c <_vfprintf_r+0x2614>
    224c:	07f14883          	lbu	a7,127(sp)
    2250:	00000e13          	li	t3,0
    2254:	00012a23          	sw	zero,20(sp)
    2258:	904ff06f          	j	135c <_vfprintf_r+0xc64>
    225c:	00800613          	li	a2,8
    2260:	00000593          	li	a1,0
    2264:	0a810513          	addi	a0,sp,168
    2268:	02612023          	sw	t1,32(sp)
    226c:	01d12a23          	sw	t4,20(sp)
    2270:	699030ef          	jal	6108 <memset>
    2274:	01012783          	lw	a5,16(sp)
    2278:	0fc10c93          	addi	s9,sp,252
    227c:	0a810693          	addi	a3,sp,168
    2280:	0007a603          	lw	a2,0(a5)
    2284:	000c8593          	mv	a1,s9
    2288:	00048513          	mv	a0,s1
    228c:	6b4090ef          	jal	b940 <_wcrtomb_r>
    2290:	fff00793          	li	a5,-1
    2294:	01412e83          	lw	t4,20(sp)
    2298:	02012303          	lw	t1,32(sp)
    229c:	00050a93          	mv	s5,a0
    22a0:	0cf50663          	beq	a0,a5,236c <_vfprintf_r+0x1c74>
    22a4:	fff54813          	not	a6,a0
    22a8:	41f85813          	srai	a6,a6,0x1f
    22ac:	01057833          	and	a6,a0,a6
    22b0:	cd9fe06f          	j	f88 <_vfprintf_r+0x890>
    22b4:	01012703          	lw	a4,16(sp)
    22b8:	010c7793          	andi	a5,s8,16
    22bc:	00470693          	addi	a3,a4,4
    22c0:	00072703          	lw	a4,0(a4)
    22c4:	08079663          	bnez	a5,2350 <_vfprintf_r+0x1c58>
    22c8:	040c7793          	andi	a5,s8,64
    22cc:	06078e63          	beqz	a5,2348 <_vfprintf_r+0x1c50>
    22d0:	01071713          	slli	a4,a4,0x10
    22d4:	01075713          	srli	a4,a4,0x10
    22d8:	00000613          	li	a2,0
    22dc:	de1ff06f          	j	20bc <_vfprintf_r+0x19c4>
    22e0:	00812583          	lw	a1,8(sp)
    22e4:	0b010613          	addi	a2,sp,176
    22e8:	00048513          	mv	a0,s1
    22ec:	03012223          	sw	a6,36(sp)
    22f0:	03d12023          	sw	t4,32(sp)
    22f4:	219010ef          	jal	3d0c <__sprint_r>
    22f8:	d2051663          	bnez	a0,1824 <_vfprintf_r+0x112c>
    22fc:	0b812a03          	lw	s4,184(sp)
    2300:	0b412a83          	lw	s5,180(sp)
    2304:	02412803          	lw	a6,36(sp)
    2308:	02012e83          	lw	t4,32(sp)
    230c:	0bc10b13          	addi	s6,sp,188
    2310:	e18ff06f          	j	1928 <_vfprintf_r+0x1230>
    2314:	00812583          	lw	a1,8(sp)
    2318:	0b010613          	addi	a2,sp,176
    231c:	00048513          	mv	a0,s1
    2320:	03012223          	sw	a6,36(sp)
    2324:	03d12023          	sw	t4,32(sp)
    2328:	1e5010ef          	jal	3d0c <__sprint_r>
    232c:	ce051c63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    2330:	0b812a03          	lw	s4,184(sp)
    2334:	0b412a83          	lw	s5,180(sp)
    2338:	02412803          	lw	a6,36(sp)
    233c:	02012e83          	lw	t4,32(sp)
    2340:	0bc10b13          	addi	s6,sp,188
    2344:	db4ff06f          	j	18f8 <_vfprintf_r+0x1200>
    2348:	200c7793          	andi	a5,s8,512
    234c:	26079ee3          	bnez	a5,2dc8 <_vfprintf_r+0x26d0>
    2350:	00000613          	li	a2,0
    2354:	d69ff06f          	j	20bc <_vfprintf_r+0x19c4>
    2358:	bffc7c13          	andi	s8,s8,-1025
    235c:	00d12823          	sw	a3,16(sp)
    2360:	00000e13          	li	t3,0
    2364:	00000893          	li	a7,0
    2368:	c69ff06f          	j	1fd0 <_vfprintf_r+0x18d8>
    236c:	00812983          	lw	s3,8(sp)
    2370:	00c99783          	lh	a5,12(s3)
    2374:	0649a703          	lw	a4,100(s3)
    2378:	0407e693          	ori	a3,a5,64
    237c:	00d99623          	sh	a3,12(s3)
    2380:	00177713          	andi	a4,a4,1
    2384:	00070463          	beqz	a4,238c <_vfprintf_r+0x1c94>
    2388:	2ec0106f          	j	3674 <_vfprintf_r+0x2f7c>
    238c:	2007f793          	andi	a5,a5,512
    2390:	00078463          	beqz	a5,2398 <_vfprintf_r+0x1ca0>
    2394:	2e00106f          	j	3674 <_vfprintf_r+0x2f7c>
    2398:	0589a503          	lw	a0,88(s3)
    239c:	accfe0ef          	jal	668 <__retarget_lock_release_recursive>
    23a0:	00c99783          	lh	a5,12(s3)
    23a4:	cb0ff06f          	j	1854 <_vfprintf_r+0x115c>
    23a8:	00812583          	lw	a1,8(sp)
    23ac:	0b010613          	addi	a2,sp,176
    23b0:	00048513          	mv	a0,s1
    23b4:	05012c23          	sw	a6,88(sp)
    23b8:	05c12a23          	sw	t3,84(sp)
    23bc:	04612623          	sw	t1,76(sp)
    23c0:	04512423          	sw	t0,72(sp)
    23c4:	05d12223          	sw	t4,68(sp)
    23c8:	145010ef          	jal	3d0c <__sprint_r>
    23cc:	c4051c63          	bnez	a0,1824 <_vfprintf_r+0x112c>
    23d0:	07f14703          	lbu	a4,127(sp)
    23d4:	0b812a03          	lw	s4,184(sp)
    23d8:	04412e83          	lw	t4,68(sp)
    23dc:	04812283          	lw	t0,72(sp)
    23e0:	04c12303          	lw	t1,76(sp)
    23e4:	05412e03          	lw	t3,84(sp)
    23e8:	05812803          	lw	a6,88(sp)
    23ec:	6a070263          	beqz	a4,2a90 <_vfprintf_r+0x2398>
    23f0:	00028713          	mv	a4,t0
    23f4:	0b412503          	lw	a0,180(sp)
    23f8:	00000293          	li	t0,0
    23fc:	0bc10413          	addi	s0,sp,188
    2400:	d38fe06f          	j	938 <_vfprintf_r+0x240>
    2404:	00048513          	mv	a0,s1
    2408:	144020ef          	jal	454c <__sinit>
    240c:	b48fe06f          	j	754 <_vfprintf_r+0x5c>
    2410:	03412703          	lw	a4,52(sp)
    2414:	02812783          	lw	a5,40(sp)
    2418:	02612023          	sw	t1,32(sp)
    241c:	00070613          	mv	a2,a4
    2420:	00078693          	mv	a3,a5
    2424:	00070513          	mv	a0,a4
    2428:	00078593          	mv	a1,a5
    242c:	01d12a23          	sw	t4,20(sp)
    2430:	49d0f0ef          	jal	120cc <__unorddf2>
    2434:	01412e83          	lw	t4,20(sp)
    2438:	02012303          	lw	t1,32(sp)
    243c:	00050463          	beqz	a0,2444 <_vfprintf_r+0x1d4c>
    2440:	4b80106f          	j	38f8 <_vfprintf_r+0x3200>
    2444:	fdf37a93          	andi	s5,t1,-33
    2448:	04100793          	li	a5,65
    244c:	6cfa9463          	bne	s5,a5,2b14 <_vfprintf_r+0x241c>
    2450:	03000793          	li	a5,48
    2454:	08f10023          	sb	a5,128(sp)
    2458:	06100713          	li	a4,97
    245c:	05800793          	li	a5,88
    2460:	28e30ae3          	beq	t1,a4,2ef4 <_vfprintf_r+0x27fc>
    2464:	08f100a3          	sb	a5,129(sp)
    2468:	06300793          	li	a5,99
    246c:	2967c8e3          	blt	a5,s6,2efc <_vfprintf_r+0x2804>
    2470:	02812783          	lw	a5,40(sp)
    2474:	0007d463          	bgez	a5,247c <_vfprintf_r+0x1d84>
    2478:	23c0106f          	j	36b4 <_vfprintf_r+0x2fbc>
    247c:	02812703          	lw	a4,40(sp)
    2480:	00000a13          	li	s4,0
    2484:	00012a23          	sw	zero,20(sp)
    2488:	0fc10c93          	addi	s9,sp,252
    248c:	03412503          	lw	a0,52(sp)
    2490:	002c6793          	ori	a5,s8,2
    2494:	00070593          	mv	a1,a4
    2498:	08410613          	addi	a2,sp,132
    249c:	02612223          	sw	t1,36(sp)
    24a0:	01d12c23          	sw	t4,24(sp)
    24a4:	02f12023          	sw	a5,32(sp)
    24a8:	084040ef          	jal	652c <frexp>
    24ac:	00011717          	auipc	a4,0x11
    24b0:	18c70713          	addi	a4,a4,396 # 13638 <__clz_tab+0x108>
    24b4:	00072603          	lw	a2,0(a4)
    24b8:	00472683          	lw	a3,4(a4)
    24bc:	0190e0ef          	jal	10cd4 <__muldf3>
    24c0:	00000613          	li	a2,0
    24c4:	00000693          	li	a3,0
    24c8:	00050a93          	mv	s5,a0
    24cc:	00058993          	mv	s3,a1
    24d0:	54c0e0ef          	jal	10a1c <__eqdf2>
    24d4:	01812e83          	lw	t4,24(sp)
    24d8:	02412303          	lw	t1,36(sp)
    24dc:	00051663          	bnez	a0,24e8 <_vfprintf_r+0x1df0>
    24e0:	00100713          	li	a4,1
    24e4:	08e12223          	sw	a4,132(sp)
    24e8:	00010797          	auipc	a5,0x10
    24ec:	3cc78793          	addi	a5,a5,972 # 128b4 <__clzsi2+0xec>
    24f0:	06100713          	li	a4,97
    24f4:	02f12223          	sw	a5,36(sp)
    24f8:	00e31863          	bne	t1,a4,2508 <_vfprintf_r+0x1e10>
    24fc:	00010797          	auipc	a5,0x10
    2500:	3a478793          	addi	a5,a5,932 # 128a0 <__clzsi2+0xd8>
    2504:	02f12223          	sw	a5,36(sp)
    2508:	00011717          	auipc	a4,0x11
    250c:	13870713          	addi	a4,a4,312 # 13640 <__clz_tab+0x110>
    2510:	00072783          	lw	a5,0(a4)
    2514:	00472803          	lw	a6,4(a4)
    2518:	05412623          	sw	s4,76(sp)
    251c:	00048c13          	mv	s8,s1
    2520:	00098a13          	mv	s4,s3
    2524:	02412483          	lw	s1,36(sp)
    2528:	00f12c23          	sw	a5,24(sp)
    252c:	01012e23          	sw	a6,28(sp)
    2530:	03d12c23          	sw	t4,56(sp)
    2534:	04812223          	sw	s0,68(sp)
    2538:	04612423          	sw	t1,72(sp)
    253c:	000c8993          	mv	s3,s9
    2540:	0200006f          	j	2560 <_vfprintf_r+0x1e68>
    2544:	00000613          	li	a2,0
    2548:	00000693          	li	a3,0
    254c:	fffb0413          	addi	s0,s6,-1
    2550:	4cc0e0ef          	jal	10a1c <__eqdf2>
    2554:	00051463          	bnez	a0,255c <_vfprintf_r+0x1e64>
    2558:	1b40106f          	j	370c <_vfprintf_r+0x3014>
    255c:	00040b13          	mv	s6,s0
    2560:	01812603          	lw	a2,24(sp)
    2564:	01c12683          	lw	a3,28(sp)
    2568:	000a8513          	mv	a0,s5
    256c:	000a0593          	mv	a1,s4
    2570:	7640e0ef          	jal	10cd4 <__muldf3>
    2574:	00058a93          	mv	s5,a1
    2578:	00050a13          	mv	s4,a0
    257c:	3a50f0ef          	jal	12120 <__fixdfsi>
    2580:	00050413          	mv	s0,a0
    2584:	41d0f0ef          	jal	121a0 <__floatsidf>
    2588:	00050613          	mv	a2,a0
    258c:	00058693          	mv	a3,a1
    2590:	000a0513          	mv	a0,s4
    2594:	000a8593          	mv	a1,s5
    2598:	7e90e0ef          	jal	11580 <__subdf3>
    259c:	00848733          	add	a4,s1,s0
    25a0:	00074703          	lbu	a4,0(a4)
    25a4:	00098f13          	mv	t5,s3
    25a8:	00050a93          	mv	s5,a0
    25ac:	00e98023          	sb	a4,0(s3)
    25b0:	00198993          	addi	s3,s3,1
    25b4:	00058a13          	mv	s4,a1
    25b8:	f80b16e3          	bnez	s6,2544 <_vfprintf_r+0x1e4c>
    25bc:	00011697          	auipc	a3,0x11
    25c0:	08c68693          	addi	a3,a3,140 # 13648 <__clz_tab+0x118>
    25c4:	0006a803          	lw	a6,0(a3)
    25c8:	0046a883          	lw	a7,4(a3)
    25cc:	03812e83          	lw	t4,56(sp)
    25d0:	04812303          	lw	t1,72(sp)
    25d4:	00080613          	mv	a2,a6
    25d8:	00088693          	mv	a3,a7
    25dc:	05d12a23          	sw	t4,84(sp)
    25e0:	03e12c23          	sw	t5,56(sp)
    25e4:	00612c23          	sw	t1,24(sp)
    25e8:	000c0493          	mv	s1,s8
    25ec:	00098c13          	mv	s8,s3
    25f0:	00058993          	mv	s3,a1
    25f4:	4b80e0ef          	jal	10aac <__gedf2>
    25f8:	00040b13          	mv	s6,s0
    25fc:	04c12a03          	lw	s4,76(sp)
    2600:	04412403          	lw	s0,68(sp)
    2604:	01812303          	lw	t1,24(sp)
    2608:	03812f03          	lw	t5,56(sp)
    260c:	05412e83          	lw	t4,84(sp)
    2610:	04a04463          	bgtz	a0,2658 <_vfprintf_r+0x1f60>
    2614:	00011797          	auipc	a5,0x11
    2618:	03478793          	addi	a5,a5,52 # 13648 <__clz_tab+0x118>
    261c:	0007a803          	lw	a6,0(a5)
    2620:	0047a883          	lw	a7,4(a5)
    2624:	000a8513          	mv	a0,s5
    2628:	00098593          	mv	a1,s3
    262c:	00080613          	mv	a2,a6
    2630:	00088693          	mv	a3,a7
    2634:	04612223          	sw	t1,68(sp)
    2638:	01d12c23          	sw	t4,24(sp)
    263c:	3e00e0ef          	jal	10a1c <__eqdf2>
    2640:	01812e83          	lw	t4,24(sp)
    2644:	04412303          	lw	t1,68(sp)
    2648:	04051c63          	bnez	a0,26a0 <_vfprintf_r+0x1fa8>
    264c:	001b7693          	andi	a3,s6,1
    2650:	03812f03          	lw	t5,56(sp)
    2654:	04068663          	beqz	a3,26a0 <_vfprintf_r+0x1fa8>
    2658:	02412783          	lw	a5,36(sp)
    265c:	0be12423          	sw	t5,168(sp)
    2660:	fffc4603          	lbu	a2,-1(s8)
    2664:	00f7c583          	lbu	a1,15(a5)
    2668:	000c0693          	mv	a3,s8
    266c:	02c59063          	bne	a1,a2,268c <_vfprintf_r+0x1f94>
    2670:	03000513          	li	a0,48
    2674:	fea68fa3          	sb	a0,-1(a3)
    2678:	0a812683          	lw	a3,168(sp)
    267c:	fff68793          	addi	a5,a3,-1
    2680:	0af12423          	sw	a5,168(sp)
    2684:	fff6c603          	lbu	a2,-1(a3)
    2688:	feb606e3          	beq	a2,a1,2674 <_vfprintf_r+0x1f7c>
    268c:	00160593          	addi	a1,a2,1
    2690:	03900513          	li	a0,57
    2694:	0ff5f593          	zext.b	a1,a1
    2698:	0ea608e3          	beq	a2,a0,2f88 <_vfprintf_r+0x2890>
    269c:	feb68fa3          	sb	a1,-1(a3)
    26a0:	08412603          	lw	a2,132(sp)
    26a4:	00f30693          	addi	a3,t1,15
    26a8:	419c07b3          	sub	a5,s8,s9
    26ac:	fff60b13          	addi	s6,a2,-1
    26b0:	08d10823          	sb	a3,144(sp)
    26b4:	09612223          	sw	s6,132(sp)
    26b8:	00f12c23          	sw	a5,24(sp)
    26bc:	080b4ae3          	bltz	s6,2f50 <_vfprintf_r+0x2858>
    26c0:	02b00713          	li	a4,43
    26c4:	08e108a3          	sb	a4,145(sp)
    26c8:	00900713          	li	a4,9
    26cc:	09675ee3          	bge	a4,s6,2f68 <_vfprintf_r+0x2870>
    26d0:	02812c23          	sw	s0,56(sp)
    26d4:	06300993          	li	s3,99
    26d8:	000b0413          	mv	s0,s6
    26dc:	03d12223          	sw	t4,36(sp)
    26e0:	00048b13          	mv	s6,s1
    26e4:	04612223          	sw	t1,68(sp)
    26e8:	09f10493          	addi	s1,sp,159
    26ec:	000a0a93          	mv	s5,s4
    26f0:	00a00593          	li	a1,10
    26f4:	00040513          	mv	a0,s0
    26f8:	0a0100ef          	jal	12798 <__modsi3>
    26fc:	03050713          	addi	a4,a0,48
    2700:	00048c13          	mv	s8,s1
    2704:	00040513          	mv	a0,s0
    2708:	feec0fa3          	sb	a4,-1(s8)
    270c:	00a00593          	li	a1,10
    2710:	00040a13          	mv	s4,s0
    2714:	000100ef          	jal	12714 <__divsi3>
    2718:	fff48493          	addi	s1,s1,-1
    271c:	00050413          	mv	s0,a0
    2720:	fd49c8e3          	blt	s3,s4,26f0 <_vfprintf_r+0x1ff8>
    2724:	000a8a13          	mv	s4,s5
    2728:	03050693          	addi	a3,a0,48
    272c:	00048a93          	mv	s5,s1
    2730:	feda8fa3          	sb	a3,-1(s5)
    2734:	ffec0713          	addi	a4,s8,-2
    2738:	09f10793          	addi	a5,sp,159
    273c:	02412e83          	lw	t4,36(sp)
    2740:	04412303          	lw	t1,68(sp)
    2744:	03812403          	lw	s0,56(sp)
    2748:	000b0493          	mv	s1,s6
    274c:	00f76463          	bltu	a4,a5,2754 <_vfprintf_r+0x205c>
    2750:	3780106f          	j	3ac8 <_vfprintf_r+0x33d0>
    2754:	09210513          	addi	a0,sp,146
    2758:	00050693          	mv	a3,a0
    275c:	00074783          	lbu	a5,0(a4)
    2760:	00170713          	addi	a4,a4,1
    2764:	00168693          	addi	a3,a3,1
    2768:	fef68fa3          	sb	a5,-1(a3)
    276c:	09f10793          	addi	a5,sp,159
    2770:	fef716e3          	bne	a4,a5,275c <_vfprintf_r+0x2064>
    2774:	00a70733          	add	a4,a4,a0
    2778:	00270713          	addi	a4,a4,2
    277c:	41870733          	sub	a4,a4,s8
    2780:	09010693          	addi	a3,sp,144
    2784:	40d707b3          	sub	a5,a4,a3
    2788:	02f12c23          	sw	a5,56(sp)
    278c:	01812783          	lw	a5,24(sp)
    2790:	03812683          	lw	a3,56(sp)
    2794:	00100713          	li	a4,1
    2798:	00d78ab3          	add	s5,a5,a3
    279c:	70f754e3          	bge	a4,a5,36a4 <_vfprintf_r+0x2fac>
    27a0:	02c12783          	lw	a5,44(sp)
    27a4:	00fa8ab3          	add	s5,s5,a5
    27a8:	02012783          	lw	a5,32(sp)
    27ac:	fffac813          	not	a6,s5
    27b0:	41f85813          	srai	a6,a6,0x1f
    27b4:	bff7ff13          	andi	t5,a5,-1025
    27b8:	010af833          	and	a6,s5,a6
    27bc:	100f6c13          	ori	s8,t5,256
    27c0:	0027fe13          	andi	t3,a5,2
    27c4:	680a0ee3          	beqz	s4,3660 <_vfprintf_r+0x2f68>
    27c8:	02d00893          	li	a7,45
    27cc:	07110fa3          	sb	a7,127(sp)
    27d0:	00000b13          	li	s6,0
    27d4:	00180813          	addi	a6,a6,1
    27d8:	f40fe06f          	j	f18 <_vfprintf_r+0x820>
    27dc:	03000793          	li	a5,48
    27e0:	086100a3          	sb	t1,129(sp)
    27e4:	06010fa3          	sb	zero,127(sp)
    27e8:	08f10023          	sb	a5,128(sp)
    27ec:	360b42e3          	bltz	s6,3350 <_vfprintf_r+0x2c58>
    27f0:	b7fc7f13          	andi	t5,s8,-1153
    27f4:	002f6c13          	ori	s8,t5,2
    27f8:	00200e13          	li	t3,2
    27fc:	07f14883          	lbu	a7,127(sp)
    2800:	00d12823          	sw	a3,16(sp)
    2804:	fccff06f          	j	1fd0 <_vfprintf_r+0x18d8>
    2808:	00000e13          	li	t3,0
    280c:	ff1ff06f          	j	27fc <_vfprintf_r+0x2104>
    2810:	00812583          	lw	a1,8(sp)
    2814:	0b010613          	addi	a2,sp,176
    2818:	00048513          	mv	a0,s1
    281c:	03012223          	sw	a6,36(sp)
    2820:	03d12023          	sw	t4,32(sp)
    2824:	4e8010ef          	jal	3d0c <__sprint_r>
    2828:	00050463          	beqz	a0,2830 <_vfprintf_r+0x2138>
    282c:	ff9fe06f          	j	1824 <_vfprintf_r+0x112c>
    2830:	0b812a03          	lw	s4,184(sp)
    2834:	02412803          	lw	a6,36(sp)
    2838:	02012e83          	lw	t4,32(sp)
    283c:	0bc10413          	addi	s0,sp,188
    2840:	925fe06f          	j	1164 <_vfprintf_r+0xa6c>
    2844:	0a810513          	addi	a0,sp,168
    2848:	00800613          	li	a2,8
    284c:	00000593          	li	a1,0
    2850:	02612023          	sw	t1,32(sp)
    2854:	01112a23          	sw	a7,20(sp)
    2858:	01d12823          	sw	t4,16(sp)
    285c:	09912623          	sw	s9,140(sp)
    2860:	0a9030ef          	jal	6108 <memset>
    2864:	01012e83          	lw	t4,16(sp)
    2868:	01412883          	lw	a7,20(sp)
    286c:	02012303          	lw	t1,32(sp)
    2870:	280b4ee3          	bltz	s6,330c <_vfprintf_r+0x2c14>
    2874:	00812a23          	sw	s0,20(sp)
    2878:	000b0a13          	mv	s4,s6
    287c:	00000a93          	li	s5,0
    2880:	fff00993          	li	s3,-1
    2884:	00000413          	li	s0,0
    2888:	03112023          	sw	a7,32(sp)
    288c:	00030b13          	mv	s6,t1
    2890:	02c0006f          	j	28bc <_vfprintf_r+0x21c4>
    2894:	0a810693          	addi	a3,sp,168
    2898:	0fc10593          	addi	a1,sp,252
    289c:	00048513          	mv	a0,s1
    28a0:	0a0090ef          	jal	b940 <_wcrtomb_r>
    28a4:	633504e3          	beq	a0,s3,36cc <_vfprintf_r+0x2fd4>
    28a8:	00aa87b3          	add	a5,s5,a0
    28ac:	02fa4063          	blt	s4,a5,28cc <_vfprintf_r+0x21d4>
    28b0:	00440413          	addi	s0,s0,4
    28b4:	6d4786e3          	beq	a5,s4,3780 <_vfprintf_r+0x3088>
    28b8:	00078a93          	mv	s5,a5
    28bc:	08c12783          	lw	a5,140(sp)
    28c0:	008787b3          	add	a5,a5,s0
    28c4:	0007a603          	lw	a2,0(a5)
    28c8:	fc0616e3          	bnez	a2,2894 <_vfprintf_r+0x219c>
    28cc:	01012e83          	lw	t4,16(sp)
    28d0:	01412403          	lw	s0,20(sp)
    28d4:	02012883          	lw	a7,32(sp)
    28d8:	000b0313          	mv	t1,s6
    28dc:	280a86e3          	beqz	s5,3368 <_vfprintf_r+0x2c70>
    28e0:	06300793          	li	a5,99
    28e4:	4157d8e3          	bge	a5,s5,34f4 <_vfprintf_r+0x2dfc>
    28e8:	001a8593          	addi	a1,s5,1
    28ec:	00048513          	mv	a0,s1
    28f0:	02612023          	sw	t1,32(sp)
    28f4:	01112a23          	sw	a7,20(sp)
    28f8:	01d12823          	sw	t4,16(sp)
    28fc:	60d050ef          	jal	8708 <_malloc_r>
    2900:	01012e83          	lw	t4,16(sp)
    2904:	01412883          	lw	a7,20(sp)
    2908:	02012303          	lw	t1,32(sp)
    290c:	00050c93          	mv	s9,a0
    2910:	5a050ee3          	beqz	a0,36cc <_vfprintf_r+0x2fd4>
    2914:	00a12a23          	sw	a0,20(sp)
    2918:	00800613          	li	a2,8
    291c:	00000593          	li	a1,0
    2920:	0a810513          	addi	a0,sp,168
    2924:	02612223          	sw	t1,36(sp)
    2928:	03112023          	sw	a7,32(sp)
    292c:	01d12823          	sw	t4,16(sp)
    2930:	7d8030ef          	jal	6108 <memset>
    2934:	0a810713          	addi	a4,sp,168
    2938:	000a8693          	mv	a3,s5
    293c:	08c10613          	addi	a2,sp,140
    2940:	000c8593          	mv	a1,s9
    2944:	00048513          	mv	a0,s1
    2948:	124090ef          	jal	ba6c <_wcsrtombs_r>
    294c:	01012e83          	lw	t4,16(sp)
    2950:	02012883          	lw	a7,32(sp)
    2954:	02412303          	lw	t1,36(sp)
    2958:	00aa8463          	beq	s5,a0,2960 <_vfprintf_r+0x2268>
    295c:	1f80106f          	j	3b54 <_vfprintf_r+0x345c>
    2960:	015c8733          	add	a4,s9,s5
    2964:	00070023          	sb	zero,0(a4)
    2968:	07f14703          	lbu	a4,127(sp)
    296c:	fffac813          	not	a6,s5
    2970:	41f85813          	srai	a6,a6,0x1f
    2974:	010af833          	and	a6,s5,a6
    2978:	00070463          	beqz	a4,2980 <_vfprintf_r+0x2288>
    297c:	00180813          	addi	a6,a6,1
    2980:	01112823          	sw	a7,16(sp)
    2984:	00000b13          	li	s6,0
    2988:	02012223          	sw	zero,36(sp)
    298c:	02012023          	sw	zero,32(sp)
    2990:	00000e13          	li	t3,0
    2994:	f85fd06f          	j	918 <_vfprintf_r+0x220>
    2998:	00040e93          	mv	t4,s0
    299c:	000a0813          	mv	a6,s4
    29a0:	00068413          	mv	s0,a3
    29a4:	00060a13          	mv	s4,a2
    29a8:	00098713          	mv	a4,s3
    29ac:	015a0a33          	add	s4,s4,s5
    29b0:	00178793          	addi	a5,a5,1
    29b4:	0b412c23          	sw	s4,184(sp)
    29b8:	0af12a23          	sw	a5,180(sp)
    29bc:	00e42023          	sw	a4,0(s0)
    29c0:	01542223          	sw	s5,4(s0)
    29c4:	00700713          	li	a4,7
    29c8:	00f74463          	blt	a4,a5,29d0 <_vfprintf_r+0x22d8>
    29cc:	80cfe06f          	j	9d8 <_vfprintf_r+0x2e0>
    29d0:	b84fe06f          	j	d54 <_vfprintf_r+0x65c>
    29d4:	00010597          	auipc	a1,0x10
    29d8:	ecc58593          	addi	a1,a1,-308 # 128a0 <__clzsi2+0xd8>
    29dc:	00200e13          	li	t3,2
    29e0:	07800313          	li	t1,120
    29e4:	e19ff06f          	j	27fc <_vfprintf_r+0x2104>
    29e8:	01012783          	lw	a5,16(sp)
    29ec:	00c12683          	lw	a3,12(sp)
    29f0:	0007a783          	lw	a5,0(a5)
    29f4:	00d7a023          	sw	a3,0(a5)
    29f8:	00e12823          	sw	a4,16(sp)
    29fc:	e2dfd06f          	j	828 <_vfprintf_r+0x130>
    2a00:	01000693          	li	a3,16
    2a04:	0b412603          	lw	a2,180(sp)
    2a08:	00010717          	auipc	a4,0x10
    2a0c:	35070713          	addi	a4,a4,848 # 12d58 <zeroes.0>
    2a10:	2966dc63          	bge	a3,s6,2ca8 <_vfprintf_r+0x25b0>
    2a14:	00040793          	mv	a5,s0
    2a18:	000a0593          	mv	a1,s4
    2a1c:	000b0413          	mv	s0,s6
    2a20:	00812983          	lw	s3,8(sp)
    2a24:	00700a93          	li	s5,7
    2a28:	05d12223          	sw	t4,68(sp)
    2a2c:	05c12423          	sw	t3,72(sp)
    2a30:	00080b13          	mv	s6,a6
    2a34:	00010a17          	auipc	s4,0x10
    2a38:	324a0a13          	addi	s4,s4,804 # 12d58 <zeroes.0>
    2a3c:	00c0006f          	j	2a48 <_vfprintf_r+0x2350>
    2a40:	ff040413          	addi	s0,s0,-16
    2a44:	2486d463          	bge	a3,s0,2c8c <_vfprintf_r+0x2594>
    2a48:	01058593          	addi	a1,a1,16
    2a4c:	00160613          	addi	a2,a2,1
    2a50:	0147a023          	sw	s4,0(a5)
    2a54:	00d7a223          	sw	a3,4(a5)
    2a58:	0ab12c23          	sw	a1,184(sp)
    2a5c:	0ac12a23          	sw	a2,180(sp)
    2a60:	00878793          	addi	a5,a5,8
    2a64:	fccadee3          	bge	s5,a2,2a40 <_vfprintf_r+0x2348>
    2a68:	0b010613          	addi	a2,sp,176
    2a6c:	00098593          	mv	a1,s3
    2a70:	00048513          	mv	a0,s1
    2a74:	298010ef          	jal	3d0c <__sprint_r>
    2a78:	460516e3          	bnez	a0,36e4 <_vfprintf_r+0x2fec>
    2a7c:	0b812583          	lw	a1,184(sp)
    2a80:	0b412603          	lw	a2,180(sp)
    2a84:	0bc10793          	addi	a5,sp,188
    2a88:	01000693          	li	a3,16
    2a8c:	fb5ff06f          	j	2a40 <_vfprintf_r+0x2348>
    2a90:	30028863          	beqz	t0,2da0 <_vfprintf_r+0x26a8>
    2a94:	0b412503          	lw	a0,180(sp)
    2a98:	00000293          	li	t0,0
    2a9c:	0bc10413          	addi	s0,sp,188
    2aa0:	ecdfd06f          	j	96c <_vfprintf_r+0x274>
    2aa4:	200c7e13          	andi	t3,s8,512
    2aa8:	06010fa3          	sb	zero,127(sp)
    2aac:	340e1063          	bnez	t3,2dec <_vfprintf_r+0x26f4>
    2ab0:	00068a93          	mv	s5,a3
    2ab4:	00000713          	li	a4,0
    2ab8:	620b4ce3          	bltz	s6,38f0 <_vfprintf_r+0x31f8>
    2abc:	00f12823          	sw	a5,16(sp)
    2ac0:	f7fc7c13          	andi	s8,s8,-129
    2ac4:	000b0463          	beqz	s6,2acc <_vfprintf_r+0x23d4>
    2ac8:	8e9fe06f          	j	13b0 <_vfprintf_r+0xcb8>
    2acc:	00069463          	bnez	a3,2ad4 <_vfprintf_r+0x23dc>
    2ad0:	a91fe06f          	j	1560 <_vfprintf_r+0xe68>
    2ad4:	8ddfe06f          	j	13b0 <_vfprintf_r+0xcb8>
    2ad8:	200c7713          	andi	a4,s8,512
    2adc:	32070863          	beqz	a4,2e0c <_vfprintf_r+0x2714>
    2ae0:	018a9a93          	slli	s5,s5,0x18
    2ae4:	418ada93          	srai	s5,s5,0x18
    2ae8:	41fad713          	srai	a4,s5,0x1f
    2aec:	00f12823          	sw	a5,16(sp)
    2af0:	00070693          	mv	a3,a4
    2af4:	be4fe06f          	j	ed8 <_vfprintf_r+0x7e0>
    2af8:	200c7693          	andi	a3,s8,512
    2afc:	30068063          	beqz	a3,2dfc <_vfprintf_r+0x2704>
    2b00:	0ff77713          	zext.b	a4,a4
    2b04:	00f12823          	sw	a5,16(sp)
    2b08:	000c0813          	mv	a6,s8
    2b0c:	00000613          	li	a2,0
    2b10:	8fdfe06f          	j	140c <_vfprintf_r+0xd14>
    2b14:	fff00793          	li	a5,-1
    2b18:	100c6993          	ori	s3,s8,256
    2b1c:	40fb0e63          	beq	s6,a5,2f38 <_vfprintf_r+0x2840>
    2b20:	000b1663          	bnez	s6,2b2c <_vfprintf_r+0x2434>
    2b24:	fb9a8793          	addi	a5,s5,-71
    2b28:	68078ae3          	beqz	a5,39bc <_vfprintf_r+0x32c4>
    2b2c:	02812783          	lw	a5,40(sp)
    2b30:	00000a13          	li	s4,0
    2b34:	00078e13          	mv	t3,a5
    2b38:	0007d863          	bgez	a5,2b48 <_vfprintf_r+0x2450>
    2b3c:	80000cb7          	lui	s9,0x80000
    2b40:	0197ce33          	xor	t3,a5,s9
    2b44:	02d00a13          	li	s4,45
    2b48:	04600793          	li	a5,70
    2b4c:	44fa9463          	bne	s5,a5,2f94 <_vfprintf_r+0x289c>
    2b50:	03412603          	lw	a2,52(sp)
    2b54:	08c10813          	addi	a6,sp,140
    2b58:	000b0713          	mv	a4,s6
    2b5c:	00060593          	mv	a1,a2
    2b60:	00300693          	li	a3,3
    2b64:	000e0613          	mv	a2,t3
    2b68:	0a810893          	addi	a7,sp,168
    2b6c:	08410793          	addi	a5,sp,132
    2b70:	00048513          	mv	a0,s1
    2b74:	02612023          	sw	t1,32(sp)
    2b78:	01d12c23          	sw	t4,24(sp)
    2b7c:	01c12a23          	sw	t3,20(sp)
    2b80:	4d1030ef          	jal	6850 <_dtoa_r>
    2b84:	00054683          	lbu	a3,0(a0)
    2b88:	03000713          	li	a4,48
    2b8c:	01412e03          	lw	t3,20(sp)
    2b90:	01812e83          	lw	t4,24(sp)
    2b94:	02012303          	lw	t1,32(sp)
    2b98:	00050c93          	mv	s9,a0
    2b9c:	01650833          	add	a6,a0,s6
    2ba0:	4ce688e3          	beq	a3,a4,3870 <_vfprintf_r+0x3178>
    2ba4:	08412703          	lw	a4,132(sp)
    2ba8:	03412503          	lw	a0,52(sp)
    2bac:	00e80833          	add	a6,a6,a4
    2bb0:	000e0593          	mv	a1,t3
    2bb4:	00000613          	li	a2,0
    2bb8:	00000693          	li	a3,0
    2bbc:	02612023          	sw	t1,32(sp)
    2bc0:	01d12c23          	sw	t4,24(sp)
    2bc4:	01012a23          	sw	a6,20(sp)
    2bc8:	6550d0ef          	jal	10a1c <__eqdf2>
    2bcc:	01412803          	lw	a6,20(sp)
    2bd0:	01812e83          	lw	t4,24(sp)
    2bd4:	02012303          	lw	t1,32(sp)
    2bd8:	480504e3          	beqz	a0,3860 <_vfprintf_r+0x3168>
    2bdc:	0a812703          	lw	a4,168(sp)
    2be0:	770772e3          	bgeu	a4,a6,3b44 <_vfprintf_r+0x344c>
    2be4:	03000613          	li	a2,48
    2be8:	00170793          	addi	a5,a4,1
    2bec:	0af12423          	sw	a5,168(sp)
    2bf0:	00c70023          	sb	a2,0(a4)
    2bf4:	0a812703          	lw	a4,168(sp)
    2bf8:	ff0768e3          	bltu	a4,a6,2be8 <_vfprintf_r+0x24f0>
    2bfc:	419707b3          	sub	a5,a4,s9
    2c00:	04700693          	li	a3,71
    2c04:	00f12c23          	sw	a5,24(sp)
    2c08:	08412e03          	lw	t3,132(sp)
    2c0c:	3eda8e63          	beq	s5,a3,3008 <_vfprintf_r+0x2910>
    2c10:	04600713          	li	a4,70
    2c14:	40ea9263          	bne	s5,a4,3018 <_vfprintf_r+0x2920>
    2c18:	001c7713          	andi	a4,s8,1
    2c1c:	01676733          	or	a4,a4,s6
    2c20:	67c05ae3          	blez	t3,3a94 <_vfprintf_r+0x339c>
    2c24:	420714e3          	bnez	a4,384c <_vfprintf_r+0x3154>
    2c28:	000e0a93          	mv	s5,t3
    2c2c:	06600313          	li	t1,102
    2c30:	400c7f13          	andi	t5,s8,1024
    2c34:	360f14e3          	bnez	t5,379c <_vfprintf_r+0x30a4>
    2c38:	fffac813          	not	a6,s5
    2c3c:	41f85813          	srai	a6,a6,0x1f
    2c40:	010af833          	and	a6,s5,a6
    2c44:	040a08e3          	beqz	s4,3494 <_vfprintf_r+0x2d9c>
    2c48:	02d00713          	li	a4,45
    2c4c:	06e10fa3          	sb	a4,127(sp)
    2c50:	00180813          	addi	a6,a6,1
    2c54:	00098c13          	mv	s8,s3
    2c58:	00012a23          	sw	zero,20(sp)
    2c5c:	00000b13          	li	s6,0
    2c60:	02012223          	sw	zero,36(sp)
    2c64:	02012023          	sw	zero,32(sp)
    2c68:	cb1fd06f          	j	918 <_vfprintf_r+0x220>
    2c6c:	00012a23          	sw	zero,20(sp)
    2c70:	00000a93          	li	s5,0
    2c74:	02012223          	sw	zero,36(sp)
    2c78:	02012023          	sw	zero,32(sp)
    2c7c:	00000e13          	li	t3,0
    2c80:	16010c93          	addi	s9,sp,352
    2c84:	00000813          	li	a6,0
    2c88:	c91fd06f          	j	918 <_vfprintf_r+0x220>
    2c8c:	04412e83          	lw	t4,68(sp)
    2c90:	04812e03          	lw	t3,72(sp)
    2c94:	000b0813          	mv	a6,s6
    2c98:	000a0713          	mv	a4,s4
    2c9c:	00040b13          	mv	s6,s0
    2ca0:	00058a13          	mv	s4,a1
    2ca4:	00078413          	mv	s0,a5
    2ca8:	016a0a33          	add	s4,s4,s6
    2cac:	00160613          	addi	a2,a2,1
    2cb0:	00e42023          	sw	a4,0(s0)
    2cb4:	01642223          	sw	s6,4(s0)
    2cb8:	0b412c23          	sw	s4,184(sp)
    2cbc:	0ac12a23          	sw	a2,180(sp)
    2cc0:	00700713          	li	a4,7
    2cc4:	00840413          	addi	s0,s0,8
    2cc8:	00c74463          	blt	a4,a2,2cd0 <_vfprintf_r+0x25d8>
    2ccc:	810ff06f          	j	1cdc <_vfprintf_r+0x15e4>
    2cd0:	00812583          	lw	a1,8(sp)
    2cd4:	0b010613          	addi	a2,sp,176
    2cd8:	00048513          	mv	a0,s1
    2cdc:	05012623          	sw	a6,76(sp)
    2ce0:	05c12423          	sw	t3,72(sp)
    2ce4:	05d12223          	sw	t4,68(sp)
    2ce8:	024010ef          	jal	3d0c <__sprint_r>
    2cec:	00050463          	beqz	a0,2cf4 <_vfprintf_r+0x25fc>
    2cf0:	b35fe06f          	j	1824 <_vfprintf_r+0x112c>
    2cf4:	0b812a03          	lw	s4,184(sp)
    2cf8:	04c12803          	lw	a6,76(sp)
    2cfc:	04812e03          	lw	t3,72(sp)
    2d00:	04412e83          	lw	t4,68(sp)
    2d04:	0bc10413          	addi	s0,sp,188
    2d08:	fd5fe06f          	j	1cdc <_vfprintf_r+0x15e4>
    2d0c:	000a8813          	mv	a6,s5
    2d10:	d3cff06f          	j	224c <_vfprintf_r+0x1b54>
    2d14:	00078813          	mv	a6,a5
    2d18:	c40ff06f          	j	2158 <_vfprintf_r+0x1a60>
    2d1c:	00010c97          	auipc	s9,0x10
    2d20:	b78c8c93          	addi	s9,s9,-1160 # 12894 <__clzsi2+0xcc>
    2d24:	f15fd06f          	j	c38 <_vfprintf_r+0x540>
    2d28:	001c7713          	andi	a4,s8,1
    2d2c:	00071463          	bnez	a4,2d34 <_vfprintf_r+0x263c>
    2d30:	cadfd06f          	j	9dc <_vfprintf_r+0x2e4>
    2d34:	02c12783          	lw	a5,44(sp)
    2d38:	0b412683          	lw	a3,180(sp)
    2d3c:	00700713          	li	a4,7
    2d40:	01478a33          	add	s4,a5,s4
    2d44:	03012783          	lw	a5,48(sp)
    2d48:	00168693          	addi	a3,a3,1
    2d4c:	0b412c23          	sw	s4,184(sp)
    2d50:	00f42023          	sw	a5,0(s0)
    2d54:	02c12783          	lw	a5,44(sp)
    2d58:	0ad12a23          	sw	a3,180(sp)
    2d5c:	00f42223          	sw	a5,4(s0)
    2d60:	70d75c63          	bge	a4,a3,3478 <_vfprintf_r+0x2d80>
    2d64:	00812583          	lw	a1,8(sp)
    2d68:	0b010613          	addi	a2,sp,176
    2d6c:	00048513          	mv	a0,s1
    2d70:	03012223          	sw	a6,36(sp)
    2d74:	03d12023          	sw	t4,32(sp)
    2d78:	795000ef          	jal	3d0c <__sprint_r>
    2d7c:	00050463          	beqz	a0,2d84 <_vfprintf_r+0x268c>
    2d80:	aa5fe06f          	j	1824 <_vfprintf_r+0x112c>
    2d84:	08412603          	lw	a2,132(sp)
    2d88:	0b812a03          	lw	s4,184(sp)
    2d8c:	0b412683          	lw	a3,180(sp)
    2d90:	02412803          	lw	a6,36(sp)
    2d94:	02012e83          	lw	t4,32(sp)
    2d98:	0bc10413          	addi	s0,sp,188
    2d9c:	f8dfd06f          	j	d28 <_vfprintf_r+0x630>
    2da0:	0bc10413          	addi	s0,sp,188
    2da4:	c01fd06f          	j	9a4 <_vfprintf_r+0x2ac>
    2da8:	00fc87b3          	add	a5,s9,a5
    2dac:	41f78b33          	sub	s6,a5,t6
    2db0:	01812783          	lw	a5,24(sp)
    2db4:	41578ab3          	sub	s5,a5,s5
    2db8:	016ac463          	blt	s5,s6,2dc0 <_vfprintf_r+0x26c8>
    2dbc:	fcdfe06f          	j	1d88 <_vfprintf_r+0x1690>
    2dc0:	000a8b13          	mv	s6,s5
    2dc4:	fc5fe06f          	j	1d88 <_vfprintf_r+0x1690>
    2dc8:	0ff77713          	zext.b	a4,a4
    2dcc:	00000613          	li	a2,0
    2dd0:	aecff06f          	j	20bc <_vfprintf_r+0x19c4>
    2dd4:	01012783          	lw	a5,16(sp)
    2dd8:	00c12683          	lw	a3,12(sp)
    2ddc:	00e12823          	sw	a4,16(sp)
    2de0:	0007a783          	lw	a5,0(a5)
    2de4:	00d79023          	sh	a3,0(a5)
    2de8:	a41fd06f          	j	828 <_vfprintf_r+0x130>
    2dec:	0ff6fa93          	zext.b	s5,a3
    2df0:	940b5c63          	bgez	s6,1f48 <_vfprintf_r+0x1850>
    2df4:	00f12823          	sw	a5,16(sp)
    2df8:	db4fe06f          	j	13ac <_vfprintf_r+0xcb4>
    2dfc:	00f12823          	sw	a5,16(sp)
    2e00:	000c0813          	mv	a6,s8
    2e04:	00000613          	li	a2,0
    2e08:	e04fe06f          	j	140c <_vfprintf_r+0xd14>
    2e0c:	41fad713          	srai	a4,s5,0x1f
    2e10:	00f12823          	sw	a5,16(sp)
    2e14:	00070693          	mv	a3,a4
    2e18:	8c0fe06f          	j	ed8 <_vfprintf_r+0x7e0>
    2e1c:	000c8513          	mv	a0,s9
    2e20:	03c12023          	sw	t3,32(sp)
    2e24:	01112a23          	sw	a7,20(sp)
    2e28:	01312823          	sw	s3,16(sp)
    2e2c:	841fd0ef          	jal	66c <strlen>
    2e30:	07f14703          	lbu	a4,127(sp)
    2e34:	fff54813          	not	a6,a0
    2e38:	41f85813          	srai	a6,a6,0x1f
    2e3c:	01012e83          	lw	t4,16(sp)
    2e40:	01412883          	lw	a7,20(sp)
    2e44:	02012e03          	lw	t3,32(sp)
    2e48:	00050a93          	mv	s5,a0
    2e4c:	01057833          	and	a6,a0,a6
    2e50:	00071463          	bnez	a4,2e58 <_vfprintf_r+0x2760>
    2e54:	c68fe06f          	j	12bc <_vfprintf_r+0xbc4>
    2e58:	00180813          	addi	a6,a6,1
    2e5c:	c60fe06f          	j	12bc <_vfprintf_r+0xbc4>
    2e60:	00048513          	mv	a0,s1
    2e64:	0b010613          	addi	a2,sp,176
    2e68:	00098593          	mv	a1,s3
    2e6c:	6a1000ef          	jal	3d0c <__sprint_r>
    2e70:	00051463          	bnez	a0,2e78 <_vfprintf_r+0x2780>
    2e74:	c9dfd06f          	j	b10 <_vfprintf_r+0x418>
    2e78:	9c5fe06f          	j	183c <_vfprintf_r+0x1144>
    2e7c:	05012783          	lw	a5,80(sp)
    2e80:	04012583          	lw	a1,64(sp)
    2e84:	40fc8433          	sub	s0,s9,a5
    2e88:	00078613          	mv	a2,a5
    2e8c:	00040513          	mv	a0,s0
    2e90:	088020ef          	jal	4f18 <strncpy>
    2e94:	03c12783          	lw	a5,60(sp)
    2e98:	03c12703          	lw	a4,60(sp)
    2e9c:	00048513          	mv	a0,s1
    2ea0:	0017c783          	lbu	a5,1(a5)
    2ea4:	000a0593          	mv	a1,s4
    2ea8:	00a00613          	li	a2,10
    2eac:	00f037b3          	snez	a5,a5
    2eb0:	00f707b3          	add	a5,a4,a5
    2eb4:	00000693          	li	a3,0
    2eb8:	02f12e23          	sw	a5,60(sp)
    2ebc:	7f80b0ef          	jal	e6b4 <__udivdi3>
    2ec0:	00a00613          	li	a2,10
    2ec4:	00000693          	li	a3,0
    2ec8:	00050493          	mv	s1,a0
    2ecc:	00058a13          	mv	s4,a1
    2ed0:	68d0b0ef          	jal	ed5c <__umoddi3>
    2ed4:	03050793          	addi	a5,a0,48
    2ed8:	fff40c93          	addi	s9,s0,-1
    2edc:	fef40fa3          	sb	a5,-1(s0)
    2ee0:	00100413          	li	s0,1
    2ee4:	b24ff06f          	j	2208 <_vfprintf_r+0x1b10>
    2ee8:	0589a503          	lw	a0,88(s3)
    2eec:	f7cfd0ef          	jal	668 <__retarget_lock_release_recursive>
    2ef0:	b79fd06f          	j	a68 <_vfprintf_r+0x370>
    2ef4:	07800793          	li	a5,120
    2ef8:	d6cff06f          	j	2464 <_vfprintf_r+0x1d6c>
    2efc:	001b0593          	addi	a1,s6,1
    2f00:	00048513          	mv	a0,s1
    2f04:	00612c23          	sw	t1,24(sp)
    2f08:	01d12a23          	sw	t4,20(sp)
    2f0c:	7fc050ef          	jal	8708 <_malloc_r>
    2f10:	01412e83          	lw	t4,20(sp)
    2f14:	01812303          	lw	t1,24(sp)
    2f18:	00050c93          	mv	s9,a0
    2f1c:	c4050863          	beqz	a0,236c <_vfprintf_r+0x1c74>
    2f20:	02812783          	lw	a5,40(sp)
    2f24:	2807c2e3          	bltz	a5,39a8 <_vfprintf_r+0x32b0>
    2f28:	02812703          	lw	a4,40(sp)
    2f2c:	00a12a23          	sw	a0,20(sp)
    2f30:	00000a13          	li	s4,0
    2f34:	d58ff06f          	j	248c <_vfprintf_r+0x1d94>
    2f38:	02812783          	lw	a5,40(sp)
    2f3c:	2e07c6e3          	bltz	a5,3a28 <_vfprintf_r+0x3330>
    2f40:	02812e03          	lw	t3,40(sp)
    2f44:	00000a13          	li	s4,0
    2f48:	00600b13          	li	s6,6
    2f4c:	bfdff06f          	j	2b48 <_vfprintf_r+0x2450>
    2f50:	02d00713          	li	a4,45
    2f54:	08e108a3          	sb	a4,145(sp)
    2f58:	00100693          	li	a3,1
    2f5c:	ff800713          	li	a4,-8
    2f60:	40c68b33          	sub	s6,a3,a2
    2f64:	f6e64663          	blt	a2,a4,26d0 <_vfprintf_r+0x1fd8>
    2f68:	09210713          	addi	a4,sp,146
    2f6c:	16010793          	addi	a5,sp,352
    2f70:	030b0693          	addi	a3,s6,48
    2f74:	00d70023          	sb	a3,0(a4)
    2f78:	40f70733          	sub	a4,a4,a5
    2f7c:	0d170793          	addi	a5,a4,209
    2f80:	02f12c23          	sw	a5,56(sp)
    2f84:	809ff06f          	j	278c <_vfprintf_r+0x2094>
    2f88:	02412783          	lw	a5,36(sp)
    2f8c:	00a7c583          	lbu	a1,10(a5)
    2f90:	f0cff06f          	j	269c <_vfprintf_r+0x1fa4>
    2f94:	03412703          	lw	a4,52(sp)
    2f98:	fbba8793          	addi	a5,s5,-69
    2f9c:	0017b793          	seqz	a5,a5
    2fa0:	016787b3          	add	a5,a5,s6
    2fa4:	00070593          	mv	a1,a4
    2fa8:	000e0613          	mv	a2,t3
    2fac:	00078713          	mv	a4,a5
    2fb0:	00f12c23          	sw	a5,24(sp)
    2fb4:	0a810893          	addi	a7,sp,168
    2fb8:	08c10813          	addi	a6,sp,140
    2fbc:	08410793          	addi	a5,sp,132
    2fc0:	00200693          	li	a3,2
    2fc4:	00048513          	mv	a0,s1
    2fc8:	02612223          	sw	t1,36(sp)
    2fcc:	03d12023          	sw	t4,32(sp)
    2fd0:	01c12a23          	sw	t3,20(sp)
    2fd4:	07d030ef          	jal	6850 <_dtoa_r>
    2fd8:	04700713          	li	a4,71
    2fdc:	01412e03          	lw	t3,20(sp)
    2fe0:	02012e83          	lw	t4,32(sp)
    2fe4:	02412303          	lw	t1,36(sp)
    2fe8:	00050c93          	mv	s9,a0
    2fec:	3aea9ae3          	bne	s5,a4,3ba0 <_vfprintf_r+0x34a8>
    2ff0:	001c7713          	andi	a4,s8,1
    2ff4:	5a071c63          	bnez	a4,35ac <_vfprintf_r+0x2eb4>
    2ff8:	0a812703          	lw	a4,168(sp)
    2ffc:	08412e03          	lw	t3,132(sp)
    3000:	419707b3          	sub	a5,a4,s9
    3004:	00f12c23          	sw	a5,24(sp)
    3008:	ffde2713          	slti	a4,t3,-3
    300c:	00071463          	bnez	a4,3014 <_vfprintf_r+0x291c>
    3010:	03cb5a63          	bge	s6,t3,3044 <_vfprintf_r+0x294c>
    3014:	ffe30313          	addi	t1,t1,-2
    3018:	fffe0b13          	addi	s6,t3,-1
    301c:	08610823          	sb	t1,144(sp)
    3020:	09612223          	sw	s6,132(sp)
    3024:	080b4ee3          	bltz	s6,38c0 <_vfprintf_r+0x31c8>
    3028:	02b00713          	li	a4,43
    302c:	08e108a3          	sb	a4,145(sp)
    3030:	00900713          	li	a4,9
    3034:	0b6752e3          	bge	a4,s6,38d8 <_vfprintf_r+0x31e0>
    3038:	03812023          	sw	s8,32(sp)
    303c:	00012a23          	sw	zero,20(sp)
    3040:	e90ff06f          	j	26d0 <_vfprintf_r+0x1fd8>
    3044:	01812783          	lw	a5,24(sp)
    3048:	4afe4c63          	blt	t3,a5,3500 <_vfprintf_r+0x2e08>
    304c:	001c7713          	andi	a4,s8,1
    3050:	000e0a93          	mv	s5,t3
    3054:	00070663          	beqz	a4,3060 <_vfprintf_r+0x2968>
    3058:	02c12783          	lw	a5,44(sp)
    305c:	00fe0ab3          	add	s5,t3,a5
    3060:	400c7f13          	andi	t5,s8,1024
    3064:	000f0463          	beqz	t5,306c <_vfprintf_r+0x2974>
    3068:	73c04863          	bgtz	t3,3798 <_vfprintf_r+0x30a0>
    306c:	fffac813          	not	a6,s5
    3070:	41f85813          	srai	a6,a6,0x1f
    3074:	010af833          	and	a6,s5,a6
    3078:	06700313          	li	t1,103
    307c:	bc9ff06f          	j	2c44 <_vfprintf_r+0x254c>
    3080:	00f12823          	sw	a5,16(sp)
    3084:	000f0c13          	mv	s8,t5
    3088:	b28fe06f          	j	13b0 <_vfprintf_r+0xcb8>
    308c:	02012783          	lw	a5,32(sp)
    3090:	02412703          	lw	a4,36(sp)
    3094:	00e7e733          	or	a4,a5,a4
    3098:	2e0704e3          	beqz	a4,3b80 <_vfprintf_r+0x3488>
    309c:	01812783          	lw	a5,24(sp)
    30a0:	00040613          	mv	a2,s0
    30a4:	05912423          	sw	s9,72(sp)
    30a8:	05812623          	sw	s8,76(sp)
    30ac:	00fc8433          	add	s0,s9,a5
    30b0:	05712c23          	sw	s7,88(sp)
    30b4:	03c12c03          	lw	s8,60(sp)
    30b8:	02012b03          	lw	s6,32(sp)
    30bc:	02412c83          	lw	s9,36(sp)
    30c0:	05012b83          	lw	s7,80(sp)
    30c4:	000a0593          	mv	a1,s4
    30c8:	00700693          	li	a3,7
    30cc:	01000713          	li	a4,16
    30d0:	00010a97          	auipc	s5,0x10
    30d4:	c88a8a93          	addi	s5,s5,-888 # 12d58 <zeroes.0>
    30d8:	05d12223          	sw	t4,68(sp)
    30dc:	05012a23          	sw	a6,84(sp)
    30e0:	000f8a13          	mv	s4,t6
    30e4:	09904a63          	bgtz	s9,3178 <_vfprintf_r+0x2a80>
    30e8:	fffc0c13          	addi	s8,s8,-1
    30ec:	fffb0b13          	addi	s6,s6,-1
    30f0:	0b412783          	lw	a5,180(sp)
    30f4:	04012503          	lw	a0,64(sp)
    30f8:	017585b3          	add	a1,a1,s7
    30fc:	00178793          	addi	a5,a5,1
    3100:	00a62023          	sw	a0,0(a2)
    3104:	01762223          	sw	s7,4(a2)
    3108:	0ab12c23          	sw	a1,184(sp)
    310c:	0af12a23          	sw	a5,180(sp)
    3110:	00860613          	addi	a2,a2,8
    3114:	12f6c063          	blt	a3,a5,3234 <_vfprintf_r+0x2b3c>
    3118:	000c4503          	lbu	a0,0(s8)
    311c:	414409b3          	sub	s3,s0,s4
    3120:	00040793          	mv	a5,s0
    3124:	01355463          	bge	a0,s3,312c <_vfprintf_r+0x2a34>
    3128:	00050993          	mv	s3,a0
    312c:	03305663          	blez	s3,3158 <_vfprintf_r+0x2a60>
    3130:	0b412503          	lw	a0,180(sp)
    3134:	013585b3          	add	a1,a1,s3
    3138:	0ab12c23          	sw	a1,184(sp)
    313c:	00150513          	addi	a0,a0,1
    3140:	01462023          	sw	s4,0(a2)
    3144:	01362223          	sw	s3,4(a2)
    3148:	0aa12a23          	sw	a0,180(sp)
    314c:	14a6c863          	blt	a3,a0,329c <_vfprintf_r+0x2ba4>
    3150:	000c4503          	lbu	a0,0(s8)
    3154:	00860613          	addi	a2,a2,8
    3158:	fff9cf13          	not	t5,s3
    315c:	41ff5f13          	srai	t5,t5,0x1f
    3160:	01e9f833          	and	a6,s3,t5
    3164:	410509b3          	sub	s3,a0,a6
    3168:	05304663          	bgtz	s3,31b4 <_vfprintf_r+0x2abc>
    316c:	00aa0a33          	add	s4,s4,a0
    3170:	f7604ae3          	bgtz	s6,30e4 <_vfprintf_r+0x29ec>
    3174:	01905663          	blez	s9,3180 <_vfprintf_r+0x2a88>
    3178:	fffc8c93          	addi	s9,s9,-1
    317c:	f75ff06f          	j	30f0 <_vfprintf_r+0x29f8>
    3180:	03812e23          	sw	s8,60(sp)
    3184:	04412e83          	lw	t4,68(sp)
    3188:	04812c83          	lw	s9,72(sp)
    318c:	04c12c03          	lw	s8,76(sp)
    3190:	05412803          	lw	a6,84(sp)
    3194:	05812b83          	lw	s7,88(sp)
    3198:	000a0f93          	mv	t6,s4
    319c:	00060413          	mv	s0,a2
    31a0:	00058a13          	mv	s4,a1
    31a4:	01f7e463          	bltu	a5,t6,31ac <_vfprintf_r+0x2ab4>
    31a8:	b45fe06f          	j	1cec <_vfprintf_r+0x15f4>
    31ac:	00078f93          	mv	t6,a5
    31b0:	b3dfe06f          	j	1cec <_vfprintf_r+0x15f4>
    31b4:	0b412503          	lw	a0,180(sp)
    31b8:	00010f17          	auipc	t5,0x10
    31bc:	ba0f0f13          	addi	t5,t5,-1120 # 12d58 <zeroes.0>
    31c0:	0b375a63          	bge	a4,s3,3274 <_vfprintf_r+0x2b7c>
    31c4:	02f12023          	sw	a5,32(sp)
    31c8:	00040793          	mv	a5,s0
    31cc:	03e12223          	sw	t5,36(sp)
    31d0:	00098413          	mv	s0,s3
    31d4:	00078993          	mv	s3,a5
    31d8:	00c0006f          	j	31e4 <_vfprintf_r+0x2aec>
    31dc:	ff040413          	addi	s0,s0,-16
    31e0:	08875063          	bge	a4,s0,3260 <_vfprintf_r+0x2b68>
    31e4:	01058593          	addi	a1,a1,16
    31e8:	00150513          	addi	a0,a0,1
    31ec:	01562023          	sw	s5,0(a2)
    31f0:	00e62223          	sw	a4,4(a2)
    31f4:	0ab12c23          	sw	a1,184(sp)
    31f8:	0aa12a23          	sw	a0,180(sp)
    31fc:	00860613          	addi	a2,a2,8
    3200:	fca6dee3          	bge	a3,a0,31dc <_vfprintf_r+0x2ae4>
    3204:	00812583          	lw	a1,8(sp)
    3208:	0b010613          	addi	a2,sp,176
    320c:	00048513          	mv	a0,s1
    3210:	2fd000ef          	jal	3d0c <__sprint_r>
    3214:	00050463          	beqz	a0,321c <_vfprintf_r+0x2b24>
    3218:	e0cfe06f          	j	1824 <_vfprintf_r+0x112c>
    321c:	0b812583          	lw	a1,184(sp)
    3220:	0b412503          	lw	a0,180(sp)
    3224:	0bc10613          	addi	a2,sp,188
    3228:	01000713          	li	a4,16
    322c:	00700693          	li	a3,7
    3230:	fadff06f          	j	31dc <_vfprintf_r+0x2ae4>
    3234:	00812583          	lw	a1,8(sp)
    3238:	0b010613          	addi	a2,sp,176
    323c:	00048513          	mv	a0,s1
    3240:	2cd000ef          	jal	3d0c <__sprint_r>
    3244:	00050463          	beqz	a0,324c <_vfprintf_r+0x2b54>
    3248:	ddcfe06f          	j	1824 <_vfprintf_r+0x112c>
    324c:	0b812583          	lw	a1,184(sp)
    3250:	0bc10613          	addi	a2,sp,188
    3254:	01000713          	li	a4,16
    3258:	00700693          	li	a3,7
    325c:	ebdff06f          	j	3118 <_vfprintf_r+0x2a20>
    3260:	02012783          	lw	a5,32(sp)
    3264:	02412f03          	lw	t5,36(sp)
    3268:	00098813          	mv	a6,s3
    326c:	00040993          	mv	s3,s0
    3270:	00080413          	mv	s0,a6
    3274:	013585b3          	add	a1,a1,s3
    3278:	00150513          	addi	a0,a0,1
    327c:	0ab12c23          	sw	a1,184(sp)
    3280:	0aa12a23          	sw	a0,180(sp)
    3284:	01e62023          	sw	t5,0(a2)
    3288:	01362223          	sw	s3,4(a2)
    328c:	12a6cc63          	blt	a3,a0,33c4 <_vfprintf_r+0x2ccc>
    3290:	000c4503          	lbu	a0,0(s8)
    3294:	00860613          	addi	a2,a2,8
    3298:	ed5ff06f          	j	316c <_vfprintf_r+0x2a74>
    329c:	00812583          	lw	a1,8(sp)
    32a0:	0b010613          	addi	a2,sp,176
    32a4:	00048513          	mv	a0,s1
    32a8:	02f12023          	sw	a5,32(sp)
    32ac:	261000ef          	jal	3d0c <__sprint_r>
    32b0:	00050463          	beqz	a0,32b8 <_vfprintf_r+0x2bc0>
    32b4:	d70fe06f          	j	1824 <_vfprintf_r+0x112c>
    32b8:	000c4503          	lbu	a0,0(s8)
    32bc:	0b812583          	lw	a1,184(sp)
    32c0:	02012783          	lw	a5,32(sp)
    32c4:	0bc10613          	addi	a2,sp,188
    32c8:	01000713          	li	a4,16
    32cc:	00700693          	li	a3,7
    32d0:	e89ff06f          	j	3158 <_vfprintf_r+0x2a60>
    32d4:	02d00793          	li	a5,45
    32d8:	06f10fa3          	sb	a5,127(sp)
    32dc:	00012a23          	sw	zero,20(sp)
    32e0:	04700793          	li	a5,71
    32e4:	02012223          	sw	zero,36(sp)
    32e8:	02012023          	sw	zero,32(sp)
    32ec:	00300a93          	li	s5,3
    32f0:	00000b13          	li	s6,0
    32f4:	00000e13          	li	t3,0
    32f8:	1a67d663          	bge	a5,t1,34a4 <_vfprintf_r+0x2dac>
    32fc:	0000fc97          	auipc	s9,0xf
    3300:	598c8c93          	addi	s9,s9,1432 # 12894 <__clzsi2+0xcc>
    3304:	00400813          	li	a6,4
    3308:	e10fd06f          	j	918 <_vfprintf_r+0x220>
    330c:	0a810713          	addi	a4,sp,168
    3310:	00000693          	li	a3,0
    3314:	08c10613          	addi	a2,sp,140
    3318:	00000593          	li	a1,0
    331c:	00048513          	mv	a0,s1
    3320:	02612023          	sw	t1,32(sp)
    3324:	01112a23          	sw	a7,20(sp)
    3328:	01d12823          	sw	t4,16(sp)
    332c:	740080ef          	jal	ba6c <_wcsrtombs_r>
    3330:	fff00713          	li	a4,-1
    3334:	01012e83          	lw	t4,16(sp)
    3338:	01412883          	lw	a7,20(sp)
    333c:	02012303          	lw	t1,32(sp)
    3340:	00050a93          	mv	s5,a0
    3344:	38e50463          	beq	a0,a4,36cc <_vfprintf_r+0x2fd4>
    3348:	09912623          	sw	s9,140(sp)
    334c:	d90ff06f          	j	28dc <_vfprintf_r+0x21e4>
    3350:	bffc7f13          	andi	t5,s8,-1025
    3354:	002f6c13          	ori	s8,t5,2
    3358:	00d12823          	sw	a3,16(sp)
    335c:	00200e13          	li	t3,2
    3360:	00000893          	li	a7,0
    3364:	c6dfe06f          	j	1fd0 <_vfprintf_r+0x18d8>
    3368:	07f14803          	lbu	a6,127(sp)
    336c:	01112823          	sw	a7,16(sp)
    3370:	00000b13          	li	s6,0
    3374:	01003833          	snez	a6,a6
    3378:	02012223          	sw	zero,36(sp)
    337c:	02012023          	sw	zero,32(sp)
    3380:	00000e13          	li	t3,0
    3384:	00012a23          	sw	zero,20(sp)
    3388:	d90fd06f          	j	918 <_vfprintf_r+0x220>
    338c:	00812583          	lw	a1,8(sp)
    3390:	0b010613          	addi	a2,sp,176
    3394:	00048513          	mv	a0,s1
    3398:	03012223          	sw	a6,36(sp)
    339c:	03d12023          	sw	t4,32(sp)
    33a0:	16d000ef          	jal	3d0c <__sprint_r>
    33a4:	00050463          	beqz	a0,33ac <_vfprintf_r+0x2cb4>
    33a8:	c7cfe06f          	j	1824 <_vfprintf_r+0x112c>
    33ac:	08412603          	lw	a2,132(sp)
    33b0:	0b812a03          	lw	s4,184(sp)
    33b4:	02412803          	lw	a6,36(sp)
    33b8:	02012e83          	lw	t4,32(sp)
    33bc:	0bc10413          	addi	s0,sp,188
    33c0:	921fd06f          	j	ce0 <_vfprintf_r+0x5e8>
    33c4:	00812583          	lw	a1,8(sp)
    33c8:	0b010613          	addi	a2,sp,176
    33cc:	00048513          	mv	a0,s1
    33d0:	02f12023          	sw	a5,32(sp)
    33d4:	139000ef          	jal	3d0c <__sprint_r>
    33d8:	00050463          	beqz	a0,33e0 <_vfprintf_r+0x2ce8>
    33dc:	c48fe06f          	j	1824 <_vfprintf_r+0x112c>
    33e0:	000c4503          	lbu	a0,0(s8)
    33e4:	0b812583          	lw	a1,184(sp)
    33e8:	02012783          	lw	a5,32(sp)
    33ec:	0bc10613          	addi	a2,sp,188
    33f0:	01000713          	li	a4,16
    33f4:	00700693          	li	a3,7
    33f8:	d75ff06f          	j	316c <_vfprintf_r+0x2a74>
    33fc:	00812583          	lw	a1,8(sp)
    3400:	0b010613          	addi	a2,sp,176
    3404:	00048513          	mv	a0,s1
    3408:	05012623          	sw	a6,76(sp)
    340c:	05c12423          	sw	t3,72(sp)
    3410:	05d12223          	sw	t4,68(sp)
    3414:	0f9000ef          	jal	3d0c <__sprint_r>
    3418:	00050463          	beqz	a0,3420 <_vfprintf_r+0x2d28>
    341c:	c08fe06f          	j	1824 <_vfprintf_r+0x112c>
    3420:	0b812a03          	lw	s4,184(sp)
    3424:	04c12803          	lw	a6,76(sp)
    3428:	04812e03          	lw	t3,72(sp)
    342c:	04412e83          	lw	t4,68(sp)
    3430:	0bc10413          	addi	s0,sp,188
    3434:	895fe06f          	j	1cc8 <_vfprintf_r+0x15d0>
    3438:	00812583          	lw	a1,8(sp)
    343c:	0b010613          	addi	a2,sp,176
    3440:	00048513          	mv	a0,s1
    3444:	05012223          	sw	a6,68(sp)
    3448:	03d12223          	sw	t4,36(sp)
    344c:	03f12023          	sw	t6,32(sp)
    3450:	0bd000ef          	jal	3d0c <__sprint_r>
    3454:	00050463          	beqz	a0,345c <_vfprintf_r+0x2d64>
    3458:	bccfe06f          	j	1824 <_vfprintf_r+0x112c>
    345c:	08412a83          	lw	s5,132(sp)
    3460:	0b812a03          	lw	s4,184(sp)
    3464:	04412803          	lw	a6,68(sp)
    3468:	02412e83          	lw	t4,36(sp)
    346c:	02012f83          	lw	t6,32(sp)
    3470:	0bc10413          	addi	s0,sp,188
    3474:	8c9fe06f          	j	1d3c <_vfprintf_r+0x1644>
    3478:	00840413          	addi	s0,s0,8
    347c:	8b5fd06f          	j	d30 <_vfprintf_r+0x638>
    3480:	01812703          	lw	a4,24(sp)
    3484:	00900793          	li	a5,9
    3488:	00e7f463          	bgeu	a5,a4,3490 <_vfprintf_r+0x2d98>
    348c:	d51fe06f          	j	21dc <_vfprintf_r+0x1ae4>
    3490:	d99fe06f          	j	2228 <_vfprintf_r+0x1b30>
    3494:	07f14703          	lbu	a4,127(sp)
    3498:	fa070e63          	beqz	a4,2c54 <_vfprintf_r+0x255c>
    349c:	00180813          	addi	a6,a6,1
    34a0:	fb4ff06f          	j	2c54 <_vfprintf_r+0x255c>
    34a4:	0000fc97          	auipc	s9,0xf
    34a8:	3ecc8c93          	addi	s9,s9,1004 # 12890 <__clzsi2+0xc8>
    34ac:	00400813          	li	a6,4
    34b0:	c68fd06f          	j	918 <_vfprintf_r+0x220>
    34b4:	00812583          	lw	a1,8(sp)
    34b8:	0b010613          	addi	a2,sp,176
    34bc:	00048513          	mv	a0,s1
    34c0:	03012223          	sw	a6,36(sp)
    34c4:	03d12023          	sw	t4,32(sp)
    34c8:	045000ef          	jal	3d0c <__sprint_r>
    34cc:	00050463          	beqz	a0,34d4 <_vfprintf_r+0x2ddc>
    34d0:	b54fe06f          	j	1824 <_vfprintf_r+0x112c>
    34d4:	08412a83          	lw	s5,132(sp)
    34d8:	01812783          	lw	a5,24(sp)
    34dc:	0b812a03          	lw	s4,184(sp)
    34e0:	02412803          	lw	a6,36(sp)
    34e4:	02012e83          	lw	t4,32(sp)
    34e8:	0bc10413          	addi	s0,sp,188
    34ec:	41578ab3          	sub	s5,a5,s5
    34f0:	899fe06f          	j	1d88 <_vfprintf_r+0x1690>
    34f4:	00012a23          	sw	zero,20(sp)
    34f8:	0fc10c93          	addi	s9,sp,252
    34fc:	c1cff06f          	j	2918 <_vfprintf_r+0x2220>
    3500:	01812783          	lw	a5,24(sp)
    3504:	02c12703          	lw	a4,44(sp)
    3508:	06700313          	li	t1,103
    350c:	00e78ab3          	add	s5,a5,a4
    3510:	f3c04063          	bgtz	t3,2c30 <_vfprintf_r+0x2538>
    3514:	41ca86b3          	sub	a3,s5,t3
    3518:	00168a93          	addi	s5,a3,1
    351c:	fffac813          	not	a6,s5
    3520:	41f85813          	srai	a6,a6,0x1f
    3524:	010af833          	and	a6,s5,a6
    3528:	f1cff06f          	j	2c44 <_vfprintf_r+0x254c>
    352c:	ff000713          	li	a4,-16
    3530:	40c009b3          	neg	s3,a2
    3534:	66e65063          	bge	a2,a4,3b94 <_vfprintf_r+0x349c>
    3538:	00040793          	mv	a5,s0
    353c:	01000a93          	li	s5,16
    3540:	00098413          	mv	s0,s3
    3544:	00700b13          	li	s6,7
    3548:	03d12023          	sw	t4,32(sp)
    354c:	03012223          	sw	a6,36(sp)
    3550:	00010997          	auipc	s3,0x10
    3554:	80898993          	addi	s3,s3,-2040 # 12d58 <zeroes.0>
    3558:	00c0006f          	j	3564 <_vfprintf_r+0x2e6c>
    355c:	ff040413          	addi	s0,s0,-16
    3560:	088ada63          	bge	s5,s0,35f4 <_vfprintf_r+0x2efc>
    3564:	010a0a13          	addi	s4,s4,16
    3568:	00168693          	addi	a3,a3,1
    356c:	0137a023          	sw	s3,0(a5)
    3570:	0157a223          	sw	s5,4(a5)
    3574:	0b412c23          	sw	s4,184(sp)
    3578:	0ad12a23          	sw	a3,180(sp)
    357c:	00878793          	addi	a5,a5,8
    3580:	fcdb5ee3          	bge	s6,a3,355c <_vfprintf_r+0x2e64>
    3584:	00812583          	lw	a1,8(sp)
    3588:	0b010613          	addi	a2,sp,176
    358c:	00048513          	mv	a0,s1
    3590:	77c000ef          	jal	3d0c <__sprint_r>
    3594:	00050463          	beqz	a0,359c <_vfprintf_r+0x2ea4>
    3598:	a8cfe06f          	j	1824 <_vfprintf_r+0x112c>
    359c:	0b812a03          	lw	s4,184(sp)
    35a0:	0b412683          	lw	a3,180(sp)
    35a4:	0bc10793          	addi	a5,sp,188
    35a8:	fb5ff06f          	j	355c <_vfprintf_r+0x2e64>
    35ac:	03412503          	lw	a0,52(sp)
    35b0:	000e0593          	mv	a1,t3
    35b4:	00000613          	li	a2,0
    35b8:	00000693          	li	a3,0
    35bc:	02612023          	sw	t1,32(sp)
    35c0:	01d12a23          	sw	t4,20(sp)
    35c4:	4580d0ef          	jal	10a1c <__eqdf2>
    35c8:	01412e83          	lw	t4,20(sp)
    35cc:	02012303          	lw	t1,32(sp)
    35d0:	00050e63          	beqz	a0,35ec <_vfprintf_r+0x2ef4>
    35d4:	01812783          	lw	a5,24(sp)
    35d8:	0a812703          	lw	a4,168(sp)
    35dc:	00fc8833          	add	a6,s9,a5
    35e0:	e1076263          	bltu	a4,a6,2be4 <_vfprintf_r+0x24ec>
    35e4:	419707b3          	sub	a5,a4,s9
    35e8:	00f12c23          	sw	a5,24(sp)
    35ec:	08412e03          	lw	t3,132(sp)
    35f0:	a19ff06f          	j	3008 <_vfprintf_r+0x2910>
    35f4:	02012e83          	lw	t4,32(sp)
    35f8:	02412803          	lw	a6,36(sp)
    35fc:	00098713          	mv	a4,s3
    3600:	00040993          	mv	s3,s0
    3604:	00078413          	mv	s0,a5
    3608:	013a0a33          	add	s4,s4,s3
    360c:	00168693          	addi	a3,a3,1
    3610:	00e42023          	sw	a4,0(s0)
    3614:	0b412c23          	sw	s4,184(sp)
    3618:	0ad12a23          	sw	a3,180(sp)
    361c:	01342223          	sw	s3,4(s0)
    3620:	00700713          	li	a4,7
    3624:	e4d75ae3          	bge	a4,a3,3478 <_vfprintf_r+0x2d80>
    3628:	00812583          	lw	a1,8(sp)
    362c:	0b010613          	addi	a2,sp,176
    3630:	00048513          	mv	a0,s1
    3634:	03012223          	sw	a6,36(sp)
    3638:	03d12023          	sw	t4,32(sp)
    363c:	6d0000ef          	jal	3d0c <__sprint_r>
    3640:	00050463          	beqz	a0,3648 <_vfprintf_r+0x2f50>
    3644:	9e0fe06f          	j	1824 <_vfprintf_r+0x112c>
    3648:	0b812a03          	lw	s4,184(sp)
    364c:	0b412683          	lw	a3,180(sp)
    3650:	02412803          	lw	a6,36(sp)
    3654:	02012e83          	lw	t4,32(sp)
    3658:	0bc10413          	addi	s0,sp,188
    365c:	ed4fd06f          	j	d30 <_vfprintf_r+0x638>
    3660:	07f14883          	lbu	a7,127(sp)
    3664:	00000b13          	li	s6,0
    3668:	00088463          	beqz	a7,3670 <_vfprintf_r+0x2f78>
    366c:	cf5fd06f          	j	1360 <_vfprintf_r+0xc68>
    3670:	8a9fd06f          	j	f18 <_vfprintf_r+0x820>
    3674:	19812403          	lw	s0,408(sp)
    3678:	19012903          	lw	s2,400(sp)
    367c:	18812a03          	lw	s4,392(sp)
    3680:	18012b03          	lw	s6,384(sp)
    3684:	17c12b83          	lw	s7,380(sp)
    3688:	17812c03          	lw	s8,376(sp)
    368c:	17412c83          	lw	s9,372(sp)
    3690:	17012d03          	lw	s10,368(sp)
    3694:	16c12d83          	lw	s11,364(sp)
    3698:	fff00793          	li	a5,-1
    369c:	00f12623          	sw	a5,12(sp)
    36a0:	9e4fe06f          	j	1884 <_vfprintf_r+0x118c>
    36a4:	02012783          	lw	a5,32(sp)
    36a8:	00e7f733          	and	a4,a5,a4
    36ac:	8e070e63          	beqz	a4,27a8 <_vfprintf_r+0x20b0>
    36b0:	8f0ff06f          	j	27a0 <_vfprintf_r+0x20a8>
    36b4:	80000737          	lui	a4,0x80000
    36b8:	00e7c733          	xor	a4,a5,a4
    36bc:	02d00a13          	li	s4,45
    36c0:	00012a23          	sw	zero,20(sp)
    36c4:	0fc10c93          	addi	s9,sp,252
    36c8:	dc5fe06f          	j	248c <_vfprintf_r+0x1d94>
    36cc:	00812983          	lw	s3,8(sp)
    36d0:	00000293          	li	t0,0
    36d4:	00c9d783          	lhu	a5,12(s3)
    36d8:	0407e793          	ori	a5,a5,64
    36dc:	00f99623          	sh	a5,12(s3)
    36e0:	94cfe06f          	j	182c <_vfprintf_r+0x1134>
    36e4:	01412283          	lw	t0,20(sp)
    36e8:	944fe06f          	j	182c <_vfprintf_r+0x1134>
    36ec:	00012a23          	sw	zero,20(sp)
    36f0:	00300a93          	li	s5,3
    36f4:	00000b13          	li	s6,0
    36f8:	02012223          	sw	zero,36(sp)
    36fc:	02012023          	sw	zero,32(sp)
    3700:	00000e13          	li	t3,0
    3704:	00400813          	li	a6,4
    3708:	a10fd06f          	j	918 <_vfprintf_r+0x220>
    370c:	00040813          	mv	a6,s0
    3710:	000c0493          	mv	s1,s8
    3714:	03812e83          	lw	t4,56(sp)
    3718:	04412403          	lw	s0,68(sp)
    371c:	04812303          	lw	t1,72(sp)
    3720:	04c12a03          	lw	s4,76(sp)
    3724:	00098c13          	mv	s8,s3
    3728:	01698b33          	add	s6,s3,s6
    372c:	00098693          	mv	a3,s3
    3730:	03000613          	li	a2,48
    3734:	00085463          	bgez	a6,373c <_vfprintf_r+0x3044>
    3738:	f69fe06f          	j	26a0 <_vfprintf_r+0x1fa8>
    373c:	00168693          	addi	a3,a3,1
    3740:	fec68fa3          	sb	a2,-1(a3)
    3744:	fedb1ce3          	bne	s6,a3,373c <_vfprintf_r+0x3044>
    3748:	010c0833          	add	a6,s8,a6
    374c:	00180c13          	addi	s8,a6,1
    3750:	f51fe06f          	j	26a0 <_vfprintf_r+0x1fa8>
    3754:	00812983          	lw	s3,8(sp)
    3758:	8e4fe06f          	j	183c <_vfprintf_r+0x1144>
    375c:	01112823          	sw	a7,16(sp)
    3760:	20070263          	beqz	a4,3964 <_vfprintf_r+0x326c>
    3764:	001b0813          	addi	a6,s6,1
    3768:	000b0a93          	mv	s5,s6
    376c:	02012223          	sw	zero,36(sp)
    3770:	00000b13          	li	s6,0
    3774:	02012023          	sw	zero,32(sp)
    3778:	07300313          	li	t1,115
    377c:	99cfd06f          	j	918 <_vfprintf_r+0x220>
    3780:	01012e83          	lw	t4,16(sp)
    3784:	01412403          	lw	s0,20(sp)
    3788:	02012883          	lw	a7,32(sp)
    378c:	000b0313          	mv	t1,s6
    3790:	000a0a93          	mv	s5,s4
    3794:	948ff06f          	j	28dc <_vfprintf_r+0x21e4>
    3798:	06700313          	li	t1,103
    379c:	03c12783          	lw	a5,60(sp)
    37a0:	0007c703          	lbu	a4,0(a5)
    37a4:	f0170613          	addi	a2,a4,-255 # 7fffff01 <_stack_top+0x6fffbf01>
    37a8:	44060263          	beqz	a2,3bec <_vfprintf_r+0x34f4>
    37ac:	45c75063          	bge	a4,t3,3bec <_vfprintf_r+0x34f4>
    37b0:	00000593          	li	a1,0
    37b4:	00000613          	li	a2,0
    37b8:	0180006f          	j	37d0 <_vfprintf_r+0x30d8>
    37bc:	00160613          	addi	a2,a2,1
    37c0:	00178793          	addi	a5,a5,1
    37c4:	f0170693          	addi	a3,a4,-255
    37c8:	02068063          	beqz	a3,37e8 <_vfprintf_r+0x30f0>
    37cc:	01c75e63          	bge	a4,t3,37e8 <_vfprintf_r+0x30f0>
    37d0:	40ee0e33          	sub	t3,t3,a4
    37d4:	0017c703          	lbu	a4,1(a5)
    37d8:	fe0712e3          	bnez	a4,37bc <_vfprintf_r+0x30c4>
    37dc:	0007c703          	lbu	a4,0(a5)
    37e0:	00158593          	addi	a1,a1,1
    37e4:	fe1ff06f          	j	37c4 <_vfprintf_r+0x30cc>
    37e8:	02b12223          	sw	a1,36(sp)
    37ec:	00b60533          	add	a0,a2,a1
    37f0:	05012583          	lw	a1,80(sp)
    37f4:	05d12423          	sw	t4,72(sp)
    37f8:	04612223          	sw	t1,68(sp)
    37fc:	01c12a23          	sw	t3,20(sp)
    3800:	02f12e23          	sw	a5,60(sp)
    3804:	02c12023          	sw	a2,32(sp)
    3808:	6e90e0ef          	jal	126f0 <__mulsi3>
    380c:	01412e03          	lw	t3,20(sp)
    3810:	04412303          	lw	t1,68(sp)
    3814:	04812e83          	lw	t4,72(sp)
    3818:	00050713          	mv	a4,a0
    381c:	00ea8ab3          	add	s5,s5,a4
    3820:	fffac813          	not	a6,s5
    3824:	41f85813          	srai	a6,a6,0x1f
    3828:	010af833          	and	a6,s5,a6
    382c:	140a0a63          	beqz	s4,3980 <_vfprintf_r+0x3288>
    3830:	02d00713          	li	a4,45
    3834:	06e10fa3          	sb	a4,127(sp)
    3838:	00180813          	addi	a6,a6,1
    383c:	00098c13          	mv	s8,s3
    3840:	00012a23          	sw	zero,20(sp)
    3844:	00000b13          	li	s6,0
    3848:	8d0fd06f          	j	918 <_vfprintf_r+0x220>
    384c:	02c12783          	lw	a5,44(sp)
    3850:	01cb06b3          	add	a3,s6,t3
    3854:	06600313          	li	t1,102
    3858:	00f68ab3          	add	s5,a3,a5
    385c:	bd4ff06f          	j	2c30 <_vfprintf_r+0x2538>
    3860:	419807b3          	sub	a5,a6,s9
    3864:	08412e03          	lw	t3,132(sp)
    3868:	00f12c23          	sw	a5,24(sp)
    386c:	bacff06f          	j	2c18 <_vfprintf_r+0x2520>
    3870:	03412683          	lw	a3,52(sp)
    3874:	000e0593          	mv	a1,t3
    3878:	00000613          	li	a2,0
    387c:	00068513          	mv	a0,a3
    3880:	00000693          	li	a3,0
    3884:	02612223          	sw	t1,36(sp)
    3888:	03012023          	sw	a6,32(sp)
    388c:	01d12c23          	sw	t4,24(sp)
    3890:	01c12a23          	sw	t3,20(sp)
    3894:	1880d0ef          	jal	10a1c <__eqdf2>
    3898:	01412e03          	lw	t3,20(sp)
    389c:	01812e83          	lw	t4,24(sp)
    38a0:	02012803          	lw	a6,32(sp)
    38a4:	02412303          	lw	t1,36(sp)
    38a8:	22051e63          	bnez	a0,3ae4 <_vfprintf_r+0x33ec>
    38ac:	08412e03          	lw	t3,132(sp)
    38b0:	01c80833          	add	a6,a6,t3
    38b4:	419807b3          	sub	a5,a6,s9
    38b8:	00f12c23          	sw	a5,24(sp)
    38bc:	b54ff06f          	j	2c10 <_vfprintf_r+0x2518>
    38c0:	02d00713          	li	a4,45
    38c4:	08e108a3          	sb	a4,145(sp)
    38c8:	00100693          	li	a3,1
    38cc:	ff800713          	li	a4,-8
    38d0:	41c68b33          	sub	s6,a3,t3
    38d4:	f6ee4263          	blt	t3,a4,3038 <_vfprintf_r+0x2940>
    38d8:	03000713          	li	a4,48
    38dc:	08e10923          	sb	a4,146(sp)
    38e0:	03812023          	sw	s8,32(sp)
    38e4:	00012a23          	sw	zero,20(sp)
    38e8:	09310713          	addi	a4,sp,147
    38ec:	e80ff06f          	j	2f6c <_vfprintf_r+0x2874>
    38f0:	00f12823          	sw	a5,16(sp)
    38f4:	abdfd06f          	j	13b0 <_vfprintf_r+0xcb8>
    38f8:	02812783          	lw	a5,40(sp)
    38fc:	80000fb7          	lui	t6,0x80000
    3900:	f7fc7c13          	andi	s8,s8,-129
    3904:	01f7fe33          	and	t3,a5,t6
    3908:	120e0a63          	beqz	t3,3a3c <_vfprintf_r+0x3344>
    390c:	02d00793          	li	a5,45
    3910:	06f10fa3          	sb	a5,127(sp)
    3914:	00012a23          	sw	zero,20(sp)
    3918:	04700793          	li	a5,71
    391c:	02012223          	sw	zero,36(sp)
    3920:	02012023          	sw	zero,32(sp)
    3924:	00300a93          	li	s5,3
    3928:	00000b13          	li	s6,0
    392c:	00000e13          	li	t3,0
    3930:	1467da63          	bge	a5,t1,3a84 <_vfprintf_r+0x338c>
    3934:	0000fc97          	auipc	s9,0xf
    3938:	f68c8c93          	addi	s9,s9,-152 # 1289c <__clzsi2+0xd4>
    393c:	00400813          	li	a6,4
    3940:	fd9fc06f          	j	918 <_vfprintf_r+0x220>
    3944:	00177713          	andi	a4,a4,1
    3948:	d40718e3          	bnez	a4,3698 <_vfprintf_r+0x2fa0>
    394c:	00c9d783          	lhu	a5,12(s3)
    3950:	2007f793          	andi	a5,a5,512
    3954:	d40792e3          	bnez	a5,3698 <_vfprintf_r+0x2fa0>
    3958:	0589a503          	lw	a0,88(s3)
    395c:	d0dfc0ef          	jal	668 <__retarget_lock_release_recursive>
    3960:	d39ff06f          	j	3698 <_vfprintf_r+0x2fa0>
    3964:	000b0a93          	mv	s5,s6
    3968:	000b0813          	mv	a6,s6
    396c:	02012223          	sw	zero,36(sp)
    3970:	02012023          	sw	zero,32(sp)
    3974:	00000b13          	li	s6,0
    3978:	07300313          	li	t1,115
    397c:	f9dfc06f          	j	918 <_vfprintf_r+0x220>
    3980:	07f14703          	lbu	a4,127(sp)
    3984:	14070863          	beqz	a4,3ad4 <_vfprintf_r+0x33dc>
    3988:	00180813          	addi	a6,a6,1
    398c:	00098c13          	mv	s8,s3
    3990:	00012a23          	sw	zero,20(sp)
    3994:	00000b13          	li	s6,0
    3998:	f81fc06f          	j	918 <_vfprintf_r+0x220>
    399c:	0000f717          	auipc	a4,0xf
    39a0:	3bc70713          	addi	a4,a4,956 # 12d58 <zeroes.0>
    39a4:	808ff06f          	j	29ac <_vfprintf_r+0x22b4>
    39a8:	80000737          	lui	a4,0x80000
    39ac:	00e7c733          	xor	a4,a5,a4
    39b0:	00a12a23          	sw	a0,20(sp)
    39b4:	02d00a13          	li	s4,45
    39b8:	ad5fe06f          	j	248c <_vfprintf_r+0x1d94>
    39bc:	02812783          	lw	a5,40(sp)
    39c0:	00000a13          	li	s4,0
    39c4:	00078e13          	mv	t3,a5
    39c8:	0007d863          	bgez	a5,39d8 <_vfprintf_r+0x32e0>
    39cc:	80000cb7          	lui	s9,0x80000
    39d0:	0197ce33          	xor	t3,a5,s9
    39d4:	02d00a13          	li	s4,45
    39d8:	03412603          	lw	a2,52(sp)
    39dc:	0a810893          	addi	a7,sp,168
    39e0:	08c10813          	addi	a6,sp,140
    39e4:	00060593          	mv	a1,a2
    39e8:	08410793          	addi	a5,sp,132
    39ec:	000e0613          	mv	a2,t3
    39f0:	00100713          	li	a4,1
    39f4:	00200693          	li	a3,2
    39f8:	00048513          	mv	a0,s1
    39fc:	02612223          	sw	t1,36(sp)
    3a00:	03d12023          	sw	t4,32(sp)
    3a04:	01c12a23          	sw	t3,20(sp)
    3a08:	00100b13          	li	s6,1
    3a0c:	645020ef          	jal	6850 <_dtoa_r>
    3a10:	01412e03          	lw	t3,20(sp)
    3a14:	02012e83          	lw	t4,32(sp)
    3a18:	02412303          	lw	t1,36(sp)
    3a1c:	00050c93          	mv	s9,a0
    3a20:	01612c23          	sw	s6,24(sp)
    3a24:	dccff06f          	j	2ff0 <_vfprintf_r+0x28f8>
    3a28:	80000cb7          	lui	s9,0x80000
    3a2c:	0197ce33          	xor	t3,a5,s9
    3a30:	02d00a13          	li	s4,45
    3a34:	00600b13          	li	s6,6
    3a38:	910ff06f          	j	2b48 <_vfprintf_r+0x2450>
    3a3c:	04700693          	li	a3,71
    3a40:	07f14703          	lbu	a4,127(sp)
    3a44:	0000fc97          	auipc	s9,0xf
    3a48:	e54c8c93          	addi	s9,s9,-428 # 12898 <__clzsi2+0xd0>
    3a4c:	0066d663          	bge	a3,t1,3a58 <_vfprintf_r+0x3360>
    3a50:	0000fc97          	auipc	s9,0xf
    3a54:	e4cc8c93          	addi	s9,s9,-436 # 1289c <__clzsi2+0xd4>
    3a58:	0c071863          	bnez	a4,3b28 <_vfprintf_r+0x3430>
    3a5c:	00300a93          	li	s5,3
    3a60:	000a8813          	mv	a6,s5
    3a64:	00000b13          	li	s6,0
    3a68:	02012223          	sw	zero,36(sp)
    3a6c:	02012023          	sw	zero,32(sp)
    3a70:	00012a23          	sw	zero,20(sp)
    3a74:	ea5fc06f          	j	918 <_vfprintf_r+0x220>
    3a78:	0000f717          	auipc	a4,0xf
    3a7c:	2e070713          	addi	a4,a4,736 # 12d58 <zeroes.0>
    3a80:	db0fe06f          	j	2030 <_vfprintf_r+0x1938>
    3a84:	0000fc97          	auipc	s9,0xf
    3a88:	e14c8c93          	addi	s9,s9,-492 # 12898 <__clzsi2+0xd0>
    3a8c:	00400813          	li	a6,4
    3a90:	e89fc06f          	j	918 <_vfprintf_r+0x220>
    3a94:	00071a63          	bnez	a4,3aa8 <_vfprintf_r+0x33b0>
    3a98:	00100813          	li	a6,1
    3a9c:	00080a93          	mv	s5,a6
    3aa0:	06600313          	li	t1,102
    3aa4:	9a0ff06f          	j	2c44 <_vfprintf_r+0x254c>
    3aa8:	02c12783          	lw	a5,44(sp)
    3aac:	06600313          	li	t1,102
    3ab0:	00178693          	addi	a3,a5,1
    3ab4:	01668ab3          	add	s5,a3,s6
    3ab8:	fffac813          	not	a6,s5
    3abc:	41f85813          	srai	a6,a6,0x1f
    3ac0:	010af833          	and	a6,s5,a6
    3ac4:	980ff06f          	j	2c44 <_vfprintf_r+0x254c>
    3ac8:	00200793          	li	a5,2
    3acc:	02f12c23          	sw	a5,56(sp)
    3ad0:	cbdfe06f          	j	278c <_vfprintf_r+0x2094>
    3ad4:	00098c13          	mv	s8,s3
    3ad8:	00012a23          	sw	zero,20(sp)
    3adc:	00000b13          	li	s6,0
    3ae0:	e39fc06f          	j	918 <_vfprintf_r+0x220>
    3ae4:	00100713          	li	a4,1
    3ae8:	41670733          	sub	a4,a4,s6
    3aec:	08e12223          	sw	a4,132(sp)
    3af0:	8b8ff06f          	j	2ba8 <_vfprintf_r+0x24b0>
    3af4:	0649a783          	lw	a5,100(s3)
    3af8:	0017f793          	andi	a5,a5,1
    3afc:	b8079ee3          	bnez	a5,3698 <_vfprintf_r+0x2fa0>
    3b00:	e4dff06f          	j	394c <_vfprintf_r+0x3254>
    3b04:	01012783          	lw	a5,16(sp)
    3b08:	0007ab03          	lw	s6,0(a5)
    3b0c:	00478793          	addi	a5,a5,4
    3b10:	000b5463          	bgez	s6,3b18 <_vfprintf_r+0x3420>
    3b14:	fff00b13          	li	s6,-1
    3b18:	001bc303          	lbu	t1,1(s7)
    3b1c:	00f12823          	sw	a5,16(sp)
    3b20:	00068b93          	mv	s7,a3
    3b24:	d71fc06f          	j	894 <_vfprintf_r+0x19c>
    3b28:	00000b13          	li	s6,0
    3b2c:	02012223          	sw	zero,36(sp)
    3b30:	02012023          	sw	zero,32(sp)
    3b34:	00012a23          	sw	zero,20(sp)
    3b38:	00300a93          	li	s5,3
    3b3c:	00400813          	li	a6,4
    3b40:	dd9fc06f          	j	918 <_vfprintf_r+0x220>
    3b44:	419707b3          	sub	a5,a4,s9
    3b48:	08412e03          	lw	t3,132(sp)
    3b4c:	00f12c23          	sw	a5,24(sp)
    3b50:	8c0ff06f          	j	2c10 <_vfprintf_r+0x2518>
    3b54:	00812983          	lw	s3,8(sp)
    3b58:	01412283          	lw	t0,20(sp)
    3b5c:	00c9d783          	lhu	a5,12(s3)
    3b60:	0407e793          	ori	a5,a5,64
    3b64:	00f99623          	sh	a5,12(s3)
    3b68:	cc5fd06f          	j	182c <_vfprintf_r+0x1134>
    3b6c:	000c0813          	mv	a6,s8
    3b70:	b2cfe06f          	j	1e9c <_vfprintf_r+0x17a4>
    3b74:	02012223          	sw	zero,36(sp)
    3b78:	02012023          	sw	zero,32(sp)
    3b7c:	d9dfc06f          	j	918 <_vfprintf_r+0x220>
    3b80:	01812783          	lw	a5,24(sp)
    3b84:	00fc87b3          	add	a5,s9,a5
    3b88:	e1cff06f          	j	31a4 <_vfprintf_r+0x2aac>
    3b8c:	000c0f13          	mv	t5,s8
    3b90:	f88fd06f          	j	1318 <_vfprintf_r+0xc20>
    3b94:	0000f717          	auipc	a4,0xf
    3b98:	1c470713          	addi	a4,a4,452 # 12d58 <zeroes.0>
    3b9c:	a6dff06f          	j	3608 <_vfprintf_r+0x2f10>
    3ba0:	03412503          	lw	a0,52(sp)
    3ba4:	000e0593          	mv	a1,t3
    3ba8:	00000613          	li	a2,0
    3bac:	00000693          	li	a3,0
    3bb0:	02612023          	sw	t1,32(sp)
    3bb4:	01d12a23          	sw	t4,20(sp)
    3bb8:	6650c0ef          	jal	10a1c <__eqdf2>
    3bbc:	01412e83          	lw	t4,20(sp)
    3bc0:	02012303          	lw	t1,32(sp)
    3bc4:	04050063          	beqz	a0,3c04 <_vfprintf_r+0x350c>
    3bc8:	01812783          	lw	a5,24(sp)
    3bcc:	0a812703          	lw	a4,168(sp)
    3bd0:	00fc8833          	add	a6,s9,a5
    3bd4:	01077463          	bgeu	a4,a6,3bdc <_vfprintf_r+0x34e4>
    3bd8:	80cff06f          	j	2be4 <_vfprintf_r+0x24ec>
    3bdc:	419707b3          	sub	a5,a4,s9
    3be0:	08412e03          	lw	t3,132(sp)
    3be4:	00f12c23          	sw	a5,24(sp)
    3be8:	c30ff06f          	j	3018 <_vfprintf_r+0x2920>
    3bec:	00000713          	li	a4,0
    3bf0:	02012223          	sw	zero,36(sp)
    3bf4:	02012023          	sw	zero,32(sp)
    3bf8:	c25ff06f          	j	381c <_vfprintf_r+0x3124>
    3bfc:	000c0f13          	mv	t5,s8
    3c00:	9b5fd06f          	j	15b4 <_vfprintf_r+0xebc>
    3c04:	08412e03          	lw	t3,132(sp)
    3c08:	c10ff06f          	j	3018 <_vfprintf_r+0x2920>

00003c0c <vfprintf>:
    3c0c:	00050713          	mv	a4,a0
    3c10:	0fffd517          	auipc	a0,0xfffd
    3c14:	bb852503          	lw	a0,-1096(a0) # 100007c8 <_impure_ptr>
    3c18:	00060693          	mv	a3,a2
    3c1c:	00058613          	mv	a2,a1
    3c20:	00070593          	mv	a1,a4
    3c24:	ad5fc06f          	j	6f8 <_vfprintf_r>

00003c28 <__sbprintf>:
    3c28:	00c5d783          	lhu	a5,12(a1)
    3c2c:	0645ae03          	lw	t3,100(a1)
    3c30:	00e5d303          	lhu	t1,14(a1)
    3c34:	01c5a883          	lw	a7,28(a1)
    3c38:	0245a803          	lw	a6,36(a1)
    3c3c:	b7010113          	addi	sp,sp,-1168
    3c40:	40000713          	li	a4,1024
    3c44:	ffd7f793          	andi	a5,a5,-3
    3c48:	48812423          	sw	s0,1160(sp)
    3c4c:	49212023          	sw	s2,1152(sp)
    3c50:	00058413          	mv	s0,a1
    3c54:	00050913          	mv	s2,a0
    3c58:	08010593          	addi	a1,sp,128
    3c5c:	07010513          	addi	a0,sp,112
    3c60:	48112623          	sw	ra,1164(sp)
    3c64:	48912223          	sw	s1,1156(sp)
    3c68:	00d12623          	sw	a3,12(sp)
    3c6c:	00060493          	mv	s1,a2
    3c70:	02f11223          	sh	a5,36(sp)
    3c74:	07c12e23          	sw	t3,124(sp)
    3c78:	02611323          	sh	t1,38(sp)
    3c7c:	03112a23          	sw	a7,52(sp)
    3c80:	03012e23          	sw	a6,60(sp)
    3c84:	00b12c23          	sw	a1,24(sp)
    3c88:	02b12423          	sw	a1,40(sp)
    3c8c:	02e12023          	sw	a4,32(sp)
    3c90:	02e12623          	sw	a4,44(sp)
    3c94:	02012823          	sw	zero,48(sp)
    3c98:	9a9fc0ef          	jal	640 <__retarget_lock_init_recursive>
    3c9c:	00c12683          	lw	a3,12(sp)
    3ca0:	00048613          	mv	a2,s1
    3ca4:	01810593          	addi	a1,sp,24
    3ca8:	00090513          	mv	a0,s2
    3cac:	a4dfc0ef          	jal	6f8 <_vfprintf_r>
    3cb0:	00050493          	mv	s1,a0
    3cb4:	04055063          	bgez	a0,3cf4 <__sbprintf+0xcc>
    3cb8:	02415783          	lhu	a5,36(sp)
    3cbc:	0407f793          	andi	a5,a5,64
    3cc0:	00078863          	beqz	a5,3cd0 <__sbprintf+0xa8>
    3cc4:	00c45783          	lhu	a5,12(s0)
    3cc8:	0407e793          	ori	a5,a5,64
    3ccc:	00f41623          	sh	a5,12(s0)
    3cd0:	07012503          	lw	a0,112(sp)
    3cd4:	975fc0ef          	jal	648 <__retarget_lock_close_recursive>
    3cd8:	48c12083          	lw	ra,1164(sp)
    3cdc:	48812403          	lw	s0,1160(sp)
    3ce0:	48012903          	lw	s2,1152(sp)
    3ce4:	00048513          	mv	a0,s1
    3ce8:	48412483          	lw	s1,1156(sp)
    3cec:	49010113          	addi	sp,sp,1168
    3cf0:	00008067          	ret
    3cf4:	01810593          	addi	a1,sp,24
    3cf8:	00090513          	mv	a0,s2
    3cfc:	2a8000ef          	jal	3fa4 <_fflush_r>
    3d00:	fa050ce3          	beqz	a0,3cb8 <__sbprintf+0x90>
    3d04:	fff00493          	li	s1,-1
    3d08:	fb1ff06f          	j	3cb8 <__sbprintf+0x90>

00003d0c <__sprint_r>:
    3d0c:	00862703          	lw	a4,8(a2)
    3d10:	00071863          	bnez	a4,3d20 <__sprint_r+0x14>
    3d14:	00000513          	li	a0,0
    3d18:	00062223          	sw	zero,4(a2)
    3d1c:	00008067          	ret
    3d20:	fe010113          	addi	sp,sp,-32
    3d24:	00112e23          	sw	ra,28(sp)
    3d28:	00c12623          	sw	a2,12(sp)
    3d2c:	111000ef          	jal	463c <__sfvwrite_r>
    3d30:	00c12783          	lw	a5,12(sp)
    3d34:	01c12083          	lw	ra,28(sp)
    3d38:	0007a423          	sw	zero,8(a5)
    3d3c:	0007a223          	sw	zero,4(a5)
    3d40:	02010113          	addi	sp,sp,32
    3d44:	00008067          	ret

00003d48 <__sflush_r>:
    3d48:	00c59703          	lh	a4,12(a1)
    3d4c:	fe010113          	addi	sp,sp,-32
    3d50:	00812c23          	sw	s0,24(sp)
    3d54:	01312623          	sw	s3,12(sp)
    3d58:	00112e23          	sw	ra,28(sp)
    3d5c:	00877793          	andi	a5,a4,8
    3d60:	00058413          	mv	s0,a1
    3d64:	00050993          	mv	s3,a0
    3d68:	12079263          	bnez	a5,3e8c <__sflush_r+0x144>
    3d6c:	000017b7          	lui	a5,0x1
    3d70:	80078793          	addi	a5,a5,-2048 # 800 <_vfprintf_r+0x108>
    3d74:	0045a683          	lw	a3,4(a1)
    3d78:	00f767b3          	or	a5,a4,a5
    3d7c:	00f59623          	sh	a5,12(a1)
    3d80:	18d05c63          	blez	a3,3f18 <__sflush_r+0x1d0>
    3d84:	02842803          	lw	a6,40(s0)
    3d88:	0e080663          	beqz	a6,3e74 <__sflush_r+0x12c>
    3d8c:	00912a23          	sw	s1,20(sp)
    3d90:	01371693          	slli	a3,a4,0x13
    3d94:	0009a483          	lw	s1,0(s3)
    3d98:	0009a023          	sw	zero,0(s3)
    3d9c:	1806ca63          	bltz	a3,3f30 <__sflush_r+0x1e8>
    3da0:	01c42583          	lw	a1,28(s0)
    3da4:	00000613          	li	a2,0
    3da8:	00100693          	li	a3,1
    3dac:	00098513          	mv	a0,s3
    3db0:	000800e7          	jalr	a6
    3db4:	fff00793          	li	a5,-1
    3db8:	00050613          	mv	a2,a0
    3dbc:	1af50c63          	beq	a0,a5,3f74 <__sflush_r+0x22c>
    3dc0:	00c41783          	lh	a5,12(s0)
    3dc4:	02842803          	lw	a6,40(s0)
    3dc8:	0047f793          	andi	a5,a5,4
    3dcc:	00078e63          	beqz	a5,3de8 <__sflush_r+0xa0>
    3dd0:	00442703          	lw	a4,4(s0)
    3dd4:	03042783          	lw	a5,48(s0)
    3dd8:	40e60633          	sub	a2,a2,a4
    3ddc:	00078663          	beqz	a5,3de8 <__sflush_r+0xa0>
    3de0:	03c42783          	lw	a5,60(s0)
    3de4:	40f60633          	sub	a2,a2,a5
    3de8:	01c42583          	lw	a1,28(s0)
    3dec:	00000693          	li	a3,0
    3df0:	00098513          	mv	a0,s3
    3df4:	000800e7          	jalr	a6
    3df8:	fff00713          	li	a4,-1
    3dfc:	00c41783          	lh	a5,12(s0)
    3e00:	12e51c63          	bne	a0,a4,3f38 <__sflush_r+0x1f0>
    3e04:	0009a683          	lw	a3,0(s3)
    3e08:	01d00713          	li	a4,29
    3e0c:	18d76263          	bltu	a4,a3,3f90 <__sflush_r+0x248>
    3e10:	20400737          	lui	a4,0x20400
    3e14:	00170713          	addi	a4,a4,1 # 20400001 <_stack_top+0x103fc001>
    3e18:	00d75733          	srl	a4,a4,a3
    3e1c:	00177713          	andi	a4,a4,1
    3e20:	16070863          	beqz	a4,3f90 <__sflush_r+0x248>
    3e24:	01042683          	lw	a3,16(s0)
    3e28:	fffff737          	lui	a4,0xfffff
    3e2c:	7ff70713          	addi	a4,a4,2047 # fffff7ff <_stack_top+0xefffb7ff>
    3e30:	00e7f733          	and	a4,a5,a4
    3e34:	00e41623          	sh	a4,12(s0)
    3e38:	00042223          	sw	zero,4(s0)
    3e3c:	00d42023          	sw	a3,0(s0)
    3e40:	01379713          	slli	a4,a5,0x13
    3e44:	00075663          	bgez	a4,3e50 <__sflush_r+0x108>
    3e48:	0009a783          	lw	a5,0(s3)
    3e4c:	10078863          	beqz	a5,3f5c <__sflush_r+0x214>
    3e50:	03042583          	lw	a1,48(s0)
    3e54:	0099a023          	sw	s1,0(s3)
    3e58:	10058a63          	beqz	a1,3f6c <__sflush_r+0x224>
    3e5c:	04040793          	addi	a5,s0,64
    3e60:	00f58663          	beq	a1,a5,3e6c <__sflush_r+0x124>
    3e64:	00098513          	mv	a0,s3
    3e68:	458040ef          	jal	82c0 <_free_r>
    3e6c:	01412483          	lw	s1,20(sp)
    3e70:	02042823          	sw	zero,48(s0)
    3e74:	01c12083          	lw	ra,28(sp)
    3e78:	01812403          	lw	s0,24(sp)
    3e7c:	00c12983          	lw	s3,12(sp)
    3e80:	00000513          	li	a0,0
    3e84:	02010113          	addi	sp,sp,32
    3e88:	00008067          	ret
    3e8c:	01212823          	sw	s2,16(sp)
    3e90:	0105a903          	lw	s2,16(a1)
    3e94:	08090a63          	beqz	s2,3f28 <__sflush_r+0x1e0>
    3e98:	00912a23          	sw	s1,20(sp)
    3e9c:	0005a483          	lw	s1,0(a1)
    3ea0:	00377713          	andi	a4,a4,3
    3ea4:	0125a023          	sw	s2,0(a1)
    3ea8:	412484b3          	sub	s1,s1,s2
    3eac:	00000793          	li	a5,0
    3eb0:	00071463          	bnez	a4,3eb8 <__sflush_r+0x170>
    3eb4:	0145a783          	lw	a5,20(a1)
    3eb8:	00f42423          	sw	a5,8(s0)
    3ebc:	00904863          	bgtz	s1,3ecc <__sflush_r+0x184>
    3ec0:	0640006f          	j	3f24 <__sflush_r+0x1dc>
    3ec4:	00a90933          	add	s2,s2,a0
    3ec8:	04905e63          	blez	s1,3f24 <__sflush_r+0x1dc>
    3ecc:	02442783          	lw	a5,36(s0)
    3ed0:	01c42583          	lw	a1,28(s0)
    3ed4:	00048693          	mv	a3,s1
    3ed8:	00090613          	mv	a2,s2
    3edc:	00098513          	mv	a0,s3
    3ee0:	000780e7          	jalr	a5
    3ee4:	40a484b3          	sub	s1,s1,a0
    3ee8:	fca04ee3          	bgtz	a0,3ec4 <__sflush_r+0x17c>
    3eec:	00c45783          	lhu	a5,12(s0)
    3ef0:	01012903          	lw	s2,16(sp)
    3ef4:	0407e793          	ori	a5,a5,64
    3ef8:	01c12083          	lw	ra,28(sp)
    3efc:	00f41623          	sh	a5,12(s0)
    3f00:	01812403          	lw	s0,24(sp)
    3f04:	01412483          	lw	s1,20(sp)
    3f08:	00c12983          	lw	s3,12(sp)
    3f0c:	fff00513          	li	a0,-1
    3f10:	02010113          	addi	sp,sp,32
    3f14:	00008067          	ret
    3f18:	03c5a683          	lw	a3,60(a1)
    3f1c:	e6d044e3          	bgtz	a3,3d84 <__sflush_r+0x3c>
    3f20:	f55ff06f          	j	3e74 <__sflush_r+0x12c>
    3f24:	01412483          	lw	s1,20(sp)
    3f28:	01012903          	lw	s2,16(sp)
    3f2c:	f49ff06f          	j	3e74 <__sflush_r+0x12c>
    3f30:	05042603          	lw	a2,80(s0)
    3f34:	e95ff06f          	j	3dc8 <__sflush_r+0x80>
    3f38:	01042683          	lw	a3,16(s0)
    3f3c:	fffff737          	lui	a4,0xfffff
    3f40:	7ff70713          	addi	a4,a4,2047 # fffff7ff <_stack_top+0xefffb7ff>
    3f44:	00e7f733          	and	a4,a5,a4
    3f48:	00e41623          	sh	a4,12(s0)
    3f4c:	00042223          	sw	zero,4(s0)
    3f50:	00d42023          	sw	a3,0(s0)
    3f54:	01379713          	slli	a4,a5,0x13
    3f58:	ee075ce3          	bgez	a4,3e50 <__sflush_r+0x108>
    3f5c:	03042583          	lw	a1,48(s0)
    3f60:	04a42823          	sw	a0,80(s0)
    3f64:	0099a023          	sw	s1,0(s3)
    3f68:	ee059ae3          	bnez	a1,3e5c <__sflush_r+0x114>
    3f6c:	01412483          	lw	s1,20(sp)
    3f70:	f05ff06f          	j	3e74 <__sflush_r+0x12c>
    3f74:	0009a783          	lw	a5,0(s3)
    3f78:	e40784e3          	beqz	a5,3dc0 <__sflush_r+0x78>
    3f7c:	fe378713          	addi	a4,a5,-29
    3f80:	00070c63          	beqz	a4,3f98 <__sflush_r+0x250>
    3f84:	fea78793          	addi	a5,a5,-22
    3f88:	00078863          	beqz	a5,3f98 <__sflush_r+0x250>
    3f8c:	00c45783          	lhu	a5,12(s0)
    3f90:	0407e793          	ori	a5,a5,64
    3f94:	f65ff06f          	j	3ef8 <__sflush_r+0x1b0>
    3f98:	0099a023          	sw	s1,0(s3)
    3f9c:	01412483          	lw	s1,20(sp)
    3fa0:	ed5ff06f          	j	3e74 <__sflush_r+0x12c>

00003fa4 <_fflush_r>:
    3fa4:	fe010113          	addi	sp,sp,-32
    3fa8:	00112e23          	sw	ra,28(sp)
    3fac:	00050713          	mv	a4,a0
    3fb0:	00050663          	beqz	a0,3fbc <_fflush_r+0x18>
    3fb4:	03452783          	lw	a5,52(a0)
    3fb8:	08078e63          	beqz	a5,4054 <_fflush_r+0xb0>
    3fbc:	00c59683          	lh	a3,12(a1)
    3fc0:	00000793          	li	a5,0
    3fc4:	04068263          	beqz	a3,4008 <_fflush_r+0x64>
    3fc8:	0645a783          	lw	a5,100(a1)
    3fcc:	0017f793          	andi	a5,a5,1
    3fd0:	00079663          	bnez	a5,3fdc <_fflush_r+0x38>
    3fd4:	2006f693          	andi	a3,a3,512
    3fd8:	04068063          	beqz	a3,4018 <_fflush_r+0x74>
    3fdc:	00070513          	mv	a0,a4
    3fe0:	00b12423          	sw	a1,8(sp)
    3fe4:	d65ff0ef          	jal	3d48 <__sflush_r>
    3fe8:	00812583          	lw	a1,8(sp)
    3fec:	00050793          	mv	a5,a0
    3ff0:	0645a703          	lw	a4,100(a1)
    3ff4:	00177713          	andi	a4,a4,1
    3ff8:	00071863          	bnez	a4,4008 <_fflush_r+0x64>
    3ffc:	00c5d703          	lhu	a4,12(a1)
    4000:	20077713          	andi	a4,a4,512
    4004:	02070863          	beqz	a4,4034 <_fflush_r+0x90>
    4008:	01c12083          	lw	ra,28(sp)
    400c:	00078513          	mv	a0,a5
    4010:	02010113          	addi	sp,sp,32
    4014:	00008067          	ret
    4018:	0585a503          	lw	a0,88(a1)
    401c:	00e12623          	sw	a4,12(sp)
    4020:	00b12423          	sw	a1,8(sp)
    4024:	e2cfc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    4028:	00c12703          	lw	a4,12(sp)
    402c:	00812583          	lw	a1,8(sp)
    4030:	fadff06f          	j	3fdc <_fflush_r+0x38>
    4034:	00a12423          	sw	a0,8(sp)
    4038:	0585a503          	lw	a0,88(a1)
    403c:	e2cfc0ef          	jal	668 <__retarget_lock_release_recursive>
    4040:	00812783          	lw	a5,8(sp)
    4044:	01c12083          	lw	ra,28(sp)
    4048:	00078513          	mv	a0,a5
    404c:	02010113          	addi	sp,sp,32
    4050:	00008067          	ret
    4054:	00b12623          	sw	a1,12(sp)
    4058:	00a12423          	sw	a0,8(sp)
    405c:	4f0000ef          	jal	454c <__sinit>
    4060:	00c12583          	lw	a1,12(sp)
    4064:	00812703          	lw	a4,8(sp)
    4068:	f55ff06f          	j	3fbc <_fflush_r+0x18>

0000406c <fflush>:
    406c:	0c050663          	beqz	a0,4138 <fflush+0xcc>
    4070:	0fffc717          	auipc	a4,0xfffc
    4074:	75872703          	lw	a4,1880(a4) # 100007c8 <_impure_ptr>
    4078:	fe010113          	addi	sp,sp,-32
    407c:	00112e23          	sw	ra,28(sp)
    4080:	00050593          	mv	a1,a0
    4084:	00070663          	beqz	a4,4090 <fflush+0x24>
    4088:	03472783          	lw	a5,52(a4)
    408c:	06078063          	beqz	a5,40ec <fflush+0x80>
    4090:	00c59683          	lh	a3,12(a1)
    4094:	00000793          	li	a5,0
    4098:	04068263          	beqz	a3,40dc <fflush+0x70>
    409c:	0645a783          	lw	a5,100(a1)
    40a0:	0017f793          	andi	a5,a5,1
    40a4:	00079663          	bnez	a5,40b0 <fflush+0x44>
    40a8:	2006f693          	andi	a3,a3,512
    40ac:	04068e63          	beqz	a3,4108 <fflush+0x9c>
    40b0:	00070513          	mv	a0,a4
    40b4:	00b12423          	sw	a1,8(sp)
    40b8:	c91ff0ef          	jal	3d48 <__sflush_r>
    40bc:	00812583          	lw	a1,8(sp)
    40c0:	00050793          	mv	a5,a0
    40c4:	0645a703          	lw	a4,100(a1)
    40c8:	00177713          	andi	a4,a4,1
    40cc:	00071863          	bnez	a4,40dc <fflush+0x70>
    40d0:	00c5d703          	lhu	a4,12(a1)
    40d4:	20077713          	andi	a4,a4,512
    40d8:	04070663          	beqz	a4,4124 <fflush+0xb8>
    40dc:	01c12083          	lw	ra,28(sp)
    40e0:	00078513          	mv	a0,a5
    40e4:	02010113          	addi	sp,sp,32
    40e8:	00008067          	ret
    40ec:	00a12623          	sw	a0,12(sp)
    40f0:	00070513          	mv	a0,a4
    40f4:	00e12423          	sw	a4,8(sp)
    40f8:	454000ef          	jal	454c <__sinit>
    40fc:	00c12583          	lw	a1,12(sp)
    4100:	00812703          	lw	a4,8(sp)
    4104:	f8dff06f          	j	4090 <fflush+0x24>
    4108:	0585a503          	lw	a0,88(a1)
    410c:	00e12623          	sw	a4,12(sp)
    4110:	00b12423          	sw	a1,8(sp)
    4114:	d3cfc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    4118:	00c12703          	lw	a4,12(sp)
    411c:	00812583          	lw	a1,8(sp)
    4120:	f91ff06f          	j	40b0 <fflush+0x44>
    4124:	00a12423          	sw	a0,8(sp)
    4128:	0585a503          	lw	a0,88(a1)
    412c:	d3cfc0ef          	jal	668 <__retarget_lock_release_recursive>
    4130:	00812783          	lw	a5,8(sp)
    4134:	fa9ff06f          	j	40dc <fflush+0x70>
    4138:	0fffc617          	auipc	a2,0xfffc
    413c:	00860613          	addi	a2,a2,8 # 10000140 <__sglue>
    4140:	00000597          	auipc	a1,0x0
    4144:	e6458593          	addi	a1,a1,-412 # 3fa4 <_fflush_r>
    4148:	0fffc517          	auipc	a0,0xfffc
    414c:	eb850513          	addi	a0,a0,-328 # 10000000 <_impure_data>
    4150:	1b10006f          	j	4b00 <_fwalk_sglue>

00004154 <stdio_exit_handler>:
    4154:	0fffc617          	auipc	a2,0xfffc
    4158:	fec60613          	addi	a2,a2,-20 # 10000140 <__sglue>
    415c:	00008597          	auipc	a1,0x8
    4160:	95458593          	addi	a1,a1,-1708 # bab0 <_fclose_r>
    4164:	0fffc517          	auipc	a0,0xfffc
    4168:	e9c50513          	addi	a0,a0,-356 # 10000000 <_impure_data>
    416c:	1950006f          	j	4b00 <_fwalk_sglue>

00004170 <cleanup_stdio>:
    4170:	00452583          	lw	a1,4(a0)
    4174:	ff010113          	addi	sp,sp,-16
    4178:	00812423          	sw	s0,8(sp)
    417c:	00112623          	sw	ra,12(sp)
    4180:	0fffc797          	auipc	a5,0xfffc
    4184:	66078793          	addi	a5,a5,1632 # 100007e0 <__sf>
    4188:	00050413          	mv	s0,a0
    418c:	00f58463          	beq	a1,a5,4194 <cleanup_stdio+0x24>
    4190:	121070ef          	jal	bab0 <_fclose_r>
    4194:	00842583          	lw	a1,8(s0)
    4198:	0fffc797          	auipc	a5,0xfffc
    419c:	6b078793          	addi	a5,a5,1712 # 10000848 <__sf+0x68>
    41a0:	00f58663          	beq	a1,a5,41ac <cleanup_stdio+0x3c>
    41a4:	00040513          	mv	a0,s0
    41a8:	109070ef          	jal	bab0 <_fclose_r>
    41ac:	00c42583          	lw	a1,12(s0)
    41b0:	0fffc797          	auipc	a5,0xfffc
    41b4:	70078793          	addi	a5,a5,1792 # 100008b0 <__sf+0xd0>
    41b8:	00f58c63          	beq	a1,a5,41d0 <cleanup_stdio+0x60>
    41bc:	00040513          	mv	a0,s0
    41c0:	00812403          	lw	s0,8(sp)
    41c4:	00c12083          	lw	ra,12(sp)
    41c8:	01010113          	addi	sp,sp,16
    41cc:	0e50706f          	j	bab0 <_fclose_r>
    41d0:	00c12083          	lw	ra,12(sp)
    41d4:	00812403          	lw	s0,8(sp)
    41d8:	01010113          	addi	sp,sp,16
    41dc:	00008067          	ret

000041e0 <__fp_lock>:
    41e0:	0645a783          	lw	a5,100(a1)
    41e4:	0017f793          	andi	a5,a5,1
    41e8:	00079863          	bnez	a5,41f8 <__fp_lock+0x18>
    41ec:	00c5d783          	lhu	a5,12(a1)
    41f0:	2007f793          	andi	a5,a5,512
    41f4:	00078663          	beqz	a5,4200 <__fp_lock+0x20>
    41f8:	00000513          	li	a0,0
    41fc:	00008067          	ret
    4200:	0585a503          	lw	a0,88(a1)
    4204:	ff010113          	addi	sp,sp,-16
    4208:	00112623          	sw	ra,12(sp)
    420c:	c44fc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    4210:	00c12083          	lw	ra,12(sp)
    4214:	00000513          	li	a0,0
    4218:	01010113          	addi	sp,sp,16
    421c:	00008067          	ret

00004220 <__fp_unlock>:
    4220:	0645a783          	lw	a5,100(a1)
    4224:	0017f793          	andi	a5,a5,1
    4228:	00079863          	bnez	a5,4238 <__fp_unlock+0x18>
    422c:	00c5d783          	lhu	a5,12(a1)
    4230:	2007f793          	andi	a5,a5,512
    4234:	00078663          	beqz	a5,4240 <__fp_unlock+0x20>
    4238:	00000513          	li	a0,0
    423c:	00008067          	ret
    4240:	0585a503          	lw	a0,88(a1)
    4244:	ff010113          	addi	sp,sp,-16
    4248:	00112623          	sw	ra,12(sp)
    424c:	c1cfc0ef          	jal	668 <__retarget_lock_release_recursive>
    4250:	00c12083          	lw	ra,12(sp)
    4254:	00000513          	li	a0,0
    4258:	01010113          	addi	sp,sp,16
    425c:	00008067          	ret

00004260 <global_stdio_init.part.0>:
    4260:	fe010113          	addi	sp,sp,-32
    4264:	00000797          	auipc	a5,0x0
    4268:	ef078793          	addi	a5,a5,-272 # 4154 <stdio_exit_handler>
    426c:	00112e23          	sw	ra,28(sp)
    4270:	00812c23          	sw	s0,24(sp)
    4274:	00912a23          	sw	s1,20(sp)
    4278:	0fffc417          	auipc	s0,0xfffc
    427c:	56840413          	addi	s0,s0,1384 # 100007e0 <__sf>
    4280:	01212823          	sw	s2,16(sp)
    4284:	01312623          	sw	s3,12(sp)
    4288:	01412423          	sw	s4,8(sp)
    428c:	00800613          	li	a2,8
    4290:	00000593          	li	a1,0
    4294:	0fffd717          	auipc	a4,0xfffd
    4298:	88f72623          	sw	a5,-1908(a4) # 10000b20 <__stdio_exit_handler>
    429c:	0fffc517          	auipc	a0,0xfffc
    42a0:	5a050513          	addi	a0,a0,1440 # 1000083c <__sf+0x5c>
    42a4:	00400793          	li	a5,4
    42a8:	00f42623          	sw	a5,12(s0)
    42ac:	00042023          	sw	zero,0(s0)
    42b0:	00042223          	sw	zero,4(s0)
    42b4:	00042423          	sw	zero,8(s0)
    42b8:	06042223          	sw	zero,100(s0)
    42bc:	00042823          	sw	zero,16(s0)
    42c0:	00042a23          	sw	zero,20(s0)
    42c4:	00042c23          	sw	zero,24(s0)
    42c8:	641010ef          	jal	6108 <memset>
    42cc:	00001a17          	auipc	s4,0x1
    42d0:	8e8a0a13          	addi	s4,s4,-1816 # 4bb4 <__sread>
    42d4:	00001997          	auipc	s3,0x1
    42d8:	94498993          	addi	s3,s3,-1724 # 4c18 <__swrite>
    42dc:	00001917          	auipc	s2,0x1
    42e0:	9c490913          	addi	s2,s2,-1596 # 4ca0 <__sseek>
    42e4:	00001497          	auipc	s1,0x1
    42e8:	a2048493          	addi	s1,s1,-1504 # 4d04 <__sclose>
    42ec:	0fffc517          	auipc	a0,0xfffc
    42f0:	54c50513          	addi	a0,a0,1356 # 10000838 <__sf+0x58>
    42f4:	03442023          	sw	s4,32(s0)
    42f8:	03342223          	sw	s3,36(s0)
    42fc:	03242423          	sw	s2,40(s0)
    4300:	02942623          	sw	s1,44(s0)
    4304:	00842e23          	sw	s0,28(s0)
    4308:	b38fc0ef          	jal	640 <__retarget_lock_init_recursive>
    430c:	000107b7          	lui	a5,0x10
    4310:	00978793          	addi	a5,a5,9 # 10009 <__divdf3+0x10d>
    4314:	00800613          	li	a2,8
    4318:	00000593          	li	a1,0
    431c:	0fffc517          	auipc	a0,0xfffc
    4320:	58850513          	addi	a0,a0,1416 # 100008a4 <__sf+0xc4>
    4324:	06f42a23          	sw	a5,116(s0)
    4328:	06042423          	sw	zero,104(s0)
    432c:	06042623          	sw	zero,108(s0)
    4330:	06042823          	sw	zero,112(s0)
    4334:	0c042623          	sw	zero,204(s0)
    4338:	06042c23          	sw	zero,120(s0)
    433c:	06042e23          	sw	zero,124(s0)
    4340:	08042023          	sw	zero,128(s0)
    4344:	5c5010ef          	jal	6108 <memset>
    4348:	0fffc797          	auipc	a5,0xfffc
    434c:	50078793          	addi	a5,a5,1280 # 10000848 <__sf+0x68>
    4350:	0fffc517          	auipc	a0,0xfffc
    4354:	55050513          	addi	a0,a0,1360 # 100008a0 <__sf+0xc0>
    4358:	08f42223          	sw	a5,132(s0)
    435c:	09442423          	sw	s4,136(s0)
    4360:	09342623          	sw	s3,140(s0)
    4364:	09242823          	sw	s2,144(s0)
    4368:	08942a23          	sw	s1,148(s0)
    436c:	ad4fc0ef          	jal	640 <__retarget_lock_init_recursive>
    4370:	000207b7          	lui	a5,0x20
    4374:	01278793          	addi	a5,a5,18 # 20012 <_sidata+0xc81a>
    4378:	00800613          	li	a2,8
    437c:	00000593          	li	a1,0
    4380:	0fffc517          	auipc	a0,0xfffc
    4384:	58c50513          	addi	a0,a0,1420 # 1000090c <__sf+0x12c>
    4388:	0cf42e23          	sw	a5,220(s0)
    438c:	0c042823          	sw	zero,208(s0)
    4390:	0c042a23          	sw	zero,212(s0)
    4394:	0c042c23          	sw	zero,216(s0)
    4398:	12042a23          	sw	zero,308(s0)
    439c:	0e042023          	sw	zero,224(s0)
    43a0:	0e042223          	sw	zero,228(s0)
    43a4:	0e042423          	sw	zero,232(s0)
    43a8:	561010ef          	jal	6108 <memset>
    43ac:	0fffc797          	auipc	a5,0xfffc
    43b0:	50478793          	addi	a5,a5,1284 # 100008b0 <__sf+0xd0>
    43b4:	0f442823          	sw	s4,240(s0)
    43b8:	0f342a23          	sw	s3,244(s0)
    43bc:	0f242c23          	sw	s2,248(s0)
    43c0:	0e942e23          	sw	s1,252(s0)
    43c4:	0ef42623          	sw	a5,236(s0)
    43c8:	01812403          	lw	s0,24(sp)
    43cc:	01c12083          	lw	ra,28(sp)
    43d0:	01412483          	lw	s1,20(sp)
    43d4:	01012903          	lw	s2,16(sp)
    43d8:	00c12983          	lw	s3,12(sp)
    43dc:	00812a03          	lw	s4,8(sp)
    43e0:	0fffc517          	auipc	a0,0xfffc
    43e4:	52850513          	addi	a0,a0,1320 # 10000908 <__sf+0x128>
    43e8:	02010113          	addi	sp,sp,32
    43ec:	a54fc06f          	j	640 <__retarget_lock_init_recursive>

000043f0 <__sfp>:
    43f0:	fe010113          	addi	sp,sp,-32
    43f4:	00912a23          	sw	s1,20(sp)
    43f8:	00050493          	mv	s1,a0
    43fc:	0fffc517          	auipc	a0,0xfffc
    4400:	72050513          	addi	a0,a0,1824 # 10000b1c <__lock___sfp_recursive_mutex>
    4404:	00112e23          	sw	ra,28(sp)
    4408:	00812c23          	sw	s0,24(sp)
    440c:	a44fc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    4410:	0fffc797          	auipc	a5,0xfffc
    4414:	7107a783          	lw	a5,1808(a5) # 10000b20 <__stdio_exit_handler>
    4418:	10078863          	beqz	a5,4528 <__sfp+0x138>
    441c:	0fffc817          	auipc	a6,0xfffc
    4420:	d2480813          	addi	a6,a6,-732 # 10000140 <__sglue>
    4424:	fff00693          	li	a3,-1
    4428:	00482783          	lw	a5,4(a6)
    442c:	fff78793          	addi	a5,a5,-1
    4430:	0807ca63          	bltz	a5,44c4 <__sfp+0xd4>
    4434:	00882403          	lw	s0,8(a6)
    4438:	00c0006f          	j	4444 <__sfp+0x54>
    443c:	06840413          	addi	s0,s0,104
    4440:	08d78263          	beq	a5,a3,44c4 <__sfp+0xd4>
    4444:	00c41703          	lh	a4,12(s0)
    4448:	fff78793          	addi	a5,a5,-1
    444c:	fe0718e3          	bnez	a4,443c <__sfp+0x4c>
    4450:	ffff07b7          	lui	a5,0xffff0
    4454:	00178793          	addi	a5,a5,1 # ffff0001 <_stack_top+0xeffec001>
    4458:	00f42623          	sw	a5,12(s0)
    445c:	05840513          	addi	a0,s0,88
    4460:	06042223          	sw	zero,100(s0)
    4464:	9dcfc0ef          	jal	640 <__retarget_lock_init_recursive>
    4468:	0fffc517          	auipc	a0,0xfffc
    446c:	6b450513          	addi	a0,a0,1716 # 10000b1c <__lock___sfp_recursive_mutex>
    4470:	9f8fc0ef          	jal	668 <__retarget_lock_release_recursive>
    4474:	05c40513          	addi	a0,s0,92
    4478:	00042023          	sw	zero,0(s0)
    447c:	00042423          	sw	zero,8(s0)
    4480:	00042223          	sw	zero,4(s0)
    4484:	00042823          	sw	zero,16(s0)
    4488:	00042a23          	sw	zero,20(s0)
    448c:	00042c23          	sw	zero,24(s0)
    4490:	00800613          	li	a2,8
    4494:	00000593          	li	a1,0
    4498:	471010ef          	jal	6108 <memset>
    449c:	02042823          	sw	zero,48(s0)
    44a0:	02042a23          	sw	zero,52(s0)
    44a4:	04042223          	sw	zero,68(s0)
    44a8:	04042423          	sw	zero,72(s0)
    44ac:	01c12083          	lw	ra,28(sp)
    44b0:	00040513          	mv	a0,s0
    44b4:	01812403          	lw	s0,24(sp)
    44b8:	01412483          	lw	s1,20(sp)
    44bc:	02010113          	addi	sp,sp,32
    44c0:	00008067          	ret
    44c4:	00082403          	lw	s0,0(a6)
    44c8:	00040663          	beqz	s0,44d4 <__sfp+0xe4>
    44cc:	00040813          	mv	a6,s0
    44d0:	f59ff06f          	j	4428 <__sfp+0x38>
    44d4:	1ac00593          	li	a1,428
    44d8:	00048513          	mv	a0,s1
    44dc:	01012623          	sw	a6,12(sp)
    44e0:	228040ef          	jal	8708 <_malloc_r>
    44e4:	00c12803          	lw	a6,12(sp)
    44e8:	00050413          	mv	s0,a0
    44ec:	04050263          	beqz	a0,4530 <__sfp+0x140>
    44f0:	00400793          	li	a5,4
    44f4:	00f52223          	sw	a5,4(a0)
    44f8:	00c50513          	addi	a0,a0,12
    44fc:	00042023          	sw	zero,0(s0)
    4500:	00a42423          	sw	a0,8(s0)
    4504:	1a000613          	li	a2,416
    4508:	00000593          	li	a1,0
    450c:	01012623          	sw	a6,12(sp)
    4510:	3f9010ef          	jal	6108 <memset>
    4514:	00c12803          	lw	a6,12(sp)
    4518:	fff00693          	li	a3,-1
    451c:	00882023          	sw	s0,0(a6)
    4520:	00040813          	mv	a6,s0
    4524:	f05ff06f          	j	4428 <__sfp+0x38>
    4528:	d39ff0ef          	jal	4260 <global_stdio_init.part.0>
    452c:	ef1ff06f          	j	441c <__sfp+0x2c>
    4530:	00082023          	sw	zero,0(a6)
    4534:	0fffc517          	auipc	a0,0xfffc
    4538:	5e850513          	addi	a0,a0,1512 # 10000b1c <__lock___sfp_recursive_mutex>
    453c:	92cfc0ef          	jal	668 <__retarget_lock_release_recursive>
    4540:	00c00793          	li	a5,12
    4544:	00f4a023          	sw	a5,0(s1)
    4548:	f65ff06f          	j	44ac <__sfp+0xbc>

0000454c <__sinit>:
    454c:	ff010113          	addi	sp,sp,-16
    4550:	00812423          	sw	s0,8(sp)
    4554:	00050413          	mv	s0,a0
    4558:	0fffc517          	auipc	a0,0xfffc
    455c:	5c450513          	addi	a0,a0,1476 # 10000b1c <__lock___sfp_recursive_mutex>
    4560:	00112623          	sw	ra,12(sp)
    4564:	8ecfc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    4568:	03442783          	lw	a5,52(s0)
    456c:	00079e63          	bnez	a5,4588 <__sinit+0x3c>
    4570:	0fffc797          	auipc	a5,0xfffc
    4574:	5b07a783          	lw	a5,1456(a5) # 10000b20 <__stdio_exit_handler>
    4578:	00000717          	auipc	a4,0x0
    457c:	bf870713          	addi	a4,a4,-1032 # 4170 <cleanup_stdio>
    4580:	02e42a23          	sw	a4,52(s0)
    4584:	00078e63          	beqz	a5,45a0 <__sinit+0x54>
    4588:	00812403          	lw	s0,8(sp)
    458c:	00c12083          	lw	ra,12(sp)
    4590:	0fffc517          	auipc	a0,0xfffc
    4594:	58c50513          	addi	a0,a0,1420 # 10000b1c <__lock___sfp_recursive_mutex>
    4598:	01010113          	addi	sp,sp,16
    459c:	8ccfc06f          	j	668 <__retarget_lock_release_recursive>
    45a0:	cc1ff0ef          	jal	4260 <global_stdio_init.part.0>
    45a4:	00812403          	lw	s0,8(sp)
    45a8:	00c12083          	lw	ra,12(sp)
    45ac:	0fffc517          	auipc	a0,0xfffc
    45b0:	57050513          	addi	a0,a0,1392 # 10000b1c <__lock___sfp_recursive_mutex>
    45b4:	01010113          	addi	sp,sp,16
    45b8:	8b0fc06f          	j	668 <__retarget_lock_release_recursive>

000045bc <__sfp_lock_acquire>:
    45bc:	0fffc517          	auipc	a0,0xfffc
    45c0:	56050513          	addi	a0,a0,1376 # 10000b1c <__lock___sfp_recursive_mutex>
    45c4:	88cfc06f          	j	650 <__retarget_lock_acquire_recursive>

000045c8 <__sfp_lock_release>:
    45c8:	0fffc517          	auipc	a0,0xfffc
    45cc:	55450513          	addi	a0,a0,1364 # 10000b1c <__lock___sfp_recursive_mutex>
    45d0:	898fc06f          	j	668 <__retarget_lock_release_recursive>

000045d4 <__fp_lock_all>:
    45d4:	ff010113          	addi	sp,sp,-16
    45d8:	0fffc517          	auipc	a0,0xfffc
    45dc:	54450513          	addi	a0,a0,1348 # 10000b1c <__lock___sfp_recursive_mutex>
    45e0:	00112623          	sw	ra,12(sp)
    45e4:	86cfc0ef          	jal	650 <__retarget_lock_acquire_recursive>
    45e8:	00c12083          	lw	ra,12(sp)
    45ec:	0fffc617          	auipc	a2,0xfffc
    45f0:	b5460613          	addi	a2,a2,-1196 # 10000140 <__sglue>
    45f4:	00000597          	auipc	a1,0x0
    45f8:	bec58593          	addi	a1,a1,-1044 # 41e0 <__fp_lock>
    45fc:	00000513          	li	a0,0
    4600:	01010113          	addi	sp,sp,16
    4604:	4fc0006f          	j	4b00 <_fwalk_sglue>

00004608 <__fp_unlock_all>:
    4608:	ff010113          	addi	sp,sp,-16
    460c:	0fffc617          	auipc	a2,0xfffc
    4610:	b3460613          	addi	a2,a2,-1228 # 10000140 <__sglue>
    4614:	00000597          	auipc	a1,0x0
    4618:	c0c58593          	addi	a1,a1,-1012 # 4220 <__fp_unlock>
    461c:	00000513          	li	a0,0
    4620:	00112623          	sw	ra,12(sp)
    4624:	4dc000ef          	jal	4b00 <_fwalk_sglue>
    4628:	00c12083          	lw	ra,12(sp)
    462c:	0fffc517          	auipc	a0,0xfffc
    4630:	4f050513          	addi	a0,a0,1264 # 10000b1c <__lock___sfp_recursive_mutex>
    4634:	01010113          	addi	sp,sp,16
    4638:	830fc06f          	j	668 <__retarget_lock_release_recursive>

0000463c <__sfvwrite_r>:
    463c:	00862783          	lw	a5,8(a2)
    4640:	22078c63          	beqz	a5,4878 <__sfvwrite_r+0x23c>
    4644:	00c59683          	lh	a3,12(a1)
    4648:	fc010113          	addi	sp,sp,-64
    464c:	02812c23          	sw	s0,56(sp)
    4650:	03412423          	sw	s4,40(sp)
    4654:	03512223          	sw	s5,36(sp)
    4658:	02112e23          	sw	ra,60(sp)
    465c:	0086f793          	andi	a5,a3,8
    4660:	00058413          	mv	s0,a1
    4664:	00050a93          	mv	s5,a0
    4668:	00060a13          	mv	s4,a2
    466c:	0a078463          	beqz	a5,4714 <__sfvwrite_r+0xd8>
    4670:	0105a783          	lw	a5,16(a1)
    4674:	0a078063          	beqz	a5,4714 <__sfvwrite_r+0xd8>
    4678:	02912a23          	sw	s1,52(sp)
    467c:	03212823          	sw	s2,48(sp)
    4680:	03312623          	sw	s3,44(sp)
    4684:	03612023          	sw	s6,32(sp)
    4688:	0026f793          	andi	a5,a3,2
    468c:	000a2483          	lw	s1,0(s4)
    4690:	0a078a63          	beqz	a5,4744 <__sfvwrite_r+0x108>
    4694:	80000b37          	lui	s6,0x80000
    4698:	c00b0b13          	addi	s6,s6,-1024 # 7ffffc00 <_stack_top+0x6fffbc00>
    469c:	00000993          	li	s3,0
    46a0:	00000913          	li	s2,0
    46a4:	00098613          	mv	a2,s3
    46a8:	000a8513          	mv	a0,s5
    46ac:	1a090e63          	beqz	s2,4868 <__sfvwrite_r+0x22c>
    46b0:	00090693          	mv	a3,s2
    46b4:	012b7663          	bgeu	s6,s2,46c0 <__sfvwrite_r+0x84>
    46b8:	800006b7          	lui	a3,0x80000
    46bc:	c0068693          	addi	a3,a3,-1024 # 7ffffc00 <_stack_top+0x6fffbc00>
    46c0:	02442783          	lw	a5,36(s0)
    46c4:	01c42583          	lw	a1,28(s0)
    46c8:	000780e7          	jalr	a5
    46cc:	40a05a63          	blez	a0,4ae0 <__sfvwrite_r+0x4a4>
    46d0:	008a2783          	lw	a5,8(s4)
    46d4:	00a989b3          	add	s3,s3,a0
    46d8:	40a90933          	sub	s2,s2,a0
    46dc:	40a787b3          	sub	a5,a5,a0
    46e0:	00fa2423          	sw	a5,8(s4)
    46e4:	fc0790e3          	bnez	a5,46a4 <__sfvwrite_r+0x68>
    46e8:	03412483          	lw	s1,52(sp)
    46ec:	03012903          	lw	s2,48(sp)
    46f0:	02c12983          	lw	s3,44(sp)
    46f4:	02012b03          	lw	s6,32(sp)
    46f8:	00000513          	li	a0,0
    46fc:	03c12083          	lw	ra,60(sp)
    4700:	03812403          	lw	s0,56(sp)
    4704:	02812a03          	lw	s4,40(sp)
    4708:	02412a83          	lw	s5,36(sp)
    470c:	04010113          	addi	sp,sp,64
    4710:	00008067          	ret
    4714:	00040593          	mv	a1,s0
    4718:	000a8513          	mv	a0,s5
    471c:	5f0000ef          	jal	4d0c <__swsetup_r>
    4720:	26051663          	bnez	a0,498c <__sfvwrite_r+0x350>
    4724:	00c41683          	lh	a3,12(s0)
    4728:	02912a23          	sw	s1,52(sp)
    472c:	03212823          	sw	s2,48(sp)
    4730:	03312623          	sw	s3,44(sp)
    4734:	03612023          	sw	s6,32(sp)
    4738:	0026f793          	andi	a5,a3,2
    473c:	000a2483          	lw	s1,0(s4)
    4740:	f4079ae3          	bnez	a5,4694 <__sfvwrite_r+0x58>
    4744:	01712e23          	sw	s7,28(sp)
    4748:	01812c23          	sw	s8,24(sp)
    474c:	0016f793          	andi	a5,a3,1
    4750:	12079863          	bnez	a5,4880 <__sfvwrite_r+0x244>
    4754:	00042783          	lw	a5,0(s0)
    4758:	80000737          	lui	a4,0x80000
    475c:	fff70c13          	addi	s8,a4,-1 # 7fffffff <_stack_top+0x6fffbfff>
    4760:	00000b13          	li	s6,0
    4764:	00000993          	li	s3,0
    4768:	0e098863          	beqz	s3,4858 <__sfvwrite_r+0x21c>
    476c:	2006f713          	andi	a4,a3,512
    4770:	00842903          	lw	s2,8(s0)
    4774:	00078513          	mv	a0,a5
    4778:	20070e63          	beqz	a4,4994 <__sfvwrite_r+0x358>
    477c:	00090b93          	mv	s7,s2
    4780:	2d29e263          	bltu	s3,s2,4a44 <__sfvwrite_r+0x408>
    4784:	4806f713          	andi	a4,a3,1152
    4788:	08070c63          	beqz	a4,4820 <__sfvwrite_r+0x1e4>
    478c:	01442603          	lw	a2,20(s0)
    4790:	01042583          	lw	a1,16(s0)
    4794:	00161713          	slli	a4,a2,0x1
    4798:	00c70733          	add	a4,a4,a2
    479c:	01f75913          	srli	s2,a4,0x1f
    47a0:	40b78bb3          	sub	s7,a5,a1
    47a4:	00e90933          	add	s2,s2,a4
    47a8:	001b8793          	addi	a5,s7,1
    47ac:	40195913          	srai	s2,s2,0x1
    47b0:	013787b3          	add	a5,a5,s3
    47b4:	00090613          	mv	a2,s2
    47b8:	00f97663          	bgeu	s2,a5,47c4 <__sfvwrite_r+0x188>
    47bc:	00078913          	mv	s2,a5
    47c0:	00078613          	mv	a2,a5
    47c4:	4006f693          	andi	a3,a3,1024
    47c8:	2c068463          	beqz	a3,4a90 <__sfvwrite_r+0x454>
    47cc:	00060593          	mv	a1,a2
    47d0:	000a8513          	mv	a0,s5
    47d4:	735030ef          	jal	8708 <_malloc_r>
    47d8:	30050863          	beqz	a0,4ae8 <__sfvwrite_r+0x4ac>
    47dc:	01042583          	lw	a1,16(s0)
    47e0:	000b8613          	mv	a2,s7
    47e4:	00a12623          	sw	a0,12(sp)
    47e8:	1fd010ef          	jal	61e4 <memcpy>
    47ec:	00c45783          	lhu	a5,12(s0)
    47f0:	00c12703          	lw	a4,12(sp)
    47f4:	b7f7f793          	andi	a5,a5,-1153
    47f8:	0807e793          	ori	a5,a5,128
    47fc:	00f41623          	sh	a5,12(s0)
    4800:	417907b3          	sub	a5,s2,s7
    4804:	01770533          	add	a0,a4,s7
    4808:	01242a23          	sw	s2,20(s0)
    480c:	00e42823          	sw	a4,16(s0)
    4810:	00a42023          	sw	a0,0(s0)
    4814:	00f42423          	sw	a5,8(s0)
    4818:	00098913          	mv	s2,s3
    481c:	00098b93          	mv	s7,s3
    4820:	000b0593          	mv	a1,s6
    4824:	000b8613          	mv	a2,s7
    4828:	7b8010ef          	jal	5fe0 <memmove>
    482c:	00842703          	lw	a4,8(s0)
    4830:	00042783          	lw	a5,0(s0)
    4834:	41270733          	sub	a4,a4,s2
    4838:	00e42423          	sw	a4,8(s0)
    483c:	008a2703          	lw	a4,8(s4)
    4840:	017787b3          	add	a5,a5,s7
    4844:	00f42023          	sw	a5,0(s0)
    4848:	41370733          	sub	a4,a4,s3
    484c:	00ea2423          	sw	a4,8(s4)
    4850:	28070263          	beqz	a4,4ad4 <__sfvwrite_r+0x498>
    4854:	00c41683          	lh	a3,12(s0)
    4858:	0004ab03          	lw	s6,0(s1)
    485c:	0044a983          	lw	s3,4(s1)
    4860:	00848493          	addi	s1,s1,8
    4864:	f05ff06f          	j	4768 <__sfvwrite_r+0x12c>
    4868:	0004a983          	lw	s3,0(s1)
    486c:	0044a903          	lw	s2,4(s1)
    4870:	00848493          	addi	s1,s1,8
    4874:	e31ff06f          	j	46a4 <__sfvwrite_r+0x68>
    4878:	00000513          	li	a0,0
    487c:	00008067          	ret
    4880:	00000b13          	li	s6,0
    4884:	00000b93          	li	s7,0
    4888:	00000513          	li	a0,0
    488c:	00000c13          	li	s8,0
    4890:	060b0e63          	beqz	s6,490c <__sfvwrite_r+0x2d0>
    4894:	08050663          	beqz	a0,4920 <__sfvwrite_r+0x2e4>
    4898:	000b8793          	mv	a5,s7
    489c:	000b0993          	mv	s3,s6
    48a0:	0167f463          	bgeu	a5,s6,48a8 <__sfvwrite_r+0x26c>
    48a4:	00078993          	mv	s3,a5
    48a8:	01442683          	lw	a3,20(s0)
    48ac:	00842903          	lw	s2,8(s0)
    48b0:	00042503          	lw	a0,0(s0)
    48b4:	01042783          	lw	a5,16(s0)
    48b8:	01268933          	add	s2,a3,s2
    48bc:	00a7f463          	bgeu	a5,a0,48c4 <__sfvwrite_r+0x288>
    48c0:	09394063          	blt	s2,s3,4940 <__sfvwrite_r+0x304>
    48c4:	1ad9c063          	blt	s3,a3,4a64 <__sfvwrite_r+0x428>
    48c8:	02442783          	lw	a5,36(s0)
    48cc:	01c42583          	lw	a1,28(s0)
    48d0:	000c0613          	mv	a2,s8
    48d4:	000a8513          	mv	a0,s5
    48d8:	000780e7          	jalr	a5
    48dc:	00050913          	mv	s2,a0
    48e0:	08a05463          	blez	a0,4968 <__sfvwrite_r+0x32c>
    48e4:	412b8bb3          	sub	s7,s7,s2
    48e8:	00100513          	li	a0,1
    48ec:	160b8263          	beqz	s7,4a50 <__sfvwrite_r+0x414>
    48f0:	008a2783          	lw	a5,8(s4)
    48f4:	412787b3          	sub	a5,a5,s2
    48f8:	00fa2423          	sw	a5,8(s4)
    48fc:	1c078c63          	beqz	a5,4ad4 <__sfvwrite_r+0x498>
    4900:	412b0b33          	sub	s6,s6,s2
    4904:	012c0c33          	add	s8,s8,s2
    4908:	f80b16e3          	bnez	s6,4894 <__sfvwrite_r+0x258>
    490c:	0044ab03          	lw	s6,4(s1)
    4910:	00048793          	mv	a5,s1
    4914:	00848493          	addi	s1,s1,8
    4918:	fe0b0ae3          	beqz	s6,490c <__sfvwrite_r+0x2d0>
    491c:	0007ac03          	lw	s8,0(a5)
    4920:	000b0613          	mv	a2,s6
    4924:	00a00593          	li	a1,10
    4928:	000c0513          	mv	a0,s8
    492c:	548000ef          	jal	4e74 <memchr>
    4930:	18050c63          	beqz	a0,4ac8 <__sfvwrite_r+0x48c>
    4934:	00150513          	addi	a0,a0,1
    4938:	41850bb3          	sub	s7,a0,s8
    493c:	f5dff06f          	j	4898 <__sfvwrite_r+0x25c>
    4940:	000c0593          	mv	a1,s8
    4944:	00090613          	mv	a2,s2
    4948:	698010ef          	jal	5fe0 <memmove>
    494c:	00042783          	lw	a5,0(s0)
    4950:	00040593          	mv	a1,s0
    4954:	000a8513          	mv	a0,s5
    4958:	012787b3          	add	a5,a5,s2
    495c:	00f42023          	sw	a5,0(s0)
    4960:	e44ff0ef          	jal	3fa4 <_fflush_r>
    4964:	f80500e3          	beqz	a0,48e4 <__sfvwrite_r+0x2a8>
    4968:	00c41783          	lh	a5,12(s0)
    496c:	01c12b83          	lw	s7,28(sp)
    4970:	01812c03          	lw	s8,24(sp)
    4974:	03412483          	lw	s1,52(sp)
    4978:	03012903          	lw	s2,48(sp)
    497c:	02c12983          	lw	s3,44(sp)
    4980:	02012b03          	lw	s6,32(sp)
    4984:	0407e793          	ori	a5,a5,64
    4988:	00f41623          	sh	a5,12(s0)
    498c:	fff00513          	li	a0,-1
    4990:	d6dff06f          	j	46fc <__sfvwrite_r+0xc0>
    4994:	01042703          	lw	a4,16(s0)
    4998:	06f76263          	bltu	a4,a5,49fc <__sfvwrite_r+0x3c0>
    499c:	01442583          	lw	a1,20(s0)
    49a0:	04b9ee63          	bltu	s3,a1,49fc <__sfvwrite_r+0x3c0>
    49a4:	00098913          	mv	s2,s3
    49a8:	013c7463          	bgeu	s8,s3,49b0 <__sfvwrite_r+0x374>
    49ac:	000c0913          	mv	s2,s8
    49b0:	00090513          	mv	a0,s2
    49b4:	5e50d0ef          	jal	12798 <__modsi3>
    49b8:	02442783          	lw	a5,36(s0)
    49bc:	01c42583          	lw	a1,28(s0)
    49c0:	40a906b3          	sub	a3,s2,a0
    49c4:	000b0613          	mv	a2,s6
    49c8:	000a8513          	mv	a0,s5
    49cc:	000780e7          	jalr	a5
    49d0:	f8a05ce3          	blez	a0,4968 <__sfvwrite_r+0x32c>
    49d4:	00050913          	mv	s2,a0
    49d8:	008a2783          	lw	a5,8(s4)
    49dc:	412989b3          	sub	s3,s3,s2
    49e0:	412787b3          	sub	a5,a5,s2
    49e4:	00fa2423          	sw	a5,8(s4)
    49e8:	0e078663          	beqz	a5,4ad4 <__sfvwrite_r+0x498>
    49ec:	00c41683          	lh	a3,12(s0)
    49f0:	00042783          	lw	a5,0(s0)
    49f4:	012b0b33          	add	s6,s6,s2
    49f8:	d71ff06f          	j	4768 <__sfvwrite_r+0x12c>
    49fc:	0129f463          	bgeu	s3,s2,4a04 <__sfvwrite_r+0x3c8>
    4a00:	00098913          	mv	s2,s3
    4a04:	00078513          	mv	a0,a5
    4a08:	00090613          	mv	a2,s2
    4a0c:	000b0593          	mv	a1,s6
    4a10:	5d0010ef          	jal	5fe0 <memmove>
    4a14:	00042783          	lw	a5,0(s0)
    4a18:	00842703          	lw	a4,8(s0)
    4a1c:	012787b3          	add	a5,a5,s2
    4a20:	41270733          	sub	a4,a4,s2
    4a24:	00f42023          	sw	a5,0(s0)
    4a28:	00e42423          	sw	a4,8(s0)
    4a2c:	fa0716e3          	bnez	a4,49d8 <__sfvwrite_r+0x39c>
    4a30:	00040593          	mv	a1,s0
    4a34:	000a8513          	mv	a0,s5
    4a38:	d6cff0ef          	jal	3fa4 <_fflush_r>
    4a3c:	f8050ee3          	beqz	a0,49d8 <__sfvwrite_r+0x39c>
    4a40:	f29ff06f          	j	4968 <__sfvwrite_r+0x32c>
    4a44:	00098913          	mv	s2,s3
    4a48:	00098b93          	mv	s7,s3
    4a4c:	dd5ff06f          	j	4820 <__sfvwrite_r+0x1e4>
    4a50:	00040593          	mv	a1,s0
    4a54:	000a8513          	mv	a0,s5
    4a58:	d4cff0ef          	jal	3fa4 <_fflush_r>
    4a5c:	e8050ae3          	beqz	a0,48f0 <__sfvwrite_r+0x2b4>
    4a60:	f09ff06f          	j	4968 <__sfvwrite_r+0x32c>
    4a64:	00098613          	mv	a2,s3
    4a68:	000c0593          	mv	a1,s8
    4a6c:	574010ef          	jal	5fe0 <memmove>
    4a70:	00842703          	lw	a4,8(s0)
    4a74:	00042783          	lw	a5,0(s0)
    4a78:	00098913          	mv	s2,s3
    4a7c:	41370733          	sub	a4,a4,s3
    4a80:	013787b3          	add	a5,a5,s3
    4a84:	00e42423          	sw	a4,8(s0)
    4a88:	00f42023          	sw	a5,0(s0)
    4a8c:	e59ff06f          	j	48e4 <__sfvwrite_r+0x2a8>
    4a90:	000a8513          	mv	a0,s5
    4a94:	130060ef          	jal	abc4 <_realloc_r>
    4a98:	00050713          	mv	a4,a0
    4a9c:	d60512e3          	bnez	a0,4800 <__sfvwrite_r+0x1c4>
    4aa0:	01042583          	lw	a1,16(s0)
    4aa4:	000a8513          	mv	a0,s5
    4aa8:	019030ef          	jal	82c0 <_free_r>
    4aac:	00c45783          	lhu	a5,12(s0)
    4ab0:	00c00713          	li	a4,12
    4ab4:	01c12b83          	lw	s7,28(sp)
    4ab8:	01812c03          	lw	s8,24(sp)
    4abc:	00eaa023          	sw	a4,0(s5)
    4ac0:	f7f7f793          	andi	a5,a5,-129
    4ac4:	eb1ff06f          	j	4974 <__sfvwrite_r+0x338>
    4ac8:	001b0793          	addi	a5,s6,1
    4acc:	00078b93          	mv	s7,a5
    4ad0:	dcdff06f          	j	489c <__sfvwrite_r+0x260>
    4ad4:	01c12b83          	lw	s7,28(sp)
    4ad8:	01812c03          	lw	s8,24(sp)
    4adc:	c0dff06f          	j	46e8 <__sfvwrite_r+0xac>
    4ae0:	00c41783          	lh	a5,12(s0)
    4ae4:	e91ff06f          	j	4974 <__sfvwrite_r+0x338>
    4ae8:	00c00793          	li	a5,12
    4aec:	00faa023          	sw	a5,0(s5)
    4af0:	01c12b83          	lw	s7,28(sp)
    4af4:	00c41783          	lh	a5,12(s0)
    4af8:	01812c03          	lw	s8,24(sp)
    4afc:	e79ff06f          	j	4974 <__sfvwrite_r+0x338>

00004b00 <_fwalk_sglue>:
    4b00:	fd010113          	addi	sp,sp,-48
    4b04:	03212023          	sw	s2,32(sp)
    4b08:	01312e23          	sw	s3,28(sp)
    4b0c:	01412c23          	sw	s4,24(sp)
    4b10:	01512a23          	sw	s5,20(sp)
    4b14:	01612823          	sw	s6,16(sp)
    4b18:	01712623          	sw	s7,12(sp)
    4b1c:	02112623          	sw	ra,44(sp)
    4b20:	02812423          	sw	s0,40(sp)
    4b24:	02912223          	sw	s1,36(sp)
    4b28:	00060a93          	mv	s5,a2
    4b2c:	00050b13          	mv	s6,a0
    4b30:	00058b93          	mv	s7,a1
    4b34:	00000a13          	li	s4,0
    4b38:	00100993          	li	s3,1
    4b3c:	fff00913          	li	s2,-1
    4b40:	004aa483          	lw	s1,4(s5)
    4b44:	fff48493          	addi	s1,s1,-1
    4b48:	0204ca63          	bltz	s1,4b7c <_fwalk_sglue+0x7c>
    4b4c:	008aa403          	lw	s0,8(s5)
    4b50:	00c45783          	lhu	a5,12(s0)
    4b54:	00f9fe63          	bgeu	s3,a5,4b70 <_fwalk_sglue+0x70>
    4b58:	00e41783          	lh	a5,14(s0)
    4b5c:	00040593          	mv	a1,s0
    4b60:	000b0513          	mv	a0,s6
    4b64:	01278663          	beq	a5,s2,4b70 <_fwalk_sglue+0x70>
    4b68:	000b80e7          	jalr	s7
    4b6c:	00aa6a33          	or	s4,s4,a0
    4b70:	fff48493          	addi	s1,s1,-1
    4b74:	06840413          	addi	s0,s0,104
    4b78:	fd249ce3          	bne	s1,s2,4b50 <_fwalk_sglue+0x50>
    4b7c:	000aaa83          	lw	s5,0(s5)
    4b80:	fc0a90e3          	bnez	s5,4b40 <_fwalk_sglue+0x40>
    4b84:	02c12083          	lw	ra,44(sp)
    4b88:	02812403          	lw	s0,40(sp)
    4b8c:	02412483          	lw	s1,36(sp)
    4b90:	02012903          	lw	s2,32(sp)
    4b94:	01c12983          	lw	s3,28(sp)
    4b98:	01412a83          	lw	s5,20(sp)
    4b9c:	01012b03          	lw	s6,16(sp)
    4ba0:	00c12b83          	lw	s7,12(sp)
    4ba4:	000a0513          	mv	a0,s4
    4ba8:	01812a03          	lw	s4,24(sp)
    4bac:	03010113          	addi	sp,sp,48
    4bb0:	00008067          	ret

00004bb4 <__sread>:
    4bb4:	ff010113          	addi	sp,sp,-16
    4bb8:	00812423          	sw	s0,8(sp)
    4bbc:	00058413          	mv	s0,a1
    4bc0:	00e59583          	lh	a1,14(a1)
    4bc4:	00112623          	sw	ra,12(sp)
    4bc8:	350010ef          	jal	5f18 <_read_r>
    4bcc:	02054063          	bltz	a0,4bec <__sread+0x38>
    4bd0:	05042783          	lw	a5,80(s0)
    4bd4:	00c12083          	lw	ra,12(sp)
    4bd8:	00a787b3          	add	a5,a5,a0
    4bdc:	04f42823          	sw	a5,80(s0)
    4be0:	00812403          	lw	s0,8(sp)
    4be4:	01010113          	addi	sp,sp,16
    4be8:	00008067          	ret
    4bec:	00c45783          	lhu	a5,12(s0)
    4bf0:	fffff737          	lui	a4,0xfffff
    4bf4:	fff70713          	addi	a4,a4,-1 # ffffefff <_stack_top+0xefffafff>
    4bf8:	00e7f7b3          	and	a5,a5,a4
    4bfc:	00c12083          	lw	ra,12(sp)
    4c00:	00f41623          	sh	a5,12(s0)
    4c04:	00812403          	lw	s0,8(sp)
    4c08:	01010113          	addi	sp,sp,16
    4c0c:	00008067          	ret

00004c10 <__seofread>:
    4c10:	00000513          	li	a0,0
    4c14:	00008067          	ret

00004c18 <__swrite>:
    4c18:	00c59783          	lh	a5,12(a1)
    4c1c:	fe010113          	addi	sp,sp,-32
    4c20:	00068313          	mv	t1,a3
    4c24:	00112e23          	sw	ra,28(sp)
    4c28:	1007f693          	andi	a3,a5,256
    4c2c:	00058713          	mv	a4,a1
    4c30:	00060893          	mv	a7,a2
    4c34:	00050813          	mv	a6,a0
    4c38:	02069863          	bnez	a3,4c68 <__swrite+0x50>
    4c3c:	fffff6b7          	lui	a3,0xfffff
    4c40:	fff68693          	addi	a3,a3,-1 # ffffefff <_stack_top+0xefffafff>
    4c44:	01c12083          	lw	ra,28(sp)
    4c48:	00d7f7b3          	and	a5,a5,a3
    4c4c:	00e71583          	lh	a1,14(a4)
    4c50:	00f71623          	sh	a5,12(a4)
    4c54:	00030693          	mv	a3,t1
    4c58:	00088613          	mv	a2,a7
    4c5c:	00080513          	mv	a0,a6
    4c60:	02010113          	addi	sp,sp,32
    4c64:	3180106f          	j	5f7c <_write_r>
    4c68:	00e59583          	lh	a1,14(a1)
    4c6c:	00c12423          	sw	a2,8(sp)
    4c70:	00200693          	li	a3,2
    4c74:	00000613          	li	a2,0
    4c78:	00612623          	sw	t1,12(sp)
    4c7c:	00e12023          	sw	a4,0(sp)
    4c80:	00a12223          	sw	a0,4(sp)
    4c84:	230010ef          	jal	5eb4 <_lseek_r>
    4c88:	00012703          	lw	a4,0(sp)
    4c8c:	00c12303          	lw	t1,12(sp)
    4c90:	00812883          	lw	a7,8(sp)
    4c94:	00c71783          	lh	a5,12(a4)
    4c98:	00412803          	lw	a6,4(sp)
    4c9c:	fa1ff06f          	j	4c3c <__swrite+0x24>

00004ca0 <__sseek>:
    4ca0:	ff010113          	addi	sp,sp,-16
    4ca4:	00812423          	sw	s0,8(sp)
    4ca8:	00058413          	mv	s0,a1
    4cac:	00e59583          	lh	a1,14(a1)
    4cb0:	00112623          	sw	ra,12(sp)
    4cb4:	200010ef          	jal	5eb4 <_lseek_r>
    4cb8:	fff00713          	li	a4,-1
    4cbc:	00c41783          	lh	a5,12(s0)
    4cc0:	02e50263          	beq	a0,a4,4ce4 <__sseek+0x44>
    4cc4:	00001737          	lui	a4,0x1
    4cc8:	00e7e7b3          	or	a5,a5,a4
    4ccc:	00c12083          	lw	ra,12(sp)
    4cd0:	04a42823          	sw	a0,80(s0)
    4cd4:	00f41623          	sh	a5,12(s0)
    4cd8:	00812403          	lw	s0,8(sp)
    4cdc:	01010113          	addi	sp,sp,16
    4ce0:	00008067          	ret
    4ce4:	80050713          	addi	a4,a0,-2048
    4ce8:	80070713          	addi	a4,a4,-2048 # 800 <_vfprintf_r+0x108>
    4cec:	00e7f7b3          	and	a5,a5,a4
    4cf0:	00c12083          	lw	ra,12(sp)
    4cf4:	00f41623          	sh	a5,12(s0)
    4cf8:	00812403          	lw	s0,8(sp)
    4cfc:	01010113          	addi	sp,sp,16
    4d00:	00008067          	ret

00004d04 <__sclose>:
    4d04:	00e59583          	lh	a1,14(a1)
    4d08:	06c0106f          	j	5d74 <_close_r>

00004d0c <__swsetup_r>:
    4d0c:	0fffc717          	auipc	a4,0xfffc
    4d10:	abc72703          	lw	a4,-1348(a4) # 100007c8 <_impure_ptr>
    4d14:	fe010113          	addi	sp,sp,-32
    4d18:	00112e23          	sw	ra,28(sp)
    4d1c:	00050613          	mv	a2,a0
    4d20:	00058793          	mv	a5,a1
    4d24:	00070663          	beqz	a4,4d30 <__swsetup_r+0x24>
    4d28:	03472683          	lw	a3,52(a4)
    4d2c:	10068a63          	beqz	a3,4e40 <__swsetup_r+0x134>
    4d30:	00c79703          	lh	a4,12(a5)
    4d34:	00877693          	andi	a3,a4,8
    4d38:	02068e63          	beqz	a3,4d74 <__swsetup_r+0x68>
    4d3c:	0107a683          	lw	a3,16(a5)
    4d40:	04068a63          	beqz	a3,4d94 <__swsetup_r+0x88>
    4d44:	00c79703          	lh	a4,12(a5)
    4d48:	00177613          	andi	a2,a4,1
    4d4c:	06060e63          	beqz	a2,4dc8 <__swsetup_r+0xbc>
    4d50:	0147a603          	lw	a2,20(a5)
    4d54:	0007a423          	sw	zero,8(a5)
    4d58:	00000513          	li	a0,0
    4d5c:	40c00633          	neg	a2,a2
    4d60:	00c7ac23          	sw	a2,24(a5)
    4d64:	08068063          	beqz	a3,4de4 <__swsetup_r+0xd8>
    4d68:	01c12083          	lw	ra,28(sp)
    4d6c:	02010113          	addi	sp,sp,32
    4d70:	00008067          	ret
    4d74:	01077693          	andi	a3,a4,16
    4d78:	0e068263          	beqz	a3,4e5c <__swsetup_r+0x150>
    4d7c:	00477693          	andi	a3,a4,4
    4d80:	06069e63          	bnez	a3,4dfc <__swsetup_r+0xf0>
    4d84:	0107a683          	lw	a3,16(a5)
    4d88:	00876713          	ori	a4,a4,8
    4d8c:	00e79623          	sh	a4,12(a5)
    4d90:	fa069ae3          	bnez	a3,4d44 <__swsetup_r+0x38>
    4d94:	00c7a703          	lw	a4,12(a5)
    4d98:	20000593          	li	a1,512
    4d9c:	28077713          	andi	a4,a4,640
    4da0:	fab702e3          	beq	a4,a1,4d44 <__swsetup_r+0x38>
    4da4:	00060513          	mv	a0,a2
    4da8:	00078593          	mv	a1,a5
    4dac:	00f12423          	sw	a5,8(sp)
    4db0:	67d060ef          	jal	bc2c <__smakebuf_r>
    4db4:	00812783          	lw	a5,8(sp)
    4db8:	00c79703          	lh	a4,12(a5)
    4dbc:	0107a683          	lw	a3,16(a5)
    4dc0:	00177613          	andi	a2,a4,1
    4dc4:	f80616e3          	bnez	a2,4d50 <__swsetup_r+0x44>
    4dc8:	00277613          	andi	a2,a4,2
    4dcc:	00000593          	li	a1,0
    4dd0:	00061463          	bnez	a2,4dd8 <__swsetup_r+0xcc>
    4dd4:	0147a583          	lw	a1,20(a5)
    4dd8:	00b7a423          	sw	a1,8(a5)
    4ddc:	00000513          	li	a0,0
    4de0:	f80694e3          	bnez	a3,4d68 <__swsetup_r+0x5c>
    4de4:	08077693          	andi	a3,a4,128
    4de8:	f80680e3          	beqz	a3,4d68 <__swsetup_r+0x5c>
    4dec:	04076713          	ori	a4,a4,64
    4df0:	00e79623          	sh	a4,12(a5)
    4df4:	fff00513          	li	a0,-1
    4df8:	f71ff06f          	j	4d68 <__swsetup_r+0x5c>
    4dfc:	0307a583          	lw	a1,48(a5)
    4e00:	02058663          	beqz	a1,4e2c <__swsetup_r+0x120>
    4e04:	04078693          	addi	a3,a5,64
    4e08:	02d58063          	beq	a1,a3,4e28 <__swsetup_r+0x11c>
    4e0c:	00060513          	mv	a0,a2
    4e10:	00f12623          	sw	a5,12(sp)
    4e14:	00c12423          	sw	a2,8(sp)
    4e18:	4a8030ef          	jal	82c0 <_free_r>
    4e1c:	00c12783          	lw	a5,12(sp)
    4e20:	00812603          	lw	a2,8(sp)
    4e24:	00c79703          	lh	a4,12(a5)
    4e28:	0207a823          	sw	zero,48(a5)
    4e2c:	0107a683          	lw	a3,16(a5)
    4e30:	fdb77713          	andi	a4,a4,-37
    4e34:	0007a223          	sw	zero,4(a5)
    4e38:	00d7a023          	sw	a3,0(a5)
    4e3c:	f4dff06f          	j	4d88 <__swsetup_r+0x7c>
    4e40:	00a12423          	sw	a0,8(sp)
    4e44:	00070513          	mv	a0,a4
    4e48:	00b12623          	sw	a1,12(sp)
    4e4c:	f00ff0ef          	jal	454c <__sinit>
    4e50:	00c12783          	lw	a5,12(sp)
    4e54:	00812603          	lw	a2,8(sp)
    4e58:	ed9ff06f          	j	4d30 <__swsetup_r+0x24>
    4e5c:	00900693          	li	a3,9
    4e60:	04076713          	ori	a4,a4,64
    4e64:	00d62023          	sw	a3,0(a2)
    4e68:	00e79623          	sh	a4,12(a5)
    4e6c:	fff00513          	li	a0,-1
    4e70:	ef9ff06f          	j	4d68 <__swsetup_r+0x5c>

00004e74 <memchr>:
    4e74:	00357793          	andi	a5,a0,3
    4e78:	0ff5f713          	zext.b	a4,a1
    4e7c:	02078063          	beqz	a5,4e9c <memchr+0x28>
    4e80:	08060863          	beqz	a2,4f10 <memchr+0x9c>
    4e84:	00054783          	lbu	a5,0(a0)
    4e88:	fff60613          	addi	a2,a2,-1
    4e8c:	08e78063          	beq	a5,a4,4f0c <memchr+0x98>
    4e90:	00150513          	addi	a0,a0,1
    4e94:	00357793          	andi	a5,a0,3
    4e98:	fe0794e3          	bnez	a5,4e80 <memchr+0xc>
    4e9c:	00300813          	li	a6,3
    4ea0:	04c87863          	bgeu	a6,a2,4ef0 <memchr+0x7c>
    4ea4:	0ff5f593          	zext.b	a1,a1
    4ea8:	00859793          	slli	a5,a1,0x8
    4eac:	00b785b3          	add	a1,a5,a1
    4eb0:	01059793          	slli	a5,a1,0x10
    4eb4:	feff0337          	lui	t1,0xfeff0
    4eb8:	808088b7          	lui	a7,0x80808
    4ebc:	00f585b3          	add	a1,a1,a5
    4ec0:	eff30313          	addi	t1,t1,-257 # fefefeff <_stack_top+0xeefebeff>
    4ec4:	08088893          	addi	a7,a7,128 # 80808080 <_stack_top+0x70804080>
    4ec8:	00052783          	lw	a5,0(a0)
    4ecc:	00f5c7b3          	xor	a5,a1,a5
    4ed0:	006786b3          	add	a3,a5,t1
    4ed4:	fff7c793          	not	a5,a5
    4ed8:	00f6f7b3          	and	a5,a3,a5
    4edc:	0117f7b3          	and	a5,a5,a7
    4ee0:	00079a63          	bnez	a5,4ef4 <memchr+0x80>
    4ee4:	ffc60613          	addi	a2,a2,-4
    4ee8:	00450513          	addi	a0,a0,4
    4eec:	fcc86ee3          	bltu	a6,a2,4ec8 <memchr+0x54>
    4ef0:	02060063          	beqz	a2,4f10 <memchr+0x9c>
    4ef4:	00c50633          	add	a2,a0,a2
    4ef8:	00c0006f          	j	4f04 <memchr+0x90>
    4efc:	00150513          	addi	a0,a0,1
    4f00:	00c50863          	beq	a0,a2,4f10 <memchr+0x9c>
    4f04:	00054783          	lbu	a5,0(a0)
    4f08:	fee79ae3          	bne	a5,a4,4efc <memchr+0x88>
    4f0c:	00008067          	ret
    4f10:	00000513          	li	a0,0
    4f14:	00008067          	ret

00004f18 <strncpy>:
    4f18:	00a5e7b3          	or	a5,a1,a0
    4f1c:	0037f793          	andi	a5,a5,3
    4f20:	00079663          	bnez	a5,4f2c <strncpy+0x14>
    4f24:	00463793          	sltiu	a5,a2,4
    4f28:	04078663          	beqz	a5,4f74 <strncpy+0x5c>
    4f2c:	00050713          	mv	a4,a0
    4f30:	01c0006f          	j	4f4c <strncpy+0x34>
    4f34:	fff5c683          	lbu	a3,-1(a1)
    4f38:	fff60813          	addi	a6,a2,-1
    4f3c:	fed78fa3          	sb	a3,-1(a5)
    4f40:	00068e63          	beqz	a3,4f5c <strncpy+0x44>
    4f44:	00078713          	mv	a4,a5
    4f48:	00080613          	mv	a2,a6
    4f4c:	00158593          	addi	a1,a1,1
    4f50:	00170793          	addi	a5,a4,1
    4f54:	fe0610e3          	bnez	a2,4f34 <strncpy+0x1c>
    4f58:	00008067          	ret
    4f5c:	00c70733          	add	a4,a4,a2
    4f60:	04080e63          	beqz	a6,4fbc <strncpy+0xa4>
    4f64:	00178793          	addi	a5,a5,1
    4f68:	fe078fa3          	sb	zero,-1(a5)
    4f6c:	fee79ce3          	bne	a5,a4,4f64 <strncpy+0x4c>
    4f70:	00008067          	ret
    4f74:	feff0337          	lui	t1,0xfeff0
    4f78:	808088b7          	lui	a7,0x80808
    4f7c:	eff30313          	addi	t1,t1,-257 # fefefeff <_stack_top+0xeefebeff>
    4f80:	08088893          	addi	a7,a7,128 # 80808080 <_stack_top+0x70804080>
    4f84:	00050713          	mv	a4,a0
    4f88:	00300e13          	li	t3,3
    4f8c:	0005a683          	lw	a3,0(a1)
    4f90:	006687b3          	add	a5,a3,t1
    4f94:	fff6c813          	not	a6,a3
    4f98:	0107f7b3          	and	a5,a5,a6
    4f9c:	0117f7b3          	and	a5,a5,a7
    4fa0:	fa0796e3          	bnez	a5,4f4c <strncpy+0x34>
    4fa4:	ffc60613          	addi	a2,a2,-4
    4fa8:	00d72023          	sw	a3,0(a4)
    4fac:	00470713          	addi	a4,a4,4
    4fb0:	00458593          	addi	a1,a1,4
    4fb4:	fcce6ce3          	bltu	t3,a2,4f8c <strncpy+0x74>
    4fb8:	f95ff06f          	j	4f4c <strncpy+0x34>
    4fbc:	00008067          	ret

00004fc0 <currentlocale>:
    4fc0:	ff010113          	addi	sp,sp,-16
    4fc4:	00912223          	sw	s1,4(sp)
    4fc8:	0fffb597          	auipc	a1,0xfffb
    4fcc:	28c58593          	addi	a1,a1,652 # 10000254 <__global_locale+0x20>
    4fd0:	0fffb517          	auipc	a0,0xfffb
    4fd4:	17c50513          	addi	a0,a0,380 # 1000014c <global_locale_string>
    4fd8:	0fffb497          	auipc	s1,0xfffb
    4fdc:	29c48493          	addi	s1,s1,668 # 10000274 <__global_locale+0x40>
    4fe0:	00812423          	sw	s0,8(sp)
    4fe4:	01212023          	sw	s2,0(sp)
    4fe8:	00112623          	sw	ra,12(sp)
    4fec:	00048413          	mv	s0,s1
    4ff0:	31c010ef          	jal	630c <strcpy>
    4ff4:	0fffb917          	auipc	s2,0xfffb
    4ff8:	32090913          	addi	s2,s2,800 # 10000314 <__global_locale+0xe0>
    4ffc:	00040593          	mv	a1,s0
    5000:	0fffb517          	auipc	a0,0xfffb
    5004:	25450513          	addi	a0,a0,596 # 10000254 <__global_locale+0x20>
    5008:	3a8010ef          	jal	63b0 <strcmp>
    500c:	02040413          	addi	s0,s0,32
    5010:	02051463          	bnez	a0,5038 <currentlocale+0x78>
    5014:	ff2414e3          	bne	s0,s2,4ffc <currentlocale+0x3c>
    5018:	00c12083          	lw	ra,12(sp)
    501c:	00812403          	lw	s0,8(sp)
    5020:	00412483          	lw	s1,4(sp)
    5024:	00012903          	lw	s2,0(sp)
    5028:	0fffb517          	auipc	a0,0xfffb
    502c:	12450513          	addi	a0,a0,292 # 1000014c <global_locale_string>
    5030:	01010113          	addi	sp,sp,16
    5034:	00008067          	ret
    5038:	0000e597          	auipc	a1,0xe
    503c:	89c58593          	addi	a1,a1,-1892 # 128d4 <__clzsi2+0x10c>
    5040:	0fffb517          	auipc	a0,0xfffb
    5044:	10c50513          	addi	a0,a0,268 # 1000014c <global_locale_string>
    5048:	6bd060ef          	jal	bf04 <strcat>
    504c:	00048593          	mv	a1,s1
    5050:	0fffb517          	auipc	a0,0xfffb
    5054:	0fc50513          	addi	a0,a0,252 # 1000014c <global_locale_string>
    5058:	02048493          	addi	s1,s1,32
    505c:	6a9060ef          	jal	bf04 <strcat>
    5060:	fd249ce3          	bne	s1,s2,5038 <currentlocale+0x78>
    5064:	fb5ff06f          	j	5018 <currentlocale+0x58>

00005068 <__loadlocale>:
    5068:	f9010113          	addi	sp,sp,-112
    506c:	06812423          	sw	s0,104(sp)
    5070:	00559413          	slli	s0,a1,0x5
    5074:	00850433          	add	s0,a0,s0
    5078:	07212023          	sw	s2,96(sp)
    507c:	05312e23          	sw	s3,92(sp)
    5080:	00050913          	mv	s2,a0
    5084:	00058993          	mv	s3,a1
    5088:	00060513          	mv	a0,a2
    508c:	00040593          	mv	a1,s0
    5090:	06912223          	sw	s1,100(sp)
    5094:	06112623          	sw	ra,108(sp)
    5098:	00060493          	mv	s1,a2
    509c:	314010ef          	jal	63b0 <strcmp>
    50a0:	02051263          	bnez	a0,50c4 <__loadlocale+0x5c>
    50a4:	06c12083          	lw	ra,108(sp)
    50a8:	00040513          	mv	a0,s0
    50ac:	06812403          	lw	s0,104(sp)
    50b0:	06412483          	lw	s1,100(sp)
    50b4:	06012903          	lw	s2,96(sp)
    50b8:	05c12983          	lw	s3,92(sp)
    50bc:	07010113          	addi	sp,sp,112
    50c0:	00008067          	ret
    50c4:	0000e597          	auipc	a1,0xe
    50c8:	81458593          	addi	a1,a1,-2028 # 128d8 <__clzsi2+0x110>
    50cc:	00048513          	mv	a0,s1
    50d0:	05412c23          	sw	s4,88(sp)
    50d4:	05512a23          	sw	s5,84(sp)
    50d8:	2d8010ef          	jal	63b0 <strcmp>
    50dc:	1a050263          	beqz	a0,5280 <__loadlocale+0x218>
    50e0:	0000e597          	auipc	a1,0xe
    50e4:	80058593          	addi	a1,a1,-2048 # 128e0 <__clzsi2+0x118>
    50e8:	00048513          	mv	a0,s1
    50ec:	2c4010ef          	jal	63b0 <strcmp>
    50f0:	16050863          	beqz	a0,5260 <__loadlocale+0x1f8>
    50f4:	0004c783          	lbu	a5,0(s1)
    50f8:	04300713          	li	a4,67
    50fc:	18e78c63          	beq	a5,a4,5294 <__loadlocale+0x22c>
    5100:	f9f78793          	addi	a5,a5,-97
    5104:	0ff7f793          	zext.b	a5,a5
    5108:	01900713          	li	a4,25
    510c:	12f76463          	bltu	a4,a5,5234 <__loadlocale+0x1cc>
    5110:	0014c783          	lbu	a5,1(s1)
    5114:	f9f78793          	addi	a5,a5,-97
    5118:	0ff7f793          	zext.b	a5,a5
    511c:	10f76c63          	bltu	a4,a5,5234 <__loadlocale+0x1cc>
    5120:	0024c783          	lbu	a5,2(s1)
    5124:	f9f78693          	addi	a3,a5,-97
    5128:	0ff6f693          	zext.b	a3,a3
    512c:	1ad77e63          	bgeu	a4,a3,52e8 <__loadlocale+0x280>
    5130:	00248713          	addi	a4,s1,2
    5134:	05f00693          	li	a3,95
    5138:	1ad78e63          	beq	a5,a3,52f4 <__loadlocale+0x28c>
    513c:	02e00693          	li	a3,46
    5140:	64d78263          	beq	a5,a3,5784 <__loadlocale+0x71c>
    5144:	0bf7f793          	andi	a5,a5,191
    5148:	0e079663          	bnez	a5,5234 <__loadlocale+0x1cc>
    514c:	02010a13          	addi	s4,sp,32
    5150:	000a0513          	mv	a0,s4
    5154:	0000d597          	auipc	a1,0xd
    5158:	79858593          	addi	a1,a1,1944 # 128ec <__clzsi2+0x124>
    515c:	00e12223          	sw	a4,4(sp)
    5160:	05612823          	sw	s6,80(sp)
    5164:	05712623          	sw	s7,76(sp)
    5168:	1a4010ef          	jal	630c <strcpy>
    516c:	00412703          	lw	a4,4(sp)
    5170:	00074683          	lbu	a3,0(a4)
    5174:	04000793          	li	a5,64
    5178:	64f68c63          	beq	a3,a5,57d0 <__loadlocale+0x768>
    517c:	00000a93          	li	s5,0
    5180:	00000b93          	li	s7,0
    5184:	00000b13          	li	s6,0
    5188:	02014783          	lbu	a5,32(sp)
    518c:	03400713          	li	a4,52
    5190:	fbf78793          	addi	a5,a5,-65
    5194:	0ff7f793          	zext.b	a5,a5
    5198:	08f76a63          	bltu	a4,a5,522c <__loadlocale+0x1c4>
    519c:	0000e717          	auipc	a4,0xe
    51a0:	bdc70713          	addi	a4,a4,-1060 # 12d78 <blanks.1+0x10>
    51a4:	00279793          	slli	a5,a5,0x2
    51a8:	00e787b3          	add	a5,a5,a4
    51ac:	0007a783          	lw	a5,0(a5)
    51b0:	00e787b3          	add	a5,a5,a4
    51b4:	00078067          	jr	a5
    51b8:	02114783          	lbu	a5,33(sp)
    51bc:	05000713          	li	a4,80
    51c0:	0df7f793          	andi	a5,a5,223
    51c4:	06e79463          	bne	a5,a4,522c <__loadlocale+0x1c4>
    51c8:	00200613          	li	a2,2
    51cc:	0000d597          	auipc	a1,0xd
    51d0:	79058593          	addi	a1,a1,1936 # 1295c <__clzsi2+0x194>
    51d4:	000a0513          	mv	a0,s4
    51d8:	d41ff0ef          	jal	4f18 <strncpy>
    51dc:	01c10593          	addi	a1,sp,28
    51e0:	02210513          	addi	a0,sp,34
    51e4:	00a00613          	li	a2,10
    51e8:	400060ef          	jal	b5e8 <strtol>
    51ec:	01c12783          	lw	a5,28(sp)
    51f0:	0007c783          	lbu	a5,0(a5)
    51f4:	02079c63          	bnez	a5,522c <__loadlocale+0x1c4>
    51f8:	3a400793          	li	a5,932
    51fc:	26f50063          	beq	a0,a5,545c <__loadlocale+0x3f4>
    5200:	66a7c463          	blt	a5,a0,5868 <__loadlocale+0x800>
    5204:	36a00793          	li	a5,874
    5208:	02a7c263          	blt	a5,a0,522c <__loadlocale+0x1c4>
    520c:	35100793          	li	a5,849
    5210:	66a7d863          	bge	a5,a0,5880 <__loadlocale+0x818>
    5214:	010117b7          	lui	a5,0x1011
    5218:	cae50513          	addi	a0,a0,-850
    521c:	1a578793          	addi	a5,a5,421 # 10111a5 <_sidata+0xffd9ad>
    5220:	00a7d7b3          	srl	a5,a5,a0
    5224:	0017f793          	andi	a5,a5,1
    5228:	1e079c63          	bnez	a5,5420 <__loadlocale+0x3b8>
    522c:	05012b03          	lw	s6,80(sp)
    5230:	04c12b83          	lw	s7,76(sp)
    5234:	00000413          	li	s0,0
    5238:	06c12083          	lw	ra,108(sp)
    523c:	00040513          	mv	a0,s0
    5240:	06812403          	lw	s0,104(sp)
    5244:	05812a03          	lw	s4,88(sp)
    5248:	05412a83          	lw	s5,84(sp)
    524c:	06412483          	lw	s1,100(sp)
    5250:	06012903          	lw	s2,96(sp)
    5254:	05c12983          	lw	s3,92(sp)
    5258:	07010113          	addi	sp,sp,112
    525c:	00008067          	ret
    5260:	02010a13          	addi	s4,sp,32
    5264:	000a0513          	mv	a0,s4
    5268:	0000d597          	auipc	a1,0xd
    526c:	67c58593          	addi	a1,a1,1660 # 128e4 <__clzsi2+0x11c>
    5270:	05612823          	sw	s6,80(sp)
    5274:	05712623          	sw	s7,76(sp)
    5278:	094010ef          	jal	630c <strcpy>
    527c:	f01ff06f          	j	517c <__loadlocale+0x114>
    5280:	0000d597          	auipc	a1,0xd
    5284:	66058593          	addi	a1,a1,1632 # 128e0 <__clzsi2+0x118>
    5288:	00048513          	mv	a0,s1
    528c:	080010ef          	jal	630c <strcpy>
    5290:	e51ff06f          	j	50e0 <__loadlocale+0x78>
    5294:	0014c783          	lbu	a5,1(s1)
    5298:	00100713          	li	a4,1
    529c:	fd378793          	addi	a5,a5,-45
    52a0:	0ff7f793          	zext.b	a5,a5
    52a4:	f8f768e3          	bltu	a4,a5,5234 <__loadlocale+0x1cc>
    52a8:	02010a13          	addi	s4,sp,32
    52ac:	00248593          	addi	a1,s1,2
    52b0:	000a0513          	mv	a0,s4
    52b4:	05612823          	sw	s6,80(sp)
    52b8:	05712623          	sw	s7,76(sp)
    52bc:	050010ef          	jal	630c <strcpy>
    52c0:	000a0513          	mv	a0,s4
    52c4:	04000593          	li	a1,64
    52c8:	4dd060ef          	jal	bfa4 <strchr>
    52cc:	00050463          	beqz	a0,52d4 <__loadlocale+0x26c>
    52d0:	00050023          	sb	zero,0(a0)
    52d4:	000a0513          	mv	a0,s4
    52d8:	b94fb0ef          	jal	66c <strlen>
    52dc:	00248793          	addi	a5,s1,2
    52e0:	00a78733          	add	a4,a5,a0
    52e4:	e8dff06f          	j	5170 <__loadlocale+0x108>
    52e8:	0034c783          	lbu	a5,3(s1)
    52ec:	00348713          	addi	a4,s1,3
    52f0:	e45ff06f          	j	5134 <__loadlocale+0xcc>
    52f4:	00174783          	lbu	a5,1(a4)
    52f8:	01900693          	li	a3,25
    52fc:	fbf78793          	addi	a5,a5,-65
    5300:	0ff7f793          	zext.b	a5,a5
    5304:	f2f6e8e3          	bltu	a3,a5,5234 <__loadlocale+0x1cc>
    5308:	00274783          	lbu	a5,2(a4)
    530c:	fbf78793          	addi	a5,a5,-65
    5310:	0ff7f793          	zext.b	a5,a5
    5314:	f2f6e0e3          	bltu	a3,a5,5234 <__loadlocale+0x1cc>
    5318:	00374783          	lbu	a5,3(a4)
    531c:	00370713          	addi	a4,a4,3
    5320:	e1dff06f          	j	513c <__loadlocale+0xd4>
    5324:	0000d597          	auipc	a1,0xd
    5328:	5f458593          	addi	a1,a1,1524 # 12918 <__clzsi2+0x150>
    532c:	000a0513          	mv	a0,s4
    5330:	369060ef          	jal	be98 <strcasecmp>
    5334:	00050c63          	beqz	a0,534c <__loadlocale+0x2e4>
    5338:	0000d597          	auipc	a1,0xd
    533c:	5e858593          	addi	a1,a1,1512 # 12920 <__clzsi2+0x158>
    5340:	000a0513          	mv	a0,s4
    5344:	355060ef          	jal	be98 <strcasecmp>
    5348:	ee0512e3          	bnez	a0,522c <__loadlocale+0x1c4>
    534c:	0000d597          	auipc	a1,0xd
    5350:	5cc58593          	addi	a1,a1,1484 # 12918 <__clzsi2+0x150>
    5354:	000a0513          	mv	a0,s4
    5358:	7b5000ef          	jal	630c <strcpy>
    535c:	00004697          	auipc	a3,0x4
    5360:	cc468693          	addi	a3,a3,-828 # 9020 <__utf8_mbtowc>
    5364:	00006617          	auipc	a2,0x6
    5368:	31060613          	addi	a2,a2,784 # b674 <__utf8_wctomb>
    536c:	00600713          	li	a4,6
    5370:	00200793          	li	a5,2
    5374:	3af98063          	beq	s3,a5,5714 <__loadlocale+0x6ac>
    5378:	00600793          	li	a5,6
    537c:	00f99863          	bne	s3,a5,538c <__loadlocale+0x324>
    5380:	000a0593          	mv	a1,s4
    5384:	14a90513          	addi	a0,s2,330
    5388:	785000ef          	jal	630c <strcpy>
    538c:	00048593          	mv	a1,s1
    5390:	00040513          	mv	a0,s0
    5394:	779000ef          	jal	630c <strcpy>
    5398:	00050413          	mv	s0,a0
    539c:	06c12083          	lw	ra,108(sp)
    53a0:	00040513          	mv	a0,s0
    53a4:	06812403          	lw	s0,104(sp)
    53a8:	05812a03          	lw	s4,88(sp)
    53ac:	05412a83          	lw	s5,84(sp)
    53b0:	05012b03          	lw	s6,80(sp)
    53b4:	04c12b83          	lw	s7,76(sp)
    53b8:	06412483          	lw	s1,100(sp)
    53bc:	06012903          	lw	s2,96(sp)
    53c0:	05c12983          	lw	s3,92(sp)
    53c4:	07010113          	addi	sp,sp,112
    53c8:	00008067          	ret
    53cc:	00300613          	li	a2,3
    53d0:	0000d597          	auipc	a1,0xd
    53d4:	5d858593          	addi	a1,a1,1496 # 129a8 <__clzsi2+0x1e0>
    53d8:	000a0513          	mv	a0,s4
    53dc:	54d060ef          	jal	c128 <strncasecmp>
    53e0:	e40516e3          	bnez	a0,522c <__loadlocale+0x1c4>
    53e4:	02314503          	lbu	a0,35(sp)
    53e8:	01010713          	addi	a4,sp,16
    53ec:	0000d597          	auipc	a1,0xd
    53f0:	5c058593          	addi	a1,a1,1472 # 129ac <__clzsi2+0x1e4>
    53f4:	fd350513          	addi	a0,a0,-45
    53f8:	00153513          	seqz	a0,a0
    53fc:	03050793          	addi	a5,a0,48
    5400:	00e78533          	add	a0,a5,a4
    5404:	fe350513          	addi	a0,a0,-29
    5408:	7a9000ef          	jal	63b0 <strcmp>
    540c:	e20510e3          	bnez	a0,522c <__loadlocale+0x1c4>
    5410:	0000d597          	auipc	a1,0xd
    5414:	5a058593          	addi	a1,a1,1440 # 129b0 <__clzsi2+0x1e8>
    5418:	000a0513          	mv	a0,s4
    541c:	6f1000ef          	jal	630c <strcpy>
    5420:	00004697          	auipc	a3,0x4
    5424:	b9868693          	addi	a3,a3,-1128 # 8fb8 <__ascii_mbtowc>
    5428:	00006617          	auipc	a2,0x6
    542c:	21c60613          	addi	a2,a2,540 # b644 <__ascii_wctomb>
    5430:	00100713          	li	a4,1
    5434:	f3dff06f          	j	5370 <__loadlocale+0x308>
    5438:	0000d597          	auipc	a1,0xd
    543c:	50458593          	addi	a1,a1,1284 # 1293c <__clzsi2+0x174>
    5440:	000a0513          	mv	a0,s4
    5444:	255060ef          	jal	be98 <strcasecmp>
    5448:	de0512e3          	bnez	a0,522c <__loadlocale+0x1c4>
    544c:	0000d597          	auipc	a1,0xd
    5450:	4f058593          	addi	a1,a1,1264 # 1293c <__clzsi2+0x174>
    5454:	000a0513          	mv	a0,s4
    5458:	6b5000ef          	jal	630c <strcpy>
    545c:	00004697          	auipc	a3,0x4
    5460:	ebc68693          	addi	a3,a3,-324 # 9318 <__sjis_mbtowc>
    5464:	00006617          	auipc	a2,0x6
    5468:	2fc60613          	addi	a2,a2,764 # b760 <__sjis_wctomb>
    546c:	00200713          	li	a4,2
    5470:	f01ff06f          	j	5370 <__loadlocale+0x308>
    5474:	0000d597          	auipc	a1,0xd
    5478:	52458593          	addi	a1,a1,1316 # 12998 <__clzsi2+0x1d0>
    547c:	000a0513          	mv	a0,s4
    5480:	219060ef          	jal	be98 <strcasecmp>
    5484:	da0514e3          	bnez	a0,522c <__loadlocale+0x1c4>
    5488:	0000d597          	auipc	a1,0xd
    548c:	51858593          	addi	a1,a1,1304 # 129a0 <__clzsi2+0x1d8>
    5490:	000a0513          	mv	a0,s4
    5494:	679000ef          	jal	630c <strcpy>
    5498:	f89ff06f          	j	5420 <__loadlocale+0x3b8>
    549c:	00400613          	li	a2,4
    54a0:	0000d597          	auipc	a1,0xd
    54a4:	4c058593          	addi	a1,a1,1216 # 12960 <__clzsi2+0x198>
    54a8:	000a0513          	mv	a0,s4
    54ac:	47d060ef          	jal	c128 <strncasecmp>
    54b0:	d6051ee3          	bnez	a0,522c <__loadlocale+0x1c4>
    54b4:	02414783          	lbu	a5,36(sp)
    54b8:	02d00693          	li	a3,45
    54bc:	02410713          	addi	a4,sp,36
    54c0:	00d79663          	bne	a5,a3,54cc <__loadlocale+0x464>
    54c4:	02514783          	lbu	a5,37(sp)
    54c8:	02510713          	addi	a4,sp,37
    54cc:	0df7f793          	andi	a5,a5,223
    54d0:	05200693          	li	a3,82
    54d4:	36d78663          	beq	a5,a3,5840 <__loadlocale+0x7d8>
    54d8:	00074783          	lbu	a5,0(a4)
    54dc:	05500713          	li	a4,85
    54e0:	0df7f793          	andi	a5,a5,223
    54e4:	36e78863          	beq	a5,a4,5854 <__loadlocale+0x7ec>
    54e8:	05400713          	li	a4,84
    54ec:	d4e790e3          	bne	a5,a4,522c <__loadlocale+0x1c4>
    54f0:	0000d597          	auipc	a1,0xd
    54f4:	48858593          	addi	a1,a1,1160 # 12978 <__clzsi2+0x1b0>
    54f8:	000a0513          	mv	a0,s4
    54fc:	611000ef          	jal	630c <strcpy>
    5500:	f21ff06f          	j	5420 <__loadlocale+0x3b8>
    5504:	0000d597          	auipc	a1,0xd
    5508:	42458593          	addi	a1,a1,1060 # 12928 <__clzsi2+0x160>
    550c:	000a0513          	mv	a0,s4
    5510:	189060ef          	jal	be98 <strcasecmp>
    5514:	d0051ce3          	bnez	a0,522c <__loadlocale+0x1c4>
    5518:	0000d597          	auipc	a1,0xd
    551c:	41058593          	addi	a1,a1,1040 # 12928 <__clzsi2+0x160>
    5520:	000a0513          	mv	a0,s4
    5524:	5e9000ef          	jal	630c <strcpy>
    5528:	00004697          	auipc	a3,0x4
    552c:	18068693          	addi	a3,a3,384 # 96a8 <__jis_mbtowc>
    5530:	00006617          	auipc	a2,0x6
    5534:	35460613          	addi	a2,a2,852 # b884 <__jis_wctomb>
    5538:	00800713          	li	a4,8
    553c:	e35ff06f          	j	5370 <__loadlocale+0x308>
    5540:	00300613          	li	a2,3
    5544:	0000d597          	auipc	a1,0xd
    5548:	40058593          	addi	a1,a1,1024 # 12944 <__clzsi2+0x17c>
    554c:	000a0513          	mv	a0,s4
    5550:	3d9060ef          	jal	c128 <strncasecmp>
    5554:	cc051ce3          	bnez	a0,522c <__loadlocale+0x1c4>
    5558:	02314783          	lbu	a5,35(sp)
    555c:	01010713          	addi	a4,sp,16
    5560:	00400613          	li	a2,4
    5564:	fd378793          	addi	a5,a5,-45
    5568:	0017b793          	seqz	a5,a5
    556c:	03078793          	addi	a5,a5,48
    5570:	00e787b3          	add	a5,a5,a4
    5574:	fe378793          	addi	a5,a5,-29
    5578:	0000d597          	auipc	a1,0xd
    557c:	3d058593          	addi	a1,a1,976 # 12948 <__clzsi2+0x180>
    5580:	00078513          	mv	a0,a5
    5584:	00f12223          	sw	a5,4(sp)
    5588:	3a1060ef          	jal	c128 <strncasecmp>
    558c:	ca0510e3          	bnez	a0,522c <__loadlocale+0x1c4>
    5590:	00412783          	lw	a5,4(sp)
    5594:	00a00613          	li	a2,10
    5598:	01c10593          	addi	a1,sp,28
    559c:	0047c503          	lbu	a0,4(a5)
    55a0:	fd350513          	addi	a0,a0,-45
    55a4:	00153513          	seqz	a0,a0
    55a8:	00a78533          	add	a0,a5,a0
    55ac:	00450513          	addi	a0,a0,4
    55b0:	038060ef          	jal	b5e8 <strtol>
    55b4:	fff50793          	addi	a5,a0,-1
    55b8:	0107b793          	sltiu	a5,a5,16
    55bc:	c60788e3          	beqz	a5,522c <__loadlocale+0x1c4>
    55c0:	ff450793          	addi	a5,a0,-12
    55c4:	c60784e3          	beqz	a5,522c <__loadlocale+0x1c4>
    55c8:	01c12783          	lw	a5,28(sp)
    55cc:	0007c783          	lbu	a5,0(a5)
    55d0:	c4079ee3          	bnez	a5,522c <__loadlocale+0x1c4>
    55d4:	00a12223          	sw	a0,4(sp)
    55d8:	0000d597          	auipc	a1,0xd
    55dc:	37858593          	addi	a1,a1,888 # 12950 <__clzsi2+0x188>
    55e0:	000a0513          	mv	a0,s4
    55e4:	529000ef          	jal	630c <strcpy>
    55e8:	00412703          	lw	a4,4(sp)
    55ec:	00a00793          	li	a5,10
    55f0:	02910693          	addi	a3,sp,41
    55f4:	00e7d863          	bge	a5,a4,5604 <__loadlocale+0x59c>
    55f8:	03100793          	li	a5,49
    55fc:	02f104a3          	sb	a5,41(sp)
    5600:	02a10693          	addi	a3,sp,42
    5604:	00070513          	mv	a0,a4
    5608:	00a00593          	li	a1,10
    560c:	00d12223          	sw	a3,4(sp)
    5610:	1880d0ef          	jal	12798 <__modsi3>
    5614:	00412683          	lw	a3,4(sp)
    5618:	03050793          	addi	a5,a0,48
    561c:	000680a3          	sb	zero,1(a3)
    5620:	00f68023          	sb	a5,0(a3)
    5624:	dfdff06f          	j	5420 <__loadlocale+0x3b8>
    5628:	0000d597          	auipc	a1,0xd
    562c:	2bc58593          	addi	a1,a1,700 # 128e4 <__clzsi2+0x11c>
    5630:	000a0513          	mv	a0,s4
    5634:	065060ef          	jal	be98 <strcasecmp>
    5638:	be051ae3          	bnez	a0,522c <__loadlocale+0x1c4>
    563c:	0000d597          	auipc	a1,0xd
    5640:	2a858593          	addi	a1,a1,680 # 128e4 <__clzsi2+0x11c>
    5644:	000a0513          	mv	a0,s4
    5648:	4c5000ef          	jal	630c <strcpy>
    564c:	dd5ff06f          	j	5420 <__loadlocale+0x3b8>
    5650:	00800613          	li	a2,8
    5654:	0000d597          	auipc	a1,0xd
    5658:	32c58593          	addi	a1,a1,812 # 12980 <__clzsi2+0x1b8>
    565c:	000a0513          	mv	a0,s4
    5660:	2c9060ef          	jal	c128 <strncasecmp>
    5664:	bc0514e3          	bnez	a0,522c <__loadlocale+0x1c4>
    5668:	02814503          	lbu	a0,40(sp)
    566c:	01010713          	addi	a4,sp,16
    5670:	0000d597          	auipc	a1,0xd
    5674:	31c58593          	addi	a1,a1,796 # 1298c <__clzsi2+0x1c4>
    5678:	fd350513          	addi	a0,a0,-45
    567c:	00153513          	seqz	a0,a0
    5680:	03050793          	addi	a5,a0,48
    5684:	00e78533          	add	a0,a5,a4
    5688:	fe850513          	addi	a0,a0,-24
    568c:	00d060ef          	jal	be98 <strcasecmp>
    5690:	b8051ee3          	bnez	a0,522c <__loadlocale+0x1c4>
    5694:	0000d597          	auipc	a1,0xd
    5698:	2fc58593          	addi	a1,a1,764 # 12990 <__clzsi2+0x1c8>
    569c:	000a0513          	mv	a0,s4
    56a0:	46d000ef          	jal	630c <strcpy>
    56a4:	d7dff06f          	j	5420 <__loadlocale+0x3b8>
    56a8:	00300613          	li	a2,3
    56ac:	0000d597          	auipc	a1,0xd
    56b0:	28058593          	addi	a1,a1,640 # 1292c <__clzsi2+0x164>
    56b4:	000a0513          	mv	a0,s4
    56b8:	271060ef          	jal	c128 <strncasecmp>
    56bc:	b60518e3          	bnez	a0,522c <__loadlocale+0x1c4>
    56c0:	02314503          	lbu	a0,35(sp)
    56c4:	01010713          	addi	a4,sp,16
    56c8:	0000d597          	auipc	a1,0xd
    56cc:	26858593          	addi	a1,a1,616 # 12930 <__clzsi2+0x168>
    56d0:	fd350513          	addi	a0,a0,-45
    56d4:	00153513          	seqz	a0,a0
    56d8:	03050793          	addi	a5,a0,48
    56dc:	00e78533          	add	a0,a5,a4
    56e0:	fe350513          	addi	a0,a0,-29
    56e4:	7b4060ef          	jal	be98 <strcasecmp>
    56e8:	b40512e3          	bnez	a0,522c <__loadlocale+0x1c4>
    56ec:	0000d597          	auipc	a1,0xd
    56f0:	24858593          	addi	a1,a1,584 # 12934 <__clzsi2+0x16c>
    56f4:	000a0513          	mv	a0,s4
    56f8:	415000ef          	jal	630c <strcpy>
    56fc:	00004697          	auipc	a3,0x4
    5700:	d9468693          	addi	a3,a3,-620 # 9490 <__eucjp_mbtowc>
    5704:	00006617          	auipc	a2,0x6
    5708:	0e060613          	addi	a2,a2,224 # b7e4 <__eucjp_wctomb>
    570c:	00300713          	li	a4,3
    5710:	c61ff06f          	j	5370 <__loadlocale+0x308>
    5714:	000a0593          	mv	a1,s4
    5718:	12a90513          	addi	a0,s2,298
    571c:	00d12623          	sw	a3,12(sp)
    5720:	00c12423          	sw	a2,8(sp)
    5724:	00e12223          	sw	a4,4(sp)
    5728:	3e5000ef          	jal	630c <strcpy>
    572c:	00412703          	lw	a4,4(sp)
    5730:	00812603          	lw	a2,8(sp)
    5734:	00c12683          	lw	a3,12(sp)
    5738:	12e90423          	sb	a4,296(s2)
    573c:	0ec92023          	sw	a2,224(s2)
    5740:	0ed92223          	sw	a3,228(s2)
    5744:	000a0593          	mv	a1,s4
    5748:	00090513          	mv	a0,s2
    574c:	354060ef          	jal	baa0 <__set_ctype>
    5750:	020a9463          	bnez	s5,5778 <__loadlocale+0x710>
    5754:	01fb9693          	slli	a3,s7,0x1f
    5758:	01f6d793          	srli	a5,a3,0x1f
    575c:	00079e63          	bnez	a5,5778 <__loadlocale+0x710>
    5760:	00412703          	lw	a4,4(sp)
    5764:	fff70713          	addi	a4,a4,-1
    5768:	00070863          	beqz	a4,5778 <__loadlocale+0x710>
    576c:	02014783          	lbu	a5,32(sp)
    5770:	fab78793          	addi	a5,a5,-85
    5774:	00f03ab3          	snez	s5,a5
    5778:	040b1663          	bnez	s6,57c4 <__loadlocale+0x75c>
    577c:	0f592423          	sw	s5,232(s2)
    5780:	c0dff06f          	j	538c <__loadlocale+0x324>
    5784:	00170a93          	addi	s5,a4,1
    5788:	02010a13          	addi	s4,sp,32
    578c:	000a8593          	mv	a1,s5
    5790:	000a0513          	mv	a0,s4
    5794:	05612823          	sw	s6,80(sp)
    5798:	05712623          	sw	s7,76(sp)
    579c:	371000ef          	jal	630c <strcpy>
    57a0:	000a0513          	mv	a0,s4
    57a4:	04000593          	li	a1,64
    57a8:	7fc060ef          	jal	bfa4 <strchr>
    57ac:	00050463          	beqz	a0,57b4 <__loadlocale+0x74c>
    57b0:	00050023          	sb	zero,0(a0)
    57b4:	000a0513          	mv	a0,s4
    57b8:	eb5fa0ef          	jal	66c <strlen>
    57bc:	00aa8733          	add	a4,s5,a0
    57c0:	9b1ff06f          	j	5170 <__loadlocale+0x108>
    57c4:	fff00793          	li	a5,-1
    57c8:	0ef92423          	sw	a5,232(s2)
    57cc:	bc1ff06f          	j	538c <__loadlocale+0x324>
    57d0:	05812423          	sw	s8,72(sp)
    57d4:	00170c13          	addi	s8,a4,1
    57d8:	000c0513          	mv	a0,s8
    57dc:	0000d597          	auipc	a1,0xd
    57e0:	11c58593          	addi	a1,a1,284 # 128f8 <__clzsi2+0x130>
    57e4:	3cd000ef          	jal	63b0 <strcmp>
    57e8:	00050b93          	mv	s7,a0
    57ec:	00000a93          	li	s5,0
    57f0:	00100b13          	li	s6,1
    57f4:	00051663          	bnez	a0,5800 <__loadlocale+0x798>
    57f8:	04812c03          	lw	s8,72(sp)
    57fc:	98dff06f          	j	5188 <__loadlocale+0x120>
    5800:	0000d597          	auipc	a1,0xd
    5804:	10458593          	addi	a1,a1,260 # 12904 <__clzsi2+0x13c>
    5808:	000c0513          	mv	a0,s8
    580c:	3a5000ef          	jal	63b0 <strcmp>
    5810:	00050a93          	mv	s5,a0
    5814:	00000b13          	li	s6,0
    5818:	00100b93          	li	s7,1
    581c:	fc050ee3          	beqz	a0,57f8 <__loadlocale+0x790>
    5820:	000c0513          	mv	a0,s8
    5824:	0000d597          	auipc	a1,0xd
    5828:	0ec58593          	addi	a1,a1,236 # 12910 <__clzsi2+0x148>
    582c:	385000ef          	jal	63b0 <strcmp>
    5830:	00153a93          	seqz	s5,a0
    5834:	04812c03          	lw	s8,72(sp)
    5838:	00000b93          	li	s7,0
    583c:	94dff06f          	j	5188 <__loadlocale+0x120>
    5840:	0000d597          	auipc	a1,0xd
    5844:	12858593          	addi	a1,a1,296 # 12968 <__clzsi2+0x1a0>
    5848:	000a0513          	mv	a0,s4
    584c:	2c1000ef          	jal	630c <strcpy>
    5850:	bd1ff06f          	j	5420 <__loadlocale+0x3b8>
    5854:	0000d597          	auipc	a1,0xd
    5858:	11c58593          	addi	a1,a1,284 # 12970 <__clzsi2+0x1a8>
    585c:	000a0513          	mv	a0,s4
    5860:	2ad000ef          	jal	630c <strcpy>
    5864:	bbdff06f          	j	5420 <__loadlocale+0x3b8>
    5868:	46500793          	li	a5,1125
    586c:	baf50ae3          	beq	a0,a5,5420 <__loadlocale+0x3b8>
    5870:	b1e50513          	addi	a0,a0,-1250
    5874:	00800793          	li	a5,8
    5878:	baa7f4e3          	bgeu	a5,a0,5420 <__loadlocale+0x3b8>
    587c:	9b1ff06f          	j	522c <__loadlocale+0x1c4>
    5880:	2e100793          	li	a5,737
    5884:	b8f50ee3          	beq	a0,a5,5420 <__loadlocale+0x3b8>
    5888:	00a7cc63          	blt	a5,a0,58a0 <__loadlocale+0x838>
    588c:	1b500793          	li	a5,437
    5890:	b8f508e3          	beq	a0,a5,5420 <__loadlocale+0x3b8>
    5894:	2d000793          	li	a5,720
    5898:	98f51ae3          	bne	a0,a5,522c <__loadlocale+0x1c4>
    589c:	b85ff06f          	j	5420 <__loadlocale+0x3b8>
    58a0:	30700793          	li	a5,775
    58a4:	98f514e3          	bne	a0,a5,522c <__loadlocale+0x1c4>
    58a8:	b79ff06f          	j	5420 <__loadlocale+0x3b8>

000058ac <__get_locale_env>:
    58ac:	ff010113          	addi	sp,sp,-16
    58b0:	00912223          	sw	s1,4(sp)
    58b4:	00058493          	mv	s1,a1
    58b8:	0000d597          	auipc	a1,0xd
    58bc:	10058593          	addi	a1,a1,256 # 129b8 <__clzsi2+0x1f0>
    58c0:	00812423          	sw	s0,8(sp)
    58c4:	00112623          	sw	ra,12(sp)
    58c8:	00050413          	mv	s0,a0
    58cc:	621020ef          	jal	86ec <_getenv_r>
    58d0:	00050663          	beqz	a0,58dc <__get_locale_env+0x30>
    58d4:	00054783          	lbu	a5,0(a0)
    58d8:	04079863          	bnez	a5,5928 <__get_locale_env+0x7c>
    58dc:	00249793          	slli	a5,s1,0x2
    58e0:	0000d717          	auipc	a4,0xd
    58e4:	6d870713          	addi	a4,a4,1752 # 12fb8 <categories>
    58e8:	00f707b3          	add	a5,a4,a5
    58ec:	0007a583          	lw	a1,0(a5)
    58f0:	00040513          	mv	a0,s0
    58f4:	5f9020ef          	jal	86ec <_getenv_r>
    58f8:	00050663          	beqz	a0,5904 <__get_locale_env+0x58>
    58fc:	00054783          	lbu	a5,0(a0)
    5900:	02079463          	bnez	a5,5928 <__get_locale_env+0x7c>
    5904:	00040513          	mv	a0,s0
    5908:	0000d597          	auipc	a1,0xd
    590c:	0b858593          	addi	a1,a1,184 # 129c0 <__clzsi2+0x1f8>
    5910:	5dd020ef          	jal	86ec <_getenv_r>
    5914:	00050663          	beqz	a0,5920 <__get_locale_env+0x74>
    5918:	00054783          	lbu	a5,0(a0)
    591c:	00079663          	bnez	a5,5928 <__get_locale_env+0x7c>
    5920:	0fffb517          	auipc	a0,0xfffb
    5924:	a8050513          	addi	a0,a0,-1408 # 100003a0 <__default_locale>
    5928:	00c12083          	lw	ra,12(sp)
    592c:	00812403          	lw	s0,8(sp)
    5930:	00412483          	lw	s1,4(sp)
    5934:	01010113          	addi	sp,sp,16
    5938:	00008067          	ret

0000593c <_setlocale_r>:
    593c:	fc010113          	addi	sp,sp,-64
    5940:	01712e23          	sw	s7,28(sp)
    5944:	02112e23          	sw	ra,60(sp)
    5948:	02812c23          	sw	s0,56(sp)
    594c:	03212823          	sw	s2,48(sp)
    5950:	00600793          	li	a5,6
    5954:	00050b93          	mv	s7,a0
    5958:	1ab7e463          	bltu	a5,a1,5b00 <_setlocale_r+0x1c4>
    595c:	03512223          	sw	s5,36(sp)
    5960:	03612023          	sw	s6,32(sp)
    5964:	00060a93          	mv	s5,a2
    5968:	00058b13          	mv	s6,a1
    596c:	26060863          	beqz	a2,5bdc <_setlocale_r+0x2a0>
    5970:	03412423          	sw	s4,40(sp)
    5974:	0fffb917          	auipc	s2,0xfffb
    5978:	8e090913          	addi	s2,s2,-1824 # 10000254 <__global_locale+0x20>
    597c:	0fffba17          	auipc	s4,0xfffb
    5980:	09ca0a13          	addi	s4,s4,156 # 10000a18 <new_categories.1+0x20>
    5984:	02912a23          	sw	s1,52(sp)
    5988:	03312623          	sw	s3,44(sp)
    598c:	000a0413          	mv	s0,s4
    5990:	00090493          	mv	s1,s2
    5994:	0fffb997          	auipc	s3,0xfffb
    5998:	14498993          	addi	s3,s3,324 # 10000ad8 <__malloc_current_mallinfo>
    599c:	00048593          	mv	a1,s1
    59a0:	00040513          	mv	a0,s0
    59a4:	02040413          	addi	s0,s0,32
    59a8:	165000ef          	jal	630c <strcpy>
    59ac:	02048493          	addi	s1,s1,32
    59b0:	ff3416e3          	bne	s0,s3,599c <_setlocale_r+0x60>
    59b4:	000ac783          	lbu	a5,0(s5)
    59b8:	0c079863          	bnez	a5,5a88 <_setlocale_r+0x14c>
    59bc:	240b1463          	bnez	s6,5c04 <_setlocale_r+0x2c8>
    59c0:	0fffb497          	auipc	s1,0xfffb
    59c4:	05848493          	addi	s1,s1,88 # 10000a18 <new_categories.1+0x20>
    59c8:	00100413          	li	s0,1
    59cc:	01f00a93          	li	s5,31
    59d0:	00700b13          	li	s6,7
    59d4:	00040593          	mv	a1,s0
    59d8:	000b8513          	mv	a0,s7
    59dc:	ed1ff0ef          	jal	58ac <__get_locale_env>
    59e0:	00050993          	mv	s3,a0
    59e4:	c89fa0ef          	jal	66c <strlen>
    59e8:	00050793          	mv	a5,a0
    59ec:	00098593          	mv	a1,s3
    59f0:	00048513          	mv	a0,s1
    59f4:	0efaec63          	bltu	s5,a5,5aec <_setlocale_r+0x1b0>
    59f8:	00140413          	addi	s0,s0,1
    59fc:	111000ef          	jal	630c <strcpy>
    5a00:	02048493          	addi	s1,s1,32
    5a04:	fd6418e3          	bne	s0,s6,59d4 <_setlocale_r+0x98>
    5a08:	0fffbb17          	auipc	s6,0xfffb
    5a0c:	f30b0b13          	addi	s6,s6,-208 # 10000938 <saved_categories.0+0x20>
    5a10:	000b0993          	mv	s3,s6
    5a14:	0fffb497          	auipc	s1,0xfffb
    5a18:	00448493          	addi	s1,s1,4 # 10000a18 <new_categories.1+0x20>
    5a1c:	00100413          	li	s0,1
    5a20:	00700a93          	li	s5,7
    5a24:	00090593          	mv	a1,s2
    5a28:	00098513          	mv	a0,s3
    5a2c:	0e1000ef          	jal	630c <strcpy>
    5a30:	00048613          	mv	a2,s1
    5a34:	00040593          	mv	a1,s0
    5a38:	0fffa517          	auipc	a0,0xfffa
    5a3c:	7fc50513          	addi	a0,a0,2044 # 10000234 <__global_locale>
    5a40:	e28ff0ef          	jal	5068 <__loadlocale>
    5a44:	1e050e63          	beqz	a0,5c40 <_setlocale_r+0x304>
    5a48:	00140413          	addi	s0,s0,1
    5a4c:	02098993          	addi	s3,s3,32
    5a50:	02090913          	addi	s2,s2,32
    5a54:	02048493          	addi	s1,s1,32
    5a58:	fd5416e3          	bne	s0,s5,5a24 <_setlocale_r+0xe8>
    5a5c:	03812403          	lw	s0,56(sp)
    5a60:	03412483          	lw	s1,52(sp)
    5a64:	02c12983          	lw	s3,44(sp)
    5a68:	02812a03          	lw	s4,40(sp)
    5a6c:	02412a83          	lw	s5,36(sp)
    5a70:	02012b03          	lw	s6,32(sp)
    5a74:	03c12083          	lw	ra,60(sp)
    5a78:	03012903          	lw	s2,48(sp)
    5a7c:	01c12b83          	lw	s7,28(sp)
    5a80:	04010113          	addi	sp,sp,64
    5a84:	d3cff06f          	j	4fc0 <currentlocale>
    5a88:	0a0b0063          	beqz	s6,5b28 <_setlocale_r+0x1ec>
    5a8c:	000a8513          	mv	a0,s5
    5a90:	bddfa0ef          	jal	66c <strlen>
    5a94:	01f00793          	li	a5,31
    5a98:	04a7ea63          	bltu	a5,a0,5aec <_setlocale_r+0x1b0>
    5a9c:	005b1793          	slli	a5,s6,0x5
    5aa0:	0fffb717          	auipc	a4,0xfffb
    5aa4:	f5870713          	addi	a4,a4,-168 # 100009f8 <new_categories.1>
    5aa8:	00f70433          	add	s0,a4,a5
    5aac:	000a8593          	mv	a1,s5
    5ab0:	00040513          	mv	a0,s0
    5ab4:	059000ef          	jal	630c <strcpy>
    5ab8:	00040613          	mv	a2,s0
    5abc:	000b0593          	mv	a1,s6
    5ac0:	0fffa517          	auipc	a0,0xfffa
    5ac4:	77450513          	addi	a0,a0,1908 # 10000234 <__global_locale>
    5ac8:	da0ff0ef          	jal	5068 <__loadlocale>
    5acc:	00050413          	mv	s0,a0
    5ad0:	cf0ff0ef          	jal	4fc0 <currentlocale>
    5ad4:	03412483          	lw	s1,52(sp)
    5ad8:	02c12983          	lw	s3,44(sp)
    5adc:	02812a03          	lw	s4,40(sp)
    5ae0:	02412a83          	lw	s5,36(sp)
    5ae4:	02012b03          	lw	s6,32(sp)
    5ae8:	0240006f          	j	5b0c <_setlocale_r+0x1d0>
    5aec:	03412483          	lw	s1,52(sp)
    5af0:	02c12983          	lw	s3,44(sp)
    5af4:	02812a03          	lw	s4,40(sp)
    5af8:	02412a83          	lw	s5,36(sp)
    5afc:	02012b03          	lw	s6,32(sp)
    5b00:	01600913          	li	s2,22
    5b04:	012ba023          	sw	s2,0(s7)
    5b08:	00000413          	li	s0,0
    5b0c:	03c12083          	lw	ra,60(sp)
    5b10:	00040513          	mv	a0,s0
    5b14:	03812403          	lw	s0,56(sp)
    5b18:	03012903          	lw	s2,48(sp)
    5b1c:	01c12b83          	lw	s7,28(sp)
    5b20:	04010113          	addi	sp,sp,64
    5b24:	00008067          	ret
    5b28:	02f00593          	li	a1,47
    5b2c:	000a8513          	mv	a0,s5
    5b30:	474060ef          	jal	bfa4 <strchr>
    5b34:	00050793          	mv	a5,a0
    5b38:	18050c63          	beqz	a0,5cd0 <_setlocale_r+0x394>
    5b3c:	00154703          	lbu	a4,1(a0)
    5b40:	02f00613          	li	a2,47
    5b44:	00070693          	mv	a3,a4
    5b48:	00c71863          	bne	a4,a2,5b58 <_setlocale_r+0x21c>
    5b4c:	0027c703          	lbu	a4,2(a5)
    5b50:	00178793          	addi	a5,a5,1
    5b54:	fed70ce3          	beq	a4,a3,5b4c <_setlocale_r+0x210>
    5b58:	f8070ae3          	beqz	a4,5aec <_setlocale_r+0x1b0>
    5b5c:	0fffb417          	auipc	s0,0xfffb
    5b60:	ebc40413          	addi	s0,s0,-324 # 10000a18 <new_categories.1+0x20>
    5b64:	00100b13          	li	s6,1
    5b68:	02f00493          	li	s1,47
    5b6c:	41578633          	sub	a2,a5,s5
    5b70:	01f00713          	li	a4,31
    5b74:	f6c74ce3          	blt	a4,a2,5aec <_setlocale_r+0x1b0>
    5b78:	00160613          	addi	a2,a2,1
    5b7c:	000a8593          	mv	a1,s5
    5b80:	00040513          	mv	a0,s0
    5b84:	00f12623          	sw	a5,12(sp)
    5b88:	55c060ef          	jal	c0e4 <strlcpy>
    5b8c:	00c12783          	lw	a5,12(sp)
    5b90:	001b0b13          	addi	s6,s6,1
    5b94:	0007c703          	lbu	a4,0(a5)
    5b98:	00971863          	bne	a4,s1,5ba8 <_setlocale_r+0x26c>
    5b9c:	0017c703          	lbu	a4,1(a5)
    5ba0:	00178793          	addi	a5,a5,1
    5ba4:	fe970ce3          	beq	a4,s1,5b9c <_setlocale_r+0x260>
    5ba8:	14070c63          	beqz	a4,5d00 <_setlocale_r+0x3c4>
    5bac:	00078713          	mv	a4,a5
    5bb0:	00174683          	lbu	a3,1(a4)
    5bb4:	00170713          	addi	a4,a4,1
    5bb8:	fd168613          	addi	a2,a3,-47
    5bbc:	00068463          	beqz	a3,5bc4 <_setlocale_r+0x288>
    5bc0:	fe0618e3          	bnez	a2,5bb0 <_setlocale_r+0x274>
    5bc4:	00700693          	li	a3,7
    5bc8:	02040413          	addi	s0,s0,32
    5bcc:	e2db0ee3          	beq	s6,a3,5a08 <_setlocale_r+0xcc>
    5bd0:	00078a93          	mv	s5,a5
    5bd4:	00070793          	mv	a5,a4
    5bd8:	f95ff06f          	j	5b6c <_setlocale_r+0x230>
    5bdc:	0fffa417          	auipc	s0,0xfffa
    5be0:	57040413          	addi	s0,s0,1392 # 1000014c <global_locale_string>
    5be4:	0e058063          	beqz	a1,5cc4 <_setlocale_r+0x388>
    5be8:	00559413          	slli	s0,a1,0x5
    5bec:	0fffa797          	auipc	a5,0xfffa
    5bf0:	64878793          	addi	a5,a5,1608 # 10000234 <__global_locale>
    5bf4:	02412a83          	lw	s5,36(sp)
    5bf8:	02012b03          	lw	s6,32(sp)
    5bfc:	00f40433          	add	s0,s0,a5
    5c00:	f0dff06f          	j	5b0c <_setlocale_r+0x1d0>
    5c04:	000b0593          	mv	a1,s6
    5c08:	000b8513          	mv	a0,s7
    5c0c:	ca1ff0ef          	jal	58ac <__get_locale_env>
    5c10:	00050493          	mv	s1,a0
    5c14:	a59fa0ef          	jal	66c <strlen>
    5c18:	01f00793          	li	a5,31
    5c1c:	eca7e8e3          	bltu	a5,a0,5aec <_setlocale_r+0x1b0>
    5c20:	005b1793          	slli	a5,s6,0x5
    5c24:	0fffb717          	auipc	a4,0xfffb
    5c28:	dd470713          	addi	a4,a4,-556 # 100009f8 <new_categories.1>
    5c2c:	00f70433          	add	s0,a4,a5
    5c30:	00048593          	mv	a1,s1
    5c34:	00040513          	mv	a0,s0
    5c38:	6d4000ef          	jal	630c <strcpy>
    5c3c:	e7dff06f          	j	5ab8 <_setlocale_r+0x17c>
    5c40:	00100493          	li	s1,1
    5c44:	000ba903          	lw	s2,0(s7)
    5c48:	00941c63          	bne	s0,s1,5c60 <_setlocale_r+0x324>
    5c4c:	0600006f          	j	5cac <_setlocale_r+0x370>
    5c50:	00148493          	addi	s1,s1,1
    5c54:	020a0a13          	addi	s4,s4,32
    5c58:	020b0b13          	addi	s6,s6,32
    5c5c:	04848863          	beq	s1,s0,5cac <_setlocale_r+0x370>
    5c60:	000b0593          	mv	a1,s6
    5c64:	000a0513          	mv	a0,s4
    5c68:	6a4000ef          	jal	630c <strcpy>
    5c6c:	000a0613          	mv	a2,s4
    5c70:	00048593          	mv	a1,s1
    5c74:	0fffa517          	auipc	a0,0xfffa
    5c78:	5c050513          	addi	a0,a0,1472 # 10000234 <__global_locale>
    5c7c:	becff0ef          	jal	5068 <__loadlocale>
    5c80:	fc0518e3          	bnez	a0,5c50 <_setlocale_r+0x314>
    5c84:	0000d597          	auipc	a1,0xd
    5c88:	c5c58593          	addi	a1,a1,-932 # 128e0 <__clzsi2+0x118>
    5c8c:	000a0513          	mv	a0,s4
    5c90:	67c000ef          	jal	630c <strcpy>
    5c94:	000a0613          	mv	a2,s4
    5c98:	00048593          	mv	a1,s1
    5c9c:	0fffa517          	auipc	a0,0xfffa
    5ca0:	59850513          	addi	a0,a0,1432 # 10000234 <__global_locale>
    5ca4:	bc4ff0ef          	jal	5068 <__loadlocale>
    5ca8:	fa9ff06f          	j	5c50 <_setlocale_r+0x314>
    5cac:	03412483          	lw	s1,52(sp)
    5cb0:	02c12983          	lw	s3,44(sp)
    5cb4:	02812a03          	lw	s4,40(sp)
    5cb8:	02412a83          	lw	s5,36(sp)
    5cbc:	02012b03          	lw	s6,32(sp)
    5cc0:	e45ff06f          	j	5b04 <_setlocale_r+0x1c8>
    5cc4:	02412a83          	lw	s5,36(sp)
    5cc8:	02012b03          	lw	s6,32(sp)
    5ccc:	e41ff06f          	j	5b0c <_setlocale_r+0x1d0>
    5cd0:	000a8513          	mv	a0,s5
    5cd4:	999fa0ef          	jal	66c <strlen>
    5cd8:	01f00793          	li	a5,31
    5cdc:	e0a7e8e3          	bltu	a5,a0,5aec <_setlocale_r+0x1b0>
    5ce0:	0fffb417          	auipc	s0,0xfffb
    5ce4:	d3840413          	addi	s0,s0,-712 # 10000a18 <new_categories.1+0x20>
    5ce8:	00040513          	mv	a0,s0
    5cec:	000a8593          	mv	a1,s5
    5cf0:	02040413          	addi	s0,s0,32
    5cf4:	618000ef          	jal	630c <strcpy>
    5cf8:	ff3418e3          	bne	s0,s3,5ce8 <_setlocale_r+0x3ac>
    5cfc:	d0dff06f          	j	5a08 <_setlocale_r+0xcc>
    5d00:	005b1413          	slli	s0,s6,0x5
    5d04:	0fffb717          	auipc	a4,0xfffb
    5d08:	cf470713          	addi	a4,a4,-780 # 100009f8 <new_categories.1>
    5d0c:	00700793          	li	a5,7
    5d10:	00870433          	add	s0,a4,s0
    5d14:	cefb0ae3          	beq	s6,a5,5a08 <_setlocale_r+0xcc>
    5d18:	fe040593          	addi	a1,s0,-32
    5d1c:	00040513          	mv	a0,s0
    5d20:	02040413          	addi	s0,s0,32
    5d24:	5e8000ef          	jal	630c <strcpy>
    5d28:	ff3418e3          	bne	s0,s3,5d18 <_setlocale_r+0x3dc>
    5d2c:	cddff06f          	j	5a08 <_setlocale_r+0xcc>

00005d30 <__locale_mb_cur_max>:
    5d30:	0fffa517          	auipc	a0,0xfffa
    5d34:	62c54503          	lbu	a0,1580(a0) # 1000035c <__global_locale+0x128>
    5d38:	00008067          	ret

00005d3c <setlocale>:
    5d3c:	00050793          	mv	a5,a0
    5d40:	0fffb517          	auipc	a0,0xfffb
    5d44:	a8852503          	lw	a0,-1400(a0) # 100007c8 <_impure_ptr>
    5d48:	00058613          	mv	a2,a1
    5d4c:	00078593          	mv	a1,a5
    5d50:	bedff06f          	j	593c <_setlocale_r>

00005d54 <__localeconv_l>:
    5d54:	0f050513          	addi	a0,a0,240
    5d58:	00008067          	ret

00005d5c <_localeconv_r>:
    5d5c:	0fffa517          	auipc	a0,0xfffa
    5d60:	5c850513          	addi	a0,a0,1480 # 10000324 <__global_locale+0xf0>
    5d64:	00008067          	ret

00005d68 <localeconv>:
    5d68:	0fffa517          	auipc	a0,0xfffa
    5d6c:	5bc50513          	addi	a0,a0,1468 # 10000324 <__global_locale+0xf0>
    5d70:	00008067          	ret

00005d74 <_close_r>:
    5d74:	ff010113          	addi	sp,sp,-16
    5d78:	00812423          	sw	s0,8(sp)
    5d7c:	00050413          	mv	s0,a0
    5d80:	00058513          	mv	a0,a1
    5d84:	0fffb797          	auipc	a5,0xfffb
    5d88:	da07a223          	sw	zero,-604(a5) # 10000b28 <errno>
    5d8c:	00112623          	sw	ra,12(sp)
    5d90:	cfcfa0ef          	jal	28c <_close>
    5d94:	fff00793          	li	a5,-1
    5d98:	00f50a63          	beq	a0,a5,5dac <_close_r+0x38>
    5d9c:	00c12083          	lw	ra,12(sp)
    5da0:	00812403          	lw	s0,8(sp)
    5da4:	01010113          	addi	sp,sp,16
    5da8:	00008067          	ret
    5dac:	0fffb797          	auipc	a5,0xfffb
    5db0:	d7c7a783          	lw	a5,-644(a5) # 10000b28 <errno>
    5db4:	fe0784e3          	beqz	a5,5d9c <_close_r+0x28>
    5db8:	00c12083          	lw	ra,12(sp)
    5dbc:	00f42023          	sw	a5,0(s0)
    5dc0:	00812403          	lw	s0,8(sp)
    5dc4:	01010113          	addi	sp,sp,16
    5dc8:	00008067          	ret

00005dcc <_reclaim_reent>:
    5dcc:	0fffb797          	auipc	a5,0xfffb
    5dd0:	9fc7a783          	lw	a5,-1540(a5) # 100007c8 <_impure_ptr>
    5dd4:	0ca78e63          	beq	a5,a0,5eb0 <_reclaim_reent+0xe4>
    5dd8:	04452583          	lw	a1,68(a0)
    5ddc:	fe010113          	addi	sp,sp,-32
    5de0:	00912a23          	sw	s1,20(sp)
    5de4:	00112e23          	sw	ra,28(sp)
    5de8:	00812c23          	sw	s0,24(sp)
    5dec:	00050493          	mv	s1,a0
    5df0:	04058863          	beqz	a1,5e40 <_reclaim_reent+0x74>
    5df4:	01212823          	sw	s2,16(sp)
    5df8:	01312623          	sw	s3,12(sp)
    5dfc:	00000913          	li	s2,0
    5e00:	08000993          	li	s3,128
    5e04:	012587b3          	add	a5,a1,s2
    5e08:	0007a403          	lw	s0,0(a5)
    5e0c:	00040e63          	beqz	s0,5e28 <_reclaim_reent+0x5c>
    5e10:	00040593          	mv	a1,s0
    5e14:	00042403          	lw	s0,0(s0)
    5e18:	00048513          	mv	a0,s1
    5e1c:	4a4020ef          	jal	82c0 <_free_r>
    5e20:	fe0418e3          	bnez	s0,5e10 <_reclaim_reent+0x44>
    5e24:	0444a583          	lw	a1,68(s1)
    5e28:	00490913          	addi	s2,s2,4
    5e2c:	fd391ce3          	bne	s2,s3,5e04 <_reclaim_reent+0x38>
    5e30:	00048513          	mv	a0,s1
    5e34:	48c020ef          	jal	82c0 <_free_r>
    5e38:	01012903          	lw	s2,16(sp)
    5e3c:	00c12983          	lw	s3,12(sp)
    5e40:	0384a583          	lw	a1,56(s1)
    5e44:	00058663          	beqz	a1,5e50 <_reclaim_reent+0x84>
    5e48:	00048513          	mv	a0,s1
    5e4c:	474020ef          	jal	82c0 <_free_r>
    5e50:	0404a403          	lw	s0,64(s1)
    5e54:	00040c63          	beqz	s0,5e6c <_reclaim_reent+0xa0>
    5e58:	00040593          	mv	a1,s0
    5e5c:	00042403          	lw	s0,0(s0)
    5e60:	00048513          	mv	a0,s1
    5e64:	45c020ef          	jal	82c0 <_free_r>
    5e68:	fe0418e3          	bnez	s0,5e58 <_reclaim_reent+0x8c>
    5e6c:	04c4a583          	lw	a1,76(s1)
    5e70:	00058663          	beqz	a1,5e7c <_reclaim_reent+0xb0>
    5e74:	00048513          	mv	a0,s1
    5e78:	448020ef          	jal	82c0 <_free_r>
    5e7c:	0344a783          	lw	a5,52(s1)
    5e80:	00078e63          	beqz	a5,5e9c <_reclaim_reent+0xd0>
    5e84:	01812403          	lw	s0,24(sp)
    5e88:	01c12083          	lw	ra,28(sp)
    5e8c:	00048513          	mv	a0,s1
    5e90:	01412483          	lw	s1,20(sp)
    5e94:	02010113          	addi	sp,sp,32
    5e98:	00078067          	jr	a5
    5e9c:	01c12083          	lw	ra,28(sp)
    5ea0:	01812403          	lw	s0,24(sp)
    5ea4:	01412483          	lw	s1,20(sp)
    5ea8:	02010113          	addi	sp,sp,32
    5eac:	00008067          	ret
    5eb0:	00008067          	ret

00005eb4 <_lseek_r>:
    5eb4:	00058793          	mv	a5,a1
    5eb8:	ff010113          	addi	sp,sp,-16
    5ebc:	00812423          	sw	s0,8(sp)
    5ec0:	00060593          	mv	a1,a2
    5ec4:	00050413          	mv	s0,a0
    5ec8:	00068613          	mv	a2,a3
    5ecc:	00078513          	mv	a0,a5
    5ed0:	00112623          	sw	ra,12(sp)
    5ed4:	0fffb797          	auipc	a5,0xfffb
    5ed8:	c407aa23          	sw	zero,-940(a5) # 10000b28 <errno>
    5edc:	c44fa0ef          	jal	320 <_lseek>
    5ee0:	fff00793          	li	a5,-1
    5ee4:	00f50a63          	beq	a0,a5,5ef8 <_lseek_r+0x44>
    5ee8:	00c12083          	lw	ra,12(sp)
    5eec:	00812403          	lw	s0,8(sp)
    5ef0:	01010113          	addi	sp,sp,16
    5ef4:	00008067          	ret
    5ef8:	0fffb797          	auipc	a5,0xfffb
    5efc:	c307a783          	lw	a5,-976(a5) # 10000b28 <errno>
    5f00:	fe0784e3          	beqz	a5,5ee8 <_lseek_r+0x34>
    5f04:	00c12083          	lw	ra,12(sp)
    5f08:	00f42023          	sw	a5,0(s0)
    5f0c:	00812403          	lw	s0,8(sp)
    5f10:	01010113          	addi	sp,sp,16
    5f14:	00008067          	ret

00005f18 <_read_r>:
    5f18:	00058793          	mv	a5,a1
    5f1c:	ff010113          	addi	sp,sp,-16
    5f20:	00812423          	sw	s0,8(sp)
    5f24:	00060593          	mv	a1,a2
    5f28:	00050413          	mv	s0,a0
    5f2c:	00068613          	mv	a2,a3
    5f30:	00078513          	mv	a0,a5
    5f34:	00112623          	sw	ra,12(sp)
    5f38:	0fffb797          	auipc	a5,0xfffb
    5f3c:	be07a823          	sw	zero,-1040(a5) # 10000b28 <errno>
    5f40:	c14fa0ef          	jal	354 <_read>
    5f44:	fff00793          	li	a5,-1
    5f48:	00f50a63          	beq	a0,a5,5f5c <_read_r+0x44>
    5f4c:	00c12083          	lw	ra,12(sp)
    5f50:	00812403          	lw	s0,8(sp)
    5f54:	01010113          	addi	sp,sp,16
    5f58:	00008067          	ret
    5f5c:	0fffb797          	auipc	a5,0xfffb
    5f60:	bcc7a783          	lw	a5,-1076(a5) # 10000b28 <errno>
    5f64:	fe0784e3          	beqz	a5,5f4c <_read_r+0x34>
    5f68:	00c12083          	lw	ra,12(sp)
    5f6c:	00f42023          	sw	a5,0(s0)
    5f70:	00812403          	lw	s0,8(sp)
    5f74:	01010113          	addi	sp,sp,16
    5f78:	00008067          	ret

00005f7c <_write_r>:
    5f7c:	00058793          	mv	a5,a1
    5f80:	ff010113          	addi	sp,sp,-16
    5f84:	00812423          	sw	s0,8(sp)
    5f88:	00060593          	mv	a1,a2
    5f8c:	00050413          	mv	s0,a0
    5f90:	00068613          	mv	a2,a3
    5f94:	00078513          	mv	a0,a5
    5f98:	00112623          	sw	ra,12(sp)
    5f9c:	0fffb797          	auipc	a5,0xfffb
    5fa0:	b807a623          	sw	zero,-1140(a5) # 10000b28 <errno>
    5fa4:	9f4fa0ef          	jal	198 <_write>
    5fa8:	fff00793          	li	a5,-1
    5fac:	00f50a63          	beq	a0,a5,5fc0 <_write_r+0x44>
    5fb0:	00c12083          	lw	ra,12(sp)
    5fb4:	00812403          	lw	s0,8(sp)
    5fb8:	01010113          	addi	sp,sp,16
    5fbc:	00008067          	ret
    5fc0:	0fffb797          	auipc	a5,0xfffb
    5fc4:	b687a783          	lw	a5,-1176(a5) # 10000b28 <errno>
    5fc8:	fe0784e3          	beqz	a5,5fb0 <_write_r+0x34>
    5fcc:	00c12083          	lw	ra,12(sp)
    5fd0:	00f42023          	sw	a5,0(s0)
    5fd4:	00812403          	lw	s0,8(sp)
    5fd8:	01010113          	addi	sp,sp,16
    5fdc:	00008067          	ret

00005fe0 <memmove>:
    5fe0:	02a5f663          	bgeu	a1,a0,600c <memmove+0x2c>
    5fe4:	00c587b3          	add	a5,a1,a2
    5fe8:	02f57263          	bgeu	a0,a5,600c <memmove+0x2c>
    5fec:	04060863          	beqz	a2,603c <memmove+0x5c>
    5ff0:	00c50633          	add	a2,a0,a2
    5ff4:	fff7c703          	lbu	a4,-1(a5)
    5ff8:	fff60613          	addi	a2,a2,-1
    5ffc:	fff78793          	addi	a5,a5,-1
    6000:	00e60023          	sb	a4,0(a2)
    6004:	fec518e3          	bne	a0,a2,5ff4 <memmove+0x14>
    6008:	00008067          	ret
    600c:	00f00793          	li	a5,15
    6010:	02c7e863          	bltu	a5,a2,6040 <memmove+0x60>
    6014:	00050793          	mv	a5,a0
    6018:	fff60693          	addi	a3,a2,-1
    601c:	0e060063          	beqz	a2,60fc <memmove+0x11c>
    6020:	00168693          	addi	a3,a3,1
    6024:	00d786b3          	add	a3,a5,a3
    6028:	0005c703          	lbu	a4,0(a1)
    602c:	00178793          	addi	a5,a5,1
    6030:	00158593          	addi	a1,a1,1
    6034:	fee78fa3          	sb	a4,-1(a5)
    6038:	fed798e3          	bne	a5,a3,6028 <memmove+0x48>
    603c:	00008067          	ret
    6040:	00b567b3          	or	a5,a0,a1
    6044:	0037f793          	andi	a5,a5,3
    6048:	00058893          	mv	a7,a1
    604c:	0a079263          	bnez	a5,60f0 <memmove+0x110>
    6050:	00465793          	srli	a5,a2,0x4
    6054:	00479813          	slli	a6,a5,0x4
    6058:	01050833          	add	a6,a0,a6
    605c:	fff78793          	addi	a5,a5,-1
    6060:	00050713          	mv	a4,a0
    6064:	0005a683          	lw	a3,0(a1)
    6068:	01058593          	addi	a1,a1,16
    606c:	01070713          	addi	a4,a4,16
    6070:	fed72823          	sw	a3,-16(a4)
    6074:	ff45a683          	lw	a3,-12(a1)
    6078:	fed72a23          	sw	a3,-12(a4)
    607c:	ff85a683          	lw	a3,-8(a1)
    6080:	fed72c23          	sw	a3,-8(a4)
    6084:	ffc5a683          	lw	a3,-4(a1)
    6088:	fed72e23          	sw	a3,-4(a4)
    608c:	fd071ce3          	bne	a4,a6,6064 <memmove+0x84>
    6090:	00479793          	slli	a5,a5,0x4
    6094:	01178733          	add	a4,a5,a7
    6098:	01070593          	addi	a1,a4,16
    609c:	00f507b3          	add	a5,a0,a5
    60a0:	00c67813          	andi	a6,a2,12
    60a4:	01078793          	addi	a5,a5,16
    60a8:	00058e13          	mv	t3,a1
    60ac:	00f67693          	andi	a3,a2,15
    60b0:	04080863          	beqz	a6,6100 <memmove+0x120>
    60b4:	ffc68693          	addi	a3,a3,-4
    60b8:	ffc6f693          	andi	a3,a3,-4
    60bc:	00d70733          	add	a4,a4,a3
    60c0:	01470713          	addi	a4,a4,20
    60c4:	41150833          	sub	a6,a0,a7
    60c8:	0005a303          	lw	t1,0(a1)
    60cc:	010588b3          	add	a7,a1,a6
    60d0:	00458593          	addi	a1,a1,4
    60d4:	0068a023          	sw	t1,0(a7)
    60d8:	fee598e3          	bne	a1,a4,60c8 <memmove+0xe8>
    60dc:	00468713          	addi	a4,a3,4
    60e0:	01c705b3          	add	a1,a4,t3
    60e4:	00f707b3          	add	a5,a4,a5
    60e8:	00367613          	andi	a2,a2,3
    60ec:	f2dff06f          	j	6018 <memmove+0x38>
    60f0:	fff60693          	addi	a3,a2,-1
    60f4:	00050793          	mv	a5,a0
    60f8:	f29ff06f          	j	6020 <memmove+0x40>
    60fc:	00008067          	ret
    6100:	00068613          	mv	a2,a3
    6104:	f15ff06f          	j	6018 <memmove+0x38>

00006108 <memset>:
    6108:	00f00313          	li	t1,15
    610c:	00050713          	mv	a4,a0
    6110:	02c37e63          	bgeu	t1,a2,614c <memset+0x44>
    6114:	00f77793          	andi	a5,a4,15
    6118:	0a079063          	bnez	a5,61b8 <memset+0xb0>
    611c:	08059263          	bnez	a1,61a0 <memset+0x98>
    6120:	ff067693          	andi	a3,a2,-16
    6124:	00f67613          	andi	a2,a2,15
    6128:	00e686b3          	add	a3,a3,a4
    612c:	00b72023          	sw	a1,0(a4)
    6130:	00b72223          	sw	a1,4(a4)
    6134:	00b72423          	sw	a1,8(a4)
    6138:	00b72623          	sw	a1,12(a4)
    613c:	01070713          	addi	a4,a4,16
    6140:	fed766e3          	bltu	a4,a3,612c <memset+0x24>
    6144:	00061463          	bnez	a2,614c <memset+0x44>
    6148:	00008067          	ret
    614c:	40c306b3          	sub	a3,t1,a2
    6150:	00269693          	slli	a3,a3,0x2
    6154:	00000297          	auipc	t0,0x0
    6158:	005686b3          	add	a3,a3,t0
    615c:	00c68067          	jr	12(a3)
    6160:	00b70723          	sb	a1,14(a4)
    6164:	00b706a3          	sb	a1,13(a4)
    6168:	00b70623          	sb	a1,12(a4)
    616c:	00b705a3          	sb	a1,11(a4)
    6170:	00b70523          	sb	a1,10(a4)
    6174:	00b704a3          	sb	a1,9(a4)
    6178:	00b70423          	sb	a1,8(a4)
    617c:	00b703a3          	sb	a1,7(a4)
    6180:	00b70323          	sb	a1,6(a4)
    6184:	00b702a3          	sb	a1,5(a4)
    6188:	00b70223          	sb	a1,4(a4)
    618c:	00b701a3          	sb	a1,3(a4)
    6190:	00b70123          	sb	a1,2(a4)
    6194:	00b700a3          	sb	a1,1(a4)
    6198:	00b70023          	sb	a1,0(a4)
    619c:	00008067          	ret
    61a0:	0ff5f593          	zext.b	a1,a1
    61a4:	00859693          	slli	a3,a1,0x8
    61a8:	00d5e5b3          	or	a1,a1,a3
    61ac:	01059693          	slli	a3,a1,0x10
    61b0:	00d5e5b3          	or	a1,a1,a3
    61b4:	f6dff06f          	j	6120 <memset+0x18>
    61b8:	00279693          	slli	a3,a5,0x2
    61bc:	00000297          	auipc	t0,0x0
    61c0:	005686b3          	add	a3,a3,t0
    61c4:	00008293          	mv	t0,ra
    61c8:	fa0680e7          	jalr	-96(a3)
    61cc:	00028093          	mv	ra,t0
    61d0:	ff078793          	addi	a5,a5,-16
    61d4:	40f70733          	sub	a4,a4,a5
    61d8:	00f60633          	add	a2,a2,a5
    61dc:	f6c378e3          	bgeu	t1,a2,614c <memset+0x44>
    61e0:	f3dff06f          	j	611c <memset+0x14>

000061e4 <memcpy>:
    61e4:	00a5c7b3          	xor	a5,a1,a0
    61e8:	0037f793          	andi	a5,a5,3
    61ec:	00c508b3          	add	a7,a0,a2
    61f0:	06079663          	bnez	a5,625c <memcpy+0x78>
    61f4:	00463613          	sltiu	a2,a2,4
    61f8:	06061263          	bnez	a2,625c <memcpy+0x78>
    61fc:	00357793          	andi	a5,a0,3
    6200:	00050713          	mv	a4,a0
    6204:	0c079a63          	bnez	a5,62d8 <memcpy+0xf4>
    6208:	ffc8f613          	andi	a2,a7,-4
    620c:	40e606b3          	sub	a3,a2,a4
    6210:	02000793          	li	a5,32
    6214:	06d7c463          	blt	a5,a3,627c <memcpy+0x98>
    6218:	00058693          	mv	a3,a1
    621c:	00070793          	mv	a5,a4
    6220:	02c77a63          	bgeu	a4,a2,6254 <memcpy+0x70>
    6224:	0006a803          	lw	a6,0(a3)
    6228:	00478793          	addi	a5,a5,4
    622c:	00468693          	addi	a3,a3,4
    6230:	ff07ae23          	sw	a6,-4(a5)
    6234:	fec7e8e3          	bltu	a5,a2,6224 <memcpy+0x40>
    6238:	fff60613          	addi	a2,a2,-1
    623c:	40e60633          	sub	a2,a2,a4
    6240:	ffc67613          	andi	a2,a2,-4
    6244:	00458593          	addi	a1,a1,4
    6248:	00470713          	addi	a4,a4,4
    624c:	00c585b3          	add	a1,a1,a2
    6250:	00c70733          	add	a4,a4,a2
    6254:	01176863          	bltu	a4,a7,6264 <memcpy+0x80>
    6258:	00008067          	ret
    625c:	00050713          	mv	a4,a0
    6260:	ff157ce3          	bgeu	a0,a7,6258 <memcpy+0x74>
    6264:	0005c783          	lbu	a5,0(a1)
    6268:	00170713          	addi	a4,a4,1
    626c:	00158593          	addi	a1,a1,1
    6270:	fef70fa3          	sb	a5,-1(a4)
    6274:	fee898e3          	bne	a7,a4,6264 <memcpy+0x80>
    6278:	00008067          	ret
    627c:	0005a683          	lw	a3,0(a1)
    6280:	0045a283          	lw	t0,4(a1)
    6284:	0085af83          	lw	t6,8(a1)
    6288:	00c5af03          	lw	t5,12(a1)
    628c:	0105ae83          	lw	t4,16(a1)
    6290:	0145ae03          	lw	t3,20(a1)
    6294:	0185a303          	lw	t1,24(a1)
    6298:	01c5a803          	lw	a6,28(a1)
    629c:	00d72023          	sw	a3,0(a4)
    62a0:	0205a683          	lw	a3,32(a1)
    62a4:	02470713          	addi	a4,a4,36
    62a8:	fe572023          	sw	t0,-32(a4)
    62ac:	fed72e23          	sw	a3,-4(a4)
    62b0:	fff72223          	sw	t6,-28(a4)
    62b4:	40e606b3          	sub	a3,a2,a4
    62b8:	ffe72423          	sw	t5,-24(a4)
    62bc:	ffd72623          	sw	t4,-20(a4)
    62c0:	ffc72823          	sw	t3,-16(a4)
    62c4:	fe672a23          	sw	t1,-12(a4)
    62c8:	ff072c23          	sw	a6,-8(a4)
    62cc:	02458593          	addi	a1,a1,36
    62d0:	fad7c6e3          	blt	a5,a3,627c <memcpy+0x98>
    62d4:	f45ff06f          	j	6218 <memcpy+0x34>
    62d8:	0005c683          	lbu	a3,0(a1)
    62dc:	00170713          	addi	a4,a4,1
    62e0:	00377793          	andi	a5,a4,3
    62e4:	fed70fa3          	sb	a3,-1(a4)
    62e8:	00158593          	addi	a1,a1,1
    62ec:	f0078ee3          	beqz	a5,6208 <memcpy+0x24>
    62f0:	0005c683          	lbu	a3,0(a1)
    62f4:	00170713          	addi	a4,a4,1
    62f8:	00377793          	andi	a5,a4,3
    62fc:	fed70fa3          	sb	a3,-1(a4)
    6300:	00158593          	addi	a1,a1,1
    6304:	fc079ae3          	bnez	a5,62d8 <memcpy+0xf4>
    6308:	f01ff06f          	j	6208 <memcpy+0x24>

0000630c <strcpy>:
    630c:	00b567b3          	or	a5,a0,a1
    6310:	0037f793          	andi	a5,a5,3
    6314:	08079063          	bnez	a5,6394 <strcpy+0x88>
    6318:	0005a703          	lw	a4,0(a1)
    631c:	7f7f86b7          	lui	a3,0x7f7f8
    6320:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <_stack_top+0x6f7f3f7f>
    6324:	00d77833          	and	a6,a4,a3
    6328:	00d80833          	add	a6,a6,a3
    632c:	00e86833          	or	a6,a6,a4
    6330:	00d86833          	or	a6,a6,a3
    6334:	fff00793          	li	a5,-1
    6338:	00050613          	mv	a2,a0
    633c:	02f81463          	bne	a6,a5,6364 <strcpy+0x58>
    6340:	00458593          	addi	a1,a1,4
    6344:	00e62023          	sw	a4,0(a2)
    6348:	0005a703          	lw	a4,0(a1)
    634c:	00460613          	addi	a2,a2,4
    6350:	00d777b3          	and	a5,a4,a3
    6354:	00d787b3          	add	a5,a5,a3
    6358:	00e7e7b3          	or	a5,a5,a4
    635c:	00d7e7b3          	or	a5,a5,a3
    6360:	ff0780e3          	beq	a5,a6,6340 <strcpy+0x34>
    6364:	0005c783          	lbu	a5,0(a1)
    6368:	0015c703          	lbu	a4,1(a1)
    636c:	0025c683          	lbu	a3,2(a1)
    6370:	00f60023          	sb	a5,0(a2)
    6374:	00078a63          	beqz	a5,6388 <strcpy+0x7c>
    6378:	00e600a3          	sb	a4,1(a2)
    637c:	00070663          	beqz	a4,6388 <strcpy+0x7c>
    6380:	00d60123          	sb	a3,2(a2)
    6384:	00069463          	bnez	a3,638c <strcpy+0x80>
    6388:	00008067          	ret
    638c:	000601a3          	sb	zero,3(a2)
    6390:	00008067          	ret
    6394:	00050793          	mv	a5,a0
    6398:	0005c703          	lbu	a4,0(a1)
    639c:	00178793          	addi	a5,a5,1
    63a0:	00158593          	addi	a1,a1,1
    63a4:	fee78fa3          	sb	a4,-1(a5)
    63a8:	fe0718e3          	bnez	a4,6398 <strcpy+0x8c>
    63ac:	00008067          	ret

000063b0 <strcmp>:
    63b0:	00b56733          	or	a4,a0,a1
    63b4:	fff00393          	li	t2,-1
    63b8:	00377713          	andi	a4,a4,3
    63bc:	10071063          	bnez	a4,64bc <strcmp+0x10c>
    63c0:	7f7f87b7          	lui	a5,0x7f7f8
    63c4:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_stack_top+0x6f7f3f7f>
    63c8:	00052603          	lw	a2,0(a0)
    63cc:	0005a683          	lw	a3,0(a1)
    63d0:	00f672b3          	and	t0,a2,a5
    63d4:	00f66333          	or	t1,a2,a5
    63d8:	00f282b3          	add	t0,t0,a5
    63dc:	0062e2b3          	or	t0,t0,t1
    63e0:	10729263          	bne	t0,t2,64e4 <strcmp+0x134>
    63e4:	08d61663          	bne	a2,a3,6470 <strcmp+0xc0>
    63e8:	00452603          	lw	a2,4(a0)
    63ec:	0045a683          	lw	a3,4(a1)
    63f0:	00f672b3          	and	t0,a2,a5
    63f4:	00f66333          	or	t1,a2,a5
    63f8:	00f282b3          	add	t0,t0,a5
    63fc:	0062e2b3          	or	t0,t0,t1
    6400:	0c729e63          	bne	t0,t2,64dc <strcmp+0x12c>
    6404:	06d61663          	bne	a2,a3,6470 <strcmp+0xc0>
    6408:	00852603          	lw	a2,8(a0)
    640c:	0085a683          	lw	a3,8(a1)
    6410:	00f672b3          	and	t0,a2,a5
    6414:	00f66333          	or	t1,a2,a5
    6418:	00f282b3          	add	t0,t0,a5
    641c:	0062e2b3          	or	t0,t0,t1
    6420:	0c729863          	bne	t0,t2,64f0 <strcmp+0x140>
    6424:	04d61663          	bne	a2,a3,6470 <strcmp+0xc0>
    6428:	00c52603          	lw	a2,12(a0)
    642c:	00c5a683          	lw	a3,12(a1)
    6430:	00f672b3          	and	t0,a2,a5
    6434:	00f66333          	or	t1,a2,a5
    6438:	00f282b3          	add	t0,t0,a5
    643c:	0062e2b3          	or	t0,t0,t1
    6440:	0c729263          	bne	t0,t2,6504 <strcmp+0x154>
    6444:	02d61663          	bne	a2,a3,6470 <strcmp+0xc0>
    6448:	01052603          	lw	a2,16(a0)
    644c:	0105a683          	lw	a3,16(a1)
    6450:	00f672b3          	and	t0,a2,a5
    6454:	00f66333          	or	t1,a2,a5
    6458:	00f282b3          	add	t0,t0,a5
    645c:	0062e2b3          	or	t0,t0,t1
    6460:	0a729c63          	bne	t0,t2,6518 <strcmp+0x168>
    6464:	01450513          	addi	a0,a0,20
    6468:	01458593          	addi	a1,a1,20
    646c:	f4d60ee3          	beq	a2,a3,63c8 <strcmp+0x18>
    6470:	01061713          	slli	a4,a2,0x10
    6474:	01069793          	slli	a5,a3,0x10
    6478:	00f71e63          	bne	a4,a5,6494 <strcmp+0xe4>
    647c:	01065713          	srli	a4,a2,0x10
    6480:	0106d793          	srli	a5,a3,0x10
    6484:	40f70533          	sub	a0,a4,a5
    6488:	0ff57593          	zext.b	a1,a0
    648c:	02059063          	bnez	a1,64ac <strcmp+0xfc>
    6490:	00008067          	ret
    6494:	01075713          	srli	a4,a4,0x10
    6498:	0107d793          	srli	a5,a5,0x10
    649c:	40f70533          	sub	a0,a4,a5
    64a0:	0ff57593          	zext.b	a1,a0
    64a4:	00059463          	bnez	a1,64ac <strcmp+0xfc>
    64a8:	00008067          	ret
    64ac:	0ff77713          	zext.b	a4,a4
    64b0:	0ff7f793          	zext.b	a5,a5
    64b4:	40f70533          	sub	a0,a4,a5
    64b8:	00008067          	ret
    64bc:	00054603          	lbu	a2,0(a0)
    64c0:	0005c683          	lbu	a3,0(a1)
    64c4:	00150513          	addi	a0,a0,1
    64c8:	00158593          	addi	a1,a1,1
    64cc:	00d61463          	bne	a2,a3,64d4 <strcmp+0x124>
    64d0:	fe0616e3          	bnez	a2,64bc <strcmp+0x10c>
    64d4:	40d60533          	sub	a0,a2,a3
    64d8:	00008067          	ret
    64dc:	00450513          	addi	a0,a0,4
    64e0:	00458593          	addi	a1,a1,4
    64e4:	fcd61ce3          	bne	a2,a3,64bc <strcmp+0x10c>
    64e8:	00000513          	li	a0,0
    64ec:	00008067          	ret
    64f0:	00850513          	addi	a0,a0,8
    64f4:	00858593          	addi	a1,a1,8
    64f8:	fcd612e3          	bne	a2,a3,64bc <strcmp+0x10c>
    64fc:	00000513          	li	a0,0
    6500:	00008067          	ret
    6504:	00c50513          	addi	a0,a0,12
    6508:	00c58593          	addi	a1,a1,12
    650c:	fad618e3          	bne	a2,a3,64bc <strcmp+0x10c>
    6510:	00000513          	li	a0,0
    6514:	00008067          	ret
    6518:	01050513          	addi	a0,a0,16
    651c:	01058593          	addi	a1,a1,16
    6520:	f8d61ee3          	bne	a2,a3,64bc <strcmp+0x10c>
    6524:	00000513          	li	a0,0
    6528:	00008067          	ret

0000652c <frexp>:
    652c:	80000837          	lui	a6,0x80000
    6530:	fff80813          	addi	a6,a6,-1 # 7fffffff <_stack_top+0x6fffbfff>
    6534:	00062023          	sw	zero,0(a2)
    6538:	00b876b3          	and	a3,a6,a1
    653c:	7ff008b7          	lui	a7,0x7ff00
    6540:	00058793          	mv	a5,a1
    6544:	00050713          	mv	a4,a0
    6548:	0916fc63          	bgeu	a3,a7,65e0 <frexp+0xb4>
    654c:	00a6e8b3          	or	a7,a3,a0
    6550:	08088863          	beqz	a7,65e0 <frexp+0xb4>
    6554:	fe010113          	addi	sp,sp,-32
    6558:	0145de13          	srli	t3,a1,0x14
    655c:	00112e23          	sw	ra,28(sp)
    6560:	7ffe7e13          	andi	t3,t3,2047
    6564:	00060893          	mv	a7,a2
    6568:	00058313          	mv	t1,a1
    656c:	00000613          	li	a2,0
    6570:	020e1c63          	bnez	t3,65a8 <frexp+0x7c>
    6574:	0000d797          	auipc	a5,0xd
    6578:	0dc78793          	addi	a5,a5,220 # 13650 <__clz_tab+0x120>
    657c:	0007a603          	lw	a2,0(a5)
    6580:	0047a683          	lw	a3,4(a5)
    6584:	01112623          	sw	a7,12(sp)
    6588:	74c0a0ef          	jal	10cd4 <__muldf3>
    658c:	80000737          	lui	a4,0x80000
    6590:	00c12883          	lw	a7,12(sp)
    6594:	fff70813          	addi	a6,a4,-1 # 7fffffff <_stack_top+0x6fffbfff>
    6598:	00b876b3          	and	a3,a6,a1
    659c:	00058313          	mv	t1,a1
    65a0:	00050713          	mv	a4,a0
    65a4:	fca00613          	li	a2,-54
    65a8:	4146d693          	srai	a3,a3,0x14
    65ac:	801007b7          	lui	a5,0x80100
    65b0:	01c12083          	lw	ra,28(sp)
    65b4:	fff78793          	addi	a5,a5,-1 # 800fffff <_stack_top+0x700fbfff>
    65b8:	c0268693          	addi	a3,a3,-1022
    65bc:	00f37333          	and	t1,t1,a5
    65c0:	00c686b3          	add	a3,a3,a2
    65c4:	3fe007b7          	lui	a5,0x3fe00
    65c8:	00f367b3          	or	a5,t1,a5
    65cc:	00d8a023          	sw	a3,0(a7) # 7ff00000 <_stack_top+0x6fefc000>
    65d0:	00070513          	mv	a0,a4
    65d4:	00078593          	mv	a1,a5
    65d8:	02010113          	addi	sp,sp,32
    65dc:	00008067          	ret
    65e0:	00070513          	mv	a0,a4
    65e4:	00078593          	mv	a1,a5
    65e8:	00008067          	ret

000065ec <quorem>:
    65ec:	fb010113          	addi	sp,sp,-80
    65f0:	04912223          	sw	s1,68(sp)
    65f4:	01052783          	lw	a5,16(a0)
    65f8:	0105a483          	lw	s1,16(a1)
    65fc:	04112623          	sw	ra,76(sp)
    6600:	2097ce63          	blt	a5,s1,681c <quorem+0x230>
    6604:	fff48493          	addi	s1,s1,-1
    6608:	03612823          	sw	s6,48(sp)
    660c:	03712623          	sw	s7,44(sp)
    6610:	00249b13          	slli	s6,s1,0x2
    6614:	01458b93          	addi	s7,a1,20
    6618:	05212023          	sw	s2,64(sp)
    661c:	03312e23          	sw	s3,60(sp)
    6620:	016b8933          	add	s2,s7,s6
    6624:	01450993          	addi	s3,a0,20
    6628:	03512a23          	sw	s5,52(sp)
    662c:	01698b33          	add	s6,s3,s6
    6630:	00092a83          	lw	s5,0(s2)
    6634:	03812423          	sw	s8,40(sp)
    6638:	000b2c03          	lw	s8,0(s6)
    663c:	001a8a93          	addi	s5,s5,1
    6640:	03412c23          	sw	s4,56(sp)
    6644:	00b12623          	sw	a1,12(sp)
    6648:	00050a13          	mv	s4,a0
    664c:	000a8593          	mv	a1,s5
    6650:	000c0513          	mv	a0,s8
    6654:	04812423          	sw	s0,72(sp)
    6658:	0c40c0ef          	jal	1271c <__hidden___udivsi3>
    665c:	00050413          	mv	s0,a0
    6660:	0f5c6063          	bltu	s8,s5,6740 <quorem+0x154>
    6664:	03912223          	sw	s9,36(sp)
    6668:	03a12023          	sw	s10,32(sp)
    666c:	01b12e23          	sw	s11,28(sp)
    6670:	000b8d13          	mv	s10,s7
    6674:	00098c93          	mv	s9,s3
    6678:	00000c13          	li	s8,0
    667c:	00000a93          	li	s5,0
    6680:	000d2d83          	lw	s11,0(s10)
    6684:	00040593          	mv	a1,s0
    6688:	004c8c93          	addi	s9,s9,4
    668c:	010d9513          	slli	a0,s11,0x10
    6690:	01055513          	srli	a0,a0,0x10
    6694:	05c0c0ef          	jal	126f0 <__mulsi3>
    6698:	01850c33          	add	s8,a0,s8
    669c:	00040593          	mv	a1,s0
    66a0:	010dd513          	srli	a0,s11,0x10
    66a4:	04c0c0ef          	jal	126f0 <__mulsi3>
    66a8:	ffcca683          	lw	a3,-4(s9)
    66ac:	010c1793          	slli	a5,s8,0x10
    66b0:	0107d793          	srli	a5,a5,0x10
    66b4:	01069713          	slli	a4,a3,0x10
    66b8:	010c5c13          	srli	s8,s8,0x10
    66bc:	01075713          	srli	a4,a4,0x10
    66c0:	01850533          	add	a0,a0,s8
    66c4:	40f70733          	sub	a4,a4,a5
    66c8:	01570733          	add	a4,a4,s5
    66cc:	01051613          	slli	a2,a0,0x10
    66d0:	41075793          	srai	a5,a4,0x10
    66d4:	01065613          	srli	a2,a2,0x10
    66d8:	0106d693          	srli	a3,a3,0x10
    66dc:	40c787b3          	sub	a5,a5,a2
    66e0:	00d787b3          	add	a5,a5,a3
    66e4:	01071713          	slli	a4,a4,0x10
    66e8:	01075713          	srli	a4,a4,0x10
    66ec:	01079693          	slli	a3,a5,0x10
    66f0:	00e6e733          	or	a4,a3,a4
    66f4:	004d0d13          	addi	s10,s10,4
    66f8:	feecae23          	sw	a4,-4(s9)
    66fc:	01055c13          	srli	s8,a0,0x10
    6700:	4107da93          	srai	s5,a5,0x10
    6704:	f7a97ee3          	bgeu	s2,s10,6680 <quorem+0x94>
    6708:	000b2783          	lw	a5,0(s6)
    670c:	12079263          	bnez	a5,6830 <quorem+0x244>
    6710:	ffcb0b13          	addi	s6,s6,-4
    6714:	0169e863          	bltu	s3,s6,6724 <quorem+0x138>
    6718:	0180006f          	j	6730 <quorem+0x144>
    671c:	fff48493          	addi	s1,s1,-1
    6720:	0169f863          	bgeu	s3,s6,6730 <quorem+0x144>
    6724:	000b2783          	lw	a5,0(s6)
    6728:	ffcb0b13          	addi	s6,s6,-4
    672c:	fe0788e3          	beqz	a5,671c <quorem+0x130>
    6730:	02412c83          	lw	s9,36(sp)
    6734:	02012d03          	lw	s10,32(sp)
    6738:	01c12d83          	lw	s11,28(sp)
    673c:	009a2823          	sw	s1,16(s4)
    6740:	00c12583          	lw	a1,12(sp)
    6744:	000a0513          	mv	a0,s4
    6748:	511030ef          	jal	a458 <__mcmp>
    674c:	08054e63          	bltz	a0,67e8 <quorem+0x1fc>
    6750:	00140413          	addi	s0,s0,1
    6754:	00098593          	mv	a1,s3
    6758:	00000793          	li	a5,0
    675c:	0005a683          	lw	a3,0(a1)
    6760:	000ba603          	lw	a2,0(s7)
    6764:	00458593          	addi	a1,a1,4
    6768:	01069713          	slli	a4,a3,0x10
    676c:	01061513          	slli	a0,a2,0x10
    6770:	01055513          	srli	a0,a0,0x10
    6774:	01075713          	srli	a4,a4,0x10
    6778:	40a70733          	sub	a4,a4,a0
    677c:	00f70733          	add	a4,a4,a5
    6780:	41075793          	srai	a5,a4,0x10
    6784:	01065613          	srli	a2,a2,0x10
    6788:	0106d693          	srli	a3,a3,0x10
    678c:	40c787b3          	sub	a5,a5,a2
    6790:	00d787b3          	add	a5,a5,a3
    6794:	01071713          	slli	a4,a4,0x10
    6798:	01079693          	slli	a3,a5,0x10
    679c:	01075713          	srli	a4,a4,0x10
    67a0:	00e6e733          	or	a4,a3,a4
    67a4:	004b8b93          	addi	s7,s7,4
    67a8:	fee5ae23          	sw	a4,-4(a1)
    67ac:	4107d793          	srai	a5,a5,0x10
    67b0:	fb7976e3          	bgeu	s2,s7,675c <quorem+0x170>
    67b4:	00249793          	slli	a5,s1,0x2
    67b8:	00f987b3          	add	a5,s3,a5
    67bc:	0007a703          	lw	a4,0(a5) # 3fe00000 <_stack_top+0x2fdfc000>
    67c0:	02071463          	bnez	a4,67e8 <quorem+0x1fc>
    67c4:	ffc78793          	addi	a5,a5,-4
    67c8:	00f9e863          	bltu	s3,a5,67d8 <quorem+0x1ec>
    67cc:	0180006f          	j	67e4 <quorem+0x1f8>
    67d0:	fff48493          	addi	s1,s1,-1
    67d4:	00f9f863          	bgeu	s3,a5,67e4 <quorem+0x1f8>
    67d8:	0007a703          	lw	a4,0(a5)
    67dc:	ffc78793          	addi	a5,a5,-4
    67e0:	fe0708e3          	beqz	a4,67d0 <quorem+0x1e4>
    67e4:	009a2823          	sw	s1,16(s4)
    67e8:	04c12083          	lw	ra,76(sp)
    67ec:	00040513          	mv	a0,s0
    67f0:	04812403          	lw	s0,72(sp)
    67f4:	04012903          	lw	s2,64(sp)
    67f8:	03c12983          	lw	s3,60(sp)
    67fc:	03812a03          	lw	s4,56(sp)
    6800:	03412a83          	lw	s5,52(sp)
    6804:	03012b03          	lw	s6,48(sp)
    6808:	02c12b83          	lw	s7,44(sp)
    680c:	02812c03          	lw	s8,40(sp)
    6810:	04412483          	lw	s1,68(sp)
    6814:	05010113          	addi	sp,sp,80
    6818:	00008067          	ret
    681c:	04c12083          	lw	ra,76(sp)
    6820:	04412483          	lw	s1,68(sp)
    6824:	00000513          	li	a0,0
    6828:	05010113          	addi	sp,sp,80
    682c:	00008067          	ret
    6830:	00c12583          	lw	a1,12(sp)
    6834:	000a0513          	mv	a0,s4
    6838:	02412c83          	lw	s9,36(sp)
    683c:	02012d03          	lw	s10,32(sp)
    6840:	01c12d83          	lw	s11,28(sp)
    6844:	415030ef          	jal	a458 <__mcmp>
    6848:	f00554e3          	bgez	a0,6750 <quorem+0x164>
    684c:	f9dff06f          	j	67e8 <quorem+0x1fc>

00006850 <_dtoa_r>:
    6850:	03852303          	lw	t1,56(a0)
    6854:	f4010113          	addi	sp,sp,-192
    6858:	0a812c23          	sw	s0,184(sp)
    685c:	0a912a23          	sw	s1,180(sp)
    6860:	0b212823          	sw	s2,176(sp)
    6864:	0b612023          	sw	s6,160(sp)
    6868:	09712e23          	sw	s7,156(sp)
    686c:	09812c23          	sw	s8,152(sp)
    6870:	09a12823          	sw	s10,144(sp)
    6874:	0a112e23          	sw	ra,188(sp)
    6878:	0b312623          	sw	s3,172(sp)
    687c:	00e12823          	sw	a4,16(sp)
    6880:	00f12623          	sw	a5,12(sp)
    6884:	02b12223          	sw	a1,36(sp)
    6888:	00050413          	mv	s0,a0
    688c:	00058b13          	mv	s6,a1
    6890:	00060493          	mv	s1,a2
    6894:	00068b93          	mv	s7,a3
    6898:	00080913          	mv	s2,a6
    689c:	00088d13          	mv	s10,a7
    68a0:	00060c13          	mv	s8,a2
    68a4:	02030263          	beqz	t1,68c8 <_dtoa_r+0x78>
    68a8:	03c52703          	lw	a4,60(a0)
    68ac:	00100793          	li	a5,1
    68b0:	00030593          	mv	a1,t1
    68b4:	00e797b3          	sll	a5,a5,a4
    68b8:	00e32223          	sw	a4,4(t1)
    68bc:	00f32423          	sw	a5,8(t1)
    68c0:	090030ef          	jal	9950 <_Bfree>
    68c4:	02042c23          	sw	zero,56(s0)
    68c8:	00048993          	mv	s3,s1
    68cc:	00000713          	li	a4,0
    68d0:	0004da63          	bgez	s1,68e4 <_dtoa_r+0x94>
    68d4:	00149493          	slli	s1,s1,0x1
    68d8:	0014dc13          	srli	s8,s1,0x1
    68dc:	000c0993          	mv	s3,s8
    68e0:	00100713          	li	a4,1
    68e4:	7ff007b7          	lui	a5,0x7ff00
    68e8:	00e92023          	sw	a4,0(s2)
    68ec:	00f9f733          	and	a4,s3,a5
    68f0:	38f70c63          	beq	a4,a5,6c88 <_dtoa_r+0x438>
    68f4:	000b0513          	mv	a0,s6
    68f8:	000c0593          	mv	a1,s8
    68fc:	00000613          	li	a2,0
    6900:	00000693          	li	a3,0
    6904:	0b412423          	sw	s4,168(sp)
    6908:	03612023          	sw	s6,32(sp)
    690c:	000b0a13          	mv	s4,s6
    6910:	01812e23          	sw	s8,28(sp)
    6914:	1080a0ef          	jal	10a1c <__eqdf2>
    6918:	04051e63          	bnez	a0,6974 <_dtoa_r+0x124>
    691c:	00c12703          	lw	a4,12(sp)
    6920:	00100793          	li	a5,1
    6924:	00f72023          	sw	a5,0(a4)
    6928:	000d0863          	beqz	s10,6938 <_dtoa_r+0xe8>
    692c:	0000c797          	auipc	a5,0xc
    6930:	fa578793          	addi	a5,a5,-91 # 128d1 <__clzsi2+0x109>
    6934:	00fd2023          	sw	a5,0(s10)
    6938:	0a812a03          	lw	s4,168(sp)
    693c:	0000c917          	auipc	s2,0xc
    6940:	f9490913          	addi	s2,s2,-108 # 128d0 <__clzsi2+0x108>
    6944:	0bc12083          	lw	ra,188(sp)
    6948:	0b812403          	lw	s0,184(sp)
    694c:	0b412483          	lw	s1,180(sp)
    6950:	0ac12983          	lw	s3,172(sp)
    6954:	0a012b03          	lw	s6,160(sp)
    6958:	09c12b83          	lw	s7,156(sp)
    695c:	09812c03          	lw	s8,152(sp)
    6960:	09012d03          	lw	s10,144(sp)
    6964:	00090513          	mv	a0,s2
    6968:	0b012903          	lw	s2,176(sp)
    696c:	0c010113          	addi	sp,sp,192
    6970:	00008067          	ret
    6974:	000b0593          	mv	a1,s6
    6978:	000c0613          	mv	a2,s8
    697c:	07810713          	addi	a4,sp,120
    6980:	07c10693          	addi	a3,sp,124
    6984:	00040513          	mv	a0,s0
    6988:	09b12623          	sw	s11,140(sp)
    698c:	0b512223          	sw	s5,164(sp)
    6990:	09912a23          	sw	s9,148(sp)
    6994:	0149d913          	srli	s2,s3,0x14
    6998:	6d1030ef          	jal	a868 <__d2b>
    699c:	00050493          	mv	s1,a0
    69a0:	07812d83          	lw	s11,120(sp)
    69a4:	32091063          	bnez	s2,6cc4 <_dtoa_r+0x474>
    69a8:	07c12903          	lw	s2,124(sp)
    69ac:	02000793          	li	a5,32
    69b0:	012d8933          	add	s2,s11,s2
    69b4:	43290713          	addi	a4,s2,1074
    69b8:	62e7da63          	bge	a5,a4,6fec <_dtoa_r+0x79c>
    69bc:	04000793          	li	a5,64
    69c0:	40e787b3          	sub	a5,a5,a4
    69c4:	41290513          	addi	a0,s2,1042
    69c8:	00f999b3          	sll	s3,s3,a5
    69cc:	00ab5533          	srl	a0,s6,a0
    69d0:	00a9e533          	or	a0,s3,a0
    69d4:	0ad0b0ef          	jal	12280 <__floatunsidf>
    69d8:	fe1007b7          	lui	a5,0xfe100
    69dc:	fff90913          	addi	s2,s2,-1
    69e0:	00050a13          	mv	s4,a0
    69e4:	00b787b3          	add	a5,a5,a1
    69e8:	00100c93          	li	s9,1
    69ec:	00078593          	mv	a1,a5
    69f0:	0000d797          	auipc	a5,0xd
    69f4:	c6878793          	addi	a5,a5,-920 # 13658 <__clz_tab+0x128>
    69f8:	0007a603          	lw	a2,0(a5)
    69fc:	0047a683          	lw	a3,4(a5)
    6a00:	000a0513          	mv	a0,s4
    6a04:	37d0a0ef          	jal	11580 <__subdf3>
    6a08:	0000d797          	auipc	a5,0xd
    6a0c:	c5878793          	addi	a5,a5,-936 # 13660 <__clz_tab+0x130>
    6a10:	0007a603          	lw	a2,0(a5)
    6a14:	0047a683          	lw	a3,4(a5)
    6a18:	2bc0a0ef          	jal	10cd4 <__muldf3>
    6a1c:	0000d797          	auipc	a5,0xd
    6a20:	c4c78793          	addi	a5,a5,-948 # 13668 <__clz_tab+0x138>
    6a24:	0007a603          	lw	a2,0(a5)
    6a28:	0047a683          	lw	a3,4(a5)
    6a2c:	17d080ef          	jal	f3a8 <__adddf3>
    6a30:	00050a13          	mv	s4,a0
    6a34:	00090513          	mv	a0,s2
    6a38:	00058a93          	mv	s5,a1
    6a3c:	7640b0ef          	jal	121a0 <__floatsidf>
    6a40:	0000d797          	auipc	a5,0xd
    6a44:	c3078793          	addi	a5,a5,-976 # 13670 <__clz_tab+0x140>
    6a48:	0007a603          	lw	a2,0(a5)
    6a4c:	0047a683          	lw	a3,4(a5)
    6a50:	2840a0ef          	jal	10cd4 <__muldf3>
    6a54:	00050613          	mv	a2,a0
    6a58:	00058693          	mv	a3,a1
    6a5c:	000a0513          	mv	a0,s4
    6a60:	000a8593          	mv	a1,s5
    6a64:	145080ef          	jal	f3a8 <__adddf3>
    6a68:	00050a13          	mv	s4,a0
    6a6c:	00058a93          	mv	s5,a1
    6a70:	6b00b0ef          	jal	12120 <__fixdfsi>
    6a74:	00050993          	mv	s3,a0
    6a78:	00000613          	li	a2,0
    6a7c:	00000693          	li	a3,0
    6a80:	000a0513          	mv	a0,s4
    6a84:	000a8593          	mv	a1,s5
    6a88:	1340a0ef          	jal	10bbc <__ledf2>
    6a8c:	02055063          	bgez	a0,6aac <_dtoa_r+0x25c>
    6a90:	00098513          	mv	a0,s3
    6a94:	70c0b0ef          	jal	121a0 <__floatsidf>
    6a98:	000a0613          	mv	a2,s4
    6a9c:	000a8693          	mv	a3,s5
    6aa0:	77d090ef          	jal	10a1c <__eqdf2>
    6aa4:	00a03533          	snez	a0,a0
    6aa8:	40a989b3          	sub	s3,s3,a0
    6aac:	412d8933          	sub	s2,s11,s2
    6ab0:	01600793          	li	a5,22
    6ab4:	fff90a13          	addi	s4,s2,-1
    6ab8:	2537e463          	bltu	a5,s3,6d00 <_dtoa_r+0x4b0>
    6abc:	0000c817          	auipc	a6,0xc
    6ac0:	6dc80813          	addi	a6,a6,1756 # 13198 <__mprec_tens>
    6ac4:	00399793          	slli	a5,s3,0x3
    6ac8:	00f807b3          	add	a5,a6,a5
    6acc:	02012503          	lw	a0,32(sp)
    6ad0:	01c12583          	lw	a1,28(sp)
    6ad4:	0007a603          	lw	a2,0(a5)
    6ad8:	0047a683          	lw	a3,4(a5)
    6adc:	0e00a0ef          	jal	10bbc <__ledf2>
    6ae0:	50054c63          	bltz	a0,6ff8 <_dtoa_r+0x7a8>
    6ae4:	01204463          	bgtz	s2,6aec <_dtoa_r+0x29c>
    6ae8:	2380106f          	j	7d20 <_dtoa_r+0x14d0>
    6aec:	013a0a33          	add	s4,s4,s3
    6af0:	03312623          	sw	s3,44(sp)
    6af4:	02012c23          	sw	zero,56(sp)
    6af8:	00012c23          	sw	zero,24(sp)
    6afc:	02012423          	sw	zero,40(sp)
    6b00:	00900793          	li	a5,9
    6b04:	2377e863          	bltu	a5,s7,6d34 <_dtoa_r+0x4e4>
    6b08:	00500793          	li	a5,5
    6b0c:	4b77da63          	bge	a5,s7,6fc0 <_dtoa_r+0x770>
    6b10:	ffcb8b93          	addi	s7,s7,-4
    6b14:	00400713          	li	a4,4
    6b18:	00eb9463          	bne	s7,a4,6b20 <_dtoa_r+0x2d0>
    6b1c:	40c0106f          	j	7f28 <_dtoa_r+0x16d8>
    6b20:	7afb8463          	beq	s7,a5,72c8 <_dtoa_r+0xa78>
    6b24:	00200793          	li	a5,2
    6b28:	00000a93          	li	s5,0
    6b2c:	00fb9463          	bne	s7,a5,6b34 <_dtoa_r+0x2e4>
    6b30:	1b40106f          	j	7ce4 <_dtoa_r+0x1494>
    6b34:	00300b93          	li	s7,3
    6b38:	04012023          	sw	zero,64(sp)
    6b3c:	01012783          	lw	a5,16(sp)
    6b40:	013787b3          	add	a5,a5,s3
    6b44:	00178c93          	addi	s9,a5,1
    6b48:	04f12423          	sw	a5,72(sp)
    6b4c:	000c8613          	mv	a2,s9
    6b50:	01904463          	bgtz	s9,6b58 <_dtoa_r+0x308>
    6b54:	00100613          	li	a2,1
    6b58:	01700693          	li	a3,23
    6b5c:	00100713          	li	a4,1
    6b60:	00400793          	li	a5,4
    6b64:	00c6c463          	blt	a3,a2,6b6c <_dtoa_r+0x31c>
    6b68:	5cc0106f          	j	8134 <_dtoa_r+0x18e4>
    6b6c:	00179793          	slli	a5,a5,0x1
    6b70:	01478693          	addi	a3,a5,20
    6b74:	00070593          	mv	a1,a4
    6b78:	00170713          	addi	a4,a4,1
    6b7c:	fed678e3          	bgeu	a2,a3,6b6c <_dtoa_r+0x31c>
    6b80:	02b42e23          	sw	a1,60(s0)
    6b84:	00040513          	mv	a0,s0
    6b88:	51d020ef          	jal	98a4 <_Balloc>
    6b8c:	00050913          	mv	s2,a0
    6b90:	00051463          	bnez	a0,6b98 <_dtoa_r+0x348>
    6b94:	48c0106f          	j	8020 <_dtoa_r+0x17d0>
    6b98:	02a42c23          	sw	a0,56(s0)
    6b9c:	00fcb793          	sltiu	a5,s9,15
    6ba0:	2c0784e3          	beqz	a5,7668 <_dtoa_r+0xe18>
    6ba4:	2c0a82e3          	beqz	s5,7668 <_dtoa_r+0xe18>
    6ba8:	353052e3          	blez	s3,76ec <_dtoa_r+0xe9c>
    6bac:	00f9f793          	andi	a5,s3,15
    6bb0:	0000c817          	auipc	a6,0xc
    6bb4:	5e880813          	addi	a6,a6,1512 # 13198 <__mprec_tens>
    6bb8:	00379793          	slli	a5,a5,0x3
    6bbc:	4049da93          	srai	s5,s3,0x4
    6bc0:	00f807b3          	add	a5,a6,a5
    6bc4:	010af693          	andi	a3,s5,16
    6bc8:	0007a803          	lw	a6,0(a5)
    6bcc:	0047a703          	lw	a4,4(a5)
    6bd0:	460688e3          	beqz	a3,7840 <_dtoa_r+0xff0>
    6bd4:	0000c797          	auipc	a5,0xc
    6bd8:	59c78793          	addi	a5,a5,1436 # 13170 <__mprec_bigtens>
    6bdc:	0207a603          	lw	a2,32(a5)
    6be0:	0247a683          	lw	a3,36(a5)
    6be4:	02012503          	lw	a0,32(sp)
    6be8:	01c12583          	lw	a1,28(sp)
    6bec:	04e12623          	sw	a4,76(sp)
    6bf0:	03012823          	sw	a6,48(sp)
    6bf4:	308090ef          	jal	fefc <__divdf3>
    6bf8:	00300713          	li	a4,3
    6bfc:	02e12e23          	sw	a4,60(sp)
    6c00:	03012803          	lw	a6,48(sp)
    6c04:	04c12703          	lw	a4,76(sp)
    6c08:	00fafa93          	andi	s5,s5,15
    6c0c:	00050313          	mv	t1,a0
    6c10:	00058793          	mv	a5,a1
    6c14:	720a8063          	beqz	s5,7334 <_dtoa_r+0xae4>
    6c18:	02912823          	sw	s1,48(sp)
    6c1c:	04812623          	sw	s0,76(sp)
    6c20:	0000c497          	auipc	s1,0xc
    6c24:	55048493          	addi	s1,s1,1360 # 13170 <__mprec_bigtens>
    6c28:	000a8413          	mv	s0,s5
    6c2c:	04612823          	sw	t1,80(sp)
    6c30:	03c12a83          	lw	s5,60(sp)
    6c34:	00078d93          	mv	s11,a5
    6c38:	00070593          	mv	a1,a4
    6c3c:	00c0006f          	j	6c48 <_dtoa_r+0x3f8>
    6c40:	40145413          	srai	s0,s0,0x1
    6c44:	00848493          	addi	s1,s1,8
    6c48:	00147713          	andi	a4,s0,1
    6c4c:	00071a63          	bnez	a4,6c60 <_dtoa_r+0x410>
    6c50:	40145413          	srai	s0,s0,0x1
    6c54:	00848493          	addi	s1,s1,8
    6c58:	00147713          	andi	a4,s0,1
    6c5c:	fe0702e3          	beqz	a4,6c40 <_dtoa_r+0x3f0>
    6c60:	0004a603          	lw	a2,0(s1)
    6c64:	0044a683          	lw	a3,4(s1)
    6c68:	00080513          	mv	a0,a6
    6c6c:	40145413          	srai	s0,s0,0x1
    6c70:	0640a0ef          	jal	10cd4 <__muldf3>
    6c74:	001a8a93          	addi	s5,s5,1
    6c78:	00050813          	mv	a6,a0
    6c7c:	6a040063          	beqz	s0,731c <_dtoa_r+0xacc>
    6c80:	00848493          	addi	s1,s1,8
    6c84:	fd5ff06f          	j	6c58 <_dtoa_r+0x408>
    6c88:	00c12683          	lw	a3,12(sp)
    6c8c:	00c99793          	slli	a5,s3,0xc
    6c90:	00002737          	lui	a4,0x2
    6c94:	00c7d793          	srli	a5,a5,0xc
    6c98:	70f70713          	addi	a4,a4,1807 # 270f <_vfprintf_r+0x2017>
    6c9c:	0167e7b3          	or	a5,a5,s6
    6ca0:	00e6a023          	sw	a4,0(a3)
    6ca4:	04078063          	beqz	a5,6ce4 <_dtoa_r+0x494>
    6ca8:	0000c917          	auipc	s2,0xc
    6cac:	d7490913          	addi	s2,s2,-652 # 12a1c <__clzsi2+0x254>
    6cb0:	c80d0ae3          	beqz	s10,6944 <_dtoa_r+0xf4>
    6cb4:	0000c797          	auipc	a5,0xc
    6cb8:	d6b78793          	addi	a5,a5,-661 # 12a1f <__clzsi2+0x257>
    6cbc:	00fd2023          	sw	a5,0(s10)
    6cc0:	c85ff06f          	j	6944 <_dtoa_r+0xf4>
    6cc4:	01c12783          	lw	a5,28(sp)
    6cc8:	3ff00737          	lui	a4,0x3ff00
    6ccc:	c0190913          	addi	s2,s2,-1023
    6cd0:	00c79793          	slli	a5,a5,0xc
    6cd4:	00c7d793          	srli	a5,a5,0xc
    6cd8:	00e7e7b3          	or	a5,a5,a4
    6cdc:	00000c93          	li	s9,0
    6ce0:	d0dff06f          	j	69ec <_dtoa_r+0x19c>
    6ce4:	0000c917          	auipc	s2,0xc
    6ce8:	d2c90913          	addi	s2,s2,-724 # 12a10 <__clzsi2+0x248>
    6cec:	0000c797          	auipc	a5,0xc
    6cf0:	d2c78793          	addi	a5,a5,-724 # 12a18 <__clzsi2+0x250>
    6cf4:	c40d08e3          	beqz	s10,6944 <_dtoa_r+0xf4>
    6cf8:	00fd2023          	sw	a5,0(s10)
    6cfc:	c49ff06f          	j	6944 <_dtoa_r+0xf4>
    6d00:	00100793          	li	a5,1
    6d04:	02f12c23          	sw	a5,56(sp)
    6d08:	00012c23          	sw	zero,24(sp)
    6d0c:	280a4a63          	bltz	s4,6fa0 <_dtoa_r+0x750>
    6d10:	2a09d263          	bgez	s3,6fb4 <_dtoa_r+0x764>
    6d14:	01812783          	lw	a5,24(sp)
    6d18:	02012623          	sw	zero,44(sp)
    6d1c:	413787b3          	sub	a5,a5,s3
    6d20:	00f12c23          	sw	a5,24(sp)
    6d24:	413007b3          	neg	a5,s3
    6d28:	02f12423          	sw	a5,40(sp)
    6d2c:	00900793          	li	a5,9
    6d30:	dd77fce3          	bgeu	a5,s7,6b08 <_dtoa_r+0x2b8>
    6d34:	00000b93          	li	s7,0
    6d38:	02042e23          	sw	zero,60(s0)
    6d3c:	00000593          	li	a1,0
    6d40:	00040513          	mv	a0,s0
    6d44:	361020ef          	jal	98a4 <_Balloc>
    6d48:	00050913          	mv	s2,a0
    6d4c:	00051463          	bnez	a0,6d54 <_dtoa_r+0x504>
    6d50:	2d00106f          	j	8020 <_dtoa_r+0x17d0>
    6d54:	03242c23          	sw	s2,56(s0)
    6d58:	00f9a793          	slti	a5,s3,15
    6d5c:	07c12703          	lw	a4,124(sp)
    6d60:	00078463          	beqz	a5,6d68 <_dtoa_r+0x518>
    6d64:	2a075063          	bgez	a4,7004 <_dtoa_r+0x7b4>
    6d68:	520c9463          	bnez	s9,7290 <_dtoa_r+0xa40>
    6d6c:	07812783          	lw	a5,120(sp)
    6d70:	03600713          	li	a4,54
    6d74:	fff00c93          	li	s9,-1
    6d78:	40f70733          	sub	a4,a4,a5
    6d7c:	01812783          	lw	a5,24(sp)
    6d80:	00ea0a33          	add	s4,s4,a4
    6d84:	05912423          	sw	s9,72(sp)
    6d88:	00e78733          	add	a4,a5,a4
    6d8c:	02812783          	lw	a5,40(sp)
    6d90:	00012823          	sw	zero,16(sp)
    6d94:	00f12e23          	sw	a5,28(sp)
    6d98:	00100593          	li	a1,1
    6d9c:	00040513          	mv	a0,s0
    6da0:	02e12023          	sw	a4,32(sp)
    6da4:	014030ef          	jal	9db8 <__i2b>
    6da8:	01812783          	lw	a5,24(sp)
    6dac:	02012703          	lw	a4,32(sp)
    6db0:	00050a93          	mv	s5,a0
    6db4:	00079463          	bnez	a5,6dbc <_dtoa_r+0x56c>
    6db8:	0380106f          	j	7df0 <_dtoa_r+0x15a0>
    6dbc:	01404463          	bgtz	s4,6dc4 <_dtoa_r+0x574>
    6dc0:	0300106f          	j	7df0 <_dtoa_r+0x15a0>
    6dc4:	01812683          	lw	a3,24(sp)
    6dc8:	00068793          	mv	a5,a3
    6dcc:	00da5463          	bge	s4,a3,6dd4 <_dtoa_r+0x584>
    6dd0:	000a0793          	mv	a5,s4
    6dd4:	01812683          	lw	a3,24(sp)
    6dd8:	40f70733          	sub	a4,a4,a5
    6ddc:	40fa0a33          	sub	s4,s4,a5
    6de0:	40f686b3          	sub	a3,a3,a5
    6de4:	02812783          	lw	a5,40(sp)
    6de8:	00d12c23          	sw	a3,24(sp)
    6dec:	06078463          	beqz	a5,6e54 <_dtoa_r+0x604>
    6df0:	01c12783          	lw	a5,28(sp)
    6df4:	00079463          	bnez	a5,6dfc <_dtoa_r+0x5ac>
    6df8:	1540106f          	j	7f4c <_dtoa_r+0x16fc>
    6dfc:	00078613          	mv	a2,a5
    6e00:	000a8593          	mv	a1,s5
    6e04:	00040513          	mv	a0,s0
    6e08:	02e12023          	sw	a4,32(sp)
    6e0c:	358030ef          	jal	a164 <__pow5mult>
    6e10:	00048613          	mv	a2,s1
    6e14:	00050593          	mv	a1,a0
    6e18:	00050a93          	mv	s5,a0
    6e1c:	00040513          	mv	a0,s0
    6e20:	068030ef          	jal	9e88 <__multiply>
    6e24:	00048593          	mv	a1,s1
    6e28:	00050493          	mv	s1,a0
    6e2c:	00040513          	mv	a0,s0
    6e30:	321020ef          	jal	9950 <_Bfree>
    6e34:	02812703          	lw	a4,40(sp)
    6e38:	01c12783          	lw	a5,28(sp)
    6e3c:	01c12683          	lw	a3,28(sp)
    6e40:	40f70633          	sub	a2,a4,a5
    6e44:	00070793          	mv	a5,a4
    6e48:	02012703          	lw	a4,32(sp)
    6e4c:	00d78463          	beq	a5,a3,6e54 <_dtoa_r+0x604>
    6e50:	0740106f          	j	7ec4 <_dtoa_r+0x1674>
    6e54:	00100593          	li	a1,1
    6e58:	00040513          	mv	a0,s0
    6e5c:	02e12023          	sw	a4,32(sp)
    6e60:	759020ef          	jal	9db8 <__i2b>
    6e64:	02c12783          	lw	a5,44(sp)
    6e68:	00a12e23          	sw	a0,28(sp)
    6e6c:	02012703          	lw	a4,32(sp)
    6e70:	00078463          	beqz	a5,6e78 <_dtoa_r+0x628>
    6e74:	78d0006f          	j	7e00 <_dtoa_r+0x15b0>
    6e78:	00100793          	li	a5,1
    6e7c:	1d77cce3          	blt	a5,s7,7854 <_dtoa_r+0x1004>
    6e80:	02412683          	lw	a3,36(sp)
    6e84:	1c0698e3          	bnez	a3,7854 <_dtoa_r+0x1004>
    6e88:	00cc1693          	slli	a3,s8,0xc
    6e8c:	1c0694e3          	bnez	a3,7854 <_dtoa_r+0x1004>
    6e90:	014c5693          	srli	a3,s8,0x14
    6e94:	7ff6f693          	andi	a3,a3,2047
    6e98:	1a068ee3          	beqz	a3,7854 <_dtoa_r+0x1004>
    6e9c:	02f12623          	sw	a5,44(sp)
    6ea0:	00170713          	addi	a4,a4,1 # 3ff00001 <_stack_top+0x2fefc001>
    6ea4:	001a0a13          	addi	s4,s4,1
    6ea8:	02f12423          	sw	a5,40(sp)
    6eac:	014787b3          	add	a5,a5,s4
    6eb0:	01f7f793          	andi	a5,a5,31
    6eb4:	020788e3          	beqz	a5,76e4 <_dtoa_r+0xe94>
    6eb8:	01b00693          	li	a3,27
    6ebc:	34f6cce3          	blt	a3,a5,7a14 <_dtoa_r+0x11c4>
    6ec0:	01c00693          	li	a3,28
    6ec4:	40f687b3          	sub	a5,a3,a5
    6ec8:	01812683          	lw	a3,24(sp)
    6ecc:	00f70733          	add	a4,a4,a5
    6ed0:	00fa0a33          	add	s4,s4,a5
    6ed4:	00f686b3          	add	a3,a3,a5
    6ed8:	00d12c23          	sw	a3,24(sp)
    6edc:	26e04863          	bgtz	a4,714c <_dtoa_r+0x8fc>
    6ee0:	01405c63          	blez	s4,6ef8 <_dtoa_r+0x6a8>
    6ee4:	01c12583          	lw	a1,28(sp)
    6ee8:	000a0613          	mv	a2,s4
    6eec:	00040513          	mv	a0,s0
    6ef0:	3e0030ef          	jal	a2d0 <__lshift>
    6ef4:	00a12e23          	sw	a0,28(sp)
    6ef8:	003ba793          	slti	a5,s7,3
    6efc:	0017ca13          	xori	s4,a5,1
    6f00:	03812783          	lw	a5,56(sp)
    6f04:	26079063          	bnez	a5,7164 <_dtoa_r+0x914>
    6f08:	3b904863          	bgtz	s9,72b8 <_dtoa_r+0xa68>
    6f0c:	3a0a0663          	beqz	s4,72b8 <_dtoa_r+0xa68>
    6f10:	080c92e3          	bnez	s9,7794 <_dtoa_r+0xf44>
    6f14:	01c12583          	lw	a1,28(sp)
    6f18:	00000693          	li	a3,0
    6f1c:	00500613          	li	a2,5
    6f20:	00040513          	mv	a0,s0
    6f24:	251020ef          	jal	9974 <__multadd>
    6f28:	00050593          	mv	a1,a0
    6f2c:	00a12e23          	sw	a0,28(sp)
    6f30:	00048513          	mv	a0,s1
    6f34:	524030ef          	jal	a458 <__mcmp>
    6f38:	04a05ee3          	blez	a0,7794 <_dtoa_r+0xf44>
    6f3c:	03100793          	li	a5,49
    6f40:	00198a13          	addi	s4,s3,1
    6f44:	00f90023          	sb	a5,0(s2)
    6f48:	00190b93          	addi	s7,s2,1
    6f4c:	01c12583          	lw	a1,28(sp)
    6f50:	00040513          	mv	a0,s0
    6f54:	001a0a13          	addi	s4,s4,1
    6f58:	1f9020ef          	jal	9950 <_Bfree>
    6f5c:	000a8863          	beqz	s5,6f6c <_dtoa_r+0x71c>
    6f60:	000a8593          	mv	a1,s5
    6f64:	00040513          	mv	a0,s0
    6f68:	1e9020ef          	jal	9950 <_Bfree>
    6f6c:	00048593          	mv	a1,s1
    6f70:	00040513          	mv	a0,s0
    6f74:	1dd020ef          	jal	9950 <_Bfree>
    6f78:	00c12783          	lw	a5,12(sp)
    6f7c:	000b8023          	sb	zero,0(s7)
    6f80:	0147a023          	sw	s4,0(a5)
    6f84:	380d0263          	beqz	s10,7308 <_dtoa_r+0xab8>
    6f88:	0a812a03          	lw	s4,168(sp)
    6f8c:	0a412a83          	lw	s5,164(sp)
    6f90:	09412c83          	lw	s9,148(sp)
    6f94:	08c12d83          	lw	s11,140(sp)
    6f98:	017d2023          	sw	s7,0(s10)
    6f9c:	9a9ff06f          	j	6944 <_dtoa_r+0xf4>
    6fa0:	00100793          	li	a5,1
    6fa4:	412787b3          	sub	a5,a5,s2
    6fa8:	00f12c23          	sw	a5,24(sp)
    6fac:	00000a13          	li	s4,0
    6fb0:	d609c2e3          	bltz	s3,6d14 <_dtoa_r+0x4c4>
    6fb4:	013a0a33          	add	s4,s4,s3
    6fb8:	03312623          	sw	s3,44(sp)
    6fbc:	b41ff06f          	j	6afc <_dtoa_r+0x2ac>
    6fc0:	00400713          	li	a4,4
    6fc4:	00eb9463          	bne	s7,a4,6fcc <_dtoa_r+0x77c>
    6fc8:	7550006f          	j	7f1c <_dtoa_r+0x16cc>
    6fcc:	30fb8663          	beq	s7,a5,72d8 <_dtoa_r+0xa88>
    6fd0:	00200793          	li	a5,2
    6fd4:	50fb86e3          	beq	s7,a5,7ce0 <_dtoa_r+0x1490>
    6fd8:	00300793          	li	a5,3
    6fdc:	04012023          	sw	zero,64(sp)
    6fe0:	00100a93          	li	s5,1
    6fe4:	b4fb8ce3          	beq	s7,a5,6b3c <_dtoa_r+0x2ec>
    6fe8:	d51ff06f          	j	6d38 <_dtoa_r+0x4e8>
    6fec:	40e787b3          	sub	a5,a5,a4
    6ff0:	00fb1533          	sll	a0,s6,a5
    6ff4:	9e1ff06f          	j	69d4 <_dtoa_r+0x184>
    6ff8:	fff98993          	addi	s3,s3,-1
    6ffc:	02012c23          	sw	zero,56(sp)
    7000:	d09ff06f          	j	6d08 <_dtoa_r+0x4b8>
    7004:	0000c797          	auipc	a5,0xc
    7008:	19478793          	addi	a5,a5,404 # 13198 <__mprec_tens>
    700c:	00399713          	slli	a4,s3,0x3
    7010:	00e787b3          	add	a5,a5,a4
    7014:	0007ab03          	lw	s6,0(a5)
    7018:	0047ab83          	lw	s7,4(a5)
    701c:	fff00c93          	li	s9,-1
    7020:	00190a93          	addi	s5,s2,1
    7024:	02012d83          	lw	s11,32(sp)
    7028:	01c12a03          	lw	s4,28(sp)
    702c:	000b0613          	mv	a2,s6
    7030:	000b8693          	mv	a3,s7
    7034:	000d8513          	mv	a0,s11
    7038:	000a0593          	mv	a1,s4
    703c:	6c1080ef          	jal	fefc <__divdf3>
    7040:	0e00b0ef          	jal	12120 <__fixdfsi>
    7044:	00050c13          	mv	s8,a0
    7048:	1580b0ef          	jal	121a0 <__floatsidf>
    704c:	000b0613          	mv	a2,s6
    7050:	000b8693          	mv	a3,s7
    7054:	481090ef          	jal	10cd4 <__muldf3>
    7058:	00058693          	mv	a3,a1
    705c:	00050613          	mv	a2,a0
    7060:	000a0593          	mv	a1,s4
    7064:	000d8513          	mv	a0,s11
    7068:	5180a0ef          	jal	11580 <__subdf3>
    706c:	030c0793          	addi	a5,s8,48
    7070:	00f90023          	sb	a5,0(s2)
    7074:	00100a13          	li	s4,1
    7078:	000a8d93          	mv	s11,s5
    707c:	00050713          	mv	a4,a0
    7080:	0000c697          	auipc	a3,0xc
    7084:	60068693          	addi	a3,a3,1536 # 13680 <__clz_tab+0x150>
    7088:	014c9463          	bne	s9,s4,7090 <_dtoa_r+0x840>
    708c:	72d0006f          	j	7fb8 <_dtoa_r+0x1768>
    7090:	0006a783          	lw	a5,0(a3)
    7094:	0046a803          	lw	a6,4(a3)
    7098:	415a0a33          	sub	s4,s4,s5
    709c:	00f12823          	sw	a5,16(sp)
    70a0:	01012a23          	sw	a6,20(sp)
    70a4:	000c8a93          	mv	s5,s9
    70a8:	00812c23          	sw	s0,24(sp)
    70ac:	00058793          	mv	a5,a1
    70b0:	0600006f          	j	7110 <_dtoa_r+0x8c0>
    70b4:	000b0613          	mv	a2,s6
    70b8:	000b8693          	mv	a3,s7
    70bc:	000c0513          	mv	a0,s8
    70c0:	000c8593          	mv	a1,s9
    70c4:	639080ef          	jal	fefc <__divdf3>
    70c8:	0580b0ef          	jal	12120 <__fixdfsi>
    70cc:	00050413          	mv	s0,a0
    70d0:	0d00b0ef          	jal	121a0 <__floatsidf>
    70d4:	000b0613          	mv	a2,s6
    70d8:	000b8693          	mv	a3,s7
    70dc:	3f9090ef          	jal	10cd4 <__muldf3>
    70e0:	00058693          	mv	a3,a1
    70e4:	00050613          	mv	a2,a0
    70e8:	000c8593          	mv	a1,s9
    70ec:	000c0513          	mv	a0,s8
    70f0:	4900a0ef          	jal	11580 <__subdf3>
    70f4:	001d8d93          	addi	s11,s11,1
    70f8:	03040793          	addi	a5,s0,48
    70fc:	fefd8fa3          	sb	a5,-1(s11)
    7100:	014d86b3          	add	a3,s11,s4
    7104:	00050713          	mv	a4,a0
    7108:	00058793          	mv	a5,a1
    710c:	6b5682e3          	beq	a3,s5,7fb0 <_dtoa_r+0x1760>
    7110:	01012603          	lw	a2,16(sp)
    7114:	01412683          	lw	a3,20(sp)
    7118:	00070513          	mv	a0,a4
    711c:	00078593          	mv	a1,a5
    7120:	3b5090ef          	jal	10cd4 <__muldf3>
    7124:	00000613          	li	a2,0
    7128:	00000693          	li	a3,0
    712c:	00050c13          	mv	s8,a0
    7130:	00058c93          	mv	s9,a1
    7134:	0e9090ef          	jal	10a1c <__eqdf2>
    7138:	f6051ee3          	bnez	a0,70b4 <_dtoa_r+0x864>
    713c:	01812403          	lw	s0,24(sp)
    7140:	00198a13          	addi	s4,s3,1
    7144:	000d8b93          	mv	s7,s11
    7148:	e25ff06f          	j	6f6c <_dtoa_r+0x71c>
    714c:	00048593          	mv	a1,s1
    7150:	00070613          	mv	a2,a4
    7154:	00040513          	mv	a0,s0
    7158:	178030ef          	jal	a2d0 <__lshift>
    715c:	00050493          	mv	s1,a0
    7160:	d81ff06f          	j	6ee0 <_dtoa_r+0x690>
    7164:	01c12583          	lw	a1,28(sp)
    7168:	00048513          	mv	a0,s1
    716c:	2ec030ef          	jal	a458 <__mcmp>
    7170:	d8055ce3          	bgez	a0,6f08 <_dtoa_r+0x6b8>
    7174:	00048593          	mv	a1,s1
    7178:	00000693          	li	a3,0
    717c:	00a00613          	li	a2,10
    7180:	00040513          	mv	a0,s0
    7184:	7f0020ef          	jal	9974 <__multadd>
    7188:	04812783          	lw	a5,72(sp)
    718c:	fff98c13          	addi	s8,s3,-1
    7190:	00050493          	mv	s1,a0
    7194:	0017a793          	slti	a5,a5,1
    7198:	00fa7a33          	and	s4,s4,a5
    719c:	02812783          	lw	a5,40(sp)
    71a0:	080794e3          	bnez	a5,7a28 <_dtoa_r+0x11d8>
    71a4:	000a0463          	beqz	s4,71ac <_dtoa_r+0x95c>
    71a8:	7650006f          	j	810c <_dtoa_r+0x18bc>
    71ac:	04812c83          	lw	s9,72(sp)
    71b0:	00098a13          	mv	s4,s3
    71b4:	000c0993          	mv	s3,s8
    71b8:	01c12b83          	lw	s7,28(sp)
    71bc:	00100b13          	li	s6,1
    71c0:	0200006f          	j	71e0 <_dtoa_r+0x990>
    71c4:	00048593          	mv	a1,s1
    71c8:	00000693          	li	a3,0
    71cc:	00a00613          	li	a2,10
    71d0:	00040513          	mv	a0,s0
    71d4:	7a0020ef          	jal	9974 <__multadd>
    71d8:	001b0b13          	addi	s6,s6,1
    71dc:	00050493          	mv	s1,a0
    71e0:	000b8593          	mv	a1,s7
    71e4:	00048513          	mv	a0,s1
    71e8:	c04ff0ef          	jal	65ec <quorem>
    71ec:	03050c13          	addi	s8,a0,48
    71f0:	016907b3          	add	a5,s2,s6
    71f4:	ff878fa3          	sb	s8,-1(a5)
    71f8:	fd9b46e3          	blt	s6,s9,71c4 <_dtoa_r+0x974>
    71fc:	00000b13          	li	s6,0
    7200:	01905463          	blez	s9,7208 <_dtoa_r+0x9b8>
    7204:	fffc8b13          	addi	s6,s9,-1
    7208:	00190793          	addi	a5,s2,1
    720c:	00fb0b33          	add	s6,s6,a5
    7210:	00000693          	li	a3,0
    7214:	00048593          	mv	a1,s1
    7218:	00100613          	li	a2,1
    721c:	00040513          	mv	a0,s0
    7220:	00d12823          	sw	a3,16(sp)
    7224:	0ac030ef          	jal	a2d0 <__lshift>
    7228:	01c12583          	lw	a1,28(sp)
    722c:	00050493          	mv	s1,a0
    7230:	228030ef          	jal	a458 <__mcmp>
    7234:	01012683          	lw	a3,16(sp)
    7238:	0aa05663          	blez	a0,72e4 <_dtoa_r+0xa94>
    723c:	03900713          	li	a4,57
    7240:	0080006f          	j	7248 <_dtoa_r+0x9f8>
    7244:	4d6904e3          	beq	s2,s6,7f0c <_dtoa_r+0x16bc>
    7248:	fffb4783          	lbu	a5,-1(s6)
    724c:	000b0b93          	mv	s7,s6
    7250:	fffb0b13          	addi	s6,s6,-1
    7254:	fee788e3          	beq	a5,a4,7244 <_dtoa_r+0x9f4>
    7258:	00178793          	addi	a5,a5,1
    725c:	00fb0023          	sb	a5,0(s6)
    7260:	01c12583          	lw	a1,28(sp)
    7264:	00040513          	mv	a0,s0
    7268:	00d12823          	sw	a3,16(sp)
    726c:	6e4020ef          	jal	9950 <_Bfree>
    7270:	ce0a8ee3          	beqz	s5,6f6c <_dtoa_r+0x71c>
    7274:	01012683          	lw	a3,16(sp)
    7278:	ce0684e3          	beqz	a3,6f60 <_dtoa_r+0x710>
    727c:	cf5682e3          	beq	a3,s5,6f60 <_dtoa_r+0x710>
    7280:	00068593          	mv	a1,a3
    7284:	00040513          	mv	a0,s0
    7288:	6c8020ef          	jal	9950 <_Bfree>
    728c:	cd5ff06f          	j	6f60 <_dtoa_r+0x710>
    7290:	01812783          	lw	a5,24(sp)
    7294:	43370713          	addi	a4,a4,1075
    7298:	00ea0a33          	add	s4,s4,a4
    729c:	00e78733          	add	a4,a5,a4
    72a0:	02812783          	lw	a5,40(sp)
    72a4:	fff00c93          	li	s9,-1
    72a8:	05912423          	sw	s9,72(sp)
    72ac:	00f12e23          	sw	a5,28(sp)
    72b0:	00012823          	sw	zero,16(sp)
    72b4:	ae5ff06f          	j	6d98 <_dtoa_r+0x548>
    72b8:	02812783          	lw	a5,40(sp)
    72bc:	78079863          	bnez	a5,7a4c <_dtoa_r+0x11fc>
    72c0:	00198a13          	addi	s4,s3,1
    72c4:	ef5ff06f          	j	71b8 <_dtoa_r+0x968>
    72c8:	00100793          	li	a5,1
    72cc:	00000a93          	li	s5,0
    72d0:	04f12023          	sw	a5,64(sp)
    72d4:	869ff06f          	j	6b3c <_dtoa_r+0x2ec>
    72d8:	00100a93          	li	s5,1
    72dc:	05512023          	sw	s5,64(sp)
    72e0:	85dff06f          	j	6b3c <_dtoa_r+0x2ec>
    72e4:	00051663          	bnez	a0,72f0 <_dtoa_r+0xaa0>
    72e8:	001c7c13          	andi	s8,s8,1
    72ec:	f40c18e3          	bnez	s8,723c <_dtoa_r+0x9ec>
    72f0:	03000713          	li	a4,48
    72f4:	000b0b93          	mv	s7,s6
    72f8:	fffb4783          	lbu	a5,-1(s6)
    72fc:	fffb0b13          	addi	s6,s6,-1
    7300:	fee78ae3          	beq	a5,a4,72f4 <_dtoa_r+0xaa4>
    7304:	f5dff06f          	j	7260 <_dtoa_r+0xa10>
    7308:	0a812a03          	lw	s4,168(sp)
    730c:	0a412a83          	lw	s5,164(sp)
    7310:	09412c83          	lw	s9,148(sp)
    7314:	08c12d83          	lw	s11,140(sp)
    7318:	e2cff06f          	j	6944 <_dtoa_r+0xf4>
    731c:	03012483          	lw	s1,48(sp)
    7320:	04c12403          	lw	s0,76(sp)
    7324:	05012303          	lw	t1,80(sp)
    7328:	03512e23          	sw	s5,60(sp)
    732c:	000d8793          	mv	a5,s11
    7330:	00058713          	mv	a4,a1
    7334:	00080613          	mv	a2,a6
    7338:	00030513          	mv	a0,t1
    733c:	00070693          	mv	a3,a4
    7340:	00078593          	mv	a1,a5
    7344:	3b9080ef          	jal	fefc <__divdf3>
    7348:	02a12823          	sw	a0,48(sp)
    734c:	00058a93          	mv	s5,a1
    7350:	03812783          	lw	a5,56(sp)
    7354:	02078263          	beqz	a5,7378 <_dtoa_r+0xb28>
    7358:	0000c697          	auipc	a3,0xc
    735c:	32068693          	addi	a3,a3,800 # 13678 <__clz_tab+0x148>
    7360:	0006a603          	lw	a2,0(a3)
    7364:	03012503          	lw	a0,48(sp)
    7368:	0046a683          	lw	a3,4(a3)
    736c:	000a8593          	mv	a1,s5
    7370:	04d090ef          	jal	10bbc <__ledf2>
    7374:	1c0544e3          	bltz	a0,7d3c <_dtoa_r+0x14ec>
    7378:	03c12503          	lw	a0,60(sp)
    737c:	6250a0ef          	jal	121a0 <__floatsidf>
    7380:	03012603          	lw	a2,48(sp)
    7384:	000a8693          	mv	a3,s5
    7388:	14d090ef          	jal	10cd4 <__muldf3>
    738c:	0000c797          	auipc	a5,0xc
    7390:	2fc78793          	addi	a5,a5,764 # 13688 <__clz_tab+0x158>
    7394:	0007a603          	lw	a2,0(a5)
    7398:	0047a683          	lw	a3,4(a5)
    739c:	00c080ef          	jal	f3a8 <__adddf3>
    73a0:	fcc008b7          	lui	a7,0xfcc00
    73a4:	00050713          	mv	a4,a0
    73a8:	00b888b3          	add	a7,a7,a1
    73ac:	240c8863          	beqz	s9,75fc <_dtoa_r+0xdac>
    73b0:	05312623          	sw	s3,76(sp)
    73b4:	03912e23          	sw	s9,60(sp)
    73b8:	03c12783          	lw	a5,60(sp)
    73bc:	0000c817          	auipc	a6,0xc
    73c0:	ddc80813          	addi	a6,a6,-548 # 13198 <__mprec_tens>
    73c4:	07012223          	sw	a6,100(sp)
    73c8:	00379793          	slli	a5,a5,0x3
    73cc:	00f807b3          	add	a5,a6,a5
    73d0:	ffc7a803          	lw	a6,-4(a5)
    73d4:	03012503          	lw	a0,48(sp)
    73d8:	ff87a783          	lw	a5,-8(a5)
    73dc:	000a8593          	mv	a1,s5
    73e0:	07112023          	sw	a7,96(sp)
    73e4:	04f12823          	sw	a5,80(sp)
    73e8:	05012a23          	sw	a6,84(sp)
    73ec:	04e12e23          	sw	a4,92(sp)
    73f0:	5310a0ef          	jal	12120 <__fixdfsi>
    73f4:	04a12c23          	sw	a0,88(sp)
    73f8:	5a90a0ef          	jal	121a0 <__floatsidf>
    73fc:	00050613          	mv	a2,a0
    7400:	03012503          	lw	a0,48(sp)
    7404:	00058693          	mv	a3,a1
    7408:	000a8593          	mv	a1,s5
    740c:	1740a0ef          	jal	11580 <__subdf3>
    7410:	05812783          	lw	a5,88(sp)
    7414:	00190d93          	addi	s11,s2,1
    7418:	00050a93          	mv	s5,a0
    741c:	03078893          	addi	a7,a5,48
    7420:	04012783          	lw	a5,64(sp)
    7424:	0000c817          	auipc	a6,0xc
    7428:	d7480813          	addi	a6,a6,-652 # 13198 <__mprec_tens>
    742c:	44078863          	beqz	a5,787c <_dtoa_r+0x102c>
    7430:	04b12c23          	sw	a1,88(sp)
    7434:	0000c597          	auipc	a1,0xc
    7438:	21458593          	addi	a1,a1,532 # 13648 <__clz_tab+0x118>
    743c:	05012603          	lw	a2,80(sp)
    7440:	05412683          	lw	a3,84(sp)
    7444:	0005a503          	lw	a0,0(a1)
    7448:	0045a583          	lw	a1,4(a1)
    744c:	05012023          	sw	a6,64(sp)
    7450:	03112823          	sw	a7,48(sp)
    7454:	2a9080ef          	jal	fefc <__divdf3>
    7458:	05c12603          	lw	a2,92(sp)
    745c:	06012683          	lw	a3,96(sp)
    7460:	1200a0ef          	jal	11580 <__subdf3>
    7464:	05812703          	lw	a4,88(sp)
    7468:	03012883          	lw	a7,48(sp)
    746c:	000a8613          	mv	a2,s5
    7470:	00070693          	mv	a3,a4
    7474:	01190023          	sb	a7,0(s2)
    7478:	02e12823          	sw	a4,48(sp)
    747c:	04a12823          	sw	a0,80(sp)
    7480:	04b12c23          	sw	a1,88(sp)
    7484:	628090ef          	jal	10aac <__gedf2>
    7488:	03012703          	lw	a4,48(sp)
    748c:	0000c817          	auipc	a6,0xc
    7490:	d0c80813          	addi	a6,a6,-756 # 13198 <__mprec_tens>
    7494:	2ca040e3          	bgtz	a0,7f54 <_dtoa_r+0x1704>
    7498:	0000c697          	auipc	a3,0xc
    749c:	1e068693          	addi	a3,a3,480 # 13678 <__clz_tab+0x148>
    74a0:	0006a603          	lw	a2,0(a3)
    74a4:	0046a683          	lw	a3,4(a3)
    74a8:	05312e23          	sw	s3,92(sp)
    74ac:	07412023          	sw	s4,96(sp)
    74b0:	05012983          	lw	s3,80(sp)
    74b4:	07712223          	sw	s7,100(sp)
    74b8:	07812423          	sw	s8,104(sp)
    74bc:	05612823          	sw	s6,80(sp)
    74c0:	05812a03          	lw	s4,88(sp)
    74c4:	000a8b13          	mv	s6,s5
    74c8:	02c12823          	sw	a2,48(sp)
    74cc:	03c12a83          	lw	s5,60(sp)
    74d0:	02d12a23          	sw	a3,52(sp)
    74d4:	05912023          	sw	s9,64(sp)
    74d8:	00000b93          	li	s7,0
    74dc:	07012623          	sw	a6,108(sp)
    74e0:	00070c13          	mv	s8,a4
    74e4:	0900006f          	j	7574 <_dtoa_r+0xd24>
    74e8:	001b8b93          	addi	s7,s7,1
    74ec:	2b5bdc63          	bge	s7,s5,77a4 <_dtoa_r+0xf54>
    74f0:	0000cc97          	auipc	s9,0xc
    74f4:	190c8c93          	addi	s9,s9,400 # 13680 <__clz_tab+0x150>
    74f8:	000ca603          	lw	a2,0(s9)
    74fc:	004ca683          	lw	a3,4(s9)
    7500:	00098513          	mv	a0,s3
    7504:	000a0593          	mv	a1,s4
    7508:	7cc090ef          	jal	10cd4 <__muldf3>
    750c:	000ca603          	lw	a2,0(s9)
    7510:	004ca683          	lw	a3,4(s9)
    7514:	00050993          	mv	s3,a0
    7518:	00058a13          	mv	s4,a1
    751c:	000b0513          	mv	a0,s6
    7520:	000c0593          	mv	a1,s8
    7524:	7b0090ef          	jal	10cd4 <__muldf3>
    7528:	00050c13          	mv	s8,a0
    752c:	00058c93          	mv	s9,a1
    7530:	3f10a0ef          	jal	12120 <__fixdfsi>
    7534:	00050b13          	mv	s6,a0
    7538:	4690a0ef          	jal	121a0 <__floatsidf>
    753c:	00050613          	mv	a2,a0
    7540:	00058693          	mv	a3,a1
    7544:	000c0513          	mv	a0,s8
    7548:	000c8593          	mv	a1,s9
    754c:	0340a0ef          	jal	11580 <__subdf3>
    7550:	030b0793          	addi	a5,s6,48
    7554:	00098613          	mv	a2,s3
    7558:	000a0693          	mv	a3,s4
    755c:	00fd8023          	sb	a5,0(s11)
    7560:	001d8d93          	addi	s11,s11,1
    7564:	00050b13          	mv	s6,a0
    7568:	00058c13          	mv	s8,a1
    756c:	650090ef          	jal	10bbc <__ledf2>
    7570:	1e0542e3          	bltz	a0,7f54 <_dtoa_r+0x1704>
    7574:	03012503          	lw	a0,48(sp)
    7578:	03412583          	lw	a1,52(sp)
    757c:	000b0613          	mv	a2,s6
    7580:	000c0693          	mv	a3,s8
    7584:	7fd090ef          	jal	11580 <__subdf3>
    7588:	00098613          	mv	a2,s3
    758c:	000a0693          	mv	a3,s4
    7590:	62c090ef          	jal	10bbc <__ledf2>
    7594:	f4055ae3          	bgez	a0,74e8 <_dtoa_r+0xc98>
    7598:	03900693          	li	a3,57
    759c:	0080006f          	j	75a4 <_dtoa_r+0xd54>
    75a0:	192d8ce3          	beq	s11,s2,7f38 <_dtoa_r+0x16e8>
    75a4:	000d8b93          	mv	s7,s11
    75a8:	fffdc703          	lbu	a4,-1(s11)
    75ac:	fffd8d93          	addi	s11,s11,-1
    75b0:	fed708e3          	beq	a4,a3,75a0 <_dtoa_r+0xd50>
    75b4:	00170713          	addi	a4,a4,1
    75b8:	00ed8023          	sb	a4,0(s11)
    75bc:	04c12783          	lw	a5,76(sp)
    75c0:	00178a13          	addi	s4,a5,1
    75c4:	9a9ff06f          	j	6f6c <_dtoa_r+0x71c>
    75c8:	03c12503          	lw	a0,60(sp)
    75cc:	3d50a0ef          	jal	121a0 <__floatsidf>
    75d0:	03012603          	lw	a2,48(sp)
    75d4:	000a8693          	mv	a3,s5
    75d8:	6fc090ef          	jal	10cd4 <__muldf3>
    75dc:	0000c797          	auipc	a5,0xc
    75e0:	0ac78793          	addi	a5,a5,172 # 13688 <__clz_tab+0x158>
    75e4:	0007a603          	lw	a2,0(a5)
    75e8:	0047a683          	lw	a3,4(a5)
    75ec:	5bd070ef          	jal	f3a8 <__adddf3>
    75f0:	fcc008b7          	lui	a7,0xfcc00
    75f4:	00050713          	mv	a4,a0
    75f8:	00b888b3          	add	a7,a7,a1
    75fc:	0000c797          	auipc	a5,0xc
    7600:	09478793          	addi	a5,a5,148 # 13690 <__clz_tab+0x160>
    7604:	03012503          	lw	a0,48(sp)
    7608:	0007a603          	lw	a2,0(a5)
    760c:	0047a683          	lw	a3,4(a5)
    7610:	000a8593          	mv	a1,s5
    7614:	05112623          	sw	a7,76(sp)
    7618:	02e12e23          	sw	a4,60(sp)
    761c:	765090ef          	jal	11580 <__subdf3>
    7620:	03c12703          	lw	a4,60(sp)
    7624:	04c12883          	lw	a7,76(sp)
    7628:	02a12823          	sw	a0,48(sp)
    762c:	00070613          	mv	a2,a4
    7630:	00088693          	mv	a3,a7
    7634:	02b12a23          	sw	a1,52(sp)
    7638:	04e12823          	sw	a4,80(sp)
    763c:	03112e23          	sw	a7,60(sp)
    7640:	46c090ef          	jal	10aac <__gedf2>
    7644:	20a04c63          	bgtz	a0,785c <_dtoa_r+0x100c>
    7648:	03c12883          	lw	a7,60(sp)
    764c:	05012603          	lw	a2,80(sp)
    7650:	03012503          	lw	a0,48(sp)
    7654:	03412583          	lw	a1,52(sp)
    7658:	800007b7          	lui	a5,0x80000
    765c:	00f8c6b3          	xor	a3,a7,a5
    7660:	55c090ef          	jal	10bbc <__ledf2>
    7664:	1c054063          	bltz	a0,7824 <_dtoa_r+0xfd4>
    7668:	07c12783          	lw	a5,124(sp)
    766c:	0007ca63          	bltz	a5,7680 <_dtoa_r+0xe30>
    7670:	00f9a793          	slti	a5,s3,15
    7674:	0000c817          	auipc	a6,0xc
    7678:	b2480813          	addi	a6,a6,-1244 # 13198 <__mprec_tens>
    767c:	14079a63          	bnez	a5,77d0 <_dtoa_r+0xf80>
    7680:	04012783          	lw	a5,64(sp)
    7684:	7c079663          	bnez	a5,7e50 <_dtoa_r+0x1600>
    7688:	01812783          	lw	a5,24(sp)
    768c:	5c078a63          	beqz	a5,7c60 <_dtoa_r+0x1410>
    7690:	5c0a0863          	beqz	s4,7c60 <_dtoa_r+0x1410>
    7694:	01812703          	lw	a4,24(sp)
    7698:	00070793          	mv	a5,a4
    769c:	00ea5463          	bge	s4,a4,76a4 <_dtoa_r+0xe54>
    76a0:	000a0793          	mv	a5,s4
    76a4:	01812703          	lw	a4,24(sp)
    76a8:	40fa0a33          	sub	s4,s4,a5
    76ac:	40f70733          	sub	a4,a4,a5
    76b0:	02812783          	lw	a5,40(sp)
    76b4:	74079c63          	bnez	a5,7e0c <_dtoa_r+0x15bc>
    76b8:	00100593          	li	a1,1
    76bc:	00040513          	mv	a0,s0
    76c0:	00e12c23          	sw	a4,24(sp)
    76c4:	6f4020ef          	jal	9db8 <__i2b>
    76c8:	02c12783          	lw	a5,44(sp)
    76cc:	00a12e23          	sw	a0,28(sp)
    76d0:	01812703          	lw	a4,24(sp)
    76d4:	140790e3          	bnez	a5,8014 <_dtoa_r+0x17c4>
    76d8:	00000a93          	li	s5,0
    76dc:	00100793          	li	a5,1
    76e0:	fccff06f          	j	6eac <_dtoa_r+0x65c>
    76e4:	01c00793          	li	a5,28
    76e8:	fe0ff06f          	j	6ec8 <_dtoa_r+0x678>
    76ec:	6c098863          	beqz	s3,7dbc <_dtoa_r+0x156c>
    76f0:	41300ab3          	neg	s5,s3
    76f4:	00faf793          	andi	a5,s5,15
    76f8:	0000c817          	auipc	a6,0xc
    76fc:	aa080813          	addi	a6,a6,-1376 # 13198 <__mprec_tens>
    7700:	00379793          	slli	a5,a5,0x3
    7704:	00f807b3          	add	a5,a6,a5
    7708:	0007a603          	lw	a2,0(a5) # 80000000 <_stack_top+0x6fffc000>
    770c:	0047a683          	lw	a3,4(a5)
    7710:	02012503          	lw	a0,32(sp)
    7714:	01c12583          	lw	a1,28(sp)
    7718:	5bc090ef          	jal	10cd4 <__muldf3>
    771c:	404ad793          	srai	a5,s5,0x4
    7720:	02a12823          	sw	a0,48(sp)
    7724:	00058a93          	mv	s5,a1
    7728:	200780e3          	beqz	a5,8128 <_dtoa_r+0x18d8>
    772c:	00200713          	li	a4,2
    7730:	02912823          	sw	s1,48(sp)
    7734:	000b0a93          	mv	s5,s6
    7738:	02e12e23          	sw	a4,60(sp)
    773c:	00040b13          	mv	s6,s0
    7740:	0000c497          	auipc	s1,0xc
    7744:	a3048493          	addi	s1,s1,-1488 # 13170 <__mprec_bigtens>
    7748:	00078d93          	mv	s11,a5
    774c:	00070413          	mv	s0,a4
    7750:	00c0006f          	j	775c <_dtoa_r+0xf0c>
    7754:	401ddd93          	srai	s11,s11,0x1
    7758:	00848493          	addi	s1,s1,8
    775c:	001df713          	andi	a4,s11,1
    7760:	00071a63          	bnez	a4,7774 <_dtoa_r+0xf24>
    7764:	401ddd93          	srai	s11,s11,0x1
    7768:	00848493          	addi	s1,s1,8
    776c:	001df713          	andi	a4,s11,1
    7770:	fe0702e3          	beqz	a4,7754 <_dtoa_r+0xf04>
    7774:	0004a603          	lw	a2,0(s1)
    7778:	0044a683          	lw	a3,4(s1)
    777c:	401ddd93          	srai	s11,s11,0x1
    7780:	00140413          	addi	s0,s0,1
    7784:	550090ef          	jal	10cd4 <__muldf3>
    7788:	640d8663          	beqz	s11,7dd4 <_dtoa_r+0x1584>
    778c:	00848493          	addi	s1,s1,8
    7790:	fddff06f          	j	776c <_dtoa_r+0xf1c>
    7794:	01012783          	lw	a5,16(sp)
    7798:	00090b93          	mv	s7,s2
    779c:	fff7ca13          	not	s4,a5
    77a0:	facff06f          	j	6f4c <_dtoa_r+0x6fc>
    77a4:	07c12783          	lw	a5,124(sp)
    77a8:	04012c83          	lw	s9,64(sp)
    77ac:	05c12983          	lw	s3,92(sp)
    77b0:	06012a03          	lw	s4,96(sp)
    77b4:	06412b83          	lw	s7,100(sp)
    77b8:	06812c03          	lw	s8,104(sp)
    77bc:	06c12803          	lw	a6,108(sp)
    77c0:	05012b03          	lw	s6,80(sp)
    77c4:	6807c663          	bltz	a5,7e50 <_dtoa_r+0x1600>
    77c8:	00f9a793          	slti	a5,s3,15
    77cc:	68078263          	beqz	a5,7e50 <_dtoa_r+0x1600>
    77d0:	00399793          	slli	a5,s3,0x3
    77d4:	00f807b3          	add	a5,a6,a5
    77d8:	0007ab03          	lw	s6,0(a5)
    77dc:	0047ab83          	lw	s7,4(a5)
    77e0:	01012783          	lw	a5,16(sp)
    77e4:	8207dee3          	bgez	a5,7020 <_dtoa_r+0x7d0>
    77e8:	83904ce3          	bgtz	s9,7020 <_dtoa_r+0x7d0>
    77ec:	020c9c63          	bnez	s9,7824 <_dtoa_r+0xfd4>
    77f0:	0000c797          	auipc	a5,0xc
    77f4:	ea078793          	addi	a5,a5,-352 # 13690 <__clz_tab+0x160>
    77f8:	0007a603          	lw	a2,0(a5)
    77fc:	0047a683          	lw	a3,4(a5)
    7800:	000b0513          	mv	a0,s6
    7804:	000b8593          	mv	a1,s7
    7808:	4cc090ef          	jal	10cd4 <__muldf3>
    780c:	00050613          	mv	a2,a0
    7810:	00058693          	mv	a3,a1
    7814:	02012503          	lw	a0,32(sp)
    7818:	01c12583          	lw	a1,28(sp)
    781c:	3a0090ef          	jal	10bbc <__ledf2>
    7820:	02a04e63          	bgtz	a0,785c <_dtoa_r+0x100c>
    7824:	00000593          	li	a1,0
    7828:	00040513          	mv	a0,s0
    782c:	124020ef          	jal	9950 <_Bfree>
    7830:	01012783          	lw	a5,16(sp)
    7834:	00090b93          	mv	s7,s2
    7838:	40f00a33          	neg	s4,a5
    783c:	f30ff06f          	j	6f6c <_dtoa_r+0x71c>
    7840:	00200693          	li	a3,2
    7844:	02012303          	lw	t1,32(sp)
    7848:	01c12783          	lw	a5,28(sp)
    784c:	02d12e23          	sw	a3,60(sp)
    7850:	bc4ff06f          	j	6c14 <_dtoa_r+0x3c4>
    7854:	02f12423          	sw	a5,40(sp)
    7858:	e54ff06f          	j	6eac <_dtoa_r+0x65c>
    785c:	03100793          	li	a5,49
    7860:	00f90023          	sb	a5,0(s2)
    7864:	00000593          	li	a1,0
    7868:	00040513          	mv	a0,s0
    786c:	00190b93          	addi	s7,s2,1
    7870:	0e0020ef          	jal	9950 <_Bfree>
    7874:	00298a13          	addi	s4,s3,2
    7878:	ef4ff06f          	j	6f6c <_dtoa_r+0x71c>
    787c:	05012603          	lw	a2,80(sp)
    7880:	05412683          	lw	a3,84(sp)
    7884:	06b12223          	sw	a1,100(sp)
    7888:	05c12503          	lw	a0,92(sp)
    788c:	06012583          	lw	a1,96(sp)
    7890:	05012c23          	sw	a6,88(sp)
    7894:	03112823          	sw	a7,48(sp)
    7898:	43c090ef          	jal	10cd4 <__muldf3>
    789c:	03012883          	lw	a7,48(sp)
    78a0:	03c12783          	lw	a5,60(sp)
    78a4:	04a12023          	sw	a0,64(sp)
    78a8:	01190023          	sb	a7,0(s2)
    78ac:	04b12223          	sw	a1,68(sp)
    78b0:	00100613          	li	a2,1
    78b4:	05812803          	lw	a6,88(sp)
    78b8:	06412703          	lw	a4,100(sp)
    78bc:	000d8893          	mv	a7,s11
    78c0:	0000c697          	auipc	a3,0xc
    78c4:	dc068693          	addi	a3,a3,-576 # 13680 <__clz_tab+0x150>
    78c8:	0ac78c63          	beq	a5,a2,7980 <_dtoa_r+0x1130>
    78cc:	0006a603          	lw	a2,0(a3)
    78d0:	0046a683          	lw	a3,4(a3)
    78d4:	05912823          	sw	s9,80(sp)
    78d8:	05b12c23          	sw	s11,88(sp)
    78dc:	00f90cb3          	add	s9,s2,a5
    78e0:	07212023          	sw	s2,96(sp)
    78e4:	000a8513          	mv	a0,s5
    78e8:	02c12823          	sw	a2,48(sp)
    78ec:	000b0a93          	mv	s5,s6
    78f0:	02d12a23          	sw	a3,52(sp)
    78f4:	05312e23          	sw	s3,92(sp)
    78f8:	00048d93          	mv	s11,s1
    78fc:	00088913          	mv	s2,a7
    7900:	07012223          	sw	a6,100(sp)
    7904:	00070593          	mv	a1,a4
    7908:	00040b13          	mv	s6,s0
    790c:	03012603          	lw	a2,48(sp)
    7910:	03412683          	lw	a3,52(sp)
    7914:	00190913          	addi	s2,s2,1
    7918:	3bc090ef          	jal	10cd4 <__muldf3>
    791c:	00058493          	mv	s1,a1
    7920:	00050413          	mv	s0,a0
    7924:	7fc0a0ef          	jal	12120 <__fixdfsi>
    7928:	03050993          	addi	s3,a0,48
    792c:	0750a0ef          	jal	121a0 <__floatsidf>
    7930:	00050613          	mv	a2,a0
    7934:	00058693          	mv	a3,a1
    7938:	00040513          	mv	a0,s0
    793c:	00048593          	mv	a1,s1
    7940:	441090ef          	jal	11580 <__subdf3>
    7944:	ff390fa3          	sb	s3,-1(s2)
    7948:	fd2c92e3          	bne	s9,s2,790c <_dtoa_r+0x10bc>
    794c:	000d8493          	mv	s1,s11
    7950:	05812d83          	lw	s11,88(sp)
    7954:	03c12783          	lw	a5,60(sp)
    7958:	05012c83          	lw	s9,80(sp)
    795c:	05c12983          	lw	s3,92(sp)
    7960:	06012903          	lw	s2,96(sp)
    7964:	06412803          	lw	a6,100(sp)
    7968:	fffd8893          	addi	a7,s11,-1
    796c:	000b0413          	mv	s0,s6
    7970:	00058713          	mv	a4,a1
    7974:	000a8b13          	mv	s6,s5
    7978:	00f888b3          	add	a7,a7,a5
    797c:	00050a93          	mv	s5,a0
    7980:	0000c317          	auipc	t1,0xc
    7984:	cc830313          	addi	t1,t1,-824 # 13648 <__clz_tab+0x118>
    7988:	00032603          	lw	a2,0(t1)
    798c:	00432683          	lw	a3,4(t1)
    7990:	04012503          	lw	a0,64(sp)
    7994:	04412583          	lw	a1,68(sp)
    7998:	02e12e23          	sw	a4,60(sp)
    799c:	05012823          	sw	a6,80(sp)
    79a0:	03112823          	sw	a7,48(sp)
    79a4:	205070ef          	jal	f3a8 <__adddf3>
    79a8:	03c12683          	lw	a3,60(sp)
    79ac:	000a8613          	mv	a2,s5
    79b0:	20c090ef          	jal	10bbc <__ledf2>
    79b4:	5a054863          	bltz	a0,7f64 <_dtoa_r+0x1714>
    79b8:	0000c317          	auipc	t1,0xc
    79bc:	c9030313          	addi	t1,t1,-880 # 13648 <__clz_tab+0x118>
    79c0:	04012603          	lw	a2,64(sp)
    79c4:	04412683          	lw	a3,68(sp)
    79c8:	00032503          	lw	a0,0(t1)
    79cc:	00432583          	lw	a1,4(t1)
    79d0:	3b1090ef          	jal	11580 <__subdf3>
    79d4:	03c12683          	lw	a3,60(sp)
    79d8:	000a8613          	mv	a2,s5
    79dc:	0d0090ef          	jal	10aac <__gedf2>
    79e0:	03012883          	lw	a7,48(sp)
    79e4:	05012803          	lw	a6,80(sp)
    79e8:	66a04c63          	bgtz	a0,8060 <_dtoa_r+0x1810>
    79ec:	07c12703          	lw	a4,124(sp)
    79f0:	c8074ce3          	bltz	a4,7688 <_dtoa_r+0xe38>
    79f4:	00f9a713          	slti	a4,s3,15
    79f8:	c80708e3          	beqz	a4,7688 <_dtoa_r+0xe38>
    79fc:	00399713          	slli	a4,s3,0x3
    7a00:	00e80833          	add	a6,a6,a4
    7a04:	00082b03          	lw	s6,0(a6)
    7a08:	00482b83          	lw	s7,4(a6)
    7a0c:	000d8a93          	mv	s5,s11
    7a10:	e14ff06f          	j	7024 <_dtoa_r+0x7d4>
    7a14:	01c00693          	li	a3,28
    7a18:	ccd78263          	beq	a5,a3,6edc <_dtoa_r+0x68c>
    7a1c:	03c00693          	li	a3,60
    7a20:	40f687b3          	sub	a5,a3,a5
    7a24:	ca4ff06f          	j	6ec8 <_dtoa_r+0x678>
    7a28:	000a8593          	mv	a1,s5
    7a2c:	00000693          	li	a3,0
    7a30:	00a00613          	li	a2,10
    7a34:	00040513          	mv	a0,s0
    7a38:	73d010ef          	jal	9974 <__multadd>
    7a3c:	00050a93          	mv	s5,a0
    7a40:	04812c83          	lw	s9,72(sp)
    7a44:	000c0993          	mv	s3,s8
    7a48:	cc0a1463          	bnez	s4,6f10 <_dtoa_r+0x6c0>
    7a4c:	01812783          	lw	a5,24(sp)
    7a50:	00f05c63          	blez	a5,7a68 <_dtoa_r+0x1218>
    7a54:	000a8593          	mv	a1,s5
    7a58:	00078613          	mv	a2,a5
    7a5c:	00040513          	mv	a0,s0
    7a60:	071020ef          	jal	a2d0 <__lshift>
    7a64:	00050a93          	mv	s5,a0
    7a68:	02c12783          	lw	a5,44(sp)
    7a6c:	000a8d93          	mv	s11,s5
    7a70:	4e079e63          	bnez	a5,7f6c <_dtoa_r+0x171c>
    7a74:	02412703          	lw	a4,36(sp)
    7a78:	01c12a03          	lw	s4,28(sp)
    7a7c:	fff90793          	addi	a5,s2,-1
    7a80:	00177713          	andi	a4,a4,1
    7a84:	03312023          	sw	s3,32(sp)
    7a88:	03212223          	sw	s2,36(sp)
    7a8c:	00090993          	mv	s3,s2
    7a90:	00e12c23          	sw	a4,24(sp)
    7a94:	01978933          	add	s2,a5,s9
    7a98:	03a12423          	sw	s10,40(sp)
    7a9c:	03612623          	sw	s6,44(sp)
    7aa0:	000a0593          	mv	a1,s4
    7aa4:	00048513          	mv	a0,s1
    7aa8:	b45fe0ef          	jal	65ec <quorem>
    7aac:	00050c13          	mv	s8,a0
    7ab0:	000a8593          	mv	a1,s5
    7ab4:	00048513          	mv	a0,s1
    7ab8:	1a1020ef          	jal	a458 <__mcmp>
    7abc:	000a0593          	mv	a1,s4
    7ac0:	00050c93          	mv	s9,a0
    7ac4:	000d8613          	mv	a2,s11
    7ac8:	00040513          	mv	a0,s0
    7acc:	1e5020ef          	jal	a4b0 <__mdiff>
    7ad0:	00c52703          	lw	a4,12(a0)
    7ad4:	030c0b13          	addi	s6,s8,48
    7ad8:	00050593          	mv	a1,a0
    7adc:	08071a63          	bnez	a4,7b70 <_dtoa_r+0x1320>
    7ae0:	00a12823          	sw	a0,16(sp)
    7ae4:	00048513          	mv	a0,s1
    7ae8:	171020ef          	jal	a458 <__mcmp>
    7aec:	01012583          	lw	a1,16(sp)
    7af0:	00050d13          	mv	s10,a0
    7af4:	00040513          	mv	a0,s0
    7af8:	659010ef          	jal	9950 <_Bfree>
    7afc:	017d66b3          	or	a3,s10,s7
    7b00:	10069863          	bnez	a3,7c10 <_dtoa_r+0x13c0>
    7b04:	01812783          	lw	a5,24(sp)
    7b08:	5c078c63          	beqz	a5,80e0 <_dtoa_r+0x1890>
    7b0c:	5a0cce63          	bltz	s9,80c8 <_dtoa_r+0x1878>
    7b10:	01698023          	sb	s6,0(s3)
    7b14:	00198c93          	addi	s9,s3,1
    7b18:	53390263          	beq	s2,s3,803c <_dtoa_r+0x17ec>
    7b1c:	00048593          	mv	a1,s1
    7b20:	00000693          	li	a3,0
    7b24:	00a00613          	li	a2,10
    7b28:	00040513          	mv	a0,s0
    7b2c:	649010ef          	jal	9974 <__multadd>
    7b30:	00050493          	mv	s1,a0
    7b34:	000a8593          	mv	a1,s5
    7b38:	00000693          	li	a3,0
    7b3c:	00a00613          	li	a2,10
    7b40:	00040513          	mv	a0,s0
    7b44:	0bba8c63          	beq	s5,s11,7bfc <_dtoa_r+0x13ac>
    7b48:	62d010ef          	jal	9974 <__multadd>
    7b4c:	000d8593          	mv	a1,s11
    7b50:	00050a93          	mv	s5,a0
    7b54:	00000693          	li	a3,0
    7b58:	00040513          	mv	a0,s0
    7b5c:	00a00613          	li	a2,10
    7b60:	615010ef          	jal	9974 <__multadd>
    7b64:	00050d93          	mv	s11,a0
    7b68:	000c8993          	mv	s3,s9
    7b6c:	f35ff06f          	j	7aa0 <_dtoa_r+0x1250>
    7b70:	00040513          	mv	a0,s0
    7b74:	01812c23          	sw	s8,24(sp)
    7b78:	02412903          	lw	s2,36(sp)
    7b7c:	02812d03          	lw	s10,40(sp)
    7b80:	00098a13          	mv	s4,s3
    7b84:	000b0c13          	mv	s8,s6
    7b88:	02012983          	lw	s3,32(sp)
    7b8c:	02c12b03          	lw	s6,44(sp)
    7b90:	01912823          	sw	s9,16(sp)
    7b94:	5bd010ef          	jal	9950 <_Bfree>
    7b98:	01012783          	lw	a5,16(sp)
    7b9c:	0007cc63          	bltz	a5,7bb4 <_dtoa_r+0x1364>
    7ba0:	01012783          	lw	a5,16(sp)
    7ba4:	001b7713          	andi	a4,s6,1
    7ba8:	0177e7b3          	or	a5,a5,s7
    7bac:	00f767b3          	or	a5,a4,a5
    7bb0:	08079663          	bnez	a5,7c3c <_dtoa_r+0x13ec>
    7bb4:	00048593          	mv	a1,s1
    7bb8:	00100613          	li	a2,1
    7bbc:	00040513          	mv	a0,s0
    7bc0:	710020ef          	jal	a2d0 <__lshift>
    7bc4:	01c12583          	lw	a1,28(sp)
    7bc8:	00050493          	mv	s1,a0
    7bcc:	08d020ef          	jal	a458 <__mcmp>
    7bd0:	54a05463          	blez	a0,8118 <_dtoa_r+0x18c8>
    7bd4:	03900793          	li	a5,57
    7bd8:	4afc0863          	beq	s8,a5,8088 <_dtoa_r+0x1838>
    7bdc:	01812783          	lw	a5,24(sp)
    7be0:	03178c13          	addi	s8,a5,49
    7be4:	000a8693          	mv	a3,s5
    7be8:	018a0023          	sb	s8,0(s4)
    7bec:	001a0b93          	addi	s7,s4,1
    7bf0:	000d8a93          	mv	s5,s11
    7bf4:	00198a13          	addi	s4,s3,1
    7bf8:	e68ff06f          	j	7260 <_dtoa_r+0xa10>
    7bfc:	579010ef          	jal	9974 <__multadd>
    7c00:	00050a93          	mv	s5,a0
    7c04:	00050d93          	mv	s11,a0
    7c08:	000c8993          	mv	s3,s9
    7c0c:	e95ff06f          	j	7aa0 <_dtoa_r+0x1250>
    7c10:	480cca63          	bltz	s9,80a4 <_dtoa_r+0x1854>
    7c14:	01812783          	lw	a5,24(sp)
    7c18:	017cecb3          	or	s9,s9,s7
    7c1c:	0197ecb3          	or	s9,a5,s9
    7c20:	480c8263          	beqz	s9,80a4 <_dtoa_r+0x1854>
    7c24:	efa056e3          	blez	s10,7b10 <_dtoa_r+0x12c0>
    7c28:	00098a13          	mv	s4,s3
    7c2c:	02412903          	lw	s2,36(sp)
    7c30:	02012983          	lw	s3,32(sp)
    7c34:	02812d03          	lw	s10,40(sp)
    7c38:	000b0c13          	mv	s8,s6
    7c3c:	03900793          	li	a5,57
    7c40:	44fc0463          	beq	s8,a5,8088 <_dtoa_r+0x1838>
    7c44:	001c0c13          	addi	s8,s8,1
    7c48:	018a0023          	sb	s8,0(s4)
    7c4c:	000a8693          	mv	a3,s5
    7c50:	001a0b93          	addi	s7,s4,1
    7c54:	000d8a93          	mv	s5,s11
    7c58:	00198a13          	addi	s4,s3,1
    7c5c:	e04ff06f          	j	7260 <_dtoa_r+0xa10>
    7c60:	02812783          	lw	a5,40(sp)
    7c64:	1a079663          	bnez	a5,7e10 <_dtoa_r+0x15c0>
    7c68:	00100593          	li	a1,1
    7c6c:	00040513          	mv	a0,s0
    7c70:	148020ef          	jal	9db8 <__i2b>
    7c74:	02c12783          	lw	a5,44(sp)
    7c78:	00a12e23          	sw	a0,28(sp)
    7c7c:	01812703          	lw	a4,24(sp)
    7c80:	00000a93          	li	s5,0
    7c84:	a4078ce3          	beqz	a5,76dc <_dtoa_r+0xe8c>
    7c88:	02c12603          	lw	a2,44(sp)
    7c8c:	01c12583          	lw	a1,28(sp)
    7c90:	00040513          	mv	a0,s0
    7c94:	02e12023          	sw	a4,32(sp)
    7c98:	4cc020ef          	jal	a164 <__pow5mult>
    7c9c:	00100793          	li	a5,1
    7ca0:	00a12e23          	sw	a0,28(sp)
    7ca4:	02012623          	sw	zero,44(sp)
    7ca8:	02012703          	lw	a4,32(sp)
    7cac:	2377da63          	bge	a5,s7,7ee0 <_dtoa_r+0x1690>
    7cb0:	01c12783          	lw	a5,28(sp)
    7cb4:	02e12023          	sw	a4,32(sp)
    7cb8:	01c12703          	lw	a4,28(sp)
    7cbc:	0107a783          	lw	a5,16(a5)
    7cc0:	00279793          	slli	a5,a5,0x2
    7cc4:	00f707b3          	add	a5,a4,a5
    7cc8:	0107a503          	lw	a0,16(a5)
    7ccc:	749010ef          	jal	9c14 <__hi0bits>
    7cd0:	02000793          	li	a5,32
    7cd4:	02012703          	lw	a4,32(sp)
    7cd8:	40a787b3          	sub	a5,a5,a0
    7cdc:	9d0ff06f          	j	6eac <_dtoa_r+0x65c>
    7ce0:	00100a93          	li	s5,1
    7ce4:	04012023          	sw	zero,64(sp)
    7ce8:	01012783          	lw	a5,16(sp)
    7cec:	00f05c63          	blez	a5,7d04 <_dtoa_r+0x14b4>
    7cf0:	01012783          	lw	a5,16(sp)
    7cf4:	04f12423          	sw	a5,72(sp)
    7cf8:	00078613          	mv	a2,a5
    7cfc:	00078c93          	mv	s9,a5
    7d00:	e59fe06f          	j	6b58 <_dtoa_r+0x308>
    7d04:	00100793          	li	a5,1
    7d08:	04f12423          	sw	a5,72(sp)
    7d0c:	02042e23          	sw	zero,60(s0)
    7d10:	00078c93          	mv	s9,a5
    7d14:	00f12823          	sw	a5,16(sp)
    7d18:	00000593          	li	a1,0
    7d1c:	e69fe06f          	j	6b84 <_dtoa_r+0x334>
    7d20:	00100793          	li	a5,1
    7d24:	412787b3          	sub	a5,a5,s2
    7d28:	00f12c23          	sw	a5,24(sp)
    7d2c:	00098a13          	mv	s4,s3
    7d30:	03312623          	sw	s3,44(sp)
    7d34:	02012c23          	sw	zero,56(sp)
    7d38:	dc5fe06f          	j	6afc <_dtoa_r+0x2ac>
    7d3c:	880c86e3          	beqz	s9,75c8 <_dtoa_r+0xd78>
    7d40:	04812783          	lw	a5,72(sp)
    7d44:	92f052e3          	blez	a5,7668 <_dtoa_r+0xe18>
    7d48:	0000c697          	auipc	a3,0xc
    7d4c:	93868693          	addi	a3,a3,-1736 # 13680 <__clz_tab+0x150>
    7d50:	0006a603          	lw	a2,0(a3)
    7d54:	03012503          	lw	a0,48(sp)
    7d58:	0046a683          	lw	a3,4(a3)
    7d5c:	fff98793          	addi	a5,s3,-1
    7d60:	000a8593          	mv	a1,s5
    7d64:	04f12623          	sw	a5,76(sp)
    7d68:	76d080ef          	jal	10cd4 <__muldf3>
    7d6c:	03c12703          	lw	a4,60(sp)
    7d70:	00050d93          	mv	s11,a0
    7d74:	00058a93          	mv	s5,a1
    7d78:	00170513          	addi	a0,a4,1
    7d7c:	03b12823          	sw	s11,48(sp)
    7d80:	4200a0ef          	jal	121a0 <__floatsidf>
    7d84:	000d8613          	mv	a2,s11
    7d88:	000a8693          	mv	a3,s5
    7d8c:	749080ef          	jal	10cd4 <__muldf3>
    7d90:	0000c797          	auipc	a5,0xc
    7d94:	8f878793          	addi	a5,a5,-1800 # 13688 <__clz_tab+0x158>
    7d98:	0007a603          	lw	a2,0(a5)
    7d9c:	0047a683          	lw	a3,4(a5)
    7da0:	608070ef          	jal	f3a8 <__adddf3>
    7da4:	04812783          	lw	a5,72(sp)
    7da8:	fcc008b7          	lui	a7,0xfcc00
    7dac:	00050713          	mv	a4,a0
    7db0:	00b888b3          	add	a7,a7,a1
    7db4:	02f12e23          	sw	a5,60(sp)
    7db8:	e00ff06f          	j	73b8 <_dtoa_r+0xb68>
    7dbc:	02012783          	lw	a5,32(sp)
    7dc0:	01c12a83          	lw	s5,28(sp)
    7dc4:	02f12823          	sw	a5,48(sp)
    7dc8:	00200793          	li	a5,2
    7dcc:	02f12e23          	sw	a5,60(sp)
    7dd0:	d80ff06f          	j	7350 <_dtoa_r+0xb00>
    7dd4:	03012483          	lw	s1,48(sp)
    7dd8:	02812e23          	sw	s0,60(sp)
    7ddc:	02a12823          	sw	a0,48(sp)
    7de0:	000b0413          	mv	s0,s6
    7de4:	000a8b13          	mv	s6,s5
    7de8:	00058a93          	mv	s5,a1
    7dec:	d64ff06f          	j	7350 <_dtoa_r+0xb00>
    7df0:	02812783          	lw	a5,40(sp)
    7df4:	00079463          	bnez	a5,7dfc <_dtoa_r+0x15ac>
    7df8:	85cff06f          	j	6e54 <_dtoa_r+0x604>
    7dfc:	ff5fe06f          	j	6df0 <_dtoa_r+0x5a0>
    7e00:	00100793          	li	a5,1
    7e04:	02f12423          	sw	a5,40(sp)
    7e08:	e81ff06f          	j	7c88 <_dtoa_r+0x1438>
    7e0c:	00e12c23          	sw	a4,24(sp)
    7e10:	02812603          	lw	a2,40(sp)
    7e14:	00048593          	mv	a1,s1
    7e18:	00040513          	mv	a0,s0
    7e1c:	348020ef          	jal	a164 <__pow5mult>
    7e20:	00050493          	mv	s1,a0
    7e24:	00100593          	li	a1,1
    7e28:	00040513          	mv	a0,s0
    7e2c:	78d010ef          	jal	9db8 <__i2b>
    7e30:	02c12783          	lw	a5,44(sp)
    7e34:	00a12e23          	sw	a0,28(sp)
    7e38:	24079063          	bnez	a5,8078 <_dtoa_r+0x1828>
    7e3c:	01812703          	lw	a4,24(sp)
    7e40:	02012423          	sw	zero,40(sp)
    7e44:	00000a93          	li	s5,0
    7e48:	00100793          	li	a5,1
    7e4c:	860ff06f          	j	6eac <_dtoa_r+0x65c>
    7e50:	02812783          	lw	a5,40(sp)
    7e54:	fffc8613          	addi	a2,s9,-1
    7e58:	30c7d263          	bge	a5,a2,815c <_dtoa_r+0x190c>
    7e5c:	02812783          	lw	a5,40(sp)
    7e60:	02c12703          	lw	a4,44(sp)
    7e64:	00100593          	li	a1,1
    7e68:	40f607b3          	sub	a5,a2,a5
    7e6c:	00f707b3          	add	a5,a4,a5
    7e70:	00040513          	mv	a0,s0
    7e74:	00c12e23          	sw	a2,28(sp)
    7e78:	02f12623          	sw	a5,44(sp)
    7e7c:	73d010ef          	jal	9db8 <__i2b>
    7e80:	01812783          	lw	a5,24(sp)
    7e84:	01c12603          	lw	a2,28(sp)
    7e88:	019a0a33          	add	s4,s4,s9
    7e8c:	00050a93          	mv	s5,a0
    7e90:	000c8713          	mv	a4,s9
    7e94:	02078863          	beqz	a5,7ec4 <_dtoa_r+0x1674>
    7e98:	01812783          	lw	a5,24(sp)
    7e9c:	01812683          	lw	a3,24(sp)
    7ea0:	01978733          	add	a4,a5,s9
    7ea4:	000a0793          	mv	a5,s4
    7ea8:	0146d463          	bge	a3,s4,7eb0 <_dtoa_r+0x1660>
    7eac:	00068793          	mv	a5,a3
    7eb0:	01812683          	lw	a3,24(sp)
    7eb4:	40f70733          	sub	a4,a4,a5
    7eb8:	40fa0a33          	sub	s4,s4,a5
    7ebc:	40f686b3          	sub	a3,a3,a5
    7ec0:	00d12c23          	sw	a3,24(sp)
    7ec4:	00048593          	mv	a1,s1
    7ec8:	00040513          	mv	a0,s0
    7ecc:	00e12e23          	sw	a4,28(sp)
    7ed0:	294020ef          	jal	a164 <__pow5mult>
    7ed4:	01c12703          	lw	a4,28(sp)
    7ed8:	00050493          	mv	s1,a0
    7edc:	f79fe06f          	j	6e54 <_dtoa_r+0x604>
    7ee0:	02412683          	lw	a3,36(sp)
    7ee4:	dc0696e3          	bnez	a3,7cb0 <_dtoa_r+0x1460>
    7ee8:	00cc1693          	slli	a3,s8,0xc
    7eec:	dc0692e3          	bnez	a3,7cb0 <_dtoa_r+0x1460>
    7ef0:	014c5693          	srli	a3,s8,0x14
    7ef4:	7ff6f693          	andi	a3,a3,2047
    7ef8:	da068ce3          	beqz	a3,7cb0 <_dtoa_r+0x1460>
    7efc:	00170713          	addi	a4,a4,1
    7f00:	001a0a13          	addi	s4,s4,1
    7f04:	02f12623          	sw	a5,44(sp)
    7f08:	da9ff06f          	j	7cb0 <_dtoa_r+0x1460>
    7f0c:	03100793          	li	a5,49
    7f10:	00298a13          	addi	s4,s3,2
    7f14:	00f90023          	sb	a5,0(s2)
    7f18:	b48ff06f          	j	7260 <_dtoa_r+0xa10>
    7f1c:	00100a93          	li	s5,1
    7f20:	05512023          	sw	s5,64(sp)
    7f24:	dc5ff06f          	j	7ce8 <_dtoa_r+0x1498>
    7f28:	00100793          	li	a5,1
    7f2c:	00000a93          	li	s5,0
    7f30:	04f12023          	sw	a5,64(sp)
    7f34:	db5ff06f          	j	7ce8 <_dtoa_r+0x1498>
    7f38:	04c12783          	lw	a5,76(sp)
    7f3c:	03100713          	li	a4,49
    7f40:	00178793          	addi	a5,a5,1
    7f44:	04f12623          	sw	a5,76(sp)
    7f48:	e70ff06f          	j	75b8 <_dtoa_r+0xd68>
    7f4c:	02812603          	lw	a2,40(sp)
    7f50:	f75ff06f          	j	7ec4 <_dtoa_r+0x1674>
    7f54:	04c12783          	lw	a5,76(sp)
    7f58:	000d8b93          	mv	s7,s11
    7f5c:	00178a13          	addi	s4,a5,1
    7f60:	80cff06f          	j	6f6c <_dtoa_r+0x71c>
    7f64:	03012d83          	lw	s11,48(sp)
    7f68:	e30ff06f          	j	7598 <_dtoa_r+0xd48>
    7f6c:	004aa583          	lw	a1,4(s5)
    7f70:	00040513          	mv	a0,s0
    7f74:	131010ef          	jal	98a4 <_Balloc>
    7f78:	00050a13          	mv	s4,a0
    7f7c:	1c050263          	beqz	a0,8140 <_dtoa_r+0x18f0>
    7f80:	010aa603          	lw	a2,16(s5)
    7f84:	00ca8593          	addi	a1,s5,12
    7f88:	00c50513          	addi	a0,a0,12
    7f8c:	00260613          	addi	a2,a2,2
    7f90:	00261613          	slli	a2,a2,0x2
    7f94:	a50fe0ef          	jal	61e4 <memcpy>
    7f98:	000a0593          	mv	a1,s4
    7f9c:	00040513          	mv	a0,s0
    7fa0:	00100613          	li	a2,1
    7fa4:	32c020ef          	jal	a2d0 <__lshift>
    7fa8:	00050d93          	mv	s11,a0
    7fac:	ac9ff06f          	j	7a74 <_dtoa_r+0x1224>
    7fb0:	00040c13          	mv	s8,s0
    7fb4:	01812403          	lw	s0,24(sp)
    7fb8:	00070613          	mv	a2,a4
    7fbc:	00058693          	mv	a3,a1
    7fc0:	00070513          	mv	a0,a4
    7fc4:	3e4070ef          	jal	f3a8 <__adddf3>
    7fc8:	000b0613          	mv	a2,s6
    7fcc:	000b8693          	mv	a3,s7
    7fd0:	00a12823          	sw	a0,16(sp)
    7fd4:	00b12a23          	sw	a1,20(sp)
    7fd8:	00198a13          	addi	s4,s3,1
    7fdc:	2d1080ef          	jal	10aac <__gedf2>
    7fe0:	02a04263          	bgtz	a0,8004 <_dtoa_r+0x17b4>
    7fe4:	01012503          	lw	a0,16(sp)
    7fe8:	01412583          	lw	a1,20(sp)
    7fec:	000b0613          	mv	a2,s6
    7ff0:	000b8693          	mv	a3,s7
    7ff4:	229080ef          	jal	10a1c <__eqdf2>
    7ff8:	00051a63          	bnez	a0,800c <_dtoa_r+0x17bc>
    7ffc:	001c7713          	andi	a4,s8,1
    8000:	00070663          	beqz	a4,800c <_dtoa_r+0x17bc>
    8004:	05312623          	sw	s3,76(sp)
    8008:	d90ff06f          	j	7598 <_dtoa_r+0xd48>
    800c:	000d8b93          	mv	s7,s11
    8010:	f5dfe06f          	j	6f6c <_dtoa_r+0x71c>
    8014:	00e12c23          	sw	a4,24(sp)
    8018:	00000a93          	li	s5,0
    801c:	c6dff06f          	j	7c88 <_dtoa_r+0x1438>
    8020:	0000b697          	auipc	a3,0xb
    8024:	a0068693          	addi	a3,a3,-1536 # 12a20 <__clzsi2+0x258>
    8028:	00000613          	li	a2,0
    802c:	1af00593          	li	a1,431
    8030:	0000b517          	auipc	a0,0xb
    8034:	a0450513          	addi	a0,a0,-1532 # 12a34 <__clzsi2+0x26c>
    8038:	32c040ef          	jal	c364 <__assert_func>
    803c:	02012983          	lw	s3,32(sp)
    8040:	000b0c13          	mv	s8,s6
    8044:	000a8693          	mv	a3,s5
    8048:	02412903          	lw	s2,36(sp)
    804c:	02812d03          	lw	s10,40(sp)
    8050:	000c8b13          	mv	s6,s9
    8054:	000d8a93          	mv	s5,s11
    8058:	00198a13          	addi	s4,s3,1
    805c:	9b8ff06f          	j	7214 <_dtoa_r+0x9c4>
    8060:	03000713          	li	a4,48
    8064:	fff8c783          	lbu	a5,-1(a7) # fcbfffff <_stack_top+0xecbfbfff>
    8068:	00088b93          	mv	s7,a7
    806c:	fff88893          	addi	a7,a7,-1
    8070:	fee78ae3          	beq	a5,a4,8064 <_dtoa_r+0x1814>
    8074:	d48ff06f          	j	75bc <_dtoa_r+0xd6c>
    8078:	01812703          	lw	a4,24(sp)
    807c:	02012423          	sw	zero,40(sp)
    8080:	00000a93          	li	s5,0
    8084:	c05ff06f          	j	7c88 <_dtoa_r+0x1438>
    8088:	03900793          	li	a5,57
    808c:	000a8693          	mv	a3,s5
    8090:	00fa0023          	sb	a5,0(s4)
    8094:	001a0b13          	addi	s6,s4,1
    8098:	000d8a93          	mv	s5,s11
    809c:	00198a13          	addi	s4,s3,1
    80a0:	99cff06f          	j	723c <_dtoa_r+0x9ec>
    80a4:	01812c23          	sw	s8,24(sp)
    80a8:	000d0713          	mv	a4,s10
    80ac:	00098a13          	mv	s4,s3
    80b0:	02412903          	lw	s2,36(sp)
    80b4:	02012983          	lw	s3,32(sp)
    80b8:	02812d03          	lw	s10,40(sp)
    80bc:	000b0c13          	mv	s8,s6
    80c0:	aee04ae3          	bgtz	a4,7bb4 <_dtoa_r+0x1364>
    80c4:	b21ff06f          	j	7be4 <_dtoa_r+0x1394>
    80c8:	00098a13          	mv	s4,s3
    80cc:	02412903          	lw	s2,36(sp)
    80d0:	02012983          	lw	s3,32(sp)
    80d4:	02812d03          	lw	s10,40(sp)
    80d8:	000b0c13          	mv	s8,s6
    80dc:	b09ff06f          	j	7be4 <_dtoa_r+0x1394>
    80e0:	03900793          	li	a5,57
    80e4:	00098a13          	mv	s4,s3
    80e8:	000c0713          	mv	a4,s8
    80ec:	02012983          	lw	s3,32(sp)
    80f0:	02412903          	lw	s2,36(sp)
    80f4:	02812d03          	lw	s10,40(sp)
    80f8:	000b0c13          	mv	s8,s6
    80fc:	f8fb06e3          	beq	s6,a5,8088 <_dtoa_r+0x1838>
    8100:	af9052e3          	blez	s9,7be4 <_dtoa_r+0x1394>
    8104:	03170c13          	addi	s8,a4,49
    8108:	addff06f          	j	7be4 <_dtoa_r+0x1394>
    810c:	04812c83          	lw	s9,72(sp)
    8110:	000c0993          	mv	s3,s8
    8114:	dfdfe06f          	j	6f10 <_dtoa_r+0x6c0>
    8118:	ac0516e3          	bnez	a0,7be4 <_dtoa_r+0x1394>
    811c:	001c7793          	andi	a5,s8,1
    8120:	aa079ae3          	bnez	a5,7bd4 <_dtoa_r+0x1384>
    8124:	ac1ff06f          	j	7be4 <_dtoa_r+0x1394>
    8128:	00200793          	li	a5,2
    812c:	02f12e23          	sw	a5,60(sp)
    8130:	a20ff06f          	j	7350 <_dtoa_r+0xb00>
    8134:	02042e23          	sw	zero,60(s0)
    8138:	00000593          	li	a1,0
    813c:	a49fe06f          	j	6b84 <_dtoa_r+0x334>
    8140:	0000b697          	auipc	a3,0xb
    8144:	8e068693          	addi	a3,a3,-1824 # 12a20 <__clzsi2+0x258>
    8148:	00000613          	li	a2,0
    814c:	2ef00593          	li	a1,751
    8150:	0000b517          	auipc	a0,0xb
    8154:	8e450513          	addi	a0,a0,-1820 # 12a34 <__clzsi2+0x26c>
    8158:	20c040ef          	jal	c364 <__assert_func>
    815c:	40c787b3          	sub	a5,a5,a2
    8160:	00f12e23          	sw	a5,28(sp)
    8164:	000cdc63          	bgez	s9,817c <_dtoa_r+0x192c>
    8168:	01812783          	lw	a5,24(sp)
    816c:	00078713          	mv	a4,a5
    8170:	419787b3          	sub	a5,a5,s9
    8174:	00f12c23          	sw	a5,24(sp)
    8178:	c21fe06f          	j	6d98 <_dtoa_r+0x548>
    817c:	01812783          	lw	a5,24(sp)
    8180:	019a0a33          	add	s4,s4,s9
    8184:	01978733          	add	a4,a5,s9
    8188:	c11fe06f          	j	6d98 <_dtoa_r+0x548>

0000818c <_malloc_trim_r>:
    818c:	fe010113          	addi	sp,sp,-32
    8190:	00812c23          	sw	s0,24(sp)
    8194:	00912a23          	sw	s1,20(sp)
    8198:	01212823          	sw	s2,16(sp)
    819c:	01312623          	sw	s3,12(sp)
    81a0:	00058413          	mv	s0,a1
    81a4:	00112e23          	sw	ra,28(sp)
    81a8:	00050913          	mv	s2,a0
    81ac:	0fff8997          	auipc	s3,0xfff8
    81b0:	21498993          	addi	s3,s3,532 # 100003c0 <__malloc_av_>
    81b4:	6d8010ef          	jal	988c <__malloc_lock>
    81b8:	0089a783          	lw	a5,8(s3)
    81bc:	00001737          	lui	a4,0x1
    81c0:	0047a483          	lw	s1,4(a5)
    81c4:	ffc4f493          	andi	s1,s1,-4
    81c8:	7ff48793          	addi	a5,s1,2047
    81cc:	7f078793          	addi	a5,a5,2032
    81d0:	40878433          	sub	s0,a5,s0
    81d4:	00c45413          	srli	s0,s0,0xc
    81d8:	fff40413          	addi	s0,s0,-1
    81dc:	00c41413          	slli	s0,s0,0xc
    81e0:	00e44e63          	blt	s0,a4,81fc <_malloc_trim_r+0x70>
    81e4:	00000593          	li	a1,0
    81e8:	00090513          	mv	a0,s2
    81ec:	114040ef          	jal	c300 <_sbrk_r>
    81f0:	0089a783          	lw	a5,8(s3)
    81f4:	009787b3          	add	a5,a5,s1
    81f8:	02f50663          	beq	a0,a5,8224 <_malloc_trim_r+0x98>
    81fc:	00090513          	mv	a0,s2
    8200:	698010ef          	jal	9898 <__malloc_unlock>
    8204:	01c12083          	lw	ra,28(sp)
    8208:	01812403          	lw	s0,24(sp)
    820c:	01412483          	lw	s1,20(sp)
    8210:	01012903          	lw	s2,16(sp)
    8214:	00c12983          	lw	s3,12(sp)
    8218:	00000513          	li	a0,0
    821c:	02010113          	addi	sp,sp,32
    8220:	00008067          	ret
    8224:	408005b3          	neg	a1,s0
    8228:	00090513          	mv	a0,s2
    822c:	0d4040ef          	jal	c300 <_sbrk_r>
    8230:	fff00793          	li	a5,-1
    8234:	04f50863          	beq	a0,a5,8284 <_malloc_trim_r+0xf8>
    8238:	0089a703          	lw	a4,8(s3)
    823c:	0fff9797          	auipc	a5,0xfff9
    8240:	89c7a783          	lw	a5,-1892(a5) # 10000ad8 <__malloc_current_mallinfo>
    8244:	408484b3          	sub	s1,s1,s0
    8248:	0014e493          	ori	s1,s1,1
    824c:	00972223          	sw	s1,4(a4) # 1004 <_vfprintf_r+0x90c>
    8250:	00090513          	mv	a0,s2
    8254:	408787b3          	sub	a5,a5,s0
    8258:	0fff9717          	auipc	a4,0xfff9
    825c:	88f72023          	sw	a5,-1920(a4) # 10000ad8 <__malloc_current_mallinfo>
    8260:	638010ef          	jal	9898 <__malloc_unlock>
    8264:	01c12083          	lw	ra,28(sp)
    8268:	01812403          	lw	s0,24(sp)
    826c:	01412483          	lw	s1,20(sp)
    8270:	01012903          	lw	s2,16(sp)
    8274:	00c12983          	lw	s3,12(sp)
    8278:	00100513          	li	a0,1
    827c:	02010113          	addi	sp,sp,32
    8280:	00008067          	ret
    8284:	00000593          	li	a1,0
    8288:	00090513          	mv	a0,s2
    828c:	074040ef          	jal	c300 <_sbrk_r>
    8290:	0089a703          	lw	a4,8(s3)
    8294:	00f00693          	li	a3,15
    8298:	40e507b3          	sub	a5,a0,a4
    829c:	f6f6d0e3          	bge	a3,a5,81fc <_malloc_trim_r+0x70>
    82a0:	0fff8697          	auipc	a3,0xfff8
    82a4:	52c6a683          	lw	a3,1324(a3) # 100007cc <__malloc_sbrk_base>
    82a8:	0017e793          	ori	a5,a5,1
    82ac:	00f72223          	sw	a5,4(a4)
    82b0:	40d50533          	sub	a0,a0,a3
    82b4:	0fff9797          	auipc	a5,0xfff9
    82b8:	82a7a223          	sw	a0,-2012(a5) # 10000ad8 <__malloc_current_mallinfo>
    82bc:	f41ff06f          	j	81fc <_malloc_trim_r+0x70>

000082c0 <_free_r>:
    82c0:	12058463          	beqz	a1,83e8 <_free_r+0x128>
    82c4:	fe010113          	addi	sp,sp,-32
    82c8:	00812c23          	sw	s0,24(sp)
    82cc:	00b12623          	sw	a1,12(sp)
    82d0:	00050413          	mv	s0,a0
    82d4:	00112e23          	sw	ra,28(sp)
    82d8:	5b4010ef          	jal	988c <__malloc_lock>
    82dc:	00c12583          	lw	a1,12(sp)
    82e0:	0fff8897          	auipc	a7,0xfff8
    82e4:	0e088893          	addi	a7,a7,224 # 100003c0 <__malloc_av_>
    82e8:	0088a803          	lw	a6,8(a7)
    82ec:	ffc5a503          	lw	a0,-4(a1)
    82f0:	ff858713          	addi	a4,a1,-8
    82f4:	ffe57793          	andi	a5,a0,-2
    82f8:	00f70633          	add	a2,a4,a5
    82fc:	00462683          	lw	a3,4(a2)
    8300:	00157313          	andi	t1,a0,1
    8304:	ffc6f693          	andi	a3,a3,-4
    8308:	18c80863          	beq	a6,a2,8498 <_free_r+0x1d8>
    830c:	00d62223          	sw	a3,4(a2)
    8310:	00d60833          	add	a6,a2,a3
    8314:	00482803          	lw	a6,4(a6)
    8318:	00187813          	andi	a6,a6,1
    831c:	08031a63          	bnez	t1,83b0 <_free_r+0xf0>
    8320:	ff85a303          	lw	t1,-8(a1)
    8324:	0fff8517          	auipc	a0,0xfff8
    8328:	0a450513          	addi	a0,a0,164 # 100003c8 <__malloc_av_+0x8>
    832c:	40670733          	sub	a4,a4,t1
    8330:	00872583          	lw	a1,8(a4)
    8334:	006787b3          	add	a5,a5,t1
    8338:	12a58a63          	beq	a1,a0,846c <_free_r+0x1ac>
    833c:	00c72303          	lw	t1,12(a4)
    8340:	0065a623          	sw	t1,12(a1)
    8344:	00b32423          	sw	a1,8(t1)
    8348:	1a080063          	beqz	a6,84e8 <_free_r+0x228>
    834c:	0017e693          	ori	a3,a5,1
    8350:	00d72223          	sw	a3,4(a4)
    8354:	00f62023          	sw	a5,0(a2)
    8358:	1ff00693          	li	a3,511
    835c:	0af6e263          	bltu	a3,a5,8400 <_free_r+0x140>
    8360:	ff87f693          	andi	a3,a5,-8
    8364:	00868693          	addi	a3,a3,8
    8368:	0048a583          	lw	a1,4(a7)
    836c:	00d886b3          	add	a3,a7,a3
    8370:	0006a603          	lw	a2,0(a3)
    8374:	0057d513          	srli	a0,a5,0x5
    8378:	00100793          	li	a5,1
    837c:	00a797b3          	sll	a5,a5,a0
    8380:	00b7e7b3          	or	a5,a5,a1
    8384:	ff868593          	addi	a1,a3,-8
    8388:	00c72423          	sw	a2,8(a4)
    838c:	00b72623          	sw	a1,12(a4)
    8390:	00f8a223          	sw	a5,4(a7)
    8394:	00e6a023          	sw	a4,0(a3)
    8398:	00e62623          	sw	a4,12(a2)
    839c:	00040513          	mv	a0,s0
    83a0:	01812403          	lw	s0,24(sp)
    83a4:	01c12083          	lw	ra,28(sp)
    83a8:	02010113          	addi	sp,sp,32
    83ac:	4ec0106f          	j	9898 <__malloc_unlock>
    83b0:	02081e63          	bnez	a6,83ec <_free_r+0x12c>
    83b4:	00d787b3          	add	a5,a5,a3
    83b8:	0fff8517          	auipc	a0,0xfff8
    83bc:	01050513          	addi	a0,a0,16 # 100003c8 <__malloc_av_+0x8>
    83c0:	00862683          	lw	a3,8(a2)
    83c4:	0017e813          	ori	a6,a5,1
    83c8:	00f705b3          	add	a1,a4,a5
    83cc:	16a68463          	beq	a3,a0,8534 <_free_r+0x274>
    83d0:	00c62603          	lw	a2,12(a2)
    83d4:	00c6a623          	sw	a2,12(a3)
    83d8:	00d62423          	sw	a3,8(a2)
    83dc:	01072223          	sw	a6,4(a4)
    83e0:	00f5a023          	sw	a5,0(a1)
    83e4:	f75ff06f          	j	8358 <_free_r+0x98>
    83e8:	00008067          	ret
    83ec:	00156513          	ori	a0,a0,1
    83f0:	fea5ae23          	sw	a0,-4(a1)
    83f4:	00f62023          	sw	a5,0(a2)
    83f8:	1ff00693          	li	a3,511
    83fc:	f6f6f2e3          	bgeu	a3,a5,8360 <_free_r+0xa0>
    8400:	0097d693          	srli	a3,a5,0x9
    8404:	00400613          	li	a2,4
    8408:	0ed66463          	bltu	a2,a3,84f0 <_free_r+0x230>
    840c:	0067d693          	srli	a3,a5,0x6
    8410:	03968593          	addi	a1,a3,57
    8414:	00359593          	slli	a1,a1,0x3
    8418:	03868613          	addi	a2,a3,56
    841c:	00b885b3          	add	a1,a7,a1
    8420:	0005a683          	lw	a3,0(a1)
    8424:	ff858593          	addi	a1,a1,-8
    8428:	00d59863          	bne	a1,a3,8438 <_free_r+0x178>
    842c:	1240006f          	j	8550 <_free_r+0x290>
    8430:	0086a683          	lw	a3,8(a3)
    8434:	00d58863          	beq	a1,a3,8444 <_free_r+0x184>
    8438:	0046a603          	lw	a2,4(a3)
    843c:	ffc67613          	andi	a2,a2,-4
    8440:	fec7e8e3          	bltu	a5,a2,8430 <_free_r+0x170>
    8444:	00c6a583          	lw	a1,12(a3)
    8448:	00b72623          	sw	a1,12(a4)
    844c:	00d72423          	sw	a3,8(a4)
    8450:	00040513          	mv	a0,s0
    8454:	01812403          	lw	s0,24(sp)
    8458:	01c12083          	lw	ra,28(sp)
    845c:	00e5a423          	sw	a4,8(a1)
    8460:	00e6a623          	sw	a4,12(a3)
    8464:	02010113          	addi	sp,sp,32
    8468:	4300106f          	j	9898 <__malloc_unlock>
    846c:	0a081463          	bnez	a6,8514 <_free_r+0x254>
    8470:	00c62583          	lw	a1,12(a2)
    8474:	00862603          	lw	a2,8(a2)
    8478:	00f686b3          	add	a3,a3,a5
    847c:	0016e793          	ori	a5,a3,1
    8480:	00b62623          	sw	a1,12(a2)
    8484:	00c5a423          	sw	a2,8(a1)
    8488:	00f72223          	sw	a5,4(a4)
    848c:	00d70733          	add	a4,a4,a3
    8490:	00d72023          	sw	a3,0(a4)
    8494:	f09ff06f          	j	839c <_free_r+0xdc>
    8498:	00d786b3          	add	a3,a5,a3
    849c:	02031063          	bnez	t1,84bc <_free_r+0x1fc>
    84a0:	ff85a783          	lw	a5,-8(a1)
    84a4:	40f70733          	sub	a4,a4,a5
    84a8:	00872603          	lw	a2,8(a4)
    84ac:	00f686b3          	add	a3,a3,a5
    84b0:	00c72783          	lw	a5,12(a4)
    84b4:	00f62623          	sw	a5,12(a2)
    84b8:	00c7a423          	sw	a2,8(a5)
    84bc:	0016e613          	ori	a2,a3,1
    84c0:	0fff8797          	auipc	a5,0xfff8
    84c4:	3107a783          	lw	a5,784(a5) # 100007d0 <__malloc_trim_threshold>
    84c8:	00c72223          	sw	a2,4(a4)
    84cc:	00e8a423          	sw	a4,8(a7)
    84d0:	ecf6e6e3          	bltu	a3,a5,839c <_free_r+0xdc>
    84d4:	0fff8597          	auipc	a1,0xfff8
    84d8:	6605a583          	lw	a1,1632(a1) # 10000b34 <__malloc_top_pad>
    84dc:	00040513          	mv	a0,s0
    84e0:	cadff0ef          	jal	818c <_malloc_trim_r>
    84e4:	eb9ff06f          	j	839c <_free_r+0xdc>
    84e8:	00d787b3          	add	a5,a5,a3
    84ec:	ed5ff06f          	j	83c0 <_free_r+0x100>
    84f0:	01400613          	li	a2,20
    84f4:	02d67863          	bgeu	a2,a3,8524 <_free_r+0x264>
    84f8:	05400613          	li	a2,84
    84fc:	06d66863          	bltu	a2,a3,856c <_free_r+0x2ac>
    8500:	00c7d693          	srli	a3,a5,0xc
    8504:	06f68593          	addi	a1,a3,111
    8508:	00359593          	slli	a1,a1,0x3
    850c:	06e68613          	addi	a2,a3,110
    8510:	f0dff06f          	j	841c <_free_r+0x15c>
    8514:	0017e693          	ori	a3,a5,1
    8518:	00d72223          	sw	a3,4(a4)
    851c:	00f62023          	sw	a5,0(a2)
    8520:	e7dff06f          	j	839c <_free_r+0xdc>
    8524:	05c68593          	addi	a1,a3,92
    8528:	00359593          	slli	a1,a1,0x3
    852c:	05b68613          	addi	a2,a3,91
    8530:	eedff06f          	j	841c <_free_r+0x15c>
    8534:	00e8aa23          	sw	a4,20(a7)
    8538:	00e8a823          	sw	a4,16(a7)
    853c:	00a72623          	sw	a0,12(a4)
    8540:	00a72423          	sw	a0,8(a4)
    8544:	01072223          	sw	a6,4(a4)
    8548:	00f5a023          	sw	a5,0(a1)
    854c:	e51ff06f          	j	839c <_free_r+0xdc>
    8550:	0048a503          	lw	a0,4(a7)
    8554:	40265613          	srai	a2,a2,0x2
    8558:	00100793          	li	a5,1
    855c:	00c797b3          	sll	a5,a5,a2
    8560:	00a7e7b3          	or	a5,a5,a0
    8564:	00f8a223          	sw	a5,4(a7)
    8568:	ee1ff06f          	j	8448 <_free_r+0x188>
    856c:	15400613          	li	a2,340
    8570:	00d66c63          	bltu	a2,a3,8588 <_free_r+0x2c8>
    8574:	00f7d693          	srli	a3,a5,0xf
    8578:	07868593          	addi	a1,a3,120
    857c:	00359593          	slli	a1,a1,0x3
    8580:	07768613          	addi	a2,a3,119
    8584:	e99ff06f          	j	841c <_free_r+0x15c>
    8588:	55400613          	li	a2,1364
    858c:	00d66c63          	bltu	a2,a3,85a4 <_free_r+0x2e4>
    8590:	0127d693          	srli	a3,a5,0x12
    8594:	07d68593          	addi	a1,a3,125
    8598:	00359593          	slli	a1,a1,0x3
    859c:	07c68613          	addi	a2,a3,124
    85a0:	e7dff06f          	j	841c <_free_r+0x15c>
    85a4:	3f800593          	li	a1,1016
    85a8:	07e00613          	li	a2,126
    85ac:	e71ff06f          	j	841c <_free_r+0x15c>

000085b0 <_findenv_r>:
    85b0:	fd010113          	addi	sp,sp,-48
    85b4:	01412c23          	sw	s4,24(sp)
    85b8:	0fff8a17          	auipc	s4,0xfff8
    85bc:	21ca0a13          	addi	s4,s4,540 # 100007d4 <environ>
    85c0:	02912223          	sw	s1,36(sp)
    85c4:	03212023          	sw	s2,32(sp)
    85c8:	01512a23          	sw	s5,20(sp)
    85cc:	01612823          	sw	s6,16(sp)
    85d0:	02112623          	sw	ra,44(sp)
    85d4:	00058913          	mv	s2,a1
    85d8:	00060b13          	mv	s6,a2
    85dc:	00050a93          	mv	s5,a0
    85e0:	781030ef          	jal	c560 <__env_lock>
    85e4:	000a2483          	lw	s1,0(s4)
    85e8:	06048e63          	beqz	s1,8664 <_findenv_r+0xb4>
    85ec:	01312e23          	sw	s3,28(sp)
    85f0:	00094783          	lbu	a5,0(s2)
    85f4:	0e078863          	beqz	a5,86e4 <_findenv_r+0x134>
    85f8:	fc378713          	addi	a4,a5,-61
    85fc:	00090613          	mv	a2,s2
    8600:	0e070263          	beqz	a4,86e4 <_findenv_r+0x134>
    8604:	00164783          	lbu	a5,1(a2)
    8608:	00160613          	addi	a2,a2,1
    860c:	fc378713          	addi	a4,a5,-61
    8610:	00078463          	beqz	a5,8618 <_findenv_r+0x68>
    8614:	fe0718e3          	bnez	a4,8604 <_findenv_r+0x54>
    8618:	03d00993          	li	s3,61
    861c:	0d378063          	beq	a5,s3,86dc <_findenv_r+0x12c>
    8620:	0004a503          	lw	a0,0(s1)
    8624:	0a050c63          	beqz	a0,86dc <_findenv_r+0x12c>
    8628:	02812423          	sw	s0,40(sp)
    862c:	41260433          	sub	s0,a2,s2
    8630:	00040613          	mv	a2,s0
    8634:	00090593          	mv	a1,s2
    8638:	36d030ef          	jal	c1a4 <strncmp>
    863c:	00051a63          	bnez	a0,8650 <_findenv_r+0xa0>
    8640:	0004a783          	lw	a5,0(s1)
    8644:	008787b3          	add	a5,a5,s0
    8648:	0007c703          	lbu	a4,0(a5)
    864c:	05370263          	beq	a4,s3,8690 <_findenv_r+0xe0>
    8650:	0044a503          	lw	a0,4(s1)
    8654:	00448493          	addi	s1,s1,4
    8658:	fc051ce3          	bnez	a0,8630 <_findenv_r+0x80>
    865c:	02812403          	lw	s0,40(sp)
    8660:	01c12983          	lw	s3,28(sp)
    8664:	000a8513          	mv	a0,s5
    8668:	705030ef          	jal	c56c <__env_unlock>
    866c:	02c12083          	lw	ra,44(sp)
    8670:	02412483          	lw	s1,36(sp)
    8674:	02012903          	lw	s2,32(sp)
    8678:	01812a03          	lw	s4,24(sp)
    867c:	01412a83          	lw	s5,20(sp)
    8680:	01012b03          	lw	s6,16(sp)
    8684:	00000513          	li	a0,0
    8688:	03010113          	addi	sp,sp,48
    868c:	00008067          	ret
    8690:	000a2703          	lw	a4,0(s4)
    8694:	000a8513          	mv	a0,s5
    8698:	00f12623          	sw	a5,12(sp)
    869c:	40e484b3          	sub	s1,s1,a4
    86a0:	4024d493          	srai	s1,s1,0x2
    86a4:	009b2023          	sw	s1,0(s6)
    86a8:	6c5030ef          	jal	c56c <__env_unlock>
    86ac:	00c12783          	lw	a5,12(sp)
    86b0:	02812403          	lw	s0,40(sp)
    86b4:	02c12083          	lw	ra,44(sp)
    86b8:	01c12983          	lw	s3,28(sp)
    86bc:	02412483          	lw	s1,36(sp)
    86c0:	02012903          	lw	s2,32(sp)
    86c4:	01812a03          	lw	s4,24(sp)
    86c8:	01412a83          	lw	s5,20(sp)
    86cc:	01012b03          	lw	s6,16(sp)
    86d0:	00178513          	addi	a0,a5,1
    86d4:	03010113          	addi	sp,sp,48
    86d8:	00008067          	ret
    86dc:	01c12983          	lw	s3,28(sp)
    86e0:	f85ff06f          	j	8664 <_findenv_r+0xb4>
    86e4:	00090613          	mv	a2,s2
    86e8:	f31ff06f          	j	8618 <_findenv_r+0x68>

000086ec <_getenv_r>:
    86ec:	fe010113          	addi	sp,sp,-32
    86f0:	00c10613          	addi	a2,sp,12
    86f4:	00112e23          	sw	ra,28(sp)
    86f8:	eb9ff0ef          	jal	85b0 <_findenv_r>
    86fc:	01c12083          	lw	ra,28(sp)
    8700:	02010113          	addi	sp,sp,32
    8704:	00008067          	ret

00008708 <_malloc_r>:
    8708:	fc010113          	addi	sp,sp,-64
    870c:	02812c23          	sw	s0,56(sp)
    8710:	02112e23          	sw	ra,60(sp)
    8714:	00b58793          	addi	a5,a1,11
    8718:	01600713          	li	a4,22
    871c:	00050413          	mv	s0,a0
    8720:	08f76e63          	bltu	a4,a5,87bc <_malloc_r+0xb4>
    8724:	01000693          	li	a3,16
    8728:	06b6ec63          	bltu	a3,a1,87a0 <_malloc_r+0x98>
    872c:	160010ef          	jal	988c <__malloc_lock>
    8730:	01000693          	li	a3,16
    8734:	01800713          	li	a4,24
    8738:	00200893          	li	a7,2
    873c:	0fff8817          	auipc	a6,0xfff8
    8740:	c8480813          	addi	a6,a6,-892 # 100003c0 <__malloc_av_>
    8744:	00e80733          	add	a4,a6,a4
    8748:	00472783          	lw	a5,4(a4)
    874c:	ff870613          	addi	a2,a4,-8
    8750:	46c78e63          	beq	a5,a2,8bcc <_malloc_r+0x4c4>
    8754:	0047a703          	lw	a4,4(a5)
    8758:	00c7a603          	lw	a2,12(a5)
    875c:	0087a583          	lw	a1,8(a5)
    8760:	ffc77713          	andi	a4,a4,-4
    8764:	00e78733          	add	a4,a5,a4
    8768:	00472683          	lw	a3,4(a4)
    876c:	00c5a623          	sw	a2,12(a1)
    8770:	00f12623          	sw	a5,12(sp)
    8774:	00b62423          	sw	a1,8(a2)
    8778:	0016e693          	ori	a3,a3,1
    877c:	00040513          	mv	a0,s0
    8780:	00d72223          	sw	a3,4(a4)
    8784:	114010ef          	jal	9898 <__malloc_unlock>
    8788:	00c12783          	lw	a5,12(sp)
    878c:	03c12083          	lw	ra,60(sp)
    8790:	03812403          	lw	s0,56(sp)
    8794:	00878513          	addi	a0,a5,8
    8798:	04010113          	addi	sp,sp,64
    879c:	00008067          	ret
    87a0:	00c00793          	li	a5,12
    87a4:	00f42023          	sw	a5,0(s0)
    87a8:	00000513          	li	a0,0
    87ac:	03c12083          	lw	ra,60(sp)
    87b0:	03812403          	lw	s0,56(sp)
    87b4:	04010113          	addi	sp,sp,64
    87b8:	00008067          	ret
    87bc:	ff87f693          	andi	a3,a5,-8
    87c0:	fe07c0e3          	bltz	a5,87a0 <_malloc_r+0x98>
    87c4:	fcb6eee3          	bltu	a3,a1,87a0 <_malloc_r+0x98>
    87c8:	00d12623          	sw	a3,12(sp)
    87cc:	0c0010ef          	jal	988c <__malloc_lock>
    87d0:	00c12683          	lw	a3,12(sp)
    87d4:	1f700793          	li	a5,503
    87d8:	4ed7f863          	bgeu	a5,a3,8cc8 <_malloc_r+0x5c0>
    87dc:	0096d793          	srli	a5,a3,0x9
    87e0:	16078e63          	beqz	a5,895c <_malloc_r+0x254>
    87e4:	00400713          	li	a4,4
    87e8:	44f76a63          	bltu	a4,a5,8c3c <_malloc_r+0x534>
    87ec:	0066d793          	srli	a5,a3,0x6
    87f0:	03978893          	addi	a7,a5,57
    87f4:	03878e13          	addi	t3,a5,56
    87f8:	00389513          	slli	a0,a7,0x3
    87fc:	0fff8817          	auipc	a6,0xfff8
    8800:	bc480813          	addi	a6,a6,-1084 # 100003c0 <__malloc_av_>
    8804:	00a80533          	add	a0,a6,a0
    8808:	00452783          	lw	a5,4(a0)
    880c:	ff850513          	addi	a0,a0,-8
    8810:	02f50863          	beq	a0,a5,8840 <_malloc_r+0x138>
    8814:	00f00313          	li	t1,15
    8818:	0140006f          	j	882c <_malloc_r+0x124>
    881c:	00c7a583          	lw	a1,12(a5)
    8820:	36065663          	bgez	a2,8b8c <_malloc_r+0x484>
    8824:	00b50e63          	beq	a0,a1,8840 <_malloc_r+0x138>
    8828:	00058793          	mv	a5,a1
    882c:	0047a703          	lw	a4,4(a5)
    8830:	ffc77713          	andi	a4,a4,-4
    8834:	40d70633          	sub	a2,a4,a3
    8838:	fec352e3          	bge	t1,a2,881c <_malloc_r+0x114>
    883c:	000e0893          	mv	a7,t3
    8840:	01082783          	lw	a5,16(a6)
    8844:	0fff8e97          	auipc	t4,0xfff8
    8848:	b84e8e93          	addi	t4,t4,-1148 # 100003c8 <__malloc_av_+0x8>
    884c:	2fd78e63          	beq	a5,t4,8b48 <_malloc_r+0x440>
    8850:	0047a703          	lw	a4,4(a5)
    8854:	00f00593          	li	a1,15
    8858:	ffc77713          	andi	a4,a4,-4
    885c:	40d70633          	sub	a2,a4,a3
    8860:	48c5ce63          	blt	a1,a2,8cfc <_malloc_r+0x5f4>
    8864:	01d82a23          	sw	t4,20(a6)
    8868:	01d82823          	sw	t4,16(a6)
    886c:	46065463          	bgez	a2,8cd4 <_malloc_r+0x5cc>
    8870:	1ff00613          	li	a2,511
    8874:	00482303          	lw	t1,4(a6)
    8878:	36e66263          	bltu	a2,a4,8bdc <_malloc_r+0x4d4>
    887c:	ff877613          	andi	a2,a4,-8
    8880:	00860613          	addi	a2,a2,8
    8884:	00c80633          	add	a2,a6,a2
    8888:	00062583          	lw	a1,0(a2)
    888c:	00575513          	srli	a0,a4,0x5
    8890:	00100713          	li	a4,1
    8894:	00a71733          	sll	a4,a4,a0
    8898:	00e36333          	or	t1,t1,a4
    889c:	ff860713          	addi	a4,a2,-8
    88a0:	00b7a423          	sw	a1,8(a5)
    88a4:	00e7a623          	sw	a4,12(a5)
    88a8:	00682223          	sw	t1,4(a6)
    88ac:	00f62023          	sw	a5,0(a2)
    88b0:	00f5a623          	sw	a5,12(a1)
    88b4:	4028d793          	srai	a5,a7,0x2
    88b8:	00100513          	li	a0,1
    88bc:	00f51533          	sll	a0,a0,a5
    88c0:	0aa36663          	bltu	t1,a0,896c <_malloc_r+0x264>
    88c4:	006577b3          	and	a5,a0,t1
    88c8:	02079463          	bnez	a5,88f0 <_malloc_r+0x1e8>
    88cc:	00151513          	slli	a0,a0,0x1
    88d0:	ffc8f893          	andi	a7,a7,-4
    88d4:	006577b3          	and	a5,a0,t1
    88d8:	00488893          	addi	a7,a7,4
    88dc:	00079a63          	bnez	a5,88f0 <_malloc_r+0x1e8>
    88e0:	00151513          	slli	a0,a0,0x1
    88e4:	006577b3          	and	a5,a0,t1
    88e8:	00488893          	addi	a7,a7,4
    88ec:	fe078ae3          	beqz	a5,88e0 <_malloc_r+0x1d8>
    88f0:	00f00e13          	li	t3,15
    88f4:	00389f13          	slli	t5,a7,0x3
    88f8:	01e80f33          	add	t5,a6,t5
    88fc:	000f0313          	mv	t1,t5
    8900:	00c32703          	lw	a4,12(t1)
    8904:	00088f93          	mv	t6,a7
    8908:	34e30c63          	beq	t1,a4,8c60 <_malloc_r+0x558>
    890c:	00472603          	lw	a2,4(a4)
    8910:	00070793          	mv	a5,a4
    8914:	00c72703          	lw	a4,12(a4)
    8918:	ffc67613          	andi	a2,a2,-4
    891c:	40d605b3          	sub	a1,a2,a3
    8920:	34be4c63          	blt	t3,a1,8c78 <_malloc_r+0x570>
    8924:	fe05c2e3          	bltz	a1,8908 <_malloc_r+0x200>
    8928:	00c78633          	add	a2,a5,a2
    892c:	00462683          	lw	a3,4(a2)
    8930:	0087a583          	lw	a1,8(a5)
    8934:	00040513          	mv	a0,s0
    8938:	0016e693          	ori	a3,a3,1
    893c:	00d62223          	sw	a3,4(a2)
    8940:	00e5a623          	sw	a4,12(a1)
    8944:	00b72423          	sw	a1,8(a4)
    8948:	00f12623          	sw	a5,12(sp)
    894c:	74d000ef          	jal	9898 <__malloc_unlock>
    8950:	00c12783          	lw	a5,12(sp)
    8954:	00878513          	addi	a0,a5,8
    8958:	e55ff06f          	j	87ac <_malloc_r+0xa4>
    895c:	20000513          	li	a0,512
    8960:	04000893          	li	a7,64
    8964:	03f00e13          	li	t3,63
    8968:	e95ff06f          	j	87fc <_malloc_r+0xf4>
    896c:	00882783          	lw	a5,8(a6)
    8970:	0047a703          	lw	a4,4(a5)
    8974:	ffc77313          	andi	t1,a4,-4
    8978:	40d30633          	sub	a2,t1,a3
    897c:	00d36663          	bltu	t1,a3,8988 <_malloc_r+0x280>
    8980:	01062713          	slti	a4,a2,16
    8984:	1c070663          	beqz	a4,8b50 <_malloc_r+0x448>
    8988:	0fff8597          	auipc	a1,0xfff8
    898c:	1ac5a583          	lw	a1,428(a1) # 10000b34 <__malloc_top_pad>
    8990:	0fff8617          	auipc	a2,0xfff8
    8994:	e3c62603          	lw	a2,-452(a2) # 100007cc <__malloc_sbrk_base>
    8998:	fff00713          	li	a4,-1
    899c:	00b685b3          	add	a1,a3,a1
    89a0:	44e60263          	beq	a2,a4,8de4 <_malloc_r+0x6dc>
    89a4:	00001737          	lui	a4,0x1
    89a8:	00f70713          	addi	a4,a4,15 # 100f <_vfprintf_r+0x917>
    89ac:	00e585b3          	add	a1,a1,a4
    89b0:	fffff737          	lui	a4,0xfffff
    89b4:	00e5f5b3          	and	a1,a1,a4
    89b8:	00040513          	mv	a0,s0
    89bc:	01012e23          	sw	a6,28(sp)
    89c0:	00f12c23          	sw	a5,24(sp)
    89c4:	00d12a23          	sw	a3,20(sp)
    89c8:	00612823          	sw	t1,16(sp)
    89cc:	00b12623          	sw	a1,12(sp)
    89d0:	131030ef          	jal	c300 <_sbrk_r>
    89d4:	fff00713          	li	a4,-1
    89d8:	00c12583          	lw	a1,12(sp)
    89dc:	01012303          	lw	t1,16(sp)
    89e0:	01412683          	lw	a3,20(sp)
    89e4:	01812783          	lw	a5,24(sp)
    89e8:	01c12803          	lw	a6,28(sp)
    89ec:	00050e13          	mv	t3,a0
    89f0:	0fff8f17          	auipc	t5,0xfff8
    89f4:	ddcf0f13          	addi	t5,t5,-548 # 100007cc <__malloc_sbrk_base>
    89f8:	36e50063          	beq	a0,a4,8d58 <_malloc_r+0x650>
    89fc:	00678733          	add	a4,a5,t1
    8a00:	34e56a63          	bltu	a0,a4,8d54 <_malloc_r+0x64c>
    8a04:	0fff8e97          	auipc	t4,0xfff8
    8a08:	0d4e8e93          	addi	t4,t4,212 # 10000ad8 <__malloc_current_mallinfo>
    8a0c:	000ea603          	lw	a2,0(t4)
    8a10:	00c58633          	add	a2,a1,a2
    8a14:	00cea023          	sw	a2,0(t4)
    8a18:	4aa70463          	beq	a4,a0,8ec0 <_malloc_r+0x7b8>
    8a1c:	000f2883          	lw	a7,0(t5)
    8a20:	fff00513          	li	a0,-1
    8a24:	4aa88c63          	beq	a7,a0,8edc <_malloc_r+0x7d4>
    8a28:	40ee0733          	sub	a4,t3,a4
    8a2c:	00c70733          	add	a4,a4,a2
    8a30:	00eea023          	sw	a4,0(t4)
    8a34:	007e7f13          	andi	t5,t3,7
    8a38:	3c0f0663          	beqz	t5,8e04 <_malloc_r+0x6fc>
    8a3c:	ff8e7e13          	andi	t3,t3,-8
    8a40:	000018b7          	lui	a7,0x1
    8a44:	008e0e13          	addi	t3,t3,8
    8a48:	00888893          	addi	a7,a7,8 # 1008 <_vfprintf_r+0x910>
    8a4c:	00be0633          	add	a2,t3,a1
    8a50:	41e885b3          	sub	a1,a7,t5
    8a54:	40c585b3          	sub	a1,a1,a2
    8a58:	01459593          	slli	a1,a1,0x14
    8a5c:	0145d593          	srli	a1,a1,0x14
    8a60:	00040513          	mv	a0,s0
    8a64:	03d12623          	sw	t4,44(sp)
    8a68:	03012423          	sw	a6,40(sp)
    8a6c:	02f12223          	sw	a5,36(sp)
    8a70:	02d12023          	sw	a3,32(sp)
    8a74:	00612e23          	sw	t1,28(sp)
    8a78:	01c12c23          	sw	t3,24(sp)
    8a7c:	01e12a23          	sw	t5,20(sp)
    8a80:	00c12823          	sw	a2,16(sp)
    8a84:	00b12623          	sw	a1,12(sp)
    8a88:	079030ef          	jal	c300 <_sbrk_r>
    8a8c:	00050713          	mv	a4,a0
    8a90:	fff00513          	li	a0,-1
    8a94:	00c12583          	lw	a1,12(sp)
    8a98:	01012603          	lw	a2,16(sp)
    8a9c:	01412f03          	lw	t5,20(sp)
    8aa0:	01812e03          	lw	t3,24(sp)
    8aa4:	01c12303          	lw	t1,28(sp)
    8aa8:	02012683          	lw	a3,32(sp)
    8aac:	02412783          	lw	a5,36(sp)
    8ab0:	02812803          	lw	a6,40(sp)
    8ab4:	02c12e83          	lw	t4,44(sp)
    8ab8:	46a70863          	beq	a4,a0,8f28 <_malloc_r+0x820>
    8abc:	000ea603          	lw	a2,0(t4)
    8ac0:	41c70733          	sub	a4,a4,t3
    8ac4:	00b70733          	add	a4,a4,a1
    8ac8:	00176713          	ori	a4,a4,1
    8acc:	01c82423          	sw	t3,8(a6)
    8ad0:	00c58633          	add	a2,a1,a2
    8ad4:	00ee2223          	sw	a4,4(t3)
    8ad8:	00cea023          	sw	a2,0(t4)
    8adc:	03078e63          	beq	a5,a6,8b18 <_malloc_r+0x410>
    8ae0:	00f00513          	li	a0,15
    8ae4:	40657063          	bgeu	a0,t1,8ee4 <_malloc_r+0x7dc>
    8ae8:	0047a583          	lw	a1,4(a5)
    8aec:	ff430713          	addi	a4,t1,-12
    8af0:	ff877713          	andi	a4,a4,-8
    8af4:	0015f593          	andi	a1,a1,1
    8af8:	00e5e5b3          	or	a1,a1,a4
    8afc:	00b7a223          	sw	a1,4(a5)
    8b00:	00500893          	li	a7,5
    8b04:	00e785b3          	add	a1,a5,a4
    8b08:	0115a223          	sw	a7,4(a1)
    8b0c:	0115a423          	sw	a7,8(a1)
    8b10:	42e56463          	bltu	a0,a4,8f38 <_malloc_r+0x830>
    8b14:	004e2703          	lw	a4,4(t3)
    8b18:	0fff8797          	auipc	a5,0xfff8
    8b1c:	0187a783          	lw	a5,24(a5) # 10000b30 <__malloc_max_sbrked_mem>
    8b20:	00c7f663          	bgeu	a5,a2,8b2c <_malloc_r+0x424>
    8b24:	0fff8797          	auipc	a5,0xfff8
    8b28:	00c7a623          	sw	a2,12(a5) # 10000b30 <__malloc_max_sbrked_mem>
    8b2c:	0fff8797          	auipc	a5,0xfff8
    8b30:	0007a783          	lw	a5,0(a5) # 10000b2c <__malloc_max_total_mem>
    8b34:	00c7f663          	bgeu	a5,a2,8b40 <_malloc_r+0x438>
    8b38:	0fff8797          	auipc	a5,0xfff8
    8b3c:	fec7aa23          	sw	a2,-12(a5) # 10000b2c <__malloc_max_total_mem>
    8b40:	000e0793          	mv	a5,t3
    8b44:	21c0006f          	j	8d60 <_malloc_r+0x658>
    8b48:	00482303          	lw	t1,4(a6)
    8b4c:	d69ff06f          	j	88b4 <_malloc_r+0x1ac>
    8b50:	0016e713          	ori	a4,a3,1
    8b54:	00e7a223          	sw	a4,4(a5)
    8b58:	00d786b3          	add	a3,a5,a3
    8b5c:	00166613          	ori	a2,a2,1
    8b60:	00d82423          	sw	a3,8(a6)
    8b64:	00040513          	mv	a0,s0
    8b68:	00c6a223          	sw	a2,4(a3)
    8b6c:	00f12623          	sw	a5,12(sp)
    8b70:	529000ef          	jal	9898 <__malloc_unlock>
    8b74:	00c12783          	lw	a5,12(sp)
    8b78:	03c12083          	lw	ra,60(sp)
    8b7c:	03812403          	lw	s0,56(sp)
    8b80:	00878513          	addi	a0,a5,8
    8b84:	04010113          	addi	sp,sp,64
    8b88:	00008067          	ret
    8b8c:	0087a603          	lw	a2,8(a5)
    8b90:	00e78733          	add	a4,a5,a4
    8b94:	00472683          	lw	a3,4(a4) # fffff004 <_stack_top+0xefffb004>
    8b98:	00b62623          	sw	a1,12(a2)
    8b9c:	00f12623          	sw	a5,12(sp)
    8ba0:	0016e693          	ori	a3,a3,1
    8ba4:	00c5a423          	sw	a2,8(a1)
    8ba8:	00040513          	mv	a0,s0
    8bac:	00d72223          	sw	a3,4(a4)
    8bb0:	4e9000ef          	jal	9898 <__malloc_unlock>
    8bb4:	00c12783          	lw	a5,12(sp)
    8bb8:	03c12083          	lw	ra,60(sp)
    8bbc:	03812403          	lw	s0,56(sp)
    8bc0:	00878513          	addi	a0,a5,8
    8bc4:	04010113          	addi	sp,sp,64
    8bc8:	00008067          	ret
    8bcc:	00c72783          	lw	a5,12(a4)
    8bd0:	00288893          	addi	a7,a7,2
    8bd4:	c6f706e3          	beq	a4,a5,8840 <_malloc_r+0x138>
    8bd8:	b7dff06f          	j	8754 <_malloc_r+0x4c>
    8bdc:	00975613          	srli	a2,a4,0x9
    8be0:	00400593          	li	a1,4
    8be4:	14c5fe63          	bgeu	a1,a2,8d40 <_malloc_r+0x638>
    8be8:	01400593          	li	a1,20
    8bec:	28c5e263          	bltu	a1,a2,8e70 <_malloc_r+0x768>
    8bf0:	05c60513          	addi	a0,a2,92
    8bf4:	00351513          	slli	a0,a0,0x3
    8bf8:	05b60593          	addi	a1,a2,91
    8bfc:	00a80533          	add	a0,a6,a0
    8c00:	00052603          	lw	a2,0(a0)
    8c04:	ff850513          	addi	a0,a0,-8
    8c08:	00c51863          	bne	a0,a2,8c18 <_malloc_r+0x510>
    8c0c:	1e00006f          	j	8dec <_malloc_r+0x6e4>
    8c10:	00862603          	lw	a2,8(a2)
    8c14:	00c50863          	beq	a0,a2,8c24 <_malloc_r+0x51c>
    8c18:	00462583          	lw	a1,4(a2)
    8c1c:	ffc5f593          	andi	a1,a1,-4
    8c20:	feb768e3          	bltu	a4,a1,8c10 <_malloc_r+0x508>
    8c24:	00c62503          	lw	a0,12(a2)
    8c28:	00a7a623          	sw	a0,12(a5)
    8c2c:	00c7a423          	sw	a2,8(a5)
    8c30:	00f52423          	sw	a5,8(a0)
    8c34:	00f62623          	sw	a5,12(a2)
    8c38:	c7dff06f          	j	88b4 <_malloc_r+0x1ac>
    8c3c:	01400713          	li	a4,20
    8c40:	14f77063          	bgeu	a4,a5,8d80 <_malloc_r+0x678>
    8c44:	05400713          	li	a4,84
    8c48:	24f76263          	bltu	a4,a5,8e8c <_malloc_r+0x784>
    8c4c:	00c6d793          	srli	a5,a3,0xc
    8c50:	06f78893          	addi	a7,a5,111
    8c54:	06e78e13          	addi	t3,a5,110
    8c58:	00389513          	slli	a0,a7,0x3
    8c5c:	ba1ff06f          	j	87fc <_malloc_r+0xf4>
    8c60:	001f8f93          	addi	t6,t6,1 # 80000001 <_stack_top+0x6fffc001>
    8c64:	003ff793          	andi	a5,t6,3
    8c68:	00830313          	addi	t1,t1,8
    8c6c:	12078863          	beqz	a5,8d9c <_malloc_r+0x694>
    8c70:	00c32703          	lw	a4,12(t1)
    8c74:	c95ff06f          	j	8908 <_malloc_r+0x200>
    8c78:	0087a503          	lw	a0,8(a5)
    8c7c:	0016e893          	ori	a7,a3,1
    8c80:	0117a223          	sw	a7,4(a5)
    8c84:	00e52623          	sw	a4,12(a0)
    8c88:	00a72423          	sw	a0,8(a4)
    8c8c:	00d786b3          	add	a3,a5,a3
    8c90:	00d82a23          	sw	a3,20(a6)
    8c94:	00d82823          	sw	a3,16(a6)
    8c98:	0015e713          	ori	a4,a1,1
    8c9c:	00c78633          	add	a2,a5,a2
    8ca0:	01d6a623          	sw	t4,12(a3)
    8ca4:	01d6a423          	sw	t4,8(a3)
    8ca8:	00e6a223          	sw	a4,4(a3)
    8cac:	00040513          	mv	a0,s0
    8cb0:	00b62023          	sw	a1,0(a2)
    8cb4:	00f12623          	sw	a5,12(sp)
    8cb8:	3e1000ef          	jal	9898 <__malloc_unlock>
    8cbc:	00c12783          	lw	a5,12(sp)
    8cc0:	00878513          	addi	a0,a5,8
    8cc4:	ae9ff06f          	j	87ac <_malloc_r+0xa4>
    8cc8:	0036d893          	srli	a7,a3,0x3
    8ccc:	00868713          	addi	a4,a3,8
    8cd0:	a6dff06f          	j	873c <_malloc_r+0x34>
    8cd4:	00e78733          	add	a4,a5,a4
    8cd8:	00472683          	lw	a3,4(a4)
    8cdc:	00f12623          	sw	a5,12(sp)
    8ce0:	00040513          	mv	a0,s0
    8ce4:	0016e693          	ori	a3,a3,1
    8ce8:	00d72223          	sw	a3,4(a4)
    8cec:	3ad000ef          	jal	9898 <__malloc_unlock>
    8cf0:	00c12783          	lw	a5,12(sp)
    8cf4:	00878513          	addi	a0,a5,8
    8cf8:	ab5ff06f          	j	87ac <_malloc_r+0xa4>
    8cfc:	0016e593          	ori	a1,a3,1
    8d00:	00b7a223          	sw	a1,4(a5)
    8d04:	00d786b3          	add	a3,a5,a3
    8d08:	00d82a23          	sw	a3,20(a6)
    8d0c:	00d82823          	sw	a3,16(a6)
    8d10:	00166593          	ori	a1,a2,1
    8d14:	00e78733          	add	a4,a5,a4
    8d18:	01d6a623          	sw	t4,12(a3)
    8d1c:	01d6a423          	sw	t4,8(a3)
    8d20:	00b6a223          	sw	a1,4(a3)
    8d24:	00040513          	mv	a0,s0
    8d28:	00c72023          	sw	a2,0(a4)
    8d2c:	00f12623          	sw	a5,12(sp)
    8d30:	369000ef          	jal	9898 <__malloc_unlock>
    8d34:	00c12783          	lw	a5,12(sp)
    8d38:	00878513          	addi	a0,a5,8
    8d3c:	a71ff06f          	j	87ac <_malloc_r+0xa4>
    8d40:	00675613          	srli	a2,a4,0x6
    8d44:	03960513          	addi	a0,a2,57
    8d48:	00351513          	slli	a0,a0,0x3
    8d4c:	03860593          	addi	a1,a2,56
    8d50:	eadff06f          	j	8bfc <_malloc_r+0x4f4>
    8d54:	15078a63          	beq	a5,a6,8ea8 <_malloc_r+0x7a0>
    8d58:	00882783          	lw	a5,8(a6)
    8d5c:	0047a703          	lw	a4,4(a5)
    8d60:	ffc77713          	andi	a4,a4,-4
    8d64:	40d70633          	sub	a2,a4,a3
    8d68:	00d76663          	bltu	a4,a3,8d74 <_malloc_r+0x66c>
    8d6c:	01062713          	slti	a4,a2,16
    8d70:	de0700e3          	beqz	a4,8b50 <_malloc_r+0x448>
    8d74:	00040513          	mv	a0,s0
    8d78:	321000ef          	jal	9898 <__malloc_unlock>
    8d7c:	a2dff06f          	j	87a8 <_malloc_r+0xa0>
    8d80:	05c78893          	addi	a7,a5,92
    8d84:	05b78e13          	addi	t3,a5,91
    8d88:	00389513          	slli	a0,a7,0x3
    8d8c:	a71ff06f          	j	87fc <_malloc_r+0xf4>
    8d90:	008f2783          	lw	a5,8(t5)
    8d94:	fff88893          	addi	a7,a7,-1
    8d98:	21e79663          	bne	a5,t5,8fa4 <_malloc_r+0x89c>
    8d9c:	0038f793          	andi	a5,a7,3
    8da0:	ff8f0f13          	addi	t5,t5,-8
    8da4:	fe0796e3          	bnez	a5,8d90 <_malloc_r+0x688>
    8da8:	00482703          	lw	a4,4(a6)
    8dac:	fff54793          	not	a5,a0
    8db0:	00e7f7b3          	and	a5,a5,a4
    8db4:	00f82223          	sw	a5,4(a6)
    8db8:	00151513          	slli	a0,a0,0x1
    8dbc:	fff50713          	addi	a4,a0,-1
    8dc0:	baf776e3          	bgeu	a4,a5,896c <_malloc_r+0x264>
    8dc4:	00f57733          	and	a4,a0,a5
    8dc8:	00071a63          	bnez	a4,8ddc <_malloc_r+0x6d4>
    8dcc:	00151513          	slli	a0,a0,0x1
    8dd0:	00f57733          	and	a4,a0,a5
    8dd4:	004f8f93          	addi	t6,t6,4
    8dd8:	fe070ae3          	beqz	a4,8dcc <_malloc_r+0x6c4>
    8ddc:	000f8893          	mv	a7,t6
    8de0:	b15ff06f          	j	88f4 <_malloc_r+0x1ec>
    8de4:	01058593          	addi	a1,a1,16
    8de8:	bd1ff06f          	j	89b8 <_malloc_r+0x2b0>
    8dec:	4025d593          	srai	a1,a1,0x2
    8df0:	00100713          	li	a4,1
    8df4:	00b71733          	sll	a4,a4,a1
    8df8:	00e36333          	or	t1,t1,a4
    8dfc:	00682223          	sw	t1,4(a6)
    8e00:	e29ff06f          	j	8c28 <_malloc_r+0x520>
    8e04:	00be0633          	add	a2,t3,a1
    8e08:	40c005b3          	neg	a1,a2
    8e0c:	01459593          	slli	a1,a1,0x14
    8e10:	0145d593          	srli	a1,a1,0x14
    8e14:	00040513          	mv	a0,s0
    8e18:	03d12423          	sw	t4,40(sp)
    8e1c:	03012223          	sw	a6,36(sp)
    8e20:	02f12023          	sw	a5,32(sp)
    8e24:	00d12e23          	sw	a3,28(sp)
    8e28:	00612c23          	sw	t1,24(sp)
    8e2c:	01c12a23          	sw	t3,20(sp)
    8e30:	00b12623          	sw	a1,12(sp)
    8e34:	00c12823          	sw	a2,16(sp)
    8e38:	4c8030ef          	jal	c300 <_sbrk_r>
    8e3c:	00050713          	mv	a4,a0
    8e40:	fff00513          	li	a0,-1
    8e44:	00c12583          	lw	a1,12(sp)
    8e48:	01412e03          	lw	t3,20(sp)
    8e4c:	01812303          	lw	t1,24(sp)
    8e50:	01c12683          	lw	a3,28(sp)
    8e54:	02012783          	lw	a5,32(sp)
    8e58:	02412803          	lw	a6,36(sp)
    8e5c:	02812e83          	lw	t4,40(sp)
    8e60:	c4a71ee3          	bne	a4,a0,8abc <_malloc_r+0x3b4>
    8e64:	01012703          	lw	a4,16(sp)
    8e68:	00000593          	li	a1,0
    8e6c:	c51ff06f          	j	8abc <_malloc_r+0x3b4>
    8e70:	05400593          	li	a1,84
    8e74:	06c5ee63          	bltu	a1,a2,8ef0 <_malloc_r+0x7e8>
    8e78:	00c75613          	srli	a2,a4,0xc
    8e7c:	06f60513          	addi	a0,a2,111
    8e80:	00351513          	slli	a0,a0,0x3
    8e84:	06e60593          	addi	a1,a2,110
    8e88:	d75ff06f          	j	8bfc <_malloc_r+0x4f4>
    8e8c:	15400713          	li	a4,340
    8e90:	06f76e63          	bltu	a4,a5,8f0c <_malloc_r+0x804>
    8e94:	00f6d793          	srli	a5,a3,0xf
    8e98:	07878893          	addi	a7,a5,120
    8e9c:	07778e13          	addi	t3,a5,119
    8ea0:	00389513          	slli	a0,a7,0x3
    8ea4:	959ff06f          	j	87fc <_malloc_r+0xf4>
    8ea8:	0fff8e97          	auipc	t4,0xfff8
    8eac:	c30e8e93          	addi	t4,t4,-976 # 10000ad8 <__malloc_current_mallinfo>
    8eb0:	000ea603          	lw	a2,0(t4)
    8eb4:	00c58633          	add	a2,a1,a2
    8eb8:	00cea023          	sw	a2,0(t4)
    8ebc:	b61ff06f          	j	8a1c <_malloc_r+0x314>
    8ec0:	01451513          	slli	a0,a0,0x14
    8ec4:	b4051ce3          	bnez	a0,8a1c <_malloc_r+0x314>
    8ec8:	00882e03          	lw	t3,8(a6)
    8ecc:	00b305b3          	add	a1,t1,a1
    8ed0:	0015e713          	ori	a4,a1,1
    8ed4:	00ee2223          	sw	a4,4(t3)
    8ed8:	c41ff06f          	j	8b18 <_malloc_r+0x410>
    8edc:	01cf2023          	sw	t3,0(t5)
    8ee0:	b55ff06f          	j	8a34 <_malloc_r+0x32c>
    8ee4:	00100793          	li	a5,1
    8ee8:	00fe2223          	sw	a5,4(t3)
    8eec:	e89ff06f          	j	8d74 <_malloc_r+0x66c>
    8ef0:	15400593          	li	a1,340
    8ef4:	06c5ec63          	bltu	a1,a2,8f6c <_malloc_r+0x864>
    8ef8:	00f75613          	srli	a2,a4,0xf
    8efc:	07860513          	addi	a0,a2,120
    8f00:	00351513          	slli	a0,a0,0x3
    8f04:	07760593          	addi	a1,a2,119
    8f08:	cf5ff06f          	j	8bfc <_malloc_r+0x4f4>
    8f0c:	55400713          	li	a4,1364
    8f10:	06f76c63          	bltu	a4,a5,8f88 <_malloc_r+0x880>
    8f14:	0126d793          	srli	a5,a3,0x12
    8f18:	07d78893          	addi	a7,a5,125
    8f1c:	07c78e13          	addi	t3,a5,124
    8f20:	00389513          	slli	a0,a7,0x3
    8f24:	8d9ff06f          	j	87fc <_malloc_r+0xf4>
    8f28:	ff8f0f13          	addi	t5,t5,-8
    8f2c:	01e60733          	add	a4,a2,t5
    8f30:	00000593          	li	a1,0
    8f34:	b89ff06f          	j	8abc <_malloc_r+0x3b4>
    8f38:	00878593          	addi	a1,a5,8
    8f3c:	00040513          	mv	a0,s0
    8f40:	01d12a23          	sw	t4,20(sp)
    8f44:	01012823          	sw	a6,16(sp)
    8f48:	00d12623          	sw	a3,12(sp)
    8f4c:	b74ff0ef          	jal	82c0 <_free_r>
    8f50:	01012803          	lw	a6,16(sp)
    8f54:	01412e83          	lw	t4,20(sp)
    8f58:	00c12683          	lw	a3,12(sp)
    8f5c:	00882e03          	lw	t3,8(a6)
    8f60:	000ea603          	lw	a2,0(t4)
    8f64:	004e2703          	lw	a4,4(t3)
    8f68:	bb1ff06f          	j	8b18 <_malloc_r+0x410>
    8f6c:	55400593          	li	a1,1364
    8f70:	02c5e463          	bltu	a1,a2,8f98 <_malloc_r+0x890>
    8f74:	01275613          	srli	a2,a4,0x12
    8f78:	07d60513          	addi	a0,a2,125
    8f7c:	00351513          	slli	a0,a0,0x3
    8f80:	07c60593          	addi	a1,a2,124
    8f84:	c79ff06f          	j	8bfc <_malloc_r+0x4f4>
    8f88:	3f800513          	li	a0,1016
    8f8c:	07f00893          	li	a7,127
    8f90:	07e00e13          	li	t3,126
    8f94:	869ff06f          	j	87fc <_malloc_r+0xf4>
    8f98:	3f800513          	li	a0,1016
    8f9c:	07e00593          	li	a1,126
    8fa0:	c5dff06f          	j	8bfc <_malloc_r+0x4f4>
    8fa4:	00482783          	lw	a5,4(a6)
    8fa8:	e11ff06f          	j	8db8 <_malloc_r+0x6b0>

00008fac <_mbtowc_r>:
    8fac:	0fff7797          	auipc	a5,0xfff7
    8fb0:	36c7a783          	lw	a5,876(a5) # 10000318 <__global_locale+0xe4>
    8fb4:	00078067          	jr	a5

00008fb8 <__ascii_mbtowc>:
    8fb8:	02058063          	beqz	a1,8fd8 <__ascii_mbtowc+0x20>
    8fbc:	04060263          	beqz	a2,9000 <__ascii_mbtowc+0x48>
    8fc0:	04068863          	beqz	a3,9010 <__ascii_mbtowc+0x58>
    8fc4:	00064783          	lbu	a5,0(a2)
    8fc8:	00f5a023          	sw	a5,0(a1)
    8fcc:	00064503          	lbu	a0,0(a2)
    8fd0:	00a03533          	snez	a0,a0
    8fd4:	00008067          	ret
    8fd8:	ff010113          	addi	sp,sp,-16
    8fdc:	00c10593          	addi	a1,sp,12
    8fe0:	02060463          	beqz	a2,9008 <__ascii_mbtowc+0x50>
    8fe4:	02068a63          	beqz	a3,9018 <__ascii_mbtowc+0x60>
    8fe8:	00064783          	lbu	a5,0(a2)
    8fec:	00f5a023          	sw	a5,0(a1)
    8ff0:	00064503          	lbu	a0,0(a2)
    8ff4:	00a03533          	snez	a0,a0
    8ff8:	01010113          	addi	sp,sp,16
    8ffc:	00008067          	ret
    9000:	00000513          	li	a0,0
    9004:	00008067          	ret
    9008:	00000513          	li	a0,0
    900c:	fedff06f          	j	8ff8 <__ascii_mbtowc+0x40>
    9010:	ffe00513          	li	a0,-2
    9014:	00008067          	ret
    9018:	ffe00513          	li	a0,-2
    901c:	fddff06f          	j	8ff8 <__ascii_mbtowc+0x40>

00009020 <__utf8_mbtowc>:
    9020:	ff010113          	addi	sp,sp,-16
    9024:	0a058463          	beqz	a1,90cc <__utf8_mbtowc+0xac>
    9028:	08060c63          	beqz	a2,90c0 <__utf8_mbtowc+0xa0>
    902c:	2c068c63          	beqz	a3,9304 <__utf8_mbtowc+0x2e4>
    9030:	00072803          	lw	a6,0(a4)
    9034:	06081c63          	bnez	a6,90ac <__utf8_mbtowc+0x8c>
    9038:	00064783          	lbu	a5,0(a2)
    903c:	00100e13          	li	t3,1
    9040:	06078c63          	beqz	a5,90b8 <__utf8_mbtowc+0x98>
    9044:	07f00893          	li	a7,127
    9048:	0ef8d263          	bge	a7,a5,912c <__utf8_mbtowc+0x10c>
    904c:	f4078893          	addi	a7,a5,-192
    9050:	01f00313          	li	t1,31
    9054:	09136063          	bltu	t1,a7,90d4 <__utf8_mbtowc+0xb4>
    9058:	00f70223          	sb	a5,4(a4)
    905c:	00081863          	bnez	a6,906c <__utf8_mbtowc+0x4c>
    9060:	00100813          	li	a6,1
    9064:	01072023          	sw	a6,0(a4)
    9068:	29068e63          	beq	a3,a6,9304 <__utf8_mbtowc+0x2e4>
    906c:	01c60633          	add	a2,a2,t3
    9070:	00064683          	lbu	a3,0(a2)
    9074:	03f00613          	li	a2,63
    9078:	f8068813          	addi	a6,a3,-128
    907c:	23066263          	bltu	a2,a6,92a0 <__utf8_mbtowc+0x280>
    9080:	0c100613          	li	a2,193
    9084:	20f65e63          	bge	a2,a5,92a0 <__utf8_mbtowc+0x280>
    9088:	00679793          	slli	a5,a5,0x6
    908c:	7c07f793          	andi	a5,a5,1984
    9090:	03f6f693          	andi	a3,a3,63
    9094:	00072023          	sw	zero,0(a4)
    9098:	00d7e7b3          	or	a5,a5,a3
    909c:	00f5a023          	sw	a5,0(a1)
    90a0:	001e0513          	addi	a0,t3,1
    90a4:	01010113          	addi	sp,sp,16
    90a8:	00008067          	ret
    90ac:	00474783          	lbu	a5,4(a4)
    90b0:	00000e13          	li	t3,0
    90b4:	f80798e3          	bnez	a5,9044 <__utf8_mbtowc+0x24>
    90b8:	0005a023          	sw	zero,0(a1)
    90bc:	00072023          	sw	zero,0(a4)
    90c0:	00000513          	li	a0,0
    90c4:	01010113          	addi	sp,sp,16
    90c8:	00008067          	ret
    90cc:	00c10593          	addi	a1,sp,12
    90d0:	f59ff06f          	j	9028 <__utf8_mbtowc+0x8>
    90d4:	f2078893          	addi	a7,a5,-224
    90d8:	00f00313          	li	t1,15
    90dc:	07136263          	bltu	t1,a7,9140 <__utf8_mbtowc+0x120>
    90e0:	00f70223          	sb	a5,4(a4)
    90e4:	12081463          	bnez	a6,920c <__utf8_mbtowc+0x1ec>
    90e8:	00100813          	li	a6,1
    90ec:	01072023          	sw	a6,0(a4)
    90f0:	21068a63          	beq	a3,a6,9304 <__utf8_mbtowc+0x2e4>
    90f4:	01c60833          	add	a6,a2,t3
    90f8:	00084883          	lbu	a7,0(a6)
    90fc:	0e000313          	li	t1,224
    9100:	00088813          	mv	a6,a7
    9104:	20678463          	beq	a5,t1,930c <__utf8_mbtowc+0x2ec>
    9108:	f8088313          	addi	t1,a7,-128
    910c:	03f00e93          	li	t4,63
    9110:	186ee863          	bltu	t4,t1,92a0 <__utf8_mbtowc+0x280>
    9114:	00200313          	li	t1,2
    9118:	011702a3          	sb	a7,5(a4)
    911c:	00672023          	sw	t1,0(a4)
    9120:	1e668263          	beq	a3,t1,9304 <__utf8_mbtowc+0x2e4>
    9124:	001e0e13          	addi	t3,t3,1
    9128:	1100006f          	j	9238 <__utf8_mbtowc+0x218>
    912c:	00072023          	sw	zero,0(a4)
    9130:	00f5a023          	sw	a5,0(a1)
    9134:	00100513          	li	a0,1
    9138:	01010113          	addi	sp,sp,16
    913c:	00008067          	ret
    9140:	f1078893          	addi	a7,a5,-240
    9144:	00400313          	li	t1,4
    9148:	15136c63          	bltu	t1,a7,92a0 <__utf8_mbtowc+0x280>
    914c:	00f70223          	sb	a5,4(a4)
    9150:	12080463          	beqz	a6,9278 <__utf8_mbtowc+0x258>
    9154:	00168893          	addi	a7,a3,1
    9158:	011038b3          	snez	a7,a7
    915c:	00100313          	li	t1,1
    9160:	011686b3          	add	a3,a3,a7
    9164:	12680063          	beq	a6,t1,9284 <__utf8_mbtowc+0x264>
    9168:	00574883          	lbu	a7,5(a4)
    916c:	0f000313          	li	t1,240
    9170:	12678463          	beq	a5,t1,9298 <__utf8_mbtowc+0x278>
    9174:	0908a313          	slti	t1,a7,144
    9178:	00031663          	bnez	t1,9184 <__utf8_mbtowc+0x164>
    917c:	f0c78313          	addi	t1,a5,-244
    9180:	12030063          	beqz	t1,92a0 <__utf8_mbtowc+0x280>
    9184:	f8088313          	addi	t1,a7,-128
    9188:	03f00e93          	li	t4,63
    918c:	106eea63          	bltu	t4,t1,92a0 <__utf8_mbtowc+0x280>
    9190:	011702a3          	sb	a7,5(a4)
    9194:	00100313          	li	t1,1
    9198:	10680c63          	beq	a6,t1,92b0 <__utf8_mbtowc+0x290>
    919c:	00072f03          	lw	t5,0(a4)
    91a0:	00168813          	addi	a6,a3,1
    91a4:	01003833          	snez	a6,a6
    91a8:	00200313          	li	t1,2
    91ac:	010686b3          	add	a3,a3,a6
    91b0:	106f0663          	beq	t5,t1,92bc <__utf8_mbtowc+0x29c>
    91b4:	00674803          	lbu	a6,6(a4)
    91b8:	f8080693          	addi	a3,a6,-128
    91bc:	0edee263          	bltu	t4,a3,92a0 <__utf8_mbtowc+0x280>
    91c0:	01c60633          	add	a2,a2,t3
    91c4:	00064603          	lbu	a2,0(a2)
    91c8:	03f00693          	li	a3,63
    91cc:	f8060313          	addi	t1,a2,-128
    91d0:	0c66e863          	bltu	a3,t1,92a0 <__utf8_mbtowc+0x280>
    91d4:	00d8f8b3          	and	a7,a7,a3
    91d8:	0077f793          	andi	a5,a5,7
    91dc:	01279793          	slli	a5,a5,0x12
    91e0:	00c89893          	slli	a7,a7,0xc
    91e4:	00d876b3          	and	a3,a6,a3
    91e8:	0117e7b3          	or	a5,a5,a7
    91ec:	00669693          	slli	a3,a3,0x6
    91f0:	00d7e7b3          	or	a5,a5,a3
    91f4:	03f67613          	andi	a2,a2,63
    91f8:	00c7e7b3          	or	a5,a5,a2
    91fc:	00f5a023          	sw	a5,0(a1)
    9200:	001e0513          	addi	a0,t3,1
    9204:	00072023          	sw	zero,0(a4)
    9208:	ebdff06f          	j	90c4 <__utf8_mbtowc+0xa4>
    920c:	00168893          	addi	a7,a3,1
    9210:	011038b3          	snez	a7,a7
    9214:	00100313          	li	t1,1
    9218:	011686b3          	add	a3,a3,a7
    921c:	ec680ce3          	beq	a6,t1,90f4 <__utf8_mbtowc+0xd4>
    9220:	0e000693          	li	a3,224
    9224:	00574803          	lbu	a6,5(a4)
    9228:	0cd78063          	beq	a5,a3,92e8 <__utf8_mbtowc+0x2c8>
    922c:	f8080693          	addi	a3,a6,-128
    9230:	03f00893          	li	a7,63
    9234:	06d8e663          	bltu	a7,a3,92a0 <__utf8_mbtowc+0x280>
    9238:	01c60633          	add	a2,a2,t3
    923c:	00064603          	lbu	a2,0(a2)
    9240:	03f00693          	li	a3,63
    9244:	f8060893          	addi	a7,a2,-128
    9248:	0516ec63          	bltu	a3,a7,92a0 <__utf8_mbtowc+0x280>
    924c:	00f7f793          	andi	a5,a5,15
    9250:	00d876b3          	and	a3,a6,a3
    9254:	00c79793          	slli	a5,a5,0xc
    9258:	00669693          	slli	a3,a3,0x6
    925c:	00d7e7b3          	or	a5,a5,a3
    9260:	03f67613          	andi	a2,a2,63
    9264:	00c7e7b3          	or	a5,a5,a2
    9268:	00072023          	sw	zero,0(a4)
    926c:	00f5a023          	sw	a5,0(a1)
    9270:	001e0513          	addi	a0,t3,1
    9274:	e51ff06f          	j	90c4 <__utf8_mbtowc+0xa4>
    9278:	00100813          	li	a6,1
    927c:	01072023          	sw	a6,0(a4)
    9280:	09068263          	beq	a3,a6,9304 <__utf8_mbtowc+0x2e4>
    9284:	01c60833          	add	a6,a2,t3
    9288:	00084883          	lbu	a7,0(a6)
    928c:	001e0e13          	addi	t3,t3,1
    9290:	00100813          	li	a6,1
    9294:	ed9ff06f          	j	916c <__utf8_mbtowc+0x14c>
    9298:	08f00313          	li	t1,143
    929c:	ef1344e3          	blt	t1,a7,9184 <__utf8_mbtowc+0x164>
    92a0:	08a00793          	li	a5,138
    92a4:	00f52023          	sw	a5,0(a0)
    92a8:	fff00513          	li	a0,-1
    92ac:	e19ff06f          	j	90c4 <__utf8_mbtowc+0xa4>
    92b0:	00200813          	li	a6,2
    92b4:	01072023          	sw	a6,0(a4)
    92b8:	05068663          	beq	a3,a6,9304 <__utf8_mbtowc+0x2e4>
    92bc:	01c60833          	add	a6,a2,t3
    92c0:	00084803          	lbu	a6,0(a6)
    92c4:	03f00313          	li	t1,63
    92c8:	f8080e93          	addi	t4,a6,-128
    92cc:	fdd36ae3          	bltu	t1,t4,92a0 <__utf8_mbtowc+0x280>
    92d0:	00300313          	li	t1,3
    92d4:	01070323          	sb	a6,6(a4)
    92d8:	00672023          	sw	t1,0(a4)
    92dc:	02668463          	beq	a3,t1,9304 <__utf8_mbtowc+0x2e4>
    92e0:	001e0e13          	addi	t3,t3,1
    92e4:	eddff06f          	j	91c0 <__utf8_mbtowc+0x1a0>
    92e8:	09f00693          	li	a3,159
    92ec:	fb06dae3          	bge	a3,a6,92a0 <__utf8_mbtowc+0x280>
    92f0:	f8080693          	addi	a3,a6,-128
    92f4:	03f00893          	li	a7,63
    92f8:	fad8e4e3          	bltu	a7,a3,92a0 <__utf8_mbtowc+0x280>
    92fc:	010702a3          	sb	a6,5(a4)
    9300:	f39ff06f          	j	9238 <__utf8_mbtowc+0x218>
    9304:	ffe00513          	li	a0,-2
    9308:	dbdff06f          	j	90c4 <__utf8_mbtowc+0xa4>
    930c:	09f00313          	li	t1,159
    9310:	df134ce3          	blt	t1,a7,9108 <__utf8_mbtowc+0xe8>
    9314:	f8dff06f          	j	92a0 <__utf8_mbtowc+0x280>

00009318 <__sjis_mbtowc>:
    9318:	08058c63          	beqz	a1,93b0 <__sjis_mbtowc+0x98>
    931c:	14060063          	beqz	a2,945c <__sjis_mbtowc+0x144>
    9320:	14068863          	beqz	a3,9470 <__sjis_mbtowc+0x158>
    9324:	00072783          	lw	a5,0(a4)
    9328:	00064803          	lbu	a6,0(a2)
    932c:	02078063          	beqz	a5,934c <__sjis_mbtowc+0x34>
    9330:	00100693          	li	a3,1
    9334:	04d78463          	beq	a5,a3,937c <__sjis_mbtowc+0x64>
    9338:	0105a023          	sw	a6,0(a1)
    933c:	00064783          	lbu	a5,0(a2)
    9340:	00f037b3          	snez	a5,a5
    9344:	00078513          	mv	a0,a5
    9348:	00008067          	ret
    934c:	f7f80793          	addi	a5,a6,-129
    9350:	01f7b793          	sltiu	a5,a5,31
    9354:	00079863          	bnez	a5,9364 <__sjis_mbtowc+0x4c>
    9358:	f2080793          	addi	a5,a6,-224
    935c:	0107b793          	sltiu	a5,a5,16
    9360:	fc078ce3          	beqz	a5,9338 <__sjis_mbtowc+0x20>
    9364:	00100793          	li	a5,1
    9368:	01070223          	sb	a6,4(a4)
    936c:	00f72023          	sw	a5,0(a4)
    9370:	10f68063          	beq	a3,a5,9470 <__sjis_mbtowc+0x158>
    9374:	00164803          	lbu	a6,1(a2)
    9378:	00200793          	li	a5,2
    937c:	fc080693          	addi	a3,a6,-64
    9380:	03f6b693          	sltiu	a3,a3,63
    9384:	00069863          	bnez	a3,9394 <__sjis_mbtowc+0x7c>
    9388:	f8080693          	addi	a3,a6,-128
    938c:	07d6b693          	sltiu	a3,a3,125
    9390:	0e068463          	beqz	a3,9478 <__sjis_mbtowc+0x160>
    9394:	00474683          	lbu	a3,4(a4)
    9398:	00078513          	mv	a0,a5
    939c:	00869693          	slli	a3,a3,0x8
    93a0:	010686b3          	add	a3,a3,a6
    93a4:	00d5a023          	sw	a3,0(a1)
    93a8:	00072023          	sw	zero,0(a4)
    93ac:	00008067          	ret
    93b0:	ff010113          	addi	sp,sp,-16
    93b4:	00c10593          	addi	a1,sp,12
    93b8:	0a060863          	beqz	a2,9468 <__sjis_mbtowc+0x150>
    93bc:	0c068663          	beqz	a3,9488 <__sjis_mbtowc+0x170>
    93c0:	00072783          	lw	a5,0(a4)
    93c4:	00064803          	lbu	a6,0(a2)
    93c8:	02078263          	beqz	a5,93ec <__sjis_mbtowc+0xd4>
    93cc:	00100693          	li	a3,1
    93d0:	04d78663          	beq	a5,a3,941c <__sjis_mbtowc+0x104>
    93d4:	0105a023          	sw	a6,0(a1)
    93d8:	00064783          	lbu	a5,0(a2)
    93dc:	00f037b3          	snez	a5,a5
    93e0:	00078513          	mv	a0,a5
    93e4:	01010113          	addi	sp,sp,16
    93e8:	00008067          	ret
    93ec:	f7f80793          	addi	a5,a6,-129
    93f0:	01f7b793          	sltiu	a5,a5,31
    93f4:	00079863          	bnez	a5,9404 <__sjis_mbtowc+0xec>
    93f8:	f2080793          	addi	a5,a6,-224
    93fc:	0107b793          	sltiu	a5,a5,16
    9400:	fc078ae3          	beqz	a5,93d4 <__sjis_mbtowc+0xbc>
    9404:	00100793          	li	a5,1
    9408:	01070223          	sb	a6,4(a4)
    940c:	00f72023          	sw	a5,0(a4)
    9410:	06f68c63          	beq	a3,a5,9488 <__sjis_mbtowc+0x170>
    9414:	00164803          	lbu	a6,1(a2)
    9418:	00200793          	li	a5,2
    941c:	fc080693          	addi	a3,a6,-64
    9420:	03f6b693          	sltiu	a3,a3,63
    9424:	02069063          	bnez	a3,9444 <__sjis_mbtowc+0x12c>
    9428:	f8080693          	addi	a3,a6,-128
    942c:	07d6b693          	sltiu	a3,a3,125
    9430:	00069a63          	bnez	a3,9444 <__sjis_mbtowc+0x12c>
    9434:	08a00793          	li	a5,138
    9438:	00f52023          	sw	a5,0(a0)
    943c:	fff00793          	li	a5,-1
    9440:	fa1ff06f          	j	93e0 <__sjis_mbtowc+0xc8>
    9444:	00474683          	lbu	a3,4(a4)
    9448:	00869693          	slli	a3,a3,0x8
    944c:	010686b3          	add	a3,a3,a6
    9450:	00d5a023          	sw	a3,0(a1)
    9454:	00072023          	sw	zero,0(a4)
    9458:	f89ff06f          	j	93e0 <__sjis_mbtowc+0xc8>
    945c:	00000793          	li	a5,0
    9460:	00078513          	mv	a0,a5
    9464:	00008067          	ret
    9468:	00000793          	li	a5,0
    946c:	f75ff06f          	j	93e0 <__sjis_mbtowc+0xc8>
    9470:	ffe00793          	li	a5,-2
    9474:	ed1ff06f          	j	9344 <__sjis_mbtowc+0x2c>
    9478:	08a00793          	li	a5,138
    947c:	00f52023          	sw	a5,0(a0)
    9480:	fff00793          	li	a5,-1
    9484:	ec1ff06f          	j	9344 <__sjis_mbtowc+0x2c>
    9488:	ffe00793          	li	a5,-2
    948c:	f55ff06f          	j	93e0 <__sjis_mbtowc+0xc8>

00009490 <__eucjp_mbtowc>:
    9490:	0c058663          	beqz	a1,955c <__eucjp_mbtowc+0xcc>
    9494:	18060c63          	beqz	a2,962c <__eucjp_mbtowc+0x19c>
    9498:	1e068063          	beqz	a3,9678 <__eucjp_mbtowc+0x1e8>
    949c:	00072783          	lw	a5,0(a4)
    94a0:	00064803          	lbu	a6,0(a2)
    94a4:	02078463          	beqz	a5,94cc <__eucjp_mbtowc+0x3c>
    94a8:	00100893          	li	a7,1
    94ac:	05178863          	beq	a5,a7,94fc <__eucjp_mbtowc+0x6c>
    94b0:	00200693          	li	a3,2
    94b4:	1ad78a63          	beq	a5,a3,9668 <__eucjp_mbtowc+0x1d8>
    94b8:	0105a023          	sw	a6,0(a1)
    94bc:	00064783          	lbu	a5,0(a2)
    94c0:	00f037b3          	snez	a5,a5
    94c4:	00078513          	mv	a0,a5
    94c8:	00008067          	ret
    94cc:	f7280793          	addi	a5,a6,-142
    94d0:	0027b793          	sltiu	a5,a5,2
    94d4:	00079863          	bnez	a5,94e4 <__eucjp_mbtowc+0x54>
    94d8:	f5f80793          	addi	a5,a6,-161
    94dc:	05e7b793          	sltiu	a5,a5,94
    94e0:	fc078ce3          	beqz	a5,94b8 <__eucjp_mbtowc+0x28>
    94e4:	00100793          	li	a5,1
    94e8:	01070223          	sb	a6,4(a4)
    94ec:	00f72023          	sw	a5,0(a4)
    94f0:	18f68463          	beq	a3,a5,9678 <__eucjp_mbtowc+0x1e8>
    94f4:	00164803          	lbu	a6,1(a2)
    94f8:	00200793          	li	a5,2
    94fc:	f5f80893          	addi	a7,a6,-161
    9500:	05d00313          	li	t1,93
    9504:	17136e63          	bltu	t1,a7,9680 <__eucjp_mbtowc+0x1f0>
    9508:	00474883          	lbu	a7,4(a4)
    950c:	08f00313          	li	t1,143
    9510:	12689463          	bne	a7,t1,9638 <__eucjp_mbtowc+0x1a8>
    9514:	00200893          	li	a7,2
    9518:	010702a3          	sb	a6,5(a4)
    951c:	01172023          	sw	a7,0(a4)
    9520:	14d7fc63          	bgeu	a5,a3,9678 <__eucjp_mbtowc+0x1e8>
    9524:	00f60633          	add	a2,a2,a5
    9528:	00064803          	lbu	a6,0(a2)
    952c:	00178793          	addi	a5,a5,1
    9530:	f5f80693          	addi	a3,a6,-161
    9534:	05d00613          	li	a2,93
    9538:	14d66463          	bltu	a2,a3,9680 <__eucjp_mbtowc+0x1f0>
    953c:	00574683          	lbu	a3,5(a4)
    9540:	07f87813          	andi	a6,a6,127
    9544:	00078513          	mv	a0,a5
    9548:	00869693          	slli	a3,a3,0x8
    954c:	010686b3          	add	a3,a3,a6
    9550:	00d5a023          	sw	a3,0(a1)
    9554:	00072023          	sw	zero,0(a4)
    9558:	00008067          	ret
    955c:	ff010113          	addi	sp,sp,-16
    9560:	00c10593          	addi	a1,sp,12
    9564:	0e060463          	beqz	a2,964c <__eucjp_mbtowc+0x1bc>
    9568:	12068463          	beqz	a3,9690 <__eucjp_mbtowc+0x200>
    956c:	00072783          	lw	a5,0(a4)
    9570:	00064803          	lbu	a6,0(a2)
    9574:	02078663          	beqz	a5,95a0 <__eucjp_mbtowc+0x110>
    9578:	00100893          	li	a7,1
    957c:	05178a63          	beq	a5,a7,95d0 <__eucjp_mbtowc+0x140>
    9580:	00200693          	li	a3,2
    9584:	0ed78663          	beq	a5,a3,9670 <__eucjp_mbtowc+0x1e0>
    9588:	0105a023          	sw	a6,0(a1)
    958c:	00064783          	lbu	a5,0(a2)
    9590:	00f037b3          	snez	a5,a5
    9594:	00078513          	mv	a0,a5
    9598:	01010113          	addi	sp,sp,16
    959c:	00008067          	ret
    95a0:	f7280793          	addi	a5,a6,-142
    95a4:	0027b793          	sltiu	a5,a5,2
    95a8:	00079863          	bnez	a5,95b8 <__eucjp_mbtowc+0x128>
    95ac:	f5f80793          	addi	a5,a6,-161
    95b0:	05e7b793          	sltiu	a5,a5,94
    95b4:	fc078ae3          	beqz	a5,9588 <__eucjp_mbtowc+0xf8>
    95b8:	00100793          	li	a5,1
    95bc:	01070223          	sb	a6,4(a4)
    95c0:	00f72023          	sw	a5,0(a4)
    95c4:	0cf68663          	beq	a3,a5,9690 <__eucjp_mbtowc+0x200>
    95c8:	00164803          	lbu	a6,1(a2)
    95cc:	00200793          	li	a5,2
    95d0:	f5f80893          	addi	a7,a6,-161
    95d4:	05d00313          	li	t1,93
    95d8:	0d136063          	bltu	t1,a7,9698 <__eucjp_mbtowc+0x208>
    95dc:	00474883          	lbu	a7,4(a4)
    95e0:	08f00313          	li	t1,143
    95e4:	06689863          	bne	a7,t1,9654 <__eucjp_mbtowc+0x1c4>
    95e8:	00200893          	li	a7,2
    95ec:	010702a3          	sb	a6,5(a4)
    95f0:	01172023          	sw	a7,0(a4)
    95f4:	08d7fe63          	bgeu	a5,a3,9690 <__eucjp_mbtowc+0x200>
    95f8:	00f60633          	add	a2,a2,a5
    95fc:	00064803          	lbu	a6,0(a2)
    9600:	00178793          	addi	a5,a5,1
    9604:	f5f80693          	addi	a3,a6,-161
    9608:	05d00613          	li	a2,93
    960c:	08d66663          	bltu	a2,a3,9698 <__eucjp_mbtowc+0x208>
    9610:	00574683          	lbu	a3,5(a4)
    9614:	07f87813          	andi	a6,a6,127
    9618:	00869693          	slli	a3,a3,0x8
    961c:	010686b3          	add	a3,a3,a6
    9620:	00d5a023          	sw	a3,0(a1)
    9624:	00072023          	sw	zero,0(a4)
    9628:	f6dff06f          	j	9594 <__eucjp_mbtowc+0x104>
    962c:	00000793          	li	a5,0
    9630:	00078513          	mv	a0,a5
    9634:	00008067          	ret
    9638:	00889893          	slli	a7,a7,0x8
    963c:	010888b3          	add	a7,a7,a6
    9640:	0115a023          	sw	a7,0(a1)
    9644:	00072023          	sw	zero,0(a4)
    9648:	e7dff06f          	j	94c4 <__eucjp_mbtowc+0x34>
    964c:	00000793          	li	a5,0
    9650:	f45ff06f          	j	9594 <__eucjp_mbtowc+0x104>
    9654:	00889893          	slli	a7,a7,0x8
    9658:	010888b3          	add	a7,a7,a6
    965c:	0115a023          	sw	a7,0(a1)
    9660:	00072023          	sw	zero,0(a4)
    9664:	f31ff06f          	j	9594 <__eucjp_mbtowc+0x104>
    9668:	00088793          	mv	a5,a7
    966c:	ec5ff06f          	j	9530 <__eucjp_mbtowc+0xa0>
    9670:	00088793          	mv	a5,a7
    9674:	f91ff06f          	j	9604 <__eucjp_mbtowc+0x174>
    9678:	ffe00793          	li	a5,-2
    967c:	e49ff06f          	j	94c4 <__eucjp_mbtowc+0x34>
    9680:	08a00793          	li	a5,138
    9684:	00f52023          	sw	a5,0(a0)
    9688:	fff00793          	li	a5,-1
    968c:	e39ff06f          	j	94c4 <__eucjp_mbtowc+0x34>
    9690:	ffe00793          	li	a5,-2
    9694:	f01ff06f          	j	9594 <__eucjp_mbtowc+0x104>
    9698:	08a00793          	li	a5,138
    969c:	00f52023          	sw	a5,0(a0)
    96a0:	fff00793          	li	a5,-1
    96a4:	ef1ff06f          	j	9594 <__eucjp_mbtowc+0x104>

000096a8 <__jis_mbtowc>:
    96a8:	fe010113          	addi	sp,sp,-32
    96ac:	06058e63          	beqz	a1,9728 <__jis_mbtowc+0x80>
    96b0:	08060063          	beqz	a2,9730 <__jis_mbtowc+0x88>
    96b4:	1c068863          	beqz	a3,9884 <__jis_mbtowc+0x1dc>
    96b8:	00812e23          	sw	s0,28(sp)
    96bc:	00912c23          	sw	s1,24(sp)
    96c0:	01312823          	sw	s3,16(sp)
    96c4:	01212a23          	sw	s2,20(sp)
    96c8:	00060e93          	mv	t4,a2
    96cc:	000ec303          	lbu	t1,0(t4)
    96d0:	00074483          	lbu	s1,0(a4)
    96d4:	00060993          	mv	s3,a2
    96d8:	00100893          	li	a7,1
    96dc:	0000a397          	auipc	t2,0xa
    96e0:	a1838393          	addi	t2,t2,-1512 # 130f4 <JIS_state_table>
    96e4:	0000a297          	auipc	t0,0xa
    96e8:	9c828293          	addi	t0,t0,-1592 # 130ac <JIS_action_table>
    96ec:	02f00413          	li	s0,47
    96f0:	0000af17          	auipc	t5,0xa
    96f4:	8e4f0f13          	addi	t5,t5,-1820 # 12fd4 <categories+0x1c>
    96f8:	00500f93          	li	t6,5
    96fc:	0000ae17          	auipc	t3,0xa
    9700:	998e0e13          	addi	t3,t3,-1640 # 13094 <categories+0xdc>
    9704:	08030e63          	beqz	t1,97a0 <__jis_mbtowc+0xf8>
    9708:	fe530793          	addi	a5,t1,-27
    970c:	0ff7f793          	zext.b	a5,a5
    9710:	02f46863          	bltu	s0,a5,9740 <__jis_mbtowc+0x98>
    9714:	00279793          	slli	a5,a5,0x2
    9718:	01e787b3          	add	a5,a5,t5
    971c:	0007a783          	lw	a5,0(a5)
    9720:	01e787b3          	add	a5,a5,t5
    9724:	00078067          	jr	a5
    9728:	00c10593          	addi	a1,sp,12
    972c:	f80614e3          	bnez	a2,96b4 <__jis_mbtowc+0xc>
    9730:	00072023          	sw	zero,0(a4)
    9734:	00100513          	li	a0,1
    9738:	02010113          	addi	sp,sp,32
    973c:	00008067          	ret
    9740:	fdf30913          	addi	s2,t1,-33
    9744:	05d00793          	li	a5,93
    9748:	0127b933          	sltu	s2,a5,s2
    974c:	00790913          	addi	s2,s2,7
    9750:	00349793          	slli	a5,s1,0x3
    9754:	009787b3          	add	a5,a5,s1
    9758:	00f28833          	add	a6,t0,a5
    975c:	01280833          	add	a6,a6,s2
    9760:	00084803          	lbu	a6,0(a6)
    9764:	00f387b3          	add	a5,t2,a5
    9768:	012787b3          	add	a5,a5,s2
    976c:	0007c483          	lbu	s1,0(a5)
    9770:	0d0fe663          	bltu	t6,a6,983c <__jis_mbtowc+0x194>
    9774:	00281813          	slli	a6,a6,0x2
    9778:	01c80833          	add	a6,a6,t3
    977c:	00082783          	lw	a5,0(a6)
    9780:	01c787b3          	add	a5,a5,t3
    9784:	00078067          	jr	a5
    9788:	00670223          	sb	t1,4(a4)
    978c:	001e8e93          	addi	t4,t4,1
    9790:	0ed8f063          	bgeu	a7,a3,9870 <__jis_mbtowc+0x1c8>
    9794:	000ec303          	lbu	t1,0(t4)
    9798:	00188893          	addi	a7,a7,1
    979c:	f60316e3          	bnez	t1,9708 <__jis_mbtowc+0x60>
    97a0:	00600913          	li	s2,6
    97a4:	fadff06f          	j	9750 <__jis_mbtowc+0xa8>
    97a8:	01198633          	add	a2,s3,a7
    97ac:	fe1ff06f          	j	978c <__jis_mbtowc+0xe4>
    97b0:	00100793          	li	a5,1
    97b4:	00f72023          	sw	a5,0(a4)
    97b8:	00474783          	lbu	a5,4(a4)
    97bc:	000ec703          	lbu	a4,0(t4)
    97c0:	00088513          	mv	a0,a7
    97c4:	00879793          	slli	a5,a5,0x8
    97c8:	00e787b3          	add	a5,a5,a4
    97cc:	01c12403          	lw	s0,28(sp)
    97d0:	01812483          	lw	s1,24(sp)
    97d4:	01412903          	lw	s2,20(sp)
    97d8:	01012983          	lw	s3,16(sp)
    97dc:	00f5a023          	sw	a5,0(a1)
    97e0:	02010113          	addi	sp,sp,32
    97e4:	00008067          	ret
    97e8:	00072023          	sw	zero,0(a4)
    97ec:	00064783          	lbu	a5,0(a2)
    97f0:	00088513          	mv	a0,a7
    97f4:	fd9ff06f          	j	97cc <__jis_mbtowc+0x124>
    97f8:	01c12403          	lw	s0,28(sp)
    97fc:	00072023          	sw	zero,0(a4)
    9800:	0005a023          	sw	zero,0(a1)
    9804:	01812483          	lw	s1,24(sp)
    9808:	01412903          	lw	s2,20(sp)
    980c:	01012983          	lw	s3,16(sp)
    9810:	00000513          	li	a0,0
    9814:	02010113          	addi	sp,sp,32
    9818:	00008067          	ret
    981c:	00200913          	li	s2,2
    9820:	f31ff06f          	j	9750 <__jis_mbtowc+0xa8>
    9824:	00300913          	li	s2,3
    9828:	f29ff06f          	j	9750 <__jis_mbtowc+0xa8>
    982c:	00400913          	li	s2,4
    9830:	f21ff06f          	j	9750 <__jis_mbtowc+0xa8>
    9834:	00500913          	li	s2,5
    9838:	f19ff06f          	j	9750 <__jis_mbtowc+0xa8>
    983c:	01c12403          	lw	s0,28(sp)
    9840:	08a00793          	li	a5,138
    9844:	00f52023          	sw	a5,0(a0)
    9848:	01812483          	lw	s1,24(sp)
    984c:	01412903          	lw	s2,20(sp)
    9850:	01012983          	lw	s3,16(sp)
    9854:	fff00513          	li	a0,-1
    9858:	02010113          	addi	sp,sp,32
    985c:	00008067          	ret
    9860:	00100913          	li	s2,1
    9864:	eedff06f          	j	9750 <__jis_mbtowc+0xa8>
    9868:	00000913          	li	s2,0
    986c:	ee5ff06f          	j	9750 <__jis_mbtowc+0xa8>
    9870:	00972023          	sw	s1,0(a4)
    9874:	01c12403          	lw	s0,28(sp)
    9878:	01812483          	lw	s1,24(sp)
    987c:	01412903          	lw	s2,20(sp)
    9880:	01012983          	lw	s3,16(sp)
    9884:	ffe00513          	li	a0,-2
    9888:	f59ff06f          	j	97e0 <__jis_mbtowc+0x138>

0000988c <__malloc_lock>:
    988c:	0fff7517          	auipc	a0,0xfff7
    9890:	28450513          	addi	a0,a0,644 # 10000b10 <__lock___malloc_recursive_mutex>
    9894:	dbdf606f          	j	650 <__retarget_lock_acquire_recursive>

00009898 <__malloc_unlock>:
    9898:	0fff7517          	auipc	a0,0xfff7
    989c:	27850513          	addi	a0,a0,632 # 10000b10 <__lock___malloc_recursive_mutex>
    98a0:	dc9f606f          	j	668 <__retarget_lock_release_recursive>

000098a4 <_Balloc>:
    98a4:	04452783          	lw	a5,68(a0)
    98a8:	fe010113          	addi	sp,sp,-32
    98ac:	00112e23          	sw	ra,28(sp)
    98b0:	00050713          	mv	a4,a0
    98b4:	00058693          	mv	a3,a1
    98b8:	02078863          	beqz	a5,98e8 <_Balloc+0x44>
    98bc:	00269613          	slli	a2,a3,0x2
    98c0:	00c787b3          	add	a5,a5,a2
    98c4:	0007a503          	lw	a0,0(a5)
    98c8:	04050863          	beqz	a0,9918 <_Balloc+0x74>
    98cc:	00052703          	lw	a4,0(a0)
    98d0:	00e7a023          	sw	a4,0(a5)
    98d4:	00052823          	sw	zero,16(a0)
    98d8:	00052623          	sw	zero,12(a0)
    98dc:	01c12083          	lw	ra,28(sp)
    98e0:	02010113          	addi	sp,sp,32
    98e4:	00008067          	ret
    98e8:	00b12623          	sw	a1,12(sp)
    98ec:	02100613          	li	a2,33
    98f0:	00400593          	li	a1,4
    98f4:	00a12423          	sw	a0,8(sp)
    98f8:	2d5020ef          	jal	c3cc <_calloc_r>
    98fc:	00812703          	lw	a4,8(sp)
    9900:	00c12683          	lw	a3,12(sp)
    9904:	00050793          	mv	a5,a0
    9908:	04a72223          	sw	a0,68(a4)
    990c:	fa0518e3          	bnez	a0,98bc <_Balloc+0x18>
    9910:	00000513          	li	a0,0
    9914:	fc9ff06f          	j	98dc <_Balloc+0x38>
    9918:	00100593          	li	a1,1
    991c:	00d597b3          	sll	a5,a1,a3
    9920:	00578613          	addi	a2,a5,5
    9924:	00070513          	mv	a0,a4
    9928:	00261613          	slli	a2,a2,0x2
    992c:	00d12623          	sw	a3,12(sp)
    9930:	00f12423          	sw	a5,8(sp)
    9934:	299020ef          	jal	c3cc <_calloc_r>
    9938:	fc050ce3          	beqz	a0,9910 <_Balloc+0x6c>
    993c:	00c12683          	lw	a3,12(sp)
    9940:	00812783          	lw	a5,8(sp)
    9944:	00d52223          	sw	a3,4(a0)
    9948:	00f52423          	sw	a5,8(a0)
    994c:	f89ff06f          	j	98d4 <_Balloc+0x30>

00009950 <_Bfree>:
    9950:	02058063          	beqz	a1,9970 <_Bfree+0x20>
    9954:	0045a703          	lw	a4,4(a1)
    9958:	04452783          	lw	a5,68(a0)
    995c:	00271713          	slli	a4,a4,0x2
    9960:	00e787b3          	add	a5,a5,a4
    9964:	0007a703          	lw	a4,0(a5)
    9968:	00e5a023          	sw	a4,0(a1)
    996c:	00b7a023          	sw	a1,0(a5)
    9970:	00008067          	ret

00009974 <__multadd>:
    9974:	fd010113          	addi	sp,sp,-48
    9978:	01312e23          	sw	s3,28(sp)
    997c:	0105a983          	lw	s3,16(a1)
    9980:	02812423          	sw	s0,40(sp)
    9984:	02912223          	sw	s1,36(sp)
    9988:	03212023          	sw	s2,32(sp)
    998c:	01412c23          	sw	s4,24(sp)
    9990:	01512a23          	sw	s5,20(sp)
    9994:	01712623          	sw	s7,12(sp)
    9998:	02112623          	sw	ra,44(sp)
    999c:	01612823          	sw	s6,16(sp)
    99a0:	00058a13          	mv	s4,a1
    99a4:	00068413          	mv	s0,a3
    99a8:	00050b93          	mv	s7,a0
    99ac:	00060913          	mv	s2,a2
    99b0:	01458493          	addi	s1,a1,20
    99b4:	00000a93          	li	s5,0
    99b8:	0004ab03          	lw	s6,0(s1)
    99bc:	00090593          	mv	a1,s2
    99c0:	00448493          	addi	s1,s1,4
    99c4:	010b1513          	slli	a0,s6,0x10
    99c8:	01055513          	srli	a0,a0,0x10
    99cc:	525080ef          	jal	126f0 <__mulsi3>
    99d0:	00850433          	add	s0,a0,s0
    99d4:	00090593          	mv	a1,s2
    99d8:	010b5513          	srli	a0,s6,0x10
    99dc:	515080ef          	jal	126f0 <__mulsi3>
    99e0:	01045793          	srli	a5,s0,0x10
    99e4:	00f50533          	add	a0,a0,a5
    99e8:	01041413          	slli	s0,s0,0x10
    99ec:	01045413          	srli	s0,s0,0x10
    99f0:	01051793          	slli	a5,a0,0x10
    99f4:	008787b3          	add	a5,a5,s0
    99f8:	001a8a93          	addi	s5,s5,1
    99fc:	fef4ae23          	sw	a5,-4(s1)
    9a00:	01055413          	srli	s0,a0,0x10
    9a04:	fb3acae3          	blt	s5,s3,99b8 <__multadd+0x44>
    9a08:	02040063          	beqz	s0,9a28 <__multadd+0xb4>
    9a0c:	008a2783          	lw	a5,8(s4)
    9a10:	04f9d463          	bge	s3,a5,9a58 <__multadd+0xe4>
    9a14:	00299793          	slli	a5,s3,0x2
    9a18:	00fa07b3          	add	a5,s4,a5
    9a1c:	0087aa23          	sw	s0,20(a5)
    9a20:	00198993          	addi	s3,s3,1
    9a24:	013a2823          	sw	s3,16(s4)
    9a28:	02c12083          	lw	ra,44(sp)
    9a2c:	02812403          	lw	s0,40(sp)
    9a30:	02412483          	lw	s1,36(sp)
    9a34:	02012903          	lw	s2,32(sp)
    9a38:	01c12983          	lw	s3,28(sp)
    9a3c:	01412a83          	lw	s5,20(sp)
    9a40:	01012b03          	lw	s6,16(sp)
    9a44:	00c12b83          	lw	s7,12(sp)
    9a48:	000a0513          	mv	a0,s4
    9a4c:	01812a03          	lw	s4,24(sp)
    9a50:	03010113          	addi	sp,sp,48
    9a54:	00008067          	ret
    9a58:	004a2583          	lw	a1,4(s4)
    9a5c:	000b8513          	mv	a0,s7
    9a60:	00158593          	addi	a1,a1,1
    9a64:	e41ff0ef          	jal	98a4 <_Balloc>
    9a68:	00050493          	mv	s1,a0
    9a6c:	04050a63          	beqz	a0,9ac0 <__multadd+0x14c>
    9a70:	010a2603          	lw	a2,16(s4)
    9a74:	00ca0593          	addi	a1,s4,12
    9a78:	00c50513          	addi	a0,a0,12
    9a7c:	00260613          	addi	a2,a2,2
    9a80:	00261613          	slli	a2,a2,0x2
    9a84:	f60fc0ef          	jal	61e4 <memcpy>
    9a88:	004a2703          	lw	a4,4(s4)
    9a8c:	044ba783          	lw	a5,68(s7)
    9a90:	00271713          	slli	a4,a4,0x2
    9a94:	00e787b3          	add	a5,a5,a4
    9a98:	0007a703          	lw	a4,0(a5)
    9a9c:	00ea2023          	sw	a4,0(s4)
    9aa0:	0147a023          	sw	s4,0(a5)
    9aa4:	00048a13          	mv	s4,s1
    9aa8:	00299793          	slli	a5,s3,0x2
    9aac:	00fa07b3          	add	a5,s4,a5
    9ab0:	0087aa23          	sw	s0,20(a5)
    9ab4:	00198993          	addi	s3,s3,1
    9ab8:	013a2823          	sw	s3,16(s4)
    9abc:	f6dff06f          	j	9a28 <__multadd+0xb4>
    9ac0:	00009697          	auipc	a3,0x9
    9ac4:	f6068693          	addi	a3,a3,-160 # 12a20 <__clzsi2+0x258>
    9ac8:	00000613          	li	a2,0
    9acc:	0ba00593          	li	a1,186
    9ad0:	00009517          	auipc	a0,0x9
    9ad4:	02050513          	addi	a0,a0,32 # 12af0 <__clzsi2+0x328>
    9ad8:	08d020ef          	jal	c364 <__assert_func>

00009adc <__s2b>:
    9adc:	fe010113          	addi	sp,sp,-32
    9ae0:	00812c23          	sw	s0,24(sp)
    9ae4:	01212823          	sw	s2,16(sp)
    9ae8:	01312623          	sw	s3,12(sp)
    9aec:	01412423          	sw	s4,8(sp)
    9af0:	01512223          	sw	s5,4(sp)
    9af4:	00112e23          	sw	ra,28(sp)
    9af8:	00912a23          	sw	s1,20(sp)
    9afc:	00900793          	li	a5,9
    9b00:	00068993          	mv	s3,a3
    9b04:	00060a13          	mv	s4,a2
    9b08:	00050913          	mv	s2,a0
    9b0c:	00058a93          	mv	s5,a1
    9b10:	00070413          	mv	s0,a4
    9b14:	0cd7de63          	bge	a5,a3,9bf0 <__s2b+0x114>
    9b18:	00078593          	mv	a1,a5
    9b1c:	00868513          	addi	a0,a3,8
    9b20:	3f5080ef          	jal	12714 <__divsi3>
    9b24:	00100793          	li	a5,1
    9b28:	00000593          	li	a1,0
    9b2c:	00179793          	slli	a5,a5,0x1
    9b30:	00158593          	addi	a1,a1,1
    9b34:	fea7cce3          	blt	a5,a0,9b2c <__s2b+0x50>
    9b38:	00090513          	mv	a0,s2
    9b3c:	d69ff0ef          	jal	98a4 <_Balloc>
    9b40:	00050593          	mv	a1,a0
    9b44:	0a050a63          	beqz	a0,9bf8 <__s2b+0x11c>
    9b48:	00100793          	li	a5,1
    9b4c:	00f52823          	sw	a5,16(a0)
    9b50:	00852a23          	sw	s0,20(a0)
    9b54:	00900793          	li	a5,9
    9b58:	0947d663          	bge	a5,s4,9be4 <__s2b+0x108>
    9b5c:	009a8413          	addi	s0,s5,9
    9b60:	00040493          	mv	s1,s0
    9b64:	014a8ab3          	add	s5,s5,s4
    9b68:	0004c683          	lbu	a3,0(s1)
    9b6c:	00a00613          	li	a2,10
    9b70:	00090513          	mv	a0,s2
    9b74:	fd068693          	addi	a3,a3,-48
    9b78:	00148493          	addi	s1,s1,1
    9b7c:	df9ff0ef          	jal	9974 <__multadd>
    9b80:	00050593          	mv	a1,a0
    9b84:	ff5492e3          	bne	s1,s5,9b68 <__s2b+0x8c>
    9b88:	01440433          	add	s0,s0,s4
    9b8c:	ff840413          	addi	s0,s0,-8
    9b90:	033a5663          	bge	s4,s3,9bbc <__s2b+0xe0>
    9b94:	414984b3          	sub	s1,s3,s4
    9b98:	009404b3          	add	s1,s0,s1
    9b9c:	00044683          	lbu	a3,0(s0)
    9ba0:	00a00613          	li	a2,10
    9ba4:	00090513          	mv	a0,s2
    9ba8:	fd068693          	addi	a3,a3,-48
    9bac:	00140413          	addi	s0,s0,1
    9bb0:	dc5ff0ef          	jal	9974 <__multadd>
    9bb4:	00050593          	mv	a1,a0
    9bb8:	fe9412e3          	bne	s0,s1,9b9c <__s2b+0xc0>
    9bbc:	01c12083          	lw	ra,28(sp)
    9bc0:	01812403          	lw	s0,24(sp)
    9bc4:	01412483          	lw	s1,20(sp)
    9bc8:	01012903          	lw	s2,16(sp)
    9bcc:	00c12983          	lw	s3,12(sp)
    9bd0:	00812a03          	lw	s4,8(sp)
    9bd4:	00412a83          	lw	s5,4(sp)
    9bd8:	00058513          	mv	a0,a1
    9bdc:	02010113          	addi	sp,sp,32
    9be0:	00008067          	ret
    9be4:	00aa8413          	addi	s0,s5,10
    9be8:	00078a13          	mv	s4,a5
    9bec:	fa5ff06f          	j	9b90 <__s2b+0xb4>
    9bf0:	00000593          	li	a1,0
    9bf4:	f45ff06f          	j	9b38 <__s2b+0x5c>
    9bf8:	00009697          	auipc	a3,0x9
    9bfc:	e2868693          	addi	a3,a3,-472 # 12a20 <__clzsi2+0x258>
    9c00:	00000613          	li	a2,0
    9c04:	0d300593          	li	a1,211
    9c08:	00009517          	auipc	a0,0x9
    9c0c:	ee850513          	addi	a0,a0,-280 # 12af0 <__clzsi2+0x328>
    9c10:	754020ef          	jal	c364 <__assert_func>

00009c14 <__hi0bits>:
    9c14:	00050793          	mv	a5,a0
    9c18:	00010737          	lui	a4,0x10
    9c1c:	00000513          	li	a0,0
    9c20:	00e7f663          	bgeu	a5,a4,9c2c <__hi0bits+0x18>
    9c24:	01079793          	slli	a5,a5,0x10
    9c28:	01000513          	li	a0,16
    9c2c:	01000737          	lui	a4,0x1000
    9c30:	00e7f663          	bgeu	a5,a4,9c3c <__hi0bits+0x28>
    9c34:	00850513          	addi	a0,a0,8
    9c38:	00879793          	slli	a5,a5,0x8
    9c3c:	10000737          	lui	a4,0x10000
    9c40:	00e7ee63          	bltu	a5,a4,9c5c <__hi0bits+0x48>
    9c44:	40000737          	lui	a4,0x40000
    9c48:	02e7fe63          	bgeu	a5,a4,9c84 <__hi0bits+0x70>
    9c4c:	00279713          	slli	a4,a5,0x2
    9c50:	04074463          	bltz	a4,9c98 <__hi0bits+0x84>
    9c54:	00350513          	addi	a0,a0,3
    9c58:	00008067          	ret
    9c5c:	00479713          	slli	a4,a5,0x4
    9c60:	400006b7          	lui	a3,0x40000
    9c64:	00450513          	addi	a0,a0,4
    9c68:	02d77063          	bgeu	a4,a3,9c88 <__hi0bits+0x74>
    9c6c:	00679793          	slli	a5,a5,0x6
    9c70:	0207c463          	bltz	a5,9c98 <__hi0bits+0x84>
    9c74:	00179713          	slli	a4,a5,0x1
    9c78:	fc074ee3          	bltz	a4,9c54 <__hi0bits+0x40>
    9c7c:	02000513          	li	a0,32
    9c80:	00008067          	ret
    9c84:	00078713          	mv	a4,a5
    9c88:	fff74713          	not	a4,a4
    9c8c:	01f75713          	srli	a4,a4,0x1f
    9c90:	00e50533          	add	a0,a0,a4
    9c94:	00008067          	ret
    9c98:	00250513          	addi	a0,a0,2
    9c9c:	00008067          	ret

00009ca0 <__lo0bits>:
    9ca0:	00052783          	lw	a5,0(a0)
    9ca4:	0077f713          	andi	a4,a5,7
    9ca8:	02070663          	beqz	a4,9cd4 <__lo0bits+0x34>
    9cac:	0017f693          	andi	a3,a5,1
    9cb0:	00000713          	li	a4,0
    9cb4:	00069c63          	bnez	a3,9ccc <__lo0bits+0x2c>
    9cb8:	0027f713          	andi	a4,a5,2
    9cbc:	0a070e63          	beqz	a4,9d78 <__lo0bits+0xd8>
    9cc0:	0017d793          	srli	a5,a5,0x1
    9cc4:	00f52023          	sw	a5,0(a0)
    9cc8:	00100713          	li	a4,1
    9ccc:	00070513          	mv	a0,a4
    9cd0:	00008067          	ret
    9cd4:	01079713          	slli	a4,a5,0x10
    9cd8:	01075713          	srli	a4,a4,0x10
    9cdc:	04071463          	bnez	a4,9d24 <__lo0bits+0x84>
    9ce0:	0107d793          	srli	a5,a5,0x10
    9ce4:	0ff7f693          	zext.b	a3,a5
    9ce8:	01000713          	li	a4,16
    9cec:	00069663          	bnez	a3,9cf8 <__lo0bits+0x58>
    9cf0:	01800713          	li	a4,24
    9cf4:	0087d793          	srli	a5,a5,0x8
    9cf8:	00f7f693          	andi	a3,a5,15
    9cfc:	06068263          	beqz	a3,9d60 <__lo0bits+0xc0>
    9d00:	0037f693          	andi	a3,a5,3
    9d04:	04068063          	beqz	a3,9d44 <__lo0bits+0xa4>
    9d08:	0017f693          	andi	a3,a5,1
    9d0c:	00069663          	bnez	a3,9d18 <__lo0bits+0x78>
    9d10:	00170713          	addi	a4,a4,1 # 40000001 <_stack_top+0x2fffc001>
    9d14:	0017d793          	srli	a5,a5,0x1
    9d18:	00f52023          	sw	a5,0(a0)
    9d1c:	00070513          	mv	a0,a4
    9d20:	00008067          	ret
    9d24:	0ff7f713          	zext.b	a4,a5
    9d28:	04070263          	beqz	a4,9d6c <__lo0bits+0xcc>
    9d2c:	00f7f713          	andi	a4,a5,15
    9d30:	06071663          	bnez	a4,9d9c <__lo0bits+0xfc>
    9d34:	00400713          	li	a4,4
    9d38:	0047d793          	srli	a5,a5,0x4
    9d3c:	0037f693          	andi	a3,a5,3
    9d40:	fc0694e3          	bnez	a3,9d08 <__lo0bits+0x68>
    9d44:	0027d693          	srli	a3,a5,0x2
    9d48:	0016f613          	andi	a2,a3,1
    9d4c:	04060063          	beqz	a2,9d8c <__lo0bits+0xec>
    9d50:	00068793          	mv	a5,a3
    9d54:	00270713          	addi	a4,a4,2
    9d58:	00f52023          	sw	a5,0(a0)
    9d5c:	fc1ff06f          	j	9d1c <__lo0bits+0x7c>
    9d60:	00470713          	addi	a4,a4,4
    9d64:	0047d793          	srli	a5,a5,0x4
    9d68:	fd5ff06f          	j	9d3c <__lo0bits+0x9c>
    9d6c:	00800713          	li	a4,8
    9d70:	0087d793          	srli	a5,a5,0x8
    9d74:	f85ff06f          	j	9cf8 <__lo0bits+0x58>
    9d78:	0027d793          	srli	a5,a5,0x2
    9d7c:	00200713          	li	a4,2
    9d80:	00f52023          	sw	a5,0(a0)
    9d84:	00070513          	mv	a0,a4
    9d88:	00008067          	ret
    9d8c:	0037d793          	srli	a5,a5,0x3
    9d90:	00079e63          	bnez	a5,9dac <__lo0bits+0x10c>
    9d94:	02000713          	li	a4,32
    9d98:	f35ff06f          	j	9ccc <__lo0bits+0x2c>
    9d9c:	0037d793          	srli	a5,a5,0x3
    9da0:	00300713          	li	a4,3
    9da4:	00f52023          	sw	a5,0(a0)
    9da8:	f75ff06f          	j	9d1c <__lo0bits+0x7c>
    9dac:	00370713          	addi	a4,a4,3
    9db0:	00f52023          	sw	a5,0(a0)
    9db4:	f69ff06f          	j	9d1c <__lo0bits+0x7c>

00009db8 <__i2b>:
    9db8:	04452783          	lw	a5,68(a0)
    9dbc:	fe010113          	addi	sp,sp,-32
    9dc0:	00112e23          	sw	ra,28(sp)
    9dc4:	00050713          	mv	a4,a0
    9dc8:	00058693          	mv	a3,a1
    9dcc:	02078863          	beqz	a5,9dfc <__i2b+0x44>
    9dd0:	0047a503          	lw	a0,4(a5)
    9dd4:	06050663          	beqz	a0,9e40 <__i2b+0x88>
    9dd8:	00052703          	lw	a4,0(a0)
    9ddc:	01c12083          	lw	ra,28(sp)
    9de0:	00e7a223          	sw	a4,4(a5)
    9de4:	00100793          	li	a5,1
    9de8:	00052623          	sw	zero,12(a0)
    9dec:	00d52a23          	sw	a3,20(a0)
    9df0:	00f52823          	sw	a5,16(a0)
    9df4:	02010113          	addi	sp,sp,32
    9df8:	00008067          	ret
    9dfc:	00b12623          	sw	a1,12(sp)
    9e00:	02100613          	li	a2,33
    9e04:	00400593          	li	a1,4
    9e08:	00a12423          	sw	a0,8(sp)
    9e0c:	5c0020ef          	jal	c3cc <_calloc_r>
    9e10:	00812703          	lw	a4,8(sp)
    9e14:	00c12683          	lw	a3,12(sp)
    9e18:	00050793          	mv	a5,a0
    9e1c:	04a72223          	sw	a0,68(a4)
    9e20:	fa0518e3          	bnez	a0,9dd0 <__i2b+0x18>
    9e24:	00009697          	auipc	a3,0x9
    9e28:	bfc68693          	addi	a3,a3,-1028 # 12a20 <__clzsi2+0x258>
    9e2c:	00000613          	li	a2,0
    9e30:	14500593          	li	a1,325
    9e34:	00009517          	auipc	a0,0x9
    9e38:	cbc50513          	addi	a0,a0,-836 # 12af0 <__clzsi2+0x328>
    9e3c:	528020ef          	jal	c364 <__assert_func>
    9e40:	00070513          	mv	a0,a4
    9e44:	01c00613          	li	a2,28
    9e48:	00100593          	li	a1,1
    9e4c:	00d12423          	sw	a3,8(sp)
    9e50:	57c020ef          	jal	c3cc <_calloc_r>
    9e54:	fc0508e3          	beqz	a0,9e24 <__i2b+0x6c>
    9e58:	00812683          	lw	a3,8(sp)
    9e5c:	01c12083          	lw	ra,28(sp)
    9e60:	00200793          	li	a5,2
    9e64:	00f52423          	sw	a5,8(a0)
    9e68:	00100713          	li	a4,1
    9e6c:	00100793          	li	a5,1
    9e70:	00e52223          	sw	a4,4(a0)
    9e74:	00052623          	sw	zero,12(a0)
    9e78:	00d52a23          	sw	a3,20(a0)
    9e7c:	00f52823          	sw	a5,16(a0)
    9e80:	02010113          	addi	sp,sp,32
    9e84:	00008067          	ret

00009e88 <__multiply>:
    9e88:	fb010113          	addi	sp,sp,-80
    9e8c:	05212023          	sw	s2,64(sp)
    9e90:	03712623          	sw	s7,44(sp)
    9e94:	01062903          	lw	s2,16(a2)
    9e98:	0105ab83          	lw	s7,16(a1)
    9e9c:	03312e23          	sw	s3,60(sp)
    9ea0:	03812423          	sw	s8,40(sp)
    9ea4:	04112623          	sw	ra,76(sp)
    9ea8:	03612823          	sw	s6,48(sp)
    9eac:	00058993          	mv	s3,a1
    9eb0:	00060c13          	mv	s8,a2
    9eb4:	012bcc63          	blt	s7,s2,9ecc <__multiply+0x44>
    9eb8:	00090713          	mv	a4,s2
    9ebc:	00058c13          	mv	s8,a1
    9ec0:	000b8913          	mv	s2,s7
    9ec4:	00060993          	mv	s3,a2
    9ec8:	00070b93          	mv	s7,a4
    9ecc:	008c2783          	lw	a5,8(s8)
    9ed0:	004c2583          	lw	a1,4(s8)
    9ed4:	01790b33          	add	s6,s2,s7
    9ed8:	0167a7b3          	slt	a5,a5,s6
    9edc:	00f585b3          	add	a1,a1,a5
    9ee0:	9c5ff0ef          	jal	98a4 <_Balloc>
    9ee4:	00a12423          	sw	a0,8(sp)
    9ee8:	24050263          	beqz	a0,a12c <__multiply+0x2a4>
    9eec:	00812783          	lw	a5,8(sp)
    9ef0:	03412c23          	sw	s4,56(sp)
    9ef4:	03512a23          	sw	s5,52(sp)
    9ef8:	002b1a13          	slli	s4,s6,0x2
    9efc:	01478a93          	addi	s5,a5,20
    9f00:	014a8a33          	add	s4,s5,s4
    9f04:	000a8793          	mv	a5,s5
    9f08:	014af863          	bgeu	s5,s4,9f18 <__multiply+0x90>
    9f0c:	0007a023          	sw	zero,0(a5)
    9f10:	00478793          	addi	a5,a5,4
    9f14:	ff47ece3          	bltu	a5,s4,9f0c <__multiply+0x84>
    9f18:	01498993          	addi	s3,s3,20
    9f1c:	002b9b93          	slli	s7,s7,0x2
    9f20:	01798bb3          	add	s7,s3,s7
    9f24:	1b79fc63          	bgeu	s3,s7,a0dc <__multiply+0x254>
    9f28:	014c0793          	addi	a5,s8,20
    9f2c:	00291913          	slli	s2,s2,0x2
    9f30:	01278933          	add	s2,a5,s2
    9f34:	03912223          	sw	s9,36(sp)
    9f38:	015c0c93          	addi	s9,s8,21
    9f3c:	01993cb3          	sltu	s9,s2,s9
    9f40:	00f12023          	sw	a5,0(sp)
    9f44:	41890c33          	sub	s8,s2,s8
    9f48:	001cc793          	xori	a5,s9,1
    9f4c:	00f12223          	sw	a5,4(sp)
    9f50:	febc0793          	addi	a5,s8,-21
    9f54:	04812423          	sw	s0,72(sp)
    9f58:	04912223          	sw	s1,68(sp)
    9f5c:	03a12023          	sw	s10,32(sp)
    9f60:	01b12e23          	sw	s11,28(sp)
    9f64:	00f12623          	sw	a5,12(sp)
    9f68:	0180006f          	j	9f80 <__multiply+0xf8>
    9f6c:	0104d493          	srli	s1,s1,0x10
    9f70:	0a049e63          	bnez	s1,a02c <__multiply+0x1a4>
    9f74:	00498993          	addi	s3,s3,4
    9f78:	004a8a93          	addi	s5,s5,4
    9f7c:	1579f663          	bgeu	s3,s7,a0c8 <__multiply+0x240>
    9f80:	0009a483          	lw	s1,0(s3)
    9f84:	01049413          	slli	s0,s1,0x10
    9f88:	01045413          	srli	s0,s0,0x10
    9f8c:	fe0400e3          	beqz	s0,9f6c <__multiply+0xe4>
    9f90:	00012c83          	lw	s9,0(sp)
    9f94:	000a8d13          	mv	s10,s5
    9f98:	00000c13          	li	s8,0
    9f9c:	000cad83          	lw	s11,0(s9)
    9fa0:	000d2483          	lw	s1,0(s10)
    9fa4:	00040593          	mv	a1,s0
    9fa8:	010d9513          	slli	a0,s11,0x10
    9fac:	01055513          	srli	a0,a0,0x10
    9fb0:	740080ef          	jal	126f0 <__mulsi3>
    9fb4:	01049893          	slli	a7,s1,0x10
    9fb8:	0108d893          	srli	a7,a7,0x10
    9fbc:	01150733          	add	a4,a0,a7
    9fc0:	00040593          	mv	a1,s0
    9fc4:	010dd513          	srli	a0,s11,0x10
    9fc8:	01870c33          	add	s8,a4,s8
    9fcc:	0104d493          	srli	s1,s1,0x10
    9fd0:	720080ef          	jal	126f0 <__mulsi3>
    9fd4:	010c5713          	srli	a4,s8,0x10
    9fd8:	00950533          	add	a0,a0,s1
    9fdc:	010c1793          	slli	a5,s8,0x10
    9fe0:	00e50533          	add	a0,a0,a4
    9fe4:	0107d793          	srli	a5,a5,0x10
    9fe8:	01051713          	slli	a4,a0,0x10
    9fec:	004d0d13          	addi	s10,s10,4
    9ff0:	00f767b3          	or	a5,a4,a5
    9ff4:	004c8c93          	addi	s9,s9,4
    9ff8:	fefd2e23          	sw	a5,-4(s10)
    9ffc:	01055c13          	srli	s8,a0,0x10
    a000:	f92ceee3          	bltu	s9,s2,9f9c <__multiply+0x114>
    a004:	00412783          	lw	a5,4(sp)
    a008:	00000713          	li	a4,0
    a00c:	00078663          	beqz	a5,a018 <__multiply+0x190>
    a010:	00c12783          	lw	a5,12(sp)
    a014:	ffc7f713          	andi	a4,a5,-4
    a018:	00ea8733          	add	a4,s5,a4
    a01c:	01872223          	sw	s8,4(a4)
    a020:	0009a483          	lw	s1,0(s3)
    a024:	0104d493          	srli	s1,s1,0x10
    a028:	f40486e3          	beqz	s1,9f74 <__multiply+0xec>
    a02c:	000aac03          	lw	s8,0(s5)
    a030:	00012c83          	lw	s9,0(sp)
    a034:	000a8d13          	mv	s10,s5
    a038:	000c0413          	mv	s0,s8
    a03c:	00000d93          	li	s11,0
    a040:	000cd503          	lhu	a0,0(s9)
    a044:	00048593          	mv	a1,s1
    a048:	01045413          	srli	s0,s0,0x10
    a04c:	6a4080ef          	jal	126f0 <__mulsi3>
    a050:	01b50733          	add	a4,a0,s11
    a054:	00870db3          	add	s11,a4,s0
    a058:	010c1793          	slli	a5,s8,0x10
    a05c:	010d9593          	slli	a1,s11,0x10
    a060:	0107d793          	srli	a5,a5,0x10
    a064:	00f5e7b3          	or	a5,a1,a5
    a068:	00fd2023          	sw	a5,0(s10)
    a06c:	002cd503          	lhu	a0,2(s9)
    a070:	004d2403          	lw	s0,4(s10)
    a074:	00048593          	mv	a1,s1
    a078:	678080ef          	jal	126f0 <__mulsi3>
    a07c:	01041793          	slli	a5,s0,0x10
    a080:	0107d793          	srli	a5,a5,0x10
    a084:	010dd713          	srli	a4,s11,0x10
    a088:	00f507b3          	add	a5,a0,a5
    a08c:	004c8c93          	addi	s9,s9,4
    a090:	00e78c33          	add	s8,a5,a4
    a094:	004d0d13          	addi	s10,s10,4
    a098:	010c5d93          	srli	s11,s8,0x10
    a09c:	fb2ce2e3          	bltu	s9,s2,a040 <__multiply+0x1b8>
    a0a0:	00412783          	lw	a5,4(sp)
    a0a4:	00000713          	li	a4,0
    a0a8:	00078663          	beqz	a5,a0b4 <__multiply+0x22c>
    a0ac:	00c12783          	lw	a5,12(sp)
    a0b0:	ffc7f713          	andi	a4,a5,-4
    a0b4:	00ea8733          	add	a4,s5,a4
    a0b8:	01872223          	sw	s8,4(a4)
    a0bc:	00498993          	addi	s3,s3,4
    a0c0:	004a8a93          	addi	s5,s5,4
    a0c4:	eb79eee3          	bltu	s3,s7,9f80 <__multiply+0xf8>
    a0c8:	04812403          	lw	s0,72(sp)
    a0cc:	04412483          	lw	s1,68(sp)
    a0d0:	02412c83          	lw	s9,36(sp)
    a0d4:	02012d03          	lw	s10,32(sp)
    a0d8:	01c12d83          	lw	s11,28(sp)
    a0dc:	01604863          	bgtz	s6,a0ec <__multiply+0x264>
    a0e0:	0180006f          	j	a0f8 <__multiply+0x270>
    a0e4:	fffb0b13          	addi	s6,s6,-1
    a0e8:	000b0863          	beqz	s6,a0f8 <__multiply+0x270>
    a0ec:	ffca2783          	lw	a5,-4(s4)
    a0f0:	ffca0a13          	addi	s4,s4,-4
    a0f4:	fe0788e3          	beqz	a5,a0e4 <__multiply+0x25c>
    a0f8:	00812783          	lw	a5,8(sp)
    a0fc:	04c12083          	lw	ra,76(sp)
    a100:	03812a03          	lw	s4,56(sp)
    a104:	0167a823          	sw	s6,16(a5)
    a108:	03412a83          	lw	s5,52(sp)
    a10c:	04012903          	lw	s2,64(sp)
    a110:	03c12983          	lw	s3,60(sp)
    a114:	03012b03          	lw	s6,48(sp)
    a118:	02c12b83          	lw	s7,44(sp)
    a11c:	02812c03          	lw	s8,40(sp)
    a120:	00078513          	mv	a0,a5
    a124:	05010113          	addi	sp,sp,80
    a128:	00008067          	ret
    a12c:	00009697          	auipc	a3,0x9
    a130:	8f468693          	addi	a3,a3,-1804 # 12a20 <__clzsi2+0x258>
    a134:	00000613          	li	a2,0
    a138:	16200593          	li	a1,354
    a13c:	00009517          	auipc	a0,0x9
    a140:	9b450513          	addi	a0,a0,-1612 # 12af0 <__clzsi2+0x328>
    a144:	04812423          	sw	s0,72(sp)
    a148:	04912223          	sw	s1,68(sp)
    a14c:	03412c23          	sw	s4,56(sp)
    a150:	03512a23          	sw	s5,52(sp)
    a154:	03912223          	sw	s9,36(sp)
    a158:	03a12023          	sw	s10,32(sp)
    a15c:	01b12e23          	sw	s11,28(sp)
    a160:	204020ef          	jal	c364 <__assert_func>

0000a164 <__pow5mult>:
    a164:	fe010113          	addi	sp,sp,-32
    a168:	00812c23          	sw	s0,24(sp)
    a16c:	01212823          	sw	s2,16(sp)
    a170:	01312623          	sw	s3,12(sp)
    a174:	00112e23          	sw	ra,28(sp)
    a178:	00367793          	andi	a5,a2,3
    a17c:	00060413          	mv	s0,a2
    a180:	00050993          	mv	s3,a0
    a184:	00058913          	mv	s2,a1
    a188:	0c079a63          	bnez	a5,a25c <__pow5mult+0xf8>
    a18c:	40245413          	srai	s0,s0,0x2
    a190:	0a040863          	beqz	s0,a240 <__pow5mult+0xdc>
    a194:	00912a23          	sw	s1,20(sp)
    a198:	0409a483          	lw	s1,64(s3)
    a19c:	0e048463          	beqz	s1,a284 <__pow5mult+0x120>
    a1a0:	00147793          	andi	a5,s0,1
    a1a4:	40145413          	srai	s0,s0,0x1
    a1a8:	00079e63          	bnez	a5,a1c4 <__pow5mult+0x60>
    a1ac:	0004a503          	lw	a0,0(s1)
    a1b0:	04050a63          	beqz	a0,a204 <__pow5mult+0xa0>
    a1b4:	00050493          	mv	s1,a0
    a1b8:	00147793          	andi	a5,s0,1
    a1bc:	40145413          	srai	s0,s0,0x1
    a1c0:	fe0786e3          	beqz	a5,a1ac <__pow5mult+0x48>
    a1c4:	00048613          	mv	a2,s1
    a1c8:	00090593          	mv	a1,s2
    a1cc:	00098513          	mv	a0,s3
    a1d0:	cb9ff0ef          	jal	9e88 <__multiply>
    a1d4:	02090063          	beqz	s2,a1f4 <__pow5mult+0x90>
    a1d8:	00492703          	lw	a4,4(s2)
    a1dc:	0449a783          	lw	a5,68(s3)
    a1e0:	00271713          	slli	a4,a4,0x2
    a1e4:	00e787b3          	add	a5,a5,a4
    a1e8:	0007a703          	lw	a4,0(a5)
    a1ec:	00e92023          	sw	a4,0(s2)
    a1f0:	0127a023          	sw	s2,0(a5)
    a1f4:	02040863          	beqz	s0,a224 <__pow5mult+0xc0>
    a1f8:	00050913          	mv	s2,a0
    a1fc:	0004a503          	lw	a0,0(s1)
    a200:	fa051ae3          	bnez	a0,a1b4 <__pow5mult+0x50>
    a204:	00048613          	mv	a2,s1
    a208:	00048593          	mv	a1,s1
    a20c:	00098513          	mv	a0,s3
    a210:	c79ff0ef          	jal	9e88 <__multiply>
    a214:	00a4a023          	sw	a0,0(s1)
    a218:	00052023          	sw	zero,0(a0)
    a21c:	00050493          	mv	s1,a0
    a220:	f99ff06f          	j	a1b8 <__pow5mult+0x54>
    a224:	01c12083          	lw	ra,28(sp)
    a228:	01812403          	lw	s0,24(sp)
    a22c:	01412483          	lw	s1,20(sp)
    a230:	01012903          	lw	s2,16(sp)
    a234:	00c12983          	lw	s3,12(sp)
    a238:	02010113          	addi	sp,sp,32
    a23c:	00008067          	ret
    a240:	01c12083          	lw	ra,28(sp)
    a244:	01812403          	lw	s0,24(sp)
    a248:	00c12983          	lw	s3,12(sp)
    a24c:	00090513          	mv	a0,s2
    a250:	01012903          	lw	s2,16(sp)
    a254:	02010113          	addi	sp,sp,32
    a258:	00008067          	ret
    a25c:	fff78793          	addi	a5,a5,-1
    a260:	00009717          	auipc	a4,0x9
    a264:	edc70713          	addi	a4,a4,-292 # 1313c <p05.0>
    a268:	00279793          	slli	a5,a5,0x2
    a26c:	00f707b3          	add	a5,a4,a5
    a270:	0007a603          	lw	a2,0(a5)
    a274:	00000693          	li	a3,0
    a278:	efcff0ef          	jal	9974 <__multadd>
    a27c:	00050913          	mv	s2,a0
    a280:	f0dff06f          	j	a18c <__pow5mult+0x28>
    a284:	00100593          	li	a1,1
    a288:	00098513          	mv	a0,s3
    a28c:	e18ff0ef          	jal	98a4 <_Balloc>
    a290:	00050493          	mv	s1,a0
    a294:	02050063          	beqz	a0,a2b4 <__pow5mult+0x150>
    a298:	27100713          	li	a4,625
    a29c:	00100793          	li	a5,1
    a2a0:	00e52a23          	sw	a4,20(a0)
    a2a4:	00f52823          	sw	a5,16(a0)
    a2a8:	04a9a023          	sw	a0,64(s3)
    a2ac:	00052023          	sw	zero,0(a0)
    a2b0:	ef1ff06f          	j	a1a0 <__pow5mult+0x3c>
    a2b4:	00008697          	auipc	a3,0x8
    a2b8:	76c68693          	addi	a3,a3,1900 # 12a20 <__clzsi2+0x258>
    a2bc:	00000613          	li	a2,0
    a2c0:	14500593          	li	a1,325
    a2c4:	00009517          	auipc	a0,0x9
    a2c8:	82c50513          	addi	a0,a0,-2004 # 12af0 <__clzsi2+0x328>
    a2cc:	098020ef          	jal	c364 <__assert_func>

0000a2d0 <__lshift>:
    a2d0:	fd010113          	addi	sp,sp,-48
    a2d4:	03212023          	sw	s2,32(sp)
    a2d8:	0105a903          	lw	s2,16(a1)
    a2dc:	0085a783          	lw	a5,8(a1)
    a2e0:	01412c23          	sw	s4,24(sp)
    a2e4:	40565a13          	srai	s4,a2,0x5
    a2e8:	012a0933          	add	s2,s4,s2
    a2ec:	02812423          	sw	s0,40(sp)
    a2f0:	02912223          	sw	s1,36(sp)
    a2f4:	01312e23          	sw	s3,28(sp)
    a2f8:	02112623          	sw	ra,44(sp)
    a2fc:	00190413          	addi	s0,s2,1
    a300:	00058493          	mv	s1,a1
    a304:	00050993          	mv	s3,a0
    a308:	0045a583          	lw	a1,4(a1)
    a30c:	0087d863          	bge	a5,s0,a31c <__lshift+0x4c>
    a310:	00179793          	slli	a5,a5,0x1
    a314:	00158593          	addi	a1,a1,1
    a318:	fe87cce3          	blt	a5,s0,a310 <__lshift+0x40>
    a31c:	00098513          	mv	a0,s3
    a320:	00c12623          	sw	a2,12(sp)
    a324:	d80ff0ef          	jal	98a4 <_Balloc>
    a328:	00c12603          	lw	a2,12(sp)
    a32c:	10050863          	beqz	a0,a43c <__lshift+0x16c>
    a330:	01450593          	addi	a1,a0,20
    a334:	03405463          	blez	s4,a35c <__lshift+0x8c>
    a338:	005a0713          	addi	a4,s4,5
    a33c:	00271713          	slli	a4,a4,0x2
    a340:	00e50733          	add	a4,a0,a4
    a344:	00058793          	mv	a5,a1
    a348:	00478793          	addi	a5,a5,4
    a34c:	fe07ae23          	sw	zero,-4(a5)
    a350:	fee79ce3          	bne	a5,a4,a348 <__lshift+0x78>
    a354:	002a1a13          	slli	s4,s4,0x2
    a358:	014585b3          	add	a1,a1,s4
    a35c:	0104a803          	lw	a6,16(s1)
    a360:	01448793          	addi	a5,s1,20
    a364:	01f67613          	andi	a2,a2,31
    a368:	00281813          	slli	a6,a6,0x2
    a36c:	01078833          	add	a6,a5,a6
    a370:	0a060063          	beqz	a2,a410 <__lshift+0x140>
    a374:	02000313          	li	t1,32
    a378:	40c30333          	sub	t1,t1,a2
    a37c:	00058893          	mv	a7,a1
    a380:	00000693          	li	a3,0
    a384:	0007a703          	lw	a4,0(a5)
    a388:	00488893          	addi	a7,a7,4
    a38c:	00478793          	addi	a5,a5,4
    a390:	00c71733          	sll	a4,a4,a2
    a394:	00d76733          	or	a4,a4,a3
    a398:	fee8ae23          	sw	a4,-4(a7)
    a39c:	ffc7a683          	lw	a3,-4(a5)
    a3a0:	0066d6b3          	srl	a3,a3,t1
    a3a4:	ff07e0e3          	bltu	a5,a6,a384 <__lshift+0xb4>
    a3a8:	01548793          	addi	a5,s1,21
    a3ac:	00000713          	li	a4,0
    a3b0:	00f86863          	bltu	a6,a5,a3c0 <__lshift+0xf0>
    a3b4:	40980833          	sub	a6,a6,s1
    a3b8:	feb80813          	addi	a6,a6,-21
    a3bc:	ffc87713          	andi	a4,a6,-4
    a3c0:	00e585b3          	add	a1,a1,a4
    a3c4:	00d5a223          	sw	a3,4(a1)
    a3c8:	00069463          	bnez	a3,a3d0 <__lshift+0x100>
    a3cc:	00090413          	mv	s0,s2
    a3d0:	0044a703          	lw	a4,4(s1)
    a3d4:	0449a783          	lw	a5,68(s3)
    a3d8:	02c12083          	lw	ra,44(sp)
    a3dc:	00271713          	slli	a4,a4,0x2
    a3e0:	00e787b3          	add	a5,a5,a4
    a3e4:	0007a703          	lw	a4,0(a5)
    a3e8:	00852823          	sw	s0,16(a0)
    a3ec:	02812403          	lw	s0,40(sp)
    a3f0:	00e4a023          	sw	a4,0(s1)
    a3f4:	0097a023          	sw	s1,0(a5)
    a3f8:	02012903          	lw	s2,32(sp)
    a3fc:	02412483          	lw	s1,36(sp)
    a400:	01c12983          	lw	s3,28(sp)
    a404:	01812a03          	lw	s4,24(sp)
    a408:	03010113          	addi	sp,sp,48
    a40c:	00008067          	ret
    a410:	0007a703          	lw	a4,0(a5)
    a414:	00478793          	addi	a5,a5,4
    a418:	00458593          	addi	a1,a1,4
    a41c:	fee5ae23          	sw	a4,-4(a1)
    a420:	fb07f6e3          	bgeu	a5,a6,a3cc <__lshift+0xfc>
    a424:	0007a703          	lw	a4,0(a5)
    a428:	00478793          	addi	a5,a5,4
    a42c:	00458593          	addi	a1,a1,4
    a430:	fee5ae23          	sw	a4,-4(a1)
    a434:	fd07eee3          	bltu	a5,a6,a410 <__lshift+0x140>
    a438:	f95ff06f          	j	a3cc <__lshift+0xfc>
    a43c:	00008697          	auipc	a3,0x8
    a440:	5e468693          	addi	a3,a3,1508 # 12a20 <__clzsi2+0x258>
    a444:	00000613          	li	a2,0
    a448:	1de00593          	li	a1,478
    a44c:	00008517          	auipc	a0,0x8
    a450:	6a450513          	addi	a0,a0,1700 # 12af0 <__clzsi2+0x328>
    a454:	711010ef          	jal	c364 <__assert_func>

0000a458 <__mcmp>:
    a458:	01052703          	lw	a4,16(a0)
    a45c:	0105a783          	lw	a5,16(a1)
    a460:	00050613          	mv	a2,a0
    a464:	40f70533          	sub	a0,a4,a5
    a468:	04f71263          	bne	a4,a5,a4ac <__mcmp+0x54>
    a46c:	00279793          	slli	a5,a5,0x2
    a470:	01460613          	addi	a2,a2,20
    a474:	01458593          	addi	a1,a1,20
    a478:	00f585b3          	add	a1,a1,a5
    a47c:	00f607b3          	add	a5,a2,a5
    a480:	0080006f          	j	a488 <__mcmp+0x30>
    a484:	02f67463          	bgeu	a2,a5,a4ac <__mcmp+0x54>
    a488:	ffc7a683          	lw	a3,-4(a5)
    a48c:	ffc5a703          	lw	a4,-4(a1)
    a490:	ffc78793          	addi	a5,a5,-4
    a494:	ffc58593          	addi	a1,a1,-4
    a498:	fee686e3          	beq	a3,a4,a484 <__mcmp+0x2c>
    a49c:	00100513          	li	a0,1
    a4a0:	00e6f663          	bgeu	a3,a4,a4ac <__mcmp+0x54>
    a4a4:	fff00513          	li	a0,-1
    a4a8:	00008067          	ret
    a4ac:	00008067          	ret

0000a4b0 <__mdiff>:
    a4b0:	0105a703          	lw	a4,16(a1)
    a4b4:	01062783          	lw	a5,16(a2)
    a4b8:	fe010113          	addi	sp,sp,-32
    a4bc:	00112e23          	sw	ra,28(sp)
    a4c0:	00058f13          	mv	t5,a1
    a4c4:	40f708b3          	sub	a7,a4,a5
    a4c8:	04f71063          	bne	a4,a5,a508 <__mdiff+0x58>
    a4cc:	00279693          	slli	a3,a5,0x2
    a4d0:	01458593          	addi	a1,a1,20
    a4d4:	01460713          	addi	a4,a2,20
    a4d8:	00d587b3          	add	a5,a1,a3
    a4dc:	00d70733          	add	a4,a4,a3
    a4e0:	0080006f          	j	a4e8 <__mdiff+0x38>
    a4e4:	18f5fc63          	bgeu	a1,a5,a67c <__mdiff+0x1cc>
    a4e8:	ffc7a803          	lw	a6,-4(a5)
    a4ec:	ffc72683          	lw	a3,-4(a4)
    a4f0:	ffc78793          	addi	a5,a5,-4
    a4f4:	ffc70713          	addi	a4,a4,-4
    a4f8:	fed806e3          	beq	a6,a3,a4e4 <__mdiff+0x34>
    a4fc:	1ad87263          	bgeu	a6,a3,a6a0 <__mdiff+0x1f0>
    a500:	00100893          	li	a7,1
    a504:	0180006f          	j	a51c <__mdiff+0x6c>
    a508:	fe08cce3          	bltz	a7,a500 <__mdiff+0x50>
    a50c:	00060793          	mv	a5,a2
    a510:	00000893          	li	a7,0
    a514:	00058613          	mv	a2,a1
    a518:	00078f13          	mv	t5,a5
    a51c:	00462583          	lw	a1,4(a2)
    a520:	01e12623          	sw	t5,12(sp)
    a524:	01112423          	sw	a7,8(sp)
    a528:	00c12223          	sw	a2,4(sp)
    a52c:	b78ff0ef          	jal	98a4 <_Balloc>
    a530:	00412603          	lw	a2,4(sp)
    a534:	00812883          	lw	a7,8(sp)
    a538:	00c12f03          	lw	t5,12(sp)
    a53c:	18050863          	beqz	a0,a6cc <__mdiff+0x21c>
    a540:	01062803          	lw	a6,16(a2)
    a544:	010f2f83          	lw	t6,16(t5)
    a548:	01460293          	addi	t0,a2,20
    a54c:	00281713          	slli	a4,a6,0x2
    a550:	002f9f93          	slli	t6,t6,0x2
    a554:	014f0613          	addi	a2,t5,20
    a558:	01450393          	addi	t2,a0,20
    a55c:	01152623          	sw	a7,12(a0)
    a560:	00e28333          	add	t1,t0,a4
    a564:	01f60fb3          	add	t6,a2,t6
    a568:	00028e93          	mv	t4,t0
    a56c:	00038e13          	mv	t3,t2
    a570:	00000893          	li	a7,0
    a574:	000ea703          	lw	a4,0(t4)
    a578:	00062683          	lw	a3,0(a2)
    a57c:	004e0e13          	addi	t3,t3,4
    a580:	01071793          	slli	a5,a4,0x10
    a584:	01069593          	slli	a1,a3,0x10
    a588:	0107d793          	srli	a5,a5,0x10
    a58c:	0105d593          	srli	a1,a1,0x10
    a590:	40b787b3          	sub	a5,a5,a1
    a594:	011787b3          	add	a5,a5,a7
    a598:	0106d693          	srli	a3,a3,0x10
    a59c:	01075713          	srli	a4,a4,0x10
    a5a0:	40d70733          	sub	a4,a4,a3
    a5a4:	4107d693          	srai	a3,a5,0x10
    a5a8:	00d70733          	add	a4,a4,a3
    a5ac:	01079793          	slli	a5,a5,0x10
    a5b0:	0107d793          	srli	a5,a5,0x10
    a5b4:	01071693          	slli	a3,a4,0x10
    a5b8:	00d7e7b3          	or	a5,a5,a3
    a5bc:	00460613          	addi	a2,a2,4
    a5c0:	fefe2e23          	sw	a5,-4(t3)
    a5c4:	004e8e93          	addi	t4,t4,4
    a5c8:	41075893          	srai	a7,a4,0x10
    a5cc:	fbf664e3          	bltu	a2,t6,a574 <__mdiff+0xc4>
    a5d0:	015f0693          	addi	a3,t5,21
    a5d4:	00000713          	li	a4,0
    a5d8:	00dfe863          	bltu	t6,a3,a5e8 <__mdiff+0x138>
    a5dc:	41ef8fb3          	sub	t6,t6,t5
    a5e0:	febf8f93          	addi	t6,t6,-21
    a5e4:	ffcff713          	andi	a4,t6,-4
    a5e8:	00e28eb3          	add	t4,t0,a4
    a5ec:	004e8e93          	addi	t4,t4,4
    a5f0:	00770733          	add	a4,a4,t2
    a5f4:	40538e33          	sub	t3,t2,t0
    a5f8:	000e8613          	mv	a2,t4
    a5fc:	00470f13          	addi	t5,a4,4
    a600:	046efc63          	bgeu	t4,t1,a658 <__mdiff+0x1a8>
    a604:	00062683          	lw	a3,0(a2)
    a608:	01c605b3          	add	a1,a2,t3
    a60c:	00460613          	addi	a2,a2,4
    a610:	01069713          	slli	a4,a3,0x10
    a614:	01075713          	srli	a4,a4,0x10
    a618:	01170733          	add	a4,a4,a7
    a61c:	011687b3          	add	a5,a3,a7
    a620:	41075713          	srai	a4,a4,0x10
    a624:	0106d693          	srli	a3,a3,0x10
    a628:	00d70733          	add	a4,a4,a3
    a62c:	01079793          	slli	a5,a5,0x10
    a630:	0107d793          	srli	a5,a5,0x10
    a634:	01071693          	slli	a3,a4,0x10
    a638:	00d7e7b3          	or	a5,a5,a3
    a63c:	00f5a023          	sw	a5,0(a1)
    a640:	41075893          	srai	a7,a4,0x10
    a644:	fc6660e3          	bltu	a2,t1,a604 <__mdiff+0x154>
    a648:	fff30713          	addi	a4,t1,-1
    a64c:	41d70733          	sub	a4,a4,t4
    a650:	ffc77713          	andi	a4,a4,-4
    a654:	01e70733          	add	a4,a4,t5
    a658:	00079a63          	bnez	a5,a66c <__mdiff+0x1bc>
    a65c:	ffc72783          	lw	a5,-4(a4)
    a660:	ffc70713          	addi	a4,a4,-4
    a664:	fff80813          	addi	a6,a6,-1
    a668:	fe078ae3          	beqz	a5,a65c <__mdiff+0x1ac>
    a66c:	01c12083          	lw	ra,28(sp)
    a670:	01052823          	sw	a6,16(a0)
    a674:	02010113          	addi	sp,sp,32
    a678:	00008067          	ret
    a67c:	00000593          	li	a1,0
    a680:	a24ff0ef          	jal	98a4 <_Balloc>
    a684:	02050663          	beqz	a0,a6b0 <__mdiff+0x200>
    a688:	01c12083          	lw	ra,28(sp)
    a68c:	00100793          	li	a5,1
    a690:	00052a23          	sw	zero,20(a0)
    a694:	00f52823          	sw	a5,16(a0)
    a698:	02010113          	addi	sp,sp,32
    a69c:	00008067          	ret
    a6a0:	00060793          	mv	a5,a2
    a6a4:	000f0613          	mv	a2,t5
    a6a8:	00078f13          	mv	t5,a5
    a6ac:	e71ff06f          	j	a51c <__mdiff+0x6c>
    a6b0:	00008697          	auipc	a3,0x8
    a6b4:	37068693          	addi	a3,a3,880 # 12a20 <__clzsi2+0x258>
    a6b8:	00000613          	li	a2,0
    a6bc:	23700593          	li	a1,567
    a6c0:	00008517          	auipc	a0,0x8
    a6c4:	43050513          	addi	a0,a0,1072 # 12af0 <__clzsi2+0x328>
    a6c8:	49d010ef          	jal	c364 <__assert_func>
    a6cc:	00008697          	auipc	a3,0x8
    a6d0:	35468693          	addi	a3,a3,852 # 12a20 <__clzsi2+0x258>
    a6d4:	00000613          	li	a2,0
    a6d8:	24500593          	li	a1,581
    a6dc:	00008517          	auipc	a0,0x8
    a6e0:	41450513          	addi	a0,a0,1044 # 12af0 <__clzsi2+0x328>
    a6e4:	481010ef          	jal	c364 <__assert_func>

0000a6e8 <__ulp>:
    a6e8:	7ff007b7          	lui	a5,0x7ff00
    a6ec:	00b7f5b3          	and	a1,a5,a1
    a6f0:	fcc007b7          	lui	a5,0xfcc00
    a6f4:	00f585b3          	add	a1,a1,a5
    a6f8:	00000793          	li	a5,0
    a6fc:	00b05663          	blez	a1,a708 <__ulp+0x20>
    a700:	00078513          	mv	a0,a5
    a704:	00008067          	ret
    a708:	40b005b3          	neg	a1,a1
    a70c:	4145d593          	srai	a1,a1,0x14
    a710:	01300793          	li	a5,19
    a714:	00b7cc63          	blt	a5,a1,a72c <__ulp+0x44>
    a718:	000807b7          	lui	a5,0x80
    a71c:	40b7d5b3          	sra	a1,a5,a1
    a720:	00000793          	li	a5,0
    a724:	00078513          	mv	a0,a5
    a728:	00008067          	ret
    a72c:	fec58593          	addi	a1,a1,-20
    a730:	01e00713          	li	a4,30
    a734:	00100793          	li	a5,1
    a738:	00b74663          	blt	a4,a1,a744 <__ulp+0x5c>
    a73c:	800007b7          	lui	a5,0x80000
    a740:	00b7d7b3          	srl	a5,a5,a1
    a744:	00000593          	li	a1,0
    a748:	00078513          	mv	a0,a5
    a74c:	00008067          	ret

0000a750 <__b2d>:
    a750:	fd010113          	addi	sp,sp,-48
    a754:	02812423          	sw	s0,40(sp)
    a758:	01052403          	lw	s0,16(a0)
    a75c:	02912223          	sw	s1,36(sp)
    a760:	01450493          	addi	s1,a0,20
    a764:	00241413          	slli	s0,s0,0x2
    a768:	00848433          	add	s0,s1,s0
    a76c:	03212023          	sw	s2,32(sp)
    a770:	ffc42903          	lw	s2,-4(s0)
    a774:	01312e23          	sw	s3,28(sp)
    a778:	00b12623          	sw	a1,12(sp)
    a77c:	00090513          	mv	a0,s2
    a780:	02112623          	sw	ra,44(sp)
    a784:	c90ff0ef          	jal	9c14 <__hi0bits>
    a788:	00c12583          	lw	a1,12(sp)
    a78c:	02000713          	li	a4,32
    a790:	40a707b3          	sub	a5,a4,a0
    a794:	00f5a023          	sw	a5,0(a1)
    a798:	00a00793          	li	a5,10
    a79c:	ffc40993          	addi	s3,s0,-4
    a7a0:	08a7da63          	bge	a5,a0,a834 <__b2d+0xe4>
    a7a4:	ff550613          	addi	a2,a0,-11
    a7a8:	0534f063          	bgeu	s1,s3,a7e8 <__b2d+0x98>
    a7ac:	ff842783          	lw	a5,-8(s0)
    a7b0:	04060c63          	beqz	a2,a808 <__b2d+0xb8>
    a7b4:	40c706b3          	sub	a3,a4,a2
    a7b8:	00d7d733          	srl	a4,a5,a3
    a7bc:	00c91933          	sll	s2,s2,a2
    a7c0:	00e96933          	or	s2,s2,a4
    a7c4:	00c797b3          	sll	a5,a5,a2
    a7c8:	3ff00737          	lui	a4,0x3ff00
    a7cc:	ff840613          	addi	a2,s0,-8
    a7d0:	00e96733          	or	a4,s2,a4
    a7d4:	02c4fe63          	bgeu	s1,a2,a810 <__b2d+0xc0>
    a7d8:	ff442603          	lw	a2,-12(s0)
    a7dc:	00d656b3          	srl	a3,a2,a3
    a7e0:	00d7e7b3          	or	a5,a5,a3
    a7e4:	02c0006f          	j	a810 <__b2d+0xc0>
    a7e8:	00b00793          	li	a5,11
    a7ec:	00f50c63          	beq	a0,a5,a804 <__b2d+0xb4>
    a7f0:	00c91933          	sll	s2,s2,a2
    a7f4:	3ff00737          	lui	a4,0x3ff00
    a7f8:	00e96733          	or	a4,s2,a4
    a7fc:	00000793          	li	a5,0
    a800:	0100006f          	j	a810 <__b2d+0xc0>
    a804:	00000793          	li	a5,0
    a808:	3ff00737          	lui	a4,0x3ff00
    a80c:	00e96733          	or	a4,s2,a4
    a810:	02c12083          	lw	ra,44(sp)
    a814:	02812403          	lw	s0,40(sp)
    a818:	02412483          	lw	s1,36(sp)
    a81c:	02012903          	lw	s2,32(sp)
    a820:	01c12983          	lw	s3,28(sp)
    a824:	00078513          	mv	a0,a5
    a828:	00070593          	mv	a1,a4
    a82c:	03010113          	addi	sp,sp,48
    a830:	00008067          	ret
    a834:	00b00693          	li	a3,11
    a838:	40a686b3          	sub	a3,a3,a0
    a83c:	3ff007b7          	lui	a5,0x3ff00
    a840:	00d95733          	srl	a4,s2,a3
    a844:	00f76733          	or	a4,a4,a5
    a848:	00000793          	li	a5,0
    a84c:	0134f663          	bgeu	s1,s3,a858 <__b2d+0x108>
    a850:	ff842783          	lw	a5,-8(s0)
    a854:	00d7d7b3          	srl	a5,a5,a3
    a858:	01550513          	addi	a0,a0,21
    a85c:	00a91933          	sll	s2,s2,a0
    a860:	00f967b3          	or	a5,s2,a5
    a864:	fadff06f          	j	a810 <__b2d+0xc0>

0000a868 <__d2b>:
    a868:	fc010113          	addi	sp,sp,-64
    a86c:	03212823          	sw	s2,48(sp)
    a870:	00058913          	mv	s2,a1
    a874:	00100593          	li	a1,1
    a878:	03312623          	sw	s3,44(sp)
    a87c:	03412423          	sw	s4,40(sp)
    a880:	00c12623          	sw	a2,12(sp)
    a884:	02112e23          	sw	ra,60(sp)
    a888:	02812c23          	sw	s0,56(sp)
    a88c:	02912a23          	sw	s1,52(sp)
    a890:	00068a13          	mv	s4,a3
    a894:	00070993          	mv	s3,a4
    a898:	80cff0ef          	jal	98a4 <_Balloc>
    a89c:	00c12603          	lw	a2,12(sp)
    a8a0:	0e050a63          	beqz	a0,a994 <__d2b+0x12c>
    a8a4:	01465413          	srli	s0,a2,0x14
    a8a8:	00100737          	lui	a4,0x100
    a8ac:	fff70793          	addi	a5,a4,-1 # fffff <_sidata+0xec807>
    a8b0:	7ff47413          	andi	s0,s0,2047
    a8b4:	00050493          	mv	s1,a0
    a8b8:	00c7f633          	and	a2,a5,a2
    a8bc:	00040463          	beqz	s0,a8c4 <__d2b+0x5c>
    a8c0:	00e66633          	or	a2,a2,a4
    a8c4:	00c12e23          	sw	a2,28(sp)
    a8c8:	06091063          	bnez	s2,a928 <__d2b+0xc0>
    a8cc:	01c10513          	addi	a0,sp,28
    a8d0:	bd0ff0ef          	jal	9ca0 <__lo0bits>
    a8d4:	01c12683          	lw	a3,28(sp)
    a8d8:	00100913          	li	s2,1
    a8dc:	0124a823          	sw	s2,16(s1)
    a8e0:	00d4aa23          	sw	a3,20(s1)
    a8e4:	02050713          	addi	a4,a0,32
    a8e8:	08040463          	beqz	s0,a970 <__d2b+0x108>
    a8ec:	bcd40413          	addi	s0,s0,-1075
    a8f0:	00e40433          	add	s0,s0,a4
    a8f4:	03500793          	li	a5,53
    a8f8:	008a2023          	sw	s0,0(s4)
    a8fc:	40e78533          	sub	a0,a5,a4
    a900:	03c12083          	lw	ra,60(sp)
    a904:	03812403          	lw	s0,56(sp)
    a908:	00a9a023          	sw	a0,0(s3)
    a90c:	03012903          	lw	s2,48(sp)
    a910:	02c12983          	lw	s3,44(sp)
    a914:	02812a03          	lw	s4,40(sp)
    a918:	00048513          	mv	a0,s1
    a91c:	03412483          	lw	s1,52(sp)
    a920:	04010113          	addi	sp,sp,64
    a924:	00008067          	ret
    a928:	01810513          	addi	a0,sp,24
    a92c:	01212c23          	sw	s2,24(sp)
    a930:	b70ff0ef          	jal	9ca0 <__lo0bits>
    a934:	01c12683          	lw	a3,28(sp)
    a938:	01812603          	lw	a2,24(sp)
    a93c:	00050713          	mv	a4,a0
    a940:	00050c63          	beqz	a0,a958 <__d2b+0xf0>
    a944:	02000793          	li	a5,32
    a948:	40a787b3          	sub	a5,a5,a0
    a94c:	00f697b3          	sll	a5,a3,a5
    a950:	00f66633          	or	a2,a2,a5
    a954:	00a6d6b3          	srl	a3,a3,a0
    a958:	00d03933          	snez	s2,a3
    a95c:	00190913          	addi	s2,s2,1
    a960:	00c4aa23          	sw	a2,20(s1)
    a964:	00d4ac23          	sw	a3,24(s1)
    a968:	0124a823          	sw	s2,16(s1)
    a96c:	f80410e3          	bnez	s0,a8ec <__d2b+0x84>
    a970:	00291693          	slli	a3,s2,0x2
    a974:	00d486b3          	add	a3,s1,a3
    a978:	0106a503          	lw	a0,16(a3)
    a97c:	bce70713          	addi	a4,a4,-1074
    a980:	00ea2023          	sw	a4,0(s4)
    a984:	a90ff0ef          	jal	9c14 <__hi0bits>
    a988:	00591793          	slli	a5,s2,0x5
    a98c:	40a78533          	sub	a0,a5,a0
    a990:	f71ff06f          	j	a900 <__d2b+0x98>
    a994:	00008697          	auipc	a3,0x8
    a998:	08c68693          	addi	a3,a3,140 # 12a20 <__clzsi2+0x258>
    a99c:	00000613          	li	a2,0
    a9a0:	30f00593          	li	a1,783
    a9a4:	00008517          	auipc	a0,0x8
    a9a8:	14c50513          	addi	a0,a0,332 # 12af0 <__clzsi2+0x328>
    a9ac:	1b9010ef          	jal	c364 <__assert_func>

0000a9b0 <__ratio>:
    a9b0:	fd010113          	addi	sp,sp,-48
    a9b4:	03212023          	sw	s2,32(sp)
    a9b8:	00058913          	mv	s2,a1
    a9bc:	00810593          	addi	a1,sp,8
    a9c0:	02112623          	sw	ra,44(sp)
    a9c4:	02812423          	sw	s0,40(sp)
    a9c8:	02912223          	sw	s1,36(sp)
    a9cc:	01312e23          	sw	s3,28(sp)
    a9d0:	00050993          	mv	s3,a0
    a9d4:	d7dff0ef          	jal	a750 <__b2d>
    a9d8:	00050493          	mv	s1,a0
    a9dc:	00058413          	mv	s0,a1
    a9e0:	00090513          	mv	a0,s2
    a9e4:	00c10593          	addi	a1,sp,12
    a9e8:	d69ff0ef          	jal	a750 <__b2d>
    a9ec:	0109a783          	lw	a5,16(s3)
    a9f0:	01092603          	lw	a2,16(s2)
    a9f4:	00812703          	lw	a4,8(sp)
    a9f8:	00c12683          	lw	a3,12(sp)
    a9fc:	40c787b3          	sub	a5,a5,a2
    aa00:	00579793          	slli	a5,a5,0x5
    aa04:	40d70733          	sub	a4,a4,a3
    aa08:	00e787b3          	add	a5,a5,a4
    aa0c:	02f05e63          	blez	a5,aa48 <__ratio+0x98>
    aa10:	01479793          	slli	a5,a5,0x14
    aa14:	00878433          	add	s0,a5,s0
    aa18:	00050613          	mv	a2,a0
    aa1c:	00058693          	mv	a3,a1
    aa20:	00048513          	mv	a0,s1
    aa24:	00040593          	mv	a1,s0
    aa28:	4d4050ef          	jal	fefc <__divdf3>
    aa2c:	02c12083          	lw	ra,44(sp)
    aa30:	02812403          	lw	s0,40(sp)
    aa34:	02412483          	lw	s1,36(sp)
    aa38:	02012903          	lw	s2,32(sp)
    aa3c:	01c12983          	lw	s3,28(sp)
    aa40:	03010113          	addi	sp,sp,48
    aa44:	00008067          	ret
    aa48:	01479793          	slli	a5,a5,0x14
    aa4c:	40f585b3          	sub	a1,a1,a5
    aa50:	fc9ff06f          	j	aa18 <__ratio+0x68>

0000aa54 <_mprec_log10>:
    aa54:	ff010113          	addi	sp,sp,-16
    aa58:	01212023          	sw	s2,0(sp)
    aa5c:	00112623          	sw	ra,12(sp)
    aa60:	01700793          	li	a5,23
    aa64:	00050913          	mv	s2,a0
    aa68:	06a7d263          	bge	a5,a0,aacc <_mprec_log10+0x78>
    aa6c:	00009717          	auipc	a4,0x9
    aa70:	c0c70713          	addi	a4,a4,-1012 # 13678 <__clz_tab+0x148>
    aa74:	00009697          	auipc	a3,0x9
    aa78:	c0c68693          	addi	a3,a3,-1012 # 13680 <__clz_tab+0x150>
    aa7c:	00812423          	sw	s0,8(sp)
    aa80:	00912223          	sw	s1,4(sp)
    aa84:	00072783          	lw	a5,0(a4)
    aa88:	00472583          	lw	a1,4(a4)
    aa8c:	0006a403          	lw	s0,0(a3)
    aa90:	0046a483          	lw	s1,4(a3)
    aa94:	00078513          	mv	a0,a5
    aa98:	00040613          	mv	a2,s0
    aa9c:	00048693          	mv	a3,s1
    aaa0:	234060ef          	jal	10cd4 <__muldf3>
    aaa4:	fff90913          	addi	s2,s2,-1
    aaa8:	00050793          	mv	a5,a0
    aaac:	fe0914e3          	bnez	s2,aa94 <_mprec_log10+0x40>
    aab0:	00812403          	lw	s0,8(sp)
    aab4:	00c12083          	lw	ra,12(sp)
    aab8:	00412483          	lw	s1,4(sp)
    aabc:	00012903          	lw	s2,0(sp)
    aac0:	00078513          	mv	a0,a5
    aac4:	01010113          	addi	sp,sp,16
    aac8:	00008067          	ret
    aacc:	00351913          	slli	s2,a0,0x3
    aad0:	00008717          	auipc	a4,0x8
    aad4:	6c870713          	addi	a4,a4,1736 # 13198 <__mprec_tens>
    aad8:	01270733          	add	a4,a4,s2
    aadc:	00072783          	lw	a5,0(a4)
    aae0:	00c12083          	lw	ra,12(sp)
    aae4:	00472583          	lw	a1,4(a4)
    aae8:	00012903          	lw	s2,0(sp)
    aaec:	00078513          	mv	a0,a5
    aaf0:	01010113          	addi	sp,sp,16
    aaf4:	00008067          	ret

0000aaf8 <__copybits>:
    aaf8:	01062683          	lw	a3,16(a2)
    aafc:	fff58593          	addi	a1,a1,-1
    ab00:	4055d593          	srai	a1,a1,0x5
    ab04:	00158593          	addi	a1,a1,1
    ab08:	00269693          	slli	a3,a3,0x2
    ab0c:	01460793          	addi	a5,a2,20
    ab10:	00259593          	slli	a1,a1,0x2
    ab14:	00d786b3          	add	a3,a5,a3
    ab18:	00b505b3          	add	a1,a0,a1
    ab1c:	02d7f863          	bgeu	a5,a3,ab4c <__copybits+0x54>
    ab20:	00050713          	mv	a4,a0
    ab24:	0007a803          	lw	a6,0(a5) # 3ff00000 <_stack_top+0x2fefc000>
    ab28:	00478793          	addi	a5,a5,4
    ab2c:	00470713          	addi	a4,a4,4
    ab30:	ff072e23          	sw	a6,-4(a4)
    ab34:	fed7e8e3          	bltu	a5,a3,ab24 <__copybits+0x2c>
    ab38:	40c686b3          	sub	a3,a3,a2
    ab3c:	feb68693          	addi	a3,a3,-21
    ab40:	ffc6f693          	andi	a3,a3,-4
    ab44:	00450513          	addi	a0,a0,4
    ab48:	00a68533          	add	a0,a3,a0
    ab4c:	00b57863          	bgeu	a0,a1,ab5c <__copybits+0x64>
    ab50:	00450513          	addi	a0,a0,4
    ab54:	fe052e23          	sw	zero,-4(a0)
    ab58:	feb56ce3          	bltu	a0,a1,ab50 <__copybits+0x58>
    ab5c:	00008067          	ret

0000ab60 <__any_on>:
    ab60:	01052703          	lw	a4,16(a0)
    ab64:	4055d613          	srai	a2,a1,0x5
    ab68:	01450693          	addi	a3,a0,20
    ab6c:	02c75263          	bge	a4,a2,ab90 <__any_on+0x30>
    ab70:	00271713          	slli	a4,a4,0x2
    ab74:	00e687b3          	add	a5,a3,a4
    ab78:	04f6f263          	bgeu	a3,a5,abbc <__any_on+0x5c>
    ab7c:	ffc7a703          	lw	a4,-4(a5)
    ab80:	ffc78793          	addi	a5,a5,-4
    ab84:	fe070ae3          	beqz	a4,ab78 <__any_on+0x18>
    ab88:	00100513          	li	a0,1
    ab8c:	00008067          	ret
    ab90:	00261793          	slli	a5,a2,0x2
    ab94:	00f687b3          	add	a5,a3,a5
    ab98:	fee650e3          	bge	a2,a4,ab78 <__any_on+0x18>
    ab9c:	01f5f593          	andi	a1,a1,31
    aba0:	fc058ce3          	beqz	a1,ab78 <__any_on+0x18>
    aba4:	0007a603          	lw	a2,0(a5)
    aba8:	00100513          	li	a0,1
    abac:	00b65733          	srl	a4,a2,a1
    abb0:	00b71733          	sll	a4,a4,a1
    abb4:	fce602e3          	beq	a2,a4,ab78 <__any_on+0x18>
    abb8:	00008067          	ret
    abbc:	00000513          	li	a0,0
    abc0:	00008067          	ret

0000abc4 <_realloc_r>:
    abc4:	1e058663          	beqz	a1,adb0 <_realloc_r+0x1ec>
    abc8:	fe010113          	addi	sp,sp,-32
    abcc:	00812c23          	sw	s0,24(sp)
    abd0:	00912a23          	sw	s1,20(sp)
    abd4:	00058413          	mv	s0,a1
    abd8:	00112e23          	sw	ra,28(sp)
    abdc:	00050493          	mv	s1,a0
    abe0:	00c12023          	sw	a2,0(sp)
    abe4:	ca9fe0ef          	jal	988c <__malloc_lock>
    abe8:	00012583          	lw	a1,0(sp)
    abec:	01600713          	li	a4,22
    abf0:	00b58793          	addi	a5,a1,11
    abf4:	12f77663          	bgeu	a4,a5,ad20 <_realloc_r+0x15c>
    abf8:	ff87f793          	andi	a5,a5,-8
    abfc:	00078693          	mv	a3,a5
    ac00:	01f7d713          	srli	a4,a5,0x1f
    ac04:	1eb7e263          	bltu	a5,a1,ade8 <_realloc_r+0x224>
    ac08:	1e071063          	bnez	a4,ade8 <_realloc_r+0x224>
    ac0c:	ffc42603          	lw	a2,-4(s0)
    ac10:	ff840813          	addi	a6,s0,-8
    ac14:	ffc67713          	andi	a4,a2,-4
    ac18:	12d75663          	bge	a4,a3,ad44 <_realloc_r+0x180>
    ac1c:	0fff5897          	auipc	a7,0xfff5
    ac20:	7ac8a883          	lw	a7,1964(a7) # 100003c8 <__malloc_av_+0x8>
    ac24:	00e80333          	add	t1,a6,a4
    ac28:	00432503          	lw	a0,4(t1)
    ac2c:	1e688063          	beq	a7,t1,ae0c <_realloc_r+0x248>
    ac30:	ffe57893          	andi	a7,a0,-2
    ac34:	011308b3          	add	a7,t1,a7
    ac38:	0048a883          	lw	a7,4(a7)
    ac3c:	0018f893          	andi	a7,a7,1
    ac40:	14089a63          	bnez	a7,ad94 <_realloc_r+0x1d0>
    ac44:	ffc57513          	andi	a0,a0,-4
    ac48:	00a708b3          	add	a7,a4,a0
    ac4c:	0ed8d263          	bge	a7,a3,ad30 <_realloc_r+0x16c>
    ac50:	00167613          	andi	a2,a2,1
    ac54:	02061463          	bnez	a2,ac7c <_realloc_r+0xb8>
    ac58:	ff842e03          	lw	t3,-8(s0)
    ac5c:	41c80e33          	sub	t3,a6,t3
    ac60:	004e2603          	lw	a2,4(t3)
    ac64:	ffc67613          	andi	a2,a2,-4
    ac68:	00c50533          	add	a0,a0,a2
    ac6c:	00e508b3          	add	a7,a0,a4
    ac70:	32d8d663          	bge	a7,a3,af9c <_realloc_r+0x3d8>
    ac74:	00c708b3          	add	a7,a4,a2
    ac78:	28d8de63          	bge	a7,a3,af14 <_realloc_r+0x350>
    ac7c:	00048513          	mv	a0,s1
    ac80:	00e12423          	sw	a4,8(sp)
    ac84:	01012223          	sw	a6,4(sp)
    ac88:	00f12023          	sw	a5,0(sp)
    ac8c:	a7dfd0ef          	jal	8708 <_malloc_r>
    ac90:	00012783          	lw	a5,0(sp)
    ac94:	00412803          	lw	a6,4(sp)
    ac98:	00812703          	lw	a4,8(sp)
    ac9c:	00050693          	mv	a3,a0
    aca0:	44050c63          	beqz	a0,b0f8 <_realloc_r+0x534>
    aca4:	ffc42603          	lw	a2,-4(s0)
    aca8:	ff850593          	addi	a1,a0,-8
    acac:	ffe67613          	andi	a2,a2,-2
    acb0:	00c80633          	add	a2,a6,a2
    acb4:	22b60663          	beq	a2,a1,aee0 <_realloc_r+0x31c>
    acb8:	ffc70613          	addi	a2,a4,-4
    acbc:	02400793          	li	a5,36
    acc0:	2cc7e463          	bltu	a5,a2,af88 <_realloc_r+0x3c4>
    acc4:	01300713          	li	a4,19
    acc8:	22c76463          	bltu	a4,a2,aef0 <_realloc_r+0x32c>
    accc:	00050793          	mv	a5,a0
    acd0:	00040713          	mv	a4,s0
    acd4:	00072603          	lw	a2,0(a4)
    acd8:	00c7a023          	sw	a2,0(a5)
    acdc:	00472603          	lw	a2,4(a4)
    ace0:	00c7a223          	sw	a2,4(a5)
    ace4:	00872703          	lw	a4,8(a4)
    ace8:	00e7a423          	sw	a4,8(a5)
    acec:	00040593          	mv	a1,s0
    acf0:	00048513          	mv	a0,s1
    acf4:	00d12023          	sw	a3,0(sp)
    acf8:	dc8fd0ef          	jal	82c0 <_free_r>
    acfc:	00048513          	mv	a0,s1
    ad00:	b99fe0ef          	jal	9898 <__malloc_unlock>
    ad04:	00012683          	lw	a3,0(sp)
    ad08:	01c12083          	lw	ra,28(sp)
    ad0c:	01812403          	lw	s0,24(sp)
    ad10:	01412483          	lw	s1,20(sp)
    ad14:	00068513          	mv	a0,a3
    ad18:	02010113          	addi	sp,sp,32
    ad1c:	00008067          	ret
    ad20:	01000693          	li	a3,16
    ad24:	00068793          	mv	a5,a3
    ad28:	00000713          	li	a4,0
    ad2c:	ed9ff06f          	j	ac04 <_realloc_r+0x40>
    ad30:	00c32683          	lw	a3,12(t1)
    ad34:	00832603          	lw	a2,8(t1)
    ad38:	00088713          	mv	a4,a7
    ad3c:	00d62623          	sw	a3,12(a2)
    ad40:	00c6a423          	sw	a2,8(a3)
    ad44:	00482683          	lw	a3,4(a6)
    ad48:	40f70533          	sub	a0,a4,a5
    ad4c:	00f00593          	li	a1,15
    ad50:	0016f693          	andi	a3,a3,1
    ad54:	00e80633          	add	a2,a6,a4
    ad58:	06a5e063          	bltu	a1,a0,adb8 <_realloc_r+0x1f4>
    ad5c:	00d766b3          	or	a3,a4,a3
    ad60:	00d82223          	sw	a3,4(a6)
    ad64:	00462783          	lw	a5,4(a2)
    ad68:	0017e793          	ori	a5,a5,1
    ad6c:	00f62223          	sw	a5,4(a2)
    ad70:	00048513          	mv	a0,s1
    ad74:	b25fe0ef          	jal	9898 <__malloc_unlock>
    ad78:	00040693          	mv	a3,s0
    ad7c:	01c12083          	lw	ra,28(sp)
    ad80:	01812403          	lw	s0,24(sp)
    ad84:	01412483          	lw	s1,20(sp)
    ad88:	00068513          	mv	a0,a3
    ad8c:	02010113          	addi	sp,sp,32
    ad90:	00008067          	ret
    ad94:	00167613          	andi	a2,a2,1
    ad98:	ee0612e3          	bnez	a2,ac7c <_realloc_r+0xb8>
    ad9c:	ff842e03          	lw	t3,-8(s0)
    ada0:	41c80e33          	sub	t3,a6,t3
    ada4:	004e2603          	lw	a2,4(t3)
    ada8:	ffc67613          	andi	a2,a2,-4
    adac:	ec9ff06f          	j	ac74 <_realloc_r+0xb0>
    adb0:	00060593          	mv	a1,a2
    adb4:	955fd06f          	j	8708 <_malloc_r>
    adb8:	00d7e6b3          	or	a3,a5,a3
    adbc:	00d82223          	sw	a3,4(a6)
    adc0:	00f805b3          	add	a1,a6,a5
    adc4:	00156513          	ori	a0,a0,1
    adc8:	00a5a223          	sw	a0,4(a1)
    adcc:	00462783          	lw	a5,4(a2)
    add0:	00858593          	addi	a1,a1,8
    add4:	00048513          	mv	a0,s1
    add8:	0017e793          	ori	a5,a5,1
    addc:	00f62223          	sw	a5,4(a2)
    ade0:	ce0fd0ef          	jal	82c0 <_free_r>
    ade4:	f8dff06f          	j	ad70 <_realloc_r+0x1ac>
    ade8:	00c00793          	li	a5,12
    adec:	00f4a023          	sw	a5,0(s1)
    adf0:	00000693          	li	a3,0
    adf4:	01c12083          	lw	ra,28(sp)
    adf8:	01812403          	lw	s0,24(sp)
    adfc:	01412483          	lw	s1,20(sp)
    ae00:	00068513          	mv	a0,a3
    ae04:	02010113          	addi	sp,sp,32
    ae08:	00008067          	ret
    ae0c:	ffc57513          	andi	a0,a0,-4
    ae10:	00e508b3          	add	a7,a0,a4
    ae14:	01078313          	addi	t1,a5,16
    ae18:	2468dc63          	bge	a7,t1,b070 <_realloc_r+0x4ac>
    ae1c:	00167613          	andi	a2,a2,1
    ae20:	e4061ee3          	bnez	a2,ac7c <_realloc_r+0xb8>
    ae24:	ff842e03          	lw	t3,-8(s0)
    ae28:	41c80e33          	sub	t3,a6,t3
    ae2c:	004e2603          	lw	a2,4(t3)
    ae30:	ffc67613          	andi	a2,a2,-4
    ae34:	00c50533          	add	a0,a0,a2
    ae38:	00e508b3          	add	a7,a0,a4
    ae3c:	e268cce3          	blt	a7,t1,ac74 <_realloc_r+0xb0>
    ae40:	00ce2683          	lw	a3,12(t3)
    ae44:	008e2583          	lw	a1,8(t3)
    ae48:	ffc70613          	addi	a2,a4,-4
    ae4c:	02400713          	li	a4,36
    ae50:	00d5a623          	sw	a3,12(a1)
    ae54:	00b6a423          	sw	a1,8(a3)
    ae58:	008e0693          	addi	a3,t3,8
    ae5c:	2ec76663          	bltu	a4,a2,b148 <_realloc_r+0x584>
    ae60:	01300593          	li	a1,19
    ae64:	00068713          	mv	a4,a3
    ae68:	02c5f263          	bgeu	a1,a2,ae8c <_realloc_r+0x2c8>
    ae6c:	00042583          	lw	a1,0(s0)
    ae70:	01b00713          	li	a4,27
    ae74:	00be2423          	sw	a1,8(t3)
    ae78:	00442583          	lw	a1,4(s0)
    ae7c:	00be2623          	sw	a1,12(t3)
    ae80:	30c76a63          	bltu	a4,a2,b194 <_realloc_r+0x5d0>
    ae84:	00840413          	addi	s0,s0,8
    ae88:	010e0713          	addi	a4,t3,16
    ae8c:	00042603          	lw	a2,0(s0)
    ae90:	00c72023          	sw	a2,0(a4)
    ae94:	00442603          	lw	a2,4(s0)
    ae98:	00c72223          	sw	a2,4(a4)
    ae9c:	00842603          	lw	a2,8(s0)
    aea0:	00c72423          	sw	a2,8(a4)
    aea4:	00fe0633          	add	a2,t3,a5
    aea8:	40f88733          	sub	a4,a7,a5
    aeac:	0fff5597          	auipc	a1,0xfff5
    aeb0:	50c5ae23          	sw	a2,1308(a1) # 100003c8 <__malloc_av_+0x8>
    aeb4:	00176713          	ori	a4,a4,1
    aeb8:	00e62223          	sw	a4,4(a2)
    aebc:	004e2703          	lw	a4,4(t3)
    aec0:	00048513          	mv	a0,s1
    aec4:	00d12023          	sw	a3,0(sp)
    aec8:	00177713          	andi	a4,a4,1
    aecc:	00f767b3          	or	a5,a4,a5
    aed0:	00fe2223          	sw	a5,4(t3)
    aed4:	9c5fe0ef          	jal	9898 <__malloc_unlock>
    aed8:	00012683          	lw	a3,0(sp)
    aedc:	ea1ff06f          	j	ad7c <_realloc_r+0x1b8>
    aee0:	ffc52683          	lw	a3,-4(a0)
    aee4:	ffc6f693          	andi	a3,a3,-4
    aee8:	00d70733          	add	a4,a4,a3
    aeec:	e59ff06f          	j	ad44 <_realloc_r+0x180>
    aef0:	00042583          	lw	a1,0(s0)
    aef4:	01b00713          	li	a4,27
    aef8:	00b52023          	sw	a1,0(a0)
    aefc:	00442583          	lw	a1,4(s0)
    af00:	00b52223          	sw	a1,4(a0)
    af04:	10c76e63          	bltu	a4,a2,b020 <_realloc_r+0x45c>
    af08:	00840713          	addi	a4,s0,8
    af0c:	00850793          	addi	a5,a0,8
    af10:	dc5ff06f          	j	acd4 <_realloc_r+0x110>
    af14:	00ce2683          	lw	a3,12(t3)
    af18:	008e2583          	lw	a1,8(t3)
    af1c:	ffc70613          	addi	a2,a4,-4
    af20:	02400513          	li	a0,36
    af24:	00d5a623          	sw	a3,12(a1)
    af28:	00b6a423          	sw	a1,8(a3)
    af2c:	008e0693          	addi	a3,t3,8
    af30:	10c56863          	bltu	a0,a2,b040 <_realloc_r+0x47c>
    af34:	01300593          	li	a1,19
    af38:	00068713          	mv	a4,a3
    af3c:	02c5f263          	bgeu	a1,a2,af60 <_realloc_r+0x39c>
    af40:	00042583          	lw	a1,0(s0)
    af44:	01b00713          	li	a4,27
    af48:	00be2423          	sw	a1,8(t3)
    af4c:	00442583          	lw	a1,4(s0)
    af50:	00be2623          	sw	a1,12(t3)
    af54:	18c76263          	bltu	a4,a2,b0d8 <_realloc_r+0x514>
    af58:	00840413          	addi	s0,s0,8
    af5c:	010e0713          	addi	a4,t3,16
    af60:	00042603          	lw	a2,0(s0)
    af64:	00c72023          	sw	a2,0(a4)
    af68:	00442603          	lw	a2,4(s0)
    af6c:	00c72223          	sw	a2,4(a4)
    af70:	00842603          	lw	a2,8(s0)
    af74:	00c72423          	sw	a2,8(a4)
    af78:	00068413          	mv	s0,a3
    af7c:	00088713          	mv	a4,a7
    af80:	000e0813          	mv	a6,t3
    af84:	dc1ff06f          	j	ad44 <_realloc_r+0x180>
    af88:	00040593          	mv	a1,s0
    af8c:	00a12023          	sw	a0,0(sp)
    af90:	850fb0ef          	jal	5fe0 <memmove>
    af94:	00012683          	lw	a3,0(sp)
    af98:	d55ff06f          	j	acec <_realloc_r+0x128>
    af9c:	00c32683          	lw	a3,12(t1)
    afa0:	00832583          	lw	a1,8(t1)
    afa4:	ffc70613          	addi	a2,a4,-4
    afa8:	02400513          	li	a0,36
    afac:	00d5a623          	sw	a3,12(a1)
    afb0:	00b6a423          	sw	a1,8(a3)
    afb4:	00ce2703          	lw	a4,12(t3)
    afb8:	008e2683          	lw	a3,8(t3)
    afbc:	008e0813          	addi	a6,t3,8
    afc0:	00e6a623          	sw	a4,12(a3)
    afc4:	00d72423          	sw	a3,8(a4)
    afc8:	0ec56063          	bltu	a0,a2,b0a8 <_realloc_r+0x4e4>
    afcc:	01300693          	li	a3,19
    afd0:	00080713          	mv	a4,a6
    afd4:	02c6f263          	bgeu	a3,a2,aff8 <_realloc_r+0x434>
    afd8:	00042683          	lw	a3,0(s0)
    afdc:	01b00713          	li	a4,27
    afe0:	00de2423          	sw	a3,8(t3)
    afe4:	00442683          	lw	a3,4(s0)
    afe8:	00de2623          	sw	a3,12(t3)
    afec:	12c76c63          	bltu	a4,a2,b124 <_realloc_r+0x560>
    aff0:	00840413          	addi	s0,s0,8
    aff4:	010e0713          	addi	a4,t3,16
    aff8:	00042683          	lw	a3,0(s0)
    affc:	00d72023          	sw	a3,0(a4)
    b000:	00442683          	lw	a3,4(s0)
    b004:	00d72223          	sw	a3,4(a4)
    b008:	00842683          	lw	a3,8(s0)
    b00c:	00d72423          	sw	a3,8(a4)
    b010:	00080413          	mv	s0,a6
    b014:	00088713          	mv	a4,a7
    b018:	000e0813          	mv	a6,t3
    b01c:	d29ff06f          	j	ad44 <_realloc_r+0x180>
    b020:	00842703          	lw	a4,8(s0)
    b024:	00e52423          	sw	a4,8(a0)
    b028:	00c42703          	lw	a4,12(s0)
    b02c:	00e52623          	sw	a4,12(a0)
    b030:	0cf60c63          	beq	a2,a5,b108 <_realloc_r+0x544>
    b034:	01040713          	addi	a4,s0,16
    b038:	01050793          	addi	a5,a0,16
    b03c:	c99ff06f          	j	acd4 <_realloc_r+0x110>
    b040:	00068513          	mv	a0,a3
    b044:	00040593          	mv	a1,s0
    b048:	01c12623          	sw	t3,12(sp)
    b04c:	00f12423          	sw	a5,8(sp)
    b050:	01112223          	sw	a7,4(sp)
    b054:	00d12023          	sw	a3,0(sp)
    b058:	f89fa0ef          	jal	5fe0 <memmove>
    b05c:	00c12e03          	lw	t3,12(sp)
    b060:	00812783          	lw	a5,8(sp)
    b064:	00412883          	lw	a7,4(sp)
    b068:	00012683          	lw	a3,0(sp)
    b06c:	f0dff06f          	j	af78 <_realloc_r+0x3b4>
    b070:	00f80833          	add	a6,a6,a5
    b074:	40f88733          	sub	a4,a7,a5
    b078:	0fff5697          	auipc	a3,0xfff5
    b07c:	3506a823          	sw	a6,848(a3) # 100003c8 <__malloc_av_+0x8>
    b080:	00176713          	ori	a4,a4,1
    b084:	00e82223          	sw	a4,4(a6)
    b088:	ffc42703          	lw	a4,-4(s0)
    b08c:	00048513          	mv	a0,s1
    b090:	00177713          	andi	a4,a4,1
    b094:	00f767b3          	or	a5,a4,a5
    b098:	fef42e23          	sw	a5,-4(s0)
    b09c:	ffcfe0ef          	jal	9898 <__malloc_unlock>
    b0a0:	00040693          	mv	a3,s0
    b0a4:	cd9ff06f          	j	ad7c <_realloc_r+0x1b8>
    b0a8:	00080513          	mv	a0,a6
    b0ac:	00040593          	mv	a1,s0
    b0b0:	01c12623          	sw	t3,12(sp)
    b0b4:	00f12423          	sw	a5,8(sp)
    b0b8:	01112223          	sw	a7,4(sp)
    b0bc:	01012023          	sw	a6,0(sp)
    b0c0:	f21fa0ef          	jal	5fe0 <memmove>
    b0c4:	00012803          	lw	a6,0(sp)
    b0c8:	00412883          	lw	a7,4(sp)
    b0cc:	00812783          	lw	a5,8(sp)
    b0d0:	00c12e03          	lw	t3,12(sp)
    b0d4:	f3dff06f          	j	b010 <_realloc_r+0x44c>
    b0d8:	00842703          	lw	a4,8(s0)
    b0dc:	00ee2823          	sw	a4,16(t3)
    b0e0:	00c42703          	lw	a4,12(s0)
    b0e4:	00ee2a23          	sw	a4,20(t3)
    b0e8:	08a60863          	beq	a2,a0,b178 <_realloc_r+0x5b4>
    b0ec:	01040413          	addi	s0,s0,16
    b0f0:	018e0713          	addi	a4,t3,24
    b0f4:	e6dff06f          	j	af60 <_realloc_r+0x39c>
    b0f8:	00048513          	mv	a0,s1
    b0fc:	f9cfe0ef          	jal	9898 <__malloc_unlock>
    b100:	00000693          	li	a3,0
    b104:	cf1ff06f          	j	adf4 <_realloc_r+0x230>
    b108:	01042603          	lw	a2,16(s0)
    b10c:	01840713          	addi	a4,s0,24
    b110:	01850793          	addi	a5,a0,24
    b114:	00c52823          	sw	a2,16(a0)
    b118:	01442603          	lw	a2,20(s0)
    b11c:	00c52a23          	sw	a2,20(a0)
    b120:	bb5ff06f          	j	acd4 <_realloc_r+0x110>
    b124:	00842683          	lw	a3,8(s0)
    b128:	02400713          	li	a4,36
    b12c:	00de2823          	sw	a3,16(t3)
    b130:	00c42683          	lw	a3,12(s0)
    b134:	00de2a23          	sw	a3,20(t3)
    b138:	08e60063          	beq	a2,a4,b1b8 <_realloc_r+0x5f4>
    b13c:	01040413          	addi	s0,s0,16
    b140:	018e0713          	addi	a4,t3,24
    b144:	eb5ff06f          	j	aff8 <_realloc_r+0x434>
    b148:	00068513          	mv	a0,a3
    b14c:	00040593          	mv	a1,s0
    b150:	01c12623          	sw	t3,12(sp)
    b154:	00f12423          	sw	a5,8(sp)
    b158:	01112223          	sw	a7,4(sp)
    b15c:	00d12023          	sw	a3,0(sp)
    b160:	e81fa0ef          	jal	5fe0 <memmove>
    b164:	00c12e03          	lw	t3,12(sp)
    b168:	00812783          	lw	a5,8(sp)
    b16c:	00412883          	lw	a7,4(sp)
    b170:	00012683          	lw	a3,0(sp)
    b174:	d31ff06f          	j	aea4 <_realloc_r+0x2e0>
    b178:	01042603          	lw	a2,16(s0)
    b17c:	020e0713          	addi	a4,t3,32
    b180:	01840413          	addi	s0,s0,24
    b184:	00ce2c23          	sw	a2,24(t3)
    b188:	ffc42603          	lw	a2,-4(s0)
    b18c:	00ce2e23          	sw	a2,28(t3)
    b190:	dd1ff06f          	j	af60 <_realloc_r+0x39c>
    b194:	00842583          	lw	a1,8(s0)
    b198:	02400713          	li	a4,36
    b19c:	00be2823          	sw	a1,16(t3)
    b1a0:	00c42583          	lw	a1,12(s0)
    b1a4:	00be2a23          	sw	a1,20(t3)
    b1a8:	02e60663          	beq	a2,a4,b1d4 <_realloc_r+0x610>
    b1ac:	01040413          	addi	s0,s0,16
    b1b0:	018e0713          	addi	a4,t3,24
    b1b4:	cd9ff06f          	j	ae8c <_realloc_r+0x2c8>
    b1b8:	01042683          	lw	a3,16(s0)
    b1bc:	020e0713          	addi	a4,t3,32
    b1c0:	01840413          	addi	s0,s0,24
    b1c4:	00de2c23          	sw	a3,24(t3)
    b1c8:	ffc42683          	lw	a3,-4(s0)
    b1cc:	00de2e23          	sw	a3,28(t3)
    b1d0:	e29ff06f          	j	aff8 <_realloc_r+0x434>
    b1d4:	01042603          	lw	a2,16(s0)
    b1d8:	020e0713          	addi	a4,t3,32
    b1dc:	01840413          	addi	s0,s0,24
    b1e0:	00ce2c23          	sw	a2,24(t3)
    b1e4:	ffc42603          	lw	a2,-4(s0)
    b1e8:	00ce2e23          	sw	a2,28(t3)
    b1ec:	ca1ff06f          	j	ae8c <_realloc_r+0x2c8>

0000b1f0 <_strtol_l.part.0>:
    b1f0:	fb010113          	addi	sp,sp,-80
    b1f4:	04812423          	sw	s0,72(sp)
    b1f8:	03312e23          	sw	s3,60(sp)
    b1fc:	03512a23          	sw	s5,52(sp)
    b200:	03612823          	sw	s6,48(sp)
    b204:	04112623          	sw	ra,76(sp)
    b208:	00068b13          	mv	s6,a3
    b20c:	04912223          	sw	s1,68(sp)
    b210:	05212023          	sw	s2,64(sp)
    b214:	03412c23          	sw	s4,56(sp)
    b218:	03712623          	sw	s7,44(sp)
    b21c:	03812423          	sw	s8,40(sp)
    b220:	03912223          	sw	s9,36(sp)
    b224:	03a12023          	sw	s10,32(sp)
    b228:	01b12e23          	sw	s11,28(sp)
    b22c:	00058993          	mv	s3,a1
    b230:	00a12423          	sw	a0,8(sp)
    b234:	00060a93          	mv	s5,a2
    b238:	00058413          	mv	s0,a1
    b23c:	00008697          	auipc	a3,0x8
    b240:	02568693          	addi	a3,a3,37 # 13261 <_ctype_+0x1>
    b244:	00040613          	mv	a2,s0
    b248:	00044703          	lbu	a4,0(s0)
    b24c:	00140413          	addi	s0,s0,1
    b250:	00e687b3          	add	a5,a3,a4
    b254:	0007c783          	lbu	a5,0(a5)
    b258:	0087f793          	andi	a5,a5,8
    b25c:	fe0794e3          	bnez	a5,b244 <_strtol_l.part.0+0x54>
    b260:	02d00793          	li	a5,45
    b264:	fefb7913          	andi	s2,s6,-17
    b268:	16f70863          	beq	a4,a5,b3d8 <_strtol_l.part.0+0x1e8>
    b26c:	02b00793          	li	a5,43
    b270:	02f70c63          	beq	a4,a5,b2a8 <_strtol_l.part.0+0xb8>
    b274:	04091063          	bnez	s2,b2b4 <_strtol_l.part.0+0xc4>
    b278:	03000793          	li	a5,48
    b27c:	24f70263          	beq	a4,a5,b4c0 <_strtol_l.part.0+0x2d0>
    b280:	220b0463          	beqz	s6,b4a8 <_strtol_l.part.0+0x2b8>
    b284:	08000bb7          	lui	s7,0x8000
    b288:	01000b13          	li	s6,16
    b28c:	fffb8b93          	addi	s7,s7,-1 # 7ffffff <_sidata+0x7fec807>
    b290:	000b0a13          	mv	s4,s6
    b294:	00f00913          	li	s2,15
    b298:	800007b7          	lui	a5,0x80000
    b29c:	fff78d93          	addi	s11,a5,-1 # 7fffffff <_stack_top+0x6fffbfff>
    b2a0:	00000d13          	li	s10,0
    b2a4:	0480006f          	j	b2ec <_strtol_l.part.0+0xfc>
    b2a8:	00044703          	lbu	a4,0(s0)
    b2ac:	00260413          	addi	s0,a2,2
    b2b0:	1a090063          	beqz	s2,b450 <_strtol_l.part.0+0x260>
    b2b4:	800004b7          	lui	s1,0x80000
    b2b8:	000b0593          	mv	a1,s6
    b2bc:	fff48513          	addi	a0,s1,-1 # 7fffffff <_stack_top+0x6fffbfff>
    b2c0:	00e12623          	sw	a4,12(sp)
    b2c4:	4a0070ef          	jal	12764 <__umodsi3>
    b2c8:	00050913          	mv	s2,a0
    b2cc:	000b0593          	mv	a1,s6
    b2d0:	fff48513          	addi	a0,s1,-1
    b2d4:	448070ef          	jal	1271c <__hidden___udivsi3>
    b2d8:	00c12703          	lw	a4,12(sp)
    b2dc:	000b0a13          	mv	s4,s6
    b2e0:	fff48d93          	addi	s11,s1,-1
    b2e4:	00050b93          	mv	s7,a0
    b2e8:	00000d13          	li	s10,0
    b2ec:	00000793          	li	a5,0
    b2f0:	00000513          	li	a0,0
    b2f4:	00900c13          	li	s8,9
    b2f8:	01900c93          	li	s9,25
    b2fc:	fd070493          	addi	s1,a4,-48
    b300:	009c7e63          	bgeu	s8,s1,b31c <_strtol_l.part.0+0x12c>
    b304:	fbf70693          	addi	a3,a4,-65
    b308:	fc970493          	addi	s1,a4,-55
    b30c:	00dcf863          	bgeu	s9,a3,b31c <_strtol_l.part.0+0x12c>
    b310:	f9f70693          	addi	a3,a4,-97
    b314:	04dce663          	bltu	s9,a3,b360 <_strtol_l.part.0+0x170>
    b318:	fa970493          	addi	s1,a4,-87
    b31c:	0564d263          	bge	s1,s6,b360 <_strtol_l.part.0+0x170>
    b320:	00178793          	addi	a5,a5,1
    b324:	02078063          	beqz	a5,b344 <_strtol_l.part.0+0x154>
    b328:	00abee63          	bltu	s7,a0,b344 <_strtol_l.part.0+0x154>
    b32c:	03751063          	bne	a0,s7,b34c <_strtol_l.part.0+0x15c>
    b330:	fff00793          	li	a5,-1
    b334:	00995c63          	bge	s2,s1,b34c <_strtol_l.part.0+0x15c>
    b338:	00140413          	addi	s0,s0,1
    b33c:	fff44703          	lbu	a4,-1(s0)
    b340:	fbdff06f          	j	b2fc <_strtol_l.part.0+0x10c>
    b344:	fff00793          	li	a5,-1
    b348:	ff1ff06f          	j	b338 <_strtol_l.part.0+0x148>
    b34c:	000a0593          	mv	a1,s4
    b350:	3a0070ef          	jal	126f0 <__mulsi3>
    b354:	00a48533          	add	a0,s1,a0
    b358:	00100793          	li	a5,1
    b35c:	fddff06f          	j	b338 <_strtol_l.part.0+0x148>
    b360:	fff00713          	li	a4,-1
    b364:	04e78a63          	beq	a5,a4,b3b8 <_strtol_l.part.0+0x1c8>
    b368:	000d0463          	beqz	s10,b370 <_strtol_l.part.0+0x180>
    b36c:	40a00533          	neg	a0,a0
    b370:	000a8663          	beqz	s5,b37c <_strtol_l.part.0+0x18c>
    b374:	0c079a63          	bnez	a5,b448 <_strtol_l.part.0+0x258>
    b378:	013aa023          	sw	s3,0(s5)
    b37c:	04c12083          	lw	ra,76(sp)
    b380:	04812403          	lw	s0,72(sp)
    b384:	04412483          	lw	s1,68(sp)
    b388:	04012903          	lw	s2,64(sp)
    b38c:	03c12983          	lw	s3,60(sp)
    b390:	03812a03          	lw	s4,56(sp)
    b394:	03412a83          	lw	s5,52(sp)
    b398:	03012b03          	lw	s6,48(sp)
    b39c:	02c12b83          	lw	s7,44(sp)
    b3a0:	02812c03          	lw	s8,40(sp)
    b3a4:	02412c83          	lw	s9,36(sp)
    b3a8:	02012d03          	lw	s10,32(sp)
    b3ac:	01c12d83          	lw	s11,28(sp)
    b3b0:	05010113          	addi	sp,sp,80
    b3b4:	00008067          	ret
    b3b8:	00812703          	lw	a4,8(sp)
    b3bc:	02200793          	li	a5,34
    b3c0:	000d8513          	mv	a0,s11
    b3c4:	00f72023          	sw	a5,0(a4)
    b3c8:	fa0a8ae3          	beqz	s5,b37c <_strtol_l.part.0+0x18c>
    b3cc:	fff40993          	addi	s3,s0,-1
    b3d0:	000d8513          	mv	a0,s11
    b3d4:	fa5ff06f          	j	b378 <_strtol_l.part.0+0x188>
    b3d8:	00044703          	lbu	a4,0(s0)
    b3dc:	00260413          	addi	s0,a2,2
    b3e0:	02091863          	bnez	s2,b410 <_strtol_l.part.0+0x220>
    b3e4:	03000793          	li	a5,48
    b3e8:	10f70663          	beq	a4,a5,b4f4 <_strtol_l.part.0+0x304>
    b3ec:	120b1863          	bnez	s6,b51c <_strtol_l.part.0+0x32c>
    b3f0:	00a00b13          	li	s6,10
    b3f4:	0cccdbb7          	lui	s7,0xcccd
    b3f8:	cccb8b93          	addi	s7,s7,-820 # ccccccc <_sidata+0xccb94d4>
    b3fc:	000b0a13          	mv	s4,s6
    b400:	00800913          	li	s2,8
    b404:	00100d13          	li	s10,1
    b408:	80000db7          	lui	s11,0x80000
    b40c:	ee1ff06f          	j	b2ec <_strtol_l.part.0+0xfc>
    b410:	000b0593          	mv	a1,s6
    b414:	80000537          	lui	a0,0x80000
    b418:	00e12623          	sw	a4,12(sp)
    b41c:	348070ef          	jal	12764 <__umodsi3>
    b420:	000b0a13          	mv	s4,s6
    b424:	00050913          	mv	s2,a0
    b428:	000b0593          	mv	a1,s6
    b42c:	80000537          	lui	a0,0x80000
    b430:	2ec070ef          	jal	1271c <__hidden___udivsi3>
    b434:	00c12703          	lw	a4,12(sp)
    b438:	00050b93          	mv	s7,a0
    b43c:	00100d13          	li	s10,1
    b440:	80000db7          	lui	s11,0x80000
    b444:	ea9ff06f          	j	b2ec <_strtol_l.part.0+0xfc>
    b448:	00050d93          	mv	s11,a0
    b44c:	f81ff06f          	j	b3cc <_strtol_l.part.0+0x1dc>
    b450:	03000793          	li	a5,48
    b454:	e2f716e3          	bne	a4,a5,b280 <_strtol_l.part.0+0x90>
    b458:	00264783          	lbu	a5,2(a2)
    b45c:	05800693          	li	a3,88
    b460:	0df7f793          	andi	a5,a5,223
    b464:	08d79063          	bne	a5,a3,b4e4 <_strtol_l.part.0+0x2f4>
    b468:	00364703          	lbu	a4,3(a2)
    b46c:	01000b13          	li	s6,16
    b470:	000b0a13          	mv	s4,s6
    b474:	00460413          	addi	s0,a2,4
    b478:	800004b7          	lui	s1,0x80000
    b47c:	000a0593          	mv	a1,s4
    b480:	fff48513          	addi	a0,s1,-1 # 7fffffff <_stack_top+0x6fffbfff>
    b484:	00e12623          	sw	a4,12(sp)
    b488:	2dc070ef          	jal	12764 <__umodsi3>
    b48c:	00050913          	mv	s2,a0
    b490:	000a0593          	mv	a1,s4
    b494:	fff48513          	addi	a0,s1,-1
    b498:	284070ef          	jal	1271c <__hidden___udivsi3>
    b49c:	00c12703          	lw	a4,12(sp)
    b4a0:	00050b93          	mv	s7,a0
    b4a4:	df5ff06f          	j	b298 <_strtol_l.part.0+0xa8>
    b4a8:	00a00b13          	li	s6,10
    b4ac:	0cccdbb7          	lui	s7,0xcccd
    b4b0:	cccb8b93          	addi	s7,s7,-820 # ccccccc <_sidata+0xccb94d4>
    b4b4:	000b0a13          	mv	s4,s6
    b4b8:	00700913          	li	s2,7
    b4bc:	dddff06f          	j	b298 <_strtol_l.part.0+0xa8>
    b4c0:	00044783          	lbu	a5,0(s0)
    b4c4:	05800693          	li	a3,88
    b4c8:	0df7f793          	andi	a5,a5,223
    b4cc:	00d79c63          	bne	a5,a3,b4e4 <_strtol_l.part.0+0x2f4>
    b4d0:	01000b13          	li	s6,16
    b4d4:	00144703          	lbu	a4,1(s0)
    b4d8:	000b0a13          	mv	s4,s6
    b4dc:	00360413          	addi	s0,a2,3
    b4e0:	f99ff06f          	j	b478 <_strtol_l.part.0+0x288>
    b4e4:	060b1263          	bnez	s6,b548 <_strtol_l.part.0+0x358>
    b4e8:	00800b13          	li	s6,8
    b4ec:	000b0a13          	mv	s4,s6
    b4f0:	f89ff06f          	j	b478 <_strtol_l.part.0+0x288>
    b4f4:	00264783          	lbu	a5,2(a2)
    b4f8:	05800693          	li	a3,88
    b4fc:	0df7f793          	andi	a5,a5,223
    b500:	02d78a63          	beq	a5,a3,b534 <_strtol_l.part.0+0x344>
    b504:	040b0863          	beqz	s6,b554 <_strtol_l.part.0+0x364>
    b508:	01000b13          	li	s6,16
    b50c:	000b0a13          	mv	s4,s6
    b510:	00e12623          	sw	a4,12(sp)
    b514:	000a0593          	mv	a1,s4
    b518:	f15ff06f          	j	b42c <_strtol_l.part.0+0x23c>
    b51c:	01000b13          	li	s6,16
    b520:	000b0a13          	mv	s4,s6
    b524:	08000bb7          	lui	s7,0x8000
    b528:	00100d13          	li	s10,1
    b52c:	80000db7          	lui	s11,0x80000
    b530:	dbdff06f          	j	b2ec <_strtol_l.part.0+0xfc>
    b534:	01000b13          	li	s6,16
    b538:	00364703          	lbu	a4,3(a2)
    b53c:	000b0a13          	mv	s4,s6
    b540:	00460413          	addi	s0,a2,4
    b544:	fcdff06f          	j	b510 <_strtol_l.part.0+0x320>
    b548:	01000b13          	li	s6,16
    b54c:	000b0a13          	mv	s4,s6
    b550:	f29ff06f          	j	b478 <_strtol_l.part.0+0x288>
    b554:	00800b13          	li	s6,8
    b558:	000b0a13          	mv	s4,s6
    b55c:	fb5ff06f          	j	b510 <_strtol_l.part.0+0x320>

0000b560 <_strtol_r>:
    b560:	0256b713          	sltiu	a4,a3,37
    b564:	00070863          	beqz	a4,b574 <_strtol_r+0x14>
    b568:	fff68793          	addi	a5,a3,-1
    b56c:	00078463          	beqz	a5,b574 <_strtol_r+0x14>
    b570:	c81ff06f          	j	b1f0 <_strtol_l.part.0>
    b574:	ff010113          	addi	sp,sp,-16
    b578:	00112623          	sw	ra,12(sp)
    b57c:	5dd000ef          	jal	c358 <__errno>
    b580:	00c12083          	lw	ra,12(sp)
    b584:	01600793          	li	a5,22
    b588:	00f52023          	sw	a5,0(a0) # 80000000 <_stack_top+0x6fffc000>
    b58c:	00000513          	li	a0,0
    b590:	01010113          	addi	sp,sp,16
    b594:	00008067          	ret

0000b598 <strtol_l>:
    b598:	02563793          	sltiu	a5,a2,37
    b59c:	02078463          	beqz	a5,b5c4 <strtol_l+0x2c>
    b5a0:	fff60793          	addi	a5,a2,-1
    b5a4:	02078063          	beqz	a5,b5c4 <strtol_l+0x2c>
    b5a8:	00050713          	mv	a4,a0
    b5ac:	0fff5517          	auipc	a0,0xfff5
    b5b0:	21c52503          	lw	a0,540(a0) # 100007c8 <_impure_ptr>
    b5b4:	00060693          	mv	a3,a2
    b5b8:	00058613          	mv	a2,a1
    b5bc:	00070593          	mv	a1,a4
    b5c0:	c31ff06f          	j	b1f0 <_strtol_l.part.0>
    b5c4:	ff010113          	addi	sp,sp,-16
    b5c8:	00112623          	sw	ra,12(sp)
    b5cc:	58d000ef          	jal	c358 <__errno>
    b5d0:	00c12083          	lw	ra,12(sp)
    b5d4:	01600793          	li	a5,22
    b5d8:	00f52023          	sw	a5,0(a0)
    b5dc:	00000513          	li	a0,0
    b5e0:	01010113          	addi	sp,sp,16
    b5e4:	00008067          	ret

0000b5e8 <strtol>:
    b5e8:	02563793          	sltiu	a5,a2,37
    b5ec:	02078463          	beqz	a5,b614 <strtol+0x2c>
    b5f0:	fff60793          	addi	a5,a2,-1
    b5f4:	02078063          	beqz	a5,b614 <strtol+0x2c>
    b5f8:	00050713          	mv	a4,a0
    b5fc:	0fff5517          	auipc	a0,0xfff5
    b600:	1cc52503          	lw	a0,460(a0) # 100007c8 <_impure_ptr>
    b604:	00060693          	mv	a3,a2
    b608:	00058613          	mv	a2,a1
    b60c:	00070593          	mv	a1,a4
    b610:	be1ff06f          	j	b1f0 <_strtol_l.part.0>
    b614:	ff010113          	addi	sp,sp,-16
    b618:	00112623          	sw	ra,12(sp)
    b61c:	53d000ef          	jal	c358 <__errno>
    b620:	00c12083          	lw	ra,12(sp)
    b624:	01600793          	li	a5,22
    b628:	00f52023          	sw	a5,0(a0)
    b62c:	00000513          	li	a0,0
    b630:	01010113          	addi	sp,sp,16
    b634:	00008067          	ret

0000b638 <_wctomb_r>:
    b638:	0fff5797          	auipc	a5,0xfff5
    b63c:	cdc7a783          	lw	a5,-804(a5) # 10000314 <__global_locale+0xe0>
    b640:	00078067          	jr	a5

0000b644 <__ascii_wctomb>:
    b644:	02058463          	beqz	a1,b66c <__ascii_wctomb+0x28>
    b648:	0ff00793          	li	a5,255
    b64c:	00c7e863          	bltu	a5,a2,b65c <__ascii_wctomb+0x18>
    b650:	00c58023          	sb	a2,0(a1)
    b654:	00100513          	li	a0,1
    b658:	00008067          	ret
    b65c:	08a00793          	li	a5,138
    b660:	00f52023          	sw	a5,0(a0)
    b664:	fff00513          	li	a0,-1
    b668:	00008067          	ret
    b66c:	00000513          	li	a0,0
    b670:	00008067          	ret

0000b674 <__utf8_wctomb>:
    b674:	0a058263          	beqz	a1,b718 <__utf8_wctomb+0xa4>
    b678:	07f00793          	li	a5,127
    b67c:	06c7f863          	bgeu	a5,a2,b6ec <__utf8_wctomb+0x78>
    b680:	f8060793          	addi	a5,a2,-128
    b684:	77f00713          	li	a4,1919
    b688:	06f77863          	bgeu	a4,a5,b6f8 <__utf8_wctomb+0x84>
    b68c:	0000f7b7          	lui	a5,0xf
    b690:	7ff78793          	addi	a5,a5,2047 # f7ff <__adddf3+0x457>
    b694:	80060713          	addi	a4,a2,-2048
    b698:	08e7f463          	bgeu	a5,a4,b720 <__utf8_wctomb+0xac>
    b69c:	ffff07b7          	lui	a5,0xffff0
    b6a0:	00f607b3          	add	a5,a2,a5
    b6a4:	00100737          	lui	a4,0x100
    b6a8:	0ae7f463          	bgeu	a5,a4,b750 <__utf8_wctomb+0xdc>
    b6ac:	00c65713          	srli	a4,a2,0xc
    b6b0:	00665793          	srli	a5,a2,0x6
    b6b4:	01265693          	srli	a3,a2,0x12
    b6b8:	03f77713          	andi	a4,a4,63
    b6bc:	03f7f793          	andi	a5,a5,63
    b6c0:	03f67613          	andi	a2,a2,63
    b6c4:	f8076713          	ori	a4,a4,-128
    b6c8:	f807e793          	ori	a5,a5,-128
    b6cc:	ff06e693          	ori	a3,a3,-16
    b6d0:	f8066613          	ori	a2,a2,-128
    b6d4:	00e580a3          	sb	a4,1(a1)
    b6d8:	00f58123          	sb	a5,2(a1)
    b6dc:	00d58023          	sb	a3,0(a1)
    b6e0:	00c581a3          	sb	a2,3(a1)
    b6e4:	00400513          	li	a0,4
    b6e8:	00008067          	ret
    b6ec:	00c58023          	sb	a2,0(a1)
    b6f0:	00100513          	li	a0,1
    b6f4:	00008067          	ret
    b6f8:	00665793          	srli	a5,a2,0x6
    b6fc:	03f67613          	andi	a2,a2,63
    b700:	fc07e793          	ori	a5,a5,-64
    b704:	f8066613          	ori	a2,a2,-128
    b708:	00f58023          	sb	a5,0(a1)
    b70c:	00c580a3          	sb	a2,1(a1)
    b710:	00200513          	li	a0,2
    b714:	00008067          	ret
    b718:	00000513          	li	a0,0
    b71c:	00008067          	ret
    b720:	00665793          	srli	a5,a2,0x6
    b724:	00c65713          	srli	a4,a2,0xc
    b728:	03f7f793          	andi	a5,a5,63
    b72c:	03f67613          	andi	a2,a2,63
    b730:	f807e793          	ori	a5,a5,-128
    b734:	fe076713          	ori	a4,a4,-32
    b738:	f8066613          	ori	a2,a2,-128
    b73c:	00f580a3          	sb	a5,1(a1)
    b740:	00e58023          	sb	a4,0(a1)
    b744:	00c58123          	sb	a2,2(a1)
    b748:	00300513          	li	a0,3
    b74c:	00008067          	ret
    b750:	08a00793          	li	a5,138
    b754:	00f52023          	sw	a5,0(a0)
    b758:	fff00513          	li	a0,-1
    b75c:	00008067          	ret

0000b760 <__sjis_wctomb>:
    b760:	06058663          	beqz	a1,b7cc <__sjis_wctomb+0x6c>
    b764:	00865793          	srli	a5,a2,0x8
    b768:	0ff7f793          	zext.b	a5,a5
    b76c:	04078a63          	beqz	a5,b7c0 <__sjis_wctomb+0x60>
    b770:	07f78713          	addi	a4,a5,127 # ffff007f <_stack_top+0xeffec07f>
    b774:	0ff77713          	zext.b	a4,a4
    b778:	01f73713          	sltiu	a4,a4,31
    b77c:	00071a63          	bnez	a4,b790 <__sjis_wctomb+0x30>
    b780:	02078713          	addi	a4,a5,32
    b784:	0ff77713          	zext.b	a4,a4
    b788:	01073713          	sltiu	a4,a4,16
    b78c:	04070463          	beqz	a4,b7d4 <__sjis_wctomb+0x74>
    b790:	fc060713          	addi	a4,a2,-64
    b794:	0ff77713          	zext.b	a4,a4
    b798:	03f73713          	sltiu	a4,a4,63
    b79c:	00071a63          	bnez	a4,b7b0 <__sjis_wctomb+0x50>
    b7a0:	f8060713          	addi	a4,a2,-128
    b7a4:	0ff77713          	zext.b	a4,a4
    b7a8:	07d73713          	sltiu	a4,a4,125
    b7ac:	02070463          	beqz	a4,b7d4 <__sjis_wctomb+0x74>
    b7b0:	00f58023          	sb	a5,0(a1)
    b7b4:	00c580a3          	sb	a2,1(a1)
    b7b8:	00200513          	li	a0,2
    b7bc:	00008067          	ret
    b7c0:	00c58023          	sb	a2,0(a1)
    b7c4:	00100513          	li	a0,1
    b7c8:	00008067          	ret
    b7cc:	00000513          	li	a0,0
    b7d0:	00008067          	ret
    b7d4:	08a00793          	li	a5,138
    b7d8:	00f52023          	sw	a5,0(a0)
    b7dc:	fff00513          	li	a0,-1
    b7e0:	00008067          	ret

0000b7e4 <__eucjp_wctomb>:
    b7e4:	06058c63          	beqz	a1,b85c <__eucjp_wctomb+0x78>
    b7e8:	00865793          	srli	a5,a2,0x8
    b7ec:	0ff7f793          	zext.b	a5,a5
    b7f0:	06078063          	beqz	a5,b850 <__eucjp_wctomb+0x6c>
    b7f4:	07278713          	addi	a4,a5,114
    b7f8:	0ff77713          	zext.b	a4,a4
    b7fc:	05f78693          	addi	a3,a5,95
    b800:	00273713          	sltiu	a4,a4,2
    b804:	0ff6f693          	zext.b	a3,a3
    b808:	00071663          	bnez	a4,b814 <__eucjp_wctomb+0x30>
    b80c:	05e6b713          	sltiu	a4,a3,94
    b810:	06070263          	beqz	a4,b874 <__eucjp_wctomb+0x90>
    b814:	05f60713          	addi	a4,a2,95
    b818:	0ff77713          	zext.b	a4,a4
    b81c:	05d00813          	li	a6,93
    b820:	04e87263          	bgeu	a6,a4,b864 <__eucjp_wctomb+0x80>
    b824:	04d86863          	bltu	a6,a3,b874 <__eucjp_wctomb+0x90>
    b828:	f8066613          	ori	a2,a2,-128
    b82c:	05f60713          	addi	a4,a2,95
    b830:	0ff77713          	zext.b	a4,a4
    b834:	04e86063          	bltu	a6,a4,b874 <__eucjp_wctomb+0x90>
    b838:	f8f00713          	li	a4,-113
    b83c:	00f580a3          	sb	a5,1(a1)
    b840:	00c58123          	sb	a2,2(a1)
    b844:	00e58023          	sb	a4,0(a1)
    b848:	00300513          	li	a0,3
    b84c:	00008067          	ret
    b850:	00c58023          	sb	a2,0(a1)
    b854:	00100513          	li	a0,1
    b858:	00008067          	ret
    b85c:	00000513          	li	a0,0
    b860:	00008067          	ret
    b864:	00f58023          	sb	a5,0(a1)
    b868:	00c580a3          	sb	a2,1(a1)
    b86c:	00200513          	li	a0,2
    b870:	00008067          	ret
    b874:	08a00793          	li	a5,138
    b878:	00f52023          	sw	a5,0(a0)
    b87c:	fff00513          	li	a0,-1
    b880:	00008067          	ret

0000b884 <__jis_wctomb>:
    b884:	0a058263          	beqz	a1,b928 <__jis_wctomb+0xa4>
    b888:	00865793          	srli	a5,a2,0x8
    b88c:	0ff7f793          	zext.b	a5,a5
    b890:	06078063          	beqz	a5,b8f0 <__jis_wctomb+0x6c>
    b894:	fdf78713          	addi	a4,a5,-33
    b898:	0ff77713          	zext.b	a4,a4
    b89c:	05d00813          	li	a6,93
    b8a0:	08e86863          	bltu	a6,a4,b930 <__jis_wctomb+0xac>
    b8a4:	fdf60713          	addi	a4,a2,-33
    b8a8:	0ff77713          	zext.b	a4,a4
    b8ac:	08e86263          	bltu	a6,a4,b930 <__jis_wctomb+0xac>
    b8b0:	0006a703          	lw	a4,0(a3)
    b8b4:	00200513          	li	a0,2
    b8b8:	02071663          	bnez	a4,b8e4 <__jis_wctomb+0x60>
    b8bc:	00100713          	li	a4,1
    b8c0:	00e6a023          	sw	a4,0(a3)
    b8c4:	01b00513          	li	a0,27
    b8c8:	02400693          	li	a3,36
    b8cc:	04200713          	li	a4,66
    b8d0:	00a58023          	sb	a0,0(a1)
    b8d4:	00d580a3          	sb	a3,1(a1)
    b8d8:	00e58123          	sb	a4,2(a1)
    b8dc:	00500513          	li	a0,5
    b8e0:	00358593          	addi	a1,a1,3
    b8e4:	00f58023          	sb	a5,0(a1)
    b8e8:	00c580a3          	sb	a2,1(a1)
    b8ec:	00008067          	ret
    b8f0:	0006a783          	lw	a5,0(a3)
    b8f4:	00100513          	li	a0,1
    b8f8:	02078463          	beqz	a5,b920 <__jis_wctomb+0x9c>
    b8fc:	0006a023          	sw	zero,0(a3)
    b900:	02800713          	li	a4,40
    b904:	01b00693          	li	a3,27
    b908:	04200793          	li	a5,66
    b90c:	00d58023          	sb	a3,0(a1)
    b910:	00e580a3          	sb	a4,1(a1)
    b914:	00f58123          	sb	a5,2(a1)
    b918:	00400513          	li	a0,4
    b91c:	00358593          	addi	a1,a1,3
    b920:	00c58023          	sb	a2,0(a1)
    b924:	00008067          	ret
    b928:	00100513          	li	a0,1
    b92c:	00008067          	ret
    b930:	08a00793          	li	a5,138
    b934:	00f52023          	sw	a5,0(a0)
    b938:	fff00513          	li	a0,-1
    b93c:	00008067          	ret

0000b940 <_wcrtomb_r>:
    b940:	fd010113          	addi	sp,sp,-48
    b944:	02812423          	sw	s0,40(sp)
    b948:	02112623          	sw	ra,44(sp)
    b94c:	00050413          	mv	s0,a0
    b950:	02068c63          	beqz	a3,b988 <_wcrtomb_r+0x48>
    b954:	00d12623          	sw	a3,12(sp)
    b958:	0fff5797          	auipc	a5,0xfff5
    b95c:	9bc7a783          	lw	a5,-1604(a5) # 10000314 <__global_locale+0xe0>
    b960:	02058e63          	beqz	a1,b99c <_wcrtomb_r+0x5c>
    b964:	00040513          	mv	a0,s0
    b968:	000780e7          	jalr	a5
    b96c:	fff00793          	li	a5,-1
    b970:	00c12683          	lw	a3,12(sp)
    b974:	04f50263          	beq	a0,a5,b9b8 <_wcrtomb_r+0x78>
    b978:	02c12083          	lw	ra,44(sp)
    b97c:	02812403          	lw	s0,40(sp)
    b980:	03010113          	addi	sp,sp,48
    b984:	00008067          	ret
    b988:	10450693          	addi	a3,a0,260
    b98c:	00d12623          	sw	a3,12(sp)
    b990:	0fff5797          	auipc	a5,0xfff5
    b994:	9847a783          	lw	a5,-1660(a5) # 10000314 <__global_locale+0xe0>
    b998:	fc0596e3          	bnez	a1,b964 <_wcrtomb_r+0x24>
    b99c:	00000613          	li	a2,0
    b9a0:	01410593          	addi	a1,sp,20
    b9a4:	00040513          	mv	a0,s0
    b9a8:	000780e7          	jalr	a5
    b9ac:	fff00793          	li	a5,-1
    b9b0:	00c12683          	lw	a3,12(sp)
    b9b4:	fcf512e3          	bne	a0,a5,b978 <_wcrtomb_r+0x38>
    b9b8:	0006a023          	sw	zero,0(a3)
    b9bc:	08a00793          	li	a5,138
    b9c0:	02c12083          	lw	ra,44(sp)
    b9c4:	00f42023          	sw	a5,0(s0)
    b9c8:	02812403          	lw	s0,40(sp)
    b9cc:	03010113          	addi	sp,sp,48
    b9d0:	00008067          	ret

0000b9d4 <wcrtomb>:
    b9d4:	fd010113          	addi	sp,sp,-48
    b9d8:	02812423          	sw	s0,40(sp)
    b9dc:	0fff5417          	auipc	s0,0xfff5
    b9e0:	dec42403          	lw	s0,-532(s0) # 100007c8 <_impure_ptr>
    b9e4:	02112623          	sw	ra,44(sp)
    b9e8:	10440693          	addi	a3,s0,260
    b9ec:	00060463          	beqz	a2,b9f4 <wcrtomb+0x20>
    b9f0:	00060693          	mv	a3,a2
    b9f4:	0fff5797          	auipc	a5,0xfff5
    b9f8:	9207a783          	lw	a5,-1760(a5) # 10000314 <__global_locale+0xe0>
    b9fc:	02050a63          	beqz	a0,ba30 <wcrtomb+0x5c>
    ba00:	00058613          	mv	a2,a1
    ba04:	00050593          	mv	a1,a0
    ba08:	00040513          	mv	a0,s0
    ba0c:	00d12623          	sw	a3,12(sp)
    ba10:	000780e7          	jalr	a5
    ba14:	fff00793          	li	a5,-1
    ba18:	00c12683          	lw	a3,12(sp)
    ba1c:	02f50a63          	beq	a0,a5,ba50 <wcrtomb+0x7c>
    ba20:	02c12083          	lw	ra,44(sp)
    ba24:	02812403          	lw	s0,40(sp)
    ba28:	03010113          	addi	sp,sp,48
    ba2c:	00008067          	ret
    ba30:	00000613          	li	a2,0
    ba34:	01410593          	addi	a1,sp,20
    ba38:	00040513          	mv	a0,s0
    ba3c:	00d12623          	sw	a3,12(sp)
    ba40:	000780e7          	jalr	a5
    ba44:	fff00793          	li	a5,-1
    ba48:	00c12683          	lw	a3,12(sp)
    ba4c:	fcf51ae3          	bne	a0,a5,ba20 <wcrtomb+0x4c>
    ba50:	0006a023          	sw	zero,0(a3)
    ba54:	08a00793          	li	a5,138
    ba58:	02c12083          	lw	ra,44(sp)
    ba5c:	00f42023          	sw	a5,0(s0)
    ba60:	02812403          	lw	s0,40(sp)
    ba64:	03010113          	addi	sp,sp,48
    ba68:	00008067          	ret

0000ba6c <_wcsrtombs_r>:
    ba6c:	00070793          	mv	a5,a4
    ba70:	00068713          	mv	a4,a3
    ba74:	fff00693          	li	a3,-1
    ba78:	4810006f          	j	c6f8 <_wcsnrtombs_r>

0000ba7c <wcsrtombs>:
    ba7c:	00050893          	mv	a7,a0
    ba80:	0fff5517          	auipc	a0,0xfff5
    ba84:	d4852503          	lw	a0,-696(a0) # 100007c8 <_impure_ptr>
    ba88:	00060713          	mv	a4,a2
    ba8c:	00068793          	mv	a5,a3
    ba90:	00058613          	mv	a2,a1
    ba94:	fff00693          	li	a3,-1
    ba98:	00088593          	mv	a1,a7
    ba9c:	45d0006f          	j	c6f8 <_wcsnrtombs_r>

0000baa0 <__set_ctype>:
    baa0:	00007797          	auipc	a5,0x7
    baa4:	7c078793          	addi	a5,a5,1984 # 13260 <_ctype_>
    baa8:	0ef52623          	sw	a5,236(a0)
    baac:	00008067          	ret

0000bab0 <_fclose_r>:
    bab0:	ff010113          	addi	sp,sp,-16
    bab4:	00112623          	sw	ra,12(sp)
    bab8:	01212023          	sw	s2,0(sp)
    babc:	0e058263          	beqz	a1,bba0 <_fclose_r+0xf0>
    bac0:	00812423          	sw	s0,8(sp)
    bac4:	00912223          	sw	s1,4(sp)
    bac8:	00058413          	mv	s0,a1
    bacc:	00050493          	mv	s1,a0
    bad0:	00050663          	beqz	a0,badc <_fclose_r+0x2c>
    bad4:	03452783          	lw	a5,52(a0)
    bad8:	10078063          	beqz	a5,bbd8 <_fclose_r+0x128>
    badc:	06442783          	lw	a5,100(s0)
    bae0:	00c41703          	lh	a4,12(s0)
    bae4:	0017f793          	andi	a5,a5,1
    bae8:	0a079663          	bnez	a5,bb94 <_fclose_r+0xe4>
    baec:	20077713          	andi	a4,a4,512
    baf0:	0e070863          	beqz	a4,bbe0 <_fclose_r+0x130>
    baf4:	00040593          	mv	a1,s0
    baf8:	00048513          	mv	a0,s1
    bafc:	a4cf80ef          	jal	3d48 <__sflush_r>
    bb00:	02c42783          	lw	a5,44(s0)
    bb04:	00050913          	mv	s2,a0
    bb08:	00078a63          	beqz	a5,bb1c <_fclose_r+0x6c>
    bb0c:	01c42583          	lw	a1,28(s0)
    bb10:	00048513          	mv	a0,s1
    bb14:	000780e7          	jalr	a5
    bb18:	0a054063          	bltz	a0,bbb8 <_fclose_r+0x108>
    bb1c:	00c45783          	lhu	a5,12(s0)
    bb20:	0807f793          	andi	a5,a5,128
    bb24:	0a079263          	bnez	a5,bbc8 <_fclose_r+0x118>
    bb28:	03042583          	lw	a1,48(s0)
    bb2c:	00058c63          	beqz	a1,bb44 <_fclose_r+0x94>
    bb30:	04040793          	addi	a5,s0,64
    bb34:	00f58663          	beq	a1,a5,bb40 <_fclose_r+0x90>
    bb38:	00048513          	mv	a0,s1
    bb3c:	f84fc0ef          	jal	82c0 <_free_r>
    bb40:	02042823          	sw	zero,48(s0)
    bb44:	04442583          	lw	a1,68(s0)
    bb48:	00058863          	beqz	a1,bb58 <_fclose_r+0xa8>
    bb4c:	00048513          	mv	a0,s1
    bb50:	f70fc0ef          	jal	82c0 <_free_r>
    bb54:	04042223          	sw	zero,68(s0)
    bb58:	a65f80ef          	jal	45bc <__sfp_lock_acquire>
    bb5c:	06442783          	lw	a5,100(s0)
    bb60:	00041623          	sh	zero,12(s0)
    bb64:	0017f793          	andi	a5,a5,1
    bb68:	0a078463          	beqz	a5,bc10 <_fclose_r+0x160>
    bb6c:	05842503          	lw	a0,88(s0)
    bb70:	ad9f40ef          	jal	648 <__retarget_lock_close_recursive>
    bb74:	a55f80ef          	jal	45c8 <__sfp_lock_release>
    bb78:	00c12083          	lw	ra,12(sp)
    bb7c:	00812403          	lw	s0,8(sp)
    bb80:	00412483          	lw	s1,4(sp)
    bb84:	00090513          	mv	a0,s2
    bb88:	00012903          	lw	s2,0(sp)
    bb8c:	01010113          	addi	sp,sp,16
    bb90:	00008067          	ret
    bb94:	f60710e3          	bnez	a4,baf4 <_fclose_r+0x44>
    bb98:	00812403          	lw	s0,8(sp)
    bb9c:	00412483          	lw	s1,4(sp)
    bba0:	00c12083          	lw	ra,12(sp)
    bba4:	00000913          	li	s2,0
    bba8:	00090513          	mv	a0,s2
    bbac:	00012903          	lw	s2,0(sp)
    bbb0:	01010113          	addi	sp,sp,16
    bbb4:	00008067          	ret
    bbb8:	00c45783          	lhu	a5,12(s0)
    bbbc:	fff00913          	li	s2,-1
    bbc0:	0807f793          	andi	a5,a5,128
    bbc4:	f60782e3          	beqz	a5,bb28 <_fclose_r+0x78>
    bbc8:	01042583          	lw	a1,16(s0)
    bbcc:	00048513          	mv	a0,s1
    bbd0:	ef0fc0ef          	jal	82c0 <_free_r>
    bbd4:	f55ff06f          	j	bb28 <_fclose_r+0x78>
    bbd8:	975f80ef          	jal	454c <__sinit>
    bbdc:	f01ff06f          	j	badc <_fclose_r+0x2c>
    bbe0:	05842503          	lw	a0,88(s0)
    bbe4:	a6df40ef          	jal	650 <__retarget_lock_acquire_recursive>
    bbe8:	00c41783          	lh	a5,12(s0)
    bbec:	f00794e3          	bnez	a5,baf4 <_fclose_r+0x44>
    bbf0:	06442783          	lw	a5,100(s0)
    bbf4:	0017f793          	andi	a5,a5,1
    bbf8:	fa0790e3          	bnez	a5,bb98 <_fclose_r+0xe8>
    bbfc:	05842503          	lw	a0,88(s0)
    bc00:	a69f40ef          	jal	668 <__retarget_lock_release_recursive>
    bc04:	00812403          	lw	s0,8(sp)
    bc08:	00412483          	lw	s1,4(sp)
    bc0c:	f95ff06f          	j	bba0 <_fclose_r+0xf0>
    bc10:	05842503          	lw	a0,88(s0)
    bc14:	a55f40ef          	jal	668 <__retarget_lock_release_recursive>
    bc18:	f55ff06f          	j	bb6c <_fclose_r+0xbc>

0000bc1c <fclose>:
    bc1c:	00050593          	mv	a1,a0
    bc20:	0fff5517          	auipc	a0,0xfff5
    bc24:	ba852503          	lw	a0,-1112(a0) # 100007c8 <_impure_ptr>
    bc28:	e89ff06f          	j	bab0 <_fclose_r>

0000bc2c <__smakebuf_r>:
    bc2c:	00c59783          	lh	a5,12(a1)
    bc30:	0027f713          	andi	a4,a5,2
    bc34:	00070e63          	beqz	a4,bc50 <__smakebuf_r+0x24>
    bc38:	04358793          	addi	a5,a1,67
    bc3c:	00100713          	li	a4,1
    bc40:	00f5a023          	sw	a5,0(a1)
    bc44:	00f5a823          	sw	a5,16(a1)
    bc48:	00e5aa23          	sw	a4,20(a1)
    bc4c:	00008067          	ret
    bc50:	00058713          	mv	a4,a1
    bc54:	00e59583          	lh	a1,14(a1)
    bc58:	f8010113          	addi	sp,sp,-128
    bc5c:	06812c23          	sw	s0,120(sp)
    bc60:	06112e23          	sw	ra,124(sp)
    bc64:	00050413          	mv	s0,a0
    bc68:	0805ce63          	bltz	a1,bd04 <__smakebuf_r+0xd8>
    bc6c:	01810613          	addi	a2,sp,24
    bc70:	00e12423          	sw	a4,8(sp)
    bc74:	5d4000ef          	jal	c248 <_fstat_r>
    bc78:	00812703          	lw	a4,8(sp)
    bc7c:	08054263          	bltz	a0,bd00 <__smakebuf_r+0xd4>
    bc80:	40000593          	li	a1,1024
    bc84:	00040513          	mv	a0,s0
    bc88:	06912a23          	sw	s1,116(sp)
    bc8c:	00e12423          	sw	a4,8(sp)
    bc90:	01c12483          	lw	s1,28(sp)
    bc94:	a75fc0ef          	jal	8708 <_malloc_r>
    bc98:	00812703          	lw	a4,8(sp)
    bc9c:	00c71783          	lh	a5,12(a4) # 10000c <_sidata+0xec814>
    bca0:	0c050263          	beqz	a0,bd64 <__smakebuf_r+0x138>
    bca4:	40000693          	li	a3,1024
    bca8:	0807e793          	ori	a5,a5,128
    bcac:	00d72a23          	sw	a3,20(a4)
    bcb0:	40c4d693          	srai	a3,s1,0xc
    bcb4:	00f71623          	sh	a5,12(a4)
    bcb8:	00a72023          	sw	a0,0(a4)
    bcbc:	00a72823          	sw	a0,16(a4)
    bcc0:	00f6f693          	andi	a3,a3,15
    bcc4:	00200613          	li	a2,2
    bcc8:	0cc69663          	bne	a3,a2,bd94 <__smakebuf_r+0x168>
    bccc:	00e71583          	lh	a1,14(a4)
    bcd0:	00040513          	mv	a0,s0
    bcd4:	00e12423          	sw	a4,8(sp)
    bcd8:	5d0000ef          	jal	c2a8 <_isatty_r>
    bcdc:	00812703          	lw	a4,8(sp)
    bce0:	00c71783          	lh	a5,12(a4)
    bce4:	0a050863          	beqz	a0,bd94 <__smakebuf_r+0x168>
    bce8:	ffc7f793          	andi	a5,a5,-4
    bcec:	000016b7          	lui	a3,0x1
    bcf0:	07412483          	lw	s1,116(sp)
    bcf4:	0017e793          	ori	a5,a5,1
    bcf8:	80068693          	addi	a3,a3,-2048 # 800 <_vfprintf_r+0x108>
    bcfc:	0500006f          	j	bd4c <__smakebuf_r+0x120>
    bd00:	00c71783          	lh	a5,12(a4)
    bd04:	0807f793          	andi	a5,a5,128
    bd08:	0017b793          	seqz	a5,a5
    bd0c:	40f007b3          	neg	a5,a5
    bd10:	3c07f593          	andi	a1,a5,960
    bd14:	04058593          	addi	a1,a1,64
    bd18:	00040513          	mv	a0,s0
    bd1c:	00e12623          	sw	a4,12(sp)
    bd20:	00b12423          	sw	a1,8(sp)
    bd24:	9e5fc0ef          	jal	8708 <_malloc_r>
    bd28:	00c12703          	lw	a4,12(sp)
    bd2c:	00812583          	lw	a1,8(sp)
    bd30:	00c71783          	lh	a5,12(a4)
    bd34:	02050a63          	beqz	a0,bd68 <__smakebuf_r+0x13c>
    bd38:	0807e793          	ori	a5,a5,128
    bd3c:	00a72023          	sw	a0,0(a4)
    bd40:	00a72823          	sw	a0,16(a4)
    bd44:	00b72a23          	sw	a1,20(a4)
    bd48:	00000693          	li	a3,0
    bd4c:	00d7e7b3          	or	a5,a5,a3
    bd50:	00f71623          	sh	a5,12(a4)
    bd54:	07c12083          	lw	ra,124(sp)
    bd58:	07812403          	lw	s0,120(sp)
    bd5c:	08010113          	addi	sp,sp,128
    bd60:	00008067          	ret
    bd64:	07412483          	lw	s1,116(sp)
    bd68:	2007f693          	andi	a3,a5,512
    bd6c:	fe0694e3          	bnez	a3,bd54 <__smakebuf_r+0x128>
    bd70:	ffc7f793          	andi	a5,a5,-4
    bd74:	04370693          	addi	a3,a4,67
    bd78:	0027e793          	ori	a5,a5,2
    bd7c:	00100613          	li	a2,1
    bd80:	00f71623          	sh	a5,12(a4)
    bd84:	00d72023          	sw	a3,0(a4)
    bd88:	00d72823          	sw	a3,16(a4)
    bd8c:	00c72a23          	sw	a2,20(a4)
    bd90:	fc5ff06f          	j	bd54 <__smakebuf_r+0x128>
    bd94:	000016b7          	lui	a3,0x1
    bd98:	07412483          	lw	s1,116(sp)
    bd9c:	80068693          	addi	a3,a3,-2048 # 800 <_vfprintf_r+0x108>
    bda0:	fadff06f          	j	bd4c <__smakebuf_r+0x120>

0000bda4 <__swhatbuf_r>:
    bda4:	00058793          	mv	a5,a1
    bda8:	00e59583          	lh	a1,14(a1)
    bdac:	00060713          	mv	a4,a2
    bdb0:	0805ca63          	bltz	a1,be44 <__swhatbuf_r+0xa0>
    bdb4:	f8010113          	addi	sp,sp,-128
    bdb8:	00c12423          	sw	a2,8(sp)
    bdbc:	01810613          	addi	a2,sp,24
    bdc0:	00d12623          	sw	a3,12(sp)
    bdc4:	00f12223          	sw	a5,4(sp)
    bdc8:	06112e23          	sw	ra,124(sp)
    bdcc:	47c000ef          	jal	c248 <_fstat_r>
    bdd0:	00412783          	lw	a5,4(sp)
    bdd4:	00812703          	lw	a4,8(sp)
    bdd8:	00c12683          	lw	a3,12(sp)
    bddc:	02054e63          	bltz	a0,be18 <__swhatbuf_r+0x74>
    bde0:	01c12783          	lw	a5,28(sp)
    bde4:	0000f5b7          	lui	a1,0xf
    bde8:	ffffe637          	lui	a2,0xffffe
    bdec:	00b7f7b3          	and	a5,a5,a1
    bdf0:	00c787b3          	add	a5,a5,a2
    bdf4:	07c12083          	lw	ra,124(sp)
    bdf8:	0017b793          	seqz	a5,a5
    bdfc:	00f6a023          	sw	a5,0(a3)
    be00:	40000613          	li	a2,1024
    be04:	00001537          	lui	a0,0x1
    be08:	00c72023          	sw	a2,0(a4)
    be0c:	80050513          	addi	a0,a0,-2048 # 800 <_vfprintf_r+0x108>
    be10:	08010113          	addi	sp,sp,128
    be14:	00008067          	ret
    be18:	00c7d783          	lhu	a5,12(a5)
    be1c:	0807f793          	andi	a5,a5,128
    be20:	04078263          	beqz	a5,be64 <__swhatbuf_r+0xc0>
    be24:	07c12083          	lw	ra,124(sp)
    be28:	00000793          	li	a5,0
    be2c:	00f6a023          	sw	a5,0(a3)
    be30:	04000613          	li	a2,64
    be34:	00c72023          	sw	a2,0(a4)
    be38:	00000513          	li	a0,0
    be3c:	08010113          	addi	sp,sp,128
    be40:	00008067          	ret
    be44:	00c7d783          	lhu	a5,12(a5)
    be48:	0807f793          	andi	a5,a5,128
    be4c:	02079a63          	bnez	a5,be80 <__swhatbuf_r+0xdc>
    be50:	40000613          	li	a2,1024
    be54:	00f6a023          	sw	a5,0(a3)
    be58:	00000513          	li	a0,0
    be5c:	00c72023          	sw	a2,0(a4)
    be60:	00008067          	ret
    be64:	07c12083          	lw	ra,124(sp)
    be68:	00f6a023          	sw	a5,0(a3)
    be6c:	40000613          	li	a2,1024
    be70:	00c72023          	sw	a2,0(a4)
    be74:	00000513          	li	a0,0
    be78:	08010113          	addi	sp,sp,128
    be7c:	00008067          	ret
    be80:	00000793          	li	a5,0
    be84:	04000613          	li	a2,64
    be88:	00f6a023          	sw	a5,0(a3)
    be8c:	00000513          	li	a0,0
    be90:	00c72023          	sw	a2,0(a4)
    be94:	00008067          	ret

0000be98 <strcasecmp>:
    be98:	00050693          	mv	a3,a0
    be9c:	00007817          	auipc	a6,0x7
    bea0:	3c580813          	addi	a6,a6,965 # 13261 <_ctype_+0x1>
    bea4:	00100613          	li	a2,1
    bea8:	0140006f          	j	bebc <strcasecmp+0x24>
    beac:	04a79863          	bne	a5,a0,befc <strcasecmp+0x64>
    beb0:	04050463          	beqz	a0,bef8 <strcasecmp+0x60>
    beb4:	00168693          	addi	a3,a3,1
    beb8:	00158593          	addi	a1,a1,1 # f001 <__umoddi3+0x2a5>
    bebc:	0006c783          	lbu	a5,0(a3)
    bec0:	00f80733          	add	a4,a6,a5
    bec4:	00074703          	lbu	a4,0(a4)
    bec8:	00377713          	andi	a4,a4,3
    becc:	00c71463          	bne	a4,a2,bed4 <strcasecmp+0x3c>
    bed0:	02078793          	addi	a5,a5,32
    bed4:	0005c503          	lbu	a0,0(a1)
    bed8:	00a80733          	add	a4,a6,a0
    bedc:	00074703          	lbu	a4,0(a4)
    bee0:	40a788b3          	sub	a7,a5,a0
    bee4:	00377713          	andi	a4,a4,3
    bee8:	fcc712e3          	bne	a4,a2,beac <strcasecmp+0x14>
    beec:	02050713          	addi	a4,a0,32
    bef0:	40e78533          	sub	a0,a5,a4
    bef4:	fce780e3          	beq	a5,a4,beb4 <strcasecmp+0x1c>
    bef8:	00008067          	ret
    befc:	00088513          	mv	a0,a7
    bf00:	00008067          	ret

0000bf04 <strcat>:
    bf04:	ff010113          	addi	sp,sp,-16
    bf08:	00812423          	sw	s0,8(sp)
    bf0c:	00112623          	sw	ra,12(sp)
    bf10:	00357793          	andi	a5,a0,3
    bf14:	00050413          	mv	s0,a0
    bf18:	06079663          	bnez	a5,bf84 <strcat+0x80>
    bf1c:	00052703          	lw	a4,0(a0)
    bf20:	feff0637          	lui	a2,0xfeff0
    bf24:	eff60613          	addi	a2,a2,-257 # fefefeff <_stack_top+0xeefebeff>
    bf28:	00c707b3          	add	a5,a4,a2
    bf2c:	808086b7          	lui	a3,0x80808
    bf30:	fff74713          	not	a4,a4
    bf34:	00e7f7b3          	and	a5,a5,a4
    bf38:	08068693          	addi	a3,a3,128 # 80808080 <_stack_top+0x70804080>
    bf3c:	00d7f7b3          	and	a5,a5,a3
    bf40:	04079263          	bnez	a5,bf84 <strcat+0x80>
    bf44:	00452703          	lw	a4,4(a0)
    bf48:	00450513          	addi	a0,a0,4
    bf4c:	00c707b3          	add	a5,a4,a2
    bf50:	fff74713          	not	a4,a4
    bf54:	00e7f7b3          	and	a5,a5,a4
    bf58:	00d7f7b3          	and	a5,a5,a3
    bf5c:	02079463          	bnez	a5,bf84 <strcat+0x80>
    bf60:	00452703          	lw	a4,4(a0)
    bf64:	00450513          	addi	a0,a0,4
    bf68:	00c707b3          	add	a5,a4,a2
    bf6c:	fff74713          	not	a4,a4
    bf70:	00e7f7b3          	and	a5,a5,a4
    bf74:	00d7f7b3          	and	a5,a5,a3
    bf78:	fc0786e3          	beqz	a5,bf44 <strcat+0x40>
    bf7c:	0080006f          	j	bf84 <strcat+0x80>
    bf80:	00150513          	addi	a0,a0,1
    bf84:	00054783          	lbu	a5,0(a0)
    bf88:	fe079ce3          	bnez	a5,bf80 <strcat+0x7c>
    bf8c:	b80fa0ef          	jal	630c <strcpy>
    bf90:	00c12083          	lw	ra,12(sp)
    bf94:	00040513          	mv	a0,s0
    bf98:	00812403          	lw	s0,8(sp)
    bf9c:	01010113          	addi	sp,sp,16
    bfa0:	00008067          	ret

0000bfa4 <strchr>:
    bfa4:	0ff5f693          	zext.b	a3,a1
    bfa8:	00357793          	andi	a5,a0,3
    bfac:	0c068063          	beqz	a3,c06c <strchr+0xc8>
    bfb0:	00078e63          	beqz	a5,bfcc <strchr+0x28>
    bfb4:	00054783          	lbu	a5,0(a0)
    bfb8:	0a078663          	beqz	a5,c064 <strchr+0xc0>
    bfbc:	0ad78663          	beq	a5,a3,c068 <strchr+0xc4>
    bfc0:	00150513          	addi	a0,a0,1
    bfc4:	00357793          	andi	a5,a0,3
    bfc8:	fe0796e3          	bnez	a5,bfb4 <strchr+0x10>
    bfcc:	0ff5f593          	zext.b	a1,a1
    bfd0:	00859893          	slli	a7,a1,0x8
    bfd4:	00052703          	lw	a4,0(a0)
    bfd8:	00b888b3          	add	a7,a7,a1
    bfdc:	01089793          	slli	a5,a7,0x10
    bfe0:	00f888b3          	add	a7,a7,a5
    bfe4:	feff0837          	lui	a6,0xfeff0
    bfe8:	00e8c7b3          	xor	a5,a7,a4
    bfec:	eff80813          	addi	a6,a6,-257 # fefefeff <_stack_top+0xeefebeff>
    bff0:	010785b3          	add	a1,a5,a6
    bff4:	fff7c613          	not	a2,a5
    bff8:	010707b3          	add	a5,a4,a6
    bffc:	fff74713          	not	a4,a4
    c000:	00c5f633          	and	a2,a1,a2
    c004:	00e7f7b3          	and	a5,a5,a4
    c008:	80808337          	lui	t1,0x80808
    c00c:	00c7e7b3          	or	a5,a5,a2
    c010:	08030313          	addi	t1,t1,128 # 80808080 <_stack_top+0x70804080>
    c014:	0067f7b3          	and	a5,a5,t1
    c018:	04079263          	bnez	a5,c05c <strchr+0xb8>
    c01c:	00452703          	lw	a4,4(a0)
    c020:	00450513          	addi	a0,a0,4
    c024:	011747b3          	xor	a5,a4,a7
    c028:	fff7c593          	not	a1,a5
    c02c:	01078633          	add	a2,a5,a6
    c030:	010707b3          	add	a5,a4,a6
    c034:	fff74713          	not	a4,a4
    c038:	00c5f633          	and	a2,a1,a2
    c03c:	00e7f7b3          	and	a5,a5,a4
    c040:	00c7e7b3          	or	a5,a5,a2
    c044:	0067f7b3          	and	a5,a5,t1
    c048:	fc078ae3          	beqz	a5,c01c <strchr+0x78>
    c04c:	00054783          	lbu	a5,0(a0)
    c050:	00078a63          	beqz	a5,c064 <strchr+0xc0>
    c054:	08f68663          	beq	a3,a5,c0e0 <strchr+0x13c>
    c058:	00150513          	addi	a0,a0,1
    c05c:	00054783          	lbu	a5,0(a0)
    c060:	fe079ae3          	bnez	a5,c054 <strchr+0xb0>
    c064:	00000513          	li	a0,0
    c068:	00008067          	ret
    c06c:	00078c63          	beqz	a5,c084 <strchr+0xe0>
    c070:	00054783          	lbu	a5,0(a0)
    c074:	fe078ae3          	beqz	a5,c068 <strchr+0xc4>
    c078:	00150513          	addi	a0,a0,1
    c07c:	00357793          	andi	a5,a0,3
    c080:	fe0798e3          	bnez	a5,c070 <strchr+0xcc>
    c084:	00052703          	lw	a4,0(a0)
    c088:	feff0637          	lui	a2,0xfeff0
    c08c:	eff60613          	addi	a2,a2,-257 # fefefeff <_stack_top+0xeefebeff>
    c090:	00c707b3          	add	a5,a4,a2
    c094:	808086b7          	lui	a3,0x80808
    c098:	fff74713          	not	a4,a4
    c09c:	00e7f7b3          	and	a5,a5,a4
    c0a0:	08068693          	addi	a3,a3,128 # 80808080 <_stack_top+0x70804080>
    c0a4:	00d7f7b3          	and	a5,a5,a3
    c0a8:	02079063          	bnez	a5,c0c8 <strchr+0x124>
    c0ac:	00452703          	lw	a4,4(a0)
    c0b0:	00450513          	addi	a0,a0,4
    c0b4:	00c707b3          	add	a5,a4,a2
    c0b8:	fff74713          	not	a4,a4
    c0bc:	00e7f7b3          	and	a5,a5,a4
    c0c0:	00d7f7b3          	and	a5,a5,a3
    c0c4:	fe0784e3          	beqz	a5,c0ac <strchr+0x108>
    c0c8:	00054783          	lbu	a5,0(a0)
    c0cc:	f8078ee3          	beqz	a5,c068 <strchr+0xc4>
    c0d0:	00154783          	lbu	a5,1(a0)
    c0d4:	00150513          	addi	a0,a0,1
    c0d8:	fe079ce3          	bnez	a5,c0d0 <strchr+0x12c>
    c0dc:	00008067          	ret
    c0e0:	00008067          	ret

0000c0e4 <strlcpy>:
    c0e4:	00058793          	mv	a5,a1
    c0e8:	00061e63          	bnez	a2,c104 <strlcpy+0x20>
    c0ec:	0240006f          	j	c110 <strlcpy+0x2c>
    c0f0:	0007c703          	lbu	a4,0(a5)
    c0f4:	00178793          	addi	a5,a5,1
    c0f8:	00150513          	addi	a0,a0,1
    c0fc:	fee50fa3          	sb	a4,-1(a0)
    c100:	00070e63          	beqz	a4,c11c <strlcpy+0x38>
    c104:	fff60613          	addi	a2,a2,-1
    c108:	fe0614e3          	bnez	a2,c0f0 <strlcpy+0xc>
    c10c:	00050023          	sb	zero,0(a0)
    c110:	0007c703          	lbu	a4,0(a5)
    c114:	00178793          	addi	a5,a5,1
    c118:	fe071ce3          	bnez	a4,c110 <strlcpy+0x2c>
    c11c:	40b78533          	sub	a0,a5,a1
    c120:	fff50513          	addi	a0,a0,-1
    c124:	00008067          	ret

0000c128 <strncasecmp>:
    c128:	00050713          	mv	a4,a0
    c12c:	04060c63          	beqz	a2,c184 <strncasecmp+0x5c>
    c130:	00c50633          	add	a2,a0,a2
    c134:	00007897          	auipc	a7,0x7
    c138:	12d88893          	addi	a7,a7,301 # 13261 <_ctype_+0x1>
    c13c:	00100813          	li	a6,1
    c140:	00074783          	lbu	a5,0(a4)
    c144:	00170713          	addi	a4,a4,1
    c148:	00f886b3          	add	a3,a7,a5
    c14c:	0006c683          	lbu	a3,0(a3)
    c150:	0036f693          	andi	a3,a3,3
    c154:	01069463          	bne	a3,a6,c15c <strncasecmp+0x34>
    c158:	02078793          	addi	a5,a5,32
    c15c:	0005c503          	lbu	a0,0(a1)
    c160:	00158593          	addi	a1,a1,1
    c164:	00a886b3          	add	a3,a7,a0
    c168:	0006c683          	lbu	a3,0(a3)
    c16c:	40a78333          	sub	t1,a5,a0
    c170:	0036f693          	andi	a3,a3,3
    c174:	03068063          	beq	a3,a6,c194 <strncasecmp+0x6c>
    c178:	00a79a63          	bne	a5,a0,c18c <strncasecmp+0x64>
    c17c:	00050a63          	beqz	a0,c190 <strncasecmp+0x68>
    c180:	fcc710e3          	bne	a4,a2,c140 <strncasecmp+0x18>
    c184:	00000513          	li	a0,0
    c188:	00008067          	ret
    c18c:	00030513          	mv	a0,t1
    c190:	00008067          	ret
    c194:	02050693          	addi	a3,a0,32
    c198:	40d78533          	sub	a0,a5,a3
    c19c:	fed782e3          	beq	a5,a3,c180 <strncasecmp+0x58>
    c1a0:	00008067          	ret

0000c1a4 <strncmp>:
    c1a4:	08060a63          	beqz	a2,c238 <strncmp+0x94>
    c1a8:	00b567b3          	or	a5,a0,a1
    c1ac:	0037f793          	andi	a5,a5,3
    c1b0:	04079a63          	bnez	a5,c204 <strncmp+0x60>
    c1b4:	feff0337          	lui	t1,0xfeff0
    c1b8:	808088b7          	lui	a7,0x80808
    c1bc:	00300e13          	li	t3,3
    c1c0:	eff30313          	addi	t1,t1,-257 # fefefeff <_stack_top+0xeefebeff>
    c1c4:	08088893          	addi	a7,a7,128 # 80808080 <_stack_top+0x70804080>
    c1c8:	02ce6063          	bltu	t3,a2,c1e8 <strncmp+0x44>
    c1cc:	0380006f          	j	c204 <strncmp+0x60>
    c1d0:	ffc60613          	addi	a2,a2,-4
    c1d4:	06060263          	beqz	a2,c238 <strncmp+0x94>
    c1d8:	06079063          	bnez	a5,c238 <strncmp+0x94>
    c1dc:	00450513          	addi	a0,a0,4
    c1e0:	00458593          	addi	a1,a1,4
    c1e4:	02ce7063          	bgeu	t3,a2,c204 <strncmp+0x60>
    c1e8:	00052703          	lw	a4,0(a0)
    c1ec:	0005a683          	lw	a3,0(a1)
    c1f0:	006707b3          	add	a5,a4,t1
    c1f4:	fff74813          	not	a6,a4
    c1f8:	0107f7b3          	and	a5,a5,a6
    c1fc:	0117f7b3          	and	a5,a5,a7
    c200:	fcd708e3          	beq	a4,a3,c1d0 <strncmp+0x2c>
    c204:	00054783          	lbu	a5,0(a0)
    c208:	0005c703          	lbu	a4,0(a1)
    c20c:	fff60613          	addi	a2,a2,-1
    c210:	00c50633          	add	a2,a0,a2
    c214:	00e78e63          	beq	a5,a4,c230 <strncmp+0x8c>
    c218:	0280006f          	j	c240 <strncmp+0x9c>
    c21c:	00150513          	addi	a0,a0,1
    c220:	00078c63          	beqz	a5,c238 <strncmp+0x94>
    c224:	00054783          	lbu	a5,0(a0)
    c228:	0005c703          	lbu	a4,0(a1)
    c22c:	00e79a63          	bne	a5,a4,c240 <strncmp+0x9c>
    c230:	00158593          	addi	a1,a1,1
    c234:	fec514e3          	bne	a0,a2,c21c <strncmp+0x78>
    c238:	00000513          	li	a0,0
    c23c:	00008067          	ret
    c240:	40e78533          	sub	a0,a5,a4
    c244:	00008067          	ret

0000c248 <_fstat_r>:
    c248:	00058793          	mv	a5,a1
    c24c:	ff010113          	addi	sp,sp,-16
    c250:	00812423          	sw	s0,8(sp)
    c254:	00060593          	mv	a1,a2
    c258:	00050413          	mv	s0,a0
    c25c:	00078513          	mv	a0,a5
    c260:	00112623          	sw	ra,12(sp)
    c264:	0fff5797          	auipc	a5,0xfff5
    c268:	8c07a223          	sw	zero,-1852(a5) # 10000b28 <errno>
    c26c:	84cf40ef          	jal	2b8 <_fstat>
    c270:	fff00793          	li	a5,-1
    c274:	00f50a63          	beq	a0,a5,c288 <_fstat_r+0x40>
    c278:	00c12083          	lw	ra,12(sp)
    c27c:	00812403          	lw	s0,8(sp)
    c280:	01010113          	addi	sp,sp,16
    c284:	00008067          	ret
    c288:	0fff5797          	auipc	a5,0xfff5
    c28c:	8a07a783          	lw	a5,-1888(a5) # 10000b28 <errno>
    c290:	fe0784e3          	beqz	a5,c278 <_fstat_r+0x30>
    c294:	00c12083          	lw	ra,12(sp)
    c298:	00f42023          	sw	a5,0(s0)
    c29c:	00812403          	lw	s0,8(sp)
    c2a0:	01010113          	addi	sp,sp,16
    c2a4:	00008067          	ret

0000c2a8 <_isatty_r>:
    c2a8:	ff010113          	addi	sp,sp,-16
    c2ac:	00812423          	sw	s0,8(sp)
    c2b0:	00050413          	mv	s0,a0
    c2b4:	00058513          	mv	a0,a1
    c2b8:	0fff5797          	auipc	a5,0xfff5
    c2bc:	8607a823          	sw	zero,-1936(a5) # 10000b28 <errno>
    c2c0:	00112623          	sw	ra,12(sp)
    c2c4:	830f40ef          	jal	2f4 <_isatty>
    c2c8:	fff00793          	li	a5,-1
    c2cc:	00f50a63          	beq	a0,a5,c2e0 <_isatty_r+0x38>
    c2d0:	00c12083          	lw	ra,12(sp)
    c2d4:	00812403          	lw	s0,8(sp)
    c2d8:	01010113          	addi	sp,sp,16
    c2dc:	00008067          	ret
    c2e0:	0fff5797          	auipc	a5,0xfff5
    c2e4:	8487a783          	lw	a5,-1976(a5) # 10000b28 <errno>
    c2e8:	fe0784e3          	beqz	a5,c2d0 <_isatty_r+0x28>
    c2ec:	00c12083          	lw	ra,12(sp)
    c2f0:	00f42023          	sw	a5,0(s0)
    c2f4:	00812403          	lw	s0,8(sp)
    c2f8:	01010113          	addi	sp,sp,16
    c2fc:	00008067          	ret

0000c300 <_sbrk_r>:
    c300:	ff010113          	addi	sp,sp,-16
    c304:	00812423          	sw	s0,8(sp)
    c308:	00050413          	mv	s0,a0
    c30c:	00058513          	mv	a0,a1
    c310:	0fff5797          	auipc	a5,0xfff5
    c314:	8007ac23          	sw	zero,-2024(a5) # 10000b28 <errno>
    c318:	00112623          	sw	ra,12(sp)
    c31c:	f05f30ef          	jal	220 <_sbrk>
    c320:	fff00793          	li	a5,-1
    c324:	00f50a63          	beq	a0,a5,c338 <_sbrk_r+0x38>
    c328:	00c12083          	lw	ra,12(sp)
    c32c:	00812403          	lw	s0,8(sp)
    c330:	01010113          	addi	sp,sp,16
    c334:	00008067          	ret
    c338:	0fff4797          	auipc	a5,0xfff4
    c33c:	7f07a783          	lw	a5,2032(a5) # 10000b28 <errno>
    c340:	fe0784e3          	beqz	a5,c328 <_sbrk_r+0x28>
    c344:	00c12083          	lw	ra,12(sp)
    c348:	00f42023          	sw	a5,0(s0)
    c34c:	00812403          	lw	s0,8(sp)
    c350:	01010113          	addi	sp,sp,16
    c354:	00008067          	ret

0000c358 <__errno>:
    c358:	0fff4517          	auipc	a0,0xfff4
    c35c:	47052503          	lw	a0,1136(a0) # 100007c8 <_impure_ptr>
    c360:	00008067          	ret

0000c364 <__assert_func>:
    c364:	0fff4797          	auipc	a5,0xfff4
    c368:	4647a783          	lw	a5,1124(a5) # 100007c8 <_impure_ptr>
    c36c:	ff010113          	addi	sp,sp,-16
    c370:	00060813          	mv	a6,a2
    c374:	00112623          	sw	ra,12(sp)
    c378:	00050893          	mv	a7,a0
    c37c:	00058713          	mv	a4,a1
    c380:	00c7a503          	lw	a0,12(a5)
    c384:	00068613          	mv	a2,a3
    c388:	00007797          	auipc	a5,0x7
    c38c:	82478793          	addi	a5,a5,-2012 # 12bac <__clzsi2+0x3e4>
    c390:	00080c63          	beqz	a6,c3a8 <__assert_func+0x44>
    c394:	00088693          	mv	a3,a7
    c398:	00007597          	auipc	a1,0x7
    c39c:	82458593          	addi	a1,a1,-2012 # 12bbc <__clzsi2+0x3f4>
    c3a0:	3d0000ef          	jal	c770 <fiprintf>
    c3a4:	59d010ef          	jal	e140 <abort>
    c3a8:	00007797          	auipc	a5,0x7
    c3ac:	81078793          	addi	a5,a5,-2032 # 12bb8 <__clzsi2+0x3f0>
    c3b0:	00078813          	mv	a6,a5
    c3b4:	fe1ff06f          	j	c394 <__assert_func+0x30>

0000c3b8 <__assert>:
    c3b8:	ff010113          	addi	sp,sp,-16
    c3bc:	00060693          	mv	a3,a2
    c3c0:	00000613          	li	a2,0
    c3c4:	00112623          	sw	ra,12(sp)
    c3c8:	f9dff0ef          	jal	c364 <__assert_func>

0000c3cc <_calloc_r>:
    c3cc:	fe010113          	addi	sp,sp,-32
    c3d0:	00812c23          	sw	s0,24(sp)
    c3d4:	00112e23          	sw	ra,28(sp)
    c3d8:	0105d713          	srli	a4,a1,0x10
    c3dc:	00058793          	mv	a5,a1
    c3e0:	00050413          	mv	s0,a0
    c3e4:	01065693          	srli	a3,a2,0x10
    c3e8:	0c071463          	bnez	a4,c4b0 <_calloc_r+0xe4>
    c3ec:	14069263          	bnez	a3,c530 <_calloc_r+0x164>
    c3f0:	01079513          	slli	a0,a5,0x10
    c3f4:	01061593          	slli	a1,a2,0x10
    c3f8:	0105d593          	srli	a1,a1,0x10
    c3fc:	01055513          	srli	a0,a0,0x10
    c400:	2f0060ef          	jal	126f0 <__mulsi3>
    c404:	00050593          	mv	a1,a0
    c408:	00040513          	mv	a0,s0
    c40c:	afcfc0ef          	jal	8708 <_malloc_r>
    c410:	00050793          	mv	a5,a0
    c414:	10050263          	beqz	a0,c518 <_calloc_r+0x14c>
    c418:	ffc52603          	lw	a2,-4(a0)
    c41c:	02400693          	li	a3,36
    c420:	ffc67613          	andi	a2,a2,-4
    c424:	ffc60613          	addi	a2,a2,-4
    c428:	04c6e863          	bltu	a3,a2,c478 <_calloc_r+0xac>
    c42c:	01300593          	li	a1,19
    c430:	00050713          	mv	a4,a0
    c434:	02c5f263          	bgeu	a1,a2,c458 <_calloc_r+0x8c>
    c438:	00052023          	sw	zero,0(a0)
    c43c:	00052223          	sw	zero,4(a0)
    c440:	01b00713          	li	a4,27
    c444:	04c77c63          	bgeu	a4,a2,c49c <_calloc_r+0xd0>
    c448:	00052423          	sw	zero,8(a0)
    c44c:	00052623          	sw	zero,12(a0)
    c450:	01050713          	addi	a4,a0,16
    c454:	0ed60463          	beq	a2,a3,c53c <_calloc_r+0x170>
    c458:	00072023          	sw	zero,0(a4)
    c45c:	00072223          	sw	zero,4(a4)
    c460:	00072423          	sw	zero,8(a4)
    c464:	01c12083          	lw	ra,28(sp)
    c468:	01812403          	lw	s0,24(sp)
    c46c:	00078513          	mv	a0,a5
    c470:	02010113          	addi	sp,sp,32
    c474:	00008067          	ret
    c478:	00000593          	li	a1,0
    c47c:	00a12423          	sw	a0,8(sp)
    c480:	c89f90ef          	jal	6108 <memset>
    c484:	00812783          	lw	a5,8(sp)
    c488:	01c12083          	lw	ra,28(sp)
    c48c:	01812403          	lw	s0,24(sp)
    c490:	00078513          	mv	a0,a5
    c494:	02010113          	addi	sp,sp,32
    c498:	00008067          	ret
    c49c:	00850713          	addi	a4,a0,8
    c4a0:	00072023          	sw	zero,0(a4)
    c4a4:	00072223          	sw	zero,4(a4)
    c4a8:	00072423          	sw	zero,8(a4)
    c4ac:	fb9ff06f          	j	c464 <_calloc_r+0x98>
    c4b0:	08069e63          	bnez	a3,c54c <_calloc_r+0x180>
    c4b4:	00060693          	mv	a3,a2
    c4b8:	01079513          	slli	a0,a5,0x10
    c4bc:	01061593          	slli	a1,a2,0x10
    c4c0:	0105d593          	srli	a1,a1,0x10
    c4c4:	01055513          	srli	a0,a0,0x10
    c4c8:	00e11623          	sh	a4,12(sp)
    c4cc:	00d11723          	sh	a3,14(sp)
    c4d0:	220060ef          	jal	126f0 <__mulsi3>
    c4d4:	00a12423          	sw	a0,8(sp)
    c4d8:	00c15583          	lhu	a1,12(sp)
    c4dc:	00e15503          	lhu	a0,14(sp)
    c4e0:	210060ef          	jal	126f0 <__mulsi3>
    c4e4:	00812783          	lw	a5,8(sp)
    c4e8:	0107d713          	srli	a4,a5,0x10
    c4ec:	00e50533          	add	a0,a0,a4
    c4f0:	01055713          	srli	a4,a0,0x10
    c4f4:	04071c63          	bnez	a4,c54c <_calloc_r+0x180>
    c4f8:	01079793          	slli	a5,a5,0x10
    c4fc:	0107d793          	srli	a5,a5,0x10
    c500:	01051593          	slli	a1,a0,0x10
    c504:	00f5e5b3          	or	a1,a1,a5
    c508:	00040513          	mv	a0,s0
    c50c:	9fcfc0ef          	jal	8708 <_malloc_r>
    c510:	00050793          	mv	a5,a0
    c514:	f00512e3          	bnez	a0,c418 <_calloc_r+0x4c>
    c518:	00000793          	li	a5,0
    c51c:	01c12083          	lw	ra,28(sp)
    c520:	01812403          	lw	s0,24(sp)
    c524:	00078513          	mv	a0,a5
    c528:	02010113          	addi	sp,sp,32
    c52c:	00008067          	ret
    c530:	00068713          	mv	a4,a3
    c534:	00058693          	mv	a3,a1
    c538:	f81ff06f          	j	c4b8 <_calloc_r+0xec>
    c53c:	00052823          	sw	zero,16(a0)
    c540:	00052a23          	sw	zero,20(a0)
    c544:	01850713          	addi	a4,a0,24
    c548:	f11ff06f          	j	c458 <_calloc_r+0x8c>
    c54c:	e0dff0ef          	jal	c358 <__errno>
    c550:	00c00793          	li	a5,12
    c554:	00f52023          	sw	a5,0(a0)
    c558:	00000793          	li	a5,0
    c55c:	fc1ff06f          	j	c51c <_calloc_r+0x150>

0000c560 <__env_lock>:
    c560:	0fff4517          	auipc	a0,0xfff4
    c564:	5ac50513          	addi	a0,a0,1452 # 10000b0c <__lock___env_recursive_mutex>
    c568:	8e8f406f          	j	650 <__retarget_lock_acquire_recursive>

0000c56c <__env_unlock>:
    c56c:	0fff4517          	auipc	a0,0xfff4
    c570:	5a050513          	addi	a0,a0,1440 # 10000b0c <__lock___env_recursive_mutex>
    c574:	8f4f406f          	j	668 <__retarget_lock_release_recursive>

0000c578 <_wcsnrtombs_l>:
    c578:	fa010113          	addi	sp,sp,-96
    c57c:	05212823          	sw	s2,80(sp)
    c580:	05312623          	sw	s3,76(sp)
    c584:	05412423          	sw	s4,72(sp)
    c588:	05612023          	sw	s6,64(sp)
    c58c:	03712e23          	sw	s7,60(sp)
    c590:	03b12623          	sw	s11,44(sp)
    c594:	04112e23          	sw	ra,92(sp)
    c598:	04812c23          	sw	s0,88(sp)
    c59c:	04912a23          	sw	s1,84(sp)
    c5a0:	05512223          	sw	s5,68(sp)
    c5a4:	03812c23          	sw	s8,56(sp)
    c5a8:	03912a23          	sw	s9,52(sp)
    c5ac:	03a12823          	sw	s10,48(sp)
    c5b0:	00a12623          	sw	a0,12(sp)
    c5b4:	00068b93          	mv	s7,a3
    c5b8:	00070d93          	mv	s11,a4
    c5bc:	00058993          	mv	s3,a1
    c5c0:	00060b13          	mv	s6,a2
    c5c4:	00080a13          	mv	s4,a6
    c5c8:	10c50913          	addi	s2,a0,268
    c5cc:	00078463          	beqz	a5,c5d4 <_wcsnrtombs_l+0x5c>
    c5d0:	00078913          	mv	s2,a5
    c5d4:	0e098c63          	beqz	s3,c6cc <_wcsnrtombs_l+0x154>
    c5d8:	00000c13          	li	s8,0
    c5dc:	000b2483          	lw	s1,0(s6)
    c5e0:	00098413          	mv	s0,s3
    c5e4:	fff00a93          	li	s5,-1
    c5e8:	05bc7863          	bgeu	s8,s11,c638 <_wcsnrtombs_l+0xc0>
    c5ec:	040b8663          	beqz	s7,c638 <_wcsnrtombs_l+0xc0>
    c5f0:	0e0a2783          	lw	a5,224(s4)
    c5f4:	0004a603          	lw	a2,0(s1)
    c5f8:	00c12503          	lw	a0,12(sp)
    c5fc:	00090693          	mv	a3,s2
    c600:	01410593          	addi	a1,sp,20
    c604:	00092d03          	lw	s10,0(s2)
    c608:	00492c83          	lw	s9,4(s2)
    c60c:	000780e7          	jalr	a5
    c610:	0d550263          	beq	a0,s5,c6d4 <_wcsnrtombs_l+0x15c>
    c614:	018507b3          	add	a5,a0,s8
    c618:	0cfdea63          	bltu	s11,a5,c6ec <_wcsnrtombs_l+0x174>
    c61c:	fffb8b93          	addi	s7,s7,-1 # 7ffffff <_sidata+0x7fec807>
    c620:	04099c63          	bnez	s3,c678 <_wcsnrtombs_l+0x100>
    c624:	0004a703          	lw	a4,0(s1)
    c628:	00448493          	addi	s1,s1,4
    c62c:	08070663          	beqz	a4,c6b8 <_wcsnrtombs_l+0x140>
    c630:	00078c13          	mv	s8,a5
    c634:	fbbc6ce3          	bltu	s8,s11,c5ec <_wcsnrtombs_l+0x74>
    c638:	05c12083          	lw	ra,92(sp)
    c63c:	05812403          	lw	s0,88(sp)
    c640:	05412483          	lw	s1,84(sp)
    c644:	05012903          	lw	s2,80(sp)
    c648:	04c12983          	lw	s3,76(sp)
    c64c:	04812a03          	lw	s4,72(sp)
    c650:	04412a83          	lw	s5,68(sp)
    c654:	04012b03          	lw	s6,64(sp)
    c658:	03c12b83          	lw	s7,60(sp)
    c65c:	03412c83          	lw	s9,52(sp)
    c660:	03012d03          	lw	s10,48(sp)
    c664:	02c12d83          	lw	s11,44(sp)
    c668:	000c0513          	mv	a0,s8
    c66c:	03812c03          	lw	s8,56(sp)
    c670:	06010113          	addi	sp,sp,96
    c674:	00008067          	ret
    c678:	02a05463          	blez	a0,c6a0 <_wcsnrtombs_l+0x128>
    c67c:	00a40533          	add	a0,s0,a0
    c680:	00040613          	mv	a2,s0
    c684:	01410593          	addi	a1,sp,20
    c688:	0005c883          	lbu	a7,0(a1)
    c68c:	00160613          	addi	a2,a2,1
    c690:	00158593          	addi	a1,a1,1
    c694:	ff160fa3          	sb	a7,-1(a2)
    c698:	fea618e3          	bne	a2,a0,c688 <_wcsnrtombs_l+0x110>
    c69c:	00060413          	mv	s0,a2
    c6a0:	000b2703          	lw	a4,0(s6)
    c6a4:	00448493          	addi	s1,s1,4
    c6a8:	00470713          	addi	a4,a4,4
    c6ac:	00eb2023          	sw	a4,0(s6)
    c6b0:	ffc4a703          	lw	a4,-4(s1)
    c6b4:	f6071ee3          	bnez	a4,c630 <_wcsnrtombs_l+0xb8>
    c6b8:	00098463          	beqz	s3,c6c0 <_wcsnrtombs_l+0x148>
    c6bc:	000b2023          	sw	zero,0(s6)
    c6c0:	00092023          	sw	zero,0(s2)
    c6c4:	fff78c13          	addi	s8,a5,-1
    c6c8:	f71ff06f          	j	c638 <_wcsnrtombs_l+0xc0>
    c6cc:	fff00d93          	li	s11,-1
    c6d0:	f09ff06f          	j	c5d8 <_wcsnrtombs_l+0x60>
    c6d4:	00c12703          	lw	a4,12(sp)
    c6d8:	08a00793          	li	a5,138
    c6dc:	000a8c13          	mv	s8,s5
    c6e0:	00f72023          	sw	a5,0(a4)
    c6e4:	00092023          	sw	zero,0(s2)
    c6e8:	f51ff06f          	j	c638 <_wcsnrtombs_l+0xc0>
    c6ec:	01a92023          	sw	s10,0(s2)
    c6f0:	01992223          	sw	s9,4(s2)
    c6f4:	f45ff06f          	j	c638 <_wcsnrtombs_l+0xc0>

0000c6f8 <_wcsnrtombs_r>:
    c6f8:	0fff4517          	auipc	a0,0xfff4
    c6fc:	0d052503          	lw	a0,208(a0) # 100007c8 <_impure_ptr>
    c700:	0fff4817          	auipc	a6,0xfff4
    c704:	b3480813          	addi	a6,a6,-1228 # 10000234 <__global_locale>
    c708:	e71ff06f          	j	c578 <_wcsnrtombs_l>

0000c70c <wcsnrtombs>:
    c70c:	00050e13          	mv	t3,a0
    c710:	0fff4517          	auipc	a0,0xfff4
    c714:	0b852503          	lw	a0,184(a0) # 100007c8 <_impure_ptr>
    c718:	00070793          	mv	a5,a4
    c71c:	0fff4817          	auipc	a6,0xfff4
    c720:	b1880813          	addi	a6,a6,-1256 # 10000234 <__global_locale>
    c724:	00068713          	mv	a4,a3
    c728:	00060693          	mv	a3,a2
    c72c:	00058613          	mv	a2,a1
    c730:	000e0593          	mv	a1,t3
    c734:	e45ff06f          	j	c578 <_wcsnrtombs_l>

0000c738 <_fiprintf_r>:
    c738:	fc010113          	addi	sp,sp,-64
    c73c:	02c10313          	addi	t1,sp,44
    c740:	02d12623          	sw	a3,44(sp)
    c744:	00030693          	mv	a3,t1
    c748:	00112e23          	sw	ra,28(sp)
    c74c:	02e12823          	sw	a4,48(sp)
    c750:	02f12a23          	sw	a5,52(sp)
    c754:	03012c23          	sw	a6,56(sp)
    c758:	03112e23          	sw	a7,60(sp)
    c75c:	00612623          	sw	t1,12(sp)
    c760:	064000ef          	jal	c7c4 <_vfiprintf_r>
    c764:	01c12083          	lw	ra,28(sp)
    c768:	04010113          	addi	sp,sp,64
    c76c:	00008067          	ret

0000c770 <fiprintf>:
    c770:	fc010113          	addi	sp,sp,-64
    c774:	00050e93          	mv	t4,a0
    c778:	0fff4517          	auipc	a0,0xfff4
    c77c:	05052503          	lw	a0,80(a0) # 100007c8 <_impure_ptr>
    c780:	02810313          	addi	t1,sp,40
    c784:	00058e13          	mv	t3,a1
    c788:	02c12423          	sw	a2,40(sp)
    c78c:	02d12623          	sw	a3,44(sp)
    c790:	000e8593          	mv	a1,t4
    c794:	000e0613          	mv	a2,t3
    c798:	00030693          	mv	a3,t1
    c79c:	00112e23          	sw	ra,28(sp)
    c7a0:	02e12823          	sw	a4,48(sp)
    c7a4:	02f12a23          	sw	a5,52(sp)
    c7a8:	03012c23          	sw	a6,56(sp)
    c7ac:	03112e23          	sw	a7,60(sp)
    c7b0:	00612623          	sw	t1,12(sp)
    c7b4:	010000ef          	jal	c7c4 <_vfiprintf_r>
    c7b8:	01c12083          	lw	ra,28(sp)
    c7bc:	04010113          	addi	sp,sp,64
    c7c0:	00008067          	ret

0000c7c4 <_vfiprintf_r>:
    c7c4:	eb010113          	addi	sp,sp,-336
    c7c8:	14812423          	sw	s0,328(sp)
    c7cc:	13412c23          	sw	s4,312(sp)
    c7d0:	13612823          	sw	s6,304(sp)
    c7d4:	00050413          	mv	s0,a0
    c7d8:	00058a13          	mv	s4,a1
    c7dc:	00060b13          	mv	s6,a2
    c7e0:	05010513          	addi	a0,sp,80
    c7e4:	00800613          	li	a2,8
    c7e8:	00000593          	li	a1,0
    c7ec:	13a12023          	sw	s10,288(sp)
    c7f0:	14112623          	sw	ra,332(sp)
    c7f4:	00068d13          	mv	s10,a3
    c7f8:	911f90ef          	jal	6108 <memset>
    c7fc:	00040863          	beqz	s0,c80c <_vfiprintf_r+0x48>
    c800:	03442783          	lw	a5,52(s0)
    c804:	00079463          	bnez	a5,c80c <_vfiprintf_r+0x48>
    c808:	4f80106f          	j	dd00 <_vfiprintf_r+0x153c>
    c80c:	064a2703          	lw	a4,100(s4)
    c810:	00ca1783          	lh	a5,12(s4)
    c814:	00177693          	andi	a3,a4,1
    c818:	3c068863          	beqz	a3,cbe8 <_vfiprintf_r+0x424>
    c81c:	01279693          	slli	a3,a5,0x12
    c820:	7806c8e3          	bltz	a3,d7b0 <_vfiprintf_r+0xfec>
    c824:	ffffe6b7          	lui	a3,0xffffe
    c828:	fff68693          	addi	a3,a3,-1 # ffffdfff <_stack_top+0xefff9fff>
    c82c:	00002637          	lui	a2,0x2
    c830:	00d77733          	and	a4,a4,a3
    c834:	00c7e7b3          	or	a5,a5,a2
    c838:	06ea2223          	sw	a4,100(s4)
    c83c:	00fa1623          	sh	a5,12(s4)
    c840:	01271793          	slli	a5,a4,0x12
    c844:	0007d463          	bgez	a5,c84c <_vfiprintf_r+0x88>
    c848:	7900106f          	j	dfd8 <_vfiprintf_r+0x1814>
    c84c:	00ca1783          	lh	a5,12(s4)
    c850:	0087f713          	andi	a4,a5,8
    c854:	26070263          	beqz	a4,cab8 <_vfiprintf_r+0x2f4>
    c858:	010a2703          	lw	a4,16(s4)
    c85c:	24070e63          	beqz	a4,cab8 <_vfiprintf_r+0x2f4>
    c860:	01a7f713          	andi	a4,a5,26
    c864:	00a00693          	li	a3,10
    c868:	26d70a63          	beq	a4,a3,cadc <_vfiprintf_r+0x318>
    c86c:	13512a23          	sw	s5,308(sp)
    c870:	06c10a93          	addi	s5,sp,108
    c874:	14912223          	sw	s1,324(sp)
    c878:	15212023          	sw	s2,320(sp)
    c87c:	13312e23          	sw	s3,316(sp)
    c880:	13712623          	sw	s7,300(sp)
    c884:	11b12e23          	sw	s11,284(sp)
    c888:	01412623          	sw	s4,12(sp)
    c88c:	13812423          	sw	s8,296(sp)
    c890:	13912223          	sw	s9,292(sp)
    c894:	06012423          	sw	zero,104(sp)
    c898:	06012223          	sw	zero,100(sp)
    c89c:	07512023          	sw	s5,96(sp)
    c8a0:	000a8d93          	mv	s11,s5
    c8a4:	00012c23          	sw	zero,24(sp)
    c8a8:	02012423          	sw	zero,40(sp)
    c8ac:	02012623          	sw	zero,44(sp)
    c8b0:	00012823          	sw	zero,16(sp)
    c8b4:	0fff4497          	auipc	s1,0xfff4
    c8b8:	98048493          	addi	s1,s1,-1664 # 10000234 <__global_locale>
    c8bc:	02500993          	li	s3,37
    c8c0:	00007b97          	auipc	s7,0x7
    c8c4:	aa4b8b93          	addi	s7,s7,-1372 # 13364 <_ctype_+0x104>
    c8c8:	01000913          	li	s2,16
    c8cc:	000b0a13          	mv	s4,s6
    c8d0:	000a0c93          	mv	s9,s4
    c8d4:	0e44ab03          	lw	s6,228(s1)
    c8d8:	c58f90ef          	jal	5d30 <__locale_mb_cur_max>
    c8dc:	00050693          	mv	a3,a0
    c8e0:	05010713          	addi	a4,sp,80
    c8e4:	000c8613          	mv	a2,s9
    c8e8:	04810593          	addi	a1,sp,72
    c8ec:	00040513          	mv	a0,s0
    c8f0:	000b00e7          	jalr	s6
    c8f4:	26050863          	beqz	a0,cb64 <_vfiprintf_r+0x3a0>
    c8f8:	24054863          	bltz	a0,cb48 <_vfiprintf_r+0x384>
    c8fc:	04812783          	lw	a5,72(sp)
    c900:	01378663          	beq	a5,s3,c90c <_vfiprintf_r+0x148>
    c904:	00ac8cb3          	add	s9,s9,a0
    c908:	fcdff06f          	j	c8d4 <_vfiprintf_r+0x110>
    c90c:	00050c13          	mv	s8,a0
    c910:	414c8b33          	sub	s6,s9,s4
    c914:	254c9e63          	bne	s9,s4,cb70 <_vfiprintf_r+0x3ac>
    c918:	001cc603          	lbu	a2,1(s9)
    c91c:	001c8a13          	addi	s4,s9,1
    c920:	040101a3          	sb	zero,67(sp)
    c924:	fff00693          	li	a3,-1
    c928:	05a00c13          	li	s8,90
    c92c:	00000b13          	li	s6,0
    c930:	00000c93          	li	s9,0
    c934:	001a0a13          	addi	s4,s4,1
    c938:	fe060793          	addi	a5,a2,-32 # 1fe0 <_vfprintf_r+0x18e8>
    c93c:	04fc6663          	bltu	s8,a5,c988 <_vfiprintf_r+0x1c4>
    c940:	00279793          	slli	a5,a5,0x2
    c944:	017787b3          	add	a5,a5,s7
    c948:	0007a783          	lw	a5,0(a5)
    c94c:	017787b3          	add	a5,a5,s7
    c950:	00078067          	jr	a5
    c954:	fd060793          	addi	a5,a2,-48
    c958:	00000b13          	li	s6,0
    c95c:	00900593          	li	a1,9
    c960:	002b1713          	slli	a4,s6,0x2
    c964:	000a4603          	lbu	a2,0(s4)
    c968:	016708b3          	add	a7,a4,s6
    c96c:	00189893          	slli	a7,a7,0x1
    c970:	01178b33          	add	s6,a5,a7
    c974:	fd060793          	addi	a5,a2,-48
    c978:	001a0a13          	addi	s4,s4,1
    c97c:	fef5f2e3          	bgeu	a1,a5,c960 <_vfiprintf_r+0x19c>
    c980:	fe060793          	addi	a5,a2,-32
    c984:	fafc7ee3          	bgeu	s8,a5,c940 <_vfiprintf_r+0x17c>
    c988:	000b0893          	mv	a7,s6
    c98c:	000c8313          	mv	t1,s9
    c990:	20060e63          	beqz	a2,cbac <_vfiprintf_r+0x3e8>
    c994:	00100e93          	li	t4,1
    c998:	0ac10623          	sb	a2,172(sp)
    c99c:	040101a3          	sb	zero,67(sp)
    c9a0:	000e8c93          	mv	s9,t4
    c9a4:	00012a23          	sw	zero,20(sp)
    c9a8:	00000693          	li	a3,0
    c9ac:	0ac10e13          	addi	t3,sp,172
    c9b0:	06812503          	lw	a0,104(sp)
    c9b4:	06412583          	lw	a1,100(sp)
    c9b8:	08437f93          	andi	t6,t1,132
    c9bc:	00050613          	mv	a2,a0
    c9c0:	00058713          	mv	a4,a1
    c9c4:	060f9c63          	bnez	t6,ca3c <_vfiprintf_r+0x278>
    c9c8:	41988b33          	sub	s6,a7,s9
    c9cc:	4b6042e3          	bgtz	s6,d670 <_vfiprintf_r+0xeac>
    c9d0:	04314583          	lbu	a1,67(sp)
    c9d4:	06058863          	beqz	a1,ca44 <_vfiprintf_r+0x280>
    c9d8:	00000f93          	li	t6,0
    c9dc:	00000f13          	li	t5,0
    c9e0:	04310593          	addi	a1,sp,67
    c9e4:	00160613          	addi	a2,a2,1
    c9e8:	00170713          	addi	a4,a4,1
    c9ec:	00100793          	li	a5,1
    c9f0:	00bda023          	sw	a1,0(s11) # 80000000 <_stack_top+0x6fffc000>
    c9f4:	00fda223          	sw	a5,4(s11)
    c9f8:	06c12423          	sw	a2,104(sp)
    c9fc:	06e12223          	sw	a4,100(sp)
    ca00:	00700593          	li	a1,7
    ca04:	008d8d93          	addi	s11,s11,8
    ca08:	20e5ca63          	blt	a1,a4,cc1c <_vfiprintf_r+0x458>
    ca0c:	020f0863          	beqz	t5,ca3c <_vfiprintf_r+0x278>
    ca10:	04410593          	addi	a1,sp,68
    ca14:	00bda023          	sw	a1,0(s11)
    ca18:	00260613          	addi	a2,a2,2
    ca1c:	00200593          	li	a1,2
    ca20:	00170713          	addi	a4,a4,1
    ca24:	00bda223          	sw	a1,4(s11)
    ca28:	06c12423          	sw	a2,104(sp)
    ca2c:	06e12223          	sw	a4,100(sp)
    ca30:	00700593          	li	a1,7
    ca34:	008d8d93          	addi	s11,s11,8
    ca38:	38e5c6e3          	blt	a1,a4,d5c4 <_vfiprintf_r+0xe00>
    ca3c:	08000593          	li	a1,128
    ca40:	06bf88e3          	beq	t6,a1,d2b0 <_vfiprintf_r+0xaec>
    ca44:	41d68b33          	sub	s6,a3,t4
    ca48:	1b6042e3          	bgtz	s6,d3ec <_vfiprintf_r+0xc28>
    ca4c:	00ce8633          	add	a2,t4,a2
    ca50:	00170713          	addi	a4,a4,1
    ca54:	06c12423          	sw	a2,104(sp)
    ca58:	06e12223          	sw	a4,100(sp)
    ca5c:	01cda023          	sw	t3,0(s11)
    ca60:	01dda223          	sw	t4,4(s11)
    ca64:	00700693          	li	a3,7
    ca68:	008d8793          	addi	a5,s11,8
    ca6c:	28e6cee3          	blt	a3,a4,d508 <_vfiprintf_r+0xd44>
    ca70:	00437313          	andi	t1,t1,4
    ca74:	00030663          	beqz	t1,ca80 <_vfiprintf_r+0x2bc>
    ca78:	41988b33          	sub	s6,a7,s9
    ca7c:	1f604e63          	bgtz	s6,cc78 <_vfiprintf_r+0x4b4>
    ca80:	0198d463          	bge	a7,s9,ca88 <_vfiprintf_r+0x2c4>
    ca84:	000c8893          	mv	a7,s9
    ca88:	01012783          	lw	a5,16(sp)
    ca8c:	011787b3          	add	a5,a5,a7
    ca90:	00f12823          	sw	a5,16(sp)
    ca94:	2a0612e3          	bnez	a2,d538 <_vfiprintf_r+0xd74>
    ca98:	01412783          	lw	a5,20(sp)
    ca9c:	06012223          	sw	zero,100(sp)
    caa0:	00078863          	beqz	a5,cab0 <_vfiprintf_r+0x2ec>
    caa4:	01412583          	lw	a1,20(sp)
    caa8:	00040513          	mv	a0,s0
    caac:	815fb0ef          	jal	82c0 <_free_r>
    cab0:	000a8d93          	mv	s11,s5
    cab4:	e1dff06f          	j	c8d0 <_vfiprintf_r+0x10c>
    cab8:	000a0593          	mv	a1,s4
    cabc:	00040513          	mv	a0,s0
    cac0:	a4cf80ef          	jal	4d0c <__swsetup_r>
    cac4:	00050463          	beqz	a0,cacc <_vfiprintf_r+0x308>
    cac8:	52c0106f          	j	dff4 <_vfiprintf_r+0x1830>
    cacc:	00ca1783          	lh	a5,12(s4)
    cad0:	00a00693          	li	a3,10
    cad4:	01a7f713          	andi	a4,a5,26
    cad8:	d8d71ae3          	bne	a4,a3,c86c <_vfiprintf_r+0xa8>
    cadc:	00ea1703          	lh	a4,14(s4)
    cae0:	d80746e3          	bltz	a4,c86c <_vfiprintf_r+0xa8>
    cae4:	064a2703          	lw	a4,100(s4)
    cae8:	00177713          	andi	a4,a4,1
    caec:	00071863          	bnez	a4,cafc <_vfiprintf_r+0x338>
    caf0:	2007f793          	andi	a5,a5,512
    caf4:	00079463          	bnez	a5,cafc <_vfiprintf_r+0x338>
    caf8:	3ac0106f          	j	dea4 <_vfiprintf_r+0x16e0>
    cafc:	000d0693          	mv	a3,s10
    cb00:	000b0613          	mv	a2,s6
    cb04:	000a0593          	mv	a1,s4
    cb08:	00040513          	mv	a0,s0
    cb0c:	550010ef          	jal	e05c <__sbprintf>
    cb10:	14c12083          	lw	ra,332(sp)
    cb14:	14812403          	lw	s0,328(sp)
    cb18:	00a12823          	sw	a0,16(sp)
    cb1c:	01012503          	lw	a0,16(sp)
    cb20:	13812a03          	lw	s4,312(sp)
    cb24:	13012b03          	lw	s6,304(sp)
    cb28:	12012d03          	lw	s10,288(sp)
    cb2c:	15010113          	addi	sp,sp,336
    cb30:	00008067          	ret
    cb34:	000a4603          	lbu	a2,0(s4)
    cb38:	dfdff06f          	j	c934 <_vfiprintf_r+0x170>
    cb3c:	000a4603          	lbu	a2,0(s4)
    cb40:	020cec93          	ori	s9,s9,32
    cb44:	df1ff06f          	j	c934 <_vfiprintf_r+0x170>
    cb48:	00800613          	li	a2,8
    cb4c:	00000593          	li	a1,0
    cb50:	05010513          	addi	a0,sp,80
    cb54:	db4f90ef          	jal	6108 <memset>
    cb58:	00100513          	li	a0,1
    cb5c:	00ac8cb3          	add	s9,s9,a0
    cb60:	d75ff06f          	j	c8d4 <_vfiprintf_r+0x110>
    cb64:	00050c13          	mv	s8,a0
    cb68:	414c8b33          	sub	s6,s9,s4
    cb6c:	054c8063          	beq	s9,s4,cbac <_vfiprintf_r+0x3e8>
    cb70:	06812683          	lw	a3,104(sp)
    cb74:	06412703          	lw	a4,100(sp)
    cb78:	014da023          	sw	s4,0(s11)
    cb7c:	016686b3          	add	a3,a3,s6
    cb80:	00170713          	addi	a4,a4,1
    cb84:	016da223          	sw	s6,4(s11)
    cb88:	06d12423          	sw	a3,104(sp)
    cb8c:	06e12223          	sw	a4,100(sp)
    cb90:	00700693          	li	a3,7
    cb94:	008d8d93          	addi	s11,s11,8
    cb98:	02e6c863          	blt	a3,a4,cbc8 <_vfiprintf_r+0x404>
    cb9c:	01012783          	lw	a5,16(sp)
    cba0:	016787b3          	add	a5,a5,s6
    cba4:	00f12823          	sw	a5,16(sp)
    cba8:	d60c18e3          	bnez	s8,c918 <_vfiprintf_r+0x154>
    cbac:	06812783          	lw	a5,104(sp)
    cbb0:	00c12a03          	lw	s4,12(sp)
    cbb4:	00078463          	beqz	a5,cbbc <_vfiprintf_r+0x3f8>
    cbb8:	3980106f          	j	df50 <_vfiprintf_r+0x178c>
    cbbc:	00ca1783          	lh	a5,12(s4)
    cbc0:	06012223          	sw	zero,100(sp)
    cbc4:	1a50006f          	j	d568 <_vfiprintf_r+0xda4>
    cbc8:	00c12583          	lw	a1,12(sp)
    cbcc:	06010613          	addi	a2,sp,96
    cbd0:	00040513          	mv	a0,s0
    cbd4:	938f70ef          	jal	3d0c <__sprint_r>
    cbd8:	00050463          	beqz	a0,cbe0 <_vfiprintf_r+0x41c>
    cbdc:	3ec0106f          	j	dfc8 <_vfiprintf_r+0x1804>
    cbe0:	000a8d93          	mv	s11,s5
    cbe4:	fb9ff06f          	j	cb9c <_vfiprintf_r+0x3d8>
    cbe8:	2007f693          	andi	a3,a5,512
    cbec:	30068863          	beqz	a3,cefc <_vfiprintf_r+0x738>
    cbf0:	01279693          	slli	a3,a5,0x12
    cbf4:	c206d8e3          	bgez	a3,c824 <_vfiprintf_r+0x60>
    cbf8:	01271693          	slli	a3,a4,0x12
    cbfc:	c406dae3          	bgez	a3,c850 <_vfiprintf_r+0x8c>
    cc00:	00ca5783          	lhu	a5,12(s4)
    cc04:	2007f793          	andi	a5,a5,512
    cc08:	00078463          	beqz	a5,cc10 <_vfiprintf_r+0x44c>
    cc0c:	3800106f          	j	df8c <_vfiprintf_r+0x17c8>
    cc10:	058a2503          	lw	a0,88(s4)
    cc14:	a55f30ef          	jal	668 <__retarget_lock_release_recursive>
    cc18:	3740106f          	j	df8c <_vfiprintf_r+0x17c8>
    cc1c:	00c12583          	lw	a1,12(sp)
    cc20:	06010613          	addi	a2,sp,96
    cc24:	00040513          	mv	a0,s0
    cc28:	03d12e23          	sw	t4,60(sp)
    cc2c:	02d12c23          	sw	a3,56(sp)
    cc30:	02612a23          	sw	t1,52(sp)
    cc34:	03c12823          	sw	t3,48(sp)
    cc38:	03f12223          	sw	t6,36(sp)
    cc3c:	03e12023          	sw	t5,32(sp)
    cc40:	01112e23          	sw	a7,28(sp)
    cc44:	8c8f70ef          	jal	3d0c <__sprint_r>
    cc48:	100512e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    cc4c:	06812603          	lw	a2,104(sp)
    cc50:	06412703          	lw	a4,100(sp)
    cc54:	03c12e83          	lw	t4,60(sp)
    cc58:	03812683          	lw	a3,56(sp)
    cc5c:	03412303          	lw	t1,52(sp)
    cc60:	03012e03          	lw	t3,48(sp)
    cc64:	02412f83          	lw	t6,36(sp)
    cc68:	02012f03          	lw	t5,32(sp)
    cc6c:	01c12883          	lw	a7,28(sp)
    cc70:	000a8d93          	mv	s11,s5
    cc74:	d99ff06f          	j	ca0c <_vfiprintf_r+0x248>
    cc78:	01000693          	li	a3,16
    cc7c:	06412703          	lw	a4,100(sp)
    cc80:	00007f97          	auipc	t6,0x7
    cc84:	860f8f93          	addi	t6,t6,-1952 # 134e0 <blanks.1>
    cc88:	0966d263          	bge	a3,s6,cd0c <_vfiprintf_r+0x548>
    cc8c:	000b0c13          	mv	s8,s6
    cc90:	00700d93          	li	s11,7
    cc94:	000a0b13          	mv	s6,s4
    cc98:	01112e23          	sw	a7,28(sp)
    cc9c:	00007a17          	auipc	s4,0x7
    cca0:	844a0a13          	addi	s4,s4,-1980 # 134e0 <blanks.1>
    cca4:	00c0006f          	j	ccb0 <_vfiprintf_r+0x4ec>
    cca8:	ff0c0c13          	addi	s8,s8,-16
    ccac:	0586d863          	bge	a3,s8,ccfc <_vfiprintf_r+0x538>
    ccb0:	01060613          	addi	a2,a2,16
    ccb4:	00170713          	addi	a4,a4,1
    ccb8:	0147a023          	sw	s4,0(a5)
    ccbc:	00d7a223          	sw	a3,4(a5)
    ccc0:	06c12423          	sw	a2,104(sp)
    ccc4:	06e12223          	sw	a4,100(sp)
    ccc8:	00878793          	addi	a5,a5,8
    cccc:	fceddee3          	bge	s11,a4,cca8 <_vfiprintf_r+0x4e4>
    ccd0:	00c12583          	lw	a1,12(sp)
    ccd4:	06010613          	addi	a2,sp,96
    ccd8:	00040513          	mv	a0,s0
    ccdc:	830f70ef          	jal	3d0c <__sprint_r>
    cce0:	060516e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    cce4:	01000693          	li	a3,16
    cce8:	ff0c0c13          	addi	s8,s8,-16
    ccec:	06812603          	lw	a2,104(sp)
    ccf0:	06412703          	lw	a4,100(sp)
    ccf4:	000a8793          	mv	a5,s5
    ccf8:	fb86cce3          	blt	a3,s8,ccb0 <_vfiprintf_r+0x4ec>
    ccfc:	01c12883          	lw	a7,28(sp)
    cd00:	000a0f93          	mv	t6,s4
    cd04:	000b0a13          	mv	s4,s6
    cd08:	000c0b13          	mv	s6,s8
    cd0c:	01660633          	add	a2,a2,s6
    cd10:	00170713          	addi	a4,a4,1
    cd14:	01f7a023          	sw	t6,0(a5)
    cd18:	0167a223          	sw	s6,4(a5)
    cd1c:	06c12423          	sw	a2,104(sp)
    cd20:	06e12223          	sw	a4,100(sp)
    cd24:	00700793          	li	a5,7
    cd28:	d4e7dce3          	bge	a5,a4,ca80 <_vfiprintf_r+0x2bc>
    cd2c:	00c12583          	lw	a1,12(sp)
    cd30:	06010613          	addi	a2,sp,96
    cd34:	00040513          	mv	a0,s0
    cd38:	01112e23          	sw	a7,28(sp)
    cd3c:	fd1f60ef          	jal	3d0c <__sprint_r>
    cd40:	000516e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    cd44:	06812603          	lw	a2,104(sp)
    cd48:	01c12883          	lw	a7,28(sp)
    cd4c:	d35ff06f          	j	ca80 <_vfiprintf_r+0x2bc>
    cd50:	020cf713          	andi	a4,s9,32
    cd54:	000b0893          	mv	a7,s6
    cd58:	000c8313          	mv	t1,s9
    cd5c:	1c071863          	bnez	a4,cf2c <_vfiprintf_r+0x768>
    cd60:	010cf593          	andi	a1,s9,16
    cd64:	000d2703          	lw	a4,0(s10)
    cd68:	004d0613          	addi	a2,s10,4
    cd6c:	24059ce3          	bnez	a1,d7c4 <_vfiprintf_r+0x1000>
    cd70:	040cf593          	andi	a1,s9,64
    cd74:	00059463          	bnez	a1,cd7c <_vfiprintf_r+0x5b8>
    cd78:	7e10006f          	j	dd58 <_vfiprintf_r+0x1594>
    cd7c:	01071713          	slli	a4,a4,0x10
    cd80:	41075713          	srai	a4,a4,0x10
    cd84:	41f75b13          	srai	s6,a4,0x1f
    cd88:	00060d13          	mv	s10,a2
    cd8c:	000b0613          	mv	a2,s6
    cd90:	1a064c63          	bltz	a2,cf48 <_vfiprintf_r+0x784>
    cd94:	1c06ca63          	bltz	a3,cf68 <_vfiprintf_r+0x7a4>
    cd98:	f7f37313          	andi	t1,t1,-129
    cd9c:	1c069663          	bnez	a3,cf68 <_vfiprintf_r+0x7a4>
    cda0:	01676633          	or	a2,a4,s6
    cda4:	1c061263          	bnez	a2,cf68 <_vfiprintf_r+0x7a4>
    cda8:	04314703          	lbu	a4,67(sp)
    cdac:	00012a23          	sw	zero,20(sp)
    cdb0:	00000e93          	li	t4,0
    cdb4:	00000693          	li	a3,0
    cdb8:	11010e13          	addi	t3,sp,272
    cdbc:	30070e63          	beqz	a4,d0d8 <_vfiprintf_r+0x914>
    cdc0:	00100c93          	li	s9,1
    cdc4:	06812603          	lw	a2,104(sp)
    cdc8:	06412703          	lw	a4,100(sp)
    cdcc:	08437f93          	andi	t6,t1,132
    cdd0:	00060513          	mv	a0,a2
    cdd4:	00070593          	mv	a1,a4
    cdd8:	be0f88e3          	beqz	t6,c9c8 <_vfiprintf_r+0x204>
    cddc:	00000f13          	li	t5,0
    cde0:	c01ff06f          	j	c9e0 <_vfiprintf_r+0x21c>
    cde4:	000d2783          	lw	a5,0(s10)
    cde8:	040101a3          	sb	zero,67(sp)
    cdec:	000b0893          	mv	a7,s6
    cdf0:	00f12a23          	sw	a5,20(sp)
    cdf4:	000c8313          	mv	t1,s9
    cdf8:	004d0d13          	addi	s10,s10,4
    cdfc:	720782e3          	beqz	a5,dd20 <_vfiprintf_r+0x155c>
    ce00:	05300713          	li	a4,83
    ce04:	3ce606e3          	beq	a2,a4,d9d0 <_vfiprintf_r+0x120c>
    ce08:	010cf713          	andi	a4,s9,16
    ce0c:	3c0712e3          	bnez	a4,d9d0 <_vfiprintf_r+0x120c>
    ce10:	0006d463          	bgez	a3,ce18 <_vfiprintf_r+0x654>
    ce14:	0140106f          	j	de28 <_vfiprintf_r+0x1664>
    ce18:	01412503          	lw	a0,20(sp)
    ce1c:	00068613          	mv	a2,a3
    ce20:	00000593          	li	a1,0
    ce24:	00d12e23          	sw	a3,28(sp)
    ce28:	03912223          	sw	s9,36(sp)
    ce2c:	03612023          	sw	s6,32(sp)
    ce30:	844f80ef          	jal	4e74 <memchr>
    ce34:	04314703          	lbu	a4,67(sp)
    ce38:	01c12683          	lw	a3,28(sp)
    ce3c:	02012883          	lw	a7,32(sp)
    ce40:	02412303          	lw	t1,36(sp)
    ce44:	00051463          	bnez	a0,ce4c <_vfiprintf_r+0x688>
    ce48:	1640106f          	j	dfac <_vfiprintf_r+0x17e8>
    ce4c:	01412783          	lw	a5,20(sp)
    ce50:	40f50eb3          	sub	t4,a0,a5
    ce54:	fffecc93          	not	s9,t4
    ce58:	41fcdc93          	srai	s9,s9,0x1f
    ce5c:	019efcb3          	and	s9,t4,s9
    ce60:	00071463          	bnez	a4,ce68 <_vfiprintf_r+0x6a4>
    ce64:	0dc0106f          	j	df40 <_vfiprintf_r+0x177c>
    ce68:	00078e13          	mv	t3,a5
    ce6c:	001c8c93          	addi	s9,s9,1
    ce70:	00000693          	li	a3,0
    ce74:	00012a23          	sw	zero,20(sp)
    ce78:	f4dff06f          	j	cdc4 <_vfiprintf_r+0x600>
    ce7c:	04300713          	li	a4,67
    ce80:	000b0893          	mv	a7,s6
    ce84:	000c8313          	mv	t1,s9
    ce88:	00e60663          	beq	a2,a4,ce94 <_vfiprintf_r+0x6d0>
    ce8c:	010cf713          	andi	a4,s9,16
    ce90:	260700e3          	beqz	a4,d8f0 <_vfiprintf_r+0x112c>
    ce94:	00800613          	li	a2,8
    ce98:	00000593          	li	a1,0
    ce9c:	05810513          	addi	a0,sp,88
    cea0:	00612e23          	sw	t1,28(sp)
    cea4:	01112a23          	sw	a7,20(sp)
    cea8:	a60f90ef          	jal	6108 <memset>
    ceac:	000d2603          	lw	a2,0(s10)
    ceb0:	0ac10b13          	addi	s6,sp,172
    ceb4:	05810693          	addi	a3,sp,88
    ceb8:	000b0593          	mv	a1,s6
    cebc:	00040513          	mv	a0,s0
    cec0:	a81fe0ef          	jal	b940 <_wcrtomb_r>
    cec4:	fff00713          	li	a4,-1
    cec8:	01412883          	lw	a7,20(sp)
    cecc:	01c12303          	lw	t1,28(sp)
    ced0:	00050e93          	mv	t4,a0
    ced4:	5ee50ce3          	beq	a0,a4,dccc <_vfiprintf_r+0x1508>
    ced8:	fff54c93          	not	s9,a0
    cedc:	41fcdc93          	srai	s9,s9,0x1f
    cee0:	01957cb3          	and	s9,a0,s9
    cee4:	004d0d13          	addi	s10,s10,4
    cee8:	040101a3          	sb	zero,67(sp)
    ceec:	000b0e13          	mv	t3,s6
    cef0:	00012a23          	sw	zero,20(sp)
    cef4:	00000693          	li	a3,0
    cef8:	ab9ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    cefc:	058a2503          	lw	a0,88(s4)
    cf00:	f50f30ef          	jal	650 <__retarget_lock_acquire_recursive>
    cf04:	00ca1783          	lh	a5,12(s4)
    cf08:	064a2703          	lw	a4,100(s4)
    cf0c:	01279693          	slli	a3,a5,0x12
    cf10:	9206c8e3          	bltz	a3,c840 <_vfiprintf_r+0x7c>
    cf14:	911ff06f          	j	c824 <_vfiprintf_r+0x60>
    cf18:	020cf713          	andi	a4,s9,32
    cf1c:	000b0893          	mv	a7,s6
    cf20:	010ce313          	ori	t1,s9,16
    cf24:	004d0613          	addi	a2,s10,4
    cf28:	08070ee3          	beqz	a4,d7c4 <_vfiprintf_r+0x1000>
    cf2c:	007d0713          	addi	a4,s10,7
    cf30:	ff877713          	andi	a4,a4,-8
    cf34:	00472603          	lw	a2,4(a4)
    cf38:	00870d13          	addi	s10,a4,8
    cf3c:	00072703          	lw	a4,0(a4)
    cf40:	00060b13          	mv	s6,a2
    cf44:	e40658e3          	bgez	a2,cd94 <_vfiprintf_r+0x5d0>
    cf48:	00e03633          	snez	a2,a4
    cf4c:	41600eb3          	neg	t4,s6
    cf50:	40ce8b33          	sub	s6,t4,a2
    cf54:	02d00613          	li	a2,45
    cf58:	04c101a3          	sb	a2,67(sp)
    cf5c:	40e00733          	neg	a4,a4
    cf60:	0006c463          	bltz	a3,cf68 <_vfiprintf_r+0x7a4>
    cf64:	f7f37313          	andi	t1,t1,-129
    cf68:	3a0b12e3          	bnez	s6,db0c <_vfiprintf_r+0x1348>
    cf6c:	00900613          	li	a2,9
    cf70:	38e66ee3          	bltu	a2,a4,db0c <_vfiprintf_r+0x1348>
    cf74:	03070713          	addi	a4,a4,48
    cf78:	10e107a3          	sb	a4,271(sp)
    cf7c:	00068c93          	mv	s9,a3
    cf80:	0cd05ae3          	blez	a3,d854 <_vfiprintf_r+0x1090>
    cf84:	04314703          	lbu	a4,67(sp)
    cf88:	00071ae3          	bnez	a4,d79c <_vfiprintf_r+0xfd8>
    cf8c:	00012a23          	sw	zero,20(sp)
    cf90:	00100e93          	li	t4,1
    cf94:	10f10e13          	addi	t3,sp,271
    cf98:	a19ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    cf9c:	000d2b03          	lw	s6,0(s10)
    cfa0:	7c0b5e63          	bgez	s6,d77c <_vfiprintf_r+0xfb8>
    cfa4:	41600b33          	neg	s6,s6
    cfa8:	004d0d13          	addi	s10,s10,4
    cfac:	000a4603          	lbu	a2,0(s4)
    cfb0:	004cec93          	ori	s9,s9,4
    cfb4:	981ff06f          	j	c934 <_vfiprintf_r+0x170>
    cfb8:	02b00793          	li	a5,43
    cfbc:	000a4603          	lbu	a2,0(s4)
    cfc0:	04f101a3          	sb	a5,67(sp)
    cfc4:	971ff06f          	j	c934 <_vfiprintf_r+0x170>
    cfc8:	020cf713          	andi	a4,s9,32
    cfcc:	000b0893          	mv	a7,s6
    cfd0:	010cec93          	ori	s9,s9,16
    cfd4:	004d0613          	addi	a2,s10,4
    cfd8:	020704e3          	beqz	a4,d800 <_vfiprintf_r+0x103c>
    cfdc:	007d0613          	addi	a2,s10,7
    cfe0:	ff867613          	andi	a2,a2,-8
    cfe4:	00062703          	lw	a4,0(a2)
    cfe8:	00462583          	lw	a1,4(a2)
    cfec:	00860d13          	addi	s10,a2,8
    cff0:	040101a3          	sb	zero,67(sp)
    cff4:	bffcf313          	andi	t1,s9,-1025
    cff8:	6206c063          	bltz	a3,d618 <_vfiprintf_r+0xe54>
    cffc:	00b76633          	or	a2,a4,a1
    d000:	b7fcf313          	andi	t1,s9,-1153
    d004:	60061a63          	bnez	a2,d618 <_vfiprintf_r+0xe54>
    d008:	60069863          	bnez	a3,d618 <_vfiprintf_r+0xe54>
    d00c:	001cfc93          	andi	s9,s9,1
    d010:	760c8c63          	beqz	s9,d788 <_vfiprintf_r+0xfc4>
    d014:	03000713          	li	a4,48
    d018:	10e107a3          	sb	a4,271(sp)
    d01c:	000c8e93          	mv	t4,s9
    d020:	00012a23          	sw	zero,20(sp)
    d024:	10f10e13          	addi	t3,sp,271
    d028:	989ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d02c:	020cf713          	andi	a4,s9,32
    d030:	000b0893          	mv	a7,s6
    d034:	000c8313          	mv	t1,s9
    d038:	06071463          	bnez	a4,d0a0 <_vfiprintf_r+0x8dc>
    d03c:	010cfc93          	andi	s9,s9,16
    d040:	000d2703          	lw	a4,0(s10)
    d044:	004d0613          	addi	a2,s10,4
    d048:	7c0c9463          	bnez	s9,d810 <_vfiprintf_r+0x104c>
    d04c:	04037593          	andi	a1,t1,64
    d050:	28058ee3          	beqz	a1,daec <_vfiprintf_r+0x1328>
    d054:	01071713          	slli	a4,a4,0x10
    d058:	040101a3          	sb	zero,67(sp)
    d05c:	01075713          	srli	a4,a4,0x10
    d060:	00000b13          	li	s6,0
    d064:	2a06c0e3          	bltz	a3,db04 <_vfiprintf_r+0x1340>
    d068:	f7f37313          	andi	t1,t1,-129
    d06c:	28069ce3          	bnez	a3,db04 <_vfiprintf_r+0x1340>
    d070:	016765b3          	or	a1,a4,s6
    d074:	280598e3          	bnez	a1,db04 <_vfiprintf_r+0x1340>
    d078:	00060d13          	mv	s10,a2
    d07c:	00000e93          	li	t4,0
    d080:	00012a23          	sw	zero,20(sp)
    d084:	11010e13          	addi	t3,sp,272
    d088:	929ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d08c:	020cf713          	andi	a4,s9,32
    d090:	000b0893          	mv	a7,s6
    d094:	010ce313          	ori	t1,s9,16
    d098:	004d0613          	addi	a2,s10,4
    d09c:	76070a63          	beqz	a4,d810 <_vfiprintf_r+0x104c>
    d0a0:	007d0613          	addi	a2,s10,7
    d0a4:	ff867613          	andi	a2,a2,-8
    d0a8:	040101a3          	sb	zero,67(sp)
    d0ac:	00062703          	lw	a4,0(a2)
    d0b0:	00462b03          	lw	s6,4(a2)
    d0b4:	00860d13          	addi	s10,a2,8
    d0b8:	ea06c8e3          	bltz	a3,cf68 <_vfiprintf_r+0x7a4>
    d0bc:	f7f37313          	andi	t1,t1,-129
    d0c0:	ea0694e3          	bnez	a3,cf68 <_vfiprintf_r+0x7a4>
    d0c4:	01676633          	or	a2,a4,s6
    d0c8:	ea0610e3          	bnez	a2,cf68 <_vfiprintf_r+0x7a4>
    d0cc:	00012a23          	sw	zero,20(sp)
    d0d0:	00000e93          	li	t4,0
    d0d4:	11010e13          	addi	t3,sp,272
    d0d8:	00000c93          	li	s9,0
    d0dc:	8d5ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d0e0:	000a4603          	lbu	a2,0(s4)
    d0e4:	06800793          	li	a5,104
    d0e8:	02f60ee3          	beq	a2,a5,d924 <_vfiprintf_r+0x1160>
    d0ec:	040cec93          	ori	s9,s9,64
    d0f0:	845ff06f          	j	c934 <_vfiprintf_r+0x170>
    d0f4:	00040513          	mv	a0,s0
    d0f8:	00d12a23          	sw	a3,20(sp)
    d0fc:	c61f80ef          	jal	5d5c <_localeconv_r>
    d100:	00452783          	lw	a5,4(a0)
    d104:	00078513          	mv	a0,a5
    d108:	02f12623          	sw	a5,44(sp)
    d10c:	d60f30ef          	jal	66c <strlen>
    d110:	02a12423          	sw	a0,40(sp)
    d114:	00040513          	mv	a0,s0
    d118:	c45f80ef          	jal	5d5c <_localeconv_r>
    d11c:	00852703          	lw	a4,8(a0)
    d120:	02812783          	lw	a5,40(sp)
    d124:	000a4603          	lbu	a2,0(s4)
    d128:	00e12c23          	sw	a4,24(sp)
    d12c:	01412683          	lw	a3,20(sp)
    d130:	800782e3          	beqz	a5,c934 <_vfiprintf_r+0x170>
    d134:	800700e3          	beqz	a4,c934 <_vfiprintf_r+0x170>
    d138:	00074783          	lbu	a5,0(a4)
    d13c:	fe078c63          	beqz	a5,c934 <_vfiprintf_r+0x170>
    d140:	400cec93          	ori	s9,s9,1024
    d144:	ff0ff06f          	j	c934 <_vfiprintf_r+0x170>
    d148:	000a4603          	lbu	a2,0(s4)
    d14c:	080cec93          	ori	s9,s9,128
    d150:	fe4ff06f          	j	c934 <_vfiprintf_r+0x170>
    d154:	000a4603          	lbu	a2,0(s4)
    d158:	02a00793          	li	a5,42
    d15c:	001a0593          	addi	a1,s4,1
    d160:	6af602e3          	beq	a2,a5,e004 <_vfiprintf_r+0x1840>
    d164:	fd060793          	addi	a5,a2,-48
    d168:	00900513          	li	a0,9
    d16c:	00000693          	li	a3,0
    d170:	02f56463          	bltu	a0,a5,d198 <_vfiprintf_r+0x9d4>
    d174:	00269713          	slli	a4,a3,0x2
    d178:	0005c603          	lbu	a2,0(a1)
    d17c:	00d706b3          	add	a3,a4,a3
    d180:	00169693          	slli	a3,a3,0x1
    d184:	00f686b3          	add	a3,a3,a5
    d188:	fd060793          	addi	a5,a2,-48
    d18c:	00158593          	addi	a1,a1,1
    d190:	fef572e3          	bgeu	a0,a5,d174 <_vfiprintf_r+0x9b0>
    d194:	7606ca63          	bltz	a3,d908 <_vfiprintf_r+0x1144>
    d198:	00058a13          	mv	s4,a1
    d19c:	f9cff06f          	j	c938 <_vfiprintf_r+0x174>
    d1a0:	000a4603          	lbu	a2,0(s4)
    d1a4:	001cec93          	ori	s9,s9,1
    d1a8:	f8cff06f          	j	c934 <_vfiprintf_r+0x170>
    d1ac:	04314783          	lbu	a5,67(sp)
    d1b0:	000a4603          	lbu	a2,0(s4)
    d1b4:	f8079063          	bnez	a5,c934 <_vfiprintf_r+0x170>
    d1b8:	02000793          	li	a5,32
    d1bc:	04f101a3          	sb	a5,67(sp)
    d1c0:	f74ff06f          	j	c934 <_vfiprintf_r+0x170>
    d1c4:	00008737          	lui	a4,0x8
    d1c8:	83070713          	addi	a4,a4,-2000 # 7830 <_dtoa_r+0xfe0>
    d1cc:	04e11223          	sh	a4,68(sp)
    d1d0:	040101a3          	sb	zero,67(sp)
    d1d4:	000d2703          	lw	a4,0(s10)
    d1d8:	000b0893          	mv	a7,s6
    d1dc:	004d0613          	addi	a2,s10,4
    d1e0:	00000593          	li	a1,0
    d1e4:	6806c063          	bltz	a3,d864 <_vfiprintf_r+0x10a0>
    d1e8:	f7fcf313          	andi	t1,s9,-129
    d1ec:	00236313          	ori	t1,t1,2
    d1f0:	00060d13          	mv	s10,a2
    d1f4:	5e0718e3          	bnez	a4,dfe4 <_vfiprintf_r+0x1820>
    d1f8:	5e0696e3          	bnez	a3,dfe4 <_vfiprintf_r+0x1820>
    d1fc:	06812603          	lw	a2,104(sp)
    d200:	06412703          	lw	a4,100(sp)
    d204:	00000c93          	li	s9,0
    d208:	08437f93          	andi	t6,t1,132
    d20c:	11010e13          	addi	t3,sp,272
    d210:	00000e93          	li	t4,0
    d214:	002c8c93          	addi	s9,s9,2
    d218:	00060513          	mv	a0,a2
    d21c:	00070593          	mv	a1,a4
    d220:	6a0f8e63          	beqz	t6,d8dc <_vfiprintf_r+0x1118>
    d224:	00012a23          	sw	zero,20(sp)
    d228:	fe8ff06f          	j	ca10 <_vfiprintf_r+0x24c>
    d22c:	020cf713          	andi	a4,s9,32
    d230:	000b0893          	mv	a7,s6
    d234:	da0714e3          	bnez	a4,cfdc <_vfiprintf_r+0x818>
    d238:	010cf593          	andi	a1,s9,16
    d23c:	000d2703          	lw	a4,0(s10)
    d240:	004d0613          	addi	a2,s10,4
    d244:	5a059e63          	bnez	a1,d800 <_vfiprintf_r+0x103c>
    d248:	040cf593          	andi	a1,s9,64
    d24c:	2e058ae3          	beqz	a1,dd40 <_vfiprintf_r+0x157c>
    d250:	01071713          	slli	a4,a4,0x10
    d254:	01075713          	srli	a4,a4,0x10
    d258:	00060d13          	mv	s10,a2
    d25c:	00000593          	li	a1,0
    d260:	d91ff06f          	j	cff0 <_vfiprintf_r+0x82c>
    d264:	020cf713          	andi	a4,s9,32
    d268:	004d0693          	addi	a3,s10,4
    d26c:	56071663          	bnez	a4,d7d8 <_vfiprintf_r+0x1014>
    d270:	010cf713          	andi	a4,s9,16
    d274:	28071ce3          	bnez	a4,dd0c <_vfiprintf_r+0x1548>
    d278:	040cf713          	andi	a4,s9,64
    d27c:	360712e3          	bnez	a4,dde0 <_vfiprintf_r+0x161c>
    d280:	200cf313          	andi	t1,s9,512
    d284:	280304e3          	beqz	t1,dd0c <_vfiprintf_r+0x1548>
    d288:	000d2703          	lw	a4,0(s10)
    d28c:	01012783          	lw	a5,16(sp)
    d290:	00068d13          	mv	s10,a3
    d294:	00f70023          	sb	a5,0(a4)
    d298:	e38ff06f          	j	c8d0 <_vfiprintf_r+0x10c>
    d29c:	000a4603          	lbu	a2,0(s4)
    d2a0:	06c00793          	li	a5,108
    d2a4:	66f60863          	beq	a2,a5,d914 <_vfiprintf_r+0x1150>
    d2a8:	010cec93          	ori	s9,s9,16
    d2ac:	e88ff06f          	j	c934 <_vfiprintf_r+0x170>
    d2b0:	41988b33          	sub	s6,a7,s9
    d2b4:	f9605863          	blez	s6,ca44 <_vfiprintf_r+0x280>
    d2b8:	01000f93          	li	t6,16
    d2bc:	00006c17          	auipc	s8,0x6
    d2c0:	214c0c13          	addi	s8,s8,532 # 134d0 <zeroes.0>
    d2c4:	0b6fdc63          	bge	t6,s6,d37c <_vfiprintf_r+0xbb8>
    d2c8:	000d8793          	mv	a5,s11
    d2cc:	00700293          	li	t0,7
    d2d0:	000d0d93          	mv	s11,s10
    d2d4:	01112e23          	sw	a7,28(sp)
    d2d8:	000a0d13          	mv	s10,s4
    d2dc:	03c12023          	sw	t3,32(sp)
    d2e0:	000b0a13          	mv	s4,s6
    d2e4:	02612223          	sw	t1,36(sp)
    d2e8:	02d12823          	sw	a3,48(sp)
    d2ec:	00006b17          	auipc	s6,0x6
    d2f0:	1e4b0b13          	addi	s6,s6,484 # 134d0 <zeroes.0>
    d2f4:	000e8c13          	mv	s8,t4
    d2f8:	00c0006f          	j	d304 <_vfiprintf_r+0xb40>
    d2fc:	ff0a0a13          	addi	s4,s4,-16
    d300:	054fda63          	bge	t6,s4,d354 <_vfiprintf_r+0xb90>
    d304:	01060613          	addi	a2,a2,16
    d308:	00170713          	addi	a4,a4,1
    d30c:	0167a023          	sw	s6,0(a5)
    d310:	01f7a223          	sw	t6,4(a5)
    d314:	06c12423          	sw	a2,104(sp)
    d318:	06e12223          	sw	a4,100(sp)
    d31c:	00878793          	addi	a5,a5,8
    d320:	fce2dee3          	bge	t0,a4,d2fc <_vfiprintf_r+0xb38>
    d324:	00c12583          	lw	a1,12(sp)
    d328:	06010613          	addi	a2,sp,96
    d32c:	00040513          	mv	a0,s0
    d330:	9ddf60ef          	jal	3d0c <__sprint_r>
    d334:	20051c63          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d338:	01000f93          	li	t6,16
    d33c:	ff0a0a13          	addi	s4,s4,-16
    d340:	06812603          	lw	a2,104(sp)
    d344:	06412703          	lw	a4,100(sp)
    d348:	000a8793          	mv	a5,s5
    d34c:	00700293          	li	t0,7
    d350:	fb4fcae3          	blt	t6,s4,d304 <_vfiprintf_r+0xb40>
    d354:	01c12883          	lw	a7,28(sp)
    d358:	02012e03          	lw	t3,32(sp)
    d35c:	02412303          	lw	t1,36(sp)
    d360:	03012683          	lw	a3,48(sp)
    d364:	000c0e93          	mv	t4,s8
    d368:	000b0c13          	mv	s8,s6
    d36c:	000a0b13          	mv	s6,s4
    d370:	000d0a13          	mv	s4,s10
    d374:	000d8d13          	mv	s10,s11
    d378:	00078d93          	mv	s11,a5
    d37c:	01660633          	add	a2,a2,s6
    d380:	00170713          	addi	a4,a4,1
    d384:	018da023          	sw	s8,0(s11)
    d388:	016da223          	sw	s6,4(s11)
    d38c:	06c12423          	sw	a2,104(sp)
    d390:	06e12223          	sw	a4,100(sp)
    d394:	00700593          	li	a1,7
    d398:	008d8d93          	addi	s11,s11,8
    d39c:	eae5d463          	bge	a1,a4,ca44 <_vfiprintf_r+0x280>
    d3a0:	00c12583          	lw	a1,12(sp)
    d3a4:	06010613          	addi	a2,sp,96
    d3a8:	00040513          	mv	a0,s0
    d3ac:	03d12a23          	sw	t4,52(sp)
    d3b0:	02d12823          	sw	a3,48(sp)
    d3b4:	02612223          	sw	t1,36(sp)
    d3b8:	03c12023          	sw	t3,32(sp)
    d3bc:	01112e23          	sw	a7,28(sp)
    d3c0:	94df60ef          	jal	3d0c <__sprint_r>
    d3c4:	18051463          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d3c8:	06812603          	lw	a2,104(sp)
    d3cc:	06412703          	lw	a4,100(sp)
    d3d0:	03412e83          	lw	t4,52(sp)
    d3d4:	03012683          	lw	a3,48(sp)
    d3d8:	02412303          	lw	t1,36(sp)
    d3dc:	02012e03          	lw	t3,32(sp)
    d3e0:	01c12883          	lw	a7,28(sp)
    d3e4:	000a8d93          	mv	s11,s5
    d3e8:	e5cff06f          	j	ca44 <_vfiprintf_r+0x280>
    d3ec:	00006c17          	auipc	s8,0x6
    d3f0:	0e4c0c13          	addi	s8,s8,228 # 134d0 <zeroes.0>
    d3f4:	0b695663          	bge	s2,s6,d4a0 <_vfiprintf_r+0xcdc>
    d3f8:	000d8793          	mv	a5,s11
    d3fc:	00700693          	li	a3,7
    d400:	000d0d93          	mv	s11,s10
    d404:	01112e23          	sw	a7,28(sp)
    d408:	000a0d13          	mv	s10,s4
    d40c:	03c12023          	sw	t3,32(sp)
    d410:	000b0a13          	mv	s4,s6
    d414:	02612223          	sw	t1,36(sp)
    d418:	00006b17          	auipc	s6,0x6
    d41c:	0b8b0b13          	addi	s6,s6,184 # 134d0 <zeroes.0>
    d420:	000e8c13          	mv	s8,t4
    d424:	00c0006f          	j	d430 <_vfiprintf_r+0xc6c>
    d428:	ff0a0a13          	addi	s4,s4,-16
    d42c:	05495863          	bge	s2,s4,d47c <_vfiprintf_r+0xcb8>
    d430:	01060613          	addi	a2,a2,16
    d434:	00170713          	addi	a4,a4,1
    d438:	0167a023          	sw	s6,0(a5)
    d43c:	0127a223          	sw	s2,4(a5)
    d440:	06c12423          	sw	a2,104(sp)
    d444:	06e12223          	sw	a4,100(sp)
    d448:	00878793          	addi	a5,a5,8
    d44c:	fce6dee3          	bge	a3,a4,d428 <_vfiprintf_r+0xc64>
    d450:	00c12583          	lw	a1,12(sp)
    d454:	06010613          	addi	a2,sp,96
    d458:	00040513          	mv	a0,s0
    d45c:	8b1f60ef          	jal	3d0c <__sprint_r>
    d460:	0e051663          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d464:	ff0a0a13          	addi	s4,s4,-16
    d468:	06812603          	lw	a2,104(sp)
    d46c:	06412703          	lw	a4,100(sp)
    d470:	000a8793          	mv	a5,s5
    d474:	00700693          	li	a3,7
    d478:	fb494ce3          	blt	s2,s4,d430 <_vfiprintf_r+0xc6c>
    d47c:	01c12883          	lw	a7,28(sp)
    d480:	02012e03          	lw	t3,32(sp)
    d484:	02412303          	lw	t1,36(sp)
    d488:	000c0e93          	mv	t4,s8
    d48c:	000b0c13          	mv	s8,s6
    d490:	000a0b13          	mv	s6,s4
    d494:	000d0a13          	mv	s4,s10
    d498:	000d8d13          	mv	s10,s11
    d49c:	00078d93          	mv	s11,a5
    d4a0:	01660633          	add	a2,a2,s6
    d4a4:	00170713          	addi	a4,a4,1
    d4a8:	018da023          	sw	s8,0(s11)
    d4ac:	016da223          	sw	s6,4(s11)
    d4b0:	06c12423          	sw	a2,104(sp)
    d4b4:	06e12223          	sw	a4,100(sp)
    d4b8:	00700693          	li	a3,7
    d4bc:	008d8d93          	addi	s11,s11,8
    d4c0:	d8e6d663          	bge	a3,a4,ca4c <_vfiprintf_r+0x288>
    d4c4:	00c12583          	lw	a1,12(sp)
    d4c8:	06010613          	addi	a2,sp,96
    d4cc:	00040513          	mv	a0,s0
    d4d0:	03d12823          	sw	t4,48(sp)
    d4d4:	02612223          	sw	t1,36(sp)
    d4d8:	03c12023          	sw	t3,32(sp)
    d4dc:	01112e23          	sw	a7,28(sp)
    d4e0:	82df60ef          	jal	3d0c <__sprint_r>
    d4e4:	06051463          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d4e8:	06812603          	lw	a2,104(sp)
    d4ec:	06412703          	lw	a4,100(sp)
    d4f0:	03012e83          	lw	t4,48(sp)
    d4f4:	02412303          	lw	t1,36(sp)
    d4f8:	02012e03          	lw	t3,32(sp)
    d4fc:	01c12883          	lw	a7,28(sp)
    d500:	000a8d93          	mv	s11,s5
    d504:	d48ff06f          	j	ca4c <_vfiprintf_r+0x288>
    d508:	00c12583          	lw	a1,12(sp)
    d50c:	06010613          	addi	a2,sp,96
    d510:	00040513          	mv	a0,s0
    d514:	02612023          	sw	t1,32(sp)
    d518:	01112e23          	sw	a7,28(sp)
    d51c:	ff0f60ef          	jal	3d0c <__sprint_r>
    d520:	02051663          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d524:	06812603          	lw	a2,104(sp)
    d528:	02012303          	lw	t1,32(sp)
    d52c:	01c12883          	lw	a7,28(sp)
    d530:	000a8793          	mv	a5,s5
    d534:	d3cff06f          	j	ca70 <_vfiprintf_r+0x2ac>
    d538:	00c12583          	lw	a1,12(sp)
    d53c:	06010613          	addi	a2,sp,96
    d540:	00040513          	mv	a0,s0
    d544:	fc8f60ef          	jal	3d0c <__sprint_r>
    d548:	d4050863          	beqz	a0,ca98 <_vfiprintf_r+0x2d4>
    d54c:	01412c03          	lw	s8,20(sp)
    d550:	00c12a03          	lw	s4,12(sp)
    d554:	000c0863          	beqz	s8,d564 <_vfiprintf_r+0xda0>
    d558:	000c0593          	mv	a1,s8
    d55c:	00040513          	mv	a0,s0
    d560:	d61fa0ef          	jal	82c0 <_free_r>
    d564:	00ca1783          	lh	a5,12(s4)
    d568:	064a2703          	lw	a4,100(s4)
    d56c:	00177713          	andi	a4,a4,1
    d570:	00071663          	bnez	a4,d57c <_vfiprintf_r+0xdb8>
    d574:	2007f713          	andi	a4,a5,512
    d578:	76070c63          	beqz	a4,dcf0 <_vfiprintf_r+0x152c>
    d57c:	0407f793          	andi	a5,a5,64
    d580:	1e0796e3          	bnez	a5,df6c <_vfiprintf_r+0x17a8>
    d584:	14412483          	lw	s1,324(sp)
    d588:	14012903          	lw	s2,320(sp)
    d58c:	13c12983          	lw	s3,316(sp)
    d590:	13412a83          	lw	s5,308(sp)
    d594:	12c12b83          	lw	s7,300(sp)
    d598:	12812c03          	lw	s8,296(sp)
    d59c:	12412c83          	lw	s9,292(sp)
    d5a0:	11c12d83          	lw	s11,284(sp)
    d5a4:	14c12083          	lw	ra,332(sp)
    d5a8:	14812403          	lw	s0,328(sp)
    d5ac:	01012503          	lw	a0,16(sp)
    d5b0:	13812a03          	lw	s4,312(sp)
    d5b4:	13012b03          	lw	s6,304(sp)
    d5b8:	12012d03          	lw	s10,288(sp)
    d5bc:	15010113          	addi	sp,sp,336
    d5c0:	00008067          	ret
    d5c4:	00c12583          	lw	a1,12(sp)
    d5c8:	06010613          	addi	a2,sp,96
    d5cc:	00040513          	mv	a0,s0
    d5d0:	03d12c23          	sw	t4,56(sp)
    d5d4:	02d12a23          	sw	a3,52(sp)
    d5d8:	02612823          	sw	t1,48(sp)
    d5dc:	03c12223          	sw	t3,36(sp)
    d5e0:	03f12023          	sw	t6,32(sp)
    d5e4:	01112e23          	sw	a7,28(sp)
    d5e8:	f24f60ef          	jal	3d0c <__sprint_r>
    d5ec:	f60510e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d5f0:	06812603          	lw	a2,104(sp)
    d5f4:	06412703          	lw	a4,100(sp)
    d5f8:	03812e83          	lw	t4,56(sp)
    d5fc:	03412683          	lw	a3,52(sp)
    d600:	03012303          	lw	t1,48(sp)
    d604:	02412e03          	lw	t3,36(sp)
    d608:	02012f83          	lw	t6,32(sp)
    d60c:	01c12883          	lw	a7,28(sp)
    d610:	000a8d93          	mv	s11,s5
    d614:	c28ff06f          	j	ca3c <_vfiprintf_r+0x278>
    d618:	11010e13          	addi	t3,sp,272
    d61c:	01d59793          	slli	a5,a1,0x1d
    d620:	00777613          	andi	a2,a4,7
    d624:	00375713          	srli	a4,a4,0x3
    d628:	000e0e93          	mv	t4,t3
    d62c:	00e78733          	add	a4,a5,a4
    d630:	03060613          	addi	a2,a2,48
    d634:	0035d593          	srli	a1,a1,0x3
    d638:	00b767b3          	or	a5,a4,a1
    d63c:	fece0fa3          	sb	a2,-1(t3)
    d640:	fffe0e13          	addi	t3,t3,-1
    d644:	fc079ce3          	bnez	a5,d61c <_vfiprintf_r+0xe58>
    d648:	fd060613          	addi	a2,a2,-48
    d64c:	00060663          	beqz	a2,d658 <_vfiprintf_r+0xe94>
    d650:	00137713          	andi	a4,t1,1
    d654:	1c071a63          	bnez	a4,d828 <_vfiprintf_r+0x1064>
    d658:	11010793          	addi	a5,sp,272
    d65c:	41c78eb3          	sub	t4,a5,t3
    d660:	00068c93          	mv	s9,a3
    d664:	19d6c863          	blt	a3,t4,d7f4 <_vfiprintf_r+0x1030>
    d668:	00012a23          	sw	zero,20(sp)
    d66c:	b44ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d670:	00000f13          	li	t5,0
    d674:	01000293          	li	t0,16
    d678:	00050613          	mv	a2,a0
    d67c:	00058713          	mv	a4,a1
    d680:	00006f97          	auipc	t6,0x6
    d684:	e60f8f93          	addi	t6,t6,-416 # 134e0 <blanks.1>
    d688:	0b62de63          	bge	t0,s6,d744 <_vfiprintf_r+0xf80>
    d68c:	000d8793          	mv	a5,s11
    d690:	00700c13          	li	s8,7
    d694:	000d0d93          	mv	s11,s10
    d698:	01112e23          	sw	a7,28(sp)
    d69c:	000a0d13          	mv	s10,s4
    d6a0:	03e12023          	sw	t5,32(sp)
    d6a4:	000b0a13          	mv	s4,s6
    d6a8:	03c12223          	sw	t3,36(sp)
    d6ac:	02612823          	sw	t1,48(sp)
    d6b0:	02d12a23          	sw	a3,52(sp)
    d6b4:	03d12c23          	sw	t4,56(sp)
    d6b8:	00006b17          	auipc	s6,0x6
    d6bc:	e28b0b13          	addi	s6,s6,-472 # 134e0 <blanks.1>
    d6c0:	00c0006f          	j	d6cc <_vfiprintf_r+0xf08>
    d6c4:	ff0a0a13          	addi	s4,s4,-16
    d6c8:	0542d863          	bge	t0,s4,d718 <_vfiprintf_r+0xf54>
    d6cc:	01060613          	addi	a2,a2,16
    d6d0:	00170713          	addi	a4,a4,1
    d6d4:	0167a023          	sw	s6,0(a5)
    d6d8:	0057a223          	sw	t0,4(a5)
    d6dc:	06c12423          	sw	a2,104(sp)
    d6e0:	06e12223          	sw	a4,100(sp)
    d6e4:	00878793          	addi	a5,a5,8
    d6e8:	fcec5ee3          	bge	s8,a4,d6c4 <_vfiprintf_r+0xf00>
    d6ec:	00c12583          	lw	a1,12(sp)
    d6f0:	06010613          	addi	a2,sp,96
    d6f4:	00040513          	mv	a0,s0
    d6f8:	e14f60ef          	jal	3d0c <__sprint_r>
    d6fc:	e40518e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    d700:	01000293          	li	t0,16
    d704:	ff0a0a13          	addi	s4,s4,-16
    d708:	06812603          	lw	a2,104(sp)
    d70c:	06412703          	lw	a4,100(sp)
    d710:	000a8793          	mv	a5,s5
    d714:	fb42cce3          	blt	t0,s4,d6cc <_vfiprintf_r+0xf08>
    d718:	01c12883          	lw	a7,28(sp)
    d71c:	02012f03          	lw	t5,32(sp)
    d720:	02412e03          	lw	t3,36(sp)
    d724:	03012303          	lw	t1,48(sp)
    d728:	03412683          	lw	a3,52(sp)
    d72c:	03812e83          	lw	t4,56(sp)
    d730:	000b0f93          	mv	t6,s6
    d734:	000a0b13          	mv	s6,s4
    d738:	000d0a13          	mv	s4,s10
    d73c:	000d8d13          	mv	s10,s11
    d740:	00078d93          	mv	s11,a5
    d744:	00cb0633          	add	a2,s6,a2
    d748:	00170713          	addi	a4,a4,1
    d74c:	06c12423          	sw	a2,104(sp)
    d750:	06e12223          	sw	a4,100(sp)
    d754:	01fda023          	sw	t6,0(s11)
    d758:	016da223          	sw	s6,4(s11)
    d75c:	00700593          	li	a1,7
    d760:	4ce5ce63          	blt	a1,a4,dc3c <_vfiprintf_r+0x1478>
    d764:	04314583          	lbu	a1,67(sp)
    d768:	008d8d93          	addi	s11,s11,8
    d76c:	04059863          	bnez	a1,d7bc <_vfiprintf_r+0xff8>
    d770:	ac0f0a63          	beqz	t5,ca44 <_vfiprintf_r+0x280>
    d774:	00000f93          	li	t6,0
    d778:	a98ff06f          	j	ca10 <_vfiprintf_r+0x24c>
    d77c:	000a4603          	lbu	a2,0(s4)
    d780:	004d0d13          	addi	s10,s10,4
    d784:	9b0ff06f          	j	c934 <_vfiprintf_r+0x170>
    d788:	00000e93          	li	t4,0
    d78c:	00000693          	li	a3,0
    d790:	00012a23          	sw	zero,20(sp)
    d794:	11010e13          	addi	t3,sp,272
    d798:	a18ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d79c:	001c8c93          	addi	s9,s9,1
    d7a0:	00012a23          	sw	zero,20(sp)
    d7a4:	00100e93          	li	t4,1
    d7a8:	10f10e13          	addi	t3,sp,271
    d7ac:	e18ff06f          	j	cdc4 <_vfiprintf_r+0x600>
    d7b0:	01271693          	slli	a3,a4,0x12
    d7b4:	8806de63          	bgez	a3,c850 <_vfiprintf_r+0x8c>
    d7b8:	7d40006f          	j	df8c <_vfiprintf_r+0x17c8>
    d7bc:	00000f93          	li	t6,0
    d7c0:	a20ff06f          	j	c9e0 <_vfiprintf_r+0x21c>
    d7c4:	000d2703          	lw	a4,0(s10)
    d7c8:	00060d13          	mv	s10,a2
    d7cc:	41f75b13          	srai	s6,a4,0x1f
    d7d0:	000b0613          	mv	a2,s6
    d7d4:	dbcff06f          	j	cd90 <_vfiprintf_r+0x5cc>
    d7d8:	01012783          	lw	a5,16(sp)
    d7dc:	000d2703          	lw	a4,0(s10)
    d7e0:	00068d13          	mv	s10,a3
    d7e4:	41f7d613          	srai	a2,a5,0x1f
    d7e8:	00f72023          	sw	a5,0(a4)
    d7ec:	00c72223          	sw	a2,4(a4)
    d7f0:	8e0ff06f          	j	c8d0 <_vfiprintf_r+0x10c>
    d7f4:	000e8c93          	mv	s9,t4
    d7f8:	00012a23          	sw	zero,20(sp)
    d7fc:	9b4ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d800:	000d2703          	lw	a4,0(s10)
    d804:	00000593          	li	a1,0
    d808:	00060d13          	mv	s10,a2
    d80c:	fe4ff06f          	j	cff0 <_vfiprintf_r+0x82c>
    d810:	040101a3          	sb	zero,67(sp)
    d814:	000d2703          	lw	a4,0(s10)
    d818:	00000b13          	li	s6,0
    d81c:	00060d13          	mv	s10,a2
    d820:	8806dee3          	bgez	a3,d0bc <_vfiprintf_r+0x8f8>
    d824:	f48ff06f          	j	cf6c <_vfiprintf_r+0x7a8>
    d828:	ffee8713          	addi	a4,t4,-2
    d82c:	03000613          	li	a2,48
    d830:	11010793          	addi	a5,sp,272
    d834:	40e78eb3          	sub	t4,a5,a4
    d838:	fece0fa3          	sb	a2,-1(t3)
    d83c:	00068c93          	mv	s9,a3
    d840:	01d6d463          	bge	a3,t4,d848 <_vfiprintf_r+0x1084>
    d844:	000e8c93          	mv	s9,t4
    d848:	00070e13          	mv	t3,a4
    d84c:	00012a23          	sw	zero,20(sp)
    d850:	960ff06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    d854:	04314703          	lbu	a4,67(sp)
    d858:	00100c93          	li	s9,1
    d85c:	f2070863          	beqz	a4,cf8c <_vfiprintf_r+0x7c8>
    d860:	f3dff06f          	j	d79c <_vfiprintf_r+0xfd8>
    d864:	002ce313          	ori	t1,s9,2
    d868:	00060d13          	mv	s10,a2
    d86c:	00200f13          	li	t5,2
    d870:	00005517          	auipc	a0,0x5
    d874:	03050513          	addi	a0,a0,48 # 128a0 <__clzsi2+0xd8>
    d878:	11010e13          	addi	t3,sp,272
    d87c:	00f77793          	andi	a5,a4,15
    d880:	00f507b3          	add	a5,a0,a5
    d884:	0007c783          	lbu	a5,0(a5)
    d888:	00475713          	srli	a4,a4,0x4
    d88c:	fffe0e13          	addi	t3,t3,-1
    d890:	00fe0023          	sb	a5,0(t3)
    d894:	01c59793          	slli	a5,a1,0x1c
    d898:	00e78733          	add	a4,a5,a4
    d89c:	0045d593          	srli	a1,a1,0x4
    d8a0:	00b767b3          	or	a5,a4,a1
    d8a4:	fc079ce3          	bnez	a5,d87c <_vfiprintf_r+0x10b8>
    d8a8:	11010793          	addi	a5,sp,272
    d8ac:	41c78eb3          	sub	t4,a5,t3
    d8b0:	000e8c93          	mv	s9,t4
    d8b4:	00ded463          	bge	t4,a3,d8bc <_vfiprintf_r+0x10f8>
    d8b8:	00068c93          	mv	s9,a3
    d8bc:	0c0f0863          	beqz	t5,d98c <_vfiprintf_r+0x11c8>
    d8c0:	06812603          	lw	a2,104(sp)
    d8c4:	06412703          	lw	a4,100(sp)
    d8c8:	08437f93          	andi	t6,t1,132
    d8cc:	002c8c93          	addi	s9,s9,2
    d8d0:	00060513          	mv	a0,a2
    d8d4:	00070593          	mv	a1,a4
    d8d8:	940f96e3          	bnez	t6,d224 <_vfiprintf_r+0xa60>
    d8dc:	41988b33          	sub	s6,a7,s9
    d8e0:	00012a23          	sw	zero,20(sp)
    d8e4:	93605663          	blez	s6,ca10 <_vfiprintf_r+0x24c>
    d8e8:	00200f13          	li	t5,2
    d8ec:	d89ff06f          	j	d674 <_vfiprintf_r+0xeb0>
    d8f0:	000d2703          	lw	a4,0(s10)
    d8f4:	00100c93          	li	s9,1
    d8f8:	000c8e93          	mv	t4,s9
    d8fc:	0ae10623          	sb	a4,172(sp)
    d900:	0ac10b13          	addi	s6,sp,172
    d904:	de0ff06f          	j	cee4 <_vfiprintf_r+0x720>
    d908:	fff00693          	li	a3,-1
    d90c:	00058a13          	mv	s4,a1
    d910:	828ff06f          	j	c938 <_vfiprintf_r+0x174>
    d914:	001a4603          	lbu	a2,1(s4)
    d918:	020cec93          	ori	s9,s9,32
    d91c:	001a0a13          	addi	s4,s4,1
    d920:	814ff06f          	j	c934 <_vfiprintf_r+0x170>
    d924:	001a4603          	lbu	a2,1(s4)
    d928:	200cec93          	ori	s9,s9,512
    d92c:	001a0a13          	addi	s4,s4,1
    d930:	804ff06f          	j	c934 <_vfiprintf_r+0x170>
    d934:	000b0893          	mv	a7,s6
    d938:	000c8313          	mv	t1,s9
    d93c:	00005517          	auipc	a0,0x5
    d940:	f7850513          	addi	a0,a0,-136 # 128b4 <__clzsi2+0xec>
    d944:	02037713          	andi	a4,t1,32
    d948:	2a070863          	beqz	a4,dbf8 <_vfiprintf_r+0x1434>
    d94c:	007d0593          	addi	a1,s10,7
    d950:	ff85f593          	andi	a1,a1,-8
    d954:	0005a703          	lw	a4,0(a1)
    d958:	00858d13          	addi	s10,a1,8
    d95c:	0045a583          	lw	a1,4(a1)
    d960:	00137e13          	andi	t3,t1,1
    d964:	00b76eb3          	or	t4,a4,a1
    d968:	000e0463          	beqz	t3,d970 <_vfiprintf_r+0x11ac>
    d96c:	320e9e63          	bnez	t4,dca8 <_vfiprintf_r+0x14e4>
    d970:	040101a3          	sb	zero,67(sp)
    d974:	2a06ce63          	bltz	a3,dc30 <_vfiprintf_r+0x146c>
    d978:	b7f37313          	andi	t1,t1,-1153
    d97c:	64069a63          	bnez	a3,dfd0 <_vfiprintf_r+0x180c>
    d980:	640e9863          	bnez	t4,dfd0 <_vfiprintf_r+0x180c>
    d984:	11010e13          	addi	t3,sp,272
    d988:	00000c93          	li	s9,0
    d98c:	06812603          	lw	a2,104(sp)
    d990:	06412703          	lw	a4,100(sp)
    d994:	08437f93          	andi	t6,t1,132
    d998:	00060513          	mv	a0,a2
    d99c:	00070593          	mv	a1,a4
    d9a0:	680f8063          	beqz	t6,e020 <_vfiprintf_r+0x185c>
    d9a4:	04314583          	lbu	a1,67(sp)
    d9a8:	00012a23          	sw	zero,20(sp)
    d9ac:	00000f13          	li	t5,0
    d9b0:	00058463          	beqz	a1,d9b8 <_vfiprintf_r+0x11f4>
    d9b4:	82cff06f          	j	c9e0 <_vfiprintf_r+0x21c>
    d9b8:	884ff06f          	j	ca3c <_vfiprintf_r+0x278>
    d9bc:	000b0893          	mv	a7,s6
    d9c0:	000c8313          	mv	t1,s9
    d9c4:	00005517          	auipc	a0,0x5
    d9c8:	edc50513          	addi	a0,a0,-292 # 128a0 <__clzsi2+0xd8>
    d9cc:	f79ff06f          	j	d944 <_vfiprintf_r+0x1180>
    d9d0:	01412783          	lw	a5,20(sp)
    d9d4:	05810513          	addi	a0,sp,88
    d9d8:	00800613          	li	a2,8
    d9dc:	00000593          	li	a1,0
    d9e0:	02d12223          	sw	a3,36(sp)
    d9e4:	01112e23          	sw	a7,28(sp)
    d9e8:	02612023          	sw	t1,32(sp)
    d9ec:	04f12623          	sw	a5,76(sp)
    d9f0:	f18f80ef          	jal	6108 <memset>
    d9f4:	02412683          	lw	a3,36(sp)
    d9f8:	01c12883          	lw	a7,28(sp)
    d9fc:	3606ce63          	bltz	a3,dd78 <_vfiprintf_r+0x15b4>
    da00:	03412223          	sw	s4,36(sp)
    da04:	00000b13          	li	s6,0
    da08:	fff00c93          	li	s9,-1
    da0c:	00000a13          	li	s4,0
    da10:	00068c13          	mv	s8,a3
    da14:	02c0006f          	j	da40 <_vfiprintf_r+0x127c>
    da18:	05810693          	addi	a3,sp,88
    da1c:	0ac10593          	addi	a1,sp,172
    da20:	00040513          	mv	a0,s0
    da24:	f1dfd0ef          	jal	b940 <_wcrtomb_r>
    da28:	2b950263          	beq	a0,s9,dccc <_vfiprintf_r+0x1508>
    da2c:	00aa07b3          	add	a5,s4,a0
    da30:	02fc4063          	blt	s8,a5,da50 <_vfiprintf_r+0x128c>
    da34:	004b0b13          	addi	s6,s6,4
    da38:	57878063          	beq	a5,s8,df98 <_vfiprintf_r+0x17d4>
    da3c:	00078a13          	mv	s4,a5
    da40:	04c12783          	lw	a5,76(sp)
    da44:	016787b3          	add	a5,a5,s6
    da48:	0007a603          	lw	a2,0(a5)
    da4c:	fc0616e3          	bnez	a2,da18 <_vfiprintf_r+0x1254>
    da50:	000a0693          	mv	a3,s4
    da54:	01c12883          	lw	a7,28(sp)
    da58:	02012303          	lw	t1,32(sp)
    da5c:	02412a03          	lw	s4,36(sp)
    da60:	36068263          	beqz	a3,ddc4 <_vfiprintf_r+0x1600>
    da64:	06300713          	li	a4,99
    da68:	40d74463          	blt	a4,a3,de70 <_vfiprintf_r+0x16ac>
    da6c:	00012a23          	sw	zero,20(sp)
    da70:	0ac10e13          	addi	t3,sp,172
    da74:	00800613          	li	a2,8
    da78:	00000593          	li	a1,0
    da7c:	05810513          	addi	a0,sp,88
    da80:	02612823          	sw	t1,48(sp)
    da84:	01c12e23          	sw	t3,28(sp)
    da88:	03112223          	sw	a7,36(sp)
    da8c:	02d12023          	sw	a3,32(sp)
    da90:	e78f80ef          	jal	6108 <memset>
    da94:	02012683          	lw	a3,32(sp)
    da98:	01c12583          	lw	a1,28(sp)
    da9c:	05810713          	addi	a4,sp,88
    daa0:	04c10613          	addi	a2,sp,76
    daa4:	00040513          	mv	a0,s0
    daa8:	fc5fd0ef          	jal	ba6c <_wcsrtombs_r>
    daac:	02012683          	lw	a3,32(sp)
    dab0:	01c12e03          	lw	t3,28(sp)
    dab4:	02412883          	lw	a7,36(sp)
    dab8:	03012303          	lw	t1,48(sp)
    dabc:	56a69663          	bne	a3,a0,e028 <_vfiprintf_r+0x1864>
    dac0:	00de0733          	add	a4,t3,a3
    dac4:	00070023          	sb	zero,0(a4)
    dac8:	04314703          	lbu	a4,67(sp)
    dacc:	fff6cc93          	not	s9,a3
    dad0:	41fcdc93          	srai	s9,s9,0x1f
    dad4:	0196fcb3          	and	s9,a3,s9
    dad8:	00068e93          	mv	t4,a3
    dadc:	44070e63          	beqz	a4,df38 <_vfiprintf_r+0x1774>
    dae0:	001c8c93          	addi	s9,s9,1
    dae4:	00000693          	li	a3,0
    dae8:	adcff06f          	j	cdc4 <_vfiprintf_r+0x600>
    daec:	20037593          	andi	a1,t1,512
    daf0:	040101a3          	sb	zero,67(sp)
    daf4:	30058063          	beqz	a1,ddf4 <_vfiprintf_r+0x1630>
    daf8:	0ff77713          	zext.b	a4,a4
    dafc:	00000b13          	li	s6,0
    db00:	d606d463          	bgez	a3,d068 <_vfiprintf_r+0x8a4>
    db04:	00060d13          	mv	s10,a2
    db08:	c60b0263          	beqz	s6,cf6c <_vfiprintf_r+0x7a8>
    db0c:	40037793          	andi	a5,t1,1024
    db10:	03412a23          	sw	s4,52(sp)
    db14:	000b0c13          	mv	s8,s6
    db18:	00f12a23          	sw	a5,20(sp)
    db1c:	00000c93          	li	s9,0
    db20:	03112023          	sw	a7,32(sp)
    db24:	02612223          	sw	t1,36(sp)
    db28:	02d12823          	sw	a3,48(sp)
    db2c:	11010a13          	addi	s4,sp,272
    db30:	03a12c23          	sw	s10,56(sp)
    db34:	00070b13          	mv	s6,a4
    db38:	02812e23          	sw	s0,60(sp)
    db3c:	0300006f          	j	db6c <_vfiprintf_r+0x13a8>
    db40:	000b0513          	mv	a0,s6
    db44:	000c0593          	mv	a1,s8
    db48:	00a00613          	li	a2,10
    db4c:	00000693          	li	a3,0
    db50:	01612e23          	sw	s6,28(sp)
    db54:	000c0d13          	mv	s10,s8
    db58:	35d000ef          	jal	e6b4 <__udivdi3>
    db5c:	00040a13          	mv	s4,s0
    db60:	00050b13          	mv	s6,a0
    db64:	00058c13          	mv	s8,a1
    db68:	3a0d0a63          	beqz	s10,df1c <_vfiprintf_r+0x1758>
    db6c:	00000693          	li	a3,0
    db70:	00a00613          	li	a2,10
    db74:	000b0513          	mv	a0,s6
    db78:	000c0593          	mv	a1,s8
    db7c:	1e0010ef          	jal	ed5c <__umoddi3>
    db80:	01412783          	lw	a5,20(sp)
    db84:	03050693          	addi	a3,a0,48
    db88:	feda0fa3          	sb	a3,-1(s4)
    db8c:	fffa0413          	addi	s0,s4,-1
    db90:	001c8c93          	addi	s9,s9,1
    db94:	fa0786e3          	beqz	a5,db40 <_vfiprintf_r+0x137c>
    db98:	01812783          	lw	a5,24(sp)
    db9c:	0007c783          	lbu	a5,0(a5)
    dba0:	fb9790e3          	bne	a5,s9,db40 <_vfiprintf_r+0x137c>
    dba4:	f0178793          	addi	a5,a5,-255
    dba8:	f8078ce3          	beqz	a5,db40 <_vfiprintf_r+0x137c>
    dbac:	300c1263          	bnez	s8,deb0 <_vfiprintf_r+0x16ec>
    dbb0:	00900793          	li	a5,9
    dbb4:	2f67ee63          	bltu	a5,s6,deb0 <_vfiprintf_r+0x16ec>
    dbb8:	03012683          	lw	a3,48(sp)
    dbbc:	00040e13          	mv	t3,s0
    dbc0:	11010793          	addi	a5,sp,272
    dbc4:	41c78eb3          	sub	t4,a5,t3
    dbc8:	02012883          	lw	a7,32(sp)
    dbcc:	02412303          	lw	t1,36(sp)
    dbd0:	03412a03          	lw	s4,52(sp)
    dbd4:	03812d03          	lw	s10,56(sp)
    dbd8:	03c12403          	lw	s0,60(sp)
    dbdc:	04314703          	lbu	a4,67(sp)
    dbe0:	00068c93          	mv	s9,a3
    dbe4:	01d6d463          	bge	a3,t4,dbec <_vfiprintf_r+0x1428>
    dbe8:	000e8c93          	mv	s9,t4
    dbec:	00e03733          	snez	a4,a4
    dbf0:	00ec8cb3          	add	s9,s9,a4
    dbf4:	d99ff06f          	j	d98c <_vfiprintf_r+0x11c8>
    dbf8:	01037593          	andi	a1,t1,16
    dbfc:	000d2703          	lw	a4,0(s10)
    dc00:	004d0d13          	addi	s10,s10,4
    dc04:	02059263          	bnez	a1,dc28 <_vfiprintf_r+0x1464>
    dc08:	04037593          	andi	a1,t1,64
    dc0c:	00058a63          	beqz	a1,dc20 <_vfiprintf_r+0x145c>
    dc10:	01071713          	slli	a4,a4,0x10
    dc14:	01075713          	srli	a4,a4,0x10
    dc18:	00000593          	li	a1,0
    dc1c:	d45ff06f          	j	d960 <_vfiprintf_r+0x119c>
    dc20:	20037593          	andi	a1,t1,512
    dc24:	1e059063          	bnez	a1,de04 <_vfiprintf_r+0x1640>
    dc28:	00000593          	li	a1,0
    dc2c:	d35ff06f          	j	d960 <_vfiprintf_r+0x119c>
    dc30:	bff37313          	andi	t1,t1,-1025
    dc34:	00000f13          	li	t5,0
    dc38:	c41ff06f          	j	d878 <_vfiprintf_r+0x10b4>
    dc3c:	00c12583          	lw	a1,12(sp)
    dc40:	06010613          	addi	a2,sp,96
    dc44:	00040513          	mv	a0,s0
    dc48:	03d12c23          	sw	t4,56(sp)
    dc4c:	02d12a23          	sw	a3,52(sp)
    dc50:	02612823          	sw	t1,48(sp)
    dc54:	03c12223          	sw	t3,36(sp)
    dc58:	03e12023          	sw	t5,32(sp)
    dc5c:	01112e23          	sw	a7,28(sp)
    dc60:	8acf60ef          	jal	3d0c <__sprint_r>
    dc64:	00050f93          	mv	t6,a0
    dc68:	8e0512e3          	bnez	a0,d54c <_vfiprintf_r+0xd88>
    dc6c:	04314783          	lbu	a5,67(sp)
    dc70:	06812603          	lw	a2,104(sp)
    dc74:	06412703          	lw	a4,100(sp)
    dc78:	01c12883          	lw	a7,28(sp)
    dc7c:	02012f03          	lw	t5,32(sp)
    dc80:	02412e03          	lw	t3,36(sp)
    dc84:	03012303          	lw	t1,48(sp)
    dc88:	03412683          	lw	a3,52(sp)
    dc8c:	03812e83          	lw	t4,56(sp)
    dc90:	000a8d93          	mv	s11,s5
    dc94:	00078463          	beqz	a5,dc9c <_vfiprintf_r+0x14d8>
    dc98:	d49fe06f          	j	c9e0 <_vfiprintf_r+0x21c>
    dc9c:	000f0463          	beqz	t5,dca4 <_vfiprintf_r+0x14e0>
    dca0:	d71fe06f          	j	ca10 <_vfiprintf_r+0x24c>
    dca4:	da1fe06f          	j	ca44 <_vfiprintf_r+0x280>
    dca8:	04c102a3          	sb	a2,69(sp)
    dcac:	03000613          	li	a2,48
    dcb0:	040101a3          	sb	zero,67(sp)
    dcb4:	04c10223          	sb	a2,68(sp)
    dcb8:	0e06ce63          	bltz	a3,ddb4 <_vfiprintf_r+0x15f0>
    dcbc:	b7f37313          	andi	t1,t1,-1153
    dcc0:	00236313          	ori	t1,t1,2
    dcc4:	00200f13          	li	t5,2
    dcc8:	bb1ff06f          	j	d878 <_vfiprintf_r+0x10b4>
    dccc:	00c12a03          	lw	s4,12(sp)
    dcd0:	00ca1783          	lh	a5,12(s4)
    dcd4:	064a2703          	lw	a4,100(s4)
    dcd8:	0407e693          	ori	a3,a5,64
    dcdc:	00da1623          	sh	a3,12(s4)
    dce0:	00177713          	andi	a4,a4,1
    dce4:	28071463          	bnez	a4,df6c <_vfiprintf_r+0x17a8>
    dce8:	2007f793          	andi	a5,a5,512
    dcec:	28079063          	bnez	a5,df6c <_vfiprintf_r+0x17a8>
    dcf0:	058a2503          	lw	a0,88(s4)
    dcf4:	975f20ef          	jal	668 <__retarget_lock_release_recursive>
    dcf8:	00ca1783          	lh	a5,12(s4)
    dcfc:	881ff06f          	j	d57c <_vfiprintf_r+0xdb8>
    dd00:	00040513          	mv	a0,s0
    dd04:	849f60ef          	jal	454c <__sinit>
    dd08:	b05fe06f          	j	c80c <_vfiprintf_r+0x48>
    dd0c:	000d2703          	lw	a4,0(s10)
    dd10:	01012783          	lw	a5,16(sp)
    dd14:	00068d13          	mv	s10,a3
    dd18:	00f72023          	sw	a5,0(a4)
    dd1c:	bb5fe06f          	j	c8d0 <_vfiprintf_r+0x10c>
    dd20:	00600713          	li	a4,6
    dd24:	00068c93          	mv	s9,a3
    dd28:	0ad76863          	bltu	a4,a3,ddd8 <_vfiprintf_r+0x1614>
    dd2c:	000c8e93          	mv	t4,s9
    dd30:	00000693          	li	a3,0
    dd34:	00005e17          	auipc	t3,0x5
    dd38:	b94e0e13          	addi	t3,t3,-1132 # 128c8 <__clzsi2+0x100>
    dd3c:	c75fe06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    dd40:	200cf593          	andi	a1,s9,512
    dd44:	0c058e63          	beqz	a1,de20 <_vfiprintf_r+0x165c>
    dd48:	0ff77713          	zext.b	a4,a4
    dd4c:	00060d13          	mv	s10,a2
    dd50:	00000593          	li	a1,0
    dd54:	a9cff06f          	j	cff0 <_vfiprintf_r+0x82c>
    dd58:	200cf593          	andi	a1,s9,512
    dd5c:	0a058a63          	beqz	a1,de10 <_vfiprintf_r+0x164c>
    dd60:	01871713          	slli	a4,a4,0x18
    dd64:	41875713          	srai	a4,a4,0x18
    dd68:	41f75b13          	srai	s6,a4,0x1f
    dd6c:	00060d13          	mv	s10,a2
    dd70:	000b0613          	mv	a2,s6
    dd74:	81cff06f          	j	cd90 <_vfiprintf_r+0x5cc>
    dd78:	05810713          	addi	a4,sp,88
    dd7c:	00000693          	li	a3,0
    dd80:	04c10613          	addi	a2,sp,76
    dd84:	00000593          	li	a1,0
    dd88:	00040513          	mv	a0,s0
    dd8c:	01112e23          	sw	a7,28(sp)
    dd90:	cddfd0ef          	jal	ba6c <_wcsrtombs_r>
    dd94:	fff00713          	li	a4,-1
    dd98:	01c12883          	lw	a7,28(sp)
    dd9c:	02012303          	lw	t1,32(sp)
    dda0:	00050693          	mv	a3,a0
    dda4:	f2e504e3          	beq	a0,a4,dccc <_vfiprintf_r+0x1508>
    dda8:	01412783          	lw	a5,20(sp)
    ddac:	04f12623          	sw	a5,76(sp)
    ddb0:	cb1ff06f          	j	da60 <_vfiprintf_r+0x129c>
    ddb4:	bff37313          	andi	t1,t1,-1025
    ddb8:	00236313          	ori	t1,t1,2
    ddbc:	00200f13          	li	t5,2
    ddc0:	ab9ff06f          	j	d878 <_vfiprintf_r+0x10b4>
    ddc4:	04314c83          	lbu	s9,67(sp)
    ddc8:	01412e03          	lw	t3,20(sp)
    ddcc:	00000e93          	li	t4,0
    ddd0:	01903cb3          	snez	s9,s9
    ddd4:	bb9ff06f          	j	d98c <_vfiprintf_r+0x11c8>
    ddd8:	00070c93          	mv	s9,a4
    dddc:	f51ff06f          	j	dd2c <_vfiprintf_r+0x1568>
    dde0:	000d2703          	lw	a4,0(s10)
    dde4:	01012783          	lw	a5,16(sp)
    dde8:	00068d13          	mv	s10,a3
    ddec:	00f71023          	sh	a5,0(a4)
    ddf0:	ae1fe06f          	j	c8d0 <_vfiprintf_r+0x10c>
    ddf4:	00000b13          	li	s6,0
    ddf8:	00060d13          	mv	s10,a2
    ddfc:	a606d663          	bgez	a3,d068 <_vfiprintf_r+0x8a4>
    de00:	96cff06f          	j	cf6c <_vfiprintf_r+0x7a8>
    de04:	0ff77713          	zext.b	a4,a4
    de08:	00000593          	li	a1,0
    de0c:	b55ff06f          	j	d960 <_vfiprintf_r+0x119c>
    de10:	41f75b13          	srai	s6,a4,0x1f
    de14:	00060d13          	mv	s10,a2
    de18:	000b0613          	mv	a2,s6
    de1c:	f75fe06f          	j	cd90 <_vfiprintf_r+0x5cc>
    de20:	00060d13          	mv	s10,a2
    de24:	9ccff06f          	j	cff0 <_vfiprintf_r+0x82c>
    de28:	01612e23          	sw	s6,28(sp)
    de2c:	01412b03          	lw	s6,20(sp)
    de30:	03912023          	sw	s9,32(sp)
    de34:	000b0513          	mv	a0,s6
    de38:	835f20ef          	jal	66c <strlen>
    de3c:	04314703          	lbu	a4,67(sp)
    de40:	fff54c93          	not	s9,a0
    de44:	41fcdc93          	srai	s9,s9,0x1f
    de48:	01c12883          	lw	a7,28(sp)
    de4c:	02012303          	lw	t1,32(sp)
    de50:	00050e93          	mv	t4,a0
    de54:	01957cb3          	and	s9,a0,s9
    de58:	0e070463          	beqz	a4,df40 <_vfiprintf_r+0x177c>
    de5c:	000b0e13          	mv	t3,s6
    de60:	001c8c93          	addi	s9,s9,1
    de64:	00000693          	li	a3,0
    de68:	00012a23          	sw	zero,20(sp)
    de6c:	f59fe06f          	j	cdc4 <_vfiprintf_r+0x600>
    de70:	00168593          	addi	a1,a3,1
    de74:	00040513          	mv	a0,s0
    de78:	02612023          	sw	t1,32(sp)
    de7c:	01112e23          	sw	a7,28(sp)
    de80:	00d12a23          	sw	a3,20(sp)
    de84:	885fa0ef          	jal	8708 <_malloc_r>
    de88:	01412683          	lw	a3,20(sp)
    de8c:	01c12883          	lw	a7,28(sp)
    de90:	02012303          	lw	t1,32(sp)
    de94:	00050e13          	mv	t3,a0
    de98:	e2050ae3          	beqz	a0,dccc <_vfiprintf_r+0x1508>
    de9c:	00a12a23          	sw	a0,20(sp)
    dea0:	bd5ff06f          	j	da74 <_vfiprintf_r+0x12b0>
    dea4:	058a2503          	lw	a0,88(s4)
    dea8:	fc0f20ef          	jal	668 <__retarget_lock_release_recursive>
    deac:	c51fe06f          	j	cafc <_vfiprintf_r+0x338>
    deb0:	02812783          	lw	a5,40(sp)
    deb4:	02c12583          	lw	a1,44(sp)
    deb8:	00100c93          	li	s9,1
    debc:	40f40a33          	sub	s4,s0,a5
    dec0:	00078613          	mv	a2,a5
    dec4:	000a0513          	mv	a0,s4
    dec8:	850f70ef          	jal	4f18 <strncpy>
    decc:	01812783          	lw	a5,24(sp)
    ded0:	01812703          	lw	a4,24(sp)
    ded4:	000b0513          	mv	a0,s6
    ded8:	0017c783          	lbu	a5,1(a5)
    dedc:	000c0593          	mv	a1,s8
    dee0:	00a00613          	li	a2,10
    dee4:	00f037b3          	snez	a5,a5
    dee8:	00f707b3          	add	a5,a4,a5
    deec:	00000693          	li	a3,0
    def0:	00f12c23          	sw	a5,24(sp)
    def4:	7c0000ef          	jal	e6b4 <__udivdi3>
    def8:	00a00613          	li	a2,10
    defc:	00000693          	li	a3,0
    df00:	00050b13          	mv	s6,a0
    df04:	00058c13          	mv	s8,a1
    df08:	655000ef          	jal	ed5c <__umoddi3>
    df0c:	03050793          	addi	a5,a0,48
    df10:	fffa0413          	addi	s0,s4,-1
    df14:	fefa0fa3          	sb	a5,-1(s4)
    df18:	c81ff06f          	j	db98 <_vfiprintf_r+0x13d4>
    df1c:	01c12783          	lw	a5,28(sp)
    df20:	00900693          	li	a3,9
    df24:	c4f6e4e3          	bltu	a3,a5,db6c <_vfiprintf_r+0x13a8>
    df28:	c91ff06f          	j	dbb8 <_vfiprintf_r+0x13f4>
    df2c:	00068e93          	mv	t4,a3
    df30:	00068c93          	mv	s9,a3
    df34:	00012a23          	sw	zero,20(sp)
    df38:	00000693          	li	a3,0
    df3c:	a75fe06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    df40:	01412e03          	lw	t3,20(sp)
    df44:	00000693          	li	a3,0
    df48:	00012a23          	sw	zero,20(sp)
    df4c:	a65fe06f          	j	c9b0 <_vfiprintf_r+0x1ec>
    df50:	00040513          	mv	a0,s0
    df54:	06010613          	addi	a2,sp,96
    df58:	000a0593          	mv	a1,s4
    df5c:	db1f50ef          	jal	3d0c <__sprint_r>
    df60:	00051463          	bnez	a0,df68 <_vfiprintf_r+0x17a4>
    df64:	c59fe06f          	j	cbbc <_vfiprintf_r+0x3f8>
    df68:	dfcff06f          	j	d564 <_vfiprintf_r+0xda0>
    df6c:	14412483          	lw	s1,324(sp)
    df70:	14012903          	lw	s2,320(sp)
    df74:	13c12983          	lw	s3,316(sp)
    df78:	13412a83          	lw	s5,308(sp)
    df7c:	12c12b83          	lw	s7,300(sp)
    df80:	12812c03          	lw	s8,296(sp)
    df84:	12412c83          	lw	s9,292(sp)
    df88:	11c12d83          	lw	s11,284(sp)
    df8c:	fff00793          	li	a5,-1
    df90:	00f12823          	sw	a5,16(sp)
    df94:	e10ff06f          	j	d5a4 <_vfiprintf_r+0xde0>
    df98:	01c12883          	lw	a7,28(sp)
    df9c:	02012303          	lw	t1,32(sp)
    dfa0:	02412a03          	lw	s4,36(sp)
    dfa4:	000c0693          	mv	a3,s8
    dfa8:	ab9ff06f          	j	da60 <_vfiprintf_r+0x129c>
    dfac:	01412e03          	lw	t3,20(sp)
    dfb0:	f6070ee3          	beqz	a4,df2c <_vfiprintf_r+0x1768>
    dfb4:	00168c93          	addi	s9,a3,1
    dfb8:	00068e93          	mv	t4,a3
    dfbc:	00012a23          	sw	zero,20(sp)
    dfc0:	00000693          	li	a3,0
    dfc4:	e01fe06f          	j	cdc4 <_vfiprintf_r+0x600>
    dfc8:	00c12a03          	lw	s4,12(sp)
    dfcc:	d98ff06f          	j	d564 <_vfiprintf_r+0xda0>
    dfd0:	00000f13          	li	t5,0
    dfd4:	8a5ff06f          	j	d878 <_vfiprintf_r+0x10b4>
    dfd8:	00177713          	andi	a4,a4,1
    dfdc:	fa0718e3          	bnez	a4,df8c <_vfiprintf_r+0x17c8>
    dfe0:	c21fe06f          	j	cc00 <_vfiprintf_r+0x43c>
    dfe4:	00200f13          	li	t5,2
    dfe8:	00005517          	auipc	a0,0x5
    dfec:	8b850513          	addi	a0,a0,-1864 # 128a0 <__clzsi2+0xd8>
    dff0:	889ff06f          	j	d878 <_vfiprintf_r+0x10b4>
    dff4:	064a2783          	lw	a5,100(s4)
    dff8:	0017f793          	andi	a5,a5,1
    dffc:	f80798e3          	bnez	a5,df8c <_vfiprintf_r+0x17c8>
    e000:	c01fe06f          	j	cc00 <_vfiprintf_r+0x43c>
    e004:	000d2683          	lw	a3,0(s10)
    e008:	004d0d13          	addi	s10,s10,4
    e00c:	0006d463          	bgez	a3,e014 <_vfiprintf_r+0x1850>
    e010:	fff00693          	li	a3,-1
    e014:	001a4603          	lbu	a2,1(s4)
    e018:	00058a13          	mv	s4,a1
    e01c:	919fe06f          	j	c934 <_vfiprintf_r+0x170>
    e020:	00012a23          	sw	zero,20(sp)
    e024:	9a5fe06f          	j	c9c8 <_vfiprintf_r+0x204>
    e028:	00c12a03          	lw	s4,12(sp)
    e02c:	01412c03          	lw	s8,20(sp)
    e030:	00ca5783          	lhu	a5,12(s4)
    e034:	0407e793          	ori	a5,a5,64
    e038:	00fa1623          	sh	a5,12(s4)
    e03c:	d18ff06f          	j	d554 <_vfiprintf_r+0xd90>

0000e040 <vfiprintf>:
    e040:	00050713          	mv	a4,a0
    e044:	0fff2517          	auipc	a0,0xfff2
    e048:	78452503          	lw	a0,1924(a0) # 100007c8 <_impure_ptr>
    e04c:	00060693          	mv	a3,a2
    e050:	00058613          	mv	a2,a1
    e054:	00070593          	mv	a1,a4
    e058:	f6cfe06f          	j	c7c4 <_vfiprintf_r>

0000e05c <__sbprintf>:
    e05c:	00c5d783          	lhu	a5,12(a1)
    e060:	0645ae03          	lw	t3,100(a1)
    e064:	00e5d303          	lhu	t1,14(a1)
    e068:	01c5a883          	lw	a7,28(a1)
    e06c:	0245a803          	lw	a6,36(a1)
    e070:	b7010113          	addi	sp,sp,-1168
    e074:	40000713          	li	a4,1024
    e078:	ffd7f793          	andi	a5,a5,-3
    e07c:	48812423          	sw	s0,1160(sp)
    e080:	49212023          	sw	s2,1152(sp)
    e084:	00058413          	mv	s0,a1
    e088:	00050913          	mv	s2,a0
    e08c:	08010593          	addi	a1,sp,128
    e090:	07010513          	addi	a0,sp,112
    e094:	48112623          	sw	ra,1164(sp)
    e098:	48912223          	sw	s1,1156(sp)
    e09c:	00d12623          	sw	a3,12(sp)
    e0a0:	00060493          	mv	s1,a2
    e0a4:	02f11223          	sh	a5,36(sp)
    e0a8:	07c12e23          	sw	t3,124(sp)
    e0ac:	02611323          	sh	t1,38(sp)
    e0b0:	03112a23          	sw	a7,52(sp)
    e0b4:	03012e23          	sw	a6,60(sp)
    e0b8:	00b12c23          	sw	a1,24(sp)
    e0bc:	02b12423          	sw	a1,40(sp)
    e0c0:	02e12023          	sw	a4,32(sp)
    e0c4:	02e12623          	sw	a4,44(sp)
    e0c8:	02012823          	sw	zero,48(sp)
    e0cc:	d74f20ef          	jal	640 <__retarget_lock_init_recursive>
    e0d0:	00c12683          	lw	a3,12(sp)
    e0d4:	00048613          	mv	a2,s1
    e0d8:	01810593          	addi	a1,sp,24
    e0dc:	00090513          	mv	a0,s2
    e0e0:	ee4fe0ef          	jal	c7c4 <_vfiprintf_r>
    e0e4:	00050493          	mv	s1,a0
    e0e8:	04055063          	bgez	a0,e128 <__sbprintf+0xcc>
    e0ec:	02415783          	lhu	a5,36(sp)
    e0f0:	0407f793          	andi	a5,a5,64
    e0f4:	00078863          	beqz	a5,e104 <__sbprintf+0xa8>
    e0f8:	00c45783          	lhu	a5,12(s0)
    e0fc:	0407e793          	ori	a5,a5,64
    e100:	00f41623          	sh	a5,12(s0)
    e104:	07012503          	lw	a0,112(sp)
    e108:	d40f20ef          	jal	648 <__retarget_lock_close_recursive>
    e10c:	48c12083          	lw	ra,1164(sp)
    e110:	48812403          	lw	s0,1160(sp)
    e114:	48012903          	lw	s2,1152(sp)
    e118:	00048513          	mv	a0,s1
    e11c:	48412483          	lw	s1,1156(sp)
    e120:	49010113          	addi	sp,sp,1168
    e124:	00008067          	ret
    e128:	01810593          	addi	a1,sp,24
    e12c:	00090513          	mv	a0,s2
    e130:	e75f50ef          	jal	3fa4 <_fflush_r>
    e134:	fa050ce3          	beqz	a0,e0ec <__sbprintf+0x90>
    e138:	fff00493          	li	s1,-1
    e13c:	fb1ff06f          	j	e0ec <__sbprintf+0x90>

0000e140 <abort>:
    e140:	ff010113          	addi	sp,sp,-16
    e144:	00600513          	li	a0,6
    e148:	00112623          	sw	ra,12(sp)
    e14c:	274000ef          	jal	e3c0 <raise>
    e150:	00100513          	li	a0,1
    e154:	ac0f20ef          	jal	414 <_exit>

0000e158 <_init_signal_r>:
    e158:	13852703          	lw	a4,312(a0)
    e15c:	00070663          	beqz	a4,e168 <_init_signal_r+0x10>
    e160:	00000513          	li	a0,0
    e164:	00008067          	ret
    e168:	fe010113          	addi	sp,sp,-32
    e16c:	08000593          	li	a1,128
    e170:	00112e23          	sw	ra,28(sp)
    e174:	00a12623          	sw	a0,12(sp)
    e178:	d90fa0ef          	jal	8708 <_malloc_r>
    e17c:	00c12783          	lw	a5,12(sp)
    e180:	12a7ac23          	sw	a0,312(a5)
    e184:	02050263          	beqz	a0,e1a8 <_init_signal_r+0x50>
    e188:	08050793          	addi	a5,a0,128
    e18c:	00052023          	sw	zero,0(a0)
    e190:	00450513          	addi	a0,a0,4
    e194:	fef51ce3          	bne	a0,a5,e18c <_init_signal_r+0x34>
    e198:	00000513          	li	a0,0
    e19c:	01c12083          	lw	ra,28(sp)
    e1a0:	02010113          	addi	sp,sp,32
    e1a4:	00008067          	ret
    e1a8:	fff00513          	li	a0,-1
    e1ac:	ff1ff06f          	j	e19c <_init_signal_r+0x44>

0000e1b0 <_signal_r>:
    e1b0:	01f00713          	li	a4,31
    e1b4:	02b76063          	bltu	a4,a1,e1d4 <_signal_r+0x24>
    e1b8:	13852703          	lw	a4,312(a0)
    e1bc:	02070463          	beqz	a4,e1e4 <_signal_r+0x34>
    e1c0:	00259593          	slli	a1,a1,0x2
    e1c4:	00b70733          	add	a4,a4,a1
    e1c8:	00072503          	lw	a0,0(a4)
    e1cc:	00c72023          	sw	a2,0(a4)
    e1d0:	00008067          	ret
    e1d4:	01600713          	li	a4,22
    e1d8:	00e52023          	sw	a4,0(a0)
    e1dc:	fff00513          	li	a0,-1
    e1e0:	00008067          	ret
    e1e4:	fe010113          	addi	sp,sp,-32
    e1e8:	00b12223          	sw	a1,4(sp)
    e1ec:	08000593          	li	a1,128
    e1f0:	00c12423          	sw	a2,8(sp)
    e1f4:	00112e23          	sw	ra,28(sp)
    e1f8:	00a12623          	sw	a0,12(sp)
    e1fc:	d0cfa0ef          	jal	8708 <_malloc_r>
    e200:	00c12683          	lw	a3,12(sp)
    e204:	00050713          	mv	a4,a0
    e208:	08050593          	addi	a1,a0,128
    e20c:	12a6ac23          	sw	a0,312(a3)
    e210:	00412783          	lw	a5,4(sp)
    e214:	00050693          	mv	a3,a0
    e218:	00812603          	lw	a2,8(sp)
    e21c:	fff00513          	li	a0,-1
    e220:	02070063          	beqz	a4,e240 <_signal_r+0x90>
    e224:	0006a023          	sw	zero,0(a3)
    e228:	00468693          	addi	a3,a3,4
    e22c:	feb69ce3          	bne	a3,a1,e224 <_signal_r+0x74>
    e230:	00279593          	slli	a1,a5,0x2
    e234:	00b70733          	add	a4,a4,a1
    e238:	00072503          	lw	a0,0(a4)
    e23c:	00c72023          	sw	a2,0(a4)
    e240:	01c12083          	lw	ra,28(sp)
    e244:	02010113          	addi	sp,sp,32
    e248:	00008067          	ret

0000e24c <_raise_r>:
    e24c:	01f00793          	li	a5,31
    e250:	08b7ea63          	bltu	a5,a1,e2e4 <_raise_r+0x98>
    e254:	13852783          	lw	a5,312(a0)
    e258:	fe010113          	addi	sp,sp,-32
    e25c:	00112e23          	sw	ra,28(sp)
    e260:	00050713          	mv	a4,a0
    e264:	00058613          	mv	a2,a1
    e268:	04078063          	beqz	a5,e2a8 <_raise_r+0x5c>
    e26c:	00259693          	slli	a3,a1,0x2
    e270:	00d787b3          	add	a5,a5,a3
    e274:	0007a683          	lw	a3,0(a5)
    e278:	02068863          	beqz	a3,e2a8 <_raise_r+0x5c>
    e27c:	00100513          	li	a0,1
    e280:	00a68c63          	beq	a3,a0,e298 <_raise_r+0x4c>
    e284:	fff00593          	li	a1,-1
    e288:	04b68463          	beq	a3,a1,e2d0 <_raise_r+0x84>
    e28c:	0007a023          	sw	zero,0(a5)
    e290:	00060513          	mv	a0,a2
    e294:	000680e7          	jalr	a3
    e298:	01c12083          	lw	ra,28(sp)
    e29c:	00000513          	li	a0,0
    e2a0:	02010113          	addi	sp,sp,32
    e2a4:	00008067          	ret
    e2a8:	00070513          	mv	a0,a4
    e2ac:	00c12623          	sw	a2,12(sp)
    e2b0:	00e12423          	sw	a4,8(sp)
    e2b4:	3fc000ef          	jal	e6b0 <_getpid_r>
    e2b8:	00c12603          	lw	a2,12(sp)
    e2bc:	01c12083          	lw	ra,28(sp)
    e2c0:	00050593          	mv	a1,a0
    e2c4:	00812503          	lw	a0,8(sp)
    e2c8:	02010113          	addi	sp,sp,32
    e2cc:	3840006f          	j	e650 <_kill_r>
    e2d0:	01c12083          	lw	ra,28(sp)
    e2d4:	01600793          	li	a5,22
    e2d8:	00f72023          	sw	a5,0(a4)
    e2dc:	02010113          	addi	sp,sp,32
    e2e0:	00008067          	ret
    e2e4:	01600793          	li	a5,22
    e2e8:	00f52023          	sw	a5,0(a0)
    e2ec:	fff00513          	li	a0,-1
    e2f0:	00008067          	ret

0000e2f4 <__sigtramp_r>:
    e2f4:	01f00793          	li	a5,31
    e2f8:	0cb7e063          	bltu	a5,a1,e3b8 <__sigtramp_r+0xc4>
    e2fc:	13852783          	lw	a5,312(a0)
    e300:	fe010113          	addi	sp,sp,-32
    e304:	00112e23          	sw	ra,28(sp)
    e308:	00058713          	mv	a4,a1
    e30c:	06078463          	beqz	a5,e374 <__sigtramp_r+0x80>
    e310:	00271693          	slli	a3,a4,0x2
    e314:	00d787b3          	add	a5,a5,a3
    e318:	0007a683          	lw	a3,0(a5)
    e31c:	02068863          	beqz	a3,e34c <__sigtramp_r+0x58>
    e320:	fff00613          	li	a2,-1
    e324:	04c68463          	beq	a3,a2,e36c <__sigtramp_r+0x78>
    e328:	00100613          	li	a2,1
    e32c:	02c68863          	beq	a3,a2,e35c <__sigtramp_r+0x68>
    e330:	00070513          	mv	a0,a4
    e334:	0007a023          	sw	zero,0(a5)
    e338:	000680e7          	jalr	a3
    e33c:	00000513          	li	a0,0
    e340:	01c12083          	lw	ra,28(sp)
    e344:	02010113          	addi	sp,sp,32
    e348:	00008067          	ret
    e34c:	01c12083          	lw	ra,28(sp)
    e350:	00100513          	li	a0,1
    e354:	02010113          	addi	sp,sp,32
    e358:	00008067          	ret
    e35c:	01c12083          	lw	ra,28(sp)
    e360:	00300513          	li	a0,3
    e364:	02010113          	addi	sp,sp,32
    e368:	00008067          	ret
    e36c:	00200513          	li	a0,2
    e370:	fd1ff06f          	j	e340 <__sigtramp_r+0x4c>
    e374:	00b12623          	sw	a1,12(sp)
    e378:	08000593          	li	a1,128
    e37c:	00a12423          	sw	a0,8(sp)
    e380:	b88fa0ef          	jal	8708 <_malloc_r>
    e384:	00812683          	lw	a3,8(sp)
    e388:	00050793          	mv	a5,a0
    e38c:	12a6ac23          	sw	a0,312(a3)
    e390:	02050063          	beqz	a0,e3b0 <__sigtramp_r+0xbc>
    e394:	00c12703          	lw	a4,12(sp)
    e398:	00050693          	mv	a3,a0
    e39c:	08050613          	addi	a2,a0,128
    e3a0:	0006a023          	sw	zero,0(a3)
    e3a4:	00468693          	addi	a3,a3,4
    e3a8:	fec69ce3          	bne	a3,a2,e3a0 <__sigtramp_r+0xac>
    e3ac:	f65ff06f          	j	e310 <__sigtramp_r+0x1c>
    e3b0:	fff00513          	li	a0,-1
    e3b4:	f8dff06f          	j	e340 <__sigtramp_r+0x4c>
    e3b8:	fff00513          	li	a0,-1
    e3bc:	00008067          	ret

0000e3c0 <raise>:
    e3c0:	01f00793          	li	a5,31
    e3c4:	0fff2817          	auipc	a6,0xfff2
    e3c8:	40482803          	lw	a6,1028(a6) # 100007c8 <_impure_ptr>
    e3cc:	08a7e863          	bltu	a5,a0,e45c <raise+0x9c>
    e3d0:	13882783          	lw	a5,312(a6)
    e3d4:	fe010113          	addi	sp,sp,-32
    e3d8:	00112e23          	sw	ra,28(sp)
    e3dc:	00050613          	mv	a2,a0
    e3e0:	02078e63          	beqz	a5,e41c <raise+0x5c>
    e3e4:	00251713          	slli	a4,a0,0x2
    e3e8:	00e787b3          	add	a5,a5,a4
    e3ec:	0007a703          	lw	a4,0(a5)
    e3f0:	02070663          	beqz	a4,e41c <raise+0x5c>
    e3f4:	00100693          	li	a3,1
    e3f8:	00d70a63          	beq	a4,a3,e40c <raise+0x4c>
    e3fc:	fff00613          	li	a2,-1
    e400:	04c70263          	beq	a4,a2,e444 <raise+0x84>
    e404:	0007a023          	sw	zero,0(a5)
    e408:	000700e7          	jalr	a4
    e40c:	01c12083          	lw	ra,28(sp)
    e410:	00000513          	li	a0,0
    e414:	02010113          	addi	sp,sp,32
    e418:	00008067          	ret
    e41c:	00080513          	mv	a0,a6
    e420:	00c12623          	sw	a2,12(sp)
    e424:	01012423          	sw	a6,8(sp)
    e428:	288000ef          	jal	e6b0 <_getpid_r>
    e42c:	00c12603          	lw	a2,12(sp)
    e430:	01c12083          	lw	ra,28(sp)
    e434:	00050593          	mv	a1,a0
    e438:	00812503          	lw	a0,8(sp)
    e43c:	02010113          	addi	sp,sp,32
    e440:	2100006f          	j	e650 <_kill_r>
    e444:	01c12083          	lw	ra,28(sp)
    e448:	01600793          	li	a5,22
    e44c:	00f82023          	sw	a5,0(a6)
    e450:	00068513          	mv	a0,a3
    e454:	02010113          	addi	sp,sp,32
    e458:	00008067          	ret
    e45c:	01600793          	li	a5,22
    e460:	00f82023          	sw	a5,0(a6)
    e464:	fff00513          	li	a0,-1
    e468:	00008067          	ret

0000e46c <signal>:
    e46c:	01f00793          	li	a5,31
    e470:	0fff2617          	auipc	a2,0xfff2
    e474:	35862603          	lw	a2,856(a2) # 100007c8 <_impure_ptr>
    e478:	02a7e063          	bltu	a5,a0,e498 <signal+0x2c>
    e47c:	13862703          	lw	a4,312(a2)
    e480:	02070463          	beqz	a4,e4a8 <signal+0x3c>
    e484:	00251513          	slli	a0,a0,0x2
    e488:	00a70733          	add	a4,a4,a0
    e48c:	00072503          	lw	a0,0(a4)
    e490:	00b72023          	sw	a1,0(a4)
    e494:	00008067          	ret
    e498:	01600793          	li	a5,22
    e49c:	00f62023          	sw	a5,0(a2)
    e4a0:	fff00513          	li	a0,-1
    e4a4:	00008067          	ret
    e4a8:	fe010113          	addi	sp,sp,-32
    e4ac:	00b12623          	sw	a1,12(sp)
    e4b0:	00a12423          	sw	a0,8(sp)
    e4b4:	08000593          	li	a1,128
    e4b8:	00060513          	mv	a0,a2
    e4bc:	00c12223          	sw	a2,4(sp)
    e4c0:	00112e23          	sw	ra,28(sp)
    e4c4:	a44fa0ef          	jal	8708 <_malloc_r>
    e4c8:	00412603          	lw	a2,4(sp)
    e4cc:	00050713          	mv	a4,a0
    e4d0:	08050593          	addi	a1,a0,128
    e4d4:	12a62c23          	sw	a0,312(a2)
    e4d8:	00812783          	lw	a5,8(sp)
    e4dc:	00050613          	mv	a2,a0
    e4e0:	00c12683          	lw	a3,12(sp)
    e4e4:	fff00513          	li	a0,-1
    e4e8:	02070063          	beqz	a4,e508 <signal+0x9c>
    e4ec:	00062023          	sw	zero,0(a2)
    e4f0:	00460613          	addi	a2,a2,4
    e4f4:	fec59ce3          	bne	a1,a2,e4ec <signal+0x80>
    e4f8:	00279513          	slli	a0,a5,0x2
    e4fc:	00a70733          	add	a4,a4,a0
    e500:	00072503          	lw	a0,0(a4)
    e504:	00d72023          	sw	a3,0(a4)
    e508:	01c12083          	lw	ra,28(sp)
    e50c:	02010113          	addi	sp,sp,32
    e510:	00008067          	ret

0000e514 <_init_signal>:
    e514:	0fff2797          	auipc	a5,0xfff2
    e518:	2b47a783          	lw	a5,692(a5) # 100007c8 <_impure_ptr>
    e51c:	1387a703          	lw	a4,312(a5)
    e520:	00070663          	beqz	a4,e52c <_init_signal+0x18>
    e524:	00000513          	li	a0,0
    e528:	00008067          	ret
    e52c:	fe010113          	addi	sp,sp,-32
    e530:	00078513          	mv	a0,a5
    e534:	08000593          	li	a1,128
    e538:	00f12623          	sw	a5,12(sp)
    e53c:	00112e23          	sw	ra,28(sp)
    e540:	9c8fa0ef          	jal	8708 <_malloc_r>
    e544:	00c12783          	lw	a5,12(sp)
    e548:	12a7ac23          	sw	a0,312(a5)
    e54c:	02050263          	beqz	a0,e570 <_init_signal+0x5c>
    e550:	08050793          	addi	a5,a0,128
    e554:	00052023          	sw	zero,0(a0)
    e558:	00450513          	addi	a0,a0,4
    e55c:	fef51ce3          	bne	a0,a5,e554 <_init_signal+0x40>
    e560:	00000513          	li	a0,0
    e564:	01c12083          	lw	ra,28(sp)
    e568:	02010113          	addi	sp,sp,32
    e56c:	00008067          	ret
    e570:	fff00513          	li	a0,-1
    e574:	ff1ff06f          	j	e564 <_init_signal+0x50>

0000e578 <__sigtramp>:
    e578:	01f00793          	li	a5,31
    e57c:	0ca7e663          	bltu	a5,a0,e648 <__sigtramp+0xd0>
    e580:	0fff2697          	auipc	a3,0xfff2
    e584:	2486a683          	lw	a3,584(a3) # 100007c8 <_impure_ptr>
    e588:	fe010113          	addi	sp,sp,-32
    e58c:	00112e23          	sw	ra,28(sp)
    e590:	1386a783          	lw	a5,312(a3)
    e594:	00050713          	mv	a4,a0
    e598:	06078463          	beqz	a5,e600 <__sigtramp+0x88>
    e59c:	00271693          	slli	a3,a4,0x2
    e5a0:	00d787b3          	add	a5,a5,a3
    e5a4:	0007a683          	lw	a3,0(a5)
    e5a8:	02068863          	beqz	a3,e5d8 <__sigtramp+0x60>
    e5ac:	fff00613          	li	a2,-1
    e5b0:	04c68463          	beq	a3,a2,e5f8 <__sigtramp+0x80>
    e5b4:	00100613          	li	a2,1
    e5b8:	02c68863          	beq	a3,a2,e5e8 <__sigtramp+0x70>
    e5bc:	00070513          	mv	a0,a4
    e5c0:	0007a023          	sw	zero,0(a5)
    e5c4:	000680e7          	jalr	a3
    e5c8:	00000513          	li	a0,0
    e5cc:	01c12083          	lw	ra,28(sp)
    e5d0:	02010113          	addi	sp,sp,32
    e5d4:	00008067          	ret
    e5d8:	01c12083          	lw	ra,28(sp)
    e5dc:	00100513          	li	a0,1
    e5e0:	02010113          	addi	sp,sp,32
    e5e4:	00008067          	ret
    e5e8:	01c12083          	lw	ra,28(sp)
    e5ec:	00300513          	li	a0,3
    e5f0:	02010113          	addi	sp,sp,32
    e5f4:	00008067          	ret
    e5f8:	00200513          	li	a0,2
    e5fc:	fd1ff06f          	j	e5cc <__sigtramp+0x54>
    e600:	00a12623          	sw	a0,12(sp)
    e604:	08000593          	li	a1,128
    e608:	00068513          	mv	a0,a3
    e60c:	00d12423          	sw	a3,8(sp)
    e610:	8f8fa0ef          	jal	8708 <_malloc_r>
    e614:	00812683          	lw	a3,8(sp)
    e618:	00050793          	mv	a5,a0
    e61c:	12a6ac23          	sw	a0,312(a3)
    e620:	02050063          	beqz	a0,e640 <__sigtramp+0xc8>
    e624:	00c12703          	lw	a4,12(sp)
    e628:	00050693          	mv	a3,a0
    e62c:	08050613          	addi	a2,a0,128
    e630:	0006a023          	sw	zero,0(a3)
    e634:	00468693          	addi	a3,a3,4
    e638:	fed61ce3          	bne	a2,a3,e630 <__sigtramp+0xb8>
    e63c:	f61ff06f          	j	e59c <__sigtramp+0x24>
    e640:	fff00513          	li	a0,-1
    e644:	f89ff06f          	j	e5cc <__sigtramp+0x54>
    e648:	fff00513          	li	a0,-1
    e64c:	00008067          	ret

0000e650 <_kill_r>:
    e650:	00058793          	mv	a5,a1
    e654:	ff010113          	addi	sp,sp,-16
    e658:	00812423          	sw	s0,8(sp)
    e65c:	00060593          	mv	a1,a2
    e660:	00050413          	mv	s0,a0
    e664:	00078513          	mv	a0,a5
    e668:	00112623          	sw	ra,12(sp)
    e66c:	0fff2797          	auipc	a5,0xfff2
    e670:	4a07ae23          	sw	zero,1212(a5) # 10000b28 <errno>
    e674:	d49f10ef          	jal	3bc <_kill>
    e678:	fff00793          	li	a5,-1
    e67c:	00f50a63          	beq	a0,a5,e690 <_kill_r+0x40>
    e680:	00c12083          	lw	ra,12(sp)
    e684:	00812403          	lw	s0,8(sp)
    e688:	01010113          	addi	sp,sp,16
    e68c:	00008067          	ret
    e690:	0fff2797          	auipc	a5,0xfff2
    e694:	4987a783          	lw	a5,1176(a5) # 10000b28 <errno>
    e698:	fe0784e3          	beqz	a5,e680 <_kill_r+0x30>
    e69c:	00c12083          	lw	ra,12(sp)
    e6a0:	00f42023          	sw	a5,0(s0)
    e6a4:	00812403          	lw	s0,8(sp)
    e6a8:	01010113          	addi	sp,sp,16
    e6ac:	00008067          	ret

0000e6b0 <_getpid_r>:
    e6b0:	d3df106f          	j	3ec <_getpid>

0000e6b4 <__udivdi3>:
    e6b4:	fd010113          	addi	sp,sp,-48
    e6b8:	02112623          	sw	ra,44(sp)
    e6bc:	00050713          	mv	a4,a0
    e6c0:	00058513          	mv	a0,a1
    e6c4:	16069863          	bnez	a3,e834 <__udivdi3+0x180>
    e6c8:	02812423          	sw	s0,40(sp)
    e6cc:	02912223          	sw	s1,36(sp)
    e6d0:	03212023          	sw	s2,32(sp)
    e6d4:	01312e23          	sw	s3,28(sp)
    e6d8:	01412c23          	sw	s4,24(sp)
    e6dc:	00060493          	mv	s1,a2
    e6e0:	00070413          	mv	s0,a4
    e6e4:	38c5f863          	bgeu	a1,a2,ea74 <__udivdi3+0x3c0>
    e6e8:	000107b7          	lui	a5,0x10
    e6ec:	00058813          	mv	a6,a1
    e6f0:	58f66663          	bltu	a2,a5,ec7c <__udivdi3+0x5c8>
    e6f4:	010007b7          	lui	a5,0x1000
    e6f8:	01800593          	li	a1,24
    e6fc:	00f67463          	bgeu	a2,a5,e704 <__udivdi3+0x50>
    e700:	01000593          	li	a1,16
    e704:	00b656b3          	srl	a3,a2,a1
    e708:	00005797          	auipc	a5,0x5
    e70c:	e2878793          	addi	a5,a5,-472 # 13530 <__clz_tab>
    e710:	00d787b3          	add	a5,a5,a3
    e714:	0007c783          	lbu	a5,0(a5)
    e718:	02000693          	li	a3,32
    e71c:	00b787b3          	add	a5,a5,a1
    e720:	00d78e63          	beq	a5,a3,e73c <__udivdi3+0x88>
    e724:	40f686b3          	sub	a3,a3,a5
    e728:	00d51833          	sll	a6,a0,a3
    e72c:	00f757b3          	srl	a5,a4,a5
    e730:	00d614b3          	sll	s1,a2,a3
    e734:	00d71433          	sll	s0,a4,a3
    e738:	0107e833          	or	a6,a5,a6
    e73c:	0104d913          	srli	s2,s1,0x10
    e740:	00080513          	mv	a0,a6
    e744:	00090593          	mv	a1,s2
    e748:	01049993          	slli	s3,s1,0x10
    e74c:	01012023          	sw	a6,0(sp)
    e750:	0109d993          	srli	s3,s3,0x10
    e754:	7c9030ef          	jal	1271c <__hidden___udivsi3>
    e758:	00050593          	mv	a1,a0
    e75c:	00050a13          	mv	s4,a0
    e760:	00098513          	mv	a0,s3
    e764:	78d030ef          	jal	126f0 <__mulsi3>
    e768:	00012803          	lw	a6,0(sp)
    e76c:	00090593          	mv	a1,s2
    e770:	00a12023          	sw	a0,0(sp)
    e774:	00080513          	mv	a0,a6
    e778:	7ed030ef          	jal	12764 <__umodsi3>
    e77c:	00012783          	lw	a5,0(sp)
    e780:	01051513          	slli	a0,a0,0x10
    e784:	01045713          	srli	a4,s0,0x10
    e788:	00a76733          	or	a4,a4,a0
    e78c:	00f77c63          	bgeu	a4,a5,e7a4 <__udivdi3+0xf0>
    e790:	00e486b3          	add	a3,s1,a4
    e794:	00068713          	mv	a4,a3
    e798:	00f6f463          	bgeu	a3,a5,e7a0 <__udivdi3+0xec>
    e79c:	5696fe63          	bgeu	a3,s1,ed18 <__udivdi3+0x664>
    e7a0:	fffa0a13          	addi	s4,s4,-1
    e7a4:	40f70733          	sub	a4,a4,a5
    e7a8:	00070513          	mv	a0,a4
    e7ac:	00090593          	mv	a1,s2
    e7b0:	00e12423          	sw	a4,8(sp)
    e7b4:	769030ef          	jal	1271c <__hidden___udivsi3>
    e7b8:	00050593          	mv	a1,a0
    e7bc:	00a12223          	sw	a0,4(sp)
    e7c0:	00098513          	mv	a0,s3
    e7c4:	72d030ef          	jal	126f0 <__mulsi3>
    e7c8:	00a12023          	sw	a0,0(sp)
    e7cc:	00812503          	lw	a0,8(sp)
    e7d0:	00090593          	mv	a1,s2
    e7d4:	01041413          	slli	s0,s0,0x10
    e7d8:	78d030ef          	jal	12764 <__umodsi3>
    e7dc:	00012683          	lw	a3,0(sp)
    e7e0:	01045413          	srli	s0,s0,0x10
    e7e4:	01051513          	slli	a0,a0,0x10
    e7e8:	00a46433          	or	s0,s0,a0
    e7ec:	00412603          	lw	a2,4(sp)
    e7f0:	00d47a63          	bgeu	s0,a3,e804 <__udivdi3+0x150>
    e7f4:	00848433          	add	s0,s1,s0
    e7f8:	00d47463          	bgeu	s0,a3,e800 <__udivdi3+0x14c>
    e7fc:	50947a63          	bgeu	s0,s1,ed10 <__udivdi3+0x65c>
    e800:	fff60613          	addi	a2,a2,-1
    e804:	010a1693          	slli	a3,s4,0x10
    e808:	00c6e533          	or	a0,a3,a2
    e80c:	00000813          	li	a6,0
    e810:	02812403          	lw	s0,40(sp)
    e814:	02c12083          	lw	ra,44(sp)
    e818:	02412483          	lw	s1,36(sp)
    e81c:	02012903          	lw	s2,32(sp)
    e820:	01c12983          	lw	s3,28(sp)
    e824:	01812a03          	lw	s4,24(sp)
    e828:	00080593          	mv	a1,a6
    e82c:	03010113          	addi	sp,sp,48
    e830:	00008067          	ret
    e834:	00d5fe63          	bgeu	a1,a3,e850 <__udivdi3+0x19c>
    e838:	00000813          	li	a6,0
    e83c:	00000513          	li	a0,0
    e840:	02c12083          	lw	ra,44(sp)
    e844:	00080593          	mv	a1,a6
    e848:	03010113          	addi	sp,sp,48
    e84c:	00008067          	ret
    e850:	02912223          	sw	s1,36(sp)
    e854:	000107b7          	lui	a5,0x10
    e858:	44f6e063          	bltu	a3,a5,ec98 <__udivdi3+0x5e4>
    e85c:	010007b7          	lui	a5,0x1000
    e860:	01800593          	li	a1,24
    e864:	00f6f463          	bgeu	a3,a5,e86c <__udivdi3+0x1b8>
    e868:	01000593          	li	a1,16
    e86c:	00005797          	auipc	a5,0x5
    e870:	cc478793          	addi	a5,a5,-828 # 13530 <__clz_tab>
    e874:	00b6d833          	srl	a6,a3,a1
    e878:	010787b3          	add	a5,a5,a6
    e87c:	0007c783          	lbu	a5,0(a5)
    e880:	02000493          	li	s1,32
    e884:	00b787b3          	add	a5,a5,a1
    e888:	42978063          	beq	a5,s1,eca8 <__udivdi3+0x5f4>
    e88c:	40f484b3          	sub	s1,s1,a5
    e890:	00f655b3          	srl	a1,a2,a5
    e894:	009696b3          	sll	a3,a3,s1
    e898:	00d5e6b3          	or	a3,a1,a3
    e89c:	00f55833          	srl	a6,a0,a5
    e8a0:	00f757b3          	srl	a5,a4,a5
    e8a4:	00951533          	sll	a0,a0,s1
    e8a8:	0106d593          	srli	a1,a3,0x10
    e8ac:	01312e23          	sw	s3,28(sp)
    e8b0:	01412c23          	sw	s4,24(sp)
    e8b4:	00a7e9b3          	or	s3,a5,a0
    e8b8:	01069a13          	slli	s4,a3,0x10
    e8bc:	00080513          	mv	a0,a6
    e8c0:	00e12423          	sw	a4,8(sp)
    e8c4:	00d12023          	sw	a3,0(sp)
    e8c8:	01012223          	sw	a6,4(sp)
    e8cc:	02812423          	sw	s0,40(sp)
    e8d0:	03212023          	sw	s2,32(sp)
    e8d4:	01512a23          	sw	s5,20(sp)
    e8d8:	00058913          	mv	s2,a1
    e8dc:	01612823          	sw	s6,16(sp)
    e8e0:	010a5a13          	srli	s4,s4,0x10
    e8e4:	00961b33          	sll	s6,a2,s1
    e8e8:	635030ef          	jal	1271c <__hidden___udivsi3>
    e8ec:	00050593          	mv	a1,a0
    e8f0:	00050a93          	mv	s5,a0
    e8f4:	000a0513          	mv	a0,s4
    e8f8:	5f9030ef          	jal	126f0 <__mulsi3>
    e8fc:	00050413          	mv	s0,a0
    e900:	00412503          	lw	a0,4(sp)
    e904:	00090593          	mv	a1,s2
    e908:	65d030ef          	jal	12764 <__umodsi3>
    e90c:	01051513          	slli	a0,a0,0x10
    e910:	0109d793          	srli	a5,s3,0x10
    e914:	00a7e7b3          	or	a5,a5,a0
    e918:	00012683          	lw	a3,0(sp)
    e91c:	00812703          	lw	a4,8(sp)
    e920:	0087fc63          	bgeu	a5,s0,e938 <__udivdi3+0x284>
    e924:	00f68633          	add	a2,a3,a5
    e928:	00060793          	mv	a5,a2
    e92c:	00867463          	bgeu	a2,s0,e934 <__udivdi3+0x280>
    e930:	42d67063          	bgeu	a2,a3,ed50 <__udivdi3+0x69c>
    e934:	fffa8a93          	addi	s5,s5,-1
    e938:	40878433          	sub	s0,a5,s0
    e93c:	00090593          	mv	a1,s2
    e940:	00040513          	mv	a0,s0
    e944:	00e12423          	sw	a4,8(sp)
    e948:	00d12623          	sw	a3,12(sp)
    e94c:	5d1030ef          	jal	1271c <__hidden___udivsi3>
    e950:	00050593          	mv	a1,a0
    e954:	00a12223          	sw	a0,4(sp)
    e958:	000a0513          	mv	a0,s4
    e95c:	595030ef          	jal	126f0 <__mulsi3>
    e960:	00a12023          	sw	a0,0(sp)
    e964:	00090593          	mv	a1,s2
    e968:	00040513          	mv	a0,s0
    e96c:	5f9030ef          	jal	12764 <__umodsi3>
    e970:	01099793          	slli	a5,s3,0x10
    e974:	00012883          	lw	a7,0(sp)
    e978:	0107d793          	srli	a5,a5,0x10
    e97c:	01051513          	slli	a0,a0,0x10
    e980:	00a7e7b3          	or	a5,a5,a0
    e984:	00412603          	lw	a2,4(sp)
    e988:	00812703          	lw	a4,8(sp)
    e98c:	0117fe63          	bgeu	a5,a7,e9a8 <__udivdi3+0x2f4>
    e990:	00c12683          	lw	a3,12(sp)
    e994:	00f685b3          	add	a1,a3,a5
    e998:	00058793          	mv	a5,a1
    e99c:	0115f463          	bgeu	a1,a7,e9a4 <__udivdi3+0x2f0>
    e9a0:	38d5fc63          	bgeu	a1,a3,ed38 <__udivdi3+0x684>
    e9a4:	fff60613          	addi	a2,a2,-1
    e9a8:	01061313          	slli	t1,a2,0x10
    e9ac:	010a9513          	slli	a0,s5,0x10
    e9b0:	01035313          	srli	t1,t1,0x10
    e9b4:	010b1593          	slli	a1,s6,0x10
    e9b8:	411788b3          	sub	a7,a5,a7
    e9bc:	0105d593          	srli	a1,a1,0x10
    e9c0:	00c567b3          	or	a5,a0,a2
    e9c4:	00030513          	mv	a0,t1
    e9c8:	529030ef          	jal	126f0 <__mulsi3>
    e9cc:	00050e13          	mv	t3,a0
    e9d0:	010b5593          	srli	a1,s6,0x10
    e9d4:	00030513          	mv	a0,t1
    e9d8:	519030ef          	jal	126f0 <__mulsi3>
    e9dc:	010b1593          	slli	a1,s6,0x10
    e9e0:	00050313          	mv	t1,a0
    e9e4:	0105d593          	srli	a1,a1,0x10
    e9e8:	0107d513          	srli	a0,a5,0x10
    e9ec:	505030ef          	jal	126f0 <__mulsi3>
    e9f0:	00050e93          	mv	t4,a0
    e9f4:	010b5593          	srli	a1,s6,0x10
    e9f8:	0107d513          	srli	a0,a5,0x10
    e9fc:	4f5030ef          	jal	126f0 <__mulsi3>
    ea00:	01d30333          	add	t1,t1,t4
    ea04:	010e5693          	srli	a3,t3,0x10
    ea08:	006686b3          	add	a3,a3,t1
    ea0c:	01d6f663          	bgeu	a3,t4,ea18 <__udivdi3+0x364>
    ea10:	00010637          	lui	a2,0x10
    ea14:	00c50533          	add	a0,a0,a2
    ea18:	0106d613          	srli	a2,a3,0x10
    ea1c:	00a60633          	add	a2,a2,a0
    ea20:	02c8e063          	bltu	a7,a2,ea40 <__udivdi3+0x38c>
    ea24:	010e1e13          	slli	t3,t3,0x10
    ea28:	010e5e13          	srli	t3,t3,0x10
    ea2c:	01069693          	slli	a3,a3,0x10
    ea30:	00971733          	sll	a4,a4,s1
    ea34:	01c686b3          	add	a3,a3,t3
    ea38:	2ed77663          	bgeu	a4,a3,ed24 <__udivdi3+0x670>
    ea3c:	2ec89463          	bne	a7,a2,ed24 <__udivdi3+0x670>
    ea40:	fff78513          	addi	a0,a5,-1
    ea44:	02812403          	lw	s0,40(sp)
    ea48:	02c12083          	lw	ra,44(sp)
    ea4c:	00000813          	li	a6,0
    ea50:	02412483          	lw	s1,36(sp)
    ea54:	02012903          	lw	s2,32(sp)
    ea58:	01c12983          	lw	s3,28(sp)
    ea5c:	01812a03          	lw	s4,24(sp)
    ea60:	01412a83          	lw	s5,20(sp)
    ea64:	01012b03          	lw	s6,16(sp)
    ea68:	00080593          	mv	a1,a6
    ea6c:	03010113          	addi	sp,sp,48
    ea70:	00008067          	ret
    ea74:	20060c63          	beqz	a2,ec8c <__udivdi3+0x5d8>
    ea78:	000107b7          	lui	a5,0x10
    ea7c:	26f67063          	bgeu	a2,a5,ecdc <__udivdi3+0x628>
    ea80:	10063593          	sltiu	a1,a2,256
    ea84:	0015b593          	seqz	a1,a1
    ea88:	00359593          	slli	a1,a1,0x3
    ea8c:	00b656b3          	srl	a3,a2,a1
    ea90:	00005797          	auipc	a5,0x5
    ea94:	aa078793          	addi	a5,a5,-1376 # 13530 <__clz_tab>
    ea98:	00d787b3          	add	a5,a5,a3
    ea9c:	0007c683          	lbu	a3,0(a5)
    eaa0:	02000793          	li	a5,32
    eaa4:	00b686b3          	add	a3,a3,a1
    eaa8:	20f68e63          	beq	a3,a5,ecc4 <__udivdi3+0x610>
    eaac:	40d787b3          	sub	a5,a5,a3
    eab0:	00f614b3          	sll	s1,a2,a5
    eab4:	0104d913          	srli	s2,s1,0x10
    eab8:	00d55633          	srl	a2,a0,a3
    eabc:	00f51833          	sll	a6,a0,a5
    eac0:	00d756b3          	srl	a3,a4,a3
    eac4:	00060513          	mv	a0,a2
    eac8:	00090593          	mv	a1,s2
    eacc:	01049993          	slli	s3,s1,0x10
    ead0:	00f71433          	sll	s0,a4,a5
    ead4:	0106ea33          	or	s4,a3,a6
    ead8:	00c12023          	sw	a2,0(sp)
    eadc:	01512a23          	sw	s5,20(sp)
    eae0:	0109d993          	srli	s3,s3,0x10
    eae4:	439030ef          	jal	1271c <__hidden___udivsi3>
    eae8:	00050593          	mv	a1,a0
    eaec:	00050a93          	mv	s5,a0
    eaf0:	00098513          	mv	a0,s3
    eaf4:	3fd030ef          	jal	126f0 <__mulsi3>
    eaf8:	00012603          	lw	a2,0(sp)
    eafc:	00090593          	mv	a1,s2
    eb00:	00a12023          	sw	a0,0(sp)
    eb04:	00060513          	mv	a0,a2
    eb08:	45d030ef          	jal	12764 <__umodsi3>
    eb0c:	00012703          	lw	a4,0(sp)
    eb10:	01051513          	slli	a0,a0,0x10
    eb14:	010a5793          	srli	a5,s4,0x10
    eb18:	00a7e7b3          	or	a5,a5,a0
    eb1c:	00e7fc63          	bgeu	a5,a4,eb34 <__udivdi3+0x480>
    eb20:	00f486b3          	add	a3,s1,a5
    eb24:	00068793          	mv	a5,a3
    eb28:	00e6f463          	bgeu	a3,a4,eb30 <__udivdi3+0x47c>
    eb2c:	2096f063          	bgeu	a3,s1,ed2c <__udivdi3+0x678>
    eb30:	fffa8a93          	addi	s5,s5,-1
    eb34:	40e78733          	sub	a4,a5,a4
    eb38:	00070513          	mv	a0,a4
    eb3c:	00090593          	mv	a1,s2
    eb40:	00e12023          	sw	a4,0(sp)
    eb44:	3d9030ef          	jal	1271c <__hidden___udivsi3>
    eb48:	00050593          	mv	a1,a0
    eb4c:	00a12223          	sw	a0,4(sp)
    eb50:	00098513          	mv	a0,s3
    eb54:	39d030ef          	jal	126f0 <__mulsi3>
    eb58:	00012703          	lw	a4,0(sp)
    eb5c:	00090593          	mv	a1,s2
    eb60:	00a12023          	sw	a0,0(sp)
    eb64:	00070513          	mv	a0,a4
    eb68:	3fd030ef          	jal	12764 <__umodsi3>
    eb6c:	010a1713          	slli	a4,s4,0x10
    eb70:	00012783          	lw	a5,0(sp)
    eb74:	01075713          	srli	a4,a4,0x10
    eb78:	01051513          	slli	a0,a0,0x10
    eb7c:	00a76733          	or	a4,a4,a0
    eb80:	00412683          	lw	a3,4(sp)
    eb84:	00f77c63          	bgeu	a4,a5,eb9c <__udivdi3+0x4e8>
    eb88:	00e48633          	add	a2,s1,a4
    eb8c:	00060713          	mv	a4,a2
    eb90:	00f67463          	bgeu	a2,a5,eb98 <__udivdi3+0x4e4>
    eb94:	1a967863          	bgeu	a2,s1,ed44 <__udivdi3+0x690>
    eb98:	fff68693          	addi	a3,a3,-1
    eb9c:	010a9813          	slli	a6,s5,0x10
    eba0:	01412a83          	lw	s5,20(sp)
    eba4:	00d86833          	or	a6,a6,a3
    eba8:	40f70733          	sub	a4,a4,a5
    ebac:	00070513          	mv	a0,a4
    ebb0:	00090593          	mv	a1,s2
    ebb4:	01012223          	sw	a6,4(sp)
    ebb8:	00e12023          	sw	a4,0(sp)
    ebbc:	361030ef          	jal	1271c <__hidden___udivsi3>
    ebc0:	00098593          	mv	a1,s3
    ebc4:	00050a13          	mv	s4,a0
    ebc8:	329030ef          	jal	126f0 <__mulsi3>
    ebcc:	00012703          	lw	a4,0(sp)
    ebd0:	00090593          	mv	a1,s2
    ebd4:	00a12023          	sw	a0,0(sp)
    ebd8:	00070513          	mv	a0,a4
    ebdc:	389030ef          	jal	12764 <__umodsi3>
    ebe0:	00012783          	lw	a5,0(sp)
    ebe4:	01051513          	slli	a0,a0,0x10
    ebe8:	01045713          	srli	a4,s0,0x10
    ebec:	00a76733          	or	a4,a4,a0
    ebf0:	00412803          	lw	a6,4(sp)
    ebf4:	00f77c63          	bgeu	a4,a5,ec0c <__udivdi3+0x558>
    ebf8:	00e486b3          	add	a3,s1,a4
    ebfc:	00068713          	mv	a4,a3
    ec00:	00f6f463          	bgeu	a3,a5,ec08 <__udivdi3+0x554>
    ec04:	1096f063          	bgeu	a3,s1,ed04 <__udivdi3+0x650>
    ec08:	fffa0a13          	addi	s4,s4,-1
    ec0c:	40f70733          	sub	a4,a4,a5
    ec10:	00070513          	mv	a0,a4
    ec14:	00090593          	mv	a1,s2
    ec18:	01012623          	sw	a6,12(sp)
    ec1c:	00e12423          	sw	a4,8(sp)
    ec20:	2fd030ef          	jal	1271c <__hidden___udivsi3>
    ec24:	00098593          	mv	a1,s3
    ec28:	00a12223          	sw	a0,4(sp)
    ec2c:	2c5030ef          	jal	126f0 <__mulsi3>
    ec30:	00a12023          	sw	a0,0(sp)
    ec34:	00812503          	lw	a0,8(sp)
    ec38:	00090593          	mv	a1,s2
    ec3c:	01041413          	slli	s0,s0,0x10
    ec40:	325030ef          	jal	12764 <__umodsi3>
    ec44:	00012683          	lw	a3,0(sp)
    ec48:	01045413          	srli	s0,s0,0x10
    ec4c:	01051513          	slli	a0,a0,0x10
    ec50:	00a46433          	or	s0,s0,a0
    ec54:	00412603          	lw	a2,4(sp)
    ec58:	00c12803          	lw	a6,12(sp)
    ec5c:	00d47a63          	bgeu	s0,a3,ec70 <__udivdi3+0x5bc>
    ec60:	00848433          	add	s0,s1,s0
    ec64:	00d47463          	bgeu	s0,a3,ec6c <__udivdi3+0x5b8>
    ec68:	08947a63          	bgeu	s0,s1,ecfc <__udivdi3+0x648>
    ec6c:	fff60613          	addi	a2,a2,-1 # ffff <__divdf3+0x103>
    ec70:	010a1693          	slli	a3,s4,0x10
    ec74:	00c6e533          	or	a0,a3,a2
    ec78:	b99ff06f          	j	e810 <__udivdi3+0x15c>
    ec7c:	10063593          	sltiu	a1,a2,256
    ec80:	0015b593          	seqz	a1,a1
    ec84:	00359593          	slli	a1,a1,0x3
    ec88:	a7dff06f          	j	e704 <__udivdi3+0x50>
    ec8c:	00000693          	li	a3,0
    ec90:	00000593          	li	a1,0
    ec94:	dfdff06f          	j	ea90 <__udivdi3+0x3dc>
    ec98:	1006b593          	sltiu	a1,a3,256
    ec9c:	0015b593          	seqz	a1,a1
    eca0:	00359593          	slli	a1,a1,0x3
    eca4:	bc9ff06f          	j	e86c <__udivdi3+0x1b8>
    eca8:	00c73633          	sltu	a2,a4,a2
    ecac:	00163613          	seqz	a2,a2
    ecb0:	00a6b6b3          	sltu	a3,a3,a0
    ecb4:	02412483          	lw	s1,36(sp)
    ecb8:	00c6e533          	or	a0,a3,a2
    ecbc:	00000813          	li	a6,0
    ecc0:	b81ff06f          	j	e840 <__udivdi3+0x18c>
    ecc4:	01061993          	slli	s3,a2,0x10
    ecc8:	40c50733          	sub	a4,a0,a2
    eccc:	01065913          	srli	s2,a2,0x10
    ecd0:	0109d993          	srli	s3,s3,0x10
    ecd4:	00100813          	li	a6,1
    ecd8:	ed5ff06f          	j	ebac <__udivdi3+0x4f8>
    ecdc:	010007b7          	lui	a5,0x1000
    ece0:	00f67863          	bgeu	a2,a5,ecf0 <__udivdi3+0x63c>
    ece4:	01065693          	srli	a3,a2,0x10
    ece8:	01000593          	li	a1,16
    ecec:	da5ff06f          	j	ea90 <__udivdi3+0x3dc>
    ecf0:	01865693          	srli	a3,a2,0x18
    ecf4:	01800593          	li	a1,24
    ecf8:	d99ff06f          	j	ea90 <__udivdi3+0x3dc>
    ecfc:	ffe60613          	addi	a2,a2,-2
    ed00:	f71ff06f          	j	ec70 <__udivdi3+0x5bc>
    ed04:	ffea0a13          	addi	s4,s4,-2
    ed08:	00968733          	add	a4,a3,s1
    ed0c:	f01ff06f          	j	ec0c <__udivdi3+0x558>
    ed10:	ffe60613          	addi	a2,a2,-2
    ed14:	af1ff06f          	j	e804 <__udivdi3+0x150>
    ed18:	ffea0a13          	addi	s4,s4,-2
    ed1c:	00968733          	add	a4,a3,s1
    ed20:	a85ff06f          	j	e7a4 <__udivdi3+0xf0>
    ed24:	00078513          	mv	a0,a5
    ed28:	d1dff06f          	j	ea44 <__udivdi3+0x390>
    ed2c:	ffea8a93          	addi	s5,s5,-2
    ed30:	009687b3          	add	a5,a3,s1
    ed34:	e01ff06f          	j	eb34 <__udivdi3+0x480>
    ed38:	ffe60613          	addi	a2,a2,-2
    ed3c:	00d587b3          	add	a5,a1,a3
    ed40:	c69ff06f          	j	e9a8 <__udivdi3+0x2f4>
    ed44:	ffe68693          	addi	a3,a3,-2
    ed48:	00960733          	add	a4,a2,s1
    ed4c:	e51ff06f          	j	eb9c <__udivdi3+0x4e8>
    ed50:	ffea8a93          	addi	s5,s5,-2
    ed54:	00d607b3          	add	a5,a2,a3
    ed58:	be1ff06f          	j	e938 <__udivdi3+0x284>

0000ed5c <__umoddi3>:
    ed5c:	fc010113          	addi	sp,sp,-64
    ed60:	02112e23          	sw	ra,60(sp)
    ed64:	00050793          	mv	a5,a0
    ed68:	00058713          	mv	a4,a1
    ed6c:	16069863          	bnez	a3,eedc <__umoddi3+0x180>
    ed70:	02912a23          	sw	s1,52(sp)
    ed74:	03212823          	sw	s2,48(sp)
    ed78:	02812c23          	sw	s0,56(sp)
    ed7c:	03312623          	sw	s3,44(sp)
    ed80:	03412423          	sw	s4,40(sp)
    ed84:	00060493          	mv	s1,a2
    ed88:	00050913          	mv	s2,a0
    ed8c:	3ac5f463          	bgeu	a1,a2,f134 <__umoddi3+0x3d8>
    ed90:	000106b7          	lui	a3,0x10
    ed94:	00058813          	mv	a6,a1
    ed98:	56d66663          	bltu	a2,a3,f304 <__umoddi3+0x5a8>
    ed9c:	010006b7          	lui	a3,0x1000
    eda0:	01800593          	li	a1,24
    eda4:	00d67463          	bgeu	a2,a3,edac <__umoddi3+0x50>
    eda8:	01000593          	li	a1,16
    edac:	00b65533          	srl	a0,a2,a1
    edb0:	00004697          	auipc	a3,0x4
    edb4:	78068693          	addi	a3,a3,1920 # 13530 <__clz_tab>
    edb8:	00a686b3          	add	a3,a3,a0
    edbc:	0006c683          	lbu	a3,0(a3)
    edc0:	02000513          	li	a0,32
    edc4:	00b686b3          	add	a3,a3,a1
    edc8:	40d50433          	sub	s0,a0,a3
    edcc:	00a68c63          	beq	a3,a0,ede4 <__umoddi3+0x88>
    edd0:	00871833          	sll	a6,a4,s0
    edd4:	00d7d6b3          	srl	a3,a5,a3
    edd8:	0106e833          	or	a6,a3,a6
    eddc:	008614b3          	sll	s1,a2,s0
    ede0:	00879933          	sll	s2,a5,s0
    ede4:	0104d993          	srli	s3,s1,0x10
    ede8:	00080513          	mv	a0,a6
    edec:	00098593          	mv	a1,s3
    edf0:	01049a13          	slli	s4,s1,0x10
    edf4:	01012423          	sw	a6,8(sp)
    edf8:	010a5a13          	srli	s4,s4,0x10
    edfc:	121030ef          	jal	1271c <__hidden___udivsi3>
    ee00:	000a0593          	mv	a1,s4
    ee04:	0ed030ef          	jal	126f0 <__mulsi3>
    ee08:	00a12223          	sw	a0,4(sp)
    ee0c:	00812503          	lw	a0,8(sp)
    ee10:	00098593          	mv	a1,s3
    ee14:	151030ef          	jal	12764 <__umodsi3>
    ee18:	00412683          	lw	a3,4(sp)
    ee1c:	01051513          	slli	a0,a0,0x10
    ee20:	01095793          	srli	a5,s2,0x10
    ee24:	00a7e7b3          	or	a5,a5,a0
    ee28:	02d7f263          	bgeu	a5,a3,ee4c <__umoddi3+0xf0>
    ee2c:	00f487b3          	add	a5,s1,a5
    ee30:	0097b633          	sltu	a2,a5,s1
    ee34:	00d7b733          	sltu	a4,a5,a3
    ee38:	00163613          	seqz	a2,a2
    ee3c:	00c77733          	and	a4,a4,a2
    ee40:	40e00733          	neg	a4,a4
    ee44:	00977733          	and	a4,a4,s1
    ee48:	00f707b3          	add	a5,a4,a5
    ee4c:	40d787b3          	sub	a5,a5,a3
    ee50:	00078513          	mv	a0,a5
    ee54:	00098593          	mv	a1,s3
    ee58:	00f12423          	sw	a5,8(sp)
    ee5c:	0c1030ef          	jal	1271c <__hidden___udivsi3>
    ee60:	000a0593          	mv	a1,s4
    ee64:	08d030ef          	jal	126f0 <__mulsi3>
    ee68:	00a12223          	sw	a0,4(sp)
    ee6c:	00812503          	lw	a0,8(sp)
    ee70:	00098593          	mv	a1,s3
    ee74:	0f1030ef          	jal	12764 <__umodsi3>
    ee78:	01091793          	slli	a5,s2,0x10
    ee7c:	00412703          	lw	a4,4(sp)
    ee80:	0107d793          	srli	a5,a5,0x10
    ee84:	01051513          	slli	a0,a0,0x10
    ee88:	00a7e533          	or	a0,a5,a0
    ee8c:	02e57263          	bgeu	a0,a4,eeb0 <__umoddi3+0x154>
    ee90:	00a48533          	add	a0,s1,a0
    ee94:	009536b3          	sltu	a3,a0,s1
    ee98:	00e537b3          	sltu	a5,a0,a4
    ee9c:	0016b693          	seqz	a3,a3
    eea0:	00d7f7b3          	and	a5,a5,a3
    eea4:	40f007b3          	neg	a5,a5
    eea8:	0097f7b3          	and	a5,a5,s1
    eeac:	00a78533          	add	a0,a5,a0
    eeb0:	40e50533          	sub	a0,a0,a4
    eeb4:	00855533          	srl	a0,a0,s0
    eeb8:	03412483          	lw	s1,52(sp)
    eebc:	03812403          	lw	s0,56(sp)
    eec0:	03012903          	lw	s2,48(sp)
    eec4:	02c12983          	lw	s3,44(sp)
    eec8:	02812a03          	lw	s4,40(sp)
    eecc:	00000593          	li	a1,0
    eed0:	03c12083          	lw	ra,60(sp)
    eed4:	04010113          	addi	sp,sp,64
    eed8:	00008067          	ret
    eedc:	00050313          	mv	t1,a0
    eee0:	fed5e8e3          	bltu	a1,a3,eed0 <__umoddi3+0x174>
    eee4:	00058893          	mv	a7,a1
    eee8:	02912a23          	sw	s1,52(sp)
    eeec:	000105b7          	lui	a1,0x10
    eef0:	42b6e863          	bltu	a3,a1,f320 <__umoddi3+0x5c4>
    eef4:	01000537          	lui	a0,0x1000
    eef8:	01800593          	li	a1,24
    eefc:	00a6f463          	bgeu	a3,a0,ef04 <__umoddi3+0x1a8>
    ef00:	01000593          	li	a1,16
    ef04:	00b6d833          	srl	a6,a3,a1
    ef08:	00004517          	auipc	a0,0x4
    ef0c:	62850513          	addi	a0,a0,1576 # 13530 <__clz_tab>
    ef10:	01050533          	add	a0,a0,a6
    ef14:	00054483          	lbu	s1,0(a0)
    ef18:	02000813          	li	a6,32
    ef1c:	00b484b3          	add	s1,s1,a1
    ef20:	41048863          	beq	s1,a6,f330 <__umoddi3+0x5d4>
    ef24:	02812c23          	sw	s0,56(sp)
    ef28:	40980433          	sub	s0,a6,s1
    ef2c:	00965333          	srl	t1,a2,s1
    ef30:	008696b3          	sll	a3,a3,s0
    ef34:	03212823          	sw	s2,48(sp)
    ef38:	00d36933          	or	s2,t1,a3
    ef3c:	0097d533          	srl	a0,a5,s1
    ef40:	009756b3          	srl	a3,a4,s1
    ef44:	03312623          	sw	s3,44(sp)
    ef48:	00871733          	sll	a4,a4,s0
    ef4c:	01095993          	srli	s3,s2,0x10
    ef50:	03512223          	sw	s5,36(sp)
    ef54:	03612023          	sw	s6,32(sp)
    ef58:	00e56ab3          	or	s5,a0,a4
    ef5c:	00098593          	mv	a1,s3
    ef60:	00068513          	mv	a0,a3
    ef64:	01091b13          	slli	s6,s2,0x10
    ef68:	00d12223          	sw	a3,4(sp)
    ef6c:	03412423          	sw	s4,40(sp)
    ef70:	01712e23          	sw	s7,28(sp)
    ef74:	00879a33          	sll	s4,a5,s0
    ef78:	01812c23          	sw	s8,24(sp)
    ef7c:	010b5b13          	srli	s6,s6,0x10
    ef80:	00861c33          	sll	s8,a2,s0
    ef84:	798030ef          	jal	1271c <__hidden___udivsi3>
    ef88:	00050593          	mv	a1,a0
    ef8c:	00050b93          	mv	s7,a0
    ef90:	000b0513          	mv	a0,s6
    ef94:	75c030ef          	jal	126f0 <__mulsi3>
    ef98:	00412683          	lw	a3,4(sp)
    ef9c:	00098593          	mv	a1,s3
    efa0:	00a12223          	sw	a0,4(sp)
    efa4:	00068513          	mv	a0,a3
    efa8:	7bc030ef          	jal	12764 <__umodsi3>
    efac:	00412703          	lw	a4,4(sp)
    efb0:	01051513          	slli	a0,a0,0x10
    efb4:	010ad793          	srli	a5,s5,0x10
    efb8:	00a7e7b3          	or	a5,a5,a0
    efbc:	00e7fc63          	bgeu	a5,a4,efd4 <__umoddi3+0x278>
    efc0:	00f906b3          	add	a3,s2,a5
    efc4:	00068793          	mv	a5,a3
    efc8:	00e6f463          	bgeu	a3,a4,efd0 <__umoddi3+0x274>
    efcc:	3d26f863          	bgeu	a3,s2,f39c <__umoddi3+0x640>
    efd0:	fffb8b93          	addi	s7,s7,-1
    efd4:	40e787b3          	sub	a5,a5,a4
    efd8:	00078513          	mv	a0,a5
    efdc:	00098593          	mv	a1,s3
    efe0:	00f12623          	sw	a5,12(sp)
    efe4:	738030ef          	jal	1271c <__hidden___udivsi3>
    efe8:	00050593          	mv	a1,a0
    efec:	00a12423          	sw	a0,8(sp)
    eff0:	000b0513          	mv	a0,s6
    eff4:	6fc030ef          	jal	126f0 <__mulsi3>
    eff8:	00a12223          	sw	a0,4(sp)
    effc:	00c12503          	lw	a0,12(sp)
    f000:	00098593          	mv	a1,s3
    f004:	760030ef          	jal	12764 <__umodsi3>
    f008:	010a9793          	slli	a5,s5,0x10
    f00c:	00412883          	lw	a7,4(sp)
    f010:	0107d793          	srli	a5,a5,0x10
    f014:	01051513          	slli	a0,a0,0x10
    f018:	00a7e7b3          	or	a5,a5,a0
    f01c:	00812683          	lw	a3,8(sp)
    f020:	0117fc63          	bgeu	a5,a7,f038 <__umoddi3+0x2dc>
    f024:	00f90633          	add	a2,s2,a5
    f028:	00060793          	mv	a5,a2
    f02c:	01167463          	bgeu	a2,a7,f034 <__umoddi3+0x2d8>
    f030:	37267063          	bgeu	a2,s2,f390 <__umoddi3+0x634>
    f034:	fff68693          	addi	a3,a3,-1
    f038:	411788b3          	sub	a7,a5,a7
    f03c:	01069793          	slli	a5,a3,0x10
    f040:	0107d793          	srli	a5,a5,0x10
    f044:	010b9713          	slli	a4,s7,0x10
    f048:	010c1593          	slli	a1,s8,0x10
    f04c:	00d76733          	or	a4,a4,a3
    f050:	00078513          	mv	a0,a5
    f054:	0105d593          	srli	a1,a1,0x10
    f058:	698030ef          	jal	126f0 <__mulsi3>
    f05c:	00050e13          	mv	t3,a0
    f060:	010c5593          	srli	a1,s8,0x10
    f064:	00078513          	mv	a0,a5
    f068:	688030ef          	jal	126f0 <__mulsi3>
    f06c:	010c1593          	slli	a1,s8,0x10
    f070:	00050793          	mv	a5,a0
    f074:	0105d593          	srli	a1,a1,0x10
    f078:	01075513          	srli	a0,a4,0x10
    f07c:	674030ef          	jal	126f0 <__mulsi3>
    f080:	00050f13          	mv	t5,a0
    f084:	010c5593          	srli	a1,s8,0x10
    f088:	01075513          	srli	a0,a4,0x10
    f08c:	664030ef          	jal	126f0 <__mulsi3>
    f090:	01e787b3          	add	a5,a5,t5
    f094:	010e5713          	srli	a4,t3,0x10
    f098:	00e787b3          	add	a5,a5,a4
    f09c:	01e7f663          	bgeu	a5,t5,f0a8 <__umoddi3+0x34c>
    f0a0:	00010737          	lui	a4,0x10
    f0a4:	00e50533          	add	a0,a0,a4
    f0a8:	0107d713          	srli	a4,a5,0x10
    f0ac:	010e1e13          	slli	t3,t3,0x10
    f0b0:	010e5e13          	srli	t3,t3,0x10
    f0b4:	01079793          	slli	a5,a5,0x10
    f0b8:	00a70733          	add	a4,a4,a0
    f0bc:	01c787b3          	add	a5,a5,t3
    f0c0:	00e8e863          	bltu	a7,a4,f0d0 <__umoddi3+0x374>
    f0c4:	40e885b3          	sub	a1,a7,a4
    f0c8:	02e89063          	bne	a7,a4,f0e8 <__umoddi3+0x38c>
    f0cc:	00fa7e63          	bgeu	s4,a5,f0e8 <__umoddi3+0x38c>
    f0d0:	41878633          	sub	a2,a5,s8
    f0d4:	00c7b7b3          	sltu	a5,a5,a2
    f0d8:	012787b3          	add	a5,a5,s2
    f0dc:	40f70733          	sub	a4,a4,a5
    f0e0:	40e885b3          	sub	a1,a7,a4
    f0e4:	00060793          	mv	a5,a2
    f0e8:	40fa07b3          	sub	a5,s4,a5
    f0ec:	00fa3933          	sltu	s2,s4,a5
    f0f0:	412585b3          	sub	a1,a1,s2
    f0f4:	009594b3          	sll	s1,a1,s1
    f0f8:	03c12083          	lw	ra,60(sp)
    f0fc:	0087d7b3          	srl	a5,a5,s0
    f100:	0085d5b3          	srl	a1,a1,s0
    f104:	03812403          	lw	s0,56(sp)
    f108:	03012903          	lw	s2,48(sp)
    f10c:	02c12983          	lw	s3,44(sp)
    f110:	02812a03          	lw	s4,40(sp)
    f114:	02412a83          	lw	s5,36(sp)
    f118:	02012b03          	lw	s6,32(sp)
    f11c:	01c12b83          	lw	s7,28(sp)
    f120:	01812c03          	lw	s8,24(sp)
    f124:	00f4e533          	or	a0,s1,a5
    f128:	03412483          	lw	s1,52(sp)
    f12c:	04010113          	addi	sp,sp,64
    f130:	00008067          	ret
    f134:	1e060063          	beqz	a2,f314 <__umoddi3+0x5b8>
    f138:	000106b7          	lui	a3,0x10
    f13c:	22d67063          	bgeu	a2,a3,f35c <__umoddi3+0x600>
    f140:	10063593          	sltiu	a1,a2,256
    f144:	0015b593          	seqz	a1,a1
    f148:	00359593          	slli	a1,a1,0x3
    f14c:	00b65533          	srl	a0,a2,a1
    f150:	00004697          	auipc	a3,0x4
    f154:	3e068693          	addi	a3,a3,992 # 13530 <__clz_tab>
    f158:	00a686b3          	add	a3,a3,a0
    f15c:	0006c683          	lbu	a3,0(a3)
    f160:	02000513          	li	a0,32
    f164:	00b686b3          	add	a3,a3,a1
    f168:	40d50433          	sub	s0,a0,a3
    f16c:	1ca68e63          	beq	a3,a0,f348 <__umoddi3+0x5ec>
    f170:	008614b3          	sll	s1,a2,s0
    f174:	0104d993          	srli	s3,s1,0x10
    f178:	00d75633          	srl	a2,a4,a3
    f17c:	00060513          	mv	a0,a2
    f180:	00d7d6b3          	srl	a3,a5,a3
    f184:	00871733          	sll	a4,a4,s0
    f188:	00098593          	mv	a1,s3
    f18c:	01049a13          	slli	s4,s1,0x10
    f190:	00879933          	sll	s2,a5,s0
    f194:	00c12423          	sw	a2,8(sp)
    f198:	03512223          	sw	s5,36(sp)
    f19c:	010a5a13          	srli	s4,s4,0x10
    f1a0:	00e6eab3          	or	s5,a3,a4
    f1a4:	578030ef          	jal	1271c <__hidden___udivsi3>
    f1a8:	000a0593          	mv	a1,s4
    f1ac:	544030ef          	jal	126f0 <__mulsi3>
    f1b0:	00a12223          	sw	a0,4(sp)
    f1b4:	00812503          	lw	a0,8(sp)
    f1b8:	00098593          	mv	a1,s3
    f1bc:	5a8030ef          	jal	12764 <__umodsi3>
    f1c0:	00412683          	lw	a3,4(sp)
    f1c4:	01051513          	slli	a0,a0,0x10
    f1c8:	010ad793          	srli	a5,s5,0x10
    f1cc:	00a7e7b3          	or	a5,a5,a0
    f1d0:	02d7f263          	bgeu	a5,a3,f1f4 <__umoddi3+0x498>
    f1d4:	00f487b3          	add	a5,s1,a5
    f1d8:	0097b633          	sltu	a2,a5,s1
    f1dc:	00d7b733          	sltu	a4,a5,a3
    f1e0:	00163613          	seqz	a2,a2
    f1e4:	00c77733          	and	a4,a4,a2
    f1e8:	40e00733          	neg	a4,a4
    f1ec:	00977733          	and	a4,a4,s1
    f1f0:	00f707b3          	add	a5,a4,a5
    f1f4:	40d787b3          	sub	a5,a5,a3
    f1f8:	00078513          	mv	a0,a5
    f1fc:	00098593          	mv	a1,s3
    f200:	00f12423          	sw	a5,8(sp)
    f204:	518030ef          	jal	1271c <__hidden___udivsi3>
    f208:	000a0593          	mv	a1,s4
    f20c:	4e4030ef          	jal	126f0 <__mulsi3>
    f210:	00a12223          	sw	a0,4(sp)
    f214:	00812503          	lw	a0,8(sp)
    f218:	00098593          	mv	a1,s3
    f21c:	548030ef          	jal	12764 <__umodsi3>
    f220:	010a9793          	slli	a5,s5,0x10
    f224:	00412683          	lw	a3,4(sp)
    f228:	0107d793          	srli	a5,a5,0x10
    f22c:	01051513          	slli	a0,a0,0x10
    f230:	00a7e7b3          	or	a5,a5,a0
    f234:	02d7f263          	bgeu	a5,a3,f258 <__umoddi3+0x4fc>
    f238:	00f487b3          	add	a5,s1,a5
    f23c:	0097b633          	sltu	a2,a5,s1
    f240:	00d7b733          	sltu	a4,a5,a3
    f244:	00163613          	seqz	a2,a2
    f248:	00c77733          	and	a4,a4,a2
    f24c:	40e00733          	neg	a4,a4
    f250:	00977733          	and	a4,a4,s1
    f254:	00f707b3          	add	a5,a4,a5
    f258:	02412a83          	lw	s5,36(sp)
    f25c:	40d787b3          	sub	a5,a5,a3
    f260:	00078513          	mv	a0,a5
    f264:	00098593          	mv	a1,s3
    f268:	00f12423          	sw	a5,8(sp)
    f26c:	4b0030ef          	jal	1271c <__hidden___udivsi3>
    f270:	000a0593          	mv	a1,s4
    f274:	47c030ef          	jal	126f0 <__mulsi3>
    f278:	00a12223          	sw	a0,4(sp)
    f27c:	00812503          	lw	a0,8(sp)
    f280:	00098593          	mv	a1,s3
    f284:	4e0030ef          	jal	12764 <__umodsi3>
    f288:	00412683          	lw	a3,4(sp)
    f28c:	01051513          	slli	a0,a0,0x10
    f290:	01095793          	srli	a5,s2,0x10
    f294:	00a7e7b3          	or	a5,a5,a0
    f298:	02d7f263          	bgeu	a5,a3,f2bc <__umoddi3+0x560>
    f29c:	00f487b3          	add	a5,s1,a5
    f2a0:	0097b633          	sltu	a2,a5,s1
    f2a4:	00d7b733          	sltu	a4,a5,a3
    f2a8:	00163613          	seqz	a2,a2
    f2ac:	00c77733          	and	a4,a4,a2
    f2b0:	40e00733          	neg	a4,a4
    f2b4:	00977733          	and	a4,a4,s1
    f2b8:	00f707b3          	add	a5,a4,a5
    f2bc:	40d787b3          	sub	a5,a5,a3
    f2c0:	00078513          	mv	a0,a5
    f2c4:	00098593          	mv	a1,s3
    f2c8:	00f12423          	sw	a5,8(sp)
    f2cc:	450030ef          	jal	1271c <__hidden___udivsi3>
    f2d0:	000a0593          	mv	a1,s4
    f2d4:	41c030ef          	jal	126f0 <__mulsi3>
    f2d8:	00a12223          	sw	a0,4(sp)
    f2dc:	00812503          	lw	a0,8(sp)
    f2e0:	00098593          	mv	a1,s3
    f2e4:	01091913          	slli	s2,s2,0x10
    f2e8:	47c030ef          	jal	12764 <__umodsi3>
    f2ec:	00412703          	lw	a4,4(sp)
    f2f0:	01095913          	srli	s2,s2,0x10
    f2f4:	01051513          	slli	a0,a0,0x10
    f2f8:	00a96533          	or	a0,s2,a0
    f2fc:	bae57ae3          	bgeu	a0,a4,eeb0 <__umoddi3+0x154>
    f300:	b91ff06f          	j	ee90 <__umoddi3+0x134>
    f304:	10063593          	sltiu	a1,a2,256
    f308:	0015b593          	seqz	a1,a1
    f30c:	00359593          	slli	a1,a1,0x3
    f310:	a9dff06f          	j	edac <__umoddi3+0x50>
    f314:	00000513          	li	a0,0
    f318:	00000593          	li	a1,0
    f31c:	e35ff06f          	j	f150 <__umoddi3+0x3f4>
    f320:	1006b593          	sltiu	a1,a3,256
    f324:	0015b593          	seqz	a1,a1
    f328:	00359593          	slli	a1,a1,0x3
    f32c:	bd9ff06f          	j	ef04 <__umoddi3+0x1a8>
    f330:	04e6e663          	bltu	a3,a4,f37c <__umoddi3+0x620>
    f334:	04c7f463          	bgeu	a5,a2,f37c <__umoddi3+0x620>
    f338:	03412483          	lw	s1,52(sp)
    f33c:	00030513          	mv	a0,t1
    f340:	00088593          	mv	a1,a7
    f344:	b8dff06f          	j	eed0 <__umoddi3+0x174>
    f348:	01061a13          	slli	s4,a2,0x10
    f34c:	40c707b3          	sub	a5,a4,a2
    f350:	01065993          	srli	s3,a2,0x10
    f354:	010a5a13          	srli	s4,s4,0x10
    f358:	f09ff06f          	j	f260 <__umoddi3+0x504>
    f35c:	010006b7          	lui	a3,0x1000
    f360:	00d67863          	bgeu	a2,a3,f370 <__umoddi3+0x614>
    f364:	01065513          	srli	a0,a2,0x10
    f368:	01000593          	li	a1,16
    f36c:	de5ff06f          	j	f150 <__umoddi3+0x3f4>
    f370:	01865513          	srli	a0,a2,0x18
    f374:	01800593          	li	a1,24
    f378:	dd9ff06f          	j	f150 <__umoddi3+0x3f4>
    f37c:	40c78333          	sub	t1,a5,a2
    f380:	0067b8b3          	sltu	a7,a5,t1
    f384:	40d706b3          	sub	a3,a4,a3
    f388:	411688b3          	sub	a7,a3,a7
    f38c:	fadff06f          	j	f338 <__umoddi3+0x5dc>
    f390:	ffe68693          	addi	a3,a3,-2 # fffffe <_sidata+0xfec806>
    f394:	012607b3          	add	a5,a2,s2
    f398:	ca1ff06f          	j	f038 <__umoddi3+0x2dc>
    f39c:	ffeb8b93          	addi	s7,s7,-2
    f3a0:	012687b3          	add	a5,a3,s2
    f3a4:	c31ff06f          	j	efd4 <__umoddi3+0x278>

0000f3a8 <__adddf3>:
    f3a8:	00100337          	lui	t1,0x100
    f3ac:	fff30313          	addi	t1,t1,-1 # fffff <_sidata+0xec807>
    f3b0:	00b377b3          	and	a5,t1,a1
    f3b4:	00d37e33          	and	t3,t1,a3
    f3b8:	0145d813          	srli	a6,a1,0x14
    f3bc:	0146d893          	srli	a7,a3,0x14
    f3c0:	00379793          	slli	a5,a5,0x3
    f3c4:	fe010113          	addi	sp,sp,-32
    f3c8:	01d55713          	srli	a4,a0,0x1d
    f3cc:	00f76733          	or	a4,a4,a5
    f3d0:	003e1e13          	slli	t3,t3,0x3
    f3d4:	01d65793          	srli	a5,a2,0x1d
    f3d8:	7ff87813          	andi	a6,a6,2047
    f3dc:	7ff8f893          	andi	a7,a7,2047
    f3e0:	00112e23          	sw	ra,28(sp)
    f3e4:	01f5d593          	srli	a1,a1,0x1f
    f3e8:	01f6d693          	srli	a3,a3,0x1f
    f3ec:	01c7e7b3          	or	a5,a5,t3
    f3f0:	41180eb3          	sub	t4,a6,a7
    f3f4:	00351f13          	slli	t5,a0,0x3
    f3f8:	00361f93          	slli	t6,a2,0x3
    f3fc:	18d58e63          	beq	a1,a3,f598 <__adddf3+0x1f0>
    f400:	00050313          	mv	t1,a0
    f404:	0fd05c63          	blez	t4,f4fc <__adddf3+0x154>
    f408:	24088663          	beqz	a7,f654 <__adddf3+0x2ac>
    f40c:	7ff00693          	li	a3,2047
    f410:	4ed80463          	beq	a6,a3,f8f8 <__adddf3+0x550>
    f414:	03800693          	li	a3,56
    f418:	25d6ce63          	blt	a3,t4,f674 <__adddf3+0x2cc>
    f41c:	008006b7          	lui	a3,0x800
    f420:	00d7e7b3          	or	a5,a5,a3
    f424:	01f00693          	li	a3,31
    f428:	5fd6cc63          	blt	a3,t4,fa20 <__adddf3+0x678>
    f42c:	02000693          	li	a3,32
    f430:	41d686b3          	sub	a3,a3,t4
    f434:	00d79633          	sll	a2,a5,a3
    f438:	00df96b3          	sll	a3,t6,a3
    f43c:	01dfdfb3          	srl	t6,t6,t4
    f440:	00d036b3          	snez	a3,a3
    f444:	01f66633          	or	a2,a2,t6
    f448:	01d7deb3          	srl	t4,a5,t4
    f44c:	00d66633          	or	a2,a2,a3
    f450:	41d70733          	sub	a4,a4,t4
    f454:	40cf0633          	sub	a2,t5,a2
    f458:	00cf37b3          	sltu	a5,t5,a2
    f45c:	40f70733          	sub	a4,a4,a5
    f460:	00871793          	slli	a5,a4,0x8
    f464:	4207d063          	bgez	a5,f884 <__adddf3+0x4dc>
    f468:	00971713          	slli	a4,a4,0x9
    f46c:	00975713          	srli	a4,a4,0x9
    f470:	22071263          	bnez	a4,f694 <__adddf3+0x2ec>
    f474:	00060513          	mv	a0,a2
    f478:	00e12623          	sw	a4,12(sp)
    f47c:	01012423          	sw	a6,8(sp)
    f480:	00b12223          	sw	a1,4(sp)
    f484:	00c12023          	sw	a2,0(sp)
    f488:	340030ef          	jal	127c8 <__clzsi2>
    f48c:	01850693          	addi	a3,a0,24
    f490:	01f00893          	li	a7,31
    f494:	00012603          	lw	a2,0(sp)
    f498:	00412583          	lw	a1,4(sp)
    f49c:	00812803          	lw	a6,8(sp)
    f4a0:	00000713          	li	a4,0
    f4a4:	20d8de63          	bge	a7,a3,f6c0 <__adddf3+0x318>
    f4a8:	ff850793          	addi	a5,a0,-8
    f4ac:	00f617b3          	sll	a5,a2,a5
    f4b0:	5b06c263          	blt	a3,a6,fa54 <__adddf3+0x6ac>
    f4b4:	41068633          	sub	a2,a3,a6
    f4b8:	00160693          	addi	a3,a2,1
    f4bc:	18d8dae3          	bge	a7,a3,fe50 <__adddf3+0xaa8>
    f4c0:	fe160613          	addi	a2,a2,-31
    f4c4:	02000513          	li	a0,32
    f4c8:	00c7d633          	srl	a2,a5,a2
    f4cc:	00a68c63          	beq	a3,a0,f4e4 <__adddf3+0x13c>
    f4d0:	04000513          	li	a0,64
    f4d4:	40d506b3          	sub	a3,a0,a3
    f4d8:	00d797b3          	sll	a5,a5,a3
    f4dc:	00f037b3          	snez	a5,a5
    f4e0:	00f66633          	or	a2,a2,a5
    f4e4:	2e060263          	beqz	a2,f7c8 <__adddf3+0x420>
    f4e8:	00767793          	andi	a5,a2,7
    f4ec:	22079463          	bnez	a5,f714 <__adddf3+0x36c>
    f4f0:	00060f13          	mv	t5,a2
    f4f4:	00000713          	li	a4,0
    f4f8:	25c0006f          	j	f754 <__adddf3+0x3ac>
    f4fc:	220e8c63          	beqz	t4,f734 <__adddf3+0x38c>
    f500:	41088333          	sub	t1,a7,a6
    f504:	46081063          	bnez	a6,f964 <__adddf3+0x5bc>
    f508:	01e765b3          	or	a1,a4,t5
    f50c:	62058263          	beqz	a1,fb30 <__adddf3+0x788>
    f510:	fff30593          	addi	a1,t1,-1
    f514:	7a058a63          	beqz	a1,fcc8 <__adddf3+0x920>
    f518:	7ff00513          	li	a0,2047
    f51c:	70a30263          	beq	t1,a0,fc20 <__adddf3+0x878>
    f520:	03800613          	li	a2,56
    f524:	0eb65ce3          	bge	a2,a1,fe1c <__adddf3+0xa74>
    f528:	ffff8613          	addi	a2,t6,-1
    f52c:	00cfbfb3          	sltu	t6,t6,a2
    f530:	41f78733          	sub	a4,a5,t6
    f534:	00871593          	slli	a1,a4,0x8
    f538:	008007b7          	lui	a5,0x800
    f53c:	1805c4e3          	bltz	a1,fec4 <__adddf3+0xb1c>
    f540:	00068593          	mv	a1,a3
    f544:	00030813          	mv	a6,t1
    f548:	00460793          	addi	a5,a2,4
    f54c:	00c7b633          	sltu	a2,a5,a2
    f550:	00c70733          	add	a4,a4,a2
    f554:	00078613          	mv	a2,a5
    f558:	00871793          	slli	a5,a4,0x8
    f55c:	3207de63          	bgez	a5,f898 <__adddf3+0x4f0>
    f560:	00180693          	addi	a3,a6,1
    f564:	7ff00793          	li	a5,2047
    f568:	0015fe13          	andi	t3,a1,1
    f56c:	2cf69a63          	bne	a3,a5,f840 <__adddf3+0x498>
    f570:	01469713          	slli	a4,a3,0x14
    f574:	01c12083          	lw	ra,28(sp)
    f578:	00000793          	li	a5,0
    f57c:	00f767b3          	or	a5,a4,a5
    f580:	01fe1713          	slli	a4,t3,0x1f
    f584:	00e7e6b3          	or	a3,a5,a4
    f588:	00000513          	li	a0,0
    f58c:	00068593          	mv	a1,a3
    f590:	02010113          	addi	sp,sp,32
    f594:	00008067          	ret
    f598:	00058e13          	mv	t3,a1
    f59c:	25d05e63          	blez	t4,f7f8 <__adddf3+0x450>
    f5a0:	1e089c63          	bnez	a7,f798 <__adddf3+0x3f0>
    f5a4:	01f7e6b3          	or	a3,a5,t6
    f5a8:	66068663          	beqz	a3,fc14 <__adddf3+0x86c>
    f5ac:	fff80e93          	addi	t4,a6,-1
    f5b0:	5a0e8863          	beqz	t4,fb60 <__adddf3+0x7b8>
    f5b4:	7ff00693          	li	a3,2047
    f5b8:	64d80263          	beq	a6,a3,fbfc <__adddf3+0x854>
    f5bc:	03800693          	li	a3,56
    f5c0:	1fd6ca63          	blt	a3,t4,f7b4 <__adddf3+0x40c>
    f5c4:	01f00693          	li	a3,31
    f5c8:	69d6c863          	blt	a3,t4,fc58 <__adddf3+0x8b0>
    f5cc:	02000613          	li	a2,32
    f5d0:	41d60633          	sub	a2,a2,t4
    f5d4:	00c796b3          	sll	a3,a5,a2
    f5d8:	00cf9633          	sll	a2,t6,a2
    f5dc:	01dfdfb3          	srl	t6,t6,t4
    f5e0:	00c03633          	snez	a2,a2
    f5e4:	01f6e6b3          	or	a3,a3,t6
    f5e8:	01d7deb3          	srl	t4,a5,t4
    f5ec:	00c6e6b3          	or	a3,a3,a2
    f5f0:	01d70733          	add	a4,a4,t4
    f5f4:	01e687b3          	add	a5,a3,t5
    f5f8:	00d7b6b3          	sltu	a3,a5,a3
    f5fc:	00d70733          	add	a4,a4,a3
    f600:	00078613          	mv	a2,a5
    f604:	00871793          	slli	a5,a4,0x8
    f608:	2607de63          	bgez	a5,f884 <__adddf3+0x4dc>
    f60c:	00180813          	addi	a6,a6,1
    f610:	7ff00793          	li	a5,2047
    f614:	62f80463          	beq	a6,a5,fc3c <__adddf3+0x894>
    f618:	ff8007b7          	lui	a5,0xff800
    f61c:	00165693          	srli	a3,a2,0x1
    f620:	fff78793          	addi	a5,a5,-1 # ff7fffff <_stack_top+0xef7fbfff>
    f624:	00167613          	andi	a2,a2,1
    f628:	00c6e6b3          	or	a3,a3,a2
    f62c:	00f777b3          	and	a5,a4,a5
    f630:	01f79613          	slli	a2,a5,0x1f
    f634:	0076f513          	andi	a0,a3,7
    f638:	0017d713          	srli	a4,a5,0x1
    f63c:	00d66633          	or	a2,a2,a3
    f640:	f0050ce3          	beqz	a0,f558 <__adddf3+0x1b0>
    f644:	00f67793          	andi	a5,a2,15
    f648:	00400693          	li	a3,4
    f64c:	f0d786e3          	beq	a5,a3,f558 <__adddf3+0x1b0>
    f650:	ef9ff06f          	j	f548 <__adddf3+0x1a0>
    f654:	01f7e6b3          	or	a3,a5,t6
    f658:	3a068e63          	beqz	a3,fa14 <__adddf3+0x66c>
    f65c:	fff80e93          	addi	t4,a6,-1
    f660:	540e8e63          	beqz	t4,fbbc <__adddf3+0x814>
    f664:	7ff00693          	li	a3,2047
    f668:	28d80863          	beq	a6,a3,f8f8 <__adddf3+0x550>
    f66c:	03800693          	li	a3,56
    f670:	dbd6dae3          	bge	a3,t4,f424 <__adddf3+0x7c>
    f674:	ffff0613          	addi	a2,t5,-1
    f678:	00cf37b3          	sltu	a5,t5,a2
    f67c:	40f70733          	sub	a4,a4,a5
    f680:	00871693          	slli	a3,a4,0x8
    f684:	008007b7          	lui	a5,0x800
    f688:	ec06d0e3          	bgez	a3,f548 <__adddf3+0x1a0>
    f68c:	fff78713          	addi	a4,a5,-1 # 7fffff <_sidata+0x7ec807>
    f690:	fff00613          	li	a2,-1
    f694:	00070513          	mv	a0,a4
    f698:	00c12623          	sw	a2,12(sp)
    f69c:	01012423          	sw	a6,8(sp)
    f6a0:	00b12223          	sw	a1,4(sp)
    f6a4:	00e12023          	sw	a4,0(sp)
    f6a8:	120030ef          	jal	127c8 <__clzsi2>
    f6ac:	00012703          	lw	a4,0(sp)
    f6b0:	00412583          	lw	a1,4(sp)
    f6b4:	00812803          	lw	a6,8(sp)
    f6b8:	00c12603          	lw	a2,12(sp)
    f6bc:	ff850693          	addi	a3,a0,-8
    f6c0:	02000513          	li	a0,32
    f6c4:	40d507b3          	sub	a5,a0,a3
    f6c8:	00f657b3          	srl	a5,a2,a5
    f6cc:	00d71733          	sll	a4,a4,a3
    f6d0:	00e7e7b3          	or	a5,a5,a4
    f6d4:	00d61633          	sll	a2,a2,a3
    f6d8:	3306c063          	blt	a3,a6,f9f8 <__adddf3+0x650>
    f6dc:	410686b3          	sub	a3,a3,a6
    f6e0:	00168693          	addi	a3,a3,1 # 800001 <_sidata+0x7ec809>
    f6e4:	40d50533          	sub	a0,a0,a3
    f6e8:	00a61733          	sll	a4,a2,a0
    f6ec:	00e03833          	snez	a6,a4
    f6f0:	00d65733          	srl	a4,a2,a3
    f6f4:	00a79533          	sll	a0,a5,a0
    f6f8:	00e86733          	or	a4,a6,a4
    f6fc:	00e56633          	or	a2,a0,a4
    f700:	00d7d733          	srl	a4,a5,a3
    f704:	00e667b3          	or	a5,a2,a4
    f708:	0c078063          	beqz	a5,f7c8 <__adddf3+0x420>
    f70c:	00767793          	andi	a5,a2,7
    f710:	7c078c63          	beqz	a5,fee8 <__adddf3+0xb40>
    f714:	00f67793          	andi	a5,a2,15
    f718:	00400693          	li	a3,4
    f71c:	32d79863          	bne	a5,a3,fa4c <__adddf3+0x6a4>
    f720:	00871793          	slli	a5,a4,0x8
    f724:	7607dc63          	bgez	a5,fe9c <__adddf3+0xaf4>
    f728:	0015fe13          	andi	t3,a1,1
    f72c:	00100693          	li	a3,1
    f730:	1140006f          	j	f844 <__adddf3+0x49c>
    f734:	00180513          	addi	a0,a6,1
    f738:	7fe57513          	andi	a0,a0,2046
    f73c:	28051463          	bnez	a0,f9c4 <__adddf3+0x61c>
    f740:	01e768b3          	or	a7,a4,t5
    f744:	01f7e533          	or	a0,a5,t6
    f748:	40081063          	bnez	a6,fb48 <__adddf3+0x7a0>
    f74c:	5a088a63          	beqz	a7,fd00 <__adddf3+0x958>
    f750:	5c051263          	bnez	a0,fd14 <__adddf3+0x96c>
    f754:	003f5793          	srli	a5,t5,0x3
    f758:	01d71513          	slli	a0,a4,0x1d
    f75c:	00f56533          	or	a0,a0,a5
    f760:	00000813          	li	a6,0
    f764:	00375793          	srli	a5,a4,0x3
    f768:	7ff87693          	andi	a3,a6,2047
    f76c:	00c79793          	slli	a5,a5,0xc
    f770:	01469713          	slli	a4,a3,0x14
    f774:	01c12083          	lw	ra,28(sp)
    f778:	0015fe13          	andi	t3,a1,1
    f77c:	00c7d793          	srli	a5,a5,0xc
    f780:	00f767b3          	or	a5,a4,a5
    f784:	01fe1713          	slli	a4,t3,0x1f
    f788:	00e7e6b3          	or	a3,a5,a4
    f78c:	00068593          	mv	a1,a3
    f790:	02010113          	addi	sp,sp,32
    f794:	00008067          	ret
    f798:	7ff00693          	li	a3,2047
    f79c:	46d80063          	beq	a6,a3,fbfc <__adddf3+0x854>
    f7a0:	03800693          	li	a3,56
    f7a4:	01d6c863          	blt	a3,t4,f7b4 <__adddf3+0x40c>
    f7a8:	008006b7          	lui	a3,0x800
    f7ac:	00d7e7b3          	or	a5,a5,a3
    f7b0:	e15ff06f          	j	f5c4 <__adddf3+0x21c>
    f7b4:	00871793          	slli	a5,a4,0x8
    f7b8:	001f0613          	addi	a2,t5,1
    f7bc:	d807d6e3          	bgez	a5,f548 <__adddf3+0x1a0>
    f7c0:	00800737          	lui	a4,0x800
    f7c4:	e49ff06f          	j	f60c <__adddf3+0x264>
    f7c8:	0015fe13          	andi	t3,a1,1
    f7cc:	00000693          	li	a3,0
    f7d0:	00000793          	li	a5,0
    f7d4:	00000513          	li	a0,0
    f7d8:	01469713          	slli	a4,a3,0x14
    f7dc:	01c12083          	lw	ra,28(sp)
    f7e0:	00f767b3          	or	a5,a4,a5
    f7e4:	01fe1713          	slli	a4,t3,0x1f
    f7e8:	00e7e6b3          	or	a3,a5,a4
    f7ec:	00068593          	mv	a1,a3
    f7f0:	02010113          	addi	sp,sp,32
    f7f4:	00008067          	ret
    f7f8:	100e8c63          	beqz	t4,f910 <__adddf3+0x568>
    f7fc:	410886b3          	sub	a3,a7,a6
    f800:	26081863          	bnez	a6,fa70 <__adddf3+0x6c8>
    f804:	01e76533          	or	a0,a4,t5
    f808:	5c050a63          	beqz	a0,fddc <__adddf3+0xa34>
    f80c:	fff68513          	addi	a0,a3,-1 # 7fffff <_sidata+0x7ec807>
    f810:	34050863          	beqz	a0,fb60 <__adddf3+0x7b8>
    f814:	7ff00813          	li	a6,2047
    f818:	47068663          	beq	a3,a6,fc84 <__adddf3+0x8dc>
    f81c:	03800613          	li	a2,56
    f820:	68a65e63          	bge	a2,a0,febc <__adddf3+0xb14>
    f824:	00068813          	mv	a6,a3
    f828:	00879693          	slli	a3,a5,0x8
    f82c:	001f8613          	addi	a2,t6,1
    f830:	00800737          	lui	a4,0x800
    f834:	dc06cce3          	bltz	a3,f60c <__adddf3+0x264>
    f838:	00078713          	mv	a4,a5
    f83c:	d0dff06f          	j	f548 <__adddf3+0x1a0>
    f840:	00f6f6b3          	and	a3,a3,a5
    f844:	ff8007b7          	lui	a5,0xff800
    f848:	fff78793          	addi	a5,a5,-1 # ff7fffff <_stack_top+0xef7fbfff>
    f84c:	00f777b3          	and	a5,a4,a5
    f850:	00979713          	slli	a4,a5,0x9
    f854:	01c12083          	lw	ra,28(sp)
    f858:	01d79513          	slli	a0,a5,0x1d
    f85c:	00c75793          	srli	a5,a4,0xc
    f860:	01469713          	slli	a4,a3,0x14
    f864:	00f767b3          	or	a5,a4,a5
    f868:	01fe1713          	slli	a4,t3,0x1f
    f86c:	00365613          	srli	a2,a2,0x3
    f870:	00e7e6b3          	or	a3,a5,a4
    f874:	00c56533          	or	a0,a0,a2
    f878:	00068593          	mv	a1,a3
    f87c:	02010113          	addi	sp,sp,32
    f880:	00008067          	ret
    f884:	00767793          	andi	a5,a2,7
    f888:	00078863          	beqz	a5,f898 <__adddf3+0x4f0>
    f88c:	00f67793          	andi	a5,a2,15
    f890:	00400693          	li	a3,4
    f894:	cad79ae3          	bne	a5,a3,f548 <__adddf3+0x1a0>
    f898:	00365513          	srli	a0,a2,0x3
    f89c:	01d71793          	slli	a5,a4,0x1d
    f8a0:	7ff00693          	li	a3,2047
    f8a4:	00a7e533          	or	a0,a5,a0
    f8a8:	00375793          	srli	a5,a4,0x3
    f8ac:	ead81ee3          	bne	a6,a3,f768 <__adddf3+0x3c0>
    f8b0:	00f56533          	or	a0,a0,a5
    f8b4:	02050a63          	beqz	a0,f8e8 <__adddf3+0x540>
    f8b8:	7ff00693          	li	a3,2047
    f8bc:	01469713          	slli	a4,a3,0x14
    f8c0:	01c12083          	lw	ra,28(sp)
    f8c4:	00000e13          	li	t3,0
    f8c8:	000807b7          	lui	a5,0x80
    f8cc:	00f767b3          	or	a5,a4,a5
    f8d0:	01fe1713          	slli	a4,t3,0x1f
    f8d4:	00e7e6b3          	or	a3,a5,a4
    f8d8:	00000513          	li	a0,0
    f8dc:	00068593          	mv	a1,a3
    f8e0:	02010113          	addi	sp,sp,32
    f8e4:	00008067          	ret
    f8e8:	0015fe13          	andi	t3,a1,1
    f8ec:	7ff00693          	li	a3,2047
    f8f0:	00000793          	li	a5,0
    f8f4:	ee5ff06f          	j	f7d8 <__adddf3+0x430>
    f8f8:	00331313          	slli	t1,t1,0x3
    f8fc:	00335313          	srli	t1,t1,0x3
    f900:	01d71513          	slli	a0,a4,0x1d
    f904:	00656533          	or	a0,a0,t1
    f908:	00375793          	srli	a5,a4,0x3
    f90c:	fa5ff06f          	j	f8b0 <__adddf3+0x508>
    f910:	00180693          	addi	a3,a6,1
    f914:	7fe6f893          	andi	a7,a3,2046
    f918:	1a089463          	bnez	a7,fac0 <__adddf3+0x718>
    f91c:	01e766b3          	or	a3,a4,t5
    f920:	2c081863          	bnez	a6,fbf0 <__adddf3+0x848>
    f924:	01f7e633          	or	a2,a5,t6
    f928:	4e068263          	beqz	a3,fe0c <__adddf3+0xa64>
    f92c:	e20604e3          	beqz	a2,f754 <__adddf3+0x3ac>
    f930:	01ff0fb3          	add	t6,t5,t6
    f934:	00f707b3          	add	a5,a4,a5
    f938:	01efbf33          	sltu	t5,t6,t5
    f93c:	01e787b3          	add	a5,a5,t5
    f940:	00879713          	slli	a4,a5,0x8
    f944:	52074863          	bltz	a4,fe74 <__adddf3+0xacc>
    f948:	00ffe733          	or	a4,t6,a5
    f94c:	e6070ee3          	beqz	a4,f7c8 <__adddf3+0x420>
    f950:	01d79513          	slli	a0,a5,0x1d
    f954:	003fdf93          	srli	t6,t6,0x3
    f958:	00afe533          	or	a0,t6,a0
    f95c:	0037d793          	srli	a5,a5,0x3
    f960:	e09ff06f          	j	f768 <__adddf3+0x3c0>
    f964:	7ff00593          	li	a1,2047
    f968:	2ab88c63          	beq	a7,a1,fc20 <__adddf3+0x878>
    f96c:	03800613          	li	a2,56
    f970:	12664663          	blt	a2,t1,fa9c <__adddf3+0x6f4>
    f974:	00800637          	lui	a2,0x800
    f978:	00c76733          	or	a4,a4,a2
    f97c:	01f00613          	li	a2,31
    f980:	30664e63          	blt	a2,t1,fc9c <__adddf3+0x8f4>
    f984:	02000593          	li	a1,32
    f988:	406585b3          	sub	a1,a1,t1
    f98c:	00b71633          	sll	a2,a4,a1
    f990:	00bf15b3          	sll	a1,t5,a1
    f994:	006f5f33          	srl	t5,t5,t1
    f998:	00b035b3          	snez	a1,a1
    f99c:	01e66633          	or	a2,a2,t5
    f9a0:	00675333          	srl	t1,a4,t1
    f9a4:	00b66633          	or	a2,a2,a1
    f9a8:	406787b3          	sub	a5,a5,t1
    f9ac:	40cf8633          	sub	a2,t6,a2
    f9b0:	00cfbfb3          	sltu	t6,t6,a2
    f9b4:	41f78733          	sub	a4,a5,t6
    f9b8:	00088813          	mv	a6,a7
    f9bc:	00068593          	mv	a1,a3
    f9c0:	aa1ff06f          	j	f460 <__adddf3+0xb8>
    f9c4:	41ff0633          	sub	a2,t5,t6
    f9c8:	00cf3533          	sltu	a0,t5,a2
    f9cc:	40f708b3          	sub	a7,a4,a5
    f9d0:	40a888b3          	sub	a7,a7,a0
    f9d4:	00889513          	slli	a0,a7,0x8
    f9d8:	12054e63          	bltz	a0,fb14 <__adddf3+0x76c>
    f9dc:	01166533          	or	a0,a2,a7
    f9e0:	00088713          	mv	a4,a7
    f9e4:	a80516e3          	bnez	a0,f470 <__adddf3+0xc8>
    f9e8:	00000e13          	li	t3,0
    f9ec:	00000693          	li	a3,0
    f9f0:	00000793          	li	a5,0
    f9f4:	de5ff06f          	j	f7d8 <__adddf3+0x430>
    f9f8:	ff800737          	lui	a4,0xff800
    f9fc:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
    fa00:	00e7f733          	and	a4,a5,a4
    fa04:	00767793          	andi	a5,a2,7
    fa08:	40d80833          	sub	a6,a6,a3
    fa0c:	e80790e3          	bnez	a5,f88c <__adddf3+0x4e4>
    fa10:	e89ff06f          	j	f898 <__adddf3+0x4f0>
    fa14:	00351313          	slli	t1,a0,0x3
    fa18:	00335513          	srli	a0,t1,0x3
    fa1c:	e81ff06f          	j	f89c <__adddf3+0x4f4>
    fa20:	fe0e8693          	addi	a3,t4,-32
    fa24:	02000613          	li	a2,32
    fa28:	00d7d6b3          	srl	a3,a5,a3
    fa2c:	00ce8a63          	beq	t4,a2,fa40 <__adddf3+0x698>
    fa30:	04000613          	li	a2,64
    fa34:	41d60633          	sub	a2,a2,t4
    fa38:	00c797b3          	sll	a5,a5,a2
    fa3c:	00ffefb3          	or	t6,t6,a5
    fa40:	01f03633          	snez	a2,t6
    fa44:	00d66633          	or	a2,a2,a3
    fa48:	a0dff06f          	j	f454 <__adddf3+0xac>
    fa4c:	00000813          	li	a6,0
    fa50:	af9ff06f          	j	f548 <__adddf3+0x1a0>
    fa54:	ff800737          	lui	a4,0xff800
    fa58:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
    fa5c:	00e7f7b3          	and	a5,a5,a4
    fa60:	01d79513          	slli	a0,a5,0x1d
    fa64:	40d80833          	sub	a6,a6,a3
    fa68:	0037d793          	srli	a5,a5,0x3
    fa6c:	cfdff06f          	j	f768 <__adddf3+0x3c0>
    fa70:	7ff00513          	li	a0,2047
    fa74:	20a88863          	beq	a7,a0,fc84 <__adddf3+0x8dc>
    fa78:	03800613          	li	a2,56
    fa7c:	2ed65263          	bge	a2,a3,fd60 <__adddf3+0x9b8>
    fa80:	00879693          	slli	a3,a5,0x8
    fa84:	001f8613          	addi	a2,t6,1
    fa88:	00088813          	mv	a6,a7
    fa8c:	00800737          	lui	a4,0x800
    fa90:	b606cee3          	bltz	a3,f60c <__adddf3+0x264>
    fa94:	00078713          	mv	a4,a5
    fa98:	ab1ff06f          	j	f548 <__adddf3+0x1a0>
    fa9c:	ffff8613          	addi	a2,t6,-1
    faa0:	00cfbfb3          	sltu	t6,t6,a2
    faa4:	41f78733          	sub	a4,a5,t6
    faa8:	00871593          	slli	a1,a4,0x8
    faac:	008007b7          	lui	a5,0x800
    fab0:	3005c063          	bltz	a1,fdb0 <__adddf3+0xa08>
    fab4:	00068593          	mv	a1,a3
    fab8:	00088813          	mv	a6,a7
    fabc:	a8dff06f          	j	f548 <__adddf3+0x1a0>
    fac0:	7ff00613          	li	a2,2047
    fac4:	aac686e3          	beq	a3,a2,f570 <__adddf3+0x1c8>
    fac8:	01ff0fb3          	add	t6,t5,t6
    facc:	00f707b3          	add	a5,a4,a5
    fad0:	01efbf33          	sltu	t5,t6,t5
    fad4:	001fd713          	srli	a4,t6,0x1
    fad8:	01e787b3          	add	a5,a5,t5
    fadc:	01f79613          	slli	a2,a5,0x1f
    fae0:	00777513          	andi	a0,a4,7
    fae4:	00e66633          	or	a2,a2,a4
    fae8:	0017d713          	srli	a4,a5,0x1
    faec:	3e050263          	beqz	a0,fed0 <__adddf3+0xb28>
    faf0:	00068813          	mv	a6,a3
    faf4:	00400893          	li	a7,4
    faf8:	00f67693          	andi	a3,a2,15
    fafc:	a51696e3          	bne	a3,a7,f548 <__adddf3+0x1a0>
    fb00:	00365513          	srli	a0,a2,0x3
    fb04:	01d71713          	slli	a4,a4,0x1d
    fb08:	00e56533          	or	a0,a0,a4
    fb0c:	0047d793          	srli	a5,a5,0x4
    fb10:	c59ff06f          	j	f768 <__adddf3+0x3c0>
    fb14:	41ef8f33          	sub	t5,t6,t5
    fb18:	01efbfb3          	sltu	t6,t6,t5
    fb1c:	40e787b3          	sub	a5,a5,a4
    fb20:	000f0613          	mv	a2,t5
    fb24:	41f78733          	sub	a4,a5,t6
    fb28:	00068593          	mv	a1,a3
    fb2c:	945ff06f          	j	f470 <__adddf3+0xc8>
    fb30:	00361613          	slli	a2,a2,0x3
    fb34:	00365513          	srli	a0,a2,0x3
    fb38:	00068593          	mv	a1,a3
    fb3c:	00030813          	mv	a6,t1
    fb40:	00078713          	mv	a4,a5
    fb44:	d59ff06f          	j	f89c <__adddf3+0x4f4>
    fb48:	2a089463          	bnez	a7,fdf0 <__adddf3+0xa48>
    fb4c:	0c051a63          	bnez	a0,fc20 <__adddf3+0x878>
    fb50:	00000e13          	li	t3,0
    fb54:	7ff00693          	li	a3,2047
    fb58:	000807b7          	lui	a5,0x80
    fb5c:	c7dff06f          	j	f7d8 <__adddf3+0x430>
    fb60:	01ff0fb3          	add	t6,t5,t6
    fb64:	01efbf33          	sltu	t5,t6,t5
    fb68:	00f707b3          	add	a5,a4,a5
    fb6c:	01e787b3          	add	a5,a5,t5
    fb70:	00879693          	slli	a3,a5,0x8
    fb74:	2406d863          	bgez	a3,fdc4 <__adddf3+0xa1c>
    fb78:	ff8006b7          	lui	a3,0xff800
    fb7c:	fff68693          	addi	a3,a3,-1 # ff7fffff <_stack_top+0xef7fbfff>
    fb80:	001fd713          	srli	a4,t6,0x1
    fb84:	00d7f7b3          	and	a5,a5,a3
    fb88:	01f79693          	slli	a3,a5,0x1f
    fb8c:	00777613          	andi	a2,a4,7
    fb90:	00e6e6b3          	or	a3,a3,a4
    fb94:	0017d713          	srli	a4,a5,0x1
    fb98:	30060663          	beqz	a2,fea4 <__adddf3+0xafc>
    fb9c:	00f6f613          	andi	a2,a3,15
    fba0:	00400513          	li	a0,4
    fba4:	30a60063          	beq	a2,a0,fea4 <__adddf3+0xafc>
    fba8:	00a68633          	add	a2,a3,a0
    fbac:	00d636b3          	sltu	a3,a2,a3
    fbb0:	00e68733          	add	a4,a3,a4
    fbb4:	00200813          	li	a6,2
    fbb8:	ce1ff06f          	j	f898 <__adddf3+0x4f0>
    fbbc:	41ff0fb3          	sub	t6,t5,t6
    fbc0:	40f707b3          	sub	a5,a4,a5
    fbc4:	01ff3f33          	sltu	t5,t5,t6
    fbc8:	41e78733          	sub	a4,a5,t5
    fbcc:	00871793          	slli	a5,a4,0x8
    fbd0:	000f8613          	mv	a2,t6
    fbd4:	0607ce63          	bltz	a5,fc50 <__adddf3+0x8a8>
    fbd8:	003fdf93          	srli	t6,t6,0x3
    fbdc:	01d71513          	slli	a0,a4,0x1d
    fbe0:	01f56533          	or	a0,a0,t6
    fbe4:	00375793          	srli	a5,a4,0x3
    fbe8:	00100813          	li	a6,1
    fbec:	b7dff06f          	j	f768 <__adddf3+0x3c0>
    fbf0:	08068a63          	beqz	a3,fc84 <__adddf3+0x8dc>
    fbf4:	01f7efb3          	or	t6,a5,t6
    fbf8:	cc0f90e3          	bnez	t6,f8b8 <__adddf3+0x510>
    fbfc:	00351513          	slli	a0,a0,0x3
    fc00:	01d71793          	slli	a5,a4,0x1d
    fc04:	00355513          	srli	a0,a0,0x3
    fc08:	00a7e533          	or	a0,a5,a0
    fc0c:	00375793          	srli	a5,a4,0x3
    fc10:	ca1ff06f          	j	f8b0 <__adddf3+0x508>
    fc14:	00351513          	slli	a0,a0,0x3
    fc18:	00355513          	srli	a0,a0,0x3
    fc1c:	c81ff06f          	j	f89c <__adddf3+0x4f4>
    fc20:	00361613          	slli	a2,a2,0x3
    fc24:	01d79513          	slli	a0,a5,0x1d
    fc28:	00365713          	srli	a4,a2,0x3
    fc2c:	00068593          	mv	a1,a3
    fc30:	00e56533          	or	a0,a0,a4
    fc34:	0037d793          	srli	a5,a5,0x3
    fc38:	c79ff06f          	j	f8b0 <__adddf3+0x508>
    fc3c:	00080693          	mv	a3,a6
    fc40:	00000793          	li	a5,0
    fc44:	00000513          	li	a0,0
    fc48:	b91ff06f          	j	f7d8 <__adddf3+0x430>
    fc4c:	00068593          	mv	a1,a3
    fc50:	00100813          	li	a6,1
    fc54:	815ff06f          	j	f468 <__adddf3+0xc0>
    fc58:	fe0e8613          	addi	a2,t4,-32
    fc5c:	02000693          	li	a3,32
    fc60:	00c7d633          	srl	a2,a5,a2
    fc64:	00de8a63          	beq	t4,a3,fc78 <__adddf3+0x8d0>
    fc68:	04000693          	li	a3,64
    fc6c:	41d686b3          	sub	a3,a3,t4
    fc70:	00d797b3          	sll	a5,a5,a3
    fc74:	00ffefb3          	or	t6,t6,a5
    fc78:	01f036b3          	snez	a3,t6
    fc7c:	00c6e6b3          	or	a3,a3,a2
    fc80:	975ff06f          	j	f5f4 <__adddf3+0x24c>
    fc84:	00361713          	slli	a4,a2,0x3
    fc88:	01d79513          	slli	a0,a5,0x1d
    fc8c:	00375713          	srli	a4,a4,0x3
    fc90:	00e56533          	or	a0,a0,a4
    fc94:	0037d793          	srli	a5,a5,0x3
    fc98:	c19ff06f          	j	f8b0 <__adddf3+0x508>
    fc9c:	fe030593          	addi	a1,t1,-32
    fca0:	02000613          	li	a2,32
    fca4:	00b755b3          	srl	a1,a4,a1
    fca8:	00c30a63          	beq	t1,a2,fcbc <__adddf3+0x914>
    fcac:	04000613          	li	a2,64
    fcb0:	40660633          	sub	a2,a2,t1
    fcb4:	00c71733          	sll	a4,a4,a2
    fcb8:	00ef6f33          	or	t5,t5,a4
    fcbc:	01e03633          	snez	a2,t5
    fcc0:	00b66633          	or	a2,a2,a1
    fcc4:	ce9ff06f          	j	f9ac <__adddf3+0x604>
    fcc8:	41ef8f33          	sub	t5,t6,t5
    fccc:	40e787b3          	sub	a5,a5,a4
    fcd0:	01efbfb3          	sltu	t6,t6,t5
    fcd4:	41f78733          	sub	a4,a5,t6
    fcd8:	00871793          	slli	a5,a4,0x8
    fcdc:	000f0613          	mv	a2,t5
    fce0:	f607c6e3          	bltz	a5,fc4c <__adddf3+0x8a4>
    fce4:	003f5f13          	srli	t5,t5,0x3
    fce8:	01d71513          	slli	a0,a4,0x1d
    fcec:	00068593          	mv	a1,a3
    fcf0:	00af6533          	or	a0,t5,a0
    fcf4:	00375793          	srli	a5,a4,0x3
    fcf8:	00100813          	li	a6,1
    fcfc:	a6dff06f          	j	f768 <__adddf3+0x3c0>
    fd00:	ce0504e3          	beqz	a0,f9e8 <__adddf3+0x640>
    fd04:	00078713          	mv	a4,a5
    fd08:	000f8f13          	mv	t5,t6
    fd0c:	00068593          	mv	a1,a3
    fd10:	a45ff06f          	j	f754 <__adddf3+0x3ac>
    fd14:	41ff0833          	sub	a6,t5,t6
    fd18:	010f3533          	sltu	a0,t5,a6
    fd1c:	40f70633          	sub	a2,a4,a5
    fd20:	40a60633          	sub	a2,a2,a0
    fd24:	00861513          	slli	a0,a2,0x8
    fd28:	12055c63          	bgez	a0,fe60 <__adddf3+0xab8>
    fd2c:	41ef8f33          	sub	t5,t6,t5
    fd30:	40e787b3          	sub	a5,a5,a4
    fd34:	01efbfb3          	sltu	t6,t6,t5
    fd38:	41f78733          	sub	a4,a5,t6
    fd3c:	00ef67b3          	or	a5,t5,a4
    fd40:	000f0613          	mv	a2,t5
    fd44:	00068593          	mv	a1,a3
    fd48:	a80780e3          	beqz	a5,f7c8 <__adddf3+0x420>
    fd4c:	00871793          	slli	a5,a4,0x8
    fd50:	1a07d063          	bgez	a5,fef0 <__adddf3+0xb48>
    fd54:	0016fe13          	andi	t3,a3,1
    fd58:	00100693          	li	a3,1
    fd5c:	ae9ff06f          	j	f844 <__adddf3+0x49c>
    fd60:	00800637          	lui	a2,0x800
    fd64:	00c76733          	or	a4,a4,a2
    fd68:	01f00613          	li	a2,31
    fd6c:	0ad64c63          	blt	a2,a3,fe24 <__adddf3+0xa7c>
    fd70:	02000513          	li	a0,32
    fd74:	40d50533          	sub	a0,a0,a3
    fd78:	00a71633          	sll	a2,a4,a0
    fd7c:	00af1533          	sll	a0,t5,a0
    fd80:	00df5f33          	srl	t5,t5,a3
    fd84:	00a03533          	snez	a0,a0
    fd88:	00d756b3          	srl	a3,a4,a3
    fd8c:	01e66633          	or	a2,a2,t5
    fd90:	00a66733          	or	a4,a2,a0
    fd94:	00d787b3          	add	a5,a5,a3
    fd98:	01f70fb3          	add	t6,a4,t6
    fd9c:	00efb733          	sltu	a4,t6,a4
    fda0:	00f70733          	add	a4,a4,a5
    fda4:	000f8613          	mv	a2,t6
    fda8:	00088813          	mv	a6,a7
    fdac:	859ff06f          	j	f604 <__adddf3+0x25c>
    fdb0:	00088813          	mv	a6,a7
    fdb4:	00068593          	mv	a1,a3
    fdb8:	fff78713          	addi	a4,a5,-1 # 7ffff <_sidata+0x6c807>
    fdbc:	fff00613          	li	a2,-1
    fdc0:	8d5ff06f          	j	f694 <__adddf3+0x2ec>
    fdc4:	01d79513          	slli	a0,a5,0x1d
    fdc8:	003fdf93          	srli	t6,t6,0x3
    fdcc:	01f56533          	or	a0,a0,t6
    fdd0:	0037d793          	srli	a5,a5,0x3
    fdd4:	00100813          	li	a6,1
    fdd8:	991ff06f          	j	f768 <__adddf3+0x3c0>
    fddc:	00361513          	slli	a0,a2,0x3
    fde0:	00355513          	srli	a0,a0,0x3
    fde4:	00068813          	mv	a6,a3
    fde8:	00078713          	mv	a4,a5
    fdec:	ab1ff06f          	j	f89c <__adddf3+0x4f4>
    fdf0:	ac0514e3          	bnez	a0,f8b8 <__adddf3+0x510>
    fdf4:	00331793          	slli	a5,t1,0x3
    fdf8:	0037d793          	srli	a5,a5,0x3
    fdfc:	01d71513          	slli	a0,a4,0x1d
    fe00:	00a7e533          	or	a0,a5,a0
    fe04:	00375793          	srli	a5,a4,0x3
    fe08:	aa9ff06f          	j	f8b0 <__adddf3+0x508>
    fe0c:	9a060ee3          	beqz	a2,f7c8 <__adddf3+0x420>
    fe10:	00078713          	mv	a4,a5
    fe14:	000f8f13          	mv	t5,t6
    fe18:	93dff06f          	j	f754 <__adddf3+0x3ac>
    fe1c:	00058313          	mv	t1,a1
    fe20:	b5dff06f          	j	f97c <__adddf3+0x5d4>
    fe24:	fe068613          	addi	a2,a3,-32
    fe28:	02000513          	li	a0,32
    fe2c:	00c75633          	srl	a2,a4,a2
    fe30:	00a68a63          	beq	a3,a0,fe44 <__adddf3+0xa9c>
    fe34:	04000513          	li	a0,64
    fe38:	40d506b3          	sub	a3,a0,a3
    fe3c:	00d71733          	sll	a4,a4,a3
    fe40:	00ef6f33          	or	t5,t5,a4
    fe44:	01e03733          	snez	a4,t5
    fe48:	00c76733          	or	a4,a4,a2
    fe4c:	f4dff06f          	j	fd98 <__adddf3+0x9f0>
    fe50:	02000513          	li	a0,32
    fe54:	40d50533          	sub	a0,a0,a3
    fe58:	00000813          	li	a6,0
    fe5c:	899ff06f          	j	f6f4 <__adddf3+0x34c>
    fe60:	00c86533          	or	a0,a6,a2
    fe64:	b80502e3          	beqz	a0,f9e8 <__adddf3+0x640>
    fe68:	00060713          	mv	a4,a2
    fe6c:	00080f13          	mv	t5,a6
    fe70:	8e5ff06f          	j	f754 <__adddf3+0x3ac>
    fe74:	ff800737          	lui	a4,0xff800
    fe78:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
    fe7c:	00e7f7b3          	and	a5,a5,a4
    fe80:	01d79513          	slli	a0,a5,0x1d
    fe84:	003fdf93          	srli	t6,t6,0x3
    fe88:	0037d793          	srli	a5,a5,0x3
    fe8c:	01f56533          	or	a0,a0,t6
    fe90:	0067f7b3          	and	a5,a5,t1
    fe94:	00100693          	li	a3,1
    fe98:	941ff06f          	j	f7d8 <__adddf3+0x430>
    fe9c:	00000813          	li	a6,0
    fea0:	9f9ff06f          	j	f898 <__adddf3+0x4f0>
    fea4:	0036d693          	srli	a3,a3,0x3
    fea8:	01d71713          	slli	a4,a4,0x1d
    feac:	00d76533          	or	a0,a4,a3
    feb0:	0047d793          	srli	a5,a5,0x4
    feb4:	00200813          	li	a6,2
    feb8:	8b1ff06f          	j	f768 <__adddf3+0x3c0>
    febc:	00050693          	mv	a3,a0
    fec0:	ea9ff06f          	j	fd68 <__adddf3+0x9c0>
    fec4:	00030813          	mv	a6,t1
    fec8:	00068593          	mv	a1,a3
    fecc:	fc0ff06f          	j	f68c <__adddf3+0x2e4>
    fed0:	00365513          	srli	a0,a2,0x3
    fed4:	01d71713          	slli	a4,a4,0x1d
    fed8:	00e56533          	or	a0,a0,a4
    fedc:	0047d793          	srli	a5,a5,0x4
    fee0:	00068813          	mv	a6,a3
    fee4:	885ff06f          	j	f768 <__adddf3+0x3c0>
    fee8:	00058693          	mv	a3,a1
    feec:	e61ff06f          	j	fd4c <__adddf3+0x9a4>
    fef0:	00068593          	mv	a1,a3
    fef4:	00060f13          	mv	t5,a2
    fef8:	85dff06f          	j	f754 <__adddf3+0x3ac>

0000fefc <__divdf3>:
    fefc:	0145d713          	srli	a4,a1,0x14
    ff00:	fb010113          	addi	sp,sp,-80
    ff04:	00c59793          	slli	a5,a1,0xc
    ff08:	04112623          	sw	ra,76(sp)
    ff0c:	7ff77713          	andi	a4,a4,2047
    ff10:	00050813          	mv	a6,a0
    ff14:	00c7d793          	srli	a5,a5,0xc
    ff18:	01f5d593          	srli	a1,a1,0x1f
    ff1c:	1e070a63          	beqz	a4,10110 <__divdf3+0x214>
    ff20:	00050e93          	mv	t4,a0
    ff24:	7ff00513          	li	a0,2047
    ff28:	08a70a63          	beq	a4,a0,ffbc <__divdf3+0xc0>
    ff2c:	00379793          	slli	a5,a5,0x3
    ff30:	01d85e13          	srli	t3,a6,0x1d
    ff34:	00fe6e33          	or	t3,t3,a5
    ff38:	008007b7          	lui	a5,0x800
    ff3c:	00381e93          	slli	t4,a6,0x3
    ff40:	00fe6e33          	or	t3,t3,a5
    ff44:	c0170893          	addi	a7,a4,-1023
    ff48:	00000813          	li	a6,0
    ff4c:	00000f13          	li	t5,0
    ff50:	0146d713          	srli	a4,a3,0x14
    ff54:	00c69793          	slli	a5,a3,0xc
    ff58:	7ff77713          	andi	a4,a4,2047
    ff5c:	00c7d793          	srli	a5,a5,0xc
    ff60:	01f6d693          	srli	a3,a3,0x1f
    ff64:	08070463          	beqz	a4,ffec <__divdf3+0xf0>
    ff68:	7ff00513          	li	a0,2047
    ff6c:	20a70c63          	beq	a4,a0,10184 <__divdf3+0x288>
    ff70:	00379793          	slli	a5,a5,0x3
    ff74:	01d65513          	srli	a0,a2,0x1d
    ff78:	c0170713          	addi	a4,a4,-1023
    ff7c:	00f56533          	or	a0,a0,a5
    ff80:	008007b7          	lui	a5,0x800
    ff84:	40e888b3          	sub	a7,a7,a4
    ff88:	00f567b3          	or	a5,a0,a5
    ff8c:	00361713          	slli	a4,a2,0x3
    ff90:	00000f93          	li	t6,0
    ff94:	00f00613          	li	a2,15
    ff98:	00d5c333          	xor	t1,a1,a3
    ff9c:	2d066663          	bltu	a2,a6,10268 <__divdf3+0x36c>
    ffa0:	00003517          	auipc	a0,0x3
    ffa4:	55050513          	addi	a0,a0,1360 # 134f0 <blanks.1+0x10>
    ffa8:	00281813          	slli	a6,a6,0x2
    ffac:	00a80833          	add	a6,a6,a0
    ffb0:	00082603          	lw	a2,0(a6)
    ffb4:	00a60633          	add	a2,a2,a0
    ffb8:	00060067          	jr	a2 # 800000 <_sidata+0x7ec808>
    ffbc:	0107ee33          	or	t3,a5,a6
    ffc0:	260e1063          	bnez	t3,10220 <__divdf3+0x324>
    ffc4:	00070893          	mv	a7,a4
    ffc8:	0146d713          	srli	a4,a3,0x14
    ffcc:	00c69793          	slli	a5,a3,0xc
    ffd0:	7ff77713          	andi	a4,a4,2047
    ffd4:	00000e93          	li	t4,0
    ffd8:	00800813          	li	a6,8
    ffdc:	00200f13          	li	t5,2
    ffe0:	00c7d793          	srli	a5,a5,0xc
    ffe4:	01f6d693          	srli	a3,a3,0x1f
    ffe8:	f80710e3          	bnez	a4,ff68 <__divdf3+0x6c>
    ffec:	00c7e733          	or	a4,a5,a2
    fff0:	24070263          	beqz	a4,10234 <__divdf3+0x338>
    fff4:	6c078a63          	beqz	a5,106c8 <__divdf3+0x7cc>
    fff8:	00078513          	mv	a0,a5
    fffc:	02c12423          	sw	a2,40(sp)
   10000:	03112223          	sw	a7,36(sp)
   10004:	03012023          	sw	a6,32(sp)
   10008:	00d12e23          	sw	a3,28(sp)
   1000c:	01e12c23          	sw	t5,24(sp)
   10010:	01c12a23          	sw	t3,20(sp)
   10014:	01d12823          	sw	t4,16(sp)
   10018:	00b12623          	sw	a1,12(sp)
   1001c:	00f12423          	sw	a5,8(sp)
   10020:	7a8020ef          	jal	127c8 <__clzsi2>
   10024:	00812783          	lw	a5,8(sp)
   10028:	00c12583          	lw	a1,12(sp)
   1002c:	01012e83          	lw	t4,16(sp)
   10030:	01412e03          	lw	t3,20(sp)
   10034:	01812f03          	lw	t5,24(sp)
   10038:	01c12683          	lw	a3,28(sp)
   1003c:	02012803          	lw	a6,32(sp)
   10040:	02412883          	lw	a7,36(sp)
   10044:	02812603          	lw	a2,40(sp)
   10048:	00050313          	mv	t1,a0
   1004c:	ff550713          	addi	a4,a0,-11
   10050:	01d00513          	li	a0,29
   10054:	40e50533          	sub	a0,a0,a4
   10058:	ff830713          	addi	a4,t1,-8
   1005c:	00e797b3          	sll	a5,a5,a4
   10060:	00a65533          	srl	a0,a2,a0
   10064:	00f567b3          	or	a5,a0,a5
   10068:	00e61733          	sll	a4,a2,a4
   1006c:	01130333          	add	t1,t1,a7
   10070:	3f330893          	addi	a7,t1,1011
   10074:	00000f93          	li	t6,0
   10078:	f1dff06f          	j	ff94 <__divdf3+0x98>
   1007c:	780e8a63          	beqz	t4,10810 <__divdf3+0x914>
   10080:	fc900693          	li	a3,-55
   10084:	7ededa63          	bge	t4,a3,10878 <__divdf3+0x97c>
   10088:	00000713          	li	a4,0
   1008c:	00000793          	li	a5,0
   10090:	00000693          	li	a3,0
   10094:	04c12083          	lw	ra,76(sp)
   10098:	01471713          	slli	a4,a4,0x14
   1009c:	00f76733          	or	a4,a4,a5
   100a0:	01f31313          	slli	t1,t1,0x1f
   100a4:	00068513          	mv	a0,a3
   100a8:	006765b3          	or	a1,a4,t1
   100ac:	05010113          	addi	sp,sp,80
   100b0:	00008067          	ret
   100b4:	04c12083          	lw	ra,76(sp)
   100b8:	7ff00713          	li	a4,2047
   100bc:	00000793          	li	a5,0
   100c0:	01471713          	slli	a4,a4,0x14
   100c4:	00000693          	li	a3,0
   100c8:	00f76733          	or	a4,a4,a5
   100cc:	01f31313          	slli	t1,t1,0x1f
   100d0:	00068513          	mv	a0,a3
   100d4:	006765b3          	or	a1,a4,t1
   100d8:	05010113          	addi	sp,sp,80
   100dc:	00008067          	ret
   100e0:	04c12083          	lw	ra,76(sp)
   100e4:	7ff00713          	li	a4,2047
   100e8:	00000313          	li	t1,0
   100ec:	000807b7          	lui	a5,0x80
   100f0:	01471713          	slli	a4,a4,0x14
   100f4:	00000693          	li	a3,0
   100f8:	00f76733          	or	a4,a4,a5
   100fc:	01f31313          	slli	t1,t1,0x1f
   10100:	00068513          	mv	a0,a3
   10104:	006765b3          	or	a1,a4,t1
   10108:	05010113          	addi	sp,sp,80
   1010c:	00008067          	ret
   10110:	00a7ee33          	or	t3,a5,a0
   10114:	140e0063          	beqz	t3,10254 <__divdf3+0x358>
   10118:	00d12c23          	sw	a3,24(sp)
   1011c:	00c12a23          	sw	a2,20(sp)
   10120:	60078c63          	beqz	a5,10738 <__divdf3+0x83c>
   10124:	00a12823          	sw	a0,16(sp)
   10128:	00078513          	mv	a0,a5
   1012c:	00b12623          	sw	a1,12(sp)
   10130:	00f12423          	sw	a5,8(sp)
   10134:	694020ef          	jal	127c8 <__clzsi2>
   10138:	00812783          	lw	a5,8(sp)
   1013c:	00c12583          	lw	a1,12(sp)
   10140:	01012803          	lw	a6,16(sp)
   10144:	01412603          	lw	a2,20(sp)
   10148:	01812683          	lw	a3,24(sp)
   1014c:	00050313          	mv	t1,a0
   10150:	ff550713          	addi	a4,a0,-11
   10154:	01d00e13          	li	t3,29
   10158:	ff830e93          	addi	t4,t1,-8
   1015c:	40ee0e33          	sub	t3,t3,a4
   10160:	01d797b3          	sll	a5,a5,t4
   10164:	01c85e33          	srl	t3,a6,t3
   10168:	00fe6e33          	or	t3,t3,a5
   1016c:	01d81eb3          	sll	t4,a6,t4
   10170:	c0d00713          	li	a4,-1011
   10174:	406708b3          	sub	a7,a4,t1
   10178:	00000813          	li	a6,0
   1017c:	00000f13          	li	t5,0
   10180:	dd1ff06f          	j	ff50 <__divdf3+0x54>
   10184:	00c7e733          	or	a4,a5,a2
   10188:	80188893          	addi	a7,a7,-2047
   1018c:	0a071c63          	bnez	a4,10244 <__divdf3+0x348>
   10190:	00286813          	ori	a6,a6,2
   10194:	00000793          	li	a5,0
   10198:	00200f93          	li	t6,2
   1019c:	df9ff06f          	j	ff94 <__divdf3+0x98>
   101a0:	000e0793          	mv	a5,t3
   101a4:	000e8713          	mv	a4,t4
   101a8:	00200693          	li	a3,2
   101ac:	5cdf0863          	beq	t5,a3,1077c <__divdf3+0x880>
   101b0:	00300693          	li	a3,3
   101b4:	f2df06e3          	beq	t5,a3,100e0 <__divdf3+0x1e4>
   101b8:	00100693          	li	a3,1
   101bc:	00058313          	mv	t1,a1
   101c0:	ecdf04e3          	beq	t5,a3,10088 <__divdf3+0x18c>
   101c4:	3ff88e93          	addi	t4,a7,1023
   101c8:	000e8813          	mv	a6,t4
   101cc:	ebd058e3          	blez	t4,1007c <__divdf3+0x180>
   101d0:	00777693          	andi	a3,a4,7
   101d4:	60069e63          	bnez	a3,107f0 <__divdf3+0x8f4>
   101d8:	00375613          	srli	a2,a4,0x3
   101dc:	00779713          	slli	a4,a5,0x7
   101e0:	00075a63          	bgez	a4,101f4 <__divdf3+0x2f8>
   101e4:	ff000737          	lui	a4,0xff000
   101e8:	fff70713          	addi	a4,a4,-1 # feffffff <_stack_top+0xeeffbfff>
   101ec:	40088813          	addi	a6,a7,1024
   101f0:	00e7f7b3          	and	a5,a5,a4
   101f4:	7fe00713          	li	a4,2046
   101f8:	eb074ee3          	blt	a4,a6,100b4 <__divdf3+0x1b8>
   101fc:	01d79693          	slli	a3,a5,0x1d
   10200:	00c6e6b3          	or	a3,a3,a2
   10204:	00979613          	slli	a2,a5,0x9
   10208:	7ff87713          	andi	a4,a6,2047
   1020c:	00c65793          	srli	a5,a2,0xc
   10210:	e85ff06f          	j	10094 <__divdf3+0x198>
   10214:	00068593          	mv	a1,a3
   10218:	000f8f13          	mv	t5,t6
   1021c:	f8dff06f          	j	101a8 <__divdf3+0x2ac>
   10220:	00078e13          	mv	t3,a5
   10224:	00070893          	mv	a7,a4
   10228:	00c00813          	li	a6,12
   1022c:	00300f13          	li	t5,3
   10230:	d21ff06f          	j	ff50 <__divdf3+0x54>
   10234:	00186813          	ori	a6,a6,1
   10238:	00000793          	li	a5,0
   1023c:	00100f93          	li	t6,1
   10240:	d55ff06f          	j	ff94 <__divdf3+0x98>
   10244:	00386813          	ori	a6,a6,3
   10248:	00060713          	mv	a4,a2
   1024c:	00300f93          	li	t6,3
   10250:	d45ff06f          	j	ff94 <__divdf3+0x98>
   10254:	00000e93          	li	t4,0
   10258:	00400813          	li	a6,4
   1025c:	00000893          	li	a7,0
   10260:	00100f13          	li	t5,1
   10264:	cedff06f          	j	ff50 <__divdf3+0x54>
   10268:	04812423          	sw	s0,72(sp)
   1026c:	04912223          	sw	s1,68(sp)
   10270:	05212023          	sw	s2,64(sp)
   10274:	03312e23          	sw	s3,60(sp)
   10278:	03412c23          	sw	s4,56(sp)
   1027c:	01c7e663          	bltu	a5,t3,10288 <__divdf3+0x38c>
   10280:	6efe1063          	bne	t3,a5,10960 <__divdf3+0xa64>
   10284:	6ceeee63          	bltu	t4,a4,10960 <__divdf3+0xa64>
   10288:	01fe1613          	slli	a2,t3,0x1f
   1028c:	001ed693          	srli	a3,t4,0x1
   10290:	001e5e13          	srli	t3,t3,0x1
   10294:	00d66933          	or	s2,a2,a3
   10298:	01fe9e93          	slli	t4,t4,0x1f
   1029c:	00879793          	slli	a5,a5,0x8
   102a0:	01875f13          	srli	t5,a4,0x18
   102a4:	00ff6f33          	or	t5,t5,a5
   102a8:	0107d413          	srli	s0,a5,0x10
   102ac:	010f1493          	slli	s1,t5,0x10
   102b0:	000e0513          	mv	a0,t3
   102b4:	00040593          	mv	a1,s0
   102b8:	01112c23          	sw	a7,24(sp)
   102bc:	01d12a23          	sw	t4,20(sp)
   102c0:	00612823          	sw	t1,16(sp)
   102c4:	00871993          	slli	s3,a4,0x8
   102c8:	01e12623          	sw	t5,12(sp)
   102cc:	01c12423          	sw	t3,8(sp)
   102d0:	0104d493          	srli	s1,s1,0x10
   102d4:	448020ef          	jal	1271c <__hidden___udivsi3>
   102d8:	00050593          	mv	a1,a0
   102dc:	00050a13          	mv	s4,a0
   102e0:	00048513          	mv	a0,s1
   102e4:	40c020ef          	jal	126f0 <__mulsi3>
   102e8:	00812e03          	lw	t3,8(sp)
   102ec:	00040593          	mv	a1,s0
   102f0:	00a12423          	sw	a0,8(sp)
   102f4:	000e0513          	mv	a0,t3
   102f8:	46c020ef          	jal	12764 <__umodsi3>
   102fc:	00812703          	lw	a4,8(sp)
   10300:	01051513          	slli	a0,a0,0x10
   10304:	01095793          	srli	a5,s2,0x10
   10308:	00a7e7b3          	or	a5,a5,a0
   1030c:	00c12f03          	lw	t5,12(sp)
   10310:	01012303          	lw	t1,16(sp)
   10314:	01412e83          	lw	t4,20(sp)
   10318:	01812883          	lw	a7,24(sp)
   1031c:	00e7fa63          	bgeu	a5,a4,10330 <__divdf3+0x434>
   10320:	00ff07b3          	add	a5,t5,a5
   10324:	01e7e463          	bltu	a5,t5,1032c <__divdf3+0x430>
   10328:	64e7ea63          	bltu	a5,a4,1097c <__divdf3+0xa80>
   1032c:	fffa0a13          	addi	s4,s4,-1
   10330:	40e78733          	sub	a4,a5,a4
   10334:	00070513          	mv	a0,a4
   10338:	00040593          	mv	a1,s0
   1033c:	01112e23          	sw	a7,28(sp)
   10340:	01e12c23          	sw	t5,24(sp)
   10344:	01d12a23          	sw	t4,20(sp)
   10348:	00612823          	sw	t1,16(sp)
   1034c:	00e12423          	sw	a4,8(sp)
   10350:	3cc020ef          	jal	1271c <__hidden___udivsi3>
   10354:	00050593          	mv	a1,a0
   10358:	00a12623          	sw	a0,12(sp)
   1035c:	00048513          	mv	a0,s1
   10360:	390020ef          	jal	126f0 <__mulsi3>
   10364:	00812703          	lw	a4,8(sp)
   10368:	00040593          	mv	a1,s0
   1036c:	00a12423          	sw	a0,8(sp)
   10370:	00070513          	mv	a0,a4
   10374:	3f0020ef          	jal	12764 <__umodsi3>
   10378:	01091713          	slli	a4,s2,0x10
   1037c:	00812783          	lw	a5,8(sp)
   10380:	01075713          	srli	a4,a4,0x10
   10384:	01051513          	slli	a0,a0,0x10
   10388:	00a76733          	or	a4,a4,a0
   1038c:	00c12e03          	lw	t3,12(sp)
   10390:	01012303          	lw	t1,16(sp)
   10394:	01412e83          	lw	t4,20(sp)
   10398:	01812f03          	lw	t5,24(sp)
   1039c:	01c12883          	lw	a7,28(sp)
   103a0:	00f77a63          	bgeu	a4,a5,103b4 <__divdf3+0x4b8>
   103a4:	00ef0733          	add	a4,t5,a4
   103a8:	01e76463          	bltu	a4,t5,103b0 <__divdf3+0x4b4>
   103ac:	5cf76263          	bltu	a4,a5,10970 <__divdf3+0xa74>
   103b0:	fffe0e13          	addi	t3,t3,-1
   103b4:	40f70733          	sub	a4,a4,a5
   103b8:	010a1793          	slli	a5,s4,0x10
   103bc:	01c7ee33          	or	t3,a5,t3
   103c0:	010e1513          	slli	a0,t3,0x10
   103c4:	01099593          	slli	a1,s3,0x10
   103c8:	01055513          	srli	a0,a0,0x10
   103cc:	0105d593          	srli	a1,a1,0x10
   103d0:	320020ef          	jal	126f0 <__mulsi3>
   103d4:	00050813          	mv	a6,a0
   103d8:	010e1513          	slli	a0,t3,0x10
   103dc:	0109d593          	srli	a1,s3,0x10
   103e0:	01055513          	srli	a0,a0,0x10
   103e4:	30c020ef          	jal	126f0 <__mulsi3>
   103e8:	01099593          	slli	a1,s3,0x10
   103ec:	00050793          	mv	a5,a0
   103f0:	0105d593          	srli	a1,a1,0x10
   103f4:	010e5513          	srli	a0,t3,0x10
   103f8:	2f8020ef          	jal	126f0 <__mulsi3>
   103fc:	00050393          	mv	t2,a0
   10400:	0109d593          	srli	a1,s3,0x10
   10404:	010e5513          	srli	a0,t3,0x10
   10408:	2e8020ef          	jal	126f0 <__mulsi3>
   1040c:	007787b3          	add	a5,a5,t2
   10410:	01085693          	srli	a3,a6,0x10
   10414:	00f686b3          	add	a3,a3,a5
   10418:	0076f663          	bgeu	a3,t2,10424 <__divdf3+0x528>
   1041c:	000107b7          	lui	a5,0x10
   10420:	00f50533          	add	a0,a0,a5
   10424:	01069593          	slli	a1,a3,0x10
   10428:	01081813          	slli	a6,a6,0x10
   1042c:	0106d693          	srli	a3,a3,0x10
   10430:	01085813          	srli	a6,a6,0x10
   10434:	00a686b3          	add	a3,a3,a0
   10438:	010585b3          	add	a1,a1,a6
   1043c:	00d76863          	bltu	a4,a3,1044c <__divdf3+0x550>
   10440:	40d70633          	sub	a2,a4,a3
   10444:	50d71a63          	bne	a4,a3,10958 <__divdf3+0xa5c>
   10448:	50bef863          	bgeu	t4,a1,10958 <__divdf3+0xa5c>
   1044c:	013e8533          	add	a0,t4,s3
   10450:	01d53833          	sltu	a6,a0,t4
   10454:	01e807b3          	add	a5,a6,t5
   10458:	00f70733          	add	a4,a4,a5
   1045c:	00050e93          	mv	t4,a0
   10460:	fffe0793          	addi	a5,t3,-1
   10464:	00ef6863          	bltu	t5,a4,10474 <__divdf3+0x578>
   10468:	40d70633          	sub	a2,a4,a3
   1046c:	02ef1a63          	bne	t5,a4,104a0 <__divdf3+0x5a4>
   10470:	02081863          	bnez	a6,104a0 <__divdf3+0x5a4>
   10474:	00d76863          	bltu	a4,a3,10484 <__divdf3+0x588>
   10478:	40d70633          	sub	a2,a4,a3
   1047c:	02e69263          	bne	a3,a4,104a0 <__divdf3+0x5a4>
   10480:	02b57063          	bgeu	a0,a1,104a0 <__divdf3+0x5a4>
   10484:	00a98533          	add	a0,s3,a0
   10488:	013537b3          	sltu	a5,a0,s3
   1048c:	01e787b3          	add	a5,a5,t5
   10490:	00f70733          	add	a4,a4,a5
   10494:	40d70633          	sub	a2,a4,a3
   10498:	ffee0793          	addi	a5,t3,-2
   1049c:	00050e93          	mv	t4,a0
   104a0:	40be86b3          	sub	a3,t4,a1
   104a4:	00debeb3          	sltu	t4,t4,a3
   104a8:	41d60633          	sub	a2,a2,t4
   104ac:	3ff88e93          	addi	t4,a7,1023
   104b0:	000e8813          	mv	a6,t4
   104b4:	2ccf0e63          	beq	t5,a2,10790 <__divdf3+0x894>
   104b8:	00060513          	mv	a0,a2
   104bc:	00040593          	mv	a1,s0
   104c0:	01d12e23          	sw	t4,28(sp)
   104c4:	01112c23          	sw	a7,24(sp)
   104c8:	01d12a23          	sw	t4,20(sp)
   104cc:	00f12823          	sw	a5,16(sp)
   104d0:	00612623          	sw	t1,12(sp)
   104d4:	00c12423          	sw	a2,8(sp)
   104d8:	03e12023          	sw	t5,32(sp)
   104dc:	02d12223          	sw	a3,36(sp)
   104e0:	03512a23          	sw	s5,52(sp)
   104e4:	238020ef          	jal	1271c <__hidden___udivsi3>
   104e8:	00050593          	mv	a1,a0
   104ec:	00050a93          	mv	s5,a0
   104f0:	00048513          	mv	a0,s1
   104f4:	1fc020ef          	jal	126f0 <__mulsi3>
   104f8:	00050713          	mv	a4,a0
   104fc:	00812503          	lw	a0,8(sp)
   10500:	00040593          	mv	a1,s0
   10504:	00e12423          	sw	a4,8(sp)
   10508:	25c020ef          	jal	12764 <__umodsi3>
   1050c:	02412683          	lw	a3,36(sp)
   10510:	01412803          	lw	a6,20(sp)
   10514:	00812603          	lw	a2,8(sp)
   10518:	01051513          	slli	a0,a0,0x10
   1051c:	0106d713          	srli	a4,a3,0x10
   10520:	00a76733          	or	a4,a4,a0
   10524:	00c12303          	lw	t1,12(sp)
   10528:	01012783          	lw	a5,16(sp)
   1052c:	01812883          	lw	a7,24(sp)
   10530:	02012f03          	lw	t5,32(sp)
   10534:	00080e93          	mv	t4,a6
   10538:	00c77a63          	bgeu	a4,a2,1054c <__divdf3+0x650>
   1053c:	00ef0733          	add	a4,t5,a4
   10540:	01e76463          	bltu	a4,t5,10548 <__divdf3+0x64c>
   10544:	44c76863          	bltu	a4,a2,10994 <__divdf3+0xa98>
   10548:	fffa8a93          	addi	s5,s5,-1
   1054c:	40c70733          	sub	a4,a4,a2
   10550:	00070513          	mv	a0,a4
   10554:	00040593          	mv	a1,s0
   10558:	03d12623          	sw	t4,44(sp)
   1055c:	02d12423          	sw	a3,40(sp)
   10560:	03112223          	sw	a7,36(sp)
   10564:	03e12023          	sw	t5,32(sp)
   10568:	01012e23          	sw	a6,28(sp)
   1056c:	00f12c23          	sw	a5,24(sp)
   10570:	00612a23          	sw	t1,20(sp)
   10574:	00e12823          	sw	a4,16(sp)
   10578:	1a4020ef          	jal	1271c <__hidden___udivsi3>
   1057c:	00050593          	mv	a1,a0
   10580:	00a12623          	sw	a0,12(sp)
   10584:	00048513          	mv	a0,s1
   10588:	168020ef          	jal	126f0 <__mulsi3>
   1058c:	00a12423          	sw	a0,8(sp)
   10590:	01012503          	lw	a0,16(sp)
   10594:	00040593          	mv	a1,s0
   10598:	1cc020ef          	jal	12764 <__umodsi3>
   1059c:	02815683          	lhu	a3,40(sp)
   105a0:	00812e03          	lw	t3,8(sp)
   105a4:	01051513          	slli	a0,a0,0x10
   105a8:	00a6e6b3          	or	a3,a3,a0
   105ac:	00c12603          	lw	a2,12(sp)
   105b0:	01412303          	lw	t1,20(sp)
   105b4:	01812783          	lw	a5,24(sp)
   105b8:	01c12803          	lw	a6,28(sp)
   105bc:	02012f03          	lw	t5,32(sp)
   105c0:	02412883          	lw	a7,36(sp)
   105c4:	02c12e83          	lw	t4,44(sp)
   105c8:	01c6fc63          	bgeu	a3,t3,105e0 <__divdf3+0x6e4>
   105cc:	00df0733          	add	a4,t5,a3
   105d0:	00070693          	mv	a3,a4
   105d4:	01c77463          	bgeu	a4,t3,105dc <__divdf3+0x6e0>
   105d8:	3be77863          	bgeu	a4,t5,10988 <__divdf3+0xa8c>
   105dc:	fff60613          	addi	a2,a2,-1
   105e0:	010a9713          	slli	a4,s5,0x10
   105e4:	00c76733          	or	a4,a4,a2
   105e8:	01099593          	slli	a1,s3,0x10
   105ec:	01071513          	slli	a0,a4,0x10
   105f0:	41c68e33          	sub	t3,a3,t3
   105f4:	0105d593          	srli	a1,a1,0x10
   105f8:	01055513          	srli	a0,a0,0x10
   105fc:	0f4020ef          	jal	126f0 <__mulsi3>
   10600:	00050393          	mv	t2,a0
   10604:	0109d413          	srli	s0,s3,0x10
   10608:	01071513          	slli	a0,a4,0x10
   1060c:	00040593          	mv	a1,s0
   10610:	01055513          	srli	a0,a0,0x10
   10614:	0dc020ef          	jal	126f0 <__mulsi3>
   10618:	01099593          	slli	a1,s3,0x10
   1061c:	00050913          	mv	s2,a0
   10620:	0105d593          	srli	a1,a1,0x10
   10624:	01075513          	srli	a0,a4,0x10
   10628:	0c8020ef          	jal	126f0 <__mulsi3>
   1062c:	00050293          	mv	t0,a0
   10630:	00040593          	mv	a1,s0
   10634:	01075513          	srli	a0,a4,0x10
   10638:	0b8020ef          	jal	126f0 <__mulsi3>
   1063c:	00590633          	add	a2,s2,t0
   10640:	0103d693          	srli	a3,t2,0x10
   10644:	00c686b3          	add	a3,a3,a2
   10648:	0056f663          	bgeu	a3,t0,10654 <__divdf3+0x758>
   1064c:	00010637          	lui	a2,0x10
   10650:	00c50533          	add	a0,a0,a2
   10654:	0106d593          	srli	a1,a3,0x10
   10658:	01039393          	slli	t2,t2,0x10
   1065c:	0103d393          	srli	t2,t2,0x10
   10660:	01069693          	slli	a3,a3,0x10
   10664:	00a585b3          	add	a1,a1,a0
   10668:	007686b3          	add	a3,a3,t2
   1066c:	00be6a63          	bltu	t3,a1,10680 <__divdf3+0x784>
   10670:	00d03633          	snez	a2,a3
   10674:	40be0533          	sub	a0,t3,a1
   10678:	02be1663          	bne	t3,a1,106a4 <__divdf3+0x7a8>
   1067c:	02060463          	beqz	a2,106a4 <__divdf3+0x7a8>
   10680:	01cf0533          	add	a0,t5,t3
   10684:	01e56863          	bltu	a0,t5,10694 <__divdf3+0x798>
   10688:	1cb56663          	bltu	a0,a1,10854 <__divdf3+0x958>
   1068c:	00b51463          	bne	a0,a1,10694 <__divdf3+0x798>
   10690:	1cd9e263          	bltu	s3,a3,10854 <__divdf3+0x958>
   10694:	40d986b3          	sub	a3,s3,a3
   10698:	00d03633          	snez	a2,a3
   1069c:	fff70713          	addi	a4,a4,-1
   106a0:	40b50533          	sub	a0,a0,a1
   106a4:	10051a63          	bnez	a0,107b8 <__divdf3+0x8bc>
   106a8:	10061863          	bnez	a2,107b8 <__divdf3+0x8bc>
   106ac:	04812403          	lw	s0,72(sp)
   106b0:	04412483          	lw	s1,68(sp)
   106b4:	04012903          	lw	s2,64(sp)
   106b8:	03c12983          	lw	s3,60(sp)
   106bc:	03812a03          	lw	s4,56(sp)
   106c0:	03412a83          	lw	s5,52(sp)
   106c4:	b05ff06f          	j	101c8 <__divdf3+0x2cc>
   106c8:	00060513          	mv	a0,a2
   106cc:	03112423          	sw	a7,40(sp)
   106d0:	03012223          	sw	a6,36(sp)
   106d4:	02f12023          	sw	a5,32(sp)
   106d8:	00d12e23          	sw	a3,28(sp)
   106dc:	01e12c23          	sw	t5,24(sp)
   106e0:	01c12a23          	sw	t3,20(sp)
   106e4:	01d12823          	sw	t4,16(sp)
   106e8:	00b12623          	sw	a1,12(sp)
   106ec:	00c12423          	sw	a2,8(sp)
   106f0:	0d8020ef          	jal	127c8 <__clzsi2>
   106f4:	01550713          	addi	a4,a0,21
   106f8:	01c00f93          	li	t6,28
   106fc:	00812603          	lw	a2,8(sp)
   10700:	00c12583          	lw	a1,12(sp)
   10704:	01012e83          	lw	t4,16(sp)
   10708:	01412e03          	lw	t3,20(sp)
   1070c:	01812f03          	lw	t5,24(sp)
   10710:	01c12683          	lw	a3,28(sp)
   10714:	02412803          	lw	a6,36(sp)
   10718:	02812883          	lw	a7,40(sp)
   1071c:	02050313          	addi	t1,a0,32
   10720:	00000793          	li	a5,0
   10724:	92efd6e3          	bge	t6,a4,10050 <__divdf3+0x154>
   10728:	ff850513          	addi	a0,a0,-8
   1072c:	00a617b3          	sll	a5,a2,a0
   10730:	00000713          	li	a4,0
   10734:	939ff06f          	j	1006c <__divdf3+0x170>
   10738:	00f12823          	sw	a5,16(sp)
   1073c:	00b12623          	sw	a1,12(sp)
   10740:	00a12423          	sw	a0,8(sp)
   10744:	084020ef          	jal	127c8 <__clzsi2>
   10748:	01550713          	addi	a4,a0,21
   1074c:	01c00893          	li	a7,28
   10750:	00812803          	lw	a6,8(sp)
   10754:	00c12583          	lw	a1,12(sp)
   10758:	01412603          	lw	a2,20(sp)
   1075c:	01812683          	lw	a3,24(sp)
   10760:	02050313          	addi	t1,a0,32
   10764:	00000793          	li	a5,0
   10768:	9ee8d6e3          	bge	a7,a4,10154 <__divdf3+0x258>
   1076c:	ff850513          	addi	a0,a0,-8
   10770:	00a81e33          	sll	t3,a6,a0
   10774:	00000e93          	li	t4,0
   10778:	9f9ff06f          	j	10170 <__divdf3+0x274>
   1077c:	00058313          	mv	t1,a1
   10780:	7ff00713          	li	a4,2047
   10784:	00000793          	li	a5,0
   10788:	00000693          	li	a3,0
   1078c:	909ff06f          	j	10094 <__divdf3+0x198>
   10790:	00000613          	li	a2,0
   10794:	00100713          	li	a4,1
   10798:	15d05463          	blez	t4,108e0 <__divdf3+0x9e4>
   1079c:	04812403          	lw	s0,72(sp)
   107a0:	04412483          	lw	s1,68(sp)
   107a4:	04012903          	lw	s2,64(sp)
   107a8:	03c12983          	lw	s3,60(sp)
   107ac:	03812a03          	lw	s4,56(sp)
   107b0:	00e787b3          	add	a5,a5,a4
   107b4:	a29ff06f          	j	101dc <__divdf3+0x2e0>
   107b8:	c0200693          	li	a3,-1022
   107bc:	00176713          	ori	a4,a4,1
   107c0:	16d8c063          	blt	a7,a3,10920 <__divdf3+0xa24>
   107c4:	00470613          	addi	a2,a4,4
   107c8:	00e63733          	sltu	a4,a2,a4
   107cc:	04812403          	lw	s0,72(sp)
   107d0:	04412483          	lw	s1,68(sp)
   107d4:	04012903          	lw	s2,64(sp)
   107d8:	03c12983          	lw	s3,60(sp)
   107dc:	03812a03          	lw	s4,56(sp)
   107e0:	03412a83          	lw	s5,52(sp)
   107e4:	00365613          	srli	a2,a2,0x3
   107e8:	00e787b3          	add	a5,a5,a4
   107ec:	9f1ff06f          	j	101dc <__divdf3+0x2e0>
   107f0:	00f77693          	andi	a3,a4,15
   107f4:	00400613          	li	a2,4
   107f8:	9ec680e3          	beq	a3,a2,101d8 <__divdf3+0x2dc>
   107fc:	00470613          	addi	a2,a4,4
   10800:	00e63733          	sltu	a4,a2,a4
   10804:	00e787b3          	add	a5,a5,a4
   10808:	00365613          	srli	a2,a2,0x3
   1080c:	9d1ff06f          	j	101dc <__divdf3+0x2e0>
   10810:	00777693          	andi	a3,a4,7
   10814:	00175593          	srli	a1,a4,0x1
   10818:	01f00893          	li	a7,31
   1081c:	00100613          	li	a2,1
   10820:	1e069263          	bnez	a3,10a04 <__divdf3+0xb08>
   10824:	011798b3          	sll	a7,a5,a7
   10828:	00d5e5b3          	or	a1,a1,a3
   1082c:	00b8e733          	or	a4,a7,a1
   10830:	00777693          	andi	a3,a4,7
   10834:	00c7d7b3          	srl	a5,a5,a2
   10838:	1a069063          	bnez	a3,109d8 <__divdf3+0xadc>
   1083c:	00879693          	slli	a3,a5,0x8
   10840:	1c06d663          	bgez	a3,10a0c <__divdf3+0xb10>
   10844:	00100713          	li	a4,1
   10848:	00000793          	li	a5,0
   1084c:	00000693          	li	a3,0
   10850:	845ff06f          	j	10094 <__divdf3+0x198>
   10854:	00199f93          	slli	t6,s3,0x1
   10858:	013fb633          	sltu	a2,t6,s3
   1085c:	01e60633          	add	a2,a2,t5
   10860:	00c50e33          	add	t3,a0,a2
   10864:	41f686b3          	sub	a3,a3,t6
   10868:	ffe70713          	addi	a4,a4,-2
   1086c:	40be0533          	sub	a0,t3,a1
   10870:	00d03633          	snez	a2,a3
   10874:	e31ff06f          	j	106a4 <__divdf3+0x7a8>
   10878:	fe200693          	li	a3,-30
   1087c:	16ded663          	bge	t4,a3,109e8 <__divdf3+0xaec>
   10880:	fe100613          	li	a2,-31
   10884:	41d606b3          	sub	a3,a2,t4
   10888:	00d7d6b3          	srl	a3,a5,a3
   1088c:	00ce8863          	beq	t4,a2,1089c <__divdf3+0x9a0>
   10890:	43e88893          	addi	a7,a7,1086
   10894:	011797b3          	sll	a5,a5,a7
   10898:	00f76733          	or	a4,a4,a5
   1089c:	00e03733          	snez	a4,a4
   108a0:	00d76733          	or	a4,a4,a3
   108a4:	00777693          	andi	a3,a4,7
   108a8:	00000793          	li	a5,0
   108ac:	02068263          	beqz	a3,108d0 <__divdf3+0x9d4>
   108b0:	00f77613          	andi	a2,a4,15
   108b4:	00400593          	li	a1,4
   108b8:	00000693          	li	a3,0
   108bc:	00b60a63          	beq	a2,a1,108d0 <__divdf3+0x9d4>
   108c0:	00b70633          	add	a2,a4,a1
   108c4:	00e63733          	sltu	a4,a2,a4
   108c8:	01d71693          	slli	a3,a4,0x1d
   108cc:	00060713          	mv	a4,a2
   108d0:	00375713          	srli	a4,a4,0x3
   108d4:	00d766b3          	or	a3,a4,a3
   108d8:	00000713          	li	a4,0
   108dc:	fb8ff06f          	j	10094 <__divdf3+0x198>
   108e0:	0c0e9063          	bnez	t4,109a0 <__divdf3+0xaa4>
   108e4:	800006b7          	lui	a3,0x80000
   108e8:	04812403          	lw	s0,72(sp)
   108ec:	04412483          	lw	s1,68(sp)
   108f0:	04012903          	lw	s2,64(sp)
   108f4:	03c12983          	lw	s3,60(sp)
   108f8:	03812a03          	lw	s4,56(sp)
   108fc:	01f79713          	slli	a4,a5,0x1f
   10900:	fff68693          	addi	a3,a3,-1 # 7fffffff <_stack_top+0x6fffbfff>
   10904:	00d76733          	or	a4,a4,a3
   10908:	0017d793          	srli	a5,a5,0x1
   1090c:	00470693          	addi	a3,a4,4
   10910:	00e6b733          	sltu	a4,a3,a4
   10914:	00e787b3          	add	a5,a5,a4
   10918:	00068713          	mv	a4,a3
   1091c:	f21ff06f          	j	1083c <__divdf3+0x940>
   10920:	c0100693          	li	a3,-1023
   10924:	08d89c63          	bne	a7,a3,109bc <__divdf3+0xac0>
   10928:	00175693          	srli	a3,a4,0x1
   1092c:	0016e693          	ori	a3,a3,1
   10930:	01f79713          	slli	a4,a5,0x1f
   10934:	04812403          	lw	s0,72(sp)
   10938:	04412483          	lw	s1,68(sp)
   1093c:	04012903          	lw	s2,64(sp)
   10940:	03c12983          	lw	s3,60(sp)
   10944:	03812a03          	lw	s4,56(sp)
   10948:	03412a83          	lw	s5,52(sp)
   1094c:	00d76733          	or	a4,a4,a3
   10950:	0017d793          	srli	a5,a5,0x1
   10954:	fb9ff06f          	j	1090c <__divdf3+0xa10>
   10958:	000e0793          	mv	a5,t3
   1095c:	b45ff06f          	j	104a0 <__divdf3+0x5a4>
   10960:	000e8913          	mv	s2,t4
   10964:	fff88893          	addi	a7,a7,-1
   10968:	00000e93          	li	t4,0
   1096c:	931ff06f          	j	1029c <__divdf3+0x3a0>
   10970:	ffee0e13          	addi	t3,t3,-2
   10974:	01e70733          	add	a4,a4,t5
   10978:	a3dff06f          	j	103b4 <__divdf3+0x4b8>
   1097c:	ffea0a13          	addi	s4,s4,-2
   10980:	01e787b3          	add	a5,a5,t5
   10984:	9adff06f          	j	10330 <__divdf3+0x434>
   10988:	ffe60613          	addi	a2,a2,-2 # fffe <__divdf3+0x102>
   1098c:	01e706b3          	add	a3,a4,t5
   10990:	c51ff06f          	j	105e0 <__divdf3+0x6e4>
   10994:	ffea8a93          	addi	s5,s5,-2
   10998:	01e70733          	add	a4,a4,t5
   1099c:	bb1ff06f          	j	1054c <__divdf3+0x650>
   109a0:	04812403          	lw	s0,72(sp)
   109a4:	04412483          	lw	s1,68(sp)
   109a8:	04012903          	lw	s2,64(sp)
   109ac:	03c12983          	lw	s3,60(sp)
   109b0:	03812a03          	lw	s4,56(sp)
   109b4:	fff00713          	li	a4,-1
   109b8:	ec8ff06f          	j	10080 <__divdf3+0x184>
   109bc:	04812403          	lw	s0,72(sp)
   109c0:	04412483          	lw	s1,68(sp)
   109c4:	04012903          	lw	s2,64(sp)
   109c8:	03c12983          	lw	s3,60(sp)
   109cc:	03812a03          	lw	s4,56(sp)
   109d0:	03412a83          	lw	s5,52(sp)
   109d4:	eacff06f          	j	10080 <__divdf3+0x184>
   109d8:	00f77693          	andi	a3,a4,15
   109dc:	00400613          	li	a2,4
   109e0:	e4c68ee3          	beq	a3,a2,1083c <__divdf3+0x940>
   109e4:	f29ff06f          	j	1090c <__divdf3+0xa10>
   109e8:	41e88893          	addi	a7,a7,1054
   109ec:	00100613          	li	a2,1
   109f0:	011716b3          	sll	a3,a4,a7
   109f4:	41d60633          	sub	a2,a2,t4
   109f8:	00d036b3          	snez	a3,a3
   109fc:	00c755b3          	srl	a1,a4,a2
   10a00:	e25ff06f          	j	10824 <__divdf3+0x928>
   10a04:	00c776b3          	and	a3,a4,a2
   10a08:	e1dff06f          	j	10824 <__divdf3+0x928>
   10a0c:	00979613          	slli	a2,a5,0x9
   10a10:	01d79693          	slli	a3,a5,0x1d
   10a14:	00c65793          	srli	a5,a2,0xc
   10a18:	eb9ff06f          	j	108d0 <__divdf3+0x9d4>

00010a1c <__eqdf2>:
   10a1c:	0145d713          	srli	a4,a1,0x14
   10a20:	001007b7          	lui	a5,0x100
   10a24:	0146d813          	srli	a6,a3,0x14
   10a28:	fff78793          	addi	a5,a5,-1 # fffff <_sidata+0xec807>
   10a2c:	7ff00893          	li	a7,2047
   10a30:	7ff77713          	andi	a4,a4,2047
   10a34:	00b7fe33          	and	t3,a5,a1
   10a38:	01187833          	and	a6,a6,a7
   10a3c:	00d7f7b3          	and	a5,a5,a3
   10a40:	01f5d593          	srli	a1,a1,0x1f
   10a44:	01f6d693          	srli	a3,a3,0x1f
   10a48:	00100313          	li	t1,1
   10a4c:	03170a63          	beq	a4,a7,10a80 <__eqdf2+0x64>
   10a50:	03180463          	beq	a6,a7,10a78 <__eqdf2+0x5c>
   10a54:	03071263          	bne	a4,a6,10a78 <__eqdf2+0x5c>
   10a58:	05c79463          	bne	a5,t3,10aa0 <__eqdf2+0x84>
   10a5c:	04a61263          	bne	a2,a0,10aa0 <__eqdf2+0x84>
   10a60:	00000313          	li	t1,0
   10a64:	00d58a63          	beq	a1,a3,10a78 <__eqdf2+0x5c>
   10a68:	00100313          	li	t1,1
   10a6c:	00071663          	bnez	a4,10a78 <__eqdf2+0x5c>
   10a70:	00ae6e33          	or	t3,t3,a0
   10a74:	01c03333          	snez	t1,t3
   10a78:	00030513          	mv	a0,t1
   10a7c:	00008067          	ret
   10a80:	fee81ce3          	bne	a6,a4,10a78 <__eqdf2+0x5c>
   10a84:	00fe6e33          	or	t3,t3,a5
   10a88:	00ce6e33          	or	t3,t3,a2
   10a8c:	00ae6e33          	or	t3,t3,a0
   10a90:	fe0e14e3          	bnez	t3,10a78 <__eqdf2+0x5c>
   10a94:	40d585b3          	sub	a1,a1,a3
   10a98:	00b03333          	snez	t1,a1
   10a9c:	fddff06f          	j	10a78 <__eqdf2+0x5c>
   10aa0:	00100313          	li	t1,1
   10aa4:	00030513          	mv	a0,t1
   10aa8:	00008067          	ret

00010aac <__gedf2>:
   10aac:	0145d813          	srli	a6,a1,0x14
   10ab0:	001007b7          	lui	a5,0x100
   10ab4:	0146d713          	srli	a4,a3,0x14
   10ab8:	fff78793          	addi	a5,a5,-1 # fffff <_sidata+0xec807>
   10abc:	7ff00893          	li	a7,2047
   10ac0:	7ff87813          	andi	a6,a6,2047
   10ac4:	00b7f333          	and	t1,a5,a1
   10ac8:	01177733          	and	a4,a4,a7
   10acc:	00d7f7b3          	and	a5,a5,a3
   10ad0:	01f5d593          	srli	a1,a1,0x1f
   10ad4:	01f6d693          	srli	a3,a3,0x1f
   10ad8:	05180a63          	beq	a6,a7,10b2c <__gedf2+0x80>
   10adc:	03170663          	beq	a4,a7,10b08 <__gedf2+0x5c>
   10ae0:	06081a63          	bnez	a6,10b54 <__gedf2+0xa8>
   10ae4:	00a36833          	or	a6,t1,a0
   10ae8:	06071063          	bnez	a4,10b48 <__gedf2+0x9c>
   10aec:	00c7e8b3          	or	a7,a5,a2
   10af0:	08088e63          	beqz	a7,10b8c <__gedf2+0xe0>
   10af4:	0c081063          	bnez	a6,10bb4 <__gedf2+0x108>
   10af8:	00169713          	slli	a4,a3,0x1
   10afc:	fff70713          	addi	a4,a4,-1
   10b00:	00070513          	mv	a0,a4
   10b04:	00008067          	ret
   10b08:	00c7e7b3          	or	a5,a5,a2
   10b0c:	0a079063          	bnez	a5,10bac <__gedf2+0x100>
   10b10:	00081663          	bnez	a6,10b1c <__gedf2+0x70>
   10b14:	00a36333          	or	t1,t1,a0
   10b18:	fe0300e3          	beqz	t1,10af8 <__gedf2+0x4c>
   10b1c:	00d59e63          	bne	a1,a3,10b38 <__gedf2+0x8c>
   10b20:	00159713          	slli	a4,a1,0x1
   10b24:	fff70713          	addi	a4,a4,-1
   10b28:	0180006f          	j	10b40 <__gedf2+0x94>
   10b2c:	00a368b3          	or	a7,t1,a0
   10b30:	06089e63          	bnez	a7,10bac <__gedf2+0x100>
   10b34:	07070263          	beq	a4,a6,10b98 <__gedf2+0xec>
   10b38:	40b005b3          	neg	a1,a1
   10b3c:	0015e713          	ori	a4,a1,1
   10b40:	00070513          	mv	a0,a4
   10b44:	00008067          	ret
   10b48:	fa0808e3          	beqz	a6,10af8 <__gedf2+0x4c>
   10b4c:	fed596e3          	bne	a1,a3,10b38 <__gedf2+0x8c>
   10b50:	fd1ff06f          	j	10b20 <__gedf2+0x74>
   10b54:	fe0702e3          	beqz	a4,10b38 <__gedf2+0x8c>
   10b58:	fed590e3          	bne	a1,a3,10b38 <__gedf2+0x8c>
   10b5c:	fd074ee3          	blt	a4,a6,10b38 <__gedf2+0x8c>
   10b60:	fce840e3          	blt	a6,a4,10b20 <__gedf2+0x74>
   10b64:	fc67eae3          	bltu	a5,t1,10b38 <__gedf2+0x8c>
   10b68:	40f30733          	sub	a4,t1,a5
   10b6c:	00173713          	seqz	a4,a4
   10b70:	00a67463          	bgeu	a2,a0,10b78 <__gedf2+0xcc>
   10b74:	fc0712e3          	bnez	a4,10b38 <__gedf2+0x8c>
   10b78:	faf364e3          	bltu	t1,a5,10b20 <__gedf2+0x74>
   10b7c:	00c57463          	bgeu	a0,a2,10b84 <__gedf2+0xd8>
   10b80:	fa0710e3          	bnez	a4,10b20 <__gedf2+0x74>
   10b84:	00000713          	li	a4,0
   10b88:	fb9ff06f          	j	10b40 <__gedf2+0x94>
   10b8c:	fa0816e3          	bnez	a6,10b38 <__gedf2+0x8c>
   10b90:	00070513          	mv	a0,a4
   10b94:	00008067          	ret
   10b98:	00c7e733          	or	a4,a5,a2
   10b9c:	00071863          	bnez	a4,10bac <__gedf2+0x100>
   10ba0:	00100713          	li	a4,1
   10ba4:	f8d59ae3          	bne	a1,a3,10b38 <__gedf2+0x8c>
   10ba8:	fd1ff06f          	j	10b78 <__gedf2+0xcc>
   10bac:	ffe00713          	li	a4,-2
   10bb0:	f91ff06f          	j	10b40 <__gedf2+0x94>
   10bb4:	f8d592e3          	bne	a1,a3,10b38 <__gedf2+0x8c>
   10bb8:	fadff06f          	j	10b64 <__gedf2+0xb8>

00010bbc <__ledf2>:
   10bbc:	0145d813          	srli	a6,a1,0x14
   10bc0:	001007b7          	lui	a5,0x100
   10bc4:	0146d713          	srli	a4,a3,0x14
   10bc8:	fff78793          	addi	a5,a5,-1 # fffff <_sidata+0xec807>
   10bcc:	7ff00893          	li	a7,2047
   10bd0:	7ff87813          	andi	a6,a6,2047
   10bd4:	00b7f333          	and	t1,a5,a1
   10bd8:	01177733          	and	a4,a4,a7
   10bdc:	00d7f7b3          	and	a5,a5,a3
   10be0:	01f5d593          	srli	a1,a1,0x1f
   10be4:	01f6d693          	srli	a3,a3,0x1f
   10be8:	05180e63          	beq	a6,a7,10c44 <__ledf2+0x88>
   10bec:	03170663          	beq	a4,a7,10c18 <__ledf2+0x5c>
   10bf0:	08081663          	bnez	a6,10c7c <__ledf2+0xc0>
   10bf4:	00a36833          	or	a6,t1,a0
   10bf8:	0a071663          	bnez	a4,10ca4 <__ledf2+0xe8>
   10bfc:	00c7e8b3          	or	a7,a5,a2
   10c00:	0a088e63          	beqz	a7,10cbc <__ledf2+0x100>
   10c04:	0c081463          	bnez	a6,10ccc <__ledf2+0x110>
   10c08:	00169713          	slli	a4,a3,0x1
   10c0c:	fff70713          	addi	a4,a4,-1
   10c10:	00070513          	mv	a0,a4
   10c14:	00008067          	ret
   10c18:	00c7e7b3          	or	a5,a5,a2
   10c1c:	00200713          	li	a4,2
   10c20:	fe0798e3          	bnez	a5,10c10 <__ledf2+0x54>
   10c24:	00081663          	bnez	a6,10c30 <__ledf2+0x74>
   10c28:	00a36333          	or	t1,t1,a0
   10c2c:	fc030ee3          	beqz	t1,10c08 <__ledf2+0x4c>
   10c30:	04d58063          	beq	a1,a3,10c70 <__ledf2+0xb4>
   10c34:	40b005b3          	neg	a1,a1
   10c38:	0015e713          	ori	a4,a1,1
   10c3c:	00070513          	mv	a0,a4
   10c40:	00008067          	ret
   10c44:	00a368b3          	or	a7,t1,a0
   10c48:	06089463          	bnez	a7,10cb0 <__ledf2+0xf4>
   10c4c:	ff0714e3          	bne	a4,a6,10c34 <__ledf2+0x78>
   10c50:	00c7e833          	or	a6,a5,a2
   10c54:	00200713          	li	a4,2
   10c58:	fa081ce3          	bnez	a6,10c10 <__ledf2+0x54>
   10c5c:	00100713          	li	a4,1
   10c60:	fcd59ae3          	bne	a1,a3,10c34 <__ledf2+0x78>
   10c64:	00f36663          	bltu	t1,a5,10c70 <__ledf2+0xb4>
   10c68:	04c57e63          	bgeu	a0,a2,10cc4 <__ledf2+0x108>
   10c6c:	04070c63          	beqz	a4,10cc4 <__ledf2+0x108>
   10c70:	00159713          	slli	a4,a1,0x1
   10c74:	fff70713          	addi	a4,a4,-1
   10c78:	f99ff06f          	j	10c10 <__ledf2+0x54>
   10c7c:	fa070ce3          	beqz	a4,10c34 <__ledf2+0x78>
   10c80:	fad59ae3          	bne	a1,a3,10c34 <__ledf2+0x78>
   10c84:	fb0748e3          	blt	a4,a6,10c34 <__ledf2+0x78>
   10c88:	fee844e3          	blt	a6,a4,10c70 <__ledf2+0xb4>
   10c8c:	fa67e4e3          	bltu	a5,t1,10c34 <__ledf2+0x78>
   10c90:	40f30733          	sub	a4,t1,a5
   10c94:	00173713          	seqz	a4,a4
   10c98:	fca676e3          	bgeu	a2,a0,10c64 <__ledf2+0xa8>
   10c9c:	f8071ce3          	bnez	a4,10c34 <__ledf2+0x78>
   10ca0:	fc5ff06f          	j	10c64 <__ledf2+0xa8>
   10ca4:	f60802e3          	beqz	a6,10c08 <__ledf2+0x4c>
   10ca8:	f8d596e3          	bne	a1,a3,10c34 <__ledf2+0x78>
   10cac:	fc5ff06f          	j	10c70 <__ledf2+0xb4>
   10cb0:	00200713          	li	a4,2
   10cb4:	00070513          	mv	a0,a4
   10cb8:	00008067          	ret
   10cbc:	f4080ae3          	beqz	a6,10c10 <__ledf2+0x54>
   10cc0:	f75ff06f          	j	10c34 <__ledf2+0x78>
   10cc4:	00000713          	li	a4,0
   10cc8:	f49ff06f          	j	10c10 <__ledf2+0x54>
   10ccc:	f6d594e3          	bne	a1,a3,10c34 <__ledf2+0x78>
   10cd0:	fbdff06f          	j	10c8c <__ledf2+0xd0>

00010cd4 <__muldf3>:
   10cd4:	0145d793          	srli	a5,a1,0x14
   10cd8:	fb010113          	addi	sp,sp,-80
   10cdc:	00c59713          	slli	a4,a1,0xc
   10ce0:	04112623          	sw	ra,76(sp)
   10ce4:	7ff7f793          	andi	a5,a5,2047
   10ce8:	00050893          	mv	a7,a0
   10cec:	00c75713          	srli	a4,a4,0xc
   10cf0:	01f5d593          	srli	a1,a1,0x1f
   10cf4:	54078463          	beqz	a5,1123c <__muldf3+0x568>
   10cf8:	7ff00513          	li	a0,2047
   10cfc:	38a78263          	beq	a5,a0,11080 <__muldf3+0x3ac>
   10d00:	00371713          	slli	a4,a4,0x3
   10d04:	01d8d513          	srli	a0,a7,0x1d
   10d08:	00e56533          	or	a0,a0,a4
   10d0c:	00800737          	lui	a4,0x800
   10d10:	00389e13          	slli	t3,a7,0x3
   10d14:	00e56733          	or	a4,a0,a4
   10d18:	c0178813          	addi	a6,a5,-1023
   10d1c:	00000893          	li	a7,0
   10d20:	00000f93          	li	t6,0
   10d24:	0146d793          	srli	a5,a3,0x14
   10d28:	00c69313          	slli	t1,a3,0xc
   10d2c:	7ff7f793          	andi	a5,a5,2047
   10d30:	00c35313          	srli	t1,t1,0xc
   10d34:	01f6d693          	srli	a3,a3,0x1f
   10d38:	36078c63          	beqz	a5,110b0 <__muldf3+0x3dc>
   10d3c:	7ff00513          	li	a0,2047
   10d40:	4ca78263          	beq	a5,a0,11204 <__muldf3+0x530>
   10d44:	c0178793          	addi	a5,a5,-1023
   10d48:	00a00513          	li	a0,10
   10d4c:	00f80833          	add	a6,a6,a5
   10d50:	41154c63          	blt	a0,a7,11168 <__muldf3+0x494>
   10d54:	00331313          	slli	t1,t1,0x3
   10d58:	01d65793          	srli	a5,a2,0x1d
   10d5c:	0067e7b3          	or	a5,a5,t1
   10d60:	00800337          	lui	t1,0x800
   10d64:	00d5ceb3          	xor	t4,a1,a3
   10d68:	0067e333          	or	t1,a5,t1
   10d6c:	00200793          	li	a5,2
   10d70:	00361f13          	slli	t5,a2,0x3
   10d74:	000e8593          	mv	a1,t4
   10d78:	00000513          	li	a0,0
   10d7c:	0317d263          	bge	a5,a7,10da0 <__muldf3+0xcc>
   10d80:	00100793          	li	a5,1
   10d84:	011797b3          	sll	a5,a5,a7
   10d88:	5307f613          	andi	a2,a5,1328
   10d8c:	3c061e63          	bnez	a2,11168 <__muldf3+0x494>
   10d90:	2407f593          	andi	a1,a5,576
   10d94:	66059063          	bnez	a1,113f4 <__muldf3+0x720>
   10d98:	0887f793          	andi	a5,a5,136
   10d9c:	3a079e63          	bnez	a5,11158 <__muldf3+0x484>
   10da0:	04812423          	sw	s0,72(sp)
   10da4:	010e1293          	slli	t0,t3,0x10
   10da8:	010f1413          	slli	s0,t5,0x10
   10dac:	0102d293          	srli	t0,t0,0x10
   10db0:	01045413          	srli	s0,s0,0x10
   10db4:	04912223          	sw	s1,68(sp)
   10db8:	05212023          	sw	s2,64(sp)
   10dbc:	03312e23          	sw	s3,60(sp)
   10dc0:	03412c23          	sw	s4,56(sp)
   10dc4:	010e5e13          	srli	t3,t3,0x10
   10dc8:	00028513          	mv	a0,t0
   10dcc:	010f5f13          	srli	t5,t5,0x10
   10dd0:	00040593          	mv	a1,s0
   10dd4:	11d010ef          	jal	126f0 <__mulsi3>
   10dd8:	00050f93          	mv	t6,a0
   10ddc:	000f0593          	mv	a1,t5
   10de0:	00028513          	mv	a0,t0
   10de4:	10d010ef          	jal	126f0 <__mulsi3>
   10de8:	00050793          	mv	a5,a0
   10dec:	00040593          	mv	a1,s0
   10df0:	000e0513          	mv	a0,t3
   10df4:	0fd010ef          	jal	126f0 <__mulsi3>
   10df8:	00050393          	mv	t2,a0
   10dfc:	000f0593          	mv	a1,t5
   10e00:	000e0513          	mv	a0,t3
   10e04:	0ed010ef          	jal	126f0 <__mulsi3>
   10e08:	00778633          	add	a2,a5,t2
   10e0c:	010fd793          	srli	a5,t6,0x10
   10e10:	00c787b3          	add	a5,a5,a2
   10e14:	00050493          	mv	s1,a0
   10e18:	5277ea63          	bltu	a5,t2,1134c <__muldf3+0x678>
   10e1c:	010f9693          	slli	a3,t6,0x10
   10e20:	01031893          	slli	a7,t1,0x10
   10e24:	01079f93          	slli	t6,a5,0x10
   10e28:	0106d693          	srli	a3,a3,0x10
   10e2c:	0108d893          	srli	a7,a7,0x10
   10e30:	00df8933          	add	s2,t6,a3
   10e34:	0107d393          	srli	t2,a5,0x10
   10e38:	01035f93          	srli	t6,t1,0x10
   10e3c:	00088593          	mv	a1,a7
   10e40:	00028513          	mv	a0,t0
   10e44:	0ad010ef          	jal	126f0 <__mulsi3>
   10e48:	00050793          	mv	a5,a0
   10e4c:	000f8593          	mv	a1,t6
   10e50:	00028513          	mv	a0,t0
   10e54:	09d010ef          	jal	126f0 <__mulsi3>
   10e58:	00050313          	mv	t1,a0
   10e5c:	00088593          	mv	a1,a7
   10e60:	000e0513          	mv	a0,t3
   10e64:	08d010ef          	jal	126f0 <__mulsi3>
   10e68:	00050293          	mv	t0,a0
   10e6c:	000f8593          	mv	a1,t6
   10e70:	000e0513          	mv	a0,t3
   10e74:	07d010ef          	jal	126f0 <__mulsi3>
   10e78:	00530333          	add	t1,t1,t0
   10e7c:	0107d593          	srli	a1,a5,0x10
   10e80:	006585b3          	add	a1,a1,t1
   10e84:	0055f663          	bgeu	a1,t0,10e90 <__muldf3+0x1bc>
   10e88:	000106b7          	lui	a3,0x10
   10e8c:	00d50533          	add	a0,a0,a3
   10e90:	01079693          	slli	a3,a5,0x10
   10e94:	0106d693          	srli	a3,a3,0x10
   10e98:	01071293          	slli	t0,a4,0x10
   10e9c:	01059793          	slli	a5,a1,0x10
   10ea0:	0102d293          	srli	t0,t0,0x10
   10ea4:	00d787b3          	add	a5,a5,a3
   10ea8:	0105d593          	srli	a1,a1,0x10
   10eac:	00a589b3          	add	s3,a1,a0
   10eb0:	00f38a33          	add	s4,t2,a5
   10eb4:	01075313          	srli	t1,a4,0x10
   10eb8:	00028513          	mv	a0,t0
   10ebc:	00040593          	mv	a1,s0
   10ec0:	031010ef          	jal	126f0 <__mulsi3>
   10ec4:	00050713          	mv	a4,a0
   10ec8:	000f0593          	mv	a1,t5
   10ecc:	00028513          	mv	a0,t0
   10ed0:	021010ef          	jal	126f0 <__mulsi3>
   10ed4:	00050e13          	mv	t3,a0
   10ed8:	00040593          	mv	a1,s0
   10edc:	00030513          	mv	a0,t1
   10ee0:	011010ef          	jal	126f0 <__mulsi3>
   10ee4:	00050393          	mv	t2,a0
   10ee8:	000f0593          	mv	a1,t5
   10eec:	00030513          	mv	a0,t1
   10ef0:	001010ef          	jal	126f0 <__mulsi3>
   10ef4:	007e0e33          	add	t3,t3,t2
   10ef8:	01075613          	srli	a2,a4,0x10
   10efc:	01c60633          	add	a2,a2,t3
   10f00:	00767663          	bgeu	a2,t2,10f0c <__muldf3+0x238>
   10f04:	000106b7          	lui	a3,0x10
   10f08:	00d50533          	add	a0,a0,a3
   10f0c:	01071713          	slli	a4,a4,0x10
   10f10:	01061693          	slli	a3,a2,0x10
   10f14:	01075713          	srli	a4,a4,0x10
   10f18:	01065613          	srli	a2,a2,0x10
   10f1c:	00a603b3          	add	t2,a2,a0
   10f20:	00e68433          	add	s0,a3,a4
   10f24:	00028513          	mv	a0,t0
   10f28:	00088593          	mv	a1,a7
   10f2c:	7c4010ef          	jal	126f0 <__mulsi3>
   10f30:	00050713          	mv	a4,a0
   10f34:	000f8593          	mv	a1,t6
   10f38:	00028513          	mv	a0,t0
   10f3c:	7b4010ef          	jal	126f0 <__mulsi3>
   10f40:	00050f13          	mv	t5,a0
   10f44:	00088593          	mv	a1,a7
   10f48:	00030513          	mv	a0,t1
   10f4c:	7a4010ef          	jal	126f0 <__mulsi3>
   10f50:	00050e13          	mv	t3,a0
   10f54:	000f8593          	mv	a1,t6
   10f58:	00030513          	mv	a0,t1
   10f5c:	794010ef          	jal	126f0 <__mulsi3>
   10f60:	01cf06b3          	add	a3,t5,t3
   10f64:	01075593          	srli	a1,a4,0x10
   10f68:	00d58f33          	add	t5,a1,a3
   10f6c:	00050313          	mv	t1,a0
   10f70:	01cf7663          	bgeu	t5,t3,10f7c <__muldf3+0x2a8>
   10f74:	000106b7          	lui	a3,0x10
   10f78:	00d50333          	add	t1,a0,a3
   10f7c:	01071613          	slli	a2,a4,0x10
   10f80:	01065613          	srli	a2,a2,0x10
   10f84:	010f1713          	slli	a4,t5,0x10
   10f88:	014486b3          	add	a3,s1,s4
   10f8c:	00c70733          	add	a4,a4,a2
   10f90:	013705b3          	add	a1,a4,s3
   10f94:	00f6b7b3          	sltu	a5,a3,a5
   10f98:	008688b3          	add	a7,a3,s0
   10f9c:	00f587b3          	add	a5,a1,a5
   10fa0:	00778633          	add	a2,a5,t2
   10fa4:	00d8b6b3          	sltu	a3,a7,a3
   10fa8:	00d606b3          	add	a3,a2,a3
   10fac:	00e5b733          	sltu	a4,a1,a4
   10fb0:	00b7b5b3          	sltu	a1,a5,a1
   10fb4:	00b76733          	or	a4,a4,a1
   10fb8:	00f637b3          	sltu	a5,a2,a5
   10fbc:	010f5593          	srli	a1,t5,0x10
   10fc0:	00c6b633          	sltu	a2,a3,a2
   10fc4:	00c7e533          	or	a0,a5,a2
   10fc8:	00b70733          	add	a4,a4,a1
   10fcc:	00989e13          	slli	t3,a7,0x9
   10fd0:	00e50533          	add	a0,a0,a4
   10fd4:	012e6e33          	or	t3,t3,s2
   10fd8:	00650533          	add	a0,a0,t1
   10fdc:	00951513          	slli	a0,a0,0x9
   10fe0:	01c03e33          	snez	t3,t3
   10fe4:	0178d893          	srli	a7,a7,0x17
   10fe8:	0176d713          	srli	a4,a3,0x17
   10fec:	011e6e33          	or	t3,t3,a7
   10ff0:	00969693          	slli	a3,a3,0x9
   10ff4:	00751793          	slli	a5,a0,0x7
   10ff8:	00e56733          	or	a4,a0,a4
   10ffc:	00de6e33          	or	t3,t3,a3
   11000:	1a07ca63          	bltz	a5,111b4 <__muldf3+0x4e0>
   11004:	3ff80793          	addi	a5,a6,1023
   11008:	36f05263          	blez	a5,1136c <__muldf3+0x698>
   1100c:	007e7693          	andi	a3,t3,7
   11010:	52068e63          	beqz	a3,1154c <__muldf3+0x878>
   11014:	00fe7693          	andi	a3,t3,15
   11018:	00400613          	li	a2,4
   1101c:	04812403          	lw	s0,72(sp)
   11020:	04412483          	lw	s1,68(sp)
   11024:	04012903          	lw	s2,64(sp)
   11028:	03c12983          	lw	s3,60(sp)
   1102c:	03812a03          	lw	s4,56(sp)
   11030:	02c68663          	beq	a3,a2,1105c <__muldf3+0x388>
   11034:	004e0693          	addi	a3,t3,4
   11038:	01c6be33          	sltu	t3,a3,t3
   1103c:	01c70733          	add	a4,a4,t3
   11040:	00068e13          	mv	t3,a3
   11044:	00771693          	slli	a3,a4,0x7
   11048:	0006da63          	bgez	a3,1105c <__muldf3+0x388>
   1104c:	ff0006b7          	lui	a3,0xff000
   11050:	fff68693          	addi	a3,a3,-1 # feffffff <_stack_top+0xeeffbfff>
   11054:	40080793          	addi	a5,a6,1024
   11058:	00d77733          	and	a4,a4,a3
   1105c:	7fe00693          	li	a3,2046
   11060:	3af6cc63          	blt	a3,a5,11418 <__muldf3+0x744>
   11064:	01d71613          	slli	a2,a4,0x1d
   11068:	003e5e13          	srli	t3,t3,0x3
   1106c:	00971693          	slli	a3,a4,0x9
   11070:	7ff7f793          	andi	a5,a5,2047
   11074:	01c66633          	or	a2,a2,t3
   11078:	00c6d713          	srli	a4,a3,0xc
   1107c:	1140006f          	j	11190 <__muldf3+0x4bc>
   11080:	01176e33          	or	t3,a4,a7
   11084:	2a0e1a63          	bnez	t3,11338 <__muldf3+0x664>
   11088:	00078813          	mv	a6,a5
   1108c:	0146d793          	srli	a5,a3,0x14
   11090:	00c69313          	slli	t1,a3,0xc
   11094:	7ff7f793          	andi	a5,a5,2047
   11098:	00000713          	li	a4,0
   1109c:	00800893          	li	a7,8
   110a0:	00200f93          	li	t6,2
   110a4:	00c35313          	srli	t1,t1,0xc
   110a8:	01f6d693          	srli	a3,a3,0x1f
   110ac:	c80798e3          	bnez	a5,10d3c <__muldf3+0x68>
   110b0:	00c36f33          	or	t5,t1,a2
   110b4:	200f0863          	beqz	t5,112c4 <__muldf3+0x5f0>
   110b8:	3a030a63          	beqz	t1,1146c <__muldf3+0x798>
   110bc:	00030513          	mv	a0,t1
   110c0:	02c12623          	sw	a2,44(sp)
   110c4:	03112423          	sw	a7,40(sp)
   110c8:	03012223          	sw	a6,36(sp)
   110cc:	02e12023          	sw	a4,32(sp)
   110d0:	01c12e23          	sw	t3,28(sp)
   110d4:	01f12c23          	sw	t6,24(sp)
   110d8:	00d12a23          	sw	a3,20(sp)
   110dc:	00b12823          	sw	a1,16(sp)
   110e0:	00612623          	sw	t1,12(sp)
   110e4:	6e4010ef          	jal	127c8 <__clzsi2>
   110e8:	00c12303          	lw	t1,12(sp)
   110ec:	01012583          	lw	a1,16(sp)
   110f0:	01412683          	lw	a3,20(sp)
   110f4:	01812f83          	lw	t6,24(sp)
   110f8:	01c12e03          	lw	t3,28(sp)
   110fc:	02012703          	lw	a4,32(sp)
   11100:	02412803          	lw	a6,36(sp)
   11104:	02812883          	lw	a7,40(sp)
   11108:	02c12603          	lw	a2,44(sp)
   1110c:	00050793          	mv	a5,a0
   11110:	ff550e93          	addi	t4,a0,-11
   11114:	01d00513          	li	a0,29
   11118:	ff878f13          	addi	t5,a5,-8
   1111c:	41d50533          	sub	a0,a0,t4
   11120:	01e31333          	sll	t1,t1,t5
   11124:	00a65533          	srl	a0,a2,a0
   11128:	00656333          	or	t1,a0,t1
   1112c:	01e61f33          	sll	t5,a2,t5
   11130:	40f807b3          	sub	a5,a6,a5
   11134:	00a00613          	li	a2,10
   11138:	c0d78813          	addi	a6,a5,-1011
   1113c:	03164663          	blt	a2,a7,11168 <__muldf3+0x494>
   11140:	00200793          	li	a5,2
   11144:	00d5ceb3          	xor	t4,a1,a3
   11148:	c517dce3          	bge	a5,a7,10da0 <__muldf3+0xcc>
   1114c:	000e8593          	mv	a1,t4
   11150:	00000513          	li	a0,0
   11154:	c2dff06f          	j	10d80 <__muldf3+0xac>
   11158:	00068593          	mv	a1,a3
   1115c:	00030713          	mv	a4,t1
   11160:	000f0e13          	mv	t3,t5
   11164:	00050f93          	mv	t6,a0
   11168:	00200793          	li	a5,2
   1116c:	28ff8c63          	beq	t6,a5,11404 <__muldf3+0x730>
   11170:	00300793          	li	a5,3
   11174:	1eff8263          	beq	t6,a5,11358 <__muldf3+0x684>
   11178:	00100793          	li	a5,1
   1117c:	00058e93          	mv	t4,a1
   11180:	06ff9063          	bne	t6,a5,111e0 <__muldf3+0x50c>
   11184:	00000793          	li	a5,0
   11188:	00000713          	li	a4,0
   1118c:	00000613          	li	a2,0
   11190:	04c12083          	lw	ra,76(sp)
   11194:	01479793          	slli	a5,a5,0x14
   11198:	01fe9593          	slli	a1,t4,0x1f
   1119c:	00e7e7b3          	or	a5,a5,a4
   111a0:	00b7e7b3          	or	a5,a5,a1
   111a4:	00060513          	mv	a0,a2
   111a8:	00078593          	mv	a1,a5
   111ac:	05010113          	addi	sp,sp,80
   111b0:	00008067          	ret
   111b4:	001e5793          	srli	a5,t3,0x1
   111b8:	04812403          	lw	s0,72(sp)
   111bc:	001e7e13          	andi	t3,t3,1
   111c0:	04412483          	lw	s1,68(sp)
   111c4:	04012903          	lw	s2,64(sp)
   111c8:	03c12983          	lw	s3,60(sp)
   111cc:	03812a03          	lw	s4,56(sp)
   111d0:	01c7e7b3          	or	a5,a5,t3
   111d4:	01f71e13          	slli	t3,a4,0x1f
   111d8:	01c7ee33          	or	t3,a5,t3
   111dc:	00175713          	srli	a4,a4,0x1
   111e0:	40080793          	addi	a5,a6,1024
   111e4:	00180813          	addi	a6,a6,1
   111e8:	18f05c63          	blez	a5,11380 <__muldf3+0x6ac>
   111ec:	007e7693          	andi	a3,t3,7
   111f0:	e4068ae3          	beqz	a3,11044 <__muldf3+0x370>
   111f4:	00fe7693          	andi	a3,t3,15
   111f8:	00400613          	li	a2,4
   111fc:	e2c69ce3          	bne	a3,a2,11034 <__muldf3+0x360>
   11200:	e45ff06f          	j	11044 <__muldf3+0x370>
   11204:	00c36f33          	or	t5,t1,a2
   11208:	7ff80813          	addi	a6,a6,2047
   1120c:	100f1063          	bnez	t5,1130c <__muldf3+0x638>
   11210:	0028e793          	ori	a5,a7,2
   11214:	00a00613          	li	a2,10
   11218:	f4f648e3          	blt	a2,a5,11168 <__muldf3+0x494>
   1121c:	00d5c5b3          	xor	a1,a1,a3
   11220:	00058e93          	mv	t4,a1
   11224:	00200513          	li	a0,2
   11228:	0c088063          	beqz	a7,112e8 <__muldf3+0x614>
   1122c:	00078893          	mv	a7,a5
   11230:	00000313          	li	t1,0
   11234:	00200513          	li	a0,2
   11238:	b49ff06f          	j	10d80 <__muldf3+0xac>
   1123c:	00a76e33          	or	t3,a4,a0
   11240:	060e0863          	beqz	t3,112b0 <__muldf3+0x5dc>
   11244:	00d12e23          	sw	a3,28(sp)
   11248:	00c12c23          	sw	a2,24(sp)
   1124c:	1c070e63          	beqz	a4,11428 <__muldf3+0x754>
   11250:	00a12a23          	sw	a0,20(sp)
   11254:	00070513          	mv	a0,a4
   11258:	00b12823          	sw	a1,16(sp)
   1125c:	00e12623          	sw	a4,12(sp)
   11260:	568010ef          	jal	127c8 <__clzsi2>
   11264:	00c12703          	lw	a4,12(sp)
   11268:	01012583          	lw	a1,16(sp)
   1126c:	01412883          	lw	a7,20(sp)
   11270:	01812603          	lw	a2,24(sp)
   11274:	01c12683          	lw	a3,28(sp)
   11278:	00050313          	mv	t1,a0
   1127c:	ff550813          	addi	a6,a0,-11
   11280:	01d00793          	li	a5,29
   11284:	ff830e13          	addi	t3,t1,-8 # 7ffff8 <_sidata+0x7ec800>
   11288:	410787b3          	sub	a5,a5,a6
   1128c:	01c71733          	sll	a4,a4,t3
   11290:	00f8d7b3          	srl	a5,a7,a5
   11294:	00e7e733          	or	a4,a5,a4
   11298:	01c89e33          	sll	t3,a7,t3
   1129c:	c0d00793          	li	a5,-1011
   112a0:	40678833          	sub	a6,a5,t1
   112a4:	00000893          	li	a7,0
   112a8:	00000f93          	li	t6,0
   112ac:	a79ff06f          	j	10d24 <__muldf3+0x50>
   112b0:	00000713          	li	a4,0
   112b4:	00400893          	li	a7,4
   112b8:	00000813          	li	a6,0
   112bc:	00100f93          	li	t6,1
   112c0:	a65ff06f          	j	10d24 <__muldf3+0x50>
   112c4:	0018e893          	ori	a7,a7,1
   112c8:	00a00793          	li	a5,10
   112cc:	e917cee3          	blt	a5,a7,11168 <__muldf3+0x494>
   112d0:	00d5c5b3          	xor	a1,a1,a3
   112d4:	00200793          	li	a5,2
   112d8:	00058e93          	mv	t4,a1
   112dc:	00000313          	li	t1,0
   112e0:	00100513          	li	a0,1
   112e4:	a917cee3          	blt	a5,a7,10d80 <__muldf3+0xac>
   112e8:	00200793          	li	a5,2
   112ec:	10f50c63          	beq	a0,a5,11404 <__muldf3+0x730>
   112f0:	00100f93          	li	t6,1
   112f4:	00100793          	li	a5,1
   112f8:	00000713          	li	a4,0
   112fc:	00000e13          	li	t3,0
   11300:	00058e93          	mv	t4,a1
   11304:	ecff9ee3          	bne	t6,a5,111e0 <__muldf3+0x50c>
   11308:	e7dff06f          	j	11184 <__muldf3+0x4b0>
   1130c:	0038e893          	ori	a7,a7,3
   11310:	00a00513          	li	a0,10
   11314:	23154463          	blt	a0,a7,1153c <__muldf3+0x868>
   11318:	00100793          	li	a5,1
   1131c:	011797b3          	sll	a5,a5,a7
   11320:	0887f793          	andi	a5,a5,136
   11324:	00d5ceb3          	xor	t4,a1,a3
   11328:	00060f13          	mv	t5,a2
   1132c:	00300513          	li	a0,3
   11330:	a60788e3          	beqz	a5,10da0 <__muldf3+0xcc>
   11334:	e25ff06f          	j	11158 <__muldf3+0x484>
   11338:	00088e13          	mv	t3,a7
   1133c:	00078813          	mv	a6,a5
   11340:	00c00893          	li	a7,12
   11344:	00300f93          	li	t6,3
   11348:	9ddff06f          	j	10d24 <__muldf3+0x50>
   1134c:	000106b7          	lui	a3,0x10
   11350:	00d504b3          	add	s1,a0,a3
   11354:	ac9ff06f          	j	10e1c <__muldf3+0x148>
   11358:	00000e93          	li	t4,0
   1135c:	7ff00793          	li	a5,2047
   11360:	00080737          	lui	a4,0x80
   11364:	00000613          	li	a2,0
   11368:	e29ff06f          	j	11190 <__muldf3+0x4bc>
   1136c:	04812403          	lw	s0,72(sp)
   11370:	04412483          	lw	s1,68(sp)
   11374:	04012903          	lw	s2,64(sp)
   11378:	03c12983          	lw	s3,60(sp)
   1137c:	03812a03          	lw	s4,56(sp)
   11380:	14078e63          	beqz	a5,114dc <__muldf3+0x808>
   11384:	fc900693          	li	a3,-55
   11388:	ded7cee3          	blt	a5,a3,11184 <__muldf3+0x4b0>
   1138c:	fe200693          	li	a3,-30
   11390:	1cd7da63          	bge	a5,a3,11564 <__muldf3+0x890>
   11394:	fe100613          	li	a2,-31
   11398:	40f606b3          	sub	a3,a2,a5
   1139c:	00d756b3          	srl	a3,a4,a3
   113a0:	00c78863          	beq	a5,a2,113b0 <__muldf3+0x6dc>
   113a4:	43e80813          	addi	a6,a6,1086
   113a8:	01071833          	sll	a6,a4,a6
   113ac:	010e6e33          	or	t3,t3,a6
   113b0:	01c03633          	snez	a2,t3
   113b4:	00d66633          	or	a2,a2,a3
   113b8:	00767793          	andi	a5,a2,7
   113bc:	00000713          	li	a4,0
   113c0:	02078263          	beqz	a5,113e4 <__muldf3+0x710>
   113c4:	00f67693          	andi	a3,a2,15
   113c8:	00400593          	li	a1,4
   113cc:	00000793          	li	a5,0
   113d0:	00b68a63          	beq	a3,a1,113e4 <__muldf3+0x710>
   113d4:	00b606b3          	add	a3,a2,a1
   113d8:	00c6b633          	sltu	a2,a3,a2
   113dc:	01d61793          	slli	a5,a2,0x1d
   113e0:	00068613          	mv	a2,a3
   113e4:	00365613          	srli	a2,a2,0x3
   113e8:	00f66633          	or	a2,a2,a5
   113ec:	00000793          	li	a5,0
   113f0:	da1ff06f          	j	11190 <__muldf3+0x4bc>
   113f4:	00000e93          	li	t4,0
   113f8:	7ff00793          	li	a5,2047
   113fc:	00080737          	lui	a4,0x80
   11400:	d91ff06f          	j	11190 <__muldf3+0x4bc>
   11404:	00058e93          	mv	t4,a1
   11408:	7ff00793          	li	a5,2047
   1140c:	00000713          	li	a4,0
   11410:	00000613          	li	a2,0
   11414:	d7dff06f          	j	11190 <__muldf3+0x4bc>
   11418:	7ff00793          	li	a5,2047
   1141c:	00000713          	li	a4,0
   11420:	00000613          	li	a2,0
   11424:	d6dff06f          	j	11190 <__muldf3+0x4bc>
   11428:	00e12a23          	sw	a4,20(sp)
   1142c:	00b12823          	sw	a1,16(sp)
   11430:	00a12623          	sw	a0,12(sp)
   11434:	394010ef          	jal	127c8 <__clzsi2>
   11438:	01550813          	addi	a6,a0,21
   1143c:	01c00793          	li	a5,28
   11440:	00c12883          	lw	a7,12(sp)
   11444:	01012583          	lw	a1,16(sp)
   11448:	01812603          	lw	a2,24(sp)
   1144c:	01c12683          	lw	a3,28(sp)
   11450:	02050313          	addi	t1,a0,32
   11454:	00000713          	li	a4,0
   11458:	e307d4e3          	bge	a5,a6,11280 <__muldf3+0x5ac>
   1145c:	ff850513          	addi	a0,a0,-8
   11460:	00a89733          	sll	a4,a7,a0
   11464:	00000e13          	li	t3,0
   11468:	e35ff06f          	j	1129c <__muldf3+0x5c8>
   1146c:	00060513          	mv	a0,a2
   11470:	03112623          	sw	a7,44(sp)
   11474:	03012423          	sw	a6,40(sp)
   11478:	02e12223          	sw	a4,36(sp)
   1147c:	03c12023          	sw	t3,32(sp)
   11480:	01f12e23          	sw	t6,28(sp)
   11484:	00612c23          	sw	t1,24(sp)
   11488:	00d12a23          	sw	a3,20(sp)
   1148c:	00b12823          	sw	a1,16(sp)
   11490:	00c12623          	sw	a2,12(sp)
   11494:	334010ef          	jal	127c8 <__clzsi2>
   11498:	01550e93          	addi	t4,a0,21
   1149c:	01c00f13          	li	t5,28
   114a0:	00c12603          	lw	a2,12(sp)
   114a4:	01012583          	lw	a1,16(sp)
   114a8:	01412683          	lw	a3,20(sp)
   114ac:	01c12f83          	lw	t6,28(sp)
   114b0:	02012e03          	lw	t3,32(sp)
   114b4:	02412703          	lw	a4,36(sp)
   114b8:	02812803          	lw	a6,40(sp)
   114bc:	02c12883          	lw	a7,44(sp)
   114c0:	02050793          	addi	a5,a0,32
   114c4:	00000313          	li	t1,0
   114c8:	c5df56e3          	bge	t5,t4,11114 <__muldf3+0x440>
   114cc:	ff850513          	addi	a0,a0,-8
   114d0:	00a61333          	sll	t1,a2,a0
   114d4:	00000f13          	li	t5,0
   114d8:	c59ff06f          	j	11130 <__muldf3+0x45c>
   114dc:	00100693          	li	a3,1
   114e0:	41e80813          	addi	a6,a6,1054
   114e4:	010e1633          	sll	a2,t3,a6
   114e8:	00c03633          	snez	a2,a2
   114ec:	01071833          	sll	a6,a4,a6
   114f0:	00de5e33          	srl	t3,t3,a3
   114f4:	01066633          	or	a2,a2,a6
   114f8:	01c66633          	or	a2,a2,t3
   114fc:	00767793          	andi	a5,a2,7
   11500:	00d756b3          	srl	a3,a4,a3
   11504:	02078063          	beqz	a5,11524 <__muldf3+0x850>
   11508:	00f67793          	andi	a5,a2,15
   1150c:	00400713          	li	a4,4
   11510:	00e78a63          	beq	a5,a4,11524 <__muldf3+0x850>
   11514:	00e607b3          	add	a5,a2,a4
   11518:	00c7b633          	sltu	a2,a5,a2
   1151c:	00c686b3          	add	a3,a3,a2
   11520:	00078613          	mv	a2,a5
   11524:	00869793          	slli	a5,a3,0x8
   11528:	0407d463          	bgez	a5,11570 <__muldf3+0x89c>
   1152c:	00100793          	li	a5,1
   11530:	00000713          	li	a4,0
   11534:	00000613          	li	a2,0
   11538:	c59ff06f          	j	11190 <__muldf3+0x4bc>
   1153c:	00000e93          	li	t4,0
   11540:	00080737          	lui	a4,0x80
   11544:	00000613          	li	a2,0
   11548:	c49ff06f          	j	11190 <__muldf3+0x4bc>
   1154c:	04812403          	lw	s0,72(sp)
   11550:	04412483          	lw	s1,68(sp)
   11554:	04012903          	lw	s2,64(sp)
   11558:	03c12983          	lw	s3,60(sp)
   1155c:	03812a03          	lw	s4,56(sp)
   11560:	afdff06f          	j	1105c <__muldf3+0x388>
   11564:	00100693          	li	a3,1
   11568:	40f686b3          	sub	a3,a3,a5
   1156c:	f75ff06f          	j	114e0 <__muldf3+0x80c>
   11570:	00969593          	slli	a1,a3,0x9
   11574:	01d69793          	slli	a5,a3,0x1d
   11578:	00c5d713          	srli	a4,a1,0xc
   1157c:	e69ff06f          	j	113e4 <__muldf3+0x710>

00011580 <__subdf3>:
   11580:	001007b7          	lui	a5,0x100
   11584:	fff78793          	addi	a5,a5,-1 # fffff <_sidata+0xec807>
   11588:	00b7f333          	and	t1,a5,a1
   1158c:	00d7f7b3          	and	a5,a5,a3
   11590:	00379813          	slli	a6,a5,0x3
   11594:	0146d893          	srli	a7,a3,0x14
   11598:	00331313          	slli	t1,t1,0x3
   1159c:	fe010113          	addi	sp,sp,-32
   115a0:	01d55713          	srli	a4,a0,0x1d
   115a4:	01d65793          	srli	a5,a2,0x1d
   115a8:	00676733          	or	a4,a4,t1
   115ac:	0107e7b3          	or	a5,a5,a6
   115b0:	7ff00313          	li	t1,2047
   115b4:	0145d813          	srli	a6,a1,0x14
   115b8:	00112e23          	sw	ra,28(sp)
   115bc:	01f5d593          	srli	a1,a1,0x1f
   115c0:	7ff8f893          	andi	a7,a7,2047
   115c4:	01f6d693          	srli	a3,a3,0x1f
   115c8:	00687833          	and	a6,a6,t1
   115cc:	00058f93          	mv	t6,a1
   115d0:	00351e93          	slli	t4,a0,0x3
   115d4:	00361e13          	slli	t3,a2,0x3
   115d8:	18688463          	beq	a7,t1,11760 <__subdf3+0x1e0>
   115dc:	0016c693          	xori	a3,a3,1
   115e0:	41180f33          	sub	t5,a6,a7
   115e4:	0cd58463          	beq	a1,a3,116ac <__subdf3+0x12c>
   115e8:	73e05a63          	blez	t5,11d1c <__subdf3+0x79c>
   115ec:	1c088e63          	beqz	a7,117c8 <__subdf3+0x248>
   115f0:	50680c63          	beq	a6,t1,11b08 <__subdf3+0x588>
   115f4:	03800693          	li	a3,56
   115f8:	1fe6ca63          	blt	a3,t5,117ec <__subdf3+0x26c>
   115fc:	008006b7          	lui	a3,0x800
   11600:	00d7e7b3          	or	a5,a5,a3
   11604:	01f00693          	li	a3,31
   11608:	61e6c463          	blt	a3,t5,11c10 <__subdf3+0x690>
   1160c:	02000693          	li	a3,32
   11610:	41e686b3          	sub	a3,a3,t5
   11614:	00d79333          	sll	t1,a5,a3
   11618:	00de16b3          	sll	a3,t3,a3
   1161c:	01ee5e33          	srl	t3,t3,t5
   11620:	00d036b3          	snez	a3,a3
   11624:	01c36333          	or	t1,t1,t3
   11628:	01e7df33          	srl	t5,a5,t5
   1162c:	00d36333          	or	t1,t1,a3
   11630:	41e70733          	sub	a4,a4,t5
   11634:	406e8333          	sub	t1,t4,t1
   11638:	006eb7b3          	sltu	a5,t4,t1
   1163c:	40f70733          	sub	a4,a4,a5
   11640:	00871793          	slli	a5,a4,0x8
   11644:	4207c063          	bltz	a5,11a64 <__subdf3+0x4e4>
   11648:	00737793          	andi	a5,t1,7
   1164c:	38078263          	beqz	a5,119d0 <__subdf3+0x450>
   11650:	00f37793          	andi	a5,t1,15
   11654:	00400693          	li	a3,4
   11658:	36d78c63          	beq	a5,a3,119d0 <__subdf3+0x450>
   1165c:	00430793          	addi	a5,t1,4
   11660:	0067b333          	sltu	t1,a5,t1
   11664:	00670733          	add	a4,a4,t1
   11668:	00078313          	mv	t1,a5
   1166c:	00871793          	slli	a5,a4,0x8
   11670:	3607d063          	bgez	a5,119d0 <__subdf3+0x450>
   11674:	00180693          	addi	a3,a6,1
   11678:	7ff00793          	li	a5,2047
   1167c:	0015ff93          	andi	t6,a1,1
   11680:	38f69c63          	bne	a3,a5,11a18 <__subdf3+0x498>
   11684:	00000793          	li	a5,0
   11688:	00000893          	li	a7,0
   1168c:	01c12083          	lw	ra,28(sp)
   11690:	01469713          	slli	a4,a3,0x14
   11694:	00f767b3          	or	a5,a4,a5
   11698:	01ff9693          	slli	a3,t6,0x1f
   1169c:	00088513          	mv	a0,a7
   116a0:	00d7e5b3          	or	a1,a5,a3
   116a4:	02010113          	addi	sp,sp,32
   116a8:	00008067          	ret
   116ac:	79e05863          	blez	t5,11e3c <__subdf3+0x8bc>
   116b0:	28089463          	bnez	a7,11938 <__subdf3+0x3b8>
   116b4:	01c7e6b3          	or	a3,a5,t3
   116b8:	6c068863          	beqz	a3,11d88 <__subdf3+0x808>
   116bc:	fff80f13          	addi	t5,a6,-1
   116c0:	2a0f0c63          	beqz	t5,11978 <__subdf3+0x3f8>
   116c4:	76680063          	beq	a6,t1,11e24 <__subdf3+0x8a4>
   116c8:	03800693          	li	a3,56
   116cc:	29e6c263          	blt	a3,t5,11950 <__subdf3+0x3d0>
   116d0:	01f00693          	li	a3,31
   116d4:	6de6c863          	blt	a3,t5,11da4 <__subdf3+0x824>
   116d8:	02000613          	li	a2,32
   116dc:	41e60633          	sub	a2,a2,t5
   116e0:	00c796b3          	sll	a3,a5,a2
   116e4:	00ce1633          	sll	a2,t3,a2
   116e8:	01ee5e33          	srl	t3,t3,t5
   116ec:	00c03633          	snez	a2,a2
   116f0:	01c6e6b3          	or	a3,a3,t3
   116f4:	01e7df33          	srl	t5,a5,t5
   116f8:	00c6e6b3          	or	a3,a3,a2
   116fc:	01e70733          	add	a4,a4,t5
   11700:	01d687b3          	add	a5,a3,t4
   11704:	00d7b6b3          	sltu	a3,a5,a3
   11708:	00d70733          	add	a4,a4,a3
   1170c:	00078313          	mv	t1,a5
   11710:	00871793          	slli	a5,a4,0x8
   11714:	f207dae3          	bgez	a5,11648 <__subdf3+0xc8>
   11718:	00180813          	addi	a6,a6,1
   1171c:	7ff00793          	li	a5,2047
   11720:	66f80a63          	beq	a6,a5,11d94 <__subdf3+0x814>
   11724:	ff8007b7          	lui	a5,0xff800
   11728:	00135693          	srli	a3,t1,0x1
   1172c:	fff78793          	addi	a5,a5,-1 # ff7fffff <_stack_top+0xef7fbfff>
   11730:	00137313          	andi	t1,t1,1
   11734:	0066e6b3          	or	a3,a3,t1
   11738:	00f777b3          	and	a5,a4,a5
   1173c:	01f79313          	slli	t1,a5,0x1f
   11740:	0076f613          	andi	a2,a3,7
   11744:	0017d713          	srli	a4,a5,0x1
   11748:	00d36333          	or	t1,t1,a3
   1174c:	f20600e3          	beqz	a2,1166c <__subdf3+0xec>
   11750:	00f37793          	andi	a5,t1,15
   11754:	00400693          	li	a3,4
   11758:	f0d792e3          	bne	a5,a3,1165c <__subdf3+0xdc>
   1175c:	f11ff06f          	j	1166c <__subdf3+0xec>
   11760:	01c7e333          	or	t1,a5,t3
   11764:	80180f13          	addi	t5,a6,-2047
   11768:	14030463          	beqz	t1,118b0 <__subdf3+0x330>
   1176c:	14d58663          	beq	a1,a3,118b8 <__subdf3+0x338>
   11770:	180f0863          	beqz	t5,11900 <__subdf3+0x380>
   11774:	44080a63          	beqz	a6,11bc8 <__subdf3+0x648>
   11778:	00361713          	slli	a4,a2,0x3
   1177c:	00375513          	srli	a0,a4,0x3
   11780:	01d79713          	slli	a4,a5,0x1d
   11784:	00068593          	mv	a1,a3
   11788:	00e568b3          	or	a7,a0,a4
   1178c:	0037d793          	srli	a5,a5,0x3
   11790:	00f8e8b3          	or	a7,a7,a5
   11794:	36088263          	beqz	a7,11af8 <__subdf3+0x578>
   11798:	01c12083          	lw	ra,28(sp)
   1179c:	7ff00693          	li	a3,2047
   117a0:	01469713          	slli	a4,a3,0x14
   117a4:	00000f93          	li	t6,0
   117a8:	000807b7          	lui	a5,0x80
   117ac:	00000893          	li	a7,0
   117b0:	00f767b3          	or	a5,a4,a5
   117b4:	01ff9693          	slli	a3,t6,0x1f
   117b8:	00088513          	mv	a0,a7
   117bc:	00d7e5b3          	or	a1,a5,a3
   117c0:	02010113          	addi	sp,sp,32
   117c4:	00008067          	ret
   117c8:	00351613          	slli	a2,a0,0x3
   117cc:	01c7e6b3          	or	a3,a5,t3
   117d0:	00365613          	srli	a2,a2,0x3
   117d4:	20068063          	beqz	a3,119d4 <__subdf3+0x454>
   117d8:	fff80f13          	addi	t5,a6,-1
   117dc:	560f0c63          	beqz	t5,11d54 <__subdf3+0x7d4>
   117e0:	32680463          	beq	a6,t1,11b08 <__subdf3+0x588>
   117e4:	03800693          	li	a3,56
   117e8:	e1e6dee3          	bge	a3,t5,11604 <__subdf3+0x84>
   117ec:	fffe8313          	addi	t1,t4,-1
   117f0:	006eb7b3          	sltu	a5,t4,t1
   117f4:	40f70733          	sub	a4,a4,a5
   117f8:	00871693          	slli	a3,a4,0x8
   117fc:	008007b7          	lui	a5,0x800
   11800:	e406dee3          	bgez	a3,1165c <__subdf3+0xdc>
   11804:	fff78713          	addi	a4,a5,-1 # 7fffff <_sidata+0x7ec807>
   11808:	fff00313          	li	t1,-1
   1180c:	00070513          	mv	a0,a4
   11810:	00b12623          	sw	a1,12(sp)
   11814:	00612423          	sw	t1,8(sp)
   11818:	01012223          	sw	a6,4(sp)
   1181c:	00e12023          	sw	a4,0(sp)
   11820:	7a9000ef          	jal	127c8 <__clzsi2>
   11824:	00012703          	lw	a4,0(sp)
   11828:	00412803          	lw	a6,4(sp)
   1182c:	00812303          	lw	t1,8(sp)
   11830:	00c12583          	lw	a1,12(sp)
   11834:	ff850693          	addi	a3,a0,-8
   11838:	02000613          	li	a2,32
   1183c:	40d607b3          	sub	a5,a2,a3
   11840:	00f357b3          	srl	a5,t1,a5
   11844:	00d71733          	sll	a4,a4,a3
   11848:	00e7e7b3          	or	a5,a5,a4
   1184c:	00d31333          	sll	t1,t1,a3
   11850:	3506cc63          	blt	a3,a6,11ba8 <__subdf3+0x628>
   11854:	410686b3          	sub	a3,a3,a6
   11858:	00168693          	addi	a3,a3,1 # 800001 <_sidata+0x7ec809>
   1185c:	40d60633          	sub	a2,a2,a3
   11860:	00c31733          	sll	a4,t1,a2
   11864:	00e03533          	snez	a0,a4
   11868:	00d35733          	srl	a4,t1,a3
   1186c:	00c79633          	sll	a2,a5,a2
   11870:	00e56733          	or	a4,a0,a4
   11874:	00e66333          	or	t1,a2,a4
   11878:	00d7d733          	srl	a4,a5,a3
   1187c:	00e367b3          	or	a5,t1,a4
   11880:	0e078263          	beqz	a5,11964 <__subdf3+0x3e4>
   11884:	00737793          	andi	a5,t1,7
   11888:	00078ce3          	beqz	a5,120a0 <__subdf3+0xb20>
   1188c:	00f37793          	andi	a5,t1,15
   11890:	00400693          	li	a3,4
   11894:	00000813          	li	a6,0
   11898:	dcd792e3          	bne	a5,a3,1165c <__subdf3+0xdc>
   1189c:	00871793          	slli	a5,a4,0x8
   118a0:	1207d863          	bgez	a5,119d0 <__subdf3+0x450>
   118a4:	0015ff93          	andi	t6,a1,1
   118a8:	00100693          	li	a3,1
   118ac:	1700006f          	j	11a1c <__subdf3+0x49c>
   118b0:	0016c693          	xori	a3,a3,1
   118b4:	ead59ee3          	bne	a1,a3,11770 <__subdf3+0x1f0>
   118b8:	260f0463          	beqz	t5,11b20 <__subdf3+0x5a0>
   118bc:	38081e63          	bnez	a6,11c58 <__subdf3+0x6d8>
   118c0:	00088693          	mv	a3,a7
   118c4:	01d76533          	or	a0,a4,t4
   118c8:	6c050e63          	beqz	a0,11fa4 <__subdf3+0xa24>
   118cc:	fff68513          	addi	a0,a3,-1
   118d0:	0a050463          	beqz	a0,11978 <__subdf3+0x3f8>
   118d4:	7ff00813          	li	a6,2047
   118d8:	39068063          	beq	a3,a6,11c58 <__subdf3+0x6d8>
   118dc:	03800613          	li	a2,56
   118e0:	7aa65663          	bge	a2,a0,1208c <__subdf3+0xb0c>
   118e4:	00068813          	mv	a6,a3
   118e8:	00879693          	slli	a3,a5,0x8
   118ec:	001e0313          	addi	t1,t3,1
   118f0:	00800737          	lui	a4,0x800
   118f4:	e206c2e3          	bltz	a3,11718 <__subdf3+0x198>
   118f8:	00078713          	mv	a4,a5
   118fc:	d61ff06f          	j	1165c <__subdf3+0xdc>
   11900:	00180893          	addi	a7,a6,1
   11904:	7fe8f893          	andi	a7,a7,2046
   11908:	26089663          	bnez	a7,11b74 <__subdf3+0x5f4>
   1190c:	01c7e8b3          	or	a7,a5,t3
   11910:	01d76333          	or	t1,a4,t4
   11914:	3e081263          	bnez	a6,11cf8 <__subdf3+0x778>
   11918:	5c030463          	beqz	t1,11ee0 <__subdf3+0x960>
   1191c:	5c089c63          	bnez	a7,11ef4 <__subdf3+0x974>
   11920:	003ed793          	srli	a5,t4,0x3
   11924:	01d71613          	slli	a2,a4,0x1d
   11928:	00f668b3          	or	a7,a2,a5
   1192c:	00000813          	li	a6,0
   11930:	00375793          	srli	a5,a4,0x3
   11934:	0b40006f          	j	119e8 <__subdf3+0x468>
   11938:	1c680863          	beq	a6,t1,11b08 <__subdf3+0x588>
   1193c:	03800693          	li	a3,56
   11940:	01e6c863          	blt	a3,t5,11950 <__subdf3+0x3d0>
   11944:	008006b7          	lui	a3,0x800
   11948:	00d7e7b3          	or	a5,a5,a3
   1194c:	d85ff06f          	j	116d0 <__subdf3+0x150>
   11950:	00871793          	slli	a5,a4,0x8
   11954:	001e8313          	addi	t1,t4,1
   11958:	d007d2e3          	bgez	a5,1165c <__subdf3+0xdc>
   1195c:	00800737          	lui	a4,0x800
   11960:	db9ff06f          	j	11718 <__subdf3+0x198>
   11964:	0015ff93          	andi	t6,a1,1
   11968:	00000693          	li	a3,0
   1196c:	00000793          	li	a5,0
   11970:	00000893          	li	a7,0
   11974:	d19ff06f          	j	1168c <__subdf3+0x10c>
   11978:	01ce8e33          	add	t3,t4,t3
   1197c:	01de3eb3          	sltu	t4,t3,t4
   11980:	00f707b3          	add	a5,a4,a5
   11984:	01d787b3          	add	a5,a5,t4
   11988:	00879693          	slli	a3,a5,0x8
   1198c:	6206d663          	bgez	a3,11fb8 <__subdf3+0xa38>
   11990:	ff8006b7          	lui	a3,0xff800
   11994:	fff68693          	addi	a3,a3,-1 # ff7fffff <_stack_top+0xef7fbfff>
   11998:	001e5713          	srli	a4,t3,0x1
   1199c:	00d7f7b3          	and	a5,a5,a3
   119a0:	01f79693          	slli	a3,a5,0x1f
   119a4:	00777613          	andi	a2,a4,7
   119a8:	00e6e6b3          	or	a3,a3,a4
   119ac:	0017d713          	srli	a4,a5,0x1
   119b0:	6a060a63          	beqz	a2,12064 <__subdf3+0xae4>
   119b4:	00f6f613          	andi	a2,a3,15
   119b8:	00400513          	li	a0,4
   119bc:	6aa60463          	beq	a2,a0,12064 <__subdf3+0xae4>
   119c0:	00a68333          	add	t1,a3,a0
   119c4:	00d336b3          	sltu	a3,t1,a3
   119c8:	00e68733          	add	a4,a3,a4
   119cc:	00200813          	li	a6,2
   119d0:	00335613          	srli	a2,t1,0x3
   119d4:	01d71793          	slli	a5,a4,0x1d
   119d8:	7ff00693          	li	a3,2047
   119dc:	00c7e8b3          	or	a7,a5,a2
   119e0:	00375793          	srli	a5,a4,0x3
   119e4:	dad806e3          	beq	a6,a3,11790 <__subdf3+0x210>
   119e8:	01c12083          	lw	ra,28(sp)
   119ec:	7ff87693          	andi	a3,a6,2047
   119f0:	00c79793          	slli	a5,a5,0xc
   119f4:	0015ff93          	andi	t6,a1,1
   119f8:	01469713          	slli	a4,a3,0x14
   119fc:	00c7d793          	srli	a5,a5,0xc
   11a00:	00f767b3          	or	a5,a4,a5
   11a04:	01ff9693          	slli	a3,t6,0x1f
   11a08:	00088513          	mv	a0,a7
   11a0c:	00d7e5b3          	or	a1,a5,a3
   11a10:	02010113          	addi	sp,sp,32
   11a14:	00008067          	ret
   11a18:	00f6f6b3          	and	a3,a3,a5
   11a1c:	ff8007b7          	lui	a5,0xff800
   11a20:	fff78793          	addi	a5,a5,-1 # ff7fffff <_stack_top+0xef7fbfff>
   11a24:	00f777b3          	and	a5,a4,a5
   11a28:	01d79713          	slli	a4,a5,0x1d
   11a2c:	00335313          	srli	t1,t1,0x3
   11a30:	01c12083          	lw	ra,28(sp)
   11a34:	006768b3          	or	a7,a4,t1
   11a38:	00979713          	slli	a4,a5,0x9
   11a3c:	00c75793          	srli	a5,a4,0xc
   11a40:	01469713          	slli	a4,a3,0x14
   11a44:	00f767b3          	or	a5,a4,a5
   11a48:	01ff9693          	slli	a3,t6,0x1f
   11a4c:	00088513          	mv	a0,a7
   11a50:	00d7e5b3          	or	a1,a5,a3
   11a54:	02010113          	addi	sp,sp,32
   11a58:	00008067          	ret
   11a5c:	00068593          	mv	a1,a3
   11a60:	00100813          	li	a6,1
   11a64:	00971713          	slli	a4,a4,0x9
   11a68:	00975713          	srli	a4,a4,0x9
   11a6c:	da0710e3          	bnez	a4,1180c <__subdf3+0x28c>
   11a70:	00030513          	mv	a0,t1
   11a74:	00b12623          	sw	a1,12(sp)
   11a78:	00e12423          	sw	a4,8(sp)
   11a7c:	01012223          	sw	a6,4(sp)
   11a80:	00612023          	sw	t1,0(sp)
   11a84:	545000ef          	jal	127c8 <__clzsi2>
   11a88:	01850693          	addi	a3,a0,24
   11a8c:	01f00613          	li	a2,31
   11a90:	00012303          	lw	t1,0(sp)
   11a94:	00412803          	lw	a6,4(sp)
   11a98:	00c12583          	lw	a1,12(sp)
   11a9c:	00000713          	li	a4,0
   11aa0:	d8d65ce3          	bge	a2,a3,11838 <__subdf3+0x2b8>
   11aa4:	ff850793          	addi	a5,a0,-8
   11aa8:	00f317b3          	sll	a5,t1,a5
   11aac:	1906c863          	blt	a3,a6,11c3c <__subdf3+0x6bc>
   11ab0:	41068333          	sub	t1,a3,a6
   11ab4:	00130693          	addi	a3,t1,1
   11ab8:	56d65063          	bge	a2,a3,12018 <__subdf3+0xa98>
   11abc:	fe130313          	addi	t1,t1,-31
   11ac0:	02000613          	li	a2,32
   11ac4:	0067d333          	srl	t1,a5,t1
   11ac8:	00c68c63          	beq	a3,a2,11ae0 <__subdf3+0x560>
   11acc:	04000613          	li	a2,64
   11ad0:	40d606b3          	sub	a3,a2,a3
   11ad4:	00d797b3          	sll	a5,a5,a3
   11ad8:	00f037b3          	snez	a5,a5
   11adc:	00f36333          	or	t1,t1,a5
   11ae0:	e80302e3          	beqz	t1,11964 <__subdf3+0x3e4>
   11ae4:	00737793          	andi	a5,t1,7
   11ae8:	da0792e3          	bnez	a5,1188c <__subdf3+0x30c>
   11aec:	00030e93          	mv	t4,t1
   11af0:	00000713          	li	a4,0
   11af4:	e2dff06f          	j	11920 <__subdf3+0x3a0>
   11af8:	0015ff93          	andi	t6,a1,1
   11afc:	7ff00693          	li	a3,2047
   11b00:	00000793          	li	a5,0
   11b04:	b89ff06f          	j	1168c <__subdf3+0x10c>
   11b08:	00351513          	slli	a0,a0,0x3
   11b0c:	00355513          	srli	a0,a0,0x3
   11b10:	01d71613          	slli	a2,a4,0x1d
   11b14:	00a668b3          	or	a7,a2,a0
   11b18:	00375793          	srli	a5,a4,0x3
   11b1c:	c75ff06f          	j	11790 <__subdf3+0x210>
   11b20:	00180693          	addi	a3,a6,1
   11b24:	7fe6f893          	andi	a7,a3,2046
   11b28:	14089463          	bnez	a7,11c70 <__subdf3+0x6f0>
   11b2c:	01d766b3          	or	a3,a4,t4
   11b30:	36081463          	bnez	a6,11e98 <__subdf3+0x918>
   11b34:	01c7e633          	or	a2,a5,t3
   11b38:	48068c63          	beqz	a3,11fd0 <__subdf3+0xa50>
   11b3c:	de0602e3          	beqz	a2,11920 <__subdf3+0x3a0>
   11b40:	01ce8e33          	add	t3,t4,t3
   11b44:	00f707b3          	add	a5,a4,a5
   11b48:	01de3eb3          	sltu	t4,t3,t4
   11b4c:	01d787b3          	add	a5,a5,t4
   11b50:	00879713          	slli	a4,a5,0x8
   11b54:	4e074463          	bltz	a4,1203c <__subdf3+0xabc>
   11b58:	00fe6733          	or	a4,t3,a5
   11b5c:	e00704e3          	beqz	a4,11964 <__subdf3+0x3e4>
   11b60:	01d79713          	slli	a4,a5,0x1d
   11b64:	003e5e13          	srli	t3,t3,0x3
   11b68:	00ee68b3          	or	a7,t3,a4
   11b6c:	0037d793          	srli	a5,a5,0x3
   11b70:	e79ff06f          	j	119e8 <__subdf3+0x468>
   11b74:	41ce8333          	sub	t1,t4,t3
   11b78:	006eb533          	sltu	a0,t4,t1
   11b7c:	40f70633          	sub	a2,a4,a5
   11b80:	40a60633          	sub	a2,a2,a0
   11b84:	00861513          	slli	a0,a2,0x8
   11b88:	12054e63          	bltz	a0,11cc4 <__subdf3+0x744>
   11b8c:	00c368b3          	or	a7,t1,a2
   11b90:	00060713          	mv	a4,a2
   11b94:	ec089ce3          	bnez	a7,11a6c <__subdf3+0x4ec>
   11b98:	00000f93          	li	t6,0
   11b9c:	00000693          	li	a3,0
   11ba0:	00000793          	li	a5,0
   11ba4:	ae9ff06f          	j	1168c <__subdf3+0x10c>
   11ba8:	ff800737          	lui	a4,0xff800
   11bac:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
   11bb0:	00e7f733          	and	a4,a5,a4
   11bb4:	00737793          	andi	a5,t1,7
   11bb8:	40d80833          	sub	a6,a6,a3
   11bbc:	a8079ae3          	bnez	a5,11650 <__subdf3+0xd0>
   11bc0:	00335613          	srli	a2,t1,0x3
   11bc4:	e11ff06f          	j	119d4 <__subdf3+0x454>
   11bc8:	00088513          	mv	a0,a7
   11bcc:	01d765b3          	or	a1,a4,t4
   11bd0:	10058863          	beqz	a1,11ce0 <__subdf3+0x760>
   11bd4:	fff50813          	addi	a6,a0,-1
   11bd8:	2c080863          	beqz	a6,11ea8 <__subdf3+0x928>
   11bdc:	7ff00593          	li	a1,2047
   11be0:	b8b50ce3          	beq	a0,a1,11778 <__subdf3+0x1f8>
   11be4:	03800613          	li	a2,56
   11be8:	3f065c63          	bge	a2,a6,11fe0 <__subdf3+0xa60>
   11bec:	fffe0313          	addi	t1,t3,-1
   11bf0:	006e3e33          	sltu	t3,t3,t1
   11bf4:	41c78733          	sub	a4,a5,t3
   11bf8:	00871613          	slli	a2,a4,0x8
   11bfc:	008007b7          	lui	a5,0x800
   11c00:	48064a63          	bltz	a2,12094 <__subdf3+0xb14>
   11c04:	00068593          	mv	a1,a3
   11c08:	00050813          	mv	a6,a0
   11c0c:	a51ff06f          	j	1165c <__subdf3+0xdc>
   11c10:	fe0f0693          	addi	a3,t5,-32
   11c14:	02000613          	li	a2,32
   11c18:	00d7d6b3          	srl	a3,a5,a3
   11c1c:	00cf0a63          	beq	t5,a2,11c30 <__subdf3+0x6b0>
   11c20:	04000613          	li	a2,64
   11c24:	41e60633          	sub	a2,a2,t5
   11c28:	00c797b3          	sll	a5,a5,a2
   11c2c:	00fe6e33          	or	t3,t3,a5
   11c30:	01c03333          	snez	t1,t3
   11c34:	00d36333          	or	t1,t1,a3
   11c38:	9fdff06f          	j	11634 <__subdf3+0xb4>
   11c3c:	ff800737          	lui	a4,0xff800
   11c40:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
   11c44:	00e7f7b3          	and	a5,a5,a4
   11c48:	01d79893          	slli	a7,a5,0x1d
   11c4c:	40d80833          	sub	a6,a6,a3
   11c50:	0037d793          	srli	a5,a5,0x3
   11c54:	d95ff06f          	j	119e8 <__subdf3+0x468>
   11c58:	00361713          	slli	a4,a2,0x3
   11c5c:	00375693          	srli	a3,a4,0x3
   11c60:	01d79713          	slli	a4,a5,0x1d
   11c64:	00d768b3          	or	a7,a4,a3
   11c68:	0037d793          	srli	a5,a5,0x3
   11c6c:	b25ff06f          	j	11790 <__subdf3+0x210>
   11c70:	7ff00613          	li	a2,2047
   11c74:	a0c688e3          	beq	a3,a2,11684 <__subdf3+0x104>
   11c78:	01ce8e33          	add	t3,t4,t3
   11c7c:	00f707b3          	add	a5,a4,a5
   11c80:	01de3eb3          	sltu	t4,t3,t4
   11c84:	001e5713          	srli	a4,t3,0x1
   11c88:	01d787b3          	add	a5,a5,t4
   11c8c:	01f79313          	slli	t1,a5,0x1f
   11c90:	00777613          	andi	a2,a4,7
   11c94:	00e36333          	or	t1,t1,a4
   11c98:	0017d713          	srli	a4,a5,0x1
   11c9c:	40060663          	beqz	a2,120a8 <__subdf3+0xb28>
   11ca0:	00068813          	mv	a6,a3
   11ca4:	00400513          	li	a0,4
   11ca8:	00f37693          	andi	a3,t1,15
   11cac:	9aa698e3          	bne	a3,a0,1165c <__subdf3+0xdc>
   11cb0:	00335313          	srli	t1,t1,0x3
   11cb4:	01d71713          	slli	a4,a4,0x1d
   11cb8:	00e368b3          	or	a7,t1,a4
   11cbc:	0047d793          	srli	a5,a5,0x4
   11cc0:	d29ff06f          	j	119e8 <__subdf3+0x468>
   11cc4:	41de0eb3          	sub	t4,t3,t4
   11cc8:	01de3e33          	sltu	t3,t3,t4
   11ccc:	40e787b3          	sub	a5,a5,a4
   11cd0:	000e8313          	mv	t1,t4
   11cd4:	41c78733          	sub	a4,a5,t3
   11cd8:	00068593          	mv	a1,a3
   11cdc:	d91ff06f          	j	11a6c <__subdf3+0x4ec>
   11ce0:	00361613          	slli	a2,a2,0x3
   11ce4:	00365613          	srli	a2,a2,0x3
   11ce8:	00068593          	mv	a1,a3
   11cec:	00050813          	mv	a6,a0
   11cf0:	00078713          	mv	a4,a5
   11cf4:	ce1ff06f          	j	119d4 <__subdf3+0x454>
   11cf8:	12031463          	bnez	t1,11e20 <__subdf3+0x8a0>
   11cfc:	38088063          	beqz	a7,1207c <__subdf3+0xafc>
   11d00:	00361713          	slli	a4,a2,0x3
   11d04:	00375713          	srli	a4,a4,0x3
   11d08:	01d79613          	slli	a2,a5,0x1d
   11d0c:	00068593          	mv	a1,a3
   11d10:	00c768b3          	or	a7,a4,a2
   11d14:	0037d793          	srli	a5,a5,0x3
   11d18:	a79ff06f          	j	11790 <__subdf3+0x210>
   11d1c:	be0f02e3          	beqz	t5,11900 <__subdf3+0x380>
   11d20:	41088533          	sub	a0,a7,a6
   11d24:	ea0804e3          	beqz	a6,11bcc <__subdf3+0x64c>
   11d28:	03800613          	li	a2,56
   11d2c:	0aa65263          	bge	a2,a0,11dd0 <__subdf3+0x850>
   11d30:	fffe0313          	addi	t1,t3,-1
   11d34:	006e3e33          	sltu	t3,t3,t1
   11d38:	41c78733          	sub	a4,a5,t3
   11d3c:	00871613          	slli	a2,a4,0x8
   11d40:	008007b7          	lui	a5,0x800
   11d44:	24064663          	bltz	a2,11f90 <__subdf3+0xa10>
   11d48:	00068593          	mv	a1,a3
   11d4c:	00088813          	mv	a6,a7
   11d50:	90dff06f          	j	1165c <__subdf3+0xdc>
   11d54:	41ce8e33          	sub	t3,t4,t3
   11d58:	40f707b3          	sub	a5,a4,a5
   11d5c:	01cebeb3          	sltu	t4,t4,t3
   11d60:	41d78733          	sub	a4,a5,t4
   11d64:	00871793          	slli	a5,a4,0x8
   11d68:	000e0313          	mv	t1,t3
   11d6c:	ce07cae3          	bltz	a5,11a60 <__subdf3+0x4e0>
   11d70:	003e5e13          	srli	t3,t3,0x3
   11d74:	01d71613          	slli	a2,a4,0x1d
   11d78:	00ce68b3          	or	a7,t3,a2
   11d7c:	00375793          	srli	a5,a4,0x3
   11d80:	00100813          	li	a6,1
   11d84:	c65ff06f          	j	119e8 <__subdf3+0x468>
   11d88:	00351513          	slli	a0,a0,0x3
   11d8c:	00355613          	srli	a2,a0,0x3
   11d90:	c45ff06f          	j	119d4 <__subdf3+0x454>
   11d94:	00080693          	mv	a3,a6
   11d98:	00000793          	li	a5,0
   11d9c:	00000893          	li	a7,0
   11da0:	8edff06f          	j	1168c <__subdf3+0x10c>
   11da4:	fe0f0613          	addi	a2,t5,-32
   11da8:	02000693          	li	a3,32
   11dac:	00c7d633          	srl	a2,a5,a2
   11db0:	00df0a63          	beq	t5,a3,11dc4 <__subdf3+0x844>
   11db4:	04000693          	li	a3,64
   11db8:	41e686b3          	sub	a3,a3,t5
   11dbc:	00d797b3          	sll	a5,a5,a3
   11dc0:	00fe6e33          	or	t3,t3,a5
   11dc4:	01c036b3          	snez	a3,t3
   11dc8:	00c6e6b3          	or	a3,a3,a2
   11dcc:	935ff06f          	j	11700 <__subdf3+0x180>
   11dd0:	00800637          	lui	a2,0x800
   11dd4:	00068593          	mv	a1,a3
   11dd8:	00c76733          	or	a4,a4,a2
   11ddc:	01f00693          	li	a3,31
   11de0:	08a6c663          	blt	a3,a0,11e6c <__subdf3+0x8ec>
   11de4:	02000693          	li	a3,32
   11de8:	40a686b3          	sub	a3,a3,a0
   11dec:	00d71333          	sll	t1,a4,a3
   11df0:	00de96b3          	sll	a3,t4,a3
   11df4:	00aedeb3          	srl	t4,t4,a0
   11df8:	00d036b3          	snez	a3,a3
   11dfc:	01d36333          	or	t1,t1,t4
   11e00:	00a75533          	srl	a0,a4,a0
   11e04:	00d36333          	or	t1,t1,a3
   11e08:	40a787b3          	sub	a5,a5,a0
   11e0c:	406e0333          	sub	t1,t3,t1
   11e10:	006e3e33          	sltu	t3,t3,t1
   11e14:	41c78733          	sub	a4,a5,t3
   11e18:	00088813          	mv	a6,a7
   11e1c:	825ff06f          	j	11640 <__subdf3+0xc0>
   11e20:	96089ce3          	bnez	a7,11798 <__subdf3+0x218>
   11e24:	00351513          	slli	a0,a0,0x3
   11e28:	00355793          	srli	a5,a0,0x3
   11e2c:	01d71613          	slli	a2,a4,0x1d
   11e30:	00c7e8b3          	or	a7,a5,a2
   11e34:	00375793          	srli	a5,a4,0x3
   11e38:	959ff06f          	j	11790 <__subdf3+0x210>
   11e3c:	ce0f02e3          	beqz	t5,11b20 <__subdf3+0x5a0>
   11e40:	410886b3          	sub	a3,a7,a6
   11e44:	a80800e3          	beqz	a6,118c4 <__subdf3+0x344>
   11e48:	03800613          	li	a2,56
   11e4c:	0ed65a63          	bge	a2,a3,11f40 <__subdf3+0x9c0>
   11e50:	00879693          	slli	a3,a5,0x8
   11e54:	001e0313          	addi	t1,t3,1
   11e58:	00088813          	mv	a6,a7
   11e5c:	00800737          	lui	a4,0x800
   11e60:	8a06cce3          	bltz	a3,11718 <__subdf3+0x198>
   11e64:	00078713          	mv	a4,a5
   11e68:	ff4ff06f          	j	1165c <__subdf3+0xdc>
   11e6c:	fe050693          	addi	a3,a0,-32
   11e70:	02000613          	li	a2,32
   11e74:	00d756b3          	srl	a3,a4,a3
   11e78:	00c50a63          	beq	a0,a2,11e8c <__subdf3+0x90c>
   11e7c:	04000613          	li	a2,64
   11e80:	40a60633          	sub	a2,a2,a0
   11e84:	00c71733          	sll	a4,a4,a2
   11e88:	00eeeeb3          	or	t4,t4,a4
   11e8c:	01d03333          	snez	t1,t4
   11e90:	00d36333          	or	t1,t1,a3
   11e94:	f79ff06f          	j	11e0c <__subdf3+0x88c>
   11e98:	dc0680e3          	beqz	a3,11c58 <__subdf3+0x6d8>
   11e9c:	01c7ee33          	or	t3,a5,t3
   11ea0:	8e0e1ce3          	bnez	t3,11798 <__subdf3+0x218>
   11ea4:	f81ff06f          	j	11e24 <__subdf3+0x8a4>
   11ea8:	41de0eb3          	sub	t4,t3,t4
   11eac:	40e787b3          	sub	a5,a5,a4
   11eb0:	01de3e33          	sltu	t3,t3,t4
   11eb4:	41c78733          	sub	a4,a5,t3
   11eb8:	00871793          	slli	a5,a4,0x8
   11ebc:	000e8313          	mv	t1,t4
   11ec0:	b807cee3          	bltz	a5,11a5c <__subdf3+0x4dc>
   11ec4:	003ede93          	srli	t4,t4,0x3
   11ec8:	01d71613          	slli	a2,a4,0x1d
   11ecc:	00068593          	mv	a1,a3
   11ed0:	01d668b3          	or	a7,a2,t4
   11ed4:	00375793          	srli	a5,a4,0x3
   11ed8:	00100813          	li	a6,1
   11edc:	b0dff06f          	j	119e8 <__subdf3+0x468>
   11ee0:	ca088ce3          	beqz	a7,11b98 <__subdf3+0x618>
   11ee4:	00078713          	mv	a4,a5
   11ee8:	000e0e93          	mv	t4,t3
   11eec:	00068593          	mv	a1,a3
   11ef0:	a31ff06f          	j	11920 <__subdf3+0x3a0>
   11ef4:	41ce8533          	sub	a0,t4,t3
   11ef8:	00aeb833          	sltu	a6,t4,a0
   11efc:	40f70633          	sub	a2,a4,a5
   11f00:	41060633          	sub	a2,a2,a6
   11f04:	00861813          	slli	a6,a2,0x8
   11f08:	12085063          	bgez	a6,12028 <__subdf3+0xaa8>
   11f0c:	41de0eb3          	sub	t4,t3,t4
   11f10:	40e787b3          	sub	a5,a5,a4
   11f14:	01de3e33          	sltu	t3,t3,t4
   11f18:	41c78733          	sub	a4,a5,t3
   11f1c:	00eee7b3          	or	a5,t4,a4
   11f20:	000e8313          	mv	t1,t4
   11f24:	00068593          	mv	a1,a3
   11f28:	a2078ee3          	beqz	a5,11964 <__subdf3+0x3e4>
   11f2c:	00871793          	slli	a5,a4,0x8
   11f30:	1807d863          	bgez	a5,120c0 <__subdf3+0xb40>
   11f34:	0016ff93          	andi	t6,a3,1
   11f38:	00100693          	li	a3,1
   11f3c:	ae1ff06f          	j	11a1c <__subdf3+0x49c>
   11f40:	00800637          	lui	a2,0x800
   11f44:	00c76733          	or	a4,a4,a2
   11f48:	01f00613          	li	a2,31
   11f4c:	0ad64063          	blt	a2,a3,11fec <__subdf3+0xa6c>
   11f50:	02000513          	li	a0,32
   11f54:	40d50533          	sub	a0,a0,a3
   11f58:	00a71633          	sll	a2,a4,a0
   11f5c:	00ae9533          	sll	a0,t4,a0
   11f60:	00dedeb3          	srl	t4,t4,a3
   11f64:	00a03533          	snez	a0,a0
   11f68:	00d756b3          	srl	a3,a4,a3
   11f6c:	01d66633          	or	a2,a2,t4
   11f70:	00a66733          	or	a4,a2,a0
   11f74:	00d787b3          	add	a5,a5,a3
   11f78:	01c70e33          	add	t3,a4,t3
   11f7c:	00ee3733          	sltu	a4,t3,a4
   11f80:	00f70733          	add	a4,a4,a5
   11f84:	000e0313          	mv	t1,t3
   11f88:	00088813          	mv	a6,a7
   11f8c:	f84ff06f          	j	11710 <__subdf3+0x190>
   11f90:	00088813          	mv	a6,a7
   11f94:	00068593          	mv	a1,a3
   11f98:	fff78713          	addi	a4,a5,-1 # 7fffff <_sidata+0x7ec807>
   11f9c:	fff00313          	li	t1,-1
   11fa0:	86dff06f          	j	1180c <__subdf3+0x28c>
   11fa4:	00361613          	slli	a2,a2,0x3
   11fa8:	00365613          	srli	a2,a2,0x3
   11fac:	00068813          	mv	a6,a3
   11fb0:	00078713          	mv	a4,a5
   11fb4:	a21ff06f          	j	119d4 <__subdf3+0x454>
   11fb8:	01d79713          	slli	a4,a5,0x1d
   11fbc:	003e5e13          	srli	t3,t3,0x3
   11fc0:	01c768b3          	or	a7,a4,t3
   11fc4:	0037d793          	srli	a5,a5,0x3
   11fc8:	00100813          	li	a6,1
   11fcc:	a1dff06f          	j	119e8 <__subdf3+0x468>
   11fd0:	98060ae3          	beqz	a2,11964 <__subdf3+0x3e4>
   11fd4:	00078713          	mv	a4,a5
   11fd8:	000e0e93          	mv	t4,t3
   11fdc:	945ff06f          	j	11920 <__subdf3+0x3a0>
   11fe0:	00068593          	mv	a1,a3
   11fe4:	00080513          	mv	a0,a6
   11fe8:	df5ff06f          	j	11ddc <__subdf3+0x85c>
   11fec:	fe068613          	addi	a2,a3,-32
   11ff0:	02000513          	li	a0,32
   11ff4:	00c75633          	srl	a2,a4,a2
   11ff8:	00a68a63          	beq	a3,a0,1200c <__subdf3+0xa8c>
   11ffc:	04000513          	li	a0,64
   12000:	40d506b3          	sub	a3,a0,a3
   12004:	00d71733          	sll	a4,a4,a3
   12008:	00eeeeb3          	or	t4,t4,a4
   1200c:	01d03733          	snez	a4,t4
   12010:	00c76733          	or	a4,a4,a2
   12014:	f65ff06f          	j	11f78 <__subdf3+0x9f8>
   12018:	02000613          	li	a2,32
   1201c:	40d60633          	sub	a2,a2,a3
   12020:	00000513          	li	a0,0
   12024:	849ff06f          	j	1186c <__subdf3+0x2ec>
   12028:	00c568b3          	or	a7,a0,a2
   1202c:	b60886e3          	beqz	a7,11b98 <__subdf3+0x618>
   12030:	00060713          	mv	a4,a2
   12034:	00050e93          	mv	t4,a0
   12038:	8e9ff06f          	j	11920 <__subdf3+0x3a0>
   1203c:	ff800737          	lui	a4,0xff800
   12040:	fff70713          	addi	a4,a4,-1 # ff7fffff <_stack_top+0xef7fbfff>
   12044:	00e7f7b3          	and	a5,a5,a4
   12048:	01d79713          	slli	a4,a5,0x1d
   1204c:	003e5e13          	srli	t3,t3,0x3
   12050:	01c768b3          	or	a7,a4,t3
   12054:	00979713          	slli	a4,a5,0x9
   12058:	00c75793          	srli	a5,a4,0xc
   1205c:	00100693          	li	a3,1
   12060:	e2cff06f          	j	1168c <__subdf3+0x10c>
   12064:	0036d693          	srli	a3,a3,0x3
   12068:	01d71713          	slli	a4,a4,0x1d
   1206c:	00d768b3          	or	a7,a4,a3
   12070:	0047d793          	srli	a5,a5,0x4
   12074:	00200813          	li	a6,2
   12078:	971ff06f          	j	119e8 <__subdf3+0x468>
   1207c:	00000f93          	li	t6,0
   12080:	7ff00693          	li	a3,2047
   12084:	000807b7          	lui	a5,0x80
   12088:	e04ff06f          	j	1168c <__subdf3+0x10c>
   1208c:	00050693          	mv	a3,a0
   12090:	eb9ff06f          	j	11f48 <__subdf3+0x9c8>
   12094:	00050813          	mv	a6,a0
   12098:	00068593          	mv	a1,a3
   1209c:	f68ff06f          	j	11804 <__subdf3+0x284>
   120a0:	00058693          	mv	a3,a1
   120a4:	e89ff06f          	j	11f2c <__subdf3+0x9ac>
   120a8:	00335313          	srli	t1,t1,0x3
   120ac:	01d71713          	slli	a4,a4,0x1d
   120b0:	00e368b3          	or	a7,t1,a4
   120b4:	0047d793          	srli	a5,a5,0x4
   120b8:	00068813          	mv	a6,a3
   120bc:	92dff06f          	j	119e8 <__subdf3+0x468>
   120c0:	00068593          	mv	a1,a3
   120c4:	00030e93          	mv	t4,t1
   120c8:	859ff06f          	j	11920 <__subdf3+0x3a0>

000120cc <__unorddf2>:
   120cc:	0145d713          	srli	a4,a1,0x14
   120d0:	001007b7          	lui	a5,0x100
   120d4:	fff78793          	addi	a5,a5,-1 # fffff <_sidata+0xec807>
   120d8:	fff74713          	not	a4,a4
   120dc:	0146d813          	srli	a6,a3,0x14
   120e0:	00b7f5b3          	and	a1,a5,a1
   120e4:	00d7f7b3          	and	a5,a5,a3
   120e8:	01571693          	slli	a3,a4,0x15
   120ec:	7ff87813          	andi	a6,a6,2047
   120f0:	02068063          	beqz	a3,12110 <__unorddf2+0x44>
   120f4:	7ff00713          	li	a4,2047
   120f8:	00000513          	li	a0,0
   120fc:	00e80463          	beq	a6,a4,12104 <__unorddf2+0x38>
   12100:	00008067          	ret
   12104:	00c7e7b3          	or	a5,a5,a2
   12108:	00f03533          	snez	a0,a5
   1210c:	00008067          	ret
   12110:	00a5e5b3          	or	a1,a1,a0
   12114:	00100513          	li	a0,1
   12118:	fc058ee3          	beqz	a1,120f4 <__unorddf2+0x28>
   1211c:	00008067          	ret

00012120 <__fixdfsi>:
   12120:	0145d793          	srli	a5,a1,0x14
   12124:	001006b7          	lui	a3,0x100
   12128:	fff68713          	addi	a4,a3,-1 # fffff <_sidata+0xec807>
   1212c:	7ff7f793          	andi	a5,a5,2047
   12130:	3fe00613          	li	a2,1022
   12134:	00b77733          	and	a4,a4,a1
   12138:	01f5d593          	srli	a1,a1,0x1f
   1213c:	00f65e63          	bge	a2,a5,12158 <__fixdfsi+0x38>
   12140:	41d00613          	li	a2,1053
   12144:	00f65e63          	bge	a2,a5,12160 <__fixdfsi+0x40>
   12148:	80000537          	lui	a0,0x80000
   1214c:	fff50513          	addi	a0,a0,-1 # 7fffffff <_stack_top+0x6fffbfff>
   12150:	00a58533          	add	a0,a1,a0
   12154:	00008067          	ret
   12158:	00000513          	li	a0,0
   1215c:	00008067          	ret
   12160:	41300613          	li	a2,1043
   12164:	00d76733          	or	a4,a4,a3
   12168:	00f64e63          	blt	a2,a5,12184 <__fixdfsi+0x64>
   1216c:	40f60633          	sub	a2,a2,a5
   12170:	00c75733          	srl	a4,a4,a2
   12174:	40e00533          	neg	a0,a4
   12178:	fe0592e3          	bnez	a1,1215c <__fixdfsi+0x3c>
   1217c:	00070513          	mv	a0,a4
   12180:	00008067          	ret
   12184:	43300693          	li	a3,1075
   12188:	40f686b3          	sub	a3,a3,a5
   1218c:	bed78793          	addi	a5,a5,-1043
   12190:	00d55533          	srl	a0,a0,a3
   12194:	00f71733          	sll	a4,a4,a5
   12198:	00a76733          	or	a4,a4,a0
   1219c:	fd9ff06f          	j	12174 <__fixdfsi+0x54>

000121a0 <__floatsidf>:
   121a0:	06050e63          	beqz	a0,1221c <__floatsidf+0x7c>
   121a4:	41f55793          	srai	a5,a0,0x1f
   121a8:	00a7c6b3          	xor	a3,a5,a0
   121ac:	40f686b3          	sub	a3,a3,a5
   121b0:	fe010113          	addi	sp,sp,-32
   121b4:	01f55713          	srli	a4,a0,0x1f
   121b8:	00068513          	mv	a0,a3
   121bc:	00d12623          	sw	a3,12(sp)
   121c0:	00e12423          	sw	a4,8(sp)
   121c4:	00112e23          	sw	ra,28(sp)
   121c8:	600000ef          	jal	127c8 <__clzsi2>
   121cc:	41e00793          	li	a5,1054
   121d0:	40a787b3          	sub	a5,a5,a0
   121d4:	00a00613          	li	a2,10
   121d8:	00812703          	lw	a4,8(sp)
   121dc:	00c12683          	lw	a3,12(sp)
   121e0:	7ff7f793          	andi	a5,a5,2047
   121e4:	06a65063          	bge	a2,a0,12244 <__floatsidf+0xa4>
   121e8:	ff550513          	addi	a0,a0,-11
   121ec:	00a69633          	sll	a2,a3,a0
   121f0:	01c12083          	lw	ra,28(sp)
   121f4:	00c61613          	slli	a2,a2,0xc
   121f8:	00c65613          	srli	a2,a2,0xc
   121fc:	01479793          	slli	a5,a5,0x14
   12200:	00000693          	li	a3,0
   12204:	00c7e7b3          	or	a5,a5,a2
   12208:	01f71713          	slli	a4,a4,0x1f
   1220c:	00068513          	mv	a0,a3
   12210:	00e7e5b3          	or	a1,a5,a4
   12214:	02010113          	addi	sp,sp,32
   12218:	00008067          	ret
   1221c:	00000793          	li	a5,0
   12220:	00000613          	li	a2,0
   12224:	00000713          	li	a4,0
   12228:	01479793          	slli	a5,a5,0x14
   1222c:	00000693          	li	a3,0
   12230:	00c7e7b3          	or	a5,a5,a2
   12234:	01f71713          	slli	a4,a4,0x1f
   12238:	00068513          	mv	a0,a3
   1223c:	00e7e5b3          	or	a1,a5,a4
   12240:	00008067          	ret
   12244:	00b00613          	li	a2,11
   12248:	40a60633          	sub	a2,a2,a0
   1224c:	00c6d633          	srl	a2,a3,a2
   12250:	01c12083          	lw	ra,28(sp)
   12254:	00c61613          	slli	a2,a2,0xc
   12258:	01550513          	addi	a0,a0,21
   1225c:	00c65613          	srli	a2,a2,0xc
   12260:	01479793          	slli	a5,a5,0x14
   12264:	00a696b3          	sll	a3,a3,a0
   12268:	00c7e7b3          	or	a5,a5,a2
   1226c:	01f71713          	slli	a4,a4,0x1f
   12270:	00068513          	mv	a0,a3
   12274:	00e7e5b3          	or	a1,a5,a4
   12278:	02010113          	addi	sp,sp,32
   1227c:	00008067          	ret

00012280 <__floatunsidf>:
   12280:	04050c63          	beqz	a0,122d8 <__floatunsidf+0x58>
   12284:	fe010113          	addi	sp,sp,-32
   12288:	00112e23          	sw	ra,28(sp)
   1228c:	00a12623          	sw	a0,12(sp)
   12290:	538000ef          	jal	127c8 <__clzsi2>
   12294:	41e00713          	li	a4,1054
   12298:	40a70733          	sub	a4,a4,a0
   1229c:	00a00693          	li	a3,10
   122a0:	00c12783          	lw	a5,12(sp)
   122a4:	7ff77713          	andi	a4,a4,2047
   122a8:	04a6d263          	bge	a3,a0,122ec <__floatunsidf+0x6c>
   122ac:	ff550513          	addi	a0,a0,-11
   122b0:	00a796b3          	sll	a3,a5,a0
   122b4:	01c12083          	lw	ra,28(sp)
   122b8:	00c69693          	slli	a3,a3,0xc
   122bc:	00c6d693          	srli	a3,a3,0xc
   122c0:	00000793          	li	a5,0
   122c4:	01471713          	slli	a4,a4,0x14
   122c8:	00078513          	mv	a0,a5
   122cc:	00d765b3          	or	a1,a4,a3
   122d0:	02010113          	addi	sp,sp,32
   122d4:	00008067          	ret
   122d8:	00000713          	li	a4,0
   122dc:	00000693          	li	a3,0
   122e0:	01471713          	slli	a4,a4,0x14
   122e4:	00d765b3          	or	a1,a4,a3
   122e8:	00008067          	ret
   122ec:	00b00693          	li	a3,11
   122f0:	40a686b3          	sub	a3,a3,a0
   122f4:	01c12083          	lw	ra,28(sp)
   122f8:	00d7d6b3          	srl	a3,a5,a3
   122fc:	01550613          	addi	a2,a0,21
   12300:	00c69693          	slli	a3,a3,0xc
   12304:	00c6d693          	srli	a3,a3,0xc
   12308:	00c797b3          	sll	a5,a5,a2
   1230c:	01471713          	slli	a4,a4,0x14
   12310:	00078513          	mv	a0,a5
   12314:	00d765b3          	or	a1,a4,a3
   12318:	02010113          	addi	sp,sp,32
   1231c:	00008067          	ret

00012320 <__trunctfdf2>:
   12320:	00c52783          	lw	a5,12(a0)
   12324:	00452883          	lw	a7,4(a0)
   12328:	00052583          	lw	a1,0(a0)
   1232c:	00852683          	lw	a3,8(a0)
   12330:	01079613          	slli	a2,a5,0x10
   12334:	fe010113          	addi	sp,sp,-32
   12338:	00179513          	slli	a0,a5,0x1
   1233c:	01065613          	srli	a2,a2,0x10
   12340:	00f12623          	sw	a5,12(sp)
   12344:	01f7d813          	srli	a6,a5,0x1f
   12348:	01112223          	sw	a7,4(sp)
   1234c:	01112a23          	sw	a7,20(sp)
   12350:	00c12e23          	sw	a2,28(sp)
   12354:	01155713          	srli	a4,a0,0x11
   12358:	00b12023          	sw	a1,0(sp)
   1235c:	00b12823          	sw	a1,16(sp)
   12360:	00d12423          	sw	a3,8(sp)
   12364:	00d12c23          	sw	a3,24(sp)
   12368:	01010893          	addi	a7,sp,16
   1236c:	01c10793          	addi	a5,sp,28
   12370:	00361513          	slli	a0,a2,0x3
   12374:	ffc7a603          	lw	a2,-4(a5)
   12378:	ffc78793          	addi	a5,a5,-4
   1237c:	01d65693          	srli	a3,a2,0x1d
   12380:	00a6e6b3          	or	a3,a3,a0
   12384:	00d7a223          	sw	a3,4(a5)
   12388:	fef894e3          	bne	a7,a5,12370 <__trunctfdf2+0x50>
   1238c:	00170693          	addi	a3,a4,1
   12390:	00359593          	slli	a1,a1,0x3
   12394:	01169613          	slli	a2,a3,0x11
   12398:	00b12823          	sw	a1,16(sp)
   1239c:	01265613          	srli	a2,a2,0x12
   123a0:	04060063          	beqz	a2,123e0 <__trunctfdf2+0xc0>
   123a4:	ffffc6b7          	lui	a3,0xffffc
   123a8:	40068693          	addi	a3,a3,1024 # ffffc400 <_stack_top+0xefff8400>
   123ac:	00d70733          	add	a4,a4,a3
   123b0:	7fe00693          	li	a3,2046
   123b4:	0ae6dc63          	bge	a3,a4,1246c <__trunctfdf2+0x14c>
   123b8:	7ff00793          	li	a5,2047
   123bc:	00000713          	li	a4,0
   123c0:	00000693          	li	a3,0
   123c4:	01479793          	slli	a5,a5,0x14
   123c8:	00e7e7b3          	or	a5,a5,a4
   123cc:	01f81813          	slli	a6,a6,0x1f
   123d0:	00068513          	mv	a0,a3
   123d4:	0107e5b3          	or	a1,a5,a6
   123d8:	02010113          	addi	sp,sp,32
   123dc:	00008067          	ret
   123e0:	01412783          	lw	a5,20(sp)
   123e4:	01812503          	lw	a0,24(sp)
   123e8:	01c12603          	lw	a2,28(sp)
   123ec:	00a7e6b3          	or	a3,a5,a0
   123f0:	00c6e6b3          	or	a3,a3,a2
   123f4:	00b6e6b3          	or	a3,a3,a1
   123f8:	02071663          	bnez	a4,12424 <__trunctfdf2+0x104>
   123fc:	10068463          	beqz	a3,12504 <__trunctfdf2+0x1e4>
   12400:	00500613          	li	a2,5
   12404:	00000593          	li	a1,0
   12408:	00365613          	srli	a2,a2,0x3
   1240c:	01d59693          	slli	a3,a1,0x1d
   12410:	00c6e6b3          	or	a3,a3,a2
   12414:	00959613          	slli	a2,a1,0x9
   12418:	7ff77793          	andi	a5,a4,2047
   1241c:	00c65713          	srli	a4,a2,0xc
   12420:	fa5ff06f          	j	123c4 <__trunctfdf2+0xa4>
   12424:	f8068ae3          	beqz	a3,123b8 <__trunctfdf2+0x98>
   12428:	00461613          	slli	a2,a2,0x4
   1242c:	01c55713          	srli	a4,a0,0x1c
   12430:	00c76733          	or	a4,a4,a2
   12434:	008006b7          	lui	a3,0x800
   12438:	00d776b3          	and	a3,a4,a3
   1243c:	28068263          	beqz	a3,126c0 <__trunctfdf2+0x3a0>
   12440:	01c7d613          	srli	a2,a5,0x1c
   12444:	ff8007b7          	lui	a5,0xff800
   12448:	fff78793          	addi	a5,a5,-1 # ff7fffff <_stack_top+0xef7fbfff>
   1244c:	00451513          	slli	a0,a0,0x4
   12450:	00f77733          	and	a4,a4,a5
   12454:	00a66633          	or	a2,a2,a0
   12458:	004007b7          	lui	a5,0x400
   1245c:	00f76733          	or	a4,a4,a5
   12460:	ff867613          	andi	a2,a2,-8
   12464:	00000793          	li	a5,0
   12468:	06c0006f          	j	124d4 <__trunctfdf2+0x1b4>
   1246c:	0ae05e63          	blez	a4,12528 <__trunctfdf2+0x208>
   12470:	01412783          	lw	a5,20(sp)
   12474:	01812683          	lw	a3,24(sp)
   12478:	01c12503          	lw	a0,28(sp)
   1247c:	00479613          	slli	a2,a5,0x4
   12480:	00b66633          	or	a2,a2,a1
   12484:	01c7d793          	srli	a5,a5,0x1c
   12488:	00469593          	slli	a1,a3,0x4
   1248c:	00b7e7b3          	or	a5,a5,a1
   12490:	00c03633          	snez	a2,a2
   12494:	00f66633          	or	a2,a2,a5
   12498:	01c6d693          	srli	a3,a3,0x1c
   1249c:	00451593          	slli	a1,a0,0x4
   124a0:	00767793          	andi	a5,a2,7
   124a4:	00d5e5b3          	or	a1,a1,a3
   124a8:	18079063          	bnez	a5,12628 <__trunctfdf2+0x308>
   124ac:	008007b7          	lui	a5,0x800
   124b0:	00f5f7b3          	and	a5,a1,a5
   124b4:	f4078ae3          	beqz	a5,12408 <__trunctfdf2+0xe8>
   124b8:	00170713          	addi	a4,a4,1
   124bc:	7ff00793          	li	a5,2047
   124c0:	eef70ce3          	beq	a4,a5,123b8 <__trunctfdf2+0x98>
   124c4:	ff8006b7          	lui	a3,0xff800
   124c8:	fff68693          	addi	a3,a3,-1 # ff7fffff <_stack_top+0xef7fbfff>
   124cc:	7ff77793          	andi	a5,a4,2047
   124d0:	00d5f733          	and	a4,a1,a3
   124d4:	00365613          	srli	a2,a2,0x3
   124d8:	01d71693          	slli	a3,a4,0x1d
   124dc:	00c6e6b3          	or	a3,a3,a2
   124e0:	00971613          	slli	a2,a4,0x9
   124e4:	00c65713          	srli	a4,a2,0xc
   124e8:	01479793          	slli	a5,a5,0x14
   124ec:	00e7e7b3          	or	a5,a5,a4
   124f0:	01f81813          	slli	a6,a6,0x1f
   124f4:	00068513          	mv	a0,a3
   124f8:	0107e5b3          	or	a1,a5,a6
   124fc:	02010113          	addi	sp,sp,32
   12500:	00008067          	ret
   12504:	00000793          	li	a5,0
   12508:	00000713          	li	a4,0
   1250c:	01479793          	slli	a5,a5,0x14
   12510:	00e7e7b3          	or	a5,a5,a4
   12514:	01f81813          	slli	a6,a6,0x1f
   12518:	00068513          	mv	a0,a3
   1251c:	0107e5b3          	or	a1,a5,a6
   12520:	02010113          	addi	sp,sp,32
   12524:	00008067          	ret
   12528:	fcc00693          	li	a3,-52
   1252c:	12d74263          	blt	a4,a3,12650 <__trunctfdf2+0x330>
   12530:	03d00513          	li	a0,61
   12534:	40e50533          	sub	a0,a0,a4
   12538:	01c12e83          	lw	t4,28(sp)
   1253c:	40555693          	srai	a3,a0,0x5
   12540:	00080737          	lui	a4,0x80
   12544:	00269f13          	slli	t5,a3,0x2
   12548:	00eeeeb3          	or	t4,t4,a4
   1254c:	01e885b3          	add	a1,a7,t5
   12550:	01f57513          	andi	a0,a0,31
   12554:	00058e13          	mv	t3,a1
   12558:	01d12e23          	sw	t4,28(sp)
   1255c:	00088713          	mv	a4,a7
   12560:	00000613          	li	a2,0
   12564:	00072303          	lw	t1,0(a4) # 80000 <_sidata+0x6c808>
   12568:	00470713          	addi	a4,a4,4
   1256c:	00666633          	or	a2,a2,t1
   12570:	fee59ae3          	bne	a1,a4,12564 <__trunctfdf2+0x244>
   12574:	00300313          	li	t1,3
   12578:	40d30733          	sub	a4,t1,a3
   1257c:	0c051e63          	bnez	a0,12658 <__trunctfdf2+0x338>
   12580:	0005a583          	lw	a1,0(a1) # 10000 <__divdf3+0x104>
   12584:	00150513          	addi	a0,a0,1
   12588:	00478793          	addi	a5,a5,4 # 800004 <_sidata+0x7ec80c>
   1258c:	feb7ae23          	sw	a1,-4(a5)
   12590:	00a74e63          	blt	a4,a0,125ac <__trunctfdf2+0x28c>
   12594:	01e785b3          	add	a1,a5,t5
   12598:	0005a583          	lw	a1,0(a1)
   1259c:	00150513          	addi	a0,a0,1
   125a0:	00478793          	addi	a5,a5,4
   125a4:	feb7ae23          	sw	a1,-4(a5)
   125a8:	fea756e3          	bge	a4,a0,12594 <__trunctfdf2+0x274>
   125ac:	00400793          	li	a5,4
   125b0:	40d786b3          	sub	a3,a5,a3
   125b4:	00400713          	li	a4,4
   125b8:	40d70733          	sub	a4,a4,a3
   125bc:	00271713          	slli	a4,a4,0x2
   125c0:	00269693          	slli	a3,a3,0x2
   125c4:	00800593          	li	a1,8
   125c8:	00d887b3          	add	a5,a7,a3
   125cc:	00b76a63          	bltu	a4,a1,125e0 <__trunctfdf2+0x2c0>
   125d0:	0007a023          	sw	zero,0(a5)
   125d4:	0007a223          	sw	zero,4(a5)
   125d8:	ff870713          	addi	a4,a4,-8
   125dc:	00b787b3          	add	a5,a5,a1
   125e0:	00400693          	li	a3,4
   125e4:	00d76463          	bltu	a4,a3,125ec <__trunctfdf2+0x2cc>
   125e8:	0007a023          	sw	zero,0(a5)
   125ec:	01012783          	lw	a5,16(sp)
   125f0:	01412583          	lw	a1,20(sp)
   125f4:	00c03633          	snez	a2,a2
   125f8:	00f66633          	or	a2,a2,a5
   125fc:	00b666b3          	or	a3,a2,a1
   12600:	00000793          	li	a5,0
   12604:	00000713          	li	a4,0
   12608:	da068ee3          	beqz	a3,123c4 <__trunctfdf2+0xa4>
   1260c:	00767793          	andi	a5,a2,7
   12610:	0c079663          	bnez	a5,126dc <__trunctfdf2+0x3bc>
   12614:	00859793          	slli	a5,a1,0x8
   12618:	00100713          	li	a4,1
   1261c:	ea07c4e3          	bltz	a5,124c4 <__trunctfdf2+0x1a4>
   12620:	00000713          	li	a4,0
   12624:	de5ff06f          	j	12408 <__trunctfdf2+0xe8>
   12628:	00f67793          	andi	a5,a2,15
   1262c:	00400693          	li	a3,4
   12630:	e6d78ee3          	beq	a5,a3,124ac <__trunctfdf2+0x18c>
   12634:	00460693          	addi	a3,a2,4 # 800004 <_sidata+0x7ec80c>
   12638:	00c6b633          	sltu	a2,a3,a2
   1263c:	00c585b3          	add	a1,a1,a2
   12640:	008007b7          	lui	a5,0x800
   12644:	00068613          	mv	a2,a3
   12648:	00f5f7b3          	and	a5,a1,a5
   1264c:	e69ff06f          	j	124b4 <__trunctfdf2+0x194>
   12650:	00000713          	li	a4,0
   12654:	dadff06f          	j	12400 <__trunctfdf2+0xe0>
   12658:	01e88f33          	add	t5,a7,t5
   1265c:	000f2583          	lw	a1,0(t5)
   12660:	02000f13          	li	t5,32
   12664:	40af0f33          	sub	t5,t5,a0
   12668:	01e595b3          	sll	a1,a1,t5
   1266c:	00b66633          	or	a2,a2,a1
   12670:	06668063          	beq	a3,t1,126d0 <__trunctfdf2+0x3b0>
   12674:	00000f93          	li	t6,0
   12678:	000e2583          	lw	a1,0(t3)
   1267c:	004e2303          	lw	t1,4(t3)
   12680:	001f8293          	addi	t0,t6,1
   12684:	00a5d5b3          	srl	a1,a1,a0
   12688:	01e31333          	sll	t1,t1,t5
   1268c:	0065e5b3          	or	a1,a1,t1
   12690:	00b7a023          	sw	a1,0(a5) # 800000 <_sidata+0x7ec808>
   12694:	004e0e13          	addi	t3,t3,4
   12698:	00478793          	addi	a5,a5,4
   1269c:	00100f93          	li	t6,1
   126a0:	fce2cce3          	blt	t0,a4,12678 <__trunctfdf2+0x358>
   126a4:	00400793          	li	a5,4
   126a8:	40d786b3          	sub	a3,a5,a3
   126ac:	00271793          	slli	a5,a4,0x2
   126b0:	00f887b3          	add	a5,a7,a5
   126b4:	00aedeb3          	srl	t4,t4,a0
   126b8:	01d7a023          	sw	t4,0(a5)
   126bc:	ef9ff06f          	j	125b4 <__trunctfdf2+0x294>
   126c0:	00000813          	li	a6,0
   126c4:	7ff00793          	li	a5,2047
   126c8:	00080737          	lui	a4,0x80
   126cc:	cf9ff06f          	j	123c4 <__trunctfdf2+0xa4>
   126d0:	00100693          	li	a3,1
   126d4:	00000713          	li	a4,0
   126d8:	fd5ff06f          	j	126ac <__trunctfdf2+0x38c>
   126dc:	00f67793          	andi	a5,a2,15
   126e0:	00400713          	li	a4,4
   126e4:	f2e788e3          	beq	a5,a4,12614 <__trunctfdf2+0x2f4>
   126e8:	00000713          	li	a4,0
   126ec:	f49ff06f          	j	12634 <__trunctfdf2+0x314>

000126f0 <__mulsi3>:
   126f0:	00050613          	mv	a2,a0
   126f4:	00000513          	li	a0,0
   126f8:	0015f693          	andi	a3,a1,1
   126fc:	00068463          	beqz	a3,12704 <__mulsi3+0x14>
   12700:	00c50533          	add	a0,a0,a2
   12704:	0015d593          	srli	a1,a1,0x1
   12708:	00161613          	slli	a2,a2,0x1
   1270c:	fe0596e3          	bnez	a1,126f8 <__mulsi3+0x8>
   12710:	00008067          	ret

00012714 <__divsi3>:
   12714:	06054063          	bltz	a0,12774 <__umodsi3+0x10>
   12718:	0605c663          	bltz	a1,12784 <__umodsi3+0x20>

0001271c <__hidden___udivsi3>:
   1271c:	00058613          	mv	a2,a1
   12720:	00050593          	mv	a1,a0
   12724:	fff00513          	li	a0,-1
   12728:	02060c63          	beqz	a2,12760 <__hidden___udivsi3+0x44>
   1272c:	00100693          	li	a3,1
   12730:	00b67a63          	bgeu	a2,a1,12744 <__hidden___udivsi3+0x28>
   12734:	00c05863          	blez	a2,12744 <__hidden___udivsi3+0x28>
   12738:	00161613          	slli	a2,a2,0x1
   1273c:	00169693          	slli	a3,a3,0x1
   12740:	feb66ae3          	bltu	a2,a1,12734 <__hidden___udivsi3+0x18>
   12744:	00000513          	li	a0,0
   12748:	00c5e663          	bltu	a1,a2,12754 <__hidden___udivsi3+0x38>
   1274c:	40c585b3          	sub	a1,a1,a2
   12750:	00d56533          	or	a0,a0,a3
   12754:	0016d693          	srli	a3,a3,0x1
   12758:	00165613          	srli	a2,a2,0x1
   1275c:	fe0696e3          	bnez	a3,12748 <__hidden___udivsi3+0x2c>
   12760:	00008067          	ret

00012764 <__umodsi3>:
   12764:	00008293          	mv	t0,ra
   12768:	fb5ff0ef          	jal	1271c <__hidden___udivsi3>
   1276c:	00058513          	mv	a0,a1
   12770:	00028067          	jr	t0
   12774:	40a00533          	neg	a0,a0
   12778:	00b04863          	bgtz	a1,12788 <__umodsi3+0x24>
   1277c:	40b005b3          	neg	a1,a1
   12780:	f9dff06f          	j	1271c <__hidden___udivsi3>
   12784:	40b005b3          	neg	a1,a1
   12788:	00008293          	mv	t0,ra
   1278c:	f91ff0ef          	jal	1271c <__hidden___udivsi3>
   12790:	40a00533          	neg	a0,a0
   12794:	00028067          	jr	t0

00012798 <__modsi3>:
   12798:	00008293          	mv	t0,ra
   1279c:	0005ca63          	bltz	a1,127b0 <__modsi3+0x18>
   127a0:	00054c63          	bltz	a0,127b8 <__modsi3+0x20>
   127a4:	f79ff0ef          	jal	1271c <__hidden___udivsi3>
   127a8:	00058513          	mv	a0,a1
   127ac:	00028067          	jr	t0
   127b0:	40b005b3          	neg	a1,a1
   127b4:	fe0558e3          	bgez	a0,127a4 <__modsi3+0xc>
   127b8:	40a00533          	neg	a0,a0
   127bc:	f61ff0ef          	jal	1271c <__hidden___udivsi3>
   127c0:	40b00533          	neg	a0,a1
   127c4:	00028067          	jr	t0

000127c8 <__clzsi2>:
   127c8:	000107b7          	lui	a5,0x10
   127cc:	02f57a63          	bgeu	a0,a5,12800 <__clzsi2+0x38>
   127d0:	10053793          	sltiu	a5,a0,256
   127d4:	0017b793          	seqz	a5,a5
   127d8:	00379793          	slli	a5,a5,0x3
   127dc:	02000713          	li	a4,32
   127e0:	40f70733          	sub	a4,a4,a5
   127e4:	00f55533          	srl	a0,a0,a5
   127e8:	00001797          	auipc	a5,0x1
   127ec:	d4878793          	addi	a5,a5,-696 # 13530 <__clz_tab>
   127f0:	00a787b3          	add	a5,a5,a0
   127f4:	0007c503          	lbu	a0,0(a5)
   127f8:	40a70533          	sub	a0,a4,a0
   127fc:	00008067          	ret
   12800:	010007b7          	lui	a5,0x1000
   12804:	02f57463          	bgeu	a0,a5,1282c <__clzsi2+0x64>
   12808:	01000713          	li	a4,16
   1280c:	00070793          	mv	a5,a4
   12810:	00f55533          	srl	a0,a0,a5
   12814:	00001797          	auipc	a5,0x1
   12818:	d1c78793          	addi	a5,a5,-740 # 13530 <__clz_tab>
   1281c:	00a787b3          	add	a5,a5,a0
   12820:	0007c503          	lbu	a0,0(a5)
   12824:	40a70533          	sub	a0,a4,a0
   12828:	00008067          	ret
   1282c:	01800793          	li	a5,24
   12830:	00f55533          	srl	a0,a0,a5
   12834:	00001797          	auipc	a5,0x1
   12838:	cfc78793          	addi	a5,a5,-772 # 13530 <__clz_tab>
   1283c:	00a787b3          	add	a5,a5,a0
   12840:	0007c503          	lbu	a0,0(a5)
   12844:	00800713          	li	a4,8
   12848:	40a70533          	sub	a0,a4,a0
   1284c:	00008067          	ret
