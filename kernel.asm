
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	24013103          	ld	sp,576(sp) # 8000a240 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	714050ef          	jal	ra,80005730 <start>

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
    800011e0:	784000ef          	jal	ra,80001964 <_ZN5Riscv20handleTimerInterruptEv>

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
    800012f0:	694000ef          	jal	ra,80001984 <_ZN5Riscv22handleConsoleInterruptEv>

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
    800013a8:	142027f3          	csrr	a5,scause

  if(scause == 0x08UL || scause == 0x09UL)
    800013ac:	ff878793          	addi	a5,a5,-8
    800013b0:	00100713          	li	a4,1
    800013b4:	00f77463          	bgeu	a4,a5,800013bc <_ZN5Riscv20handleSupervisorTrapEv+0x14>
    800013b8:	00008067          	ret
{
    800013bc:	fb010113          	addi	sp,sp,-80
    800013c0:	04113423          	sd	ra,72(sp)
    800013c4:	04813023          	sd	s0,64(sp)
    800013c8:	02913c23          	sd	s1,56(sp)
    800013cc:	03213823          	sd	s2,48(sp)
    800013d0:	03313423          	sd	s3,40(sp)
    800013d4:	03413023          	sd	s4,32(sp)
    800013d8:	01513c23          	sd	s5,24(sp)
    800013dc:	05010413          	addi	s0,sp,80
  {
    uint64 volatile sepc, sstatus;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));
    800013e0:	141027f3          	csrr	a5,sepc
    800013e4:	faf43823          	sd	a5,-80(s0)
    sepc += 4;
    800013e8:	fb043783          	ld	a5,-80(s0)
    800013ec:	00478793          	addi	a5,a5,4
    800013f0:	faf43823          	sd	a5,-80(s0)
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));
    800013f4:	100027f3          	csrr	a5,sstatus
    800013f8:	faf43c23          	sd	a5,-72(s0)
    uint64 kod, pv;
    __asm__ volatile ("mv %0, a0" : "=r" (kod));
    800013fc:	00050793          	mv	a5,a0


    switch (kod)
    80001400:	04200713          	li	a4,66
    80001404:	02f76a63          	bltu	a4,a5,80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    80001408:	00279793          	slli	a5,a5,0x2
    8000140c:	00007717          	auipc	a4,0x7
    80001410:	c1470713          	addi	a4,a4,-1004 # 80008020 <CONSOLE_STATUS+0x10>
    80001414:	00e787b3          	add	a5,a5,a4
    80001418:	0007a783          	lw	a5,0(a5)
    8000141c:	00e787b3          	add	a5,a5,a4
    80001420:	00078067          	jr	a5
     //mem_alloc
     case 0x01:
     {
       size_t size;
       void* ptr;
       __asm__ volatile("mv %0, a1" : "=r" (size));
    80001424:	00058513          	mv	a0,a1
       ptr = MemoryAllocator::mem_alloc(size);
    80001428:	00001097          	auipc	ra,0x1
    8000142c:	dc4080e7          	jalr	-572(ra) # 800021ec <_ZN15MemoryAllocator9mem_allocEm>

       __asm__ volatile("mv t0, %0" : : "r"(ptr));
    80001430:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    80001434:	04542823          	sw	t0,80(s0)
     }
     default:{
       break;
       }
    }
    __asm__ volatile ( "csrw sstatus, %0" : : "r"( sstatus ) );
    80001438:	fb843783          	ld	a5,-72(s0)
    8000143c:	10079073          	csrw	sstatus,a5
    __asm__ volatile ( "csrw sepc, %0" : : "r"( sepc ) );
    80001440:	fb043783          	ld	a5,-80(s0)
    80001444:	14179073          	csrw	sepc,a5
  }

}
    80001448:	04813083          	ld	ra,72(sp)
    8000144c:	04013403          	ld	s0,64(sp)
    80001450:	03813483          	ld	s1,56(sp)
    80001454:	03013903          	ld	s2,48(sp)
    80001458:	02813983          	ld	s3,40(sp)
    8000145c:	02013a03          	ld	s4,32(sp)
    80001460:	01813a83          	ld	s5,24(sp)
    80001464:	05010113          	addi	sp,sp,80
    80001468:	00008067          	ret
       __asm__ volatile("mv %0, a1" : "=r" (memptr));
    8000146c:	00058513          	mv	a0,a1
       pv = MemoryAllocator::mem_free(memptr);
    80001470:	00001097          	auipc	ra,0x1
    80001474:	f64080e7          	jalr	-156(ra) # 800023d4 <_ZN15MemoryAllocator8mem_freeEPv>
       __asm__ volatile("mv t0, %0" : : "r"(pv));
    80001478:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    8000147c:	04542823          	sw	t0,80(s0)
       break;
    80001480:	fb9ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
    80001484:	00058993          	mv	s3,a1
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
    80001488:	00060913          	mv	s2,a2
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
    8000148c:	00070a93          	mv	s5,a4
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));
    80001490:	00088a13          	mv	s4,a7

   static void wrapper();

   static int napraviNit(thread_t* handle, Telo telo, void* argumenti, void* stek)
   {
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    80001494:	03000513          	li	a0,48
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	514080e7          	jalr	1300(ra) # 800019ac <_Znwm>
    800014a0:	00050493          	mv	s1,a0
    800014a4:	000a8693          	mv	a3,s5
    800014a8:	000a0613          	mv	a2,s4
    800014ac:	00090593          	mv	a1,s2
    800014b0:	00001097          	auipc	ra,0x1
    800014b4:	b70080e7          	jalr	-1168(ra) # 80002020 <_ZN3TCBC1EPFvPvES0_S0_>
    800014b8:	0099b023          	sd	s1,0(s3)
     if(telo != nullptr)
    800014bc:	00090863          	beqz	s2,800014cc <_ZN5Riscv20handleSupervisorTrapEv+0x124>
       Scheduler::stavi(*handle);
    800014c0:	00048513          	mv	a0,s1
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	5c8080e7          	jalr	1480(ra) # 80001a8c <_ZN9Scheduler5staviEP3TCB>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800014cc:	00000793          	li	a5,0
    800014d0:	14079073          	csrw	sscratch,a5
       break;
    800014d4:	f65ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    800014d8:	00050913          	mv	s2,a0
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    800014dc:	00048513          	mv	a0,s1
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	51c080e7          	jalr	1308(ra) # 800019fc <_ZdlPv>
    800014e8:	00090513          	mv	a0,s2
    800014ec:	0000a097          	auipc	ra,0xa
    800014f0:	f1c080e7          	jalr	-228(ra) # 8000b408 <_Unwind_Resume>
       TCB::trenutnaNit->exit();
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	c44080e7          	jalr	-956(ra) # 80002138 <_ZN3TCB4exitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800014fc:	00000793          	li	a5,0
    80001500:	14079073          	csrw	sscratch,a5
       break;
    80001504:	f35ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       TCB::dispatch();
    80001508:	00001097          	auipc	ra,0x1
    8000150c:	bac080e7          	jalr	-1108(ra) # 800020b4 <_ZN3TCB8dispatchEv>
       break;
    80001510:	f29ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(thread));
    80001514:	00058513          	mv	a0,a1
       return 0;
   }

   static void start(TCB* nit)
   {
     if(nit->telo != nullptr)
    80001518:	00053783          	ld	a5,0(a0)
    8000151c:	f0078ee3          	beqz	a5,80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       Scheduler::stavi(nit);
    80001520:	00000097          	auipc	ra,0x0
    80001524:	56c080e7          	jalr	1388(ra) # 80001a8c <_ZN9Scheduler5staviEP3TCB>
    80001528:	f11ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile ("mv %0, a1" : "=r"(thread));
    8000152c:	00058913          	mv	s2,a1
       __asm__ volatile ("mv %0, a2" : "=r"(telo));
    80001530:	00060993          	mv	s3,a2
       __asm__ volatile ("mv %0, a4" : "=r"(stek));
    80001534:	00070a93          	mv	s5,a4
       __asm__ volatile ("mv %0, a7" : "=r"(argumenti));
    80001538:	00088a13          	mv	s4,a7
       *handle = (thread_t) new TCB(telo, argumenti, stek);
    8000153c:	03000513          	li	a0,48
    80001540:	00000097          	auipc	ra,0x0
    80001544:	46c080e7          	jalr	1132(ra) # 800019ac <_Znwm>
    80001548:	00050493          	mv	s1,a0
    8000154c:	000a8693          	mv	a3,s5
    80001550:	000a0613          	mv	a2,s4
    80001554:	00098593          	mv	a1,s3
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	ac8080e7          	jalr	-1336(ra) # 80002020 <_ZN3TCBC1EPFvPvES0_S0_>
    80001560:	00993023          	sd	s1,0(s2)
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    80001564:	00000793          	li	a5,0
    80001568:	14079073          	csrw	sscratch,a5
       break;
    8000156c:	ecdff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    80001570:	00050913          	mv	s2,a0
    80001574:	00048513          	mv	a0,s1
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	484080e7          	jalr	1156(ra) # 800019fc <_ZdlPv>
    80001580:	00090513          	mv	a0,s2
    80001584:	0000a097          	auipc	ra,0xa
    80001588:	e84080e7          	jalr	-380(ra) # 8000b408 <_Unwind_Resume>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    8000158c:	00058513          	mv	a0,a1
       __asm__ volatile("mv %0, a2" : "=r"(init));
    80001590:	00060593          	mv	a1,a2
       pv = MojSemafor::sem_open(handle, init);
    80001594:	0005859b          	sext.w	a1,a1
    80001598:	00001097          	auipc	ra,0x1
    8000159c:	02c080e7          	jalr	44(ra) # 800025c4 <_ZN10MojSemafor8sem_openEPPS_j>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015a0:	14051073          	csrw	sscratch,a0
       break;
    800015a4:	e95ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    800015a8:	00058513          	mv	a0,a1
       pv = handle->close();
    800015ac:	00001097          	auipc	ra,0x1
    800015b0:	234080e7          	jalr	564(ra) # 800027e0 <_ZN10MojSemafor5closeEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015b4:	14051073          	csrw	sscratch,a0
       break;
    800015b8:	e81ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015bc:	00058513          	mv	a0,a1
       pv = id->wait();
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	160080e7          	jalr	352(ra) # 80002720 <_ZN10MojSemafor4waitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015c8:	14051073          	csrw	sscratch,a0
       break;
    800015cc:	e6dff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015d0:	00058513          	mv	a0,a1
       pv = id->signal();
    800015d4:	00001097          	auipc	ra,0x1
    800015d8:	084080e7          	jalr	132(ra) # 80002658 <_ZN10MojSemafor6signalEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015dc:	14051073          	csrw	sscratch,a0
       break;
    800015e0:	e59ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015e4:	00058513          	mv	a0,a1
       pv = id->trywait();
    800015e8:	00001097          	auipc	ra,0x1
    800015ec:	2c4080e7          	jalr	708(ra) # 800028ac <_ZN10MojSemafor7trywaitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015f0:	14051073          	csrw	sscratch,a0
       break;
    800015f4:	e45ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       pv = __getc();
    800015f8:	00006097          	auipc	ra,0x6
    800015fc:	230080e7          	jalr	560(ra) # 80007828 <__getc>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    80001600:	14051073          	csrw	sscratch,a0
       break;
    80001604:	e35ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile ("mv %0, a1" : "=r"(c));
    80001608:	00058513          	mv	a0,a1
       __putc(c);
    8000160c:	0ff57513          	andi	a0,a0,255
    80001610:	00006097          	auipc	ra,0x6
    80001614:	1dc080e7          	jalr	476(ra) # 800077ec <__putc>
       break;
    80001618:	e21ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>

000000008000161c <_Z8mem_freePv>:


int mem_free (void* ptr) {
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00813423          	sd	s0,8(sp)
    80001624:	01010413          	addi	s0,sp,16

  __asm__ volatile("mv a1, %0" : : "r"(ptr));
    80001628:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x02");
    8000162c:	00200513          	li	a0,2
  __asm__ volatile("ecall");
    80001630:	00000073          	ecall


  uint64 returnValue;
  __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001634:	00050513          	mv	a0,a0
  return (int)returnValue;
}
    80001638:	0005051b          	sext.w	a0,a0
    8000163c:	00813403          	ld	s0,8(sp)
    80001640:	01010113          	addi	sp,sp,16
    80001644:	00008067          	ret

0000000080001648 <_Z9mem_allocm>:

void* mem_alloc(size_t size) {
    80001648:	ff010113          	addi	sp,sp,-16
    8000164c:	00813423          	sd	s0,8(sp)
    80001650:	01010413          	addi	s0,sp,16
  size_t newSize;
  if(size%MEM_BLOCK_SIZE != 0) {
    80001654:	03f57793          	andi	a5,a0,63
    80001658:	00078663          	beqz	a5,80001664 <_Z9mem_allocm+0x1c>
    newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    8000165c:	03f50513          	addi	a0,a0,63
    80001660:	fc057513          	andi	a0,a0,-64
  }
  else {
    newSize = size;
  }

  __asm__ volatile("mv a1, %0" : : "r"(newSize));
    80001664:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x01");
    80001668:	00100513          	li	a0,1
  __asm__ volatile("ecall");
    8000166c:	00000073          	ecall

  //check this
  void *returnValue;
  __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001670:	00050513          	mv	a0,a0
  return returnValue;
}
    80001674:	00813403          	ld	s0,8(sp)
    80001678:	01010113          	addi	sp,sp,16
    8000167c:	00008067          	ret

0000000080001680 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    80001680:	fd010113          	addi	sp,sp,-48
    80001684:	02113423          	sd	ra,40(sp)
    80001688:	02813023          	sd	s0,32(sp)
    8000168c:	00913c23          	sd	s1,24(sp)
    80001690:	01213823          	sd	s2,16(sp)
    80001694:	01313423          	sd	s3,8(sp)
    80001698:	03010413          	addi	s0,sp,48
    8000169c:	00050913          	mv	s2,a0
    800016a0:	00058493          	mv	s1,a1
    800016a4:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    800016a8:	04058663          	beqz	a1,800016f4 <_Z13thread_createPP3TCBPFvPvES2_+0x74>
    800016ac:	00001537          	lui	a0,0x1
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	f98080e7          	jalr	-104(ra) # 80001648 <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    800016b8:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    800016bc:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    800016c0:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    800016c4:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x11");
    800016c8:	01100513          	li	a0,17

  __asm__ volatile ("ecall");
    800016cc:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800016d0:	00050513          	mv	a0,a0
  return pv;
}
    800016d4:	0005051b          	sext.w	a0,a0
    800016d8:	02813083          	ld	ra,40(sp)
    800016dc:	02013403          	ld	s0,32(sp)
    800016e0:	01813483          	ld	s1,24(sp)
    800016e4:	01013903          	ld	s2,16(sp)
    800016e8:	00813983          	ld	s3,8(sp)
    800016ec:	03010113          	addi	sp,sp,48
    800016f0:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    800016f4:	00000513          	li	a0,0
    800016f8:	fc1ff06f          	j	800016b8 <_Z13thread_createPP3TCBPFvPvES2_+0x38>

00000000800016fc <_Z15thread_no_startPP3TCBPFvPvES2_>:

int thread_no_start(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    800016fc:	fd010113          	addi	sp,sp,-48
    80001700:	02113423          	sd	ra,40(sp)
    80001704:	02813023          	sd	s0,32(sp)
    80001708:	00913c23          	sd	s1,24(sp)
    8000170c:	01213823          	sd	s2,16(sp)
    80001710:	01313423          	sd	s3,8(sp)
    80001714:	03010413          	addi	s0,sp,48
    80001718:	00050913          	mv	s2,a0
    8000171c:	00058493          	mv	s1,a1
    80001720:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001724:	04058663          	beqz	a1,80001770 <_Z15thread_no_startPP3TCBPFvPvES2_+0x74>
    80001728:	00001537          	lui	a0,0x1
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	f1c080e7          	jalr	-228(ra) # 80001648 <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    80001734:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    80001738:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    8000173c:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001740:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x15");
    80001744:	01500513          	li	a0,21

  __asm__ volatile ("ecall");
    80001748:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    8000174c:	00050513          	mv	a0,a0
  return pv;
}
    80001750:	0005051b          	sext.w	a0,a0
    80001754:	02813083          	ld	ra,40(sp)
    80001758:	02013403          	ld	s0,32(sp)
    8000175c:	01813483          	ld	s1,24(sp)
    80001760:	01013903          	ld	s2,16(sp)
    80001764:	00813983          	ld	s3,8(sp)
    80001768:	03010113          	addi	sp,sp,48
    8000176c:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001770:	00000513          	li	a0,0
    80001774:	fc1ff06f          	j	80001734 <_Z15thread_no_startPP3TCBPFvPvES2_+0x38>

0000000080001778 <_Z11thread_exitv>:

int thread_exit()
{
    80001778:	ff010113          	addi	sp,sp,-16
    8000177c:	00813423          	sd	s0,8(sp)
    80001780:	01010413          	addi	s0,sp,16
  uint64 pv;

  __asm__ volatile ("li a0, 0x12");
    80001784:	01200513          	li	a0,18
  __asm__ volatile ("ecall");
    80001788:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(pv));
    8000178c:	00050513          	mv	a0,a0
  return pv;
}
    80001790:	0005051b          	sext.w	a0,a0
    80001794:	00813403          	ld	s0,8(sp)
    80001798:	01010113          	addi	sp,sp,16
    8000179c:	00008067          	ret

00000000800017a0 <_Z15thread_dispatchv>:

void thread_dispatch()
{
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00813423          	sd	s0,8(sp)
    800017a8:	01010413          	addi	s0,sp,16
  __asm__ volatile ("li a0, 0x13");
    800017ac:	01300513          	li	a0,19
  __asm__ volatile ("ecall");
    800017b0:	00000073          	ecall
}
    800017b4:	00813403          	ld	s0,8(sp)
    800017b8:	01010113          	addi	sp,sp,16
    800017bc:	00008067          	ret

00000000800017c0 <_Z12thread_startP3TCB>:

void thread_start(TCB* thread)
{
    800017c0:	ff010113          	addi	sp,sp,-16
    800017c4:	00813423          	sd	s0,8(sp)
    800017c8:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(thread));
    800017cc:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x14");
    800017d0:	01400513          	li	a0,20
  __asm__ volatile ("ecall");
    800017d4:	00000073          	ecall
}
    800017d8:	00813403          	ld	s0,8(sp)
    800017dc:	01010113          	addi	sp,sp,16
    800017e0:	00008067          	ret

00000000800017e4 <_Z8sem_openPP10MojSemaforj>:

int sem_open(sem_t *handle, unsigned init)
{
    800017e4:	fe010113          	addi	sp,sp,-32
    800017e8:	00113c23          	sd	ra,24(sp)
    800017ec:	00813823          	sd	s0,16(sp)
    800017f0:	00913423          	sd	s1,8(sp)
    800017f4:	01213023          	sd	s2,0(sp)
    800017f8:	02010413          	addi	s0,sp,32
    800017fc:	00050913          	mv	s2,a0
    80001800:	00058493          	mv	s1,a1
  uint64 pv;
  printString("Init value is: ");
    80001804:	00007517          	auipc	a0,0x7
    80001808:	92c50513          	addi	a0,a0,-1748 # 80008130 <CONSOLE_STATUS+0x120>
    8000180c:	00003097          	auipc	ra,0x3
    80001810:	edc080e7          	jalr	-292(ra) # 800046e8 <_Z11printStringPKc>
  printInt(init);
    80001814:	00000613          	li	a2,0
    80001818:	00a00593          	li	a1,10
    8000181c:	00048513          	mv	a0,s1
    80001820:	00003097          	auipc	ra,0x3
    80001824:	078080e7          	jalr	120(ra) # 80004898 <_Z8printIntiii>
  printString("\n");
    80001828:	00007517          	auipc	a0,0x7
    8000182c:	b5050513          	addi	a0,a0,-1200 # 80008378 <CONSOLE_STATUS+0x368>
    80001830:	00003097          	auipc	ra,0x3
    80001834:	eb8080e7          	jalr	-328(ra) # 800046e8 <_Z11printStringPKc>
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001838:	00090593          	mv	a1,s2
  __asm__ volatile("mv a2, %0" : : "r"(init));
    8000183c:	00048613          	mv	a2,s1
  __asm__ volatile("li a0, 0x21");
    80001840:	02100513          	li	a0,33
  __asm__ volatile("ecall");
    80001844:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001848:	00050513          	mv	a0,a0
  return pv;
}
    8000184c:	0005051b          	sext.w	a0,a0
    80001850:	01813083          	ld	ra,24(sp)
    80001854:	01013403          	ld	s0,16(sp)
    80001858:	00813483          	ld	s1,8(sp)
    8000185c:	00013903          	ld	s2,0(sp)
    80001860:	02010113          	addi	sp,sp,32
    80001864:	00008067          	ret

0000000080001868 <_Z9sem_closeP10MojSemafor>:

int sem_close(sem_t handle)
{
    80001868:	ff010113          	addi	sp,sp,-16
    8000186c:	00813423          	sd	s0,8(sp)
    80001870:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001874:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x22");
    80001878:	02200513          	li	a0,34
  __asm__ volatile("ecall");
    8000187c:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001880:	00050513          	mv	a0,a0
  return pv;
}
    80001884:	0005051b          	sext.w	a0,a0
    80001888:	00813403          	ld	s0,8(sp)
    8000188c:	01010113          	addi	sp,sp,16
    80001890:	00008067          	ret

0000000080001894 <_Z8sem_waitP10MojSemafor>:

int sem_wait(sem_t id)
{
    80001894:	ff010113          	addi	sp,sp,-16
    80001898:	00813423          	sd	s0,8(sp)
    8000189c:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    800018a0:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x23");
    800018a4:	02300513          	li	a0,35
  __asm__ volatile("ecall");
    800018a8:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800018ac:	00050513          	mv	a0,a0
  return pv;
}
    800018b0:	0005051b          	sext.w	a0,a0
    800018b4:	00813403          	ld	s0,8(sp)
    800018b8:	01010113          	addi	sp,sp,16
    800018bc:	00008067          	ret

00000000800018c0 <_Z10sem_signalP10MojSemafor>:

int sem_signal(sem_t id)
{
    800018c0:	ff010113          	addi	sp,sp,-16
    800018c4:	00813423          	sd	s0,8(sp)
    800018c8:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    800018cc:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x24");
    800018d0:	02400513          	li	a0,36
  __asm__ volatile("ecall");
    800018d4:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800018d8:	00050513          	mv	a0,a0
  return pv;
}
    800018dc:	0005051b          	sext.w	a0,a0
    800018e0:	00813403          	ld	s0,8(sp)
    800018e4:	01010113          	addi	sp,sp,16
    800018e8:	00008067          	ret

00000000800018ec <_Z11sem_trywaitP10MojSemafor>:

int sem_trywait(sem_t id)
{
    800018ec:	ff010113          	addi	sp,sp,-16
    800018f0:	00813423          	sd	s0,8(sp)
    800018f4:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    800018f8:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x26");
    800018fc:	02600513          	li	a0,38
  __asm__ volatile("ecall");
    80001900:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001904:	00050513          	mv	a0,a0
  return pv;
}
    80001908:	0005051b          	sext.w	a0,a0
    8000190c:	00813403          	ld	s0,8(sp)
    80001910:	01010113          	addi	sp,sp,16
    80001914:	00008067          	ret

0000000080001918 <_Z4getcv>:

char getc()
{
    80001918:	ff010113          	addi	sp,sp,-16
    8000191c:	00813423          	sd	s0,8(sp)
    80001920:	01010413          	addi	s0,sp,16
  char c;
  __asm__ volatile ("li a0, 0x41");
    80001924:	04100513          	li	a0,65
  __asm__ volatile ("ecall");
    80001928:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(c));
    8000192c:	00050513          	mv	a0,a0
  return c;
}
    80001930:	0ff57513          	andi	a0,a0,255
    80001934:	00813403          	ld	s0,8(sp)
    80001938:	01010113          	addi	sp,sp,16
    8000193c:	00008067          	ret

0000000080001940 <_Z4putcc>:

void putc(char c)
{
    80001940:	ff010113          	addi	sp,sp,-16
    80001944:	00813423          	sd	s0,8(sp)
    80001948:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(c));
    8000194c:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x42");
    80001950:	04200513          	li	a0,66
  __asm__ volatile ("ecall");
    80001954:	00000073          	ecall

}
    80001958:	00813403          	ld	s0,8(sp)
    8000195c:	01010113          	addi	sp,sp,16
    80001960:	00008067          	ret

0000000080001964 <_ZN5Riscv20handleTimerInterruptEv>:

void Riscv::handleTimerInterrupt() {
    80001964:	ff010113          	addi	sp,sp,-16
    80001968:	00813423          	sd	s0,8(sp)
    8000196c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001970:	00200793          	li	a5,2
    80001974:	1447b073          	csrc	sip,a5
  mc_sip(SIP_SSIP);
}
    80001978:	00813403          	ld	s0,8(sp)
    8000197c:	01010113          	addi	sp,sp,16
    80001980:	00008067          	ret

0000000080001984 <_ZN5Riscv22handleConsoleInterruptEv>:

void Riscv::handleConsoleInterrupt() {
    80001984:	ff010113          	addi	sp,sp,-16
    80001988:	00113423          	sd	ra,8(sp)
    8000198c:	00813023          	sd	s0,0(sp)
    80001990:	01010413          	addi	s0,sp,16
  console_handler();
    80001994:	00006097          	auipc	ra,0x6
    80001998:	ecc080e7          	jalr	-308(ra) # 80007860 <console_handler>
}
    8000199c:	00813083          	ld	ra,8(sp)
    800019a0:	00013403          	ld	s0,0(sp)
    800019a4:	01010113          	addi	sp,sp,16
    800019a8:	00008067          	ret

00000000800019ac <_Znwm>:
// Created by os on 8/20/24.
//
#include "../h/syscall_c.h"
#include "../test/printing.hpp"
void* operator new(size_t velicina)
{
    800019ac:	ff010113          	addi	sp,sp,-16
    800019b0:	00113423          	sd	ra,8(sp)
    800019b4:	00813023          	sd	s0,0(sp)
    800019b8:	01010413          	addi	s0,sp,16
    //printString("Pozvao new\n");
    return mem_alloc(velicina);
    800019bc:	00000097          	auipc	ra,0x0
    800019c0:	c8c080e7          	jalr	-884(ra) # 80001648 <_Z9mem_allocm>
}
    800019c4:	00813083          	ld	ra,8(sp)
    800019c8:	00013403          	ld	s0,0(sp)
    800019cc:	01010113          	addi	sp,sp,16
    800019d0:	00008067          	ret

00000000800019d4 <_Znam>:

void* operator new[](size_t velicina)
{
    800019d4:	ff010113          	addi	sp,sp,-16
    800019d8:	00113423          	sd	ra,8(sp)
    800019dc:	00813023          	sd	s0,0(sp)
    800019e0:	01010413          	addi	s0,sp,16
    return mem_alloc(velicina);
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	c64080e7          	jalr	-924(ra) # 80001648 <_Z9mem_allocm>
}
    800019ec:	00813083          	ld	ra,8(sp)
    800019f0:	00013403          	ld	s0,0(sp)
    800019f4:	01010113          	addi	sp,sp,16
    800019f8:	00008067          	ret

00000000800019fc <_ZdlPv>:

void operator delete(void* pokazivac) noexcept
{
    800019fc:	ff010113          	addi	sp,sp,-16
    80001a00:	00113423          	sd	ra,8(sp)
    80001a04:	00813023          	sd	s0,0(sp)
    80001a08:	01010413          	addi	s0,sp,16
    mem_free(pokazivac);
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	c10080e7          	jalr	-1008(ra) # 8000161c <_Z8mem_freePv>
}
    80001a14:	00813083          	ld	ra,8(sp)
    80001a18:	00013403          	ld	s0,0(sp)
    80001a1c:	01010113          	addi	sp,sp,16
    80001a20:	00008067          	ret

0000000080001a24 <_ZdaPv>:

void operator delete[](void* pokazivac) noexcept
{
    80001a24:	ff010113          	addi	sp,sp,-16
    80001a28:	00113423          	sd	ra,8(sp)
    80001a2c:	00813023          	sd	s0,0(sp)
    80001a30:	01010413          	addi	s0,sp,16
    mem_free(pokazivac);
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	be8080e7          	jalr	-1048(ra) # 8000161c <_Z8mem_freePv>
}
    80001a3c:	00813083          	ld	ra,8(sp)
    80001a40:	00013403          	ld	s0,0(sp)
    80001a44:	01010113          	addi	sp,sp,16
    80001a48:	00008067          	ret

0000000080001a4c <_Z41__static_initialization_and_destruction_0ii>:
}

TCB* Scheduler::uzmi()
{
   return listaNiti.izbaciPrvi();
    80001a4c:	ff010113          	addi	sp,sp,-16
    80001a50:	00813423          	sd	s0,8(sp)
    80001a54:	01010413          	addi	s0,sp,16
    80001a58:	00100793          	li	a5,1
    80001a5c:	00f50863          	beq	a0,a5,80001a6c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001a60:	00813403          	ld	s0,8(sp)
    80001a64:	01010113          	addi	sp,sp,16
    80001a68:	00008067          	ret
    80001a6c:	000107b7          	lui	a5,0x10
    80001a70:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001a74:	fef596e3          	bne	a1,a5,80001a60 <_Z41__static_initialization_and_destruction_0ii+0x14>

  Cvor *pocetak, *kraj;

public:

Lista(): pocetak(nullptr), kraj(nullptr) {}
    80001a78:	00009797          	auipc	a5,0x9
    80001a7c:	84878793          	addi	a5,a5,-1976 # 8000a2c0 <_ZN9Scheduler9listaNitiE>
    80001a80:	0007b023          	sd	zero,0(a5)
    80001a84:	0007b423          	sd	zero,8(a5)
    80001a88:	fd9ff06f          	j	80001a60 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001a8c <_ZN9Scheduler5staviEP3TCB>:
{
    80001a8c:	fe010113          	addi	sp,sp,-32
    80001a90:	00113c23          	sd	ra,24(sp)
    80001a94:	00813823          	sd	s0,16(sp)
    80001a98:	00913423          	sd	s1,8(sp)
    80001a9c:	02010413          	addi	s0,sp,32
    80001aa0:	00050493          	mv	s1,a0
  kraj = noviCvor;
}

void dodajNaKraj(T* t)
{
Cvor *noviCvor = new Cvor(t, nullptr);
    80001aa4:	01000513          	li	a0,16
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	f04080e7          	jalr	-252(ra) # 800019ac <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80001ab0:	00953023          	sd	s1,0(a0)
    80001ab4:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    80001ab8:	00009797          	auipc	a5,0x9
    80001abc:	8107b783          	ld	a5,-2032(a5) # 8000a2c8 <_ZN9Scheduler9listaNitiE+0x8>
    80001ac0:	02078263          	beqz	a5,80001ae4 <_ZN9Scheduler5staviEP3TCB+0x58>
  {
     kraj = kraj->sledeci = noviCvor;
    80001ac4:	00a7b423          	sd	a0,8(a5)
    80001ac8:	00009797          	auipc	a5,0x9
    80001acc:	80a7b023          	sd	a0,-2048(a5) # 8000a2c8 <_ZN9Scheduler9listaNitiE+0x8>
}
    80001ad0:	01813083          	ld	ra,24(sp)
    80001ad4:	01013403          	ld	s0,16(sp)
    80001ad8:	00813483          	ld	s1,8(sp)
    80001adc:	02010113          	addi	sp,sp,32
    80001ae0:	00008067          	ret
  }
  else
  {
    pocetak = kraj = noviCvor;
    80001ae4:	00008797          	auipc	a5,0x8
    80001ae8:	7dc78793          	addi	a5,a5,2012 # 8000a2c0 <_ZN9Scheduler9listaNitiE>
    80001aec:	00a7b423          	sd	a0,8(a5)
    80001af0:	00a7b023          	sd	a0,0(a5)
    80001af4:	fddff06f          	j	80001ad0 <_ZN9Scheduler5staviEP3TCB+0x44>

0000000080001af8 <_ZN9Scheduler4uzmiEv>:
{
    80001af8:	fe010113          	addi	sp,sp,-32
    80001afc:	00113c23          	sd	ra,24(sp)
    80001b00:	00813823          	sd	s0,16(sp)
    80001b04:	00913423          	sd	s1,8(sp)
    80001b08:	02010413          	addi	s0,sp,32
  }
}

T* izbaciPrvi()
{
  if(pocetak == nullptr)
    80001b0c:	00008517          	auipc	a0,0x8
    80001b10:	7b453503          	ld	a0,1972(a0) # 8000a2c0 <_ZN9Scheduler9listaNitiE>
    80001b14:	04050263          	beqz	a0,80001b58 <_ZN9Scheduler4uzmiEv+0x60>
    return nullptr;

  Cvor *cvor = pocetak;
  pocetak = pocetak->sledeci;
    80001b18:	00853783          	ld	a5,8(a0)
    80001b1c:	00008717          	auipc	a4,0x8
    80001b20:	7af73223          	sd	a5,1956(a4) # 8000a2c0 <_ZN9Scheduler9listaNitiE>

  if(pocetak == nullptr)
    80001b24:	02078463          	beqz	a5,80001b4c <_ZN9Scheduler4uzmiEv+0x54>
    kraj = nullptr;

  T* pv = cvor->podaci;
    80001b28:	00053483          	ld	s1,0(a0)
  delete cvor;
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	ed0080e7          	jalr	-304(ra) # 800019fc <_ZdlPv>
    80001b34:	00048513          	mv	a0,s1
    80001b38:	01813083          	ld	ra,24(sp)
    80001b3c:	01013403          	ld	s0,16(sp)
    80001b40:	00813483          	ld	s1,8(sp)
    80001b44:	02010113          	addi	sp,sp,32
    80001b48:	00008067          	ret
    kraj = nullptr;
    80001b4c:	00008797          	auipc	a5,0x8
    80001b50:	7607be23          	sd	zero,1916(a5) # 8000a2c8 <_ZN9Scheduler9listaNitiE+0x8>
    80001b54:	fd5ff06f          	j	80001b28 <_ZN9Scheduler4uzmiEv+0x30>
    return nullptr;
    80001b58:	00050493          	mv	s1,a0
   return listaNiti.izbaciPrvi();
    80001b5c:	fd9ff06f          	j	80001b34 <_ZN9Scheduler4uzmiEv+0x3c>

0000000080001b60 <_GLOBAL__sub_I__ZN9Scheduler9listaNitiE>:
    80001b60:	ff010113          	addi	sp,sp,-16
    80001b64:	00113423          	sd	ra,8(sp)
    80001b68:	00813023          	sd	s0,0(sp)
    80001b6c:	01010413          	addi	s0,sp,16
    80001b70:	000105b7          	lui	a1,0x10
    80001b74:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001b78:	00100513          	li	a0,1
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	ed0080e7          	jalr	-304(ra) # 80001a4c <_Z41__static_initialization_and_destruction_0ii>
    80001b84:	00813083          	ld	ra,8(sp)
    80001b88:	00013403          	ld	s0,0(sp)
    80001b8c:	01010113          	addi	sp,sp,16
    80001b90:	00008067          	ret

0000000080001b94 <_Z11wrapperMainPv>:
#include "../h/MemoryAllocator.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
    80001b94:	ff010113          	addi	sp,sp,-16
    80001b98:	00113423          	sd	ra,8(sp)
    80001b9c:	00813023          	sd	s0,0(sp)
    80001ba0:	01010413          	addi	s0,sp,16
  userMain();
    80001ba4:	00003097          	auipc	ra,0x3
    80001ba8:	20c080e7          	jalr	524(ra) # 80004db0 <_Z8userMainv>
}
    80001bac:	00813083          	ld	ra,8(sp)
    80001bb0:	00013403          	ld	s0,0(sp)
    80001bb4:	01010113          	addi	sp,sp,16
    80001bb8:	00008067          	ret

0000000080001bbc <main>:


int main() {
    80001bbc:	fc010113          	addi	sp,sp,-64
    80001bc0:	02113c23          	sd	ra,56(sp)
    80001bc4:	02813823          	sd	s0,48(sp)
    80001bc8:	04010413          	addi	s0,sp,64

 static void tryToJoin(DataBlock* curr);

 static void initFreeBlock() {

  MemoryAllocator::free = (DataBlock*)((char*)HEAP_START_ADDR);
    80001bcc:	00008797          	auipc	a5,0x8
    80001bd0:	64c7b783          	ld	a5,1612(a5) # 8000a218 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001bd4:	0007b683          	ld	a3,0(a5)
    80001bd8:	00008717          	auipc	a4,0x8
    80001bdc:	64873703          	ld	a4,1608(a4) # 8000a220 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001be0:	00d73023          	sd	a3,0(a4)
  used = nullptr;
    80001be4:	00008617          	auipc	a2,0x8
    80001be8:	66c63603          	ld	a2,1644(a2) # 8000a250 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001bec:	00063023          	sd	zero,0(a2)

  free->next = nullptr;
    80001bf0:	0006b023          	sd	zero,0(a3)
  free->prev  = nullptr;
    80001bf4:	00073703          	ld	a4,0(a4)
    80001bf8:	00073423          	sd	zero,8(a4)
  free->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(DataBlock)); //FOR NOW
    80001bfc:	0007b783          	ld	a5,0(a5)
    80001c00:	00008697          	auipc	a3,0x8
    80001c04:	6686b683          	ld	a3,1640(a3) # 8000a268 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001c08:	0006b683          	ld	a3,0(a3)
    80001c0c:	40d787b3          	sub	a5,a5,a3
    80001c10:	fe878793          	addi	a5,a5,-24
    80001c14:	00f73823          	sd	a5,16(a4)


  //testing purposes
  newCalled = 0;
    80001c18:	00008797          	auipc	a5,0x8
    80001c1c:	6407b783          	ld	a5,1600(a5) # 8000a258 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c20:	0007a023          	sw	zero,0(a5)
  newArrayCalled = 0;
    80001c24:	00008797          	auipc	a5,0x8
    80001c28:	6247b783          	ld	a5,1572(a5) # 8000a248 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c2c:	0007a023          	sw	zero,0(a5)
  deleteCalled= 0;
    80001c30:	00008797          	auipc	a5,0x8
    80001c34:	6007b783          	ld	a5,1536(a5) # 8000a230 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c38:	0007a023          	sw	zero,0(a5)
  deleteArrayCalled = 0;
    80001c3c:	00008797          	auipc	a5,0x8
    80001c40:	5fc7b783          	ld	a5,1532(a5) # 8000a238 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c44:	0007a023          	sw	zero,0(a5)
TCB *threads[5];


 MemoryAllocator::initFreeBlock();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
    80001c48:	00008797          	auipc	a5,0x8
    80001c4c:	5e07b783          	ld	a5,1504(a5) # 8000a228 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001c50:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c54:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c58:	00200793          	li	a5,2
    80001c5c:	1007a073          	csrs	sstatus,a5
 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

 thread_create(&threads[0], nullptr, nullptr);
    80001c60:	00000613          	li	a2,0
    80001c64:	00000593          	li	a1,0
    80001c68:	fc840513          	addi	a0,s0,-56
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	a14080e7          	jalr	-1516(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
 TCB::trenutnaNit = threads[0];
    80001c74:	fc843703          	ld	a4,-56(s0)
    80001c78:	00008797          	auipc	a5,0x8
    80001c7c:	5e87b783          	ld	a5,1512(a5) # 8000a260 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c80:	00e7b023          	sd	a4,0(a5)


 thread_create(&threads[1], &wrapperMain, nullptr);
    80001c84:	00000613          	li	a2,0
    80001c88:	00000597          	auipc	a1,0x0
    80001c8c:	f0c58593          	addi	a1,a1,-244 # 80001b94 <_Z11wrapperMainPv>
    80001c90:	fd040513          	addi	a0,s0,-48
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	9ec080e7          	jalr	-1556(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>


 while( !threads[1]->daLiJeZavrsena())
    80001c9c:	fd043783          	ld	a5,-48(s0)

   static TCB* trenutnaNit;

   bool daLiJeZavrsena() const
   {
      return zavrsena;
    80001ca0:	0287c783          	lbu	a5,40(a5)
    80001ca4:	00079863          	bnez	a5,80001cb4 <main+0xf8>
{
  thread_dispatch();
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	af8080e7          	jalr	-1288(ra) # 800017a0 <_Z15thread_dispatchv>
    80001cb0:	fedff06f          	j	80001c9c <main+0xe0>
}

 return 0;

    80001cb4:	00000513          	li	a0,0
    80001cb8:	03813083          	ld	ra,56(sp)
    80001cbc:	03013403          	ld	s0,48(sp)
    80001cc0:	04010113          	addi	sp,sp,64
    80001cc4:	00008067          	ret

0000000080001cc8 <_ZN6ThreadD1Ev>:
Thread::Thread(void (*telo)(void*), void* argumenti)
{
  thread_create(&myHandle, telo, argumenti);
}

Thread::~Thread()
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
    80001cdc:	00008797          	auipc	a5,0x8
    80001ce0:	3cc78793          	addi	a5,a5,972 # 8000a0a8 <_ZTV6Thread+0x10>
    80001ce4:	00f53023          	sd	a5,0(a0)
{
 delete myHandle;
    80001ce8:	00853483          	ld	s1,8(a0)
    80001cec:	02048063          	beqz	s1,80001d0c <_ZN6ThreadD1Ev+0x44>
     return this->blokirana;
   }

   ~TCB()
   {
     delete stek;
    80001cf0:	0084b503          	ld	a0,8(s1)
    80001cf4:	00050663          	beqz	a0,80001d00 <_ZN6ThreadD1Ev+0x38>
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	d04080e7          	jalr	-764(ra) # 800019fc <_ZdlPv>
    80001d00:	00048513          	mv	a0,s1
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	cf8080e7          	jalr	-776(ra) # 800019fc <_ZdlPv>
}
    80001d0c:	01813083          	ld	ra,24(sp)
    80001d10:	01013403          	ld	s0,16(sp)
    80001d14:	00813483          	ld	s1,8(sp)
    80001d18:	02010113          	addi	sp,sp,32
    80001d1c:	00008067          	ret

0000000080001d20 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80001d20:	fe010113          	addi	sp,sp,-32
    80001d24:	00113c23          	sd	ra,24(sp)
    80001d28:	00813823          	sd	s0,16(sp)
    80001d2c:	00913423          	sd	s1,8(sp)
    80001d30:	02010413          	addi	s0,sp,32
    80001d34:	00050493          	mv	s1,a0
}
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	f90080e7          	jalr	-112(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80001d40:	00048513          	mv	a0,s1
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	cb8080e7          	jalr	-840(ra) # 800019fc <_ZdlPv>
    80001d4c:	01813083          	ld	ra,24(sp)
    80001d50:	01013403          	ld	s0,16(sp)
    80001d54:	00813483          	ld	s1,8(sp)
    80001d58:	02010113          	addi	sp,sp,32
    80001d5c:	00008067          	ret

0000000080001d60 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned init)
{
  sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore()
    80001d60:	ff010113          	addi	sp,sp,-16
    80001d64:	00113423          	sd	ra,8(sp)
    80001d68:	00813023          	sd	s0,0(sp)
    80001d6c:	01010413          	addi	s0,sp,16
    80001d70:	00008797          	auipc	a5,0x8
    80001d74:	36078793          	addi	a5,a5,864 # 8000a0d0 <_ZTV9Semaphore+0x10>
    80001d78:	00f53023          	sd	a5,0(a0)
{
  sem_close(myHandle);
    80001d7c:	00853503          	ld	a0,8(a0)
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	ae8080e7          	jalr	-1304(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
}
    80001d88:	00813083          	ld	ra,8(sp)
    80001d8c:	00013403          	ld	s0,0(sp)
    80001d90:	01010113          	addi	sp,sp,16
    80001d94:	00008067          	ret

0000000080001d98 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore()
    80001d98:	fe010113          	addi	sp,sp,-32
    80001d9c:	00113c23          	sd	ra,24(sp)
    80001da0:	00813823          	sd	s0,16(sp)
    80001da4:	00913423          	sd	s1,8(sp)
    80001da8:	02010413          	addi	s0,sp,32
    80001dac:	00050493          	mv	s1,a0
}
    80001db0:	00000097          	auipc	ra,0x0
    80001db4:	fb0080e7          	jalr	-80(ra) # 80001d60 <_ZN9SemaphoreD1Ev>
    80001db8:	00048513          	mv	a0,s1
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	c40080e7          	jalr	-960(ra) # 800019fc <_ZdlPv>
    80001dc4:	01813083          	ld	ra,24(sp)
    80001dc8:	01013403          	ld	s0,16(sp)
    80001dcc:	00813483          	ld	s1,8(sp)
    80001dd0:	02010113          	addi	sp,sp,32
    80001dd4:	00008067          	ret

0000000080001dd8 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*telo)(void*), void* argumenti)
    80001dd8:	ff010113          	addi	sp,sp,-16
    80001ddc:	00113423          	sd	ra,8(sp)
    80001de0:	00813023          	sd	s0,0(sp)
    80001de4:	01010413          	addi	s0,sp,16
    80001de8:	00008797          	auipc	a5,0x8
    80001dec:	2c078793          	addi	a5,a5,704 # 8000a0a8 <_ZTV6Thread+0x10>
    80001df0:	00f53023          	sd	a5,0(a0)
  thread_create(&myHandle, telo, argumenti);
    80001df4:	00850513          	addi	a0,a0,8
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	888080e7          	jalr	-1912(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001e00:	00813083          	ld	ra,8(sp)
    80001e04:	00013403          	ld	s0,0(sp)
    80001e08:	01010113          	addi	sp,sp,16
    80001e0c:	00008067          	ret

0000000080001e10 <_ZN6Thread5startEv>:
{
    80001e10:	ff010113          	addi	sp,sp,-16
    80001e14:	00113423          	sd	ra,8(sp)
    80001e18:	00813023          	sd	s0,0(sp)
    80001e1c:	01010413          	addi	s0,sp,16
  thread_start(this->myHandle);
    80001e20:	00853503          	ld	a0,8(a0)
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	99c080e7          	jalr	-1636(ra) # 800017c0 <_Z12thread_startP3TCB>
}
    80001e2c:	00000513          	li	a0,0
    80001e30:	00813083          	ld	ra,8(sp)
    80001e34:	00013403          	ld	s0,0(sp)
    80001e38:	01010113          	addi	sp,sp,16
    80001e3c:	00008067          	ret

0000000080001e40 <_ZN6Thread8dispatchEv>:
{
    80001e40:	ff010113          	addi	sp,sp,-16
    80001e44:	00113423          	sd	ra,8(sp)
    80001e48:	00813023          	sd	s0,0(sp)
    80001e4c:	01010413          	addi	s0,sp,16
  thread_dispatch();
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	950080e7          	jalr	-1712(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80001e58:	00813083          	ld	ra,8(sp)
    80001e5c:	00013403          	ld	s0,0(sp)
    80001e60:	01010113          	addi	sp,sp,16
    80001e64:	00008067          	ret

0000000080001e68 <_ZN6Thread5sleepEm>:
{
    80001e68:	ff010113          	addi	sp,sp,-16
    80001e6c:	00813423          	sd	s0,8(sp)
    80001e70:	01010413          	addi	s0,sp,16
}
    80001e74:	00000513          	li	a0,0
    80001e78:	00813403          	ld	s0,8(sp)
    80001e7c:	01010113          	addi	sp,sp,16
    80001e80:	00008067          	ret

0000000080001e84 <_ZN6ThreadC1Ev>:
Thread::Thread()
    80001e84:	ff010113          	addi	sp,sp,-16
    80001e88:	00113423          	sd	ra,8(sp)
    80001e8c:	00813023          	sd	s0,0(sp)
    80001e90:	01010413          	addi	s0,sp,16
    80001e94:	00008797          	auipc	a5,0x8
    80001e98:	21478793          	addi	a5,a5,532 # 8000a0a8 <_ZTV6Thread+0x10>
    80001e9c:	00f53023          	sd	a5,0(a0)
  thread_no_start(&myHandle, &runWrapper, this);
    80001ea0:	00050613          	mv	a2,a0
    80001ea4:	00000597          	auipc	a1,0x0
    80001ea8:	13058593          	addi	a1,a1,304 # 80001fd4 <_ZN6Thread10runWrapperEPv>
    80001eac:	00850513          	addi	a0,a0,8
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	84c080e7          	jalr	-1972(ra) # 800016fc <_Z15thread_no_startPP3TCBPFvPvES2_>
}
    80001eb8:	00813083          	ld	ra,8(sp)
    80001ebc:	00013403          	ld	s0,0(sp)
    80001ec0:	01010113          	addi	sp,sp,16
    80001ec4:	00008067          	ret

0000000080001ec8 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init)
    80001ec8:	ff010113          	addi	sp,sp,-16
    80001ecc:	00113423          	sd	ra,8(sp)
    80001ed0:	00813023          	sd	s0,0(sp)
    80001ed4:	01010413          	addi	s0,sp,16
    80001ed8:	00008797          	auipc	a5,0x8
    80001edc:	1f878793          	addi	a5,a5,504 # 8000a0d0 <_ZTV9Semaphore+0x10>
    80001ee0:	00f53023          	sd	a5,0(a0)
  sem_open(&this->myHandle, init);
    80001ee4:	00850513          	addi	a0,a0,8
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	8fc080e7          	jalr	-1796(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
}
    80001ef0:	00813083          	ld	ra,8(sp)
    80001ef4:	00013403          	ld	s0,0(sp)
    80001ef8:	01010113          	addi	sp,sp,16
    80001efc:	00008067          	ret

0000000080001f00 <_ZN9Semaphore4waitEv>:

int Semaphore::wait()
{
    80001f00:	ff010113          	addi	sp,sp,-16
    80001f04:	00113423          	sd	ra,8(sp)
    80001f08:	00813023          	sd	s0,0(sp)
    80001f0c:	01010413          	addi	s0,sp,16
  return sem_wait(myHandle);
    80001f10:	00853503          	ld	a0,8(a0)
    80001f14:	00000097          	auipc	ra,0x0
    80001f18:	980080e7          	jalr	-1664(ra) # 80001894 <_Z8sem_waitP10MojSemafor>
}
    80001f1c:	00813083          	ld	ra,8(sp)
    80001f20:	00013403          	ld	s0,0(sp)
    80001f24:	01010113          	addi	sp,sp,16
    80001f28:	00008067          	ret

0000000080001f2c <_ZN9Semaphore6signalEv>:

int Semaphore::signal()
{
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
  return sem_signal(myHandle);
    80001f3c:	00853503          	ld	a0,8(a0)
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	980080e7          	jalr	-1664(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
}
    80001f48:	00813083          	ld	ra,8(sp)
    80001f4c:	00013403          	ld	s0,0(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret

0000000080001f58 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait()
{
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00113423          	sd	ra,8(sp)
    80001f60:	00813023          	sd	s0,0(sp)
    80001f64:	01010413          	addi	s0,sp,16
  return sem_trywait(myHandle);
    80001f68:	00853503          	ld	a0,8(a0)
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	980080e7          	jalr	-1664(ra) # 800018ec <_Z11sem_trywaitP10MojSemafor>
}
    80001f74:	00813083          	ld	ra,8(sp)
    80001f78:	00013403          	ld	s0,0(sp)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <_ZN7Console4getcEv>:

char Console::getc()
{
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00113423          	sd	ra,8(sp)
    80001f8c:	00813023          	sd	s0,0(sp)
    80001f90:	01010413          	addi	s0,sp,16
 return syscall_c::getc();
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	984080e7          	jalr	-1660(ra) # 80001918 <_Z4getcv>
}
    80001f9c:	00813083          	ld	ra,8(sp)
    80001fa0:	00013403          	ld	s0,0(sp)
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00008067          	ret

0000000080001fac <_ZN7Console4putcEc>:

void Console::putc(char c)
{
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00113423          	sd	ra,8(sp)
    80001fb4:	00813023          	sd	s0,0(sp)
    80001fb8:	01010413          	addi	s0,sp,16
  syscall_c::putc(c);
    80001fbc:	00000097          	auipc	ra,0x0
    80001fc0:	984080e7          	jalr	-1660(ra) # 80001940 <_Z4putcc>
    80001fc4:	00813083          	ld	ra,8(sp)
    80001fc8:	00013403          	ld	s0,0(sp)
    80001fcc:	01010113          	addi	sp,sp,16
    80001fd0:	00008067          	ret

0000000080001fd4 <_ZN6Thread10runWrapperEPv>:
int start();
static void dispatch();
static int sleep (time_t);
static void runWrapper(void* thread)
{
  if(thread != nullptr)
    80001fd4:	02050863          	beqz	a0,80002004 <_ZN6Thread10runWrapperEPv+0x30>
static void runWrapper(void* thread)
    80001fd8:	ff010113          	addi	sp,sp,-16
    80001fdc:	00113423          	sd	ra,8(sp)
    80001fe0:	00813023          	sd	s0,0(sp)
    80001fe4:	01010413          	addi	s0,sp,16
   ((Thread*) thread)->run();
    80001fe8:	00053783          	ld	a5,0(a0)
    80001fec:	0107b783          	ld	a5,16(a5)
    80001ff0:	000780e7          	jalr	a5
}
    80001ff4:	00813083          	ld	ra,8(sp)
    80001ff8:	00013403          	ld	s0,0(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret
    80002004:	00008067          	ret

0000000080002008 <_ZN6Thread3runEv>:

protected:
 Thread();
 virtual void run() {};
    80002008:	ff010113          	addi	sp,sp,-16
    8000200c:	00813423          	sd	s0,8(sp)
    80002010:	01010413          	addi	s0,sp,16
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZN3TCBC1EPFvPvES0_S0_>:
#include "../h/syscall_c.h"
#include "../test/printing.hpp"

TCB* TCB::trenutnaNit = nullptr;

TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80002020:	fd010113          	addi	sp,sp,-48
    80002024:	02113423          	sd	ra,40(sp)
    80002028:	02813023          	sd	s0,32(sp)
    8000202c:	00913c23          	sd	s1,24(sp)
    80002030:	01213823          	sd	s2,16(sp)
    80002034:	01313423          	sd	s3,8(sp)
    80002038:	03010413          	addi	s0,sp,48
    8000203c:	00050493          	mv	s1,a0
    80002040:	00058913          	mv	s2,a1
    80002044:	00060993          	mv	s3,a2
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80002048:	00b53023          	sd	a1,0(a0)
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    8000204c:	04058c63          	beqz	a1,800020a4 <_ZN3TCBC1EPFvPvES0_S0_+0x84>
    80002050:	00008537          	lui	a0,0x8
    80002054:	00000097          	auipc	ra,0x0
    80002058:	980080e7          	jalr	-1664(ra) # 800019d4 <_Znam>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    8000205c:	00a4b423          	sd	a0,8(s1)
    80002060:	00000797          	auipc	a5,0x0
    80002064:	13078793          	addi	a5,a5,304 # 80002190 <_ZN3TCB7wrapperEv>
    80002068:	00f4b823          	sd	a5,16(s1)
    8000206c:	04090063          	beqz	s2,800020ac <_ZN3TCBC1EPFvPvES0_S0_+0x8c>
    80002070:	000087b7          	lui	a5,0x8
    80002074:	00f50533          	add	a0,a0,a5
    80002078:	00a4bc23          	sd	a0,24(s1)
    8000207c:	0334b023          	sd	s3,32(s1)
    80002080:	02048423          	sb	zero,40(s1)
    80002084:	020484a3          	sb	zero,41(s1)
    80002088:	02813083          	ld	ra,40(sp)
    8000208c:	02013403          	ld	s0,32(sp)
    80002090:	01813483          	ld	s1,24(sp)
    80002094:	01013903          	ld	s2,16(sp)
    80002098:	00813983          	ld	s3,8(sp)
    8000209c:	03010113          	addi	sp,sp,48
    800020a0:	00008067          	ret
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    800020a4:	00000513          	li	a0,0
    800020a8:	fb5ff06f          	j	8000205c <_ZN3TCBC1EPFvPvES0_S0_+0x3c>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    800020ac:	00000513          	li	a0,0
    800020b0:	fc9ff06f          	j	80002078 <_ZN3TCBC1EPFvPvES0_S0_+0x58>

00000000800020b4 <_ZN3TCB8dispatchEv>:
  trenutnaNit->postaviStatus(true);
  thread_dispatch();
}

void TCB::dispatch()
{
    800020b4:	fe010113          	addi	sp,sp,-32
    800020b8:	00113c23          	sd	ra,24(sp)
    800020bc:	00813823          	sd	s0,16(sp)
    800020c0:	00913423          	sd	s1,8(sp)
    800020c4:	02010413          	addi	s0,sp,32
  printString("Usao u dispatch\n");
    800020c8:	00006517          	auipc	a0,0x6
    800020cc:	07850513          	addi	a0,a0,120 # 80008140 <CONSOLE_STATUS+0x130>
    800020d0:	00002097          	auipc	ra,0x2
    800020d4:	618080e7          	jalr	1560(ra) # 800046e8 <_Z11printStringPKc>
  TCB* staraNit = trenutnaNit;
    800020d8:	00008497          	auipc	s1,0x8
    800020dc:	1f84b483          	ld	s1,504(s1) # 8000a2d0 <_ZN3TCB11trenutnaNitE>
      return zavrsena;
    800020e0:	0284c783          	lbu	a5,40(s1)
  if(!staraNit->daLiJeZavrsena() && !staraNit->daLiJeBlokirana())
    800020e4:	00079663          	bnez	a5,800020f0 <_ZN3TCB8dispatchEv+0x3c>
     return this->blokirana;
    800020e8:	0294c783          	lbu	a5,41(s1)
    800020ec:	02078e63          	beqz	a5,80002128 <_ZN3TCB8dispatchEv+0x74>
  {
    Scheduler::stavi(staraNit);
  }

  trenutnaNit = Scheduler::uzmi();
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	a08080e7          	jalr	-1528(ra) # 80001af8 <_ZN9Scheduler4uzmiEv>
    800020f8:	00008797          	auipc	a5,0x8
    800020fc:	1ca7bc23          	sd	a0,472(a5) # 8000a2d0 <_ZN3TCB11trenutnaNitE>

  if(staraNit != trenutnaNit)
    80002100:	00a48a63          	beq	s1,a0,80002114 <_ZN3TCB8dispatchEv+0x60>
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
    80002104:	01050593          	addi	a1,a0,16
    80002108:	01048513          	addi	a0,s1,16
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	ef4080e7          	jalr	-268(ra) # 80001000 <_ZN3TCB5yieldEPNS_7ContextES1_>
  }
}
    80002114:	01813083          	ld	ra,24(sp)
    80002118:	01013403          	ld	s0,16(sp)
    8000211c:	00813483          	ld	s1,8(sp)
    80002120:	02010113          	addi	sp,sp,32
    80002124:	00008067          	ret
    Scheduler::stavi(staraNit);
    80002128:	00048513          	mv	a0,s1
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	960080e7          	jalr	-1696(ra) # 80001a8c <_ZN9Scheduler5staviEP3TCB>
    80002134:	fbdff06f          	j	800020f0 <_ZN3TCB8dispatchEv+0x3c>

0000000080002138 <_ZN3TCB4exitEv>:

void TCB::exit()
{
    80002138:	ff010113          	addi	sp,sp,-16
    8000213c:	00113423          	sd	ra,8(sp)
    80002140:	00813023          	sd	s0,0(sp)
    80002144:	01010413          	addi	s0,sp,16
     this->zavrsena = status;
    80002148:	00008797          	auipc	a5,0x8
    8000214c:	1887b783          	ld	a5,392(a5) # 8000a2d0 <_ZN3TCB11trenutnaNitE>
    80002150:	00100713          	li	a4,1
    80002154:	02e78423          	sb	a4,40(a5)
  trenutnaNit->postaviStatus(true);
  dispatch();
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	f5c080e7          	jalr	-164(ra) # 800020b4 <_ZN3TCB8dispatchEv>
}
    80002160:	00813083          	ld	ra,8(sp)
    80002164:	00013403          	ld	s0,0(sp)
    80002168:	01010113          	addi	sp,sp,16
    8000216c:	00008067          	ret

0000000080002170 <_ZN3TCB10popSppSpieEv>:

void TCB::popSppSpie()
{
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00813423          	sd	s0,8(sp)
    80002178:	01010413          	addi	s0,sp,16
  __asm__ volatile ("csrw sepc, ra");
    8000217c:	14109073          	csrw	sepc,ra
  __asm__ volatile("sret");
    80002180:	10200073          	sret
    80002184:	00813403          	ld	s0,8(sp)
    80002188:	01010113          	addi	sp,sp,16
    8000218c:	00008067          	ret

0000000080002190 <_ZN3TCB7wrapperEv>:
{
    80002190:	fe010113          	addi	sp,sp,-32
    80002194:	00113c23          	sd	ra,24(sp)
    80002198:	00813823          	sd	s0,16(sp)
    8000219c:	00913423          	sd	s1,8(sp)
    800021a0:	02010413          	addi	s0,sp,32
  popSppSpie();
    800021a4:	00000097          	auipc	ra,0x0
    800021a8:	fcc080e7          	jalr	-52(ra) # 80002170 <_ZN3TCB10popSppSpieEv>
  trenutnaNit->telo((void*) trenutnaNit->argumenti);
    800021ac:	00008497          	auipc	s1,0x8
    800021b0:	12448493          	addi	s1,s1,292 # 8000a2d0 <_ZN3TCB11trenutnaNitE>
    800021b4:	0004b783          	ld	a5,0(s1)
    800021b8:	0007b703          	ld	a4,0(a5)
    800021bc:	0207b503          	ld	a0,32(a5)
    800021c0:	000700e7          	jalr	a4
  trenutnaNit->postaviStatus(true);
    800021c4:	0004b783          	ld	a5,0(s1)
    800021c8:	00100713          	li	a4,1
    800021cc:	02e78423          	sb	a4,40(a5)
  thread_dispatch();
    800021d0:	fffff097          	auipc	ra,0xfffff
    800021d4:	5d0080e7          	jalr	1488(ra) # 800017a0 <_Z15thread_dispatchv>
}
    800021d8:	01813083          	ld	ra,24(sp)
    800021dc:	01013403          	ld	s0,16(sp)
    800021e0:	00813483          	ld	s1,8(sp)
    800021e4:	02010113          	addi	sp,sp,32
    800021e8:	00008067          	ret

00000000800021ec <_ZN15MemoryAllocator9mem_allocEm>:
int MemoryAllocator::newArrayCalled = 0;
int MemoryAllocator::deleteCalled = 0;
int MemoryAllocator::deleteArrayCalled = 0;


void *MemoryAllocator::mem_alloc(size_t size) {
    800021ec:	ff010113          	addi	sp,sp,-16
    800021f0:	00813423          	sd	s0,8(sp)
    800021f4:	01010413          	addi	s0,sp,16
    800021f8:	00050793          	mv	a5,a0
    size_t newSize;
    //printString("Usao u mem alloc\n");
    if(size%MEM_BLOCK_SIZE != 0) {
    800021fc:	03f57713          	andi	a4,a0,63
    80002200:	00070663          	beqz	a4,8000220c <_ZN15MemoryAllocator9mem_allocEm+0x20>
        //printString("Usao u if\n");
        newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002204:	03f50793          	addi	a5,a0,63
    80002208:	fc07f793          	andi	a5,a5,-64
        newSize = size;
    }
    //printString("Requested size = ");
    //printInt(newSize);

    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    8000220c:	00008517          	auipc	a0,0x8
    80002210:	0cc53503          	ld	a0,204(a0) # 8000a2d8 <_ZN15MemoryAllocator4freeE>
    80002214:	06050e63          	beqz	a0,80002290 <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        //printString("Usao u for\n");
        //printString("curr size =  ");
        //printInt(curr->size);
        if(curr->size<newSize) continue;
    80002218:	01053703          	ld	a4,16(a0)
    8000221c:	08f76063          	bltu	a4,a5,8000229c <_ZN15MemoryAllocator9mem_allocEm+0xb0>
        if(curr->size > newSize) {
    80002220:	0ce7f663          	bgeu	a5,a4,800022ec <_ZN15MemoryAllocator9mem_allocEm+0x100>
            //new fragment needs to be created
            //novi ce biti offsetovan od curr za novi size i plus za sizeof(DataBlock) zato sto se posle curr
            // nalazi taj "header"
            DataBlock *newBlock;
            newBlock = (DataBlock*) ((char*)curr + newSize + sizeof(DataBlock));
    80002224:	01878713          	addi	a4,a5,24
    80002228:	00e50733          	add	a4,a0,a4

            //Azuriranje free liste
            if(curr->prev) curr->prev->next = newBlock;
    8000222c:	00853683          	ld	a3,8(a0)
    80002230:	06068a63          	beqz	a3,800022a4 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    80002234:	00e6b023          	sd	a4,0(a3)
            else MemoryAllocator::free = newBlock;
            if(curr->next) curr->next->prev = newBlock;
    80002238:	00053683          	ld	a3,0(a0)
    8000223c:	00068463          	beqz	a3,80002244 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002240:	00e6b423          	sd	a4,8(a3)
            newBlock->prev = curr->prev;
    80002244:	00853683          	ld	a3,8(a0)
    80002248:	00d73423          	sd	a3,8(a4)
            newBlock->next = curr->next;
    8000224c:	00053683          	ld	a3,0(a0)
    80002250:	00d73023          	sd	a3,0(a4)
            //printString("Zavrsio azuriranje free liste\n");

            newBlock->size = curr->size - newSize - sizeof(DataBlock);
    80002254:	01053683          	ld	a3,16(a0)
    80002258:	40f686b3          	sub	a3,a3,a5
    8000225c:	fe868693          	addi	a3,a3,-24
    80002260:	00d73823          	sd	a3,16(a4)
            curr->size = newSize;
    80002264:	00f53823          	sd	a5,16(a0)

            //azuriranje USED liste
            if(used == nullptr) {
    80002268:	00008797          	auipc	a5,0x8
    8000226c:	0787b783          	ld	a5,120(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
    80002270:	04078063          	beqz	a5,800022b0 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                used = curr;
                curr->next = nullptr;
                curr->prev = nullptr;
            }
            else if((char*) curr < (char*)used) {
    80002274:	04f57863          	bgeu	a0,a5,800022c4 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                //treba da ide pre trenutnog used
                used->prev = curr;
    80002278:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    8000227c:	00053423          	sd	zero,8(a0)
                curr->next = used;
    80002280:	00f53023          	sd	a5,0(a0)
                used = curr;
    80002284:	00008797          	auipc	a5,0x8
    80002288:	04a7be23          	sd	a0,92(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
                currUsed->next = curr;
            }
            //printString("Placed block in used list for exact size\n");
        }
        //printString("went to return\n");
        return (char*)curr + sizeof(DataBlock);
    8000228c:	01850513          	addi	a0,a0,24
    }
    return nullptr; //should not enter here
}
    80002290:	00813403          	ld	s0,8(sp)
    80002294:	01010113          	addi	sp,sp,16
    80002298:	00008067          	ret
    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    8000229c:	00053503          	ld	a0,0(a0)
    800022a0:	f75ff06f          	j	80002214 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            else MemoryAllocator::free = newBlock;
    800022a4:	00008697          	auipc	a3,0x8
    800022a8:	02e6ba23          	sd	a4,52(a3) # 8000a2d8 <_ZN15MemoryAllocator4freeE>
    800022ac:	f8dff06f          	j	80002238 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                used = curr;
    800022b0:	00008797          	auipc	a5,0x8
    800022b4:	02a7b823          	sd	a0,48(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    800022b8:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    800022bc:	00053423          	sd	zero,8(a0)
    800022c0:	fcdff06f          	j	8000228c <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    800022c4:	00078713          	mv	a4,a5
    800022c8:	0007b783          	ld	a5,0(a5)
    800022cc:	00078463          	beqz	a5,800022d4 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
    800022d0:	fea7eae3          	bltu	a5,a0,800022c4 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                curr->next = currUsed->next;
    800022d4:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    800022d8:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    800022dc:	00078463          	beqz	a5,800022e4 <_ZN15MemoryAllocator9mem_allocEm+0xf8>
    800022e0:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    800022e4:	00a73023          	sd	a0,0(a4)
    800022e8:	fa5ff06f          	j	8000228c <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            if (curr->prev) curr->prev->next = curr->next;
    800022ec:	00853783          	ld	a5,8(a0)
    800022f0:	04078263          	beqz	a5,80002334 <_ZN15MemoryAllocator9mem_allocEm+0x148>
    800022f4:	00053703          	ld	a4,0(a0)
    800022f8:	00e7b023          	sd	a4,0(a5)
            if(curr->next) curr->next->prev = curr->prev;
    800022fc:	00053783          	ld	a5,0(a0)
    80002300:	00078663          	beqz	a5,8000230c <_ZN15MemoryAllocator9mem_allocEm+0x120>
    80002304:	00853703          	ld	a4,8(a0)
    80002308:	00e7b423          	sd	a4,8(a5)
            if(used == nullptr) {
    8000230c:	00008797          	auipc	a5,0x8
    80002310:	fd47b783          	ld	a5,-44(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
    80002314:	02078863          	beqz	a5,80002344 <_ZN15MemoryAllocator9mem_allocEm+0x158>
            else if((char*) curr < (char*)used) {
    80002318:	04f57063          	bgeu	a0,a5,80002358 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                used->prev = curr;
    8000231c:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    80002320:	00053423          	sd	zero,8(a0)
                curr->next = used;
    80002324:	00f53023          	sd	a5,0(a0)
                used = curr;
    80002328:	00008797          	auipc	a5,0x8
    8000232c:	faa7bc23          	sd	a0,-72(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
    80002330:	f5dff06f          	j	8000228c <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            else MemoryAllocator::free = curr->next;
    80002334:	00053783          	ld	a5,0(a0)
    80002338:	00008717          	auipc	a4,0x8
    8000233c:	faf73023          	sd	a5,-96(a4) # 8000a2d8 <_ZN15MemoryAllocator4freeE>
    80002340:	fbdff06f          	j	800022fc <_ZN15MemoryAllocator9mem_allocEm+0x110>
                used = curr;
    80002344:	00008797          	auipc	a5,0x8
    80002348:	f8a7be23          	sd	a0,-100(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    8000234c:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    80002350:	00053423          	sd	zero,8(a0)
    80002354:	f39ff06f          	j	8000228c <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    80002358:	00078713          	mv	a4,a5
    8000235c:	0007b783          	ld	a5,0(a5)
    80002360:	00078463          	beqz	a5,80002368 <_ZN15MemoryAllocator9mem_allocEm+0x17c>
    80002364:	fea7eae3          	bltu	a5,a0,80002358 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                curr->next = currUsed->next;
    80002368:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    8000236c:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    80002370:	00078463          	beqz	a5,80002378 <_ZN15MemoryAllocator9mem_allocEm+0x18c>
    80002374:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    80002378:	00a73023          	sd	a0,0(a4)
    8000237c:	f11ff06f          	j	8000228c <_ZN15MemoryAllocator9mem_allocEm+0xa0>

0000000080002380 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>:
        tryToJoin(currFree);
    }
    return 0;
}

void MemoryAllocator::tryToJoin(DataBlock *curr) {
    80002380:	ff010113          	addi	sp,sp,-16
    80002384:	00813423          	sd	s0,8(sp)
    80002388:	01010413          	addi	s0,sp,16
    if(curr->next && (char*)curr + sizeof(DataBlock) + curr->size == (char*)curr->next) {
    8000238c:	00053783          	ld	a5,0(a0)
    80002390:	00078a63          	beqz	a5,800023a4 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    80002394:	01053683          	ld	a3,16(a0)
    80002398:	01868713          	addi	a4,a3,24
    8000239c:	00e50733          	add	a4,a0,a4
    800023a0:	00e78863          	beq	a5,a4,800023b0 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x30>
        curr->size += curr->next->size + sizeof(DataBlock);
        curr->next = curr->next->next;
        if(curr->next) curr->next->prev = curr;
    }
    800023a4:	00813403          	ld	s0,8(sp)
    800023a8:	01010113          	addi	sp,sp,16
    800023ac:	00008067          	ret
        curr->size += curr->next->size + sizeof(DataBlock);
    800023b0:	0107b703          	ld	a4,16(a5)
    800023b4:	00e686b3          	add	a3,a3,a4
    800023b8:	01868693          	addi	a3,a3,24
    800023bc:	00d53823          	sd	a3,16(a0)
        curr->next = curr->next->next;
    800023c0:	0007b783          	ld	a5,0(a5)
    800023c4:	00f53023          	sd	a5,0(a0)
        if(curr->next) curr->next->prev = curr;
    800023c8:	fc078ee3          	beqz	a5,800023a4 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    800023cc:	00a7b423          	sd	a0,8(a5)
    800023d0:	fd5ff06f          	j	800023a4 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>

00000000800023d4 <_ZN15MemoryAllocator8mem_freeEPv>:
    if(used == nullptr) return -1;
    800023d4:	00008797          	auipc	a5,0x8
    800023d8:	f0c7b783          	ld	a5,-244(a5) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
    800023dc:	12078863          	beqz	a5,8000250c <_ZN15MemoryAllocator8mem_freeEPv+0x138>
    800023e0:	00050713          	mv	a4,a0
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    800023e4:	12050863          	beqz	a0,80002514 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    800023e8:	00008697          	auipc	a3,0x8
    800023ec:	e306b683          	ld	a3,-464(a3) # 8000a218 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023f0:	0006b683          	ld	a3,0(a3)
    800023f4:	12d56463          	bltu	a0,a3,8000251c <_ZN15MemoryAllocator8mem_freeEPv+0x148>
    800023f8:	00008697          	auipc	a3,0x8
    800023fc:	e706b683          	ld	a3,-400(a3) # 8000a268 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002400:	0006b683          	ld	a3,0(a3)
    80002404:	12a6e063          	bltu	a3,a0,80002524 <_ZN15MemoryAllocator8mem_freeEPv+0x150>
    DataBlock* curr = (DataBlock*)((char*)ptr - sizeof(DataBlock));
    80002408:	fe850513          	addi	a0,a0,-24
    if(curr < used) return -3;
    8000240c:	12f56063          	bltu	a0,a5,8000252c <_ZN15MemoryAllocator8mem_freeEPv+0x158>
    if(used == curr) {
    80002410:	08a78c63          	beq	a5,a0,800024a8 <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
        curr->prev->next = curr->next;
    80002414:	ff073683          	ld	a3,-16(a4)
    80002418:	fe873783          	ld	a5,-24(a4)
    8000241c:	00f6b023          	sd	a5,0(a3)
        if(curr->next) curr->next->prev = curr->prev;
    80002420:	00078663          	beqz	a5,8000242c <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80002424:	ff073683          	ld	a3,-16(a4)
    80002428:	00d7b423          	sd	a3,8(a5)
        curr->next = nullptr;
    8000242c:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    80002430:	fe073823          	sd	zero,-16(a4)
    if (free == nullptr) {
    80002434:	00008797          	auipc	a5,0x8
    80002438:	ea47b783          	ld	a5,-348(a5) # 8000a2d8 <_ZN15MemoryAllocator4freeE>
    8000243c:	08078663          	beqz	a5,800024c8 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
int MemoryAllocator::mem_free(void* ptr) {
    80002440:	fe010113          	addi	sp,sp,-32
    80002444:	00113c23          	sd	ra,24(sp)
    80002448:	00813823          	sd	s0,16(sp)
    8000244c:	00913423          	sd	s1,8(sp)
    80002450:	02010413          	addi	s0,sp,32
    else if((char*)curr < (char*)free) {
    80002454:	08f56663          	bltu	a0,a5,800024e0 <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
        for(currFree = free; currFree->next && (char*)(currFree->next) < (char*) curr; currFree = currFree->next);
    80002458:	00078493          	mv	s1,a5
    8000245c:	0007b783          	ld	a5,0(a5)
    80002460:	00078463          	beqz	a5,80002468 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    80002464:	fea7eae3          	bltu	a5,a0,80002458 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
        curr->next = currFree->next;
    80002468:	fef73423          	sd	a5,-24(a4)
        curr->prev = currFree;
    8000246c:	fe973823          	sd	s1,-16(a4)
        if(curr->next) curr->next->prev = curr;
    80002470:	00078463          	beqz	a5,80002478 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    80002474:	00a7b423          	sd	a0,8(a5)
        currFree->next = curr;
    80002478:	00a4b023          	sd	a0,0(s1)
        tryToJoin(curr);
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	f04080e7          	jalr	-252(ra) # 80002380 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
        tryToJoin(currFree);
    80002484:	00048513          	mv	a0,s1
    80002488:	00000097          	auipc	ra,0x0
    8000248c:	ef8080e7          	jalr	-264(ra) # 80002380 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    80002490:	00000513          	li	a0,0
}
    80002494:	01813083          	ld	ra,24(sp)
    80002498:	01013403          	ld	s0,16(sp)
    8000249c:	00813483          	ld	s1,8(sp)
    800024a0:	02010113          	addi	sp,sp,32
    800024a4:	00008067          	ret
        used = curr->next;
    800024a8:	fe873783          	ld	a5,-24(a4)
    800024ac:	00008697          	auipc	a3,0x8
    800024b0:	e2f6ba23          	sd	a5,-460(a3) # 8000a2e0 <_ZN15MemoryAllocator4usedE>
        if(used) used->prev = nullptr;
    800024b4:	00078463          	beqz	a5,800024bc <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
    800024b8:	0007b423          	sd	zero,8(a5)
        curr->next = nullptr;
    800024bc:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    800024c0:	fe073823          	sd	zero,-16(a4)
    800024c4:	f71ff06f          	j	80002434 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        free = curr;
    800024c8:	00008797          	auipc	a5,0x8
    800024cc:	e0a7b823          	sd	a0,-496(a5) # 8000a2d8 <_ZN15MemoryAllocator4freeE>
        curr->next = nullptr;
    800024d0:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    800024d4:	fe073823          	sd	zero,-16(a4)
    return 0;
    800024d8:	00000513          	li	a0,0
    800024dc:	00008067          	ret
        free->prev = curr;
    800024e0:	00a7b423          	sd	a0,8(a5)
        curr->prev = nullptr;
    800024e4:	fe073823          	sd	zero,-16(a4)
        curr->next = free;
    800024e8:	00008797          	auipc	a5,0x8
    800024ec:	df078793          	addi	a5,a5,-528 # 8000a2d8 <_ZN15MemoryAllocator4freeE>
    800024f0:	0007b683          	ld	a3,0(a5)
    800024f4:	fed73423          	sd	a3,-24(a4)
        free = curr;
    800024f8:	00a7b023          	sd	a0,0(a5)
        tryToJoin(free);
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	e84080e7          	jalr	-380(ra) # 80002380 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    80002504:	00000513          	li	a0,0
    80002508:	f8dff06f          	j	80002494 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
    if(used == nullptr) return -1;
    8000250c:	fff00513          	li	a0,-1
    80002510:	00008067          	ret
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    80002514:	ffe00513          	li	a0,-2
    80002518:	00008067          	ret
    8000251c:	ffe00513          	li	a0,-2
    80002520:	00008067          	ret
    80002524:	ffe00513          	li	a0,-2
    80002528:	00008067          	ret
    if(curr < used) return -3;
    8000252c:	ffd00513          	li	a0,-3
}
    80002530:	00008067          	ret

0000000080002534 <_ZN10MojSemaforC1Ej>:
{
  if(otvoren)
    close();
}

MojSemafor::MojSemafor(unsigned v)
    80002534:	fe010113          	addi	sp,sp,-32
    80002538:	00113c23          	sd	ra,24(sp)
    8000253c:	00813823          	sd	s0,16(sp)
    80002540:	00913423          	sd	s1,8(sp)
    80002544:	01213023          	sd	s2,0(sp)
    80002548:	02010413          	addi	s0,sp,32
    8000254c:	00050493          	mv	s1,a0
    80002550:	00058913          	mv	s2,a1
Lista(): pocetak(nullptr), kraj(nullptr) {}
    80002554:	00053023          	sd	zero,0(a0)
    80002558:	00053423          	sd	zero,8(a0)
{
  printString("Pocetak konstruktora\n");
    8000255c:	00006517          	auipc	a0,0x6
    80002560:	bfc50513          	addi	a0,a0,-1028 # 80008158 <CONSOLE_STATUS+0x148>
    80002564:	00002097          	auipc	ra,0x2
    80002568:	184080e7          	jalr	388(ra) # 800046e8 <_Z11printStringPKc>
  vrednost = v;
    8000256c:	0124aa23          	sw	s2,20(s1)
  printString("Sredina konstruktora\n");
    80002570:	00006517          	auipc	a0,0x6
    80002574:	c0050513          	addi	a0,a0,-1024 # 80008170 <CONSOLE_STATUS+0x160>
    80002578:	00002097          	auipc	ra,0x2
    8000257c:	170080e7          	jalr	368(ra) # 800046e8 <_Z11printStringPKc>
  printInt(vrednost);
    80002580:	00000613          	li	a2,0
    80002584:	00a00593          	li	a1,10
    80002588:	0144a503          	lw	a0,20(s1)
    8000258c:	00002097          	auipc	ra,0x2
    80002590:	30c080e7          	jalr	780(ra) # 80004898 <_Z8printIntiii>
  otvoren = true;
    80002594:	00100793          	li	a5,1
    80002598:	00f48823          	sb	a5,16(s1)
  printString("Kraj konstruktora\n");
    8000259c:	00006517          	auipc	a0,0x6
    800025a0:	bec50513          	addi	a0,a0,-1044 # 80008188 <CONSOLE_STATUS+0x178>
    800025a4:	00002097          	auipc	ra,0x2
    800025a8:	144080e7          	jalr	324(ra) # 800046e8 <_Z11printStringPKc>
}
    800025ac:	01813083          	ld	ra,24(sp)
    800025b0:	01013403          	ld	s0,16(sp)
    800025b4:	00813483          	ld	s1,8(sp)
    800025b8:	00013903          	ld	s2,0(sp)
    800025bc:	02010113          	addi	sp,sp,32
    800025c0:	00008067          	ret

00000000800025c4 <_ZN10MojSemafor8sem_openEPPS_j>:
{
    800025c4:	fd010113          	addi	sp,sp,-48
    800025c8:	02113423          	sd	ra,40(sp)
    800025cc:	02813023          	sd	s0,32(sp)
    800025d0:	00913c23          	sd	s1,24(sp)
    800025d4:	01213823          	sd	s2,16(sp)
    800025d8:	01313423          	sd	s3,8(sp)
    800025dc:	03010413          	addi	s0,sp,48
    800025e0:	00050913          	mv	s2,a0
    800025e4:	00058993          	mv	s3,a1
  *handle = new MojSemafor(init);
    800025e8:	01800513          	li	a0,24
    800025ec:	fffff097          	auipc	ra,0xfffff
    800025f0:	3c0080e7          	jalr	960(ra) # 800019ac <_Znwm>
    800025f4:	00050493          	mv	s1,a0
    800025f8:	00098593          	mv	a1,s3
    800025fc:	00000097          	auipc	ra,0x0
    80002600:	f38080e7          	jalr	-200(ra) # 80002534 <_ZN10MojSemaforC1Ej>
    80002604:	0200006f          	j	80002624 <_ZN10MojSemafor8sem_openEPPS_j+0x60>
    80002608:	00050913          	mv	s2,a0
    8000260c:	00048513          	mv	a0,s1
    80002610:	fffff097          	auipc	ra,0xfffff
    80002614:	3ec080e7          	jalr	1004(ra) # 800019fc <_ZdlPv>
    80002618:	00090513          	mv	a0,s2
    8000261c:	00009097          	auipc	ra,0x9
    80002620:	dec080e7          	jalr	-532(ra) # 8000b408 <_Unwind_Resume>
    80002624:	00993023          	sd	s1,0(s2)
  printString("Izvrsio new za semafora\n");
    80002628:	00006517          	auipc	a0,0x6
    8000262c:	b7850513          	addi	a0,a0,-1160 # 800081a0 <CONSOLE_STATUS+0x190>
    80002630:	00002097          	auipc	ra,0x2
    80002634:	0b8080e7          	jalr	184(ra) # 800046e8 <_Z11printStringPKc>
}
    80002638:	00000513          	li	a0,0
    8000263c:	02813083          	ld	ra,40(sp)
    80002640:	02013403          	ld	s0,32(sp)
    80002644:	01813483          	ld	s1,24(sp)
    80002648:	01013903          	ld	s2,16(sp)
    8000264c:	00813983          	ld	s3,8(sp)
    80002650:	03010113          	addi	sp,sp,48
    80002654:	00008067          	ret

0000000080002658 <_ZN10MojSemafor6signalEv>:

int MojSemafor::signal()
{
  if(!otvoren)
    80002658:	01054703          	lbu	a4,16(a0)
    8000265c:	0a070663          	beqz	a4,80002708 <_ZN10MojSemafor6signalEv+0xb0>
    80002660:	00050793          	mv	a5,a0
    return -1;

  TCB *thread;
  if(++vrednost > 0)
    80002664:	01452703          	lw	a4,20(a0)
    80002668:	0017071b          	addiw	a4,a4,1
    8000266c:	0007069b          	sext.w	a3,a4
    80002670:	00e52a23          	sw	a4,20(a0)
    80002674:	08d05e63          	blez	a3,80002710 <_ZN10MojSemafor6signalEv+0xb8>
  if(pocetak == nullptr)
    80002678:	00053503          	ld	a0,0(a0)
    8000267c:	08050e63          	beqz	a0,80002718 <_ZN10MojSemafor6signalEv+0xc0>
{
    80002680:	fe010113          	addi	sp,sp,-32
    80002684:	00113c23          	sd	ra,24(sp)
    80002688:	00813823          	sd	s0,16(sp)
    8000268c:	00913423          	sd	s1,8(sp)
    80002690:	02010413          	addi	s0,sp,32
  pocetak = pocetak->sledeci;
    80002694:	00853703          	ld	a4,8(a0)
    80002698:	00e7b023          	sd	a4,0(a5)
  if(pocetak == nullptr)
    8000269c:	04070e63          	beqz	a4,800026f8 <_ZN10MojSemafor6signalEv+0xa0>
  T* pv = cvor->podaci;
    800026a0:	00053483          	ld	s1,0(a0)
  delete cvor;
    800026a4:	fffff097          	auipc	ra,0xfffff
    800026a8:	358080e7          	jalr	856(ra) # 800019fc <_ZdlPv>
  {
    thread = blokirane.izbaciPrvi();
    if(thread == nullptr)
    800026ac:	04048a63          	beqz	s1,80002700 <_ZN10MojSemafor6signalEv+0xa8>
    {
      return 0;
    }
    printString("Received thread\n");
    800026b0:	00006517          	auipc	a0,0x6
    800026b4:	b1050513          	addi	a0,a0,-1264 # 800081c0 <CONSOLE_STATUS+0x1b0>
    800026b8:	00002097          	auipc	ra,0x2
    800026bc:	030080e7          	jalr	48(ra) # 800046e8 <_Z11printStringPKc>
     this->blokirana = false;
    800026c0:	020484a3          	sb	zero,41(s1)
    thread->odblokiraj();
    printString("Unblocked thread\n");
    800026c4:	00006517          	auipc	a0,0x6
    800026c8:	b1450513          	addi	a0,a0,-1260 # 800081d8 <CONSOLE_STATUS+0x1c8>
    800026cc:	00002097          	auipc	ra,0x2
    800026d0:	01c080e7          	jalr	28(ra) # 800046e8 <_Z11printStringPKc>
    Scheduler::stavi(thread);
    800026d4:	00048513          	mv	a0,s1
    800026d8:	fffff097          	auipc	ra,0xfffff
    800026dc:	3b4080e7          	jalr	948(ra) # 80001a8c <_ZN9Scheduler5staviEP3TCB>
  }
  return 0;
    800026e0:	00000513          	li	a0,0
}
    800026e4:	01813083          	ld	ra,24(sp)
    800026e8:	01013403          	ld	s0,16(sp)
    800026ec:	00813483          	ld	s1,8(sp)
    800026f0:	02010113          	addi	sp,sp,32
    800026f4:	00008067          	ret
    kraj = nullptr;
    800026f8:	0007b423          	sd	zero,8(a5)
    800026fc:	fa5ff06f          	j	800026a0 <_ZN10MojSemafor6signalEv+0x48>
      return 0;
    80002700:	00000513          	li	a0,0
    80002704:	fe1ff06f          	j	800026e4 <_ZN10MojSemafor6signalEv+0x8c>
    return -1;
    80002708:	fff00513          	li	a0,-1
    8000270c:	00008067          	ret
  return 0;
    80002710:	00000513          	li	a0,0
    80002714:	00008067          	ret
      return 0;
    80002718:	00000513          	li	a0,0
}
    8000271c:	00008067          	ret

0000000080002720 <_ZN10MojSemafor4waitEv>:

int MojSemafor::wait()
{
  if(!otvoren)
    80002720:	01054783          	lbu	a5,16(a0)
    80002724:	0a078663          	beqz	a5,800027d0 <_ZN10MojSemafor4waitEv+0xb0>
{
    80002728:	fe010113          	addi	sp,sp,-32
    8000272c:	00113c23          	sd	ra,24(sp)
    80002730:	00813823          	sd	s0,16(sp)
    80002734:	00913423          	sd	s1,8(sp)
    80002738:	01213023          	sd	s2,0(sp)
    8000273c:	02010413          	addi	s0,sp,32
    80002740:	00050493          	mv	s1,a0
    return -1;

  if(--vrednost < 0)
    80002744:	01452783          	lw	a5,20(a0)
    80002748:	fff7879b          	addiw	a5,a5,-1
    8000274c:	00f52a23          	sw	a5,20(a0)
    80002750:	02079713          	slli	a4,a5,0x20
    80002754:	02074063          	bltz	a4,80002774 <_ZN10MojSemafor4waitEv+0x54>
    blokirane.dodajNaKraj(TCB::trenutnaNit);
    TCB::dispatch();
    if(!otvoren)
      return -2;
  }
  return 0;
    80002758:	00000513          	li	a0,0

}
    8000275c:	01813083          	ld	ra,24(sp)
    80002760:	01013403          	ld	s0,16(sp)
    80002764:	00813483          	ld	s1,8(sp)
    80002768:	00013903          	ld	s2,0(sp)
    8000276c:	02010113          	addi	sp,sp,32
    80002770:	00008067          	ret
    TCB::trenutnaNit->blokiraj();
    80002774:	00008797          	auipc	a5,0x8
    80002778:	aec7b783          	ld	a5,-1300(a5) # 8000a260 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000277c:	0007b903          	ld	s2,0(a5)
     this->blokirana = true;
    80002780:	00100793          	li	a5,1
    80002784:	02f904a3          	sb	a5,41(s2)
Cvor *noviCvor = new Cvor(t, nullptr);
    80002788:	01000513          	li	a0,16
    8000278c:	fffff097          	auipc	ra,0xfffff
    80002790:	220080e7          	jalr	544(ra) # 800019ac <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80002794:	01253023          	sd	s2,0(a0)
    80002798:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    8000279c:	0084b783          	ld	a5,8(s1)
    800027a0:	02078263          	beqz	a5,800027c4 <_ZN10MojSemafor4waitEv+0xa4>
     kraj = kraj->sledeci = noviCvor;
    800027a4:	00a7b423          	sd	a0,8(a5)
    800027a8:	00a4b423          	sd	a0,8(s1)
    TCB::dispatch();
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	908080e7          	jalr	-1784(ra) # 800020b4 <_ZN3TCB8dispatchEv>
    if(!otvoren)
    800027b4:	0104c783          	lbu	a5,16(s1)
    800027b8:	02078063          	beqz	a5,800027d8 <_ZN10MojSemafor4waitEv+0xb8>
  return 0;
    800027bc:	00000513          	li	a0,0
    800027c0:	f9dff06f          	j	8000275c <_ZN10MojSemafor4waitEv+0x3c>
    pocetak = kraj = noviCvor;
    800027c4:	00a4b423          	sd	a0,8(s1)
    800027c8:	00a4b023          	sd	a0,0(s1)
    800027cc:	fe1ff06f          	j	800027ac <_ZN10MojSemafor4waitEv+0x8c>
    return -1;
    800027d0:	fff00513          	li	a0,-1
}
    800027d4:	00008067          	ret
      return -2;
    800027d8:	ffe00513          	li	a0,-2
    800027dc:	f81ff06f          	j	8000275c <_ZN10MojSemafor4waitEv+0x3c>

00000000800027e0 <_ZN10MojSemafor5closeEv>:

int MojSemafor::close()
{
  if(!otvoren)
    800027e0:	01054783          	lbu	a5,16(a0)
    800027e4:	06078463          	beqz	a5,8000284c <_ZN10MojSemafor5closeEv+0x6c>
{
    800027e8:	fe010113          	addi	sp,sp,-32
    800027ec:	00113c23          	sd	ra,24(sp)
    800027f0:	00813823          	sd	s0,16(sp)
    800027f4:	00913423          	sd	s1,8(sp)
    800027f8:	01213023          	sd	s2,0(sp)
    800027fc:	02010413          	addi	s0,sp,32
    80002800:	00050493          	mv	s1,a0
    return -1;

  otvoren = false;
    80002804:	00050823          	sb	zero,16(a0)
    80002808:	0240006f          	j	8000282c <_ZN10MojSemafor5closeEv+0x4c>
    kraj = nullptr;
    8000280c:	0004b423          	sd	zero,8(s1)
  T* pv = cvor->podaci;
    80002810:	00053903          	ld	s2,0(a0)
  delete cvor;
    80002814:	fffff097          	auipc	ra,0xfffff
    80002818:	1e8080e7          	jalr	488(ra) # 800019fc <_ZdlPv>
     this->blokirana = false;
    8000281c:	020904a3          	sb	zero,41(s2)
  while(blokirane.dohvatiPrvi() != nullptr)
  {
    TCB *thread = blokirane.izbaciPrvi();
    thread->odblokiraj();
    Scheduler::stavi(thread);
    80002820:	00090513          	mv	a0,s2
    80002824:	fffff097          	auipc	ra,0xfffff
    80002828:	268080e7          	jalr	616(ra) # 80001a8c <_ZN9Scheduler5staviEP3TCB>
    return pv;
}

T* dohvatiPrvi()
{
if(pocetak == nullptr)
    8000282c:	0004b503          	ld	a0,0(s1)
    80002830:	02050263          	beqz	a0,80002854 <_ZN10MojSemafor5closeEv+0x74>
  return nullptr;

return pocetak->podaci;
    80002834:	00053783          	ld	a5,0(a0)
  while(blokirane.dohvatiPrvi() != nullptr)
    80002838:	02078c63          	beqz	a5,80002870 <_ZN10MojSemafor5closeEv+0x90>
  pocetak = pocetak->sledeci;
    8000283c:	00853783          	ld	a5,8(a0)
    80002840:	00f4b023          	sd	a5,0(s1)
  if(pocetak == nullptr)
    80002844:	fc0796e3          	bnez	a5,80002810 <_ZN10MojSemafor5closeEv+0x30>
    80002848:	fc5ff06f          	j	8000280c <_ZN10MojSemafor5closeEv+0x2c>
    return -1;
    8000284c:	fff00513          	li	a0,-1
  }

  return 0;
}
    80002850:	00008067          	ret
  return 0;
    80002854:	00000513          	li	a0,0
}
    80002858:	01813083          	ld	ra,24(sp)
    8000285c:	01013403          	ld	s0,16(sp)
    80002860:	00813483          	ld	s1,8(sp)
    80002864:	00013903          	ld	s2,0(sp)
    80002868:	02010113          	addi	sp,sp,32
    8000286c:	00008067          	ret
  return 0;
    80002870:	00000513          	li	a0,0
    80002874:	fe5ff06f          	j	80002858 <_ZN10MojSemafor5closeEv+0x78>

0000000080002878 <_ZN10MojSemaforD1Ev>:
  if(otvoren)
    80002878:	01054783          	lbu	a5,16(a0)
    8000287c:	00079463          	bnez	a5,80002884 <_ZN10MojSemaforD1Ev+0xc>
    80002880:	00008067          	ret
MojSemafor::~MojSemafor()
    80002884:	ff010113          	addi	sp,sp,-16
    80002888:	00113423          	sd	ra,8(sp)
    8000288c:	00813023          	sd	s0,0(sp)
    80002890:	01010413          	addi	s0,sp,16
    close();
    80002894:	00000097          	auipc	ra,0x0
    80002898:	f4c080e7          	jalr	-180(ra) # 800027e0 <_ZN10MojSemafor5closeEv>
}
    8000289c:	00813083          	ld	ra,8(sp)
    800028a0:	00013403          	ld	s0,0(sp)
    800028a4:	01010113          	addi	sp,sp,16
    800028a8:	00008067          	ret

00000000800028ac <_ZN10MojSemafor7trywaitEv>:

int MojSemafor::trywait()
{
    800028ac:	ff010113          	addi	sp,sp,-16
    800028b0:	00813423          	sd	s0,8(sp)
    800028b4:	01010413          	addi	s0,sp,16
  if(vrednost <= 0)
    800028b8:	01452783          	lw	a5,20(a0)
    800028bc:	00f05e63          	blez	a5,800028d8 <_ZN10MojSemafor7trywaitEv+0x2c>
    return 1;
  else
  {
    vrednost--;
    800028c0:	fff7879b          	addiw	a5,a5,-1
    800028c4:	00f52a23          	sw	a5,20(a0)
    return 0;
    800028c8:	00000513          	li	a0,0
  }
}
    800028cc:	00813403          	ld	s0,8(sp)
    800028d0:	01010113          	addi	sp,sp,16
    800028d4:	00008067          	ret
    return 1;
    800028d8:	00100513          	li	a0,1
    800028dc:	ff1ff06f          	j	800028cc <_ZN10MojSemafor7trywaitEv+0x20>

00000000800028e0 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800028e0:	fd010113          	addi	sp,sp,-48
    800028e4:	02113423          	sd	ra,40(sp)
    800028e8:	02813023          	sd	s0,32(sp)
    800028ec:	00913c23          	sd	s1,24(sp)
    800028f0:	01213823          	sd	s2,16(sp)
    800028f4:	01313423          	sd	s3,8(sp)
    800028f8:	03010413          	addi	s0,sp,48
    800028fc:	00050993          	mv	s3,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    printString("Entered keyboard producer: ");
    80002900:	00006517          	auipc	a0,0x6
    80002904:	8f050513          	addi	a0,a0,-1808 # 800081f0 <CONSOLE_STATUS+0x1e0>
    80002908:	00002097          	auipc	ra,0x2
    8000290c:	de0080e7          	jalr	-544(ra) # 800046e8 <_Z11printStringPKc>
    printInt(data->id);
    80002910:	00000613          	li	a2,0
    80002914:	00a00593          	li	a1,10
    80002918:	0009a503          	lw	a0,0(s3)
    8000291c:	00002097          	auipc	ra,0x2
    80002920:	f7c080e7          	jalr	-132(ra) # 80004898 <_Z8printIntiii>
    printString("\n");
    80002924:	00006517          	auipc	a0,0x6
    80002928:	a5450513          	addi	a0,a0,-1452 # 80008378 <CONSOLE_STATUS+0x368>
    8000292c:	00002097          	auipc	ra,0x2
    80002930:	dbc080e7          	jalr	-580(ra) # 800046e8 <_Z11printStringPKc>
    int i = 0;
    80002934:	00000913          	li	s2,0
    80002938:	0600006f          	j	80002998 <_ZL16producerKeyboardPv+0xb8>
            printString("Keyboard producer has dispatched \n");
            thread_dispatch();
        }
    }

    threadEnd = 1;
    8000293c:	00100793          	li	a5,1
    80002940:	00008717          	auipc	a4,0x8
    80002944:	9af72c23          	sw	a5,-1608(a4) # 8000a2f8 <_ZL9threadEnd>
    data->buffer->put('!');
    80002948:	02100593          	li	a1,33
    8000294c:	0089b503          	ld	a0,8(s3)
    80002950:	00003097          	auipc	ra,0x3
    80002954:	b4c080e7          	jalr	-1204(ra) # 8000549c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002958:	0109b503          	ld	a0,16(s3)
    8000295c:	fffff097          	auipc	ra,0xfffff
    80002960:	f64080e7          	jalr	-156(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
}
    80002964:	02813083          	ld	ra,40(sp)
    80002968:	02013403          	ld	s0,32(sp)
    8000296c:	01813483          	ld	s1,24(sp)
    80002970:	01013903          	ld	s2,16(sp)
    80002974:	00813983          	ld	s3,8(sp)
    80002978:	03010113          	addi	sp,sp,48
    8000297c:	00008067          	ret
            printString("Keyboard producer has dispatched \n");
    80002980:	00006517          	auipc	a0,0x6
    80002984:	8d850513          	addi	a0,a0,-1832 # 80008258 <CONSOLE_STATUS+0x248>
    80002988:	00002097          	auipc	ra,0x2
    8000298c:	d60080e7          	jalr	-672(ra) # 800046e8 <_Z11printStringPKc>
            thread_dispatch();
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	e10080e7          	jalr	-496(ra) # 800017a0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b && i!=15) {
    80002998:	fffff097          	auipc	ra,0xfffff
    8000299c:	f80080e7          	jalr	-128(ra) # 80001918 <_Z4getcv>
    800029a0:	0005049b          	sext.w	s1,a0
    800029a4:	01b00793          	li	a5,27
    800029a8:	f8f48ae3          	beq	s1,a5,8000293c <_ZL16producerKeyboardPv+0x5c>
    800029ac:	00f00793          	li	a5,15
    800029b0:	f8f906e3          	beq	s2,a5,8000293c <_ZL16producerKeyboardPv+0x5c>
        printString("Entered while loop for keyboard prod\n");
    800029b4:	00006517          	auipc	a0,0x6
    800029b8:	85c50513          	addi	a0,a0,-1956 # 80008210 <CONSOLE_STATUS+0x200>
    800029bc:	00002097          	auipc	ra,0x2
    800029c0:	d2c080e7          	jalr	-724(ra) # 800046e8 <_Z11printStringPKc>
        data->buffer->put(key);
    800029c4:	00048593          	mv	a1,s1
    800029c8:	0089b503          	ld	a0,8(s3)
    800029cc:	00003097          	auipc	ra,0x3
    800029d0:	ad0080e7          	jalr	-1328(ra) # 8000549c <_ZN6Buffer3putEi>
        i++;
    800029d4:	0019049b          	addiw	s1,s2,1
    800029d8:	0004891b          	sext.w	s2,s1
        printString("Keyboard producer wrote: ");
    800029dc:	00006517          	auipc	a0,0x6
    800029e0:	85c50513          	addi	a0,a0,-1956 # 80008238 <CONSOLE_STATUS+0x228>
    800029e4:	00002097          	auipc	ra,0x2
    800029e8:	d04080e7          	jalr	-764(ra) # 800046e8 <_Z11printStringPKc>
        printInt(i);
    800029ec:	00000613          	li	a2,0
    800029f0:	00a00593          	li	a1,10
    800029f4:	00090513          	mv	a0,s2
    800029f8:	00002097          	auipc	ra,0x2
    800029fc:	ea0080e7          	jalr	-352(ra) # 80004898 <_Z8printIntiii>
        printString("\n");
    80002a00:	00006517          	auipc	a0,0x6
    80002a04:	97850513          	addi	a0,a0,-1672 # 80008378 <CONSOLE_STATUS+0x368>
    80002a08:	00002097          	auipc	ra,0x2
    80002a0c:	ce0080e7          	jalr	-800(ra) # 800046e8 <_Z11printStringPKc>
        if (i % (10 * data->id) == 0) {
    80002a10:	0009a703          	lw	a4,0(s3)
    80002a14:	0027179b          	slliw	a5,a4,0x2
    80002a18:	00e787bb          	addw	a5,a5,a4
    80002a1c:	0017979b          	slliw	a5,a5,0x1
    80002a20:	02f4e7bb          	remw	a5,s1,a5
    80002a24:	f6079ae3          	bnez	a5,80002998 <_ZL16producerKeyboardPv+0xb8>
    80002a28:	f59ff06f          	j	80002980 <_ZL16producerKeyboardPv+0xa0>

0000000080002a2c <_ZL8producerPv>:

static void producer(void *arg) {
    80002a2c:	fe010113          	addi	sp,sp,-32
    80002a30:	00113c23          	sd	ra,24(sp)
    80002a34:	00813823          	sd	s0,16(sp)
    80002a38:	00913423          	sd	s1,8(sp)
    80002a3c:	01213023          	sd	s2,0(sp)
    80002a40:	02010413          	addi	s0,sp,32
    80002a44:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    printString("Entered producer: ");
    80002a48:	00006517          	auipc	a0,0x6
    80002a4c:	83850513          	addi	a0,a0,-1992 # 80008280 <CONSOLE_STATUS+0x270>
    80002a50:	00002097          	auipc	ra,0x2
    80002a54:	c98080e7          	jalr	-872(ra) # 800046e8 <_Z11printStringPKc>
    printInt(data->id);
    80002a58:	00000613          	li	a2,0
    80002a5c:	00a00593          	li	a1,10
    80002a60:	0004a503          	lw	a0,0(s1)
    80002a64:	00002097          	auipc	ra,0x2
    80002a68:	e34080e7          	jalr	-460(ra) # 80004898 <_Z8printIntiii>
    printString("\n");
    80002a6c:	00006517          	auipc	a0,0x6
    80002a70:	90c50513          	addi	a0,a0,-1780 # 80008378 <CONSOLE_STATUS+0x368>
    80002a74:	00002097          	auipc	ra,0x2
    80002a78:	c74080e7          	jalr	-908(ra) # 800046e8 <_Z11printStringPKc>
    int i = 0;
    80002a7c:	00000913          	li	s2,0
    80002a80:	00c0006f          	j	80002a8c <_ZL8producerPv+0x60>
        printInt(data->id);
        printString("\n");
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	d1c080e7          	jalr	-740(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002a8c:	00008797          	auipc	a5,0x8
    80002a90:	86c7a783          	lw	a5,-1940(a5) # 8000a2f8 <_ZL9threadEnd>
    80002a94:	06079863          	bnez	a5,80002b04 <_ZL8producerPv+0xd8>
        data->buffer->put(data->id + '0');
    80002a98:	0004a583          	lw	a1,0(s1)
    80002a9c:	0305859b          	addiw	a1,a1,48
    80002aa0:	0084b503          	ld	a0,8(s1)
    80002aa4:	00003097          	auipc	ra,0x3
    80002aa8:	9f8080e7          	jalr	-1544(ra) # 8000549c <_ZN6Buffer3putEi>
        printString("Producer wrote: ");
    80002aac:	00005517          	auipc	a0,0x5
    80002ab0:	7ec50513          	addi	a0,a0,2028 # 80008298 <CONSOLE_STATUS+0x288>
    80002ab4:	00002097          	auipc	ra,0x2
    80002ab8:	c34080e7          	jalr	-972(ra) # 800046e8 <_Z11printStringPKc>
        printInt(data->id);
    80002abc:	00000613          	li	a2,0
    80002ac0:	00a00593          	li	a1,10
    80002ac4:	0004a503          	lw	a0,0(s1)
    80002ac8:	00002097          	auipc	ra,0x2
    80002acc:	dd0080e7          	jalr	-560(ra) # 80004898 <_Z8printIntiii>
        printString("\n");
    80002ad0:	00006517          	auipc	a0,0x6
    80002ad4:	8a850513          	addi	a0,a0,-1880 # 80008378 <CONSOLE_STATUS+0x368>
    80002ad8:	00002097          	auipc	ra,0x2
    80002adc:	c10080e7          	jalr	-1008(ra) # 800046e8 <_Z11printStringPKc>
        i++;
    80002ae0:	0019071b          	addiw	a4,s2,1
    80002ae4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002ae8:	0004a683          	lw	a3,0(s1)
    80002aec:	0026979b          	slliw	a5,a3,0x2
    80002af0:	00d787bb          	addw	a5,a5,a3
    80002af4:	0017979b          	slliw	a5,a5,0x1
    80002af8:	02f767bb          	remw	a5,a4,a5
    80002afc:	f80798e3          	bnez	a5,80002a8c <_ZL8producerPv+0x60>
    80002b00:	f85ff06f          	j	80002a84 <_ZL8producerPv+0x58>
        }
    }

    sem_signal(data->wait);
    80002b04:	0104b503          	ld	a0,16(s1)
    80002b08:	fffff097          	auipc	ra,0xfffff
    80002b0c:	db8080e7          	jalr	-584(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
}
    80002b10:	01813083          	ld	ra,24(sp)
    80002b14:	01013403          	ld	s0,16(sp)
    80002b18:	00813483          	ld	s1,8(sp)
    80002b1c:	00013903          	ld	s2,0(sp)
    80002b20:	02010113          	addi	sp,sp,32
    80002b24:	00008067          	ret

0000000080002b28 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002b28:	fd010113          	addi	sp,sp,-48
    80002b2c:	02113423          	sd	ra,40(sp)
    80002b30:	02813023          	sd	s0,32(sp)
    80002b34:	00913c23          	sd	s1,24(sp)
    80002b38:	01213823          	sd	s2,16(sp)
    80002b3c:	01313423          	sd	s3,8(sp)
    80002b40:	01413023          	sd	s4,0(sp)
    80002b44:	03010413          	addi	s0,sp,48
    80002b48:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    printString("Entered consumer: ");
    80002b4c:	00005517          	auipc	a0,0x5
    80002b50:	76450513          	addi	a0,a0,1892 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80002b54:	00002097          	auipc	ra,0x2
    80002b58:	b94080e7          	jalr	-1132(ra) # 800046e8 <_Z11printStringPKc>
    printInt(data->id);
    80002b5c:	00000613          	li	a2,0
    80002b60:	00a00593          	li	a1,10
    80002b64:	00092503          	lw	a0,0(s2)
    80002b68:	00002097          	auipc	ra,0x2
    80002b6c:	d30080e7          	jalr	-720(ra) # 80004898 <_Z8printIntiii>
    printString("\n");
    80002b70:	00006517          	auipc	a0,0x6
    80002b74:	80850513          	addi	a0,a0,-2040 # 80008378 <CONSOLE_STATUS+0x368>
    80002b78:	00002097          	auipc	ra,0x2
    80002b7c:	b70080e7          	jalr	-1168(ra) # 800046e8 <_Z11printStringPKc>
    int i = 0;
    80002b80:	00000a13          	li	s4,0
    80002b84:	01c0006f          	j	80002ba0 <_ZL8consumerPv+0x78>
        i++;
        printString("Consumer read");
        putc(key);
        printString("\n");
        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002b88:	fffff097          	auipc	ra,0xfffff
    80002b8c:	c18080e7          	jalr	-1000(ra) # 800017a0 <_Z15thread_dispatchv>
    80002b90:	0740006f          	j	80002c04 <_ZL8consumerPv+0xdc>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002b94:	00a00513          	li	a0,10
    80002b98:	fffff097          	auipc	ra,0xfffff
    80002b9c:	da8080e7          	jalr	-600(ra) # 80001940 <_Z4putcc>
    while (!threadEnd) {
    80002ba0:	00007797          	auipc	a5,0x7
    80002ba4:	7587a783          	lw	a5,1880(a5) # 8000a2f8 <_ZL9threadEnd>
    80002ba8:	08079263          	bnez	a5,80002c2c <_ZL8consumerPv+0x104>
        int key = data->buffer->get();
    80002bac:	00893503          	ld	a0,8(s2)
    80002bb0:	00003097          	auipc	ra,0x3
    80002bb4:	98c080e7          	jalr	-1652(ra) # 8000553c <_ZN6Buffer3getEv>
    80002bb8:	00050993          	mv	s3,a0
        i++;
    80002bbc:	001a049b          	addiw	s1,s4,1
    80002bc0:	00048a1b          	sext.w	s4,s1
        printString("Consumer read");
    80002bc4:	00005517          	auipc	a0,0x5
    80002bc8:	70450513          	addi	a0,a0,1796 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80002bcc:	00002097          	auipc	ra,0x2
    80002bd0:	b1c080e7          	jalr	-1252(ra) # 800046e8 <_Z11printStringPKc>
        putc(key);
    80002bd4:	0ff9f513          	andi	a0,s3,255
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	d68080e7          	jalr	-664(ra) # 80001940 <_Z4putcc>
        printString("\n");
    80002be0:	00005517          	auipc	a0,0x5
    80002be4:	79850513          	addi	a0,a0,1944 # 80008378 <CONSOLE_STATUS+0x368>
    80002be8:	00002097          	auipc	ra,0x2
    80002bec:	b00080e7          	jalr	-1280(ra) # 800046e8 <_Z11printStringPKc>
        if (i % (5 * data->id) == 0) {
    80002bf0:	00092703          	lw	a4,0(s2)
    80002bf4:	0027179b          	slliw	a5,a4,0x2
    80002bf8:	00e787bb          	addw	a5,a5,a4
    80002bfc:	02f4e7bb          	remw	a5,s1,a5
    80002c00:	f80784e3          	beqz	a5,80002b88 <_ZL8consumerPv+0x60>
        if (i % 80 == 0) {
    80002c04:	05000793          	li	a5,80
    80002c08:	02f4e4bb          	remw	s1,s1,a5
    80002c0c:	f8049ae3          	bnez	s1,80002ba0 <_ZL8consumerPv+0x78>
    80002c10:	f85ff06f          	j	80002b94 <_ZL8consumerPv+0x6c>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002c14:	00893503          	ld	a0,8(s2)
    80002c18:	00003097          	auipc	ra,0x3
    80002c1c:	924080e7          	jalr	-1756(ra) # 8000553c <_ZN6Buffer3getEv>
        putc(key);
    80002c20:	0ff57513          	andi	a0,a0,255
    80002c24:	fffff097          	auipc	ra,0xfffff
    80002c28:	d1c080e7          	jalr	-740(ra) # 80001940 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002c2c:	00893503          	ld	a0,8(s2)
    80002c30:	00003097          	auipc	ra,0x3
    80002c34:	998080e7          	jalr	-1640(ra) # 800055c8 <_ZN6Buffer6getCntEv>
    80002c38:	fca04ee3          	bgtz	a0,80002c14 <_ZL8consumerPv+0xec>
    }

    sem_signal(data->wait);
    80002c3c:	01093503          	ld	a0,16(s2)
    80002c40:	fffff097          	auipc	ra,0xfffff
    80002c44:	c80080e7          	jalr	-896(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
}
    80002c48:	02813083          	ld	ra,40(sp)
    80002c4c:	02013403          	ld	s0,32(sp)
    80002c50:	01813483          	ld	s1,24(sp)
    80002c54:	01013903          	ld	s2,16(sp)
    80002c58:	00813983          	ld	s3,8(sp)
    80002c5c:	00013a03          	ld	s4,0(sp)
    80002c60:	03010113          	addi	sp,sp,48
    80002c64:	00008067          	ret

0000000080002c68 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002c68:	f2010113          	addi	sp,sp,-224
    80002c6c:	0c113c23          	sd	ra,216(sp)
    80002c70:	0c813823          	sd	s0,208(sp)
    80002c74:	0c913423          	sd	s1,200(sp)
    80002c78:	0d213023          	sd	s2,192(sp)
    80002c7c:	0e010413          	addi	s0,sp,224
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    80002c80:	00005517          	auipc	a0,0x5
    80002c84:	65850513          	addi	a0,a0,1624 # 800082d8 <CONSOLE_STATUS+0x2c8>
    80002c88:	00002097          	auipc	ra,0x2
    80002c8c:	a60080e7          	jalr	-1440(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 5;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    80002c90:	00005517          	auipc	a0,0x5
    80002c94:	66850513          	addi	a0,a0,1640 # 800082f8 <CONSOLE_STATUS+0x2e8>
    80002c98:	00002097          	auipc	ra,0x2
    80002c9c:	a50080e7          	jalr	-1456(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    80002ca0:	00005517          	auipc	a0,0x5
    80002ca4:	67850513          	addi	a0,a0,1656 # 80008318 <CONSOLE_STATUS+0x308>
    80002ca8:	00002097          	auipc	ra,0x2
    80002cac:	a40080e7          	jalr	-1472(ra) # 800046e8 <_Z11printStringPKc>
    80002cb0:	00000613          	li	a2,0
    80002cb4:	00a00593          	li	a1,10
    80002cb8:	00500513          	li	a0,5
    80002cbc:	00002097          	auipc	ra,0x2
    80002cc0:	bdc080e7          	jalr	-1060(ra) # 80004898 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002cc4:	00005517          	auipc	a0,0x5
    80002cc8:	66c50513          	addi	a0,a0,1644 # 80008330 <CONSOLE_STATUS+0x320>
    80002ccc:	00002097          	auipc	ra,0x2
    80002cd0:	a1c080e7          	jalr	-1508(ra) # 800046e8 <_Z11printStringPKc>
    80002cd4:	00000613          	li	a2,0
    80002cd8:	00a00593          	li	a1,10
    80002cdc:	00a00513          	li	a0,10
    80002ce0:	00002097          	auipc	ra,0x2
    80002ce4:	bb8080e7          	jalr	-1096(ra) # 80004898 <_Z8printIntiii>
    printString(".\n");
    80002ce8:	00005517          	auipc	a0,0x5
    80002cec:	66050513          	addi	a0,a0,1632 # 80008348 <CONSOLE_STATUS+0x338>
    80002cf0:	00002097          	auipc	ra,0x2
    80002cf4:	9f8080e7          	jalr	-1544(ra) # 800046e8 <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    Buffer *buffer = new Buffer(n);
    80002cf8:	03800513          	li	a0,56
    80002cfc:	fffff097          	auipc	ra,0xfffff
    80002d00:	cb0080e7          	jalr	-848(ra) # 800019ac <_Znwm>
    80002d04:	00050913          	mv	s2,a0
    80002d08:	00a00593          	li	a1,10
    80002d0c:	00002097          	auipc	ra,0x2
    80002d10:	6d4080e7          	jalr	1748(ra) # 800053e0 <_ZN6BufferC1Ei>
    printString("Control point 1\n");
    80002d14:	00005517          	auipc	a0,0x5
    80002d18:	63c50513          	addi	a0,a0,1596 # 80008350 <CONSOLE_STATUS+0x340>
    80002d1c:	00002097          	auipc	ra,0x2
    80002d20:	9cc080e7          	jalr	-1588(ra) # 800046e8 <_Z11printStringPKc>

    sem_open(&waitForAll, 0);
    80002d24:	00000593          	li	a1,0
    80002d28:	00007517          	auipc	a0,0x7
    80002d2c:	5d850513          	addi	a0,a0,1496 # 8000a300 <_ZL10waitForAll>
    80002d30:	fffff097          	auipc	ra,0xfffff
    80002d34:	ab4080e7          	jalr	-1356(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    printString("Control point 2!\n");
    80002d38:	00005517          	auipc	a0,0x5
    80002d3c:	63050513          	addi	a0,a0,1584 # 80008368 <CONSOLE_STATUS+0x358>
    80002d40:	00002097          	auipc	ra,0x2
    80002d44:	9a8080e7          	jalr	-1624(ra) # 800046e8 <_Z11printStringPKc>

    thread_t threads[threadNum];
    thread_t consumerThread;
    printString("Control point 3!\n");
    80002d48:	00005517          	auipc	a0,0x5
    80002d4c:	63850513          	addi	a0,a0,1592 # 80008380 <CONSOLE_STATUS+0x370>
    80002d50:	00002097          	auipc	ra,0x2
    80002d54:	998080e7          	jalr	-1640(ra) # 800046e8 <_Z11printStringPKc>
    struct thread_data data[threadNum + 1];
    printString("Control point 4!\n");
    80002d58:	00005517          	auipc	a0,0x5
    80002d5c:	64050513          	addi	a0,a0,1600 # 80008398 <CONSOLE_STATUS+0x388>
    80002d60:	00002097          	auipc	ra,0x2
    80002d64:	988080e7          	jalr	-1656(ra) # 800046e8 <_Z11printStringPKc>
    data[threadNum].id = threadNum;
    80002d68:	00500793          	li	a5,5
    80002d6c:	fcf42023          	sw	a5,-64(s0)
    data[threadNum].buffer = buffer;
    80002d70:	fd243423          	sd	s2,-56(s0)
    data[threadNum].wait = waitForAll;
    80002d74:	00007797          	auipc	a5,0x7
    80002d78:	58c7b783          	ld	a5,1420(a5) # 8000a300 <_ZL10waitForAll>
    80002d7c:	fcf43823          	sd	a5,-48(s0)
    printString("Control point 5!\n");
    80002d80:	00005517          	auipc	a0,0x5
    80002d84:	63050513          	addi	a0,a0,1584 # 800083b0 <CONSOLE_STATUS+0x3a0>
    80002d88:	00002097          	auipc	ra,0x2
    80002d8c:	960080e7          	jalr	-1696(ra) # 800046e8 <_Z11printStringPKc>
    thread_create(&consumerThread, consumer, data + threadNum);
    80002d90:	fc040613          	addi	a2,s0,-64
    80002d94:	00000597          	auipc	a1,0x0
    80002d98:	d9458593          	addi	a1,a1,-620 # 80002b28 <_ZL8consumerPv>
    80002d9c:	fd840513          	addi	a0,s0,-40
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	8e0080e7          	jalr	-1824(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("Control point 6!\n");
    80002da8:	00005517          	auipc	a0,0x5
    80002dac:	62050513          	addi	a0,a0,1568 # 800083c8 <CONSOLE_STATUS+0x3b8>
    80002db0:	00002097          	auipc	ra,0x2
    80002db4:	938080e7          	jalr	-1736(ra) # 800046e8 <_Z11printStringPKc>
    for (int i = 0; i < threadNum; i++) {
    80002db8:	00000493          	li	s1,0
    80002dbc:	00400793          	li	a5,4
    80002dc0:	0697cc63          	blt	a5,s1,80002e38 <_Z22producerConsumer_C_APIv+0x1d0>
        data[i].id = i;
    80002dc4:	00149793          	slli	a5,s1,0x1
    80002dc8:	009787b3          	add	a5,a5,s1
    80002dcc:	00379793          	slli	a5,a5,0x3
    80002dd0:	fe040713          	addi	a4,s0,-32
    80002dd4:	00f707b3          	add	a5,a4,a5
    80002dd8:	f697a423          	sw	s1,-152(a5)
        data[i].buffer = buffer;
    80002ddc:	f727b823          	sd	s2,-144(a5)
        data[i].wait = waitForAll;
    80002de0:	00007717          	auipc	a4,0x7
    80002de4:	52073703          	ld	a4,1312(a4) # 8000a300 <_ZL10waitForAll>
    80002de8:	f6e7bc23          	sd	a4,-136(a5)

        thread_create(threads + i,
    80002dec:	00048613          	mv	a2,s1
    80002df0:	00349513          	slli	a0,s1,0x3
    80002df4:	f2040713          	addi	a4,s0,-224
    80002df8:	00a70533          	add	a0,a4,a0
    80002dfc:	02905863          	blez	s1,80002e2c <_Z22producerConsumer_C_APIv+0x1c4>
    80002e00:	00000597          	auipc	a1,0x0
    80002e04:	c2c58593          	addi	a1,a1,-980 # 80002a2c <_ZL8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80002e08:	00161793          	slli	a5,a2,0x1
    80002e0c:	00c787b3          	add	a5,a5,a2
    80002e10:	00379793          	slli	a5,a5,0x3
        thread_create(threads + i,
    80002e14:	f4840613          	addi	a2,s0,-184
    80002e18:	00f60633          	add	a2,a2,a5
    80002e1c:	fffff097          	auipc	ra,0xfffff
    80002e20:	864080e7          	jalr	-1948(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002e24:	0014849b          	addiw	s1,s1,1
    80002e28:	f95ff06f          	j	80002dbc <_Z22producerConsumer_C_APIv+0x154>
        thread_create(threads + i,
    80002e2c:	00000597          	auipc	a1,0x0
    80002e30:	ab458593          	addi	a1,a1,-1356 # 800028e0 <_ZL16producerKeyboardPv>
    80002e34:	fd5ff06f          	j	80002e08 <_Z22producerConsumer_C_APIv+0x1a0>
    }
    printString("Control point 7!\n");
    80002e38:	00005517          	auipc	a0,0x5
    80002e3c:	5a850513          	addi	a0,a0,1448 # 800083e0 <CONSOLE_STATUS+0x3d0>
    80002e40:	00002097          	auipc	ra,0x2
    80002e44:	8a8080e7          	jalr	-1880(ra) # 800046e8 <_Z11printStringPKc>
    thread_dispatch();
    80002e48:	fffff097          	auipc	ra,0xfffff
    80002e4c:	958080e7          	jalr	-1704(ra) # 800017a0 <_Z15thread_dispatchv>
    printString("Control point 8!\n");
    80002e50:	00005517          	auipc	a0,0x5
    80002e54:	5a850513          	addi	a0,a0,1448 # 800083f8 <CONSOLE_STATUS+0x3e8>
    80002e58:	00002097          	auipc	ra,0x2
    80002e5c:	890080e7          	jalr	-1904(ra) # 800046e8 <_Z11printStringPKc>
    for (int i = 0; i <= threadNum; i++) {
    80002e60:	00000493          	li	s1,0
    80002e64:	00500793          	li	a5,5
    80002e68:	0097ce63          	blt	a5,s1,80002e84 <_Z22producerConsumer_C_APIv+0x21c>
        sem_wait(waitForAll);
    80002e6c:	00007517          	auipc	a0,0x7
    80002e70:	49453503          	ld	a0,1172(a0) # 8000a300 <_ZL10waitForAll>
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	a20080e7          	jalr	-1504(ra) # 80001894 <_Z8sem_waitP10MojSemafor>
    for (int i = 0; i <= threadNum; i++) {
    80002e7c:	0014849b          	addiw	s1,s1,1
    80002e80:	fe5ff06f          	j	80002e64 <_Z22producerConsumer_C_APIv+0x1fc>
    }
    printString("Control point 9!\n");
    80002e84:	00005517          	auipc	a0,0x5
    80002e88:	58c50513          	addi	a0,a0,1420 # 80008410 <CONSOLE_STATUS+0x400>
    80002e8c:	00002097          	auipc	ra,0x2
    80002e90:	85c080e7          	jalr	-1956(ra) # 800046e8 <_Z11printStringPKc>
    sem_close(waitForAll);
    80002e94:	00007517          	auipc	a0,0x7
    80002e98:	46c53503          	ld	a0,1132(a0) # 8000a300 <_ZL10waitForAll>
    80002e9c:	fffff097          	auipc	ra,0xfffff
    80002ea0:	9cc080e7          	jalr	-1588(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
    printString("Control point 10!\n");
    80002ea4:	00005517          	auipc	a0,0x5
    80002ea8:	58450513          	addi	a0,a0,1412 # 80008428 <CONSOLE_STATUS+0x418>
    80002eac:	00002097          	auipc	ra,0x2
    80002eb0:	83c080e7          	jalr	-1988(ra) # 800046e8 <_Z11printStringPKc>
    delete buffer;
    80002eb4:	00090e63          	beqz	s2,80002ed0 <_Z22producerConsumer_C_APIv+0x268>
    80002eb8:	00090513          	mv	a0,s2
    80002ebc:	00002097          	auipc	ra,0x2
    80002ec0:	794080e7          	jalr	1940(ra) # 80005650 <_ZN6BufferD1Ev>
    80002ec4:	00090513          	mv	a0,s2
    80002ec8:	fffff097          	auipc	ra,0xfffff
    80002ecc:	b34080e7          	jalr	-1228(ra) # 800019fc <_ZdlPv>

}
    80002ed0:	0d813083          	ld	ra,216(sp)
    80002ed4:	0d013403          	ld	s0,208(sp)
    80002ed8:	0c813483          	ld	s1,200(sp)
    80002edc:	0c013903          	ld	s2,192(sp)
    80002ee0:	0e010113          	addi	sp,sp,224
    80002ee4:	00008067          	ret
    80002ee8:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002eec:	00090513          	mv	a0,s2
    80002ef0:	fffff097          	auipc	ra,0xfffff
    80002ef4:	b0c080e7          	jalr	-1268(ra) # 800019fc <_ZdlPv>
    80002ef8:	00048513          	mv	a0,s1
    80002efc:	00008097          	auipc	ra,0x8
    80002f00:	50c080e7          	jalr	1292(ra) # 8000b408 <_Unwind_Resume>

0000000080002f04 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002f04:	fe010113          	addi	sp,sp,-32
    80002f08:	00113c23          	sd	ra,24(sp)
    80002f0c:	00813823          	sd	s0,16(sp)
    80002f10:	00913423          	sd	s1,8(sp)
    80002f14:	01213023          	sd	s2,0(sp)
    80002f18:	02010413          	addi	s0,sp,32
    80002f1c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002f20:	00100793          	li	a5,1
    80002f24:	02a7f863          	bgeu	a5,a0,80002f54 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002f28:	00a00793          	li	a5,10
    80002f2c:	02f577b3          	remu	a5,a0,a5
    80002f30:	02078e63          	beqz	a5,80002f6c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002f34:	fff48513          	addi	a0,s1,-1
    80002f38:	00000097          	auipc	ra,0x0
    80002f3c:	fcc080e7          	jalr	-52(ra) # 80002f04 <_ZL9fibonaccim>
    80002f40:	00050913          	mv	s2,a0
    80002f44:	ffe48513          	addi	a0,s1,-2
    80002f48:	00000097          	auipc	ra,0x0
    80002f4c:	fbc080e7          	jalr	-68(ra) # 80002f04 <_ZL9fibonaccim>
    80002f50:	00a90533          	add	a0,s2,a0
}
    80002f54:	01813083          	ld	ra,24(sp)
    80002f58:	01013403          	ld	s0,16(sp)
    80002f5c:	00813483          	ld	s1,8(sp)
    80002f60:	00013903          	ld	s2,0(sp)
    80002f64:	02010113          	addi	sp,sp,32
    80002f68:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002f6c:	fffff097          	auipc	ra,0xfffff
    80002f70:	834080e7          	jalr	-1996(ra) # 800017a0 <_Z15thread_dispatchv>
    80002f74:	fc1ff06f          	j	80002f34 <_ZL9fibonaccim+0x30>

0000000080002f78 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002f78:	fe010113          	addi	sp,sp,-32
    80002f7c:	00113c23          	sd	ra,24(sp)
    80002f80:	00813823          	sd	s0,16(sp)
    80002f84:	00913423          	sd	s1,8(sp)
    80002f88:	01213023          	sd	s2,0(sp)
    80002f8c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002f90:	00000913          	li	s2,0
    80002f94:	0380006f          	j	80002fcc <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002f98:	fffff097          	auipc	ra,0xfffff
    80002f9c:	808080e7          	jalr	-2040(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002fa0:	00148493          	addi	s1,s1,1
    80002fa4:	000027b7          	lui	a5,0x2
    80002fa8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002fac:	0097ee63          	bltu	a5,s1,80002fc8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002fb0:	00000713          	li	a4,0
    80002fb4:	000077b7          	lui	a5,0x7
    80002fb8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002fbc:	fce7eee3          	bltu	a5,a4,80002f98 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002fc0:	00170713          	addi	a4,a4,1
    80002fc4:	ff1ff06f          	j	80002fb4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002fc8:	00190913          	addi	s2,s2,1
    80002fcc:	00900793          	li	a5,9
    80002fd0:	0527e063          	bltu	a5,s2,80003010 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002fd4:	00005517          	auipc	a0,0x5
    80002fd8:	46c50513          	addi	a0,a0,1132 # 80008440 <CONSOLE_STATUS+0x430>
    80002fdc:	00001097          	auipc	ra,0x1
    80002fe0:	70c080e7          	jalr	1804(ra) # 800046e8 <_Z11printStringPKc>
    80002fe4:	00000613          	li	a2,0
    80002fe8:	00a00593          	li	a1,10
    80002fec:	0009051b          	sext.w	a0,s2
    80002ff0:	00002097          	auipc	ra,0x2
    80002ff4:	8a8080e7          	jalr	-1880(ra) # 80004898 <_Z8printIntiii>
    80002ff8:	00005517          	auipc	a0,0x5
    80002ffc:	38050513          	addi	a0,a0,896 # 80008378 <CONSOLE_STATUS+0x368>
    80003000:	00001097          	auipc	ra,0x1
    80003004:	6e8080e7          	jalr	1768(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003008:	00000493          	li	s1,0
    8000300c:	f99ff06f          	j	80002fa4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003010:	00005517          	auipc	a0,0x5
    80003014:	43850513          	addi	a0,a0,1080 # 80008448 <CONSOLE_STATUS+0x438>
    80003018:	00001097          	auipc	ra,0x1
    8000301c:	6d0080e7          	jalr	1744(ra) # 800046e8 <_Z11printStringPKc>
    finishedA = true;
    80003020:	00100793          	li	a5,1
    80003024:	00007717          	auipc	a4,0x7
    80003028:	2ef70223          	sb	a5,740(a4) # 8000a308 <_ZL9finishedA>
}
    8000302c:	01813083          	ld	ra,24(sp)
    80003030:	01013403          	ld	s0,16(sp)
    80003034:	00813483          	ld	s1,8(sp)
    80003038:	00013903          	ld	s2,0(sp)
    8000303c:	02010113          	addi	sp,sp,32
    80003040:	00008067          	ret

0000000080003044 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003044:	fe010113          	addi	sp,sp,-32
    80003048:	00113c23          	sd	ra,24(sp)
    8000304c:	00813823          	sd	s0,16(sp)
    80003050:	00913423          	sd	s1,8(sp)
    80003054:	01213023          	sd	s2,0(sp)
    80003058:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000305c:	00000913          	li	s2,0
    80003060:	0380006f          	j	80003098 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003064:	ffffe097          	auipc	ra,0xffffe
    80003068:	73c080e7          	jalr	1852(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000306c:	00148493          	addi	s1,s1,1
    80003070:	000027b7          	lui	a5,0x2
    80003074:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003078:	0097ee63          	bltu	a5,s1,80003094 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000307c:	00000713          	li	a4,0
    80003080:	000077b7          	lui	a5,0x7
    80003084:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003088:	fce7eee3          	bltu	a5,a4,80003064 <_ZN7WorkerB11workerBodyBEPv+0x20>
    8000308c:	00170713          	addi	a4,a4,1
    80003090:	ff1ff06f          	j	80003080 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003094:	00190913          	addi	s2,s2,1
    80003098:	00f00793          	li	a5,15
    8000309c:	0527e063          	bltu	a5,s2,800030dc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800030a0:	00005517          	auipc	a0,0x5
    800030a4:	3b850513          	addi	a0,a0,952 # 80008458 <CONSOLE_STATUS+0x448>
    800030a8:	00001097          	auipc	ra,0x1
    800030ac:	640080e7          	jalr	1600(ra) # 800046e8 <_Z11printStringPKc>
    800030b0:	00000613          	li	a2,0
    800030b4:	00a00593          	li	a1,10
    800030b8:	0009051b          	sext.w	a0,s2
    800030bc:	00001097          	auipc	ra,0x1
    800030c0:	7dc080e7          	jalr	2012(ra) # 80004898 <_Z8printIntiii>
    800030c4:	00005517          	auipc	a0,0x5
    800030c8:	2b450513          	addi	a0,a0,692 # 80008378 <CONSOLE_STATUS+0x368>
    800030cc:	00001097          	auipc	ra,0x1
    800030d0:	61c080e7          	jalr	1564(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800030d4:	00000493          	li	s1,0
    800030d8:	f99ff06f          	j	80003070 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800030dc:	00005517          	auipc	a0,0x5
    800030e0:	38450513          	addi	a0,a0,900 # 80008460 <CONSOLE_STATUS+0x450>
    800030e4:	00001097          	auipc	ra,0x1
    800030e8:	604080e7          	jalr	1540(ra) # 800046e8 <_Z11printStringPKc>
    finishedB = true;
    800030ec:	00100793          	li	a5,1
    800030f0:	00007717          	auipc	a4,0x7
    800030f4:	20f70ca3          	sb	a5,537(a4) # 8000a309 <_ZL9finishedB>
    thread_dispatch();
    800030f8:	ffffe097          	auipc	ra,0xffffe
    800030fc:	6a8080e7          	jalr	1704(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003100:	01813083          	ld	ra,24(sp)
    80003104:	01013403          	ld	s0,16(sp)
    80003108:	00813483          	ld	s1,8(sp)
    8000310c:	00013903          	ld	s2,0(sp)
    80003110:	02010113          	addi	sp,sp,32
    80003114:	00008067          	ret

0000000080003118 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003118:	fe010113          	addi	sp,sp,-32
    8000311c:	00113c23          	sd	ra,24(sp)
    80003120:	00813823          	sd	s0,16(sp)
    80003124:	00913423          	sd	s1,8(sp)
    80003128:	01213023          	sd	s2,0(sp)
    8000312c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003130:	00000493          	li	s1,0
    80003134:	0400006f          	j	80003174 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003138:	00005517          	auipc	a0,0x5
    8000313c:	33850513          	addi	a0,a0,824 # 80008470 <CONSOLE_STATUS+0x460>
    80003140:	00001097          	auipc	ra,0x1
    80003144:	5a8080e7          	jalr	1448(ra) # 800046e8 <_Z11printStringPKc>
    80003148:	00000613          	li	a2,0
    8000314c:	00a00593          	li	a1,10
    80003150:	00048513          	mv	a0,s1
    80003154:	00001097          	auipc	ra,0x1
    80003158:	744080e7          	jalr	1860(ra) # 80004898 <_Z8printIntiii>
    8000315c:	00005517          	auipc	a0,0x5
    80003160:	21c50513          	addi	a0,a0,540 # 80008378 <CONSOLE_STATUS+0x368>
    80003164:	00001097          	auipc	ra,0x1
    80003168:	584080e7          	jalr	1412(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000316c:	0014849b          	addiw	s1,s1,1
    80003170:	0ff4f493          	andi	s1,s1,255
    80003174:	00200793          	li	a5,2
    80003178:	fc97f0e3          	bgeu	a5,s1,80003138 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000317c:	00005517          	auipc	a0,0x5
    80003180:	2fc50513          	addi	a0,a0,764 # 80008478 <CONSOLE_STATUS+0x468>
    80003184:	00001097          	auipc	ra,0x1
    80003188:	564080e7          	jalr	1380(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000318c:	00700313          	li	t1,7
    thread_dispatch();
    80003190:	ffffe097          	auipc	ra,0xffffe
    80003194:	610080e7          	jalr	1552(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003198:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000319c:	00005517          	auipc	a0,0x5
    800031a0:	2ec50513          	addi	a0,a0,748 # 80008488 <CONSOLE_STATUS+0x478>
    800031a4:	00001097          	auipc	ra,0x1
    800031a8:	544080e7          	jalr	1348(ra) # 800046e8 <_Z11printStringPKc>
    800031ac:	00000613          	li	a2,0
    800031b0:	00a00593          	li	a1,10
    800031b4:	0009051b          	sext.w	a0,s2
    800031b8:	00001097          	auipc	ra,0x1
    800031bc:	6e0080e7          	jalr	1760(ra) # 80004898 <_Z8printIntiii>
    800031c0:	00005517          	auipc	a0,0x5
    800031c4:	1b850513          	addi	a0,a0,440 # 80008378 <CONSOLE_STATUS+0x368>
    800031c8:	00001097          	auipc	ra,0x1
    800031cc:	520080e7          	jalr	1312(ra) # 800046e8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800031d0:	00c00513          	li	a0,12
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	d30080e7          	jalr	-720(ra) # 80002f04 <_ZL9fibonaccim>
    800031dc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800031e0:	00005517          	auipc	a0,0x5
    800031e4:	2b050513          	addi	a0,a0,688 # 80008490 <CONSOLE_STATUS+0x480>
    800031e8:	00001097          	auipc	ra,0x1
    800031ec:	500080e7          	jalr	1280(ra) # 800046e8 <_Z11printStringPKc>
    800031f0:	00000613          	li	a2,0
    800031f4:	00a00593          	li	a1,10
    800031f8:	0009051b          	sext.w	a0,s2
    800031fc:	00001097          	auipc	ra,0x1
    80003200:	69c080e7          	jalr	1692(ra) # 80004898 <_Z8printIntiii>
    80003204:	00005517          	auipc	a0,0x5
    80003208:	17450513          	addi	a0,a0,372 # 80008378 <CONSOLE_STATUS+0x368>
    8000320c:	00001097          	auipc	ra,0x1
    80003210:	4dc080e7          	jalr	1244(ra) # 800046e8 <_Z11printStringPKc>
    80003214:	0400006f          	j	80003254 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003218:	00005517          	auipc	a0,0x5
    8000321c:	25850513          	addi	a0,a0,600 # 80008470 <CONSOLE_STATUS+0x460>
    80003220:	00001097          	auipc	ra,0x1
    80003224:	4c8080e7          	jalr	1224(ra) # 800046e8 <_Z11printStringPKc>
    80003228:	00000613          	li	a2,0
    8000322c:	00a00593          	li	a1,10
    80003230:	00048513          	mv	a0,s1
    80003234:	00001097          	auipc	ra,0x1
    80003238:	664080e7          	jalr	1636(ra) # 80004898 <_Z8printIntiii>
    8000323c:	00005517          	auipc	a0,0x5
    80003240:	13c50513          	addi	a0,a0,316 # 80008378 <CONSOLE_STATUS+0x368>
    80003244:	00001097          	auipc	ra,0x1
    80003248:	4a4080e7          	jalr	1188(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000324c:	0014849b          	addiw	s1,s1,1
    80003250:	0ff4f493          	andi	s1,s1,255
    80003254:	00500793          	li	a5,5
    80003258:	fc97f0e3          	bgeu	a5,s1,80003218 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000325c:	00005517          	auipc	a0,0x5
    80003260:	1ec50513          	addi	a0,a0,492 # 80008448 <CONSOLE_STATUS+0x438>
    80003264:	00001097          	auipc	ra,0x1
    80003268:	484080e7          	jalr	1156(ra) # 800046e8 <_Z11printStringPKc>
    finishedC = true;
    8000326c:	00100793          	li	a5,1
    80003270:	00007717          	auipc	a4,0x7
    80003274:	08f70d23          	sb	a5,154(a4) # 8000a30a <_ZL9finishedC>
    thread_dispatch();
    80003278:	ffffe097          	auipc	ra,0xffffe
    8000327c:	528080e7          	jalr	1320(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003280:	01813083          	ld	ra,24(sp)
    80003284:	01013403          	ld	s0,16(sp)
    80003288:	00813483          	ld	s1,8(sp)
    8000328c:	00013903          	ld	s2,0(sp)
    80003290:	02010113          	addi	sp,sp,32
    80003294:	00008067          	ret

0000000080003298 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003298:	fe010113          	addi	sp,sp,-32
    8000329c:	00113c23          	sd	ra,24(sp)
    800032a0:	00813823          	sd	s0,16(sp)
    800032a4:	00913423          	sd	s1,8(sp)
    800032a8:	01213023          	sd	s2,0(sp)
    800032ac:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800032b0:	00a00493          	li	s1,10
    800032b4:	0400006f          	j	800032f4 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800032b8:	00005517          	auipc	a0,0x5
    800032bc:	1e850513          	addi	a0,a0,488 # 800084a0 <CONSOLE_STATUS+0x490>
    800032c0:	00001097          	auipc	ra,0x1
    800032c4:	428080e7          	jalr	1064(ra) # 800046e8 <_Z11printStringPKc>
    800032c8:	00000613          	li	a2,0
    800032cc:	00a00593          	li	a1,10
    800032d0:	00048513          	mv	a0,s1
    800032d4:	00001097          	auipc	ra,0x1
    800032d8:	5c4080e7          	jalr	1476(ra) # 80004898 <_Z8printIntiii>
    800032dc:	00005517          	auipc	a0,0x5
    800032e0:	09c50513          	addi	a0,a0,156 # 80008378 <CONSOLE_STATUS+0x368>
    800032e4:	00001097          	auipc	ra,0x1
    800032e8:	404080e7          	jalr	1028(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800032ec:	0014849b          	addiw	s1,s1,1
    800032f0:	0ff4f493          	andi	s1,s1,255
    800032f4:	00c00793          	li	a5,12
    800032f8:	fc97f0e3          	bgeu	a5,s1,800032b8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800032fc:	00005517          	auipc	a0,0x5
    80003300:	1ac50513          	addi	a0,a0,428 # 800084a8 <CONSOLE_STATUS+0x498>
    80003304:	00001097          	auipc	ra,0x1
    80003308:	3e4080e7          	jalr	996(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000330c:	00500313          	li	t1,5
    thread_dispatch();
    80003310:	ffffe097          	auipc	ra,0xffffe
    80003314:	490080e7          	jalr	1168(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003318:	01000513          	li	a0,16
    8000331c:	00000097          	auipc	ra,0x0
    80003320:	be8080e7          	jalr	-1048(ra) # 80002f04 <_ZL9fibonaccim>
    80003324:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003328:	00005517          	auipc	a0,0x5
    8000332c:	19050513          	addi	a0,a0,400 # 800084b8 <CONSOLE_STATUS+0x4a8>
    80003330:	00001097          	auipc	ra,0x1
    80003334:	3b8080e7          	jalr	952(ra) # 800046e8 <_Z11printStringPKc>
    80003338:	00000613          	li	a2,0
    8000333c:	00a00593          	li	a1,10
    80003340:	0009051b          	sext.w	a0,s2
    80003344:	00001097          	auipc	ra,0x1
    80003348:	554080e7          	jalr	1364(ra) # 80004898 <_Z8printIntiii>
    8000334c:	00005517          	auipc	a0,0x5
    80003350:	02c50513          	addi	a0,a0,44 # 80008378 <CONSOLE_STATUS+0x368>
    80003354:	00001097          	auipc	ra,0x1
    80003358:	394080e7          	jalr	916(ra) # 800046e8 <_Z11printStringPKc>
    8000335c:	0400006f          	j	8000339c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003360:	00005517          	auipc	a0,0x5
    80003364:	14050513          	addi	a0,a0,320 # 800084a0 <CONSOLE_STATUS+0x490>
    80003368:	00001097          	auipc	ra,0x1
    8000336c:	380080e7          	jalr	896(ra) # 800046e8 <_Z11printStringPKc>
    80003370:	00000613          	li	a2,0
    80003374:	00a00593          	li	a1,10
    80003378:	00048513          	mv	a0,s1
    8000337c:	00001097          	auipc	ra,0x1
    80003380:	51c080e7          	jalr	1308(ra) # 80004898 <_Z8printIntiii>
    80003384:	00005517          	auipc	a0,0x5
    80003388:	ff450513          	addi	a0,a0,-12 # 80008378 <CONSOLE_STATUS+0x368>
    8000338c:	00001097          	auipc	ra,0x1
    80003390:	35c080e7          	jalr	860(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003394:	0014849b          	addiw	s1,s1,1
    80003398:	0ff4f493          	andi	s1,s1,255
    8000339c:	00f00793          	li	a5,15
    800033a0:	fc97f0e3          	bgeu	a5,s1,80003360 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800033a4:	00005517          	auipc	a0,0x5
    800033a8:	12450513          	addi	a0,a0,292 # 800084c8 <CONSOLE_STATUS+0x4b8>
    800033ac:	00001097          	auipc	ra,0x1
    800033b0:	33c080e7          	jalr	828(ra) # 800046e8 <_Z11printStringPKc>
    finishedD = true;
    800033b4:	00100793          	li	a5,1
    800033b8:	00007717          	auipc	a4,0x7
    800033bc:	f4f709a3          	sb	a5,-173(a4) # 8000a30b <_ZL9finishedD>
    thread_dispatch();
    800033c0:	ffffe097          	auipc	ra,0xffffe
    800033c4:	3e0080e7          	jalr	992(ra) # 800017a0 <_Z15thread_dispatchv>
}
    800033c8:	01813083          	ld	ra,24(sp)
    800033cc:	01013403          	ld	s0,16(sp)
    800033d0:	00813483          	ld	s1,8(sp)
    800033d4:	00013903          	ld	s2,0(sp)
    800033d8:	02010113          	addi	sp,sp,32
    800033dc:	00008067          	ret

00000000800033e0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800033e0:	fc010113          	addi	sp,sp,-64
    800033e4:	02113c23          	sd	ra,56(sp)
    800033e8:	02813823          	sd	s0,48(sp)
    800033ec:	02913423          	sd	s1,40(sp)
    800033f0:	03213023          	sd	s2,32(sp)
    800033f4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800033f8:	02000513          	li	a0,32
    800033fc:	ffffe097          	auipc	ra,0xffffe
    80003400:	5b0080e7          	jalr	1456(ra) # 800019ac <_Znwm>
    80003404:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	a7c080e7          	jalr	-1412(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80003410:	00007797          	auipc	a5,0x7
    80003414:	ce078793          	addi	a5,a5,-800 # 8000a0f0 <_ZTV7WorkerA+0x10>
    80003418:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000341c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003420:	00005517          	auipc	a0,0x5
    80003424:	0b850513          	addi	a0,a0,184 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003428:	00001097          	auipc	ra,0x1
    8000342c:	2c0080e7          	jalr	704(ra) # 800046e8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003430:	02000513          	li	a0,32
    80003434:	ffffe097          	auipc	ra,0xffffe
    80003438:	578080e7          	jalr	1400(ra) # 800019ac <_Znwm>
    8000343c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	a44080e7          	jalr	-1468(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80003448:	00007797          	auipc	a5,0x7
    8000344c:	cd078793          	addi	a5,a5,-816 # 8000a118 <_ZTV7WorkerB+0x10>
    80003450:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003454:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003458:	00005517          	auipc	a0,0x5
    8000345c:	09850513          	addi	a0,a0,152 # 800084f0 <CONSOLE_STATUS+0x4e0>
    80003460:	00001097          	auipc	ra,0x1
    80003464:	288080e7          	jalr	648(ra) # 800046e8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003468:	02000513          	li	a0,32
    8000346c:	ffffe097          	auipc	ra,0xffffe
    80003470:	540080e7          	jalr	1344(ra) # 800019ac <_Znwm>
    80003474:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003478:	fffff097          	auipc	ra,0xfffff
    8000347c:	a0c080e7          	jalr	-1524(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80003480:	00007797          	auipc	a5,0x7
    80003484:	cc078793          	addi	a5,a5,-832 # 8000a140 <_ZTV7WorkerC+0x10>
    80003488:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000348c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003490:	00005517          	auipc	a0,0x5
    80003494:	07850513          	addi	a0,a0,120 # 80008508 <CONSOLE_STATUS+0x4f8>
    80003498:	00001097          	auipc	ra,0x1
    8000349c:	250080e7          	jalr	592(ra) # 800046e8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800034a0:	02000513          	li	a0,32
    800034a4:	ffffe097          	auipc	ra,0xffffe
    800034a8:	508080e7          	jalr	1288(ra) # 800019ac <_Znwm>
    800034ac:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	9d4080e7          	jalr	-1580(ra) # 80001e84 <_ZN6ThreadC1Ev>
    800034b8:	00007797          	auipc	a5,0x7
    800034bc:	cb078793          	addi	a5,a5,-848 # 8000a168 <_ZTV7WorkerD+0x10>
    800034c0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800034c4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800034c8:	00005517          	auipc	a0,0x5
    800034cc:	05850513          	addi	a0,a0,88 # 80008520 <CONSOLE_STATUS+0x510>
    800034d0:	00001097          	auipc	ra,0x1
    800034d4:	218080e7          	jalr	536(ra) # 800046e8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800034d8:	00000493          	li	s1,0
    800034dc:	00300793          	li	a5,3
    800034e0:	0297c663          	blt	a5,s1,8000350c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800034e4:	00349793          	slli	a5,s1,0x3
    800034e8:	fe040713          	addi	a4,s0,-32
    800034ec:	00f707b3          	add	a5,a4,a5
    800034f0:	fe07b503          	ld	a0,-32(a5)
    800034f4:	fffff097          	auipc	ra,0xfffff
    800034f8:	91c080e7          	jalr	-1764(ra) # 80001e10 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800034fc:	0014849b          	addiw	s1,s1,1
    80003500:	fddff06f          	j	800034dc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003504:	fffff097          	auipc	ra,0xfffff
    80003508:	93c080e7          	jalr	-1732(ra) # 80001e40 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000350c:	00007797          	auipc	a5,0x7
    80003510:	dfc7c783          	lbu	a5,-516(a5) # 8000a308 <_ZL9finishedA>
    80003514:	fe0788e3          	beqz	a5,80003504 <_Z20Threads_CPP_API_testv+0x124>
    80003518:	00007797          	auipc	a5,0x7
    8000351c:	df17c783          	lbu	a5,-527(a5) # 8000a309 <_ZL9finishedB>
    80003520:	fe0782e3          	beqz	a5,80003504 <_Z20Threads_CPP_API_testv+0x124>
    80003524:	00007797          	auipc	a5,0x7
    80003528:	de67c783          	lbu	a5,-538(a5) # 8000a30a <_ZL9finishedC>
    8000352c:	fc078ce3          	beqz	a5,80003504 <_Z20Threads_CPP_API_testv+0x124>
    80003530:	00007797          	auipc	a5,0x7
    80003534:	ddb7c783          	lbu	a5,-549(a5) # 8000a30b <_ZL9finishedD>
    80003538:	fc0786e3          	beqz	a5,80003504 <_Z20Threads_CPP_API_testv+0x124>
    8000353c:	fc040493          	addi	s1,s0,-64
    80003540:	0080006f          	j	80003548 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003544:	00848493          	addi	s1,s1,8
    80003548:	fe040793          	addi	a5,s0,-32
    8000354c:	08f48663          	beq	s1,a5,800035d8 <_Z20Threads_CPP_API_testv+0x1f8>
    80003550:	0004b503          	ld	a0,0(s1)
    80003554:	fe0508e3          	beqz	a0,80003544 <_Z20Threads_CPP_API_testv+0x164>
    80003558:	00053783          	ld	a5,0(a0)
    8000355c:	0087b783          	ld	a5,8(a5)
    80003560:	000780e7          	jalr	a5
    80003564:	fe1ff06f          	j	80003544 <_Z20Threads_CPP_API_testv+0x164>
    80003568:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000356c:	00048513          	mv	a0,s1
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	48c080e7          	jalr	1164(ra) # 800019fc <_ZdlPv>
    80003578:	00090513          	mv	a0,s2
    8000357c:	00008097          	auipc	ra,0x8
    80003580:	e8c080e7          	jalr	-372(ra) # 8000b408 <_Unwind_Resume>
    80003584:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003588:	00048513          	mv	a0,s1
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	470080e7          	jalr	1136(ra) # 800019fc <_ZdlPv>
    80003594:	00090513          	mv	a0,s2
    80003598:	00008097          	auipc	ra,0x8
    8000359c:	e70080e7          	jalr	-400(ra) # 8000b408 <_Unwind_Resume>
    800035a0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800035a4:	00048513          	mv	a0,s1
    800035a8:	ffffe097          	auipc	ra,0xffffe
    800035ac:	454080e7          	jalr	1108(ra) # 800019fc <_ZdlPv>
    800035b0:	00090513          	mv	a0,s2
    800035b4:	00008097          	auipc	ra,0x8
    800035b8:	e54080e7          	jalr	-428(ra) # 8000b408 <_Unwind_Resume>
    800035bc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800035c0:	00048513          	mv	a0,s1
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	438080e7          	jalr	1080(ra) # 800019fc <_ZdlPv>
    800035cc:	00090513          	mv	a0,s2
    800035d0:	00008097          	auipc	ra,0x8
    800035d4:	e38080e7          	jalr	-456(ra) # 8000b408 <_Unwind_Resume>
}
    800035d8:	03813083          	ld	ra,56(sp)
    800035dc:	03013403          	ld	s0,48(sp)
    800035e0:	02813483          	ld	s1,40(sp)
    800035e4:	02013903          	ld	s2,32(sp)
    800035e8:	04010113          	addi	sp,sp,64
    800035ec:	00008067          	ret

00000000800035f0 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800035f0:	ff010113          	addi	sp,sp,-16
    800035f4:	00113423          	sd	ra,8(sp)
    800035f8:	00813023          	sd	s0,0(sp)
    800035fc:	01010413          	addi	s0,sp,16
    80003600:	00007797          	auipc	a5,0x7
    80003604:	af078793          	addi	a5,a5,-1296 # 8000a0f0 <_ZTV7WorkerA+0x10>
    80003608:	00f53023          	sd	a5,0(a0)
    8000360c:	ffffe097          	auipc	ra,0xffffe
    80003610:	6bc080e7          	jalr	1724(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003614:	00813083          	ld	ra,8(sp)
    80003618:	00013403          	ld	s0,0(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret

0000000080003624 <_ZN7WorkerAD0Ev>:
    80003624:	fe010113          	addi	sp,sp,-32
    80003628:	00113c23          	sd	ra,24(sp)
    8000362c:	00813823          	sd	s0,16(sp)
    80003630:	00913423          	sd	s1,8(sp)
    80003634:	02010413          	addi	s0,sp,32
    80003638:	00050493          	mv	s1,a0
    8000363c:	00007797          	auipc	a5,0x7
    80003640:	ab478793          	addi	a5,a5,-1356 # 8000a0f0 <_ZTV7WorkerA+0x10>
    80003644:	00f53023          	sd	a5,0(a0)
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	680080e7          	jalr	1664(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003650:	00048513          	mv	a0,s1
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	3a8080e7          	jalr	936(ra) # 800019fc <_ZdlPv>
    8000365c:	01813083          	ld	ra,24(sp)
    80003660:	01013403          	ld	s0,16(sp)
    80003664:	00813483          	ld	s1,8(sp)
    80003668:	02010113          	addi	sp,sp,32
    8000366c:	00008067          	ret

0000000080003670 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003670:	ff010113          	addi	sp,sp,-16
    80003674:	00113423          	sd	ra,8(sp)
    80003678:	00813023          	sd	s0,0(sp)
    8000367c:	01010413          	addi	s0,sp,16
    80003680:	00007797          	auipc	a5,0x7
    80003684:	a9878793          	addi	a5,a5,-1384 # 8000a118 <_ZTV7WorkerB+0x10>
    80003688:	00f53023          	sd	a5,0(a0)
    8000368c:	ffffe097          	auipc	ra,0xffffe
    80003690:	63c080e7          	jalr	1596(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003694:	00813083          	ld	ra,8(sp)
    80003698:	00013403          	ld	s0,0(sp)
    8000369c:	01010113          	addi	sp,sp,16
    800036a0:	00008067          	ret

00000000800036a4 <_ZN7WorkerBD0Ev>:
    800036a4:	fe010113          	addi	sp,sp,-32
    800036a8:	00113c23          	sd	ra,24(sp)
    800036ac:	00813823          	sd	s0,16(sp)
    800036b0:	00913423          	sd	s1,8(sp)
    800036b4:	02010413          	addi	s0,sp,32
    800036b8:	00050493          	mv	s1,a0
    800036bc:	00007797          	auipc	a5,0x7
    800036c0:	a5c78793          	addi	a5,a5,-1444 # 8000a118 <_ZTV7WorkerB+0x10>
    800036c4:	00f53023          	sd	a5,0(a0)
    800036c8:	ffffe097          	auipc	ra,0xffffe
    800036cc:	600080e7          	jalr	1536(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    800036d0:	00048513          	mv	a0,s1
    800036d4:	ffffe097          	auipc	ra,0xffffe
    800036d8:	328080e7          	jalr	808(ra) # 800019fc <_ZdlPv>
    800036dc:	01813083          	ld	ra,24(sp)
    800036e0:	01013403          	ld	s0,16(sp)
    800036e4:	00813483          	ld	s1,8(sp)
    800036e8:	02010113          	addi	sp,sp,32
    800036ec:	00008067          	ret

00000000800036f0 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800036f0:	ff010113          	addi	sp,sp,-16
    800036f4:	00113423          	sd	ra,8(sp)
    800036f8:	00813023          	sd	s0,0(sp)
    800036fc:	01010413          	addi	s0,sp,16
    80003700:	00007797          	auipc	a5,0x7
    80003704:	a4078793          	addi	a5,a5,-1472 # 8000a140 <_ZTV7WorkerC+0x10>
    80003708:	00f53023          	sd	a5,0(a0)
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	5bc080e7          	jalr	1468(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003714:	00813083          	ld	ra,8(sp)
    80003718:	00013403          	ld	s0,0(sp)
    8000371c:	01010113          	addi	sp,sp,16
    80003720:	00008067          	ret

0000000080003724 <_ZN7WorkerCD0Ev>:
    80003724:	fe010113          	addi	sp,sp,-32
    80003728:	00113c23          	sd	ra,24(sp)
    8000372c:	00813823          	sd	s0,16(sp)
    80003730:	00913423          	sd	s1,8(sp)
    80003734:	02010413          	addi	s0,sp,32
    80003738:	00050493          	mv	s1,a0
    8000373c:	00007797          	auipc	a5,0x7
    80003740:	a0478793          	addi	a5,a5,-1532 # 8000a140 <_ZTV7WorkerC+0x10>
    80003744:	00f53023          	sd	a5,0(a0)
    80003748:	ffffe097          	auipc	ra,0xffffe
    8000374c:	580080e7          	jalr	1408(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003750:	00048513          	mv	a0,s1
    80003754:	ffffe097          	auipc	ra,0xffffe
    80003758:	2a8080e7          	jalr	680(ra) # 800019fc <_ZdlPv>
    8000375c:	01813083          	ld	ra,24(sp)
    80003760:	01013403          	ld	s0,16(sp)
    80003764:	00813483          	ld	s1,8(sp)
    80003768:	02010113          	addi	sp,sp,32
    8000376c:	00008067          	ret

0000000080003770 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003770:	ff010113          	addi	sp,sp,-16
    80003774:	00113423          	sd	ra,8(sp)
    80003778:	00813023          	sd	s0,0(sp)
    8000377c:	01010413          	addi	s0,sp,16
    80003780:	00007797          	auipc	a5,0x7
    80003784:	9e878793          	addi	a5,a5,-1560 # 8000a168 <_ZTV7WorkerD+0x10>
    80003788:	00f53023          	sd	a5,0(a0)
    8000378c:	ffffe097          	auipc	ra,0xffffe
    80003790:	53c080e7          	jalr	1340(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80003794:	00813083          	ld	ra,8(sp)
    80003798:	00013403          	ld	s0,0(sp)
    8000379c:	01010113          	addi	sp,sp,16
    800037a0:	00008067          	ret

00000000800037a4 <_ZN7WorkerDD0Ev>:
    800037a4:	fe010113          	addi	sp,sp,-32
    800037a8:	00113c23          	sd	ra,24(sp)
    800037ac:	00813823          	sd	s0,16(sp)
    800037b0:	00913423          	sd	s1,8(sp)
    800037b4:	02010413          	addi	s0,sp,32
    800037b8:	00050493          	mv	s1,a0
    800037bc:	00007797          	auipc	a5,0x7
    800037c0:	9ac78793          	addi	a5,a5,-1620 # 8000a168 <_ZTV7WorkerD+0x10>
    800037c4:	00f53023          	sd	a5,0(a0)
    800037c8:	ffffe097          	auipc	ra,0xffffe
    800037cc:	500080e7          	jalr	1280(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    800037d0:	00048513          	mv	a0,s1
    800037d4:	ffffe097          	auipc	ra,0xffffe
    800037d8:	228080e7          	jalr	552(ra) # 800019fc <_ZdlPv>
    800037dc:	01813083          	ld	ra,24(sp)
    800037e0:	01013403          	ld	s0,16(sp)
    800037e4:	00813483          	ld	s1,8(sp)
    800037e8:	02010113          	addi	sp,sp,32
    800037ec:	00008067          	ret

00000000800037f0 <_ZN7WorkerA3runEv>:
    void run() override {
    800037f0:	ff010113          	addi	sp,sp,-16
    800037f4:	00113423          	sd	ra,8(sp)
    800037f8:	00813023          	sd	s0,0(sp)
    800037fc:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003800:	00000593          	li	a1,0
    80003804:	fffff097          	auipc	ra,0xfffff
    80003808:	774080e7          	jalr	1908(ra) # 80002f78 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000380c:	00813083          	ld	ra,8(sp)
    80003810:	00013403          	ld	s0,0(sp)
    80003814:	01010113          	addi	sp,sp,16
    80003818:	00008067          	ret

000000008000381c <_ZN7WorkerB3runEv>:
    void run() override {
    8000381c:	ff010113          	addi	sp,sp,-16
    80003820:	00113423          	sd	ra,8(sp)
    80003824:	00813023          	sd	s0,0(sp)
    80003828:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000382c:	00000593          	li	a1,0
    80003830:	00000097          	auipc	ra,0x0
    80003834:	814080e7          	jalr	-2028(ra) # 80003044 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003838:	00813083          	ld	ra,8(sp)
    8000383c:	00013403          	ld	s0,0(sp)
    80003840:	01010113          	addi	sp,sp,16
    80003844:	00008067          	ret

0000000080003848 <_ZN7WorkerC3runEv>:
    void run() override {
    80003848:	ff010113          	addi	sp,sp,-16
    8000384c:	00113423          	sd	ra,8(sp)
    80003850:	00813023          	sd	s0,0(sp)
    80003854:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003858:	00000593          	li	a1,0
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	8bc080e7          	jalr	-1860(ra) # 80003118 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003864:	00813083          	ld	ra,8(sp)
    80003868:	00013403          	ld	s0,0(sp)
    8000386c:	01010113          	addi	sp,sp,16
    80003870:	00008067          	ret

0000000080003874 <_ZN7WorkerD3runEv>:
    void run() override {
    80003874:	ff010113          	addi	sp,sp,-16
    80003878:	00113423          	sd	ra,8(sp)
    8000387c:	00813023          	sd	s0,0(sp)
    80003880:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003884:	00000593          	li	a1,0
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	a10080e7          	jalr	-1520(ra) # 80003298 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003890:	00813083          	ld	ra,8(sp)
    80003894:	00013403          	ld	s0,0(sp)
    80003898:	01010113          	addi	sp,sp,16
    8000389c:	00008067          	ret

00000000800038a0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800038a0:	ff010113          	addi	sp,sp,-16
    800038a4:	00113423          	sd	ra,8(sp)
    800038a8:	00813023          	sd	s0,0(sp)
    800038ac:	01010413          	addi	s0,sp,16
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    800038b0:	00005517          	auipc	a0,0x5
    800038b4:	a2850513          	addi	a0,a0,-1496 # 800082d8 <CONSOLE_STATUS+0x2c8>
    800038b8:	00001097          	auipc	ra,0x1
    800038bc:	e30080e7          	jalr	-464(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 15;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    800038c0:	00005517          	auipc	a0,0x5
    800038c4:	a3850513          	addi	a0,a0,-1480 # 800082f8 <CONSOLE_STATUS+0x2e8>
    800038c8:	00001097          	auipc	ra,0x1
    800038cc:	e20080e7          	jalr	-480(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca ");
    800038d0:	00005517          	auipc	a0,0x5
    800038d4:	a4850513          	addi	a0,a0,-1464 # 80008318 <CONSOLE_STATUS+0x308>
    800038d8:	00001097          	auipc	ra,0x1
    800038dc:	e10080e7          	jalr	-496(ra) # 800046e8 <_Z11printStringPKc>
    printInt(threadNum);
    800038e0:	00000613          	li	a2,0
    800038e4:	00a00593          	li	a1,10
    800038e8:	00f00513          	li	a0,15
    800038ec:	00001097          	auipc	ra,0x1
    800038f0:	fac080e7          	jalr	-84(ra) # 80004898 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800038f4:	00005517          	auipc	a0,0x5
    800038f8:	a3c50513          	addi	a0,a0,-1476 # 80008330 <CONSOLE_STATUS+0x320>
    800038fc:	00001097          	auipc	ra,0x1
    80003900:	dec080e7          	jalr	-532(ra) # 800046e8 <_Z11printStringPKc>
    printInt(n);
    80003904:	00000613          	li	a2,0
    80003908:	00a00593          	li	a1,10
    8000390c:	00a00513          	li	a0,10
    80003910:	00001097          	auipc	ra,0x1
    80003914:	f88080e7          	jalr	-120(ra) # 80004898 <_Z8printIntiii>
    printString(".\n");
    80003918:	00005517          	auipc	a0,0x5
    8000391c:	a3050513          	addi	a0,a0,-1488 # 80008348 <CONSOLE_STATUS+0x338>
    80003920:	00001097          	auipc	ra,0x1
    80003924:	dc8080e7          	jalr	-568(ra) # 800046e8 <_Z11printStringPKc>

    if (threadNum > n) {
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003928:	00005517          	auipc	a0,0x5
    8000392c:	c1050513          	addi	a0,a0,-1008 # 80008538 <CONSOLE_STATUS+0x528>
    80003930:	00001097          	auipc	ra,0x1
    80003934:	db8080e7          	jalr	-584(ra) # 800046e8 <_Z11printStringPKc>
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
}
    80003938:	00813083          	ld	ra,8(sp)
    8000393c:	00013403          	ld	s0,0(sp)
    80003940:	01010113          	addi	sp,sp,16
    80003944:	00008067          	ret

0000000080003948 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003948:	fe010113          	addi	sp,sp,-32
    8000394c:	00113c23          	sd	ra,24(sp)
    80003950:	00813823          	sd	s0,16(sp)
    80003954:	00913423          	sd	s1,8(sp)
    80003958:	01213023          	sd	s2,0(sp)
    8000395c:	02010413          	addi	s0,sp,32
    80003960:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003964:	00100793          	li	a5,1
    80003968:	02a7f863          	bgeu	a5,a0,80003998 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000396c:	00a00793          	li	a5,10
    80003970:	02f577b3          	remu	a5,a0,a5
    80003974:	02078e63          	beqz	a5,800039b0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003978:	fff48513          	addi	a0,s1,-1
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	fcc080e7          	jalr	-52(ra) # 80003948 <_ZL9fibonaccim>
    80003984:	00050913          	mv	s2,a0
    80003988:	ffe48513          	addi	a0,s1,-2
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	fbc080e7          	jalr	-68(ra) # 80003948 <_ZL9fibonaccim>
    80003994:	00a90533          	add	a0,s2,a0
}
    80003998:	01813083          	ld	ra,24(sp)
    8000399c:	01013403          	ld	s0,16(sp)
    800039a0:	00813483          	ld	s1,8(sp)
    800039a4:	00013903          	ld	s2,0(sp)
    800039a8:	02010113          	addi	sp,sp,32
    800039ac:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800039b0:	ffffe097          	auipc	ra,0xffffe
    800039b4:	df0080e7          	jalr	-528(ra) # 800017a0 <_Z15thread_dispatchv>
    800039b8:	fc1ff06f          	j	80003978 <_ZL9fibonaccim+0x30>

00000000800039bc <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800039bc:	fe010113          	addi	sp,sp,-32
    800039c0:	00113c23          	sd	ra,24(sp)
    800039c4:	00813823          	sd	s0,16(sp)
    800039c8:	00913423          	sd	s1,8(sp)
    800039cc:	01213023          	sd	s2,0(sp)
    800039d0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800039d4:	00a00493          	li	s1,10
    800039d8:	0400006f          	j	80003a18 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800039dc:	00005517          	auipc	a0,0x5
    800039e0:	ac450513          	addi	a0,a0,-1340 # 800084a0 <CONSOLE_STATUS+0x490>
    800039e4:	00001097          	auipc	ra,0x1
    800039e8:	d04080e7          	jalr	-764(ra) # 800046e8 <_Z11printStringPKc>
    800039ec:	00000613          	li	a2,0
    800039f0:	00a00593          	li	a1,10
    800039f4:	00048513          	mv	a0,s1
    800039f8:	00001097          	auipc	ra,0x1
    800039fc:	ea0080e7          	jalr	-352(ra) # 80004898 <_Z8printIntiii>
    80003a00:	00005517          	auipc	a0,0x5
    80003a04:	97850513          	addi	a0,a0,-1672 # 80008378 <CONSOLE_STATUS+0x368>
    80003a08:	00001097          	auipc	ra,0x1
    80003a0c:	ce0080e7          	jalr	-800(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003a10:	0014849b          	addiw	s1,s1,1
    80003a14:	0ff4f493          	andi	s1,s1,255
    80003a18:	00c00793          	li	a5,12
    80003a1c:	fc97f0e3          	bgeu	a5,s1,800039dc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003a20:	00005517          	auipc	a0,0x5
    80003a24:	a8850513          	addi	a0,a0,-1400 # 800084a8 <CONSOLE_STATUS+0x498>
    80003a28:	00001097          	auipc	ra,0x1
    80003a2c:	cc0080e7          	jalr	-832(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003a30:	00500313          	li	t1,5
    thread_dispatch();
    80003a34:	ffffe097          	auipc	ra,0xffffe
    80003a38:	d6c080e7          	jalr	-660(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003a3c:	01000513          	li	a0,16
    80003a40:	00000097          	auipc	ra,0x0
    80003a44:	f08080e7          	jalr	-248(ra) # 80003948 <_ZL9fibonaccim>
    80003a48:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003a4c:	00005517          	auipc	a0,0x5
    80003a50:	a6c50513          	addi	a0,a0,-1428 # 800084b8 <CONSOLE_STATUS+0x4a8>
    80003a54:	00001097          	auipc	ra,0x1
    80003a58:	c94080e7          	jalr	-876(ra) # 800046e8 <_Z11printStringPKc>
    80003a5c:	00000613          	li	a2,0
    80003a60:	00a00593          	li	a1,10
    80003a64:	0009051b          	sext.w	a0,s2
    80003a68:	00001097          	auipc	ra,0x1
    80003a6c:	e30080e7          	jalr	-464(ra) # 80004898 <_Z8printIntiii>
    80003a70:	00005517          	auipc	a0,0x5
    80003a74:	90850513          	addi	a0,a0,-1784 # 80008378 <CONSOLE_STATUS+0x368>
    80003a78:	00001097          	auipc	ra,0x1
    80003a7c:	c70080e7          	jalr	-912(ra) # 800046e8 <_Z11printStringPKc>
    80003a80:	0400006f          	j	80003ac0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003a84:	00005517          	auipc	a0,0x5
    80003a88:	a1c50513          	addi	a0,a0,-1508 # 800084a0 <CONSOLE_STATUS+0x490>
    80003a8c:	00001097          	auipc	ra,0x1
    80003a90:	c5c080e7          	jalr	-932(ra) # 800046e8 <_Z11printStringPKc>
    80003a94:	00000613          	li	a2,0
    80003a98:	00a00593          	li	a1,10
    80003a9c:	00048513          	mv	a0,s1
    80003aa0:	00001097          	auipc	ra,0x1
    80003aa4:	df8080e7          	jalr	-520(ra) # 80004898 <_Z8printIntiii>
    80003aa8:	00005517          	auipc	a0,0x5
    80003aac:	8d050513          	addi	a0,a0,-1840 # 80008378 <CONSOLE_STATUS+0x368>
    80003ab0:	00001097          	auipc	ra,0x1
    80003ab4:	c38080e7          	jalr	-968(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ab8:	0014849b          	addiw	s1,s1,1
    80003abc:	0ff4f493          	andi	s1,s1,255
    80003ac0:	00f00793          	li	a5,15
    80003ac4:	fc97f0e3          	bgeu	a5,s1,80003a84 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003ac8:	00005517          	auipc	a0,0x5
    80003acc:	a0050513          	addi	a0,a0,-1536 # 800084c8 <CONSOLE_STATUS+0x4b8>
    80003ad0:	00001097          	auipc	ra,0x1
    80003ad4:	c18080e7          	jalr	-1000(ra) # 800046e8 <_Z11printStringPKc>
    finishedD = true;
    80003ad8:	00100793          	li	a5,1
    80003adc:	00007717          	auipc	a4,0x7
    80003ae0:	82f70a23          	sb	a5,-1996(a4) # 8000a310 <_ZL9finishedD>
    thread_dispatch();
    80003ae4:	ffffe097          	auipc	ra,0xffffe
    80003ae8:	cbc080e7          	jalr	-836(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003aec:	01813083          	ld	ra,24(sp)
    80003af0:	01013403          	ld	s0,16(sp)
    80003af4:	00813483          	ld	s1,8(sp)
    80003af8:	00013903          	ld	s2,0(sp)
    80003afc:	02010113          	addi	sp,sp,32
    80003b00:	00008067          	ret

0000000080003b04 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003b04:	fe010113          	addi	sp,sp,-32
    80003b08:	00113c23          	sd	ra,24(sp)
    80003b0c:	00813823          	sd	s0,16(sp)
    80003b10:	00913423          	sd	s1,8(sp)
    80003b14:	01213023          	sd	s2,0(sp)
    80003b18:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003b1c:	00000493          	li	s1,0
    80003b20:	0400006f          	j	80003b60 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003b24:	00005517          	auipc	a0,0x5
    80003b28:	94c50513          	addi	a0,a0,-1716 # 80008470 <CONSOLE_STATUS+0x460>
    80003b2c:	00001097          	auipc	ra,0x1
    80003b30:	bbc080e7          	jalr	-1092(ra) # 800046e8 <_Z11printStringPKc>
    80003b34:	00000613          	li	a2,0
    80003b38:	00a00593          	li	a1,10
    80003b3c:	00048513          	mv	a0,s1
    80003b40:	00001097          	auipc	ra,0x1
    80003b44:	d58080e7          	jalr	-680(ra) # 80004898 <_Z8printIntiii>
    80003b48:	00005517          	auipc	a0,0x5
    80003b4c:	83050513          	addi	a0,a0,-2000 # 80008378 <CONSOLE_STATUS+0x368>
    80003b50:	00001097          	auipc	ra,0x1
    80003b54:	b98080e7          	jalr	-1128(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003b58:	0014849b          	addiw	s1,s1,1
    80003b5c:	0ff4f493          	andi	s1,s1,255
    80003b60:	00200793          	li	a5,2
    80003b64:	fc97f0e3          	bgeu	a5,s1,80003b24 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003b68:	00005517          	auipc	a0,0x5
    80003b6c:	91050513          	addi	a0,a0,-1776 # 80008478 <CONSOLE_STATUS+0x468>
    80003b70:	00001097          	auipc	ra,0x1
    80003b74:	b78080e7          	jalr	-1160(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003b78:	00700313          	li	t1,7
    thread_dispatch();
    80003b7c:	ffffe097          	auipc	ra,0xffffe
    80003b80:	c24080e7          	jalr	-988(ra) # 800017a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003b84:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003b88:	00005517          	auipc	a0,0x5
    80003b8c:	90050513          	addi	a0,a0,-1792 # 80008488 <CONSOLE_STATUS+0x478>
    80003b90:	00001097          	auipc	ra,0x1
    80003b94:	b58080e7          	jalr	-1192(ra) # 800046e8 <_Z11printStringPKc>
    80003b98:	00000613          	li	a2,0
    80003b9c:	00a00593          	li	a1,10
    80003ba0:	0009051b          	sext.w	a0,s2
    80003ba4:	00001097          	auipc	ra,0x1
    80003ba8:	cf4080e7          	jalr	-780(ra) # 80004898 <_Z8printIntiii>
    80003bac:	00004517          	auipc	a0,0x4
    80003bb0:	7cc50513          	addi	a0,a0,1996 # 80008378 <CONSOLE_STATUS+0x368>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	b34080e7          	jalr	-1228(ra) # 800046e8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003bbc:	00c00513          	li	a0,12
    80003bc0:	00000097          	auipc	ra,0x0
    80003bc4:	d88080e7          	jalr	-632(ra) # 80003948 <_ZL9fibonaccim>
    80003bc8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003bcc:	00005517          	auipc	a0,0x5
    80003bd0:	8c450513          	addi	a0,a0,-1852 # 80008490 <CONSOLE_STATUS+0x480>
    80003bd4:	00001097          	auipc	ra,0x1
    80003bd8:	b14080e7          	jalr	-1260(ra) # 800046e8 <_Z11printStringPKc>
    80003bdc:	00000613          	li	a2,0
    80003be0:	00a00593          	li	a1,10
    80003be4:	0009051b          	sext.w	a0,s2
    80003be8:	00001097          	auipc	ra,0x1
    80003bec:	cb0080e7          	jalr	-848(ra) # 80004898 <_Z8printIntiii>
    80003bf0:	00004517          	auipc	a0,0x4
    80003bf4:	78850513          	addi	a0,a0,1928 # 80008378 <CONSOLE_STATUS+0x368>
    80003bf8:	00001097          	auipc	ra,0x1
    80003bfc:	af0080e7          	jalr	-1296(ra) # 800046e8 <_Z11printStringPKc>
    80003c00:	0400006f          	j	80003c40 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003c04:	00005517          	auipc	a0,0x5
    80003c08:	86c50513          	addi	a0,a0,-1940 # 80008470 <CONSOLE_STATUS+0x460>
    80003c0c:	00001097          	auipc	ra,0x1
    80003c10:	adc080e7          	jalr	-1316(ra) # 800046e8 <_Z11printStringPKc>
    80003c14:	00000613          	li	a2,0
    80003c18:	00a00593          	li	a1,10
    80003c1c:	00048513          	mv	a0,s1
    80003c20:	00001097          	auipc	ra,0x1
    80003c24:	c78080e7          	jalr	-904(ra) # 80004898 <_Z8printIntiii>
    80003c28:	00004517          	auipc	a0,0x4
    80003c2c:	75050513          	addi	a0,a0,1872 # 80008378 <CONSOLE_STATUS+0x368>
    80003c30:	00001097          	auipc	ra,0x1
    80003c34:	ab8080e7          	jalr	-1352(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003c38:	0014849b          	addiw	s1,s1,1
    80003c3c:	0ff4f493          	andi	s1,s1,255
    80003c40:	00500793          	li	a5,5
    80003c44:	fc97f0e3          	bgeu	a5,s1,80003c04 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003c48:	00005517          	auipc	a0,0x5
    80003c4c:	80050513          	addi	a0,a0,-2048 # 80008448 <CONSOLE_STATUS+0x438>
    80003c50:	00001097          	auipc	ra,0x1
    80003c54:	a98080e7          	jalr	-1384(ra) # 800046e8 <_Z11printStringPKc>
    finishedC = true;
    80003c58:	00100793          	li	a5,1
    80003c5c:	00006717          	auipc	a4,0x6
    80003c60:	6af70aa3          	sb	a5,1717(a4) # 8000a311 <_ZL9finishedC>
    thread_dispatch();
    80003c64:	ffffe097          	auipc	ra,0xffffe
    80003c68:	b3c080e7          	jalr	-1220(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003c6c:	01813083          	ld	ra,24(sp)
    80003c70:	01013403          	ld	s0,16(sp)
    80003c74:	00813483          	ld	s1,8(sp)
    80003c78:	00013903          	ld	s2,0(sp)
    80003c7c:	02010113          	addi	sp,sp,32
    80003c80:	00008067          	ret

0000000080003c84 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003c84:	fe010113          	addi	sp,sp,-32
    80003c88:	00113c23          	sd	ra,24(sp)
    80003c8c:	00813823          	sd	s0,16(sp)
    80003c90:	00913423          	sd	s1,8(sp)
    80003c94:	01213023          	sd	s2,0(sp)
    80003c98:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003c9c:	00000913          	li	s2,0
    80003ca0:	0380006f          	j	80003cd8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80003ca4:	ffffe097          	auipc	ra,0xffffe
    80003ca8:	afc080e7          	jalr	-1284(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cac:	00148493          	addi	s1,s1,1
    80003cb0:	000027b7          	lui	a5,0x2
    80003cb4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003cb8:	0097ee63          	bltu	a5,s1,80003cd4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003cbc:	00000713          	li	a4,0
    80003cc0:	000077b7          	lui	a5,0x7
    80003cc4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003cc8:	fce7eee3          	bltu	a5,a4,80003ca4 <_ZL11workerBodyBPv+0x20>
    80003ccc:	00170713          	addi	a4,a4,1
    80003cd0:	ff1ff06f          	j	80003cc0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003cd4:	00190913          	addi	s2,s2,1
    80003cd8:	00f00793          	li	a5,15
    80003cdc:	0527e063          	bltu	a5,s2,80003d1c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ce0:	00004517          	auipc	a0,0x4
    80003ce4:	77850513          	addi	a0,a0,1912 # 80008458 <CONSOLE_STATUS+0x448>
    80003ce8:	00001097          	auipc	ra,0x1
    80003cec:	a00080e7          	jalr	-1536(ra) # 800046e8 <_Z11printStringPKc>
    80003cf0:	00000613          	li	a2,0
    80003cf4:	00a00593          	li	a1,10
    80003cf8:	0009051b          	sext.w	a0,s2
    80003cfc:	00001097          	auipc	ra,0x1
    80003d00:	b9c080e7          	jalr	-1124(ra) # 80004898 <_Z8printIntiii>
    80003d04:	00004517          	auipc	a0,0x4
    80003d08:	67450513          	addi	a0,a0,1652 # 80008378 <CONSOLE_STATUS+0x368>
    80003d0c:	00001097          	auipc	ra,0x1
    80003d10:	9dc080e7          	jalr	-1572(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d14:	00000493          	li	s1,0
    80003d18:	f99ff06f          	j	80003cb0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80003d1c:	00004517          	auipc	a0,0x4
    80003d20:	74450513          	addi	a0,a0,1860 # 80008460 <CONSOLE_STATUS+0x450>
    80003d24:	00001097          	auipc	ra,0x1
    80003d28:	9c4080e7          	jalr	-1596(ra) # 800046e8 <_Z11printStringPKc>
    finishedB = true;
    80003d2c:	00100793          	li	a5,1
    80003d30:	00006717          	auipc	a4,0x6
    80003d34:	5ef70123          	sb	a5,1506(a4) # 8000a312 <_ZL9finishedB>
    thread_dispatch();
    80003d38:	ffffe097          	auipc	ra,0xffffe
    80003d3c:	a68080e7          	jalr	-1432(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003d40:	01813083          	ld	ra,24(sp)
    80003d44:	01013403          	ld	s0,16(sp)
    80003d48:	00813483          	ld	s1,8(sp)
    80003d4c:	00013903          	ld	s2,0(sp)
    80003d50:	02010113          	addi	sp,sp,32
    80003d54:	00008067          	ret

0000000080003d58 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003d58:	fe010113          	addi	sp,sp,-32
    80003d5c:	00113c23          	sd	ra,24(sp)
    80003d60:	00813823          	sd	s0,16(sp)
    80003d64:	00913423          	sd	s1,8(sp)
    80003d68:	01213023          	sd	s2,0(sp)
    80003d6c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003d70:	00000913          	li	s2,0
    80003d74:	0380006f          	j	80003dac <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003d78:	ffffe097          	auipc	ra,0xffffe
    80003d7c:	a28080e7          	jalr	-1496(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003d80:	00148493          	addi	s1,s1,1
    80003d84:	000027b7          	lui	a5,0x2
    80003d88:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d8c:	0097ee63          	bltu	a5,s1,80003da8 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d90:	00000713          	li	a4,0
    80003d94:	000077b7          	lui	a5,0x7
    80003d98:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003d9c:	fce7eee3          	bltu	a5,a4,80003d78 <_ZL11workerBodyAPv+0x20>
    80003da0:	00170713          	addi	a4,a4,1
    80003da4:	ff1ff06f          	j	80003d94 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003da8:	00190913          	addi	s2,s2,1
    80003dac:	00900793          	li	a5,9
    80003db0:	0527e063          	bltu	a5,s2,80003df0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003db4:	00004517          	auipc	a0,0x4
    80003db8:	68c50513          	addi	a0,a0,1676 # 80008440 <CONSOLE_STATUS+0x430>
    80003dbc:	00001097          	auipc	ra,0x1
    80003dc0:	92c080e7          	jalr	-1748(ra) # 800046e8 <_Z11printStringPKc>
    80003dc4:	00000613          	li	a2,0
    80003dc8:	00a00593          	li	a1,10
    80003dcc:	0009051b          	sext.w	a0,s2
    80003dd0:	00001097          	auipc	ra,0x1
    80003dd4:	ac8080e7          	jalr	-1336(ra) # 80004898 <_Z8printIntiii>
    80003dd8:	00004517          	auipc	a0,0x4
    80003ddc:	5a050513          	addi	a0,a0,1440 # 80008378 <CONSOLE_STATUS+0x368>
    80003de0:	00001097          	auipc	ra,0x1
    80003de4:	908080e7          	jalr	-1784(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003de8:	00000493          	li	s1,0
    80003dec:	f99ff06f          	j	80003d84 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003df0:	00004517          	auipc	a0,0x4
    80003df4:	65850513          	addi	a0,a0,1624 # 80008448 <CONSOLE_STATUS+0x438>
    80003df8:	00001097          	auipc	ra,0x1
    80003dfc:	8f0080e7          	jalr	-1808(ra) # 800046e8 <_Z11printStringPKc>
    finishedA = true;
    80003e00:	00100793          	li	a5,1
    80003e04:	00006717          	auipc	a4,0x6
    80003e08:	50f707a3          	sb	a5,1295(a4) # 8000a313 <_ZL9finishedA>
}
    80003e0c:	01813083          	ld	ra,24(sp)
    80003e10:	01013403          	ld	s0,16(sp)
    80003e14:	00813483          	ld	s1,8(sp)
    80003e18:	00013903          	ld	s2,0(sp)
    80003e1c:	02010113          	addi	sp,sp,32
    80003e20:	00008067          	ret

0000000080003e24 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003e24:	fd010113          	addi	sp,sp,-48
    80003e28:	02113423          	sd	ra,40(sp)
    80003e2c:	02813023          	sd	s0,32(sp)
    80003e30:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003e34:	00000613          	li	a2,0
    80003e38:	00000597          	auipc	a1,0x0
    80003e3c:	f2058593          	addi	a1,a1,-224 # 80003d58 <_ZL11workerBodyAPv>
    80003e40:	fd040513          	addi	a0,s0,-48
    80003e44:	ffffe097          	auipc	ra,0xffffe
    80003e48:	83c080e7          	jalr	-1988(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003e4c:	00004517          	auipc	a0,0x4
    80003e50:	68c50513          	addi	a0,a0,1676 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80003e54:	00001097          	auipc	ra,0x1
    80003e58:	894080e7          	jalr	-1900(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003e5c:	00000613          	li	a2,0
    80003e60:	00000597          	auipc	a1,0x0
    80003e64:	e2458593          	addi	a1,a1,-476 # 80003c84 <_ZL11workerBodyBPv>
    80003e68:	fd840513          	addi	a0,s0,-40
    80003e6c:	ffffe097          	auipc	ra,0xffffe
    80003e70:	814080e7          	jalr	-2028(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003e74:	00004517          	auipc	a0,0x4
    80003e78:	67c50513          	addi	a0,a0,1660 # 800084f0 <CONSOLE_STATUS+0x4e0>
    80003e7c:	00001097          	auipc	ra,0x1
    80003e80:	86c080e7          	jalr	-1940(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003e84:	00000613          	li	a2,0
    80003e88:	00000597          	auipc	a1,0x0
    80003e8c:	c7c58593          	addi	a1,a1,-900 # 80003b04 <_ZL11workerBodyCPv>
    80003e90:	fe040513          	addi	a0,s0,-32
    80003e94:	ffffd097          	auipc	ra,0xffffd
    80003e98:	7ec080e7          	jalr	2028(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003e9c:	00004517          	auipc	a0,0x4
    80003ea0:	66c50513          	addi	a0,a0,1644 # 80008508 <CONSOLE_STATUS+0x4f8>
    80003ea4:	00001097          	auipc	ra,0x1
    80003ea8:	844080e7          	jalr	-1980(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003eac:	00000613          	li	a2,0
    80003eb0:	00000597          	auipc	a1,0x0
    80003eb4:	b0c58593          	addi	a1,a1,-1268 # 800039bc <_ZL11workerBodyDPv>
    80003eb8:	fe840513          	addi	a0,s0,-24
    80003ebc:	ffffd097          	auipc	ra,0xffffd
    80003ec0:	7c4080e7          	jalr	1988(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003ec4:	00004517          	auipc	a0,0x4
    80003ec8:	65c50513          	addi	a0,a0,1628 # 80008520 <CONSOLE_STATUS+0x510>
    80003ecc:	00001097          	auipc	ra,0x1
    80003ed0:	81c080e7          	jalr	-2020(ra) # 800046e8 <_Z11printStringPKc>
    80003ed4:	00c0006f          	j	80003ee0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003ed8:	ffffe097          	auipc	ra,0xffffe
    80003edc:	8c8080e7          	jalr	-1848(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003ee0:	00006797          	auipc	a5,0x6
    80003ee4:	4337c783          	lbu	a5,1075(a5) # 8000a313 <_ZL9finishedA>
    80003ee8:	fe0788e3          	beqz	a5,80003ed8 <_Z18Threads_C_API_testv+0xb4>
    80003eec:	00006797          	auipc	a5,0x6
    80003ef0:	4267c783          	lbu	a5,1062(a5) # 8000a312 <_ZL9finishedB>
    80003ef4:	fe0782e3          	beqz	a5,80003ed8 <_Z18Threads_C_API_testv+0xb4>
    80003ef8:	00006797          	auipc	a5,0x6
    80003efc:	4197c783          	lbu	a5,1049(a5) # 8000a311 <_ZL9finishedC>
    80003f00:	fc078ce3          	beqz	a5,80003ed8 <_Z18Threads_C_API_testv+0xb4>
    80003f04:	00006797          	auipc	a5,0x6
    80003f08:	40c7c783          	lbu	a5,1036(a5) # 8000a310 <_ZL9finishedD>
    80003f0c:	fc0786e3          	beqz	a5,80003ed8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003f10:	02813083          	ld	ra,40(sp)
    80003f14:	02013403          	ld	s0,32(sp)
    80003f18:	03010113          	addi	sp,sp,48
    80003f1c:	00008067          	ret

0000000080003f20 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80003f20:	fd010113          	addi	sp,sp,-48
    80003f24:	02113423          	sd	ra,40(sp)
    80003f28:	02813023          	sd	s0,32(sp)
    80003f2c:	00913c23          	sd	s1,24(sp)
    80003f30:	01213823          	sd	s2,16(sp)
    80003f34:	01313423          	sd	s3,8(sp)
    80003f38:	03010413          	addi	s0,sp,48
    80003f3c:	00050993          	mv	s3,a0
    80003f40:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003f44:	00000493          	li	s1,0
    80003f48:	0540006f          	j	80003f9c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x7c>
        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
        }
    }

    threadEnd = 1;
    80003f4c:	00100793          	li	a5,1
    80003f50:	00006717          	auipc	a4,0x6
    80003f54:	3cf72423          	sw	a5,968(a4) # 8000a318 <_ZL9threadEnd>
    td->buffer->put('!');
    80003f58:	0209b783          	ld	a5,32(s3)
    80003f5c:	02100593          	li	a1,33
    80003f60:	0087b503          	ld	a0,8(a5)
    80003f64:	00001097          	auipc	ra,0x1
    80003f68:	ba8080e7          	jalr	-1112(ra) # 80004b0c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003f6c:	01093503          	ld	a0,16(s2)
    80003f70:	ffffe097          	auipc	ra,0xffffe
    80003f74:	fbc080e7          	jalr	-68(ra) # 80001f2c <_ZN9Semaphore6signalEv>
}
    80003f78:	02813083          	ld	ra,40(sp)
    80003f7c:	02013403          	ld	s0,32(sp)
    80003f80:	01813483          	ld	s1,24(sp)
    80003f84:	01013903          	ld	s2,16(sp)
    80003f88:	00813983          	ld	s3,8(sp)
    80003f8c:	03010113          	addi	sp,sp,48
    80003f90:	00008067          	ret
            Thread::dispatch();
    80003f94:	ffffe097          	auipc	ra,0xffffe
    80003f98:	eac080e7          	jalr	-340(ra) # 80001e40 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b && i!=15) {
    80003f9c:	ffffe097          	auipc	ra,0xffffe
    80003fa0:	97c080e7          	jalr	-1668(ra) # 80001918 <_Z4getcv>
    80003fa4:	0005059b          	sext.w	a1,a0
    80003fa8:	01b00793          	li	a5,27
    80003fac:	faf580e3          	beq	a1,a5,80003f4c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
    80003fb0:	00f00793          	li	a5,15
    80003fb4:	f8f48ce3          	beq	s1,a5,80003f4c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        data->buffer->put(key);
    80003fb8:	00893503          	ld	a0,8(s2)
    80003fbc:	00001097          	auipc	ra,0x1
    80003fc0:	b50080e7          	jalr	-1200(ra) # 80004b0c <_ZN9BufferCPP3putEi>
        i++;
    80003fc4:	0014871b          	addiw	a4,s1,1
    80003fc8:	0007049b          	sext.w	s1,a4
        if (i % (10 * data->id) == 0) {
    80003fcc:	00092683          	lw	a3,0(s2)
    80003fd0:	0026979b          	slliw	a5,a3,0x2
    80003fd4:	00d787bb          	addw	a5,a5,a3
    80003fd8:	0017979b          	slliw	a5,a5,0x1
    80003fdc:	02f767bb          	remw	a5,a4,a5
    80003fe0:	fa079ee3          	bnez	a5,80003f9c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x7c>
    80003fe4:	fb1ff06f          	j	80003f94 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x74>

0000000080003fe8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003fe8:	fe010113          	addi	sp,sp,-32
    80003fec:	00113c23          	sd	ra,24(sp)
    80003ff0:	00813823          	sd	s0,16(sp)
    80003ff4:	00913423          	sd	s1,8(sp)
    80003ff8:	01213023          	sd	s2,0(sp)
    80003ffc:	02010413          	addi	s0,sp,32
    80004000:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004004:	00000913          	li	s2,0
    80004008:	00c0006f          	j	80004014 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000400c:	ffffe097          	auipc	ra,0xffffe
    80004010:	e34080e7          	jalr	-460(ra) # 80001e40 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004014:	00006797          	auipc	a5,0x6
    80004018:	3047a783          	lw	a5,772(a5) # 8000a318 <_ZL9threadEnd>
    8000401c:	02079e63          	bnez	a5,80004058 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004020:	0004a583          	lw	a1,0(s1)
    80004024:	0305859b          	addiw	a1,a1,48
    80004028:	0084b503          	ld	a0,8(s1)
    8000402c:	00001097          	auipc	ra,0x1
    80004030:	ae0080e7          	jalr	-1312(ra) # 80004b0c <_ZN9BufferCPP3putEi>
        i++;
    80004034:	0019071b          	addiw	a4,s2,1
    80004038:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000403c:	0004a683          	lw	a3,0(s1)
    80004040:	0026979b          	slliw	a5,a3,0x2
    80004044:	00d787bb          	addw	a5,a5,a3
    80004048:	0017979b          	slliw	a5,a5,0x1
    8000404c:	02f767bb          	remw	a5,a4,a5
    80004050:	fc0792e3          	bnez	a5,80004014 <_ZN12ProducerSync8producerEPv+0x2c>
    80004054:	fb9ff06f          	j	8000400c <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004058:	0104b503          	ld	a0,16(s1)
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	ed0080e7          	jalr	-304(ra) # 80001f2c <_ZN9Semaphore6signalEv>
}
    80004064:	01813083          	ld	ra,24(sp)
    80004068:	01013403          	ld	s0,16(sp)
    8000406c:	00813483          	ld	s1,8(sp)
    80004070:	00013903          	ld	s2,0(sp)
    80004074:	02010113          	addi	sp,sp,32
    80004078:	00008067          	ret

000000008000407c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000407c:	fd010113          	addi	sp,sp,-48
    80004080:	02113423          	sd	ra,40(sp)
    80004084:	02813023          	sd	s0,32(sp)
    80004088:	00913c23          	sd	s1,24(sp)
    8000408c:	01213823          	sd	s2,16(sp)
    80004090:	01313423          	sd	s3,8(sp)
    80004094:	01413023          	sd	s4,0(sp)
    80004098:	03010413          	addi	s0,sp,48
    8000409c:	00050993          	mv	s3,a0
    800040a0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800040a4:	00000a13          	li	s4,0
    800040a8:	01c0006f          	j	800040c4 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800040ac:	ffffe097          	auipc	ra,0xffffe
    800040b0:	d94080e7          	jalr	-620(ra) # 80001e40 <_ZN6Thread8dispatchEv>
    800040b4:	0500006f          	j	80004104 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800040b8:	00a00513          	li	a0,10
    800040bc:	ffffe097          	auipc	ra,0xffffe
    800040c0:	884080e7          	jalr	-1916(ra) # 80001940 <_Z4putcc>
    while (!threadEnd) {
    800040c4:	00006797          	auipc	a5,0x6
    800040c8:	2547a783          	lw	a5,596(a5) # 8000a318 <_ZL9threadEnd>
    800040cc:	06079263          	bnez	a5,80004130 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800040d0:	00893503          	ld	a0,8(s2)
    800040d4:	00001097          	auipc	ra,0x1
    800040d8:	ac8080e7          	jalr	-1336(ra) # 80004b9c <_ZN9BufferCPP3getEv>
        i++;
    800040dc:	001a049b          	addiw	s1,s4,1
    800040e0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800040e4:	0ff57513          	andi	a0,a0,255
    800040e8:	ffffe097          	auipc	ra,0xffffe
    800040ec:	858080e7          	jalr	-1960(ra) # 80001940 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800040f0:	00092703          	lw	a4,0(s2)
    800040f4:	0027179b          	slliw	a5,a4,0x2
    800040f8:	00e787bb          	addw	a5,a5,a4
    800040fc:	02f4e7bb          	remw	a5,s1,a5
    80004100:	fa0786e3          	beqz	a5,800040ac <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004104:	05000793          	li	a5,80
    80004108:	02f4e4bb          	remw	s1,s1,a5
    8000410c:	fa049ce3          	bnez	s1,800040c4 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004110:	fa9ff06f          	j	800040b8 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004114:	0209b783          	ld	a5,32(s3)
    80004118:	0087b503          	ld	a0,8(a5)
    8000411c:	00001097          	auipc	ra,0x1
    80004120:	a80080e7          	jalr	-1408(ra) # 80004b9c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004124:	0ff57513          	andi	a0,a0,255
    80004128:	ffffe097          	auipc	ra,0xffffe
    8000412c:	e84080e7          	jalr	-380(ra) # 80001fac <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004130:	0209b783          	ld	a5,32(s3)
    80004134:	0087b503          	ld	a0,8(a5)
    80004138:	00001097          	auipc	ra,0x1
    8000413c:	af0080e7          	jalr	-1296(ra) # 80004c28 <_ZN9BufferCPP6getCntEv>
    80004140:	fca04ae3          	bgtz	a0,80004114 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004144:	01093503          	ld	a0,16(s2)
    80004148:	ffffe097          	auipc	ra,0xffffe
    8000414c:	de4080e7          	jalr	-540(ra) # 80001f2c <_ZN9Semaphore6signalEv>
}
    80004150:	02813083          	ld	ra,40(sp)
    80004154:	02013403          	ld	s0,32(sp)
    80004158:	01813483          	ld	s1,24(sp)
    8000415c:	01013903          	ld	s2,16(sp)
    80004160:	00813983          	ld	s3,8(sp)
    80004164:	00013a03          	ld	s4,0(sp)
    80004168:	03010113          	addi	sp,sp,48
    8000416c:	00008067          	ret

0000000080004170 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004170:	f0010113          	addi	sp,sp,-256
    80004174:	0e113c23          	sd	ra,248(sp)
    80004178:	0e813823          	sd	s0,240(sp)
    8000417c:	0e913423          	sd	s1,232(sp)
    80004180:	0f213023          	sd	s2,224(sp)
    80004184:	0d313c23          	sd	s3,216(sp)
    80004188:	0d413823          	sd	s4,208(sp)
    8000418c:	0d513423          	sd	s5,200(sp)
    80004190:	10010413          	addi	s0,sp,256
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    80004194:	00004517          	auipc	a0,0x4
    80004198:	14450513          	addi	a0,a0,324 # 800082d8 <CONSOLE_STATUS+0x2c8>
    8000419c:	00000097          	auipc	ra,0x0
    800041a0:	54c080e7          	jalr	1356(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 5;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    800041a4:	00004517          	auipc	a0,0x4
    800041a8:	15450513          	addi	a0,a0,340 # 800082f8 <CONSOLE_STATUS+0x2e8>
    800041ac:	00000097          	auipc	ra,0x0
    800041b0:	53c080e7          	jalr	1340(ra) # 800046e8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    800041b4:	00004517          	auipc	a0,0x4
    800041b8:	16450513          	addi	a0,a0,356 # 80008318 <CONSOLE_STATUS+0x308>
    800041bc:	00000097          	auipc	ra,0x0
    800041c0:	52c080e7          	jalr	1324(ra) # 800046e8 <_Z11printStringPKc>
    800041c4:	00000613          	li	a2,0
    800041c8:	00a00593          	li	a1,10
    800041cc:	00500513          	li	a0,5
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	6c8080e7          	jalr	1736(ra) # 80004898 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800041d8:	00004517          	auipc	a0,0x4
    800041dc:	15850513          	addi	a0,a0,344 # 80008330 <CONSOLE_STATUS+0x320>
    800041e0:	00000097          	auipc	ra,0x0
    800041e4:	508080e7          	jalr	1288(ra) # 800046e8 <_Z11printStringPKc>
    800041e8:	00000613          	li	a2,0
    800041ec:	00a00593          	li	a1,10
    800041f0:	00a00513          	li	a0,10
    800041f4:	00000097          	auipc	ra,0x0
    800041f8:	6a4080e7          	jalr	1700(ra) # 80004898 <_Z8printIntiii>
    printString(".\n");
    800041fc:	00004517          	auipc	a0,0x4
    80004200:	14c50513          	addi	a0,a0,332 # 80008348 <CONSOLE_STATUS+0x338>
    80004204:	00000097          	auipc	ra,0x0
    80004208:	4e4080e7          	jalr	1252(ra) # 800046e8 <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    BufferCPP *buffer = new BufferCPP(n);
    8000420c:	03800513          	li	a0,56
    80004210:	ffffd097          	auipc	ra,0xffffd
    80004214:	79c080e7          	jalr	1948(ra) # 800019ac <_Znwm>
    80004218:	00050993          	mv	s3,a0
    8000421c:	00a00593          	li	a1,10
    80004220:	00000097          	auipc	ra,0x0
    80004224:	798080e7          	jalr	1944(ra) # 800049b8 <_ZN9BufferCPPC1Ei>

    waitForAll = new Semaphore(0);
    80004228:	01000513          	li	a0,16
    8000422c:	ffffd097          	auipc	ra,0xffffd
    80004230:	780080e7          	jalr	1920(ra) # 800019ac <_Znwm>
    80004234:	00050493          	mv	s1,a0
    80004238:	00000593          	li	a1,0
    8000423c:	ffffe097          	auipc	ra,0xffffe
    80004240:	c8c080e7          	jalr	-884(ra) # 80001ec8 <_ZN9SemaphoreC1Ej>
    80004244:	00006797          	auipc	a5,0x6
    80004248:	0c97be23          	sd	s1,220(a5) # 8000a320 <_ZL10waitForAll>
    Thread* threads[threadNum];
    Thread* consumerThread;

    struct thread_data data[threadNum + 1];

    data[threadNum].id = threadNum;
    8000424c:	00500793          	li	a5,5
    80004250:	faf42423          	sw	a5,-88(s0)
    data[threadNum].buffer = buffer;
    80004254:	fb343823          	sd	s3,-80(s0)
    data[threadNum].wait = waitForAll;
    80004258:	fa943c23          	sd	s1,-72(s0)
    consumerThread = new ConsumerSync(data+threadNum);
    8000425c:	02800513          	li	a0,40
    80004260:	ffffd097          	auipc	ra,0xffffd
    80004264:	74c080e7          	jalr	1868(ra) # 800019ac <_Znwm>
    80004268:	00050a13          	mv	s4,a0
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	c18080e7          	jalr	-1000(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80004274:	00006797          	auipc	a5,0x6
    80004278:	f6c78793          	addi	a5,a5,-148 # 8000a1e0 <_ZTV12ConsumerSync+0x10>
    8000427c:	00fa3023          	sd	a5,0(s4)
    80004280:	fa840793          	addi	a5,s0,-88
    80004284:	02fa3023          	sd	a5,32(s4)
    consumerThread->start();
    80004288:	000a0513          	mv	a0,s4
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	b84080e7          	jalr	-1148(ra) # 80001e10 <_ZN6Thread5startEv>

    for (int i = 0; i < threadNum; i++) {
    80004294:	00000493          	li	s1,0
    80004298:	0400006f          	j	800042d8 <_Z29producerConsumer_CPP_Sync_APIv+0x168>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000429c:	00006797          	auipc	a5,0x6
    800042a0:	f1c78793          	addi	a5,a5,-228 # 8000a1b8 <_ZTV12ProducerSync+0x10>
    800042a4:	00f93023          	sd	a5,0(s2)
    800042a8:	03593023          	sd	s5,32(s2)
        data[i].id = i;
        data[i].buffer = buffer;
        data[i].wait = waitForAll;

        if(i>0) {
            threads[i] = new ProducerSync(data+i);
    800042ac:	00349793          	slli	a5,s1,0x3
    800042b0:	fc040713          	addi	a4,s0,-64
    800042b4:	00f707b3          	add	a5,a4,a5
    800042b8:	f527b423          	sd	s2,-184(a5)
        } else {
            threads[i] = new ProducerKeyboard(data+i);
        }

        threads[i]->start();
    800042bc:	00349793          	slli	a5,s1,0x3
    800042c0:	fc040713          	addi	a4,s0,-64
    800042c4:	00f707b3          	add	a5,a4,a5
    800042c8:	f487b503          	ld	a0,-184(a5)
    800042cc:	ffffe097          	auipc	ra,0xffffe
    800042d0:	b44080e7          	jalr	-1212(ra) # 80001e10 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800042d4:	0014849b          	addiw	s1,s1,1
    800042d8:	00400793          	li	a5,4
    800042dc:	0a97c663          	blt	a5,s1,80004388 <_Z29producerConsumer_CPP_Sync_APIv+0x218>
        data[i].id = i;
    800042e0:	00149793          	slli	a5,s1,0x1
    800042e4:	009787b3          	add	a5,a5,s1
    800042e8:	00379793          	slli	a5,a5,0x3
    800042ec:	fc040713          	addi	a4,s0,-64
    800042f0:	00f707b3          	add	a5,a4,a5
    800042f4:	f697a823          	sw	s1,-144(a5)
        data[i].buffer = buffer;
    800042f8:	f737bc23          	sd	s3,-136(a5)
        data[i].wait = waitForAll;
    800042fc:	00006717          	auipc	a4,0x6
    80004300:	02473703          	ld	a4,36(a4) # 8000a320 <_ZL10waitForAll>
    80004304:	f8e7b023          	sd	a4,-128(a5)
        if(i>0) {
    80004308:	02905a63          	blez	s1,8000433c <_Z29producerConsumer_CPP_Sync_APIv+0x1cc>
            threads[i] = new ProducerSync(data+i);
    8000430c:	02800513          	li	a0,40
    80004310:	ffffd097          	auipc	ra,0xffffd
    80004314:	69c080e7          	jalr	1692(ra) # 800019ac <_Znwm>
    80004318:	00050913          	mv	s2,a0
    8000431c:	00149793          	slli	a5,s1,0x1
    80004320:	009787b3          	add	a5,a5,s1
    80004324:	00379793          	slli	a5,a5,0x3
    80004328:	f3040a93          	addi	s5,s0,-208
    8000432c:	00fa8ab3          	add	s5,s5,a5
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004330:	ffffe097          	auipc	ra,0xffffe
    80004334:	b54080e7          	jalr	-1196(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80004338:	f65ff06f          	j	8000429c <_Z29producerConsumer_CPP_Sync_APIv+0x12c>
            threads[i] = new ProducerKeyboard(data+i);
    8000433c:	02800513          	li	a0,40
    80004340:	ffffd097          	auipc	ra,0xffffd
    80004344:	66c080e7          	jalr	1644(ra) # 800019ac <_Znwm>
    80004348:	00050913          	mv	s2,a0
    8000434c:	01800793          	li	a5,24
    80004350:	02f487b3          	mul	a5,s1,a5
    80004354:	f3040a93          	addi	s5,s0,-208
    80004358:	00fa8ab3          	add	s5,s5,a5
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000435c:	ffffe097          	auipc	ra,0xffffe
    80004360:	b28080e7          	jalr	-1240(ra) # 80001e84 <_ZN6ThreadC1Ev>
    80004364:	00006797          	auipc	a5,0x6
    80004368:	e2c78793          	addi	a5,a5,-468 # 8000a190 <_ZTV16ProducerKeyboard+0x10>
    8000436c:	00f93023          	sd	a5,0(s2)
    80004370:	03593023          	sd	s5,32(s2)
            threads[i] = new ProducerKeyboard(data+i);
    80004374:	00349793          	slli	a5,s1,0x3
    80004378:	fc040713          	addi	a4,s0,-64
    8000437c:	00f707b3          	add	a5,a4,a5
    80004380:	f527b423          	sd	s2,-184(a5)
    80004384:	f39ff06f          	j	800042bc <_Z29producerConsumer_CPP_Sync_APIv+0x14c>
    }

    Thread::dispatch();
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	ab8080e7          	jalr	-1352(ra) # 80001e40 <_ZN6Thread8dispatchEv>

    for (int i = 0; i <= threadNum; i++) {
    80004390:	00000493          	li	s1,0
    80004394:	00500793          	li	a5,5
    80004398:	0097ce63          	blt	a5,s1,800043b4 <_Z29producerConsumer_CPP_Sync_APIv+0x244>
        waitForAll->wait();
    8000439c:	00006517          	auipc	a0,0x6
    800043a0:	f8453503          	ld	a0,-124(a0) # 8000a320 <_ZL10waitForAll>
    800043a4:	ffffe097          	auipc	ra,0xffffe
    800043a8:	b5c080e7          	jalr	-1188(ra) # 80001f00 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800043ac:	0014849b          	addiw	s1,s1,1
    800043b0:	fe5ff06f          	j	80004394 <_Z29producerConsumer_CPP_Sync_APIv+0x224>
    }

    for (int i = 0; i < threadNum; i++) {
    800043b4:	00000493          	li	s1,0
    800043b8:	0080006f          	j	800043c0 <_Z29producerConsumer_CPP_Sync_APIv+0x250>
    800043bc:	0014849b          	addiw	s1,s1,1
    800043c0:	00400793          	li	a5,4
    800043c4:	0297c463          	blt	a5,s1,800043ec <_Z29producerConsumer_CPP_Sync_APIv+0x27c>
        delete threads[i];
    800043c8:	00349793          	slli	a5,s1,0x3
    800043cc:	fc040713          	addi	a4,s0,-64
    800043d0:	00f707b3          	add	a5,a4,a5
    800043d4:	f487b503          	ld	a0,-184(a5)
    800043d8:	fe0502e3          	beqz	a0,800043bc <_Z29producerConsumer_CPP_Sync_APIv+0x24c>
    800043dc:	00053783          	ld	a5,0(a0)
    800043e0:	0087b783          	ld	a5,8(a5)
    800043e4:	000780e7          	jalr	a5
    800043e8:	fd5ff06f          	j	800043bc <_Z29producerConsumer_CPP_Sync_APIv+0x24c>
    }
    delete consumerThread;
    800043ec:	000a0a63          	beqz	s4,80004400 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
    800043f0:	000a3783          	ld	a5,0(s4)
    800043f4:	0087b783          	ld	a5,8(a5)
    800043f8:	000a0513          	mv	a0,s4
    800043fc:	000780e7          	jalr	a5
    delete waitForAll;
    80004400:	00006517          	auipc	a0,0x6
    80004404:	f2053503          	ld	a0,-224(a0) # 8000a320 <_ZL10waitForAll>
    80004408:	00050863          	beqz	a0,80004418 <_Z29producerConsumer_CPP_Sync_APIv+0x2a8>
    8000440c:	00053783          	ld	a5,0(a0)
    80004410:	0087b783          	ld	a5,8(a5)
    80004414:	000780e7          	jalr	a5
    delete buffer;
    80004418:	00098e63          	beqz	s3,80004434 <_Z29producerConsumer_CPP_Sync_APIv+0x2c4>
    8000441c:	00098513          	mv	a0,s3
    80004420:	00001097          	auipc	ra,0x1
    80004424:	890080e7          	jalr	-1904(ra) # 80004cb0 <_ZN9BufferCPPD1Ev>
    80004428:	00098513          	mv	a0,s3
    8000442c:	ffffd097          	auipc	ra,0xffffd
    80004430:	5d0080e7          	jalr	1488(ra) # 800019fc <_ZdlPv>

}
    80004434:	0f813083          	ld	ra,248(sp)
    80004438:	0f013403          	ld	s0,240(sp)
    8000443c:	0e813483          	ld	s1,232(sp)
    80004440:	0e013903          	ld	s2,224(sp)
    80004444:	0d813983          	ld	s3,216(sp)
    80004448:	0d013a03          	ld	s4,208(sp)
    8000444c:	0c813a83          	ld	s5,200(sp)
    80004450:	10010113          	addi	sp,sp,256
    80004454:	00008067          	ret
    80004458:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000445c:	00098513          	mv	a0,s3
    80004460:	ffffd097          	auipc	ra,0xffffd
    80004464:	59c080e7          	jalr	1436(ra) # 800019fc <_ZdlPv>
    80004468:	00048513          	mv	a0,s1
    8000446c:	00007097          	auipc	ra,0x7
    80004470:	f9c080e7          	jalr	-100(ra) # 8000b408 <_Unwind_Resume>
    80004474:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004478:	00048513          	mv	a0,s1
    8000447c:	ffffd097          	auipc	ra,0xffffd
    80004480:	580080e7          	jalr	1408(ra) # 800019fc <_ZdlPv>
    80004484:	00090513          	mv	a0,s2
    80004488:	00007097          	auipc	ra,0x7
    8000448c:	f80080e7          	jalr	-128(ra) # 8000b408 <_Unwind_Resume>
    80004490:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004494:	000a0513          	mv	a0,s4
    80004498:	ffffd097          	auipc	ra,0xffffd
    8000449c:	564080e7          	jalr	1380(ra) # 800019fc <_ZdlPv>
    800044a0:	00048513          	mv	a0,s1
    800044a4:	00007097          	auipc	ra,0x7
    800044a8:	f64080e7          	jalr	-156(ra) # 8000b408 <_Unwind_Resume>
    800044ac:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800044b0:	00090513          	mv	a0,s2
    800044b4:	ffffd097          	auipc	ra,0xffffd
    800044b8:	548080e7          	jalr	1352(ra) # 800019fc <_ZdlPv>
    800044bc:	00048513          	mv	a0,s1
    800044c0:	00007097          	auipc	ra,0x7
    800044c4:	f48080e7          	jalr	-184(ra) # 8000b408 <_Unwind_Resume>
    800044c8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800044cc:	00090513          	mv	a0,s2
    800044d0:	ffffd097          	auipc	ra,0xffffd
    800044d4:	52c080e7          	jalr	1324(ra) # 800019fc <_ZdlPv>
    800044d8:	00048513          	mv	a0,s1
    800044dc:	00007097          	auipc	ra,0x7
    800044e0:	f2c080e7          	jalr	-212(ra) # 8000b408 <_Unwind_Resume>

00000000800044e4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800044e4:	ff010113          	addi	sp,sp,-16
    800044e8:	00113423          	sd	ra,8(sp)
    800044ec:	00813023          	sd	s0,0(sp)
    800044f0:	01010413          	addi	s0,sp,16
    800044f4:	00006797          	auipc	a5,0x6
    800044f8:	cec78793          	addi	a5,a5,-788 # 8000a1e0 <_ZTV12ConsumerSync+0x10>
    800044fc:	00f53023          	sd	a5,0(a0)
    80004500:	ffffd097          	auipc	ra,0xffffd
    80004504:	7c8080e7          	jalr	1992(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80004508:	00813083          	ld	ra,8(sp)
    8000450c:	00013403          	ld	s0,0(sp)
    80004510:	01010113          	addi	sp,sp,16
    80004514:	00008067          	ret

0000000080004518 <_ZN12ConsumerSyncD0Ev>:
    80004518:	fe010113          	addi	sp,sp,-32
    8000451c:	00113c23          	sd	ra,24(sp)
    80004520:	00813823          	sd	s0,16(sp)
    80004524:	00913423          	sd	s1,8(sp)
    80004528:	02010413          	addi	s0,sp,32
    8000452c:	00050493          	mv	s1,a0
    80004530:	00006797          	auipc	a5,0x6
    80004534:	cb078793          	addi	a5,a5,-848 # 8000a1e0 <_ZTV12ConsumerSync+0x10>
    80004538:	00f53023          	sd	a5,0(a0)
    8000453c:	ffffd097          	auipc	ra,0xffffd
    80004540:	78c080e7          	jalr	1932(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80004544:	00048513          	mv	a0,s1
    80004548:	ffffd097          	auipc	ra,0xffffd
    8000454c:	4b4080e7          	jalr	1204(ra) # 800019fc <_ZdlPv>
    80004550:	01813083          	ld	ra,24(sp)
    80004554:	01013403          	ld	s0,16(sp)
    80004558:	00813483          	ld	s1,8(sp)
    8000455c:	02010113          	addi	sp,sp,32
    80004560:	00008067          	ret

0000000080004564 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004564:	ff010113          	addi	sp,sp,-16
    80004568:	00113423          	sd	ra,8(sp)
    8000456c:	00813023          	sd	s0,0(sp)
    80004570:	01010413          	addi	s0,sp,16
    80004574:	00006797          	auipc	a5,0x6
    80004578:	c4478793          	addi	a5,a5,-956 # 8000a1b8 <_ZTV12ProducerSync+0x10>
    8000457c:	00f53023          	sd	a5,0(a0)
    80004580:	ffffd097          	auipc	ra,0xffffd
    80004584:	748080e7          	jalr	1864(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80004588:	00813083          	ld	ra,8(sp)
    8000458c:	00013403          	ld	s0,0(sp)
    80004590:	01010113          	addi	sp,sp,16
    80004594:	00008067          	ret

0000000080004598 <_ZN12ProducerSyncD0Ev>:
    80004598:	fe010113          	addi	sp,sp,-32
    8000459c:	00113c23          	sd	ra,24(sp)
    800045a0:	00813823          	sd	s0,16(sp)
    800045a4:	00913423          	sd	s1,8(sp)
    800045a8:	02010413          	addi	s0,sp,32
    800045ac:	00050493          	mv	s1,a0
    800045b0:	00006797          	auipc	a5,0x6
    800045b4:	c0878793          	addi	a5,a5,-1016 # 8000a1b8 <_ZTV12ProducerSync+0x10>
    800045b8:	00f53023          	sd	a5,0(a0)
    800045bc:	ffffd097          	auipc	ra,0xffffd
    800045c0:	70c080e7          	jalr	1804(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    800045c4:	00048513          	mv	a0,s1
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	434080e7          	jalr	1076(ra) # 800019fc <_ZdlPv>
    800045d0:	01813083          	ld	ra,24(sp)
    800045d4:	01013403          	ld	s0,16(sp)
    800045d8:	00813483          	ld	s1,8(sp)
    800045dc:	02010113          	addi	sp,sp,32
    800045e0:	00008067          	ret

00000000800045e4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800045e4:	ff010113          	addi	sp,sp,-16
    800045e8:	00113423          	sd	ra,8(sp)
    800045ec:	00813023          	sd	s0,0(sp)
    800045f0:	01010413          	addi	s0,sp,16
    800045f4:	00006797          	auipc	a5,0x6
    800045f8:	b9c78793          	addi	a5,a5,-1124 # 8000a190 <_ZTV16ProducerKeyboard+0x10>
    800045fc:	00f53023          	sd	a5,0(a0)
    80004600:	ffffd097          	auipc	ra,0xffffd
    80004604:	6c8080e7          	jalr	1736(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80004608:	00813083          	ld	ra,8(sp)
    8000460c:	00013403          	ld	s0,0(sp)
    80004610:	01010113          	addi	sp,sp,16
    80004614:	00008067          	ret

0000000080004618 <_ZN16ProducerKeyboardD0Ev>:
    80004618:	fe010113          	addi	sp,sp,-32
    8000461c:	00113c23          	sd	ra,24(sp)
    80004620:	00813823          	sd	s0,16(sp)
    80004624:	00913423          	sd	s1,8(sp)
    80004628:	02010413          	addi	s0,sp,32
    8000462c:	00050493          	mv	s1,a0
    80004630:	00006797          	auipc	a5,0x6
    80004634:	b6078793          	addi	a5,a5,-1184 # 8000a190 <_ZTV16ProducerKeyboard+0x10>
    80004638:	00f53023          	sd	a5,0(a0)
    8000463c:	ffffd097          	auipc	ra,0xffffd
    80004640:	68c080e7          	jalr	1676(ra) # 80001cc8 <_ZN6ThreadD1Ev>
    80004644:	00048513          	mv	a0,s1
    80004648:	ffffd097          	auipc	ra,0xffffd
    8000464c:	3b4080e7          	jalr	948(ra) # 800019fc <_ZdlPv>
    80004650:	01813083          	ld	ra,24(sp)
    80004654:	01013403          	ld	s0,16(sp)
    80004658:	00813483          	ld	s1,8(sp)
    8000465c:	02010113          	addi	sp,sp,32
    80004660:	00008067          	ret

0000000080004664 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004664:	ff010113          	addi	sp,sp,-16
    80004668:	00113423          	sd	ra,8(sp)
    8000466c:	00813023          	sd	s0,0(sp)
    80004670:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004674:	02053583          	ld	a1,32(a0)
    80004678:	00000097          	auipc	ra,0x0
    8000467c:	8a8080e7          	jalr	-1880(ra) # 80003f20 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004680:	00813083          	ld	ra,8(sp)
    80004684:	00013403          	ld	s0,0(sp)
    80004688:	01010113          	addi	sp,sp,16
    8000468c:	00008067          	ret

0000000080004690 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004690:	ff010113          	addi	sp,sp,-16
    80004694:	00113423          	sd	ra,8(sp)
    80004698:	00813023          	sd	s0,0(sp)
    8000469c:	01010413          	addi	s0,sp,16
        producer(td);
    800046a0:	02053583          	ld	a1,32(a0)
    800046a4:	00000097          	auipc	ra,0x0
    800046a8:	944080e7          	jalr	-1724(ra) # 80003fe8 <_ZN12ProducerSync8producerEPv>
    }
    800046ac:	00813083          	ld	ra,8(sp)
    800046b0:	00013403          	ld	s0,0(sp)
    800046b4:	01010113          	addi	sp,sp,16
    800046b8:	00008067          	ret

00000000800046bc <_ZN12ConsumerSync3runEv>:
    void run() override {
    800046bc:	ff010113          	addi	sp,sp,-16
    800046c0:	00113423          	sd	ra,8(sp)
    800046c4:	00813023          	sd	s0,0(sp)
    800046c8:	01010413          	addi	s0,sp,16
        consumer(td);
    800046cc:	02053583          	ld	a1,32(a0)
    800046d0:	00000097          	auipc	ra,0x0
    800046d4:	9ac080e7          	jalr	-1620(ra) # 8000407c <_ZN12ConsumerSync8consumerEPv>
    }
    800046d8:	00813083          	ld	ra,8(sp)
    800046dc:	00013403          	ld	s0,0(sp)
    800046e0:	01010113          	addi	sp,sp,16
    800046e4:	00008067          	ret

00000000800046e8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800046e8:	fe010113          	addi	sp,sp,-32
    800046ec:	00113c23          	sd	ra,24(sp)
    800046f0:	00813823          	sd	s0,16(sp)
    800046f4:	00913423          	sd	s1,8(sp)
    800046f8:	02010413          	addi	s0,sp,32
    800046fc:	00050493          	mv	s1,a0
    LOCK();
    80004700:	00100613          	li	a2,1
    80004704:	00000593          	li	a1,0
    80004708:	00006517          	auipc	a0,0x6
    8000470c:	c2050513          	addi	a0,a0,-992 # 8000a328 <lockPrint>
    80004710:	ffffd097          	auipc	ra,0xffffd
    80004714:	c78080e7          	jalr	-904(ra) # 80001388 <copy_and_swap>
    80004718:	00050863          	beqz	a0,80004728 <_Z11printStringPKc+0x40>
    8000471c:	ffffd097          	auipc	ra,0xffffd
    80004720:	084080e7          	jalr	132(ra) # 800017a0 <_Z15thread_dispatchv>
    80004724:	fddff06f          	j	80004700 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004728:	0004c503          	lbu	a0,0(s1)
    8000472c:	00050a63          	beqz	a0,80004740 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004730:	ffffd097          	auipc	ra,0xffffd
    80004734:	210080e7          	jalr	528(ra) # 80001940 <_Z4putcc>
        string++;
    80004738:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000473c:	fedff06f          	j	80004728 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004740:	00000613          	li	a2,0
    80004744:	00100593          	li	a1,1
    80004748:	00006517          	auipc	a0,0x6
    8000474c:	be050513          	addi	a0,a0,-1056 # 8000a328 <lockPrint>
    80004750:	ffffd097          	auipc	ra,0xffffd
    80004754:	c38080e7          	jalr	-968(ra) # 80001388 <copy_and_swap>
    80004758:	fe0514e3          	bnez	a0,80004740 <_Z11printStringPKc+0x58>
}
    8000475c:	01813083          	ld	ra,24(sp)
    80004760:	01013403          	ld	s0,16(sp)
    80004764:	00813483          	ld	s1,8(sp)
    80004768:	02010113          	addi	sp,sp,32
    8000476c:	00008067          	ret

0000000080004770 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004770:	fd010113          	addi	sp,sp,-48
    80004774:	02113423          	sd	ra,40(sp)
    80004778:	02813023          	sd	s0,32(sp)
    8000477c:	00913c23          	sd	s1,24(sp)
    80004780:	01213823          	sd	s2,16(sp)
    80004784:	01313423          	sd	s3,8(sp)
    80004788:	01413023          	sd	s4,0(sp)
    8000478c:	03010413          	addi	s0,sp,48
    80004790:	00050993          	mv	s3,a0
    80004794:	00058a13          	mv	s4,a1
    LOCK();
    80004798:	00100613          	li	a2,1
    8000479c:	00000593          	li	a1,0
    800047a0:	00006517          	auipc	a0,0x6
    800047a4:	b8850513          	addi	a0,a0,-1144 # 8000a328 <lockPrint>
    800047a8:	ffffd097          	auipc	ra,0xffffd
    800047ac:	be0080e7          	jalr	-1056(ra) # 80001388 <copy_and_swap>
    800047b0:	00050863          	beqz	a0,800047c0 <_Z9getStringPci+0x50>
    800047b4:	ffffd097          	auipc	ra,0xffffd
    800047b8:	fec080e7          	jalr	-20(ra) # 800017a0 <_Z15thread_dispatchv>
    800047bc:	fddff06f          	j	80004798 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800047c0:	00000913          	li	s2,0
    800047c4:	00090493          	mv	s1,s2
    800047c8:	0019091b          	addiw	s2,s2,1
    800047cc:	03495a63          	bge	s2,s4,80004800 <_Z9getStringPci+0x90>
        cc = getc();
    800047d0:	ffffd097          	auipc	ra,0xffffd
    800047d4:	148080e7          	jalr	328(ra) # 80001918 <_Z4getcv>
        if(cc < 1)
    800047d8:	02050463          	beqz	a0,80004800 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800047dc:	009984b3          	add	s1,s3,s1
    800047e0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800047e4:	00a00793          	li	a5,10
    800047e8:	00f50a63          	beq	a0,a5,800047fc <_Z9getStringPci+0x8c>
    800047ec:	00d00793          	li	a5,13
    800047f0:	fcf51ae3          	bne	a0,a5,800047c4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800047f4:	00090493          	mv	s1,s2
    800047f8:	0080006f          	j	80004800 <_Z9getStringPci+0x90>
    800047fc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004800:	009984b3          	add	s1,s3,s1
    80004804:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004808:	00000613          	li	a2,0
    8000480c:	00100593          	li	a1,1
    80004810:	00006517          	auipc	a0,0x6
    80004814:	b1850513          	addi	a0,a0,-1256 # 8000a328 <lockPrint>
    80004818:	ffffd097          	auipc	ra,0xffffd
    8000481c:	b70080e7          	jalr	-1168(ra) # 80001388 <copy_and_swap>
    80004820:	fe0514e3          	bnez	a0,80004808 <_Z9getStringPci+0x98>
    return buf;
}
    80004824:	00098513          	mv	a0,s3
    80004828:	02813083          	ld	ra,40(sp)
    8000482c:	02013403          	ld	s0,32(sp)
    80004830:	01813483          	ld	s1,24(sp)
    80004834:	01013903          	ld	s2,16(sp)
    80004838:	00813983          	ld	s3,8(sp)
    8000483c:	00013a03          	ld	s4,0(sp)
    80004840:	03010113          	addi	sp,sp,48
    80004844:	00008067          	ret

0000000080004848 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004848:	ff010113          	addi	sp,sp,-16
    8000484c:	00813423          	sd	s0,8(sp)
    80004850:	01010413          	addi	s0,sp,16
    80004854:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004858:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000485c:	0006c603          	lbu	a2,0(a3)
    80004860:	fd06071b          	addiw	a4,a2,-48
    80004864:	0ff77713          	andi	a4,a4,255
    80004868:	00900793          	li	a5,9
    8000486c:	02e7e063          	bltu	a5,a4,8000488c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004870:	0025179b          	slliw	a5,a0,0x2
    80004874:	00a787bb          	addw	a5,a5,a0
    80004878:	0017979b          	slliw	a5,a5,0x1
    8000487c:	00168693          	addi	a3,a3,1
    80004880:	00c787bb          	addw	a5,a5,a2
    80004884:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004888:	fd5ff06f          	j	8000485c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000488c:	00813403          	ld	s0,8(sp)
    80004890:	01010113          	addi	sp,sp,16
    80004894:	00008067          	ret

0000000080004898 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004898:	fc010113          	addi	sp,sp,-64
    8000489c:	02113c23          	sd	ra,56(sp)
    800048a0:	02813823          	sd	s0,48(sp)
    800048a4:	02913423          	sd	s1,40(sp)
    800048a8:	03213023          	sd	s2,32(sp)
    800048ac:	01313c23          	sd	s3,24(sp)
    800048b0:	04010413          	addi	s0,sp,64
    800048b4:	00050493          	mv	s1,a0
    800048b8:	00058913          	mv	s2,a1
    800048bc:	00060993          	mv	s3,a2
    LOCK();
    800048c0:	00100613          	li	a2,1
    800048c4:	00000593          	li	a1,0
    800048c8:	00006517          	auipc	a0,0x6
    800048cc:	a6050513          	addi	a0,a0,-1440 # 8000a328 <lockPrint>
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	ab8080e7          	jalr	-1352(ra) # 80001388 <copy_and_swap>
    800048d8:	00050863          	beqz	a0,800048e8 <_Z8printIntiii+0x50>
    800048dc:	ffffd097          	auipc	ra,0xffffd
    800048e0:	ec4080e7          	jalr	-316(ra) # 800017a0 <_Z15thread_dispatchv>
    800048e4:	fddff06f          	j	800048c0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800048e8:	00098463          	beqz	s3,800048f0 <_Z8printIntiii+0x58>
    800048ec:	0804c463          	bltz	s1,80004974 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800048f0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800048f4:	00000593          	li	a1,0
    }

    i = 0;
    800048f8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800048fc:	0009079b          	sext.w	a5,s2
    80004900:	0325773b          	remuw	a4,a0,s2
    80004904:	00048613          	mv	a2,s1
    80004908:	0014849b          	addiw	s1,s1,1
    8000490c:	02071693          	slli	a3,a4,0x20
    80004910:	0206d693          	srli	a3,a3,0x20
    80004914:	00006717          	auipc	a4,0x6
    80004918:	8e470713          	addi	a4,a4,-1820 # 8000a1f8 <digits>
    8000491c:	00d70733          	add	a4,a4,a3
    80004920:	00074683          	lbu	a3,0(a4)
    80004924:	fd040713          	addi	a4,s0,-48
    80004928:	00c70733          	add	a4,a4,a2
    8000492c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004930:	0005071b          	sext.w	a4,a0
    80004934:	0325553b          	divuw	a0,a0,s2
    80004938:	fcf772e3          	bgeu	a4,a5,800048fc <_Z8printIntiii+0x64>
    if(neg)
    8000493c:	00058c63          	beqz	a1,80004954 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004940:	fd040793          	addi	a5,s0,-48
    80004944:	009784b3          	add	s1,a5,s1
    80004948:	02d00793          	li	a5,45
    8000494c:	fef48823          	sb	a5,-16(s1)
    80004950:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004954:	fff4849b          	addiw	s1,s1,-1
    80004958:	0204c463          	bltz	s1,80004980 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    8000495c:	fd040793          	addi	a5,s0,-48
    80004960:	009787b3          	add	a5,a5,s1
    80004964:	ff07c503          	lbu	a0,-16(a5)
    80004968:	ffffd097          	auipc	ra,0xffffd
    8000496c:	fd8080e7          	jalr	-40(ra) # 80001940 <_Z4putcc>
    80004970:	fe5ff06f          	j	80004954 <_Z8printIntiii+0xbc>
        x = -xx;
    80004974:	4090053b          	negw	a0,s1
        neg = 1;
    80004978:	00100593          	li	a1,1
        x = -xx;
    8000497c:	f7dff06f          	j	800048f8 <_Z8printIntiii+0x60>

    UNLOCK();
    80004980:	00000613          	li	a2,0
    80004984:	00100593          	li	a1,1
    80004988:	00006517          	auipc	a0,0x6
    8000498c:	9a050513          	addi	a0,a0,-1632 # 8000a328 <lockPrint>
    80004990:	ffffd097          	auipc	ra,0xffffd
    80004994:	9f8080e7          	jalr	-1544(ra) # 80001388 <copy_and_swap>
    80004998:	fe0514e3          	bnez	a0,80004980 <_Z8printIntiii+0xe8>
    8000499c:	03813083          	ld	ra,56(sp)
    800049a0:	03013403          	ld	s0,48(sp)
    800049a4:	02813483          	ld	s1,40(sp)
    800049a8:	02013903          	ld	s2,32(sp)
    800049ac:	01813983          	ld	s3,24(sp)
    800049b0:	04010113          	addi	sp,sp,64
    800049b4:	00008067          	ret

00000000800049b8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800049b8:	fd010113          	addi	sp,sp,-48
    800049bc:	02113423          	sd	ra,40(sp)
    800049c0:	02813023          	sd	s0,32(sp)
    800049c4:	00913c23          	sd	s1,24(sp)
    800049c8:	01213823          	sd	s2,16(sp)
    800049cc:	01313423          	sd	s3,8(sp)
    800049d0:	03010413          	addi	s0,sp,48
    800049d4:	00050493          	mv	s1,a0
    800049d8:	00058913          	mv	s2,a1
    800049dc:	0015879b          	addiw	a5,a1,1
    800049e0:	0007851b          	sext.w	a0,a5
    800049e4:	00f4a023          	sw	a5,0(s1)
    800049e8:	0004a823          	sw	zero,16(s1)
    800049ec:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800049f0:	00251513          	slli	a0,a0,0x2
    800049f4:	ffffd097          	auipc	ra,0xffffd
    800049f8:	c54080e7          	jalr	-940(ra) # 80001648 <_Z9mem_allocm>
    800049fc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004a00:	01000513          	li	a0,16
    80004a04:	ffffd097          	auipc	ra,0xffffd
    80004a08:	fa8080e7          	jalr	-88(ra) # 800019ac <_Znwm>
    80004a0c:	00050993          	mv	s3,a0
    80004a10:	00000593          	li	a1,0
    80004a14:	ffffd097          	auipc	ra,0xffffd
    80004a18:	4b4080e7          	jalr	1204(ra) # 80001ec8 <_ZN9SemaphoreC1Ej>
    80004a1c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004a20:	01000513          	li	a0,16
    80004a24:	ffffd097          	auipc	ra,0xffffd
    80004a28:	f88080e7          	jalr	-120(ra) # 800019ac <_Znwm>
    80004a2c:	00050993          	mv	s3,a0
    80004a30:	00090593          	mv	a1,s2
    80004a34:	ffffd097          	auipc	ra,0xffffd
    80004a38:	494080e7          	jalr	1172(ra) # 80001ec8 <_ZN9SemaphoreC1Ej>
    80004a3c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004a40:	01000513          	li	a0,16
    80004a44:	ffffd097          	auipc	ra,0xffffd
    80004a48:	f68080e7          	jalr	-152(ra) # 800019ac <_Znwm>
    80004a4c:	00050913          	mv	s2,a0
    80004a50:	00100593          	li	a1,1
    80004a54:	ffffd097          	auipc	ra,0xffffd
    80004a58:	474080e7          	jalr	1140(ra) # 80001ec8 <_ZN9SemaphoreC1Ej>
    80004a5c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004a60:	01000513          	li	a0,16
    80004a64:	ffffd097          	auipc	ra,0xffffd
    80004a68:	f48080e7          	jalr	-184(ra) # 800019ac <_Znwm>
    80004a6c:	00050913          	mv	s2,a0
    80004a70:	00100593          	li	a1,1
    80004a74:	ffffd097          	auipc	ra,0xffffd
    80004a78:	454080e7          	jalr	1108(ra) # 80001ec8 <_ZN9SemaphoreC1Ej>
    80004a7c:	0324b823          	sd	s2,48(s1)
}
    80004a80:	02813083          	ld	ra,40(sp)
    80004a84:	02013403          	ld	s0,32(sp)
    80004a88:	01813483          	ld	s1,24(sp)
    80004a8c:	01013903          	ld	s2,16(sp)
    80004a90:	00813983          	ld	s3,8(sp)
    80004a94:	03010113          	addi	sp,sp,48
    80004a98:	00008067          	ret
    80004a9c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004aa0:	00098513          	mv	a0,s3
    80004aa4:	ffffd097          	auipc	ra,0xffffd
    80004aa8:	f58080e7          	jalr	-168(ra) # 800019fc <_ZdlPv>
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	00007097          	auipc	ra,0x7
    80004ab4:	958080e7          	jalr	-1704(ra) # 8000b408 <_Unwind_Resume>
    80004ab8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004abc:	00098513          	mv	a0,s3
    80004ac0:	ffffd097          	auipc	ra,0xffffd
    80004ac4:	f3c080e7          	jalr	-196(ra) # 800019fc <_ZdlPv>
    80004ac8:	00048513          	mv	a0,s1
    80004acc:	00007097          	auipc	ra,0x7
    80004ad0:	93c080e7          	jalr	-1732(ra) # 8000b408 <_Unwind_Resume>
    80004ad4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004ad8:	00090513          	mv	a0,s2
    80004adc:	ffffd097          	auipc	ra,0xffffd
    80004ae0:	f20080e7          	jalr	-224(ra) # 800019fc <_ZdlPv>
    80004ae4:	00048513          	mv	a0,s1
    80004ae8:	00007097          	auipc	ra,0x7
    80004aec:	920080e7          	jalr	-1760(ra) # 8000b408 <_Unwind_Resume>
    80004af0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004af4:	00090513          	mv	a0,s2
    80004af8:	ffffd097          	auipc	ra,0xffffd
    80004afc:	f04080e7          	jalr	-252(ra) # 800019fc <_ZdlPv>
    80004b00:	00048513          	mv	a0,s1
    80004b04:	00007097          	auipc	ra,0x7
    80004b08:	904080e7          	jalr	-1788(ra) # 8000b408 <_Unwind_Resume>

0000000080004b0c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004b0c:	fe010113          	addi	sp,sp,-32
    80004b10:	00113c23          	sd	ra,24(sp)
    80004b14:	00813823          	sd	s0,16(sp)
    80004b18:	00913423          	sd	s1,8(sp)
    80004b1c:	01213023          	sd	s2,0(sp)
    80004b20:	02010413          	addi	s0,sp,32
    80004b24:	00050493          	mv	s1,a0
    80004b28:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004b2c:	01853503          	ld	a0,24(a0)
    80004b30:	ffffd097          	auipc	ra,0xffffd
    80004b34:	3d0080e7          	jalr	976(ra) # 80001f00 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004b38:	0304b503          	ld	a0,48(s1)
    80004b3c:	ffffd097          	auipc	ra,0xffffd
    80004b40:	3c4080e7          	jalr	964(ra) # 80001f00 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004b44:	0084b783          	ld	a5,8(s1)
    80004b48:	0144a703          	lw	a4,20(s1)
    80004b4c:	00271713          	slli	a4,a4,0x2
    80004b50:	00e787b3          	add	a5,a5,a4
    80004b54:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004b58:	0144a783          	lw	a5,20(s1)
    80004b5c:	0017879b          	addiw	a5,a5,1
    80004b60:	0004a703          	lw	a4,0(s1)
    80004b64:	02e7e7bb          	remw	a5,a5,a4
    80004b68:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004b6c:	0304b503          	ld	a0,48(s1)
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	3bc080e7          	jalr	956(ra) # 80001f2c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004b78:	0204b503          	ld	a0,32(s1)
    80004b7c:	ffffd097          	auipc	ra,0xffffd
    80004b80:	3b0080e7          	jalr	944(ra) # 80001f2c <_ZN9Semaphore6signalEv>

}
    80004b84:	01813083          	ld	ra,24(sp)
    80004b88:	01013403          	ld	s0,16(sp)
    80004b8c:	00813483          	ld	s1,8(sp)
    80004b90:	00013903          	ld	s2,0(sp)
    80004b94:	02010113          	addi	sp,sp,32
    80004b98:	00008067          	ret

0000000080004b9c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004b9c:	fe010113          	addi	sp,sp,-32
    80004ba0:	00113c23          	sd	ra,24(sp)
    80004ba4:	00813823          	sd	s0,16(sp)
    80004ba8:	00913423          	sd	s1,8(sp)
    80004bac:	01213023          	sd	s2,0(sp)
    80004bb0:	02010413          	addi	s0,sp,32
    80004bb4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004bb8:	02053503          	ld	a0,32(a0)
    80004bbc:	ffffd097          	auipc	ra,0xffffd
    80004bc0:	344080e7          	jalr	836(ra) # 80001f00 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004bc4:	0284b503          	ld	a0,40(s1)
    80004bc8:	ffffd097          	auipc	ra,0xffffd
    80004bcc:	338080e7          	jalr	824(ra) # 80001f00 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80004bd0:	0084b703          	ld	a4,8(s1)
    80004bd4:	0104a783          	lw	a5,16(s1)
    80004bd8:	00279693          	slli	a3,a5,0x2
    80004bdc:	00d70733          	add	a4,a4,a3
    80004be0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004be4:	0017879b          	addiw	a5,a5,1
    80004be8:	0004a703          	lw	a4,0(s1)
    80004bec:	02e7e7bb          	remw	a5,a5,a4
    80004bf0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004bf4:	0284b503          	ld	a0,40(s1)
    80004bf8:	ffffd097          	auipc	ra,0xffffd
    80004bfc:	334080e7          	jalr	820(ra) # 80001f2c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004c00:	0184b503          	ld	a0,24(s1)
    80004c04:	ffffd097          	auipc	ra,0xffffd
    80004c08:	328080e7          	jalr	808(ra) # 80001f2c <_ZN9Semaphore6signalEv>

    return ret;
}
    80004c0c:	00090513          	mv	a0,s2
    80004c10:	01813083          	ld	ra,24(sp)
    80004c14:	01013403          	ld	s0,16(sp)
    80004c18:	00813483          	ld	s1,8(sp)
    80004c1c:	00013903          	ld	s2,0(sp)
    80004c20:	02010113          	addi	sp,sp,32
    80004c24:	00008067          	ret

0000000080004c28 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004c28:	fe010113          	addi	sp,sp,-32
    80004c2c:	00113c23          	sd	ra,24(sp)
    80004c30:	00813823          	sd	s0,16(sp)
    80004c34:	00913423          	sd	s1,8(sp)
    80004c38:	01213023          	sd	s2,0(sp)
    80004c3c:	02010413          	addi	s0,sp,32
    80004c40:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004c44:	02853503          	ld	a0,40(a0)
    80004c48:	ffffd097          	auipc	ra,0xffffd
    80004c4c:	2b8080e7          	jalr	696(ra) # 80001f00 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004c50:	0304b503          	ld	a0,48(s1)
    80004c54:	ffffd097          	auipc	ra,0xffffd
    80004c58:	2ac080e7          	jalr	684(ra) # 80001f00 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004c5c:	0144a783          	lw	a5,20(s1)
    80004c60:	0104a903          	lw	s2,16(s1)
    80004c64:	0327ce63          	blt	a5,s2,80004ca0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004c68:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004c6c:	0304b503          	ld	a0,48(s1)
    80004c70:	ffffd097          	auipc	ra,0xffffd
    80004c74:	2bc080e7          	jalr	700(ra) # 80001f2c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004c78:	0284b503          	ld	a0,40(s1)
    80004c7c:	ffffd097          	auipc	ra,0xffffd
    80004c80:	2b0080e7          	jalr	688(ra) # 80001f2c <_ZN9Semaphore6signalEv>

    return ret;
}
    80004c84:	00090513          	mv	a0,s2
    80004c88:	01813083          	ld	ra,24(sp)
    80004c8c:	01013403          	ld	s0,16(sp)
    80004c90:	00813483          	ld	s1,8(sp)
    80004c94:	00013903          	ld	s2,0(sp)
    80004c98:	02010113          	addi	sp,sp,32
    80004c9c:	00008067          	ret
        ret = cap - head + tail;
    80004ca0:	0004a703          	lw	a4,0(s1)
    80004ca4:	4127093b          	subw	s2,a4,s2
    80004ca8:	00f9093b          	addw	s2,s2,a5
    80004cac:	fc1ff06f          	j	80004c6c <_ZN9BufferCPP6getCntEv+0x44>

0000000080004cb0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004cb0:	fe010113          	addi	sp,sp,-32
    80004cb4:	00113c23          	sd	ra,24(sp)
    80004cb8:	00813823          	sd	s0,16(sp)
    80004cbc:	00913423          	sd	s1,8(sp)
    80004cc0:	02010413          	addi	s0,sp,32
    80004cc4:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004cc8:	00a00513          	li	a0,10
    80004ccc:	ffffd097          	auipc	ra,0xffffd
    80004cd0:	2e0080e7          	jalr	736(ra) # 80001fac <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004cd4:	00004517          	auipc	a0,0x4
    80004cd8:	8a450513          	addi	a0,a0,-1884 # 80008578 <CONSOLE_STATUS+0x568>
    80004cdc:	00000097          	auipc	ra,0x0
    80004ce0:	a0c080e7          	jalr	-1524(ra) # 800046e8 <_Z11printStringPKc>
    while (getCnt()) {
    80004ce4:	00048513          	mv	a0,s1
    80004ce8:	00000097          	auipc	ra,0x0
    80004cec:	f40080e7          	jalr	-192(ra) # 80004c28 <_ZN9BufferCPP6getCntEv>
    80004cf0:	02050c63          	beqz	a0,80004d28 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004cf4:	0084b783          	ld	a5,8(s1)
    80004cf8:	0104a703          	lw	a4,16(s1)
    80004cfc:	00271713          	slli	a4,a4,0x2
    80004d00:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004d04:	0007c503          	lbu	a0,0(a5)
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	2a4080e7          	jalr	676(ra) # 80001fac <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004d10:	0104a783          	lw	a5,16(s1)
    80004d14:	0017879b          	addiw	a5,a5,1
    80004d18:	0004a703          	lw	a4,0(s1)
    80004d1c:	02e7e7bb          	remw	a5,a5,a4
    80004d20:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004d24:	fc1ff06f          	j	80004ce4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004d28:	02100513          	li	a0,33
    80004d2c:	ffffd097          	auipc	ra,0xffffd
    80004d30:	280080e7          	jalr	640(ra) # 80001fac <_ZN7Console4putcEc>
    Console::putc('\n');
    80004d34:	00a00513          	li	a0,10
    80004d38:	ffffd097          	auipc	ra,0xffffd
    80004d3c:	274080e7          	jalr	628(ra) # 80001fac <_ZN7Console4putcEc>
    mem_free(buffer);
    80004d40:	0084b503          	ld	a0,8(s1)
    80004d44:	ffffd097          	auipc	ra,0xffffd
    80004d48:	8d8080e7          	jalr	-1832(ra) # 8000161c <_Z8mem_freePv>
    delete itemAvailable;
    80004d4c:	0204b503          	ld	a0,32(s1)
    80004d50:	00050863          	beqz	a0,80004d60 <_ZN9BufferCPPD1Ev+0xb0>
    80004d54:	00053783          	ld	a5,0(a0)
    80004d58:	0087b783          	ld	a5,8(a5)
    80004d5c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004d60:	0184b503          	ld	a0,24(s1)
    80004d64:	00050863          	beqz	a0,80004d74 <_ZN9BufferCPPD1Ev+0xc4>
    80004d68:	00053783          	ld	a5,0(a0)
    80004d6c:	0087b783          	ld	a5,8(a5)
    80004d70:	000780e7          	jalr	a5
    delete mutexTail;
    80004d74:	0304b503          	ld	a0,48(s1)
    80004d78:	00050863          	beqz	a0,80004d88 <_ZN9BufferCPPD1Ev+0xd8>
    80004d7c:	00053783          	ld	a5,0(a0)
    80004d80:	0087b783          	ld	a5,8(a5)
    80004d84:	000780e7          	jalr	a5
    delete mutexHead;
    80004d88:	0284b503          	ld	a0,40(s1)
    80004d8c:	00050863          	beqz	a0,80004d9c <_ZN9BufferCPPD1Ev+0xec>
    80004d90:	00053783          	ld	a5,0(a0)
    80004d94:	0087b783          	ld	a5,8(a5)
    80004d98:	000780e7          	jalr	a5
}
    80004d9c:	01813083          	ld	ra,24(sp)
    80004da0:	01013403          	ld	s0,16(sp)
    80004da4:	00813483          	ld	s1,8(sp)
    80004da8:	02010113          	addi	sp,sp,32
    80004dac:	00008067          	ret

0000000080004db0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80004db0:	ff010113          	addi	sp,sp,-16
    80004db4:	00113423          	sd	ra,8(sp)
    80004db8:	00813023          	sd	s0,0(sp)
    80004dbc:	01010413          	addi	s0,sp,16
    printString("Unesite broj testa? [1-7]\n");
    80004dc0:	00003517          	auipc	a0,0x3
    80004dc4:	7d050513          	addi	a0,a0,2000 # 80008590 <CONSOLE_STATUS+0x580>
    80004dc8:	00000097          	auipc	ra,0x0
    80004dcc:	920080e7          	jalr	-1760(ra) # 800046e8 <_Z11printStringPKc>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
#endif
            break;
        case 4:
#if LEVEL_3_IMPLEMENTED == 1
            producerConsumer_CPP_Sync_API();
    80004dd0:	fffff097          	auipc	ra,0xfffff
    80004dd4:	3a0080e7          	jalr	928(ra) # 80004170 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80004dd8:	00003517          	auipc	a0,0x3
    80004ddc:	7d850513          	addi	a0,a0,2008 # 800085b0 <CONSOLE_STATUS+0x5a0>
    80004de0:	00000097          	auipc	ra,0x0
    80004de4:	908080e7          	jalr	-1784(ra) # 800046e8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80004de8:	00813083          	ld	ra,8(sp)
    80004dec:	00013403          	ld	s0,0(sp)
    80004df0:	01010113          	addi	sp,sp,16
    80004df4:	00008067          	ret

0000000080004df8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004df8:	fe010113          	addi	sp,sp,-32
    80004dfc:	00113c23          	sd	ra,24(sp)
    80004e00:	00813823          	sd	s0,16(sp)
    80004e04:	00913423          	sd	s1,8(sp)
    80004e08:	01213023          	sd	s2,0(sp)
    80004e0c:	02010413          	addi	s0,sp,32
    80004e10:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004e14:	00100793          	li	a5,1
    80004e18:	02a7f863          	bgeu	a5,a0,80004e48 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004e1c:	00a00793          	li	a5,10
    80004e20:	02f577b3          	remu	a5,a0,a5
    80004e24:	02078e63          	beqz	a5,80004e60 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004e28:	fff48513          	addi	a0,s1,-1
    80004e2c:	00000097          	auipc	ra,0x0
    80004e30:	fcc080e7          	jalr	-52(ra) # 80004df8 <_ZL9fibonaccim>
    80004e34:	00050913          	mv	s2,a0
    80004e38:	ffe48513          	addi	a0,s1,-2
    80004e3c:	00000097          	auipc	ra,0x0
    80004e40:	fbc080e7          	jalr	-68(ra) # 80004df8 <_ZL9fibonaccim>
    80004e44:	00a90533          	add	a0,s2,a0
}
    80004e48:	01813083          	ld	ra,24(sp)
    80004e4c:	01013403          	ld	s0,16(sp)
    80004e50:	00813483          	ld	s1,8(sp)
    80004e54:	00013903          	ld	s2,0(sp)
    80004e58:	02010113          	addi	sp,sp,32
    80004e5c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	940080e7          	jalr	-1728(ra) # 800017a0 <_Z15thread_dispatchv>
    80004e68:	fc1ff06f          	j	80004e28 <_ZL9fibonaccim+0x30>

0000000080004e6c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004e6c:	fe010113          	addi	sp,sp,-32
    80004e70:	00113c23          	sd	ra,24(sp)
    80004e74:	00813823          	sd	s0,16(sp)
    80004e78:	00913423          	sd	s1,8(sp)
    80004e7c:	01213023          	sd	s2,0(sp)
    80004e80:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004e84:	00a00493          	li	s1,10
    80004e88:	0400006f          	j	80004ec8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004e8c:	00003517          	auipc	a0,0x3
    80004e90:	61450513          	addi	a0,a0,1556 # 800084a0 <CONSOLE_STATUS+0x490>
    80004e94:	00000097          	auipc	ra,0x0
    80004e98:	854080e7          	jalr	-1964(ra) # 800046e8 <_Z11printStringPKc>
    80004e9c:	00000613          	li	a2,0
    80004ea0:	00a00593          	li	a1,10
    80004ea4:	00048513          	mv	a0,s1
    80004ea8:	00000097          	auipc	ra,0x0
    80004eac:	9f0080e7          	jalr	-1552(ra) # 80004898 <_Z8printIntiii>
    80004eb0:	00003517          	auipc	a0,0x3
    80004eb4:	4c850513          	addi	a0,a0,1224 # 80008378 <CONSOLE_STATUS+0x368>
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	830080e7          	jalr	-2000(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004ec0:	0014849b          	addiw	s1,s1,1
    80004ec4:	0ff4f493          	andi	s1,s1,255
    80004ec8:	00c00793          	li	a5,12
    80004ecc:	fc97f0e3          	bgeu	a5,s1,80004e8c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004ed0:	00003517          	auipc	a0,0x3
    80004ed4:	5d850513          	addi	a0,a0,1496 # 800084a8 <CONSOLE_STATUS+0x498>
    80004ed8:	00000097          	auipc	ra,0x0
    80004edc:	810080e7          	jalr	-2032(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004ee0:	00500313          	li	t1,5
    thread_dispatch();
    80004ee4:	ffffd097          	auipc	ra,0xffffd
    80004ee8:	8bc080e7          	jalr	-1860(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004eec:	01000513          	li	a0,16
    80004ef0:	00000097          	auipc	ra,0x0
    80004ef4:	f08080e7          	jalr	-248(ra) # 80004df8 <_ZL9fibonaccim>
    80004ef8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004efc:	00003517          	auipc	a0,0x3
    80004f00:	5bc50513          	addi	a0,a0,1468 # 800084b8 <CONSOLE_STATUS+0x4a8>
    80004f04:	fffff097          	auipc	ra,0xfffff
    80004f08:	7e4080e7          	jalr	2020(ra) # 800046e8 <_Z11printStringPKc>
    80004f0c:	00000613          	li	a2,0
    80004f10:	00a00593          	li	a1,10
    80004f14:	0009051b          	sext.w	a0,s2
    80004f18:	00000097          	auipc	ra,0x0
    80004f1c:	980080e7          	jalr	-1664(ra) # 80004898 <_Z8printIntiii>
    80004f20:	00003517          	auipc	a0,0x3
    80004f24:	45850513          	addi	a0,a0,1112 # 80008378 <CONSOLE_STATUS+0x368>
    80004f28:	fffff097          	auipc	ra,0xfffff
    80004f2c:	7c0080e7          	jalr	1984(ra) # 800046e8 <_Z11printStringPKc>
    80004f30:	0400006f          	j	80004f70 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f34:	00003517          	auipc	a0,0x3
    80004f38:	56c50513          	addi	a0,a0,1388 # 800084a0 <CONSOLE_STATUS+0x490>
    80004f3c:	fffff097          	auipc	ra,0xfffff
    80004f40:	7ac080e7          	jalr	1964(ra) # 800046e8 <_Z11printStringPKc>
    80004f44:	00000613          	li	a2,0
    80004f48:	00a00593          	li	a1,10
    80004f4c:	00048513          	mv	a0,s1
    80004f50:	00000097          	auipc	ra,0x0
    80004f54:	948080e7          	jalr	-1720(ra) # 80004898 <_Z8printIntiii>
    80004f58:	00003517          	auipc	a0,0x3
    80004f5c:	42050513          	addi	a0,a0,1056 # 80008378 <CONSOLE_STATUS+0x368>
    80004f60:	fffff097          	auipc	ra,0xfffff
    80004f64:	788080e7          	jalr	1928(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004f68:	0014849b          	addiw	s1,s1,1
    80004f6c:	0ff4f493          	andi	s1,s1,255
    80004f70:	00f00793          	li	a5,15
    80004f74:	fc97f0e3          	bgeu	a5,s1,80004f34 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004f78:	00003517          	auipc	a0,0x3
    80004f7c:	55050513          	addi	a0,a0,1360 # 800084c8 <CONSOLE_STATUS+0x4b8>
    80004f80:	fffff097          	auipc	ra,0xfffff
    80004f84:	768080e7          	jalr	1896(ra) # 800046e8 <_Z11printStringPKc>
    finishedD = true;
    80004f88:	00100793          	li	a5,1
    80004f8c:	00005717          	auipc	a4,0x5
    80004f90:	3af70223          	sb	a5,932(a4) # 8000a330 <_ZL9finishedD>
    thread_dispatch();
    80004f94:	ffffd097          	auipc	ra,0xffffd
    80004f98:	80c080e7          	jalr	-2036(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80004f9c:	01813083          	ld	ra,24(sp)
    80004fa0:	01013403          	ld	s0,16(sp)
    80004fa4:	00813483          	ld	s1,8(sp)
    80004fa8:	00013903          	ld	s2,0(sp)
    80004fac:	02010113          	addi	sp,sp,32
    80004fb0:	00008067          	ret

0000000080004fb4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004fb4:	fe010113          	addi	sp,sp,-32
    80004fb8:	00113c23          	sd	ra,24(sp)
    80004fbc:	00813823          	sd	s0,16(sp)
    80004fc0:	00913423          	sd	s1,8(sp)
    80004fc4:	01213023          	sd	s2,0(sp)
    80004fc8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004fcc:	00000493          	li	s1,0
    80004fd0:	0400006f          	j	80005010 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004fd4:	00003517          	auipc	a0,0x3
    80004fd8:	49c50513          	addi	a0,a0,1180 # 80008470 <CONSOLE_STATUS+0x460>
    80004fdc:	fffff097          	auipc	ra,0xfffff
    80004fe0:	70c080e7          	jalr	1804(ra) # 800046e8 <_Z11printStringPKc>
    80004fe4:	00000613          	li	a2,0
    80004fe8:	00a00593          	li	a1,10
    80004fec:	00048513          	mv	a0,s1
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	8a8080e7          	jalr	-1880(ra) # 80004898 <_Z8printIntiii>
    80004ff8:	00003517          	auipc	a0,0x3
    80004ffc:	38050513          	addi	a0,a0,896 # 80008378 <CONSOLE_STATUS+0x368>
    80005000:	fffff097          	auipc	ra,0xfffff
    80005004:	6e8080e7          	jalr	1768(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005008:	0014849b          	addiw	s1,s1,1
    8000500c:	0ff4f493          	andi	s1,s1,255
    80005010:	00200793          	li	a5,2
    80005014:	fc97f0e3          	bgeu	a5,s1,80004fd4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005018:	00003517          	auipc	a0,0x3
    8000501c:	46050513          	addi	a0,a0,1120 # 80008478 <CONSOLE_STATUS+0x468>
    80005020:	fffff097          	auipc	ra,0xfffff
    80005024:	6c8080e7          	jalr	1736(ra) # 800046e8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005028:	00700313          	li	t1,7
    thread_dispatch();
    8000502c:	ffffc097          	auipc	ra,0xffffc
    80005030:	774080e7          	jalr	1908(ra) # 800017a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005034:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005038:	00003517          	auipc	a0,0x3
    8000503c:	45050513          	addi	a0,a0,1104 # 80008488 <CONSOLE_STATUS+0x478>
    80005040:	fffff097          	auipc	ra,0xfffff
    80005044:	6a8080e7          	jalr	1704(ra) # 800046e8 <_Z11printStringPKc>
    80005048:	00000613          	li	a2,0
    8000504c:	00a00593          	li	a1,10
    80005050:	0009051b          	sext.w	a0,s2
    80005054:	00000097          	auipc	ra,0x0
    80005058:	844080e7          	jalr	-1980(ra) # 80004898 <_Z8printIntiii>
    8000505c:	00003517          	auipc	a0,0x3
    80005060:	31c50513          	addi	a0,a0,796 # 80008378 <CONSOLE_STATUS+0x368>
    80005064:	fffff097          	auipc	ra,0xfffff
    80005068:	684080e7          	jalr	1668(ra) # 800046e8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000506c:	00c00513          	li	a0,12
    80005070:	00000097          	auipc	ra,0x0
    80005074:	d88080e7          	jalr	-632(ra) # 80004df8 <_ZL9fibonaccim>
    80005078:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000507c:	00003517          	auipc	a0,0x3
    80005080:	41450513          	addi	a0,a0,1044 # 80008490 <CONSOLE_STATUS+0x480>
    80005084:	fffff097          	auipc	ra,0xfffff
    80005088:	664080e7          	jalr	1636(ra) # 800046e8 <_Z11printStringPKc>
    8000508c:	00000613          	li	a2,0
    80005090:	00a00593          	li	a1,10
    80005094:	0009051b          	sext.w	a0,s2
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	800080e7          	jalr	-2048(ra) # 80004898 <_Z8printIntiii>
    800050a0:	00003517          	auipc	a0,0x3
    800050a4:	2d850513          	addi	a0,a0,728 # 80008378 <CONSOLE_STATUS+0x368>
    800050a8:	fffff097          	auipc	ra,0xfffff
    800050ac:	640080e7          	jalr	1600(ra) # 800046e8 <_Z11printStringPKc>
    800050b0:	0400006f          	j	800050f0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800050b4:	00003517          	auipc	a0,0x3
    800050b8:	3bc50513          	addi	a0,a0,956 # 80008470 <CONSOLE_STATUS+0x460>
    800050bc:	fffff097          	auipc	ra,0xfffff
    800050c0:	62c080e7          	jalr	1580(ra) # 800046e8 <_Z11printStringPKc>
    800050c4:	00000613          	li	a2,0
    800050c8:	00a00593          	li	a1,10
    800050cc:	00048513          	mv	a0,s1
    800050d0:	fffff097          	auipc	ra,0xfffff
    800050d4:	7c8080e7          	jalr	1992(ra) # 80004898 <_Z8printIntiii>
    800050d8:	00003517          	auipc	a0,0x3
    800050dc:	2a050513          	addi	a0,a0,672 # 80008378 <CONSOLE_STATUS+0x368>
    800050e0:	fffff097          	auipc	ra,0xfffff
    800050e4:	608080e7          	jalr	1544(ra) # 800046e8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800050e8:	0014849b          	addiw	s1,s1,1
    800050ec:	0ff4f493          	andi	s1,s1,255
    800050f0:	00500793          	li	a5,5
    800050f4:	fc97f0e3          	bgeu	a5,s1,800050b4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800050f8:	00003517          	auipc	a0,0x3
    800050fc:	35050513          	addi	a0,a0,848 # 80008448 <CONSOLE_STATUS+0x438>
    80005100:	fffff097          	auipc	ra,0xfffff
    80005104:	5e8080e7          	jalr	1512(ra) # 800046e8 <_Z11printStringPKc>
    finishedC = true;
    80005108:	00100793          	li	a5,1
    8000510c:	00005717          	auipc	a4,0x5
    80005110:	22f702a3          	sb	a5,549(a4) # 8000a331 <_ZL9finishedC>
    thread_dispatch();
    80005114:	ffffc097          	auipc	ra,0xffffc
    80005118:	68c080e7          	jalr	1676(ra) # 800017a0 <_Z15thread_dispatchv>
}
    8000511c:	01813083          	ld	ra,24(sp)
    80005120:	01013403          	ld	s0,16(sp)
    80005124:	00813483          	ld	s1,8(sp)
    80005128:	00013903          	ld	s2,0(sp)
    8000512c:	02010113          	addi	sp,sp,32
    80005130:	00008067          	ret

0000000080005134 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005134:	fe010113          	addi	sp,sp,-32
    80005138:	00113c23          	sd	ra,24(sp)
    8000513c:	00813823          	sd	s0,16(sp)
    80005140:	00913423          	sd	s1,8(sp)
    80005144:	01213023          	sd	s2,0(sp)
    80005148:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000514c:	00000913          	li	s2,0
    80005150:	0400006f          	j	80005190 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005154:	ffffc097          	auipc	ra,0xffffc
    80005158:	64c080e7          	jalr	1612(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000515c:	00148493          	addi	s1,s1,1
    80005160:	000027b7          	lui	a5,0x2
    80005164:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005168:	0097ee63          	bltu	a5,s1,80005184 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000516c:	00000713          	li	a4,0
    80005170:	000077b7          	lui	a5,0x7
    80005174:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005178:	fce7eee3          	bltu	a5,a4,80005154 <_ZL11workerBodyBPv+0x20>
    8000517c:	00170713          	addi	a4,a4,1
    80005180:	ff1ff06f          	j	80005170 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005184:	00a00793          	li	a5,10
    80005188:	04f90663          	beq	s2,a5,800051d4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    8000518c:	00190913          	addi	s2,s2,1
    80005190:	00f00793          	li	a5,15
    80005194:	0527e463          	bltu	a5,s2,800051dc <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005198:	00003517          	auipc	a0,0x3
    8000519c:	2c050513          	addi	a0,a0,704 # 80008458 <CONSOLE_STATUS+0x448>
    800051a0:	fffff097          	auipc	ra,0xfffff
    800051a4:	548080e7          	jalr	1352(ra) # 800046e8 <_Z11printStringPKc>
    800051a8:	00000613          	li	a2,0
    800051ac:	00a00593          	li	a1,10
    800051b0:	0009051b          	sext.w	a0,s2
    800051b4:	fffff097          	auipc	ra,0xfffff
    800051b8:	6e4080e7          	jalr	1764(ra) # 80004898 <_Z8printIntiii>
    800051bc:	00003517          	auipc	a0,0x3
    800051c0:	1bc50513          	addi	a0,a0,444 # 80008378 <CONSOLE_STATUS+0x368>
    800051c4:	fffff097          	auipc	ra,0xfffff
    800051c8:	524080e7          	jalr	1316(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800051cc:	00000493          	li	s1,0
    800051d0:	f91ff06f          	j	80005160 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800051d4:	14102ff3          	csrr	t6,sepc
    800051d8:	fb5ff06f          	j	8000518c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800051dc:	00003517          	auipc	a0,0x3
    800051e0:	28450513          	addi	a0,a0,644 # 80008460 <CONSOLE_STATUS+0x450>
    800051e4:	fffff097          	auipc	ra,0xfffff
    800051e8:	504080e7          	jalr	1284(ra) # 800046e8 <_Z11printStringPKc>
    finishedB = true;
    800051ec:	00100793          	li	a5,1
    800051f0:	00005717          	auipc	a4,0x5
    800051f4:	14f70123          	sb	a5,322(a4) # 8000a332 <_ZL9finishedB>
    thread_dispatch();
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	5a8080e7          	jalr	1448(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80005200:	01813083          	ld	ra,24(sp)
    80005204:	01013403          	ld	s0,16(sp)
    80005208:	00813483          	ld	s1,8(sp)
    8000520c:	00013903          	ld	s2,0(sp)
    80005210:	02010113          	addi	sp,sp,32
    80005214:	00008067          	ret

0000000080005218 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005218:	fe010113          	addi	sp,sp,-32
    8000521c:	00113c23          	sd	ra,24(sp)
    80005220:	00813823          	sd	s0,16(sp)
    80005224:	00913423          	sd	s1,8(sp)
    80005228:	01213023          	sd	s2,0(sp)
    8000522c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005230:	00000913          	li	s2,0
    80005234:	0380006f          	j	8000526c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005238:	ffffc097          	auipc	ra,0xffffc
    8000523c:	568080e7          	jalr	1384(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005240:	00148493          	addi	s1,s1,1
    80005244:	000027b7          	lui	a5,0x2
    80005248:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000524c:	0097ee63          	bltu	a5,s1,80005268 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005250:	00000713          	li	a4,0
    80005254:	000077b7          	lui	a5,0x7
    80005258:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000525c:	fce7eee3          	bltu	a5,a4,80005238 <_ZL11workerBodyAPv+0x20>
    80005260:	00170713          	addi	a4,a4,1
    80005264:	ff1ff06f          	j	80005254 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005268:	00190913          	addi	s2,s2,1
    8000526c:	00900793          	li	a5,9
    80005270:	0527e063          	bltu	a5,s2,800052b0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005274:	00003517          	auipc	a0,0x3
    80005278:	1cc50513          	addi	a0,a0,460 # 80008440 <CONSOLE_STATUS+0x430>
    8000527c:	fffff097          	auipc	ra,0xfffff
    80005280:	46c080e7          	jalr	1132(ra) # 800046e8 <_Z11printStringPKc>
    80005284:	00000613          	li	a2,0
    80005288:	00a00593          	li	a1,10
    8000528c:	0009051b          	sext.w	a0,s2
    80005290:	fffff097          	auipc	ra,0xfffff
    80005294:	608080e7          	jalr	1544(ra) # 80004898 <_Z8printIntiii>
    80005298:	00003517          	auipc	a0,0x3
    8000529c:	0e050513          	addi	a0,a0,224 # 80008378 <CONSOLE_STATUS+0x368>
    800052a0:	fffff097          	auipc	ra,0xfffff
    800052a4:	448080e7          	jalr	1096(ra) # 800046e8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800052a8:	00000493          	li	s1,0
    800052ac:	f99ff06f          	j	80005244 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800052b0:	00003517          	auipc	a0,0x3
    800052b4:	19850513          	addi	a0,a0,408 # 80008448 <CONSOLE_STATUS+0x438>
    800052b8:	fffff097          	auipc	ra,0xfffff
    800052bc:	430080e7          	jalr	1072(ra) # 800046e8 <_Z11printStringPKc>
    finishedA = true;
    800052c0:	00100793          	li	a5,1
    800052c4:	00005717          	auipc	a4,0x5
    800052c8:	06f707a3          	sb	a5,111(a4) # 8000a333 <_ZL9finishedA>
}
    800052cc:	01813083          	ld	ra,24(sp)
    800052d0:	01013403          	ld	s0,16(sp)
    800052d4:	00813483          	ld	s1,8(sp)
    800052d8:	00013903          	ld	s2,0(sp)
    800052dc:	02010113          	addi	sp,sp,32
    800052e0:	00008067          	ret

00000000800052e4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800052e4:	fd010113          	addi	sp,sp,-48
    800052e8:	02113423          	sd	ra,40(sp)
    800052ec:	02813023          	sd	s0,32(sp)
    800052f0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800052f4:	00000613          	li	a2,0
    800052f8:	00000597          	auipc	a1,0x0
    800052fc:	f2058593          	addi	a1,a1,-224 # 80005218 <_ZL11workerBodyAPv>
    80005300:	fd040513          	addi	a0,s0,-48
    80005304:	ffffc097          	auipc	ra,0xffffc
    80005308:	37c080e7          	jalr	892(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000530c:	00003517          	auipc	a0,0x3
    80005310:	1cc50513          	addi	a0,a0,460 # 800084d8 <CONSOLE_STATUS+0x4c8>
    80005314:	fffff097          	auipc	ra,0xfffff
    80005318:	3d4080e7          	jalr	980(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000531c:	00000613          	li	a2,0
    80005320:	00000597          	auipc	a1,0x0
    80005324:	e1458593          	addi	a1,a1,-492 # 80005134 <_ZL11workerBodyBPv>
    80005328:	fd840513          	addi	a0,s0,-40
    8000532c:	ffffc097          	auipc	ra,0xffffc
    80005330:	354080e7          	jalr	852(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005334:	00003517          	auipc	a0,0x3
    80005338:	1bc50513          	addi	a0,a0,444 # 800084f0 <CONSOLE_STATUS+0x4e0>
    8000533c:	fffff097          	auipc	ra,0xfffff
    80005340:	3ac080e7          	jalr	940(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005344:	00000613          	li	a2,0
    80005348:	00000597          	auipc	a1,0x0
    8000534c:	c6c58593          	addi	a1,a1,-916 # 80004fb4 <_ZL11workerBodyCPv>
    80005350:	fe040513          	addi	a0,s0,-32
    80005354:	ffffc097          	auipc	ra,0xffffc
    80005358:	32c080e7          	jalr	812(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000535c:	00003517          	auipc	a0,0x3
    80005360:	1ac50513          	addi	a0,a0,428 # 80008508 <CONSOLE_STATUS+0x4f8>
    80005364:	fffff097          	auipc	ra,0xfffff
    80005368:	384080e7          	jalr	900(ra) # 800046e8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000536c:	00000613          	li	a2,0
    80005370:	00000597          	auipc	a1,0x0
    80005374:	afc58593          	addi	a1,a1,-1284 # 80004e6c <_ZL11workerBodyDPv>
    80005378:	fe840513          	addi	a0,s0,-24
    8000537c:	ffffc097          	auipc	ra,0xffffc
    80005380:	304080e7          	jalr	772(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005384:	00003517          	auipc	a0,0x3
    80005388:	19c50513          	addi	a0,a0,412 # 80008520 <CONSOLE_STATUS+0x510>
    8000538c:	fffff097          	auipc	ra,0xfffff
    80005390:	35c080e7          	jalr	860(ra) # 800046e8 <_Z11printStringPKc>
    80005394:	00c0006f          	j	800053a0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005398:	ffffc097          	auipc	ra,0xffffc
    8000539c:	408080e7          	jalr	1032(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800053a0:	00005797          	auipc	a5,0x5
    800053a4:	f937c783          	lbu	a5,-109(a5) # 8000a333 <_ZL9finishedA>
    800053a8:	fe0788e3          	beqz	a5,80005398 <_Z16System_Mode_testv+0xb4>
    800053ac:	00005797          	auipc	a5,0x5
    800053b0:	f867c783          	lbu	a5,-122(a5) # 8000a332 <_ZL9finishedB>
    800053b4:	fe0782e3          	beqz	a5,80005398 <_Z16System_Mode_testv+0xb4>
    800053b8:	00005797          	auipc	a5,0x5
    800053bc:	f797c783          	lbu	a5,-135(a5) # 8000a331 <_ZL9finishedC>
    800053c0:	fc078ce3          	beqz	a5,80005398 <_Z16System_Mode_testv+0xb4>
    800053c4:	00005797          	auipc	a5,0x5
    800053c8:	f6c7c783          	lbu	a5,-148(a5) # 8000a330 <_ZL9finishedD>
    800053cc:	fc0786e3          	beqz	a5,80005398 <_Z16System_Mode_testv+0xb4>
    }

}
    800053d0:	02813083          	ld	ra,40(sp)
    800053d4:	02013403          	ld	s0,32(sp)
    800053d8:	03010113          	addi	sp,sp,48
    800053dc:	00008067          	ret

00000000800053e0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../test/printing.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800053e0:	fe010113          	addi	sp,sp,-32
    800053e4:	00113c23          	sd	ra,24(sp)
    800053e8:	00813823          	sd	s0,16(sp)
    800053ec:	00913423          	sd	s1,8(sp)
    800053f0:	01213023          	sd	s2,0(sp)
    800053f4:	02010413          	addi	s0,sp,32
    800053f8:	00050493          	mv	s1,a0
    800053fc:	00058913          	mv	s2,a1
    80005400:	0015879b          	addiw	a5,a1,1
    80005404:	0007851b          	sext.w	a0,a5
    80005408:	00f4a023          	sw	a5,0(s1)
    8000540c:	0004a823          	sw	zero,16(s1)
    80005410:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005414:	00251513          	slli	a0,a0,0x2
    80005418:	ffffc097          	auipc	ra,0xffffc
    8000541c:	230080e7          	jalr	560(ra) # 80001648 <_Z9mem_allocm>
    80005420:	00a4b423          	sd	a0,8(s1)
    printString("Control point 3\n");
    80005424:	00003517          	auipc	a0,0x3
    80005428:	1e450513          	addi	a0,a0,484 # 80008608 <CONSOLE_STATUS+0x5f8>
    8000542c:	fffff097          	auipc	ra,0xfffff
    80005430:	2bc080e7          	jalr	700(ra) # 800046e8 <_Z11printStringPKc>
    sem_open(&itemAvailable, 0);
    80005434:	00000593          	li	a1,0
    80005438:	02048513          	addi	a0,s1,32
    8000543c:	ffffc097          	auipc	ra,0xffffc
    80005440:	3a8080e7          	jalr	936(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>

    printString("Control point 4\n");
    80005444:	00003517          	auipc	a0,0x3
    80005448:	1dc50513          	addi	a0,a0,476 # 80008620 <CONSOLE_STATUS+0x610>
    8000544c:	fffff097          	auipc	ra,0xfffff
    80005450:	29c080e7          	jalr	668(ra) # 800046e8 <_Z11printStringPKc>
    sem_open(&spaceAvailable, _cap);
    80005454:	00090593          	mv	a1,s2
    80005458:	01848513          	addi	a0,s1,24
    8000545c:	ffffc097          	auipc	ra,0xffffc
    80005460:	388080e7          	jalr	904(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexHead, 1);
    80005464:	00100593          	li	a1,1
    80005468:	02848513          	addi	a0,s1,40
    8000546c:	ffffc097          	auipc	ra,0xffffc
    80005470:	378080e7          	jalr	888(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexTail, 1);
    80005474:	00100593          	li	a1,1
    80005478:	03048513          	addi	a0,s1,48
    8000547c:	ffffc097          	auipc	ra,0xffffc
    80005480:	368080e7          	jalr	872(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
}
    80005484:	01813083          	ld	ra,24(sp)
    80005488:	01013403          	ld	s0,16(sp)
    8000548c:	00813483          	ld	s1,8(sp)
    80005490:	00013903          	ld	s2,0(sp)
    80005494:	02010113          	addi	sp,sp,32
    80005498:	00008067          	ret

000000008000549c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000549c:	fe010113          	addi	sp,sp,-32
    800054a0:	00113c23          	sd	ra,24(sp)
    800054a4:	00813823          	sd	s0,16(sp)
    800054a8:	00913423          	sd	s1,8(sp)
    800054ac:	01213023          	sd	s2,0(sp)
    800054b0:	02010413          	addi	s0,sp,32
    800054b4:	00050493          	mv	s1,a0
    800054b8:	00058913          	mv	s2,a1
    printString("Entered put\n");
    800054bc:	00003517          	auipc	a0,0x3
    800054c0:	17c50513          	addi	a0,a0,380 # 80008638 <CONSOLE_STATUS+0x628>
    800054c4:	fffff097          	auipc	ra,0xfffff
    800054c8:	224080e7          	jalr	548(ra) # 800046e8 <_Z11printStringPKc>
    sem_wait(spaceAvailable);
    800054cc:	0184b503          	ld	a0,24(s1)
    800054d0:	ffffc097          	auipc	ra,0xffffc
    800054d4:	3c4080e7          	jalr	964(ra) # 80001894 <_Z8sem_waitP10MojSemafor>
    //printString("Waited on spaceAvaileble\n");

    sem_wait(mutexTail);
    800054d8:	0304b503          	ld	a0,48(s1)
    800054dc:	ffffc097          	auipc	ra,0xffffc
    800054e0:	3b8080e7          	jalr	952(ra) # 80001894 <_Z8sem_waitP10MojSemafor>
    //printString("Waited on mutex\n");
    buffer[tail] = val;
    800054e4:	0084b783          	ld	a5,8(s1)
    800054e8:	0144a703          	lw	a4,20(s1)
    800054ec:	00271713          	slli	a4,a4,0x2
    800054f0:	00e787b3          	add	a5,a5,a4
    800054f4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800054f8:	0144a783          	lw	a5,20(s1)
    800054fc:	0017879b          	addiw	a5,a5,1
    80005500:	0004a703          	lw	a4,0(s1)
    80005504:	02e7e7bb          	remw	a5,a5,a4
    80005508:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000550c:	0304b503          	ld	a0,48(s1)
    80005510:	ffffc097          	auipc	ra,0xffffc
    80005514:	3b0080e7          	jalr	944(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
    //printString("Signaled mutex\n");

    sem_signal(itemAvailable);
    80005518:	0204b503          	ld	a0,32(s1)
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	3a4080e7          	jalr	932(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
    //printString("Signaled itemAvailable\n");

}
    80005524:	01813083          	ld	ra,24(sp)
    80005528:	01013403          	ld	s0,16(sp)
    8000552c:	00813483          	ld	s1,8(sp)
    80005530:	00013903          	ld	s2,0(sp)
    80005534:	02010113          	addi	sp,sp,32
    80005538:	00008067          	ret

000000008000553c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000553c:	fe010113          	addi	sp,sp,-32
    80005540:	00113c23          	sd	ra,24(sp)
    80005544:	00813823          	sd	s0,16(sp)
    80005548:	00913423          	sd	s1,8(sp)
    8000554c:	01213023          	sd	s2,0(sp)
    80005550:	02010413          	addi	s0,sp,32
    80005554:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005558:	02053503          	ld	a0,32(a0)
    8000555c:	ffffc097          	auipc	ra,0xffffc
    80005560:	338080e7          	jalr	824(ra) # 80001894 <_Z8sem_waitP10MojSemafor>

    sem_wait(mutexHead);
    80005564:	0284b503          	ld	a0,40(s1)
    80005568:	ffffc097          	auipc	ra,0xffffc
    8000556c:	32c080e7          	jalr	812(ra) # 80001894 <_Z8sem_waitP10MojSemafor>

    int ret = buffer[head];
    80005570:	0084b703          	ld	a4,8(s1)
    80005574:	0104a783          	lw	a5,16(s1)
    80005578:	00279693          	slli	a3,a5,0x2
    8000557c:	00d70733          	add	a4,a4,a3
    80005580:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005584:	0017879b          	addiw	a5,a5,1
    80005588:	0004a703          	lw	a4,0(s1)
    8000558c:	02e7e7bb          	remw	a5,a5,a4
    80005590:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005594:	0284b503          	ld	a0,40(s1)
    80005598:	ffffc097          	auipc	ra,0xffffc
    8000559c:	328080e7          	jalr	808(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>

    sem_signal(spaceAvailable);
    800055a0:	0184b503          	ld	a0,24(s1)
    800055a4:	ffffc097          	auipc	ra,0xffffc
    800055a8:	31c080e7          	jalr	796(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>

    return ret;
}
    800055ac:	00090513          	mv	a0,s2
    800055b0:	01813083          	ld	ra,24(sp)
    800055b4:	01013403          	ld	s0,16(sp)
    800055b8:	00813483          	ld	s1,8(sp)
    800055bc:	00013903          	ld	s2,0(sp)
    800055c0:	02010113          	addi	sp,sp,32
    800055c4:	00008067          	ret

00000000800055c8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800055c8:	fe010113          	addi	sp,sp,-32
    800055cc:	00113c23          	sd	ra,24(sp)
    800055d0:	00813823          	sd	s0,16(sp)
    800055d4:	00913423          	sd	s1,8(sp)
    800055d8:	01213023          	sd	s2,0(sp)
    800055dc:	02010413          	addi	s0,sp,32
    800055e0:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800055e4:	02853503          	ld	a0,40(a0)
    800055e8:	ffffc097          	auipc	ra,0xffffc
    800055ec:	2ac080e7          	jalr	684(ra) # 80001894 <_Z8sem_waitP10MojSemafor>
    sem_wait(mutexTail);
    800055f0:	0304b503          	ld	a0,48(s1)
    800055f4:	ffffc097          	auipc	ra,0xffffc
    800055f8:	2a0080e7          	jalr	672(ra) # 80001894 <_Z8sem_waitP10MojSemafor>

    if (tail >= head) {
    800055fc:	0144a783          	lw	a5,20(s1)
    80005600:	0104a903          	lw	s2,16(s1)
    80005604:	0327ce63          	blt	a5,s2,80005640 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005608:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000560c:	0304b503          	ld	a0,48(s1)
    80005610:	ffffc097          	auipc	ra,0xffffc
    80005614:	2b0080e7          	jalr	688(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>
    sem_signal(mutexHead);
    80005618:	0284b503          	ld	a0,40(s1)
    8000561c:	ffffc097          	auipc	ra,0xffffc
    80005620:	2a4080e7          	jalr	676(ra) # 800018c0 <_Z10sem_signalP10MojSemafor>

    return ret;
}
    80005624:	00090513          	mv	a0,s2
    80005628:	01813083          	ld	ra,24(sp)
    8000562c:	01013403          	ld	s0,16(sp)
    80005630:	00813483          	ld	s1,8(sp)
    80005634:	00013903          	ld	s2,0(sp)
    80005638:	02010113          	addi	sp,sp,32
    8000563c:	00008067          	ret
        ret = cap - head + tail;
    80005640:	0004a703          	lw	a4,0(s1)
    80005644:	4127093b          	subw	s2,a4,s2
    80005648:	00f9093b          	addw	s2,s2,a5
    8000564c:	fc1ff06f          	j	8000560c <_ZN6Buffer6getCntEv+0x44>

0000000080005650 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005650:	fe010113          	addi	sp,sp,-32
    80005654:	00113c23          	sd	ra,24(sp)
    80005658:	00813823          	sd	s0,16(sp)
    8000565c:	00913423          	sd	s1,8(sp)
    80005660:	02010413          	addi	s0,sp,32
    80005664:	00050493          	mv	s1,a0
    putc('\n');
    80005668:	00a00513          	li	a0,10
    8000566c:	ffffc097          	auipc	ra,0xffffc
    80005670:	2d4080e7          	jalr	724(ra) # 80001940 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005674:	00003517          	auipc	a0,0x3
    80005678:	f0450513          	addi	a0,a0,-252 # 80008578 <CONSOLE_STATUS+0x568>
    8000567c:	fffff097          	auipc	ra,0xfffff
    80005680:	06c080e7          	jalr	108(ra) # 800046e8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005684:	00048513          	mv	a0,s1
    80005688:	00000097          	auipc	ra,0x0
    8000568c:	f40080e7          	jalr	-192(ra) # 800055c8 <_ZN6Buffer6getCntEv>
    80005690:	02a05c63          	blez	a0,800056c8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005694:	0084b783          	ld	a5,8(s1)
    80005698:	0104a703          	lw	a4,16(s1)
    8000569c:	00271713          	slli	a4,a4,0x2
    800056a0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800056a4:	0007c503          	lbu	a0,0(a5)
    800056a8:	ffffc097          	auipc	ra,0xffffc
    800056ac:	298080e7          	jalr	664(ra) # 80001940 <_Z4putcc>
        head = (head + 1) % cap;
    800056b0:	0104a783          	lw	a5,16(s1)
    800056b4:	0017879b          	addiw	a5,a5,1
    800056b8:	0004a703          	lw	a4,0(s1)
    800056bc:	02e7e7bb          	remw	a5,a5,a4
    800056c0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800056c4:	fc1ff06f          	j	80005684 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800056c8:	02100513          	li	a0,33
    800056cc:	ffffc097          	auipc	ra,0xffffc
    800056d0:	274080e7          	jalr	628(ra) # 80001940 <_Z4putcc>
    putc('\n');
    800056d4:	00a00513          	li	a0,10
    800056d8:	ffffc097          	auipc	ra,0xffffc
    800056dc:	268080e7          	jalr	616(ra) # 80001940 <_Z4putcc>
    mem_free(buffer);
    800056e0:	0084b503          	ld	a0,8(s1)
    800056e4:	ffffc097          	auipc	ra,0xffffc
    800056e8:	f38080e7          	jalr	-200(ra) # 8000161c <_Z8mem_freePv>
    sem_close(itemAvailable);
    800056ec:	0204b503          	ld	a0,32(s1)
    800056f0:	ffffc097          	auipc	ra,0xffffc
    800056f4:	178080e7          	jalr	376(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
    sem_close(spaceAvailable);
    800056f8:	0184b503          	ld	a0,24(s1)
    800056fc:	ffffc097          	auipc	ra,0xffffc
    80005700:	16c080e7          	jalr	364(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexTail);
    80005704:	0304b503          	ld	a0,48(s1)
    80005708:	ffffc097          	auipc	ra,0xffffc
    8000570c:	160080e7          	jalr	352(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexHead);
    80005710:	0284b503          	ld	a0,40(s1)
    80005714:	ffffc097          	auipc	ra,0xffffc
    80005718:	154080e7          	jalr	340(ra) # 80001868 <_Z9sem_closeP10MojSemafor>
}
    8000571c:	01813083          	ld	ra,24(sp)
    80005720:	01013403          	ld	s0,16(sp)
    80005724:	00813483          	ld	s1,8(sp)
    80005728:	02010113          	addi	sp,sp,32
    8000572c:	00008067          	ret

0000000080005730 <start>:
    80005730:	ff010113          	addi	sp,sp,-16
    80005734:	00813423          	sd	s0,8(sp)
    80005738:	01010413          	addi	s0,sp,16
    8000573c:	300027f3          	csrr	a5,mstatus
    80005740:	ffffe737          	lui	a4,0xffffe
    80005744:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff325f>
    80005748:	00e7f7b3          	and	a5,a5,a4
    8000574c:	00001737          	lui	a4,0x1
    80005750:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005754:	00e7e7b3          	or	a5,a5,a4
    80005758:	30079073          	csrw	mstatus,a5
    8000575c:	00000797          	auipc	a5,0x0
    80005760:	16078793          	addi	a5,a5,352 # 800058bc <system_main>
    80005764:	34179073          	csrw	mepc,a5
    80005768:	00000793          	li	a5,0
    8000576c:	18079073          	csrw	satp,a5
    80005770:	000107b7          	lui	a5,0x10
    80005774:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005778:	30279073          	csrw	medeleg,a5
    8000577c:	30379073          	csrw	mideleg,a5
    80005780:	104027f3          	csrr	a5,sie
    80005784:	2227e793          	ori	a5,a5,546
    80005788:	10479073          	csrw	sie,a5
    8000578c:	fff00793          	li	a5,-1
    80005790:	00a7d793          	srli	a5,a5,0xa
    80005794:	3b079073          	csrw	pmpaddr0,a5
    80005798:	00f00793          	li	a5,15
    8000579c:	3a079073          	csrw	pmpcfg0,a5
    800057a0:	f14027f3          	csrr	a5,mhartid
    800057a4:	0200c737          	lui	a4,0x200c
    800057a8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800057ac:	0007869b          	sext.w	a3,a5
    800057b0:	00269713          	slli	a4,a3,0x2
    800057b4:	000f4637          	lui	a2,0xf4
    800057b8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800057bc:	00d70733          	add	a4,a4,a3
    800057c0:	0037979b          	slliw	a5,a5,0x3
    800057c4:	020046b7          	lui	a3,0x2004
    800057c8:	00d787b3          	add	a5,a5,a3
    800057cc:	00c585b3          	add	a1,a1,a2
    800057d0:	00371693          	slli	a3,a4,0x3
    800057d4:	00005717          	auipc	a4,0x5
    800057d8:	b6c70713          	addi	a4,a4,-1172 # 8000a340 <timer_scratch>
    800057dc:	00b7b023          	sd	a1,0(a5)
    800057e0:	00d70733          	add	a4,a4,a3
    800057e4:	00f73c23          	sd	a5,24(a4)
    800057e8:	02c73023          	sd	a2,32(a4)
    800057ec:	34071073          	csrw	mscratch,a4
    800057f0:	00000797          	auipc	a5,0x0
    800057f4:	6e078793          	addi	a5,a5,1760 # 80005ed0 <timervec>
    800057f8:	30579073          	csrw	mtvec,a5
    800057fc:	300027f3          	csrr	a5,mstatus
    80005800:	0087e793          	ori	a5,a5,8
    80005804:	30079073          	csrw	mstatus,a5
    80005808:	304027f3          	csrr	a5,mie
    8000580c:	0807e793          	ori	a5,a5,128
    80005810:	30479073          	csrw	mie,a5
    80005814:	f14027f3          	csrr	a5,mhartid
    80005818:	0007879b          	sext.w	a5,a5
    8000581c:	00078213          	mv	tp,a5
    80005820:	30200073          	mret
    80005824:	00813403          	ld	s0,8(sp)
    80005828:	01010113          	addi	sp,sp,16
    8000582c:	00008067          	ret

0000000080005830 <timerinit>:
    80005830:	ff010113          	addi	sp,sp,-16
    80005834:	00813423          	sd	s0,8(sp)
    80005838:	01010413          	addi	s0,sp,16
    8000583c:	f14027f3          	csrr	a5,mhartid
    80005840:	0200c737          	lui	a4,0x200c
    80005844:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005848:	0007869b          	sext.w	a3,a5
    8000584c:	00269713          	slli	a4,a3,0x2
    80005850:	000f4637          	lui	a2,0xf4
    80005854:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005858:	00d70733          	add	a4,a4,a3
    8000585c:	0037979b          	slliw	a5,a5,0x3
    80005860:	020046b7          	lui	a3,0x2004
    80005864:	00d787b3          	add	a5,a5,a3
    80005868:	00c585b3          	add	a1,a1,a2
    8000586c:	00371693          	slli	a3,a4,0x3
    80005870:	00005717          	auipc	a4,0x5
    80005874:	ad070713          	addi	a4,a4,-1328 # 8000a340 <timer_scratch>
    80005878:	00b7b023          	sd	a1,0(a5)
    8000587c:	00d70733          	add	a4,a4,a3
    80005880:	00f73c23          	sd	a5,24(a4)
    80005884:	02c73023          	sd	a2,32(a4)
    80005888:	34071073          	csrw	mscratch,a4
    8000588c:	00000797          	auipc	a5,0x0
    80005890:	64478793          	addi	a5,a5,1604 # 80005ed0 <timervec>
    80005894:	30579073          	csrw	mtvec,a5
    80005898:	300027f3          	csrr	a5,mstatus
    8000589c:	0087e793          	ori	a5,a5,8
    800058a0:	30079073          	csrw	mstatus,a5
    800058a4:	304027f3          	csrr	a5,mie
    800058a8:	0807e793          	ori	a5,a5,128
    800058ac:	30479073          	csrw	mie,a5
    800058b0:	00813403          	ld	s0,8(sp)
    800058b4:	01010113          	addi	sp,sp,16
    800058b8:	00008067          	ret

00000000800058bc <system_main>:
    800058bc:	fe010113          	addi	sp,sp,-32
    800058c0:	00813823          	sd	s0,16(sp)
    800058c4:	00913423          	sd	s1,8(sp)
    800058c8:	00113c23          	sd	ra,24(sp)
    800058cc:	02010413          	addi	s0,sp,32
    800058d0:	00000097          	auipc	ra,0x0
    800058d4:	0c4080e7          	jalr	196(ra) # 80005994 <cpuid>
    800058d8:	00005497          	auipc	s1,0x5
    800058dc:	9b848493          	addi	s1,s1,-1608 # 8000a290 <started>
    800058e0:	02050263          	beqz	a0,80005904 <system_main+0x48>
    800058e4:	0004a783          	lw	a5,0(s1)
    800058e8:	0007879b          	sext.w	a5,a5
    800058ec:	fe078ce3          	beqz	a5,800058e4 <system_main+0x28>
    800058f0:	0ff0000f          	fence
    800058f4:	00003517          	auipc	a0,0x3
    800058f8:	d8450513          	addi	a0,a0,-636 # 80008678 <CONSOLE_STATUS+0x668>
    800058fc:	00001097          	auipc	ra,0x1
    80005900:	a70080e7          	jalr	-1424(ra) # 8000636c <panic>
    80005904:	00001097          	auipc	ra,0x1
    80005908:	9c4080e7          	jalr	-1596(ra) # 800062c8 <consoleinit>
    8000590c:	00001097          	auipc	ra,0x1
    80005910:	150080e7          	jalr	336(ra) # 80006a5c <printfinit>
    80005914:	00003517          	auipc	a0,0x3
    80005918:	a6450513          	addi	a0,a0,-1436 # 80008378 <CONSOLE_STATUS+0x368>
    8000591c:	00001097          	auipc	ra,0x1
    80005920:	aac080e7          	jalr	-1364(ra) # 800063c8 <__printf>
    80005924:	00003517          	auipc	a0,0x3
    80005928:	d2450513          	addi	a0,a0,-732 # 80008648 <CONSOLE_STATUS+0x638>
    8000592c:	00001097          	auipc	ra,0x1
    80005930:	a9c080e7          	jalr	-1380(ra) # 800063c8 <__printf>
    80005934:	00003517          	auipc	a0,0x3
    80005938:	a4450513          	addi	a0,a0,-1468 # 80008378 <CONSOLE_STATUS+0x368>
    8000593c:	00001097          	auipc	ra,0x1
    80005940:	a8c080e7          	jalr	-1396(ra) # 800063c8 <__printf>
    80005944:	00001097          	auipc	ra,0x1
    80005948:	4a4080e7          	jalr	1188(ra) # 80006de8 <kinit>
    8000594c:	00000097          	auipc	ra,0x0
    80005950:	148080e7          	jalr	328(ra) # 80005a94 <trapinit>
    80005954:	00000097          	auipc	ra,0x0
    80005958:	16c080e7          	jalr	364(ra) # 80005ac0 <trapinithart>
    8000595c:	00000097          	auipc	ra,0x0
    80005960:	5b4080e7          	jalr	1460(ra) # 80005f10 <plicinit>
    80005964:	00000097          	auipc	ra,0x0
    80005968:	5d4080e7          	jalr	1492(ra) # 80005f38 <plicinithart>
    8000596c:	00000097          	auipc	ra,0x0
    80005970:	078080e7          	jalr	120(ra) # 800059e4 <userinit>
    80005974:	0ff0000f          	fence
    80005978:	00100793          	li	a5,1
    8000597c:	00003517          	auipc	a0,0x3
    80005980:	ce450513          	addi	a0,a0,-796 # 80008660 <CONSOLE_STATUS+0x650>
    80005984:	00f4a023          	sw	a5,0(s1)
    80005988:	00001097          	auipc	ra,0x1
    8000598c:	a40080e7          	jalr	-1472(ra) # 800063c8 <__printf>
    80005990:	0000006f          	j	80005990 <system_main+0xd4>

0000000080005994 <cpuid>:
    80005994:	ff010113          	addi	sp,sp,-16
    80005998:	00813423          	sd	s0,8(sp)
    8000599c:	01010413          	addi	s0,sp,16
    800059a0:	00020513          	mv	a0,tp
    800059a4:	00813403          	ld	s0,8(sp)
    800059a8:	0005051b          	sext.w	a0,a0
    800059ac:	01010113          	addi	sp,sp,16
    800059b0:	00008067          	ret

00000000800059b4 <mycpu>:
    800059b4:	ff010113          	addi	sp,sp,-16
    800059b8:	00813423          	sd	s0,8(sp)
    800059bc:	01010413          	addi	s0,sp,16
    800059c0:	00020793          	mv	a5,tp
    800059c4:	00813403          	ld	s0,8(sp)
    800059c8:	0007879b          	sext.w	a5,a5
    800059cc:	00779793          	slli	a5,a5,0x7
    800059d0:	00006517          	auipc	a0,0x6
    800059d4:	9a050513          	addi	a0,a0,-1632 # 8000b370 <cpus>
    800059d8:	00f50533          	add	a0,a0,a5
    800059dc:	01010113          	addi	sp,sp,16
    800059e0:	00008067          	ret

00000000800059e4 <userinit>:
    800059e4:	ff010113          	addi	sp,sp,-16
    800059e8:	00813423          	sd	s0,8(sp)
    800059ec:	01010413          	addi	s0,sp,16
    800059f0:	00813403          	ld	s0,8(sp)
    800059f4:	01010113          	addi	sp,sp,16
    800059f8:	ffffc317          	auipc	t1,0xffffc
    800059fc:	1c430067          	jr	452(t1) # 80001bbc <main>

0000000080005a00 <either_copyout>:
    80005a00:	ff010113          	addi	sp,sp,-16
    80005a04:	00813023          	sd	s0,0(sp)
    80005a08:	00113423          	sd	ra,8(sp)
    80005a0c:	01010413          	addi	s0,sp,16
    80005a10:	02051663          	bnez	a0,80005a3c <either_copyout+0x3c>
    80005a14:	00058513          	mv	a0,a1
    80005a18:	00060593          	mv	a1,a2
    80005a1c:	0006861b          	sext.w	a2,a3
    80005a20:	00002097          	auipc	ra,0x2
    80005a24:	c54080e7          	jalr	-940(ra) # 80007674 <__memmove>
    80005a28:	00813083          	ld	ra,8(sp)
    80005a2c:	00013403          	ld	s0,0(sp)
    80005a30:	00000513          	li	a0,0
    80005a34:	01010113          	addi	sp,sp,16
    80005a38:	00008067          	ret
    80005a3c:	00003517          	auipc	a0,0x3
    80005a40:	c6450513          	addi	a0,a0,-924 # 800086a0 <CONSOLE_STATUS+0x690>
    80005a44:	00001097          	auipc	ra,0x1
    80005a48:	928080e7          	jalr	-1752(ra) # 8000636c <panic>

0000000080005a4c <either_copyin>:
    80005a4c:	ff010113          	addi	sp,sp,-16
    80005a50:	00813023          	sd	s0,0(sp)
    80005a54:	00113423          	sd	ra,8(sp)
    80005a58:	01010413          	addi	s0,sp,16
    80005a5c:	02059463          	bnez	a1,80005a84 <either_copyin+0x38>
    80005a60:	00060593          	mv	a1,a2
    80005a64:	0006861b          	sext.w	a2,a3
    80005a68:	00002097          	auipc	ra,0x2
    80005a6c:	c0c080e7          	jalr	-1012(ra) # 80007674 <__memmove>
    80005a70:	00813083          	ld	ra,8(sp)
    80005a74:	00013403          	ld	s0,0(sp)
    80005a78:	00000513          	li	a0,0
    80005a7c:	01010113          	addi	sp,sp,16
    80005a80:	00008067          	ret
    80005a84:	00003517          	auipc	a0,0x3
    80005a88:	c4450513          	addi	a0,a0,-956 # 800086c8 <CONSOLE_STATUS+0x6b8>
    80005a8c:	00001097          	auipc	ra,0x1
    80005a90:	8e0080e7          	jalr	-1824(ra) # 8000636c <panic>

0000000080005a94 <trapinit>:
    80005a94:	ff010113          	addi	sp,sp,-16
    80005a98:	00813423          	sd	s0,8(sp)
    80005a9c:	01010413          	addi	s0,sp,16
    80005aa0:	00813403          	ld	s0,8(sp)
    80005aa4:	00003597          	auipc	a1,0x3
    80005aa8:	c4c58593          	addi	a1,a1,-948 # 800086f0 <CONSOLE_STATUS+0x6e0>
    80005aac:	00006517          	auipc	a0,0x6
    80005ab0:	94450513          	addi	a0,a0,-1724 # 8000b3f0 <tickslock>
    80005ab4:	01010113          	addi	sp,sp,16
    80005ab8:	00001317          	auipc	t1,0x1
    80005abc:	5c030067          	jr	1472(t1) # 80007078 <initlock>

0000000080005ac0 <trapinithart>:
    80005ac0:	ff010113          	addi	sp,sp,-16
    80005ac4:	00813423          	sd	s0,8(sp)
    80005ac8:	01010413          	addi	s0,sp,16
    80005acc:	00000797          	auipc	a5,0x0
    80005ad0:	2f478793          	addi	a5,a5,756 # 80005dc0 <kernelvec>
    80005ad4:	10579073          	csrw	stvec,a5
    80005ad8:	00813403          	ld	s0,8(sp)
    80005adc:	01010113          	addi	sp,sp,16
    80005ae0:	00008067          	ret

0000000080005ae4 <usertrap>:
    80005ae4:	ff010113          	addi	sp,sp,-16
    80005ae8:	00813423          	sd	s0,8(sp)
    80005aec:	01010413          	addi	s0,sp,16
    80005af0:	00813403          	ld	s0,8(sp)
    80005af4:	01010113          	addi	sp,sp,16
    80005af8:	00008067          	ret

0000000080005afc <usertrapret>:
    80005afc:	ff010113          	addi	sp,sp,-16
    80005b00:	00813423          	sd	s0,8(sp)
    80005b04:	01010413          	addi	s0,sp,16
    80005b08:	00813403          	ld	s0,8(sp)
    80005b0c:	01010113          	addi	sp,sp,16
    80005b10:	00008067          	ret

0000000080005b14 <kerneltrap>:
    80005b14:	fe010113          	addi	sp,sp,-32
    80005b18:	00813823          	sd	s0,16(sp)
    80005b1c:	00113c23          	sd	ra,24(sp)
    80005b20:	00913423          	sd	s1,8(sp)
    80005b24:	02010413          	addi	s0,sp,32
    80005b28:	142025f3          	csrr	a1,scause
    80005b2c:	100027f3          	csrr	a5,sstatus
    80005b30:	0027f793          	andi	a5,a5,2
    80005b34:	10079c63          	bnez	a5,80005c4c <kerneltrap+0x138>
    80005b38:	142027f3          	csrr	a5,scause
    80005b3c:	0207ce63          	bltz	a5,80005b78 <kerneltrap+0x64>
    80005b40:	00003517          	auipc	a0,0x3
    80005b44:	bf850513          	addi	a0,a0,-1032 # 80008738 <CONSOLE_STATUS+0x728>
    80005b48:	00001097          	auipc	ra,0x1
    80005b4c:	880080e7          	jalr	-1920(ra) # 800063c8 <__printf>
    80005b50:	141025f3          	csrr	a1,sepc
    80005b54:	14302673          	csrr	a2,stval
    80005b58:	00003517          	auipc	a0,0x3
    80005b5c:	bf050513          	addi	a0,a0,-1040 # 80008748 <CONSOLE_STATUS+0x738>
    80005b60:	00001097          	auipc	ra,0x1
    80005b64:	868080e7          	jalr	-1944(ra) # 800063c8 <__printf>
    80005b68:	00003517          	auipc	a0,0x3
    80005b6c:	bf850513          	addi	a0,a0,-1032 # 80008760 <CONSOLE_STATUS+0x750>
    80005b70:	00000097          	auipc	ra,0x0
    80005b74:	7fc080e7          	jalr	2044(ra) # 8000636c <panic>
    80005b78:	0ff7f713          	andi	a4,a5,255
    80005b7c:	00900693          	li	a3,9
    80005b80:	04d70063          	beq	a4,a3,80005bc0 <kerneltrap+0xac>
    80005b84:	fff00713          	li	a4,-1
    80005b88:	03f71713          	slli	a4,a4,0x3f
    80005b8c:	00170713          	addi	a4,a4,1
    80005b90:	fae798e3          	bne	a5,a4,80005b40 <kerneltrap+0x2c>
    80005b94:	00000097          	auipc	ra,0x0
    80005b98:	e00080e7          	jalr	-512(ra) # 80005994 <cpuid>
    80005b9c:	06050663          	beqz	a0,80005c08 <kerneltrap+0xf4>
    80005ba0:	144027f3          	csrr	a5,sip
    80005ba4:	ffd7f793          	andi	a5,a5,-3
    80005ba8:	14479073          	csrw	sip,a5
    80005bac:	01813083          	ld	ra,24(sp)
    80005bb0:	01013403          	ld	s0,16(sp)
    80005bb4:	00813483          	ld	s1,8(sp)
    80005bb8:	02010113          	addi	sp,sp,32
    80005bbc:	00008067          	ret
    80005bc0:	00000097          	auipc	ra,0x0
    80005bc4:	3c4080e7          	jalr	964(ra) # 80005f84 <plic_claim>
    80005bc8:	00a00793          	li	a5,10
    80005bcc:	00050493          	mv	s1,a0
    80005bd0:	06f50863          	beq	a0,a5,80005c40 <kerneltrap+0x12c>
    80005bd4:	fc050ce3          	beqz	a0,80005bac <kerneltrap+0x98>
    80005bd8:	00050593          	mv	a1,a0
    80005bdc:	00003517          	auipc	a0,0x3
    80005be0:	b3c50513          	addi	a0,a0,-1220 # 80008718 <CONSOLE_STATUS+0x708>
    80005be4:	00000097          	auipc	ra,0x0
    80005be8:	7e4080e7          	jalr	2020(ra) # 800063c8 <__printf>
    80005bec:	01013403          	ld	s0,16(sp)
    80005bf0:	01813083          	ld	ra,24(sp)
    80005bf4:	00048513          	mv	a0,s1
    80005bf8:	00813483          	ld	s1,8(sp)
    80005bfc:	02010113          	addi	sp,sp,32
    80005c00:	00000317          	auipc	t1,0x0
    80005c04:	3bc30067          	jr	956(t1) # 80005fbc <plic_complete>
    80005c08:	00005517          	auipc	a0,0x5
    80005c0c:	7e850513          	addi	a0,a0,2024 # 8000b3f0 <tickslock>
    80005c10:	00001097          	auipc	ra,0x1
    80005c14:	48c080e7          	jalr	1164(ra) # 8000709c <acquire>
    80005c18:	00004717          	auipc	a4,0x4
    80005c1c:	67c70713          	addi	a4,a4,1660 # 8000a294 <ticks>
    80005c20:	00072783          	lw	a5,0(a4)
    80005c24:	00005517          	auipc	a0,0x5
    80005c28:	7cc50513          	addi	a0,a0,1996 # 8000b3f0 <tickslock>
    80005c2c:	0017879b          	addiw	a5,a5,1
    80005c30:	00f72023          	sw	a5,0(a4)
    80005c34:	00001097          	auipc	ra,0x1
    80005c38:	534080e7          	jalr	1332(ra) # 80007168 <release>
    80005c3c:	f65ff06f          	j	80005ba0 <kerneltrap+0x8c>
    80005c40:	00001097          	auipc	ra,0x1
    80005c44:	090080e7          	jalr	144(ra) # 80006cd0 <uartintr>
    80005c48:	fa5ff06f          	j	80005bec <kerneltrap+0xd8>
    80005c4c:	00003517          	auipc	a0,0x3
    80005c50:	aac50513          	addi	a0,a0,-1364 # 800086f8 <CONSOLE_STATUS+0x6e8>
    80005c54:	00000097          	auipc	ra,0x0
    80005c58:	718080e7          	jalr	1816(ra) # 8000636c <panic>

0000000080005c5c <clockintr>:
    80005c5c:	fe010113          	addi	sp,sp,-32
    80005c60:	00813823          	sd	s0,16(sp)
    80005c64:	00913423          	sd	s1,8(sp)
    80005c68:	00113c23          	sd	ra,24(sp)
    80005c6c:	02010413          	addi	s0,sp,32
    80005c70:	00005497          	auipc	s1,0x5
    80005c74:	78048493          	addi	s1,s1,1920 # 8000b3f0 <tickslock>
    80005c78:	00048513          	mv	a0,s1
    80005c7c:	00001097          	auipc	ra,0x1
    80005c80:	420080e7          	jalr	1056(ra) # 8000709c <acquire>
    80005c84:	00004717          	auipc	a4,0x4
    80005c88:	61070713          	addi	a4,a4,1552 # 8000a294 <ticks>
    80005c8c:	00072783          	lw	a5,0(a4)
    80005c90:	01013403          	ld	s0,16(sp)
    80005c94:	01813083          	ld	ra,24(sp)
    80005c98:	00048513          	mv	a0,s1
    80005c9c:	0017879b          	addiw	a5,a5,1
    80005ca0:	00813483          	ld	s1,8(sp)
    80005ca4:	00f72023          	sw	a5,0(a4)
    80005ca8:	02010113          	addi	sp,sp,32
    80005cac:	00001317          	auipc	t1,0x1
    80005cb0:	4bc30067          	jr	1212(t1) # 80007168 <release>

0000000080005cb4 <devintr>:
    80005cb4:	142027f3          	csrr	a5,scause
    80005cb8:	00000513          	li	a0,0
    80005cbc:	0007c463          	bltz	a5,80005cc4 <devintr+0x10>
    80005cc0:	00008067          	ret
    80005cc4:	fe010113          	addi	sp,sp,-32
    80005cc8:	00813823          	sd	s0,16(sp)
    80005ccc:	00113c23          	sd	ra,24(sp)
    80005cd0:	00913423          	sd	s1,8(sp)
    80005cd4:	02010413          	addi	s0,sp,32
    80005cd8:	0ff7f713          	andi	a4,a5,255
    80005cdc:	00900693          	li	a3,9
    80005ce0:	04d70c63          	beq	a4,a3,80005d38 <devintr+0x84>
    80005ce4:	fff00713          	li	a4,-1
    80005ce8:	03f71713          	slli	a4,a4,0x3f
    80005cec:	00170713          	addi	a4,a4,1
    80005cf0:	00e78c63          	beq	a5,a4,80005d08 <devintr+0x54>
    80005cf4:	01813083          	ld	ra,24(sp)
    80005cf8:	01013403          	ld	s0,16(sp)
    80005cfc:	00813483          	ld	s1,8(sp)
    80005d00:	02010113          	addi	sp,sp,32
    80005d04:	00008067          	ret
    80005d08:	00000097          	auipc	ra,0x0
    80005d0c:	c8c080e7          	jalr	-884(ra) # 80005994 <cpuid>
    80005d10:	06050663          	beqz	a0,80005d7c <devintr+0xc8>
    80005d14:	144027f3          	csrr	a5,sip
    80005d18:	ffd7f793          	andi	a5,a5,-3
    80005d1c:	14479073          	csrw	sip,a5
    80005d20:	01813083          	ld	ra,24(sp)
    80005d24:	01013403          	ld	s0,16(sp)
    80005d28:	00813483          	ld	s1,8(sp)
    80005d2c:	00200513          	li	a0,2
    80005d30:	02010113          	addi	sp,sp,32
    80005d34:	00008067          	ret
    80005d38:	00000097          	auipc	ra,0x0
    80005d3c:	24c080e7          	jalr	588(ra) # 80005f84 <plic_claim>
    80005d40:	00a00793          	li	a5,10
    80005d44:	00050493          	mv	s1,a0
    80005d48:	06f50663          	beq	a0,a5,80005db4 <devintr+0x100>
    80005d4c:	00100513          	li	a0,1
    80005d50:	fa0482e3          	beqz	s1,80005cf4 <devintr+0x40>
    80005d54:	00048593          	mv	a1,s1
    80005d58:	00003517          	auipc	a0,0x3
    80005d5c:	9c050513          	addi	a0,a0,-1600 # 80008718 <CONSOLE_STATUS+0x708>
    80005d60:	00000097          	auipc	ra,0x0
    80005d64:	668080e7          	jalr	1640(ra) # 800063c8 <__printf>
    80005d68:	00048513          	mv	a0,s1
    80005d6c:	00000097          	auipc	ra,0x0
    80005d70:	250080e7          	jalr	592(ra) # 80005fbc <plic_complete>
    80005d74:	00100513          	li	a0,1
    80005d78:	f7dff06f          	j	80005cf4 <devintr+0x40>
    80005d7c:	00005517          	auipc	a0,0x5
    80005d80:	67450513          	addi	a0,a0,1652 # 8000b3f0 <tickslock>
    80005d84:	00001097          	auipc	ra,0x1
    80005d88:	318080e7          	jalr	792(ra) # 8000709c <acquire>
    80005d8c:	00004717          	auipc	a4,0x4
    80005d90:	50870713          	addi	a4,a4,1288 # 8000a294 <ticks>
    80005d94:	00072783          	lw	a5,0(a4)
    80005d98:	00005517          	auipc	a0,0x5
    80005d9c:	65850513          	addi	a0,a0,1624 # 8000b3f0 <tickslock>
    80005da0:	0017879b          	addiw	a5,a5,1
    80005da4:	00f72023          	sw	a5,0(a4)
    80005da8:	00001097          	auipc	ra,0x1
    80005dac:	3c0080e7          	jalr	960(ra) # 80007168 <release>
    80005db0:	f65ff06f          	j	80005d14 <devintr+0x60>
    80005db4:	00001097          	auipc	ra,0x1
    80005db8:	f1c080e7          	jalr	-228(ra) # 80006cd0 <uartintr>
    80005dbc:	fadff06f          	j	80005d68 <devintr+0xb4>

0000000080005dc0 <kernelvec>:
    80005dc0:	f0010113          	addi	sp,sp,-256
    80005dc4:	00113023          	sd	ra,0(sp)
    80005dc8:	00213423          	sd	sp,8(sp)
    80005dcc:	00313823          	sd	gp,16(sp)
    80005dd0:	00413c23          	sd	tp,24(sp)
    80005dd4:	02513023          	sd	t0,32(sp)
    80005dd8:	02613423          	sd	t1,40(sp)
    80005ddc:	02713823          	sd	t2,48(sp)
    80005de0:	02813c23          	sd	s0,56(sp)
    80005de4:	04913023          	sd	s1,64(sp)
    80005de8:	04a13423          	sd	a0,72(sp)
    80005dec:	04b13823          	sd	a1,80(sp)
    80005df0:	04c13c23          	sd	a2,88(sp)
    80005df4:	06d13023          	sd	a3,96(sp)
    80005df8:	06e13423          	sd	a4,104(sp)
    80005dfc:	06f13823          	sd	a5,112(sp)
    80005e00:	07013c23          	sd	a6,120(sp)
    80005e04:	09113023          	sd	a7,128(sp)
    80005e08:	09213423          	sd	s2,136(sp)
    80005e0c:	09313823          	sd	s3,144(sp)
    80005e10:	09413c23          	sd	s4,152(sp)
    80005e14:	0b513023          	sd	s5,160(sp)
    80005e18:	0b613423          	sd	s6,168(sp)
    80005e1c:	0b713823          	sd	s7,176(sp)
    80005e20:	0b813c23          	sd	s8,184(sp)
    80005e24:	0d913023          	sd	s9,192(sp)
    80005e28:	0da13423          	sd	s10,200(sp)
    80005e2c:	0db13823          	sd	s11,208(sp)
    80005e30:	0dc13c23          	sd	t3,216(sp)
    80005e34:	0fd13023          	sd	t4,224(sp)
    80005e38:	0fe13423          	sd	t5,232(sp)
    80005e3c:	0ff13823          	sd	t6,240(sp)
    80005e40:	cd5ff0ef          	jal	ra,80005b14 <kerneltrap>
    80005e44:	00013083          	ld	ra,0(sp)
    80005e48:	00813103          	ld	sp,8(sp)
    80005e4c:	01013183          	ld	gp,16(sp)
    80005e50:	02013283          	ld	t0,32(sp)
    80005e54:	02813303          	ld	t1,40(sp)
    80005e58:	03013383          	ld	t2,48(sp)
    80005e5c:	03813403          	ld	s0,56(sp)
    80005e60:	04013483          	ld	s1,64(sp)
    80005e64:	04813503          	ld	a0,72(sp)
    80005e68:	05013583          	ld	a1,80(sp)
    80005e6c:	05813603          	ld	a2,88(sp)
    80005e70:	06013683          	ld	a3,96(sp)
    80005e74:	06813703          	ld	a4,104(sp)
    80005e78:	07013783          	ld	a5,112(sp)
    80005e7c:	07813803          	ld	a6,120(sp)
    80005e80:	08013883          	ld	a7,128(sp)
    80005e84:	08813903          	ld	s2,136(sp)
    80005e88:	09013983          	ld	s3,144(sp)
    80005e8c:	09813a03          	ld	s4,152(sp)
    80005e90:	0a013a83          	ld	s5,160(sp)
    80005e94:	0a813b03          	ld	s6,168(sp)
    80005e98:	0b013b83          	ld	s7,176(sp)
    80005e9c:	0b813c03          	ld	s8,184(sp)
    80005ea0:	0c013c83          	ld	s9,192(sp)
    80005ea4:	0c813d03          	ld	s10,200(sp)
    80005ea8:	0d013d83          	ld	s11,208(sp)
    80005eac:	0d813e03          	ld	t3,216(sp)
    80005eb0:	0e013e83          	ld	t4,224(sp)
    80005eb4:	0e813f03          	ld	t5,232(sp)
    80005eb8:	0f013f83          	ld	t6,240(sp)
    80005ebc:	10010113          	addi	sp,sp,256
    80005ec0:	10200073          	sret
    80005ec4:	00000013          	nop
    80005ec8:	00000013          	nop
    80005ecc:	00000013          	nop

0000000080005ed0 <timervec>:
    80005ed0:	34051573          	csrrw	a0,mscratch,a0
    80005ed4:	00b53023          	sd	a1,0(a0)
    80005ed8:	00c53423          	sd	a2,8(a0)
    80005edc:	00d53823          	sd	a3,16(a0)
    80005ee0:	01853583          	ld	a1,24(a0)
    80005ee4:	02053603          	ld	a2,32(a0)
    80005ee8:	0005b683          	ld	a3,0(a1)
    80005eec:	00c686b3          	add	a3,a3,a2
    80005ef0:	00d5b023          	sd	a3,0(a1)
    80005ef4:	00200593          	li	a1,2
    80005ef8:	14459073          	csrw	sip,a1
    80005efc:	01053683          	ld	a3,16(a0)
    80005f00:	00853603          	ld	a2,8(a0)
    80005f04:	00053583          	ld	a1,0(a0)
    80005f08:	34051573          	csrrw	a0,mscratch,a0
    80005f0c:	30200073          	mret

0000000080005f10 <plicinit>:
    80005f10:	ff010113          	addi	sp,sp,-16
    80005f14:	00813423          	sd	s0,8(sp)
    80005f18:	01010413          	addi	s0,sp,16
    80005f1c:	00813403          	ld	s0,8(sp)
    80005f20:	0c0007b7          	lui	a5,0xc000
    80005f24:	00100713          	li	a4,1
    80005f28:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005f2c:	00e7a223          	sw	a4,4(a5)
    80005f30:	01010113          	addi	sp,sp,16
    80005f34:	00008067          	ret

0000000080005f38 <plicinithart>:
    80005f38:	ff010113          	addi	sp,sp,-16
    80005f3c:	00813023          	sd	s0,0(sp)
    80005f40:	00113423          	sd	ra,8(sp)
    80005f44:	01010413          	addi	s0,sp,16
    80005f48:	00000097          	auipc	ra,0x0
    80005f4c:	a4c080e7          	jalr	-1460(ra) # 80005994 <cpuid>
    80005f50:	0085171b          	slliw	a4,a0,0x8
    80005f54:	0c0027b7          	lui	a5,0xc002
    80005f58:	00e787b3          	add	a5,a5,a4
    80005f5c:	40200713          	li	a4,1026
    80005f60:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005f64:	00813083          	ld	ra,8(sp)
    80005f68:	00013403          	ld	s0,0(sp)
    80005f6c:	00d5151b          	slliw	a0,a0,0xd
    80005f70:	0c2017b7          	lui	a5,0xc201
    80005f74:	00a78533          	add	a0,a5,a0
    80005f78:	00052023          	sw	zero,0(a0)
    80005f7c:	01010113          	addi	sp,sp,16
    80005f80:	00008067          	ret

0000000080005f84 <plic_claim>:
    80005f84:	ff010113          	addi	sp,sp,-16
    80005f88:	00813023          	sd	s0,0(sp)
    80005f8c:	00113423          	sd	ra,8(sp)
    80005f90:	01010413          	addi	s0,sp,16
    80005f94:	00000097          	auipc	ra,0x0
    80005f98:	a00080e7          	jalr	-1536(ra) # 80005994 <cpuid>
    80005f9c:	00813083          	ld	ra,8(sp)
    80005fa0:	00013403          	ld	s0,0(sp)
    80005fa4:	00d5151b          	slliw	a0,a0,0xd
    80005fa8:	0c2017b7          	lui	a5,0xc201
    80005fac:	00a78533          	add	a0,a5,a0
    80005fb0:	00452503          	lw	a0,4(a0)
    80005fb4:	01010113          	addi	sp,sp,16
    80005fb8:	00008067          	ret

0000000080005fbc <plic_complete>:
    80005fbc:	fe010113          	addi	sp,sp,-32
    80005fc0:	00813823          	sd	s0,16(sp)
    80005fc4:	00913423          	sd	s1,8(sp)
    80005fc8:	00113c23          	sd	ra,24(sp)
    80005fcc:	02010413          	addi	s0,sp,32
    80005fd0:	00050493          	mv	s1,a0
    80005fd4:	00000097          	auipc	ra,0x0
    80005fd8:	9c0080e7          	jalr	-1600(ra) # 80005994 <cpuid>
    80005fdc:	01813083          	ld	ra,24(sp)
    80005fe0:	01013403          	ld	s0,16(sp)
    80005fe4:	00d5179b          	slliw	a5,a0,0xd
    80005fe8:	0c201737          	lui	a4,0xc201
    80005fec:	00f707b3          	add	a5,a4,a5
    80005ff0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005ff4:	00813483          	ld	s1,8(sp)
    80005ff8:	02010113          	addi	sp,sp,32
    80005ffc:	00008067          	ret

0000000080006000 <consolewrite>:
    80006000:	fb010113          	addi	sp,sp,-80
    80006004:	04813023          	sd	s0,64(sp)
    80006008:	04113423          	sd	ra,72(sp)
    8000600c:	02913c23          	sd	s1,56(sp)
    80006010:	03213823          	sd	s2,48(sp)
    80006014:	03313423          	sd	s3,40(sp)
    80006018:	03413023          	sd	s4,32(sp)
    8000601c:	01513c23          	sd	s5,24(sp)
    80006020:	05010413          	addi	s0,sp,80
    80006024:	06c05c63          	blez	a2,8000609c <consolewrite+0x9c>
    80006028:	00060993          	mv	s3,a2
    8000602c:	00050a13          	mv	s4,a0
    80006030:	00058493          	mv	s1,a1
    80006034:	00000913          	li	s2,0
    80006038:	fff00a93          	li	s5,-1
    8000603c:	01c0006f          	j	80006058 <consolewrite+0x58>
    80006040:	fbf44503          	lbu	a0,-65(s0)
    80006044:	0019091b          	addiw	s2,s2,1
    80006048:	00148493          	addi	s1,s1,1
    8000604c:	00001097          	auipc	ra,0x1
    80006050:	a9c080e7          	jalr	-1380(ra) # 80006ae8 <uartputc>
    80006054:	03298063          	beq	s3,s2,80006074 <consolewrite+0x74>
    80006058:	00048613          	mv	a2,s1
    8000605c:	00100693          	li	a3,1
    80006060:	000a0593          	mv	a1,s4
    80006064:	fbf40513          	addi	a0,s0,-65
    80006068:	00000097          	auipc	ra,0x0
    8000606c:	9e4080e7          	jalr	-1564(ra) # 80005a4c <either_copyin>
    80006070:	fd5518e3          	bne	a0,s5,80006040 <consolewrite+0x40>
    80006074:	04813083          	ld	ra,72(sp)
    80006078:	04013403          	ld	s0,64(sp)
    8000607c:	03813483          	ld	s1,56(sp)
    80006080:	02813983          	ld	s3,40(sp)
    80006084:	02013a03          	ld	s4,32(sp)
    80006088:	01813a83          	ld	s5,24(sp)
    8000608c:	00090513          	mv	a0,s2
    80006090:	03013903          	ld	s2,48(sp)
    80006094:	05010113          	addi	sp,sp,80
    80006098:	00008067          	ret
    8000609c:	00000913          	li	s2,0
    800060a0:	fd5ff06f          	j	80006074 <consolewrite+0x74>

00000000800060a4 <consoleread>:
    800060a4:	f9010113          	addi	sp,sp,-112
    800060a8:	06813023          	sd	s0,96(sp)
    800060ac:	04913c23          	sd	s1,88(sp)
    800060b0:	05213823          	sd	s2,80(sp)
    800060b4:	05313423          	sd	s3,72(sp)
    800060b8:	05413023          	sd	s4,64(sp)
    800060bc:	03513c23          	sd	s5,56(sp)
    800060c0:	03613823          	sd	s6,48(sp)
    800060c4:	03713423          	sd	s7,40(sp)
    800060c8:	03813023          	sd	s8,32(sp)
    800060cc:	06113423          	sd	ra,104(sp)
    800060d0:	01913c23          	sd	s9,24(sp)
    800060d4:	07010413          	addi	s0,sp,112
    800060d8:	00060b93          	mv	s7,a2
    800060dc:	00050913          	mv	s2,a0
    800060e0:	00058c13          	mv	s8,a1
    800060e4:	00060b1b          	sext.w	s6,a2
    800060e8:	00005497          	auipc	s1,0x5
    800060ec:	33048493          	addi	s1,s1,816 # 8000b418 <cons>
    800060f0:	00400993          	li	s3,4
    800060f4:	fff00a13          	li	s4,-1
    800060f8:	00a00a93          	li	s5,10
    800060fc:	05705e63          	blez	s7,80006158 <consoleread+0xb4>
    80006100:	09c4a703          	lw	a4,156(s1)
    80006104:	0984a783          	lw	a5,152(s1)
    80006108:	0007071b          	sext.w	a4,a4
    8000610c:	08e78463          	beq	a5,a4,80006194 <consoleread+0xf0>
    80006110:	07f7f713          	andi	a4,a5,127
    80006114:	00e48733          	add	a4,s1,a4
    80006118:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000611c:	0017869b          	addiw	a3,a5,1
    80006120:	08d4ac23          	sw	a3,152(s1)
    80006124:	00070c9b          	sext.w	s9,a4
    80006128:	0b370663          	beq	a4,s3,800061d4 <consoleread+0x130>
    8000612c:	00100693          	li	a3,1
    80006130:	f9f40613          	addi	a2,s0,-97
    80006134:	000c0593          	mv	a1,s8
    80006138:	00090513          	mv	a0,s2
    8000613c:	f8e40fa3          	sb	a4,-97(s0)
    80006140:	00000097          	auipc	ra,0x0
    80006144:	8c0080e7          	jalr	-1856(ra) # 80005a00 <either_copyout>
    80006148:	01450863          	beq	a0,s4,80006158 <consoleread+0xb4>
    8000614c:	001c0c13          	addi	s8,s8,1
    80006150:	fffb8b9b          	addiw	s7,s7,-1
    80006154:	fb5c94e3          	bne	s9,s5,800060fc <consoleread+0x58>
    80006158:	000b851b          	sext.w	a0,s7
    8000615c:	06813083          	ld	ra,104(sp)
    80006160:	06013403          	ld	s0,96(sp)
    80006164:	05813483          	ld	s1,88(sp)
    80006168:	05013903          	ld	s2,80(sp)
    8000616c:	04813983          	ld	s3,72(sp)
    80006170:	04013a03          	ld	s4,64(sp)
    80006174:	03813a83          	ld	s5,56(sp)
    80006178:	02813b83          	ld	s7,40(sp)
    8000617c:	02013c03          	ld	s8,32(sp)
    80006180:	01813c83          	ld	s9,24(sp)
    80006184:	40ab053b          	subw	a0,s6,a0
    80006188:	03013b03          	ld	s6,48(sp)
    8000618c:	07010113          	addi	sp,sp,112
    80006190:	00008067          	ret
    80006194:	00001097          	auipc	ra,0x1
    80006198:	1d8080e7          	jalr	472(ra) # 8000736c <push_on>
    8000619c:	0984a703          	lw	a4,152(s1)
    800061a0:	09c4a783          	lw	a5,156(s1)
    800061a4:	0007879b          	sext.w	a5,a5
    800061a8:	fef70ce3          	beq	a4,a5,800061a0 <consoleread+0xfc>
    800061ac:	00001097          	auipc	ra,0x1
    800061b0:	234080e7          	jalr	564(ra) # 800073e0 <pop_on>
    800061b4:	0984a783          	lw	a5,152(s1)
    800061b8:	07f7f713          	andi	a4,a5,127
    800061bc:	00e48733          	add	a4,s1,a4
    800061c0:	01874703          	lbu	a4,24(a4)
    800061c4:	0017869b          	addiw	a3,a5,1
    800061c8:	08d4ac23          	sw	a3,152(s1)
    800061cc:	00070c9b          	sext.w	s9,a4
    800061d0:	f5371ee3          	bne	a4,s3,8000612c <consoleread+0x88>
    800061d4:	000b851b          	sext.w	a0,s7
    800061d8:	f96bf2e3          	bgeu	s7,s6,8000615c <consoleread+0xb8>
    800061dc:	08f4ac23          	sw	a5,152(s1)
    800061e0:	f7dff06f          	j	8000615c <consoleread+0xb8>

00000000800061e4 <consputc>:
    800061e4:	10000793          	li	a5,256
    800061e8:	00f50663          	beq	a0,a5,800061f4 <consputc+0x10>
    800061ec:	00001317          	auipc	t1,0x1
    800061f0:	9f430067          	jr	-1548(t1) # 80006be0 <uartputc_sync>
    800061f4:	ff010113          	addi	sp,sp,-16
    800061f8:	00113423          	sd	ra,8(sp)
    800061fc:	00813023          	sd	s0,0(sp)
    80006200:	01010413          	addi	s0,sp,16
    80006204:	00800513          	li	a0,8
    80006208:	00001097          	auipc	ra,0x1
    8000620c:	9d8080e7          	jalr	-1576(ra) # 80006be0 <uartputc_sync>
    80006210:	02000513          	li	a0,32
    80006214:	00001097          	auipc	ra,0x1
    80006218:	9cc080e7          	jalr	-1588(ra) # 80006be0 <uartputc_sync>
    8000621c:	00013403          	ld	s0,0(sp)
    80006220:	00813083          	ld	ra,8(sp)
    80006224:	00800513          	li	a0,8
    80006228:	01010113          	addi	sp,sp,16
    8000622c:	00001317          	auipc	t1,0x1
    80006230:	9b430067          	jr	-1612(t1) # 80006be0 <uartputc_sync>

0000000080006234 <consoleintr>:
    80006234:	fe010113          	addi	sp,sp,-32
    80006238:	00813823          	sd	s0,16(sp)
    8000623c:	00913423          	sd	s1,8(sp)
    80006240:	01213023          	sd	s2,0(sp)
    80006244:	00113c23          	sd	ra,24(sp)
    80006248:	02010413          	addi	s0,sp,32
    8000624c:	00005917          	auipc	s2,0x5
    80006250:	1cc90913          	addi	s2,s2,460 # 8000b418 <cons>
    80006254:	00050493          	mv	s1,a0
    80006258:	00090513          	mv	a0,s2
    8000625c:	00001097          	auipc	ra,0x1
    80006260:	e40080e7          	jalr	-448(ra) # 8000709c <acquire>
    80006264:	02048c63          	beqz	s1,8000629c <consoleintr+0x68>
    80006268:	0a092783          	lw	a5,160(s2)
    8000626c:	09892703          	lw	a4,152(s2)
    80006270:	07f00693          	li	a3,127
    80006274:	40e7873b          	subw	a4,a5,a4
    80006278:	02e6e263          	bltu	a3,a4,8000629c <consoleintr+0x68>
    8000627c:	00d00713          	li	a4,13
    80006280:	04e48063          	beq	s1,a4,800062c0 <consoleintr+0x8c>
    80006284:	07f7f713          	andi	a4,a5,127
    80006288:	00e90733          	add	a4,s2,a4
    8000628c:	0017879b          	addiw	a5,a5,1
    80006290:	0af92023          	sw	a5,160(s2)
    80006294:	00970c23          	sb	s1,24(a4)
    80006298:	08f92e23          	sw	a5,156(s2)
    8000629c:	01013403          	ld	s0,16(sp)
    800062a0:	01813083          	ld	ra,24(sp)
    800062a4:	00813483          	ld	s1,8(sp)
    800062a8:	00013903          	ld	s2,0(sp)
    800062ac:	00005517          	auipc	a0,0x5
    800062b0:	16c50513          	addi	a0,a0,364 # 8000b418 <cons>
    800062b4:	02010113          	addi	sp,sp,32
    800062b8:	00001317          	auipc	t1,0x1
    800062bc:	eb030067          	jr	-336(t1) # 80007168 <release>
    800062c0:	00a00493          	li	s1,10
    800062c4:	fc1ff06f          	j	80006284 <consoleintr+0x50>

00000000800062c8 <consoleinit>:
    800062c8:	fe010113          	addi	sp,sp,-32
    800062cc:	00113c23          	sd	ra,24(sp)
    800062d0:	00813823          	sd	s0,16(sp)
    800062d4:	00913423          	sd	s1,8(sp)
    800062d8:	02010413          	addi	s0,sp,32
    800062dc:	00005497          	auipc	s1,0x5
    800062e0:	13c48493          	addi	s1,s1,316 # 8000b418 <cons>
    800062e4:	00048513          	mv	a0,s1
    800062e8:	00002597          	auipc	a1,0x2
    800062ec:	48858593          	addi	a1,a1,1160 # 80008770 <CONSOLE_STATUS+0x760>
    800062f0:	00001097          	auipc	ra,0x1
    800062f4:	d88080e7          	jalr	-632(ra) # 80007078 <initlock>
    800062f8:	00000097          	auipc	ra,0x0
    800062fc:	7ac080e7          	jalr	1964(ra) # 80006aa4 <uartinit>
    80006300:	01813083          	ld	ra,24(sp)
    80006304:	01013403          	ld	s0,16(sp)
    80006308:	00000797          	auipc	a5,0x0
    8000630c:	d9c78793          	addi	a5,a5,-612 # 800060a4 <consoleread>
    80006310:	0af4bc23          	sd	a5,184(s1)
    80006314:	00000797          	auipc	a5,0x0
    80006318:	cec78793          	addi	a5,a5,-788 # 80006000 <consolewrite>
    8000631c:	0cf4b023          	sd	a5,192(s1)
    80006320:	00813483          	ld	s1,8(sp)
    80006324:	02010113          	addi	sp,sp,32
    80006328:	00008067          	ret

000000008000632c <console_read>:
    8000632c:	ff010113          	addi	sp,sp,-16
    80006330:	00813423          	sd	s0,8(sp)
    80006334:	01010413          	addi	s0,sp,16
    80006338:	00813403          	ld	s0,8(sp)
    8000633c:	00005317          	auipc	t1,0x5
    80006340:	19433303          	ld	t1,404(t1) # 8000b4d0 <devsw+0x10>
    80006344:	01010113          	addi	sp,sp,16
    80006348:	00030067          	jr	t1

000000008000634c <console_write>:
    8000634c:	ff010113          	addi	sp,sp,-16
    80006350:	00813423          	sd	s0,8(sp)
    80006354:	01010413          	addi	s0,sp,16
    80006358:	00813403          	ld	s0,8(sp)
    8000635c:	00005317          	auipc	t1,0x5
    80006360:	17c33303          	ld	t1,380(t1) # 8000b4d8 <devsw+0x18>
    80006364:	01010113          	addi	sp,sp,16
    80006368:	00030067          	jr	t1

000000008000636c <panic>:
    8000636c:	fe010113          	addi	sp,sp,-32
    80006370:	00113c23          	sd	ra,24(sp)
    80006374:	00813823          	sd	s0,16(sp)
    80006378:	00913423          	sd	s1,8(sp)
    8000637c:	02010413          	addi	s0,sp,32
    80006380:	00050493          	mv	s1,a0
    80006384:	00002517          	auipc	a0,0x2
    80006388:	3f450513          	addi	a0,a0,1012 # 80008778 <CONSOLE_STATUS+0x768>
    8000638c:	00005797          	auipc	a5,0x5
    80006390:	1e07a623          	sw	zero,492(a5) # 8000b578 <pr+0x18>
    80006394:	00000097          	auipc	ra,0x0
    80006398:	034080e7          	jalr	52(ra) # 800063c8 <__printf>
    8000639c:	00048513          	mv	a0,s1
    800063a0:	00000097          	auipc	ra,0x0
    800063a4:	028080e7          	jalr	40(ra) # 800063c8 <__printf>
    800063a8:	00002517          	auipc	a0,0x2
    800063ac:	fd050513          	addi	a0,a0,-48 # 80008378 <CONSOLE_STATUS+0x368>
    800063b0:	00000097          	auipc	ra,0x0
    800063b4:	018080e7          	jalr	24(ra) # 800063c8 <__printf>
    800063b8:	00100793          	li	a5,1
    800063bc:	00004717          	auipc	a4,0x4
    800063c0:	ecf72e23          	sw	a5,-292(a4) # 8000a298 <panicked>
    800063c4:	0000006f          	j	800063c4 <panic+0x58>

00000000800063c8 <__printf>:
    800063c8:	f3010113          	addi	sp,sp,-208
    800063cc:	08813023          	sd	s0,128(sp)
    800063d0:	07313423          	sd	s3,104(sp)
    800063d4:	09010413          	addi	s0,sp,144
    800063d8:	05813023          	sd	s8,64(sp)
    800063dc:	08113423          	sd	ra,136(sp)
    800063e0:	06913c23          	sd	s1,120(sp)
    800063e4:	07213823          	sd	s2,112(sp)
    800063e8:	07413023          	sd	s4,96(sp)
    800063ec:	05513c23          	sd	s5,88(sp)
    800063f0:	05613823          	sd	s6,80(sp)
    800063f4:	05713423          	sd	s7,72(sp)
    800063f8:	03913c23          	sd	s9,56(sp)
    800063fc:	03a13823          	sd	s10,48(sp)
    80006400:	03b13423          	sd	s11,40(sp)
    80006404:	00005317          	auipc	t1,0x5
    80006408:	15c30313          	addi	t1,t1,348 # 8000b560 <pr>
    8000640c:	01832c03          	lw	s8,24(t1)
    80006410:	00b43423          	sd	a1,8(s0)
    80006414:	00c43823          	sd	a2,16(s0)
    80006418:	00d43c23          	sd	a3,24(s0)
    8000641c:	02e43023          	sd	a4,32(s0)
    80006420:	02f43423          	sd	a5,40(s0)
    80006424:	03043823          	sd	a6,48(s0)
    80006428:	03143c23          	sd	a7,56(s0)
    8000642c:	00050993          	mv	s3,a0
    80006430:	4a0c1663          	bnez	s8,800068dc <__printf+0x514>
    80006434:	60098c63          	beqz	s3,80006a4c <__printf+0x684>
    80006438:	0009c503          	lbu	a0,0(s3)
    8000643c:	00840793          	addi	a5,s0,8
    80006440:	f6f43c23          	sd	a5,-136(s0)
    80006444:	00000493          	li	s1,0
    80006448:	22050063          	beqz	a0,80006668 <__printf+0x2a0>
    8000644c:	00002a37          	lui	s4,0x2
    80006450:	00018ab7          	lui	s5,0x18
    80006454:	000f4b37          	lui	s6,0xf4
    80006458:	00989bb7          	lui	s7,0x989
    8000645c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006460:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006464:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006468:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000646c:	00148c9b          	addiw	s9,s1,1
    80006470:	02500793          	li	a5,37
    80006474:	01998933          	add	s2,s3,s9
    80006478:	38f51263          	bne	a0,a5,800067fc <__printf+0x434>
    8000647c:	00094783          	lbu	a5,0(s2)
    80006480:	00078c9b          	sext.w	s9,a5
    80006484:	1e078263          	beqz	a5,80006668 <__printf+0x2a0>
    80006488:	0024849b          	addiw	s1,s1,2
    8000648c:	07000713          	li	a4,112
    80006490:	00998933          	add	s2,s3,s1
    80006494:	38e78a63          	beq	a5,a4,80006828 <__printf+0x460>
    80006498:	20f76863          	bltu	a4,a5,800066a8 <__printf+0x2e0>
    8000649c:	42a78863          	beq	a5,a0,800068cc <__printf+0x504>
    800064a0:	06400713          	li	a4,100
    800064a4:	40e79663          	bne	a5,a4,800068b0 <__printf+0x4e8>
    800064a8:	f7843783          	ld	a5,-136(s0)
    800064ac:	0007a603          	lw	a2,0(a5)
    800064b0:	00878793          	addi	a5,a5,8
    800064b4:	f6f43c23          	sd	a5,-136(s0)
    800064b8:	42064a63          	bltz	a2,800068ec <__printf+0x524>
    800064bc:	00a00713          	li	a4,10
    800064c0:	02e677bb          	remuw	a5,a2,a4
    800064c4:	00002d97          	auipc	s11,0x2
    800064c8:	2dcd8d93          	addi	s11,s11,732 # 800087a0 <digits>
    800064cc:	00900593          	li	a1,9
    800064d0:	0006051b          	sext.w	a0,a2
    800064d4:	00000c93          	li	s9,0
    800064d8:	02079793          	slli	a5,a5,0x20
    800064dc:	0207d793          	srli	a5,a5,0x20
    800064e0:	00fd87b3          	add	a5,s11,a5
    800064e4:	0007c783          	lbu	a5,0(a5)
    800064e8:	02e656bb          	divuw	a3,a2,a4
    800064ec:	f8f40023          	sb	a5,-128(s0)
    800064f0:	14c5d863          	bge	a1,a2,80006640 <__printf+0x278>
    800064f4:	06300593          	li	a1,99
    800064f8:	00100c93          	li	s9,1
    800064fc:	02e6f7bb          	remuw	a5,a3,a4
    80006500:	02079793          	slli	a5,a5,0x20
    80006504:	0207d793          	srli	a5,a5,0x20
    80006508:	00fd87b3          	add	a5,s11,a5
    8000650c:	0007c783          	lbu	a5,0(a5)
    80006510:	02e6d73b          	divuw	a4,a3,a4
    80006514:	f8f400a3          	sb	a5,-127(s0)
    80006518:	12a5f463          	bgeu	a1,a0,80006640 <__printf+0x278>
    8000651c:	00a00693          	li	a3,10
    80006520:	00900593          	li	a1,9
    80006524:	02d777bb          	remuw	a5,a4,a3
    80006528:	02079793          	slli	a5,a5,0x20
    8000652c:	0207d793          	srli	a5,a5,0x20
    80006530:	00fd87b3          	add	a5,s11,a5
    80006534:	0007c503          	lbu	a0,0(a5)
    80006538:	02d757bb          	divuw	a5,a4,a3
    8000653c:	f8a40123          	sb	a0,-126(s0)
    80006540:	48e5f263          	bgeu	a1,a4,800069c4 <__printf+0x5fc>
    80006544:	06300513          	li	a0,99
    80006548:	02d7f5bb          	remuw	a1,a5,a3
    8000654c:	02059593          	slli	a1,a1,0x20
    80006550:	0205d593          	srli	a1,a1,0x20
    80006554:	00bd85b3          	add	a1,s11,a1
    80006558:	0005c583          	lbu	a1,0(a1)
    8000655c:	02d7d7bb          	divuw	a5,a5,a3
    80006560:	f8b401a3          	sb	a1,-125(s0)
    80006564:	48e57263          	bgeu	a0,a4,800069e8 <__printf+0x620>
    80006568:	3e700513          	li	a0,999
    8000656c:	02d7f5bb          	remuw	a1,a5,a3
    80006570:	02059593          	slli	a1,a1,0x20
    80006574:	0205d593          	srli	a1,a1,0x20
    80006578:	00bd85b3          	add	a1,s11,a1
    8000657c:	0005c583          	lbu	a1,0(a1)
    80006580:	02d7d7bb          	divuw	a5,a5,a3
    80006584:	f8b40223          	sb	a1,-124(s0)
    80006588:	46e57663          	bgeu	a0,a4,800069f4 <__printf+0x62c>
    8000658c:	02d7f5bb          	remuw	a1,a5,a3
    80006590:	02059593          	slli	a1,a1,0x20
    80006594:	0205d593          	srli	a1,a1,0x20
    80006598:	00bd85b3          	add	a1,s11,a1
    8000659c:	0005c583          	lbu	a1,0(a1)
    800065a0:	02d7d7bb          	divuw	a5,a5,a3
    800065a4:	f8b402a3          	sb	a1,-123(s0)
    800065a8:	46ea7863          	bgeu	s4,a4,80006a18 <__printf+0x650>
    800065ac:	02d7f5bb          	remuw	a1,a5,a3
    800065b0:	02059593          	slli	a1,a1,0x20
    800065b4:	0205d593          	srli	a1,a1,0x20
    800065b8:	00bd85b3          	add	a1,s11,a1
    800065bc:	0005c583          	lbu	a1,0(a1)
    800065c0:	02d7d7bb          	divuw	a5,a5,a3
    800065c4:	f8b40323          	sb	a1,-122(s0)
    800065c8:	3eeaf863          	bgeu	s5,a4,800069b8 <__printf+0x5f0>
    800065cc:	02d7f5bb          	remuw	a1,a5,a3
    800065d0:	02059593          	slli	a1,a1,0x20
    800065d4:	0205d593          	srli	a1,a1,0x20
    800065d8:	00bd85b3          	add	a1,s11,a1
    800065dc:	0005c583          	lbu	a1,0(a1)
    800065e0:	02d7d7bb          	divuw	a5,a5,a3
    800065e4:	f8b403a3          	sb	a1,-121(s0)
    800065e8:	42eb7e63          	bgeu	s6,a4,80006a24 <__printf+0x65c>
    800065ec:	02d7f5bb          	remuw	a1,a5,a3
    800065f0:	02059593          	slli	a1,a1,0x20
    800065f4:	0205d593          	srli	a1,a1,0x20
    800065f8:	00bd85b3          	add	a1,s11,a1
    800065fc:	0005c583          	lbu	a1,0(a1)
    80006600:	02d7d7bb          	divuw	a5,a5,a3
    80006604:	f8b40423          	sb	a1,-120(s0)
    80006608:	42ebfc63          	bgeu	s7,a4,80006a40 <__printf+0x678>
    8000660c:	02079793          	slli	a5,a5,0x20
    80006610:	0207d793          	srli	a5,a5,0x20
    80006614:	00fd8db3          	add	s11,s11,a5
    80006618:	000dc703          	lbu	a4,0(s11)
    8000661c:	00a00793          	li	a5,10
    80006620:	00900c93          	li	s9,9
    80006624:	f8e404a3          	sb	a4,-119(s0)
    80006628:	00065c63          	bgez	a2,80006640 <__printf+0x278>
    8000662c:	f9040713          	addi	a4,s0,-112
    80006630:	00f70733          	add	a4,a4,a5
    80006634:	02d00693          	li	a3,45
    80006638:	fed70823          	sb	a3,-16(a4)
    8000663c:	00078c93          	mv	s9,a5
    80006640:	f8040793          	addi	a5,s0,-128
    80006644:	01978cb3          	add	s9,a5,s9
    80006648:	f7f40d13          	addi	s10,s0,-129
    8000664c:	000cc503          	lbu	a0,0(s9)
    80006650:	fffc8c93          	addi	s9,s9,-1
    80006654:	00000097          	auipc	ra,0x0
    80006658:	b90080e7          	jalr	-1136(ra) # 800061e4 <consputc>
    8000665c:	ffac98e3          	bne	s9,s10,8000664c <__printf+0x284>
    80006660:	00094503          	lbu	a0,0(s2)
    80006664:	e00514e3          	bnez	a0,8000646c <__printf+0xa4>
    80006668:	1a0c1663          	bnez	s8,80006814 <__printf+0x44c>
    8000666c:	08813083          	ld	ra,136(sp)
    80006670:	08013403          	ld	s0,128(sp)
    80006674:	07813483          	ld	s1,120(sp)
    80006678:	07013903          	ld	s2,112(sp)
    8000667c:	06813983          	ld	s3,104(sp)
    80006680:	06013a03          	ld	s4,96(sp)
    80006684:	05813a83          	ld	s5,88(sp)
    80006688:	05013b03          	ld	s6,80(sp)
    8000668c:	04813b83          	ld	s7,72(sp)
    80006690:	04013c03          	ld	s8,64(sp)
    80006694:	03813c83          	ld	s9,56(sp)
    80006698:	03013d03          	ld	s10,48(sp)
    8000669c:	02813d83          	ld	s11,40(sp)
    800066a0:	0d010113          	addi	sp,sp,208
    800066a4:	00008067          	ret
    800066a8:	07300713          	li	a4,115
    800066ac:	1ce78a63          	beq	a5,a4,80006880 <__printf+0x4b8>
    800066b0:	07800713          	li	a4,120
    800066b4:	1ee79e63          	bne	a5,a4,800068b0 <__printf+0x4e8>
    800066b8:	f7843783          	ld	a5,-136(s0)
    800066bc:	0007a703          	lw	a4,0(a5)
    800066c0:	00878793          	addi	a5,a5,8
    800066c4:	f6f43c23          	sd	a5,-136(s0)
    800066c8:	28074263          	bltz	a4,8000694c <__printf+0x584>
    800066cc:	00002d97          	auipc	s11,0x2
    800066d0:	0d4d8d93          	addi	s11,s11,212 # 800087a0 <digits>
    800066d4:	00f77793          	andi	a5,a4,15
    800066d8:	00fd87b3          	add	a5,s11,a5
    800066dc:	0007c683          	lbu	a3,0(a5)
    800066e0:	00f00613          	li	a2,15
    800066e4:	0007079b          	sext.w	a5,a4
    800066e8:	f8d40023          	sb	a3,-128(s0)
    800066ec:	0047559b          	srliw	a1,a4,0x4
    800066f0:	0047569b          	srliw	a3,a4,0x4
    800066f4:	00000c93          	li	s9,0
    800066f8:	0ee65063          	bge	a2,a4,800067d8 <__printf+0x410>
    800066fc:	00f6f693          	andi	a3,a3,15
    80006700:	00dd86b3          	add	a3,s11,a3
    80006704:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006708:	0087d79b          	srliw	a5,a5,0x8
    8000670c:	00100c93          	li	s9,1
    80006710:	f8d400a3          	sb	a3,-127(s0)
    80006714:	0cb67263          	bgeu	a2,a1,800067d8 <__printf+0x410>
    80006718:	00f7f693          	andi	a3,a5,15
    8000671c:	00dd86b3          	add	a3,s11,a3
    80006720:	0006c583          	lbu	a1,0(a3)
    80006724:	00f00613          	li	a2,15
    80006728:	0047d69b          	srliw	a3,a5,0x4
    8000672c:	f8b40123          	sb	a1,-126(s0)
    80006730:	0047d593          	srli	a1,a5,0x4
    80006734:	28f67e63          	bgeu	a2,a5,800069d0 <__printf+0x608>
    80006738:	00f6f693          	andi	a3,a3,15
    8000673c:	00dd86b3          	add	a3,s11,a3
    80006740:	0006c503          	lbu	a0,0(a3)
    80006744:	0087d813          	srli	a6,a5,0x8
    80006748:	0087d69b          	srliw	a3,a5,0x8
    8000674c:	f8a401a3          	sb	a0,-125(s0)
    80006750:	28b67663          	bgeu	a2,a1,800069dc <__printf+0x614>
    80006754:	00f6f693          	andi	a3,a3,15
    80006758:	00dd86b3          	add	a3,s11,a3
    8000675c:	0006c583          	lbu	a1,0(a3)
    80006760:	00c7d513          	srli	a0,a5,0xc
    80006764:	00c7d69b          	srliw	a3,a5,0xc
    80006768:	f8b40223          	sb	a1,-124(s0)
    8000676c:	29067a63          	bgeu	a2,a6,80006a00 <__printf+0x638>
    80006770:	00f6f693          	andi	a3,a3,15
    80006774:	00dd86b3          	add	a3,s11,a3
    80006778:	0006c583          	lbu	a1,0(a3)
    8000677c:	0107d813          	srli	a6,a5,0x10
    80006780:	0107d69b          	srliw	a3,a5,0x10
    80006784:	f8b402a3          	sb	a1,-123(s0)
    80006788:	28a67263          	bgeu	a2,a0,80006a0c <__printf+0x644>
    8000678c:	00f6f693          	andi	a3,a3,15
    80006790:	00dd86b3          	add	a3,s11,a3
    80006794:	0006c683          	lbu	a3,0(a3)
    80006798:	0147d79b          	srliw	a5,a5,0x14
    8000679c:	f8d40323          	sb	a3,-122(s0)
    800067a0:	21067663          	bgeu	a2,a6,800069ac <__printf+0x5e4>
    800067a4:	02079793          	slli	a5,a5,0x20
    800067a8:	0207d793          	srli	a5,a5,0x20
    800067ac:	00fd8db3          	add	s11,s11,a5
    800067b0:	000dc683          	lbu	a3,0(s11)
    800067b4:	00800793          	li	a5,8
    800067b8:	00700c93          	li	s9,7
    800067bc:	f8d403a3          	sb	a3,-121(s0)
    800067c0:	00075c63          	bgez	a4,800067d8 <__printf+0x410>
    800067c4:	f9040713          	addi	a4,s0,-112
    800067c8:	00f70733          	add	a4,a4,a5
    800067cc:	02d00693          	li	a3,45
    800067d0:	fed70823          	sb	a3,-16(a4)
    800067d4:	00078c93          	mv	s9,a5
    800067d8:	f8040793          	addi	a5,s0,-128
    800067dc:	01978cb3          	add	s9,a5,s9
    800067e0:	f7f40d13          	addi	s10,s0,-129
    800067e4:	000cc503          	lbu	a0,0(s9)
    800067e8:	fffc8c93          	addi	s9,s9,-1
    800067ec:	00000097          	auipc	ra,0x0
    800067f0:	9f8080e7          	jalr	-1544(ra) # 800061e4 <consputc>
    800067f4:	ff9d18e3          	bne	s10,s9,800067e4 <__printf+0x41c>
    800067f8:	0100006f          	j	80006808 <__printf+0x440>
    800067fc:	00000097          	auipc	ra,0x0
    80006800:	9e8080e7          	jalr	-1560(ra) # 800061e4 <consputc>
    80006804:	000c8493          	mv	s1,s9
    80006808:	00094503          	lbu	a0,0(s2)
    8000680c:	c60510e3          	bnez	a0,8000646c <__printf+0xa4>
    80006810:	e40c0ee3          	beqz	s8,8000666c <__printf+0x2a4>
    80006814:	00005517          	auipc	a0,0x5
    80006818:	d4c50513          	addi	a0,a0,-692 # 8000b560 <pr>
    8000681c:	00001097          	auipc	ra,0x1
    80006820:	94c080e7          	jalr	-1716(ra) # 80007168 <release>
    80006824:	e49ff06f          	j	8000666c <__printf+0x2a4>
    80006828:	f7843783          	ld	a5,-136(s0)
    8000682c:	03000513          	li	a0,48
    80006830:	01000d13          	li	s10,16
    80006834:	00878713          	addi	a4,a5,8
    80006838:	0007bc83          	ld	s9,0(a5)
    8000683c:	f6e43c23          	sd	a4,-136(s0)
    80006840:	00000097          	auipc	ra,0x0
    80006844:	9a4080e7          	jalr	-1628(ra) # 800061e4 <consputc>
    80006848:	07800513          	li	a0,120
    8000684c:	00000097          	auipc	ra,0x0
    80006850:	998080e7          	jalr	-1640(ra) # 800061e4 <consputc>
    80006854:	00002d97          	auipc	s11,0x2
    80006858:	f4cd8d93          	addi	s11,s11,-180 # 800087a0 <digits>
    8000685c:	03ccd793          	srli	a5,s9,0x3c
    80006860:	00fd87b3          	add	a5,s11,a5
    80006864:	0007c503          	lbu	a0,0(a5)
    80006868:	fffd0d1b          	addiw	s10,s10,-1
    8000686c:	004c9c93          	slli	s9,s9,0x4
    80006870:	00000097          	auipc	ra,0x0
    80006874:	974080e7          	jalr	-1676(ra) # 800061e4 <consputc>
    80006878:	fe0d12e3          	bnez	s10,8000685c <__printf+0x494>
    8000687c:	f8dff06f          	j	80006808 <__printf+0x440>
    80006880:	f7843783          	ld	a5,-136(s0)
    80006884:	0007bc83          	ld	s9,0(a5)
    80006888:	00878793          	addi	a5,a5,8
    8000688c:	f6f43c23          	sd	a5,-136(s0)
    80006890:	000c9a63          	bnez	s9,800068a4 <__printf+0x4dc>
    80006894:	1080006f          	j	8000699c <__printf+0x5d4>
    80006898:	001c8c93          	addi	s9,s9,1
    8000689c:	00000097          	auipc	ra,0x0
    800068a0:	948080e7          	jalr	-1720(ra) # 800061e4 <consputc>
    800068a4:	000cc503          	lbu	a0,0(s9)
    800068a8:	fe0518e3          	bnez	a0,80006898 <__printf+0x4d0>
    800068ac:	f5dff06f          	j	80006808 <__printf+0x440>
    800068b0:	02500513          	li	a0,37
    800068b4:	00000097          	auipc	ra,0x0
    800068b8:	930080e7          	jalr	-1744(ra) # 800061e4 <consputc>
    800068bc:	000c8513          	mv	a0,s9
    800068c0:	00000097          	auipc	ra,0x0
    800068c4:	924080e7          	jalr	-1756(ra) # 800061e4 <consputc>
    800068c8:	f41ff06f          	j	80006808 <__printf+0x440>
    800068cc:	02500513          	li	a0,37
    800068d0:	00000097          	auipc	ra,0x0
    800068d4:	914080e7          	jalr	-1772(ra) # 800061e4 <consputc>
    800068d8:	f31ff06f          	j	80006808 <__printf+0x440>
    800068dc:	00030513          	mv	a0,t1
    800068e0:	00000097          	auipc	ra,0x0
    800068e4:	7bc080e7          	jalr	1980(ra) # 8000709c <acquire>
    800068e8:	b4dff06f          	j	80006434 <__printf+0x6c>
    800068ec:	40c0053b          	negw	a0,a2
    800068f0:	00a00713          	li	a4,10
    800068f4:	02e576bb          	remuw	a3,a0,a4
    800068f8:	00002d97          	auipc	s11,0x2
    800068fc:	ea8d8d93          	addi	s11,s11,-344 # 800087a0 <digits>
    80006900:	ff700593          	li	a1,-9
    80006904:	02069693          	slli	a3,a3,0x20
    80006908:	0206d693          	srli	a3,a3,0x20
    8000690c:	00dd86b3          	add	a3,s11,a3
    80006910:	0006c683          	lbu	a3,0(a3)
    80006914:	02e557bb          	divuw	a5,a0,a4
    80006918:	f8d40023          	sb	a3,-128(s0)
    8000691c:	10b65e63          	bge	a2,a1,80006a38 <__printf+0x670>
    80006920:	06300593          	li	a1,99
    80006924:	02e7f6bb          	remuw	a3,a5,a4
    80006928:	02069693          	slli	a3,a3,0x20
    8000692c:	0206d693          	srli	a3,a3,0x20
    80006930:	00dd86b3          	add	a3,s11,a3
    80006934:	0006c683          	lbu	a3,0(a3)
    80006938:	02e7d73b          	divuw	a4,a5,a4
    8000693c:	00200793          	li	a5,2
    80006940:	f8d400a3          	sb	a3,-127(s0)
    80006944:	bca5ece3          	bltu	a1,a0,8000651c <__printf+0x154>
    80006948:	ce5ff06f          	j	8000662c <__printf+0x264>
    8000694c:	40e007bb          	negw	a5,a4
    80006950:	00002d97          	auipc	s11,0x2
    80006954:	e50d8d93          	addi	s11,s11,-432 # 800087a0 <digits>
    80006958:	00f7f693          	andi	a3,a5,15
    8000695c:	00dd86b3          	add	a3,s11,a3
    80006960:	0006c583          	lbu	a1,0(a3)
    80006964:	ff100613          	li	a2,-15
    80006968:	0047d69b          	srliw	a3,a5,0x4
    8000696c:	f8b40023          	sb	a1,-128(s0)
    80006970:	0047d59b          	srliw	a1,a5,0x4
    80006974:	0ac75e63          	bge	a4,a2,80006a30 <__printf+0x668>
    80006978:	00f6f693          	andi	a3,a3,15
    8000697c:	00dd86b3          	add	a3,s11,a3
    80006980:	0006c603          	lbu	a2,0(a3)
    80006984:	00f00693          	li	a3,15
    80006988:	0087d79b          	srliw	a5,a5,0x8
    8000698c:	f8c400a3          	sb	a2,-127(s0)
    80006990:	d8b6e4e3          	bltu	a3,a1,80006718 <__printf+0x350>
    80006994:	00200793          	li	a5,2
    80006998:	e2dff06f          	j	800067c4 <__printf+0x3fc>
    8000699c:	00002c97          	auipc	s9,0x2
    800069a0:	de4c8c93          	addi	s9,s9,-540 # 80008780 <CONSOLE_STATUS+0x770>
    800069a4:	02800513          	li	a0,40
    800069a8:	ef1ff06f          	j	80006898 <__printf+0x4d0>
    800069ac:	00700793          	li	a5,7
    800069b0:	00600c93          	li	s9,6
    800069b4:	e0dff06f          	j	800067c0 <__printf+0x3f8>
    800069b8:	00700793          	li	a5,7
    800069bc:	00600c93          	li	s9,6
    800069c0:	c69ff06f          	j	80006628 <__printf+0x260>
    800069c4:	00300793          	li	a5,3
    800069c8:	00200c93          	li	s9,2
    800069cc:	c5dff06f          	j	80006628 <__printf+0x260>
    800069d0:	00300793          	li	a5,3
    800069d4:	00200c93          	li	s9,2
    800069d8:	de9ff06f          	j	800067c0 <__printf+0x3f8>
    800069dc:	00400793          	li	a5,4
    800069e0:	00300c93          	li	s9,3
    800069e4:	dddff06f          	j	800067c0 <__printf+0x3f8>
    800069e8:	00400793          	li	a5,4
    800069ec:	00300c93          	li	s9,3
    800069f0:	c39ff06f          	j	80006628 <__printf+0x260>
    800069f4:	00500793          	li	a5,5
    800069f8:	00400c93          	li	s9,4
    800069fc:	c2dff06f          	j	80006628 <__printf+0x260>
    80006a00:	00500793          	li	a5,5
    80006a04:	00400c93          	li	s9,4
    80006a08:	db9ff06f          	j	800067c0 <__printf+0x3f8>
    80006a0c:	00600793          	li	a5,6
    80006a10:	00500c93          	li	s9,5
    80006a14:	dadff06f          	j	800067c0 <__printf+0x3f8>
    80006a18:	00600793          	li	a5,6
    80006a1c:	00500c93          	li	s9,5
    80006a20:	c09ff06f          	j	80006628 <__printf+0x260>
    80006a24:	00800793          	li	a5,8
    80006a28:	00700c93          	li	s9,7
    80006a2c:	bfdff06f          	j	80006628 <__printf+0x260>
    80006a30:	00100793          	li	a5,1
    80006a34:	d91ff06f          	j	800067c4 <__printf+0x3fc>
    80006a38:	00100793          	li	a5,1
    80006a3c:	bf1ff06f          	j	8000662c <__printf+0x264>
    80006a40:	00900793          	li	a5,9
    80006a44:	00800c93          	li	s9,8
    80006a48:	be1ff06f          	j	80006628 <__printf+0x260>
    80006a4c:	00002517          	auipc	a0,0x2
    80006a50:	d3c50513          	addi	a0,a0,-708 # 80008788 <CONSOLE_STATUS+0x778>
    80006a54:	00000097          	auipc	ra,0x0
    80006a58:	918080e7          	jalr	-1768(ra) # 8000636c <panic>

0000000080006a5c <printfinit>:
    80006a5c:	fe010113          	addi	sp,sp,-32
    80006a60:	00813823          	sd	s0,16(sp)
    80006a64:	00913423          	sd	s1,8(sp)
    80006a68:	00113c23          	sd	ra,24(sp)
    80006a6c:	02010413          	addi	s0,sp,32
    80006a70:	00005497          	auipc	s1,0x5
    80006a74:	af048493          	addi	s1,s1,-1296 # 8000b560 <pr>
    80006a78:	00048513          	mv	a0,s1
    80006a7c:	00002597          	auipc	a1,0x2
    80006a80:	d1c58593          	addi	a1,a1,-740 # 80008798 <CONSOLE_STATUS+0x788>
    80006a84:	00000097          	auipc	ra,0x0
    80006a88:	5f4080e7          	jalr	1524(ra) # 80007078 <initlock>
    80006a8c:	01813083          	ld	ra,24(sp)
    80006a90:	01013403          	ld	s0,16(sp)
    80006a94:	0004ac23          	sw	zero,24(s1)
    80006a98:	00813483          	ld	s1,8(sp)
    80006a9c:	02010113          	addi	sp,sp,32
    80006aa0:	00008067          	ret

0000000080006aa4 <uartinit>:
    80006aa4:	ff010113          	addi	sp,sp,-16
    80006aa8:	00813423          	sd	s0,8(sp)
    80006aac:	01010413          	addi	s0,sp,16
    80006ab0:	100007b7          	lui	a5,0x10000
    80006ab4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006ab8:	f8000713          	li	a4,-128
    80006abc:	00e781a3          	sb	a4,3(a5)
    80006ac0:	00300713          	li	a4,3
    80006ac4:	00e78023          	sb	a4,0(a5)
    80006ac8:	000780a3          	sb	zero,1(a5)
    80006acc:	00e781a3          	sb	a4,3(a5)
    80006ad0:	00700693          	li	a3,7
    80006ad4:	00d78123          	sb	a3,2(a5)
    80006ad8:	00e780a3          	sb	a4,1(a5)
    80006adc:	00813403          	ld	s0,8(sp)
    80006ae0:	01010113          	addi	sp,sp,16
    80006ae4:	00008067          	ret

0000000080006ae8 <uartputc>:
    80006ae8:	00003797          	auipc	a5,0x3
    80006aec:	7b07a783          	lw	a5,1968(a5) # 8000a298 <panicked>
    80006af0:	00078463          	beqz	a5,80006af8 <uartputc+0x10>
    80006af4:	0000006f          	j	80006af4 <uartputc+0xc>
    80006af8:	fd010113          	addi	sp,sp,-48
    80006afc:	02813023          	sd	s0,32(sp)
    80006b00:	00913c23          	sd	s1,24(sp)
    80006b04:	01213823          	sd	s2,16(sp)
    80006b08:	01313423          	sd	s3,8(sp)
    80006b0c:	02113423          	sd	ra,40(sp)
    80006b10:	03010413          	addi	s0,sp,48
    80006b14:	00003917          	auipc	s2,0x3
    80006b18:	78c90913          	addi	s2,s2,1932 # 8000a2a0 <uart_tx_r>
    80006b1c:	00093783          	ld	a5,0(s2)
    80006b20:	00003497          	auipc	s1,0x3
    80006b24:	78848493          	addi	s1,s1,1928 # 8000a2a8 <uart_tx_w>
    80006b28:	0004b703          	ld	a4,0(s1)
    80006b2c:	02078693          	addi	a3,a5,32
    80006b30:	00050993          	mv	s3,a0
    80006b34:	02e69c63          	bne	a3,a4,80006b6c <uartputc+0x84>
    80006b38:	00001097          	auipc	ra,0x1
    80006b3c:	834080e7          	jalr	-1996(ra) # 8000736c <push_on>
    80006b40:	00093783          	ld	a5,0(s2)
    80006b44:	0004b703          	ld	a4,0(s1)
    80006b48:	02078793          	addi	a5,a5,32
    80006b4c:	00e79463          	bne	a5,a4,80006b54 <uartputc+0x6c>
    80006b50:	0000006f          	j	80006b50 <uartputc+0x68>
    80006b54:	00001097          	auipc	ra,0x1
    80006b58:	88c080e7          	jalr	-1908(ra) # 800073e0 <pop_on>
    80006b5c:	00093783          	ld	a5,0(s2)
    80006b60:	0004b703          	ld	a4,0(s1)
    80006b64:	02078693          	addi	a3,a5,32
    80006b68:	fce688e3          	beq	a3,a4,80006b38 <uartputc+0x50>
    80006b6c:	01f77693          	andi	a3,a4,31
    80006b70:	00005597          	auipc	a1,0x5
    80006b74:	a1058593          	addi	a1,a1,-1520 # 8000b580 <uart_tx_buf>
    80006b78:	00d586b3          	add	a3,a1,a3
    80006b7c:	00170713          	addi	a4,a4,1
    80006b80:	01368023          	sb	s3,0(a3)
    80006b84:	00e4b023          	sd	a4,0(s1)
    80006b88:	10000637          	lui	a2,0x10000
    80006b8c:	02f71063          	bne	a4,a5,80006bac <uartputc+0xc4>
    80006b90:	0340006f          	j	80006bc4 <uartputc+0xdc>
    80006b94:	00074703          	lbu	a4,0(a4)
    80006b98:	00f93023          	sd	a5,0(s2)
    80006b9c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006ba0:	00093783          	ld	a5,0(s2)
    80006ba4:	0004b703          	ld	a4,0(s1)
    80006ba8:	00f70e63          	beq	a4,a5,80006bc4 <uartputc+0xdc>
    80006bac:	00564683          	lbu	a3,5(a2)
    80006bb0:	01f7f713          	andi	a4,a5,31
    80006bb4:	00e58733          	add	a4,a1,a4
    80006bb8:	0206f693          	andi	a3,a3,32
    80006bbc:	00178793          	addi	a5,a5,1
    80006bc0:	fc069ae3          	bnez	a3,80006b94 <uartputc+0xac>
    80006bc4:	02813083          	ld	ra,40(sp)
    80006bc8:	02013403          	ld	s0,32(sp)
    80006bcc:	01813483          	ld	s1,24(sp)
    80006bd0:	01013903          	ld	s2,16(sp)
    80006bd4:	00813983          	ld	s3,8(sp)
    80006bd8:	03010113          	addi	sp,sp,48
    80006bdc:	00008067          	ret

0000000080006be0 <uartputc_sync>:
    80006be0:	ff010113          	addi	sp,sp,-16
    80006be4:	00813423          	sd	s0,8(sp)
    80006be8:	01010413          	addi	s0,sp,16
    80006bec:	00003717          	auipc	a4,0x3
    80006bf0:	6ac72703          	lw	a4,1708(a4) # 8000a298 <panicked>
    80006bf4:	02071663          	bnez	a4,80006c20 <uartputc_sync+0x40>
    80006bf8:	00050793          	mv	a5,a0
    80006bfc:	100006b7          	lui	a3,0x10000
    80006c00:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006c04:	02077713          	andi	a4,a4,32
    80006c08:	fe070ce3          	beqz	a4,80006c00 <uartputc_sync+0x20>
    80006c0c:	0ff7f793          	andi	a5,a5,255
    80006c10:	00f68023          	sb	a5,0(a3)
    80006c14:	00813403          	ld	s0,8(sp)
    80006c18:	01010113          	addi	sp,sp,16
    80006c1c:	00008067          	ret
    80006c20:	0000006f          	j	80006c20 <uartputc_sync+0x40>

0000000080006c24 <uartstart>:
    80006c24:	ff010113          	addi	sp,sp,-16
    80006c28:	00813423          	sd	s0,8(sp)
    80006c2c:	01010413          	addi	s0,sp,16
    80006c30:	00003617          	auipc	a2,0x3
    80006c34:	67060613          	addi	a2,a2,1648 # 8000a2a0 <uart_tx_r>
    80006c38:	00003517          	auipc	a0,0x3
    80006c3c:	67050513          	addi	a0,a0,1648 # 8000a2a8 <uart_tx_w>
    80006c40:	00063783          	ld	a5,0(a2)
    80006c44:	00053703          	ld	a4,0(a0)
    80006c48:	04f70263          	beq	a4,a5,80006c8c <uartstart+0x68>
    80006c4c:	100005b7          	lui	a1,0x10000
    80006c50:	00005817          	auipc	a6,0x5
    80006c54:	93080813          	addi	a6,a6,-1744 # 8000b580 <uart_tx_buf>
    80006c58:	01c0006f          	j	80006c74 <uartstart+0x50>
    80006c5c:	0006c703          	lbu	a4,0(a3)
    80006c60:	00f63023          	sd	a5,0(a2)
    80006c64:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006c68:	00063783          	ld	a5,0(a2)
    80006c6c:	00053703          	ld	a4,0(a0)
    80006c70:	00f70e63          	beq	a4,a5,80006c8c <uartstart+0x68>
    80006c74:	01f7f713          	andi	a4,a5,31
    80006c78:	00e806b3          	add	a3,a6,a4
    80006c7c:	0055c703          	lbu	a4,5(a1)
    80006c80:	00178793          	addi	a5,a5,1
    80006c84:	02077713          	andi	a4,a4,32
    80006c88:	fc071ae3          	bnez	a4,80006c5c <uartstart+0x38>
    80006c8c:	00813403          	ld	s0,8(sp)
    80006c90:	01010113          	addi	sp,sp,16
    80006c94:	00008067          	ret

0000000080006c98 <uartgetc>:
    80006c98:	ff010113          	addi	sp,sp,-16
    80006c9c:	00813423          	sd	s0,8(sp)
    80006ca0:	01010413          	addi	s0,sp,16
    80006ca4:	10000737          	lui	a4,0x10000
    80006ca8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006cac:	0017f793          	andi	a5,a5,1
    80006cb0:	00078c63          	beqz	a5,80006cc8 <uartgetc+0x30>
    80006cb4:	00074503          	lbu	a0,0(a4)
    80006cb8:	0ff57513          	andi	a0,a0,255
    80006cbc:	00813403          	ld	s0,8(sp)
    80006cc0:	01010113          	addi	sp,sp,16
    80006cc4:	00008067          	ret
    80006cc8:	fff00513          	li	a0,-1
    80006ccc:	ff1ff06f          	j	80006cbc <uartgetc+0x24>

0000000080006cd0 <uartintr>:
    80006cd0:	100007b7          	lui	a5,0x10000
    80006cd4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006cd8:	0017f793          	andi	a5,a5,1
    80006cdc:	0a078463          	beqz	a5,80006d84 <uartintr+0xb4>
    80006ce0:	fe010113          	addi	sp,sp,-32
    80006ce4:	00813823          	sd	s0,16(sp)
    80006ce8:	00913423          	sd	s1,8(sp)
    80006cec:	00113c23          	sd	ra,24(sp)
    80006cf0:	02010413          	addi	s0,sp,32
    80006cf4:	100004b7          	lui	s1,0x10000
    80006cf8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006cfc:	0ff57513          	andi	a0,a0,255
    80006d00:	fffff097          	auipc	ra,0xfffff
    80006d04:	534080e7          	jalr	1332(ra) # 80006234 <consoleintr>
    80006d08:	0054c783          	lbu	a5,5(s1)
    80006d0c:	0017f793          	andi	a5,a5,1
    80006d10:	fe0794e3          	bnez	a5,80006cf8 <uartintr+0x28>
    80006d14:	00003617          	auipc	a2,0x3
    80006d18:	58c60613          	addi	a2,a2,1420 # 8000a2a0 <uart_tx_r>
    80006d1c:	00003517          	auipc	a0,0x3
    80006d20:	58c50513          	addi	a0,a0,1420 # 8000a2a8 <uart_tx_w>
    80006d24:	00063783          	ld	a5,0(a2)
    80006d28:	00053703          	ld	a4,0(a0)
    80006d2c:	04f70263          	beq	a4,a5,80006d70 <uartintr+0xa0>
    80006d30:	100005b7          	lui	a1,0x10000
    80006d34:	00005817          	auipc	a6,0x5
    80006d38:	84c80813          	addi	a6,a6,-1972 # 8000b580 <uart_tx_buf>
    80006d3c:	01c0006f          	j	80006d58 <uartintr+0x88>
    80006d40:	0006c703          	lbu	a4,0(a3)
    80006d44:	00f63023          	sd	a5,0(a2)
    80006d48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006d4c:	00063783          	ld	a5,0(a2)
    80006d50:	00053703          	ld	a4,0(a0)
    80006d54:	00f70e63          	beq	a4,a5,80006d70 <uartintr+0xa0>
    80006d58:	01f7f713          	andi	a4,a5,31
    80006d5c:	00e806b3          	add	a3,a6,a4
    80006d60:	0055c703          	lbu	a4,5(a1)
    80006d64:	00178793          	addi	a5,a5,1
    80006d68:	02077713          	andi	a4,a4,32
    80006d6c:	fc071ae3          	bnez	a4,80006d40 <uartintr+0x70>
    80006d70:	01813083          	ld	ra,24(sp)
    80006d74:	01013403          	ld	s0,16(sp)
    80006d78:	00813483          	ld	s1,8(sp)
    80006d7c:	02010113          	addi	sp,sp,32
    80006d80:	00008067          	ret
    80006d84:	00003617          	auipc	a2,0x3
    80006d88:	51c60613          	addi	a2,a2,1308 # 8000a2a0 <uart_tx_r>
    80006d8c:	00003517          	auipc	a0,0x3
    80006d90:	51c50513          	addi	a0,a0,1308 # 8000a2a8 <uart_tx_w>
    80006d94:	00063783          	ld	a5,0(a2)
    80006d98:	00053703          	ld	a4,0(a0)
    80006d9c:	04f70263          	beq	a4,a5,80006de0 <uartintr+0x110>
    80006da0:	100005b7          	lui	a1,0x10000
    80006da4:	00004817          	auipc	a6,0x4
    80006da8:	7dc80813          	addi	a6,a6,2012 # 8000b580 <uart_tx_buf>
    80006dac:	01c0006f          	j	80006dc8 <uartintr+0xf8>
    80006db0:	0006c703          	lbu	a4,0(a3)
    80006db4:	00f63023          	sd	a5,0(a2)
    80006db8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006dbc:	00063783          	ld	a5,0(a2)
    80006dc0:	00053703          	ld	a4,0(a0)
    80006dc4:	02f70063          	beq	a4,a5,80006de4 <uartintr+0x114>
    80006dc8:	01f7f713          	andi	a4,a5,31
    80006dcc:	00e806b3          	add	a3,a6,a4
    80006dd0:	0055c703          	lbu	a4,5(a1)
    80006dd4:	00178793          	addi	a5,a5,1
    80006dd8:	02077713          	andi	a4,a4,32
    80006ddc:	fc071ae3          	bnez	a4,80006db0 <uartintr+0xe0>
    80006de0:	00008067          	ret
    80006de4:	00008067          	ret

0000000080006de8 <kinit>:
    80006de8:	fc010113          	addi	sp,sp,-64
    80006dec:	02913423          	sd	s1,40(sp)
    80006df0:	fffff7b7          	lui	a5,0xfffff
    80006df4:	00005497          	auipc	s1,0x5
    80006df8:	7ab48493          	addi	s1,s1,1963 # 8000c59f <end+0xfff>
    80006dfc:	02813823          	sd	s0,48(sp)
    80006e00:	01313c23          	sd	s3,24(sp)
    80006e04:	00f4f4b3          	and	s1,s1,a5
    80006e08:	02113c23          	sd	ra,56(sp)
    80006e0c:	03213023          	sd	s2,32(sp)
    80006e10:	01413823          	sd	s4,16(sp)
    80006e14:	01513423          	sd	s5,8(sp)
    80006e18:	04010413          	addi	s0,sp,64
    80006e1c:	000017b7          	lui	a5,0x1
    80006e20:	01100993          	li	s3,17
    80006e24:	00f487b3          	add	a5,s1,a5
    80006e28:	01b99993          	slli	s3,s3,0x1b
    80006e2c:	06f9e063          	bltu	s3,a5,80006e8c <kinit+0xa4>
    80006e30:	00004a97          	auipc	s5,0x4
    80006e34:	770a8a93          	addi	s5,s5,1904 # 8000b5a0 <end>
    80006e38:	0754ec63          	bltu	s1,s5,80006eb0 <kinit+0xc8>
    80006e3c:	0734fa63          	bgeu	s1,s3,80006eb0 <kinit+0xc8>
    80006e40:	00088a37          	lui	s4,0x88
    80006e44:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006e48:	00003917          	auipc	s2,0x3
    80006e4c:	46890913          	addi	s2,s2,1128 # 8000a2b0 <kmem>
    80006e50:	00ca1a13          	slli	s4,s4,0xc
    80006e54:	0140006f          	j	80006e68 <kinit+0x80>
    80006e58:	000017b7          	lui	a5,0x1
    80006e5c:	00f484b3          	add	s1,s1,a5
    80006e60:	0554e863          	bltu	s1,s5,80006eb0 <kinit+0xc8>
    80006e64:	0534f663          	bgeu	s1,s3,80006eb0 <kinit+0xc8>
    80006e68:	00001637          	lui	a2,0x1
    80006e6c:	00100593          	li	a1,1
    80006e70:	00048513          	mv	a0,s1
    80006e74:	00000097          	auipc	ra,0x0
    80006e78:	5e4080e7          	jalr	1508(ra) # 80007458 <__memset>
    80006e7c:	00093783          	ld	a5,0(s2)
    80006e80:	00f4b023          	sd	a5,0(s1)
    80006e84:	00993023          	sd	s1,0(s2)
    80006e88:	fd4498e3          	bne	s1,s4,80006e58 <kinit+0x70>
    80006e8c:	03813083          	ld	ra,56(sp)
    80006e90:	03013403          	ld	s0,48(sp)
    80006e94:	02813483          	ld	s1,40(sp)
    80006e98:	02013903          	ld	s2,32(sp)
    80006e9c:	01813983          	ld	s3,24(sp)
    80006ea0:	01013a03          	ld	s4,16(sp)
    80006ea4:	00813a83          	ld	s5,8(sp)
    80006ea8:	04010113          	addi	sp,sp,64
    80006eac:	00008067          	ret
    80006eb0:	00002517          	auipc	a0,0x2
    80006eb4:	90850513          	addi	a0,a0,-1784 # 800087b8 <digits+0x18>
    80006eb8:	fffff097          	auipc	ra,0xfffff
    80006ebc:	4b4080e7          	jalr	1204(ra) # 8000636c <panic>

0000000080006ec0 <freerange>:
    80006ec0:	fc010113          	addi	sp,sp,-64
    80006ec4:	000017b7          	lui	a5,0x1
    80006ec8:	02913423          	sd	s1,40(sp)
    80006ecc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006ed0:	009504b3          	add	s1,a0,s1
    80006ed4:	fffff537          	lui	a0,0xfffff
    80006ed8:	02813823          	sd	s0,48(sp)
    80006edc:	02113c23          	sd	ra,56(sp)
    80006ee0:	03213023          	sd	s2,32(sp)
    80006ee4:	01313c23          	sd	s3,24(sp)
    80006ee8:	01413823          	sd	s4,16(sp)
    80006eec:	01513423          	sd	s5,8(sp)
    80006ef0:	01613023          	sd	s6,0(sp)
    80006ef4:	04010413          	addi	s0,sp,64
    80006ef8:	00a4f4b3          	and	s1,s1,a0
    80006efc:	00f487b3          	add	a5,s1,a5
    80006f00:	06f5e463          	bltu	a1,a5,80006f68 <freerange+0xa8>
    80006f04:	00004a97          	auipc	s5,0x4
    80006f08:	69ca8a93          	addi	s5,s5,1692 # 8000b5a0 <end>
    80006f0c:	0954e263          	bltu	s1,s5,80006f90 <freerange+0xd0>
    80006f10:	01100993          	li	s3,17
    80006f14:	01b99993          	slli	s3,s3,0x1b
    80006f18:	0734fc63          	bgeu	s1,s3,80006f90 <freerange+0xd0>
    80006f1c:	00058a13          	mv	s4,a1
    80006f20:	00003917          	auipc	s2,0x3
    80006f24:	39090913          	addi	s2,s2,912 # 8000a2b0 <kmem>
    80006f28:	00002b37          	lui	s6,0x2
    80006f2c:	0140006f          	j	80006f40 <freerange+0x80>
    80006f30:	000017b7          	lui	a5,0x1
    80006f34:	00f484b3          	add	s1,s1,a5
    80006f38:	0554ec63          	bltu	s1,s5,80006f90 <freerange+0xd0>
    80006f3c:	0534fa63          	bgeu	s1,s3,80006f90 <freerange+0xd0>
    80006f40:	00001637          	lui	a2,0x1
    80006f44:	00100593          	li	a1,1
    80006f48:	00048513          	mv	a0,s1
    80006f4c:	00000097          	auipc	ra,0x0
    80006f50:	50c080e7          	jalr	1292(ra) # 80007458 <__memset>
    80006f54:	00093703          	ld	a4,0(s2)
    80006f58:	016487b3          	add	a5,s1,s6
    80006f5c:	00e4b023          	sd	a4,0(s1)
    80006f60:	00993023          	sd	s1,0(s2)
    80006f64:	fcfa76e3          	bgeu	s4,a5,80006f30 <freerange+0x70>
    80006f68:	03813083          	ld	ra,56(sp)
    80006f6c:	03013403          	ld	s0,48(sp)
    80006f70:	02813483          	ld	s1,40(sp)
    80006f74:	02013903          	ld	s2,32(sp)
    80006f78:	01813983          	ld	s3,24(sp)
    80006f7c:	01013a03          	ld	s4,16(sp)
    80006f80:	00813a83          	ld	s5,8(sp)
    80006f84:	00013b03          	ld	s6,0(sp)
    80006f88:	04010113          	addi	sp,sp,64
    80006f8c:	00008067          	ret
    80006f90:	00002517          	auipc	a0,0x2
    80006f94:	82850513          	addi	a0,a0,-2008 # 800087b8 <digits+0x18>
    80006f98:	fffff097          	auipc	ra,0xfffff
    80006f9c:	3d4080e7          	jalr	980(ra) # 8000636c <panic>

0000000080006fa0 <kfree>:
    80006fa0:	fe010113          	addi	sp,sp,-32
    80006fa4:	00813823          	sd	s0,16(sp)
    80006fa8:	00113c23          	sd	ra,24(sp)
    80006fac:	00913423          	sd	s1,8(sp)
    80006fb0:	02010413          	addi	s0,sp,32
    80006fb4:	03451793          	slli	a5,a0,0x34
    80006fb8:	04079c63          	bnez	a5,80007010 <kfree+0x70>
    80006fbc:	00004797          	auipc	a5,0x4
    80006fc0:	5e478793          	addi	a5,a5,1508 # 8000b5a0 <end>
    80006fc4:	00050493          	mv	s1,a0
    80006fc8:	04f56463          	bltu	a0,a5,80007010 <kfree+0x70>
    80006fcc:	01100793          	li	a5,17
    80006fd0:	01b79793          	slli	a5,a5,0x1b
    80006fd4:	02f57e63          	bgeu	a0,a5,80007010 <kfree+0x70>
    80006fd8:	00001637          	lui	a2,0x1
    80006fdc:	00100593          	li	a1,1
    80006fe0:	00000097          	auipc	ra,0x0
    80006fe4:	478080e7          	jalr	1144(ra) # 80007458 <__memset>
    80006fe8:	00003797          	auipc	a5,0x3
    80006fec:	2c878793          	addi	a5,a5,712 # 8000a2b0 <kmem>
    80006ff0:	0007b703          	ld	a4,0(a5)
    80006ff4:	01813083          	ld	ra,24(sp)
    80006ff8:	01013403          	ld	s0,16(sp)
    80006ffc:	00e4b023          	sd	a4,0(s1)
    80007000:	0097b023          	sd	s1,0(a5)
    80007004:	00813483          	ld	s1,8(sp)
    80007008:	02010113          	addi	sp,sp,32
    8000700c:	00008067          	ret
    80007010:	00001517          	auipc	a0,0x1
    80007014:	7a850513          	addi	a0,a0,1960 # 800087b8 <digits+0x18>
    80007018:	fffff097          	auipc	ra,0xfffff
    8000701c:	354080e7          	jalr	852(ra) # 8000636c <panic>

0000000080007020 <kalloc>:
    80007020:	fe010113          	addi	sp,sp,-32
    80007024:	00813823          	sd	s0,16(sp)
    80007028:	00913423          	sd	s1,8(sp)
    8000702c:	00113c23          	sd	ra,24(sp)
    80007030:	02010413          	addi	s0,sp,32
    80007034:	00003797          	auipc	a5,0x3
    80007038:	27c78793          	addi	a5,a5,636 # 8000a2b0 <kmem>
    8000703c:	0007b483          	ld	s1,0(a5)
    80007040:	02048063          	beqz	s1,80007060 <kalloc+0x40>
    80007044:	0004b703          	ld	a4,0(s1)
    80007048:	00001637          	lui	a2,0x1
    8000704c:	00500593          	li	a1,5
    80007050:	00048513          	mv	a0,s1
    80007054:	00e7b023          	sd	a4,0(a5)
    80007058:	00000097          	auipc	ra,0x0
    8000705c:	400080e7          	jalr	1024(ra) # 80007458 <__memset>
    80007060:	01813083          	ld	ra,24(sp)
    80007064:	01013403          	ld	s0,16(sp)
    80007068:	00048513          	mv	a0,s1
    8000706c:	00813483          	ld	s1,8(sp)
    80007070:	02010113          	addi	sp,sp,32
    80007074:	00008067          	ret

0000000080007078 <initlock>:
    80007078:	ff010113          	addi	sp,sp,-16
    8000707c:	00813423          	sd	s0,8(sp)
    80007080:	01010413          	addi	s0,sp,16
    80007084:	00813403          	ld	s0,8(sp)
    80007088:	00b53423          	sd	a1,8(a0)
    8000708c:	00052023          	sw	zero,0(a0)
    80007090:	00053823          	sd	zero,16(a0)
    80007094:	01010113          	addi	sp,sp,16
    80007098:	00008067          	ret

000000008000709c <acquire>:
    8000709c:	fe010113          	addi	sp,sp,-32
    800070a0:	00813823          	sd	s0,16(sp)
    800070a4:	00913423          	sd	s1,8(sp)
    800070a8:	00113c23          	sd	ra,24(sp)
    800070ac:	01213023          	sd	s2,0(sp)
    800070b0:	02010413          	addi	s0,sp,32
    800070b4:	00050493          	mv	s1,a0
    800070b8:	10002973          	csrr	s2,sstatus
    800070bc:	100027f3          	csrr	a5,sstatus
    800070c0:	ffd7f793          	andi	a5,a5,-3
    800070c4:	10079073          	csrw	sstatus,a5
    800070c8:	fffff097          	auipc	ra,0xfffff
    800070cc:	8ec080e7          	jalr	-1812(ra) # 800059b4 <mycpu>
    800070d0:	07852783          	lw	a5,120(a0)
    800070d4:	06078e63          	beqz	a5,80007150 <acquire+0xb4>
    800070d8:	fffff097          	auipc	ra,0xfffff
    800070dc:	8dc080e7          	jalr	-1828(ra) # 800059b4 <mycpu>
    800070e0:	07852783          	lw	a5,120(a0)
    800070e4:	0004a703          	lw	a4,0(s1)
    800070e8:	0017879b          	addiw	a5,a5,1
    800070ec:	06f52c23          	sw	a5,120(a0)
    800070f0:	04071063          	bnez	a4,80007130 <acquire+0x94>
    800070f4:	00100713          	li	a4,1
    800070f8:	00070793          	mv	a5,a4
    800070fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007100:	0007879b          	sext.w	a5,a5
    80007104:	fe079ae3          	bnez	a5,800070f8 <acquire+0x5c>
    80007108:	0ff0000f          	fence
    8000710c:	fffff097          	auipc	ra,0xfffff
    80007110:	8a8080e7          	jalr	-1880(ra) # 800059b4 <mycpu>
    80007114:	01813083          	ld	ra,24(sp)
    80007118:	01013403          	ld	s0,16(sp)
    8000711c:	00a4b823          	sd	a0,16(s1)
    80007120:	00013903          	ld	s2,0(sp)
    80007124:	00813483          	ld	s1,8(sp)
    80007128:	02010113          	addi	sp,sp,32
    8000712c:	00008067          	ret
    80007130:	0104b903          	ld	s2,16(s1)
    80007134:	fffff097          	auipc	ra,0xfffff
    80007138:	880080e7          	jalr	-1920(ra) # 800059b4 <mycpu>
    8000713c:	faa91ce3          	bne	s2,a0,800070f4 <acquire+0x58>
    80007140:	00001517          	auipc	a0,0x1
    80007144:	68050513          	addi	a0,a0,1664 # 800087c0 <digits+0x20>
    80007148:	fffff097          	auipc	ra,0xfffff
    8000714c:	224080e7          	jalr	548(ra) # 8000636c <panic>
    80007150:	00195913          	srli	s2,s2,0x1
    80007154:	fffff097          	auipc	ra,0xfffff
    80007158:	860080e7          	jalr	-1952(ra) # 800059b4 <mycpu>
    8000715c:	00197913          	andi	s2,s2,1
    80007160:	07252e23          	sw	s2,124(a0)
    80007164:	f75ff06f          	j	800070d8 <acquire+0x3c>

0000000080007168 <release>:
    80007168:	fe010113          	addi	sp,sp,-32
    8000716c:	00813823          	sd	s0,16(sp)
    80007170:	00113c23          	sd	ra,24(sp)
    80007174:	00913423          	sd	s1,8(sp)
    80007178:	01213023          	sd	s2,0(sp)
    8000717c:	02010413          	addi	s0,sp,32
    80007180:	00052783          	lw	a5,0(a0)
    80007184:	00079a63          	bnez	a5,80007198 <release+0x30>
    80007188:	00001517          	auipc	a0,0x1
    8000718c:	64050513          	addi	a0,a0,1600 # 800087c8 <digits+0x28>
    80007190:	fffff097          	auipc	ra,0xfffff
    80007194:	1dc080e7          	jalr	476(ra) # 8000636c <panic>
    80007198:	01053903          	ld	s2,16(a0)
    8000719c:	00050493          	mv	s1,a0
    800071a0:	fffff097          	auipc	ra,0xfffff
    800071a4:	814080e7          	jalr	-2028(ra) # 800059b4 <mycpu>
    800071a8:	fea910e3          	bne	s2,a0,80007188 <release+0x20>
    800071ac:	0004b823          	sd	zero,16(s1)
    800071b0:	0ff0000f          	fence
    800071b4:	0f50000f          	fence	iorw,ow
    800071b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800071bc:	ffffe097          	auipc	ra,0xffffe
    800071c0:	7f8080e7          	jalr	2040(ra) # 800059b4 <mycpu>
    800071c4:	100027f3          	csrr	a5,sstatus
    800071c8:	0027f793          	andi	a5,a5,2
    800071cc:	04079a63          	bnez	a5,80007220 <release+0xb8>
    800071d0:	07852783          	lw	a5,120(a0)
    800071d4:	02f05e63          	blez	a5,80007210 <release+0xa8>
    800071d8:	fff7871b          	addiw	a4,a5,-1
    800071dc:	06e52c23          	sw	a4,120(a0)
    800071e0:	00071c63          	bnez	a4,800071f8 <release+0x90>
    800071e4:	07c52783          	lw	a5,124(a0)
    800071e8:	00078863          	beqz	a5,800071f8 <release+0x90>
    800071ec:	100027f3          	csrr	a5,sstatus
    800071f0:	0027e793          	ori	a5,a5,2
    800071f4:	10079073          	csrw	sstatus,a5
    800071f8:	01813083          	ld	ra,24(sp)
    800071fc:	01013403          	ld	s0,16(sp)
    80007200:	00813483          	ld	s1,8(sp)
    80007204:	00013903          	ld	s2,0(sp)
    80007208:	02010113          	addi	sp,sp,32
    8000720c:	00008067          	ret
    80007210:	00001517          	auipc	a0,0x1
    80007214:	5d850513          	addi	a0,a0,1496 # 800087e8 <digits+0x48>
    80007218:	fffff097          	auipc	ra,0xfffff
    8000721c:	154080e7          	jalr	340(ra) # 8000636c <panic>
    80007220:	00001517          	auipc	a0,0x1
    80007224:	5b050513          	addi	a0,a0,1456 # 800087d0 <digits+0x30>
    80007228:	fffff097          	auipc	ra,0xfffff
    8000722c:	144080e7          	jalr	324(ra) # 8000636c <panic>

0000000080007230 <holding>:
    80007230:	00052783          	lw	a5,0(a0)
    80007234:	00079663          	bnez	a5,80007240 <holding+0x10>
    80007238:	00000513          	li	a0,0
    8000723c:	00008067          	ret
    80007240:	fe010113          	addi	sp,sp,-32
    80007244:	00813823          	sd	s0,16(sp)
    80007248:	00913423          	sd	s1,8(sp)
    8000724c:	00113c23          	sd	ra,24(sp)
    80007250:	02010413          	addi	s0,sp,32
    80007254:	01053483          	ld	s1,16(a0)
    80007258:	ffffe097          	auipc	ra,0xffffe
    8000725c:	75c080e7          	jalr	1884(ra) # 800059b4 <mycpu>
    80007260:	01813083          	ld	ra,24(sp)
    80007264:	01013403          	ld	s0,16(sp)
    80007268:	40a48533          	sub	a0,s1,a0
    8000726c:	00153513          	seqz	a0,a0
    80007270:	00813483          	ld	s1,8(sp)
    80007274:	02010113          	addi	sp,sp,32
    80007278:	00008067          	ret

000000008000727c <push_off>:
    8000727c:	fe010113          	addi	sp,sp,-32
    80007280:	00813823          	sd	s0,16(sp)
    80007284:	00113c23          	sd	ra,24(sp)
    80007288:	00913423          	sd	s1,8(sp)
    8000728c:	02010413          	addi	s0,sp,32
    80007290:	100024f3          	csrr	s1,sstatus
    80007294:	100027f3          	csrr	a5,sstatus
    80007298:	ffd7f793          	andi	a5,a5,-3
    8000729c:	10079073          	csrw	sstatus,a5
    800072a0:	ffffe097          	auipc	ra,0xffffe
    800072a4:	714080e7          	jalr	1812(ra) # 800059b4 <mycpu>
    800072a8:	07852783          	lw	a5,120(a0)
    800072ac:	02078663          	beqz	a5,800072d8 <push_off+0x5c>
    800072b0:	ffffe097          	auipc	ra,0xffffe
    800072b4:	704080e7          	jalr	1796(ra) # 800059b4 <mycpu>
    800072b8:	07852783          	lw	a5,120(a0)
    800072bc:	01813083          	ld	ra,24(sp)
    800072c0:	01013403          	ld	s0,16(sp)
    800072c4:	0017879b          	addiw	a5,a5,1
    800072c8:	06f52c23          	sw	a5,120(a0)
    800072cc:	00813483          	ld	s1,8(sp)
    800072d0:	02010113          	addi	sp,sp,32
    800072d4:	00008067          	ret
    800072d8:	0014d493          	srli	s1,s1,0x1
    800072dc:	ffffe097          	auipc	ra,0xffffe
    800072e0:	6d8080e7          	jalr	1752(ra) # 800059b4 <mycpu>
    800072e4:	0014f493          	andi	s1,s1,1
    800072e8:	06952e23          	sw	s1,124(a0)
    800072ec:	fc5ff06f          	j	800072b0 <push_off+0x34>

00000000800072f0 <pop_off>:
    800072f0:	ff010113          	addi	sp,sp,-16
    800072f4:	00813023          	sd	s0,0(sp)
    800072f8:	00113423          	sd	ra,8(sp)
    800072fc:	01010413          	addi	s0,sp,16
    80007300:	ffffe097          	auipc	ra,0xffffe
    80007304:	6b4080e7          	jalr	1716(ra) # 800059b4 <mycpu>
    80007308:	100027f3          	csrr	a5,sstatus
    8000730c:	0027f793          	andi	a5,a5,2
    80007310:	04079663          	bnez	a5,8000735c <pop_off+0x6c>
    80007314:	07852783          	lw	a5,120(a0)
    80007318:	02f05a63          	blez	a5,8000734c <pop_off+0x5c>
    8000731c:	fff7871b          	addiw	a4,a5,-1
    80007320:	06e52c23          	sw	a4,120(a0)
    80007324:	00071c63          	bnez	a4,8000733c <pop_off+0x4c>
    80007328:	07c52783          	lw	a5,124(a0)
    8000732c:	00078863          	beqz	a5,8000733c <pop_off+0x4c>
    80007330:	100027f3          	csrr	a5,sstatus
    80007334:	0027e793          	ori	a5,a5,2
    80007338:	10079073          	csrw	sstatus,a5
    8000733c:	00813083          	ld	ra,8(sp)
    80007340:	00013403          	ld	s0,0(sp)
    80007344:	01010113          	addi	sp,sp,16
    80007348:	00008067          	ret
    8000734c:	00001517          	auipc	a0,0x1
    80007350:	49c50513          	addi	a0,a0,1180 # 800087e8 <digits+0x48>
    80007354:	fffff097          	auipc	ra,0xfffff
    80007358:	018080e7          	jalr	24(ra) # 8000636c <panic>
    8000735c:	00001517          	auipc	a0,0x1
    80007360:	47450513          	addi	a0,a0,1140 # 800087d0 <digits+0x30>
    80007364:	fffff097          	auipc	ra,0xfffff
    80007368:	008080e7          	jalr	8(ra) # 8000636c <panic>

000000008000736c <push_on>:
    8000736c:	fe010113          	addi	sp,sp,-32
    80007370:	00813823          	sd	s0,16(sp)
    80007374:	00113c23          	sd	ra,24(sp)
    80007378:	00913423          	sd	s1,8(sp)
    8000737c:	02010413          	addi	s0,sp,32
    80007380:	100024f3          	csrr	s1,sstatus
    80007384:	100027f3          	csrr	a5,sstatus
    80007388:	0027e793          	ori	a5,a5,2
    8000738c:	10079073          	csrw	sstatus,a5
    80007390:	ffffe097          	auipc	ra,0xffffe
    80007394:	624080e7          	jalr	1572(ra) # 800059b4 <mycpu>
    80007398:	07852783          	lw	a5,120(a0)
    8000739c:	02078663          	beqz	a5,800073c8 <push_on+0x5c>
    800073a0:	ffffe097          	auipc	ra,0xffffe
    800073a4:	614080e7          	jalr	1556(ra) # 800059b4 <mycpu>
    800073a8:	07852783          	lw	a5,120(a0)
    800073ac:	01813083          	ld	ra,24(sp)
    800073b0:	01013403          	ld	s0,16(sp)
    800073b4:	0017879b          	addiw	a5,a5,1
    800073b8:	06f52c23          	sw	a5,120(a0)
    800073bc:	00813483          	ld	s1,8(sp)
    800073c0:	02010113          	addi	sp,sp,32
    800073c4:	00008067          	ret
    800073c8:	0014d493          	srli	s1,s1,0x1
    800073cc:	ffffe097          	auipc	ra,0xffffe
    800073d0:	5e8080e7          	jalr	1512(ra) # 800059b4 <mycpu>
    800073d4:	0014f493          	andi	s1,s1,1
    800073d8:	06952e23          	sw	s1,124(a0)
    800073dc:	fc5ff06f          	j	800073a0 <push_on+0x34>

00000000800073e0 <pop_on>:
    800073e0:	ff010113          	addi	sp,sp,-16
    800073e4:	00813023          	sd	s0,0(sp)
    800073e8:	00113423          	sd	ra,8(sp)
    800073ec:	01010413          	addi	s0,sp,16
    800073f0:	ffffe097          	auipc	ra,0xffffe
    800073f4:	5c4080e7          	jalr	1476(ra) # 800059b4 <mycpu>
    800073f8:	100027f3          	csrr	a5,sstatus
    800073fc:	0027f793          	andi	a5,a5,2
    80007400:	04078463          	beqz	a5,80007448 <pop_on+0x68>
    80007404:	07852783          	lw	a5,120(a0)
    80007408:	02f05863          	blez	a5,80007438 <pop_on+0x58>
    8000740c:	fff7879b          	addiw	a5,a5,-1
    80007410:	06f52c23          	sw	a5,120(a0)
    80007414:	07853783          	ld	a5,120(a0)
    80007418:	00079863          	bnez	a5,80007428 <pop_on+0x48>
    8000741c:	100027f3          	csrr	a5,sstatus
    80007420:	ffd7f793          	andi	a5,a5,-3
    80007424:	10079073          	csrw	sstatus,a5
    80007428:	00813083          	ld	ra,8(sp)
    8000742c:	00013403          	ld	s0,0(sp)
    80007430:	01010113          	addi	sp,sp,16
    80007434:	00008067          	ret
    80007438:	00001517          	auipc	a0,0x1
    8000743c:	3d850513          	addi	a0,a0,984 # 80008810 <digits+0x70>
    80007440:	fffff097          	auipc	ra,0xfffff
    80007444:	f2c080e7          	jalr	-212(ra) # 8000636c <panic>
    80007448:	00001517          	auipc	a0,0x1
    8000744c:	3a850513          	addi	a0,a0,936 # 800087f0 <digits+0x50>
    80007450:	fffff097          	auipc	ra,0xfffff
    80007454:	f1c080e7          	jalr	-228(ra) # 8000636c <panic>

0000000080007458 <__memset>:
    80007458:	ff010113          	addi	sp,sp,-16
    8000745c:	00813423          	sd	s0,8(sp)
    80007460:	01010413          	addi	s0,sp,16
    80007464:	1a060e63          	beqz	a2,80007620 <__memset+0x1c8>
    80007468:	40a007b3          	neg	a5,a0
    8000746c:	0077f793          	andi	a5,a5,7
    80007470:	00778693          	addi	a3,a5,7
    80007474:	00b00813          	li	a6,11
    80007478:	0ff5f593          	andi	a1,a1,255
    8000747c:	fff6071b          	addiw	a4,a2,-1
    80007480:	1b06e663          	bltu	a3,a6,8000762c <__memset+0x1d4>
    80007484:	1cd76463          	bltu	a4,a3,8000764c <__memset+0x1f4>
    80007488:	1a078e63          	beqz	a5,80007644 <__memset+0x1ec>
    8000748c:	00b50023          	sb	a1,0(a0)
    80007490:	00100713          	li	a4,1
    80007494:	1ae78463          	beq	a5,a4,8000763c <__memset+0x1e4>
    80007498:	00b500a3          	sb	a1,1(a0)
    8000749c:	00200713          	li	a4,2
    800074a0:	1ae78a63          	beq	a5,a4,80007654 <__memset+0x1fc>
    800074a4:	00b50123          	sb	a1,2(a0)
    800074a8:	00300713          	li	a4,3
    800074ac:	18e78463          	beq	a5,a4,80007634 <__memset+0x1dc>
    800074b0:	00b501a3          	sb	a1,3(a0)
    800074b4:	00400713          	li	a4,4
    800074b8:	1ae78263          	beq	a5,a4,8000765c <__memset+0x204>
    800074bc:	00b50223          	sb	a1,4(a0)
    800074c0:	00500713          	li	a4,5
    800074c4:	1ae78063          	beq	a5,a4,80007664 <__memset+0x20c>
    800074c8:	00b502a3          	sb	a1,5(a0)
    800074cc:	00700713          	li	a4,7
    800074d0:	18e79e63          	bne	a5,a4,8000766c <__memset+0x214>
    800074d4:	00b50323          	sb	a1,6(a0)
    800074d8:	00700e93          	li	t4,7
    800074dc:	00859713          	slli	a4,a1,0x8
    800074e0:	00e5e733          	or	a4,a1,a4
    800074e4:	01059e13          	slli	t3,a1,0x10
    800074e8:	01c76e33          	or	t3,a4,t3
    800074ec:	01859313          	slli	t1,a1,0x18
    800074f0:	006e6333          	or	t1,t3,t1
    800074f4:	02059893          	slli	a7,a1,0x20
    800074f8:	40f60e3b          	subw	t3,a2,a5
    800074fc:	011368b3          	or	a7,t1,a7
    80007500:	02859813          	slli	a6,a1,0x28
    80007504:	0108e833          	or	a6,a7,a6
    80007508:	03059693          	slli	a3,a1,0x30
    8000750c:	003e589b          	srliw	a7,t3,0x3
    80007510:	00d866b3          	or	a3,a6,a3
    80007514:	03859713          	slli	a4,a1,0x38
    80007518:	00389813          	slli	a6,a7,0x3
    8000751c:	00f507b3          	add	a5,a0,a5
    80007520:	00e6e733          	or	a4,a3,a4
    80007524:	000e089b          	sext.w	a7,t3
    80007528:	00f806b3          	add	a3,a6,a5
    8000752c:	00e7b023          	sd	a4,0(a5)
    80007530:	00878793          	addi	a5,a5,8
    80007534:	fed79ce3          	bne	a5,a3,8000752c <__memset+0xd4>
    80007538:	ff8e7793          	andi	a5,t3,-8
    8000753c:	0007871b          	sext.w	a4,a5
    80007540:	01d787bb          	addw	a5,a5,t4
    80007544:	0ce88e63          	beq	a7,a4,80007620 <__memset+0x1c8>
    80007548:	00f50733          	add	a4,a0,a5
    8000754c:	00b70023          	sb	a1,0(a4)
    80007550:	0017871b          	addiw	a4,a5,1
    80007554:	0cc77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007558:	00e50733          	add	a4,a0,a4
    8000755c:	00b70023          	sb	a1,0(a4)
    80007560:	0027871b          	addiw	a4,a5,2
    80007564:	0ac77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007568:	00e50733          	add	a4,a0,a4
    8000756c:	00b70023          	sb	a1,0(a4)
    80007570:	0037871b          	addiw	a4,a5,3
    80007574:	0ac77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007578:	00e50733          	add	a4,a0,a4
    8000757c:	00b70023          	sb	a1,0(a4)
    80007580:	0047871b          	addiw	a4,a5,4
    80007584:	08c77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007588:	00e50733          	add	a4,a0,a4
    8000758c:	00b70023          	sb	a1,0(a4)
    80007590:	0057871b          	addiw	a4,a5,5
    80007594:	08c77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007598:	00e50733          	add	a4,a0,a4
    8000759c:	00b70023          	sb	a1,0(a4)
    800075a0:	0067871b          	addiw	a4,a5,6
    800075a4:	06c77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075a8:	00e50733          	add	a4,a0,a4
    800075ac:	00b70023          	sb	a1,0(a4)
    800075b0:	0077871b          	addiw	a4,a5,7
    800075b4:	06c77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075b8:	00e50733          	add	a4,a0,a4
    800075bc:	00b70023          	sb	a1,0(a4)
    800075c0:	0087871b          	addiw	a4,a5,8
    800075c4:	04c77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075c8:	00e50733          	add	a4,a0,a4
    800075cc:	00b70023          	sb	a1,0(a4)
    800075d0:	0097871b          	addiw	a4,a5,9
    800075d4:	04c77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075d8:	00e50733          	add	a4,a0,a4
    800075dc:	00b70023          	sb	a1,0(a4)
    800075e0:	00a7871b          	addiw	a4,a5,10
    800075e4:	02c77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075e8:	00e50733          	add	a4,a0,a4
    800075ec:	00b70023          	sb	a1,0(a4)
    800075f0:	00b7871b          	addiw	a4,a5,11
    800075f4:	02c77663          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    800075f8:	00e50733          	add	a4,a0,a4
    800075fc:	00b70023          	sb	a1,0(a4)
    80007600:	00c7871b          	addiw	a4,a5,12
    80007604:	00c77e63          	bgeu	a4,a2,80007620 <__memset+0x1c8>
    80007608:	00e50733          	add	a4,a0,a4
    8000760c:	00b70023          	sb	a1,0(a4)
    80007610:	00d7879b          	addiw	a5,a5,13
    80007614:	00c7f663          	bgeu	a5,a2,80007620 <__memset+0x1c8>
    80007618:	00f507b3          	add	a5,a0,a5
    8000761c:	00b78023          	sb	a1,0(a5)
    80007620:	00813403          	ld	s0,8(sp)
    80007624:	01010113          	addi	sp,sp,16
    80007628:	00008067          	ret
    8000762c:	00b00693          	li	a3,11
    80007630:	e55ff06f          	j	80007484 <__memset+0x2c>
    80007634:	00300e93          	li	t4,3
    80007638:	ea5ff06f          	j	800074dc <__memset+0x84>
    8000763c:	00100e93          	li	t4,1
    80007640:	e9dff06f          	j	800074dc <__memset+0x84>
    80007644:	00000e93          	li	t4,0
    80007648:	e95ff06f          	j	800074dc <__memset+0x84>
    8000764c:	00000793          	li	a5,0
    80007650:	ef9ff06f          	j	80007548 <__memset+0xf0>
    80007654:	00200e93          	li	t4,2
    80007658:	e85ff06f          	j	800074dc <__memset+0x84>
    8000765c:	00400e93          	li	t4,4
    80007660:	e7dff06f          	j	800074dc <__memset+0x84>
    80007664:	00500e93          	li	t4,5
    80007668:	e75ff06f          	j	800074dc <__memset+0x84>
    8000766c:	00600e93          	li	t4,6
    80007670:	e6dff06f          	j	800074dc <__memset+0x84>

0000000080007674 <__memmove>:
    80007674:	ff010113          	addi	sp,sp,-16
    80007678:	00813423          	sd	s0,8(sp)
    8000767c:	01010413          	addi	s0,sp,16
    80007680:	0e060863          	beqz	a2,80007770 <__memmove+0xfc>
    80007684:	fff6069b          	addiw	a3,a2,-1
    80007688:	0006881b          	sext.w	a6,a3
    8000768c:	0ea5e863          	bltu	a1,a0,8000777c <__memmove+0x108>
    80007690:	00758713          	addi	a4,a1,7
    80007694:	00a5e7b3          	or	a5,a1,a0
    80007698:	40a70733          	sub	a4,a4,a0
    8000769c:	0077f793          	andi	a5,a5,7
    800076a0:	00f73713          	sltiu	a4,a4,15
    800076a4:	00174713          	xori	a4,a4,1
    800076a8:	0017b793          	seqz	a5,a5
    800076ac:	00e7f7b3          	and	a5,a5,a4
    800076b0:	10078863          	beqz	a5,800077c0 <__memmove+0x14c>
    800076b4:	00900793          	li	a5,9
    800076b8:	1107f463          	bgeu	a5,a6,800077c0 <__memmove+0x14c>
    800076bc:	0036581b          	srliw	a6,a2,0x3
    800076c0:	fff8081b          	addiw	a6,a6,-1
    800076c4:	02081813          	slli	a6,a6,0x20
    800076c8:	01d85893          	srli	a7,a6,0x1d
    800076cc:	00858813          	addi	a6,a1,8
    800076d0:	00058793          	mv	a5,a1
    800076d4:	00050713          	mv	a4,a0
    800076d8:	01088833          	add	a6,a7,a6
    800076dc:	0007b883          	ld	a7,0(a5)
    800076e0:	00878793          	addi	a5,a5,8
    800076e4:	00870713          	addi	a4,a4,8
    800076e8:	ff173c23          	sd	a7,-8(a4)
    800076ec:	ff0798e3          	bne	a5,a6,800076dc <__memmove+0x68>
    800076f0:	ff867713          	andi	a4,a2,-8
    800076f4:	02071793          	slli	a5,a4,0x20
    800076f8:	0207d793          	srli	a5,a5,0x20
    800076fc:	00f585b3          	add	a1,a1,a5
    80007700:	40e686bb          	subw	a3,a3,a4
    80007704:	00f507b3          	add	a5,a0,a5
    80007708:	06e60463          	beq	a2,a4,80007770 <__memmove+0xfc>
    8000770c:	0005c703          	lbu	a4,0(a1)
    80007710:	00e78023          	sb	a4,0(a5)
    80007714:	04068e63          	beqz	a3,80007770 <__memmove+0xfc>
    80007718:	0015c603          	lbu	a2,1(a1)
    8000771c:	00100713          	li	a4,1
    80007720:	00c780a3          	sb	a2,1(a5)
    80007724:	04e68663          	beq	a3,a4,80007770 <__memmove+0xfc>
    80007728:	0025c603          	lbu	a2,2(a1)
    8000772c:	00200713          	li	a4,2
    80007730:	00c78123          	sb	a2,2(a5)
    80007734:	02e68e63          	beq	a3,a4,80007770 <__memmove+0xfc>
    80007738:	0035c603          	lbu	a2,3(a1)
    8000773c:	00300713          	li	a4,3
    80007740:	00c781a3          	sb	a2,3(a5)
    80007744:	02e68663          	beq	a3,a4,80007770 <__memmove+0xfc>
    80007748:	0045c603          	lbu	a2,4(a1)
    8000774c:	00400713          	li	a4,4
    80007750:	00c78223          	sb	a2,4(a5)
    80007754:	00e68e63          	beq	a3,a4,80007770 <__memmove+0xfc>
    80007758:	0055c603          	lbu	a2,5(a1)
    8000775c:	00500713          	li	a4,5
    80007760:	00c782a3          	sb	a2,5(a5)
    80007764:	00e68663          	beq	a3,a4,80007770 <__memmove+0xfc>
    80007768:	0065c703          	lbu	a4,6(a1)
    8000776c:	00e78323          	sb	a4,6(a5)
    80007770:	00813403          	ld	s0,8(sp)
    80007774:	01010113          	addi	sp,sp,16
    80007778:	00008067          	ret
    8000777c:	02061713          	slli	a4,a2,0x20
    80007780:	02075713          	srli	a4,a4,0x20
    80007784:	00e587b3          	add	a5,a1,a4
    80007788:	f0f574e3          	bgeu	a0,a5,80007690 <__memmove+0x1c>
    8000778c:	02069613          	slli	a2,a3,0x20
    80007790:	02065613          	srli	a2,a2,0x20
    80007794:	fff64613          	not	a2,a2
    80007798:	00e50733          	add	a4,a0,a4
    8000779c:	00c78633          	add	a2,a5,a2
    800077a0:	fff7c683          	lbu	a3,-1(a5)
    800077a4:	fff78793          	addi	a5,a5,-1
    800077a8:	fff70713          	addi	a4,a4,-1
    800077ac:	00d70023          	sb	a3,0(a4)
    800077b0:	fec798e3          	bne	a5,a2,800077a0 <__memmove+0x12c>
    800077b4:	00813403          	ld	s0,8(sp)
    800077b8:	01010113          	addi	sp,sp,16
    800077bc:	00008067          	ret
    800077c0:	02069713          	slli	a4,a3,0x20
    800077c4:	02075713          	srli	a4,a4,0x20
    800077c8:	00170713          	addi	a4,a4,1
    800077cc:	00e50733          	add	a4,a0,a4
    800077d0:	00050793          	mv	a5,a0
    800077d4:	0005c683          	lbu	a3,0(a1)
    800077d8:	00178793          	addi	a5,a5,1
    800077dc:	00158593          	addi	a1,a1,1
    800077e0:	fed78fa3          	sb	a3,-1(a5)
    800077e4:	fee798e3          	bne	a5,a4,800077d4 <__memmove+0x160>
    800077e8:	f89ff06f          	j	80007770 <__memmove+0xfc>

00000000800077ec <__putc>:
    800077ec:	fe010113          	addi	sp,sp,-32
    800077f0:	00813823          	sd	s0,16(sp)
    800077f4:	00113c23          	sd	ra,24(sp)
    800077f8:	02010413          	addi	s0,sp,32
    800077fc:	00050793          	mv	a5,a0
    80007800:	fef40593          	addi	a1,s0,-17
    80007804:	00100613          	li	a2,1
    80007808:	00000513          	li	a0,0
    8000780c:	fef407a3          	sb	a5,-17(s0)
    80007810:	fffff097          	auipc	ra,0xfffff
    80007814:	b3c080e7          	jalr	-1220(ra) # 8000634c <console_write>
    80007818:	01813083          	ld	ra,24(sp)
    8000781c:	01013403          	ld	s0,16(sp)
    80007820:	02010113          	addi	sp,sp,32
    80007824:	00008067          	ret

0000000080007828 <__getc>:
    80007828:	fe010113          	addi	sp,sp,-32
    8000782c:	00813823          	sd	s0,16(sp)
    80007830:	00113c23          	sd	ra,24(sp)
    80007834:	02010413          	addi	s0,sp,32
    80007838:	fe840593          	addi	a1,s0,-24
    8000783c:	00100613          	li	a2,1
    80007840:	00000513          	li	a0,0
    80007844:	fffff097          	auipc	ra,0xfffff
    80007848:	ae8080e7          	jalr	-1304(ra) # 8000632c <console_read>
    8000784c:	fe844503          	lbu	a0,-24(s0)
    80007850:	01813083          	ld	ra,24(sp)
    80007854:	01013403          	ld	s0,16(sp)
    80007858:	02010113          	addi	sp,sp,32
    8000785c:	00008067          	ret

0000000080007860 <console_handler>:
    80007860:	fe010113          	addi	sp,sp,-32
    80007864:	00813823          	sd	s0,16(sp)
    80007868:	00113c23          	sd	ra,24(sp)
    8000786c:	00913423          	sd	s1,8(sp)
    80007870:	02010413          	addi	s0,sp,32
    80007874:	14202773          	csrr	a4,scause
    80007878:	100027f3          	csrr	a5,sstatus
    8000787c:	0027f793          	andi	a5,a5,2
    80007880:	06079e63          	bnez	a5,800078fc <console_handler+0x9c>
    80007884:	00074c63          	bltz	a4,8000789c <console_handler+0x3c>
    80007888:	01813083          	ld	ra,24(sp)
    8000788c:	01013403          	ld	s0,16(sp)
    80007890:	00813483          	ld	s1,8(sp)
    80007894:	02010113          	addi	sp,sp,32
    80007898:	00008067          	ret
    8000789c:	0ff77713          	andi	a4,a4,255
    800078a0:	00900793          	li	a5,9
    800078a4:	fef712e3          	bne	a4,a5,80007888 <console_handler+0x28>
    800078a8:	ffffe097          	auipc	ra,0xffffe
    800078ac:	6dc080e7          	jalr	1756(ra) # 80005f84 <plic_claim>
    800078b0:	00a00793          	li	a5,10
    800078b4:	00050493          	mv	s1,a0
    800078b8:	02f50c63          	beq	a0,a5,800078f0 <console_handler+0x90>
    800078bc:	fc0506e3          	beqz	a0,80007888 <console_handler+0x28>
    800078c0:	00050593          	mv	a1,a0
    800078c4:	00001517          	auipc	a0,0x1
    800078c8:	e5450513          	addi	a0,a0,-428 # 80008718 <CONSOLE_STATUS+0x708>
    800078cc:	fffff097          	auipc	ra,0xfffff
    800078d0:	afc080e7          	jalr	-1284(ra) # 800063c8 <__printf>
    800078d4:	01013403          	ld	s0,16(sp)
    800078d8:	01813083          	ld	ra,24(sp)
    800078dc:	00048513          	mv	a0,s1
    800078e0:	00813483          	ld	s1,8(sp)
    800078e4:	02010113          	addi	sp,sp,32
    800078e8:	ffffe317          	auipc	t1,0xffffe
    800078ec:	6d430067          	jr	1748(t1) # 80005fbc <plic_complete>
    800078f0:	fffff097          	auipc	ra,0xfffff
    800078f4:	3e0080e7          	jalr	992(ra) # 80006cd0 <uartintr>
    800078f8:	fddff06f          	j	800078d4 <console_handler+0x74>
    800078fc:	00001517          	auipc	a0,0x1
    80007900:	f1c50513          	addi	a0,a0,-228 # 80008818 <digits+0x78>
    80007904:	fffff097          	auipc	ra,0xfffff
    80007908:	a68080e7          	jalr	-1432(ra) # 8000636c <panic>
	...
