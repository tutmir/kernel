
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	4c813103          	ld	sp,1224(sp) # 800074c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1c5030ef          	jal	ra,800039e0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN3TCB5yieldEPNS_7ContextES1_>:
.global _ZN3TCB5yieldEPNS_7ContextES1_

_ZN3TCB5yieldEPNS_7ContextES1_:

sd ra, 0(a0)
    80001000:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
sd sp, 8(a0)
    80001004:	00253423          	sd	sp,8(a0)
ld ra, 0(a1)
    80001008:	0005b083          	ld	ra,0(a1)
ld sp, 8(a1)
    8000100c:	0085b103          	ld	sp,8(a1)
    80001010:	00008067          	ret
	...

0000000080001020 <_ZN5Riscv16stvecVectorTableEv>:
.align 4
.global _ZN5Riscv16stvecVectorTableEv
.type _ZN5Riscv16stvecVectorTableEv, @function

_ZN5Riscv16stvecVectorTableEv:
    j softwareInterruptHandler
    80001020:	02c0006f          	j	8000104c <softwareInterruptHandler>
    j timerInterruptHandler
    80001024:	1380006f          	j	8000115c <timerInterruptHandler>
	...
    .skip 28
    j consoleHandler
    80001044:	2280006f          	j	8000126c <consoleHandler>
    sret
    80001048:	10200073          	sret

000000008000104c <softwareInterruptHandler>:

softwareInterruptHandler:
    addi sp, sp, -256
    8000104c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001050:	00013023          	sd	zero,0(sp)
    80001054:	00113423          	sd	ra,8(sp)
    80001058:	00213823          	sd	sp,16(sp)
    8000105c:	00313c23          	sd	gp,24(sp)
    80001060:	02413023          	sd	tp,32(sp)
    80001064:	02513423          	sd	t0,40(sp)
    80001068:	02613823          	sd	t1,48(sp)
    8000106c:	02713c23          	sd	t2,56(sp)
    80001070:	04813023          	sd	s0,64(sp)
    80001074:	04913423          	sd	s1,72(sp)
    80001078:	04a13823          	sd	a0,80(sp)
    8000107c:	04b13c23          	sd	a1,88(sp)
    80001080:	06c13023          	sd	a2,96(sp)
    80001084:	06d13423          	sd	a3,104(sp)
    80001088:	06e13823          	sd	a4,112(sp)
    8000108c:	06f13c23          	sd	a5,120(sp)
    80001090:	09013023          	sd	a6,128(sp)
    80001094:	09113423          	sd	a7,136(sp)
    80001098:	09213823          	sd	s2,144(sp)
    8000109c:	09313c23          	sd	s3,152(sp)
    800010a0:	0b413023          	sd	s4,160(sp)
    800010a4:	0b513423          	sd	s5,168(sp)
    800010a8:	0b613823          	sd	s6,176(sp)
    800010ac:	0b713c23          	sd	s7,184(sp)
    800010b0:	0d813023          	sd	s8,192(sp)
    800010b4:	0d913423          	sd	s9,200(sp)
    800010b8:	0da13823          	sd	s10,208(sp)
    800010bc:	0db13c23          	sd	s11,216(sp)
    800010c0:	0fc13023          	sd	t3,224(sp)
    800010c4:	0fd13423          	sd	t4,232(sp)
    800010c8:	0fe13823          	sd	t5,240(sp)
    800010cc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    800010d0:	2d8000ef          	jal	ra,800013a8 <_ZN5Riscv20handleSupervisorTrapEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010d4:	00013003          	ld	zero,0(sp)
    800010d8:	00813083          	ld	ra,8(sp)
    800010dc:	01013103          	ld	sp,16(sp)
    800010e0:	01813183          	ld	gp,24(sp)
    800010e4:	02013203          	ld	tp,32(sp)
    800010e8:	02813283          	ld	t0,40(sp)
    800010ec:	03013303          	ld	t1,48(sp)
    800010f0:	03813383          	ld	t2,56(sp)
    800010f4:	04013403          	ld	s0,64(sp)
    800010f8:	04813483          	ld	s1,72(sp)
    800010fc:	05013503          	ld	a0,80(sp)
    80001100:	05813583          	ld	a1,88(sp)
    80001104:	06013603          	ld	a2,96(sp)
    80001108:	06813683          	ld	a3,104(sp)
    8000110c:	07013703          	ld	a4,112(sp)
    80001110:	07813783          	ld	a5,120(sp)
    80001114:	08013803          	ld	a6,128(sp)
    80001118:	08813883          	ld	a7,136(sp)
    8000111c:	09013903          	ld	s2,144(sp)
    80001120:	09813983          	ld	s3,152(sp)
    80001124:	0a013a03          	ld	s4,160(sp)
    80001128:	0a813a83          	ld	s5,168(sp)
    8000112c:	0b013b03          	ld	s6,176(sp)
    80001130:	0b813b83          	ld	s7,184(sp)
    80001134:	0c013c03          	ld	s8,192(sp)
    80001138:	0c813c83          	ld	s9,200(sp)
    8000113c:	0d013d03          	ld	s10,208(sp)
    80001140:	0d813d83          	ld	s11,216(sp)
    80001144:	0e013e03          	ld	t3,224(sp)
    80001148:	0e813e83          	ld	t4,232(sp)
    8000114c:	0f013f03          	ld	t5,240(sp)
    80001150:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001154:	10010113          	addi	sp,sp,256

    sret
    80001158:	10200073          	sret

000000008000115c <timerInterruptHandler>:


timerInterruptHandler:
    addi sp, sp, -256
    8000115c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001160:	00013023          	sd	zero,0(sp)
    80001164:	00113423          	sd	ra,8(sp)
    80001168:	00213823          	sd	sp,16(sp)
    8000116c:	00313c23          	sd	gp,24(sp)
    80001170:	02413023          	sd	tp,32(sp)
    80001174:	02513423          	sd	t0,40(sp)
    80001178:	02613823          	sd	t1,48(sp)
    8000117c:	02713c23          	sd	t2,56(sp)
    80001180:	04813023          	sd	s0,64(sp)
    80001184:	04913423          	sd	s1,72(sp)
    80001188:	04a13823          	sd	a0,80(sp)
    8000118c:	04b13c23          	sd	a1,88(sp)
    80001190:	06c13023          	sd	a2,96(sp)
    80001194:	06d13423          	sd	a3,104(sp)
    80001198:	06e13823          	sd	a4,112(sp)
    8000119c:	06f13c23          	sd	a5,120(sp)
    800011a0:	09013023          	sd	a6,128(sp)
    800011a4:	09113423          	sd	a7,136(sp)
    800011a8:	09213823          	sd	s2,144(sp)
    800011ac:	09313c23          	sd	s3,152(sp)
    800011b0:	0b413023          	sd	s4,160(sp)
    800011b4:	0b513423          	sd	s5,168(sp)
    800011b8:	0b613823          	sd	s6,176(sp)
    800011bc:	0b713c23          	sd	s7,184(sp)
    800011c0:	0d813023          	sd	s8,192(sp)
    800011c4:	0d913423          	sd	s9,200(sp)
    800011c8:	0da13823          	sd	s10,208(sp)
    800011cc:	0db13c23          	sd	s11,216(sp)
    800011d0:	0fc13023          	sd	t3,224(sp)
    800011d4:	0fd13423          	sd	t4,232(sp)
    800011d8:	0fe13823          	sd	t5,240(sp)
    800011dc:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleTimerInterruptEv
    800011e0:	608000ef          	jal	ra,800017e8 <_ZN5Riscv20handleTimerInterruptEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011e4:	00013003          	ld	zero,0(sp)
    800011e8:	00813083          	ld	ra,8(sp)
    800011ec:	01013103          	ld	sp,16(sp)
    800011f0:	01813183          	ld	gp,24(sp)
    800011f4:	02013203          	ld	tp,32(sp)
    800011f8:	02813283          	ld	t0,40(sp)
    800011fc:	03013303          	ld	t1,48(sp)
    80001200:	03813383          	ld	t2,56(sp)
    80001204:	04013403          	ld	s0,64(sp)
    80001208:	04813483          	ld	s1,72(sp)
    8000120c:	05013503          	ld	a0,80(sp)
    80001210:	05813583          	ld	a1,88(sp)
    80001214:	06013603          	ld	a2,96(sp)
    80001218:	06813683          	ld	a3,104(sp)
    8000121c:	07013703          	ld	a4,112(sp)
    80001220:	07813783          	ld	a5,120(sp)
    80001224:	08013803          	ld	a6,128(sp)
    80001228:	08813883          	ld	a7,136(sp)
    8000122c:	09013903          	ld	s2,144(sp)
    80001230:	09813983          	ld	s3,152(sp)
    80001234:	0a013a03          	ld	s4,160(sp)
    80001238:	0a813a83          	ld	s5,168(sp)
    8000123c:	0b013b03          	ld	s6,176(sp)
    80001240:	0b813b83          	ld	s7,184(sp)
    80001244:	0c013c03          	ld	s8,192(sp)
    80001248:	0c813c83          	ld	s9,200(sp)
    8000124c:	0d013d03          	ld	s10,208(sp)
    80001250:	0d813d83          	ld	s11,216(sp)
    80001254:	0e013e03          	ld	t3,224(sp)
    80001258:	0e813e83          	ld	t4,232(sp)
    8000125c:	0f013f03          	ld	t5,240(sp)
    80001260:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001264:	10010113          	addi	sp,sp,256

    sret
    80001268:	10200073          	sret

000000008000126c <consoleHandler>:


consoleHandler:
    addi sp, sp, -256
    8000126c:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001270:	00013023          	sd	zero,0(sp)
    80001274:	00113423          	sd	ra,8(sp)
    80001278:	00213823          	sd	sp,16(sp)
    8000127c:	00313c23          	sd	gp,24(sp)
    80001280:	02413023          	sd	tp,32(sp)
    80001284:	02513423          	sd	t0,40(sp)
    80001288:	02613823          	sd	t1,48(sp)
    8000128c:	02713c23          	sd	t2,56(sp)
    80001290:	04813023          	sd	s0,64(sp)
    80001294:	04913423          	sd	s1,72(sp)
    80001298:	04a13823          	sd	a0,80(sp)
    8000129c:	04b13c23          	sd	a1,88(sp)
    800012a0:	06c13023          	sd	a2,96(sp)
    800012a4:	06d13423          	sd	a3,104(sp)
    800012a8:	06e13823          	sd	a4,112(sp)
    800012ac:	06f13c23          	sd	a5,120(sp)
    800012b0:	09013023          	sd	a6,128(sp)
    800012b4:	09113423          	sd	a7,136(sp)
    800012b8:	09213823          	sd	s2,144(sp)
    800012bc:	09313c23          	sd	s3,152(sp)
    800012c0:	0b413023          	sd	s4,160(sp)
    800012c4:	0b513423          	sd	s5,168(sp)
    800012c8:	0b613823          	sd	s6,176(sp)
    800012cc:	0b713c23          	sd	s7,184(sp)
    800012d0:	0d813023          	sd	s8,192(sp)
    800012d4:	0d913423          	sd	s9,200(sp)
    800012d8:	0da13823          	sd	s10,208(sp)
    800012dc:	0db13c23          	sd	s11,216(sp)
    800012e0:	0fc13023          	sd	t3,224(sp)
    800012e4:	0fd13423          	sd	t4,232(sp)
    800012e8:	0fe13823          	sd	t5,240(sp)
    800012ec:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv22handleConsoleInterruptEv
    800012f0:	518000ef          	jal	ra,80001808 <_ZN5Riscv22handleConsoleInterruptEv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012f4:	00013003          	ld	zero,0(sp)
    800012f8:	00813083          	ld	ra,8(sp)
    800012fc:	01013103          	ld	sp,16(sp)
    80001300:	01813183          	ld	gp,24(sp)
    80001304:	02013203          	ld	tp,32(sp)
    80001308:	02813283          	ld	t0,40(sp)
    8000130c:	03013303          	ld	t1,48(sp)
    80001310:	03813383          	ld	t2,56(sp)
    80001314:	04013403          	ld	s0,64(sp)
    80001318:	04813483          	ld	s1,72(sp)
    8000131c:	05013503          	ld	a0,80(sp)
    80001320:	05813583          	ld	a1,88(sp)
    80001324:	06013603          	ld	a2,96(sp)
    80001328:	06813683          	ld	a3,104(sp)
    8000132c:	07013703          	ld	a4,112(sp)
    80001330:	07813783          	ld	a5,120(sp)
    80001334:	08013803          	ld	a6,128(sp)
    80001338:	08813883          	ld	a7,136(sp)
    8000133c:	09013903          	ld	s2,144(sp)
    80001340:	09813983          	ld	s3,152(sp)
    80001344:	0a013a03          	ld	s4,160(sp)
    80001348:	0a813a83          	ld	s5,168(sp)
    8000134c:	0b013b03          	ld	s6,176(sp)
    80001350:	0b813b83          	ld	s7,184(sp)
    80001354:	0c013c03          	ld	s8,192(sp)
    80001358:	0c813c83          	ld	s9,200(sp)
    8000135c:	0d013d03          	ld	s10,208(sp)
    80001360:	0d813d83          	ld	s11,216(sp)
    80001364:	0e013e03          	ld	t3,224(sp)
    80001368:	0e813e83          	ld	t4,232(sp)
    8000136c:	0f013f03          	ld	t5,240(sp)
    80001370:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001374:	10010113          	addi	sp,sp,256

    80001378:	10200073          	sret
	...

0000000080001388 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001388:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    8000138c:	00b29a63          	bne	t0,a1,800013a0 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001390:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001394:	fe029ae3          	bnez	t0,80001388 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001398:	00000513          	li	a0,0
    jr ra                  # Return.
    8000139c:	00008067          	ret

00000000800013a0 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    800013a0:	00100513          	li	a0,1
    800013a4:	00008067          	ret

00000000800013a8 <_ZN5Riscv20handleSupervisorTrapEv>:


void Riscv::handleSupervisorTrap()
{
  uint64 scause;
  __asm__ volatile ("csrr %0, scause" : "=r" (scause));
    800013a8:	14202773          	csrr	a4,scause

  if(scause == 0x08UL || scause == 0x09UL)
    800013ac:	ff870693          	addi	a3,a4,-8
    800013b0:	00100793          	li	a5,1
    800013b4:	00d7fc63          	bgeu	a5,a3,800013cc <_ZN5Riscv20handleSupervisorTrapEv+0x24>
       }
    }
    __asm__ volatile ( "csrw sstatus, %0" : : "r"( sstatus ) );
    __asm__ volatile ( "csrw sepc, %0" : : "r"( sepc ) );
  }
  else if(scause == 0x8000000000000001UL)
    800013b8:	fff00793          	li	a5,-1
    800013bc:	03f79793          	slli	a5,a5,0x3f
    800013c0:	00178793          	addi	a5,a5,1
    800013c4:	1ef70a63          	beq	a4,a5,800015b8 <_ZN5Riscv20handleSupervisorTrapEv+0x210>
    800013c8:	00008067          	ret
{
    800013cc:	fb010113          	addi	sp,sp,-80
    800013d0:	04113423          	sd	ra,72(sp)
    800013d4:	04813023          	sd	s0,64(sp)
    800013d8:	02913c23          	sd	s1,56(sp)
    800013dc:	03213823          	sd	s2,48(sp)
    800013e0:	03313423          	sd	s3,40(sp)
    800013e4:	03413023          	sd	s4,32(sp)
    800013e8:	01513c23          	sd	s5,24(sp)
    800013ec:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    800013f0:	141027f3          	csrr	a5,sepc
    800013f4:	faf43823          	sd	a5,-80(s0)
    sepc += 4;
    800013f8:	fb043783          	ld	a5,-80(s0)
    800013fc:	00478793          	addi	a5,a5,4
    80001400:	faf43823          	sd	a5,-80(s0)
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    80001404:	100027f3          	csrr	a5,sstatus
    80001408:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("mv %0, a0" : "=r" (kod));
    8000140c:	00050793          	mv	a5,a0
    switch (kod)
    80001410:	04200713          	li	a4,66
    80001414:	02f76863          	bltu	a4,a5,80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
    80001418:	00279793          	slli	a5,a5,0x2
    8000141c:	00005717          	auipc	a4,0x5
    80001420:	c0470713          	addi	a4,a4,-1020 # 80006020 <CONSOLE_STATUS+0x10>
    80001424:	00e787b3          	add	a5,a5,a4
    80001428:	0007a783          	lw	a5,0(a5)
    8000142c:	00e787b3          	add	a5,a5,a4
    80001430:	00078067          	jr	a5
       __asm__ volatile ("mv %0, a1" : "=r" (velicina));
    80001434:	00058513          	mv	a0,a1
       void *p = MemoryAllocator::mem_alloc(velicina);
    80001438:	00001097          	auipc	ra,0x1
    8000143c:	a60080e7          	jalr	-1440(ra) # 80001e98 <_ZN15MemoryAllocator9mem_allocEm>
       __asm__ volatile ( "csrw sscratch, %0" : : "r"( p ) );
    80001440:	14051073          	csrw	sscratch,a0
    __asm__ volatile ( "csrw sstatus, %0" : : "r"( sstatus ) );
    80001444:	fb843783          	ld	a5,-72(s0)
    80001448:	10079073          	csrw	sstatus,a5
    __asm__ volatile ( "csrw sepc, %0" : : "r"( sepc ) );
    8000144c:	fb043783          	ld	a5,-80(s0)
    80001450:	14179073          	csrw	sepc,a5
  {
    __asm__ volatile ("csrc sip, 0x2");
  }
  else{}

}
    80001454:	04813083          	ld	ra,72(sp)
    80001458:	04013403          	ld	s0,64(sp)
    8000145c:	03813483          	ld	s1,56(sp)
    80001460:	03013903          	ld	s2,48(sp)
    80001464:	02813983          	ld	s3,40(sp)
    80001468:	02013a03          	ld	s4,32(sp)
    8000146c:	01813a83          	ld	s5,24(sp)
    80001470:	05010113          	addi	sp,sp,80
    80001474:	00008067          	ret
       __asm__ volatile ("mv %0, a1" : "=r" (memorija));
    80001478:	00058513          	mv	a0,a1
       int p = MemoryAllocator::mem_free(memorija);
    8000147c:	00001097          	auipc	ra,0x1
    80001480:	b10080e7          	jalr	-1264(ra) # 80001f8c <_ZN15MemoryAllocator8mem_freeEPv>
       __asm__ volatile ( "csrw sscratch, %0" : : "r"( p ) );
    80001484:	14051073          	csrw	sscratch,a0
       break;
    80001488:	fbdff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
    8000148c:	00058993          	mv	s3,a1
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
    80001490:	00060913          	mv	s2,a2
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
    80001494:	00070a93          	mv	s5,a4
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));
    80001498:	00088a13          	mv	s4,a7

   static void wrapper();

   static int napraviNit(thread_t* handle, Telo telo, void* argumenti, void* stek)
   {
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    8000149c:	03000513          	li	a0,48
    800014a0:	00000097          	auipc	ra,0x0
    800014a4:	390080e7          	jalr	912(ra) # 80001830 <_Znwm>
    800014a8:	00050493          	mv	s1,a0
    800014ac:	000a8693          	mv	a3,s5
    800014b0:	000a0613          	mv	a2,s4
    800014b4:	00090593          	mv	a1,s2
    800014b8:	00001097          	auipc	ra,0x1
    800014bc:	824080e7          	jalr	-2012(ra) # 80001cdc <_ZN3TCBC1EPFvPvES0_S0_>
    800014c0:	0099b023          	sd	s1,0(s3)
     if(telo != nullptr)
    800014c4:	00090863          	beqz	s2,800014d4 <_ZN5Riscv20handleSupervisorTrapEv+0x12c>
       Scheduler::stavi(*handle);
    800014c8:	00048513          	mv	a0,s1
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	444080e7          	jalr	1092(ra) # 80001910 <_ZN9Scheduler5staviEP3TCB>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800014d4:	00000793          	li	a5,0
    800014d8:	14079073          	csrw	sscratch,a5
       break;
    800014dc:	f69ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
    800014e0:	00050913          	mv	s2,a0
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    800014e4:	00048513          	mv	a0,s1
    800014e8:	00000097          	auipc	ra,0x0
    800014ec:	398080e7          	jalr	920(ra) # 80001880 <_ZdlPv>
    800014f0:	00090513          	mv	a0,s2
    800014f4:	00007097          	auipc	ra,0x7
    800014f8:	144080e7          	jalr	324(ra) # 80008638 <_Unwind_Resume>
       TCB::trenutnaNit->exit();
    800014fc:	00001097          	auipc	ra,0x1
    80001500:	8e8080e7          	jalr	-1816(ra) # 80001de4 <_ZN3TCB4exitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    80001504:	00000793          	li	a5,0
    80001508:	14079073          	csrw	sscratch,a5
       break;
    8000150c:	f39ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       TCB::dispatch();
    80001510:	00001097          	auipc	ra,0x1
    80001514:	860080e7          	jalr	-1952(ra) # 80001d70 <_ZN3TCB8dispatchEv>
       break;
    80001518:	f2dff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       __asm__ volatile("mv %0, a1" : "=r"(thread));
    8000151c:	00058513          	mv	a0,a1
       return 0;
   }

   static void start(TCB* nit)
   {
     if(nit->telo != nullptr)
    80001520:	00053783          	ld	a5,0(a0)
    80001524:	f20780e3          	beqz	a5,80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       Scheduler::stavi(nit);
    80001528:	00000097          	auipc	ra,0x0
    8000152c:	3e8080e7          	jalr	1000(ra) # 80001910 <_ZN9Scheduler5staviEP3TCB>
    80001530:	f15ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
    80001534:	00058913          	mv	s2,a1
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
    80001538:	00060993          	mv	s3,a2
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
    8000153c:	00070a93          	mv	s5,a4
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));
    80001540:	00088a13          	mv	s4,a7
       *handle = (thread_t) new TCB(telo, argumenti, stek);
    80001544:	03000513          	li	a0,48
    80001548:	00000097          	auipc	ra,0x0
    8000154c:	2e8080e7          	jalr	744(ra) # 80001830 <_Znwm>
    80001550:	00050493          	mv	s1,a0
    80001554:	000a8693          	mv	a3,s5
    80001558:	000a0613          	mv	a2,s4
    8000155c:	00098593          	mv	a1,s3
    80001560:	00000097          	auipc	ra,0x0
    80001564:	77c080e7          	jalr	1916(ra) # 80001cdc <_ZN3TCBC1EPFvPvES0_S0_>
    80001568:	00993023          	sd	s1,0(s2)
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    8000156c:	00000793          	li	a5,0
    80001570:	14079073          	csrw	sscratch,a5
       break;
    80001574:	ed1ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
    80001578:	00050913          	mv	s2,a0
    8000157c:	00048513          	mv	a0,s1
    80001580:	00000097          	auipc	ra,0x0
    80001584:	300080e7          	jalr	768(ra) # 80001880 <_ZdlPv>
    80001588:	00090513          	mv	a0,s2
    8000158c:	00007097          	auipc	ra,0x7
    80001590:	0ac080e7          	jalr	172(ra) # 80008638 <_Unwind_Resume>
       pv = __getc();
    80001594:	00004097          	auipc	ra,0x4
    80001598:	544080e7          	jalr	1348(ra) # 80005ad8 <__getc>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    8000159c:	14051073          	csrw	sscratch,a0
       break;
    800015a0:	ea5ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
       __asm__ volatile ("mv %0, a1" : "=r"(c));
    800015a4:	00058513          	mv	a0,a1
       __putc(c);
    800015a8:	0ff57513          	andi	a0,a0,255
    800015ac:	00004097          	auipc	ra,0x4
    800015b0:	4f0080e7          	jalr	1264(ra) # 80005a9c <__putc>
       break;
    800015b4:	e91ff06f          	j	80001444 <_ZN5Riscv20handleSupervisorTrapEv+0x9c>
    __asm__ volatile ("csrc sip, 0x2");
    800015b8:	14417073          	csrci	sip,2
}
    800015bc:	00008067          	ret

00000000800015c0 <_Z9mem_allocm>:

size_t velicinaParceta = sizeof(MemoryAllocator::Parce);

void* mem_alloc(size_t velicina)
{
    800015c0:	ff010113          	addi	sp,sp,-16
    800015c4:	00813423          	sd	s0,8(sp)
    800015c8:	01010413          	addi	s0,sp,16
  velicina = ((velicina + velicinaParceta) % MEM_BLOCK_SIZE == 0 ? (velicina + velicinaParceta)/MEM_BLOCK_SIZE : (velicina + velicinaParceta)/MEM_BLOCK_SIZE + 1);
    800015cc:	00006797          	auipc	a5,0x6
    800015d0:	df47b783          	ld	a5,-524(a5) # 800073c0 <velicinaParceta>
    800015d4:	00f50533          	add	a0,a0,a5
    800015d8:	03f57793          	andi	a5,a0,63
    800015dc:	02079263          	bnez	a5,80001600 <_Z9mem_allocm+0x40>
    800015e0:	00655513          	srli	a0,a0,0x6
  void *adresa;

  __asm__ volatile ("mv a1, %0" : : "r" (velicina));
    800015e4:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x01");
    800015e8:	00100513          	li	a0,1
  __asm__ volatile ("ecall");
    800015ec:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r" (adresa));
    800015f0:	00050513          	mv	a0,a0
  return adresa;
}
    800015f4:	00813403          	ld	s0,8(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret
  velicina = ((velicina + velicinaParceta) % MEM_BLOCK_SIZE == 0 ? (velicina + velicinaParceta)/MEM_BLOCK_SIZE : (velicina + velicinaParceta)/MEM_BLOCK_SIZE + 1);
    80001600:	00655513          	srli	a0,a0,0x6
    80001604:	00150513          	addi	a0,a0,1
    80001608:	fddff06f          	j	800015e4 <_Z9mem_allocm+0x24>

000000008000160c <_Z8mem_freePv>:

int mem_free(void* memorija)
{
    8000160c:	ff010113          	addi	sp,sp,-16
    80001610:	00813423          	sd	s0,8(sp)
    80001614:	01010413          	addi	s0,sp,16
  uint64 pv;

  __asm__ volatile ("mv a1, %0" : : "r" (memorija));
    80001618:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x02");
    8000161c:	00200513          	li	a0,2
  __asm__ volatile ("ecall");
    80001620:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r" (pv));
    80001624:	00050513          	mv	a0,a0
  return pv;
}
    80001628:	0005051b          	sext.w	a0,a0
    8000162c:	00813403          	ld	s0,8(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    80001638:	fd010113          	addi	sp,sp,-48
    8000163c:	02113423          	sd	ra,40(sp)
    80001640:	02813023          	sd	s0,32(sp)
    80001644:	00913c23          	sd	s1,24(sp)
    80001648:	01213823          	sd	s2,16(sp)
    8000164c:	01313423          	sd	s3,8(sp)
    80001650:	03010413          	addi	s0,sp,48
    80001654:	00050913          	mv	s2,a0
    80001658:	00058493          	mv	s1,a1
    8000165c:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001660:	04058663          	beqz	a1,800016ac <_Z13thread_createPP3TCBPFvPvES2_+0x74>
    80001664:	00001537          	lui	a0,0x1
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	f58080e7          	jalr	-168(ra) # 800015c0 <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    80001670:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    80001674:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    80001678:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    8000167c:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x11");
    80001680:	01100513          	li	a0,17

  __asm__ volatile ("ecall");
    80001684:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001688:	00050513          	mv	a0,a0
  return pv;
}
    8000168c:	0005051b          	sext.w	a0,a0
    80001690:	02813083          	ld	ra,40(sp)
    80001694:	02013403          	ld	s0,32(sp)
    80001698:	01813483          	ld	s1,24(sp)
    8000169c:	01013903          	ld	s2,16(sp)
    800016a0:	00813983          	ld	s3,8(sp)
    800016a4:	03010113          	addi	sp,sp,48
    800016a8:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    800016ac:	00000513          	li	a0,0
    800016b0:	fc1ff06f          	j	80001670 <_Z13thread_createPP3TCBPFvPvES2_+0x38>

00000000800016b4 <_Z15thread_no_startPP3TCBPFvPvES2_>:

int thread_no_start(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    800016b4:	fd010113          	addi	sp,sp,-48
    800016b8:	02113423          	sd	ra,40(sp)
    800016bc:	02813023          	sd	s0,32(sp)
    800016c0:	00913c23          	sd	s1,24(sp)
    800016c4:	01213823          	sd	s2,16(sp)
    800016c8:	01313423          	sd	s3,8(sp)
    800016cc:	03010413          	addi	s0,sp,48
    800016d0:	00050913          	mv	s2,a0
    800016d4:	00058493          	mv	s1,a1
    800016d8:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    800016dc:	04058663          	beqz	a1,80001728 <_Z15thread_no_startPP3TCBPFvPvES2_+0x74>
    800016e0:	00001537          	lui	a0,0x1
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	edc080e7          	jalr	-292(ra) # 800015c0 <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    800016ec:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    800016f0:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    800016f4:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    800016f8:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x15");
    800016fc:	01500513          	li	a0,21

  __asm__ volatile ("ecall");
    80001700:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001704:	00050513          	mv	a0,a0
  return pv;
}
    80001708:	0005051b          	sext.w	a0,a0
    8000170c:	02813083          	ld	ra,40(sp)
    80001710:	02013403          	ld	s0,32(sp)
    80001714:	01813483          	ld	s1,24(sp)
    80001718:	01013903          	ld	s2,16(sp)
    8000171c:	00813983          	ld	s3,8(sp)
    80001720:	03010113          	addi	sp,sp,48
    80001724:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001728:	00000513          	li	a0,0
    8000172c:	fc1ff06f          	j	800016ec <_Z15thread_no_startPP3TCBPFvPvES2_+0x38>

0000000080001730 <_Z11thread_exitv>:

int thread_exit()
{
    80001730:	ff010113          	addi	sp,sp,-16
    80001734:	00813423          	sd	s0,8(sp)
    80001738:	01010413          	addi	s0,sp,16
  uint64 pv;

  __asm__ volatile ("li a0, 0x12");
    8000173c:	01200513          	li	a0,18
  __asm__ volatile ("ecall");
    80001740:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(pv));
    80001744:	00050513          	mv	a0,a0
  return pv;
}
    80001748:	0005051b          	sext.w	a0,a0
    8000174c:	00813403          	ld	s0,8(sp)
    80001750:	01010113          	addi	sp,sp,16
    80001754:	00008067          	ret

0000000080001758 <_Z15thread_dispatchv>:

void thread_dispatch()
{
    80001758:	ff010113          	addi	sp,sp,-16
    8000175c:	00813423          	sd	s0,8(sp)
    80001760:	01010413          	addi	s0,sp,16
  __asm__ volatile ("li a0, 0x13");
    80001764:	01300513          	li	a0,19
  __asm__ volatile ("ecall");
    80001768:	00000073          	ecall
}
    8000176c:	00813403          	ld	s0,8(sp)
    80001770:	01010113          	addi	sp,sp,16
    80001774:	00008067          	ret

0000000080001778 <_Z12thread_startP3TCB>:

void thread_start(TCB* thread)
{
    80001778:	ff010113          	addi	sp,sp,-16
    8000177c:	00813423          	sd	s0,8(sp)
    80001780:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(thread));
    80001784:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x14");
    80001788:	01400513          	li	a0,20
  __asm__ volatile ("ecall");
    8000178c:	00000073          	ecall
}
    80001790:	00813403          	ld	s0,8(sp)
    80001794:	01010113          	addi	sp,sp,16
    80001798:	00008067          	ret

000000008000179c <_Z4getcv>:

char getc()
{
    8000179c:	ff010113          	addi	sp,sp,-16
    800017a0:	00813423          	sd	s0,8(sp)
    800017a4:	01010413          	addi	s0,sp,16
char c;
  __asm__ volatile ("li a0, 0x41");
    800017a8:	04100513          	li	a0,65
  __asm__ volatile ("ecall");
    800017ac:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(c));
    800017b0:	00050513          	mv	a0,a0
  return c;
}
    800017b4:	0ff57513          	andi	a0,a0,255
    800017b8:	00813403          	ld	s0,8(sp)
    800017bc:	01010113          	addi	sp,sp,16
    800017c0:	00008067          	ret

00000000800017c4 <_Z4putcc>:

void putc(char c)
{
    800017c4:	ff010113          	addi	sp,sp,-16
    800017c8:	00813423          	sd	s0,8(sp)
    800017cc:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(c));
    800017d0:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x42");
    800017d4:	04200513          	li	a0,66
  __asm__ volatile ("ecall");
    800017d8:	00000073          	ecall

}
    800017dc:	00813403          	ld	s0,8(sp)
    800017e0:	01010113          	addi	sp,sp,16
    800017e4:	00008067          	ret

00000000800017e8 <_ZN5Riscv20handleTimerInterruptEv>:

void Riscv::handleTimerInterrupt() {
    800017e8:	ff010113          	addi	sp,sp,-16
    800017ec:	00813423          	sd	s0,8(sp)
    800017f0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800017f4:	00200793          	li	a5,2
    800017f8:	1447b073          	csrc	sip,a5
  mc_sip(SIP_SSIP);
}
    800017fc:	00813403          	ld	s0,8(sp)
    80001800:	01010113          	addi	sp,sp,16
    80001804:	00008067          	ret

0000000080001808 <_ZN5Riscv22handleConsoleInterruptEv>:

void Riscv::handleConsoleInterrupt() {
    80001808:	ff010113          	addi	sp,sp,-16
    8000180c:	00113423          	sd	ra,8(sp)
    80001810:	00813023          	sd	s0,0(sp)
    80001814:	01010413          	addi	s0,sp,16
  console_handler();
    80001818:	00004097          	auipc	ra,0x4
    8000181c:	2f8080e7          	jalr	760(ra) # 80005b10 <console_handler>
}
    80001820:	00813083          	ld	ra,8(sp)
    80001824:	00013403          	ld	s0,0(sp)
    80001828:	01010113          	addi	sp,sp,16
    8000182c:	00008067          	ret

0000000080001830 <_Znwm>:
//

#include "../h/syscall_c.h"

void* operator new(size_t velicina)
{
    80001830:	ff010113          	addi	sp,sp,-16
    80001834:	00113423          	sd	ra,8(sp)
    80001838:	00813023          	sd	s0,0(sp)
    8000183c:	01010413          	addi	s0,sp,16
  return mem_alloc(velicina);
    80001840:	00000097          	auipc	ra,0x0
    80001844:	d80080e7          	jalr	-640(ra) # 800015c0 <_Z9mem_allocm>
}
    80001848:	00813083          	ld	ra,8(sp)
    8000184c:	00013403          	ld	s0,0(sp)
    80001850:	01010113          	addi	sp,sp,16
    80001854:	00008067          	ret

0000000080001858 <_Znam>:

void* operator new[](size_t velicina)
{
    80001858:	ff010113          	addi	sp,sp,-16
    8000185c:	00113423          	sd	ra,8(sp)
    80001860:	00813023          	sd	s0,0(sp)
    80001864:	01010413          	addi	s0,sp,16
  return mem_alloc(velicina);
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	d58080e7          	jalr	-680(ra) # 800015c0 <_Z9mem_allocm>
}
    80001870:	00813083          	ld	ra,8(sp)
    80001874:	00013403          	ld	s0,0(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_ZdlPv>:

void operator delete(void* pokazivac) noexcept
{
    80001880:	ff010113          	addi	sp,sp,-16
    80001884:	00113423          	sd	ra,8(sp)
    80001888:	00813023          	sd	s0,0(sp)
    8000188c:	01010413          	addi	s0,sp,16
  mem_free(pokazivac);
    80001890:	00000097          	auipc	ra,0x0
    80001894:	d7c080e7          	jalr	-644(ra) # 8000160c <_Z8mem_freePv>
}
    80001898:	00813083          	ld	ra,8(sp)
    8000189c:	00013403          	ld	s0,0(sp)
    800018a0:	01010113          	addi	sp,sp,16
    800018a4:	00008067          	ret

00000000800018a8 <_ZdaPv>:

void operator delete[](void* pokazivac) noexcept
{
    800018a8:	ff010113          	addi	sp,sp,-16
    800018ac:	00113423          	sd	ra,8(sp)
    800018b0:	00813023          	sd	s0,0(sp)
    800018b4:	01010413          	addi	s0,sp,16
  mem_free(pokazivac);
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	d54080e7          	jalr	-684(ra) # 8000160c <_Z8mem_freePv>
}
    800018c0:	00813083          	ld	ra,8(sp)
    800018c4:	00013403          	ld	s0,0(sp)
    800018c8:	01010113          	addi	sp,sp,16
    800018cc:	00008067          	ret

00000000800018d0 <_Z41__static_initialization_and_destruction_0ii>:
}

TCB* Scheduler::uzmi()
{
   return listaNiti.izbaciPrvi();
    800018d0:	ff010113          	addi	sp,sp,-16
    800018d4:	00813423          	sd	s0,8(sp)
    800018d8:	01010413          	addi	s0,sp,16
    800018dc:	00100793          	li	a5,1
    800018e0:	00f50863          	beq	a0,a5,800018f0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800018e4:	00813403          	ld	s0,8(sp)
    800018e8:	01010113          	addi	sp,sp,16
    800018ec:	00008067          	ret
    800018f0:	000107b7          	lui	a5,0x10
    800018f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800018f8:	fef596e3          	bne	a1,a5,800018e4 <_Z41__static_initialization_and_destruction_0ii+0x14>

  Cvor *pocetak, *kraj;

public:

Lista(): pocetak(nullptr), kraj(nullptr) {}
    800018fc:	00006797          	auipc	a5,0x6
    80001900:	c3478793          	addi	a5,a5,-972 # 80007530 <_ZN9Scheduler9listaNitiE>
    80001904:	0007b023          	sd	zero,0(a5)
    80001908:	0007b423          	sd	zero,8(a5)
    8000190c:	fd9ff06f          	j	800018e4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001910 <_ZN9Scheduler5staviEP3TCB>:
{
    80001910:	fe010113          	addi	sp,sp,-32
    80001914:	00113c23          	sd	ra,24(sp)
    80001918:	00813823          	sd	s0,16(sp)
    8000191c:	00913423          	sd	s1,8(sp)
    80001920:	02010413          	addi	s0,sp,32
    80001924:	00050493          	mv	s1,a0
  kraj = noviCvor;
}

void dodajNaKraj(T* t)
{
Cvor *noviCvor = new Cvor(t, nullptr);
    80001928:	01000513          	li	a0,16
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	f04080e7          	jalr	-252(ra) # 80001830 <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80001934:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    80001938:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    8000193c:	00006797          	auipc	a5,0x6
    80001940:	bfc7b783          	ld	a5,-1028(a5) # 80007538 <_ZN9Scheduler9listaNitiE+0x8>
    80001944:	02078263          	beqz	a5,80001968 <_ZN9Scheduler5staviEP3TCB+0x58>
  {
     kraj = kraj->sledeci = noviCvor;
    80001948:	00a7b423          	sd	a0,8(a5)
    8000194c:	00006797          	auipc	a5,0x6
    80001950:	bea7b623          	sd	a0,-1044(a5) # 80007538 <_ZN9Scheduler9listaNitiE+0x8>
}
    80001954:	01813083          	ld	ra,24(sp)
    80001958:	01013403          	ld	s0,16(sp)
    8000195c:	00813483          	ld	s1,8(sp)
    80001960:	02010113          	addi	sp,sp,32
    80001964:	00008067          	ret
  }
  else
  {
    pocetak = kraj = noviCvor;
    80001968:	00006797          	auipc	a5,0x6
    8000196c:	bc878793          	addi	a5,a5,-1080 # 80007530 <_ZN9Scheduler9listaNitiE>
    80001970:	00a7b423          	sd	a0,8(a5)
    80001974:	00a7b023          	sd	a0,0(a5)
    80001978:	fddff06f          	j	80001954 <_ZN9Scheduler5staviEP3TCB+0x44>

000000008000197c <_ZN9Scheduler4uzmiEv>:
{
    8000197c:	fe010113          	addi	sp,sp,-32
    80001980:	00113c23          	sd	ra,24(sp)
    80001984:	00813823          	sd	s0,16(sp)
    80001988:	00913423          	sd	s1,8(sp)
    8000198c:	02010413          	addi	s0,sp,32
  }
}

T* izbaciPrvi()
{
  if(pocetak == nullptr)
    80001990:	00006517          	auipc	a0,0x6
    80001994:	ba053503          	ld	a0,-1120(a0) # 80007530 <_ZN9Scheduler9listaNitiE>
    80001998:	04050263          	beqz	a0,800019dc <_ZN9Scheduler4uzmiEv+0x60>
    return nullptr;

  Cvor *cvor = pocetak;
  pocetak = pocetak->sledeci;
    8000199c:	00853783          	ld	a5,8(a0)
    800019a0:	00006717          	auipc	a4,0x6
    800019a4:	b8f73823          	sd	a5,-1136(a4) # 80007530 <_ZN9Scheduler9listaNitiE>

  if(pocetak == nullptr)
    800019a8:	02078463          	beqz	a5,800019d0 <_ZN9Scheduler4uzmiEv+0x54>
    kraj = nullptr;

  T* pv = cvor->podaci;
    800019ac:	00053483          	ld	s1,0(a0)
  delete cvor;
    800019b0:	00000097          	auipc	ra,0x0
    800019b4:	ed0080e7          	jalr	-304(ra) # 80001880 <_ZdlPv>
    800019b8:	00048513          	mv	a0,s1
    800019bc:	01813083          	ld	ra,24(sp)
    800019c0:	01013403          	ld	s0,16(sp)
    800019c4:	00813483          	ld	s1,8(sp)
    800019c8:	02010113          	addi	sp,sp,32
    800019cc:	00008067          	ret
    kraj = nullptr;
    800019d0:	00006797          	auipc	a5,0x6
    800019d4:	b607b423          	sd	zero,-1176(a5) # 80007538 <_ZN9Scheduler9listaNitiE+0x8>
    800019d8:	fd5ff06f          	j	800019ac <_ZN9Scheduler4uzmiEv+0x30>
    return nullptr;
    800019dc:	00050493          	mv	s1,a0
   return listaNiti.izbaciPrvi();
    800019e0:	fd9ff06f          	j	800019b8 <_ZN9Scheduler4uzmiEv+0x3c>

00000000800019e4 <_GLOBAL__sub_I__ZN9Scheduler9listaNitiE>:
    800019e4:	ff010113          	addi	sp,sp,-16
    800019e8:	00113423          	sd	ra,8(sp)
    800019ec:	00813023          	sd	s0,0(sp)
    800019f0:	01010413          	addi	s0,sp,16
    800019f4:	000105b7          	lui	a1,0x10
    800019f8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800019fc:	00100513          	li	a0,1
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	ed0080e7          	jalr	-304(ra) # 800018d0 <_Z41__static_initialization_and_destruction_0ii>
    80001a08:	00813083          	ld	ra,8(sp)
    80001a0c:	00013403          	ld	s0,0(sp)
    80001a10:	01010113          	addi	sp,sp,16
    80001a14:	00008067          	ret

0000000080001a18 <_Z11wrapperMainPv>:
#include "../h/Riscv.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
    80001a18:	ff010113          	addi	sp,sp,-16
    80001a1c:	00113423          	sd	ra,8(sp)
    80001a20:	00813023          	sd	s0,0(sp)
    80001a24:	01010413          	addi	s0,sp,16
  userMain();
    80001a28:	00002097          	auipc	ra,0x2
    80001a2c:	89c080e7          	jalr	-1892(ra) # 800032c4 <_Z8userMainv>
}
    80001a30:	00813083          	ld	ra,8(sp)
    80001a34:	00013403          	ld	s0,0(sp)
    80001a38:	01010113          	addi	sp,sp,16
    80001a3c:	00008067          	ret

0000000080001a40 <main>:


int main() {
    80001a40:	fc010113          	addi	sp,sp,-64
    80001a44:	02113c23          	sd	ra,56(sp)
    80001a48:	02813823          	sd	s0,48(sp)
    80001a4c:	04010413          	addi	s0,sp,64

 static int mem_free (void *memorija);
 static void* mem_alloc(size_t velicina);
 static void inicijalizacija()
 {
  slobodnaMemorija = (Parce*) HEAP_START_ADDR;
    80001a50:	00006797          	auipc	a5,0x6
    80001a54:	a687b783          	ld	a5,-1432(a5) # 800074b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001a58:	0007b783          	ld	a5,0(a5)
    80001a5c:	00006717          	auipc	a4,0x6
    80001a60:	a7473703          	ld	a4,-1420(a4) # 800074d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001a64:	00f73023          	sd	a5,0(a4)
  slobodnaMemorija->sledeci = nullptr;
    80001a68:	0007b823          	sd	zero,16(a5)
  slobodnaMemorija->prethodni = nullptr;
    80001a6c:	0007b423          	sd	zero,8(a5)
  slobodnaMemorija->velicina = ((uint64) HEAP_START_ADDR - (uint64) HEAP_END_ADDR)/MEM_BLOCK_SIZE;
    80001a70:	00006717          	auipc	a4,0x6
    80001a74:	a7073703          	ld	a4,-1424(a4) # 800074e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001a78:	00073703          	ld	a4,0(a4)
    80001a7c:	40e78733          	sub	a4,a5,a4
    80001a80:	00675713          	srli	a4,a4,0x6
    80001a84:	00e7b023          	sd	a4,0(a5)
TCB *threads[5];

 MemoryAllocator::inicijalizacija();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
    80001a88:	00006797          	auipc	a5,0x6
    80001a8c:	a387b783          	ld	a5,-1480(a5) # 800074c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001a90:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a94:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001a98:	00200793          	li	a5,2
    80001a9c:	1007a073          	csrs	sstatus,a5
 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

 thread_create(&threads[0], nullptr, nullptr);
    80001aa0:	00000613          	li	a2,0
    80001aa4:	00000593          	li	a1,0
    80001aa8:	fc840513          	addi	a0,s0,-56
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	b8c080e7          	jalr	-1140(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
 TCB::trenutnaNit = threads[0];
    80001ab4:	fc843703          	ld	a4,-56(s0)
    80001ab8:	00006797          	auipc	a5,0x6
    80001abc:	a207b783          	ld	a5,-1504(a5) # 800074d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ac0:	00e7b023          	sd	a4,0(a5)


 thread_create(&threads[1], &wrapperMain, nullptr);
    80001ac4:	00000613          	li	a2,0
    80001ac8:	00000597          	auipc	a1,0x0
    80001acc:	f5058593          	addi	a1,a1,-176 # 80001a18 <_Z11wrapperMainPv>
    80001ad0:	fd040513          	addi	a0,s0,-48
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	b64080e7          	jalr	-1180(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>


 while( !threads[1]->daLiJeZavrsena())
    80001adc:	fd043783          	ld	a5,-48(s0)

   static TCB* trenutnaNit;

   bool daLiJeZavrsena() const
   {
      return zavrsena;
    80001ae0:	0287c783          	lbu	a5,40(a5)
    80001ae4:	00079863          	bnez	a5,80001af4 <main+0xb4>
{
  thread_dispatch();
    80001ae8:	00000097          	auipc	ra,0x0
    80001aec:	c70080e7          	jalr	-912(ra) # 80001758 <_Z15thread_dispatchv>
    80001af0:	fedff06f          	j	80001adc <main+0x9c>
}

 return 0;

    80001af4:	00000513          	li	a0,0
    80001af8:	03813083          	ld	ra,56(sp)
    80001afc:	03013403          	ld	s0,48(sp)
    80001b00:	04010113          	addi	sp,sp,64
    80001b04:	00008067          	ret

0000000080001b08 <_ZN6ThreadD1Ev>:
Thread::Thread(void (*telo)(void*), void* argumenti)
{
  thread_create(&myHandle, telo, argumenti);
}

Thread::~Thread()
    80001b08:	fe010113          	addi	sp,sp,-32
    80001b0c:	00113c23          	sd	ra,24(sp)
    80001b10:	00813823          	sd	s0,16(sp)
    80001b14:	00913423          	sd	s1,8(sp)
    80001b18:	02010413          	addi	s0,sp,32
    80001b1c:	00006797          	auipc	a5,0x6
    80001b20:	8c478793          	addi	a5,a5,-1852 # 800073e0 <_ZTV6Thread+0x10>
    80001b24:	00f53023          	sd	a5,0(a0)
{
 delete myHandle;
    80001b28:	00853483          	ld	s1,8(a0)
    80001b2c:	02048063          	beqz	s1,80001b4c <_ZN6ThreadD1Ev+0x44>
     return this->blokirana;
   }

   ~TCB()
   {
     delete stek;
    80001b30:	0084b503          	ld	a0,8(s1)
    80001b34:	00050663          	beqz	a0,80001b40 <_ZN6ThreadD1Ev+0x38>
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	d48080e7          	jalr	-696(ra) # 80001880 <_ZdlPv>
    80001b40:	00048513          	mv	a0,s1
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	d3c080e7          	jalr	-708(ra) # 80001880 <_ZdlPv>
}
    80001b4c:	01813083          	ld	ra,24(sp)
    80001b50:	01013403          	ld	s0,16(sp)
    80001b54:	00813483          	ld	s1,8(sp)
    80001b58:	02010113          	addi	sp,sp,32
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80001b60:	fe010113          	addi	sp,sp,-32
    80001b64:	00113c23          	sd	ra,24(sp)
    80001b68:	00813823          	sd	s0,16(sp)
    80001b6c:	00913423          	sd	s1,8(sp)
    80001b70:	02010413          	addi	s0,sp,32
    80001b74:	00050493          	mv	s1,a0
}
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	f90080e7          	jalr	-112(ra) # 80001b08 <_ZN6ThreadD1Ev>
    80001b80:	00048513          	mv	a0,s1
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	cfc080e7          	jalr	-772(ra) # 80001880 <_ZdlPv>
    80001b8c:	01813083          	ld	ra,24(sp)
    80001b90:	01013403          	ld	s0,16(sp)
    80001b94:	00813483          	ld	s1,8(sp)
    80001b98:	02010113          	addi	sp,sp,32
    80001b9c:	00008067          	ret

0000000080001ba0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*telo)(void*), void* argumenti)
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00113423          	sd	ra,8(sp)
    80001ba8:	00813023          	sd	s0,0(sp)
    80001bac:	01010413          	addi	s0,sp,16
    80001bb0:	00006797          	auipc	a5,0x6
    80001bb4:	83078793          	addi	a5,a5,-2000 # 800073e0 <_ZTV6Thread+0x10>
    80001bb8:	00f53023          	sd	a5,0(a0)
  thread_create(&myHandle, telo, argumenti);
    80001bbc:	00850513          	addi	a0,a0,8
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	a78080e7          	jalr	-1416(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001bc8:	00813083          	ld	ra,8(sp)
    80001bcc:	00013403          	ld	s0,0(sp)
    80001bd0:	01010113          	addi	sp,sp,16
    80001bd4:	00008067          	ret

0000000080001bd8 <_ZN6Thread5startEv>:

int Thread::start()
{
    80001bd8:	ff010113          	addi	sp,sp,-16
    80001bdc:	00113423          	sd	ra,8(sp)
    80001be0:	00813023          	sd	s0,0(sp)
    80001be4:	01010413          	addi	s0,sp,16
  thread_start(this->myHandle);
    80001be8:	00853503          	ld	a0,8(a0)
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	b8c080e7          	jalr	-1140(ra) # 80001778 <_Z12thread_startP3TCB>
  return 0;
}
    80001bf4:	00000513          	li	a0,0
    80001bf8:	00813083          	ld	ra,8(sp)
    80001bfc:	00013403          	ld	s0,0(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret

0000000080001c08 <_ZN6Thread8dispatchEv>:

void Thread::dispatch()
{
    80001c08:	ff010113          	addi	sp,sp,-16
    80001c0c:	00113423          	sd	ra,8(sp)
    80001c10:	00813023          	sd	s0,0(sp)
    80001c14:	01010413          	addi	s0,sp,16
  thread_dispatch();
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	b40080e7          	jalr	-1216(ra) # 80001758 <_Z15thread_dispatchv>
}
    80001c20:	00813083          	ld	ra,8(sp)
    80001c24:	00013403          	ld	s0,0(sp)
    80001c28:	01010113          	addi	sp,sp,16
    80001c2c:	00008067          	ret

0000000080001c30 <_ZN6Thread5sleepEm>:

int Thread::sleep(time_t t)
{
    80001c30:	ff010113          	addi	sp,sp,-16
    80001c34:	00813423          	sd	s0,8(sp)
    80001c38:	01010413          	addi	s0,sp,16
  return 0;
}
    80001c3c:	00000513          	li	a0,0
    80001c40:	00813403          	ld	s0,8(sp)
    80001c44:	01010113          	addi	sp,sp,16
    80001c48:	00008067          	ret

0000000080001c4c <_ZN6ThreadC1Ev>:

Thread::Thread()
    80001c4c:	ff010113          	addi	sp,sp,-16
    80001c50:	00113423          	sd	ra,8(sp)
    80001c54:	00813023          	sd	s0,0(sp)
    80001c58:	01010413          	addi	s0,sp,16
    80001c5c:	00005797          	auipc	a5,0x5
    80001c60:	78478793          	addi	a5,a5,1924 # 800073e0 <_ZTV6Thread+0x10>
    80001c64:	00f53023          	sd	a5,0(a0)
{
  thread_no_start(&myHandle, &runWrapper, this);
    80001c68:	00050613          	mv	a2,a0
    80001c6c:	00000597          	auipc	a1,0x0
    80001c70:	02458593          	addi	a1,a1,36 # 80001c90 <_ZN6Thread10runWrapperEPv>
    80001c74:	00850513          	addi	a0,a0,8
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	a3c080e7          	jalr	-1476(ra) # 800016b4 <_Z15thread_no_startPP3TCBPFvPvES2_>
    80001c80:	00813083          	ld	ra,8(sp)
    80001c84:	00013403          	ld	s0,0(sp)
    80001c88:	01010113          	addi	sp,sp,16
    80001c8c:	00008067          	ret

0000000080001c90 <_ZN6Thread10runWrapperEPv>:
int start();
static void dispatch();
static int sleep (time_t);
static void runWrapper(void* thread)
{
  if(thread != nullptr)
    80001c90:	02050863          	beqz	a0,80001cc0 <_ZN6Thread10runWrapperEPv+0x30>
static void runWrapper(void* thread)
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00113423          	sd	ra,8(sp)
    80001c9c:	00813023          	sd	s0,0(sp)
    80001ca0:	01010413          	addi	s0,sp,16
   ((Thread*) thread)->run();
    80001ca4:	00053783          	ld	a5,0(a0)
    80001ca8:	0107b783          	ld	a5,16(a5)
    80001cac:	000780e7          	jalr	a5
}
    80001cb0:	00813083          	ld	ra,8(sp)
    80001cb4:	00013403          	ld	s0,0(sp)
    80001cb8:	01010113          	addi	sp,sp,16
    80001cbc:	00008067          	ret
    80001cc0:	00008067          	ret

0000000080001cc4 <_ZN6Thread3runEv>:

protected:
 Thread();
 virtual void run() {};
    80001cc4:	ff010113          	addi	sp,sp,-16
    80001cc8:	00813423          	sd	s0,8(sp)
    80001ccc:	01010413          	addi	s0,sp,16
    80001cd0:	00813403          	ld	s0,8(sp)
    80001cd4:	01010113          	addi	sp,sp,16
    80001cd8:	00008067          	ret

0000000080001cdc <_ZN3TCBC1EPFvPvES0_S0_>:
#include "../h/syscall_c.h"


TCB* TCB::trenutnaNit = nullptr;

TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80001cdc:	fd010113          	addi	sp,sp,-48
    80001ce0:	02113423          	sd	ra,40(sp)
    80001ce4:	02813023          	sd	s0,32(sp)
    80001ce8:	00913c23          	sd	s1,24(sp)
    80001cec:	01213823          	sd	s2,16(sp)
    80001cf0:	01313423          	sd	s3,8(sp)
    80001cf4:	03010413          	addi	s0,sp,48
    80001cf8:	00050493          	mv	s1,a0
    80001cfc:	00058913          	mv	s2,a1
    80001d00:	00060993          	mv	s3,a2
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80001d04:	00b53023          	sd	a1,0(a0)
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80001d08:	04058c63          	beqz	a1,80001d60 <_ZN3TCBC1EPFvPvES0_S0_+0x84>
    80001d0c:	00008537          	lui	a0,0x8
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	b48080e7          	jalr	-1208(ra) # 80001858 <_Znam>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80001d18:	00a4b423          	sd	a0,8(s1)
    80001d1c:	00000797          	auipc	a5,0x0
    80001d20:	12078793          	addi	a5,a5,288 # 80001e3c <_ZN3TCB7wrapperEv>
    80001d24:	00f4b823          	sd	a5,16(s1)
    80001d28:	04090063          	beqz	s2,80001d68 <_ZN3TCBC1EPFvPvES0_S0_+0x8c>
    80001d2c:	000087b7          	lui	a5,0x8
    80001d30:	00f50533          	add	a0,a0,a5
    80001d34:	00a4bc23          	sd	a0,24(s1)
    80001d38:	0334b023          	sd	s3,32(s1)
    80001d3c:	02048423          	sb	zero,40(s1)
    80001d40:	020484a3          	sb	zero,41(s1)
    80001d44:	02813083          	ld	ra,40(sp)
    80001d48:	02013403          	ld	s0,32(sp)
    80001d4c:	01813483          	ld	s1,24(sp)
    80001d50:	01013903          	ld	s2,16(sp)
    80001d54:	00813983          	ld	s3,8(sp)
    80001d58:	03010113          	addi	sp,sp,48
    80001d5c:	00008067          	ret
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80001d60:	00000513          	li	a0,0
    80001d64:	fb5ff06f          	j	80001d18 <_ZN3TCBC1EPFvPvES0_S0_+0x3c>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80001d68:	00000513          	li	a0,0
    80001d6c:	fc9ff06f          	j	80001d34 <_ZN3TCBC1EPFvPvES0_S0_+0x58>

0000000080001d70 <_ZN3TCB8dispatchEv>:
  trenutnaNit->postaviStatus(true);
  thread_dispatch();
}

void TCB::dispatch()
{
    80001d70:	fe010113          	addi	sp,sp,-32
    80001d74:	00113c23          	sd	ra,24(sp)
    80001d78:	00813823          	sd	s0,16(sp)
    80001d7c:	00913423          	sd	s1,8(sp)
    80001d80:	02010413          	addi	s0,sp,32
  TCB* staraNit = trenutnaNit;
    80001d84:	00005497          	auipc	s1,0x5
    80001d88:	7bc4b483          	ld	s1,1980(s1) # 80007540 <_ZN3TCB11trenutnaNitE>
      return zavrsena;
    80001d8c:	0284c783          	lbu	a5,40(s1)
  if(!staraNit->daLiJeZavrsena() && !staraNit->daLiJeBlokirana())
    80001d90:	00079663          	bnez	a5,80001d9c <_ZN3TCB8dispatchEv+0x2c>
     return this->blokirana;
    80001d94:	0294c783          	lbu	a5,41(s1)
    80001d98:	02078e63          	beqz	a5,80001dd4 <_ZN3TCB8dispatchEv+0x64>
  {
    Scheduler::stavi(staraNit);
  }

  trenutnaNit = Scheduler::uzmi();
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	be0080e7          	jalr	-1056(ra) # 8000197c <_ZN9Scheduler4uzmiEv>
    80001da4:	00005797          	auipc	a5,0x5
    80001da8:	78a7be23          	sd	a0,1948(a5) # 80007540 <_ZN3TCB11trenutnaNitE>

  if(staraNit != trenutnaNit)
    80001dac:	00a48a63          	beq	s1,a0,80001dc0 <_ZN3TCB8dispatchEv+0x50>
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
    80001db0:	01050593          	addi	a1,a0,16 # 8010 <_entry-0x7fff7ff0>
    80001db4:	01048513          	addi	a0,s1,16
    80001db8:	fffff097          	auipc	ra,0xfffff
    80001dbc:	248080e7          	jalr	584(ra) # 80001000 <_ZN3TCB5yieldEPNS_7ContextES1_>
  }
}
    80001dc0:	01813083          	ld	ra,24(sp)
    80001dc4:	01013403          	ld	s0,16(sp)
    80001dc8:	00813483          	ld	s1,8(sp)
    80001dcc:	02010113          	addi	sp,sp,32
    80001dd0:	00008067          	ret
    Scheduler::stavi(staraNit);
    80001dd4:	00048513          	mv	a0,s1
    80001dd8:	00000097          	auipc	ra,0x0
    80001ddc:	b38080e7          	jalr	-1224(ra) # 80001910 <_ZN9Scheduler5staviEP3TCB>
    80001de0:	fbdff06f          	j	80001d9c <_ZN3TCB8dispatchEv+0x2c>

0000000080001de4 <_ZN3TCB4exitEv>:

void TCB::exit()
{
    80001de4:	ff010113          	addi	sp,sp,-16
    80001de8:	00113423          	sd	ra,8(sp)
    80001dec:	00813023          	sd	s0,0(sp)
    80001df0:	01010413          	addi	s0,sp,16
     this->zavrsena = status;
    80001df4:	00005797          	auipc	a5,0x5
    80001df8:	74c7b783          	ld	a5,1868(a5) # 80007540 <_ZN3TCB11trenutnaNitE>
    80001dfc:	00100713          	li	a4,1
    80001e00:	02e78423          	sb	a4,40(a5)
  trenutnaNit->postaviStatus(true);
  dispatch();
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	f6c080e7          	jalr	-148(ra) # 80001d70 <_ZN3TCB8dispatchEv>
}
    80001e0c:	00813083          	ld	ra,8(sp)
    80001e10:	00013403          	ld	s0,0(sp)
    80001e14:	01010113          	addi	sp,sp,16
    80001e18:	00008067          	ret

0000000080001e1c <_ZN3TCB10popSppSpieEv>:

void TCB::popSppSpie()
{
    80001e1c:	ff010113          	addi	sp,sp,-16
    80001e20:	00813423          	sd	s0,8(sp)
    80001e24:	01010413          	addi	s0,sp,16
  __asm__ volatile ("csrw sepc, ra");
    80001e28:	14109073          	csrw	sepc,ra
  __asm__ volatile("sret");
    80001e2c:	10200073          	sret
    80001e30:	00813403          	ld	s0,8(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	00008067          	ret

0000000080001e3c <_ZN3TCB7wrapperEv>:
{
    80001e3c:	fe010113          	addi	sp,sp,-32
    80001e40:	00113c23          	sd	ra,24(sp)
    80001e44:	00813823          	sd	s0,16(sp)
    80001e48:	00913423          	sd	s1,8(sp)
    80001e4c:	02010413          	addi	s0,sp,32
  popSppSpie();
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	fcc080e7          	jalr	-52(ra) # 80001e1c <_ZN3TCB10popSppSpieEv>
  trenutnaNit->telo((void*) trenutnaNit->argumenti);
    80001e58:	00005497          	auipc	s1,0x5
    80001e5c:	6e848493          	addi	s1,s1,1768 # 80007540 <_ZN3TCB11trenutnaNitE>
    80001e60:	0004b783          	ld	a5,0(s1)
    80001e64:	0007b703          	ld	a4,0(a5)
    80001e68:	0207b503          	ld	a0,32(a5)
    80001e6c:	000700e7          	jalr	a4
  trenutnaNit->postaviStatus(true);
    80001e70:	0004b783          	ld	a5,0(s1)
    80001e74:	00100713          	li	a4,1
    80001e78:	02e78423          	sb	a4,40(a5)
  thread_dispatch();
    80001e7c:	00000097          	auipc	ra,0x0
    80001e80:	8dc080e7          	jalr	-1828(ra) # 80001758 <_Z15thread_dispatchv>
}
    80001e84:	01813083          	ld	ra,24(sp)
    80001e88:	01013403          	ld	s0,16(sp)
    80001e8c:	00813483          	ld	s1,8(sp)
    80001e90:	02010113          	addi	sp,sp,32
    80001e94:	00008067          	ret

0000000080001e98 <_ZN15MemoryAllocator9mem_allocEm>:

}


void* MemoryAllocator::mem_alloc(size_t velicina)
{
    80001e98:	ff010113          	addi	sp,sp,-16
    80001e9c:	00813423          	sd	s0,8(sp)
    80001ea0:	01010413          	addi	s0,sp,16
    80001ea4:	00050713          	mv	a4,a0
  if (velicina < 0 ) return nullptr;

   Parce *trenutni = MemoryAllocator::slobodnaMemorija, *prethodni = nullptr;
    80001ea8:	00005517          	auipc	a0,0x5
    80001eac:	6a053503          	ld	a0,1696(a0) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
    80001eb0:	00000693          	li	a3,0

   for(; trenutni != nullptr && velicina > trenutni->velicina; prethodni = trenutni, trenutni = trenutni->sledeci);
    80001eb4:	00050c63          	beqz	a0,80001ecc <_ZN15MemoryAllocator9mem_allocEm+0x34>
    80001eb8:	00053783          	ld	a5,0(a0)
    80001ebc:	00e7f863          	bgeu	a5,a4,80001ecc <_ZN15MemoryAllocator9mem_allocEm+0x34>
    80001ec0:	00050693          	mv	a3,a0
    80001ec4:	01053503          	ld	a0,16(a0)
    80001ec8:	fedff06f          	j	80001eb4 <_ZN15MemoryAllocator9mem_allocEm+0x1c>

   if(trenutni == nullptr)
    80001ecc:	02050e63          	beqz	a0,80001f08 <_ZN15MemoryAllocator9mem_allocEm+0x70>
   return nullptr;

   if(velicina < trenutni->velicina)
    80001ed0:	00053783          	ld	a5,0(a0)
    80001ed4:	04f77663          	bgeu	a4,a5,80001f20 <_ZN15MemoryAllocator9mem_allocEm+0x88>
{
   size_t novoParce = (size_t) trenutni + velicina*MEM_BLOCK_SIZE;
    80001ed8:	00671613          	slli	a2,a4,0x6
    80001edc:	00a60633          	add	a2,a2,a0
   Parce *novi = (Parce*) novoParce;
   novi->velicina = trenutni->velicina - velicina;
    80001ee0:	40e787b3          	sub	a5,a5,a4
    80001ee4:	00f63023          	sd	a5,0(a2)
   novi->sledeci = trenutni->sledeci;
    80001ee8:	01053783          	ld	a5,16(a0)
    80001eec:	00f63823          	sd	a5,16(a2)
   novi->prethodni = trenutni->prethodni;
    80001ef0:	00853783          	ld	a5,8(a0)
    80001ef4:	00f63423          	sd	a5,8(a2)
   if (prethodni)
    80001ef8:	00068e63          	beqz	a3,80001f14 <_ZN15MemoryAllocator9mem_allocEm+0x7c>
    prethodni->sledeci = novi;
    80001efc:	00c6b823          	sd	a2,16(a3)
   if(prethodni)
   prethodni->sledeci = trenutni->sledeci;
   else
   MemoryAllocator::slobodnaMemorija = trenutni->sledeci;
}
  trenutni->velicina = velicina;
    80001f00:	00e53023          	sd	a4,0(a0)
  Parce *povratni = trenutni + 1;
    80001f04:	01850513          	addi	a0,a0,24
  return povratni;

}
    80001f08:	00813403          	ld	s0,8(sp)
    80001f0c:	01010113          	addi	sp,sp,16
    80001f10:	00008067          	ret
    MemoryAllocator::slobodnaMemorija = novi;
    80001f14:	00005797          	auipc	a5,0x5
    80001f18:	62c7ba23          	sd	a2,1588(a5) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
    80001f1c:	fe5ff06f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x68>
   if(prethodni)
    80001f20:	00068863          	beqz	a3,80001f30 <_ZN15MemoryAllocator9mem_allocEm+0x98>
   prethodni->sledeci = trenutni->sledeci;
    80001f24:	01053783          	ld	a5,16(a0)
    80001f28:	00f6b823          	sd	a5,16(a3)
    80001f2c:	fd5ff06f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x68>
   MemoryAllocator::slobodnaMemorija = trenutni->sledeci;
    80001f30:	01053783          	ld	a5,16(a0)
    80001f34:	00005697          	auipc	a3,0x5
    80001f38:	60f6ba23          	sd	a5,1556(a3) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
    80001f3c:	fc5ff06f          	j	80001f00 <_ZN15MemoryAllocator9mem_allocEm+0x68>

0000000080001f40 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_>:

void MemoryAllocator::spoji (Parce *trenutni, Parce *sledeci)
{
    80001f40:	ff010113          	addi	sp,sp,-16
    80001f44:	00813423          	sd	s0,8(sp)
    80001f48:	01010413          	addi	s0,sp,16
   if(trenutni + trenutni->velicina == sledeci)
    80001f4c:	00053703          	ld	a4,0(a0)
    80001f50:	00171793          	slli	a5,a4,0x1
    80001f54:	00e787b3          	add	a5,a5,a4
    80001f58:	00379793          	slli	a5,a5,0x3
    80001f5c:	00f507b3          	add	a5,a0,a5
    80001f60:	00b78863          	beq	a5,a1,80001f70 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_+0x30>
  {
     trenutni->velicina += sledeci->velicina;
     trenutni->sledeci = sledeci->sledeci;
     sledeci->sledeci->prethodni = trenutni;
  }
}
    80001f64:	00813403          	ld	s0,8(sp)
    80001f68:	01010113          	addi	sp,sp,16
    80001f6c:	00008067          	ret
     trenutni->velicina += sledeci->velicina;
    80001f70:	0005b783          	ld	a5,0(a1)
    80001f74:	00f70733          	add	a4,a4,a5
    80001f78:	00e53023          	sd	a4,0(a0)
     trenutni->sledeci = sledeci->sledeci;
    80001f7c:	0105b783          	ld	a5,16(a1)
    80001f80:	00f53823          	sd	a5,16(a0)
     sledeci->sledeci->prethodni = trenutni;
    80001f84:	00a7b423          	sd	a0,8(a5)
}
    80001f88:	fddff06f          	j	80001f64 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_+0x24>

0000000080001f8c <_ZN15MemoryAllocator8mem_freeEPv>:
{
    80001f8c:	fe010113          	addi	sp,sp,-32
    80001f90:	00113c23          	sd	ra,24(sp)
    80001f94:	00813823          	sd	s0,16(sp)
    80001f98:	00913423          	sd	s1,8(sp)
    80001f9c:	01213023          	sd	s2,0(sp)
    80001fa0:	02010413          	addi	s0,sp,32
    80001fa4:	00050913          	mv	s2,a0
    Parce *tmp = (Parce*)memorija - 1;
    80001fa8:	fe850493          	addi	s1,a0,-24
    if(!MemoryAllocator::slobodnaMemorija)
    80001fac:	00005717          	auipc	a4,0x5
    80001fb0:	59c73703          	ld	a4,1436(a4) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
    80001fb4:	00070663          	beqz	a4,80001fc0 <_ZN15MemoryAllocator8mem_freeEPv+0x34>
    Parce *trenutni = MemoryAllocator::slobodnaMemorija;
    80001fb8:	00070513          	mv	a0,a4
    80001fbc:	01c0006f          	j	80001fd8 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
     tmp->sledeci = nullptr;
    80001fc0:	fe053c23          	sd	zero,-8(a0)
     tmp->prethodni = nullptr;
    80001fc4:	fe053823          	sd	zero,-16(a0)
     MemoryAllocator::slobodnaMemorija = tmp;
    80001fc8:	00005797          	auipc	a5,0x5
    80001fcc:	5897b023          	sd	s1,1408(a5) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
     return 0;
    80001fd0:	0340006f          	j	80002004 <_ZN15MemoryAllocator8mem_freeEPv+0x78>
    for(; trenutni < tmp && trenutni->sledeci != nullptr; trenutni = trenutni->sledeci);
    80001fd4:	00078513          	mv	a0,a5
    80001fd8:	00957663          	bgeu	a0,s1,80001fe4 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80001fdc:	01053783          	ld	a5,16(a0)
    80001fe0:	fe079ae3          	bnez	a5,80001fd4 <_ZN15MemoryAllocator8mem_freeEPv+0x48>
    if(trenutni == slobodnaMemorija)
    80001fe4:	02a70e63          	beq	a4,a0,80002020 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
      if(tmp > trenutni)
    80001fe8:	06957063          	bgeu	a0,s1,80002048 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
        trenutni->sledeci = tmp;
    80001fec:	00953823          	sd	s1,16(a0)
        tmp->prethodni = trenutni;
    80001ff0:	fea93823          	sd	a0,-16(s2)
        tmp->sledeci = nullptr;
    80001ff4:	fe093c23          	sd	zero,-8(s2)
        spoji(tmp->prethodni, tmp);
    80001ff8:	00048593          	mv	a1,s1
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	f44080e7          	jalr	-188(ra) # 80001f40 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_>
}
    80002004:	00000513          	li	a0,0
    80002008:	01813083          	ld	ra,24(sp)
    8000200c:	01013403          	ld	s0,16(sp)
    80002010:	00813483          	ld	s1,8(sp)
    80002014:	00013903          	ld	s2,0(sp)
    80002018:	02010113          	addi	sp,sp,32
    8000201c:	00008067          	ret
      trenutni->prethodni = tmp;
    80002020:	00953423          	sd	s1,8(a0)
      tmp->prethodni = nullptr;
    80002024:	fe093823          	sd	zero,-16(s2)
      tmp->sledeci = trenutni;
    80002028:	fea93c23          	sd	a0,-8(s2)
      MemoryAllocator::slobodnaMemorija = tmp;
    8000202c:	00005797          	auipc	a5,0x5
    80002030:	5097be23          	sd	s1,1308(a5) # 80007548 <_ZN15MemoryAllocator16slobodnaMemorijaE>
      spoji(tmp, tmp->sledeci);
    80002034:	ff893583          	ld	a1,-8(s2)
    80002038:	00048513          	mv	a0,s1
    8000203c:	00000097          	auipc	ra,0x0
    80002040:	f04080e7          	jalr	-252(ra) # 80001f40 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_>
      return 0;
    80002044:	fc1ff06f          	j	80002004 <_ZN15MemoryAllocator8mem_freeEPv+0x78>
        tmp->sledeci = trenutni;
    80002048:	fea93c23          	sd	a0,-8(s2)
        tmp->prethodni = trenutni->prethodni;
    8000204c:	00853783          	ld	a5,8(a0)
    80002050:	fef93823          	sd	a5,-16(s2)
        trenutni->prethodni->sledeci = tmp;
    80002054:	0097b823          	sd	s1,16(a5)
        trenutni->prethodni = tmp;
    80002058:	00953423          	sd	s1,8(a0)
        spoji(tmp, tmp->sledeci);
    8000205c:	ff893583          	ld	a1,-8(s2)
    80002060:	00048513          	mv	a0,s1
    80002064:	00000097          	auipc	ra,0x0
    80002068:	edc080e7          	jalr	-292(ra) # 80001f40 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_>
        spoji(tmp->prethodni, tmp);
    8000206c:	00048593          	mv	a1,s1
    80002070:	ff093503          	ld	a0,-16(s2)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	ecc080e7          	jalr	-308(ra) # 80001f40 <_ZN15MemoryAllocator5spojiEPNS_5ParceES1_>
        return 0;
    8000207c:	f89ff06f          	j	80002004 <_ZN15MemoryAllocator8mem_freeEPv+0x78>

0000000080002080 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002080:	fe010113          	addi	sp,sp,-32
    80002084:	00113c23          	sd	ra,24(sp)
    80002088:	00813823          	sd	s0,16(sp)
    8000208c:	00913423          	sd	s1,8(sp)
    80002090:	01213023          	sd	s2,0(sp)
    80002094:	02010413          	addi	s0,sp,32
    80002098:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000209c:	00100793          	li	a5,1
    800020a0:	02a7f863          	bgeu	a5,a0,800020d0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800020a4:	00a00793          	li	a5,10
    800020a8:	02f577b3          	remu	a5,a0,a5
    800020ac:	02078e63          	beqz	a5,800020e8 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800020b0:	fff48513          	addi	a0,s1,-1
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	fcc080e7          	jalr	-52(ra) # 80002080 <_ZL9fibonaccim>
    800020bc:	00050913          	mv	s2,a0
    800020c0:	ffe48513          	addi	a0,s1,-2
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	fbc080e7          	jalr	-68(ra) # 80002080 <_ZL9fibonaccim>
    800020cc:	00a90533          	add	a0,s2,a0
}
    800020d0:	01813083          	ld	ra,24(sp)
    800020d4:	01013403          	ld	s0,16(sp)
    800020d8:	00813483          	ld	s1,8(sp)
    800020dc:	00013903          	ld	s2,0(sp)
    800020e0:	02010113          	addi	sp,sp,32
    800020e4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	670080e7          	jalr	1648(ra) # 80001758 <_Z15thread_dispatchv>
    800020f0:	fc1ff06f          	j	800020b0 <_ZL9fibonaccim+0x30>

00000000800020f4 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800020f4:	fe010113          	addi	sp,sp,-32
    800020f8:	00113c23          	sd	ra,24(sp)
    800020fc:	00813823          	sd	s0,16(sp)
    80002100:	00913423          	sd	s1,8(sp)
    80002104:	01213023          	sd	s2,0(sp)
    80002108:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000210c:	00000913          	li	s2,0
    80002110:	0380006f          	j	80002148 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	644080e7          	jalr	1604(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000211c:	00148493          	addi	s1,s1,1
    80002120:	000027b7          	lui	a5,0x2
    80002124:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002128:	0097ee63          	bltu	a5,s1,80002144 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000212c:	00000713          	li	a4,0
    80002130:	000077b7          	lui	a5,0x7
    80002134:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002138:	fce7eee3          	bltu	a5,a4,80002114 <_ZN7WorkerA11workerBodyAEPv+0x20>
    8000213c:	00170713          	addi	a4,a4,1
    80002140:	ff1ff06f          	j	80002130 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002144:	00190913          	addi	s2,s2,1
    80002148:	00900793          	li	a5,9
    8000214c:	0527e063          	bltu	a5,s2,8000218c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002150:	00004517          	auipc	a0,0x4
    80002154:	fe050513          	addi	a0,a0,-32 # 80006130 <CONSOLE_STATUS+0x120>
    80002158:	00001097          	auipc	ra,0x1
    8000215c:	e9c080e7          	jalr	-356(ra) # 80002ff4 <_Z11printStringPKc>
    80002160:	00000613          	li	a2,0
    80002164:	00a00593          	li	a1,10
    80002168:	0009051b          	sext.w	a0,s2
    8000216c:	00001097          	auipc	ra,0x1
    80002170:	038080e7          	jalr	56(ra) # 800031a4 <_Z8printIntiii>
    80002174:	00004517          	auipc	a0,0x4
    80002178:	36450513          	addi	a0,a0,868 # 800064d8 <CONSOLE_STATUS+0x4c8>
    8000217c:	00001097          	auipc	ra,0x1
    80002180:	e78080e7          	jalr	-392(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002184:	00000493          	li	s1,0
    80002188:	f99ff06f          	j	80002120 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    8000218c:	00004517          	auipc	a0,0x4
    80002190:	fac50513          	addi	a0,a0,-84 # 80006138 <CONSOLE_STATUS+0x128>
    80002194:	00001097          	auipc	ra,0x1
    80002198:	e60080e7          	jalr	-416(ra) # 80002ff4 <_Z11printStringPKc>
    finishedA = true;
    8000219c:	00100793          	li	a5,1
    800021a0:	00005717          	auipc	a4,0x5
    800021a4:	3af70823          	sb	a5,944(a4) # 80007550 <_ZL9finishedA>
}
    800021a8:	01813083          	ld	ra,24(sp)
    800021ac:	01013403          	ld	s0,16(sp)
    800021b0:	00813483          	ld	s1,8(sp)
    800021b4:	00013903          	ld	s2,0(sp)
    800021b8:	02010113          	addi	sp,sp,32
    800021bc:	00008067          	ret

00000000800021c0 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800021c0:	fe010113          	addi	sp,sp,-32
    800021c4:	00113c23          	sd	ra,24(sp)
    800021c8:	00813823          	sd	s0,16(sp)
    800021cc:	00913423          	sd	s1,8(sp)
    800021d0:	01213023          	sd	s2,0(sp)
    800021d4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800021d8:	00000913          	li	s2,0
    800021dc:	0380006f          	j	80002214 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	578080e7          	jalr	1400(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800021e8:	00148493          	addi	s1,s1,1
    800021ec:	000027b7          	lui	a5,0x2
    800021f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800021f4:	0097ee63          	bltu	a5,s1,80002210 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800021f8:	00000713          	li	a4,0
    800021fc:	000077b7          	lui	a5,0x7
    80002200:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002204:	fce7eee3          	bltu	a5,a4,800021e0 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002208:	00170713          	addi	a4,a4,1
    8000220c:	ff1ff06f          	j	800021fc <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002210:	00190913          	addi	s2,s2,1
    80002214:	00f00793          	li	a5,15
    80002218:	0527e063          	bltu	a5,s2,80002258 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000221c:	00004517          	auipc	a0,0x4
    80002220:	f2c50513          	addi	a0,a0,-212 # 80006148 <CONSOLE_STATUS+0x138>
    80002224:	00001097          	auipc	ra,0x1
    80002228:	dd0080e7          	jalr	-560(ra) # 80002ff4 <_Z11printStringPKc>
    8000222c:	00000613          	li	a2,0
    80002230:	00a00593          	li	a1,10
    80002234:	0009051b          	sext.w	a0,s2
    80002238:	00001097          	auipc	ra,0x1
    8000223c:	f6c080e7          	jalr	-148(ra) # 800031a4 <_Z8printIntiii>
    80002240:	00004517          	auipc	a0,0x4
    80002244:	29850513          	addi	a0,a0,664 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	dac080e7          	jalr	-596(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002250:	00000493          	li	s1,0
    80002254:	f99ff06f          	j	800021ec <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80002258:	00004517          	auipc	a0,0x4
    8000225c:	ef850513          	addi	a0,a0,-264 # 80006150 <CONSOLE_STATUS+0x140>
    80002260:	00001097          	auipc	ra,0x1
    80002264:	d94080e7          	jalr	-620(ra) # 80002ff4 <_Z11printStringPKc>
    finishedB = true;
    80002268:	00100793          	li	a5,1
    8000226c:	00005717          	auipc	a4,0x5
    80002270:	2ef702a3          	sb	a5,741(a4) # 80007551 <_ZL9finishedB>
    thread_dispatch();
    80002274:	fffff097          	auipc	ra,0xfffff
    80002278:	4e4080e7          	jalr	1252(ra) # 80001758 <_Z15thread_dispatchv>
}
    8000227c:	01813083          	ld	ra,24(sp)
    80002280:	01013403          	ld	s0,16(sp)
    80002284:	00813483          	ld	s1,8(sp)
    80002288:	00013903          	ld	s2,0(sp)
    8000228c:	02010113          	addi	sp,sp,32
    80002290:	00008067          	ret

0000000080002294 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002294:	fe010113          	addi	sp,sp,-32
    80002298:	00113c23          	sd	ra,24(sp)
    8000229c:	00813823          	sd	s0,16(sp)
    800022a0:	00913423          	sd	s1,8(sp)
    800022a4:	01213023          	sd	s2,0(sp)
    800022a8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800022ac:	00000493          	li	s1,0
    800022b0:	0400006f          	j	800022f0 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800022b4:	00004517          	auipc	a0,0x4
    800022b8:	eac50513          	addi	a0,a0,-340 # 80006160 <CONSOLE_STATUS+0x150>
    800022bc:	00001097          	auipc	ra,0x1
    800022c0:	d38080e7          	jalr	-712(ra) # 80002ff4 <_Z11printStringPKc>
    800022c4:	00000613          	li	a2,0
    800022c8:	00a00593          	li	a1,10
    800022cc:	00048513          	mv	a0,s1
    800022d0:	00001097          	auipc	ra,0x1
    800022d4:	ed4080e7          	jalr	-300(ra) # 800031a4 <_Z8printIntiii>
    800022d8:	00004517          	auipc	a0,0x4
    800022dc:	20050513          	addi	a0,a0,512 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800022e0:	00001097          	auipc	ra,0x1
    800022e4:	d14080e7          	jalr	-748(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800022e8:	0014849b          	addiw	s1,s1,1
    800022ec:	0ff4f493          	andi	s1,s1,255
    800022f0:	00200793          	li	a5,2
    800022f4:	fc97f0e3          	bgeu	a5,s1,800022b4 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800022f8:	00004517          	auipc	a0,0x4
    800022fc:	e7050513          	addi	a0,a0,-400 # 80006168 <CONSOLE_STATUS+0x158>
    80002300:	00001097          	auipc	ra,0x1
    80002304:	cf4080e7          	jalr	-780(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002308:	00700313          	li	t1,7
    thread_dispatch();
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	44c080e7          	jalr	1100(ra) # 80001758 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002314:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002318:	00004517          	auipc	a0,0x4
    8000231c:	e6050513          	addi	a0,a0,-416 # 80006178 <CONSOLE_STATUS+0x168>
    80002320:	00001097          	auipc	ra,0x1
    80002324:	cd4080e7          	jalr	-812(ra) # 80002ff4 <_Z11printStringPKc>
    80002328:	00000613          	li	a2,0
    8000232c:	00a00593          	li	a1,10
    80002330:	0009051b          	sext.w	a0,s2
    80002334:	00001097          	auipc	ra,0x1
    80002338:	e70080e7          	jalr	-400(ra) # 800031a4 <_Z8printIntiii>
    8000233c:	00004517          	auipc	a0,0x4
    80002340:	19c50513          	addi	a0,a0,412 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002344:	00001097          	auipc	ra,0x1
    80002348:	cb0080e7          	jalr	-848(ra) # 80002ff4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    8000234c:	00c00513          	li	a0,12
    80002350:	00000097          	auipc	ra,0x0
    80002354:	d30080e7          	jalr	-720(ra) # 80002080 <_ZL9fibonaccim>
    80002358:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000235c:	00004517          	auipc	a0,0x4
    80002360:	e2450513          	addi	a0,a0,-476 # 80006180 <CONSOLE_STATUS+0x170>
    80002364:	00001097          	auipc	ra,0x1
    80002368:	c90080e7          	jalr	-880(ra) # 80002ff4 <_Z11printStringPKc>
    8000236c:	00000613          	li	a2,0
    80002370:	00a00593          	li	a1,10
    80002374:	0009051b          	sext.w	a0,s2
    80002378:	00001097          	auipc	ra,0x1
    8000237c:	e2c080e7          	jalr	-468(ra) # 800031a4 <_Z8printIntiii>
    80002380:	00004517          	auipc	a0,0x4
    80002384:	15850513          	addi	a0,a0,344 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002388:	00001097          	auipc	ra,0x1
    8000238c:	c6c080e7          	jalr	-916(ra) # 80002ff4 <_Z11printStringPKc>
    80002390:	0400006f          	j	800023d0 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002394:	00004517          	auipc	a0,0x4
    80002398:	dcc50513          	addi	a0,a0,-564 # 80006160 <CONSOLE_STATUS+0x150>
    8000239c:	00001097          	auipc	ra,0x1
    800023a0:	c58080e7          	jalr	-936(ra) # 80002ff4 <_Z11printStringPKc>
    800023a4:	00000613          	li	a2,0
    800023a8:	00a00593          	li	a1,10
    800023ac:	00048513          	mv	a0,s1
    800023b0:	00001097          	auipc	ra,0x1
    800023b4:	df4080e7          	jalr	-524(ra) # 800031a4 <_Z8printIntiii>
    800023b8:	00004517          	auipc	a0,0x4
    800023bc:	12050513          	addi	a0,a0,288 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800023c0:	00001097          	auipc	ra,0x1
    800023c4:	c34080e7          	jalr	-972(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800023c8:	0014849b          	addiw	s1,s1,1
    800023cc:	0ff4f493          	andi	s1,s1,255
    800023d0:	00500793          	li	a5,5
    800023d4:	fc97f0e3          	bgeu	a5,s1,80002394 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800023d8:	00004517          	auipc	a0,0x4
    800023dc:	d6050513          	addi	a0,a0,-672 # 80006138 <CONSOLE_STATUS+0x128>
    800023e0:	00001097          	auipc	ra,0x1
    800023e4:	c14080e7          	jalr	-1004(ra) # 80002ff4 <_Z11printStringPKc>
    finishedC = true;
    800023e8:	00100793          	li	a5,1
    800023ec:	00005717          	auipc	a4,0x5
    800023f0:	16f70323          	sb	a5,358(a4) # 80007552 <_ZL9finishedC>
    thread_dispatch();
    800023f4:	fffff097          	auipc	ra,0xfffff
    800023f8:	364080e7          	jalr	868(ra) # 80001758 <_Z15thread_dispatchv>
}
    800023fc:	01813083          	ld	ra,24(sp)
    80002400:	01013403          	ld	s0,16(sp)
    80002404:	00813483          	ld	s1,8(sp)
    80002408:	00013903          	ld	s2,0(sp)
    8000240c:	02010113          	addi	sp,sp,32
    80002410:	00008067          	ret

0000000080002414 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002414:	fe010113          	addi	sp,sp,-32
    80002418:	00113c23          	sd	ra,24(sp)
    8000241c:	00813823          	sd	s0,16(sp)
    80002420:	00913423          	sd	s1,8(sp)
    80002424:	01213023          	sd	s2,0(sp)
    80002428:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000242c:	00a00493          	li	s1,10
    80002430:	0400006f          	j	80002470 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002434:	00004517          	auipc	a0,0x4
    80002438:	d5c50513          	addi	a0,a0,-676 # 80006190 <CONSOLE_STATUS+0x180>
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	bb8080e7          	jalr	-1096(ra) # 80002ff4 <_Z11printStringPKc>
    80002444:	00000613          	li	a2,0
    80002448:	00a00593          	li	a1,10
    8000244c:	00048513          	mv	a0,s1
    80002450:	00001097          	auipc	ra,0x1
    80002454:	d54080e7          	jalr	-684(ra) # 800031a4 <_Z8printIntiii>
    80002458:	00004517          	auipc	a0,0x4
    8000245c:	08050513          	addi	a0,a0,128 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002460:	00001097          	auipc	ra,0x1
    80002464:	b94080e7          	jalr	-1132(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002468:	0014849b          	addiw	s1,s1,1
    8000246c:	0ff4f493          	andi	s1,s1,255
    80002470:	00c00793          	li	a5,12
    80002474:	fc97f0e3          	bgeu	a5,s1,80002434 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80002478:	00004517          	auipc	a0,0x4
    8000247c:	d2050513          	addi	a0,a0,-736 # 80006198 <CONSOLE_STATUS+0x188>
    80002480:	00001097          	auipc	ra,0x1
    80002484:	b74080e7          	jalr	-1164(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002488:	00500313          	li	t1,5
    thread_dispatch();
    8000248c:	fffff097          	auipc	ra,0xfffff
    80002490:	2cc080e7          	jalr	716(ra) # 80001758 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002494:	01000513          	li	a0,16
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	be8080e7          	jalr	-1048(ra) # 80002080 <_ZL9fibonaccim>
    800024a0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800024a4:	00004517          	auipc	a0,0x4
    800024a8:	d0450513          	addi	a0,a0,-764 # 800061a8 <CONSOLE_STATUS+0x198>
    800024ac:	00001097          	auipc	ra,0x1
    800024b0:	b48080e7          	jalr	-1208(ra) # 80002ff4 <_Z11printStringPKc>
    800024b4:	00000613          	li	a2,0
    800024b8:	00a00593          	li	a1,10
    800024bc:	0009051b          	sext.w	a0,s2
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	ce4080e7          	jalr	-796(ra) # 800031a4 <_Z8printIntiii>
    800024c8:	00004517          	auipc	a0,0x4
    800024cc:	01050513          	addi	a0,a0,16 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800024d0:	00001097          	auipc	ra,0x1
    800024d4:	b24080e7          	jalr	-1244(ra) # 80002ff4 <_Z11printStringPKc>
    800024d8:	0400006f          	j	80002518 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800024dc:	00004517          	auipc	a0,0x4
    800024e0:	cb450513          	addi	a0,a0,-844 # 80006190 <CONSOLE_STATUS+0x180>
    800024e4:	00001097          	auipc	ra,0x1
    800024e8:	b10080e7          	jalr	-1264(ra) # 80002ff4 <_Z11printStringPKc>
    800024ec:	00000613          	li	a2,0
    800024f0:	00a00593          	li	a1,10
    800024f4:	00048513          	mv	a0,s1
    800024f8:	00001097          	auipc	ra,0x1
    800024fc:	cac080e7          	jalr	-852(ra) # 800031a4 <_Z8printIntiii>
    80002500:	00004517          	auipc	a0,0x4
    80002504:	fd850513          	addi	a0,a0,-40 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002508:	00001097          	auipc	ra,0x1
    8000250c:	aec080e7          	jalr	-1300(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002510:	0014849b          	addiw	s1,s1,1
    80002514:	0ff4f493          	andi	s1,s1,255
    80002518:	00f00793          	li	a5,15
    8000251c:	fc97f0e3          	bgeu	a5,s1,800024dc <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002520:	00004517          	auipc	a0,0x4
    80002524:	c9850513          	addi	a0,a0,-872 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80002528:	00001097          	auipc	ra,0x1
    8000252c:	acc080e7          	jalr	-1332(ra) # 80002ff4 <_Z11printStringPKc>
    finishedD = true;
    80002530:	00100793          	li	a5,1
    80002534:	00005717          	auipc	a4,0x5
    80002538:	00f70fa3          	sb	a5,31(a4) # 80007553 <_ZL9finishedD>
    thread_dispatch();
    8000253c:	fffff097          	auipc	ra,0xfffff
    80002540:	21c080e7          	jalr	540(ra) # 80001758 <_Z15thread_dispatchv>
}
    80002544:	01813083          	ld	ra,24(sp)
    80002548:	01013403          	ld	s0,16(sp)
    8000254c:	00813483          	ld	s1,8(sp)
    80002550:	00013903          	ld	s2,0(sp)
    80002554:	02010113          	addi	sp,sp,32
    80002558:	00008067          	ret

000000008000255c <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    8000255c:	fc010113          	addi	sp,sp,-64
    80002560:	02113c23          	sd	ra,56(sp)
    80002564:	02813823          	sd	s0,48(sp)
    80002568:	02913423          	sd	s1,40(sp)
    8000256c:	03213023          	sd	s2,32(sp)
    80002570:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80002574:	02000513          	li	a0,32
    80002578:	fffff097          	auipc	ra,0xfffff
    8000257c:	2b8080e7          	jalr	696(ra) # 80001830 <_Znwm>
    80002580:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	6c8080e7          	jalr	1736(ra) # 80001c4c <_ZN6ThreadC1Ev>
    8000258c:	00005797          	auipc	a5,0x5
    80002590:	e7c78793          	addi	a5,a5,-388 # 80007408 <_ZTV7WorkerA+0x10>
    80002594:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80002598:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    8000259c:	00004517          	auipc	a0,0x4
    800025a0:	c2c50513          	addi	a0,a0,-980 # 800061c8 <CONSOLE_STATUS+0x1b8>
    800025a4:	00001097          	auipc	ra,0x1
    800025a8:	a50080e7          	jalr	-1456(ra) # 80002ff4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800025ac:	02000513          	li	a0,32
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	280080e7          	jalr	640(ra) # 80001830 <_Znwm>
    800025b8:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800025bc:	fffff097          	auipc	ra,0xfffff
    800025c0:	690080e7          	jalr	1680(ra) # 80001c4c <_ZN6ThreadC1Ev>
    800025c4:	00005797          	auipc	a5,0x5
    800025c8:	e6c78793          	addi	a5,a5,-404 # 80007430 <_ZTV7WorkerB+0x10>
    800025cc:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800025d0:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800025d4:	00004517          	auipc	a0,0x4
    800025d8:	c0c50513          	addi	a0,a0,-1012 # 800061e0 <CONSOLE_STATUS+0x1d0>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	a18080e7          	jalr	-1512(ra) # 80002ff4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800025e4:	02000513          	li	a0,32
    800025e8:	fffff097          	auipc	ra,0xfffff
    800025ec:	248080e7          	jalr	584(ra) # 80001830 <_Znwm>
    800025f0:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800025f4:	fffff097          	auipc	ra,0xfffff
    800025f8:	658080e7          	jalr	1624(ra) # 80001c4c <_ZN6ThreadC1Ev>
    800025fc:	00005797          	auipc	a5,0x5
    80002600:	e5c78793          	addi	a5,a5,-420 # 80007458 <_ZTV7WorkerC+0x10>
    80002604:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80002608:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    8000260c:	00004517          	auipc	a0,0x4
    80002610:	bec50513          	addi	a0,a0,-1044 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80002614:	00001097          	auipc	ra,0x1
    80002618:	9e0080e7          	jalr	-1568(ra) # 80002ff4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    8000261c:	02000513          	li	a0,32
    80002620:	fffff097          	auipc	ra,0xfffff
    80002624:	210080e7          	jalr	528(ra) # 80001830 <_Znwm>
    80002628:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	620080e7          	jalr	1568(ra) # 80001c4c <_ZN6ThreadC1Ev>
    80002634:	00005797          	auipc	a5,0x5
    80002638:	e4c78793          	addi	a5,a5,-436 # 80007480 <_ZTV7WorkerD+0x10>
    8000263c:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002640:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002644:	00004517          	auipc	a0,0x4
    80002648:	bcc50513          	addi	a0,a0,-1076 # 80006210 <CONSOLE_STATUS+0x200>
    8000264c:	00001097          	auipc	ra,0x1
    80002650:	9a8080e7          	jalr	-1624(ra) # 80002ff4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002654:	00000493          	li	s1,0
    80002658:	00300793          	li	a5,3
    8000265c:	0297c663          	blt	a5,s1,80002688 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002660:	00349793          	slli	a5,s1,0x3
    80002664:	fe040713          	addi	a4,s0,-32
    80002668:	00f707b3          	add	a5,a4,a5
    8000266c:	fe07b503          	ld	a0,-32(a5)
    80002670:	fffff097          	auipc	ra,0xfffff
    80002674:	568080e7          	jalr	1384(ra) # 80001bd8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80002678:	0014849b          	addiw	s1,s1,1
    8000267c:	fddff06f          	j	80002658 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002680:	fffff097          	auipc	ra,0xfffff
    80002684:	588080e7          	jalr	1416(ra) # 80001c08 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002688:	00005797          	auipc	a5,0x5
    8000268c:	ec87c783          	lbu	a5,-312(a5) # 80007550 <_ZL9finishedA>
    80002690:	fe0788e3          	beqz	a5,80002680 <_Z20Threads_CPP_API_testv+0x124>
    80002694:	00005797          	auipc	a5,0x5
    80002698:	ebd7c783          	lbu	a5,-323(a5) # 80007551 <_ZL9finishedB>
    8000269c:	fe0782e3          	beqz	a5,80002680 <_Z20Threads_CPP_API_testv+0x124>
    800026a0:	00005797          	auipc	a5,0x5
    800026a4:	eb27c783          	lbu	a5,-334(a5) # 80007552 <_ZL9finishedC>
    800026a8:	fc078ce3          	beqz	a5,80002680 <_Z20Threads_CPP_API_testv+0x124>
    800026ac:	00005797          	auipc	a5,0x5
    800026b0:	ea77c783          	lbu	a5,-345(a5) # 80007553 <_ZL9finishedD>
    800026b4:	fc0786e3          	beqz	a5,80002680 <_Z20Threads_CPP_API_testv+0x124>
    800026b8:	fc040493          	addi	s1,s0,-64
    800026bc:	0080006f          	j	800026c4 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    800026c0:	00848493          	addi	s1,s1,8
    800026c4:	fe040793          	addi	a5,s0,-32
    800026c8:	08f48663          	beq	s1,a5,80002754 <_Z20Threads_CPP_API_testv+0x1f8>
    800026cc:	0004b503          	ld	a0,0(s1)
    800026d0:	fe0508e3          	beqz	a0,800026c0 <_Z20Threads_CPP_API_testv+0x164>
    800026d4:	00053783          	ld	a5,0(a0)
    800026d8:	0087b783          	ld	a5,8(a5)
    800026dc:	000780e7          	jalr	a5
    800026e0:	fe1ff06f          	j	800026c0 <_Z20Threads_CPP_API_testv+0x164>
    800026e4:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800026e8:	00048513          	mv	a0,s1
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	194080e7          	jalr	404(ra) # 80001880 <_ZdlPv>
    800026f4:	00090513          	mv	a0,s2
    800026f8:	00006097          	auipc	ra,0x6
    800026fc:	f40080e7          	jalr	-192(ra) # 80008638 <_Unwind_Resume>
    80002700:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002704:	00048513          	mv	a0,s1
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	178080e7          	jalr	376(ra) # 80001880 <_ZdlPv>
    80002710:	00090513          	mv	a0,s2
    80002714:	00006097          	auipc	ra,0x6
    80002718:	f24080e7          	jalr	-220(ra) # 80008638 <_Unwind_Resume>
    8000271c:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002720:	00048513          	mv	a0,s1
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	15c080e7          	jalr	348(ra) # 80001880 <_ZdlPv>
    8000272c:	00090513          	mv	a0,s2
    80002730:	00006097          	auipc	ra,0x6
    80002734:	f08080e7          	jalr	-248(ra) # 80008638 <_Unwind_Resume>
    80002738:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    8000273c:	00048513          	mv	a0,s1
    80002740:	fffff097          	auipc	ra,0xfffff
    80002744:	140080e7          	jalr	320(ra) # 80001880 <_ZdlPv>
    80002748:	00090513          	mv	a0,s2
    8000274c:	00006097          	auipc	ra,0x6
    80002750:	eec080e7          	jalr	-276(ra) # 80008638 <_Unwind_Resume>
}
    80002754:	03813083          	ld	ra,56(sp)
    80002758:	03013403          	ld	s0,48(sp)
    8000275c:	02813483          	ld	s1,40(sp)
    80002760:	02013903          	ld	s2,32(sp)
    80002764:	04010113          	addi	sp,sp,64
    80002768:	00008067          	ret

000000008000276c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	00813023          	sd	s0,0(sp)
    80002778:	01010413          	addi	s0,sp,16
    8000277c:	00005797          	auipc	a5,0x5
    80002780:	c8c78793          	addi	a5,a5,-884 # 80007408 <_ZTV7WorkerA+0x10>
    80002784:	00f53023          	sd	a5,0(a0)
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	380080e7          	jalr	896(ra) # 80001b08 <_ZN6ThreadD1Ev>
    80002790:	00813083          	ld	ra,8(sp)
    80002794:	00013403          	ld	s0,0(sp)
    80002798:	01010113          	addi	sp,sp,16
    8000279c:	00008067          	ret

00000000800027a0 <_ZN7WorkerAD0Ev>:
    800027a0:	fe010113          	addi	sp,sp,-32
    800027a4:	00113c23          	sd	ra,24(sp)
    800027a8:	00813823          	sd	s0,16(sp)
    800027ac:	00913423          	sd	s1,8(sp)
    800027b0:	02010413          	addi	s0,sp,32
    800027b4:	00050493          	mv	s1,a0
    800027b8:	00005797          	auipc	a5,0x5
    800027bc:	c5078793          	addi	a5,a5,-944 # 80007408 <_ZTV7WorkerA+0x10>
    800027c0:	00f53023          	sd	a5,0(a0)
    800027c4:	fffff097          	auipc	ra,0xfffff
    800027c8:	344080e7          	jalr	836(ra) # 80001b08 <_ZN6ThreadD1Ev>
    800027cc:	00048513          	mv	a0,s1
    800027d0:	fffff097          	auipc	ra,0xfffff
    800027d4:	0b0080e7          	jalr	176(ra) # 80001880 <_ZdlPv>
    800027d8:	01813083          	ld	ra,24(sp)
    800027dc:	01013403          	ld	s0,16(sp)
    800027e0:	00813483          	ld	s1,8(sp)
    800027e4:	02010113          	addi	sp,sp,32
    800027e8:	00008067          	ret

00000000800027ec <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800027ec:	ff010113          	addi	sp,sp,-16
    800027f0:	00113423          	sd	ra,8(sp)
    800027f4:	00813023          	sd	s0,0(sp)
    800027f8:	01010413          	addi	s0,sp,16
    800027fc:	00005797          	auipc	a5,0x5
    80002800:	c3478793          	addi	a5,a5,-972 # 80007430 <_ZTV7WorkerB+0x10>
    80002804:	00f53023          	sd	a5,0(a0)
    80002808:	fffff097          	auipc	ra,0xfffff
    8000280c:	300080e7          	jalr	768(ra) # 80001b08 <_ZN6ThreadD1Ev>
    80002810:	00813083          	ld	ra,8(sp)
    80002814:	00013403          	ld	s0,0(sp)
    80002818:	01010113          	addi	sp,sp,16
    8000281c:	00008067          	ret

0000000080002820 <_ZN7WorkerBD0Ev>:
    80002820:	fe010113          	addi	sp,sp,-32
    80002824:	00113c23          	sd	ra,24(sp)
    80002828:	00813823          	sd	s0,16(sp)
    8000282c:	00913423          	sd	s1,8(sp)
    80002830:	02010413          	addi	s0,sp,32
    80002834:	00050493          	mv	s1,a0
    80002838:	00005797          	auipc	a5,0x5
    8000283c:	bf878793          	addi	a5,a5,-1032 # 80007430 <_ZTV7WorkerB+0x10>
    80002840:	00f53023          	sd	a5,0(a0)
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	2c4080e7          	jalr	708(ra) # 80001b08 <_ZN6ThreadD1Ev>
    8000284c:	00048513          	mv	a0,s1
    80002850:	fffff097          	auipc	ra,0xfffff
    80002854:	030080e7          	jalr	48(ra) # 80001880 <_ZdlPv>
    80002858:	01813083          	ld	ra,24(sp)
    8000285c:	01013403          	ld	s0,16(sp)
    80002860:	00813483          	ld	s1,8(sp)
    80002864:	02010113          	addi	sp,sp,32
    80002868:	00008067          	ret

000000008000286c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000286c:	ff010113          	addi	sp,sp,-16
    80002870:	00113423          	sd	ra,8(sp)
    80002874:	00813023          	sd	s0,0(sp)
    80002878:	01010413          	addi	s0,sp,16
    8000287c:	00005797          	auipc	a5,0x5
    80002880:	bdc78793          	addi	a5,a5,-1060 # 80007458 <_ZTV7WorkerC+0x10>
    80002884:	00f53023          	sd	a5,0(a0)
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	280080e7          	jalr	640(ra) # 80001b08 <_ZN6ThreadD1Ev>
    80002890:	00813083          	ld	ra,8(sp)
    80002894:	00013403          	ld	s0,0(sp)
    80002898:	01010113          	addi	sp,sp,16
    8000289c:	00008067          	ret

00000000800028a0 <_ZN7WorkerCD0Ev>:
    800028a0:	fe010113          	addi	sp,sp,-32
    800028a4:	00113c23          	sd	ra,24(sp)
    800028a8:	00813823          	sd	s0,16(sp)
    800028ac:	00913423          	sd	s1,8(sp)
    800028b0:	02010413          	addi	s0,sp,32
    800028b4:	00050493          	mv	s1,a0
    800028b8:	00005797          	auipc	a5,0x5
    800028bc:	ba078793          	addi	a5,a5,-1120 # 80007458 <_ZTV7WorkerC+0x10>
    800028c0:	00f53023          	sd	a5,0(a0)
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	244080e7          	jalr	580(ra) # 80001b08 <_ZN6ThreadD1Ev>
    800028cc:	00048513          	mv	a0,s1
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	fb0080e7          	jalr	-80(ra) # 80001880 <_ZdlPv>
    800028d8:	01813083          	ld	ra,24(sp)
    800028dc:	01013403          	ld	s0,16(sp)
    800028e0:	00813483          	ld	s1,8(sp)
    800028e4:	02010113          	addi	sp,sp,32
    800028e8:	00008067          	ret

00000000800028ec <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00113423          	sd	ra,8(sp)
    800028f4:	00813023          	sd	s0,0(sp)
    800028f8:	01010413          	addi	s0,sp,16
    800028fc:	00005797          	auipc	a5,0x5
    80002900:	b8478793          	addi	a5,a5,-1148 # 80007480 <_ZTV7WorkerD+0x10>
    80002904:	00f53023          	sd	a5,0(a0)
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	200080e7          	jalr	512(ra) # 80001b08 <_ZN6ThreadD1Ev>
    80002910:	00813083          	ld	ra,8(sp)
    80002914:	00013403          	ld	s0,0(sp)
    80002918:	01010113          	addi	sp,sp,16
    8000291c:	00008067          	ret

0000000080002920 <_ZN7WorkerDD0Ev>:
    80002920:	fe010113          	addi	sp,sp,-32
    80002924:	00113c23          	sd	ra,24(sp)
    80002928:	00813823          	sd	s0,16(sp)
    8000292c:	00913423          	sd	s1,8(sp)
    80002930:	02010413          	addi	s0,sp,32
    80002934:	00050493          	mv	s1,a0
    80002938:	00005797          	auipc	a5,0x5
    8000293c:	b4878793          	addi	a5,a5,-1208 # 80007480 <_ZTV7WorkerD+0x10>
    80002940:	00f53023          	sd	a5,0(a0)
    80002944:	fffff097          	auipc	ra,0xfffff
    80002948:	1c4080e7          	jalr	452(ra) # 80001b08 <_ZN6ThreadD1Ev>
    8000294c:	00048513          	mv	a0,s1
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	f30080e7          	jalr	-208(ra) # 80001880 <_ZdlPv>
    80002958:	01813083          	ld	ra,24(sp)
    8000295c:	01013403          	ld	s0,16(sp)
    80002960:	00813483          	ld	s1,8(sp)
    80002964:	02010113          	addi	sp,sp,32
    80002968:	00008067          	ret

000000008000296c <_ZN7WorkerA3runEv>:
    void run() override {
    8000296c:	ff010113          	addi	sp,sp,-16
    80002970:	00113423          	sd	ra,8(sp)
    80002974:	00813023          	sd	s0,0(sp)
    80002978:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000297c:	00000593          	li	a1,0
    80002980:	fffff097          	auipc	ra,0xfffff
    80002984:	774080e7          	jalr	1908(ra) # 800020f4 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002988:	00813083          	ld	ra,8(sp)
    8000298c:	00013403          	ld	s0,0(sp)
    80002990:	01010113          	addi	sp,sp,16
    80002994:	00008067          	ret

0000000080002998 <_ZN7WorkerB3runEv>:
    void run() override {
    80002998:	ff010113          	addi	sp,sp,-16
    8000299c:	00113423          	sd	ra,8(sp)
    800029a0:	00813023          	sd	s0,0(sp)
    800029a4:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800029a8:	00000593          	li	a1,0
    800029ac:	00000097          	auipc	ra,0x0
    800029b0:	814080e7          	jalr	-2028(ra) # 800021c0 <_ZN7WorkerB11workerBodyBEPv>
    }
    800029b4:	00813083          	ld	ra,8(sp)
    800029b8:	00013403          	ld	s0,0(sp)
    800029bc:	01010113          	addi	sp,sp,16
    800029c0:	00008067          	ret

00000000800029c4 <_ZN7WorkerC3runEv>:
    void run() override {
    800029c4:	ff010113          	addi	sp,sp,-16
    800029c8:	00113423          	sd	ra,8(sp)
    800029cc:	00813023          	sd	s0,0(sp)
    800029d0:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800029d4:	00000593          	li	a1,0
    800029d8:	00000097          	auipc	ra,0x0
    800029dc:	8bc080e7          	jalr	-1860(ra) # 80002294 <_ZN7WorkerC11workerBodyCEPv>
    }
    800029e0:	00813083          	ld	ra,8(sp)
    800029e4:	00013403          	ld	s0,0(sp)
    800029e8:	01010113          	addi	sp,sp,16
    800029ec:	00008067          	ret

00000000800029f0 <_ZN7WorkerD3runEv>:
    void run() override {
    800029f0:	ff010113          	addi	sp,sp,-16
    800029f4:	00113423          	sd	ra,8(sp)
    800029f8:	00813023          	sd	s0,0(sp)
    800029fc:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80002a00:	00000593          	li	a1,0
    80002a04:	00000097          	auipc	ra,0x0
    80002a08:	a10080e7          	jalr	-1520(ra) # 80002414 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002a0c:	00813083          	ld	ra,8(sp)
    80002a10:	00013403          	ld	s0,0(sp)
    80002a14:	01010113          	addi	sp,sp,16
    80002a18:	00008067          	ret

0000000080002a1c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002a1c:	fe010113          	addi	sp,sp,-32
    80002a20:	00113c23          	sd	ra,24(sp)
    80002a24:	00813823          	sd	s0,16(sp)
    80002a28:	00913423          	sd	s1,8(sp)
    80002a2c:	01213023          	sd	s2,0(sp)
    80002a30:	02010413          	addi	s0,sp,32
    80002a34:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002a38:	00100793          	li	a5,1
    80002a3c:	02a7f863          	bgeu	a5,a0,80002a6c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002a40:	00a00793          	li	a5,10
    80002a44:	02f577b3          	remu	a5,a0,a5
    80002a48:	02078e63          	beqz	a5,80002a84 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002a4c:	fff48513          	addi	a0,s1,-1
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	fcc080e7          	jalr	-52(ra) # 80002a1c <_ZL9fibonaccim>
    80002a58:	00050913          	mv	s2,a0
    80002a5c:	ffe48513          	addi	a0,s1,-2
    80002a60:	00000097          	auipc	ra,0x0
    80002a64:	fbc080e7          	jalr	-68(ra) # 80002a1c <_ZL9fibonaccim>
    80002a68:	00a90533          	add	a0,s2,a0
}
    80002a6c:	01813083          	ld	ra,24(sp)
    80002a70:	01013403          	ld	s0,16(sp)
    80002a74:	00813483          	ld	s1,8(sp)
    80002a78:	00013903          	ld	s2,0(sp)
    80002a7c:	02010113          	addi	sp,sp,32
    80002a80:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	cd4080e7          	jalr	-812(ra) # 80001758 <_Z15thread_dispatchv>
    80002a8c:	fc1ff06f          	j	80002a4c <_ZL9fibonaccim+0x30>

0000000080002a90 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80002a90:	fe010113          	addi	sp,sp,-32
    80002a94:	00113c23          	sd	ra,24(sp)
    80002a98:	00813823          	sd	s0,16(sp)
    80002a9c:	00913423          	sd	s1,8(sp)
    80002aa0:	01213023          	sd	s2,0(sp)
    80002aa4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002aa8:	00a00493          	li	s1,10
    80002aac:	0400006f          	j	80002aec <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002ab0:	00003517          	auipc	a0,0x3
    80002ab4:	6e050513          	addi	a0,a0,1760 # 80006190 <CONSOLE_STATUS+0x180>
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	53c080e7          	jalr	1340(ra) # 80002ff4 <_Z11printStringPKc>
    80002ac0:	00000613          	li	a2,0
    80002ac4:	00a00593          	li	a1,10
    80002ac8:	00048513          	mv	a0,s1
    80002acc:	00000097          	auipc	ra,0x0
    80002ad0:	6d8080e7          	jalr	1752(ra) # 800031a4 <_Z8printIntiii>
    80002ad4:	00004517          	auipc	a0,0x4
    80002ad8:	a0450513          	addi	a0,a0,-1532 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002adc:	00000097          	auipc	ra,0x0
    80002ae0:	518080e7          	jalr	1304(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002ae4:	0014849b          	addiw	s1,s1,1
    80002ae8:	0ff4f493          	andi	s1,s1,255
    80002aec:	00c00793          	li	a5,12
    80002af0:	fc97f0e3          	bgeu	a5,s1,80002ab0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80002af4:	00003517          	auipc	a0,0x3
    80002af8:	6a450513          	addi	a0,a0,1700 # 80006198 <CONSOLE_STATUS+0x188>
    80002afc:	00000097          	auipc	ra,0x0
    80002b00:	4f8080e7          	jalr	1272(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002b04:	00500313          	li	t1,5
    thread_dispatch();
    80002b08:	fffff097          	auipc	ra,0xfffff
    80002b0c:	c50080e7          	jalr	-944(ra) # 80001758 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002b10:	01000513          	li	a0,16
    80002b14:	00000097          	auipc	ra,0x0
    80002b18:	f08080e7          	jalr	-248(ra) # 80002a1c <_ZL9fibonaccim>
    80002b1c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002b20:	00003517          	auipc	a0,0x3
    80002b24:	68850513          	addi	a0,a0,1672 # 800061a8 <CONSOLE_STATUS+0x198>
    80002b28:	00000097          	auipc	ra,0x0
    80002b2c:	4cc080e7          	jalr	1228(ra) # 80002ff4 <_Z11printStringPKc>
    80002b30:	00000613          	li	a2,0
    80002b34:	00a00593          	li	a1,10
    80002b38:	0009051b          	sext.w	a0,s2
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	668080e7          	jalr	1640(ra) # 800031a4 <_Z8printIntiii>
    80002b44:	00004517          	auipc	a0,0x4
    80002b48:	99450513          	addi	a0,a0,-1644 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002b4c:	00000097          	auipc	ra,0x0
    80002b50:	4a8080e7          	jalr	1192(ra) # 80002ff4 <_Z11printStringPKc>
    80002b54:	0400006f          	j	80002b94 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002b58:	00003517          	auipc	a0,0x3
    80002b5c:	63850513          	addi	a0,a0,1592 # 80006190 <CONSOLE_STATUS+0x180>
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	494080e7          	jalr	1172(ra) # 80002ff4 <_Z11printStringPKc>
    80002b68:	00000613          	li	a2,0
    80002b6c:	00a00593          	li	a1,10
    80002b70:	00048513          	mv	a0,s1
    80002b74:	00000097          	auipc	ra,0x0
    80002b78:	630080e7          	jalr	1584(ra) # 800031a4 <_Z8printIntiii>
    80002b7c:	00004517          	auipc	a0,0x4
    80002b80:	95c50513          	addi	a0,a0,-1700 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002b84:	00000097          	auipc	ra,0x0
    80002b88:	470080e7          	jalr	1136(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002b8c:	0014849b          	addiw	s1,s1,1
    80002b90:	0ff4f493          	andi	s1,s1,255
    80002b94:	00f00793          	li	a5,15
    80002b98:	fc97f0e3          	bgeu	a5,s1,80002b58 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80002b9c:	00003517          	auipc	a0,0x3
    80002ba0:	61c50513          	addi	a0,a0,1564 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80002ba4:	00000097          	auipc	ra,0x0
    80002ba8:	450080e7          	jalr	1104(ra) # 80002ff4 <_Z11printStringPKc>
    finishedD = true;
    80002bac:	00100793          	li	a5,1
    80002bb0:	00005717          	auipc	a4,0x5
    80002bb4:	9af70223          	sb	a5,-1628(a4) # 80007554 <_ZL9finishedD>
    thread_dispatch();
    80002bb8:	fffff097          	auipc	ra,0xfffff
    80002bbc:	ba0080e7          	jalr	-1120(ra) # 80001758 <_Z15thread_dispatchv>
}
    80002bc0:	01813083          	ld	ra,24(sp)
    80002bc4:	01013403          	ld	s0,16(sp)
    80002bc8:	00813483          	ld	s1,8(sp)
    80002bcc:	00013903          	ld	s2,0(sp)
    80002bd0:	02010113          	addi	sp,sp,32
    80002bd4:	00008067          	ret

0000000080002bd8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80002bd8:	fe010113          	addi	sp,sp,-32
    80002bdc:	00113c23          	sd	ra,24(sp)
    80002be0:	00813823          	sd	s0,16(sp)
    80002be4:	00913423          	sd	s1,8(sp)
    80002be8:	01213023          	sd	s2,0(sp)
    80002bec:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002bf0:	00000493          	li	s1,0
    80002bf4:	0400006f          	j	80002c34 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80002bf8:	00003517          	auipc	a0,0x3
    80002bfc:	56850513          	addi	a0,a0,1384 # 80006160 <CONSOLE_STATUS+0x150>
    80002c00:	00000097          	auipc	ra,0x0
    80002c04:	3f4080e7          	jalr	1012(ra) # 80002ff4 <_Z11printStringPKc>
    80002c08:	00000613          	li	a2,0
    80002c0c:	00a00593          	li	a1,10
    80002c10:	00048513          	mv	a0,s1
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	590080e7          	jalr	1424(ra) # 800031a4 <_Z8printIntiii>
    80002c1c:	00004517          	auipc	a0,0x4
    80002c20:	8bc50513          	addi	a0,a0,-1860 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002c24:	00000097          	auipc	ra,0x0
    80002c28:	3d0080e7          	jalr	976(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002c2c:	0014849b          	addiw	s1,s1,1
    80002c30:	0ff4f493          	andi	s1,s1,255
    80002c34:	00200793          	li	a5,2
    80002c38:	fc97f0e3          	bgeu	a5,s1,80002bf8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80002c3c:	00003517          	auipc	a0,0x3
    80002c40:	52c50513          	addi	a0,a0,1324 # 80006168 <CONSOLE_STATUS+0x158>
    80002c44:	00000097          	auipc	ra,0x0
    80002c48:	3b0080e7          	jalr	944(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002c4c:	00700313          	li	t1,7
    thread_dispatch();
    80002c50:	fffff097          	auipc	ra,0xfffff
    80002c54:	b08080e7          	jalr	-1272(ra) # 80001758 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002c58:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80002c5c:	00003517          	auipc	a0,0x3
    80002c60:	51c50513          	addi	a0,a0,1308 # 80006178 <CONSOLE_STATUS+0x168>
    80002c64:	00000097          	auipc	ra,0x0
    80002c68:	390080e7          	jalr	912(ra) # 80002ff4 <_Z11printStringPKc>
    80002c6c:	00000613          	li	a2,0
    80002c70:	00a00593          	li	a1,10
    80002c74:	0009051b          	sext.w	a0,s2
    80002c78:	00000097          	auipc	ra,0x0
    80002c7c:	52c080e7          	jalr	1324(ra) # 800031a4 <_Z8printIntiii>
    80002c80:	00004517          	auipc	a0,0x4
    80002c84:	85850513          	addi	a0,a0,-1960 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002c88:	00000097          	auipc	ra,0x0
    80002c8c:	36c080e7          	jalr	876(ra) # 80002ff4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80002c90:	00c00513          	li	a0,12
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	d88080e7          	jalr	-632(ra) # 80002a1c <_ZL9fibonaccim>
    80002c9c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002ca0:	00003517          	auipc	a0,0x3
    80002ca4:	4e050513          	addi	a0,a0,1248 # 80006180 <CONSOLE_STATUS+0x170>
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	34c080e7          	jalr	844(ra) # 80002ff4 <_Z11printStringPKc>
    80002cb0:	00000613          	li	a2,0
    80002cb4:	00a00593          	li	a1,10
    80002cb8:	0009051b          	sext.w	a0,s2
    80002cbc:	00000097          	auipc	ra,0x0
    80002cc0:	4e8080e7          	jalr	1256(ra) # 800031a4 <_Z8printIntiii>
    80002cc4:	00004517          	auipc	a0,0x4
    80002cc8:	81450513          	addi	a0,a0,-2028 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002ccc:	00000097          	auipc	ra,0x0
    80002cd0:	328080e7          	jalr	808(ra) # 80002ff4 <_Z11printStringPKc>
    80002cd4:	0400006f          	j	80002d14 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80002cd8:	00003517          	auipc	a0,0x3
    80002cdc:	48850513          	addi	a0,a0,1160 # 80006160 <CONSOLE_STATUS+0x150>
    80002ce0:	00000097          	auipc	ra,0x0
    80002ce4:	314080e7          	jalr	788(ra) # 80002ff4 <_Z11printStringPKc>
    80002ce8:	00000613          	li	a2,0
    80002cec:	00a00593          	li	a1,10
    80002cf0:	00048513          	mv	a0,s1
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	4b0080e7          	jalr	1200(ra) # 800031a4 <_Z8printIntiii>
    80002cfc:	00003517          	auipc	a0,0x3
    80002d00:	7dc50513          	addi	a0,a0,2012 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	2f0080e7          	jalr	752(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002d0c:	0014849b          	addiw	s1,s1,1
    80002d10:	0ff4f493          	andi	s1,s1,255
    80002d14:	00500793          	li	a5,5
    80002d18:	fc97f0e3          	bgeu	a5,s1,80002cd8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80002d1c:	00003517          	auipc	a0,0x3
    80002d20:	41c50513          	addi	a0,a0,1052 # 80006138 <CONSOLE_STATUS+0x128>
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	2d0080e7          	jalr	720(ra) # 80002ff4 <_Z11printStringPKc>
    finishedC = true;
    80002d2c:	00100793          	li	a5,1
    80002d30:	00005717          	auipc	a4,0x5
    80002d34:	82f702a3          	sb	a5,-2011(a4) # 80007555 <_ZL9finishedC>
    thread_dispatch();
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	a20080e7          	jalr	-1504(ra) # 80001758 <_Z15thread_dispatchv>
}
    80002d40:	01813083          	ld	ra,24(sp)
    80002d44:	01013403          	ld	s0,16(sp)
    80002d48:	00813483          	ld	s1,8(sp)
    80002d4c:	00013903          	ld	s2,0(sp)
    80002d50:	02010113          	addi	sp,sp,32
    80002d54:	00008067          	ret

0000000080002d58 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80002d58:	fe010113          	addi	sp,sp,-32
    80002d5c:	00113c23          	sd	ra,24(sp)
    80002d60:	00813823          	sd	s0,16(sp)
    80002d64:	00913423          	sd	s1,8(sp)
    80002d68:	01213023          	sd	s2,0(sp)
    80002d6c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002d70:	00000913          	li	s2,0
    80002d74:	0380006f          	j	80002dac <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	9e0080e7          	jalr	-1568(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002d80:	00148493          	addi	s1,s1,1
    80002d84:	000027b7          	lui	a5,0x2
    80002d88:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002d8c:	0097ee63          	bltu	a5,s1,80002da8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002d90:	00000713          	li	a4,0
    80002d94:	000077b7          	lui	a5,0x7
    80002d98:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002d9c:	fce7eee3          	bltu	a5,a4,80002d78 <_ZL11workerBodyBPv+0x20>
    80002da0:	00170713          	addi	a4,a4,1
    80002da4:	ff1ff06f          	j	80002d94 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002da8:	00190913          	addi	s2,s2,1
    80002dac:	00f00793          	li	a5,15
    80002db0:	0527e063          	bltu	a5,s2,80002df0 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002db4:	00003517          	auipc	a0,0x3
    80002db8:	39450513          	addi	a0,a0,916 # 80006148 <CONSOLE_STATUS+0x138>
    80002dbc:	00000097          	auipc	ra,0x0
    80002dc0:	238080e7          	jalr	568(ra) # 80002ff4 <_Z11printStringPKc>
    80002dc4:	00000613          	li	a2,0
    80002dc8:	00a00593          	li	a1,10
    80002dcc:	0009051b          	sext.w	a0,s2
    80002dd0:	00000097          	auipc	ra,0x0
    80002dd4:	3d4080e7          	jalr	980(ra) # 800031a4 <_Z8printIntiii>
    80002dd8:	00003517          	auipc	a0,0x3
    80002ddc:	70050513          	addi	a0,a0,1792 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002de0:	00000097          	auipc	ra,0x0
    80002de4:	214080e7          	jalr	532(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002de8:	00000493          	li	s1,0
    80002dec:	f99ff06f          	j	80002d84 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80002df0:	00003517          	auipc	a0,0x3
    80002df4:	36050513          	addi	a0,a0,864 # 80006150 <CONSOLE_STATUS+0x140>
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	1fc080e7          	jalr	508(ra) # 80002ff4 <_Z11printStringPKc>
    finishedB = true;
    80002e00:	00100793          	li	a5,1
    80002e04:	00004717          	auipc	a4,0x4
    80002e08:	74f70923          	sb	a5,1874(a4) # 80007556 <_ZL9finishedB>
    thread_dispatch();
    80002e0c:	fffff097          	auipc	ra,0xfffff
    80002e10:	94c080e7          	jalr	-1716(ra) # 80001758 <_Z15thread_dispatchv>
}
    80002e14:	01813083          	ld	ra,24(sp)
    80002e18:	01013403          	ld	s0,16(sp)
    80002e1c:	00813483          	ld	s1,8(sp)
    80002e20:	00013903          	ld	s2,0(sp)
    80002e24:	02010113          	addi	sp,sp,32
    80002e28:	00008067          	ret

0000000080002e2c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80002e2c:	fe010113          	addi	sp,sp,-32
    80002e30:	00113c23          	sd	ra,24(sp)
    80002e34:	00813823          	sd	s0,16(sp)
    80002e38:	00913423          	sd	s1,8(sp)
    80002e3c:	01213023          	sd	s2,0(sp)
    80002e40:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002e44:	00000913          	li	s2,0
    80002e48:	0380006f          	j	80002e80 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80002e4c:	fffff097          	auipc	ra,0xfffff
    80002e50:	90c080e7          	jalr	-1780(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002e54:	00148493          	addi	s1,s1,1
    80002e58:	000027b7          	lui	a5,0x2
    80002e5c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002e60:	0097ee63          	bltu	a5,s1,80002e7c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002e64:	00000713          	li	a4,0
    80002e68:	000077b7          	lui	a5,0x7
    80002e6c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002e70:	fce7eee3          	bltu	a5,a4,80002e4c <_ZL11workerBodyAPv+0x20>
    80002e74:	00170713          	addi	a4,a4,1
    80002e78:	ff1ff06f          	j	80002e68 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002e7c:	00190913          	addi	s2,s2,1
    80002e80:	00900793          	li	a5,9
    80002e84:	0527e063          	bltu	a5,s2,80002ec4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002e88:	00003517          	auipc	a0,0x3
    80002e8c:	2a850513          	addi	a0,a0,680 # 80006130 <CONSOLE_STATUS+0x120>
    80002e90:	00000097          	auipc	ra,0x0
    80002e94:	164080e7          	jalr	356(ra) # 80002ff4 <_Z11printStringPKc>
    80002e98:	00000613          	li	a2,0
    80002e9c:	00a00593          	li	a1,10
    80002ea0:	0009051b          	sext.w	a0,s2
    80002ea4:	00000097          	auipc	ra,0x0
    80002ea8:	300080e7          	jalr	768(ra) # 800031a4 <_Z8printIntiii>
    80002eac:	00003517          	auipc	a0,0x3
    80002eb0:	62c50513          	addi	a0,a0,1580 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80002eb4:	00000097          	auipc	ra,0x0
    80002eb8:	140080e7          	jalr	320(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002ebc:	00000493          	li	s1,0
    80002ec0:	f99ff06f          	j	80002e58 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80002ec4:	00003517          	auipc	a0,0x3
    80002ec8:	27450513          	addi	a0,a0,628 # 80006138 <CONSOLE_STATUS+0x128>
    80002ecc:	00000097          	auipc	ra,0x0
    80002ed0:	128080e7          	jalr	296(ra) # 80002ff4 <_Z11printStringPKc>
    finishedA = true;
    80002ed4:	00100793          	li	a5,1
    80002ed8:	00004717          	auipc	a4,0x4
    80002edc:	66f70fa3          	sb	a5,1663(a4) # 80007557 <_ZL9finishedA>
}
    80002ee0:	01813083          	ld	ra,24(sp)
    80002ee4:	01013403          	ld	s0,16(sp)
    80002ee8:	00813483          	ld	s1,8(sp)
    80002eec:	00013903          	ld	s2,0(sp)
    80002ef0:	02010113          	addi	sp,sp,32
    80002ef4:	00008067          	ret

0000000080002ef8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80002ef8:	fd010113          	addi	sp,sp,-48
    80002efc:	02113423          	sd	ra,40(sp)
    80002f00:	02813023          	sd	s0,32(sp)
    80002f04:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80002f08:	00000613          	li	a2,0
    80002f0c:	00000597          	auipc	a1,0x0
    80002f10:	f2058593          	addi	a1,a1,-224 # 80002e2c <_ZL11workerBodyAPv>
    80002f14:	fd040513          	addi	a0,s0,-48
    80002f18:	ffffe097          	auipc	ra,0xffffe
    80002f1c:	720080e7          	jalr	1824(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80002f20:	00003517          	auipc	a0,0x3
    80002f24:	2a850513          	addi	a0,a0,680 # 800061c8 <CONSOLE_STATUS+0x1b8>
    80002f28:	00000097          	auipc	ra,0x0
    80002f2c:	0cc080e7          	jalr	204(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80002f30:	00000613          	li	a2,0
    80002f34:	00000597          	auipc	a1,0x0
    80002f38:	e2458593          	addi	a1,a1,-476 # 80002d58 <_ZL11workerBodyBPv>
    80002f3c:	fd840513          	addi	a0,s0,-40
    80002f40:	ffffe097          	auipc	ra,0xffffe
    80002f44:	6f8080e7          	jalr	1784(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80002f48:	00003517          	auipc	a0,0x3
    80002f4c:	29850513          	addi	a0,a0,664 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80002f50:	00000097          	auipc	ra,0x0
    80002f54:	0a4080e7          	jalr	164(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80002f58:	00000613          	li	a2,0
    80002f5c:	00000597          	auipc	a1,0x0
    80002f60:	c7c58593          	addi	a1,a1,-900 # 80002bd8 <_ZL11workerBodyCPv>
    80002f64:	fe040513          	addi	a0,s0,-32
    80002f68:	ffffe097          	auipc	ra,0xffffe
    80002f6c:	6d0080e7          	jalr	1744(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80002f70:	00003517          	auipc	a0,0x3
    80002f74:	28850513          	addi	a0,a0,648 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80002f78:	00000097          	auipc	ra,0x0
    80002f7c:	07c080e7          	jalr	124(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80002f80:	00000613          	li	a2,0
    80002f84:	00000597          	auipc	a1,0x0
    80002f88:	b0c58593          	addi	a1,a1,-1268 # 80002a90 <_ZL11workerBodyDPv>
    80002f8c:	fe840513          	addi	a0,s0,-24
    80002f90:	ffffe097          	auipc	ra,0xffffe
    80002f94:	6a8080e7          	jalr	1704(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80002f98:	00003517          	auipc	a0,0x3
    80002f9c:	27850513          	addi	a0,a0,632 # 80006210 <CONSOLE_STATUS+0x200>
    80002fa0:	00000097          	auipc	ra,0x0
    80002fa4:	054080e7          	jalr	84(ra) # 80002ff4 <_Z11printStringPKc>
    80002fa8:	00c0006f          	j	80002fb4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80002fac:	ffffe097          	auipc	ra,0xffffe
    80002fb0:	7ac080e7          	jalr	1964(ra) # 80001758 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002fb4:	00004797          	auipc	a5,0x4
    80002fb8:	5a37c783          	lbu	a5,1443(a5) # 80007557 <_ZL9finishedA>
    80002fbc:	fe0788e3          	beqz	a5,80002fac <_Z18Threads_C_API_testv+0xb4>
    80002fc0:	00004797          	auipc	a5,0x4
    80002fc4:	5967c783          	lbu	a5,1430(a5) # 80007556 <_ZL9finishedB>
    80002fc8:	fe0782e3          	beqz	a5,80002fac <_Z18Threads_C_API_testv+0xb4>
    80002fcc:	00004797          	auipc	a5,0x4
    80002fd0:	5897c783          	lbu	a5,1417(a5) # 80007555 <_ZL9finishedC>
    80002fd4:	fc078ce3          	beqz	a5,80002fac <_Z18Threads_C_API_testv+0xb4>
    80002fd8:	00004797          	auipc	a5,0x4
    80002fdc:	57c7c783          	lbu	a5,1404(a5) # 80007554 <_ZL9finishedD>
    80002fe0:	fc0786e3          	beqz	a5,80002fac <_Z18Threads_C_API_testv+0xb4>
    }

}
    80002fe4:	02813083          	ld	ra,40(sp)
    80002fe8:	02013403          	ld	s0,32(sp)
    80002fec:	03010113          	addi	sp,sp,48
    80002ff0:	00008067          	ret

0000000080002ff4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80002ff4:	fe010113          	addi	sp,sp,-32
    80002ff8:	00113c23          	sd	ra,24(sp)
    80002ffc:	00813823          	sd	s0,16(sp)
    80003000:	00913423          	sd	s1,8(sp)
    80003004:	02010413          	addi	s0,sp,32
    80003008:	00050493          	mv	s1,a0
    LOCK();
    8000300c:	00100613          	li	a2,1
    80003010:	00000593          	li	a1,0
    80003014:	00004517          	auipc	a0,0x4
    80003018:	54450513          	addi	a0,a0,1348 # 80007558 <lockPrint>
    8000301c:	ffffe097          	auipc	ra,0xffffe
    80003020:	36c080e7          	jalr	876(ra) # 80001388 <copy_and_swap>
    80003024:	00050863          	beqz	a0,80003034 <_Z11printStringPKc+0x40>
    80003028:	ffffe097          	auipc	ra,0xffffe
    8000302c:	730080e7          	jalr	1840(ra) # 80001758 <_Z15thread_dispatchv>
    80003030:	fddff06f          	j	8000300c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003034:	0004c503          	lbu	a0,0(s1)
    80003038:	00050a63          	beqz	a0,8000304c <_Z11printStringPKc+0x58>
    {
        putc(*string);
    8000303c:	ffffe097          	auipc	ra,0xffffe
    80003040:	788080e7          	jalr	1928(ra) # 800017c4 <_Z4putcc>
        string++;
    80003044:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003048:	fedff06f          	j	80003034 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    8000304c:	00000613          	li	a2,0
    80003050:	00100593          	li	a1,1
    80003054:	00004517          	auipc	a0,0x4
    80003058:	50450513          	addi	a0,a0,1284 # 80007558 <lockPrint>
    8000305c:	ffffe097          	auipc	ra,0xffffe
    80003060:	32c080e7          	jalr	812(ra) # 80001388 <copy_and_swap>
    80003064:	fe0514e3          	bnez	a0,8000304c <_Z11printStringPKc+0x58>
}
    80003068:	01813083          	ld	ra,24(sp)
    8000306c:	01013403          	ld	s0,16(sp)
    80003070:	00813483          	ld	s1,8(sp)
    80003074:	02010113          	addi	sp,sp,32
    80003078:	00008067          	ret

000000008000307c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000307c:	fd010113          	addi	sp,sp,-48
    80003080:	02113423          	sd	ra,40(sp)
    80003084:	02813023          	sd	s0,32(sp)
    80003088:	00913c23          	sd	s1,24(sp)
    8000308c:	01213823          	sd	s2,16(sp)
    80003090:	01313423          	sd	s3,8(sp)
    80003094:	01413023          	sd	s4,0(sp)
    80003098:	03010413          	addi	s0,sp,48
    8000309c:	00050993          	mv	s3,a0
    800030a0:	00058a13          	mv	s4,a1
    LOCK();
    800030a4:	00100613          	li	a2,1
    800030a8:	00000593          	li	a1,0
    800030ac:	00004517          	auipc	a0,0x4
    800030b0:	4ac50513          	addi	a0,a0,1196 # 80007558 <lockPrint>
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	2d4080e7          	jalr	724(ra) # 80001388 <copy_and_swap>
    800030bc:	00050863          	beqz	a0,800030cc <_Z9getStringPci+0x50>
    800030c0:	ffffe097          	auipc	ra,0xffffe
    800030c4:	698080e7          	jalr	1688(ra) # 80001758 <_Z15thread_dispatchv>
    800030c8:	fddff06f          	j	800030a4 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800030cc:	00000913          	li	s2,0
    800030d0:	00090493          	mv	s1,s2
    800030d4:	0019091b          	addiw	s2,s2,1
    800030d8:	03495a63          	bge	s2,s4,8000310c <_Z9getStringPci+0x90>
        cc = getc();
    800030dc:	ffffe097          	auipc	ra,0xffffe
    800030e0:	6c0080e7          	jalr	1728(ra) # 8000179c <_Z4getcv>
        if(cc < 1)
    800030e4:	02050463          	beqz	a0,8000310c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800030e8:	009984b3          	add	s1,s3,s1
    800030ec:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800030f0:	00a00793          	li	a5,10
    800030f4:	00f50a63          	beq	a0,a5,80003108 <_Z9getStringPci+0x8c>
    800030f8:	00d00793          	li	a5,13
    800030fc:	fcf51ae3          	bne	a0,a5,800030d0 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80003100:	00090493          	mv	s1,s2
    80003104:	0080006f          	j	8000310c <_Z9getStringPci+0x90>
    80003108:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000310c:	009984b3          	add	s1,s3,s1
    80003110:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003114:	00000613          	li	a2,0
    80003118:	00100593          	li	a1,1
    8000311c:	00004517          	auipc	a0,0x4
    80003120:	43c50513          	addi	a0,a0,1084 # 80007558 <lockPrint>
    80003124:	ffffe097          	auipc	ra,0xffffe
    80003128:	264080e7          	jalr	612(ra) # 80001388 <copy_and_swap>
    8000312c:	fe0514e3          	bnez	a0,80003114 <_Z9getStringPci+0x98>
    return buf;
}
    80003130:	00098513          	mv	a0,s3
    80003134:	02813083          	ld	ra,40(sp)
    80003138:	02013403          	ld	s0,32(sp)
    8000313c:	01813483          	ld	s1,24(sp)
    80003140:	01013903          	ld	s2,16(sp)
    80003144:	00813983          	ld	s3,8(sp)
    80003148:	00013a03          	ld	s4,0(sp)
    8000314c:	03010113          	addi	sp,sp,48
    80003150:	00008067          	ret

0000000080003154 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003154:	ff010113          	addi	sp,sp,-16
    80003158:	00813423          	sd	s0,8(sp)
    8000315c:	01010413          	addi	s0,sp,16
    80003160:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003164:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003168:	0006c603          	lbu	a2,0(a3)
    8000316c:	fd06071b          	addiw	a4,a2,-48
    80003170:	0ff77713          	andi	a4,a4,255
    80003174:	00900793          	li	a5,9
    80003178:	02e7e063          	bltu	a5,a4,80003198 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000317c:	0025179b          	slliw	a5,a0,0x2
    80003180:	00a787bb          	addw	a5,a5,a0
    80003184:	0017979b          	slliw	a5,a5,0x1
    80003188:	00168693          	addi	a3,a3,1
    8000318c:	00c787bb          	addw	a5,a5,a2
    80003190:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003194:	fd5ff06f          	j	80003168 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003198:	00813403          	ld	s0,8(sp)
    8000319c:	01010113          	addi	sp,sp,16
    800031a0:	00008067          	ret

00000000800031a4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800031a4:	fc010113          	addi	sp,sp,-64
    800031a8:	02113c23          	sd	ra,56(sp)
    800031ac:	02813823          	sd	s0,48(sp)
    800031b0:	02913423          	sd	s1,40(sp)
    800031b4:	03213023          	sd	s2,32(sp)
    800031b8:	01313c23          	sd	s3,24(sp)
    800031bc:	04010413          	addi	s0,sp,64
    800031c0:	00050493          	mv	s1,a0
    800031c4:	00058913          	mv	s2,a1
    800031c8:	00060993          	mv	s3,a2
    LOCK();
    800031cc:	00100613          	li	a2,1
    800031d0:	00000593          	li	a1,0
    800031d4:	00004517          	auipc	a0,0x4
    800031d8:	38450513          	addi	a0,a0,900 # 80007558 <lockPrint>
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	1ac080e7          	jalr	428(ra) # 80001388 <copy_and_swap>
    800031e4:	00050863          	beqz	a0,800031f4 <_Z8printIntiii+0x50>
    800031e8:	ffffe097          	auipc	ra,0xffffe
    800031ec:	570080e7          	jalr	1392(ra) # 80001758 <_Z15thread_dispatchv>
    800031f0:	fddff06f          	j	800031cc <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800031f4:	00098463          	beqz	s3,800031fc <_Z8printIntiii+0x58>
    800031f8:	0804c463          	bltz	s1,80003280 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800031fc:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003200:	00000593          	li	a1,0
    }

    i = 0;
    80003204:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003208:	0009079b          	sext.w	a5,s2
    8000320c:	0325773b          	remuw	a4,a0,s2
    80003210:	00048613          	mv	a2,s1
    80003214:	0014849b          	addiw	s1,s1,1
    80003218:	02071693          	slli	a3,a4,0x20
    8000321c:	0206d693          	srli	a3,a3,0x20
    80003220:	00004717          	auipc	a4,0x4
    80003224:	27870713          	addi	a4,a4,632 # 80007498 <digits>
    80003228:	00d70733          	add	a4,a4,a3
    8000322c:	00074683          	lbu	a3,0(a4)
    80003230:	fd040713          	addi	a4,s0,-48
    80003234:	00c70733          	add	a4,a4,a2
    80003238:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000323c:	0005071b          	sext.w	a4,a0
    80003240:	0325553b          	divuw	a0,a0,s2
    80003244:	fcf772e3          	bgeu	a4,a5,80003208 <_Z8printIntiii+0x64>
    if(neg)
    80003248:	00058c63          	beqz	a1,80003260 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    8000324c:	fd040793          	addi	a5,s0,-48
    80003250:	009784b3          	add	s1,a5,s1
    80003254:	02d00793          	li	a5,45
    80003258:	fef48823          	sb	a5,-16(s1)
    8000325c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003260:	fff4849b          	addiw	s1,s1,-1
    80003264:	0204c463          	bltz	s1,8000328c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80003268:	fd040793          	addi	a5,s0,-48
    8000326c:	009787b3          	add	a5,a5,s1
    80003270:	ff07c503          	lbu	a0,-16(a5)
    80003274:	ffffe097          	auipc	ra,0xffffe
    80003278:	550080e7          	jalr	1360(ra) # 800017c4 <_Z4putcc>
    8000327c:	fe5ff06f          	j	80003260 <_Z8printIntiii+0xbc>
        x = -xx;
    80003280:	4090053b          	negw	a0,s1
        neg = 1;
    80003284:	00100593          	li	a1,1
        x = -xx;
    80003288:	f7dff06f          	j	80003204 <_Z8printIntiii+0x60>

    UNLOCK();
    8000328c:	00000613          	li	a2,0
    80003290:	00100593          	li	a1,1
    80003294:	00004517          	auipc	a0,0x4
    80003298:	2c450513          	addi	a0,a0,708 # 80007558 <lockPrint>
    8000329c:	ffffe097          	auipc	ra,0xffffe
    800032a0:	0ec080e7          	jalr	236(ra) # 80001388 <copy_and_swap>
    800032a4:	fe0514e3          	bnez	a0,8000328c <_Z8printIntiii+0xe8>
    800032a8:	03813083          	ld	ra,56(sp)
    800032ac:	03013403          	ld	s0,48(sp)
    800032b0:	02813483          	ld	s1,40(sp)
    800032b4:	02013903          	ld	s2,32(sp)
    800032b8:	01813983          	ld	s3,24(sp)
    800032bc:	04010113          	addi	sp,sp,64
    800032c0:	00008067          	ret

00000000800032c4 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800032c4:	fe010113          	addi	sp,sp,-32
    800032c8:	00113c23          	sd	ra,24(sp)
    800032cc:	00813823          	sd	s0,16(sp)
    800032d0:	00913423          	sd	s1,8(sp)
    800032d4:	01213023          	sd	s2,0(sp)
    800032d8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800032dc:	00003517          	auipc	a0,0x3
    800032e0:	f4c50513          	addi	a0,a0,-180 # 80006228 <CONSOLE_STATUS+0x218>
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	d10080e7          	jalr	-752(ra) # 80002ff4 <_Z11printStringPKc>
    int test = getc() - '0';
    800032ec:	ffffe097          	auipc	ra,0xffffe
    800032f0:	4b0080e7          	jalr	1200(ra) # 8000179c <_Z4getcv>
    800032f4:	0005091b          	sext.w	s2,a0
    800032f8:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	4a0080e7          	jalr	1184(ra) # 8000179c <_Z4getcv>
            printString("Nije navedeno da je zadatak 2 implementiran\n");
            return;
        }
    }

    if (test >= 3 && test <= 4) {
    80003304:	fcd9071b          	addiw	a4,s2,-51
    80003308:	00100793          	li	a5,1
    8000330c:	04e7f663          	bgeu	a5,a4,80003358 <_Z8userMainv+0x94>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80003310:	fcb9091b          	addiw	s2,s2,-53
    80003314:	00100793          	li	a5,1
    80003318:	0727f463          	bgeu	a5,s2,80003380 <_Z8userMainv+0xbc>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000331c:	00600793          	li	a5,6
    80003320:	0697ca63          	blt	a5,s1,80003394 <_Z8userMainv+0xd0>
    80003324:	00300793          	li	a5,3
    80003328:	04f4d063          	bge	s1,a5,80003368 <_Z8userMainv+0xa4>
    8000332c:	00100793          	li	a5,1
    80003330:	08f48c63          	beq	s1,a5,800033c8 <_Z8userMainv+0x104>
    80003334:	00200793          	li	a5,2
    80003338:	0af49663          	bne	s1,a5,800033e4 <_Z8userMainv+0x120>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
#endif
            break;
        case 2:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_CPP_API_test();
    8000333c:	fffff097          	auipc	ra,0xfffff
    80003340:	220080e7          	jalr	544(ra) # 8000255c <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80003344:	00003517          	auipc	a0,0x3
    80003348:	fa450513          	addi	a0,a0,-92 # 800062e8 <CONSOLE_STATUS+0x2d8>
    8000334c:	00000097          	auipc	ra,0x0
    80003350:	ca8080e7          	jalr	-856(ra) # 80002ff4 <_Z11printStringPKc>
#endif
            break;
    80003354:	0140006f          	j	80003368 <_Z8userMainv+0xa4>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
    80003358:	00003517          	auipc	a0,0x3
    8000335c:	ef050513          	addi	a0,a0,-272 # 80006248 <CONSOLE_STATUS+0x238>
    80003360:	00000097          	auipc	ra,0x0
    80003364:	c94080e7          	jalr	-876(ra) # 80002ff4 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80003368:	01813083          	ld	ra,24(sp)
    8000336c:	01013403          	ld	s0,16(sp)
    80003370:	00813483          	ld	s1,8(sp)
    80003374:	00013903          	ld	s2,0(sp)
    80003378:	02010113          	addi	sp,sp,32
    8000337c:	00008067          	ret
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80003380:	00003517          	auipc	a0,0x3
    80003384:	ef850513          	addi	a0,a0,-264 # 80006278 <CONSOLE_STATUS+0x268>
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	c6c080e7          	jalr	-916(ra) # 80002ff4 <_Z11printStringPKc>
            return;
    80003390:	fd9ff06f          	j	80003368 <_Z8userMainv+0xa4>
    switch (test) {
    80003394:	00700793          	li	a5,7
    80003398:	04f49663          	bne	s1,a5,800033e4 <_Z8userMainv+0x120>
            System_Mode_test();
    8000339c:	00000097          	auipc	ra,0x0
    800033a0:	548080e7          	jalr	1352(ra) # 800038e4 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800033a4:	00003517          	auipc	a0,0x3
    800033a8:	f8450513          	addi	a0,a0,-124 # 80006328 <CONSOLE_STATUS+0x318>
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	c48080e7          	jalr	-952(ra) # 80002ff4 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800033b4:	00003517          	auipc	a0,0x3
    800033b8:	f9450513          	addi	a0,a0,-108 # 80006348 <CONSOLE_STATUS+0x338>
    800033bc:	00000097          	auipc	ra,0x0
    800033c0:	c38080e7          	jalr	-968(ra) # 80002ff4 <_Z11printStringPKc>
            break;
    800033c4:	fa5ff06f          	j	80003368 <_Z8userMainv+0xa4>
            Threads_C_API_test();
    800033c8:	00000097          	auipc	ra,0x0
    800033cc:	b30080e7          	jalr	-1232(ra) # 80002ef8 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800033d0:	00003517          	auipc	a0,0x3
    800033d4:	ed850513          	addi	a0,a0,-296 # 800062a8 <CONSOLE_STATUS+0x298>
    800033d8:	00000097          	auipc	ra,0x0
    800033dc:	c1c080e7          	jalr	-996(ra) # 80002ff4 <_Z11printStringPKc>
            break;
    800033e0:	f89ff06f          	j	80003368 <_Z8userMainv+0xa4>
            printString("Niste uneli odgovarajuci broj za test\n");
    800033e4:	00003517          	auipc	a0,0x3
    800033e8:	fbc50513          	addi	a0,a0,-68 # 800063a0 <CONSOLE_STATUS+0x390>
    800033ec:	00000097          	auipc	ra,0x0
    800033f0:	c08080e7          	jalr	-1016(ra) # 80002ff4 <_Z11printStringPKc>
    800033f4:	f75ff06f          	j	80003368 <_Z8userMainv+0xa4>

00000000800033f8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800033f8:	fe010113          	addi	sp,sp,-32
    800033fc:	00113c23          	sd	ra,24(sp)
    80003400:	00813823          	sd	s0,16(sp)
    80003404:	00913423          	sd	s1,8(sp)
    80003408:	01213023          	sd	s2,0(sp)
    8000340c:	02010413          	addi	s0,sp,32
    80003410:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003414:	00100793          	li	a5,1
    80003418:	02a7f863          	bgeu	a5,a0,80003448 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000341c:	00a00793          	li	a5,10
    80003420:	02f577b3          	remu	a5,a0,a5
    80003424:	02078e63          	beqz	a5,80003460 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003428:	fff48513          	addi	a0,s1,-1
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	fcc080e7          	jalr	-52(ra) # 800033f8 <_ZL9fibonaccim>
    80003434:	00050913          	mv	s2,a0
    80003438:	ffe48513          	addi	a0,s1,-2
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	fbc080e7          	jalr	-68(ra) # 800033f8 <_ZL9fibonaccim>
    80003444:	00a90533          	add	a0,s2,a0
}
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	00813483          	ld	s1,8(sp)
    80003454:	00013903          	ld	s2,0(sp)
    80003458:	02010113          	addi	sp,sp,32
    8000345c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003460:	ffffe097          	auipc	ra,0xffffe
    80003464:	2f8080e7          	jalr	760(ra) # 80001758 <_Z15thread_dispatchv>
    80003468:	fc1ff06f          	j	80003428 <_ZL9fibonaccim+0x30>

000000008000346c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000346c:	fe010113          	addi	sp,sp,-32
    80003470:	00113c23          	sd	ra,24(sp)
    80003474:	00813823          	sd	s0,16(sp)
    80003478:	00913423          	sd	s1,8(sp)
    8000347c:	01213023          	sd	s2,0(sp)
    80003480:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003484:	00a00493          	li	s1,10
    80003488:	0400006f          	j	800034c8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000348c:	00003517          	auipc	a0,0x3
    80003490:	d0450513          	addi	a0,a0,-764 # 80006190 <CONSOLE_STATUS+0x180>
    80003494:	00000097          	auipc	ra,0x0
    80003498:	b60080e7          	jalr	-1184(ra) # 80002ff4 <_Z11printStringPKc>
    8000349c:	00000613          	li	a2,0
    800034a0:	00a00593          	li	a1,10
    800034a4:	00048513          	mv	a0,s1
    800034a8:	00000097          	auipc	ra,0x0
    800034ac:	cfc080e7          	jalr	-772(ra) # 800031a4 <_Z8printIntiii>
    800034b0:	00003517          	auipc	a0,0x3
    800034b4:	02850513          	addi	a0,a0,40 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800034b8:	00000097          	auipc	ra,0x0
    800034bc:	b3c080e7          	jalr	-1220(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800034c0:	0014849b          	addiw	s1,s1,1
    800034c4:	0ff4f493          	andi	s1,s1,255
    800034c8:	00c00793          	li	a5,12
    800034cc:	fc97f0e3          	bgeu	a5,s1,8000348c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800034d0:	00003517          	auipc	a0,0x3
    800034d4:	cc850513          	addi	a0,a0,-824 # 80006198 <CONSOLE_STATUS+0x188>
    800034d8:	00000097          	auipc	ra,0x0
    800034dc:	b1c080e7          	jalr	-1252(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800034e0:	00500313          	li	t1,5
    thread_dispatch();
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	274080e7          	jalr	628(ra) # 80001758 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800034ec:	01000513          	li	a0,16
    800034f0:	00000097          	auipc	ra,0x0
    800034f4:	f08080e7          	jalr	-248(ra) # 800033f8 <_ZL9fibonaccim>
    800034f8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800034fc:	00003517          	auipc	a0,0x3
    80003500:	cac50513          	addi	a0,a0,-852 # 800061a8 <CONSOLE_STATUS+0x198>
    80003504:	00000097          	auipc	ra,0x0
    80003508:	af0080e7          	jalr	-1296(ra) # 80002ff4 <_Z11printStringPKc>
    8000350c:	00000613          	li	a2,0
    80003510:	00a00593          	li	a1,10
    80003514:	0009051b          	sext.w	a0,s2
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	c8c080e7          	jalr	-884(ra) # 800031a4 <_Z8printIntiii>
    80003520:	00003517          	auipc	a0,0x3
    80003524:	fb850513          	addi	a0,a0,-72 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003528:	00000097          	auipc	ra,0x0
    8000352c:	acc080e7          	jalr	-1332(ra) # 80002ff4 <_Z11printStringPKc>
    80003530:	0400006f          	j	80003570 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003534:	00003517          	auipc	a0,0x3
    80003538:	c5c50513          	addi	a0,a0,-932 # 80006190 <CONSOLE_STATUS+0x180>
    8000353c:	00000097          	auipc	ra,0x0
    80003540:	ab8080e7          	jalr	-1352(ra) # 80002ff4 <_Z11printStringPKc>
    80003544:	00000613          	li	a2,0
    80003548:	00a00593          	li	a1,10
    8000354c:	00048513          	mv	a0,s1
    80003550:	00000097          	auipc	ra,0x0
    80003554:	c54080e7          	jalr	-940(ra) # 800031a4 <_Z8printIntiii>
    80003558:	00003517          	auipc	a0,0x3
    8000355c:	f8050513          	addi	a0,a0,-128 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003560:	00000097          	auipc	ra,0x0
    80003564:	a94080e7          	jalr	-1388(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003568:	0014849b          	addiw	s1,s1,1
    8000356c:	0ff4f493          	andi	s1,s1,255
    80003570:	00f00793          	li	a5,15
    80003574:	fc97f0e3          	bgeu	a5,s1,80003534 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003578:	00003517          	auipc	a0,0x3
    8000357c:	c4050513          	addi	a0,a0,-960 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80003580:	00000097          	auipc	ra,0x0
    80003584:	a74080e7          	jalr	-1420(ra) # 80002ff4 <_Z11printStringPKc>
    finishedD = true;
    80003588:	00100793          	li	a5,1
    8000358c:	00004717          	auipc	a4,0x4
    80003590:	fcf70a23          	sb	a5,-44(a4) # 80007560 <_ZL9finishedD>
    thread_dispatch();
    80003594:	ffffe097          	auipc	ra,0xffffe
    80003598:	1c4080e7          	jalr	452(ra) # 80001758 <_Z15thread_dispatchv>
}
    8000359c:	01813083          	ld	ra,24(sp)
    800035a0:	01013403          	ld	s0,16(sp)
    800035a4:	00813483          	ld	s1,8(sp)
    800035a8:	00013903          	ld	s2,0(sp)
    800035ac:	02010113          	addi	sp,sp,32
    800035b0:	00008067          	ret

00000000800035b4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800035b4:	fe010113          	addi	sp,sp,-32
    800035b8:	00113c23          	sd	ra,24(sp)
    800035bc:	00813823          	sd	s0,16(sp)
    800035c0:	00913423          	sd	s1,8(sp)
    800035c4:	01213023          	sd	s2,0(sp)
    800035c8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800035cc:	00000493          	li	s1,0
    800035d0:	0400006f          	j	80003610 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800035d4:	00003517          	auipc	a0,0x3
    800035d8:	b8c50513          	addi	a0,a0,-1140 # 80006160 <CONSOLE_STATUS+0x150>
    800035dc:	00000097          	auipc	ra,0x0
    800035e0:	a18080e7          	jalr	-1512(ra) # 80002ff4 <_Z11printStringPKc>
    800035e4:	00000613          	li	a2,0
    800035e8:	00a00593          	li	a1,10
    800035ec:	00048513          	mv	a0,s1
    800035f0:	00000097          	auipc	ra,0x0
    800035f4:	bb4080e7          	jalr	-1100(ra) # 800031a4 <_Z8printIntiii>
    800035f8:	00003517          	auipc	a0,0x3
    800035fc:	ee050513          	addi	a0,a0,-288 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003600:	00000097          	auipc	ra,0x0
    80003604:	9f4080e7          	jalr	-1548(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003608:	0014849b          	addiw	s1,s1,1
    8000360c:	0ff4f493          	andi	s1,s1,255
    80003610:	00200793          	li	a5,2
    80003614:	fc97f0e3          	bgeu	a5,s1,800035d4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003618:	00003517          	auipc	a0,0x3
    8000361c:	b5050513          	addi	a0,a0,-1200 # 80006168 <CONSOLE_STATUS+0x158>
    80003620:	00000097          	auipc	ra,0x0
    80003624:	9d4080e7          	jalr	-1580(ra) # 80002ff4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003628:	00700313          	li	t1,7
    thread_dispatch();
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	12c080e7          	jalr	300(ra) # 80001758 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003634:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003638:	00003517          	auipc	a0,0x3
    8000363c:	b4050513          	addi	a0,a0,-1216 # 80006178 <CONSOLE_STATUS+0x168>
    80003640:	00000097          	auipc	ra,0x0
    80003644:	9b4080e7          	jalr	-1612(ra) # 80002ff4 <_Z11printStringPKc>
    80003648:	00000613          	li	a2,0
    8000364c:	00a00593          	li	a1,10
    80003650:	0009051b          	sext.w	a0,s2
    80003654:	00000097          	auipc	ra,0x0
    80003658:	b50080e7          	jalr	-1200(ra) # 800031a4 <_Z8printIntiii>
    8000365c:	00003517          	auipc	a0,0x3
    80003660:	e7c50513          	addi	a0,a0,-388 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003664:	00000097          	auipc	ra,0x0
    80003668:	990080e7          	jalr	-1648(ra) # 80002ff4 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000366c:	00c00513          	li	a0,12
    80003670:	00000097          	auipc	ra,0x0
    80003674:	d88080e7          	jalr	-632(ra) # 800033f8 <_ZL9fibonaccim>
    80003678:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000367c:	00003517          	auipc	a0,0x3
    80003680:	b0450513          	addi	a0,a0,-1276 # 80006180 <CONSOLE_STATUS+0x170>
    80003684:	00000097          	auipc	ra,0x0
    80003688:	970080e7          	jalr	-1680(ra) # 80002ff4 <_Z11printStringPKc>
    8000368c:	00000613          	li	a2,0
    80003690:	00a00593          	li	a1,10
    80003694:	0009051b          	sext.w	a0,s2
    80003698:	00000097          	auipc	ra,0x0
    8000369c:	b0c080e7          	jalr	-1268(ra) # 800031a4 <_Z8printIntiii>
    800036a0:	00003517          	auipc	a0,0x3
    800036a4:	e3850513          	addi	a0,a0,-456 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800036a8:	00000097          	auipc	ra,0x0
    800036ac:	94c080e7          	jalr	-1716(ra) # 80002ff4 <_Z11printStringPKc>
    800036b0:	0400006f          	j	800036f0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800036b4:	00003517          	auipc	a0,0x3
    800036b8:	aac50513          	addi	a0,a0,-1364 # 80006160 <CONSOLE_STATUS+0x150>
    800036bc:	00000097          	auipc	ra,0x0
    800036c0:	938080e7          	jalr	-1736(ra) # 80002ff4 <_Z11printStringPKc>
    800036c4:	00000613          	li	a2,0
    800036c8:	00a00593          	li	a1,10
    800036cc:	00048513          	mv	a0,s1
    800036d0:	00000097          	auipc	ra,0x0
    800036d4:	ad4080e7          	jalr	-1324(ra) # 800031a4 <_Z8printIntiii>
    800036d8:	00003517          	auipc	a0,0x3
    800036dc:	e0050513          	addi	a0,a0,-512 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800036e0:	00000097          	auipc	ra,0x0
    800036e4:	914080e7          	jalr	-1772(ra) # 80002ff4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800036e8:	0014849b          	addiw	s1,s1,1
    800036ec:	0ff4f493          	andi	s1,s1,255
    800036f0:	00500793          	li	a5,5
    800036f4:	fc97f0e3          	bgeu	a5,s1,800036b4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800036f8:	00003517          	auipc	a0,0x3
    800036fc:	a4050513          	addi	a0,a0,-1472 # 80006138 <CONSOLE_STATUS+0x128>
    80003700:	00000097          	auipc	ra,0x0
    80003704:	8f4080e7          	jalr	-1804(ra) # 80002ff4 <_Z11printStringPKc>
    finishedC = true;
    80003708:	00100793          	li	a5,1
    8000370c:	00004717          	auipc	a4,0x4
    80003710:	e4f70aa3          	sb	a5,-427(a4) # 80007561 <_ZL9finishedC>
    thread_dispatch();
    80003714:	ffffe097          	auipc	ra,0xffffe
    80003718:	044080e7          	jalr	68(ra) # 80001758 <_Z15thread_dispatchv>
}
    8000371c:	01813083          	ld	ra,24(sp)
    80003720:	01013403          	ld	s0,16(sp)
    80003724:	00813483          	ld	s1,8(sp)
    80003728:	00013903          	ld	s2,0(sp)
    8000372c:	02010113          	addi	sp,sp,32
    80003730:	00008067          	ret

0000000080003734 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003734:	fe010113          	addi	sp,sp,-32
    80003738:	00113c23          	sd	ra,24(sp)
    8000373c:	00813823          	sd	s0,16(sp)
    80003740:	00913423          	sd	s1,8(sp)
    80003744:	01213023          	sd	s2,0(sp)
    80003748:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000374c:	00000913          	li	s2,0
    80003750:	0400006f          	j	80003790 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80003754:	ffffe097          	auipc	ra,0xffffe
    80003758:	004080e7          	jalr	4(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000375c:	00148493          	addi	s1,s1,1
    80003760:	000027b7          	lui	a5,0x2
    80003764:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003768:	0097ee63          	bltu	a5,s1,80003784 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000376c:	00000713          	li	a4,0
    80003770:	000077b7          	lui	a5,0x7
    80003774:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003778:	fce7eee3          	bltu	a5,a4,80003754 <_ZL11workerBodyBPv+0x20>
    8000377c:	00170713          	addi	a4,a4,1
    80003780:	ff1ff06f          	j	80003770 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80003784:	00a00793          	li	a5,10
    80003788:	04f90663          	beq	s2,a5,800037d4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    8000378c:	00190913          	addi	s2,s2,1
    80003790:	00f00793          	li	a5,15
    80003794:	0527e463          	bltu	a5,s2,800037dc <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80003798:	00003517          	auipc	a0,0x3
    8000379c:	9b050513          	addi	a0,a0,-1616 # 80006148 <CONSOLE_STATUS+0x138>
    800037a0:	00000097          	auipc	ra,0x0
    800037a4:	854080e7          	jalr	-1964(ra) # 80002ff4 <_Z11printStringPKc>
    800037a8:	00000613          	li	a2,0
    800037ac:	00a00593          	li	a1,10
    800037b0:	0009051b          	sext.w	a0,s2
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	9f0080e7          	jalr	-1552(ra) # 800031a4 <_Z8printIntiii>
    800037bc:	00003517          	auipc	a0,0x3
    800037c0:	d1c50513          	addi	a0,a0,-740 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800037c4:	00000097          	auipc	ra,0x0
    800037c8:	830080e7          	jalr	-2000(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800037cc:	00000493          	li	s1,0
    800037d0:	f91ff06f          	j	80003760 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800037d4:	14102ff3          	csrr	t6,sepc
    800037d8:	fb5ff06f          	j	8000378c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800037dc:	00003517          	auipc	a0,0x3
    800037e0:	97450513          	addi	a0,a0,-1676 # 80006150 <CONSOLE_STATUS+0x140>
    800037e4:	00000097          	auipc	ra,0x0
    800037e8:	810080e7          	jalr	-2032(ra) # 80002ff4 <_Z11printStringPKc>
    finishedB = true;
    800037ec:	00100793          	li	a5,1
    800037f0:	00004717          	auipc	a4,0x4
    800037f4:	d6f70923          	sb	a5,-654(a4) # 80007562 <_ZL9finishedB>
    thread_dispatch();
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	f60080e7          	jalr	-160(ra) # 80001758 <_Z15thread_dispatchv>
}
    80003800:	01813083          	ld	ra,24(sp)
    80003804:	01013403          	ld	s0,16(sp)
    80003808:	00813483          	ld	s1,8(sp)
    8000380c:	00013903          	ld	s2,0(sp)
    80003810:	02010113          	addi	sp,sp,32
    80003814:	00008067          	ret

0000000080003818 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003818:	fe010113          	addi	sp,sp,-32
    8000381c:	00113c23          	sd	ra,24(sp)
    80003820:	00813823          	sd	s0,16(sp)
    80003824:	00913423          	sd	s1,8(sp)
    80003828:	01213023          	sd	s2,0(sp)
    8000382c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003830:	00000913          	li	s2,0
    80003834:	0380006f          	j	8000386c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	f20080e7          	jalr	-224(ra) # 80001758 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003840:	00148493          	addi	s1,s1,1
    80003844:	000027b7          	lui	a5,0x2
    80003848:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000384c:	0097ee63          	bltu	a5,s1,80003868 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003850:	00000713          	li	a4,0
    80003854:	000077b7          	lui	a5,0x7
    80003858:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000385c:	fce7eee3          	bltu	a5,a4,80003838 <_ZL11workerBodyAPv+0x20>
    80003860:	00170713          	addi	a4,a4,1
    80003864:	ff1ff06f          	j	80003854 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003868:	00190913          	addi	s2,s2,1
    8000386c:	00900793          	li	a5,9
    80003870:	0527e063          	bltu	a5,s2,800038b0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003874:	00003517          	auipc	a0,0x3
    80003878:	8bc50513          	addi	a0,a0,-1860 # 80006130 <CONSOLE_STATUS+0x120>
    8000387c:	fffff097          	auipc	ra,0xfffff
    80003880:	778080e7          	jalr	1912(ra) # 80002ff4 <_Z11printStringPKc>
    80003884:	00000613          	li	a2,0
    80003888:	00a00593          	li	a1,10
    8000388c:	0009051b          	sext.w	a0,s2
    80003890:	00000097          	auipc	ra,0x0
    80003894:	914080e7          	jalr	-1772(ra) # 800031a4 <_Z8printIntiii>
    80003898:	00003517          	auipc	a0,0x3
    8000389c:	c4050513          	addi	a0,a0,-960 # 800064d8 <CONSOLE_STATUS+0x4c8>
    800038a0:	fffff097          	auipc	ra,0xfffff
    800038a4:	754080e7          	jalr	1876(ra) # 80002ff4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800038a8:	00000493          	li	s1,0
    800038ac:	f99ff06f          	j	80003844 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800038b0:	00003517          	auipc	a0,0x3
    800038b4:	88850513          	addi	a0,a0,-1912 # 80006138 <CONSOLE_STATUS+0x128>
    800038b8:	fffff097          	auipc	ra,0xfffff
    800038bc:	73c080e7          	jalr	1852(ra) # 80002ff4 <_Z11printStringPKc>
    finishedA = true;
    800038c0:	00100793          	li	a5,1
    800038c4:	00004717          	auipc	a4,0x4
    800038c8:	c8f70fa3          	sb	a5,-865(a4) # 80007563 <_ZL9finishedA>
}
    800038cc:	01813083          	ld	ra,24(sp)
    800038d0:	01013403          	ld	s0,16(sp)
    800038d4:	00813483          	ld	s1,8(sp)
    800038d8:	00013903          	ld	s2,0(sp)
    800038dc:	02010113          	addi	sp,sp,32
    800038e0:	00008067          	ret

00000000800038e4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800038e4:	fd010113          	addi	sp,sp,-48
    800038e8:	02113423          	sd	ra,40(sp)
    800038ec:	02813023          	sd	s0,32(sp)
    800038f0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800038f4:	00000613          	li	a2,0
    800038f8:	00000597          	auipc	a1,0x0
    800038fc:	f2058593          	addi	a1,a1,-224 # 80003818 <_ZL11workerBodyAPv>
    80003900:	fd040513          	addi	a0,s0,-48
    80003904:	ffffe097          	auipc	ra,0xffffe
    80003908:	d34080e7          	jalr	-716(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000390c:	00003517          	auipc	a0,0x3
    80003910:	8bc50513          	addi	a0,a0,-1860 # 800061c8 <CONSOLE_STATUS+0x1b8>
    80003914:	fffff097          	auipc	ra,0xfffff
    80003918:	6e0080e7          	jalr	1760(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000391c:	00000613          	li	a2,0
    80003920:	00000597          	auipc	a1,0x0
    80003924:	e1458593          	addi	a1,a1,-492 # 80003734 <_ZL11workerBodyBPv>
    80003928:	fd840513          	addi	a0,s0,-40
    8000392c:	ffffe097          	auipc	ra,0xffffe
    80003930:	d0c080e7          	jalr	-756(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003934:	00003517          	auipc	a0,0x3
    80003938:	8ac50513          	addi	a0,a0,-1876 # 800061e0 <CONSOLE_STATUS+0x1d0>
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	6b8080e7          	jalr	1720(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003944:	00000613          	li	a2,0
    80003948:	00000597          	auipc	a1,0x0
    8000394c:	c6c58593          	addi	a1,a1,-916 # 800035b4 <_ZL11workerBodyCPv>
    80003950:	fe040513          	addi	a0,s0,-32
    80003954:	ffffe097          	auipc	ra,0xffffe
    80003958:	ce4080e7          	jalr	-796(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000395c:	00003517          	auipc	a0,0x3
    80003960:	89c50513          	addi	a0,a0,-1892 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80003964:	fffff097          	auipc	ra,0xfffff
    80003968:	690080e7          	jalr	1680(ra) # 80002ff4 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000396c:	00000613          	li	a2,0
    80003970:	00000597          	auipc	a1,0x0
    80003974:	afc58593          	addi	a1,a1,-1284 # 8000346c <_ZL11workerBodyDPv>
    80003978:	fe840513          	addi	a0,s0,-24
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	cbc080e7          	jalr	-836(ra) # 80001638 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003984:	00003517          	auipc	a0,0x3
    80003988:	88c50513          	addi	a0,a0,-1908 # 80006210 <CONSOLE_STATUS+0x200>
    8000398c:	fffff097          	auipc	ra,0xfffff
    80003990:	668080e7          	jalr	1640(ra) # 80002ff4 <_Z11printStringPKc>
    80003994:	00c0006f          	j	800039a0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003998:	ffffe097          	auipc	ra,0xffffe
    8000399c:	dc0080e7          	jalr	-576(ra) # 80001758 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800039a0:	00004797          	auipc	a5,0x4
    800039a4:	bc37c783          	lbu	a5,-1085(a5) # 80007563 <_ZL9finishedA>
    800039a8:	fe0788e3          	beqz	a5,80003998 <_Z16System_Mode_testv+0xb4>
    800039ac:	00004797          	auipc	a5,0x4
    800039b0:	bb67c783          	lbu	a5,-1098(a5) # 80007562 <_ZL9finishedB>
    800039b4:	fe0782e3          	beqz	a5,80003998 <_Z16System_Mode_testv+0xb4>
    800039b8:	00004797          	auipc	a5,0x4
    800039bc:	ba97c783          	lbu	a5,-1111(a5) # 80007561 <_ZL9finishedC>
    800039c0:	fc078ce3          	beqz	a5,80003998 <_Z16System_Mode_testv+0xb4>
    800039c4:	00004797          	auipc	a5,0x4
    800039c8:	b9c7c783          	lbu	a5,-1124(a5) # 80007560 <_ZL9finishedD>
    800039cc:	fc0786e3          	beqz	a5,80003998 <_Z16System_Mode_testv+0xb4>
    }

}
    800039d0:	02813083          	ld	ra,40(sp)
    800039d4:	02013403          	ld	s0,32(sp)
    800039d8:	03010113          	addi	sp,sp,48
    800039dc:	00008067          	ret

00000000800039e0 <start>:
    800039e0:	ff010113          	addi	sp,sp,-16
    800039e4:	00813423          	sd	s0,8(sp)
    800039e8:	01010413          	addi	s0,sp,16
    800039ec:	300027f3          	csrr	a5,mstatus
    800039f0:	ffffe737          	lui	a4,0xffffe
    800039f4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff602f>
    800039f8:	00e7f7b3          	and	a5,a5,a4
    800039fc:	00001737          	lui	a4,0x1
    80003a00:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003a04:	00e7e7b3          	or	a5,a5,a4
    80003a08:	30079073          	csrw	mstatus,a5
    80003a0c:	00000797          	auipc	a5,0x0
    80003a10:	16078793          	addi	a5,a5,352 # 80003b6c <system_main>
    80003a14:	34179073          	csrw	mepc,a5
    80003a18:	00000793          	li	a5,0
    80003a1c:	18079073          	csrw	satp,a5
    80003a20:	000107b7          	lui	a5,0x10
    80003a24:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003a28:	30279073          	csrw	medeleg,a5
    80003a2c:	30379073          	csrw	mideleg,a5
    80003a30:	104027f3          	csrr	a5,sie
    80003a34:	2227e793          	ori	a5,a5,546
    80003a38:	10479073          	csrw	sie,a5
    80003a3c:	fff00793          	li	a5,-1
    80003a40:	00a7d793          	srli	a5,a5,0xa
    80003a44:	3b079073          	csrw	pmpaddr0,a5
    80003a48:	00f00793          	li	a5,15
    80003a4c:	3a079073          	csrw	pmpcfg0,a5
    80003a50:	f14027f3          	csrr	a5,mhartid
    80003a54:	0200c737          	lui	a4,0x200c
    80003a58:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003a5c:	0007869b          	sext.w	a3,a5
    80003a60:	00269713          	slli	a4,a3,0x2
    80003a64:	000f4637          	lui	a2,0xf4
    80003a68:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003a6c:	00d70733          	add	a4,a4,a3
    80003a70:	0037979b          	slliw	a5,a5,0x3
    80003a74:	020046b7          	lui	a3,0x2004
    80003a78:	00d787b3          	add	a5,a5,a3
    80003a7c:	00c585b3          	add	a1,a1,a2
    80003a80:	00371693          	slli	a3,a4,0x3
    80003a84:	00004717          	auipc	a4,0x4
    80003a88:	aec70713          	addi	a4,a4,-1300 # 80007570 <timer_scratch>
    80003a8c:	00b7b023          	sd	a1,0(a5)
    80003a90:	00d70733          	add	a4,a4,a3
    80003a94:	00f73c23          	sd	a5,24(a4)
    80003a98:	02c73023          	sd	a2,32(a4)
    80003a9c:	34071073          	csrw	mscratch,a4
    80003aa0:	00000797          	auipc	a5,0x0
    80003aa4:	6e078793          	addi	a5,a5,1760 # 80004180 <timervec>
    80003aa8:	30579073          	csrw	mtvec,a5
    80003aac:	300027f3          	csrr	a5,mstatus
    80003ab0:	0087e793          	ori	a5,a5,8
    80003ab4:	30079073          	csrw	mstatus,a5
    80003ab8:	304027f3          	csrr	a5,mie
    80003abc:	0807e793          	ori	a5,a5,128
    80003ac0:	30479073          	csrw	mie,a5
    80003ac4:	f14027f3          	csrr	a5,mhartid
    80003ac8:	0007879b          	sext.w	a5,a5
    80003acc:	00078213          	mv	tp,a5
    80003ad0:	30200073          	mret
    80003ad4:	00813403          	ld	s0,8(sp)
    80003ad8:	01010113          	addi	sp,sp,16
    80003adc:	00008067          	ret

0000000080003ae0 <timerinit>:
    80003ae0:	ff010113          	addi	sp,sp,-16
    80003ae4:	00813423          	sd	s0,8(sp)
    80003ae8:	01010413          	addi	s0,sp,16
    80003aec:	f14027f3          	csrr	a5,mhartid
    80003af0:	0200c737          	lui	a4,0x200c
    80003af4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003af8:	0007869b          	sext.w	a3,a5
    80003afc:	00269713          	slli	a4,a3,0x2
    80003b00:	000f4637          	lui	a2,0xf4
    80003b04:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003b08:	00d70733          	add	a4,a4,a3
    80003b0c:	0037979b          	slliw	a5,a5,0x3
    80003b10:	020046b7          	lui	a3,0x2004
    80003b14:	00d787b3          	add	a5,a5,a3
    80003b18:	00c585b3          	add	a1,a1,a2
    80003b1c:	00371693          	slli	a3,a4,0x3
    80003b20:	00004717          	auipc	a4,0x4
    80003b24:	a5070713          	addi	a4,a4,-1456 # 80007570 <timer_scratch>
    80003b28:	00b7b023          	sd	a1,0(a5)
    80003b2c:	00d70733          	add	a4,a4,a3
    80003b30:	00f73c23          	sd	a5,24(a4)
    80003b34:	02c73023          	sd	a2,32(a4)
    80003b38:	34071073          	csrw	mscratch,a4
    80003b3c:	00000797          	auipc	a5,0x0
    80003b40:	64478793          	addi	a5,a5,1604 # 80004180 <timervec>
    80003b44:	30579073          	csrw	mtvec,a5
    80003b48:	300027f3          	csrr	a5,mstatus
    80003b4c:	0087e793          	ori	a5,a5,8
    80003b50:	30079073          	csrw	mstatus,a5
    80003b54:	304027f3          	csrr	a5,mie
    80003b58:	0807e793          	ori	a5,a5,128
    80003b5c:	30479073          	csrw	mie,a5
    80003b60:	00813403          	ld	s0,8(sp)
    80003b64:	01010113          	addi	sp,sp,16
    80003b68:	00008067          	ret

0000000080003b6c <system_main>:
    80003b6c:	fe010113          	addi	sp,sp,-32
    80003b70:	00813823          	sd	s0,16(sp)
    80003b74:	00913423          	sd	s1,8(sp)
    80003b78:	00113c23          	sd	ra,24(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    80003b80:	00000097          	auipc	ra,0x0
    80003b84:	0c4080e7          	jalr	196(ra) # 80003c44 <cpuid>
    80003b88:	00004497          	auipc	s1,0x4
    80003b8c:	97848493          	addi	s1,s1,-1672 # 80007500 <started>
    80003b90:	02050263          	beqz	a0,80003bb4 <system_main+0x48>
    80003b94:	0004a783          	lw	a5,0(s1)
    80003b98:	0007879b          	sext.w	a5,a5
    80003b9c:	fe078ce3          	beqz	a5,80003b94 <system_main+0x28>
    80003ba0:	0ff0000f          	fence
    80003ba4:	00003517          	auipc	a0,0x3
    80003ba8:	85450513          	addi	a0,a0,-1964 # 800063f8 <CONSOLE_STATUS+0x3e8>
    80003bac:	00001097          	auipc	ra,0x1
    80003bb0:	a70080e7          	jalr	-1424(ra) # 8000461c <panic>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	9c4080e7          	jalr	-1596(ra) # 80004578 <consoleinit>
    80003bbc:	00001097          	auipc	ra,0x1
    80003bc0:	150080e7          	jalr	336(ra) # 80004d0c <printfinit>
    80003bc4:	00003517          	auipc	a0,0x3
    80003bc8:	91450513          	addi	a0,a0,-1772 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003bcc:	00001097          	auipc	ra,0x1
    80003bd0:	aac080e7          	jalr	-1364(ra) # 80004678 <__printf>
    80003bd4:	00002517          	auipc	a0,0x2
    80003bd8:	7f450513          	addi	a0,a0,2036 # 800063c8 <CONSOLE_STATUS+0x3b8>
    80003bdc:	00001097          	auipc	ra,0x1
    80003be0:	a9c080e7          	jalr	-1380(ra) # 80004678 <__printf>
    80003be4:	00003517          	auipc	a0,0x3
    80003be8:	8f450513          	addi	a0,a0,-1804 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80003bec:	00001097          	auipc	ra,0x1
    80003bf0:	a8c080e7          	jalr	-1396(ra) # 80004678 <__printf>
    80003bf4:	00001097          	auipc	ra,0x1
    80003bf8:	4a4080e7          	jalr	1188(ra) # 80005098 <kinit>
    80003bfc:	00000097          	auipc	ra,0x0
    80003c00:	148080e7          	jalr	328(ra) # 80003d44 <trapinit>
    80003c04:	00000097          	auipc	ra,0x0
    80003c08:	16c080e7          	jalr	364(ra) # 80003d70 <trapinithart>
    80003c0c:	00000097          	auipc	ra,0x0
    80003c10:	5b4080e7          	jalr	1460(ra) # 800041c0 <plicinit>
    80003c14:	00000097          	auipc	ra,0x0
    80003c18:	5d4080e7          	jalr	1492(ra) # 800041e8 <plicinithart>
    80003c1c:	00000097          	auipc	ra,0x0
    80003c20:	078080e7          	jalr	120(ra) # 80003c94 <userinit>
    80003c24:	0ff0000f          	fence
    80003c28:	00100793          	li	a5,1
    80003c2c:	00002517          	auipc	a0,0x2
    80003c30:	7b450513          	addi	a0,a0,1972 # 800063e0 <CONSOLE_STATUS+0x3d0>
    80003c34:	00f4a023          	sw	a5,0(s1)
    80003c38:	00001097          	auipc	ra,0x1
    80003c3c:	a40080e7          	jalr	-1472(ra) # 80004678 <__printf>
    80003c40:	0000006f          	j	80003c40 <system_main+0xd4>

0000000080003c44 <cpuid>:
    80003c44:	ff010113          	addi	sp,sp,-16
    80003c48:	00813423          	sd	s0,8(sp)
    80003c4c:	01010413          	addi	s0,sp,16
    80003c50:	00020513          	mv	a0,tp
    80003c54:	00813403          	ld	s0,8(sp)
    80003c58:	0005051b          	sext.w	a0,a0
    80003c5c:	01010113          	addi	sp,sp,16
    80003c60:	00008067          	ret

0000000080003c64 <mycpu>:
    80003c64:	ff010113          	addi	sp,sp,-16
    80003c68:	00813423          	sd	s0,8(sp)
    80003c6c:	01010413          	addi	s0,sp,16
    80003c70:	00020793          	mv	a5,tp
    80003c74:	00813403          	ld	s0,8(sp)
    80003c78:	0007879b          	sext.w	a5,a5
    80003c7c:	00779793          	slli	a5,a5,0x7
    80003c80:	00005517          	auipc	a0,0x5
    80003c84:	92050513          	addi	a0,a0,-1760 # 800085a0 <cpus>
    80003c88:	00f50533          	add	a0,a0,a5
    80003c8c:	01010113          	addi	sp,sp,16
    80003c90:	00008067          	ret

0000000080003c94 <userinit>:
    80003c94:	ff010113          	addi	sp,sp,-16
    80003c98:	00813423          	sd	s0,8(sp)
    80003c9c:	01010413          	addi	s0,sp,16
    80003ca0:	00813403          	ld	s0,8(sp)
    80003ca4:	01010113          	addi	sp,sp,16
    80003ca8:	ffffe317          	auipc	t1,0xffffe
    80003cac:	d9830067          	jr	-616(t1) # 80001a40 <main>

0000000080003cb0 <either_copyout>:
    80003cb0:	ff010113          	addi	sp,sp,-16
    80003cb4:	00813023          	sd	s0,0(sp)
    80003cb8:	00113423          	sd	ra,8(sp)
    80003cbc:	01010413          	addi	s0,sp,16
    80003cc0:	02051663          	bnez	a0,80003cec <either_copyout+0x3c>
    80003cc4:	00058513          	mv	a0,a1
    80003cc8:	00060593          	mv	a1,a2
    80003ccc:	0006861b          	sext.w	a2,a3
    80003cd0:	00002097          	auipc	ra,0x2
    80003cd4:	c54080e7          	jalr	-940(ra) # 80005924 <__memmove>
    80003cd8:	00813083          	ld	ra,8(sp)
    80003cdc:	00013403          	ld	s0,0(sp)
    80003ce0:	00000513          	li	a0,0
    80003ce4:	01010113          	addi	sp,sp,16
    80003ce8:	00008067          	ret
    80003cec:	00002517          	auipc	a0,0x2
    80003cf0:	73450513          	addi	a0,a0,1844 # 80006420 <CONSOLE_STATUS+0x410>
    80003cf4:	00001097          	auipc	ra,0x1
    80003cf8:	928080e7          	jalr	-1752(ra) # 8000461c <panic>

0000000080003cfc <either_copyin>:
    80003cfc:	ff010113          	addi	sp,sp,-16
    80003d00:	00813023          	sd	s0,0(sp)
    80003d04:	00113423          	sd	ra,8(sp)
    80003d08:	01010413          	addi	s0,sp,16
    80003d0c:	02059463          	bnez	a1,80003d34 <either_copyin+0x38>
    80003d10:	00060593          	mv	a1,a2
    80003d14:	0006861b          	sext.w	a2,a3
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	c0c080e7          	jalr	-1012(ra) # 80005924 <__memmove>
    80003d20:	00813083          	ld	ra,8(sp)
    80003d24:	00013403          	ld	s0,0(sp)
    80003d28:	00000513          	li	a0,0
    80003d2c:	01010113          	addi	sp,sp,16
    80003d30:	00008067          	ret
    80003d34:	00002517          	auipc	a0,0x2
    80003d38:	71450513          	addi	a0,a0,1812 # 80006448 <CONSOLE_STATUS+0x438>
    80003d3c:	00001097          	auipc	ra,0x1
    80003d40:	8e0080e7          	jalr	-1824(ra) # 8000461c <panic>

0000000080003d44 <trapinit>:
    80003d44:	ff010113          	addi	sp,sp,-16
    80003d48:	00813423          	sd	s0,8(sp)
    80003d4c:	01010413          	addi	s0,sp,16
    80003d50:	00813403          	ld	s0,8(sp)
    80003d54:	00002597          	auipc	a1,0x2
    80003d58:	71c58593          	addi	a1,a1,1820 # 80006470 <CONSOLE_STATUS+0x460>
    80003d5c:	00005517          	auipc	a0,0x5
    80003d60:	8c450513          	addi	a0,a0,-1852 # 80008620 <tickslock>
    80003d64:	01010113          	addi	sp,sp,16
    80003d68:	00001317          	auipc	t1,0x1
    80003d6c:	5c030067          	jr	1472(t1) # 80005328 <initlock>

0000000080003d70 <trapinithart>:
    80003d70:	ff010113          	addi	sp,sp,-16
    80003d74:	00813423          	sd	s0,8(sp)
    80003d78:	01010413          	addi	s0,sp,16
    80003d7c:	00000797          	auipc	a5,0x0
    80003d80:	2f478793          	addi	a5,a5,756 # 80004070 <kernelvec>
    80003d84:	10579073          	csrw	stvec,a5
    80003d88:	00813403          	ld	s0,8(sp)
    80003d8c:	01010113          	addi	sp,sp,16
    80003d90:	00008067          	ret

0000000080003d94 <usertrap>:
    80003d94:	ff010113          	addi	sp,sp,-16
    80003d98:	00813423          	sd	s0,8(sp)
    80003d9c:	01010413          	addi	s0,sp,16
    80003da0:	00813403          	ld	s0,8(sp)
    80003da4:	01010113          	addi	sp,sp,16
    80003da8:	00008067          	ret

0000000080003dac <usertrapret>:
    80003dac:	ff010113          	addi	sp,sp,-16
    80003db0:	00813423          	sd	s0,8(sp)
    80003db4:	01010413          	addi	s0,sp,16
    80003db8:	00813403          	ld	s0,8(sp)
    80003dbc:	01010113          	addi	sp,sp,16
    80003dc0:	00008067          	ret

0000000080003dc4 <kerneltrap>:
    80003dc4:	fe010113          	addi	sp,sp,-32
    80003dc8:	00813823          	sd	s0,16(sp)
    80003dcc:	00113c23          	sd	ra,24(sp)
    80003dd0:	00913423          	sd	s1,8(sp)
    80003dd4:	02010413          	addi	s0,sp,32
    80003dd8:	142025f3          	csrr	a1,scause
    80003ddc:	100027f3          	csrr	a5,sstatus
    80003de0:	0027f793          	andi	a5,a5,2
    80003de4:	10079c63          	bnez	a5,80003efc <kerneltrap+0x138>
    80003de8:	142027f3          	csrr	a5,scause
    80003dec:	0207ce63          	bltz	a5,80003e28 <kerneltrap+0x64>
    80003df0:	00002517          	auipc	a0,0x2
    80003df4:	6c850513          	addi	a0,a0,1736 # 800064b8 <CONSOLE_STATUS+0x4a8>
    80003df8:	00001097          	auipc	ra,0x1
    80003dfc:	880080e7          	jalr	-1920(ra) # 80004678 <__printf>
    80003e00:	141025f3          	csrr	a1,sepc
    80003e04:	14302673          	csrr	a2,stval
    80003e08:	00002517          	auipc	a0,0x2
    80003e0c:	6c050513          	addi	a0,a0,1728 # 800064c8 <CONSOLE_STATUS+0x4b8>
    80003e10:	00001097          	auipc	ra,0x1
    80003e14:	868080e7          	jalr	-1944(ra) # 80004678 <__printf>
    80003e18:	00002517          	auipc	a0,0x2
    80003e1c:	6c850513          	addi	a0,a0,1736 # 800064e0 <CONSOLE_STATUS+0x4d0>
    80003e20:	00000097          	auipc	ra,0x0
    80003e24:	7fc080e7          	jalr	2044(ra) # 8000461c <panic>
    80003e28:	0ff7f713          	andi	a4,a5,255
    80003e2c:	00900693          	li	a3,9
    80003e30:	04d70063          	beq	a4,a3,80003e70 <kerneltrap+0xac>
    80003e34:	fff00713          	li	a4,-1
    80003e38:	03f71713          	slli	a4,a4,0x3f
    80003e3c:	00170713          	addi	a4,a4,1
    80003e40:	fae798e3          	bne	a5,a4,80003df0 <kerneltrap+0x2c>
    80003e44:	00000097          	auipc	ra,0x0
    80003e48:	e00080e7          	jalr	-512(ra) # 80003c44 <cpuid>
    80003e4c:	06050663          	beqz	a0,80003eb8 <kerneltrap+0xf4>
    80003e50:	144027f3          	csrr	a5,sip
    80003e54:	ffd7f793          	andi	a5,a5,-3
    80003e58:	14479073          	csrw	sip,a5
    80003e5c:	01813083          	ld	ra,24(sp)
    80003e60:	01013403          	ld	s0,16(sp)
    80003e64:	00813483          	ld	s1,8(sp)
    80003e68:	02010113          	addi	sp,sp,32
    80003e6c:	00008067          	ret
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	3c4080e7          	jalr	964(ra) # 80004234 <plic_claim>
    80003e78:	00a00793          	li	a5,10
    80003e7c:	00050493          	mv	s1,a0
    80003e80:	06f50863          	beq	a0,a5,80003ef0 <kerneltrap+0x12c>
    80003e84:	fc050ce3          	beqz	a0,80003e5c <kerneltrap+0x98>
    80003e88:	00050593          	mv	a1,a0
    80003e8c:	00002517          	auipc	a0,0x2
    80003e90:	60c50513          	addi	a0,a0,1548 # 80006498 <CONSOLE_STATUS+0x488>
    80003e94:	00000097          	auipc	ra,0x0
    80003e98:	7e4080e7          	jalr	2020(ra) # 80004678 <__printf>
    80003e9c:	01013403          	ld	s0,16(sp)
    80003ea0:	01813083          	ld	ra,24(sp)
    80003ea4:	00048513          	mv	a0,s1
    80003ea8:	00813483          	ld	s1,8(sp)
    80003eac:	02010113          	addi	sp,sp,32
    80003eb0:	00000317          	auipc	t1,0x0
    80003eb4:	3bc30067          	jr	956(t1) # 8000426c <plic_complete>
    80003eb8:	00004517          	auipc	a0,0x4
    80003ebc:	76850513          	addi	a0,a0,1896 # 80008620 <tickslock>
    80003ec0:	00001097          	auipc	ra,0x1
    80003ec4:	48c080e7          	jalr	1164(ra) # 8000534c <acquire>
    80003ec8:	00003717          	auipc	a4,0x3
    80003ecc:	63c70713          	addi	a4,a4,1596 # 80007504 <ticks>
    80003ed0:	00072783          	lw	a5,0(a4)
    80003ed4:	00004517          	auipc	a0,0x4
    80003ed8:	74c50513          	addi	a0,a0,1868 # 80008620 <tickslock>
    80003edc:	0017879b          	addiw	a5,a5,1
    80003ee0:	00f72023          	sw	a5,0(a4)
    80003ee4:	00001097          	auipc	ra,0x1
    80003ee8:	534080e7          	jalr	1332(ra) # 80005418 <release>
    80003eec:	f65ff06f          	j	80003e50 <kerneltrap+0x8c>
    80003ef0:	00001097          	auipc	ra,0x1
    80003ef4:	090080e7          	jalr	144(ra) # 80004f80 <uartintr>
    80003ef8:	fa5ff06f          	j	80003e9c <kerneltrap+0xd8>
    80003efc:	00002517          	auipc	a0,0x2
    80003f00:	57c50513          	addi	a0,a0,1404 # 80006478 <CONSOLE_STATUS+0x468>
    80003f04:	00000097          	auipc	ra,0x0
    80003f08:	718080e7          	jalr	1816(ra) # 8000461c <panic>

0000000080003f0c <clockintr>:
    80003f0c:	fe010113          	addi	sp,sp,-32
    80003f10:	00813823          	sd	s0,16(sp)
    80003f14:	00913423          	sd	s1,8(sp)
    80003f18:	00113c23          	sd	ra,24(sp)
    80003f1c:	02010413          	addi	s0,sp,32
    80003f20:	00004497          	auipc	s1,0x4
    80003f24:	70048493          	addi	s1,s1,1792 # 80008620 <tickslock>
    80003f28:	00048513          	mv	a0,s1
    80003f2c:	00001097          	auipc	ra,0x1
    80003f30:	420080e7          	jalr	1056(ra) # 8000534c <acquire>
    80003f34:	00003717          	auipc	a4,0x3
    80003f38:	5d070713          	addi	a4,a4,1488 # 80007504 <ticks>
    80003f3c:	00072783          	lw	a5,0(a4)
    80003f40:	01013403          	ld	s0,16(sp)
    80003f44:	01813083          	ld	ra,24(sp)
    80003f48:	00048513          	mv	a0,s1
    80003f4c:	0017879b          	addiw	a5,a5,1
    80003f50:	00813483          	ld	s1,8(sp)
    80003f54:	00f72023          	sw	a5,0(a4)
    80003f58:	02010113          	addi	sp,sp,32
    80003f5c:	00001317          	auipc	t1,0x1
    80003f60:	4bc30067          	jr	1212(t1) # 80005418 <release>

0000000080003f64 <devintr>:
    80003f64:	142027f3          	csrr	a5,scause
    80003f68:	00000513          	li	a0,0
    80003f6c:	0007c463          	bltz	a5,80003f74 <devintr+0x10>
    80003f70:	00008067          	ret
    80003f74:	fe010113          	addi	sp,sp,-32
    80003f78:	00813823          	sd	s0,16(sp)
    80003f7c:	00113c23          	sd	ra,24(sp)
    80003f80:	00913423          	sd	s1,8(sp)
    80003f84:	02010413          	addi	s0,sp,32
    80003f88:	0ff7f713          	andi	a4,a5,255
    80003f8c:	00900693          	li	a3,9
    80003f90:	04d70c63          	beq	a4,a3,80003fe8 <devintr+0x84>
    80003f94:	fff00713          	li	a4,-1
    80003f98:	03f71713          	slli	a4,a4,0x3f
    80003f9c:	00170713          	addi	a4,a4,1
    80003fa0:	00e78c63          	beq	a5,a4,80003fb8 <devintr+0x54>
    80003fa4:	01813083          	ld	ra,24(sp)
    80003fa8:	01013403          	ld	s0,16(sp)
    80003fac:	00813483          	ld	s1,8(sp)
    80003fb0:	02010113          	addi	sp,sp,32
    80003fb4:	00008067          	ret
    80003fb8:	00000097          	auipc	ra,0x0
    80003fbc:	c8c080e7          	jalr	-884(ra) # 80003c44 <cpuid>
    80003fc0:	06050663          	beqz	a0,8000402c <devintr+0xc8>
    80003fc4:	144027f3          	csrr	a5,sip
    80003fc8:	ffd7f793          	andi	a5,a5,-3
    80003fcc:	14479073          	csrw	sip,a5
    80003fd0:	01813083          	ld	ra,24(sp)
    80003fd4:	01013403          	ld	s0,16(sp)
    80003fd8:	00813483          	ld	s1,8(sp)
    80003fdc:	00200513          	li	a0,2
    80003fe0:	02010113          	addi	sp,sp,32
    80003fe4:	00008067          	ret
    80003fe8:	00000097          	auipc	ra,0x0
    80003fec:	24c080e7          	jalr	588(ra) # 80004234 <plic_claim>
    80003ff0:	00a00793          	li	a5,10
    80003ff4:	00050493          	mv	s1,a0
    80003ff8:	06f50663          	beq	a0,a5,80004064 <devintr+0x100>
    80003ffc:	00100513          	li	a0,1
    80004000:	fa0482e3          	beqz	s1,80003fa4 <devintr+0x40>
    80004004:	00048593          	mv	a1,s1
    80004008:	00002517          	auipc	a0,0x2
    8000400c:	49050513          	addi	a0,a0,1168 # 80006498 <CONSOLE_STATUS+0x488>
    80004010:	00000097          	auipc	ra,0x0
    80004014:	668080e7          	jalr	1640(ra) # 80004678 <__printf>
    80004018:	00048513          	mv	a0,s1
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	250080e7          	jalr	592(ra) # 8000426c <plic_complete>
    80004024:	00100513          	li	a0,1
    80004028:	f7dff06f          	j	80003fa4 <devintr+0x40>
    8000402c:	00004517          	auipc	a0,0x4
    80004030:	5f450513          	addi	a0,a0,1524 # 80008620 <tickslock>
    80004034:	00001097          	auipc	ra,0x1
    80004038:	318080e7          	jalr	792(ra) # 8000534c <acquire>
    8000403c:	00003717          	auipc	a4,0x3
    80004040:	4c870713          	addi	a4,a4,1224 # 80007504 <ticks>
    80004044:	00072783          	lw	a5,0(a4)
    80004048:	00004517          	auipc	a0,0x4
    8000404c:	5d850513          	addi	a0,a0,1496 # 80008620 <tickslock>
    80004050:	0017879b          	addiw	a5,a5,1
    80004054:	00f72023          	sw	a5,0(a4)
    80004058:	00001097          	auipc	ra,0x1
    8000405c:	3c0080e7          	jalr	960(ra) # 80005418 <release>
    80004060:	f65ff06f          	j	80003fc4 <devintr+0x60>
    80004064:	00001097          	auipc	ra,0x1
    80004068:	f1c080e7          	jalr	-228(ra) # 80004f80 <uartintr>
    8000406c:	fadff06f          	j	80004018 <devintr+0xb4>

0000000080004070 <kernelvec>:
    80004070:	f0010113          	addi	sp,sp,-256
    80004074:	00113023          	sd	ra,0(sp)
    80004078:	00213423          	sd	sp,8(sp)
    8000407c:	00313823          	sd	gp,16(sp)
    80004080:	00413c23          	sd	tp,24(sp)
    80004084:	02513023          	sd	t0,32(sp)
    80004088:	02613423          	sd	t1,40(sp)
    8000408c:	02713823          	sd	t2,48(sp)
    80004090:	02813c23          	sd	s0,56(sp)
    80004094:	04913023          	sd	s1,64(sp)
    80004098:	04a13423          	sd	a0,72(sp)
    8000409c:	04b13823          	sd	a1,80(sp)
    800040a0:	04c13c23          	sd	a2,88(sp)
    800040a4:	06d13023          	sd	a3,96(sp)
    800040a8:	06e13423          	sd	a4,104(sp)
    800040ac:	06f13823          	sd	a5,112(sp)
    800040b0:	07013c23          	sd	a6,120(sp)
    800040b4:	09113023          	sd	a7,128(sp)
    800040b8:	09213423          	sd	s2,136(sp)
    800040bc:	09313823          	sd	s3,144(sp)
    800040c0:	09413c23          	sd	s4,152(sp)
    800040c4:	0b513023          	sd	s5,160(sp)
    800040c8:	0b613423          	sd	s6,168(sp)
    800040cc:	0b713823          	sd	s7,176(sp)
    800040d0:	0b813c23          	sd	s8,184(sp)
    800040d4:	0d913023          	sd	s9,192(sp)
    800040d8:	0da13423          	sd	s10,200(sp)
    800040dc:	0db13823          	sd	s11,208(sp)
    800040e0:	0dc13c23          	sd	t3,216(sp)
    800040e4:	0fd13023          	sd	t4,224(sp)
    800040e8:	0fe13423          	sd	t5,232(sp)
    800040ec:	0ff13823          	sd	t6,240(sp)
    800040f0:	cd5ff0ef          	jal	ra,80003dc4 <kerneltrap>
    800040f4:	00013083          	ld	ra,0(sp)
    800040f8:	00813103          	ld	sp,8(sp)
    800040fc:	01013183          	ld	gp,16(sp)
    80004100:	02013283          	ld	t0,32(sp)
    80004104:	02813303          	ld	t1,40(sp)
    80004108:	03013383          	ld	t2,48(sp)
    8000410c:	03813403          	ld	s0,56(sp)
    80004110:	04013483          	ld	s1,64(sp)
    80004114:	04813503          	ld	a0,72(sp)
    80004118:	05013583          	ld	a1,80(sp)
    8000411c:	05813603          	ld	a2,88(sp)
    80004120:	06013683          	ld	a3,96(sp)
    80004124:	06813703          	ld	a4,104(sp)
    80004128:	07013783          	ld	a5,112(sp)
    8000412c:	07813803          	ld	a6,120(sp)
    80004130:	08013883          	ld	a7,128(sp)
    80004134:	08813903          	ld	s2,136(sp)
    80004138:	09013983          	ld	s3,144(sp)
    8000413c:	09813a03          	ld	s4,152(sp)
    80004140:	0a013a83          	ld	s5,160(sp)
    80004144:	0a813b03          	ld	s6,168(sp)
    80004148:	0b013b83          	ld	s7,176(sp)
    8000414c:	0b813c03          	ld	s8,184(sp)
    80004150:	0c013c83          	ld	s9,192(sp)
    80004154:	0c813d03          	ld	s10,200(sp)
    80004158:	0d013d83          	ld	s11,208(sp)
    8000415c:	0d813e03          	ld	t3,216(sp)
    80004160:	0e013e83          	ld	t4,224(sp)
    80004164:	0e813f03          	ld	t5,232(sp)
    80004168:	0f013f83          	ld	t6,240(sp)
    8000416c:	10010113          	addi	sp,sp,256
    80004170:	10200073          	sret
    80004174:	00000013          	nop
    80004178:	00000013          	nop
    8000417c:	00000013          	nop

0000000080004180 <timervec>:
    80004180:	34051573          	csrrw	a0,mscratch,a0
    80004184:	00b53023          	sd	a1,0(a0)
    80004188:	00c53423          	sd	a2,8(a0)
    8000418c:	00d53823          	sd	a3,16(a0)
    80004190:	01853583          	ld	a1,24(a0)
    80004194:	02053603          	ld	a2,32(a0)
    80004198:	0005b683          	ld	a3,0(a1)
    8000419c:	00c686b3          	add	a3,a3,a2
    800041a0:	00d5b023          	sd	a3,0(a1)
    800041a4:	00200593          	li	a1,2
    800041a8:	14459073          	csrw	sip,a1
    800041ac:	01053683          	ld	a3,16(a0)
    800041b0:	00853603          	ld	a2,8(a0)
    800041b4:	00053583          	ld	a1,0(a0)
    800041b8:	34051573          	csrrw	a0,mscratch,a0
    800041bc:	30200073          	mret

00000000800041c0 <plicinit>:
    800041c0:	ff010113          	addi	sp,sp,-16
    800041c4:	00813423          	sd	s0,8(sp)
    800041c8:	01010413          	addi	s0,sp,16
    800041cc:	00813403          	ld	s0,8(sp)
    800041d0:	0c0007b7          	lui	a5,0xc000
    800041d4:	00100713          	li	a4,1
    800041d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800041dc:	00e7a223          	sw	a4,4(a5)
    800041e0:	01010113          	addi	sp,sp,16
    800041e4:	00008067          	ret

00000000800041e8 <plicinithart>:
    800041e8:	ff010113          	addi	sp,sp,-16
    800041ec:	00813023          	sd	s0,0(sp)
    800041f0:	00113423          	sd	ra,8(sp)
    800041f4:	01010413          	addi	s0,sp,16
    800041f8:	00000097          	auipc	ra,0x0
    800041fc:	a4c080e7          	jalr	-1460(ra) # 80003c44 <cpuid>
    80004200:	0085171b          	slliw	a4,a0,0x8
    80004204:	0c0027b7          	lui	a5,0xc002
    80004208:	00e787b3          	add	a5,a5,a4
    8000420c:	40200713          	li	a4,1026
    80004210:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004214:	00813083          	ld	ra,8(sp)
    80004218:	00013403          	ld	s0,0(sp)
    8000421c:	00d5151b          	slliw	a0,a0,0xd
    80004220:	0c2017b7          	lui	a5,0xc201
    80004224:	00a78533          	add	a0,a5,a0
    80004228:	00052023          	sw	zero,0(a0)
    8000422c:	01010113          	addi	sp,sp,16
    80004230:	00008067          	ret

0000000080004234 <plic_claim>:
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00813023          	sd	s0,0(sp)
    8000423c:	00113423          	sd	ra,8(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	00000097          	auipc	ra,0x0
    80004248:	a00080e7          	jalr	-1536(ra) # 80003c44 <cpuid>
    8000424c:	00813083          	ld	ra,8(sp)
    80004250:	00013403          	ld	s0,0(sp)
    80004254:	00d5151b          	slliw	a0,a0,0xd
    80004258:	0c2017b7          	lui	a5,0xc201
    8000425c:	00a78533          	add	a0,a5,a0
    80004260:	00452503          	lw	a0,4(a0)
    80004264:	01010113          	addi	sp,sp,16
    80004268:	00008067          	ret

000000008000426c <plic_complete>:
    8000426c:	fe010113          	addi	sp,sp,-32
    80004270:	00813823          	sd	s0,16(sp)
    80004274:	00913423          	sd	s1,8(sp)
    80004278:	00113c23          	sd	ra,24(sp)
    8000427c:	02010413          	addi	s0,sp,32
    80004280:	00050493          	mv	s1,a0
    80004284:	00000097          	auipc	ra,0x0
    80004288:	9c0080e7          	jalr	-1600(ra) # 80003c44 <cpuid>
    8000428c:	01813083          	ld	ra,24(sp)
    80004290:	01013403          	ld	s0,16(sp)
    80004294:	00d5179b          	slliw	a5,a0,0xd
    80004298:	0c201737          	lui	a4,0xc201
    8000429c:	00f707b3          	add	a5,a4,a5
    800042a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800042a4:	00813483          	ld	s1,8(sp)
    800042a8:	02010113          	addi	sp,sp,32
    800042ac:	00008067          	ret

00000000800042b0 <consolewrite>:
    800042b0:	fb010113          	addi	sp,sp,-80
    800042b4:	04813023          	sd	s0,64(sp)
    800042b8:	04113423          	sd	ra,72(sp)
    800042bc:	02913c23          	sd	s1,56(sp)
    800042c0:	03213823          	sd	s2,48(sp)
    800042c4:	03313423          	sd	s3,40(sp)
    800042c8:	03413023          	sd	s4,32(sp)
    800042cc:	01513c23          	sd	s5,24(sp)
    800042d0:	05010413          	addi	s0,sp,80
    800042d4:	06c05c63          	blez	a2,8000434c <consolewrite+0x9c>
    800042d8:	00060993          	mv	s3,a2
    800042dc:	00050a13          	mv	s4,a0
    800042e0:	00058493          	mv	s1,a1
    800042e4:	00000913          	li	s2,0
    800042e8:	fff00a93          	li	s5,-1
    800042ec:	01c0006f          	j	80004308 <consolewrite+0x58>
    800042f0:	fbf44503          	lbu	a0,-65(s0)
    800042f4:	0019091b          	addiw	s2,s2,1
    800042f8:	00148493          	addi	s1,s1,1
    800042fc:	00001097          	auipc	ra,0x1
    80004300:	a9c080e7          	jalr	-1380(ra) # 80004d98 <uartputc>
    80004304:	03298063          	beq	s3,s2,80004324 <consolewrite+0x74>
    80004308:	00048613          	mv	a2,s1
    8000430c:	00100693          	li	a3,1
    80004310:	000a0593          	mv	a1,s4
    80004314:	fbf40513          	addi	a0,s0,-65
    80004318:	00000097          	auipc	ra,0x0
    8000431c:	9e4080e7          	jalr	-1564(ra) # 80003cfc <either_copyin>
    80004320:	fd5518e3          	bne	a0,s5,800042f0 <consolewrite+0x40>
    80004324:	04813083          	ld	ra,72(sp)
    80004328:	04013403          	ld	s0,64(sp)
    8000432c:	03813483          	ld	s1,56(sp)
    80004330:	02813983          	ld	s3,40(sp)
    80004334:	02013a03          	ld	s4,32(sp)
    80004338:	01813a83          	ld	s5,24(sp)
    8000433c:	00090513          	mv	a0,s2
    80004340:	03013903          	ld	s2,48(sp)
    80004344:	05010113          	addi	sp,sp,80
    80004348:	00008067          	ret
    8000434c:	00000913          	li	s2,0
    80004350:	fd5ff06f          	j	80004324 <consolewrite+0x74>

0000000080004354 <consoleread>:
    80004354:	f9010113          	addi	sp,sp,-112
    80004358:	06813023          	sd	s0,96(sp)
    8000435c:	04913c23          	sd	s1,88(sp)
    80004360:	05213823          	sd	s2,80(sp)
    80004364:	05313423          	sd	s3,72(sp)
    80004368:	05413023          	sd	s4,64(sp)
    8000436c:	03513c23          	sd	s5,56(sp)
    80004370:	03613823          	sd	s6,48(sp)
    80004374:	03713423          	sd	s7,40(sp)
    80004378:	03813023          	sd	s8,32(sp)
    8000437c:	06113423          	sd	ra,104(sp)
    80004380:	01913c23          	sd	s9,24(sp)
    80004384:	07010413          	addi	s0,sp,112
    80004388:	00060b93          	mv	s7,a2
    8000438c:	00050913          	mv	s2,a0
    80004390:	00058c13          	mv	s8,a1
    80004394:	00060b1b          	sext.w	s6,a2
    80004398:	00004497          	auipc	s1,0x4
    8000439c:	2b048493          	addi	s1,s1,688 # 80008648 <cons>
    800043a0:	00400993          	li	s3,4
    800043a4:	fff00a13          	li	s4,-1
    800043a8:	00a00a93          	li	s5,10
    800043ac:	05705e63          	blez	s7,80004408 <consoleread+0xb4>
    800043b0:	09c4a703          	lw	a4,156(s1)
    800043b4:	0984a783          	lw	a5,152(s1)
    800043b8:	0007071b          	sext.w	a4,a4
    800043bc:	08e78463          	beq	a5,a4,80004444 <consoleread+0xf0>
    800043c0:	07f7f713          	andi	a4,a5,127
    800043c4:	00e48733          	add	a4,s1,a4
    800043c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800043cc:	0017869b          	addiw	a3,a5,1
    800043d0:	08d4ac23          	sw	a3,152(s1)
    800043d4:	00070c9b          	sext.w	s9,a4
    800043d8:	0b370663          	beq	a4,s3,80004484 <consoleread+0x130>
    800043dc:	00100693          	li	a3,1
    800043e0:	f9f40613          	addi	a2,s0,-97
    800043e4:	000c0593          	mv	a1,s8
    800043e8:	00090513          	mv	a0,s2
    800043ec:	f8e40fa3          	sb	a4,-97(s0)
    800043f0:	00000097          	auipc	ra,0x0
    800043f4:	8c0080e7          	jalr	-1856(ra) # 80003cb0 <either_copyout>
    800043f8:	01450863          	beq	a0,s4,80004408 <consoleread+0xb4>
    800043fc:	001c0c13          	addi	s8,s8,1
    80004400:	fffb8b9b          	addiw	s7,s7,-1
    80004404:	fb5c94e3          	bne	s9,s5,800043ac <consoleread+0x58>
    80004408:	000b851b          	sext.w	a0,s7
    8000440c:	06813083          	ld	ra,104(sp)
    80004410:	06013403          	ld	s0,96(sp)
    80004414:	05813483          	ld	s1,88(sp)
    80004418:	05013903          	ld	s2,80(sp)
    8000441c:	04813983          	ld	s3,72(sp)
    80004420:	04013a03          	ld	s4,64(sp)
    80004424:	03813a83          	ld	s5,56(sp)
    80004428:	02813b83          	ld	s7,40(sp)
    8000442c:	02013c03          	ld	s8,32(sp)
    80004430:	01813c83          	ld	s9,24(sp)
    80004434:	40ab053b          	subw	a0,s6,a0
    80004438:	03013b03          	ld	s6,48(sp)
    8000443c:	07010113          	addi	sp,sp,112
    80004440:	00008067          	ret
    80004444:	00001097          	auipc	ra,0x1
    80004448:	1d8080e7          	jalr	472(ra) # 8000561c <push_on>
    8000444c:	0984a703          	lw	a4,152(s1)
    80004450:	09c4a783          	lw	a5,156(s1)
    80004454:	0007879b          	sext.w	a5,a5
    80004458:	fef70ce3          	beq	a4,a5,80004450 <consoleread+0xfc>
    8000445c:	00001097          	auipc	ra,0x1
    80004460:	234080e7          	jalr	564(ra) # 80005690 <pop_on>
    80004464:	0984a783          	lw	a5,152(s1)
    80004468:	07f7f713          	andi	a4,a5,127
    8000446c:	00e48733          	add	a4,s1,a4
    80004470:	01874703          	lbu	a4,24(a4)
    80004474:	0017869b          	addiw	a3,a5,1
    80004478:	08d4ac23          	sw	a3,152(s1)
    8000447c:	00070c9b          	sext.w	s9,a4
    80004480:	f5371ee3          	bne	a4,s3,800043dc <consoleread+0x88>
    80004484:	000b851b          	sext.w	a0,s7
    80004488:	f96bf2e3          	bgeu	s7,s6,8000440c <consoleread+0xb8>
    8000448c:	08f4ac23          	sw	a5,152(s1)
    80004490:	f7dff06f          	j	8000440c <consoleread+0xb8>

0000000080004494 <consputc>:
    80004494:	10000793          	li	a5,256
    80004498:	00f50663          	beq	a0,a5,800044a4 <consputc+0x10>
    8000449c:	00001317          	auipc	t1,0x1
    800044a0:	9f430067          	jr	-1548(t1) # 80004e90 <uartputc_sync>
    800044a4:	ff010113          	addi	sp,sp,-16
    800044a8:	00113423          	sd	ra,8(sp)
    800044ac:	00813023          	sd	s0,0(sp)
    800044b0:	01010413          	addi	s0,sp,16
    800044b4:	00800513          	li	a0,8
    800044b8:	00001097          	auipc	ra,0x1
    800044bc:	9d8080e7          	jalr	-1576(ra) # 80004e90 <uartputc_sync>
    800044c0:	02000513          	li	a0,32
    800044c4:	00001097          	auipc	ra,0x1
    800044c8:	9cc080e7          	jalr	-1588(ra) # 80004e90 <uartputc_sync>
    800044cc:	00013403          	ld	s0,0(sp)
    800044d0:	00813083          	ld	ra,8(sp)
    800044d4:	00800513          	li	a0,8
    800044d8:	01010113          	addi	sp,sp,16
    800044dc:	00001317          	auipc	t1,0x1
    800044e0:	9b430067          	jr	-1612(t1) # 80004e90 <uartputc_sync>

00000000800044e4 <consoleintr>:
    800044e4:	fe010113          	addi	sp,sp,-32
    800044e8:	00813823          	sd	s0,16(sp)
    800044ec:	00913423          	sd	s1,8(sp)
    800044f0:	01213023          	sd	s2,0(sp)
    800044f4:	00113c23          	sd	ra,24(sp)
    800044f8:	02010413          	addi	s0,sp,32
    800044fc:	00004917          	auipc	s2,0x4
    80004500:	14c90913          	addi	s2,s2,332 # 80008648 <cons>
    80004504:	00050493          	mv	s1,a0
    80004508:	00090513          	mv	a0,s2
    8000450c:	00001097          	auipc	ra,0x1
    80004510:	e40080e7          	jalr	-448(ra) # 8000534c <acquire>
    80004514:	02048c63          	beqz	s1,8000454c <consoleintr+0x68>
    80004518:	0a092783          	lw	a5,160(s2)
    8000451c:	09892703          	lw	a4,152(s2)
    80004520:	07f00693          	li	a3,127
    80004524:	40e7873b          	subw	a4,a5,a4
    80004528:	02e6e263          	bltu	a3,a4,8000454c <consoleintr+0x68>
    8000452c:	00d00713          	li	a4,13
    80004530:	04e48063          	beq	s1,a4,80004570 <consoleintr+0x8c>
    80004534:	07f7f713          	andi	a4,a5,127
    80004538:	00e90733          	add	a4,s2,a4
    8000453c:	0017879b          	addiw	a5,a5,1
    80004540:	0af92023          	sw	a5,160(s2)
    80004544:	00970c23          	sb	s1,24(a4)
    80004548:	08f92e23          	sw	a5,156(s2)
    8000454c:	01013403          	ld	s0,16(sp)
    80004550:	01813083          	ld	ra,24(sp)
    80004554:	00813483          	ld	s1,8(sp)
    80004558:	00013903          	ld	s2,0(sp)
    8000455c:	00004517          	auipc	a0,0x4
    80004560:	0ec50513          	addi	a0,a0,236 # 80008648 <cons>
    80004564:	02010113          	addi	sp,sp,32
    80004568:	00001317          	auipc	t1,0x1
    8000456c:	eb030067          	jr	-336(t1) # 80005418 <release>
    80004570:	00a00493          	li	s1,10
    80004574:	fc1ff06f          	j	80004534 <consoleintr+0x50>

0000000080004578 <consoleinit>:
    80004578:	fe010113          	addi	sp,sp,-32
    8000457c:	00113c23          	sd	ra,24(sp)
    80004580:	00813823          	sd	s0,16(sp)
    80004584:	00913423          	sd	s1,8(sp)
    80004588:	02010413          	addi	s0,sp,32
    8000458c:	00004497          	auipc	s1,0x4
    80004590:	0bc48493          	addi	s1,s1,188 # 80008648 <cons>
    80004594:	00048513          	mv	a0,s1
    80004598:	00002597          	auipc	a1,0x2
    8000459c:	f5858593          	addi	a1,a1,-168 # 800064f0 <CONSOLE_STATUS+0x4e0>
    800045a0:	00001097          	auipc	ra,0x1
    800045a4:	d88080e7          	jalr	-632(ra) # 80005328 <initlock>
    800045a8:	00000097          	auipc	ra,0x0
    800045ac:	7ac080e7          	jalr	1964(ra) # 80004d54 <uartinit>
    800045b0:	01813083          	ld	ra,24(sp)
    800045b4:	01013403          	ld	s0,16(sp)
    800045b8:	00000797          	auipc	a5,0x0
    800045bc:	d9c78793          	addi	a5,a5,-612 # 80004354 <consoleread>
    800045c0:	0af4bc23          	sd	a5,184(s1)
    800045c4:	00000797          	auipc	a5,0x0
    800045c8:	cec78793          	addi	a5,a5,-788 # 800042b0 <consolewrite>
    800045cc:	0cf4b023          	sd	a5,192(s1)
    800045d0:	00813483          	ld	s1,8(sp)
    800045d4:	02010113          	addi	sp,sp,32
    800045d8:	00008067          	ret

00000000800045dc <console_read>:
    800045dc:	ff010113          	addi	sp,sp,-16
    800045e0:	00813423          	sd	s0,8(sp)
    800045e4:	01010413          	addi	s0,sp,16
    800045e8:	00813403          	ld	s0,8(sp)
    800045ec:	00004317          	auipc	t1,0x4
    800045f0:	11433303          	ld	t1,276(t1) # 80008700 <devsw+0x10>
    800045f4:	01010113          	addi	sp,sp,16
    800045f8:	00030067          	jr	t1

00000000800045fc <console_write>:
    800045fc:	ff010113          	addi	sp,sp,-16
    80004600:	00813423          	sd	s0,8(sp)
    80004604:	01010413          	addi	s0,sp,16
    80004608:	00813403          	ld	s0,8(sp)
    8000460c:	00004317          	auipc	t1,0x4
    80004610:	0fc33303          	ld	t1,252(t1) # 80008708 <devsw+0x18>
    80004614:	01010113          	addi	sp,sp,16
    80004618:	00030067          	jr	t1

000000008000461c <panic>:
    8000461c:	fe010113          	addi	sp,sp,-32
    80004620:	00113c23          	sd	ra,24(sp)
    80004624:	00813823          	sd	s0,16(sp)
    80004628:	00913423          	sd	s1,8(sp)
    8000462c:	02010413          	addi	s0,sp,32
    80004630:	00050493          	mv	s1,a0
    80004634:	00002517          	auipc	a0,0x2
    80004638:	ec450513          	addi	a0,a0,-316 # 800064f8 <CONSOLE_STATUS+0x4e8>
    8000463c:	00004797          	auipc	a5,0x4
    80004640:	1607a623          	sw	zero,364(a5) # 800087a8 <pr+0x18>
    80004644:	00000097          	auipc	ra,0x0
    80004648:	034080e7          	jalr	52(ra) # 80004678 <__printf>
    8000464c:	00048513          	mv	a0,s1
    80004650:	00000097          	auipc	ra,0x0
    80004654:	028080e7          	jalr	40(ra) # 80004678 <__printf>
    80004658:	00002517          	auipc	a0,0x2
    8000465c:	e8050513          	addi	a0,a0,-384 # 800064d8 <CONSOLE_STATUS+0x4c8>
    80004660:	00000097          	auipc	ra,0x0
    80004664:	018080e7          	jalr	24(ra) # 80004678 <__printf>
    80004668:	00100793          	li	a5,1
    8000466c:	00003717          	auipc	a4,0x3
    80004670:	e8f72e23          	sw	a5,-356(a4) # 80007508 <panicked>
    80004674:	0000006f          	j	80004674 <panic+0x58>

0000000080004678 <__printf>:
    80004678:	f3010113          	addi	sp,sp,-208
    8000467c:	08813023          	sd	s0,128(sp)
    80004680:	07313423          	sd	s3,104(sp)
    80004684:	09010413          	addi	s0,sp,144
    80004688:	05813023          	sd	s8,64(sp)
    8000468c:	08113423          	sd	ra,136(sp)
    80004690:	06913c23          	sd	s1,120(sp)
    80004694:	07213823          	sd	s2,112(sp)
    80004698:	07413023          	sd	s4,96(sp)
    8000469c:	05513c23          	sd	s5,88(sp)
    800046a0:	05613823          	sd	s6,80(sp)
    800046a4:	05713423          	sd	s7,72(sp)
    800046a8:	03913c23          	sd	s9,56(sp)
    800046ac:	03a13823          	sd	s10,48(sp)
    800046b0:	03b13423          	sd	s11,40(sp)
    800046b4:	00004317          	auipc	t1,0x4
    800046b8:	0dc30313          	addi	t1,t1,220 # 80008790 <pr>
    800046bc:	01832c03          	lw	s8,24(t1)
    800046c0:	00b43423          	sd	a1,8(s0)
    800046c4:	00c43823          	sd	a2,16(s0)
    800046c8:	00d43c23          	sd	a3,24(s0)
    800046cc:	02e43023          	sd	a4,32(s0)
    800046d0:	02f43423          	sd	a5,40(s0)
    800046d4:	03043823          	sd	a6,48(s0)
    800046d8:	03143c23          	sd	a7,56(s0)
    800046dc:	00050993          	mv	s3,a0
    800046e0:	4a0c1663          	bnez	s8,80004b8c <__printf+0x514>
    800046e4:	60098c63          	beqz	s3,80004cfc <__printf+0x684>
    800046e8:	0009c503          	lbu	a0,0(s3)
    800046ec:	00840793          	addi	a5,s0,8
    800046f0:	f6f43c23          	sd	a5,-136(s0)
    800046f4:	00000493          	li	s1,0
    800046f8:	22050063          	beqz	a0,80004918 <__printf+0x2a0>
    800046fc:	00002a37          	lui	s4,0x2
    80004700:	00018ab7          	lui	s5,0x18
    80004704:	000f4b37          	lui	s6,0xf4
    80004708:	00989bb7          	lui	s7,0x989
    8000470c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004710:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004714:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004718:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000471c:	00148c9b          	addiw	s9,s1,1
    80004720:	02500793          	li	a5,37
    80004724:	01998933          	add	s2,s3,s9
    80004728:	38f51263          	bne	a0,a5,80004aac <__printf+0x434>
    8000472c:	00094783          	lbu	a5,0(s2)
    80004730:	00078c9b          	sext.w	s9,a5
    80004734:	1e078263          	beqz	a5,80004918 <__printf+0x2a0>
    80004738:	0024849b          	addiw	s1,s1,2
    8000473c:	07000713          	li	a4,112
    80004740:	00998933          	add	s2,s3,s1
    80004744:	38e78a63          	beq	a5,a4,80004ad8 <__printf+0x460>
    80004748:	20f76863          	bltu	a4,a5,80004958 <__printf+0x2e0>
    8000474c:	42a78863          	beq	a5,a0,80004b7c <__printf+0x504>
    80004750:	06400713          	li	a4,100
    80004754:	40e79663          	bne	a5,a4,80004b60 <__printf+0x4e8>
    80004758:	f7843783          	ld	a5,-136(s0)
    8000475c:	0007a603          	lw	a2,0(a5)
    80004760:	00878793          	addi	a5,a5,8
    80004764:	f6f43c23          	sd	a5,-136(s0)
    80004768:	42064a63          	bltz	a2,80004b9c <__printf+0x524>
    8000476c:	00a00713          	li	a4,10
    80004770:	02e677bb          	remuw	a5,a2,a4
    80004774:	00002d97          	auipc	s11,0x2
    80004778:	dacd8d93          	addi	s11,s11,-596 # 80006520 <digits>
    8000477c:	00900593          	li	a1,9
    80004780:	0006051b          	sext.w	a0,a2
    80004784:	00000c93          	li	s9,0
    80004788:	02079793          	slli	a5,a5,0x20
    8000478c:	0207d793          	srli	a5,a5,0x20
    80004790:	00fd87b3          	add	a5,s11,a5
    80004794:	0007c783          	lbu	a5,0(a5)
    80004798:	02e656bb          	divuw	a3,a2,a4
    8000479c:	f8f40023          	sb	a5,-128(s0)
    800047a0:	14c5d863          	bge	a1,a2,800048f0 <__printf+0x278>
    800047a4:	06300593          	li	a1,99
    800047a8:	00100c93          	li	s9,1
    800047ac:	02e6f7bb          	remuw	a5,a3,a4
    800047b0:	02079793          	slli	a5,a5,0x20
    800047b4:	0207d793          	srli	a5,a5,0x20
    800047b8:	00fd87b3          	add	a5,s11,a5
    800047bc:	0007c783          	lbu	a5,0(a5)
    800047c0:	02e6d73b          	divuw	a4,a3,a4
    800047c4:	f8f400a3          	sb	a5,-127(s0)
    800047c8:	12a5f463          	bgeu	a1,a0,800048f0 <__printf+0x278>
    800047cc:	00a00693          	li	a3,10
    800047d0:	00900593          	li	a1,9
    800047d4:	02d777bb          	remuw	a5,a4,a3
    800047d8:	02079793          	slli	a5,a5,0x20
    800047dc:	0207d793          	srli	a5,a5,0x20
    800047e0:	00fd87b3          	add	a5,s11,a5
    800047e4:	0007c503          	lbu	a0,0(a5)
    800047e8:	02d757bb          	divuw	a5,a4,a3
    800047ec:	f8a40123          	sb	a0,-126(s0)
    800047f0:	48e5f263          	bgeu	a1,a4,80004c74 <__printf+0x5fc>
    800047f4:	06300513          	li	a0,99
    800047f8:	02d7f5bb          	remuw	a1,a5,a3
    800047fc:	02059593          	slli	a1,a1,0x20
    80004800:	0205d593          	srli	a1,a1,0x20
    80004804:	00bd85b3          	add	a1,s11,a1
    80004808:	0005c583          	lbu	a1,0(a1)
    8000480c:	02d7d7bb          	divuw	a5,a5,a3
    80004810:	f8b401a3          	sb	a1,-125(s0)
    80004814:	48e57263          	bgeu	a0,a4,80004c98 <__printf+0x620>
    80004818:	3e700513          	li	a0,999
    8000481c:	02d7f5bb          	remuw	a1,a5,a3
    80004820:	02059593          	slli	a1,a1,0x20
    80004824:	0205d593          	srli	a1,a1,0x20
    80004828:	00bd85b3          	add	a1,s11,a1
    8000482c:	0005c583          	lbu	a1,0(a1)
    80004830:	02d7d7bb          	divuw	a5,a5,a3
    80004834:	f8b40223          	sb	a1,-124(s0)
    80004838:	46e57663          	bgeu	a0,a4,80004ca4 <__printf+0x62c>
    8000483c:	02d7f5bb          	remuw	a1,a5,a3
    80004840:	02059593          	slli	a1,a1,0x20
    80004844:	0205d593          	srli	a1,a1,0x20
    80004848:	00bd85b3          	add	a1,s11,a1
    8000484c:	0005c583          	lbu	a1,0(a1)
    80004850:	02d7d7bb          	divuw	a5,a5,a3
    80004854:	f8b402a3          	sb	a1,-123(s0)
    80004858:	46ea7863          	bgeu	s4,a4,80004cc8 <__printf+0x650>
    8000485c:	02d7f5bb          	remuw	a1,a5,a3
    80004860:	02059593          	slli	a1,a1,0x20
    80004864:	0205d593          	srli	a1,a1,0x20
    80004868:	00bd85b3          	add	a1,s11,a1
    8000486c:	0005c583          	lbu	a1,0(a1)
    80004870:	02d7d7bb          	divuw	a5,a5,a3
    80004874:	f8b40323          	sb	a1,-122(s0)
    80004878:	3eeaf863          	bgeu	s5,a4,80004c68 <__printf+0x5f0>
    8000487c:	02d7f5bb          	remuw	a1,a5,a3
    80004880:	02059593          	slli	a1,a1,0x20
    80004884:	0205d593          	srli	a1,a1,0x20
    80004888:	00bd85b3          	add	a1,s11,a1
    8000488c:	0005c583          	lbu	a1,0(a1)
    80004890:	02d7d7bb          	divuw	a5,a5,a3
    80004894:	f8b403a3          	sb	a1,-121(s0)
    80004898:	42eb7e63          	bgeu	s6,a4,80004cd4 <__printf+0x65c>
    8000489c:	02d7f5bb          	remuw	a1,a5,a3
    800048a0:	02059593          	slli	a1,a1,0x20
    800048a4:	0205d593          	srli	a1,a1,0x20
    800048a8:	00bd85b3          	add	a1,s11,a1
    800048ac:	0005c583          	lbu	a1,0(a1)
    800048b0:	02d7d7bb          	divuw	a5,a5,a3
    800048b4:	f8b40423          	sb	a1,-120(s0)
    800048b8:	42ebfc63          	bgeu	s7,a4,80004cf0 <__printf+0x678>
    800048bc:	02079793          	slli	a5,a5,0x20
    800048c0:	0207d793          	srli	a5,a5,0x20
    800048c4:	00fd8db3          	add	s11,s11,a5
    800048c8:	000dc703          	lbu	a4,0(s11)
    800048cc:	00a00793          	li	a5,10
    800048d0:	00900c93          	li	s9,9
    800048d4:	f8e404a3          	sb	a4,-119(s0)
    800048d8:	00065c63          	bgez	a2,800048f0 <__printf+0x278>
    800048dc:	f9040713          	addi	a4,s0,-112
    800048e0:	00f70733          	add	a4,a4,a5
    800048e4:	02d00693          	li	a3,45
    800048e8:	fed70823          	sb	a3,-16(a4)
    800048ec:	00078c93          	mv	s9,a5
    800048f0:	f8040793          	addi	a5,s0,-128
    800048f4:	01978cb3          	add	s9,a5,s9
    800048f8:	f7f40d13          	addi	s10,s0,-129
    800048fc:	000cc503          	lbu	a0,0(s9)
    80004900:	fffc8c93          	addi	s9,s9,-1
    80004904:	00000097          	auipc	ra,0x0
    80004908:	b90080e7          	jalr	-1136(ra) # 80004494 <consputc>
    8000490c:	ffac98e3          	bne	s9,s10,800048fc <__printf+0x284>
    80004910:	00094503          	lbu	a0,0(s2)
    80004914:	e00514e3          	bnez	a0,8000471c <__printf+0xa4>
    80004918:	1a0c1663          	bnez	s8,80004ac4 <__printf+0x44c>
    8000491c:	08813083          	ld	ra,136(sp)
    80004920:	08013403          	ld	s0,128(sp)
    80004924:	07813483          	ld	s1,120(sp)
    80004928:	07013903          	ld	s2,112(sp)
    8000492c:	06813983          	ld	s3,104(sp)
    80004930:	06013a03          	ld	s4,96(sp)
    80004934:	05813a83          	ld	s5,88(sp)
    80004938:	05013b03          	ld	s6,80(sp)
    8000493c:	04813b83          	ld	s7,72(sp)
    80004940:	04013c03          	ld	s8,64(sp)
    80004944:	03813c83          	ld	s9,56(sp)
    80004948:	03013d03          	ld	s10,48(sp)
    8000494c:	02813d83          	ld	s11,40(sp)
    80004950:	0d010113          	addi	sp,sp,208
    80004954:	00008067          	ret
    80004958:	07300713          	li	a4,115
    8000495c:	1ce78a63          	beq	a5,a4,80004b30 <__printf+0x4b8>
    80004960:	07800713          	li	a4,120
    80004964:	1ee79e63          	bne	a5,a4,80004b60 <__printf+0x4e8>
    80004968:	f7843783          	ld	a5,-136(s0)
    8000496c:	0007a703          	lw	a4,0(a5)
    80004970:	00878793          	addi	a5,a5,8
    80004974:	f6f43c23          	sd	a5,-136(s0)
    80004978:	28074263          	bltz	a4,80004bfc <__printf+0x584>
    8000497c:	00002d97          	auipc	s11,0x2
    80004980:	ba4d8d93          	addi	s11,s11,-1116 # 80006520 <digits>
    80004984:	00f77793          	andi	a5,a4,15
    80004988:	00fd87b3          	add	a5,s11,a5
    8000498c:	0007c683          	lbu	a3,0(a5)
    80004990:	00f00613          	li	a2,15
    80004994:	0007079b          	sext.w	a5,a4
    80004998:	f8d40023          	sb	a3,-128(s0)
    8000499c:	0047559b          	srliw	a1,a4,0x4
    800049a0:	0047569b          	srliw	a3,a4,0x4
    800049a4:	00000c93          	li	s9,0
    800049a8:	0ee65063          	bge	a2,a4,80004a88 <__printf+0x410>
    800049ac:	00f6f693          	andi	a3,a3,15
    800049b0:	00dd86b3          	add	a3,s11,a3
    800049b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800049b8:	0087d79b          	srliw	a5,a5,0x8
    800049bc:	00100c93          	li	s9,1
    800049c0:	f8d400a3          	sb	a3,-127(s0)
    800049c4:	0cb67263          	bgeu	a2,a1,80004a88 <__printf+0x410>
    800049c8:	00f7f693          	andi	a3,a5,15
    800049cc:	00dd86b3          	add	a3,s11,a3
    800049d0:	0006c583          	lbu	a1,0(a3)
    800049d4:	00f00613          	li	a2,15
    800049d8:	0047d69b          	srliw	a3,a5,0x4
    800049dc:	f8b40123          	sb	a1,-126(s0)
    800049e0:	0047d593          	srli	a1,a5,0x4
    800049e4:	28f67e63          	bgeu	a2,a5,80004c80 <__printf+0x608>
    800049e8:	00f6f693          	andi	a3,a3,15
    800049ec:	00dd86b3          	add	a3,s11,a3
    800049f0:	0006c503          	lbu	a0,0(a3)
    800049f4:	0087d813          	srli	a6,a5,0x8
    800049f8:	0087d69b          	srliw	a3,a5,0x8
    800049fc:	f8a401a3          	sb	a0,-125(s0)
    80004a00:	28b67663          	bgeu	a2,a1,80004c8c <__printf+0x614>
    80004a04:	00f6f693          	andi	a3,a3,15
    80004a08:	00dd86b3          	add	a3,s11,a3
    80004a0c:	0006c583          	lbu	a1,0(a3)
    80004a10:	00c7d513          	srli	a0,a5,0xc
    80004a14:	00c7d69b          	srliw	a3,a5,0xc
    80004a18:	f8b40223          	sb	a1,-124(s0)
    80004a1c:	29067a63          	bgeu	a2,a6,80004cb0 <__printf+0x638>
    80004a20:	00f6f693          	andi	a3,a3,15
    80004a24:	00dd86b3          	add	a3,s11,a3
    80004a28:	0006c583          	lbu	a1,0(a3)
    80004a2c:	0107d813          	srli	a6,a5,0x10
    80004a30:	0107d69b          	srliw	a3,a5,0x10
    80004a34:	f8b402a3          	sb	a1,-123(s0)
    80004a38:	28a67263          	bgeu	a2,a0,80004cbc <__printf+0x644>
    80004a3c:	00f6f693          	andi	a3,a3,15
    80004a40:	00dd86b3          	add	a3,s11,a3
    80004a44:	0006c683          	lbu	a3,0(a3)
    80004a48:	0147d79b          	srliw	a5,a5,0x14
    80004a4c:	f8d40323          	sb	a3,-122(s0)
    80004a50:	21067663          	bgeu	a2,a6,80004c5c <__printf+0x5e4>
    80004a54:	02079793          	slli	a5,a5,0x20
    80004a58:	0207d793          	srli	a5,a5,0x20
    80004a5c:	00fd8db3          	add	s11,s11,a5
    80004a60:	000dc683          	lbu	a3,0(s11)
    80004a64:	00800793          	li	a5,8
    80004a68:	00700c93          	li	s9,7
    80004a6c:	f8d403a3          	sb	a3,-121(s0)
    80004a70:	00075c63          	bgez	a4,80004a88 <__printf+0x410>
    80004a74:	f9040713          	addi	a4,s0,-112
    80004a78:	00f70733          	add	a4,a4,a5
    80004a7c:	02d00693          	li	a3,45
    80004a80:	fed70823          	sb	a3,-16(a4)
    80004a84:	00078c93          	mv	s9,a5
    80004a88:	f8040793          	addi	a5,s0,-128
    80004a8c:	01978cb3          	add	s9,a5,s9
    80004a90:	f7f40d13          	addi	s10,s0,-129
    80004a94:	000cc503          	lbu	a0,0(s9)
    80004a98:	fffc8c93          	addi	s9,s9,-1
    80004a9c:	00000097          	auipc	ra,0x0
    80004aa0:	9f8080e7          	jalr	-1544(ra) # 80004494 <consputc>
    80004aa4:	ff9d18e3          	bne	s10,s9,80004a94 <__printf+0x41c>
    80004aa8:	0100006f          	j	80004ab8 <__printf+0x440>
    80004aac:	00000097          	auipc	ra,0x0
    80004ab0:	9e8080e7          	jalr	-1560(ra) # 80004494 <consputc>
    80004ab4:	000c8493          	mv	s1,s9
    80004ab8:	00094503          	lbu	a0,0(s2)
    80004abc:	c60510e3          	bnez	a0,8000471c <__printf+0xa4>
    80004ac0:	e40c0ee3          	beqz	s8,8000491c <__printf+0x2a4>
    80004ac4:	00004517          	auipc	a0,0x4
    80004ac8:	ccc50513          	addi	a0,a0,-820 # 80008790 <pr>
    80004acc:	00001097          	auipc	ra,0x1
    80004ad0:	94c080e7          	jalr	-1716(ra) # 80005418 <release>
    80004ad4:	e49ff06f          	j	8000491c <__printf+0x2a4>
    80004ad8:	f7843783          	ld	a5,-136(s0)
    80004adc:	03000513          	li	a0,48
    80004ae0:	01000d13          	li	s10,16
    80004ae4:	00878713          	addi	a4,a5,8
    80004ae8:	0007bc83          	ld	s9,0(a5)
    80004aec:	f6e43c23          	sd	a4,-136(s0)
    80004af0:	00000097          	auipc	ra,0x0
    80004af4:	9a4080e7          	jalr	-1628(ra) # 80004494 <consputc>
    80004af8:	07800513          	li	a0,120
    80004afc:	00000097          	auipc	ra,0x0
    80004b00:	998080e7          	jalr	-1640(ra) # 80004494 <consputc>
    80004b04:	00002d97          	auipc	s11,0x2
    80004b08:	a1cd8d93          	addi	s11,s11,-1508 # 80006520 <digits>
    80004b0c:	03ccd793          	srli	a5,s9,0x3c
    80004b10:	00fd87b3          	add	a5,s11,a5
    80004b14:	0007c503          	lbu	a0,0(a5)
    80004b18:	fffd0d1b          	addiw	s10,s10,-1
    80004b1c:	004c9c93          	slli	s9,s9,0x4
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	974080e7          	jalr	-1676(ra) # 80004494 <consputc>
    80004b28:	fe0d12e3          	bnez	s10,80004b0c <__printf+0x494>
    80004b2c:	f8dff06f          	j	80004ab8 <__printf+0x440>
    80004b30:	f7843783          	ld	a5,-136(s0)
    80004b34:	0007bc83          	ld	s9,0(a5)
    80004b38:	00878793          	addi	a5,a5,8
    80004b3c:	f6f43c23          	sd	a5,-136(s0)
    80004b40:	000c9a63          	bnez	s9,80004b54 <__printf+0x4dc>
    80004b44:	1080006f          	j	80004c4c <__printf+0x5d4>
    80004b48:	001c8c93          	addi	s9,s9,1
    80004b4c:	00000097          	auipc	ra,0x0
    80004b50:	948080e7          	jalr	-1720(ra) # 80004494 <consputc>
    80004b54:	000cc503          	lbu	a0,0(s9)
    80004b58:	fe0518e3          	bnez	a0,80004b48 <__printf+0x4d0>
    80004b5c:	f5dff06f          	j	80004ab8 <__printf+0x440>
    80004b60:	02500513          	li	a0,37
    80004b64:	00000097          	auipc	ra,0x0
    80004b68:	930080e7          	jalr	-1744(ra) # 80004494 <consputc>
    80004b6c:	000c8513          	mv	a0,s9
    80004b70:	00000097          	auipc	ra,0x0
    80004b74:	924080e7          	jalr	-1756(ra) # 80004494 <consputc>
    80004b78:	f41ff06f          	j	80004ab8 <__printf+0x440>
    80004b7c:	02500513          	li	a0,37
    80004b80:	00000097          	auipc	ra,0x0
    80004b84:	914080e7          	jalr	-1772(ra) # 80004494 <consputc>
    80004b88:	f31ff06f          	j	80004ab8 <__printf+0x440>
    80004b8c:	00030513          	mv	a0,t1
    80004b90:	00000097          	auipc	ra,0x0
    80004b94:	7bc080e7          	jalr	1980(ra) # 8000534c <acquire>
    80004b98:	b4dff06f          	j	800046e4 <__printf+0x6c>
    80004b9c:	40c0053b          	negw	a0,a2
    80004ba0:	00a00713          	li	a4,10
    80004ba4:	02e576bb          	remuw	a3,a0,a4
    80004ba8:	00002d97          	auipc	s11,0x2
    80004bac:	978d8d93          	addi	s11,s11,-1672 # 80006520 <digits>
    80004bb0:	ff700593          	li	a1,-9
    80004bb4:	02069693          	slli	a3,a3,0x20
    80004bb8:	0206d693          	srli	a3,a3,0x20
    80004bbc:	00dd86b3          	add	a3,s11,a3
    80004bc0:	0006c683          	lbu	a3,0(a3)
    80004bc4:	02e557bb          	divuw	a5,a0,a4
    80004bc8:	f8d40023          	sb	a3,-128(s0)
    80004bcc:	10b65e63          	bge	a2,a1,80004ce8 <__printf+0x670>
    80004bd0:	06300593          	li	a1,99
    80004bd4:	02e7f6bb          	remuw	a3,a5,a4
    80004bd8:	02069693          	slli	a3,a3,0x20
    80004bdc:	0206d693          	srli	a3,a3,0x20
    80004be0:	00dd86b3          	add	a3,s11,a3
    80004be4:	0006c683          	lbu	a3,0(a3)
    80004be8:	02e7d73b          	divuw	a4,a5,a4
    80004bec:	00200793          	li	a5,2
    80004bf0:	f8d400a3          	sb	a3,-127(s0)
    80004bf4:	bca5ece3          	bltu	a1,a0,800047cc <__printf+0x154>
    80004bf8:	ce5ff06f          	j	800048dc <__printf+0x264>
    80004bfc:	40e007bb          	negw	a5,a4
    80004c00:	00002d97          	auipc	s11,0x2
    80004c04:	920d8d93          	addi	s11,s11,-1760 # 80006520 <digits>
    80004c08:	00f7f693          	andi	a3,a5,15
    80004c0c:	00dd86b3          	add	a3,s11,a3
    80004c10:	0006c583          	lbu	a1,0(a3)
    80004c14:	ff100613          	li	a2,-15
    80004c18:	0047d69b          	srliw	a3,a5,0x4
    80004c1c:	f8b40023          	sb	a1,-128(s0)
    80004c20:	0047d59b          	srliw	a1,a5,0x4
    80004c24:	0ac75e63          	bge	a4,a2,80004ce0 <__printf+0x668>
    80004c28:	00f6f693          	andi	a3,a3,15
    80004c2c:	00dd86b3          	add	a3,s11,a3
    80004c30:	0006c603          	lbu	a2,0(a3)
    80004c34:	00f00693          	li	a3,15
    80004c38:	0087d79b          	srliw	a5,a5,0x8
    80004c3c:	f8c400a3          	sb	a2,-127(s0)
    80004c40:	d8b6e4e3          	bltu	a3,a1,800049c8 <__printf+0x350>
    80004c44:	00200793          	li	a5,2
    80004c48:	e2dff06f          	j	80004a74 <__printf+0x3fc>
    80004c4c:	00002c97          	auipc	s9,0x2
    80004c50:	8b4c8c93          	addi	s9,s9,-1868 # 80006500 <CONSOLE_STATUS+0x4f0>
    80004c54:	02800513          	li	a0,40
    80004c58:	ef1ff06f          	j	80004b48 <__printf+0x4d0>
    80004c5c:	00700793          	li	a5,7
    80004c60:	00600c93          	li	s9,6
    80004c64:	e0dff06f          	j	80004a70 <__printf+0x3f8>
    80004c68:	00700793          	li	a5,7
    80004c6c:	00600c93          	li	s9,6
    80004c70:	c69ff06f          	j	800048d8 <__printf+0x260>
    80004c74:	00300793          	li	a5,3
    80004c78:	00200c93          	li	s9,2
    80004c7c:	c5dff06f          	j	800048d8 <__printf+0x260>
    80004c80:	00300793          	li	a5,3
    80004c84:	00200c93          	li	s9,2
    80004c88:	de9ff06f          	j	80004a70 <__printf+0x3f8>
    80004c8c:	00400793          	li	a5,4
    80004c90:	00300c93          	li	s9,3
    80004c94:	dddff06f          	j	80004a70 <__printf+0x3f8>
    80004c98:	00400793          	li	a5,4
    80004c9c:	00300c93          	li	s9,3
    80004ca0:	c39ff06f          	j	800048d8 <__printf+0x260>
    80004ca4:	00500793          	li	a5,5
    80004ca8:	00400c93          	li	s9,4
    80004cac:	c2dff06f          	j	800048d8 <__printf+0x260>
    80004cb0:	00500793          	li	a5,5
    80004cb4:	00400c93          	li	s9,4
    80004cb8:	db9ff06f          	j	80004a70 <__printf+0x3f8>
    80004cbc:	00600793          	li	a5,6
    80004cc0:	00500c93          	li	s9,5
    80004cc4:	dadff06f          	j	80004a70 <__printf+0x3f8>
    80004cc8:	00600793          	li	a5,6
    80004ccc:	00500c93          	li	s9,5
    80004cd0:	c09ff06f          	j	800048d8 <__printf+0x260>
    80004cd4:	00800793          	li	a5,8
    80004cd8:	00700c93          	li	s9,7
    80004cdc:	bfdff06f          	j	800048d8 <__printf+0x260>
    80004ce0:	00100793          	li	a5,1
    80004ce4:	d91ff06f          	j	80004a74 <__printf+0x3fc>
    80004ce8:	00100793          	li	a5,1
    80004cec:	bf1ff06f          	j	800048dc <__printf+0x264>
    80004cf0:	00900793          	li	a5,9
    80004cf4:	00800c93          	li	s9,8
    80004cf8:	be1ff06f          	j	800048d8 <__printf+0x260>
    80004cfc:	00002517          	auipc	a0,0x2
    80004d00:	80c50513          	addi	a0,a0,-2036 # 80006508 <CONSOLE_STATUS+0x4f8>
    80004d04:	00000097          	auipc	ra,0x0
    80004d08:	918080e7          	jalr	-1768(ra) # 8000461c <panic>

0000000080004d0c <printfinit>:
    80004d0c:	fe010113          	addi	sp,sp,-32
    80004d10:	00813823          	sd	s0,16(sp)
    80004d14:	00913423          	sd	s1,8(sp)
    80004d18:	00113c23          	sd	ra,24(sp)
    80004d1c:	02010413          	addi	s0,sp,32
    80004d20:	00004497          	auipc	s1,0x4
    80004d24:	a7048493          	addi	s1,s1,-1424 # 80008790 <pr>
    80004d28:	00048513          	mv	a0,s1
    80004d2c:	00001597          	auipc	a1,0x1
    80004d30:	7ec58593          	addi	a1,a1,2028 # 80006518 <CONSOLE_STATUS+0x508>
    80004d34:	00000097          	auipc	ra,0x0
    80004d38:	5f4080e7          	jalr	1524(ra) # 80005328 <initlock>
    80004d3c:	01813083          	ld	ra,24(sp)
    80004d40:	01013403          	ld	s0,16(sp)
    80004d44:	0004ac23          	sw	zero,24(s1)
    80004d48:	00813483          	ld	s1,8(sp)
    80004d4c:	02010113          	addi	sp,sp,32
    80004d50:	00008067          	ret

0000000080004d54 <uartinit>:
    80004d54:	ff010113          	addi	sp,sp,-16
    80004d58:	00813423          	sd	s0,8(sp)
    80004d5c:	01010413          	addi	s0,sp,16
    80004d60:	100007b7          	lui	a5,0x10000
    80004d64:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004d68:	f8000713          	li	a4,-128
    80004d6c:	00e781a3          	sb	a4,3(a5)
    80004d70:	00300713          	li	a4,3
    80004d74:	00e78023          	sb	a4,0(a5)
    80004d78:	000780a3          	sb	zero,1(a5)
    80004d7c:	00e781a3          	sb	a4,3(a5)
    80004d80:	00700693          	li	a3,7
    80004d84:	00d78123          	sb	a3,2(a5)
    80004d88:	00e780a3          	sb	a4,1(a5)
    80004d8c:	00813403          	ld	s0,8(sp)
    80004d90:	01010113          	addi	sp,sp,16
    80004d94:	00008067          	ret

0000000080004d98 <uartputc>:
    80004d98:	00002797          	auipc	a5,0x2
    80004d9c:	7707a783          	lw	a5,1904(a5) # 80007508 <panicked>
    80004da0:	00078463          	beqz	a5,80004da8 <uartputc+0x10>
    80004da4:	0000006f          	j	80004da4 <uartputc+0xc>
    80004da8:	fd010113          	addi	sp,sp,-48
    80004dac:	02813023          	sd	s0,32(sp)
    80004db0:	00913c23          	sd	s1,24(sp)
    80004db4:	01213823          	sd	s2,16(sp)
    80004db8:	01313423          	sd	s3,8(sp)
    80004dbc:	02113423          	sd	ra,40(sp)
    80004dc0:	03010413          	addi	s0,sp,48
    80004dc4:	00002917          	auipc	s2,0x2
    80004dc8:	74c90913          	addi	s2,s2,1868 # 80007510 <uart_tx_r>
    80004dcc:	00093783          	ld	a5,0(s2)
    80004dd0:	00002497          	auipc	s1,0x2
    80004dd4:	74848493          	addi	s1,s1,1864 # 80007518 <uart_tx_w>
    80004dd8:	0004b703          	ld	a4,0(s1)
    80004ddc:	02078693          	addi	a3,a5,32
    80004de0:	00050993          	mv	s3,a0
    80004de4:	02e69c63          	bne	a3,a4,80004e1c <uartputc+0x84>
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	834080e7          	jalr	-1996(ra) # 8000561c <push_on>
    80004df0:	00093783          	ld	a5,0(s2)
    80004df4:	0004b703          	ld	a4,0(s1)
    80004df8:	02078793          	addi	a5,a5,32
    80004dfc:	00e79463          	bne	a5,a4,80004e04 <uartputc+0x6c>
    80004e00:	0000006f          	j	80004e00 <uartputc+0x68>
    80004e04:	00001097          	auipc	ra,0x1
    80004e08:	88c080e7          	jalr	-1908(ra) # 80005690 <pop_on>
    80004e0c:	00093783          	ld	a5,0(s2)
    80004e10:	0004b703          	ld	a4,0(s1)
    80004e14:	02078693          	addi	a3,a5,32
    80004e18:	fce688e3          	beq	a3,a4,80004de8 <uartputc+0x50>
    80004e1c:	01f77693          	andi	a3,a4,31
    80004e20:	00004597          	auipc	a1,0x4
    80004e24:	99058593          	addi	a1,a1,-1648 # 800087b0 <uart_tx_buf>
    80004e28:	00d586b3          	add	a3,a1,a3
    80004e2c:	00170713          	addi	a4,a4,1
    80004e30:	01368023          	sb	s3,0(a3)
    80004e34:	00e4b023          	sd	a4,0(s1)
    80004e38:	10000637          	lui	a2,0x10000
    80004e3c:	02f71063          	bne	a4,a5,80004e5c <uartputc+0xc4>
    80004e40:	0340006f          	j	80004e74 <uartputc+0xdc>
    80004e44:	00074703          	lbu	a4,0(a4)
    80004e48:	00f93023          	sd	a5,0(s2)
    80004e4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004e50:	00093783          	ld	a5,0(s2)
    80004e54:	0004b703          	ld	a4,0(s1)
    80004e58:	00f70e63          	beq	a4,a5,80004e74 <uartputc+0xdc>
    80004e5c:	00564683          	lbu	a3,5(a2)
    80004e60:	01f7f713          	andi	a4,a5,31
    80004e64:	00e58733          	add	a4,a1,a4
    80004e68:	0206f693          	andi	a3,a3,32
    80004e6c:	00178793          	addi	a5,a5,1
    80004e70:	fc069ae3          	bnez	a3,80004e44 <uartputc+0xac>
    80004e74:	02813083          	ld	ra,40(sp)
    80004e78:	02013403          	ld	s0,32(sp)
    80004e7c:	01813483          	ld	s1,24(sp)
    80004e80:	01013903          	ld	s2,16(sp)
    80004e84:	00813983          	ld	s3,8(sp)
    80004e88:	03010113          	addi	sp,sp,48
    80004e8c:	00008067          	ret

0000000080004e90 <uartputc_sync>:
    80004e90:	ff010113          	addi	sp,sp,-16
    80004e94:	00813423          	sd	s0,8(sp)
    80004e98:	01010413          	addi	s0,sp,16
    80004e9c:	00002717          	auipc	a4,0x2
    80004ea0:	66c72703          	lw	a4,1644(a4) # 80007508 <panicked>
    80004ea4:	02071663          	bnez	a4,80004ed0 <uartputc_sync+0x40>
    80004ea8:	00050793          	mv	a5,a0
    80004eac:	100006b7          	lui	a3,0x10000
    80004eb0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004eb4:	02077713          	andi	a4,a4,32
    80004eb8:	fe070ce3          	beqz	a4,80004eb0 <uartputc_sync+0x20>
    80004ebc:	0ff7f793          	andi	a5,a5,255
    80004ec0:	00f68023          	sb	a5,0(a3)
    80004ec4:	00813403          	ld	s0,8(sp)
    80004ec8:	01010113          	addi	sp,sp,16
    80004ecc:	00008067          	ret
    80004ed0:	0000006f          	j	80004ed0 <uartputc_sync+0x40>

0000000080004ed4 <uartstart>:
    80004ed4:	ff010113          	addi	sp,sp,-16
    80004ed8:	00813423          	sd	s0,8(sp)
    80004edc:	01010413          	addi	s0,sp,16
    80004ee0:	00002617          	auipc	a2,0x2
    80004ee4:	63060613          	addi	a2,a2,1584 # 80007510 <uart_tx_r>
    80004ee8:	00002517          	auipc	a0,0x2
    80004eec:	63050513          	addi	a0,a0,1584 # 80007518 <uart_tx_w>
    80004ef0:	00063783          	ld	a5,0(a2)
    80004ef4:	00053703          	ld	a4,0(a0)
    80004ef8:	04f70263          	beq	a4,a5,80004f3c <uartstart+0x68>
    80004efc:	100005b7          	lui	a1,0x10000
    80004f00:	00004817          	auipc	a6,0x4
    80004f04:	8b080813          	addi	a6,a6,-1872 # 800087b0 <uart_tx_buf>
    80004f08:	01c0006f          	j	80004f24 <uartstart+0x50>
    80004f0c:	0006c703          	lbu	a4,0(a3)
    80004f10:	00f63023          	sd	a5,0(a2)
    80004f14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004f18:	00063783          	ld	a5,0(a2)
    80004f1c:	00053703          	ld	a4,0(a0)
    80004f20:	00f70e63          	beq	a4,a5,80004f3c <uartstart+0x68>
    80004f24:	01f7f713          	andi	a4,a5,31
    80004f28:	00e806b3          	add	a3,a6,a4
    80004f2c:	0055c703          	lbu	a4,5(a1)
    80004f30:	00178793          	addi	a5,a5,1
    80004f34:	02077713          	andi	a4,a4,32
    80004f38:	fc071ae3          	bnez	a4,80004f0c <uartstart+0x38>
    80004f3c:	00813403          	ld	s0,8(sp)
    80004f40:	01010113          	addi	sp,sp,16
    80004f44:	00008067          	ret

0000000080004f48 <uartgetc>:
    80004f48:	ff010113          	addi	sp,sp,-16
    80004f4c:	00813423          	sd	s0,8(sp)
    80004f50:	01010413          	addi	s0,sp,16
    80004f54:	10000737          	lui	a4,0x10000
    80004f58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004f5c:	0017f793          	andi	a5,a5,1
    80004f60:	00078c63          	beqz	a5,80004f78 <uartgetc+0x30>
    80004f64:	00074503          	lbu	a0,0(a4)
    80004f68:	0ff57513          	andi	a0,a0,255
    80004f6c:	00813403          	ld	s0,8(sp)
    80004f70:	01010113          	addi	sp,sp,16
    80004f74:	00008067          	ret
    80004f78:	fff00513          	li	a0,-1
    80004f7c:	ff1ff06f          	j	80004f6c <uartgetc+0x24>

0000000080004f80 <uartintr>:
    80004f80:	100007b7          	lui	a5,0x10000
    80004f84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004f88:	0017f793          	andi	a5,a5,1
    80004f8c:	0a078463          	beqz	a5,80005034 <uartintr+0xb4>
    80004f90:	fe010113          	addi	sp,sp,-32
    80004f94:	00813823          	sd	s0,16(sp)
    80004f98:	00913423          	sd	s1,8(sp)
    80004f9c:	00113c23          	sd	ra,24(sp)
    80004fa0:	02010413          	addi	s0,sp,32
    80004fa4:	100004b7          	lui	s1,0x10000
    80004fa8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004fac:	0ff57513          	andi	a0,a0,255
    80004fb0:	fffff097          	auipc	ra,0xfffff
    80004fb4:	534080e7          	jalr	1332(ra) # 800044e4 <consoleintr>
    80004fb8:	0054c783          	lbu	a5,5(s1)
    80004fbc:	0017f793          	andi	a5,a5,1
    80004fc0:	fe0794e3          	bnez	a5,80004fa8 <uartintr+0x28>
    80004fc4:	00002617          	auipc	a2,0x2
    80004fc8:	54c60613          	addi	a2,a2,1356 # 80007510 <uart_tx_r>
    80004fcc:	00002517          	auipc	a0,0x2
    80004fd0:	54c50513          	addi	a0,a0,1356 # 80007518 <uart_tx_w>
    80004fd4:	00063783          	ld	a5,0(a2)
    80004fd8:	00053703          	ld	a4,0(a0)
    80004fdc:	04f70263          	beq	a4,a5,80005020 <uartintr+0xa0>
    80004fe0:	100005b7          	lui	a1,0x10000
    80004fe4:	00003817          	auipc	a6,0x3
    80004fe8:	7cc80813          	addi	a6,a6,1996 # 800087b0 <uart_tx_buf>
    80004fec:	01c0006f          	j	80005008 <uartintr+0x88>
    80004ff0:	0006c703          	lbu	a4,0(a3)
    80004ff4:	00f63023          	sd	a5,0(a2)
    80004ff8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004ffc:	00063783          	ld	a5,0(a2)
    80005000:	00053703          	ld	a4,0(a0)
    80005004:	00f70e63          	beq	a4,a5,80005020 <uartintr+0xa0>
    80005008:	01f7f713          	andi	a4,a5,31
    8000500c:	00e806b3          	add	a3,a6,a4
    80005010:	0055c703          	lbu	a4,5(a1)
    80005014:	00178793          	addi	a5,a5,1
    80005018:	02077713          	andi	a4,a4,32
    8000501c:	fc071ae3          	bnez	a4,80004ff0 <uartintr+0x70>
    80005020:	01813083          	ld	ra,24(sp)
    80005024:	01013403          	ld	s0,16(sp)
    80005028:	00813483          	ld	s1,8(sp)
    8000502c:	02010113          	addi	sp,sp,32
    80005030:	00008067          	ret
    80005034:	00002617          	auipc	a2,0x2
    80005038:	4dc60613          	addi	a2,a2,1244 # 80007510 <uart_tx_r>
    8000503c:	00002517          	auipc	a0,0x2
    80005040:	4dc50513          	addi	a0,a0,1244 # 80007518 <uart_tx_w>
    80005044:	00063783          	ld	a5,0(a2)
    80005048:	00053703          	ld	a4,0(a0)
    8000504c:	04f70263          	beq	a4,a5,80005090 <uartintr+0x110>
    80005050:	100005b7          	lui	a1,0x10000
    80005054:	00003817          	auipc	a6,0x3
    80005058:	75c80813          	addi	a6,a6,1884 # 800087b0 <uart_tx_buf>
    8000505c:	01c0006f          	j	80005078 <uartintr+0xf8>
    80005060:	0006c703          	lbu	a4,0(a3)
    80005064:	00f63023          	sd	a5,0(a2)
    80005068:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000506c:	00063783          	ld	a5,0(a2)
    80005070:	00053703          	ld	a4,0(a0)
    80005074:	02f70063          	beq	a4,a5,80005094 <uartintr+0x114>
    80005078:	01f7f713          	andi	a4,a5,31
    8000507c:	00e806b3          	add	a3,a6,a4
    80005080:	0055c703          	lbu	a4,5(a1)
    80005084:	00178793          	addi	a5,a5,1
    80005088:	02077713          	andi	a4,a4,32
    8000508c:	fc071ae3          	bnez	a4,80005060 <uartintr+0xe0>
    80005090:	00008067          	ret
    80005094:	00008067          	ret

0000000080005098 <kinit>:
    80005098:	fc010113          	addi	sp,sp,-64
    8000509c:	02913423          	sd	s1,40(sp)
    800050a0:	fffff7b7          	lui	a5,0xfffff
    800050a4:	00004497          	auipc	s1,0x4
    800050a8:	72b48493          	addi	s1,s1,1835 # 800097cf <end+0xfff>
    800050ac:	02813823          	sd	s0,48(sp)
    800050b0:	01313c23          	sd	s3,24(sp)
    800050b4:	00f4f4b3          	and	s1,s1,a5
    800050b8:	02113c23          	sd	ra,56(sp)
    800050bc:	03213023          	sd	s2,32(sp)
    800050c0:	01413823          	sd	s4,16(sp)
    800050c4:	01513423          	sd	s5,8(sp)
    800050c8:	04010413          	addi	s0,sp,64
    800050cc:	000017b7          	lui	a5,0x1
    800050d0:	01100993          	li	s3,17
    800050d4:	00f487b3          	add	a5,s1,a5
    800050d8:	01b99993          	slli	s3,s3,0x1b
    800050dc:	06f9e063          	bltu	s3,a5,8000513c <kinit+0xa4>
    800050e0:	00003a97          	auipc	s5,0x3
    800050e4:	6f0a8a93          	addi	s5,s5,1776 # 800087d0 <end>
    800050e8:	0754ec63          	bltu	s1,s5,80005160 <kinit+0xc8>
    800050ec:	0734fa63          	bgeu	s1,s3,80005160 <kinit+0xc8>
    800050f0:	00088a37          	lui	s4,0x88
    800050f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800050f8:	00002917          	auipc	s2,0x2
    800050fc:	42890913          	addi	s2,s2,1064 # 80007520 <kmem>
    80005100:	00ca1a13          	slli	s4,s4,0xc
    80005104:	0140006f          	j	80005118 <kinit+0x80>
    80005108:	000017b7          	lui	a5,0x1
    8000510c:	00f484b3          	add	s1,s1,a5
    80005110:	0554e863          	bltu	s1,s5,80005160 <kinit+0xc8>
    80005114:	0534f663          	bgeu	s1,s3,80005160 <kinit+0xc8>
    80005118:	00001637          	lui	a2,0x1
    8000511c:	00100593          	li	a1,1
    80005120:	00048513          	mv	a0,s1
    80005124:	00000097          	auipc	ra,0x0
    80005128:	5e4080e7          	jalr	1508(ra) # 80005708 <__memset>
    8000512c:	00093783          	ld	a5,0(s2)
    80005130:	00f4b023          	sd	a5,0(s1)
    80005134:	00993023          	sd	s1,0(s2)
    80005138:	fd4498e3          	bne	s1,s4,80005108 <kinit+0x70>
    8000513c:	03813083          	ld	ra,56(sp)
    80005140:	03013403          	ld	s0,48(sp)
    80005144:	02813483          	ld	s1,40(sp)
    80005148:	02013903          	ld	s2,32(sp)
    8000514c:	01813983          	ld	s3,24(sp)
    80005150:	01013a03          	ld	s4,16(sp)
    80005154:	00813a83          	ld	s5,8(sp)
    80005158:	04010113          	addi	sp,sp,64
    8000515c:	00008067          	ret
    80005160:	00001517          	auipc	a0,0x1
    80005164:	3d850513          	addi	a0,a0,984 # 80006538 <digits+0x18>
    80005168:	fffff097          	auipc	ra,0xfffff
    8000516c:	4b4080e7          	jalr	1204(ra) # 8000461c <panic>

0000000080005170 <freerange>:
    80005170:	fc010113          	addi	sp,sp,-64
    80005174:	000017b7          	lui	a5,0x1
    80005178:	02913423          	sd	s1,40(sp)
    8000517c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005180:	009504b3          	add	s1,a0,s1
    80005184:	fffff537          	lui	a0,0xfffff
    80005188:	02813823          	sd	s0,48(sp)
    8000518c:	02113c23          	sd	ra,56(sp)
    80005190:	03213023          	sd	s2,32(sp)
    80005194:	01313c23          	sd	s3,24(sp)
    80005198:	01413823          	sd	s4,16(sp)
    8000519c:	01513423          	sd	s5,8(sp)
    800051a0:	01613023          	sd	s6,0(sp)
    800051a4:	04010413          	addi	s0,sp,64
    800051a8:	00a4f4b3          	and	s1,s1,a0
    800051ac:	00f487b3          	add	a5,s1,a5
    800051b0:	06f5e463          	bltu	a1,a5,80005218 <freerange+0xa8>
    800051b4:	00003a97          	auipc	s5,0x3
    800051b8:	61ca8a93          	addi	s5,s5,1564 # 800087d0 <end>
    800051bc:	0954e263          	bltu	s1,s5,80005240 <freerange+0xd0>
    800051c0:	01100993          	li	s3,17
    800051c4:	01b99993          	slli	s3,s3,0x1b
    800051c8:	0734fc63          	bgeu	s1,s3,80005240 <freerange+0xd0>
    800051cc:	00058a13          	mv	s4,a1
    800051d0:	00002917          	auipc	s2,0x2
    800051d4:	35090913          	addi	s2,s2,848 # 80007520 <kmem>
    800051d8:	00002b37          	lui	s6,0x2
    800051dc:	0140006f          	j	800051f0 <freerange+0x80>
    800051e0:	000017b7          	lui	a5,0x1
    800051e4:	00f484b3          	add	s1,s1,a5
    800051e8:	0554ec63          	bltu	s1,s5,80005240 <freerange+0xd0>
    800051ec:	0534fa63          	bgeu	s1,s3,80005240 <freerange+0xd0>
    800051f0:	00001637          	lui	a2,0x1
    800051f4:	00100593          	li	a1,1
    800051f8:	00048513          	mv	a0,s1
    800051fc:	00000097          	auipc	ra,0x0
    80005200:	50c080e7          	jalr	1292(ra) # 80005708 <__memset>
    80005204:	00093703          	ld	a4,0(s2)
    80005208:	016487b3          	add	a5,s1,s6
    8000520c:	00e4b023          	sd	a4,0(s1)
    80005210:	00993023          	sd	s1,0(s2)
    80005214:	fcfa76e3          	bgeu	s4,a5,800051e0 <freerange+0x70>
    80005218:	03813083          	ld	ra,56(sp)
    8000521c:	03013403          	ld	s0,48(sp)
    80005220:	02813483          	ld	s1,40(sp)
    80005224:	02013903          	ld	s2,32(sp)
    80005228:	01813983          	ld	s3,24(sp)
    8000522c:	01013a03          	ld	s4,16(sp)
    80005230:	00813a83          	ld	s5,8(sp)
    80005234:	00013b03          	ld	s6,0(sp)
    80005238:	04010113          	addi	sp,sp,64
    8000523c:	00008067          	ret
    80005240:	00001517          	auipc	a0,0x1
    80005244:	2f850513          	addi	a0,a0,760 # 80006538 <digits+0x18>
    80005248:	fffff097          	auipc	ra,0xfffff
    8000524c:	3d4080e7          	jalr	980(ra) # 8000461c <panic>

0000000080005250 <kfree>:
    80005250:	fe010113          	addi	sp,sp,-32
    80005254:	00813823          	sd	s0,16(sp)
    80005258:	00113c23          	sd	ra,24(sp)
    8000525c:	00913423          	sd	s1,8(sp)
    80005260:	02010413          	addi	s0,sp,32
    80005264:	03451793          	slli	a5,a0,0x34
    80005268:	04079c63          	bnez	a5,800052c0 <kfree+0x70>
    8000526c:	00003797          	auipc	a5,0x3
    80005270:	56478793          	addi	a5,a5,1380 # 800087d0 <end>
    80005274:	00050493          	mv	s1,a0
    80005278:	04f56463          	bltu	a0,a5,800052c0 <kfree+0x70>
    8000527c:	01100793          	li	a5,17
    80005280:	01b79793          	slli	a5,a5,0x1b
    80005284:	02f57e63          	bgeu	a0,a5,800052c0 <kfree+0x70>
    80005288:	00001637          	lui	a2,0x1
    8000528c:	00100593          	li	a1,1
    80005290:	00000097          	auipc	ra,0x0
    80005294:	478080e7          	jalr	1144(ra) # 80005708 <__memset>
    80005298:	00002797          	auipc	a5,0x2
    8000529c:	28878793          	addi	a5,a5,648 # 80007520 <kmem>
    800052a0:	0007b703          	ld	a4,0(a5)
    800052a4:	01813083          	ld	ra,24(sp)
    800052a8:	01013403          	ld	s0,16(sp)
    800052ac:	00e4b023          	sd	a4,0(s1)
    800052b0:	0097b023          	sd	s1,0(a5)
    800052b4:	00813483          	ld	s1,8(sp)
    800052b8:	02010113          	addi	sp,sp,32
    800052bc:	00008067          	ret
    800052c0:	00001517          	auipc	a0,0x1
    800052c4:	27850513          	addi	a0,a0,632 # 80006538 <digits+0x18>
    800052c8:	fffff097          	auipc	ra,0xfffff
    800052cc:	354080e7          	jalr	852(ra) # 8000461c <panic>

00000000800052d0 <kalloc>:
    800052d0:	fe010113          	addi	sp,sp,-32
    800052d4:	00813823          	sd	s0,16(sp)
    800052d8:	00913423          	sd	s1,8(sp)
    800052dc:	00113c23          	sd	ra,24(sp)
    800052e0:	02010413          	addi	s0,sp,32
    800052e4:	00002797          	auipc	a5,0x2
    800052e8:	23c78793          	addi	a5,a5,572 # 80007520 <kmem>
    800052ec:	0007b483          	ld	s1,0(a5)
    800052f0:	02048063          	beqz	s1,80005310 <kalloc+0x40>
    800052f4:	0004b703          	ld	a4,0(s1)
    800052f8:	00001637          	lui	a2,0x1
    800052fc:	00500593          	li	a1,5
    80005300:	00048513          	mv	a0,s1
    80005304:	00e7b023          	sd	a4,0(a5)
    80005308:	00000097          	auipc	ra,0x0
    8000530c:	400080e7          	jalr	1024(ra) # 80005708 <__memset>
    80005310:	01813083          	ld	ra,24(sp)
    80005314:	01013403          	ld	s0,16(sp)
    80005318:	00048513          	mv	a0,s1
    8000531c:	00813483          	ld	s1,8(sp)
    80005320:	02010113          	addi	sp,sp,32
    80005324:	00008067          	ret

0000000080005328 <initlock>:
    80005328:	ff010113          	addi	sp,sp,-16
    8000532c:	00813423          	sd	s0,8(sp)
    80005330:	01010413          	addi	s0,sp,16
    80005334:	00813403          	ld	s0,8(sp)
    80005338:	00b53423          	sd	a1,8(a0)
    8000533c:	00052023          	sw	zero,0(a0)
    80005340:	00053823          	sd	zero,16(a0)
    80005344:	01010113          	addi	sp,sp,16
    80005348:	00008067          	ret

000000008000534c <acquire>:
    8000534c:	fe010113          	addi	sp,sp,-32
    80005350:	00813823          	sd	s0,16(sp)
    80005354:	00913423          	sd	s1,8(sp)
    80005358:	00113c23          	sd	ra,24(sp)
    8000535c:	01213023          	sd	s2,0(sp)
    80005360:	02010413          	addi	s0,sp,32
    80005364:	00050493          	mv	s1,a0
    80005368:	10002973          	csrr	s2,sstatus
    8000536c:	100027f3          	csrr	a5,sstatus
    80005370:	ffd7f793          	andi	a5,a5,-3
    80005374:	10079073          	csrw	sstatus,a5
    80005378:	fffff097          	auipc	ra,0xfffff
    8000537c:	8ec080e7          	jalr	-1812(ra) # 80003c64 <mycpu>
    80005380:	07852783          	lw	a5,120(a0)
    80005384:	06078e63          	beqz	a5,80005400 <acquire+0xb4>
    80005388:	fffff097          	auipc	ra,0xfffff
    8000538c:	8dc080e7          	jalr	-1828(ra) # 80003c64 <mycpu>
    80005390:	07852783          	lw	a5,120(a0)
    80005394:	0004a703          	lw	a4,0(s1)
    80005398:	0017879b          	addiw	a5,a5,1
    8000539c:	06f52c23          	sw	a5,120(a0)
    800053a0:	04071063          	bnez	a4,800053e0 <acquire+0x94>
    800053a4:	00100713          	li	a4,1
    800053a8:	00070793          	mv	a5,a4
    800053ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800053b0:	0007879b          	sext.w	a5,a5
    800053b4:	fe079ae3          	bnez	a5,800053a8 <acquire+0x5c>
    800053b8:	0ff0000f          	fence
    800053bc:	fffff097          	auipc	ra,0xfffff
    800053c0:	8a8080e7          	jalr	-1880(ra) # 80003c64 <mycpu>
    800053c4:	01813083          	ld	ra,24(sp)
    800053c8:	01013403          	ld	s0,16(sp)
    800053cc:	00a4b823          	sd	a0,16(s1)
    800053d0:	00013903          	ld	s2,0(sp)
    800053d4:	00813483          	ld	s1,8(sp)
    800053d8:	02010113          	addi	sp,sp,32
    800053dc:	00008067          	ret
    800053e0:	0104b903          	ld	s2,16(s1)
    800053e4:	fffff097          	auipc	ra,0xfffff
    800053e8:	880080e7          	jalr	-1920(ra) # 80003c64 <mycpu>
    800053ec:	faa91ce3          	bne	s2,a0,800053a4 <acquire+0x58>
    800053f0:	00001517          	auipc	a0,0x1
    800053f4:	15050513          	addi	a0,a0,336 # 80006540 <digits+0x20>
    800053f8:	fffff097          	auipc	ra,0xfffff
    800053fc:	224080e7          	jalr	548(ra) # 8000461c <panic>
    80005400:	00195913          	srli	s2,s2,0x1
    80005404:	fffff097          	auipc	ra,0xfffff
    80005408:	860080e7          	jalr	-1952(ra) # 80003c64 <mycpu>
    8000540c:	00197913          	andi	s2,s2,1
    80005410:	07252e23          	sw	s2,124(a0)
    80005414:	f75ff06f          	j	80005388 <acquire+0x3c>

0000000080005418 <release>:
    80005418:	fe010113          	addi	sp,sp,-32
    8000541c:	00813823          	sd	s0,16(sp)
    80005420:	00113c23          	sd	ra,24(sp)
    80005424:	00913423          	sd	s1,8(sp)
    80005428:	01213023          	sd	s2,0(sp)
    8000542c:	02010413          	addi	s0,sp,32
    80005430:	00052783          	lw	a5,0(a0)
    80005434:	00079a63          	bnez	a5,80005448 <release+0x30>
    80005438:	00001517          	auipc	a0,0x1
    8000543c:	11050513          	addi	a0,a0,272 # 80006548 <digits+0x28>
    80005440:	fffff097          	auipc	ra,0xfffff
    80005444:	1dc080e7          	jalr	476(ra) # 8000461c <panic>
    80005448:	01053903          	ld	s2,16(a0)
    8000544c:	00050493          	mv	s1,a0
    80005450:	fffff097          	auipc	ra,0xfffff
    80005454:	814080e7          	jalr	-2028(ra) # 80003c64 <mycpu>
    80005458:	fea910e3          	bne	s2,a0,80005438 <release+0x20>
    8000545c:	0004b823          	sd	zero,16(s1)
    80005460:	0ff0000f          	fence
    80005464:	0f50000f          	fence	iorw,ow
    80005468:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000546c:	ffffe097          	auipc	ra,0xffffe
    80005470:	7f8080e7          	jalr	2040(ra) # 80003c64 <mycpu>
    80005474:	100027f3          	csrr	a5,sstatus
    80005478:	0027f793          	andi	a5,a5,2
    8000547c:	04079a63          	bnez	a5,800054d0 <release+0xb8>
    80005480:	07852783          	lw	a5,120(a0)
    80005484:	02f05e63          	blez	a5,800054c0 <release+0xa8>
    80005488:	fff7871b          	addiw	a4,a5,-1
    8000548c:	06e52c23          	sw	a4,120(a0)
    80005490:	00071c63          	bnez	a4,800054a8 <release+0x90>
    80005494:	07c52783          	lw	a5,124(a0)
    80005498:	00078863          	beqz	a5,800054a8 <release+0x90>
    8000549c:	100027f3          	csrr	a5,sstatus
    800054a0:	0027e793          	ori	a5,a5,2
    800054a4:	10079073          	csrw	sstatus,a5
    800054a8:	01813083          	ld	ra,24(sp)
    800054ac:	01013403          	ld	s0,16(sp)
    800054b0:	00813483          	ld	s1,8(sp)
    800054b4:	00013903          	ld	s2,0(sp)
    800054b8:	02010113          	addi	sp,sp,32
    800054bc:	00008067          	ret
    800054c0:	00001517          	auipc	a0,0x1
    800054c4:	0a850513          	addi	a0,a0,168 # 80006568 <digits+0x48>
    800054c8:	fffff097          	auipc	ra,0xfffff
    800054cc:	154080e7          	jalr	340(ra) # 8000461c <panic>
    800054d0:	00001517          	auipc	a0,0x1
    800054d4:	08050513          	addi	a0,a0,128 # 80006550 <digits+0x30>
    800054d8:	fffff097          	auipc	ra,0xfffff
    800054dc:	144080e7          	jalr	324(ra) # 8000461c <panic>

00000000800054e0 <holding>:
    800054e0:	00052783          	lw	a5,0(a0)
    800054e4:	00079663          	bnez	a5,800054f0 <holding+0x10>
    800054e8:	00000513          	li	a0,0
    800054ec:	00008067          	ret
    800054f0:	fe010113          	addi	sp,sp,-32
    800054f4:	00813823          	sd	s0,16(sp)
    800054f8:	00913423          	sd	s1,8(sp)
    800054fc:	00113c23          	sd	ra,24(sp)
    80005500:	02010413          	addi	s0,sp,32
    80005504:	01053483          	ld	s1,16(a0)
    80005508:	ffffe097          	auipc	ra,0xffffe
    8000550c:	75c080e7          	jalr	1884(ra) # 80003c64 <mycpu>
    80005510:	01813083          	ld	ra,24(sp)
    80005514:	01013403          	ld	s0,16(sp)
    80005518:	40a48533          	sub	a0,s1,a0
    8000551c:	00153513          	seqz	a0,a0
    80005520:	00813483          	ld	s1,8(sp)
    80005524:	02010113          	addi	sp,sp,32
    80005528:	00008067          	ret

000000008000552c <push_off>:
    8000552c:	fe010113          	addi	sp,sp,-32
    80005530:	00813823          	sd	s0,16(sp)
    80005534:	00113c23          	sd	ra,24(sp)
    80005538:	00913423          	sd	s1,8(sp)
    8000553c:	02010413          	addi	s0,sp,32
    80005540:	100024f3          	csrr	s1,sstatus
    80005544:	100027f3          	csrr	a5,sstatus
    80005548:	ffd7f793          	andi	a5,a5,-3
    8000554c:	10079073          	csrw	sstatus,a5
    80005550:	ffffe097          	auipc	ra,0xffffe
    80005554:	714080e7          	jalr	1812(ra) # 80003c64 <mycpu>
    80005558:	07852783          	lw	a5,120(a0)
    8000555c:	02078663          	beqz	a5,80005588 <push_off+0x5c>
    80005560:	ffffe097          	auipc	ra,0xffffe
    80005564:	704080e7          	jalr	1796(ra) # 80003c64 <mycpu>
    80005568:	07852783          	lw	a5,120(a0)
    8000556c:	01813083          	ld	ra,24(sp)
    80005570:	01013403          	ld	s0,16(sp)
    80005574:	0017879b          	addiw	a5,a5,1
    80005578:	06f52c23          	sw	a5,120(a0)
    8000557c:	00813483          	ld	s1,8(sp)
    80005580:	02010113          	addi	sp,sp,32
    80005584:	00008067          	ret
    80005588:	0014d493          	srli	s1,s1,0x1
    8000558c:	ffffe097          	auipc	ra,0xffffe
    80005590:	6d8080e7          	jalr	1752(ra) # 80003c64 <mycpu>
    80005594:	0014f493          	andi	s1,s1,1
    80005598:	06952e23          	sw	s1,124(a0)
    8000559c:	fc5ff06f          	j	80005560 <push_off+0x34>

00000000800055a0 <pop_off>:
    800055a0:	ff010113          	addi	sp,sp,-16
    800055a4:	00813023          	sd	s0,0(sp)
    800055a8:	00113423          	sd	ra,8(sp)
    800055ac:	01010413          	addi	s0,sp,16
    800055b0:	ffffe097          	auipc	ra,0xffffe
    800055b4:	6b4080e7          	jalr	1716(ra) # 80003c64 <mycpu>
    800055b8:	100027f3          	csrr	a5,sstatus
    800055bc:	0027f793          	andi	a5,a5,2
    800055c0:	04079663          	bnez	a5,8000560c <pop_off+0x6c>
    800055c4:	07852783          	lw	a5,120(a0)
    800055c8:	02f05a63          	blez	a5,800055fc <pop_off+0x5c>
    800055cc:	fff7871b          	addiw	a4,a5,-1
    800055d0:	06e52c23          	sw	a4,120(a0)
    800055d4:	00071c63          	bnez	a4,800055ec <pop_off+0x4c>
    800055d8:	07c52783          	lw	a5,124(a0)
    800055dc:	00078863          	beqz	a5,800055ec <pop_off+0x4c>
    800055e0:	100027f3          	csrr	a5,sstatus
    800055e4:	0027e793          	ori	a5,a5,2
    800055e8:	10079073          	csrw	sstatus,a5
    800055ec:	00813083          	ld	ra,8(sp)
    800055f0:	00013403          	ld	s0,0(sp)
    800055f4:	01010113          	addi	sp,sp,16
    800055f8:	00008067          	ret
    800055fc:	00001517          	auipc	a0,0x1
    80005600:	f6c50513          	addi	a0,a0,-148 # 80006568 <digits+0x48>
    80005604:	fffff097          	auipc	ra,0xfffff
    80005608:	018080e7          	jalr	24(ra) # 8000461c <panic>
    8000560c:	00001517          	auipc	a0,0x1
    80005610:	f4450513          	addi	a0,a0,-188 # 80006550 <digits+0x30>
    80005614:	fffff097          	auipc	ra,0xfffff
    80005618:	008080e7          	jalr	8(ra) # 8000461c <panic>

000000008000561c <push_on>:
    8000561c:	fe010113          	addi	sp,sp,-32
    80005620:	00813823          	sd	s0,16(sp)
    80005624:	00113c23          	sd	ra,24(sp)
    80005628:	00913423          	sd	s1,8(sp)
    8000562c:	02010413          	addi	s0,sp,32
    80005630:	100024f3          	csrr	s1,sstatus
    80005634:	100027f3          	csrr	a5,sstatus
    80005638:	0027e793          	ori	a5,a5,2
    8000563c:	10079073          	csrw	sstatus,a5
    80005640:	ffffe097          	auipc	ra,0xffffe
    80005644:	624080e7          	jalr	1572(ra) # 80003c64 <mycpu>
    80005648:	07852783          	lw	a5,120(a0)
    8000564c:	02078663          	beqz	a5,80005678 <push_on+0x5c>
    80005650:	ffffe097          	auipc	ra,0xffffe
    80005654:	614080e7          	jalr	1556(ra) # 80003c64 <mycpu>
    80005658:	07852783          	lw	a5,120(a0)
    8000565c:	01813083          	ld	ra,24(sp)
    80005660:	01013403          	ld	s0,16(sp)
    80005664:	0017879b          	addiw	a5,a5,1
    80005668:	06f52c23          	sw	a5,120(a0)
    8000566c:	00813483          	ld	s1,8(sp)
    80005670:	02010113          	addi	sp,sp,32
    80005674:	00008067          	ret
    80005678:	0014d493          	srli	s1,s1,0x1
    8000567c:	ffffe097          	auipc	ra,0xffffe
    80005680:	5e8080e7          	jalr	1512(ra) # 80003c64 <mycpu>
    80005684:	0014f493          	andi	s1,s1,1
    80005688:	06952e23          	sw	s1,124(a0)
    8000568c:	fc5ff06f          	j	80005650 <push_on+0x34>

0000000080005690 <pop_on>:
    80005690:	ff010113          	addi	sp,sp,-16
    80005694:	00813023          	sd	s0,0(sp)
    80005698:	00113423          	sd	ra,8(sp)
    8000569c:	01010413          	addi	s0,sp,16
    800056a0:	ffffe097          	auipc	ra,0xffffe
    800056a4:	5c4080e7          	jalr	1476(ra) # 80003c64 <mycpu>
    800056a8:	100027f3          	csrr	a5,sstatus
    800056ac:	0027f793          	andi	a5,a5,2
    800056b0:	04078463          	beqz	a5,800056f8 <pop_on+0x68>
    800056b4:	07852783          	lw	a5,120(a0)
    800056b8:	02f05863          	blez	a5,800056e8 <pop_on+0x58>
    800056bc:	fff7879b          	addiw	a5,a5,-1
    800056c0:	06f52c23          	sw	a5,120(a0)
    800056c4:	07853783          	ld	a5,120(a0)
    800056c8:	00079863          	bnez	a5,800056d8 <pop_on+0x48>
    800056cc:	100027f3          	csrr	a5,sstatus
    800056d0:	ffd7f793          	andi	a5,a5,-3
    800056d4:	10079073          	csrw	sstatus,a5
    800056d8:	00813083          	ld	ra,8(sp)
    800056dc:	00013403          	ld	s0,0(sp)
    800056e0:	01010113          	addi	sp,sp,16
    800056e4:	00008067          	ret
    800056e8:	00001517          	auipc	a0,0x1
    800056ec:	ea850513          	addi	a0,a0,-344 # 80006590 <digits+0x70>
    800056f0:	fffff097          	auipc	ra,0xfffff
    800056f4:	f2c080e7          	jalr	-212(ra) # 8000461c <panic>
    800056f8:	00001517          	auipc	a0,0x1
    800056fc:	e7850513          	addi	a0,a0,-392 # 80006570 <digits+0x50>
    80005700:	fffff097          	auipc	ra,0xfffff
    80005704:	f1c080e7          	jalr	-228(ra) # 8000461c <panic>

0000000080005708 <__memset>:
    80005708:	ff010113          	addi	sp,sp,-16
    8000570c:	00813423          	sd	s0,8(sp)
    80005710:	01010413          	addi	s0,sp,16
    80005714:	1a060e63          	beqz	a2,800058d0 <__memset+0x1c8>
    80005718:	40a007b3          	neg	a5,a0
    8000571c:	0077f793          	andi	a5,a5,7
    80005720:	00778693          	addi	a3,a5,7
    80005724:	00b00813          	li	a6,11
    80005728:	0ff5f593          	andi	a1,a1,255
    8000572c:	fff6071b          	addiw	a4,a2,-1
    80005730:	1b06e663          	bltu	a3,a6,800058dc <__memset+0x1d4>
    80005734:	1cd76463          	bltu	a4,a3,800058fc <__memset+0x1f4>
    80005738:	1a078e63          	beqz	a5,800058f4 <__memset+0x1ec>
    8000573c:	00b50023          	sb	a1,0(a0)
    80005740:	00100713          	li	a4,1
    80005744:	1ae78463          	beq	a5,a4,800058ec <__memset+0x1e4>
    80005748:	00b500a3          	sb	a1,1(a0)
    8000574c:	00200713          	li	a4,2
    80005750:	1ae78a63          	beq	a5,a4,80005904 <__memset+0x1fc>
    80005754:	00b50123          	sb	a1,2(a0)
    80005758:	00300713          	li	a4,3
    8000575c:	18e78463          	beq	a5,a4,800058e4 <__memset+0x1dc>
    80005760:	00b501a3          	sb	a1,3(a0)
    80005764:	00400713          	li	a4,4
    80005768:	1ae78263          	beq	a5,a4,8000590c <__memset+0x204>
    8000576c:	00b50223          	sb	a1,4(a0)
    80005770:	00500713          	li	a4,5
    80005774:	1ae78063          	beq	a5,a4,80005914 <__memset+0x20c>
    80005778:	00b502a3          	sb	a1,5(a0)
    8000577c:	00700713          	li	a4,7
    80005780:	18e79e63          	bne	a5,a4,8000591c <__memset+0x214>
    80005784:	00b50323          	sb	a1,6(a0)
    80005788:	00700e93          	li	t4,7
    8000578c:	00859713          	slli	a4,a1,0x8
    80005790:	00e5e733          	or	a4,a1,a4
    80005794:	01059e13          	slli	t3,a1,0x10
    80005798:	01c76e33          	or	t3,a4,t3
    8000579c:	01859313          	slli	t1,a1,0x18
    800057a0:	006e6333          	or	t1,t3,t1
    800057a4:	02059893          	slli	a7,a1,0x20
    800057a8:	40f60e3b          	subw	t3,a2,a5
    800057ac:	011368b3          	or	a7,t1,a7
    800057b0:	02859813          	slli	a6,a1,0x28
    800057b4:	0108e833          	or	a6,a7,a6
    800057b8:	03059693          	slli	a3,a1,0x30
    800057bc:	003e589b          	srliw	a7,t3,0x3
    800057c0:	00d866b3          	or	a3,a6,a3
    800057c4:	03859713          	slli	a4,a1,0x38
    800057c8:	00389813          	slli	a6,a7,0x3
    800057cc:	00f507b3          	add	a5,a0,a5
    800057d0:	00e6e733          	or	a4,a3,a4
    800057d4:	000e089b          	sext.w	a7,t3
    800057d8:	00f806b3          	add	a3,a6,a5
    800057dc:	00e7b023          	sd	a4,0(a5)
    800057e0:	00878793          	addi	a5,a5,8
    800057e4:	fed79ce3          	bne	a5,a3,800057dc <__memset+0xd4>
    800057e8:	ff8e7793          	andi	a5,t3,-8
    800057ec:	0007871b          	sext.w	a4,a5
    800057f0:	01d787bb          	addw	a5,a5,t4
    800057f4:	0ce88e63          	beq	a7,a4,800058d0 <__memset+0x1c8>
    800057f8:	00f50733          	add	a4,a0,a5
    800057fc:	00b70023          	sb	a1,0(a4)
    80005800:	0017871b          	addiw	a4,a5,1
    80005804:	0cc77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005808:	00e50733          	add	a4,a0,a4
    8000580c:	00b70023          	sb	a1,0(a4)
    80005810:	0027871b          	addiw	a4,a5,2
    80005814:	0ac77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005818:	00e50733          	add	a4,a0,a4
    8000581c:	00b70023          	sb	a1,0(a4)
    80005820:	0037871b          	addiw	a4,a5,3
    80005824:	0ac77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005828:	00e50733          	add	a4,a0,a4
    8000582c:	00b70023          	sb	a1,0(a4)
    80005830:	0047871b          	addiw	a4,a5,4
    80005834:	08c77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005838:	00e50733          	add	a4,a0,a4
    8000583c:	00b70023          	sb	a1,0(a4)
    80005840:	0057871b          	addiw	a4,a5,5
    80005844:	08c77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005848:	00e50733          	add	a4,a0,a4
    8000584c:	00b70023          	sb	a1,0(a4)
    80005850:	0067871b          	addiw	a4,a5,6
    80005854:	06c77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005858:	00e50733          	add	a4,a0,a4
    8000585c:	00b70023          	sb	a1,0(a4)
    80005860:	0077871b          	addiw	a4,a5,7
    80005864:	06c77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005868:	00e50733          	add	a4,a0,a4
    8000586c:	00b70023          	sb	a1,0(a4)
    80005870:	0087871b          	addiw	a4,a5,8
    80005874:	04c77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005878:	00e50733          	add	a4,a0,a4
    8000587c:	00b70023          	sb	a1,0(a4)
    80005880:	0097871b          	addiw	a4,a5,9
    80005884:	04c77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005888:	00e50733          	add	a4,a0,a4
    8000588c:	00b70023          	sb	a1,0(a4)
    80005890:	00a7871b          	addiw	a4,a5,10
    80005894:	02c77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    80005898:	00e50733          	add	a4,a0,a4
    8000589c:	00b70023          	sb	a1,0(a4)
    800058a0:	00b7871b          	addiw	a4,a5,11
    800058a4:	02c77663          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    800058a8:	00e50733          	add	a4,a0,a4
    800058ac:	00b70023          	sb	a1,0(a4)
    800058b0:	00c7871b          	addiw	a4,a5,12
    800058b4:	00c77e63          	bgeu	a4,a2,800058d0 <__memset+0x1c8>
    800058b8:	00e50733          	add	a4,a0,a4
    800058bc:	00b70023          	sb	a1,0(a4)
    800058c0:	00d7879b          	addiw	a5,a5,13
    800058c4:	00c7f663          	bgeu	a5,a2,800058d0 <__memset+0x1c8>
    800058c8:	00f507b3          	add	a5,a0,a5
    800058cc:	00b78023          	sb	a1,0(a5)
    800058d0:	00813403          	ld	s0,8(sp)
    800058d4:	01010113          	addi	sp,sp,16
    800058d8:	00008067          	ret
    800058dc:	00b00693          	li	a3,11
    800058e0:	e55ff06f          	j	80005734 <__memset+0x2c>
    800058e4:	00300e93          	li	t4,3
    800058e8:	ea5ff06f          	j	8000578c <__memset+0x84>
    800058ec:	00100e93          	li	t4,1
    800058f0:	e9dff06f          	j	8000578c <__memset+0x84>
    800058f4:	00000e93          	li	t4,0
    800058f8:	e95ff06f          	j	8000578c <__memset+0x84>
    800058fc:	00000793          	li	a5,0
    80005900:	ef9ff06f          	j	800057f8 <__memset+0xf0>
    80005904:	00200e93          	li	t4,2
    80005908:	e85ff06f          	j	8000578c <__memset+0x84>
    8000590c:	00400e93          	li	t4,4
    80005910:	e7dff06f          	j	8000578c <__memset+0x84>
    80005914:	00500e93          	li	t4,5
    80005918:	e75ff06f          	j	8000578c <__memset+0x84>
    8000591c:	00600e93          	li	t4,6
    80005920:	e6dff06f          	j	8000578c <__memset+0x84>

0000000080005924 <__memmove>:
    80005924:	ff010113          	addi	sp,sp,-16
    80005928:	00813423          	sd	s0,8(sp)
    8000592c:	01010413          	addi	s0,sp,16
    80005930:	0e060863          	beqz	a2,80005a20 <__memmove+0xfc>
    80005934:	fff6069b          	addiw	a3,a2,-1
    80005938:	0006881b          	sext.w	a6,a3
    8000593c:	0ea5e863          	bltu	a1,a0,80005a2c <__memmove+0x108>
    80005940:	00758713          	addi	a4,a1,7
    80005944:	00a5e7b3          	or	a5,a1,a0
    80005948:	40a70733          	sub	a4,a4,a0
    8000594c:	0077f793          	andi	a5,a5,7
    80005950:	00f73713          	sltiu	a4,a4,15
    80005954:	00174713          	xori	a4,a4,1
    80005958:	0017b793          	seqz	a5,a5
    8000595c:	00e7f7b3          	and	a5,a5,a4
    80005960:	10078863          	beqz	a5,80005a70 <__memmove+0x14c>
    80005964:	00900793          	li	a5,9
    80005968:	1107f463          	bgeu	a5,a6,80005a70 <__memmove+0x14c>
    8000596c:	0036581b          	srliw	a6,a2,0x3
    80005970:	fff8081b          	addiw	a6,a6,-1
    80005974:	02081813          	slli	a6,a6,0x20
    80005978:	01d85893          	srli	a7,a6,0x1d
    8000597c:	00858813          	addi	a6,a1,8
    80005980:	00058793          	mv	a5,a1
    80005984:	00050713          	mv	a4,a0
    80005988:	01088833          	add	a6,a7,a6
    8000598c:	0007b883          	ld	a7,0(a5)
    80005990:	00878793          	addi	a5,a5,8
    80005994:	00870713          	addi	a4,a4,8
    80005998:	ff173c23          	sd	a7,-8(a4)
    8000599c:	ff0798e3          	bne	a5,a6,8000598c <__memmove+0x68>
    800059a0:	ff867713          	andi	a4,a2,-8
    800059a4:	02071793          	slli	a5,a4,0x20
    800059a8:	0207d793          	srli	a5,a5,0x20
    800059ac:	00f585b3          	add	a1,a1,a5
    800059b0:	40e686bb          	subw	a3,a3,a4
    800059b4:	00f507b3          	add	a5,a0,a5
    800059b8:	06e60463          	beq	a2,a4,80005a20 <__memmove+0xfc>
    800059bc:	0005c703          	lbu	a4,0(a1)
    800059c0:	00e78023          	sb	a4,0(a5)
    800059c4:	04068e63          	beqz	a3,80005a20 <__memmove+0xfc>
    800059c8:	0015c603          	lbu	a2,1(a1)
    800059cc:	00100713          	li	a4,1
    800059d0:	00c780a3          	sb	a2,1(a5)
    800059d4:	04e68663          	beq	a3,a4,80005a20 <__memmove+0xfc>
    800059d8:	0025c603          	lbu	a2,2(a1)
    800059dc:	00200713          	li	a4,2
    800059e0:	00c78123          	sb	a2,2(a5)
    800059e4:	02e68e63          	beq	a3,a4,80005a20 <__memmove+0xfc>
    800059e8:	0035c603          	lbu	a2,3(a1)
    800059ec:	00300713          	li	a4,3
    800059f0:	00c781a3          	sb	a2,3(a5)
    800059f4:	02e68663          	beq	a3,a4,80005a20 <__memmove+0xfc>
    800059f8:	0045c603          	lbu	a2,4(a1)
    800059fc:	00400713          	li	a4,4
    80005a00:	00c78223          	sb	a2,4(a5)
    80005a04:	00e68e63          	beq	a3,a4,80005a20 <__memmove+0xfc>
    80005a08:	0055c603          	lbu	a2,5(a1)
    80005a0c:	00500713          	li	a4,5
    80005a10:	00c782a3          	sb	a2,5(a5)
    80005a14:	00e68663          	beq	a3,a4,80005a20 <__memmove+0xfc>
    80005a18:	0065c703          	lbu	a4,6(a1)
    80005a1c:	00e78323          	sb	a4,6(a5)
    80005a20:	00813403          	ld	s0,8(sp)
    80005a24:	01010113          	addi	sp,sp,16
    80005a28:	00008067          	ret
    80005a2c:	02061713          	slli	a4,a2,0x20
    80005a30:	02075713          	srli	a4,a4,0x20
    80005a34:	00e587b3          	add	a5,a1,a4
    80005a38:	f0f574e3          	bgeu	a0,a5,80005940 <__memmove+0x1c>
    80005a3c:	02069613          	slli	a2,a3,0x20
    80005a40:	02065613          	srli	a2,a2,0x20
    80005a44:	fff64613          	not	a2,a2
    80005a48:	00e50733          	add	a4,a0,a4
    80005a4c:	00c78633          	add	a2,a5,a2
    80005a50:	fff7c683          	lbu	a3,-1(a5)
    80005a54:	fff78793          	addi	a5,a5,-1
    80005a58:	fff70713          	addi	a4,a4,-1
    80005a5c:	00d70023          	sb	a3,0(a4)
    80005a60:	fec798e3          	bne	a5,a2,80005a50 <__memmove+0x12c>
    80005a64:	00813403          	ld	s0,8(sp)
    80005a68:	01010113          	addi	sp,sp,16
    80005a6c:	00008067          	ret
    80005a70:	02069713          	slli	a4,a3,0x20
    80005a74:	02075713          	srli	a4,a4,0x20
    80005a78:	00170713          	addi	a4,a4,1
    80005a7c:	00e50733          	add	a4,a0,a4
    80005a80:	00050793          	mv	a5,a0
    80005a84:	0005c683          	lbu	a3,0(a1)
    80005a88:	00178793          	addi	a5,a5,1
    80005a8c:	00158593          	addi	a1,a1,1
    80005a90:	fed78fa3          	sb	a3,-1(a5)
    80005a94:	fee798e3          	bne	a5,a4,80005a84 <__memmove+0x160>
    80005a98:	f89ff06f          	j	80005a20 <__memmove+0xfc>

0000000080005a9c <__putc>:
    80005a9c:	fe010113          	addi	sp,sp,-32
    80005aa0:	00813823          	sd	s0,16(sp)
    80005aa4:	00113c23          	sd	ra,24(sp)
    80005aa8:	02010413          	addi	s0,sp,32
    80005aac:	00050793          	mv	a5,a0
    80005ab0:	fef40593          	addi	a1,s0,-17
    80005ab4:	00100613          	li	a2,1
    80005ab8:	00000513          	li	a0,0
    80005abc:	fef407a3          	sb	a5,-17(s0)
    80005ac0:	fffff097          	auipc	ra,0xfffff
    80005ac4:	b3c080e7          	jalr	-1220(ra) # 800045fc <console_write>
    80005ac8:	01813083          	ld	ra,24(sp)
    80005acc:	01013403          	ld	s0,16(sp)
    80005ad0:	02010113          	addi	sp,sp,32
    80005ad4:	00008067          	ret

0000000080005ad8 <__getc>:
    80005ad8:	fe010113          	addi	sp,sp,-32
    80005adc:	00813823          	sd	s0,16(sp)
    80005ae0:	00113c23          	sd	ra,24(sp)
    80005ae4:	02010413          	addi	s0,sp,32
    80005ae8:	fe840593          	addi	a1,s0,-24
    80005aec:	00100613          	li	a2,1
    80005af0:	00000513          	li	a0,0
    80005af4:	fffff097          	auipc	ra,0xfffff
    80005af8:	ae8080e7          	jalr	-1304(ra) # 800045dc <console_read>
    80005afc:	fe844503          	lbu	a0,-24(s0)
    80005b00:	01813083          	ld	ra,24(sp)
    80005b04:	01013403          	ld	s0,16(sp)
    80005b08:	02010113          	addi	sp,sp,32
    80005b0c:	00008067          	ret

0000000080005b10 <console_handler>:
    80005b10:	fe010113          	addi	sp,sp,-32
    80005b14:	00813823          	sd	s0,16(sp)
    80005b18:	00113c23          	sd	ra,24(sp)
    80005b1c:	00913423          	sd	s1,8(sp)
    80005b20:	02010413          	addi	s0,sp,32
    80005b24:	14202773          	csrr	a4,scause
    80005b28:	100027f3          	csrr	a5,sstatus
    80005b2c:	0027f793          	andi	a5,a5,2
    80005b30:	06079e63          	bnez	a5,80005bac <console_handler+0x9c>
    80005b34:	00074c63          	bltz	a4,80005b4c <console_handler+0x3c>
    80005b38:	01813083          	ld	ra,24(sp)
    80005b3c:	01013403          	ld	s0,16(sp)
    80005b40:	00813483          	ld	s1,8(sp)
    80005b44:	02010113          	addi	sp,sp,32
    80005b48:	00008067          	ret
    80005b4c:	0ff77713          	andi	a4,a4,255
    80005b50:	00900793          	li	a5,9
    80005b54:	fef712e3          	bne	a4,a5,80005b38 <console_handler+0x28>
    80005b58:	ffffe097          	auipc	ra,0xffffe
    80005b5c:	6dc080e7          	jalr	1756(ra) # 80004234 <plic_claim>
    80005b60:	00a00793          	li	a5,10
    80005b64:	00050493          	mv	s1,a0
    80005b68:	02f50c63          	beq	a0,a5,80005ba0 <console_handler+0x90>
    80005b6c:	fc0506e3          	beqz	a0,80005b38 <console_handler+0x28>
    80005b70:	00050593          	mv	a1,a0
    80005b74:	00001517          	auipc	a0,0x1
    80005b78:	92450513          	addi	a0,a0,-1756 # 80006498 <CONSOLE_STATUS+0x488>
    80005b7c:	fffff097          	auipc	ra,0xfffff
    80005b80:	afc080e7          	jalr	-1284(ra) # 80004678 <__printf>
    80005b84:	01013403          	ld	s0,16(sp)
    80005b88:	01813083          	ld	ra,24(sp)
    80005b8c:	00048513          	mv	a0,s1
    80005b90:	00813483          	ld	s1,8(sp)
    80005b94:	02010113          	addi	sp,sp,32
    80005b98:	ffffe317          	auipc	t1,0xffffe
    80005b9c:	6d430067          	jr	1748(t1) # 8000426c <plic_complete>
    80005ba0:	fffff097          	auipc	ra,0xfffff
    80005ba4:	3e0080e7          	jalr	992(ra) # 80004f80 <uartintr>
    80005ba8:	fddff06f          	j	80005b84 <console_handler+0x74>
    80005bac:	00001517          	auipc	a0,0x1
    80005bb0:	9ec50513          	addi	a0,a0,-1556 # 80006598 <digits+0x78>
    80005bb4:	fffff097          	auipc	ra,0xfffff
    80005bb8:	a68080e7          	jalr	-1432(ra) # 8000461c <panic>
	...
