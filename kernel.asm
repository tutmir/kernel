
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	3f813103          	ld	sp,1016(sp) # 8000a3f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	58d050ef          	jal	ra,80005da8 <start>

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
    800011e0:	780000ef          	jal	ra,80001960 <_ZN5Riscv20handleTimerInterruptEv>

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
    800012f0:	690000ef          	jal	ra,80001980 <_ZN5Riscv22handleConsoleInterruptEv>

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
    8000142c:	db0080e7          	jalr	-592(ra) # 800021d8 <_ZN15MemoryAllocator9mem_allocEm>

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
    80001474:	f50080e7          	jalr	-176(ra) # 800023c0 <_ZN15MemoryAllocator8mem_freeEPv>
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
    8000149c:	510080e7          	jalr	1296(ra) # 800019a8 <_Znwm>
    800014a0:	00050493          	mv	s1,a0
    800014a4:	000a8693          	mv	a3,s5
    800014a8:	000a0613          	mv	a2,s4
    800014ac:	00090593          	mv	a1,s2
    800014b0:	00001097          	auipc	ra,0x1
    800014b4:	b6c080e7          	jalr	-1172(ra) # 8000201c <_ZN3TCBC1EPFvPvES0_S0_>
    800014b8:	0099b023          	sd	s1,0(s3)
     if(telo != nullptr)
    800014bc:	00090863          	beqz	s2,800014cc <_ZN5Riscv20handleSupervisorTrapEv+0x124>
       Scheduler::stavi(*handle);
    800014c0:	00048513          	mv	a0,s1
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	5c4080e7          	jalr	1476(ra) # 80001a88 <_ZN9Scheduler5staviEP3TCB>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    800014cc:	00000793          	li	a5,0
    800014d0:	00078293          	mv	t0,a5
       __asm__ volatile ("sw t0, 80(x8)");
    800014d4:	04542823          	sw	t0,80(s0)
       break;
    800014d8:	f61ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    800014dc:	00050913          	mv	s2,a0
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    800014e0:	00048513          	mv	a0,s1
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	514080e7          	jalr	1300(ra) # 800019f8 <_ZdlPv>
    800014ec:	00090513          	mv	a0,s2
    800014f0:	0000a097          	auipc	ra,0xa
    800014f4:	0d8080e7          	jalr	216(ra) # 8000b5c8 <_Unwind_Resume>
       TCB::trenutnaNit->exit();
    800014f8:	00001097          	auipc	ra,0x1
    800014fc:	c2c080e7          	jalr	-980(ra) # 80002124 <_ZN3TCB4exitEv>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    80001500:	00000793          	li	a5,0
    80001504:	00078293          	mv	t0,a5
       __asm__ volatile ("sw t0, 80(x8)");
    80001508:	04542823          	sw	t0,80(s0)
       break;
    8000150c:	f2dff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       TCB::dispatch();
    80001510:	00001097          	auipc	ra,0x1
    80001514:	ba0080e7          	jalr	-1120(ra) # 800020b0 <_ZN3TCB8dispatchEv>
       break;
    80001518:	f21ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(thread));
    8000151c:	00058513          	mv	a0,a1
       return 0;
   }

   static void start(TCB* nit)
   {
     if(nit->telo != nullptr)
    80001520:	00053783          	ld	a5,0(a0)
    80001524:	f0078ae3          	beqz	a5,80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       Scheduler::stavi(nit);
    80001528:	00000097          	auipc	ra,0x0
    8000152c:	560080e7          	jalr	1376(ra) # 80001a88 <_ZN9Scheduler5staviEP3TCB>
    80001530:	f09ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
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
    8000154c:	460080e7          	jalr	1120(ra) # 800019a8 <_Znwm>
    80001550:	00050493          	mv	s1,a0
    80001554:	000a8693          	mv	a3,s5
    80001558:	000a0613          	mv	a2,s4
    8000155c:	00098593          	mv	a1,s3
    80001560:	00001097          	auipc	ra,0x1
    80001564:	abc080e7          	jalr	-1348(ra) # 8000201c <_ZN3TCBC1EPFvPvES0_S0_>
    80001568:	00993023          	sd	s1,0(s2)
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    8000156c:	00000793          	li	a5,0
    80001570:	00078293          	mv	t0,a5
       __asm__ volatile ("sw t0, 80(x8)");
    80001574:	04542823          	sw	t0,80(s0)
       break;
    80001578:	ec1ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    8000157c:	00050913          	mv	s2,a0
    80001580:	00048513          	mv	a0,s1
    80001584:	00000097          	auipc	ra,0x0
    80001588:	474080e7          	jalr	1140(ra) # 800019f8 <_ZdlPv>
    8000158c:	00090513          	mv	a0,s2
    80001590:	0000a097          	auipc	ra,0xa
    80001594:	038080e7          	jalr	56(ra) # 8000b5c8 <_Unwind_Resume>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    80001598:	00058513          	mv	a0,a1
       __asm__ volatile("mv %0, a2" : "=r"(init));
    8000159c:	00060593          	mv	a1,a2
       pv = MojSemafor::sem_open(handle, init);
    800015a0:	0005859b          	sext.w	a1,a1
    800015a4:	00001097          	auipc	ra,0x1
    800015a8:	fa8080e7          	jalr	-88(ra) # 8000254c <_ZN10MojSemafor8sem_openEPPS_j>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    800015ac:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    800015b0:	04542823          	sw	t0,80(s0)
       break;
    800015b4:	e85ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    800015b8:	00058513          	mv	a0,a1
       pv = handle->close();
    800015bc:	00001097          	auipc	ra,0x1
    800015c0:	15c080e7          	jalr	348(ra) # 80002718 <_ZN10MojSemafor5closeEv>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    800015c4:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    800015c8:	04542823          	sw	t0,80(s0)
       break;
    800015cc:	e6dff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015d0:	00058513          	mv	a0,a1
       pv = id->wait();
    800015d4:	00001097          	auipc	ra,0x1
    800015d8:	084080e7          	jalr	132(ra) # 80002658 <_ZN10MojSemafor4waitEv>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    800015dc:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    800015e0:	04542823          	sw	t0,80(s0)
       break;
    800015e4:	e55ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015e8:	00058513          	mv	a0,a1
       pv = id->signal();
    800015ec:	00001097          	auipc	ra,0x1
    800015f0:	fc4080e7          	jalr	-60(ra) # 800025b0 <_ZN10MojSemafor6signalEv>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    800015f4:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    800015f8:	04542823          	sw	t0,80(s0)
       break;
    800015fc:	e3dff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    80001600:	00058513          	mv	a0,a1
       pv = id->trywait();
    80001604:	00001097          	auipc	ra,0x1
    80001608:	1e0080e7          	jalr	480(ra) # 800027e4 <_ZN10MojSemafor7trywaitEv>
       __asm__ volatile ("mv t0, %0" : : "r"(pv));
    8000160c:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    80001610:	04542823          	sw	t0,80(s0)
       break;
    80001614:	e25ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       c = __getc();
    80001618:	00007097          	auipc	ra,0x7
    8000161c:	890080e7          	jalr	-1904(ra) # 80007ea8 <__getc>
       __asm__ volatile ("mv t0, %0" : : "r"(c));
    80001620:	00050293          	mv	t0,a0
       __asm__ volatile ("sw t0, 80(x8)");
    80001624:	04542823          	sw	t0,80(s0)
       break;
    80001628:	e11ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile ("mv %0, a1" : "=r"(c));
    8000162c:	00058513          	mv	a0,a1
       __putc(c);
    80001630:	0ff57513          	andi	a0,a0,255
    80001634:	00007097          	auipc	ra,0x7
    80001638:	838080e7          	jalr	-1992(ra) # 80007e6c <__putc>
       break;
    8000163c:	dfdff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>

0000000080001640 <_Z8mem_freePv>:


int mem_free (void* ptr) {
    80001640:	ff010113          	addi	sp,sp,-16
    80001644:	00813423          	sd	s0,8(sp)
    80001648:	01010413          	addi	s0,sp,16

  __asm__ volatile("mv a1, %0" : : "r"(ptr));
    8000164c:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x02");
    80001650:	00200513          	li	a0,2
  __asm__ volatile("ecall");
    80001654:	00000073          	ecall


  uint64 returnValue;
  __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001658:	00050513          	mv	a0,a0
  return (int)returnValue;
}
    8000165c:	0005051b          	sext.w	a0,a0
    80001660:	00813403          	ld	s0,8(sp)
    80001664:	01010113          	addi	sp,sp,16
    80001668:	00008067          	ret

000000008000166c <_Z9mem_allocm>:

void* mem_alloc(size_t size) {
    8000166c:	ff010113          	addi	sp,sp,-16
    80001670:	00813423          	sd	s0,8(sp)
    80001674:	01010413          	addi	s0,sp,16
  size_t newSize;
  if(size%MEM_BLOCK_SIZE != 0) {
    80001678:	03f57793          	andi	a5,a0,63
    8000167c:	00078663          	beqz	a5,80001688 <_Z9mem_allocm+0x1c>
    newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80001680:	03f50513          	addi	a0,a0,63
    80001684:	fc057513          	andi	a0,a0,-64
  }
  else {
    newSize = size;
  }

  __asm__ volatile("mv a1, %0" : : "r"(newSize));
    80001688:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x01");
    8000168c:	00100513          	li	a0,1
  __asm__ volatile("ecall");
    80001690:	00000073          	ecall

  //check this
  void *returnValue;
  __asm__ volatile("mv %0, a0" : "=r"(returnValue));
    80001694:	00050513          	mv	a0,a0
  return returnValue;
}
    80001698:	00813403          	ld	s0,8(sp)
    8000169c:	01010113          	addi	sp,sp,16
    800016a0:	00008067          	ret

00000000800016a4 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    800016a4:	fd010113          	addi	sp,sp,-48
    800016a8:	02113423          	sd	ra,40(sp)
    800016ac:	02813023          	sd	s0,32(sp)
    800016b0:	00913c23          	sd	s1,24(sp)
    800016b4:	01213823          	sd	s2,16(sp)
    800016b8:	01313423          	sd	s3,8(sp)
    800016bc:	03010413          	addi	s0,sp,48
    800016c0:	00050913          	mv	s2,a0
    800016c4:	00058493          	mv	s1,a1
    800016c8:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    800016cc:	04058663          	beqz	a1,80001718 <_Z13thread_createPP3TCBPFvPvES2_+0x74>
    800016d0:	00001537          	lui	a0,0x1
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	f98080e7          	jalr	-104(ra) # 8000166c <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    800016dc:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    800016e0:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    800016e4:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    800016e8:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x11");
    800016ec:	01100513          	li	a0,17

  __asm__ volatile ("ecall");
    800016f0:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800016f4:	00050513          	mv	a0,a0
  return pv;
}
    800016f8:	0005051b          	sext.w	a0,a0
    800016fc:	02813083          	ld	ra,40(sp)
    80001700:	02013403          	ld	s0,32(sp)
    80001704:	01813483          	ld	s1,24(sp)
    80001708:	01013903          	ld	s2,16(sp)
    8000170c:	00813983          	ld	s3,8(sp)
    80001710:	03010113          	addi	sp,sp,48
    80001714:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001718:	00000513          	li	a0,0
    8000171c:	fc1ff06f          	j	800016dc <_Z13thread_createPP3TCBPFvPvES2_+0x38>

0000000080001720 <_Z15thread_no_startPP3TCBPFvPvES2_>:

int thread_no_start(thread_t* handle, void(*start_routine) (void*),void* argumenti)
{
    80001720:	fd010113          	addi	sp,sp,-48
    80001724:	02113423          	sd	ra,40(sp)
    80001728:	02813023          	sd	s0,32(sp)
    8000172c:	00913c23          	sd	s1,24(sp)
    80001730:	01213823          	sd	s2,16(sp)
    80001734:	01313423          	sd	s3,8(sp)
    80001738:	03010413          	addi	s0,sp,48
    8000173c:	00050913          	mv	s2,a0
    80001740:	00058493          	mv	s1,a1
    80001744:	00060993          	mv	s3,a2
  uint64 pv;
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001748:	04058663          	beqz	a1,80001794 <_Z15thread_no_startPP3TCBPFvPvES2_+0x74>
    8000174c:	00001537          	lui	a0,0x1
    80001750:	00000097          	auipc	ra,0x0
    80001754:	f1c080e7          	jalr	-228(ra) # 8000166c <_Z9mem_allocm>
  __asm__ volatile("mv a7, %0" : : "r"(argumenti));
    80001758:	00098893          	mv	a7,s3
  __asm__ volatile("mv a4, %0" : : "r"(stek));
    8000175c:	00050713          	mv	a4,a0
  __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    80001760:	00048613          	mv	a2,s1
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001764:	00090593          	mv	a1,s2
  __asm__ volatile ("li a0, 0x15");
    80001768:	01500513          	li	a0,21

  __asm__ volatile ("ecall");
    8000176c:	00000073          	ecall

  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001770:	00050513          	mv	a0,a0
  return pv;
}
    80001774:	0005051b          	sext.w	a0,a0
    80001778:	02813083          	ld	ra,40(sp)
    8000177c:	02013403          	ld	s0,32(sp)
    80001780:	01813483          	ld	s1,24(sp)
    80001784:	01013903          	ld	s2,16(sp)
    80001788:	00813983          	ld	s3,8(sp)
    8000178c:	03010113          	addi	sp,sp,48
    80001790:	00008067          	ret
  void *stek = (start_routine != nullptr ? mem_alloc(DEFAULT_STACK_SIZE) : nullptr);
    80001794:	00000513          	li	a0,0
    80001798:	fc1ff06f          	j	80001758 <_Z15thread_no_startPP3TCBPFvPvES2_+0x38>

000000008000179c <_Z11thread_exitv>:

int thread_exit()
{
    8000179c:	ff010113          	addi	sp,sp,-16
    800017a0:	00813423          	sd	s0,8(sp)
    800017a4:	01010413          	addi	s0,sp,16
  uint64 pv;

  __asm__ volatile ("li a0, 0x12");
    800017a8:	01200513          	li	a0,18
  __asm__ volatile ("ecall");
    800017ac:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(pv));
    800017b0:	00050513          	mv	a0,a0
  return pv;
}
    800017b4:	0005051b          	sext.w	a0,a0
    800017b8:	00813403          	ld	s0,8(sp)
    800017bc:	01010113          	addi	sp,sp,16
    800017c0:	00008067          	ret

00000000800017c4 <_Z15thread_dispatchv>:

void thread_dispatch()
{
    800017c4:	ff010113          	addi	sp,sp,-16
    800017c8:	00813423          	sd	s0,8(sp)
    800017cc:	01010413          	addi	s0,sp,16
  __asm__ volatile ("li a0, 0x13");
    800017d0:	01300513          	li	a0,19
  __asm__ volatile ("ecall");
    800017d4:	00000073          	ecall
}
    800017d8:	00813403          	ld	s0,8(sp)
    800017dc:	01010113          	addi	sp,sp,16
    800017e0:	00008067          	ret

00000000800017e4 <_Z12thread_startP3TCB>:

void thread_start(TCB* thread)
{
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00813423          	sd	s0,8(sp)
    800017ec:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(thread));
    800017f0:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x14");
    800017f4:	01400513          	li	a0,20
  __asm__ volatile ("ecall");
    800017f8:	00000073          	ecall
}
    800017fc:	00813403          	ld	s0,8(sp)
    80001800:	01010113          	addi	sp,sp,16
    80001804:	00008067          	ret

0000000080001808 <_Z9sem_closeP10MojSemafor>:
  __asm__ volatile("mv %0, a0" : "=r"(pv));
  return pv;
}

int sem_close(sem_t handle)
{
    80001808:	ff010113          	addi	sp,sp,-16
    8000180c:	00813423          	sd	s0,8(sp)
    80001810:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001814:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x22");
    80001818:	02200513          	li	a0,34
  __asm__ volatile("ecall");
    8000181c:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001820:	00050513          	mv	a0,a0
  return pv;
}
    80001824:	0005051b          	sext.w	a0,a0
    80001828:	00813403          	ld	s0,8(sp)
    8000182c:	01010113          	addi	sp,sp,16
    80001830:	00008067          	ret

0000000080001834 <_Z8sem_waitP10MojSemafor>:

int sem_wait(sem_t id)
{
    80001834:	ff010113          	addi	sp,sp,-16
    80001838:	00813423          	sd	s0,8(sp)
    8000183c:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    80001840:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x23");
    80001844:	02300513          	li	a0,35
  __asm__ volatile("ecall");
    80001848:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    8000184c:	00050513          	mv	a0,a0
  return pv;
}
    80001850:	0005051b          	sext.w	a0,a0
    80001854:	00813403          	ld	s0,8(sp)
    80001858:	01010113          	addi	sp,sp,16
    8000185c:	00008067          	ret

0000000080001860 <_Z10sem_signalP10MojSemafor>:

int sem_signal(sem_t id)
{
    80001860:	ff010113          	addi	sp,sp,-16
    80001864:	00813423          	sd	s0,8(sp)
    80001868:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    8000186c:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x24");
    80001870:	02400513          	li	a0,36
  __asm__ volatile("ecall");
    80001874:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001878:	00050513          	mv	a0,a0
  return pv;
}
    8000187c:	0005051b          	sext.w	a0,a0
    80001880:	00813403          	ld	s0,8(sp)
    80001884:	01010113          	addi	sp,sp,16
    80001888:	00008067          	ret

000000008000188c <_Z11sem_trywaitP10MojSemafor>:

int sem_trywait(sem_t id)
{
    8000188c:	ff010113          	addi	sp,sp,-16
    80001890:	00813423          	sd	s0,8(sp)
    80001894:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    80001898:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x26");
    8000189c:	02600513          	li	a0,38
  __asm__ volatile("ecall");
    800018a0:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800018a4:	00050513          	mv	a0,a0
  return pv;
}
    800018a8:	0005051b          	sext.w	a0,a0
    800018ac:	00813403          	ld	s0,8(sp)
    800018b0:	01010113          	addi	sp,sp,16
    800018b4:	00008067          	ret

00000000800018b8 <_Z4getcv>:

char getc()
{
    800018b8:	ff010113          	addi	sp,sp,-16
    800018bc:	00813423          	sd	s0,8(sp)
    800018c0:	01010413          	addi	s0,sp,16
  //printString("Usao sam u getc\n");
  char c;
  __asm__ volatile ("li a0, 0x41");
    800018c4:	04100513          	li	a0,65
  __asm__ volatile ("ecall");
    800018c8:	00000073          	ecall
  //printString("izasao sam iz prekidne rutine\n");
  __asm__ volatile ("mv %0, a0" : "=r"(c));
    800018cc:	00050513          	mv	a0,a0
  return c;
}
    800018d0:	0ff57513          	andi	a0,a0,255
    800018d4:	00813403          	ld	s0,8(sp)
    800018d8:	01010113          	addi	sp,sp,16
    800018dc:	00008067          	ret

00000000800018e0 <_Z4putcc>:

void putc(char c)
{
    800018e0:	ff010113          	addi	sp,sp,-16
    800018e4:	00813423          	sd	s0,8(sp)
    800018e8:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(c));
    800018ec:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x42");
    800018f0:	04200513          	li	a0,66
  __asm__ volatile ("ecall");
    800018f4:	00000073          	ecall

}
    800018f8:	00813403          	ld	s0,8(sp)
    800018fc:	01010113          	addi	sp,sp,16
    80001900:	00008067          	ret

0000000080001904 <_Z8sem_openPP10MojSemaforj>:
{
    80001904:	fe010113          	addi	sp,sp,-32
    80001908:	00113c23          	sd	ra,24(sp)
    8000190c:	00813823          	sd	s0,16(sp)
    80001910:	00913423          	sd	s1,8(sp)
    80001914:	01213023          	sd	s2,0(sp)
    80001918:	02010413          	addi	s0,sp,32
    8000191c:	00050913          	mv	s2,a0
    80001920:	00058493          	mv	s1,a1
  putc(' ');
    80001924:	02000513          	li	a0,32
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	fb8080e7          	jalr	-72(ra) # 800018e0 <_Z4putcc>
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001930:	00090593          	mv	a1,s2
  __asm__ volatile("mv a2, %0" : : "r"(init));
    80001934:	00048613          	mv	a2,s1
  __asm__ volatile("li a0, 0x21");
    80001938:	02100513          	li	a0,33
  __asm__ volatile("ecall");
    8000193c:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001940:	00050513          	mv	a0,a0
}
    80001944:	0005051b          	sext.w	a0,a0
    80001948:	01813083          	ld	ra,24(sp)
    8000194c:	01013403          	ld	s0,16(sp)
    80001950:	00813483          	ld	s1,8(sp)
    80001954:	00013903          	ld	s2,0(sp)
    80001958:	02010113          	addi	sp,sp,32
    8000195c:	00008067          	ret

0000000080001960 <_ZN5Riscv20handleTimerInterruptEv>:

void Riscv::handleTimerInterrupt() {
    80001960:	ff010113          	addi	sp,sp,-16
    80001964:	00813423          	sd	s0,8(sp)
    80001968:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000196c:	00200793          	li	a5,2
    80001970:	1447b073          	csrc	sip,a5
  mc_sip(SIP_SSIP);
}
    80001974:	00813403          	ld	s0,8(sp)
    80001978:	01010113          	addi	sp,sp,16
    8000197c:	00008067          	ret

0000000080001980 <_ZN5Riscv22handleConsoleInterruptEv>:

void Riscv::handleConsoleInterrupt() {
    80001980:	ff010113          	addi	sp,sp,-16
    80001984:	00113423          	sd	ra,8(sp)
    80001988:	00813023          	sd	s0,0(sp)
    8000198c:	01010413          	addi	s0,sp,16
  console_handler();
    80001990:	00006097          	auipc	ra,0x6
    80001994:	550080e7          	jalr	1360(ra) # 80007ee0 <console_handler>
}
    80001998:	00813083          	ld	ra,8(sp)
    8000199c:	00013403          	ld	s0,0(sp)
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret

00000000800019a8 <_Znwm>:
// Created by os on 8/20/24.
//
#include "../h/syscall_c.h"
#include "../test/printing.hpp"
void* operator new(size_t velicina)
{
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00113423          	sd	ra,8(sp)
    800019b0:	00813023          	sd	s0,0(sp)
    800019b4:	01010413          	addi	s0,sp,16
    //printString("Pozvao new\n");
    return mem_alloc(velicina);
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	cb4080e7          	jalr	-844(ra) # 8000166c <_Z9mem_allocm>
}
    800019c0:	00813083          	ld	ra,8(sp)
    800019c4:	00013403          	ld	s0,0(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_Znam>:

void* operator new[](size_t velicina)
{
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00113423          	sd	ra,8(sp)
    800019d8:	00813023          	sd	s0,0(sp)
    800019dc:	01010413          	addi	s0,sp,16
    return mem_alloc(velicina);
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	c8c080e7          	jalr	-884(ra) # 8000166c <_Z9mem_allocm>
}
    800019e8:	00813083          	ld	ra,8(sp)
    800019ec:	00013403          	ld	s0,0(sp)
    800019f0:	01010113          	addi	sp,sp,16
    800019f4:	00008067          	ret

00000000800019f8 <_ZdlPv>:

void operator delete(void* pokazivac) noexcept
{
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00113423          	sd	ra,8(sp)
    80001a00:	00813023          	sd	s0,0(sp)
    80001a04:	01010413          	addi	s0,sp,16
    mem_free(pokazivac);
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	c38080e7          	jalr	-968(ra) # 80001640 <_Z8mem_freePv>
}
    80001a10:	00813083          	ld	ra,8(sp)
    80001a14:	00013403          	ld	s0,0(sp)
    80001a18:	01010113          	addi	sp,sp,16
    80001a1c:	00008067          	ret

0000000080001a20 <_ZdaPv>:

void operator delete[](void* pokazivac) noexcept
{
    80001a20:	ff010113          	addi	sp,sp,-16
    80001a24:	00113423          	sd	ra,8(sp)
    80001a28:	00813023          	sd	s0,0(sp)
    80001a2c:	01010413          	addi	s0,sp,16
    mem_free(pokazivac);
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	c10080e7          	jalr	-1008(ra) # 80001640 <_Z8mem_freePv>
}
    80001a38:	00813083          	ld	ra,8(sp)
    80001a3c:	00013403          	ld	s0,0(sp)
    80001a40:	01010113          	addi	sp,sp,16
    80001a44:	00008067          	ret

0000000080001a48 <_Z41__static_initialization_and_destruction_0ii>:
}

TCB* Scheduler::uzmi()
{
   return listaNiti.izbaciPrvi();
    80001a48:	ff010113          	addi	sp,sp,-16
    80001a4c:	00813423          	sd	s0,8(sp)
    80001a50:	01010413          	addi	s0,sp,16
    80001a54:	00100793          	li	a5,1
    80001a58:	00f50863          	beq	a0,a5,80001a68 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001a5c:	00813403          	ld	s0,8(sp)
    80001a60:	01010113          	addi	sp,sp,16
    80001a64:	00008067          	ret
    80001a68:	000107b7          	lui	a5,0x10
    80001a6c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001a70:	fef596e3          	bne	a1,a5,80001a5c <_Z41__static_initialization_and_destruction_0ii+0x14>

  Cvor *pocetak, *kraj;

public:

Lista(): pocetak(nullptr), kraj(nullptr) {}
    80001a74:	00009797          	auipc	a5,0x9
    80001a78:	9fc78793          	addi	a5,a5,-1540 # 8000a470 <_ZN9Scheduler9listaNitiE>
    80001a7c:	0007b023          	sd	zero,0(a5)
    80001a80:	0007b423          	sd	zero,8(a5)
    80001a84:	fd9ff06f          	j	80001a5c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001a88 <_ZN9Scheduler5staviEP3TCB>:
{
    80001a88:	fe010113          	addi	sp,sp,-32
    80001a8c:	00113c23          	sd	ra,24(sp)
    80001a90:	00813823          	sd	s0,16(sp)
    80001a94:	00913423          	sd	s1,8(sp)
    80001a98:	02010413          	addi	s0,sp,32
    80001a9c:	00050493          	mv	s1,a0
  kraj = noviCvor;
}

void dodajNaKraj(T* t)
{
Cvor *noviCvor = new Cvor(t, nullptr);
    80001aa0:	01000513          	li	a0,16
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	f04080e7          	jalr	-252(ra) # 800019a8 <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80001aac:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    80001ab0:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    80001ab4:	00009797          	auipc	a5,0x9
    80001ab8:	9c47b783          	ld	a5,-1596(a5) # 8000a478 <_ZN9Scheduler9listaNitiE+0x8>
    80001abc:	02078263          	beqz	a5,80001ae0 <_ZN9Scheduler5staviEP3TCB+0x58>
  {
     kraj = kraj->sledeci = noviCvor;
    80001ac0:	00a7b423          	sd	a0,8(a5)
    80001ac4:	00009797          	auipc	a5,0x9
    80001ac8:	9aa7ba23          	sd	a0,-1612(a5) # 8000a478 <_ZN9Scheduler9listaNitiE+0x8>
}
    80001acc:	01813083          	ld	ra,24(sp)
    80001ad0:	01013403          	ld	s0,16(sp)
    80001ad4:	00813483          	ld	s1,8(sp)
    80001ad8:	02010113          	addi	sp,sp,32
    80001adc:	00008067          	ret
  }
  else
  {
    pocetak = kraj = noviCvor;
    80001ae0:	00009797          	auipc	a5,0x9
    80001ae4:	99078793          	addi	a5,a5,-1648 # 8000a470 <_ZN9Scheduler9listaNitiE>
    80001ae8:	00a7b423          	sd	a0,8(a5)
    80001aec:	00a7b023          	sd	a0,0(a5)
    80001af0:	fddff06f          	j	80001acc <_ZN9Scheduler5staviEP3TCB+0x44>

0000000080001af4 <_ZN9Scheduler4uzmiEv>:
{
    80001af4:	fe010113          	addi	sp,sp,-32
    80001af8:	00113c23          	sd	ra,24(sp)
    80001afc:	00813823          	sd	s0,16(sp)
    80001b00:	00913423          	sd	s1,8(sp)
    80001b04:	02010413          	addi	s0,sp,32
  }
}

T* izbaciPrvi()
{
  if(pocetak == nullptr)
    80001b08:	00009517          	auipc	a0,0x9
    80001b0c:	96853503          	ld	a0,-1688(a0) # 8000a470 <_ZN9Scheduler9listaNitiE>
    80001b10:	04050263          	beqz	a0,80001b54 <_ZN9Scheduler4uzmiEv+0x60>
    return nullptr;

  Cvor *cvor = pocetak;
  pocetak = pocetak->sledeci;
    80001b14:	00853783          	ld	a5,8(a0)
    80001b18:	00009717          	auipc	a4,0x9
    80001b1c:	94f73c23          	sd	a5,-1704(a4) # 8000a470 <_ZN9Scheduler9listaNitiE>

  if(pocetak == nullptr)
    80001b20:	02078463          	beqz	a5,80001b48 <_ZN9Scheduler4uzmiEv+0x54>
    kraj = nullptr;

  T* pv = cvor->podaci;
    80001b24:	00053483          	ld	s1,0(a0)
  delete cvor;
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	ed0080e7          	jalr	-304(ra) # 800019f8 <_ZdlPv>
    80001b30:	00048513          	mv	a0,s1
    80001b34:	01813083          	ld	ra,24(sp)
    80001b38:	01013403          	ld	s0,16(sp)
    80001b3c:	00813483          	ld	s1,8(sp)
    80001b40:	02010113          	addi	sp,sp,32
    80001b44:	00008067          	ret
    kraj = nullptr;
    80001b48:	00009797          	auipc	a5,0x9
    80001b4c:	9207b823          	sd	zero,-1744(a5) # 8000a478 <_ZN9Scheduler9listaNitiE+0x8>
    80001b50:	fd5ff06f          	j	80001b24 <_ZN9Scheduler4uzmiEv+0x30>
    return nullptr;
    80001b54:	00050493          	mv	s1,a0
   return listaNiti.izbaciPrvi();
    80001b58:	fd9ff06f          	j	80001b30 <_ZN9Scheduler4uzmiEv+0x3c>

0000000080001b5c <_GLOBAL__sub_I__ZN9Scheduler9listaNitiE>:
    80001b5c:	ff010113          	addi	sp,sp,-16
    80001b60:	00113423          	sd	ra,8(sp)
    80001b64:	00813023          	sd	s0,0(sp)
    80001b68:	01010413          	addi	s0,sp,16
    80001b6c:	000105b7          	lui	a1,0x10
    80001b70:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001b74:	00100513          	li	a0,1
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	ed0080e7          	jalr	-304(ra) # 80001a48 <_Z41__static_initialization_and_destruction_0ii>
    80001b80:	00813083          	ld	ra,8(sp)
    80001b84:	00013403          	ld	s0,0(sp)
    80001b88:	01010113          	addi	sp,sp,16
    80001b8c:	00008067          	ret

0000000080001b90 <_Z11wrapperMainPv>:
#include "../test/printing.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
    80001b90:	ff010113          	addi	sp,sp,-16
    80001b94:	00113423          	sd	ra,8(sp)
    80001b98:	00813023          	sd	s0,0(sp)
    80001b9c:	01010413          	addi	s0,sp,16
  userMain();
    80001ba0:	00003097          	auipc	ra,0x3
    80001ba4:	7b8080e7          	jalr	1976(ra) # 80005358 <_Z8userMainv>
}
    80001ba8:	00813083          	ld	ra,8(sp)
    80001bac:	00013403          	ld	s0,0(sp)
    80001bb0:	01010113          	addi	sp,sp,16
    80001bb4:	00008067          	ret

0000000080001bb8 <main>:


int main() {
    80001bb8:	fc010113          	addi	sp,sp,-64
    80001bbc:	02113c23          	sd	ra,56(sp)
    80001bc0:	02813823          	sd	s0,48(sp)
    80001bc4:	04010413          	addi	s0,sp,64

 static void tryToJoin(DataBlock* curr);

 static void initFreeBlock() {

  MemoryAllocator::free = (DataBlock*)((char*)HEAP_START_ADDR);
    80001bc8:	00009797          	auipc	a5,0x9
    80001bcc:	8087b783          	ld	a5,-2040(a5) # 8000a3d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001bd0:	0007b683          	ld	a3,0(a5)
    80001bd4:	00009717          	auipc	a4,0x9
    80001bd8:	80473703          	ld	a4,-2044(a4) # 8000a3d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001bdc:	00d73023          	sd	a3,0(a4)
  used = nullptr;
    80001be0:	00009617          	auipc	a2,0x9
    80001be4:	82863603          	ld	a2,-2008(a2) # 8000a408 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001be8:	00063023          	sd	zero,0(a2)

  free->next = nullptr;
    80001bec:	0006b023          	sd	zero,0(a3)
  free->prev  = nullptr;
    80001bf0:	00073703          	ld	a4,0(a4)
    80001bf4:	00073423          	sd	zero,8(a4)
  free->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(DataBlock));
    80001bf8:	0007b783          	ld	a5,0(a5)
    80001bfc:	00009697          	auipc	a3,0x9
    80001c00:	8246b683          	ld	a3,-2012(a3) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001c04:	0006b683          	ld	a3,0(a3)
    80001c08:	40d787b3          	sub	a5,a5,a3
    80001c0c:	fe878793          	addi	a5,a5,-24
    80001c10:	00f73823          	sd	a5,16(a4)


  newCalled = 0;
  newArrayCalled = 0;
    80001c14:	00008797          	auipc	a5,0x8
    80001c18:	7fc7b783          	ld	a5,2044(a5) # 8000a410 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001c1c:	0007a023          	sw	zero,0(a5)
  deleteCalled= 0;
    80001c20:	00008797          	auipc	a5,0x8
    80001c24:	7e07b783          	ld	a5,2016(a5) # 8000a400 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c28:	0007a023          	sw	zero,0(a5)
  deleteArrayCalled = 0;
    80001c2c:	00008797          	auipc	a5,0x8
    80001c30:	7bc7b783          	ld	a5,1980(a5) # 8000a3e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001c34:	0007a023          	sw	zero,0(a5)

    80001c38:	00008797          	auipc	a5,0x8
    80001c3c:	7b87b783          	ld	a5,1976(a5) # 8000a3f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c40:	0007a023          	sw	zero,0(a5)
TCB *threads[5];


 MemoryAllocator::initFreeBlock();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
    80001c44:	00008797          	auipc	a5,0x8
    80001c48:	79c7b783          	ld	a5,1948(a5) # 8000a3e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001c4c:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c50:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c54:	00200793          	li	a5,2
    80001c58:	1007a073          	csrs	sstatus,a5
 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
 thread_create(&threads[0], nullptr, nullptr);
    80001c5c:	00000613          	li	a2,0
    80001c60:	00000593          	li	a1,0
    80001c64:	fc840513          	addi	a0,s0,-56
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	a3c080e7          	jalr	-1476(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
 TCB::trenutnaNit = threads[0];
    80001c70:	fc843703          	ld	a4,-56(s0)
    80001c74:	00008797          	auipc	a5,0x8
    80001c78:	7a47b783          	ld	a5,1956(a5) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c7c:	00e7b023          	sd	a4,0(a5)


 thread_create(&threads[1], &wrapperMain, nullptr);
    80001c80:	00000613          	li	a2,0
    80001c84:	00000597          	auipc	a1,0x0
    80001c88:	f0c58593          	addi	a1,a1,-244 # 80001b90 <_Z11wrapperMainPv>
    80001c8c:	fd040513          	addi	a0,s0,-48
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	a14080e7          	jalr	-1516(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>


 while( !threads[1]->daLiJeZavrsena())
    80001c98:	fd043783          	ld	a5,-48(s0)

   static TCB* trenutnaNit;

   bool daLiJeZavrsena() const
   {
      return zavrsena;
    80001c9c:	0287c783          	lbu	a5,40(a5)
    80001ca0:	00079863          	bnez	a5,80001cb0 <main+0xf8>
{
  thread_dispatch();
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	b20080e7          	jalr	-1248(ra) # 800017c4 <_Z15thread_dispatchv>
    80001cac:	fedff06f          	j	80001c98 <main+0xe0>
}

 return 0;

    80001cb0:	00000513          	li	a0,0
    80001cb4:	03813083          	ld	ra,56(sp)
    80001cb8:	03013403          	ld	s0,48(sp)
    80001cbc:	04010113          	addi	sp,sp,64
    80001cc0:	00008067          	ret

0000000080001cc4 <_ZN6ThreadD1Ev>:
Thread::Thread(void (*telo)(void*), void* argumenti)
{
  thread_create(&myHandle, telo, argumenti);
}

Thread::~Thread()
    80001cc4:	fe010113          	addi	sp,sp,-32
    80001cc8:	00113c23          	sd	ra,24(sp)
    80001ccc:	00813823          	sd	s0,16(sp)
    80001cd0:	00913423          	sd	s1,8(sp)
    80001cd4:	02010413          	addi	s0,sp,32
    80001cd8:	00008797          	auipc	a5,0x8
    80001cdc:	51078793          	addi	a5,a5,1296 # 8000a1e8 <_ZTV6Thread+0x10>
    80001ce0:	00f53023          	sd	a5,0(a0)
{
 delete myHandle;
    80001ce4:	00853483          	ld	s1,8(a0)
    80001ce8:	02048063          	beqz	s1,80001d08 <_ZN6ThreadD1Ev+0x44>
     return this->blokirana;
   }

   ~TCB()
   {
     delete stek;
    80001cec:	0084b503          	ld	a0,8(s1)
    80001cf0:	00050663          	beqz	a0,80001cfc <_ZN6ThreadD1Ev+0x38>
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	d04080e7          	jalr	-764(ra) # 800019f8 <_ZdlPv>
    80001cfc:	00048513          	mv	a0,s1
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	cf8080e7          	jalr	-776(ra) # 800019f8 <_ZdlPv>
}
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret

0000000080001d1c <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80001d1c:	fe010113          	addi	sp,sp,-32
    80001d20:	00113c23          	sd	ra,24(sp)
    80001d24:	00813823          	sd	s0,16(sp)
    80001d28:	00913423          	sd	s1,8(sp)
    80001d2c:	02010413          	addi	s0,sp,32
    80001d30:	00050493          	mv	s1,a0
}
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	f90080e7          	jalr	-112(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80001d3c:	00048513          	mv	a0,s1
    80001d40:	00000097          	auipc	ra,0x0
    80001d44:	cb8080e7          	jalr	-840(ra) # 800019f8 <_ZdlPv>
    80001d48:	01813083          	ld	ra,24(sp)
    80001d4c:	01013403          	ld	s0,16(sp)
    80001d50:	00813483          	ld	s1,8(sp)
    80001d54:	02010113          	addi	sp,sp,32
    80001d58:	00008067          	ret

0000000080001d5c <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned init)
{
  sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore()
    80001d5c:	ff010113          	addi	sp,sp,-16
    80001d60:	00113423          	sd	ra,8(sp)
    80001d64:	00813023          	sd	s0,0(sp)
    80001d68:	01010413          	addi	s0,sp,16
    80001d6c:	00008797          	auipc	a5,0x8
    80001d70:	4a478793          	addi	a5,a5,1188 # 8000a210 <_ZTV9Semaphore+0x10>
    80001d74:	00f53023          	sd	a5,0(a0)
{
  sem_close(myHandle);
    80001d78:	00853503          	ld	a0,8(a0)
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	a8c080e7          	jalr	-1396(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
}
    80001d84:	00813083          	ld	ra,8(sp)
    80001d88:	00013403          	ld	s0,0(sp)
    80001d8c:	01010113          	addi	sp,sp,16
    80001d90:	00008067          	ret

0000000080001d94 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore()
    80001d94:	fe010113          	addi	sp,sp,-32
    80001d98:	00113c23          	sd	ra,24(sp)
    80001d9c:	00813823          	sd	s0,16(sp)
    80001da0:	00913423          	sd	s1,8(sp)
    80001da4:	02010413          	addi	s0,sp,32
    80001da8:	00050493          	mv	s1,a0
}
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	fb0080e7          	jalr	-80(ra) # 80001d5c <_ZN9SemaphoreD1Ev>
    80001db4:	00048513          	mv	a0,s1
    80001db8:	00000097          	auipc	ra,0x0
    80001dbc:	c40080e7          	jalr	-960(ra) # 800019f8 <_ZdlPv>
    80001dc0:	01813083          	ld	ra,24(sp)
    80001dc4:	01013403          	ld	s0,16(sp)
    80001dc8:	00813483          	ld	s1,8(sp)
    80001dcc:	02010113          	addi	sp,sp,32
    80001dd0:	00008067          	ret

0000000080001dd4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*telo)(void*), void* argumenti)
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00113423          	sd	ra,8(sp)
    80001ddc:	00813023          	sd	s0,0(sp)
    80001de0:	01010413          	addi	s0,sp,16
    80001de4:	00008797          	auipc	a5,0x8
    80001de8:	40478793          	addi	a5,a5,1028 # 8000a1e8 <_ZTV6Thread+0x10>
    80001dec:	00f53023          	sd	a5,0(a0)
  thread_create(&myHandle, telo, argumenti);
    80001df0:	00850513          	addi	a0,a0,8
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	8b0080e7          	jalr	-1872(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001dfc:	00813083          	ld	ra,8(sp)
    80001e00:	00013403          	ld	s0,0(sp)
    80001e04:	01010113          	addi	sp,sp,16
    80001e08:	00008067          	ret

0000000080001e0c <_ZN6Thread5startEv>:
{
    80001e0c:	ff010113          	addi	sp,sp,-16
    80001e10:	00113423          	sd	ra,8(sp)
    80001e14:	00813023          	sd	s0,0(sp)
    80001e18:	01010413          	addi	s0,sp,16
  thread_start(this->myHandle);
    80001e1c:	00853503          	ld	a0,8(a0)
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	9c4080e7          	jalr	-1596(ra) # 800017e4 <_Z12thread_startP3TCB>
}
    80001e28:	00000513          	li	a0,0
    80001e2c:	00813083          	ld	ra,8(sp)
    80001e30:	00013403          	ld	s0,0(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	00008067          	ret

0000000080001e3c <_ZN6Thread8dispatchEv>:
{
    80001e3c:	ff010113          	addi	sp,sp,-16
    80001e40:	00113423          	sd	ra,8(sp)
    80001e44:	00813023          	sd	s0,0(sp)
    80001e48:	01010413          	addi	s0,sp,16
  thread_dispatch();
    80001e4c:	00000097          	auipc	ra,0x0
    80001e50:	978080e7          	jalr	-1672(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80001e54:	00813083          	ld	ra,8(sp)
    80001e58:	00013403          	ld	s0,0(sp)
    80001e5c:	01010113          	addi	sp,sp,16
    80001e60:	00008067          	ret

0000000080001e64 <_ZN6Thread5sleepEm>:
{
    80001e64:	ff010113          	addi	sp,sp,-16
    80001e68:	00813423          	sd	s0,8(sp)
    80001e6c:	01010413          	addi	s0,sp,16
}
    80001e70:	00000513          	li	a0,0
    80001e74:	00813403          	ld	s0,8(sp)
    80001e78:	01010113          	addi	sp,sp,16
    80001e7c:	00008067          	ret

0000000080001e80 <_ZN6ThreadC1Ev>:
Thread::Thread()
    80001e80:	ff010113          	addi	sp,sp,-16
    80001e84:	00113423          	sd	ra,8(sp)
    80001e88:	00813023          	sd	s0,0(sp)
    80001e8c:	01010413          	addi	s0,sp,16
    80001e90:	00008797          	auipc	a5,0x8
    80001e94:	35878793          	addi	a5,a5,856 # 8000a1e8 <_ZTV6Thread+0x10>
    80001e98:	00f53023          	sd	a5,0(a0)
  thread_no_start(&myHandle, &runWrapper, this);
    80001e9c:	00050613          	mv	a2,a0
    80001ea0:	00000597          	auipc	a1,0x0
    80001ea4:	13058593          	addi	a1,a1,304 # 80001fd0 <_ZN6Thread10runWrapperEPv>
    80001ea8:	00850513          	addi	a0,a0,8
    80001eac:	00000097          	auipc	ra,0x0
    80001eb0:	874080e7          	jalr	-1932(ra) # 80001720 <_Z15thread_no_startPP3TCBPFvPvES2_>
}
    80001eb4:	00813083          	ld	ra,8(sp)
    80001eb8:	00013403          	ld	s0,0(sp)
    80001ebc:	01010113          	addi	sp,sp,16
    80001ec0:	00008067          	ret

0000000080001ec4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init)
    80001ec4:	ff010113          	addi	sp,sp,-16
    80001ec8:	00113423          	sd	ra,8(sp)
    80001ecc:	00813023          	sd	s0,0(sp)
    80001ed0:	01010413          	addi	s0,sp,16
    80001ed4:	00008797          	auipc	a5,0x8
    80001ed8:	33c78793          	addi	a5,a5,828 # 8000a210 <_ZTV9Semaphore+0x10>
    80001edc:	00f53023          	sd	a5,0(a0)
  sem_open(&this->myHandle, init);
    80001ee0:	00850513          	addi	a0,a0,8
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	a20080e7          	jalr	-1504(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
}
    80001eec:	00813083          	ld	ra,8(sp)
    80001ef0:	00013403          	ld	s0,0(sp)
    80001ef4:	01010113          	addi	sp,sp,16
    80001ef8:	00008067          	ret

0000000080001efc <_ZN9Semaphore4waitEv>:

int Semaphore::wait()
{
    80001efc:	ff010113          	addi	sp,sp,-16
    80001f00:	00113423          	sd	ra,8(sp)
    80001f04:	00813023          	sd	s0,0(sp)
    80001f08:	01010413          	addi	s0,sp,16
  return sem_wait(myHandle);
    80001f0c:	00853503          	ld	a0,8(a0)
    80001f10:	00000097          	auipc	ra,0x0
    80001f14:	924080e7          	jalr	-1756(ra) # 80001834 <_Z8sem_waitP10MojSemafor>
}
    80001f18:	00813083          	ld	ra,8(sp)
    80001f1c:	00013403          	ld	s0,0(sp)
    80001f20:	01010113          	addi	sp,sp,16
    80001f24:	00008067          	ret

0000000080001f28 <_ZN9Semaphore6signalEv>:

int Semaphore::signal()
{
    80001f28:	ff010113          	addi	sp,sp,-16
    80001f2c:	00113423          	sd	ra,8(sp)
    80001f30:	00813023          	sd	s0,0(sp)
    80001f34:	01010413          	addi	s0,sp,16
  return sem_signal(myHandle);
    80001f38:	00853503          	ld	a0,8(a0)
    80001f3c:	00000097          	auipc	ra,0x0
    80001f40:	924080e7          	jalr	-1756(ra) # 80001860 <_Z10sem_signalP10MojSemafor>
}
    80001f44:	00813083          	ld	ra,8(sp)
    80001f48:	00013403          	ld	s0,0(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait()
{
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00113423          	sd	ra,8(sp)
    80001f5c:	00813023          	sd	s0,0(sp)
    80001f60:	01010413          	addi	s0,sp,16
  return sem_trywait(myHandle);
    80001f64:	00853503          	ld	a0,8(a0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	924080e7          	jalr	-1756(ra) # 8000188c <_Z11sem_trywaitP10MojSemafor>
}
    80001f70:	00813083          	ld	ra,8(sp)
    80001f74:	00013403          	ld	s0,0(sp)
    80001f78:	01010113          	addi	sp,sp,16
    80001f7c:	00008067          	ret

0000000080001f80 <_ZN7Console4getcEv>:

char Console::getc()
{
    80001f80:	ff010113          	addi	sp,sp,-16
    80001f84:	00113423          	sd	ra,8(sp)
    80001f88:	00813023          	sd	s0,0(sp)
    80001f8c:	01010413          	addi	s0,sp,16
 return syscall_c::getc();
    80001f90:	00000097          	auipc	ra,0x0
    80001f94:	928080e7          	jalr	-1752(ra) # 800018b8 <_Z4getcv>
}
    80001f98:	00813083          	ld	ra,8(sp)
    80001f9c:	00013403          	ld	s0,0(sp)
    80001fa0:	01010113          	addi	sp,sp,16
    80001fa4:	00008067          	ret

0000000080001fa8 <_ZN7Console4putcEc>:

void Console::putc(char c)
{
    80001fa8:	ff010113          	addi	sp,sp,-16
    80001fac:	00113423          	sd	ra,8(sp)
    80001fb0:	00813023          	sd	s0,0(sp)
    80001fb4:	01010413          	addi	s0,sp,16
  syscall_c::putc(c);
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	928080e7          	jalr	-1752(ra) # 800018e0 <_Z4putcc>
    80001fc0:	00813083          	ld	ra,8(sp)
    80001fc4:	00013403          	ld	s0,0(sp)
    80001fc8:	01010113          	addi	sp,sp,16
    80001fcc:	00008067          	ret

0000000080001fd0 <_ZN6Thread10runWrapperEPv>:
int start();
static void dispatch();
static int sleep (time_t);
static void runWrapper(void* thread)
{
  if(thread != nullptr)
    80001fd0:	02050863          	beqz	a0,80002000 <_ZN6Thread10runWrapperEPv+0x30>
static void runWrapper(void* thread)
    80001fd4:	ff010113          	addi	sp,sp,-16
    80001fd8:	00113423          	sd	ra,8(sp)
    80001fdc:	00813023          	sd	s0,0(sp)
    80001fe0:	01010413          	addi	s0,sp,16
   ((Thread*) thread)->run();
    80001fe4:	00053783          	ld	a5,0(a0)
    80001fe8:	0107b783          	ld	a5,16(a5)
    80001fec:	000780e7          	jalr	a5
}
    80001ff0:	00813083          	ld	ra,8(sp)
    80001ff4:	00013403          	ld	s0,0(sp)
    80001ff8:	01010113          	addi	sp,sp,16
    80001ffc:	00008067          	ret
    80002000:	00008067          	ret

0000000080002004 <_ZN6Thread3runEv>:

protected:
 Thread();
 virtual void run() {};
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
    80002010:	00813403          	ld	s0,8(sp)
    80002014:	01010113          	addi	sp,sp,16
    80002018:	00008067          	ret

000000008000201c <_ZN3TCBC1EPFvPvES0_S0_>:
#include "../h/syscall_c.h"
#include "../test/printing.hpp"

TCB* TCB::trenutnaNit = nullptr;

TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    8000201c:	fd010113          	addi	sp,sp,-48
    80002020:	02113423          	sd	ra,40(sp)
    80002024:	02813023          	sd	s0,32(sp)
    80002028:	00913c23          	sd	s1,24(sp)
    8000202c:	01213823          	sd	s2,16(sp)
    80002030:	01313423          	sd	s3,8(sp)
    80002034:	03010413          	addi	s0,sp,48
    80002038:	00050493          	mv	s1,a0
    8000203c:	00058913          	mv	s2,a1
    80002040:	00060993          	mv	s3,a2
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80002044:	00b53023          	sd	a1,0(a0)
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80002048:	04058c63          	beqz	a1,800020a0 <_ZN3TCBC1EPFvPvES0_S0_+0x84>
    8000204c:	00008537          	lui	a0,0x8
    80002050:	00000097          	auipc	ra,0x0
    80002054:	980080e7          	jalr	-1664(ra) # 800019d0 <_Znam>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80002058:	00a4b423          	sd	a0,8(s1)
    8000205c:	00000797          	auipc	a5,0x0
    80002060:	12078793          	addi	a5,a5,288 # 8000217c <_ZN3TCB7wrapperEv>
    80002064:	00f4b823          	sd	a5,16(s1)
    80002068:	04090063          	beqz	s2,800020a8 <_ZN3TCBC1EPFvPvES0_S0_+0x8c>
    8000206c:	000087b7          	lui	a5,0x8
    80002070:	00f50533          	add	a0,a0,a5
    80002074:	00a4bc23          	sd	a0,24(s1)
    80002078:	0334b023          	sd	s3,32(s1)
    8000207c:	02048423          	sb	zero,40(s1)
    80002080:	020484a3          	sb	zero,41(s1)
    80002084:	02813083          	ld	ra,40(sp)
    80002088:	02013403          	ld	s0,32(sp)
    8000208c:	01813483          	ld	s1,24(sp)
    80002090:	01013903          	ld	s2,16(sp)
    80002094:	00813983          	ld	s3,8(sp)
    80002098:	03010113          	addi	sp,sp,48
    8000209c:	00008067          	ret
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    800020a0:	00000513          	li	a0,0
    800020a4:	fb5ff06f          	j	80002058 <_ZN3TCBC1EPFvPvES0_S0_+0x3c>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    800020a8:	00000513          	li	a0,0
    800020ac:	fc9ff06f          	j	80002074 <_ZN3TCBC1EPFvPvES0_S0_+0x58>

00000000800020b0 <_ZN3TCB8dispatchEv>:
  trenutnaNit->postaviStatus(true);
  thread_dispatch();
}

void TCB::dispatch()
{
    800020b0:	fe010113          	addi	sp,sp,-32
    800020b4:	00113c23          	sd	ra,24(sp)
    800020b8:	00813823          	sd	s0,16(sp)
    800020bc:	00913423          	sd	s1,8(sp)
    800020c0:	02010413          	addi	s0,sp,32
  TCB* staraNit = trenutnaNit;
    800020c4:	00008497          	auipc	s1,0x8
    800020c8:	3bc4b483          	ld	s1,956(s1) # 8000a480 <_ZN3TCB11trenutnaNitE>
      return zavrsena;
    800020cc:	0284c783          	lbu	a5,40(s1)
  if(!staraNit->daLiJeZavrsena() && !staraNit->daLiJeBlokirana())
    800020d0:	00079663          	bnez	a5,800020dc <_ZN3TCB8dispatchEv+0x2c>
     return this->blokirana;
    800020d4:	0294c783          	lbu	a5,41(s1)
    800020d8:	02078e63          	beqz	a5,80002114 <_ZN3TCB8dispatchEv+0x64>
  {
    Scheduler::stavi(staraNit);
  }

  trenutnaNit = Scheduler::uzmi();
    800020dc:	00000097          	auipc	ra,0x0
    800020e0:	a18080e7          	jalr	-1512(ra) # 80001af4 <_ZN9Scheduler4uzmiEv>
    800020e4:	00008797          	auipc	a5,0x8
    800020e8:	38a7be23          	sd	a0,924(a5) # 8000a480 <_ZN3TCB11trenutnaNitE>

  if(staraNit != trenutnaNit)
    800020ec:	00a48a63          	beq	s1,a0,80002100 <_ZN3TCB8dispatchEv+0x50>
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
    800020f0:	01050593          	addi	a1,a0,16 # 8010 <_entry-0x7fff7ff0>
    800020f4:	01048513          	addi	a0,s1,16
    800020f8:	fffff097          	auipc	ra,0xfffff
    800020fc:	f08080e7          	jalr	-248(ra) # 80001000 <_ZN3TCB5yieldEPNS_7ContextES1_>
  }
}
    80002100:	01813083          	ld	ra,24(sp)
    80002104:	01013403          	ld	s0,16(sp)
    80002108:	00813483          	ld	s1,8(sp)
    8000210c:	02010113          	addi	sp,sp,32
    80002110:	00008067          	ret
    Scheduler::stavi(staraNit);
    80002114:	00048513          	mv	a0,s1
    80002118:	00000097          	auipc	ra,0x0
    8000211c:	970080e7          	jalr	-1680(ra) # 80001a88 <_ZN9Scheduler5staviEP3TCB>
    80002120:	fbdff06f          	j	800020dc <_ZN3TCB8dispatchEv+0x2c>

0000000080002124 <_ZN3TCB4exitEv>:

void TCB::exit()
{
    80002124:	ff010113          	addi	sp,sp,-16
    80002128:	00113423          	sd	ra,8(sp)
    8000212c:	00813023          	sd	s0,0(sp)
    80002130:	01010413          	addi	s0,sp,16
     this->zavrsena = status;
    80002134:	00008797          	auipc	a5,0x8
    80002138:	34c7b783          	ld	a5,844(a5) # 8000a480 <_ZN3TCB11trenutnaNitE>
    8000213c:	00100713          	li	a4,1
    80002140:	02e78423          	sb	a4,40(a5)
  trenutnaNit->postaviStatus(true);
  dispatch();
    80002144:	00000097          	auipc	ra,0x0
    80002148:	f6c080e7          	jalr	-148(ra) # 800020b0 <_ZN3TCB8dispatchEv>
}
    8000214c:	00813083          	ld	ra,8(sp)
    80002150:	00013403          	ld	s0,0(sp)
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00008067          	ret

000000008000215c <_ZN3TCB10popSppSpieEv>:

void TCB::popSppSpie()
{
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
  __asm__ volatile ("csrw sepc, ra");
    80002168:	14109073          	csrw	sepc,ra
  __asm__ volatile("sret");
    8000216c:	10200073          	sret
    80002170:	00813403          	ld	s0,8(sp)
    80002174:	01010113          	addi	sp,sp,16
    80002178:	00008067          	ret

000000008000217c <_ZN3TCB7wrapperEv>:
{
    8000217c:	fe010113          	addi	sp,sp,-32
    80002180:	00113c23          	sd	ra,24(sp)
    80002184:	00813823          	sd	s0,16(sp)
    80002188:	00913423          	sd	s1,8(sp)
    8000218c:	02010413          	addi	s0,sp,32
  popSppSpie();
    80002190:	00000097          	auipc	ra,0x0
    80002194:	fcc080e7          	jalr	-52(ra) # 8000215c <_ZN3TCB10popSppSpieEv>
  trenutnaNit->telo((void*) trenutnaNit->argumenti);
    80002198:	00008497          	auipc	s1,0x8
    8000219c:	2e848493          	addi	s1,s1,744 # 8000a480 <_ZN3TCB11trenutnaNitE>
    800021a0:	0004b783          	ld	a5,0(s1)
    800021a4:	0007b703          	ld	a4,0(a5)
    800021a8:	0207b503          	ld	a0,32(a5)
    800021ac:	000700e7          	jalr	a4
  trenutnaNit->postaviStatus(true);
    800021b0:	0004b783          	ld	a5,0(s1)
    800021b4:	00100713          	li	a4,1
    800021b8:	02e78423          	sb	a4,40(a5)
  thread_dispatch();
    800021bc:	fffff097          	auipc	ra,0xfffff
    800021c0:	608080e7          	jalr	1544(ra) # 800017c4 <_Z15thread_dispatchv>
}
    800021c4:	01813083          	ld	ra,24(sp)
    800021c8:	01013403          	ld	s0,16(sp)
    800021cc:	00813483          	ld	s1,8(sp)
    800021d0:	02010113          	addi	sp,sp,32
    800021d4:	00008067          	ret

00000000800021d8 <_ZN15MemoryAllocator9mem_allocEm>:
int MemoryAllocator::newArrayCalled = 0;
int MemoryAllocator::deleteCalled = 0;
int MemoryAllocator::deleteArrayCalled = 0;


void *MemoryAllocator::mem_alloc(size_t size) {
    800021d8:	ff010113          	addi	sp,sp,-16
    800021dc:	00813423          	sd	s0,8(sp)
    800021e0:	01010413          	addi	s0,sp,16
    800021e4:	00050793          	mv	a5,a0
    size_t newSize;
    if(size%MEM_BLOCK_SIZE != 0) {
    800021e8:	03f57713          	andi	a4,a0,63
    800021ec:	00070663          	beqz	a4,800021f8 <_ZN15MemoryAllocator9mem_allocEm+0x20>
        newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800021f0:	03f50793          	addi	a5,a0,63
    800021f4:	fc07f793          	andi	a5,a5,-64
    else {
        newSize = size;
    }


    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    800021f8:	00008517          	auipc	a0,0x8
    800021fc:	29053503          	ld	a0,656(a0) # 8000a488 <_ZN15MemoryAllocator4freeE>
    80002200:	06050e63          	beqz	a0,8000227c <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(curr->size<newSize) continue;
    80002204:	01053703          	ld	a4,16(a0)
    80002208:	08f76063          	bltu	a4,a5,80002288 <_ZN15MemoryAllocator9mem_allocEm+0xb0>
        if(curr->size > newSize) {
    8000220c:	0ce7f663          	bgeu	a5,a4,800022d8 <_ZN15MemoryAllocator9mem_allocEm+0x100>
            //new fragment needs to be created
            //novi ce biti offsetovan od curr za novi size i plus za sizeof(DataBlock) zato sto se posle curr
            // nalazi taj "header"
            DataBlock *newBlock;
            newBlock = (DataBlock*) ((char*)curr + newSize + sizeof(DataBlock));
    80002210:	01878713          	addi	a4,a5,24
    80002214:	00e50733          	add	a4,a0,a4

            //Azuriranje free liste
            if(curr->prev) curr->prev->next = newBlock;
    80002218:	00853683          	ld	a3,8(a0)
    8000221c:	06068a63          	beqz	a3,80002290 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    80002220:	00e6b023          	sd	a4,0(a3)
            else MemoryAllocator::free = newBlock;
            if(curr->next) curr->next->prev = newBlock;
    80002224:	00053683          	ld	a3,0(a0)
    80002228:	00068463          	beqz	a3,80002230 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    8000222c:	00e6b423          	sd	a4,8(a3)
            newBlock->prev = curr->prev;
    80002230:	00853683          	ld	a3,8(a0)
    80002234:	00d73423          	sd	a3,8(a4)
            newBlock->next = curr->next;
    80002238:	00053683          	ld	a3,0(a0)
    8000223c:	00d73023          	sd	a3,0(a4)


            newBlock->size = curr->size - newSize - sizeof(DataBlock);
    80002240:	01053683          	ld	a3,16(a0)
    80002244:	40f686b3          	sub	a3,a3,a5
    80002248:	fe868693          	addi	a3,a3,-24
    8000224c:	00d73823          	sd	a3,16(a4)
            curr->size = newSize;
    80002250:	00f53823          	sd	a5,16(a0)

            //azuriranje USED liste
            if(used == nullptr) {
    80002254:	00008797          	auipc	a5,0x8
    80002258:	23c7b783          	ld	a5,572(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
    8000225c:	04078063          	beqz	a5,8000229c <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                used = curr;
                curr->next = nullptr;
                curr->prev = nullptr;
            }
            else if((char*) curr < (char*)used) {
    80002260:	04f57863          	bgeu	a0,a5,800022b0 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                //treba da ide pre trenutnog used
                used->prev = curr;
    80002264:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    80002268:	00053423          	sd	zero,8(a0)
                curr->next = used;
    8000226c:	00f53023          	sd	a5,0(a0)
                used = curr;
    80002270:	00008797          	auipc	a5,0x8
    80002274:	22a7b023          	sd	a0,544(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
                currUsed->next = curr;
            }

        }

        return (char*)curr + sizeof(DataBlock);
    80002278:	01850513          	addi	a0,a0,24
    }
    return nullptr; //should not enter here
}
    8000227c:	00813403          	ld	s0,8(sp)
    80002280:	01010113          	addi	sp,sp,16
    80002284:	00008067          	ret
    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    80002288:	00053503          	ld	a0,0(a0)
    8000228c:	f75ff06f          	j	80002200 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            else MemoryAllocator::free = newBlock;
    80002290:	00008697          	auipc	a3,0x8
    80002294:	1ee6bc23          	sd	a4,504(a3) # 8000a488 <_ZN15MemoryAllocator4freeE>
    80002298:	f8dff06f          	j	80002224 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                used = curr;
    8000229c:	00008797          	auipc	a5,0x8
    800022a0:	1ea7ba23          	sd	a0,500(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    800022a4:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    800022a8:	00053423          	sd	zero,8(a0)
    800022ac:	fcdff06f          	j	80002278 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    800022b0:	00078713          	mv	a4,a5
    800022b4:	0007b783          	ld	a5,0(a5)
    800022b8:	00078463          	beqz	a5,800022c0 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
    800022bc:	fea7eae3          	bltu	a5,a0,800022b0 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                curr->next = currUsed->next;
    800022c0:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    800022c4:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    800022c8:	00078463          	beqz	a5,800022d0 <_ZN15MemoryAllocator9mem_allocEm+0xf8>
    800022cc:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    800022d0:	00a73023          	sd	a0,0(a4)
    800022d4:	fa5ff06f          	j	80002278 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            if (curr->prev) curr->prev->next = curr->next;
    800022d8:	00853783          	ld	a5,8(a0)
    800022dc:	04078263          	beqz	a5,80002320 <_ZN15MemoryAllocator9mem_allocEm+0x148>
    800022e0:	00053703          	ld	a4,0(a0)
    800022e4:	00e7b023          	sd	a4,0(a5)
            if(curr->next) curr->next->prev = curr->prev;
    800022e8:	00053783          	ld	a5,0(a0)
    800022ec:	00078663          	beqz	a5,800022f8 <_ZN15MemoryAllocator9mem_allocEm+0x120>
    800022f0:	00853703          	ld	a4,8(a0)
    800022f4:	00e7b423          	sd	a4,8(a5)
            if(used == nullptr) {
    800022f8:	00008797          	auipc	a5,0x8
    800022fc:	1987b783          	ld	a5,408(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
    80002300:	02078863          	beqz	a5,80002330 <_ZN15MemoryAllocator9mem_allocEm+0x158>
            else if((char*) curr < (char*)used) {
    80002304:	04f57063          	bgeu	a0,a5,80002344 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                used->prev = curr;
    80002308:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    8000230c:	00053423          	sd	zero,8(a0)
                curr->next = used;
    80002310:	00f53023          	sd	a5,0(a0)
                used = curr;
    80002314:	00008797          	auipc	a5,0x8
    80002318:	16a7be23          	sd	a0,380(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
    8000231c:	f5dff06f          	j	80002278 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            else MemoryAllocator::free = curr->next;
    80002320:	00053783          	ld	a5,0(a0)
    80002324:	00008717          	auipc	a4,0x8
    80002328:	16f73223          	sd	a5,356(a4) # 8000a488 <_ZN15MemoryAllocator4freeE>
    8000232c:	fbdff06f          	j	800022e8 <_ZN15MemoryAllocator9mem_allocEm+0x110>
                used = curr;
    80002330:	00008797          	auipc	a5,0x8
    80002334:	16a7b023          	sd	a0,352(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    80002338:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    8000233c:	00053423          	sd	zero,8(a0)
    80002340:	f39ff06f          	j	80002278 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    80002344:	00078713          	mv	a4,a5
    80002348:	0007b783          	ld	a5,0(a5)
    8000234c:	00078463          	beqz	a5,80002354 <_ZN15MemoryAllocator9mem_allocEm+0x17c>
    80002350:	fea7eae3          	bltu	a5,a0,80002344 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                curr->next = currUsed->next;
    80002354:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    80002358:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    8000235c:	00078463          	beqz	a5,80002364 <_ZN15MemoryAllocator9mem_allocEm+0x18c>
    80002360:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    80002364:	00a73023          	sd	a0,0(a4)
    80002368:	f11ff06f          	j	80002278 <_ZN15MemoryAllocator9mem_allocEm+0xa0>

000000008000236c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>:
        tryToJoin(currFree);
    }
    return 0;
}

void MemoryAllocator::tryToJoin(DataBlock *curr) {
    8000236c:	ff010113          	addi	sp,sp,-16
    80002370:	00813423          	sd	s0,8(sp)
    80002374:	01010413          	addi	s0,sp,16
    if(curr->next && (char*)curr + sizeof(DataBlock) + curr->size == (char*)curr->next) {
    80002378:	00053783          	ld	a5,0(a0)
    8000237c:	00078a63          	beqz	a5,80002390 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    80002380:	01053683          	ld	a3,16(a0)
    80002384:	01868713          	addi	a4,a3,24
    80002388:	00e50733          	add	a4,a0,a4
    8000238c:	00e78863          	beq	a5,a4,8000239c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x30>
        curr->size += curr->next->size + sizeof(DataBlock);
        curr->next = curr->next->next;
        if(curr->next) curr->next->prev = curr;
    }
    80002390:	00813403          	ld	s0,8(sp)
    80002394:	01010113          	addi	sp,sp,16
    80002398:	00008067          	ret
        curr->size += curr->next->size + sizeof(DataBlock);
    8000239c:	0107b703          	ld	a4,16(a5)
    800023a0:	00e686b3          	add	a3,a3,a4
    800023a4:	01868693          	addi	a3,a3,24
    800023a8:	00d53823          	sd	a3,16(a0)
        curr->next = curr->next->next;
    800023ac:	0007b783          	ld	a5,0(a5)
    800023b0:	00f53023          	sd	a5,0(a0)
        if(curr->next) curr->next->prev = curr;
    800023b4:	fc078ee3          	beqz	a5,80002390 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    800023b8:	00a7b423          	sd	a0,8(a5)
    800023bc:	fd5ff06f          	j	80002390 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>

00000000800023c0 <_ZN15MemoryAllocator8mem_freeEPv>:
    if(used == nullptr) return -1;
    800023c0:	00008797          	auipc	a5,0x8
    800023c4:	0d07b783          	ld	a5,208(a5) # 8000a490 <_ZN15MemoryAllocator4usedE>
    800023c8:	12078863          	beqz	a5,800024f8 <_ZN15MemoryAllocator8mem_freeEPv+0x138>
    800023cc:	00050713          	mv	a4,a0
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    800023d0:	12050863          	beqz	a0,80002500 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    800023d4:	00008697          	auipc	a3,0x8
    800023d8:	ffc6b683          	ld	a3,-4(a3) # 8000a3d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023dc:	0006b683          	ld	a3,0(a3)
    800023e0:	12d56463          	bltu	a0,a3,80002508 <_ZN15MemoryAllocator8mem_freeEPv+0x148>
    800023e4:	00008697          	auipc	a3,0x8
    800023e8:	03c6b683          	ld	a3,60(a3) # 8000a420 <_GLOBAL_OFFSET_TABLE_+0x58>
    800023ec:	0006b683          	ld	a3,0(a3)
    800023f0:	12a6e063          	bltu	a3,a0,80002510 <_ZN15MemoryAllocator8mem_freeEPv+0x150>
    DataBlock* curr = (DataBlock*)((char*)ptr - sizeof(DataBlock));
    800023f4:	fe850513          	addi	a0,a0,-24
    if(curr < used) return -3;
    800023f8:	12f56063          	bltu	a0,a5,80002518 <_ZN15MemoryAllocator8mem_freeEPv+0x158>
    if(used == curr) {
    800023fc:	08a78c63          	beq	a5,a0,80002494 <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
        curr->prev->next = curr->next;
    80002400:	ff073683          	ld	a3,-16(a4)
    80002404:	fe873783          	ld	a5,-24(a4)
    80002408:	00f6b023          	sd	a5,0(a3)
        if(curr->next) curr->next->prev = curr->prev;
    8000240c:	00078663          	beqz	a5,80002418 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    80002410:	ff073683          	ld	a3,-16(a4)
    80002414:	00d7b423          	sd	a3,8(a5)
        curr->next = nullptr;
    80002418:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    8000241c:	fe073823          	sd	zero,-16(a4)
    if (free == nullptr) {
    80002420:	00008797          	auipc	a5,0x8
    80002424:	0687b783          	ld	a5,104(a5) # 8000a488 <_ZN15MemoryAllocator4freeE>
    80002428:	08078663          	beqz	a5,800024b4 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
int MemoryAllocator::mem_free(void* ptr) {
    8000242c:	fe010113          	addi	sp,sp,-32
    80002430:	00113c23          	sd	ra,24(sp)
    80002434:	00813823          	sd	s0,16(sp)
    80002438:	00913423          	sd	s1,8(sp)
    8000243c:	02010413          	addi	s0,sp,32
    else if((char*)curr < (char*)free) {
    80002440:	08f56663          	bltu	a0,a5,800024cc <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
        for(currFree = free; currFree->next && (char*)(currFree->next) < (char*) curr; currFree = currFree->next);
    80002444:	00078493          	mv	s1,a5
    80002448:	0007b783          	ld	a5,0(a5)
    8000244c:	00078463          	beqz	a5,80002454 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    80002450:	fea7eae3          	bltu	a5,a0,80002444 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
        curr->next = currFree->next;
    80002454:	fef73423          	sd	a5,-24(a4)
        curr->prev = currFree;
    80002458:	fe973823          	sd	s1,-16(a4)
        if(curr->next) curr->next->prev = curr;
    8000245c:	00078463          	beqz	a5,80002464 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    80002460:	00a7b423          	sd	a0,8(a5)
        currFree->next = curr;
    80002464:	00a4b023          	sd	a0,0(s1)
        tryToJoin(curr);
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	f04080e7          	jalr	-252(ra) # 8000236c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
        tryToJoin(currFree);
    80002470:	00048513          	mv	a0,s1
    80002474:	00000097          	auipc	ra,0x0
    80002478:	ef8080e7          	jalr	-264(ra) # 8000236c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    8000247c:	00000513          	li	a0,0
}
    80002480:	01813083          	ld	ra,24(sp)
    80002484:	01013403          	ld	s0,16(sp)
    80002488:	00813483          	ld	s1,8(sp)
    8000248c:	02010113          	addi	sp,sp,32
    80002490:	00008067          	ret
        used = curr->next;
    80002494:	fe873783          	ld	a5,-24(a4)
    80002498:	00008697          	auipc	a3,0x8
    8000249c:	fef6bc23          	sd	a5,-8(a3) # 8000a490 <_ZN15MemoryAllocator4usedE>
        if(used) used->prev = nullptr;
    800024a0:	00078463          	beqz	a5,800024a8 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
    800024a4:	0007b423          	sd	zero,8(a5)
        curr->next = nullptr;
    800024a8:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    800024ac:	fe073823          	sd	zero,-16(a4)
    800024b0:	f71ff06f          	j	80002420 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        free = curr;
    800024b4:	00008797          	auipc	a5,0x8
    800024b8:	fca7ba23          	sd	a0,-44(a5) # 8000a488 <_ZN15MemoryAllocator4freeE>
        curr->next = nullptr;
    800024bc:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    800024c0:	fe073823          	sd	zero,-16(a4)
    return 0;
    800024c4:	00000513          	li	a0,0
    800024c8:	00008067          	ret
        free->prev = curr;
    800024cc:	00a7b423          	sd	a0,8(a5)
        curr->prev = nullptr;
    800024d0:	fe073823          	sd	zero,-16(a4)
        curr->next = free;
    800024d4:	00008797          	auipc	a5,0x8
    800024d8:	fb478793          	addi	a5,a5,-76 # 8000a488 <_ZN15MemoryAllocator4freeE>
    800024dc:	0007b683          	ld	a3,0(a5)
    800024e0:	fed73423          	sd	a3,-24(a4)
        free = curr;
    800024e4:	00a7b023          	sd	a0,0(a5)
        tryToJoin(free);
    800024e8:	00000097          	auipc	ra,0x0
    800024ec:	e84080e7          	jalr	-380(ra) # 8000236c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    800024f0:	00000513          	li	a0,0
    800024f4:	f8dff06f          	j	80002480 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
    if(used == nullptr) return -1;
    800024f8:	fff00513          	li	a0,-1
    800024fc:	00008067          	ret
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    80002500:	ffe00513          	li	a0,-2
    80002504:	00008067          	ret
    80002508:	ffe00513          	li	a0,-2
    8000250c:	00008067          	ret
    80002510:	ffe00513          	li	a0,-2
    80002514:	00008067          	ret
    if(curr < used) return -3;
    80002518:	ffd00513          	li	a0,-3
}
    8000251c:	00008067          	ret

0000000080002520 <_ZN10MojSemaforC1Ej>:
{
  if(otvoren)
    close();
}

MojSemafor::MojSemafor(unsigned int v)
    80002520:	ff010113          	addi	sp,sp,-16
    80002524:	00813423          	sd	s0,8(sp)
    80002528:	01010413          	addi	s0,sp,16
Lista(): pocetak(nullptr), kraj(nullptr) {}
    8000252c:	00053023          	sd	zero,0(a0)
    80002530:	00053423          	sd	zero,8(a0)
{
  vrednost = v;
    80002534:	00b52a23          	sw	a1,20(a0)
  otvoren = true;
    80002538:	00100793          	li	a5,1
    8000253c:	00f50823          	sb	a5,16(a0)
}
    80002540:	00813403          	ld	s0,8(sp)
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret

000000008000254c <_ZN10MojSemafor8sem_openEPPS_j>:
{
    8000254c:	fd010113          	addi	sp,sp,-48
    80002550:	02113423          	sd	ra,40(sp)
    80002554:	02813023          	sd	s0,32(sp)
    80002558:	00913c23          	sd	s1,24(sp)
    8000255c:	01213823          	sd	s2,16(sp)
    80002560:	01313423          	sd	s3,8(sp)
    80002564:	03010413          	addi	s0,sp,48
    80002568:	00050493          	mv	s1,a0
    8000256c:	00058993          	mv	s3,a1
  *handle = new MojSemafor(init);
    80002570:	01800513          	li	a0,24
    80002574:	fffff097          	auipc	ra,0xfffff
    80002578:	434080e7          	jalr	1076(ra) # 800019a8 <_Znwm>
    8000257c:	00050913          	mv	s2,a0
    80002580:	00098593          	mv	a1,s3
    80002584:	00000097          	auipc	ra,0x0
    80002588:	f9c080e7          	jalr	-100(ra) # 80002520 <_ZN10MojSemaforC1Ej>
    8000258c:	0124b023          	sd	s2,0(s1)
}
    80002590:	00000513          	li	a0,0
    80002594:	02813083          	ld	ra,40(sp)
    80002598:	02013403          	ld	s0,32(sp)
    8000259c:	01813483          	ld	s1,24(sp)
    800025a0:	01013903          	ld	s2,16(sp)
    800025a4:	00813983          	ld	s3,8(sp)
    800025a8:	03010113          	addi	sp,sp,48
    800025ac:	00008067          	ret

00000000800025b0 <_ZN10MojSemafor6signalEv>:

int MojSemafor::signal()
{
  if(!otvoren)
    800025b0:	01054703          	lbu	a4,16(a0)
    800025b4:	08070a63          	beqz	a4,80002648 <_ZN10MojSemafor6signalEv+0x98>
    800025b8:	00050793          	mv	a5,a0
    return -1;

  TCB *thread;
  if(++vrednost <= 0)
    800025bc:	01452703          	lw	a4,20(a0)
    800025c0:	0017071b          	addiw	a4,a4,1
    800025c4:	0007069b          	sext.w	a3,a4
    800025c8:	00e52a23          	sw	a4,20(a0)
    800025cc:	00d05663          	blez	a3,800025d8 <_ZN10MojSemafor6signalEv+0x28>
      return 0;
    }
    thread->odblokiraj();
    Scheduler::stavi(thread);
  }
  return 0;
    800025d0:	00000513          	li	a0,0
    800025d4:	00008067          	ret
  if(pocetak == nullptr)
    800025d8:	00053503          	ld	a0,0(a0)
    800025dc:	06050a63          	beqz	a0,80002650 <_ZN10MojSemafor6signalEv+0xa0>
{
    800025e0:	fe010113          	addi	sp,sp,-32
    800025e4:	00113c23          	sd	ra,24(sp)
    800025e8:	00813823          	sd	s0,16(sp)
    800025ec:	00913423          	sd	s1,8(sp)
    800025f0:	02010413          	addi	s0,sp,32
  pocetak = pocetak->sledeci;
    800025f4:	00853703          	ld	a4,8(a0)
    800025f8:	00e7b023          	sd	a4,0(a5)
  if(pocetak == nullptr)
    800025fc:	02070e63          	beqz	a4,80002638 <_ZN10MojSemafor6signalEv+0x88>
  T* pv = cvor->podaci;
    80002600:	00053483          	ld	s1,0(a0)
  delete cvor;
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	3f4080e7          	jalr	1012(ra) # 800019f8 <_ZdlPv>
    if(thread == nullptr)
    8000260c:	02048a63          	beqz	s1,80002640 <_ZN10MojSemafor6signalEv+0x90>
     this->blokirana = false;
    80002610:	020484a3          	sb	zero,41(s1)
    Scheduler::stavi(thread);
    80002614:	00048513          	mv	a0,s1
    80002618:	fffff097          	auipc	ra,0xfffff
    8000261c:	470080e7          	jalr	1136(ra) # 80001a88 <_ZN9Scheduler5staviEP3TCB>
  return 0;
    80002620:	00000513          	li	a0,0
}
    80002624:	01813083          	ld	ra,24(sp)
    80002628:	01013403          	ld	s0,16(sp)
    8000262c:	00813483          	ld	s1,8(sp)
    80002630:	02010113          	addi	sp,sp,32
    80002634:	00008067          	ret
    kraj = nullptr;
    80002638:	0007b423          	sd	zero,8(a5)
    8000263c:	fc5ff06f          	j	80002600 <_ZN10MojSemafor6signalEv+0x50>
      return 0;
    80002640:	00000513          	li	a0,0
    80002644:	fe1ff06f          	j	80002624 <_ZN10MojSemafor6signalEv+0x74>
    return -1;
    80002648:	fff00513          	li	a0,-1
    8000264c:	00008067          	ret
      return 0;
    80002650:	00000513          	li	a0,0
}
    80002654:	00008067          	ret

0000000080002658 <_ZN10MojSemafor4waitEv>:

int MojSemafor::wait()
{
  if(!otvoren)
    80002658:	01054783          	lbu	a5,16(a0)
    8000265c:	0a078663          	beqz	a5,80002708 <_ZN10MojSemafor4waitEv+0xb0>
{
    80002660:	fe010113          	addi	sp,sp,-32
    80002664:	00113c23          	sd	ra,24(sp)
    80002668:	00813823          	sd	s0,16(sp)
    8000266c:	00913423          	sd	s1,8(sp)
    80002670:	01213023          	sd	s2,0(sp)
    80002674:	02010413          	addi	s0,sp,32
    80002678:	00050493          	mv	s1,a0
    return -1;

  if(--vrednost < 0)
    8000267c:	01452783          	lw	a5,20(a0)
    80002680:	fff7879b          	addiw	a5,a5,-1
    80002684:	00f52a23          	sw	a5,20(a0)
    80002688:	02079713          	slli	a4,a5,0x20
    8000268c:	02074063          	bltz	a4,800026ac <_ZN10MojSemafor4waitEv+0x54>
    blokirane.dodajNaKraj(TCB::trenutnaNit);
    TCB::dispatch();
    if(!otvoren)
      return -2;
  }
  return 0;
    80002690:	00000513          	li	a0,0

}
    80002694:	01813083          	ld	ra,24(sp)
    80002698:	01013403          	ld	s0,16(sp)
    8000269c:	00813483          	ld	s1,8(sp)
    800026a0:	00013903          	ld	s2,0(sp)
    800026a4:	02010113          	addi	sp,sp,32
    800026a8:	00008067          	ret
    TCB::trenutnaNit->blokiraj();
    800026ac:	00008797          	auipc	a5,0x8
    800026b0:	d6c7b783          	ld	a5,-660(a5) # 8000a418 <_GLOBAL_OFFSET_TABLE_+0x50>
    800026b4:	0007b903          	ld	s2,0(a5)
     this->blokirana = true;
    800026b8:	00100793          	li	a5,1
    800026bc:	02f904a3          	sb	a5,41(s2)
Cvor *noviCvor = new Cvor(t, nullptr);
    800026c0:	01000513          	li	a0,16
    800026c4:	fffff097          	auipc	ra,0xfffff
    800026c8:	2e4080e7          	jalr	740(ra) # 800019a8 <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    800026cc:	01253023          	sd	s2,0(a0)
    800026d0:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    800026d4:	0084b783          	ld	a5,8(s1)
    800026d8:	02078263          	beqz	a5,800026fc <_ZN10MojSemafor4waitEv+0xa4>
     kraj = kraj->sledeci = noviCvor;
    800026dc:	00a7b423          	sd	a0,8(a5)
    800026e0:	00a4b423          	sd	a0,8(s1)
    TCB::dispatch();
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	9cc080e7          	jalr	-1588(ra) # 800020b0 <_ZN3TCB8dispatchEv>
    if(!otvoren)
    800026ec:	0104c783          	lbu	a5,16(s1)
    800026f0:	02078063          	beqz	a5,80002710 <_ZN10MojSemafor4waitEv+0xb8>
  return 0;
    800026f4:	00000513          	li	a0,0
    800026f8:	f9dff06f          	j	80002694 <_ZN10MojSemafor4waitEv+0x3c>
    pocetak = kraj = noviCvor;
    800026fc:	00a4b423          	sd	a0,8(s1)
    80002700:	00a4b023          	sd	a0,0(s1)
    80002704:	fe1ff06f          	j	800026e4 <_ZN10MojSemafor4waitEv+0x8c>
    return -1;
    80002708:	fff00513          	li	a0,-1
}
    8000270c:	00008067          	ret
      return -2;
    80002710:	ffe00513          	li	a0,-2
    80002714:	f81ff06f          	j	80002694 <_ZN10MojSemafor4waitEv+0x3c>

0000000080002718 <_ZN10MojSemafor5closeEv>:

int MojSemafor::close()
{
  if(!otvoren)
    80002718:	01054783          	lbu	a5,16(a0)
    8000271c:	06078463          	beqz	a5,80002784 <_ZN10MojSemafor5closeEv+0x6c>
{
    80002720:	fe010113          	addi	sp,sp,-32
    80002724:	00113c23          	sd	ra,24(sp)
    80002728:	00813823          	sd	s0,16(sp)
    8000272c:	00913423          	sd	s1,8(sp)
    80002730:	01213023          	sd	s2,0(sp)
    80002734:	02010413          	addi	s0,sp,32
    80002738:	00050493          	mv	s1,a0
    return -1;

  otvoren = false;
    8000273c:	00050823          	sb	zero,16(a0)
    80002740:	0240006f          	j	80002764 <_ZN10MojSemafor5closeEv+0x4c>
    kraj = nullptr;
    80002744:	0004b423          	sd	zero,8(s1)
  T* pv = cvor->podaci;
    80002748:	00053903          	ld	s2,0(a0)
  delete cvor;
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	2ac080e7          	jalr	684(ra) # 800019f8 <_ZdlPv>
     this->blokirana = false;
    80002754:	020904a3          	sb	zero,41(s2)
  while(blokirane.dohvatiPrvi() != nullptr)
  {
    TCB *thread = blokirane.izbaciPrvi();
    thread->odblokiraj();
    Scheduler::stavi(thread);
    80002758:	00090513          	mv	a0,s2
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	32c080e7          	jalr	812(ra) # 80001a88 <_ZN9Scheduler5staviEP3TCB>
    return pv;
}

T* dohvatiPrvi()
{
if(pocetak == nullptr)
    80002764:	0004b503          	ld	a0,0(s1)
    80002768:	02050263          	beqz	a0,8000278c <_ZN10MojSemafor5closeEv+0x74>
  return nullptr;

return pocetak->podaci;
    8000276c:	00053783          	ld	a5,0(a0)
  while(blokirane.dohvatiPrvi() != nullptr)
    80002770:	02078c63          	beqz	a5,800027a8 <_ZN10MojSemafor5closeEv+0x90>
  pocetak = pocetak->sledeci;
    80002774:	00853783          	ld	a5,8(a0)
    80002778:	00f4b023          	sd	a5,0(s1)
  if(pocetak == nullptr)
    8000277c:	fc0796e3          	bnez	a5,80002748 <_ZN10MojSemafor5closeEv+0x30>
    80002780:	fc5ff06f          	j	80002744 <_ZN10MojSemafor5closeEv+0x2c>
    return -1;
    80002784:	fff00513          	li	a0,-1
  }

  return 0;
}
    80002788:	00008067          	ret
  return 0;
    8000278c:	00000513          	li	a0,0
}
    80002790:	01813083          	ld	ra,24(sp)
    80002794:	01013403          	ld	s0,16(sp)
    80002798:	00813483          	ld	s1,8(sp)
    8000279c:	00013903          	ld	s2,0(sp)
    800027a0:	02010113          	addi	sp,sp,32
    800027a4:	00008067          	ret
  return 0;
    800027a8:	00000513          	li	a0,0
    800027ac:	fe5ff06f          	j	80002790 <_ZN10MojSemafor5closeEv+0x78>

00000000800027b0 <_ZN10MojSemaforD1Ev>:
  if(otvoren)
    800027b0:	01054783          	lbu	a5,16(a0)
    800027b4:	00079463          	bnez	a5,800027bc <_ZN10MojSemaforD1Ev+0xc>
    800027b8:	00008067          	ret
MojSemafor::~MojSemafor()
    800027bc:	ff010113          	addi	sp,sp,-16
    800027c0:	00113423          	sd	ra,8(sp)
    800027c4:	00813023          	sd	s0,0(sp)
    800027c8:	01010413          	addi	s0,sp,16
    close();
    800027cc:	00000097          	auipc	ra,0x0
    800027d0:	f4c080e7          	jalr	-180(ra) # 80002718 <_ZN10MojSemafor5closeEv>
}
    800027d4:	00813083          	ld	ra,8(sp)
    800027d8:	00013403          	ld	s0,0(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_ZN10MojSemafor7trywaitEv>:

int MojSemafor::trywait()
{
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00813423          	sd	s0,8(sp)
    800027ec:	01010413          	addi	s0,sp,16
  if(vrednost <= 0)
    800027f0:	01452783          	lw	a5,20(a0)
    800027f4:	00f05e63          	blez	a5,80002810 <_ZN10MojSemafor7trywaitEv+0x2c>
    return 1;
  else
  {
    vrednost--;
    800027f8:	fff7879b          	addiw	a5,a5,-1
    800027fc:	00f52a23          	sw	a5,20(a0)
    return 0;
    80002800:	00000513          	li	a0,0
  }
}
    80002804:	00813403          	ld	s0,8(sp)
    80002808:	01010113          	addi	sp,sp,16
    8000280c:	00008067          	ret
    return 1;
    80002810:	00100513          	li	a0,1
    80002814:	ff1ff06f          	j	80002804 <_ZN10MojSemafor7trywaitEv+0x20>

0000000080002818 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002818:	fe010113          	addi	sp,sp,-32
    8000281c:	00113c23          	sd	ra,24(sp)
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	01213023          	sd	s2,0(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002834:	00000913          	li	s2,0
    80002838:	00c0006f          	j	80002844 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	f88080e7          	jalr	-120(ra) # 800017c4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	074080e7          	jalr	116(ra) # 800018b8 <_Z4getcv>
    8000284c:	0005059b          	sext.w	a1,a0
    80002850:	01b00793          	li	a5,27
    80002854:	02f58a63          	beq	a1,a5,80002888 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002858:	0084b503          	ld	a0,8(s1)
    8000285c:	00003097          	auipc	ra,0x3
    80002860:	2c8080e7          	jalr	712(ra) # 80005b24 <_ZN6Buffer3putEi>
        i++;
    80002864:	0019071b          	addiw	a4,s2,1
    80002868:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000286c:	0004a683          	lw	a3,0(s1)
    80002870:	0026979b          	slliw	a5,a3,0x2
    80002874:	00d787bb          	addw	a5,a5,a3
    80002878:	0017979b          	slliw	a5,a5,0x1
    8000287c:	02f767bb          	remw	a5,a4,a5
    80002880:	fc0792e3          	bnez	a5,80002844 <_ZL16producerKeyboardPv+0x2c>
    80002884:	fb9ff06f          	j	8000283c <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002888:	00100793          	li	a5,1
    8000288c:	00008717          	auipc	a4,0x8
    80002890:	c0f72e23          	sw	a5,-996(a4) # 8000a4a8 <_ZL9threadEnd>
    data->buffer->put('!');
    80002894:	02100593          	li	a1,33
    80002898:	0084b503          	ld	a0,8(s1)
    8000289c:	00003097          	auipc	ra,0x3
    800028a0:	288080e7          	jalr	648(ra) # 80005b24 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800028a4:	0104b503          	ld	a0,16(s1)
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	fb8080e7          	jalr	-72(ra) # 80001860 <_Z10sem_signalP10MojSemafor>
}
    800028b0:	01813083          	ld	ra,24(sp)
    800028b4:	01013403          	ld	s0,16(sp)
    800028b8:	00813483          	ld	s1,8(sp)
    800028bc:	00013903          	ld	s2,0(sp)
    800028c0:	02010113          	addi	sp,sp,32
    800028c4:	00008067          	ret

00000000800028c8 <_ZL8producerPv>:

static void producer(void *arg) {
    800028c8:	fe010113          	addi	sp,sp,-32
    800028cc:	00113c23          	sd	ra,24(sp)
    800028d0:	00813823          	sd	s0,16(sp)
    800028d4:	00913423          	sd	s1,8(sp)
    800028d8:	01213023          	sd	s2,0(sp)
    800028dc:	02010413          	addi	s0,sp,32
    800028e0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800028e4:	00000913          	li	s2,0
    800028e8:	00c0006f          	j	800028f4 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800028ec:	fffff097          	auipc	ra,0xfffff
    800028f0:	ed8080e7          	jalr	-296(ra) # 800017c4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    800028f4:	00008797          	auipc	a5,0x8
    800028f8:	bb47a783          	lw	a5,-1100(a5) # 8000a4a8 <_ZL9threadEnd>
    800028fc:	02079e63          	bnez	a5,80002938 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002900:	0004a583          	lw	a1,0(s1)
    80002904:	0305859b          	addiw	a1,a1,48
    80002908:	0084b503          	ld	a0,8(s1)
    8000290c:	00003097          	auipc	ra,0x3
    80002910:	218080e7          	jalr	536(ra) # 80005b24 <_ZN6Buffer3putEi>
        i++;
    80002914:	0019071b          	addiw	a4,s2,1
    80002918:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000291c:	0004a683          	lw	a3,0(s1)
    80002920:	0026979b          	slliw	a5,a3,0x2
    80002924:	00d787bb          	addw	a5,a5,a3
    80002928:	0017979b          	slliw	a5,a5,0x1
    8000292c:	02f767bb          	remw	a5,a4,a5
    80002930:	fc0792e3          	bnez	a5,800028f4 <_ZL8producerPv+0x2c>
    80002934:	fb9ff06f          	j	800028ec <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002938:	0104b503          	ld	a0,16(s1)
    8000293c:	fffff097          	auipc	ra,0xfffff
    80002940:	f24080e7          	jalr	-220(ra) # 80001860 <_Z10sem_signalP10MojSemafor>
}
    80002944:	01813083          	ld	ra,24(sp)
    80002948:	01013403          	ld	s0,16(sp)
    8000294c:	00813483          	ld	s1,8(sp)
    80002950:	00013903          	ld	s2,0(sp)
    80002954:	02010113          	addi	sp,sp,32
    80002958:	00008067          	ret

000000008000295c <_ZL8consumerPv>:

static void consumer(void *arg) {
    8000295c:	fd010113          	addi	sp,sp,-48
    80002960:	02113423          	sd	ra,40(sp)
    80002964:	02813023          	sd	s0,32(sp)
    80002968:	00913c23          	sd	s1,24(sp)
    8000296c:	01213823          	sd	s2,16(sp)
    80002970:	01313423          	sd	s3,8(sp)
    80002974:	03010413          	addi	s0,sp,48
    80002978:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000297c:	00000993          	li	s3,0
    80002980:	01c0006f          	j	8000299c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002984:	fffff097          	auipc	ra,0xfffff
    80002988:	e40080e7          	jalr	-448(ra) # 800017c4 <_Z15thread_dispatchv>
    8000298c:	0500006f          	j	800029dc <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002990:	00a00513          	li	a0,10
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	f4c080e7          	jalr	-180(ra) # 800018e0 <_Z4putcc>
    while (!threadEnd) {
    8000299c:	00008797          	auipc	a5,0x8
    800029a0:	b0c7a783          	lw	a5,-1268(a5) # 8000a4a8 <_ZL9threadEnd>
    800029a4:	06079063          	bnez	a5,80002a04 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800029a8:	00893503          	ld	a0,8(s2)
    800029ac:	00003097          	auipc	ra,0x3
    800029b0:	208080e7          	jalr	520(ra) # 80005bb4 <_ZN6Buffer3getEv>
        i++;
    800029b4:	0019849b          	addiw	s1,s3,1
    800029b8:	0004899b          	sext.w	s3,s1
        putc(key);
    800029bc:	0ff57513          	andi	a0,a0,255
    800029c0:	fffff097          	auipc	ra,0xfffff
    800029c4:	f20080e7          	jalr	-224(ra) # 800018e0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800029c8:	00092703          	lw	a4,0(s2)
    800029cc:	0027179b          	slliw	a5,a4,0x2
    800029d0:	00e787bb          	addw	a5,a5,a4
    800029d4:	02f4e7bb          	remw	a5,s1,a5
    800029d8:	fa0786e3          	beqz	a5,80002984 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    800029dc:	05000793          	li	a5,80
    800029e0:	02f4e4bb          	remw	s1,s1,a5
    800029e4:	fa049ce3          	bnez	s1,8000299c <_ZL8consumerPv+0x40>
    800029e8:	fa9ff06f          	j	80002990 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    800029ec:	00893503          	ld	a0,8(s2)
    800029f0:	00003097          	auipc	ra,0x3
    800029f4:	1c4080e7          	jalr	452(ra) # 80005bb4 <_ZN6Buffer3getEv>
        putc(key);
    800029f8:	0ff57513          	andi	a0,a0,255
    800029fc:	fffff097          	auipc	ra,0xfffff
    80002a00:	ee4080e7          	jalr	-284(ra) # 800018e0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002a04:	00893503          	ld	a0,8(s2)
    80002a08:	00003097          	auipc	ra,0x3
    80002a0c:	238080e7          	jalr	568(ra) # 80005c40 <_ZN6Buffer6getCntEv>
    80002a10:	fca04ee3          	bgtz	a0,800029ec <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002a14:	01093503          	ld	a0,16(s2)
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	e48080e7          	jalr	-440(ra) # 80001860 <_Z10sem_signalP10MojSemafor>
}
    80002a20:	02813083          	ld	ra,40(sp)
    80002a24:	02013403          	ld	s0,32(sp)
    80002a28:	01813483          	ld	s1,24(sp)
    80002a2c:	01013903          	ld	s2,16(sp)
    80002a30:	00813983          	ld	s3,8(sp)
    80002a34:	03010113          	addi	sp,sp,48
    80002a38:	00008067          	ret

0000000080002a3c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002a3c:	f9010113          	addi	sp,sp,-112
    80002a40:	06113423          	sd	ra,104(sp)
    80002a44:	06813023          	sd	s0,96(sp)
    80002a48:	04913c23          	sd	s1,88(sp)
    80002a4c:	05213823          	sd	s2,80(sp)
    80002a50:	05313423          	sd	s3,72(sp)
    80002a54:	05413023          	sd	s4,64(sp)
    80002a58:	03513c23          	sd	s5,56(sp)
    80002a5c:	03613823          	sd	s6,48(sp)
    80002a60:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002a64:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002a68:	00005517          	auipc	a0,0x5
    80002a6c:	6c850513          	addi	a0,a0,1736 # 80008130 <CONSOLE_STATUS+0x120>
    80002a70:	00002097          	auipc	ra,0x2
    80002a74:	220080e7          	jalr	544(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    80002a78:	01e00593          	li	a1,30
    80002a7c:	fa040493          	addi	s1,s0,-96
    80002a80:	00048513          	mv	a0,s1
    80002a84:	00002097          	auipc	ra,0x2
    80002a88:	294080e7          	jalr	660(ra) # 80004d18 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002a8c:	00048513          	mv	a0,s1
    80002a90:	00002097          	auipc	ra,0x2
    80002a94:	360080e7          	jalr	864(ra) # 80004df0 <_Z11stringToIntPKc>
    80002a98:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002a9c:	00005517          	auipc	a0,0x5
    80002aa0:	6b450513          	addi	a0,a0,1716 # 80008150 <CONSOLE_STATUS+0x140>
    80002aa4:	00002097          	auipc	ra,0x2
    80002aa8:	1ec080e7          	jalr	492(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    80002aac:	01e00593          	li	a1,30
    80002ab0:	00048513          	mv	a0,s1
    80002ab4:	00002097          	auipc	ra,0x2
    80002ab8:	264080e7          	jalr	612(ra) # 80004d18 <_Z9getStringPci>
    n = stringToInt(input);
    80002abc:	00048513          	mv	a0,s1
    80002ac0:	00002097          	auipc	ra,0x2
    80002ac4:	330080e7          	jalr	816(ra) # 80004df0 <_Z11stringToIntPKc>
    80002ac8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002acc:	00005517          	auipc	a0,0x5
    80002ad0:	6a450513          	addi	a0,a0,1700 # 80008170 <CONSOLE_STATUS+0x160>
    80002ad4:	00002097          	auipc	ra,0x2
    80002ad8:	1bc080e7          	jalr	444(ra) # 80004c90 <_Z11printStringPKc>
    80002adc:	00000613          	li	a2,0
    80002ae0:	00a00593          	li	a1,10
    80002ae4:	00090513          	mv	a0,s2
    80002ae8:	00002097          	auipc	ra,0x2
    80002aec:	358080e7          	jalr	856(ra) # 80004e40 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002af0:	00005517          	auipc	a0,0x5
    80002af4:	69850513          	addi	a0,a0,1688 # 80008188 <CONSOLE_STATUS+0x178>
    80002af8:	00002097          	auipc	ra,0x2
    80002afc:	198080e7          	jalr	408(ra) # 80004c90 <_Z11printStringPKc>
    80002b00:	00000613          	li	a2,0
    80002b04:	00a00593          	li	a1,10
    80002b08:	00048513          	mv	a0,s1
    80002b0c:	00002097          	auipc	ra,0x2
    80002b10:	334080e7          	jalr	820(ra) # 80004e40 <_Z8printIntiii>
    printString(".\n");
    80002b14:	00005517          	auipc	a0,0x5
    80002b18:	68c50513          	addi	a0,a0,1676 # 800081a0 <CONSOLE_STATUS+0x190>
    80002b1c:	00002097          	auipc	ra,0x2
    80002b20:	174080e7          	jalr	372(ra) # 80004c90 <_Z11printStringPKc>
    if(threadNum > n) {
    80002b24:	0324c463          	blt	s1,s2,80002b4c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002b28:	03205c63          	blez	s2,80002b60 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002b2c:	03800513          	li	a0,56
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	e78080e7          	jalr	-392(ra) # 800019a8 <_Znwm>
    80002b38:	00050a13          	mv	s4,a0
    80002b3c:	00048593          	mv	a1,s1
    80002b40:	00003097          	auipc	ra,0x3
    80002b44:	f48080e7          	jalr	-184(ra) # 80005a88 <_ZN6BufferC1Ei>
    80002b48:	0300006f          	j	80002b78 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002b4c:	00005517          	auipc	a0,0x5
    80002b50:	65c50513          	addi	a0,a0,1628 # 800081a8 <CONSOLE_STATUS+0x198>
    80002b54:	00002097          	auipc	ra,0x2
    80002b58:	13c080e7          	jalr	316(ra) # 80004c90 <_Z11printStringPKc>
        return;
    80002b5c:	0140006f          	j	80002b70 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002b60:	00005517          	auipc	a0,0x5
    80002b64:	68850513          	addi	a0,a0,1672 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80002b68:	00002097          	auipc	ra,0x2
    80002b6c:	128080e7          	jalr	296(ra) # 80004c90 <_Z11printStringPKc>
        return;
    80002b70:	000b0113          	mv	sp,s6
    80002b74:	1500006f          	j	80002cc4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002b78:	00000593          	li	a1,0
    80002b7c:	00008517          	auipc	a0,0x8
    80002b80:	93450513          	addi	a0,a0,-1740 # 8000a4b0 <_ZL10waitForAll>
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	d80080e7          	jalr	-640(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
    thread_t threads[threadNum];
    80002b8c:	00391793          	slli	a5,s2,0x3
    80002b90:	00f78793          	addi	a5,a5,15
    80002b94:	ff07f793          	andi	a5,a5,-16
    80002b98:	40f10133          	sub	sp,sp,a5
    80002b9c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002ba0:	0019071b          	addiw	a4,s2,1
    80002ba4:	00171793          	slli	a5,a4,0x1
    80002ba8:	00e787b3          	add	a5,a5,a4
    80002bac:	00379793          	slli	a5,a5,0x3
    80002bb0:	00f78793          	addi	a5,a5,15
    80002bb4:	ff07f793          	andi	a5,a5,-16
    80002bb8:	40f10133          	sub	sp,sp,a5
    80002bbc:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002bc0:	00191613          	slli	a2,s2,0x1
    80002bc4:	012607b3          	add	a5,a2,s2
    80002bc8:	00379793          	slli	a5,a5,0x3
    80002bcc:	00f987b3          	add	a5,s3,a5
    80002bd0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002bd4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002bd8:	00008717          	auipc	a4,0x8
    80002bdc:	8d873703          	ld	a4,-1832(a4) # 8000a4b0 <_ZL10waitForAll>
    80002be0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002be4:	00078613          	mv	a2,a5
    80002be8:	00000597          	auipc	a1,0x0
    80002bec:	d7458593          	addi	a1,a1,-652 # 8000295c <_ZL8consumerPv>
    80002bf0:	f9840513          	addi	a0,s0,-104
    80002bf4:	fffff097          	auipc	ra,0xfffff
    80002bf8:	ab0080e7          	jalr	-1360(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002bfc:	00000493          	li	s1,0
    80002c00:	0280006f          	j	80002c28 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002c04:	00000597          	auipc	a1,0x0
    80002c08:	c1458593          	addi	a1,a1,-1004 # 80002818 <_ZL16producerKeyboardPv>
                      data + i);
    80002c0c:	00179613          	slli	a2,a5,0x1
    80002c10:	00f60633          	add	a2,a2,a5
    80002c14:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002c18:	00c98633          	add	a2,s3,a2
    80002c1c:	fffff097          	auipc	ra,0xfffff
    80002c20:	a88080e7          	jalr	-1400(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002c24:	0014849b          	addiw	s1,s1,1
    80002c28:	0524d263          	bge	s1,s2,80002c6c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80002c2c:	00149793          	slli	a5,s1,0x1
    80002c30:	009787b3          	add	a5,a5,s1
    80002c34:	00379793          	slli	a5,a5,0x3
    80002c38:	00f987b3          	add	a5,s3,a5
    80002c3c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002c40:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002c44:	00008717          	auipc	a4,0x8
    80002c48:	86c73703          	ld	a4,-1940(a4) # 8000a4b0 <_ZL10waitForAll>
    80002c4c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002c50:	00048793          	mv	a5,s1
    80002c54:	00349513          	slli	a0,s1,0x3
    80002c58:	00aa8533          	add	a0,s5,a0
    80002c5c:	fa9054e3          	blez	s1,80002c04 <_Z22producerConsumer_C_APIv+0x1c8>
    80002c60:	00000597          	auipc	a1,0x0
    80002c64:	c6858593          	addi	a1,a1,-920 # 800028c8 <_ZL8producerPv>
    80002c68:	fa5ff06f          	j	80002c0c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	b58080e7          	jalr	-1192(ra) # 800017c4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002c74:	00000493          	li	s1,0
    80002c78:	00994e63          	blt	s2,s1,80002c94 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002c7c:	00008517          	auipc	a0,0x8
    80002c80:	83453503          	ld	a0,-1996(a0) # 8000a4b0 <_ZL10waitForAll>
    80002c84:	fffff097          	auipc	ra,0xfffff
    80002c88:	bb0080e7          	jalr	-1104(ra) # 80001834 <_Z8sem_waitP10MojSemafor>
    for (int i = 0; i <= threadNum; i++) {
    80002c8c:	0014849b          	addiw	s1,s1,1
    80002c90:	fe9ff06f          	j	80002c78 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002c94:	00008517          	auipc	a0,0x8
    80002c98:	81c53503          	ld	a0,-2020(a0) # 8000a4b0 <_ZL10waitForAll>
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	b6c080e7          	jalr	-1172(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
    delete buffer;
    80002ca4:	000a0e63          	beqz	s4,80002cc0 <_Z22producerConsumer_C_APIv+0x284>
    80002ca8:	000a0513          	mv	a0,s4
    80002cac:	00003097          	auipc	ra,0x3
    80002cb0:	01c080e7          	jalr	28(ra) # 80005cc8 <_ZN6BufferD1Ev>
    80002cb4:	000a0513          	mv	a0,s4
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	d40080e7          	jalr	-704(ra) # 800019f8 <_ZdlPv>
    80002cc0:	000b0113          	mv	sp,s6

}
    80002cc4:	f9040113          	addi	sp,s0,-112
    80002cc8:	06813083          	ld	ra,104(sp)
    80002ccc:	06013403          	ld	s0,96(sp)
    80002cd0:	05813483          	ld	s1,88(sp)
    80002cd4:	05013903          	ld	s2,80(sp)
    80002cd8:	04813983          	ld	s3,72(sp)
    80002cdc:	04013a03          	ld	s4,64(sp)
    80002ce0:	03813a83          	ld	s5,56(sp)
    80002ce4:	03013b03          	ld	s6,48(sp)
    80002ce8:	07010113          	addi	sp,sp,112
    80002cec:	00008067          	ret
    80002cf0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002cf4:	000a0513          	mv	a0,s4
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	d00080e7          	jalr	-768(ra) # 800019f8 <_ZdlPv>
    80002d00:	00048513          	mv	a0,s1
    80002d04:	00009097          	auipc	ra,0x9
    80002d08:	8c4080e7          	jalr	-1852(ra) # 8000b5c8 <_Unwind_Resume>

0000000080002d0c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002d0c:	fe010113          	addi	sp,sp,-32
    80002d10:	00113c23          	sd	ra,24(sp)
    80002d14:	00813823          	sd	s0,16(sp)
    80002d18:	00913423          	sd	s1,8(sp)
    80002d1c:	01213023          	sd	s2,0(sp)
    80002d20:	02010413          	addi	s0,sp,32
    80002d24:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002d28:	00100793          	li	a5,1
    80002d2c:	02a7f863          	bgeu	a5,a0,80002d5c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002d30:	00a00793          	li	a5,10
    80002d34:	02f577b3          	remu	a5,a0,a5
    80002d38:	02078e63          	beqz	a5,80002d74 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002d3c:	fff48513          	addi	a0,s1,-1
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	fcc080e7          	jalr	-52(ra) # 80002d0c <_ZL9fibonaccim>
    80002d48:	00050913          	mv	s2,a0
    80002d4c:	ffe48513          	addi	a0,s1,-2
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	fbc080e7          	jalr	-68(ra) # 80002d0c <_ZL9fibonaccim>
    80002d58:	00a90533          	add	a0,s2,a0
}
    80002d5c:	01813083          	ld	ra,24(sp)
    80002d60:	01013403          	ld	s0,16(sp)
    80002d64:	00813483          	ld	s1,8(sp)
    80002d68:	00013903          	ld	s2,0(sp)
    80002d6c:	02010113          	addi	sp,sp,32
    80002d70:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	a50080e7          	jalr	-1456(ra) # 800017c4 <_Z15thread_dispatchv>
    80002d7c:	fc1ff06f          	j	80002d3c <_ZL9fibonaccim+0x30>

0000000080002d80 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002d80:	fe010113          	addi	sp,sp,-32
    80002d84:	00113c23          	sd	ra,24(sp)
    80002d88:	00813823          	sd	s0,16(sp)
    80002d8c:	00913423          	sd	s1,8(sp)
    80002d90:	01213023          	sd	s2,0(sp)
    80002d94:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002d98:	00000913          	li	s2,0
    80002d9c:	0380006f          	j	80002dd4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	a24080e7          	jalr	-1500(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002da8:	00148493          	addi	s1,s1,1
    80002dac:	000027b7          	lui	a5,0x2
    80002db0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002db4:	0097ee63          	bltu	a5,s1,80002dd0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002db8:	00000713          	li	a4,0
    80002dbc:	000077b7          	lui	a5,0x7
    80002dc0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002dc4:	fce7eee3          	bltu	a5,a4,80002da0 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002dc8:	00170713          	addi	a4,a4,1
    80002dcc:	ff1ff06f          	j	80002dbc <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002dd0:	00190913          	addi	s2,s2,1
    80002dd4:	00900793          	li	a5,9
    80002dd8:	0527e063          	bltu	a5,s2,80002e18 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002ddc:	00005517          	auipc	a0,0x5
    80002de0:	43c50513          	addi	a0,a0,1084 # 80008218 <CONSOLE_STATUS+0x208>
    80002de4:	00002097          	auipc	ra,0x2
    80002de8:	eac080e7          	jalr	-340(ra) # 80004c90 <_Z11printStringPKc>
    80002dec:	00000613          	li	a2,0
    80002df0:	00a00593          	li	a1,10
    80002df4:	0009051b          	sext.w	a0,s2
    80002df8:	00002097          	auipc	ra,0x2
    80002dfc:	048080e7          	jalr	72(ra) # 80004e40 <_Z8printIntiii>
    80002e00:	00005517          	auipc	a0,0x5
    80002e04:	69850513          	addi	a0,a0,1688 # 80008498 <CONSOLE_STATUS+0x488>
    80002e08:	00002097          	auipc	ra,0x2
    80002e0c:	e88080e7          	jalr	-376(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002e10:	00000493          	li	s1,0
    80002e14:	f99ff06f          	j	80002dac <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002e18:	00005517          	auipc	a0,0x5
    80002e1c:	40850513          	addi	a0,a0,1032 # 80008220 <CONSOLE_STATUS+0x210>
    80002e20:	00002097          	auipc	ra,0x2
    80002e24:	e70080e7          	jalr	-400(ra) # 80004c90 <_Z11printStringPKc>
    finishedA = true;
    80002e28:	00100793          	li	a5,1
    80002e2c:	00007717          	auipc	a4,0x7
    80002e30:	68f70623          	sb	a5,1676(a4) # 8000a4b8 <_ZL9finishedA>
}
    80002e34:	01813083          	ld	ra,24(sp)
    80002e38:	01013403          	ld	s0,16(sp)
    80002e3c:	00813483          	ld	s1,8(sp)
    80002e40:	00013903          	ld	s2,0(sp)
    80002e44:	02010113          	addi	sp,sp,32
    80002e48:	00008067          	ret

0000000080002e4c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002e4c:	fe010113          	addi	sp,sp,-32
    80002e50:	00113c23          	sd	ra,24(sp)
    80002e54:	00813823          	sd	s0,16(sp)
    80002e58:	00913423          	sd	s1,8(sp)
    80002e5c:	01213023          	sd	s2,0(sp)
    80002e60:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002e64:	00000913          	li	s2,0
    80002e68:	0380006f          	j	80002ea0 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002e6c:	fffff097          	auipc	ra,0xfffff
    80002e70:	958080e7          	jalr	-1704(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002e74:	00148493          	addi	s1,s1,1
    80002e78:	000027b7          	lui	a5,0x2
    80002e7c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002e80:	0097ee63          	bltu	a5,s1,80002e9c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002e84:	00000713          	li	a4,0
    80002e88:	000077b7          	lui	a5,0x7
    80002e8c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002e90:	fce7eee3          	bltu	a5,a4,80002e6c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002e94:	00170713          	addi	a4,a4,1
    80002e98:	ff1ff06f          	j	80002e88 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002e9c:	00190913          	addi	s2,s2,1
    80002ea0:	00f00793          	li	a5,15
    80002ea4:	0527e063          	bltu	a5,s2,80002ee4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002ea8:	00005517          	auipc	a0,0x5
    80002eac:	38850513          	addi	a0,a0,904 # 80008230 <CONSOLE_STATUS+0x220>
    80002eb0:	00002097          	auipc	ra,0x2
    80002eb4:	de0080e7          	jalr	-544(ra) # 80004c90 <_Z11printStringPKc>
    80002eb8:	00000613          	li	a2,0
    80002ebc:	00a00593          	li	a1,10
    80002ec0:	0009051b          	sext.w	a0,s2
    80002ec4:	00002097          	auipc	ra,0x2
    80002ec8:	f7c080e7          	jalr	-132(ra) # 80004e40 <_Z8printIntiii>
    80002ecc:	00005517          	auipc	a0,0x5
    80002ed0:	5cc50513          	addi	a0,a0,1484 # 80008498 <CONSOLE_STATUS+0x488>
    80002ed4:	00002097          	auipc	ra,0x2
    80002ed8:	dbc080e7          	jalr	-580(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002edc:	00000493          	li	s1,0
    80002ee0:	f99ff06f          	j	80002e78 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80002ee4:	00005517          	auipc	a0,0x5
    80002ee8:	35450513          	addi	a0,a0,852 # 80008238 <CONSOLE_STATUS+0x228>
    80002eec:	00002097          	auipc	ra,0x2
    80002ef0:	da4080e7          	jalr	-604(ra) # 80004c90 <_Z11printStringPKc>
    finishedB = true;
    80002ef4:	00100793          	li	a5,1
    80002ef8:	00007717          	auipc	a4,0x7
    80002efc:	5cf700a3          	sb	a5,1473(a4) # 8000a4b9 <_ZL9finishedB>
    thread_dispatch();
    80002f00:	fffff097          	auipc	ra,0xfffff
    80002f04:	8c4080e7          	jalr	-1852(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80002f08:	01813083          	ld	ra,24(sp)
    80002f0c:	01013403          	ld	s0,16(sp)
    80002f10:	00813483          	ld	s1,8(sp)
    80002f14:	00013903          	ld	s2,0(sp)
    80002f18:	02010113          	addi	sp,sp,32
    80002f1c:	00008067          	ret

0000000080002f20 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002f20:	fe010113          	addi	sp,sp,-32
    80002f24:	00113c23          	sd	ra,24(sp)
    80002f28:	00813823          	sd	s0,16(sp)
    80002f2c:	00913423          	sd	s1,8(sp)
    80002f30:	01213023          	sd	s2,0(sp)
    80002f34:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002f38:	00000493          	li	s1,0
    80002f3c:	0400006f          	j	80002f7c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002f40:	00005517          	auipc	a0,0x5
    80002f44:	30850513          	addi	a0,a0,776 # 80008248 <CONSOLE_STATUS+0x238>
    80002f48:	00002097          	auipc	ra,0x2
    80002f4c:	d48080e7          	jalr	-696(ra) # 80004c90 <_Z11printStringPKc>
    80002f50:	00000613          	li	a2,0
    80002f54:	00a00593          	li	a1,10
    80002f58:	00048513          	mv	a0,s1
    80002f5c:	00002097          	auipc	ra,0x2
    80002f60:	ee4080e7          	jalr	-284(ra) # 80004e40 <_Z8printIntiii>
    80002f64:	00005517          	auipc	a0,0x5
    80002f68:	53450513          	addi	a0,a0,1332 # 80008498 <CONSOLE_STATUS+0x488>
    80002f6c:	00002097          	auipc	ra,0x2
    80002f70:	d24080e7          	jalr	-732(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002f74:	0014849b          	addiw	s1,s1,1
    80002f78:	0ff4f493          	andi	s1,s1,255
    80002f7c:	00200793          	li	a5,2
    80002f80:	fc97f0e3          	bgeu	a5,s1,80002f40 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002f84:	00005517          	auipc	a0,0x5
    80002f88:	2cc50513          	addi	a0,a0,716 # 80008250 <CONSOLE_STATUS+0x240>
    80002f8c:	00002097          	auipc	ra,0x2
    80002f90:	d04080e7          	jalr	-764(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002f94:	00700313          	li	t1,7
    thread_dispatch();
    80002f98:	fffff097          	auipc	ra,0xfffff
    80002f9c:	82c080e7          	jalr	-2004(ra) # 800017c4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002fa0:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002fa4:	00005517          	auipc	a0,0x5
    80002fa8:	2bc50513          	addi	a0,a0,700 # 80008260 <CONSOLE_STATUS+0x250>
    80002fac:	00002097          	auipc	ra,0x2
    80002fb0:	ce4080e7          	jalr	-796(ra) # 80004c90 <_Z11printStringPKc>
    80002fb4:	00000613          	li	a2,0
    80002fb8:	00a00593          	li	a1,10
    80002fbc:	0009051b          	sext.w	a0,s2
    80002fc0:	00002097          	auipc	ra,0x2
    80002fc4:	e80080e7          	jalr	-384(ra) # 80004e40 <_Z8printIntiii>
    80002fc8:	00005517          	auipc	a0,0x5
    80002fcc:	4d050513          	addi	a0,a0,1232 # 80008498 <CONSOLE_STATUS+0x488>
    80002fd0:	00002097          	auipc	ra,0x2
    80002fd4:	cc0080e7          	jalr	-832(ra) # 80004c90 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002fd8:	00c00513          	li	a0,12
    80002fdc:	00000097          	auipc	ra,0x0
    80002fe0:	d30080e7          	jalr	-720(ra) # 80002d0c <_ZL9fibonaccim>
    80002fe4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002fe8:	00005517          	auipc	a0,0x5
    80002fec:	28050513          	addi	a0,a0,640 # 80008268 <CONSOLE_STATUS+0x258>
    80002ff0:	00002097          	auipc	ra,0x2
    80002ff4:	ca0080e7          	jalr	-864(ra) # 80004c90 <_Z11printStringPKc>
    80002ff8:	00000613          	li	a2,0
    80002ffc:	00a00593          	li	a1,10
    80003000:	0009051b          	sext.w	a0,s2
    80003004:	00002097          	auipc	ra,0x2
    80003008:	e3c080e7          	jalr	-452(ra) # 80004e40 <_Z8printIntiii>
    8000300c:	00005517          	auipc	a0,0x5
    80003010:	48c50513          	addi	a0,a0,1164 # 80008498 <CONSOLE_STATUS+0x488>
    80003014:	00002097          	auipc	ra,0x2
    80003018:	c7c080e7          	jalr	-900(ra) # 80004c90 <_Z11printStringPKc>
    8000301c:	0400006f          	j	8000305c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003020:	00005517          	auipc	a0,0x5
    80003024:	22850513          	addi	a0,a0,552 # 80008248 <CONSOLE_STATUS+0x238>
    80003028:	00002097          	auipc	ra,0x2
    8000302c:	c68080e7          	jalr	-920(ra) # 80004c90 <_Z11printStringPKc>
    80003030:	00000613          	li	a2,0
    80003034:	00a00593          	li	a1,10
    80003038:	00048513          	mv	a0,s1
    8000303c:	00002097          	auipc	ra,0x2
    80003040:	e04080e7          	jalr	-508(ra) # 80004e40 <_Z8printIntiii>
    80003044:	00005517          	auipc	a0,0x5
    80003048:	45450513          	addi	a0,a0,1108 # 80008498 <CONSOLE_STATUS+0x488>
    8000304c:	00002097          	auipc	ra,0x2
    80003050:	c44080e7          	jalr	-956(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003054:	0014849b          	addiw	s1,s1,1
    80003058:	0ff4f493          	andi	s1,s1,255
    8000305c:	00500793          	li	a5,5
    80003060:	fc97f0e3          	bgeu	a5,s1,80003020 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003064:	00005517          	auipc	a0,0x5
    80003068:	1bc50513          	addi	a0,a0,444 # 80008220 <CONSOLE_STATUS+0x210>
    8000306c:	00002097          	auipc	ra,0x2
    80003070:	c24080e7          	jalr	-988(ra) # 80004c90 <_Z11printStringPKc>
    finishedC = true;
    80003074:	00100793          	li	a5,1
    80003078:	00007717          	auipc	a4,0x7
    8000307c:	44f70123          	sb	a5,1090(a4) # 8000a4ba <_ZL9finishedC>
    thread_dispatch();
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	744080e7          	jalr	1860(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80003088:	01813083          	ld	ra,24(sp)
    8000308c:	01013403          	ld	s0,16(sp)
    80003090:	00813483          	ld	s1,8(sp)
    80003094:	00013903          	ld	s2,0(sp)
    80003098:	02010113          	addi	sp,sp,32
    8000309c:	00008067          	ret

00000000800030a0 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800030a0:	fe010113          	addi	sp,sp,-32
    800030a4:	00113c23          	sd	ra,24(sp)
    800030a8:	00813823          	sd	s0,16(sp)
    800030ac:	00913423          	sd	s1,8(sp)
    800030b0:	01213023          	sd	s2,0(sp)
    800030b4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800030b8:	00a00493          	li	s1,10
    800030bc:	0400006f          	j	800030fc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800030c0:	00005517          	auipc	a0,0x5
    800030c4:	1b850513          	addi	a0,a0,440 # 80008278 <CONSOLE_STATUS+0x268>
    800030c8:	00002097          	auipc	ra,0x2
    800030cc:	bc8080e7          	jalr	-1080(ra) # 80004c90 <_Z11printStringPKc>
    800030d0:	00000613          	li	a2,0
    800030d4:	00a00593          	li	a1,10
    800030d8:	00048513          	mv	a0,s1
    800030dc:	00002097          	auipc	ra,0x2
    800030e0:	d64080e7          	jalr	-668(ra) # 80004e40 <_Z8printIntiii>
    800030e4:	00005517          	auipc	a0,0x5
    800030e8:	3b450513          	addi	a0,a0,948 # 80008498 <CONSOLE_STATUS+0x488>
    800030ec:	00002097          	auipc	ra,0x2
    800030f0:	ba4080e7          	jalr	-1116(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800030f4:	0014849b          	addiw	s1,s1,1
    800030f8:	0ff4f493          	andi	s1,s1,255
    800030fc:	00c00793          	li	a5,12
    80003100:	fc97f0e3          	bgeu	a5,s1,800030c0 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003104:	00005517          	auipc	a0,0x5
    80003108:	17c50513          	addi	a0,a0,380 # 80008280 <CONSOLE_STATUS+0x270>
    8000310c:	00002097          	auipc	ra,0x2
    80003110:	b84080e7          	jalr	-1148(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003114:	00500313          	li	t1,5
    thread_dispatch();
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	6ac080e7          	jalr	1708(ra) # 800017c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003120:	01000513          	li	a0,16
    80003124:	00000097          	auipc	ra,0x0
    80003128:	be8080e7          	jalr	-1048(ra) # 80002d0c <_ZL9fibonaccim>
    8000312c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003130:	00005517          	auipc	a0,0x5
    80003134:	16050513          	addi	a0,a0,352 # 80008290 <CONSOLE_STATUS+0x280>
    80003138:	00002097          	auipc	ra,0x2
    8000313c:	b58080e7          	jalr	-1192(ra) # 80004c90 <_Z11printStringPKc>
    80003140:	00000613          	li	a2,0
    80003144:	00a00593          	li	a1,10
    80003148:	0009051b          	sext.w	a0,s2
    8000314c:	00002097          	auipc	ra,0x2
    80003150:	cf4080e7          	jalr	-780(ra) # 80004e40 <_Z8printIntiii>
    80003154:	00005517          	auipc	a0,0x5
    80003158:	34450513          	addi	a0,a0,836 # 80008498 <CONSOLE_STATUS+0x488>
    8000315c:	00002097          	auipc	ra,0x2
    80003160:	b34080e7          	jalr	-1228(ra) # 80004c90 <_Z11printStringPKc>
    80003164:	0400006f          	j	800031a4 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003168:	00005517          	auipc	a0,0x5
    8000316c:	11050513          	addi	a0,a0,272 # 80008278 <CONSOLE_STATUS+0x268>
    80003170:	00002097          	auipc	ra,0x2
    80003174:	b20080e7          	jalr	-1248(ra) # 80004c90 <_Z11printStringPKc>
    80003178:	00000613          	li	a2,0
    8000317c:	00a00593          	li	a1,10
    80003180:	00048513          	mv	a0,s1
    80003184:	00002097          	auipc	ra,0x2
    80003188:	cbc080e7          	jalr	-836(ra) # 80004e40 <_Z8printIntiii>
    8000318c:	00005517          	auipc	a0,0x5
    80003190:	30c50513          	addi	a0,a0,780 # 80008498 <CONSOLE_STATUS+0x488>
    80003194:	00002097          	auipc	ra,0x2
    80003198:	afc080e7          	jalr	-1284(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000319c:	0014849b          	addiw	s1,s1,1
    800031a0:	0ff4f493          	andi	s1,s1,255
    800031a4:	00f00793          	li	a5,15
    800031a8:	fc97f0e3          	bgeu	a5,s1,80003168 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800031ac:	00005517          	auipc	a0,0x5
    800031b0:	0f450513          	addi	a0,a0,244 # 800082a0 <CONSOLE_STATUS+0x290>
    800031b4:	00002097          	auipc	ra,0x2
    800031b8:	adc080e7          	jalr	-1316(ra) # 80004c90 <_Z11printStringPKc>
    finishedD = true;
    800031bc:	00100793          	li	a5,1
    800031c0:	00007717          	auipc	a4,0x7
    800031c4:	2ef70da3          	sb	a5,763(a4) # 8000a4bb <_ZL9finishedD>
    thread_dispatch();
    800031c8:	ffffe097          	auipc	ra,0xffffe
    800031cc:	5fc080e7          	jalr	1532(ra) # 800017c4 <_Z15thread_dispatchv>
}
    800031d0:	01813083          	ld	ra,24(sp)
    800031d4:	01013403          	ld	s0,16(sp)
    800031d8:	00813483          	ld	s1,8(sp)
    800031dc:	00013903          	ld	s2,0(sp)
    800031e0:	02010113          	addi	sp,sp,32
    800031e4:	00008067          	ret

00000000800031e8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800031e8:	fc010113          	addi	sp,sp,-64
    800031ec:	02113c23          	sd	ra,56(sp)
    800031f0:	02813823          	sd	s0,48(sp)
    800031f4:	02913423          	sd	s1,40(sp)
    800031f8:	03213023          	sd	s2,32(sp)
    800031fc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003200:	02000513          	li	a0,32
    80003204:	ffffe097          	auipc	ra,0xffffe
    80003208:	7a4080e7          	jalr	1956(ra) # 800019a8 <_Znwm>
    8000320c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003210:	fffff097          	auipc	ra,0xfffff
    80003214:	c70080e7          	jalr	-912(ra) # 80001e80 <_ZN6ThreadC1Ev>
    80003218:	00007797          	auipc	a5,0x7
    8000321c:	01878793          	addi	a5,a5,24 # 8000a230 <_ZTV7WorkerA+0x10>
    80003220:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003224:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003228:	00005517          	auipc	a0,0x5
    8000322c:	08850513          	addi	a0,a0,136 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80003230:	00002097          	auipc	ra,0x2
    80003234:	a60080e7          	jalr	-1440(ra) # 80004c90 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003238:	02000513          	li	a0,32
    8000323c:	ffffe097          	auipc	ra,0xffffe
    80003240:	76c080e7          	jalr	1900(ra) # 800019a8 <_Znwm>
    80003244:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003248:	fffff097          	auipc	ra,0xfffff
    8000324c:	c38080e7          	jalr	-968(ra) # 80001e80 <_ZN6ThreadC1Ev>
    80003250:	00007797          	auipc	a5,0x7
    80003254:	00878793          	addi	a5,a5,8 # 8000a258 <_ZTV7WorkerB+0x10>
    80003258:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000325c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003260:	00005517          	auipc	a0,0x5
    80003264:	06850513          	addi	a0,a0,104 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80003268:	00002097          	auipc	ra,0x2
    8000326c:	a28080e7          	jalr	-1496(ra) # 80004c90 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003270:	02000513          	li	a0,32
    80003274:	ffffe097          	auipc	ra,0xffffe
    80003278:	734080e7          	jalr	1844(ra) # 800019a8 <_Znwm>
    8000327c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003280:	fffff097          	auipc	ra,0xfffff
    80003284:	c00080e7          	jalr	-1024(ra) # 80001e80 <_ZN6ThreadC1Ev>
    80003288:	00007797          	auipc	a5,0x7
    8000328c:	ff878793          	addi	a5,a5,-8 # 8000a280 <_ZTV7WorkerC+0x10>
    80003290:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003294:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003298:	00005517          	auipc	a0,0x5
    8000329c:	04850513          	addi	a0,a0,72 # 800082e0 <CONSOLE_STATUS+0x2d0>
    800032a0:	00002097          	auipc	ra,0x2
    800032a4:	9f0080e7          	jalr	-1552(ra) # 80004c90 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800032a8:	02000513          	li	a0,32
    800032ac:	ffffe097          	auipc	ra,0xffffe
    800032b0:	6fc080e7          	jalr	1788(ra) # 800019a8 <_Znwm>
    800032b4:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800032b8:	fffff097          	auipc	ra,0xfffff
    800032bc:	bc8080e7          	jalr	-1080(ra) # 80001e80 <_ZN6ThreadC1Ev>
    800032c0:	00007797          	auipc	a5,0x7
    800032c4:	fe878793          	addi	a5,a5,-24 # 8000a2a8 <_ZTV7WorkerD+0x10>
    800032c8:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800032cc:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800032d0:	00005517          	auipc	a0,0x5
    800032d4:	02850513          	addi	a0,a0,40 # 800082f8 <CONSOLE_STATUS+0x2e8>
    800032d8:	00002097          	auipc	ra,0x2
    800032dc:	9b8080e7          	jalr	-1608(ra) # 80004c90 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800032e0:	00000493          	li	s1,0
    800032e4:	00300793          	li	a5,3
    800032e8:	0297c663          	blt	a5,s1,80003314 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800032ec:	00349793          	slli	a5,s1,0x3
    800032f0:	fe040713          	addi	a4,s0,-32
    800032f4:	00f707b3          	add	a5,a4,a5
    800032f8:	fe07b503          	ld	a0,-32(a5)
    800032fc:	fffff097          	auipc	ra,0xfffff
    80003300:	b10080e7          	jalr	-1264(ra) # 80001e0c <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003304:	0014849b          	addiw	s1,s1,1
    80003308:	fddff06f          	j	800032e4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    8000330c:	fffff097          	auipc	ra,0xfffff
    80003310:	b30080e7          	jalr	-1232(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003314:	00007797          	auipc	a5,0x7
    80003318:	1a47c783          	lbu	a5,420(a5) # 8000a4b8 <_ZL9finishedA>
    8000331c:	fe0788e3          	beqz	a5,8000330c <_Z20Threads_CPP_API_testv+0x124>
    80003320:	00007797          	auipc	a5,0x7
    80003324:	1997c783          	lbu	a5,409(a5) # 8000a4b9 <_ZL9finishedB>
    80003328:	fe0782e3          	beqz	a5,8000330c <_Z20Threads_CPP_API_testv+0x124>
    8000332c:	00007797          	auipc	a5,0x7
    80003330:	18e7c783          	lbu	a5,398(a5) # 8000a4ba <_ZL9finishedC>
    80003334:	fc078ce3          	beqz	a5,8000330c <_Z20Threads_CPP_API_testv+0x124>
    80003338:	00007797          	auipc	a5,0x7
    8000333c:	1837c783          	lbu	a5,387(a5) # 8000a4bb <_ZL9finishedD>
    80003340:	fc0786e3          	beqz	a5,8000330c <_Z20Threads_CPP_API_testv+0x124>
    80003344:	fc040493          	addi	s1,s0,-64
    80003348:	0080006f          	j	80003350 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000334c:	00848493          	addi	s1,s1,8
    80003350:	fe040793          	addi	a5,s0,-32
    80003354:	08f48663          	beq	s1,a5,800033e0 <_Z20Threads_CPP_API_testv+0x1f8>
    80003358:	0004b503          	ld	a0,0(s1)
    8000335c:	fe0508e3          	beqz	a0,8000334c <_Z20Threads_CPP_API_testv+0x164>
    80003360:	00053783          	ld	a5,0(a0)
    80003364:	0087b783          	ld	a5,8(a5)
    80003368:	000780e7          	jalr	a5
    8000336c:	fe1ff06f          	j	8000334c <_Z20Threads_CPP_API_testv+0x164>
    80003370:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003374:	00048513          	mv	a0,s1
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	680080e7          	jalr	1664(ra) # 800019f8 <_ZdlPv>
    80003380:	00090513          	mv	a0,s2
    80003384:	00008097          	auipc	ra,0x8
    80003388:	244080e7          	jalr	580(ra) # 8000b5c8 <_Unwind_Resume>
    8000338c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003390:	00048513          	mv	a0,s1
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	664080e7          	jalr	1636(ra) # 800019f8 <_ZdlPv>
    8000339c:	00090513          	mv	a0,s2
    800033a0:	00008097          	auipc	ra,0x8
    800033a4:	228080e7          	jalr	552(ra) # 8000b5c8 <_Unwind_Resume>
    800033a8:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800033ac:	00048513          	mv	a0,s1
    800033b0:	ffffe097          	auipc	ra,0xffffe
    800033b4:	648080e7          	jalr	1608(ra) # 800019f8 <_ZdlPv>
    800033b8:	00090513          	mv	a0,s2
    800033bc:	00008097          	auipc	ra,0x8
    800033c0:	20c080e7          	jalr	524(ra) # 8000b5c8 <_Unwind_Resume>
    800033c4:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800033c8:	00048513          	mv	a0,s1
    800033cc:	ffffe097          	auipc	ra,0xffffe
    800033d0:	62c080e7          	jalr	1580(ra) # 800019f8 <_ZdlPv>
    800033d4:	00090513          	mv	a0,s2
    800033d8:	00008097          	auipc	ra,0x8
    800033dc:	1f0080e7          	jalr	496(ra) # 8000b5c8 <_Unwind_Resume>
}
    800033e0:	03813083          	ld	ra,56(sp)
    800033e4:	03013403          	ld	s0,48(sp)
    800033e8:	02813483          	ld	s1,40(sp)
    800033ec:	02013903          	ld	s2,32(sp)
    800033f0:	04010113          	addi	sp,sp,64
    800033f4:	00008067          	ret

00000000800033f8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00113423          	sd	ra,8(sp)
    80003400:	00813023          	sd	s0,0(sp)
    80003404:	01010413          	addi	s0,sp,16
    80003408:	00007797          	auipc	a5,0x7
    8000340c:	e2878793          	addi	a5,a5,-472 # 8000a230 <_ZTV7WorkerA+0x10>
    80003410:	00f53023          	sd	a5,0(a0)
    80003414:	fffff097          	auipc	ra,0xfffff
    80003418:	8b0080e7          	jalr	-1872(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    8000341c:	00813083          	ld	ra,8(sp)
    80003420:	00013403          	ld	s0,0(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret

000000008000342c <_ZN7WorkerAD0Ev>:
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00113c23          	sd	ra,24(sp)
    80003434:	00813823          	sd	s0,16(sp)
    80003438:	00913423          	sd	s1,8(sp)
    8000343c:	02010413          	addi	s0,sp,32
    80003440:	00050493          	mv	s1,a0
    80003444:	00007797          	auipc	a5,0x7
    80003448:	dec78793          	addi	a5,a5,-532 # 8000a230 <_ZTV7WorkerA+0x10>
    8000344c:	00f53023          	sd	a5,0(a0)
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	874080e7          	jalr	-1932(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003458:	00048513          	mv	a0,s1
    8000345c:	ffffe097          	auipc	ra,0xffffe
    80003460:	59c080e7          	jalr	1436(ra) # 800019f8 <_ZdlPv>
    80003464:	01813083          	ld	ra,24(sp)
    80003468:	01013403          	ld	s0,16(sp)
    8000346c:	00813483          	ld	s1,8(sp)
    80003470:	02010113          	addi	sp,sp,32
    80003474:	00008067          	ret

0000000080003478 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003478:	ff010113          	addi	sp,sp,-16
    8000347c:	00113423          	sd	ra,8(sp)
    80003480:	00813023          	sd	s0,0(sp)
    80003484:	01010413          	addi	s0,sp,16
    80003488:	00007797          	auipc	a5,0x7
    8000348c:	dd078793          	addi	a5,a5,-560 # 8000a258 <_ZTV7WorkerB+0x10>
    80003490:	00f53023          	sd	a5,0(a0)
    80003494:	fffff097          	auipc	ra,0xfffff
    80003498:	830080e7          	jalr	-2000(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    8000349c:	00813083          	ld	ra,8(sp)
    800034a0:	00013403          	ld	s0,0(sp)
    800034a4:	01010113          	addi	sp,sp,16
    800034a8:	00008067          	ret

00000000800034ac <_ZN7WorkerBD0Ev>:
    800034ac:	fe010113          	addi	sp,sp,-32
    800034b0:	00113c23          	sd	ra,24(sp)
    800034b4:	00813823          	sd	s0,16(sp)
    800034b8:	00913423          	sd	s1,8(sp)
    800034bc:	02010413          	addi	s0,sp,32
    800034c0:	00050493          	mv	s1,a0
    800034c4:	00007797          	auipc	a5,0x7
    800034c8:	d9478793          	addi	a5,a5,-620 # 8000a258 <_ZTV7WorkerB+0x10>
    800034cc:	00f53023          	sd	a5,0(a0)
    800034d0:	ffffe097          	auipc	ra,0xffffe
    800034d4:	7f4080e7          	jalr	2036(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    800034d8:	00048513          	mv	a0,s1
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	51c080e7          	jalr	1308(ra) # 800019f8 <_ZdlPv>
    800034e4:	01813083          	ld	ra,24(sp)
    800034e8:	01013403          	ld	s0,16(sp)
    800034ec:	00813483          	ld	s1,8(sp)
    800034f0:	02010113          	addi	sp,sp,32
    800034f4:	00008067          	ret

00000000800034f8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800034f8:	ff010113          	addi	sp,sp,-16
    800034fc:	00113423          	sd	ra,8(sp)
    80003500:	00813023          	sd	s0,0(sp)
    80003504:	01010413          	addi	s0,sp,16
    80003508:	00007797          	auipc	a5,0x7
    8000350c:	d7878793          	addi	a5,a5,-648 # 8000a280 <_ZTV7WorkerC+0x10>
    80003510:	00f53023          	sd	a5,0(a0)
    80003514:	ffffe097          	auipc	ra,0xffffe
    80003518:	7b0080e7          	jalr	1968(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    8000351c:	00813083          	ld	ra,8(sp)
    80003520:	00013403          	ld	s0,0(sp)
    80003524:	01010113          	addi	sp,sp,16
    80003528:	00008067          	ret

000000008000352c <_ZN7WorkerCD0Ev>:
    8000352c:	fe010113          	addi	sp,sp,-32
    80003530:	00113c23          	sd	ra,24(sp)
    80003534:	00813823          	sd	s0,16(sp)
    80003538:	00913423          	sd	s1,8(sp)
    8000353c:	02010413          	addi	s0,sp,32
    80003540:	00050493          	mv	s1,a0
    80003544:	00007797          	auipc	a5,0x7
    80003548:	d3c78793          	addi	a5,a5,-708 # 8000a280 <_ZTV7WorkerC+0x10>
    8000354c:	00f53023          	sd	a5,0(a0)
    80003550:	ffffe097          	auipc	ra,0xffffe
    80003554:	774080e7          	jalr	1908(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003558:	00048513          	mv	a0,s1
    8000355c:	ffffe097          	auipc	ra,0xffffe
    80003560:	49c080e7          	jalr	1180(ra) # 800019f8 <_ZdlPv>
    80003564:	01813083          	ld	ra,24(sp)
    80003568:	01013403          	ld	s0,16(sp)
    8000356c:	00813483          	ld	s1,8(sp)
    80003570:	02010113          	addi	sp,sp,32
    80003574:	00008067          	ret

0000000080003578 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003578:	ff010113          	addi	sp,sp,-16
    8000357c:	00113423          	sd	ra,8(sp)
    80003580:	00813023          	sd	s0,0(sp)
    80003584:	01010413          	addi	s0,sp,16
    80003588:	00007797          	auipc	a5,0x7
    8000358c:	d2078793          	addi	a5,a5,-736 # 8000a2a8 <_ZTV7WorkerD+0x10>
    80003590:	00f53023          	sd	a5,0(a0)
    80003594:	ffffe097          	auipc	ra,0xffffe
    80003598:	730080e7          	jalr	1840(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    8000359c:	00813083          	ld	ra,8(sp)
    800035a0:	00013403          	ld	s0,0(sp)
    800035a4:	01010113          	addi	sp,sp,16
    800035a8:	00008067          	ret

00000000800035ac <_ZN7WorkerDD0Ev>:
    800035ac:	fe010113          	addi	sp,sp,-32
    800035b0:	00113c23          	sd	ra,24(sp)
    800035b4:	00813823          	sd	s0,16(sp)
    800035b8:	00913423          	sd	s1,8(sp)
    800035bc:	02010413          	addi	s0,sp,32
    800035c0:	00050493          	mv	s1,a0
    800035c4:	00007797          	auipc	a5,0x7
    800035c8:	ce478793          	addi	a5,a5,-796 # 8000a2a8 <_ZTV7WorkerD+0x10>
    800035cc:	00f53023          	sd	a5,0(a0)
    800035d0:	ffffe097          	auipc	ra,0xffffe
    800035d4:	6f4080e7          	jalr	1780(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    800035d8:	00048513          	mv	a0,s1
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	41c080e7          	jalr	1052(ra) # 800019f8 <_ZdlPv>
    800035e4:	01813083          	ld	ra,24(sp)
    800035e8:	01013403          	ld	s0,16(sp)
    800035ec:	00813483          	ld	s1,8(sp)
    800035f0:	02010113          	addi	sp,sp,32
    800035f4:	00008067          	ret

00000000800035f8 <_ZN7WorkerA3runEv>:
    void run() override {
    800035f8:	ff010113          	addi	sp,sp,-16
    800035fc:	00113423          	sd	ra,8(sp)
    80003600:	00813023          	sd	s0,0(sp)
    80003604:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003608:	00000593          	li	a1,0
    8000360c:	fffff097          	auipc	ra,0xfffff
    80003610:	774080e7          	jalr	1908(ra) # 80002d80 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003614:	00813083          	ld	ra,8(sp)
    80003618:	00013403          	ld	s0,0(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret

0000000080003624 <_ZN7WorkerB3runEv>:
    void run() override {
    80003624:	ff010113          	addi	sp,sp,-16
    80003628:	00113423          	sd	ra,8(sp)
    8000362c:	00813023          	sd	s0,0(sp)
    80003630:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003634:	00000593          	li	a1,0
    80003638:	00000097          	auipc	ra,0x0
    8000363c:	814080e7          	jalr	-2028(ra) # 80002e4c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003640:	00813083          	ld	ra,8(sp)
    80003644:	00013403          	ld	s0,0(sp)
    80003648:	01010113          	addi	sp,sp,16
    8000364c:	00008067          	ret

0000000080003650 <_ZN7WorkerC3runEv>:
    void run() override {
    80003650:	ff010113          	addi	sp,sp,-16
    80003654:	00113423          	sd	ra,8(sp)
    80003658:	00813023          	sd	s0,0(sp)
    8000365c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003660:	00000593          	li	a1,0
    80003664:	00000097          	auipc	ra,0x0
    80003668:	8bc080e7          	jalr	-1860(ra) # 80002f20 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000366c:	00813083          	ld	ra,8(sp)
    80003670:	00013403          	ld	s0,0(sp)
    80003674:	01010113          	addi	sp,sp,16
    80003678:	00008067          	ret

000000008000367c <_ZN7WorkerD3runEv>:
    void run() override {
    8000367c:	ff010113          	addi	sp,sp,-16
    80003680:	00113423          	sd	ra,8(sp)
    80003684:	00813023          	sd	s0,0(sp)
    80003688:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000368c:	00000593          	li	a1,0
    80003690:	00000097          	auipc	ra,0x0
    80003694:	a10080e7          	jalr	-1520(ra) # 800030a0 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003698:	00813083          	ld	ra,8(sp)
    8000369c:	00013403          	ld	s0,0(sp)
    800036a0:	01010113          	addi	sp,sp,16
    800036a4:	00008067          	ret

00000000800036a8 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800036a8:	f8010113          	addi	sp,sp,-128
    800036ac:	06113c23          	sd	ra,120(sp)
    800036b0:	06813823          	sd	s0,112(sp)
    800036b4:	06913423          	sd	s1,104(sp)
    800036b8:	07213023          	sd	s2,96(sp)
    800036bc:	05313c23          	sd	s3,88(sp)
    800036c0:	05413823          	sd	s4,80(sp)
    800036c4:	05513423          	sd	s5,72(sp)
    800036c8:	05613023          	sd	s6,64(sp)
    800036cc:	03713c23          	sd	s7,56(sp)
    800036d0:	03813823          	sd	s8,48(sp)
    800036d4:	03913423          	sd	s9,40(sp)
    800036d8:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800036dc:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800036e0:	00005517          	auipc	a0,0x5
    800036e4:	a5050513          	addi	a0,a0,-1456 # 80008130 <CONSOLE_STATUS+0x120>
    800036e8:	00001097          	auipc	ra,0x1
    800036ec:	5a8080e7          	jalr	1448(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    800036f0:	01e00593          	li	a1,30
    800036f4:	f8040493          	addi	s1,s0,-128
    800036f8:	00048513          	mv	a0,s1
    800036fc:	00001097          	auipc	ra,0x1
    80003700:	61c080e7          	jalr	1564(ra) # 80004d18 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003704:	00048513          	mv	a0,s1
    80003708:	00001097          	auipc	ra,0x1
    8000370c:	6e8080e7          	jalr	1768(ra) # 80004df0 <_Z11stringToIntPKc>
    80003710:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003714:	00005517          	auipc	a0,0x5
    80003718:	a3c50513          	addi	a0,a0,-1476 # 80008150 <CONSOLE_STATUS+0x140>
    8000371c:	00001097          	auipc	ra,0x1
    80003720:	574080e7          	jalr	1396(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    80003724:	01e00593          	li	a1,30
    80003728:	00048513          	mv	a0,s1
    8000372c:	00001097          	auipc	ra,0x1
    80003730:	5ec080e7          	jalr	1516(ra) # 80004d18 <_Z9getStringPci>
    n = stringToInt(input);
    80003734:	00048513          	mv	a0,s1
    80003738:	00001097          	auipc	ra,0x1
    8000373c:	6b8080e7          	jalr	1720(ra) # 80004df0 <_Z11stringToIntPKc>
    80003740:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003744:	00005517          	auipc	a0,0x5
    80003748:	a2c50513          	addi	a0,a0,-1492 # 80008170 <CONSOLE_STATUS+0x160>
    8000374c:	00001097          	auipc	ra,0x1
    80003750:	544080e7          	jalr	1348(ra) # 80004c90 <_Z11printStringPKc>
    printInt(threadNum);
    80003754:	00000613          	li	a2,0
    80003758:	00a00593          	li	a1,10
    8000375c:	00098513          	mv	a0,s3
    80003760:	00001097          	auipc	ra,0x1
    80003764:	6e0080e7          	jalr	1760(ra) # 80004e40 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003768:	00005517          	auipc	a0,0x5
    8000376c:	a2050513          	addi	a0,a0,-1504 # 80008188 <CONSOLE_STATUS+0x178>
    80003770:	00001097          	auipc	ra,0x1
    80003774:	520080e7          	jalr	1312(ra) # 80004c90 <_Z11printStringPKc>
    printInt(n);
    80003778:	00000613          	li	a2,0
    8000377c:	00a00593          	li	a1,10
    80003780:	00048513          	mv	a0,s1
    80003784:	00001097          	auipc	ra,0x1
    80003788:	6bc080e7          	jalr	1724(ra) # 80004e40 <_Z8printIntiii>
    printString(".\n");
    8000378c:	00005517          	auipc	a0,0x5
    80003790:	a1450513          	addi	a0,a0,-1516 # 800081a0 <CONSOLE_STATUS+0x190>
    80003794:	00001097          	auipc	ra,0x1
    80003798:	4fc080e7          	jalr	1276(ra) # 80004c90 <_Z11printStringPKc>
    if (threadNum > n) {
    8000379c:	0334c463          	blt	s1,s3,800037c4 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800037a0:	03305c63          	blez	s3,800037d8 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800037a4:	03800513          	li	a0,56
    800037a8:	ffffe097          	auipc	ra,0xffffe
    800037ac:	200080e7          	jalr	512(ra) # 800019a8 <_Znwm>
    800037b0:	00050a93          	mv	s5,a0
    800037b4:	00048593          	mv	a1,s1
    800037b8:	00001097          	auipc	ra,0x1
    800037bc:	7a8080e7          	jalr	1960(ra) # 80004f60 <_ZN9BufferCPPC1Ei>
    800037c0:	0300006f          	j	800037f0 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800037c4:	00005517          	auipc	a0,0x5
    800037c8:	9e450513          	addi	a0,a0,-1564 # 800081a8 <CONSOLE_STATUS+0x198>
    800037cc:	00001097          	auipc	ra,0x1
    800037d0:	4c4080e7          	jalr	1220(ra) # 80004c90 <_Z11printStringPKc>
        return;
    800037d4:	0140006f          	j	800037e8 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800037d8:	00005517          	auipc	a0,0x5
    800037dc:	a1050513          	addi	a0,a0,-1520 # 800081e8 <CONSOLE_STATUS+0x1d8>
    800037e0:	00001097          	auipc	ra,0x1
    800037e4:	4b0080e7          	jalr	1200(ra) # 80004c90 <_Z11printStringPKc>
        return;
    800037e8:	000c0113          	mv	sp,s8
    800037ec:	2140006f          	j	80003a00 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    800037f0:	01000513          	li	a0,16
    800037f4:	ffffe097          	auipc	ra,0xffffe
    800037f8:	1b4080e7          	jalr	436(ra) # 800019a8 <_Znwm>
    800037fc:	00050913          	mv	s2,a0
    80003800:	00000593          	li	a1,0
    80003804:	ffffe097          	auipc	ra,0xffffe
    80003808:	6c0080e7          	jalr	1728(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    8000380c:	00007797          	auipc	a5,0x7
    80003810:	cb27be23          	sd	s2,-836(a5) # 8000a4c8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003814:	00399793          	slli	a5,s3,0x3
    80003818:	00f78793          	addi	a5,a5,15
    8000381c:	ff07f793          	andi	a5,a5,-16
    80003820:	40f10133          	sub	sp,sp,a5
    80003824:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003828:	0019871b          	addiw	a4,s3,1
    8000382c:	00171793          	slli	a5,a4,0x1
    80003830:	00e787b3          	add	a5,a5,a4
    80003834:	00379793          	slli	a5,a5,0x3
    80003838:	00f78793          	addi	a5,a5,15
    8000383c:	ff07f793          	andi	a5,a5,-16
    80003840:	40f10133          	sub	sp,sp,a5
    80003844:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003848:	00199493          	slli	s1,s3,0x1
    8000384c:	013484b3          	add	s1,s1,s3
    80003850:	00349493          	slli	s1,s1,0x3
    80003854:	009b04b3          	add	s1,s6,s1
    80003858:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    8000385c:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003860:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003864:	02800513          	li	a0,40
    80003868:	ffffe097          	auipc	ra,0xffffe
    8000386c:	140080e7          	jalr	320(ra) # 800019a8 <_Znwm>
    80003870:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003874:	ffffe097          	auipc	ra,0xffffe
    80003878:	60c080e7          	jalr	1548(ra) # 80001e80 <_ZN6ThreadC1Ev>
    8000387c:	00007797          	auipc	a5,0x7
    80003880:	aa478793          	addi	a5,a5,-1372 # 8000a320 <_ZTV8Consumer+0x10>
    80003884:	00fbb023          	sd	a5,0(s7)
    80003888:	029bb023          	sd	s1,32(s7)
    consumer->start();
    8000388c:	000b8513          	mv	a0,s7
    80003890:	ffffe097          	auipc	ra,0xffffe
    80003894:	57c080e7          	jalr	1404(ra) # 80001e0c <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80003898:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000389c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800038a0:	00007797          	auipc	a5,0x7
    800038a4:	c287b783          	ld	a5,-984(a5) # 8000a4c8 <_ZL10waitForAll>
    800038a8:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800038ac:	02800513          	li	a0,40
    800038b0:	ffffe097          	auipc	ra,0xffffe
    800038b4:	0f8080e7          	jalr	248(ra) # 800019a8 <_Znwm>
    800038b8:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	5c4080e7          	jalr	1476(ra) # 80001e80 <_ZN6ThreadC1Ev>
    800038c4:	00007797          	auipc	a5,0x7
    800038c8:	a0c78793          	addi	a5,a5,-1524 # 8000a2d0 <_ZTV16ProducerKeyborad+0x10>
    800038cc:	00f4b023          	sd	a5,0(s1)
    800038d0:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800038d4:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800038d8:	00048513          	mv	a0,s1
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	530080e7          	jalr	1328(ra) # 80001e0c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800038e4:	00100913          	li	s2,1
    800038e8:	0300006f          	j	80003918 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800038ec:	00007797          	auipc	a5,0x7
    800038f0:	a0c78793          	addi	a5,a5,-1524 # 8000a2f8 <_ZTV8Producer+0x10>
    800038f4:	00fcb023          	sd	a5,0(s9)
    800038f8:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    800038fc:	00391793          	slli	a5,s2,0x3
    80003900:	00fa07b3          	add	a5,s4,a5
    80003904:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80003908:	000c8513          	mv	a0,s9
    8000390c:	ffffe097          	auipc	ra,0xffffe
    80003910:	500080e7          	jalr	1280(ra) # 80001e0c <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003914:	0019091b          	addiw	s2,s2,1
    80003918:	05395263          	bge	s2,s3,8000395c <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000391c:	00191493          	slli	s1,s2,0x1
    80003920:	012484b3          	add	s1,s1,s2
    80003924:	00349493          	slli	s1,s1,0x3
    80003928:	009b04b3          	add	s1,s6,s1
    8000392c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80003930:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80003934:	00007797          	auipc	a5,0x7
    80003938:	b947b783          	ld	a5,-1132(a5) # 8000a4c8 <_ZL10waitForAll>
    8000393c:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80003940:	02800513          	li	a0,40
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	064080e7          	jalr	100(ra) # 800019a8 <_Znwm>
    8000394c:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	530080e7          	jalr	1328(ra) # 80001e80 <_ZN6ThreadC1Ev>
    80003958:	f95ff06f          	j	800038ec <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    8000395c:	ffffe097          	auipc	ra,0xffffe
    80003960:	4e0080e7          	jalr	1248(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003964:	00000493          	li	s1,0
    80003968:	0099ce63          	blt	s3,s1,80003984 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    8000396c:	00007517          	auipc	a0,0x7
    80003970:	b5c53503          	ld	a0,-1188(a0) # 8000a4c8 <_ZL10waitForAll>
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	588080e7          	jalr	1416(ra) # 80001efc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000397c:	0014849b          	addiw	s1,s1,1
    80003980:	fe9ff06f          	j	80003968 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80003984:	00007517          	auipc	a0,0x7
    80003988:	b4453503          	ld	a0,-1212(a0) # 8000a4c8 <_ZL10waitForAll>
    8000398c:	00050863          	beqz	a0,8000399c <_Z20testConsumerProducerv+0x2f4>
    80003990:	00053783          	ld	a5,0(a0)
    80003994:	0087b783          	ld	a5,8(a5)
    80003998:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000399c:	00000493          	li	s1,0
    800039a0:	0080006f          	j	800039a8 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800039a4:	0014849b          	addiw	s1,s1,1
    800039a8:	0334d263          	bge	s1,s3,800039cc <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800039ac:	00349793          	slli	a5,s1,0x3
    800039b0:	00fa07b3          	add	a5,s4,a5
    800039b4:	0007b503          	ld	a0,0(a5)
    800039b8:	fe0506e3          	beqz	a0,800039a4 <_Z20testConsumerProducerv+0x2fc>
    800039bc:	00053783          	ld	a5,0(a0)
    800039c0:	0087b783          	ld	a5,8(a5)
    800039c4:	000780e7          	jalr	a5
    800039c8:	fddff06f          	j	800039a4 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800039cc:	000b8a63          	beqz	s7,800039e0 <_Z20testConsumerProducerv+0x338>
    800039d0:	000bb783          	ld	a5,0(s7)
    800039d4:	0087b783          	ld	a5,8(a5)
    800039d8:	000b8513          	mv	a0,s7
    800039dc:	000780e7          	jalr	a5
    delete buffer;
    800039e0:	000a8e63          	beqz	s5,800039fc <_Z20testConsumerProducerv+0x354>
    800039e4:	000a8513          	mv	a0,s5
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	870080e7          	jalr	-1936(ra) # 80005258 <_ZN9BufferCPPD1Ev>
    800039f0:	000a8513          	mv	a0,s5
    800039f4:	ffffe097          	auipc	ra,0xffffe
    800039f8:	004080e7          	jalr	4(ra) # 800019f8 <_ZdlPv>
    800039fc:	000c0113          	mv	sp,s8
}
    80003a00:	f8040113          	addi	sp,s0,-128
    80003a04:	07813083          	ld	ra,120(sp)
    80003a08:	07013403          	ld	s0,112(sp)
    80003a0c:	06813483          	ld	s1,104(sp)
    80003a10:	06013903          	ld	s2,96(sp)
    80003a14:	05813983          	ld	s3,88(sp)
    80003a18:	05013a03          	ld	s4,80(sp)
    80003a1c:	04813a83          	ld	s5,72(sp)
    80003a20:	04013b03          	ld	s6,64(sp)
    80003a24:	03813b83          	ld	s7,56(sp)
    80003a28:	03013c03          	ld	s8,48(sp)
    80003a2c:	02813c83          	ld	s9,40(sp)
    80003a30:	08010113          	addi	sp,sp,128
    80003a34:	00008067          	ret
    80003a38:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003a3c:	000a8513          	mv	a0,s5
    80003a40:	ffffe097          	auipc	ra,0xffffe
    80003a44:	fb8080e7          	jalr	-72(ra) # 800019f8 <_ZdlPv>
    80003a48:	00048513          	mv	a0,s1
    80003a4c:	00008097          	auipc	ra,0x8
    80003a50:	b7c080e7          	jalr	-1156(ra) # 8000b5c8 <_Unwind_Resume>
    80003a54:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80003a58:	00090513          	mv	a0,s2
    80003a5c:	ffffe097          	auipc	ra,0xffffe
    80003a60:	f9c080e7          	jalr	-100(ra) # 800019f8 <_ZdlPv>
    80003a64:	00048513          	mv	a0,s1
    80003a68:	00008097          	auipc	ra,0x8
    80003a6c:	b60080e7          	jalr	-1184(ra) # 8000b5c8 <_Unwind_Resume>
    80003a70:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003a74:	000b8513          	mv	a0,s7
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	f80080e7          	jalr	-128(ra) # 800019f8 <_ZdlPv>
    80003a80:	00048513          	mv	a0,s1
    80003a84:	00008097          	auipc	ra,0x8
    80003a88:	b44080e7          	jalr	-1212(ra) # 8000b5c8 <_Unwind_Resume>
    80003a8c:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003a90:	00048513          	mv	a0,s1
    80003a94:	ffffe097          	auipc	ra,0xffffe
    80003a98:	f64080e7          	jalr	-156(ra) # 800019f8 <_ZdlPv>
    80003a9c:	00090513          	mv	a0,s2
    80003aa0:	00008097          	auipc	ra,0x8
    80003aa4:	b28080e7          	jalr	-1240(ra) # 8000b5c8 <_Unwind_Resume>
    80003aa8:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80003aac:	000c8513          	mv	a0,s9
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	f48080e7          	jalr	-184(ra) # 800019f8 <_ZdlPv>
    80003ab8:	00048513          	mv	a0,s1
    80003abc:	00008097          	auipc	ra,0x8
    80003ac0:	b0c080e7          	jalr	-1268(ra) # 8000b5c8 <_Unwind_Resume>

0000000080003ac4 <_ZN8Consumer3runEv>:
    void run() override {
    80003ac4:	fd010113          	addi	sp,sp,-48
    80003ac8:	02113423          	sd	ra,40(sp)
    80003acc:	02813023          	sd	s0,32(sp)
    80003ad0:	00913c23          	sd	s1,24(sp)
    80003ad4:	01213823          	sd	s2,16(sp)
    80003ad8:	01313423          	sd	s3,8(sp)
    80003adc:	03010413          	addi	s0,sp,48
    80003ae0:	00050913          	mv	s2,a0
        int i = 0;
    80003ae4:	00000993          	li	s3,0
    80003ae8:	0100006f          	j	80003af8 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80003aec:	00a00513          	li	a0,10
    80003af0:	ffffe097          	auipc	ra,0xffffe
    80003af4:	4b8080e7          	jalr	1208(ra) # 80001fa8 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80003af8:	00007797          	auipc	a5,0x7
    80003afc:	9c87a783          	lw	a5,-1592(a5) # 8000a4c0 <_ZL9threadEnd>
    80003b00:	04079a63          	bnez	a5,80003b54 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80003b04:	02093783          	ld	a5,32(s2)
    80003b08:	0087b503          	ld	a0,8(a5)
    80003b0c:	00001097          	auipc	ra,0x1
    80003b10:	638080e7          	jalr	1592(ra) # 80005144 <_ZN9BufferCPP3getEv>
            i++;
    80003b14:	0019849b          	addiw	s1,s3,1
    80003b18:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80003b1c:	0ff57513          	andi	a0,a0,255
    80003b20:	ffffe097          	auipc	ra,0xffffe
    80003b24:	488080e7          	jalr	1160(ra) # 80001fa8 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80003b28:	05000793          	li	a5,80
    80003b2c:	02f4e4bb          	remw	s1,s1,a5
    80003b30:	fc0494e3          	bnez	s1,80003af8 <_ZN8Consumer3runEv+0x34>
    80003b34:	fb9ff06f          	j	80003aec <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003b38:	02093783          	ld	a5,32(s2)
    80003b3c:	0087b503          	ld	a0,8(a5)
    80003b40:	00001097          	auipc	ra,0x1
    80003b44:	604080e7          	jalr	1540(ra) # 80005144 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80003b48:	0ff57513          	andi	a0,a0,255
    80003b4c:	ffffe097          	auipc	ra,0xffffe
    80003b50:	45c080e7          	jalr	1116(ra) # 80001fa8 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80003b54:	02093783          	ld	a5,32(s2)
    80003b58:	0087b503          	ld	a0,8(a5)
    80003b5c:	00001097          	auipc	ra,0x1
    80003b60:	674080e7          	jalr	1652(ra) # 800051d0 <_ZN9BufferCPP6getCntEv>
    80003b64:	fca04ae3          	bgtz	a0,80003b38 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003b68:	02093783          	ld	a5,32(s2)
    80003b6c:	0107b503          	ld	a0,16(a5)
    80003b70:	ffffe097          	auipc	ra,0xffffe
    80003b74:	3b8080e7          	jalr	952(ra) # 80001f28 <_ZN9Semaphore6signalEv>
    }
    80003b78:	02813083          	ld	ra,40(sp)
    80003b7c:	02013403          	ld	s0,32(sp)
    80003b80:	01813483          	ld	s1,24(sp)
    80003b84:	01013903          	ld	s2,16(sp)
    80003b88:	00813983          	ld	s3,8(sp)
    80003b8c:	03010113          	addi	sp,sp,48
    80003b90:	00008067          	ret

0000000080003b94 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80003b94:	ff010113          	addi	sp,sp,-16
    80003b98:	00113423          	sd	ra,8(sp)
    80003b9c:	00813023          	sd	s0,0(sp)
    80003ba0:	01010413          	addi	s0,sp,16
    80003ba4:	00006797          	auipc	a5,0x6
    80003ba8:	77c78793          	addi	a5,a5,1916 # 8000a320 <_ZTV8Consumer+0x10>
    80003bac:	00f53023          	sd	a5,0(a0)
    80003bb0:	ffffe097          	auipc	ra,0xffffe
    80003bb4:	114080e7          	jalr	276(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003bb8:	00813083          	ld	ra,8(sp)
    80003bbc:	00013403          	ld	s0,0(sp)
    80003bc0:	01010113          	addi	sp,sp,16
    80003bc4:	00008067          	ret

0000000080003bc8 <_ZN8ConsumerD0Ev>:
    80003bc8:	fe010113          	addi	sp,sp,-32
    80003bcc:	00113c23          	sd	ra,24(sp)
    80003bd0:	00813823          	sd	s0,16(sp)
    80003bd4:	00913423          	sd	s1,8(sp)
    80003bd8:	02010413          	addi	s0,sp,32
    80003bdc:	00050493          	mv	s1,a0
    80003be0:	00006797          	auipc	a5,0x6
    80003be4:	74078793          	addi	a5,a5,1856 # 8000a320 <_ZTV8Consumer+0x10>
    80003be8:	00f53023          	sd	a5,0(a0)
    80003bec:	ffffe097          	auipc	ra,0xffffe
    80003bf0:	0d8080e7          	jalr	216(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003bf4:	00048513          	mv	a0,s1
    80003bf8:	ffffe097          	auipc	ra,0xffffe
    80003bfc:	e00080e7          	jalr	-512(ra) # 800019f8 <_ZdlPv>
    80003c00:	01813083          	ld	ra,24(sp)
    80003c04:	01013403          	ld	s0,16(sp)
    80003c08:	00813483          	ld	s1,8(sp)
    80003c0c:	02010113          	addi	sp,sp,32
    80003c10:	00008067          	ret

0000000080003c14 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80003c14:	ff010113          	addi	sp,sp,-16
    80003c18:	00113423          	sd	ra,8(sp)
    80003c1c:	00813023          	sd	s0,0(sp)
    80003c20:	01010413          	addi	s0,sp,16
    80003c24:	00006797          	auipc	a5,0x6
    80003c28:	6ac78793          	addi	a5,a5,1708 # 8000a2d0 <_ZTV16ProducerKeyborad+0x10>
    80003c2c:	00f53023          	sd	a5,0(a0)
    80003c30:	ffffe097          	auipc	ra,0xffffe
    80003c34:	094080e7          	jalr	148(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003c38:	00813083          	ld	ra,8(sp)
    80003c3c:	00013403          	ld	s0,0(sp)
    80003c40:	01010113          	addi	sp,sp,16
    80003c44:	00008067          	ret

0000000080003c48 <_ZN16ProducerKeyboradD0Ev>:
    80003c48:	fe010113          	addi	sp,sp,-32
    80003c4c:	00113c23          	sd	ra,24(sp)
    80003c50:	00813823          	sd	s0,16(sp)
    80003c54:	00913423          	sd	s1,8(sp)
    80003c58:	02010413          	addi	s0,sp,32
    80003c5c:	00050493          	mv	s1,a0
    80003c60:	00006797          	auipc	a5,0x6
    80003c64:	67078793          	addi	a5,a5,1648 # 8000a2d0 <_ZTV16ProducerKeyborad+0x10>
    80003c68:	00f53023          	sd	a5,0(a0)
    80003c6c:	ffffe097          	auipc	ra,0xffffe
    80003c70:	058080e7          	jalr	88(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003c74:	00048513          	mv	a0,s1
    80003c78:	ffffe097          	auipc	ra,0xffffe
    80003c7c:	d80080e7          	jalr	-640(ra) # 800019f8 <_ZdlPv>
    80003c80:	01813083          	ld	ra,24(sp)
    80003c84:	01013403          	ld	s0,16(sp)
    80003c88:	00813483          	ld	s1,8(sp)
    80003c8c:	02010113          	addi	sp,sp,32
    80003c90:	00008067          	ret

0000000080003c94 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80003c94:	ff010113          	addi	sp,sp,-16
    80003c98:	00113423          	sd	ra,8(sp)
    80003c9c:	00813023          	sd	s0,0(sp)
    80003ca0:	01010413          	addi	s0,sp,16
    80003ca4:	00006797          	auipc	a5,0x6
    80003ca8:	65478793          	addi	a5,a5,1620 # 8000a2f8 <_ZTV8Producer+0x10>
    80003cac:	00f53023          	sd	a5,0(a0)
    80003cb0:	ffffe097          	auipc	ra,0xffffe
    80003cb4:	014080e7          	jalr	20(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003cb8:	00813083          	ld	ra,8(sp)
    80003cbc:	00013403          	ld	s0,0(sp)
    80003cc0:	01010113          	addi	sp,sp,16
    80003cc4:	00008067          	ret

0000000080003cc8 <_ZN8ProducerD0Ev>:
    80003cc8:	fe010113          	addi	sp,sp,-32
    80003ccc:	00113c23          	sd	ra,24(sp)
    80003cd0:	00813823          	sd	s0,16(sp)
    80003cd4:	00913423          	sd	s1,8(sp)
    80003cd8:	02010413          	addi	s0,sp,32
    80003cdc:	00050493          	mv	s1,a0
    80003ce0:	00006797          	auipc	a5,0x6
    80003ce4:	61878793          	addi	a5,a5,1560 # 8000a2f8 <_ZTV8Producer+0x10>
    80003ce8:	00f53023          	sd	a5,0(a0)
    80003cec:	ffffe097          	auipc	ra,0xffffe
    80003cf0:	fd8080e7          	jalr	-40(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80003cf4:	00048513          	mv	a0,s1
    80003cf8:	ffffe097          	auipc	ra,0xffffe
    80003cfc:	d00080e7          	jalr	-768(ra) # 800019f8 <_ZdlPv>
    80003d00:	01813083          	ld	ra,24(sp)
    80003d04:	01013403          	ld	s0,16(sp)
    80003d08:	00813483          	ld	s1,8(sp)
    80003d0c:	02010113          	addi	sp,sp,32
    80003d10:	00008067          	ret

0000000080003d14 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80003d14:	fe010113          	addi	sp,sp,-32
    80003d18:	00113c23          	sd	ra,24(sp)
    80003d1c:	00813823          	sd	s0,16(sp)
    80003d20:	00913423          	sd	s1,8(sp)
    80003d24:	02010413          	addi	s0,sp,32
    80003d28:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80003d2c:	ffffe097          	auipc	ra,0xffffe
    80003d30:	b8c080e7          	jalr	-1140(ra) # 800018b8 <_Z4getcv>
    80003d34:	0005059b          	sext.w	a1,a0
    80003d38:	01b00793          	li	a5,27
    80003d3c:	00f58c63          	beq	a1,a5,80003d54 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80003d40:	0204b783          	ld	a5,32(s1)
    80003d44:	0087b503          	ld	a0,8(a5)
    80003d48:	00001097          	auipc	ra,0x1
    80003d4c:	36c080e7          	jalr	876(ra) # 800050b4 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80003d50:	fddff06f          	j	80003d2c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80003d54:	00100793          	li	a5,1
    80003d58:	00006717          	auipc	a4,0x6
    80003d5c:	76f72423          	sw	a5,1896(a4) # 8000a4c0 <_ZL9threadEnd>
        td->buffer->put('!');
    80003d60:	0204b783          	ld	a5,32(s1)
    80003d64:	02100593          	li	a1,33
    80003d68:	0087b503          	ld	a0,8(a5)
    80003d6c:	00001097          	auipc	ra,0x1
    80003d70:	348080e7          	jalr	840(ra) # 800050b4 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80003d74:	0204b783          	ld	a5,32(s1)
    80003d78:	0107b503          	ld	a0,16(a5)
    80003d7c:	ffffe097          	auipc	ra,0xffffe
    80003d80:	1ac080e7          	jalr	428(ra) # 80001f28 <_ZN9Semaphore6signalEv>
    }
    80003d84:	01813083          	ld	ra,24(sp)
    80003d88:	01013403          	ld	s0,16(sp)
    80003d8c:	00813483          	ld	s1,8(sp)
    80003d90:	02010113          	addi	sp,sp,32
    80003d94:	00008067          	ret

0000000080003d98 <_ZN8Producer3runEv>:
    void run() override {
    80003d98:	fe010113          	addi	sp,sp,-32
    80003d9c:	00113c23          	sd	ra,24(sp)
    80003da0:	00813823          	sd	s0,16(sp)
    80003da4:	00913423          	sd	s1,8(sp)
    80003da8:	01213023          	sd	s2,0(sp)
    80003dac:	02010413          	addi	s0,sp,32
    80003db0:	00050493          	mv	s1,a0
        int i = 0;
    80003db4:	00000913          	li	s2,0
        while (!threadEnd) {
    80003db8:	00006797          	auipc	a5,0x6
    80003dbc:	7087a783          	lw	a5,1800(a5) # 8000a4c0 <_ZL9threadEnd>
    80003dc0:	04079263          	bnez	a5,80003e04 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80003dc4:	0204b783          	ld	a5,32(s1)
    80003dc8:	0007a583          	lw	a1,0(a5)
    80003dcc:	0305859b          	addiw	a1,a1,48
    80003dd0:	0087b503          	ld	a0,8(a5)
    80003dd4:	00001097          	auipc	ra,0x1
    80003dd8:	2e0080e7          	jalr	736(ra) # 800050b4 <_ZN9BufferCPP3putEi>
            i++;
    80003ddc:	0019071b          	addiw	a4,s2,1
    80003de0:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80003de4:	0204b783          	ld	a5,32(s1)
    80003de8:	0007a783          	lw	a5,0(a5)
    80003dec:	00e787bb          	addw	a5,a5,a4
    80003df0:	00500513          	li	a0,5
    80003df4:	02a7e53b          	remw	a0,a5,a0
    80003df8:	ffffe097          	auipc	ra,0xffffe
    80003dfc:	06c080e7          	jalr	108(ra) # 80001e64 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80003e00:	fb9ff06f          	j	80003db8 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80003e04:	0204b783          	ld	a5,32(s1)
    80003e08:	0107b503          	ld	a0,16(a5)
    80003e0c:	ffffe097          	auipc	ra,0xffffe
    80003e10:	11c080e7          	jalr	284(ra) # 80001f28 <_ZN9Semaphore6signalEv>
    }
    80003e14:	01813083          	ld	ra,24(sp)
    80003e18:	01013403          	ld	s0,16(sp)
    80003e1c:	00813483          	ld	s1,8(sp)
    80003e20:	00013903          	ld	s2,0(sp)
    80003e24:	02010113          	addi	sp,sp,32
    80003e28:	00008067          	ret

0000000080003e2c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003e2c:	fe010113          	addi	sp,sp,-32
    80003e30:	00113c23          	sd	ra,24(sp)
    80003e34:	00813823          	sd	s0,16(sp)
    80003e38:	00913423          	sd	s1,8(sp)
    80003e3c:	01213023          	sd	s2,0(sp)
    80003e40:	02010413          	addi	s0,sp,32
    80003e44:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003e48:	00100793          	li	a5,1
    80003e4c:	02a7f863          	bgeu	a5,a0,80003e7c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003e50:	00a00793          	li	a5,10
    80003e54:	02f577b3          	remu	a5,a0,a5
    80003e58:	02078e63          	beqz	a5,80003e94 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003e5c:	fff48513          	addi	a0,s1,-1
    80003e60:	00000097          	auipc	ra,0x0
    80003e64:	fcc080e7          	jalr	-52(ra) # 80003e2c <_ZL9fibonaccim>
    80003e68:	00050913          	mv	s2,a0
    80003e6c:	ffe48513          	addi	a0,s1,-2
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	fbc080e7          	jalr	-68(ra) # 80003e2c <_ZL9fibonaccim>
    80003e78:	00a90533          	add	a0,s2,a0
}
    80003e7c:	01813083          	ld	ra,24(sp)
    80003e80:	01013403          	ld	s0,16(sp)
    80003e84:	00813483          	ld	s1,8(sp)
    80003e88:	00013903          	ld	s2,0(sp)
    80003e8c:	02010113          	addi	sp,sp,32
    80003e90:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003e94:	ffffe097          	auipc	ra,0xffffe
    80003e98:	930080e7          	jalr	-1744(ra) # 800017c4 <_Z15thread_dispatchv>
    80003e9c:	fc1ff06f          	j	80003e5c <_ZL9fibonaccim+0x30>

0000000080003ea0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80003ea0:	fe010113          	addi	sp,sp,-32
    80003ea4:	00113c23          	sd	ra,24(sp)
    80003ea8:	00813823          	sd	s0,16(sp)
    80003eac:	00913423          	sd	s1,8(sp)
    80003eb0:	01213023          	sd	s2,0(sp)
    80003eb4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003eb8:	00a00493          	li	s1,10
    80003ebc:	0400006f          	j	80003efc <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003ec0:	00004517          	auipc	a0,0x4
    80003ec4:	3b850513          	addi	a0,a0,952 # 80008278 <CONSOLE_STATUS+0x268>
    80003ec8:	00001097          	auipc	ra,0x1
    80003ecc:	dc8080e7          	jalr	-568(ra) # 80004c90 <_Z11printStringPKc>
    80003ed0:	00000613          	li	a2,0
    80003ed4:	00a00593          	li	a1,10
    80003ed8:	00048513          	mv	a0,s1
    80003edc:	00001097          	auipc	ra,0x1
    80003ee0:	f64080e7          	jalr	-156(ra) # 80004e40 <_Z8printIntiii>
    80003ee4:	00004517          	auipc	a0,0x4
    80003ee8:	5b450513          	addi	a0,a0,1460 # 80008498 <CONSOLE_STATUS+0x488>
    80003eec:	00001097          	auipc	ra,0x1
    80003ef0:	da4080e7          	jalr	-604(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003ef4:	0014849b          	addiw	s1,s1,1
    80003ef8:	0ff4f493          	andi	s1,s1,255
    80003efc:	00c00793          	li	a5,12
    80003f00:	fc97f0e3          	bgeu	a5,s1,80003ec0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80003f04:	00004517          	auipc	a0,0x4
    80003f08:	37c50513          	addi	a0,a0,892 # 80008280 <CONSOLE_STATUS+0x270>
    80003f0c:	00001097          	auipc	ra,0x1
    80003f10:	d84080e7          	jalr	-636(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f14:	00500313          	li	t1,5
    thread_dispatch();
    80003f18:	ffffe097          	auipc	ra,0xffffe
    80003f1c:	8ac080e7          	jalr	-1876(ra) # 800017c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f20:	01000513          	li	a0,16
    80003f24:	00000097          	auipc	ra,0x0
    80003f28:	f08080e7          	jalr	-248(ra) # 80003e2c <_ZL9fibonaccim>
    80003f2c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f30:	00004517          	auipc	a0,0x4
    80003f34:	36050513          	addi	a0,a0,864 # 80008290 <CONSOLE_STATUS+0x280>
    80003f38:	00001097          	auipc	ra,0x1
    80003f3c:	d58080e7          	jalr	-680(ra) # 80004c90 <_Z11printStringPKc>
    80003f40:	00000613          	li	a2,0
    80003f44:	00a00593          	li	a1,10
    80003f48:	0009051b          	sext.w	a0,s2
    80003f4c:	00001097          	auipc	ra,0x1
    80003f50:	ef4080e7          	jalr	-268(ra) # 80004e40 <_Z8printIntiii>
    80003f54:	00004517          	auipc	a0,0x4
    80003f58:	54450513          	addi	a0,a0,1348 # 80008498 <CONSOLE_STATUS+0x488>
    80003f5c:	00001097          	auipc	ra,0x1
    80003f60:	d34080e7          	jalr	-716(ra) # 80004c90 <_Z11printStringPKc>
    80003f64:	0400006f          	j	80003fa4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f68:	00004517          	auipc	a0,0x4
    80003f6c:	31050513          	addi	a0,a0,784 # 80008278 <CONSOLE_STATUS+0x268>
    80003f70:	00001097          	auipc	ra,0x1
    80003f74:	d20080e7          	jalr	-736(ra) # 80004c90 <_Z11printStringPKc>
    80003f78:	00000613          	li	a2,0
    80003f7c:	00a00593          	li	a1,10
    80003f80:	00048513          	mv	a0,s1
    80003f84:	00001097          	auipc	ra,0x1
    80003f88:	ebc080e7          	jalr	-324(ra) # 80004e40 <_Z8printIntiii>
    80003f8c:	00004517          	auipc	a0,0x4
    80003f90:	50c50513          	addi	a0,a0,1292 # 80008498 <CONSOLE_STATUS+0x488>
    80003f94:	00001097          	auipc	ra,0x1
    80003f98:	cfc080e7          	jalr	-772(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003f9c:	0014849b          	addiw	s1,s1,1
    80003fa0:	0ff4f493          	andi	s1,s1,255
    80003fa4:	00f00793          	li	a5,15
    80003fa8:	fc97f0e3          	bgeu	a5,s1,80003f68 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80003fac:	00004517          	auipc	a0,0x4
    80003fb0:	2f450513          	addi	a0,a0,756 # 800082a0 <CONSOLE_STATUS+0x290>
    80003fb4:	00001097          	auipc	ra,0x1
    80003fb8:	cdc080e7          	jalr	-804(ra) # 80004c90 <_Z11printStringPKc>
    finishedD = true;
    80003fbc:	00100793          	li	a5,1
    80003fc0:	00006717          	auipc	a4,0x6
    80003fc4:	50f70823          	sb	a5,1296(a4) # 8000a4d0 <_ZL9finishedD>
    thread_dispatch();
    80003fc8:	ffffd097          	auipc	ra,0xffffd
    80003fcc:	7fc080e7          	jalr	2044(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80003fd0:	01813083          	ld	ra,24(sp)
    80003fd4:	01013403          	ld	s0,16(sp)
    80003fd8:	00813483          	ld	s1,8(sp)
    80003fdc:	00013903          	ld	s2,0(sp)
    80003fe0:	02010113          	addi	sp,sp,32
    80003fe4:	00008067          	ret

0000000080003fe8 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003fe8:	fe010113          	addi	sp,sp,-32
    80003fec:	00113c23          	sd	ra,24(sp)
    80003ff0:	00813823          	sd	s0,16(sp)
    80003ff4:	00913423          	sd	s1,8(sp)
    80003ff8:	01213023          	sd	s2,0(sp)
    80003ffc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004000:	00000493          	li	s1,0
    80004004:	0400006f          	j	80004044 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004008:	00004517          	auipc	a0,0x4
    8000400c:	24050513          	addi	a0,a0,576 # 80008248 <CONSOLE_STATUS+0x238>
    80004010:	00001097          	auipc	ra,0x1
    80004014:	c80080e7          	jalr	-896(ra) # 80004c90 <_Z11printStringPKc>
    80004018:	00000613          	li	a2,0
    8000401c:	00a00593          	li	a1,10
    80004020:	00048513          	mv	a0,s1
    80004024:	00001097          	auipc	ra,0x1
    80004028:	e1c080e7          	jalr	-484(ra) # 80004e40 <_Z8printIntiii>
    8000402c:	00004517          	auipc	a0,0x4
    80004030:	46c50513          	addi	a0,a0,1132 # 80008498 <CONSOLE_STATUS+0x488>
    80004034:	00001097          	auipc	ra,0x1
    80004038:	c5c080e7          	jalr	-932(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000403c:	0014849b          	addiw	s1,s1,1
    80004040:	0ff4f493          	andi	s1,s1,255
    80004044:	00200793          	li	a5,2
    80004048:	fc97f0e3          	bgeu	a5,s1,80004008 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    8000404c:	00004517          	auipc	a0,0x4
    80004050:	20450513          	addi	a0,a0,516 # 80008250 <CONSOLE_STATUS+0x240>
    80004054:	00001097          	auipc	ra,0x1
    80004058:	c3c080e7          	jalr	-964(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000405c:	00700313          	li	t1,7
    thread_dispatch();
    80004060:	ffffd097          	auipc	ra,0xffffd
    80004064:	764080e7          	jalr	1892(ra) # 800017c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004068:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000406c:	00004517          	auipc	a0,0x4
    80004070:	1f450513          	addi	a0,a0,500 # 80008260 <CONSOLE_STATUS+0x250>
    80004074:	00001097          	auipc	ra,0x1
    80004078:	c1c080e7          	jalr	-996(ra) # 80004c90 <_Z11printStringPKc>
    8000407c:	00000613          	li	a2,0
    80004080:	00a00593          	li	a1,10
    80004084:	0009051b          	sext.w	a0,s2
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	db8080e7          	jalr	-584(ra) # 80004e40 <_Z8printIntiii>
    80004090:	00004517          	auipc	a0,0x4
    80004094:	40850513          	addi	a0,a0,1032 # 80008498 <CONSOLE_STATUS+0x488>
    80004098:	00001097          	auipc	ra,0x1
    8000409c:	bf8080e7          	jalr	-1032(ra) # 80004c90 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800040a0:	00c00513          	li	a0,12
    800040a4:	00000097          	auipc	ra,0x0
    800040a8:	d88080e7          	jalr	-632(ra) # 80003e2c <_ZL9fibonaccim>
    800040ac:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800040b0:	00004517          	auipc	a0,0x4
    800040b4:	1b850513          	addi	a0,a0,440 # 80008268 <CONSOLE_STATUS+0x258>
    800040b8:	00001097          	auipc	ra,0x1
    800040bc:	bd8080e7          	jalr	-1064(ra) # 80004c90 <_Z11printStringPKc>
    800040c0:	00000613          	li	a2,0
    800040c4:	00a00593          	li	a1,10
    800040c8:	0009051b          	sext.w	a0,s2
    800040cc:	00001097          	auipc	ra,0x1
    800040d0:	d74080e7          	jalr	-652(ra) # 80004e40 <_Z8printIntiii>
    800040d4:	00004517          	auipc	a0,0x4
    800040d8:	3c450513          	addi	a0,a0,964 # 80008498 <CONSOLE_STATUS+0x488>
    800040dc:	00001097          	auipc	ra,0x1
    800040e0:	bb4080e7          	jalr	-1100(ra) # 80004c90 <_Z11printStringPKc>
    800040e4:	0400006f          	j	80004124 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800040e8:	00004517          	auipc	a0,0x4
    800040ec:	16050513          	addi	a0,a0,352 # 80008248 <CONSOLE_STATUS+0x238>
    800040f0:	00001097          	auipc	ra,0x1
    800040f4:	ba0080e7          	jalr	-1120(ra) # 80004c90 <_Z11printStringPKc>
    800040f8:	00000613          	li	a2,0
    800040fc:	00a00593          	li	a1,10
    80004100:	00048513          	mv	a0,s1
    80004104:	00001097          	auipc	ra,0x1
    80004108:	d3c080e7          	jalr	-708(ra) # 80004e40 <_Z8printIntiii>
    8000410c:	00004517          	auipc	a0,0x4
    80004110:	38c50513          	addi	a0,a0,908 # 80008498 <CONSOLE_STATUS+0x488>
    80004114:	00001097          	auipc	ra,0x1
    80004118:	b7c080e7          	jalr	-1156(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000411c:	0014849b          	addiw	s1,s1,1
    80004120:	0ff4f493          	andi	s1,s1,255
    80004124:	00500793          	li	a5,5
    80004128:	fc97f0e3          	bgeu	a5,s1,800040e8 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000412c:	00004517          	auipc	a0,0x4
    80004130:	0f450513          	addi	a0,a0,244 # 80008220 <CONSOLE_STATUS+0x210>
    80004134:	00001097          	auipc	ra,0x1
    80004138:	b5c080e7          	jalr	-1188(ra) # 80004c90 <_Z11printStringPKc>
    finishedC = true;
    8000413c:	00100793          	li	a5,1
    80004140:	00006717          	auipc	a4,0x6
    80004144:	38f708a3          	sb	a5,913(a4) # 8000a4d1 <_ZL9finishedC>
    thread_dispatch();
    80004148:	ffffd097          	auipc	ra,0xffffd
    8000414c:	67c080e7          	jalr	1660(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80004150:	01813083          	ld	ra,24(sp)
    80004154:	01013403          	ld	s0,16(sp)
    80004158:	00813483          	ld	s1,8(sp)
    8000415c:	00013903          	ld	s2,0(sp)
    80004160:	02010113          	addi	sp,sp,32
    80004164:	00008067          	ret

0000000080004168 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004168:	fe010113          	addi	sp,sp,-32
    8000416c:	00113c23          	sd	ra,24(sp)
    80004170:	00813823          	sd	s0,16(sp)
    80004174:	00913423          	sd	s1,8(sp)
    80004178:	01213023          	sd	s2,0(sp)
    8000417c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004180:	00000913          	li	s2,0
    80004184:	0380006f          	j	800041bc <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004188:	ffffd097          	auipc	ra,0xffffd
    8000418c:	63c080e7          	jalr	1596(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004190:	00148493          	addi	s1,s1,1
    80004194:	000027b7          	lui	a5,0x2
    80004198:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000419c:	0097ee63          	bltu	a5,s1,800041b8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800041a0:	00000713          	li	a4,0
    800041a4:	000077b7          	lui	a5,0x7
    800041a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800041ac:	fce7eee3          	bltu	a5,a4,80004188 <_ZL11workerBodyBPv+0x20>
    800041b0:	00170713          	addi	a4,a4,1
    800041b4:	ff1ff06f          	j	800041a4 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800041b8:	00190913          	addi	s2,s2,1
    800041bc:	00f00793          	li	a5,15
    800041c0:	0527e063          	bltu	a5,s2,80004200 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800041c4:	00004517          	auipc	a0,0x4
    800041c8:	06c50513          	addi	a0,a0,108 # 80008230 <CONSOLE_STATUS+0x220>
    800041cc:	00001097          	auipc	ra,0x1
    800041d0:	ac4080e7          	jalr	-1340(ra) # 80004c90 <_Z11printStringPKc>
    800041d4:	00000613          	li	a2,0
    800041d8:	00a00593          	li	a1,10
    800041dc:	0009051b          	sext.w	a0,s2
    800041e0:	00001097          	auipc	ra,0x1
    800041e4:	c60080e7          	jalr	-928(ra) # 80004e40 <_Z8printIntiii>
    800041e8:	00004517          	auipc	a0,0x4
    800041ec:	2b050513          	addi	a0,a0,688 # 80008498 <CONSOLE_STATUS+0x488>
    800041f0:	00001097          	auipc	ra,0x1
    800041f4:	aa0080e7          	jalr	-1376(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800041f8:	00000493          	li	s1,0
    800041fc:	f99ff06f          	j	80004194 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004200:	00004517          	auipc	a0,0x4
    80004204:	03850513          	addi	a0,a0,56 # 80008238 <CONSOLE_STATUS+0x228>
    80004208:	00001097          	auipc	ra,0x1
    8000420c:	a88080e7          	jalr	-1400(ra) # 80004c90 <_Z11printStringPKc>
    finishedB = true;
    80004210:	00100793          	li	a5,1
    80004214:	00006717          	auipc	a4,0x6
    80004218:	2af70f23          	sb	a5,702(a4) # 8000a4d2 <_ZL9finishedB>
    thread_dispatch();
    8000421c:	ffffd097          	auipc	ra,0xffffd
    80004220:	5a8080e7          	jalr	1448(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80004224:	01813083          	ld	ra,24(sp)
    80004228:	01013403          	ld	s0,16(sp)
    8000422c:	00813483          	ld	s1,8(sp)
    80004230:	00013903          	ld	s2,0(sp)
    80004234:	02010113          	addi	sp,sp,32
    80004238:	00008067          	ret

000000008000423c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000423c:	fe010113          	addi	sp,sp,-32
    80004240:	00113c23          	sd	ra,24(sp)
    80004244:	00813823          	sd	s0,16(sp)
    80004248:	00913423          	sd	s1,8(sp)
    8000424c:	01213023          	sd	s2,0(sp)
    80004250:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004254:	00000913          	li	s2,0
    80004258:	0380006f          	j	80004290 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000425c:	ffffd097          	auipc	ra,0xffffd
    80004260:	568080e7          	jalr	1384(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004264:	00148493          	addi	s1,s1,1
    80004268:	000027b7          	lui	a5,0x2
    8000426c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004270:	0097ee63          	bltu	a5,s1,8000428c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004274:	00000713          	li	a4,0
    80004278:	000077b7          	lui	a5,0x7
    8000427c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004280:	fce7eee3          	bltu	a5,a4,8000425c <_ZL11workerBodyAPv+0x20>
    80004284:	00170713          	addi	a4,a4,1
    80004288:	ff1ff06f          	j	80004278 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000428c:	00190913          	addi	s2,s2,1
    80004290:	00900793          	li	a5,9
    80004294:	0527e063          	bltu	a5,s2,800042d4 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004298:	00004517          	auipc	a0,0x4
    8000429c:	f8050513          	addi	a0,a0,-128 # 80008218 <CONSOLE_STATUS+0x208>
    800042a0:	00001097          	auipc	ra,0x1
    800042a4:	9f0080e7          	jalr	-1552(ra) # 80004c90 <_Z11printStringPKc>
    800042a8:	00000613          	li	a2,0
    800042ac:	00a00593          	li	a1,10
    800042b0:	0009051b          	sext.w	a0,s2
    800042b4:	00001097          	auipc	ra,0x1
    800042b8:	b8c080e7          	jalr	-1140(ra) # 80004e40 <_Z8printIntiii>
    800042bc:	00004517          	auipc	a0,0x4
    800042c0:	1dc50513          	addi	a0,a0,476 # 80008498 <CONSOLE_STATUS+0x488>
    800042c4:	00001097          	auipc	ra,0x1
    800042c8:	9cc080e7          	jalr	-1588(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800042cc:	00000493          	li	s1,0
    800042d0:	f99ff06f          	j	80004268 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800042d4:	00004517          	auipc	a0,0x4
    800042d8:	f4c50513          	addi	a0,a0,-180 # 80008220 <CONSOLE_STATUS+0x210>
    800042dc:	00001097          	auipc	ra,0x1
    800042e0:	9b4080e7          	jalr	-1612(ra) # 80004c90 <_Z11printStringPKc>
    finishedA = true;
    800042e4:	00100793          	li	a5,1
    800042e8:	00006717          	auipc	a4,0x6
    800042ec:	1ef705a3          	sb	a5,491(a4) # 8000a4d3 <_ZL9finishedA>
}
    800042f0:	01813083          	ld	ra,24(sp)
    800042f4:	01013403          	ld	s0,16(sp)
    800042f8:	00813483          	ld	s1,8(sp)
    800042fc:	00013903          	ld	s2,0(sp)
    80004300:	02010113          	addi	sp,sp,32
    80004304:	00008067          	ret

0000000080004308 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004308:	fd010113          	addi	sp,sp,-48
    8000430c:	02113423          	sd	ra,40(sp)
    80004310:	02813023          	sd	s0,32(sp)
    80004314:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004318:	00000613          	li	a2,0
    8000431c:	00000597          	auipc	a1,0x0
    80004320:	f2058593          	addi	a1,a1,-224 # 8000423c <_ZL11workerBodyAPv>
    80004324:	fd040513          	addi	a0,s0,-48
    80004328:	ffffd097          	auipc	ra,0xffffd
    8000432c:	37c080e7          	jalr	892(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004330:	00004517          	auipc	a0,0x4
    80004334:	f8050513          	addi	a0,a0,-128 # 800082b0 <CONSOLE_STATUS+0x2a0>
    80004338:	00001097          	auipc	ra,0x1
    8000433c:	958080e7          	jalr	-1704(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004340:	00000613          	li	a2,0
    80004344:	00000597          	auipc	a1,0x0
    80004348:	e2458593          	addi	a1,a1,-476 # 80004168 <_ZL11workerBodyBPv>
    8000434c:	fd840513          	addi	a0,s0,-40
    80004350:	ffffd097          	auipc	ra,0xffffd
    80004354:	354080e7          	jalr	852(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004358:	00004517          	auipc	a0,0x4
    8000435c:	f7050513          	addi	a0,a0,-144 # 800082c8 <CONSOLE_STATUS+0x2b8>
    80004360:	00001097          	auipc	ra,0x1
    80004364:	930080e7          	jalr	-1744(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004368:	00000613          	li	a2,0
    8000436c:	00000597          	auipc	a1,0x0
    80004370:	c7c58593          	addi	a1,a1,-900 # 80003fe8 <_ZL11workerBodyCPv>
    80004374:	fe040513          	addi	a0,s0,-32
    80004378:	ffffd097          	auipc	ra,0xffffd
    8000437c:	32c080e7          	jalr	812(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004380:	00004517          	auipc	a0,0x4
    80004384:	f6050513          	addi	a0,a0,-160 # 800082e0 <CONSOLE_STATUS+0x2d0>
    80004388:	00001097          	auipc	ra,0x1
    8000438c:	908080e7          	jalr	-1784(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004390:	00000613          	li	a2,0
    80004394:	00000597          	auipc	a1,0x0
    80004398:	b0c58593          	addi	a1,a1,-1268 # 80003ea0 <_ZL11workerBodyDPv>
    8000439c:	fe840513          	addi	a0,s0,-24
    800043a0:	ffffd097          	auipc	ra,0xffffd
    800043a4:	304080e7          	jalr	772(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800043a8:	00004517          	auipc	a0,0x4
    800043ac:	f5050513          	addi	a0,a0,-176 # 800082f8 <CONSOLE_STATUS+0x2e8>
    800043b0:	00001097          	auipc	ra,0x1
    800043b4:	8e0080e7          	jalr	-1824(ra) # 80004c90 <_Z11printStringPKc>
    800043b8:	00c0006f          	j	800043c4 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800043bc:	ffffd097          	auipc	ra,0xffffd
    800043c0:	408080e7          	jalr	1032(ra) # 800017c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800043c4:	00006797          	auipc	a5,0x6
    800043c8:	10f7c783          	lbu	a5,271(a5) # 8000a4d3 <_ZL9finishedA>
    800043cc:	fe0788e3          	beqz	a5,800043bc <_Z18Threads_C_API_testv+0xb4>
    800043d0:	00006797          	auipc	a5,0x6
    800043d4:	1027c783          	lbu	a5,258(a5) # 8000a4d2 <_ZL9finishedB>
    800043d8:	fe0782e3          	beqz	a5,800043bc <_Z18Threads_C_API_testv+0xb4>
    800043dc:	00006797          	auipc	a5,0x6
    800043e0:	0f57c783          	lbu	a5,245(a5) # 8000a4d1 <_ZL9finishedC>
    800043e4:	fc078ce3          	beqz	a5,800043bc <_Z18Threads_C_API_testv+0xb4>
    800043e8:	00006797          	auipc	a5,0x6
    800043ec:	0e87c783          	lbu	a5,232(a5) # 8000a4d0 <_ZL9finishedD>
    800043f0:	fc0786e3          	beqz	a5,800043bc <_Z18Threads_C_API_testv+0xb4>
    }

}
    800043f4:	02813083          	ld	ra,40(sp)
    800043f8:	02013403          	ld	s0,32(sp)
    800043fc:	03010113          	addi	sp,sp,48
    80004400:	00008067          	ret

0000000080004404 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004404:	fd010113          	addi	sp,sp,-48
    80004408:	02113423          	sd	ra,40(sp)
    8000440c:	02813023          	sd	s0,32(sp)
    80004410:	00913c23          	sd	s1,24(sp)
    80004414:	01213823          	sd	s2,16(sp)
    80004418:	01313423          	sd	s3,8(sp)
    8000441c:	03010413          	addi	s0,sp,48
    80004420:	00050993          	mv	s3,a0
    80004424:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004428:	00000913          	li	s2,0
    8000442c:	00c0006f          	j	80004438 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004430:	ffffe097          	auipc	ra,0xffffe
    80004434:	a0c080e7          	jalr	-1524(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004438:	ffffd097          	auipc	ra,0xffffd
    8000443c:	480080e7          	jalr	1152(ra) # 800018b8 <_Z4getcv>
    80004440:	0005059b          	sext.w	a1,a0
    80004444:	01b00793          	li	a5,27
    80004448:	02f58a63          	beq	a1,a5,8000447c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    8000444c:	0084b503          	ld	a0,8(s1)
    80004450:	00001097          	auipc	ra,0x1
    80004454:	c64080e7          	jalr	-924(ra) # 800050b4 <_ZN9BufferCPP3putEi>
        i++;
    80004458:	0019071b          	addiw	a4,s2,1
    8000445c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004460:	0004a683          	lw	a3,0(s1)
    80004464:	0026979b          	slliw	a5,a3,0x2
    80004468:	00d787bb          	addw	a5,a5,a3
    8000446c:	0017979b          	slliw	a5,a5,0x1
    80004470:	02f767bb          	remw	a5,a4,a5
    80004474:	fc0792e3          	bnez	a5,80004438 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004478:	fb9ff06f          	j	80004430 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    8000447c:	00100793          	li	a5,1
    80004480:	00006717          	auipc	a4,0x6
    80004484:	04f72c23          	sw	a5,88(a4) # 8000a4d8 <_ZL9threadEnd>
    td->buffer->put('!');
    80004488:	0209b783          	ld	a5,32(s3)
    8000448c:	02100593          	li	a1,33
    80004490:	0087b503          	ld	a0,8(a5)
    80004494:	00001097          	auipc	ra,0x1
    80004498:	c20080e7          	jalr	-992(ra) # 800050b4 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    8000449c:	0104b503          	ld	a0,16(s1)
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	a88080e7          	jalr	-1400(ra) # 80001f28 <_ZN9Semaphore6signalEv>
}
    800044a8:	02813083          	ld	ra,40(sp)
    800044ac:	02013403          	ld	s0,32(sp)
    800044b0:	01813483          	ld	s1,24(sp)
    800044b4:	01013903          	ld	s2,16(sp)
    800044b8:	00813983          	ld	s3,8(sp)
    800044bc:	03010113          	addi	sp,sp,48
    800044c0:	00008067          	ret

00000000800044c4 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800044c4:	fe010113          	addi	sp,sp,-32
    800044c8:	00113c23          	sd	ra,24(sp)
    800044cc:	00813823          	sd	s0,16(sp)
    800044d0:	00913423          	sd	s1,8(sp)
    800044d4:	01213023          	sd	s2,0(sp)
    800044d8:	02010413          	addi	s0,sp,32
    800044dc:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800044e0:	00000913          	li	s2,0
    800044e4:	00c0006f          	j	800044f0 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	954080e7          	jalr	-1708(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800044f0:	00006797          	auipc	a5,0x6
    800044f4:	fe87a783          	lw	a5,-24(a5) # 8000a4d8 <_ZL9threadEnd>
    800044f8:	02079e63          	bnez	a5,80004534 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800044fc:	0004a583          	lw	a1,0(s1)
    80004500:	0305859b          	addiw	a1,a1,48
    80004504:	0084b503          	ld	a0,8(s1)
    80004508:	00001097          	auipc	ra,0x1
    8000450c:	bac080e7          	jalr	-1108(ra) # 800050b4 <_ZN9BufferCPP3putEi>
        i++;
    80004510:	0019071b          	addiw	a4,s2,1
    80004514:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004518:	0004a683          	lw	a3,0(s1)
    8000451c:	0026979b          	slliw	a5,a3,0x2
    80004520:	00d787bb          	addw	a5,a5,a3
    80004524:	0017979b          	slliw	a5,a5,0x1
    80004528:	02f767bb          	remw	a5,a4,a5
    8000452c:	fc0792e3          	bnez	a5,800044f0 <_ZN12ProducerSync8producerEPv+0x2c>
    80004530:	fb9ff06f          	j	800044e8 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004534:	0104b503          	ld	a0,16(s1)
    80004538:	ffffe097          	auipc	ra,0xffffe
    8000453c:	9f0080e7          	jalr	-1552(ra) # 80001f28 <_ZN9Semaphore6signalEv>
}
    80004540:	01813083          	ld	ra,24(sp)
    80004544:	01013403          	ld	s0,16(sp)
    80004548:	00813483          	ld	s1,8(sp)
    8000454c:	00013903          	ld	s2,0(sp)
    80004550:	02010113          	addi	sp,sp,32
    80004554:	00008067          	ret

0000000080004558 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004558:	fd010113          	addi	sp,sp,-48
    8000455c:	02113423          	sd	ra,40(sp)
    80004560:	02813023          	sd	s0,32(sp)
    80004564:	00913c23          	sd	s1,24(sp)
    80004568:	01213823          	sd	s2,16(sp)
    8000456c:	01313423          	sd	s3,8(sp)
    80004570:	01413023          	sd	s4,0(sp)
    80004574:	03010413          	addi	s0,sp,48
    80004578:	00050993          	mv	s3,a0
    8000457c:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004580:	00000a13          	li	s4,0
    80004584:	01c0006f          	j	800045a0 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004588:	ffffe097          	auipc	ra,0xffffe
    8000458c:	8b4080e7          	jalr	-1868(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    80004590:	0500006f          	j	800045e0 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004594:	00a00513          	li	a0,10
    80004598:	ffffd097          	auipc	ra,0xffffd
    8000459c:	348080e7          	jalr	840(ra) # 800018e0 <_Z4putcc>
    while (!threadEnd) {
    800045a0:	00006797          	auipc	a5,0x6
    800045a4:	f387a783          	lw	a5,-200(a5) # 8000a4d8 <_ZL9threadEnd>
    800045a8:	06079263          	bnez	a5,8000460c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800045ac:	00893503          	ld	a0,8(s2)
    800045b0:	00001097          	auipc	ra,0x1
    800045b4:	b94080e7          	jalr	-1132(ra) # 80005144 <_ZN9BufferCPP3getEv>
        i++;
    800045b8:	001a049b          	addiw	s1,s4,1
    800045bc:	00048a1b          	sext.w	s4,s1
        putc(key);
    800045c0:	0ff57513          	andi	a0,a0,255
    800045c4:	ffffd097          	auipc	ra,0xffffd
    800045c8:	31c080e7          	jalr	796(ra) # 800018e0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800045cc:	00092703          	lw	a4,0(s2)
    800045d0:	0027179b          	slliw	a5,a4,0x2
    800045d4:	00e787bb          	addw	a5,a5,a4
    800045d8:	02f4e7bb          	remw	a5,s1,a5
    800045dc:	fa0786e3          	beqz	a5,80004588 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800045e0:	05000793          	li	a5,80
    800045e4:	02f4e4bb          	remw	s1,s1,a5
    800045e8:	fa049ce3          	bnez	s1,800045a0 <_ZN12ConsumerSync8consumerEPv+0x48>
    800045ec:	fa9ff06f          	j	80004594 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800045f0:	0209b783          	ld	a5,32(s3)
    800045f4:	0087b503          	ld	a0,8(a5)
    800045f8:	00001097          	auipc	ra,0x1
    800045fc:	b4c080e7          	jalr	-1204(ra) # 80005144 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004600:	0ff57513          	andi	a0,a0,255
    80004604:	ffffe097          	auipc	ra,0xffffe
    80004608:	9a4080e7          	jalr	-1628(ra) # 80001fa8 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    8000460c:	0209b783          	ld	a5,32(s3)
    80004610:	0087b503          	ld	a0,8(a5)
    80004614:	00001097          	auipc	ra,0x1
    80004618:	bbc080e7          	jalr	-1092(ra) # 800051d0 <_ZN9BufferCPP6getCntEv>
    8000461c:	fca04ae3          	bgtz	a0,800045f0 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004620:	01093503          	ld	a0,16(s2)
    80004624:	ffffe097          	auipc	ra,0xffffe
    80004628:	904080e7          	jalr	-1788(ra) # 80001f28 <_ZN9Semaphore6signalEv>
}
    8000462c:	02813083          	ld	ra,40(sp)
    80004630:	02013403          	ld	s0,32(sp)
    80004634:	01813483          	ld	s1,24(sp)
    80004638:	01013903          	ld	s2,16(sp)
    8000463c:	00813983          	ld	s3,8(sp)
    80004640:	00013a03          	ld	s4,0(sp)
    80004644:	03010113          	addi	sp,sp,48
    80004648:	00008067          	ret

000000008000464c <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    8000464c:	f8010113          	addi	sp,sp,-128
    80004650:	06113c23          	sd	ra,120(sp)
    80004654:	06813823          	sd	s0,112(sp)
    80004658:	06913423          	sd	s1,104(sp)
    8000465c:	07213023          	sd	s2,96(sp)
    80004660:	05313c23          	sd	s3,88(sp)
    80004664:	05413823          	sd	s4,80(sp)
    80004668:	05513423          	sd	s5,72(sp)
    8000466c:	05613023          	sd	s6,64(sp)
    80004670:	03713c23          	sd	s7,56(sp)
    80004674:	03813823          	sd	s8,48(sp)
    80004678:	03913423          	sd	s9,40(sp)
    8000467c:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004680:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004684:	00004517          	auipc	a0,0x4
    80004688:	aac50513          	addi	a0,a0,-1364 # 80008130 <CONSOLE_STATUS+0x120>
    8000468c:	00000097          	auipc	ra,0x0
    80004690:	604080e7          	jalr	1540(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    80004694:	01e00593          	li	a1,30
    80004698:	f8040493          	addi	s1,s0,-128
    8000469c:	00048513          	mv	a0,s1
    800046a0:	00000097          	auipc	ra,0x0
    800046a4:	678080e7          	jalr	1656(ra) # 80004d18 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800046a8:	00048513          	mv	a0,s1
    800046ac:	00000097          	auipc	ra,0x0
    800046b0:	744080e7          	jalr	1860(ra) # 80004df0 <_Z11stringToIntPKc>
    800046b4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800046b8:	00004517          	auipc	a0,0x4
    800046bc:	a9850513          	addi	a0,a0,-1384 # 80008150 <CONSOLE_STATUS+0x140>
    800046c0:	00000097          	auipc	ra,0x0
    800046c4:	5d0080e7          	jalr	1488(ra) # 80004c90 <_Z11printStringPKc>
    getString(input, 30);
    800046c8:	01e00593          	li	a1,30
    800046cc:	00048513          	mv	a0,s1
    800046d0:	00000097          	auipc	ra,0x0
    800046d4:	648080e7          	jalr	1608(ra) # 80004d18 <_Z9getStringPci>
    n = stringToInt(input);
    800046d8:	00048513          	mv	a0,s1
    800046dc:	00000097          	auipc	ra,0x0
    800046e0:	714080e7          	jalr	1812(ra) # 80004df0 <_Z11stringToIntPKc>
    800046e4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800046e8:	00004517          	auipc	a0,0x4
    800046ec:	a8850513          	addi	a0,a0,-1400 # 80008170 <CONSOLE_STATUS+0x160>
    800046f0:	00000097          	auipc	ra,0x0
    800046f4:	5a0080e7          	jalr	1440(ra) # 80004c90 <_Z11printStringPKc>
    800046f8:	00000613          	li	a2,0
    800046fc:	00a00593          	li	a1,10
    80004700:	00090513          	mv	a0,s2
    80004704:	00000097          	auipc	ra,0x0
    80004708:	73c080e7          	jalr	1852(ra) # 80004e40 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000470c:	00004517          	auipc	a0,0x4
    80004710:	a7c50513          	addi	a0,a0,-1412 # 80008188 <CONSOLE_STATUS+0x178>
    80004714:	00000097          	auipc	ra,0x0
    80004718:	57c080e7          	jalr	1404(ra) # 80004c90 <_Z11printStringPKc>
    8000471c:	00000613          	li	a2,0
    80004720:	00a00593          	li	a1,10
    80004724:	00048513          	mv	a0,s1
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	718080e7          	jalr	1816(ra) # 80004e40 <_Z8printIntiii>
    printString(".\n");
    80004730:	00004517          	auipc	a0,0x4
    80004734:	a7050513          	addi	a0,a0,-1424 # 800081a0 <CONSOLE_STATUS+0x190>
    80004738:	00000097          	auipc	ra,0x0
    8000473c:	558080e7          	jalr	1368(ra) # 80004c90 <_Z11printStringPKc>
    if(threadNum > n) {
    80004740:	0324c463          	blt	s1,s2,80004768 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004744:	03205c63          	blez	s2,8000477c <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004748:	03800513          	li	a0,56
    8000474c:	ffffd097          	auipc	ra,0xffffd
    80004750:	25c080e7          	jalr	604(ra) # 800019a8 <_Znwm>
    80004754:	00050a93          	mv	s5,a0
    80004758:	00048593          	mv	a1,s1
    8000475c:	00001097          	auipc	ra,0x1
    80004760:	804080e7          	jalr	-2044(ra) # 80004f60 <_ZN9BufferCPPC1Ei>
    80004764:	0300006f          	j	80004794 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004768:	00004517          	auipc	a0,0x4
    8000476c:	a4050513          	addi	a0,a0,-1472 # 800081a8 <CONSOLE_STATUS+0x198>
    80004770:	00000097          	auipc	ra,0x0
    80004774:	520080e7          	jalr	1312(ra) # 80004c90 <_Z11printStringPKc>
        return;
    80004778:	0140006f          	j	8000478c <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000477c:	00004517          	auipc	a0,0x4
    80004780:	a6c50513          	addi	a0,a0,-1428 # 800081e8 <CONSOLE_STATUS+0x1d8>
    80004784:	00000097          	auipc	ra,0x0
    80004788:	50c080e7          	jalr	1292(ra) # 80004c90 <_Z11printStringPKc>
        return;
    8000478c:	000b8113          	mv	sp,s7
    80004790:	2380006f          	j	800049c8 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004794:	01000513          	li	a0,16
    80004798:	ffffd097          	auipc	ra,0xffffd
    8000479c:	210080e7          	jalr	528(ra) # 800019a8 <_Znwm>
    800047a0:	00050493          	mv	s1,a0
    800047a4:	00000593          	li	a1,0
    800047a8:	ffffd097          	auipc	ra,0xffffd
    800047ac:	71c080e7          	jalr	1820(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    800047b0:	00006797          	auipc	a5,0x6
    800047b4:	d297b823          	sd	s1,-720(a5) # 8000a4e0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    800047b8:	00391793          	slli	a5,s2,0x3
    800047bc:	00f78793          	addi	a5,a5,15
    800047c0:	ff07f793          	andi	a5,a5,-16
    800047c4:	40f10133          	sub	sp,sp,a5
    800047c8:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800047cc:	0019071b          	addiw	a4,s2,1
    800047d0:	00171793          	slli	a5,a4,0x1
    800047d4:	00e787b3          	add	a5,a5,a4
    800047d8:	00379793          	slli	a5,a5,0x3
    800047dc:	00f78793          	addi	a5,a5,15
    800047e0:	ff07f793          	andi	a5,a5,-16
    800047e4:	40f10133          	sub	sp,sp,a5
    800047e8:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800047ec:	00191c13          	slli	s8,s2,0x1
    800047f0:	012c07b3          	add	a5,s8,s2
    800047f4:	00379793          	slli	a5,a5,0x3
    800047f8:	00fa07b3          	add	a5,s4,a5
    800047fc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004800:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004804:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004808:	02800513          	li	a0,40
    8000480c:	ffffd097          	auipc	ra,0xffffd
    80004810:	19c080e7          	jalr	412(ra) # 800019a8 <_Znwm>
    80004814:	00050b13          	mv	s6,a0
    80004818:	012c0c33          	add	s8,s8,s2
    8000481c:	003c1c13          	slli	s8,s8,0x3
    80004820:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004824:	ffffd097          	auipc	ra,0xffffd
    80004828:	65c080e7          	jalr	1628(ra) # 80001e80 <_ZN6ThreadC1Ev>
    8000482c:	00006797          	auipc	a5,0x6
    80004830:	b6c78793          	addi	a5,a5,-1172 # 8000a398 <_ZTV12ConsumerSync+0x10>
    80004834:	00fb3023          	sd	a5,0(s6)
    80004838:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    8000483c:	000b0513          	mv	a0,s6
    80004840:	ffffd097          	auipc	ra,0xffffd
    80004844:	5cc080e7          	jalr	1484(ra) # 80001e0c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004848:	00000493          	li	s1,0
    8000484c:	0380006f          	j	80004884 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004850:	00006797          	auipc	a5,0x6
    80004854:	b2078793          	addi	a5,a5,-1248 # 8000a370 <_ZTV12ProducerSync+0x10>
    80004858:	00fcb023          	sd	a5,0(s9)
    8000485c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80004860:	00349793          	slli	a5,s1,0x3
    80004864:	00f987b3          	add	a5,s3,a5
    80004868:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    8000486c:	00349793          	slli	a5,s1,0x3
    80004870:	00f987b3          	add	a5,s3,a5
    80004874:	0007b503          	ld	a0,0(a5)
    80004878:	ffffd097          	auipc	ra,0xffffd
    8000487c:	594080e7          	jalr	1428(ra) # 80001e0c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004880:	0014849b          	addiw	s1,s1,1
    80004884:	0b24d063          	bge	s1,s2,80004924 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004888:	00149793          	slli	a5,s1,0x1
    8000488c:	009787b3          	add	a5,a5,s1
    80004890:	00379793          	slli	a5,a5,0x3
    80004894:	00fa07b3          	add	a5,s4,a5
    80004898:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000489c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800048a0:	00006717          	auipc	a4,0x6
    800048a4:	c4073703          	ld	a4,-960(a4) # 8000a4e0 <_ZL10waitForAll>
    800048a8:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800048ac:	02905863          	blez	s1,800048dc <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800048b0:	02800513          	li	a0,40
    800048b4:	ffffd097          	auipc	ra,0xffffd
    800048b8:	0f4080e7          	jalr	244(ra) # 800019a8 <_Znwm>
    800048bc:	00050c93          	mv	s9,a0
    800048c0:	00149c13          	slli	s8,s1,0x1
    800048c4:	009c0c33          	add	s8,s8,s1
    800048c8:	003c1c13          	slli	s8,s8,0x3
    800048cc:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	5b0080e7          	jalr	1456(ra) # 80001e80 <_ZN6ThreadC1Ev>
    800048d8:	f79ff06f          	j	80004850 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800048dc:	02800513          	li	a0,40
    800048e0:	ffffd097          	auipc	ra,0xffffd
    800048e4:	0c8080e7          	jalr	200(ra) # 800019a8 <_Znwm>
    800048e8:	00050c93          	mv	s9,a0
    800048ec:	00149c13          	slli	s8,s1,0x1
    800048f0:	009c0c33          	add	s8,s8,s1
    800048f4:	003c1c13          	slli	s8,s8,0x3
    800048f8:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800048fc:	ffffd097          	auipc	ra,0xffffd
    80004900:	584080e7          	jalr	1412(ra) # 80001e80 <_ZN6ThreadC1Ev>
    80004904:	00006797          	auipc	a5,0x6
    80004908:	a4478793          	addi	a5,a5,-1468 # 8000a348 <_ZTV16ProducerKeyboard+0x10>
    8000490c:	00fcb023          	sd	a5,0(s9)
    80004910:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004914:	00349793          	slli	a5,s1,0x3
    80004918:	00f987b3          	add	a5,s3,a5
    8000491c:	0197b023          	sd	s9,0(a5)
    80004920:	f4dff06f          	j	8000486c <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004924:	ffffd097          	auipc	ra,0xffffd
    80004928:	518080e7          	jalr	1304(ra) # 80001e3c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000492c:	00000493          	li	s1,0
    80004930:	00994e63          	blt	s2,s1,8000494c <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004934:	00006517          	auipc	a0,0x6
    80004938:	bac53503          	ld	a0,-1108(a0) # 8000a4e0 <_ZL10waitForAll>
    8000493c:	ffffd097          	auipc	ra,0xffffd
    80004940:	5c0080e7          	jalr	1472(ra) # 80001efc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004944:	0014849b          	addiw	s1,s1,1
    80004948:	fe9ff06f          	j	80004930 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    8000494c:	00000493          	li	s1,0
    80004950:	0080006f          	j	80004958 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004954:	0014849b          	addiw	s1,s1,1
    80004958:	0324d263          	bge	s1,s2,8000497c <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    8000495c:	00349793          	slli	a5,s1,0x3
    80004960:	00f987b3          	add	a5,s3,a5
    80004964:	0007b503          	ld	a0,0(a5)
    80004968:	fe0506e3          	beqz	a0,80004954 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    8000496c:	00053783          	ld	a5,0(a0)
    80004970:	0087b783          	ld	a5,8(a5)
    80004974:	000780e7          	jalr	a5
    80004978:	fddff06f          	j	80004954 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    8000497c:	000b0a63          	beqz	s6,80004990 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004980:	000b3783          	ld	a5,0(s6)
    80004984:	0087b783          	ld	a5,8(a5)
    80004988:	000b0513          	mv	a0,s6
    8000498c:	000780e7          	jalr	a5
    delete waitForAll;
    80004990:	00006517          	auipc	a0,0x6
    80004994:	b5053503          	ld	a0,-1200(a0) # 8000a4e0 <_ZL10waitForAll>
    80004998:	00050863          	beqz	a0,800049a8 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    8000499c:	00053783          	ld	a5,0(a0)
    800049a0:	0087b783          	ld	a5,8(a5)
    800049a4:	000780e7          	jalr	a5
    delete buffer;
    800049a8:	000a8e63          	beqz	s5,800049c4 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800049ac:	000a8513          	mv	a0,s5
    800049b0:	00001097          	auipc	ra,0x1
    800049b4:	8a8080e7          	jalr	-1880(ra) # 80005258 <_ZN9BufferCPPD1Ev>
    800049b8:	000a8513          	mv	a0,s5
    800049bc:	ffffd097          	auipc	ra,0xffffd
    800049c0:	03c080e7          	jalr	60(ra) # 800019f8 <_ZdlPv>
    800049c4:	000b8113          	mv	sp,s7

}
    800049c8:	f8040113          	addi	sp,s0,-128
    800049cc:	07813083          	ld	ra,120(sp)
    800049d0:	07013403          	ld	s0,112(sp)
    800049d4:	06813483          	ld	s1,104(sp)
    800049d8:	06013903          	ld	s2,96(sp)
    800049dc:	05813983          	ld	s3,88(sp)
    800049e0:	05013a03          	ld	s4,80(sp)
    800049e4:	04813a83          	ld	s5,72(sp)
    800049e8:	04013b03          	ld	s6,64(sp)
    800049ec:	03813b83          	ld	s7,56(sp)
    800049f0:	03013c03          	ld	s8,48(sp)
    800049f4:	02813c83          	ld	s9,40(sp)
    800049f8:	08010113          	addi	sp,sp,128
    800049fc:	00008067          	ret
    80004a00:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004a04:	000a8513          	mv	a0,s5
    80004a08:	ffffd097          	auipc	ra,0xffffd
    80004a0c:	ff0080e7          	jalr	-16(ra) # 800019f8 <_ZdlPv>
    80004a10:	00048513          	mv	a0,s1
    80004a14:	00007097          	auipc	ra,0x7
    80004a18:	bb4080e7          	jalr	-1100(ra) # 8000b5c8 <_Unwind_Resume>
    80004a1c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004a20:	00048513          	mv	a0,s1
    80004a24:	ffffd097          	auipc	ra,0xffffd
    80004a28:	fd4080e7          	jalr	-44(ra) # 800019f8 <_ZdlPv>
    80004a2c:	00090513          	mv	a0,s2
    80004a30:	00007097          	auipc	ra,0x7
    80004a34:	b98080e7          	jalr	-1128(ra) # 8000b5c8 <_Unwind_Resume>
    80004a38:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004a3c:	000b0513          	mv	a0,s6
    80004a40:	ffffd097          	auipc	ra,0xffffd
    80004a44:	fb8080e7          	jalr	-72(ra) # 800019f8 <_ZdlPv>
    80004a48:	00048513          	mv	a0,s1
    80004a4c:	00007097          	auipc	ra,0x7
    80004a50:	b7c080e7          	jalr	-1156(ra) # 8000b5c8 <_Unwind_Resume>
    80004a54:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004a58:	000c8513          	mv	a0,s9
    80004a5c:	ffffd097          	auipc	ra,0xffffd
    80004a60:	f9c080e7          	jalr	-100(ra) # 800019f8 <_ZdlPv>
    80004a64:	00048513          	mv	a0,s1
    80004a68:	00007097          	auipc	ra,0x7
    80004a6c:	b60080e7          	jalr	-1184(ra) # 8000b5c8 <_Unwind_Resume>
    80004a70:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004a74:	000c8513          	mv	a0,s9
    80004a78:	ffffd097          	auipc	ra,0xffffd
    80004a7c:	f80080e7          	jalr	-128(ra) # 800019f8 <_ZdlPv>
    80004a80:	00048513          	mv	a0,s1
    80004a84:	00007097          	auipc	ra,0x7
    80004a88:	b44080e7          	jalr	-1212(ra) # 8000b5c8 <_Unwind_Resume>

0000000080004a8c <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004a8c:	ff010113          	addi	sp,sp,-16
    80004a90:	00113423          	sd	ra,8(sp)
    80004a94:	00813023          	sd	s0,0(sp)
    80004a98:	01010413          	addi	s0,sp,16
    80004a9c:	00006797          	auipc	a5,0x6
    80004aa0:	8fc78793          	addi	a5,a5,-1796 # 8000a398 <_ZTV12ConsumerSync+0x10>
    80004aa4:	00f53023          	sd	a5,0(a0)
    80004aa8:	ffffd097          	auipc	ra,0xffffd
    80004aac:	21c080e7          	jalr	540(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004ab0:	00813083          	ld	ra,8(sp)
    80004ab4:	00013403          	ld	s0,0(sp)
    80004ab8:	01010113          	addi	sp,sp,16
    80004abc:	00008067          	ret

0000000080004ac0 <_ZN12ConsumerSyncD0Ev>:
    80004ac0:	fe010113          	addi	sp,sp,-32
    80004ac4:	00113c23          	sd	ra,24(sp)
    80004ac8:	00813823          	sd	s0,16(sp)
    80004acc:	00913423          	sd	s1,8(sp)
    80004ad0:	02010413          	addi	s0,sp,32
    80004ad4:	00050493          	mv	s1,a0
    80004ad8:	00006797          	auipc	a5,0x6
    80004adc:	8c078793          	addi	a5,a5,-1856 # 8000a398 <_ZTV12ConsumerSync+0x10>
    80004ae0:	00f53023          	sd	a5,0(a0)
    80004ae4:	ffffd097          	auipc	ra,0xffffd
    80004ae8:	1e0080e7          	jalr	480(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004aec:	00048513          	mv	a0,s1
    80004af0:	ffffd097          	auipc	ra,0xffffd
    80004af4:	f08080e7          	jalr	-248(ra) # 800019f8 <_ZdlPv>
    80004af8:	01813083          	ld	ra,24(sp)
    80004afc:	01013403          	ld	s0,16(sp)
    80004b00:	00813483          	ld	s1,8(sp)
    80004b04:	02010113          	addi	sp,sp,32
    80004b08:	00008067          	ret

0000000080004b0c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004b0c:	ff010113          	addi	sp,sp,-16
    80004b10:	00113423          	sd	ra,8(sp)
    80004b14:	00813023          	sd	s0,0(sp)
    80004b18:	01010413          	addi	s0,sp,16
    80004b1c:	00006797          	auipc	a5,0x6
    80004b20:	85478793          	addi	a5,a5,-1964 # 8000a370 <_ZTV12ProducerSync+0x10>
    80004b24:	00f53023          	sd	a5,0(a0)
    80004b28:	ffffd097          	auipc	ra,0xffffd
    80004b2c:	19c080e7          	jalr	412(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004b30:	00813083          	ld	ra,8(sp)
    80004b34:	00013403          	ld	s0,0(sp)
    80004b38:	01010113          	addi	sp,sp,16
    80004b3c:	00008067          	ret

0000000080004b40 <_ZN12ProducerSyncD0Ev>:
    80004b40:	fe010113          	addi	sp,sp,-32
    80004b44:	00113c23          	sd	ra,24(sp)
    80004b48:	00813823          	sd	s0,16(sp)
    80004b4c:	00913423          	sd	s1,8(sp)
    80004b50:	02010413          	addi	s0,sp,32
    80004b54:	00050493          	mv	s1,a0
    80004b58:	00006797          	auipc	a5,0x6
    80004b5c:	81878793          	addi	a5,a5,-2024 # 8000a370 <_ZTV12ProducerSync+0x10>
    80004b60:	00f53023          	sd	a5,0(a0)
    80004b64:	ffffd097          	auipc	ra,0xffffd
    80004b68:	160080e7          	jalr	352(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004b6c:	00048513          	mv	a0,s1
    80004b70:	ffffd097          	auipc	ra,0xffffd
    80004b74:	e88080e7          	jalr	-376(ra) # 800019f8 <_ZdlPv>
    80004b78:	01813083          	ld	ra,24(sp)
    80004b7c:	01013403          	ld	s0,16(sp)
    80004b80:	00813483          	ld	s1,8(sp)
    80004b84:	02010113          	addi	sp,sp,32
    80004b88:	00008067          	ret

0000000080004b8c <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004b8c:	ff010113          	addi	sp,sp,-16
    80004b90:	00113423          	sd	ra,8(sp)
    80004b94:	00813023          	sd	s0,0(sp)
    80004b98:	01010413          	addi	s0,sp,16
    80004b9c:	00005797          	auipc	a5,0x5
    80004ba0:	7ac78793          	addi	a5,a5,1964 # 8000a348 <_ZTV16ProducerKeyboard+0x10>
    80004ba4:	00f53023          	sd	a5,0(a0)
    80004ba8:	ffffd097          	auipc	ra,0xffffd
    80004bac:	11c080e7          	jalr	284(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004bb0:	00813083          	ld	ra,8(sp)
    80004bb4:	00013403          	ld	s0,0(sp)
    80004bb8:	01010113          	addi	sp,sp,16
    80004bbc:	00008067          	ret

0000000080004bc0 <_ZN16ProducerKeyboardD0Ev>:
    80004bc0:	fe010113          	addi	sp,sp,-32
    80004bc4:	00113c23          	sd	ra,24(sp)
    80004bc8:	00813823          	sd	s0,16(sp)
    80004bcc:	00913423          	sd	s1,8(sp)
    80004bd0:	02010413          	addi	s0,sp,32
    80004bd4:	00050493          	mv	s1,a0
    80004bd8:	00005797          	auipc	a5,0x5
    80004bdc:	77078793          	addi	a5,a5,1904 # 8000a348 <_ZTV16ProducerKeyboard+0x10>
    80004be0:	00f53023          	sd	a5,0(a0)
    80004be4:	ffffd097          	auipc	ra,0xffffd
    80004be8:	0e0080e7          	jalr	224(ra) # 80001cc4 <_ZN6ThreadD1Ev>
    80004bec:	00048513          	mv	a0,s1
    80004bf0:	ffffd097          	auipc	ra,0xffffd
    80004bf4:	e08080e7          	jalr	-504(ra) # 800019f8 <_ZdlPv>
    80004bf8:	01813083          	ld	ra,24(sp)
    80004bfc:	01013403          	ld	s0,16(sp)
    80004c00:	00813483          	ld	s1,8(sp)
    80004c04:	02010113          	addi	sp,sp,32
    80004c08:	00008067          	ret

0000000080004c0c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004c0c:	ff010113          	addi	sp,sp,-16
    80004c10:	00113423          	sd	ra,8(sp)
    80004c14:	00813023          	sd	s0,0(sp)
    80004c18:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004c1c:	02053583          	ld	a1,32(a0)
    80004c20:	fffff097          	auipc	ra,0xfffff
    80004c24:	7e4080e7          	jalr	2020(ra) # 80004404 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004c28:	00813083          	ld	ra,8(sp)
    80004c2c:	00013403          	ld	s0,0(sp)
    80004c30:	01010113          	addi	sp,sp,16
    80004c34:	00008067          	ret

0000000080004c38 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004c38:	ff010113          	addi	sp,sp,-16
    80004c3c:	00113423          	sd	ra,8(sp)
    80004c40:	00813023          	sd	s0,0(sp)
    80004c44:	01010413          	addi	s0,sp,16
        producer(td);
    80004c48:	02053583          	ld	a1,32(a0)
    80004c4c:	00000097          	auipc	ra,0x0
    80004c50:	878080e7          	jalr	-1928(ra) # 800044c4 <_ZN12ProducerSync8producerEPv>
    }
    80004c54:	00813083          	ld	ra,8(sp)
    80004c58:	00013403          	ld	s0,0(sp)
    80004c5c:	01010113          	addi	sp,sp,16
    80004c60:	00008067          	ret

0000000080004c64 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80004c64:	ff010113          	addi	sp,sp,-16
    80004c68:	00113423          	sd	ra,8(sp)
    80004c6c:	00813023          	sd	s0,0(sp)
    80004c70:	01010413          	addi	s0,sp,16
        consumer(td);
    80004c74:	02053583          	ld	a1,32(a0)
    80004c78:	00000097          	auipc	ra,0x0
    80004c7c:	8e0080e7          	jalr	-1824(ra) # 80004558 <_ZN12ConsumerSync8consumerEPv>
    }
    80004c80:	00813083          	ld	ra,8(sp)
    80004c84:	00013403          	ld	s0,0(sp)
    80004c88:	01010113          	addi	sp,sp,16
    80004c8c:	00008067          	ret

0000000080004c90 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004c90:	fe010113          	addi	sp,sp,-32
    80004c94:	00113c23          	sd	ra,24(sp)
    80004c98:	00813823          	sd	s0,16(sp)
    80004c9c:	00913423          	sd	s1,8(sp)
    80004ca0:	02010413          	addi	s0,sp,32
    80004ca4:	00050493          	mv	s1,a0
    LOCK();
    80004ca8:	00100613          	li	a2,1
    80004cac:	00000593          	li	a1,0
    80004cb0:	00006517          	auipc	a0,0x6
    80004cb4:	83850513          	addi	a0,a0,-1992 # 8000a4e8 <lockPrint>
    80004cb8:	ffffc097          	auipc	ra,0xffffc
    80004cbc:	6d0080e7          	jalr	1744(ra) # 80001388 <copy_and_swap>
    80004cc0:	00050863          	beqz	a0,80004cd0 <_Z11printStringPKc+0x40>
    80004cc4:	ffffd097          	auipc	ra,0xffffd
    80004cc8:	b00080e7          	jalr	-1280(ra) # 800017c4 <_Z15thread_dispatchv>
    80004ccc:	fddff06f          	j	80004ca8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004cd0:	0004c503          	lbu	a0,0(s1)
    80004cd4:	00050a63          	beqz	a0,80004ce8 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004cd8:	ffffd097          	auipc	ra,0xffffd
    80004cdc:	c08080e7          	jalr	-1016(ra) # 800018e0 <_Z4putcc>
        string++;
    80004ce0:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004ce4:	fedff06f          	j	80004cd0 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004ce8:	00000613          	li	a2,0
    80004cec:	00100593          	li	a1,1
    80004cf0:	00005517          	auipc	a0,0x5
    80004cf4:	7f850513          	addi	a0,a0,2040 # 8000a4e8 <lockPrint>
    80004cf8:	ffffc097          	auipc	ra,0xffffc
    80004cfc:	690080e7          	jalr	1680(ra) # 80001388 <copy_and_swap>
    80004d00:	fe0514e3          	bnez	a0,80004ce8 <_Z11printStringPKc+0x58>
}
    80004d04:	01813083          	ld	ra,24(sp)
    80004d08:	01013403          	ld	s0,16(sp)
    80004d0c:	00813483          	ld	s1,8(sp)
    80004d10:	02010113          	addi	sp,sp,32
    80004d14:	00008067          	ret

0000000080004d18 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004d18:	fd010113          	addi	sp,sp,-48
    80004d1c:	02113423          	sd	ra,40(sp)
    80004d20:	02813023          	sd	s0,32(sp)
    80004d24:	00913c23          	sd	s1,24(sp)
    80004d28:	01213823          	sd	s2,16(sp)
    80004d2c:	01313423          	sd	s3,8(sp)
    80004d30:	01413023          	sd	s4,0(sp)
    80004d34:	03010413          	addi	s0,sp,48
    80004d38:	00050993          	mv	s3,a0
    80004d3c:	00058a13          	mv	s4,a1
    LOCK();
    80004d40:	00100613          	li	a2,1
    80004d44:	00000593          	li	a1,0
    80004d48:	00005517          	auipc	a0,0x5
    80004d4c:	7a050513          	addi	a0,a0,1952 # 8000a4e8 <lockPrint>
    80004d50:	ffffc097          	auipc	ra,0xffffc
    80004d54:	638080e7          	jalr	1592(ra) # 80001388 <copy_and_swap>
    80004d58:	00050863          	beqz	a0,80004d68 <_Z9getStringPci+0x50>
    80004d5c:	ffffd097          	auipc	ra,0xffffd
    80004d60:	a68080e7          	jalr	-1432(ra) # 800017c4 <_Z15thread_dispatchv>
    80004d64:	fddff06f          	j	80004d40 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004d68:	00000913          	li	s2,0
    80004d6c:	00090493          	mv	s1,s2
    80004d70:	0019091b          	addiw	s2,s2,1
    80004d74:	03495a63          	bge	s2,s4,80004da8 <_Z9getStringPci+0x90>
        cc = getc();
    80004d78:	ffffd097          	auipc	ra,0xffffd
    80004d7c:	b40080e7          	jalr	-1216(ra) # 800018b8 <_Z4getcv>
        if(cc < 1)
    80004d80:	02050463          	beqz	a0,80004da8 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80004d84:	009984b3          	add	s1,s3,s1
    80004d88:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004d8c:	00a00793          	li	a5,10
    80004d90:	00f50a63          	beq	a0,a5,80004da4 <_Z9getStringPci+0x8c>
    80004d94:	00d00793          	li	a5,13
    80004d98:	fcf51ae3          	bne	a0,a5,80004d6c <_Z9getStringPci+0x54>
        buf[i++] = c;
    80004d9c:	00090493          	mv	s1,s2
    80004da0:	0080006f          	j	80004da8 <_Z9getStringPci+0x90>
    80004da4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80004da8:	009984b3          	add	s1,s3,s1
    80004dac:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80004db0:	00000613          	li	a2,0
    80004db4:	00100593          	li	a1,1
    80004db8:	00005517          	auipc	a0,0x5
    80004dbc:	73050513          	addi	a0,a0,1840 # 8000a4e8 <lockPrint>
    80004dc0:	ffffc097          	auipc	ra,0xffffc
    80004dc4:	5c8080e7          	jalr	1480(ra) # 80001388 <copy_and_swap>
    80004dc8:	fe0514e3          	bnez	a0,80004db0 <_Z9getStringPci+0x98>
    return buf;
}
    80004dcc:	00098513          	mv	a0,s3
    80004dd0:	02813083          	ld	ra,40(sp)
    80004dd4:	02013403          	ld	s0,32(sp)
    80004dd8:	01813483          	ld	s1,24(sp)
    80004ddc:	01013903          	ld	s2,16(sp)
    80004de0:	00813983          	ld	s3,8(sp)
    80004de4:	00013a03          	ld	s4,0(sp)
    80004de8:	03010113          	addi	sp,sp,48
    80004dec:	00008067          	ret

0000000080004df0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004df0:	ff010113          	addi	sp,sp,-16
    80004df4:	00813423          	sd	s0,8(sp)
    80004df8:	01010413          	addi	s0,sp,16
    80004dfc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004e00:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004e04:	0006c603          	lbu	a2,0(a3)
    80004e08:	fd06071b          	addiw	a4,a2,-48
    80004e0c:	0ff77713          	andi	a4,a4,255
    80004e10:	00900793          	li	a5,9
    80004e14:	02e7e063          	bltu	a5,a4,80004e34 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004e18:	0025179b          	slliw	a5,a0,0x2
    80004e1c:	00a787bb          	addw	a5,a5,a0
    80004e20:	0017979b          	slliw	a5,a5,0x1
    80004e24:	00168693          	addi	a3,a3,1
    80004e28:	00c787bb          	addw	a5,a5,a2
    80004e2c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004e30:	fd5ff06f          	j	80004e04 <_Z11stringToIntPKc+0x14>
    return n;
}
    80004e34:	00813403          	ld	s0,8(sp)
    80004e38:	01010113          	addi	sp,sp,16
    80004e3c:	00008067          	ret

0000000080004e40 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004e40:	fc010113          	addi	sp,sp,-64
    80004e44:	02113c23          	sd	ra,56(sp)
    80004e48:	02813823          	sd	s0,48(sp)
    80004e4c:	02913423          	sd	s1,40(sp)
    80004e50:	03213023          	sd	s2,32(sp)
    80004e54:	01313c23          	sd	s3,24(sp)
    80004e58:	04010413          	addi	s0,sp,64
    80004e5c:	00050493          	mv	s1,a0
    80004e60:	00058913          	mv	s2,a1
    80004e64:	00060993          	mv	s3,a2
    LOCK();
    80004e68:	00100613          	li	a2,1
    80004e6c:	00000593          	li	a1,0
    80004e70:	00005517          	auipc	a0,0x5
    80004e74:	67850513          	addi	a0,a0,1656 # 8000a4e8 <lockPrint>
    80004e78:	ffffc097          	auipc	ra,0xffffc
    80004e7c:	510080e7          	jalr	1296(ra) # 80001388 <copy_and_swap>
    80004e80:	00050863          	beqz	a0,80004e90 <_Z8printIntiii+0x50>
    80004e84:	ffffd097          	auipc	ra,0xffffd
    80004e88:	940080e7          	jalr	-1728(ra) # 800017c4 <_Z15thread_dispatchv>
    80004e8c:	fddff06f          	j	80004e68 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004e90:	00098463          	beqz	s3,80004e98 <_Z8printIntiii+0x58>
    80004e94:	0804c463          	bltz	s1,80004f1c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004e98:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004e9c:	00000593          	li	a1,0
    }

    i = 0;
    80004ea0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004ea4:	0009079b          	sext.w	a5,s2
    80004ea8:	0325773b          	remuw	a4,a0,s2
    80004eac:	00048613          	mv	a2,s1
    80004eb0:	0014849b          	addiw	s1,s1,1
    80004eb4:	02071693          	slli	a3,a4,0x20
    80004eb8:	0206d693          	srli	a3,a3,0x20
    80004ebc:	00005717          	auipc	a4,0x5
    80004ec0:	4f470713          	addi	a4,a4,1268 # 8000a3b0 <digits>
    80004ec4:	00d70733          	add	a4,a4,a3
    80004ec8:	00074683          	lbu	a3,0(a4)
    80004ecc:	fd040713          	addi	a4,s0,-48
    80004ed0:	00c70733          	add	a4,a4,a2
    80004ed4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004ed8:	0005071b          	sext.w	a4,a0
    80004edc:	0325553b          	divuw	a0,a0,s2
    80004ee0:	fcf772e3          	bgeu	a4,a5,80004ea4 <_Z8printIntiii+0x64>
    if(neg)
    80004ee4:	00058c63          	beqz	a1,80004efc <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004ee8:	fd040793          	addi	a5,s0,-48
    80004eec:	009784b3          	add	s1,a5,s1
    80004ef0:	02d00793          	li	a5,45
    80004ef4:	fef48823          	sb	a5,-16(s1)
    80004ef8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004efc:	fff4849b          	addiw	s1,s1,-1
    80004f00:	0204c463          	bltz	s1,80004f28 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80004f04:	fd040793          	addi	a5,s0,-48
    80004f08:	009787b3          	add	a5,a5,s1
    80004f0c:	ff07c503          	lbu	a0,-16(a5)
    80004f10:	ffffd097          	auipc	ra,0xffffd
    80004f14:	9d0080e7          	jalr	-1584(ra) # 800018e0 <_Z4putcc>
    80004f18:	fe5ff06f          	j	80004efc <_Z8printIntiii+0xbc>
        x = -xx;
    80004f1c:	4090053b          	negw	a0,s1
        neg = 1;
    80004f20:	00100593          	li	a1,1
        x = -xx;
    80004f24:	f7dff06f          	j	80004ea0 <_Z8printIntiii+0x60>

    UNLOCK();
    80004f28:	00000613          	li	a2,0
    80004f2c:	00100593          	li	a1,1
    80004f30:	00005517          	auipc	a0,0x5
    80004f34:	5b850513          	addi	a0,a0,1464 # 8000a4e8 <lockPrint>
    80004f38:	ffffc097          	auipc	ra,0xffffc
    80004f3c:	450080e7          	jalr	1104(ra) # 80001388 <copy_and_swap>
    80004f40:	fe0514e3          	bnez	a0,80004f28 <_Z8printIntiii+0xe8>
    80004f44:	03813083          	ld	ra,56(sp)
    80004f48:	03013403          	ld	s0,48(sp)
    80004f4c:	02813483          	ld	s1,40(sp)
    80004f50:	02013903          	ld	s2,32(sp)
    80004f54:	01813983          	ld	s3,24(sp)
    80004f58:	04010113          	addi	sp,sp,64
    80004f5c:	00008067          	ret

0000000080004f60 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004f60:	fd010113          	addi	sp,sp,-48
    80004f64:	02113423          	sd	ra,40(sp)
    80004f68:	02813023          	sd	s0,32(sp)
    80004f6c:	00913c23          	sd	s1,24(sp)
    80004f70:	01213823          	sd	s2,16(sp)
    80004f74:	01313423          	sd	s3,8(sp)
    80004f78:	03010413          	addi	s0,sp,48
    80004f7c:	00050493          	mv	s1,a0
    80004f80:	00058913          	mv	s2,a1
    80004f84:	0015879b          	addiw	a5,a1,1
    80004f88:	0007851b          	sext.w	a0,a5
    80004f8c:	00f4a023          	sw	a5,0(s1)
    80004f90:	0004a823          	sw	zero,16(s1)
    80004f94:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004f98:	00251513          	slli	a0,a0,0x2
    80004f9c:	ffffc097          	auipc	ra,0xffffc
    80004fa0:	6d0080e7          	jalr	1744(ra) # 8000166c <_Z9mem_allocm>
    80004fa4:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004fa8:	01000513          	li	a0,16
    80004fac:	ffffd097          	auipc	ra,0xffffd
    80004fb0:	9fc080e7          	jalr	-1540(ra) # 800019a8 <_Znwm>
    80004fb4:	00050993          	mv	s3,a0
    80004fb8:	00000593          	li	a1,0
    80004fbc:	ffffd097          	auipc	ra,0xffffd
    80004fc0:	f08080e7          	jalr	-248(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    80004fc4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004fc8:	01000513          	li	a0,16
    80004fcc:	ffffd097          	auipc	ra,0xffffd
    80004fd0:	9dc080e7          	jalr	-1572(ra) # 800019a8 <_Znwm>
    80004fd4:	00050993          	mv	s3,a0
    80004fd8:	00090593          	mv	a1,s2
    80004fdc:	ffffd097          	auipc	ra,0xffffd
    80004fe0:	ee8080e7          	jalr	-280(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    80004fe4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004fe8:	01000513          	li	a0,16
    80004fec:	ffffd097          	auipc	ra,0xffffd
    80004ff0:	9bc080e7          	jalr	-1604(ra) # 800019a8 <_Znwm>
    80004ff4:	00050913          	mv	s2,a0
    80004ff8:	00100593          	li	a1,1
    80004ffc:	ffffd097          	auipc	ra,0xffffd
    80005000:	ec8080e7          	jalr	-312(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    80005004:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005008:	01000513          	li	a0,16
    8000500c:	ffffd097          	auipc	ra,0xffffd
    80005010:	99c080e7          	jalr	-1636(ra) # 800019a8 <_Znwm>
    80005014:	00050913          	mv	s2,a0
    80005018:	00100593          	li	a1,1
    8000501c:	ffffd097          	auipc	ra,0xffffd
    80005020:	ea8080e7          	jalr	-344(ra) # 80001ec4 <_ZN9SemaphoreC1Ej>
    80005024:	0324b823          	sd	s2,48(s1)
}
    80005028:	02813083          	ld	ra,40(sp)
    8000502c:	02013403          	ld	s0,32(sp)
    80005030:	01813483          	ld	s1,24(sp)
    80005034:	01013903          	ld	s2,16(sp)
    80005038:	00813983          	ld	s3,8(sp)
    8000503c:	03010113          	addi	sp,sp,48
    80005040:	00008067          	ret
    80005044:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005048:	00098513          	mv	a0,s3
    8000504c:	ffffd097          	auipc	ra,0xffffd
    80005050:	9ac080e7          	jalr	-1620(ra) # 800019f8 <_ZdlPv>
    80005054:	00048513          	mv	a0,s1
    80005058:	00006097          	auipc	ra,0x6
    8000505c:	570080e7          	jalr	1392(ra) # 8000b5c8 <_Unwind_Resume>
    80005060:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005064:	00098513          	mv	a0,s3
    80005068:	ffffd097          	auipc	ra,0xffffd
    8000506c:	990080e7          	jalr	-1648(ra) # 800019f8 <_ZdlPv>
    80005070:	00048513          	mv	a0,s1
    80005074:	00006097          	auipc	ra,0x6
    80005078:	554080e7          	jalr	1364(ra) # 8000b5c8 <_Unwind_Resume>
    8000507c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005080:	00090513          	mv	a0,s2
    80005084:	ffffd097          	auipc	ra,0xffffd
    80005088:	974080e7          	jalr	-1676(ra) # 800019f8 <_ZdlPv>
    8000508c:	00048513          	mv	a0,s1
    80005090:	00006097          	auipc	ra,0x6
    80005094:	538080e7          	jalr	1336(ra) # 8000b5c8 <_Unwind_Resume>
    80005098:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000509c:	00090513          	mv	a0,s2
    800050a0:	ffffd097          	auipc	ra,0xffffd
    800050a4:	958080e7          	jalr	-1704(ra) # 800019f8 <_ZdlPv>
    800050a8:	00048513          	mv	a0,s1
    800050ac:	00006097          	auipc	ra,0x6
    800050b0:	51c080e7          	jalr	1308(ra) # 8000b5c8 <_Unwind_Resume>

00000000800050b4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800050b4:	fe010113          	addi	sp,sp,-32
    800050b8:	00113c23          	sd	ra,24(sp)
    800050bc:	00813823          	sd	s0,16(sp)
    800050c0:	00913423          	sd	s1,8(sp)
    800050c4:	01213023          	sd	s2,0(sp)
    800050c8:	02010413          	addi	s0,sp,32
    800050cc:	00050493          	mv	s1,a0
    800050d0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800050d4:	01853503          	ld	a0,24(a0)
    800050d8:	ffffd097          	auipc	ra,0xffffd
    800050dc:	e24080e7          	jalr	-476(ra) # 80001efc <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800050e0:	0304b503          	ld	a0,48(s1)
    800050e4:	ffffd097          	auipc	ra,0xffffd
    800050e8:	e18080e7          	jalr	-488(ra) # 80001efc <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800050ec:	0084b783          	ld	a5,8(s1)
    800050f0:	0144a703          	lw	a4,20(s1)
    800050f4:	00271713          	slli	a4,a4,0x2
    800050f8:	00e787b3          	add	a5,a5,a4
    800050fc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005100:	0144a783          	lw	a5,20(s1)
    80005104:	0017879b          	addiw	a5,a5,1
    80005108:	0004a703          	lw	a4,0(s1)
    8000510c:	02e7e7bb          	remw	a5,a5,a4
    80005110:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005114:	0304b503          	ld	a0,48(s1)
    80005118:	ffffd097          	auipc	ra,0xffffd
    8000511c:	e10080e7          	jalr	-496(ra) # 80001f28 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005120:	0204b503          	ld	a0,32(s1)
    80005124:	ffffd097          	auipc	ra,0xffffd
    80005128:	e04080e7          	jalr	-508(ra) # 80001f28 <_ZN9Semaphore6signalEv>

}
    8000512c:	01813083          	ld	ra,24(sp)
    80005130:	01013403          	ld	s0,16(sp)
    80005134:	00813483          	ld	s1,8(sp)
    80005138:	00013903          	ld	s2,0(sp)
    8000513c:	02010113          	addi	sp,sp,32
    80005140:	00008067          	ret

0000000080005144 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005144:	fe010113          	addi	sp,sp,-32
    80005148:	00113c23          	sd	ra,24(sp)
    8000514c:	00813823          	sd	s0,16(sp)
    80005150:	00913423          	sd	s1,8(sp)
    80005154:	01213023          	sd	s2,0(sp)
    80005158:	02010413          	addi	s0,sp,32
    8000515c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005160:	02053503          	ld	a0,32(a0)
    80005164:	ffffd097          	auipc	ra,0xffffd
    80005168:	d98080e7          	jalr	-616(ra) # 80001efc <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000516c:	0284b503          	ld	a0,40(s1)
    80005170:	ffffd097          	auipc	ra,0xffffd
    80005174:	d8c080e7          	jalr	-628(ra) # 80001efc <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005178:	0084b703          	ld	a4,8(s1)
    8000517c:	0104a783          	lw	a5,16(s1)
    80005180:	00279693          	slli	a3,a5,0x2
    80005184:	00d70733          	add	a4,a4,a3
    80005188:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000518c:	0017879b          	addiw	a5,a5,1
    80005190:	0004a703          	lw	a4,0(s1)
    80005194:	02e7e7bb          	remw	a5,a5,a4
    80005198:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000519c:	0284b503          	ld	a0,40(s1)
    800051a0:	ffffd097          	auipc	ra,0xffffd
    800051a4:	d88080e7          	jalr	-632(ra) # 80001f28 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800051a8:	0184b503          	ld	a0,24(s1)
    800051ac:	ffffd097          	auipc	ra,0xffffd
    800051b0:	d7c080e7          	jalr	-644(ra) # 80001f28 <_ZN9Semaphore6signalEv>

    return ret;
}
    800051b4:	00090513          	mv	a0,s2
    800051b8:	01813083          	ld	ra,24(sp)
    800051bc:	01013403          	ld	s0,16(sp)
    800051c0:	00813483          	ld	s1,8(sp)
    800051c4:	00013903          	ld	s2,0(sp)
    800051c8:	02010113          	addi	sp,sp,32
    800051cc:	00008067          	ret

00000000800051d0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800051d0:	fe010113          	addi	sp,sp,-32
    800051d4:	00113c23          	sd	ra,24(sp)
    800051d8:	00813823          	sd	s0,16(sp)
    800051dc:	00913423          	sd	s1,8(sp)
    800051e0:	01213023          	sd	s2,0(sp)
    800051e4:	02010413          	addi	s0,sp,32
    800051e8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800051ec:	02853503          	ld	a0,40(a0)
    800051f0:	ffffd097          	auipc	ra,0xffffd
    800051f4:	d0c080e7          	jalr	-756(ra) # 80001efc <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800051f8:	0304b503          	ld	a0,48(s1)
    800051fc:	ffffd097          	auipc	ra,0xffffd
    80005200:	d00080e7          	jalr	-768(ra) # 80001efc <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005204:	0144a783          	lw	a5,20(s1)
    80005208:	0104a903          	lw	s2,16(s1)
    8000520c:	0327ce63          	blt	a5,s2,80005248 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005210:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005214:	0304b503          	ld	a0,48(s1)
    80005218:	ffffd097          	auipc	ra,0xffffd
    8000521c:	d10080e7          	jalr	-752(ra) # 80001f28 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005220:	0284b503          	ld	a0,40(s1)
    80005224:	ffffd097          	auipc	ra,0xffffd
    80005228:	d04080e7          	jalr	-764(ra) # 80001f28 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000522c:	00090513          	mv	a0,s2
    80005230:	01813083          	ld	ra,24(sp)
    80005234:	01013403          	ld	s0,16(sp)
    80005238:	00813483          	ld	s1,8(sp)
    8000523c:	00013903          	ld	s2,0(sp)
    80005240:	02010113          	addi	sp,sp,32
    80005244:	00008067          	ret
        ret = cap - head + tail;
    80005248:	0004a703          	lw	a4,0(s1)
    8000524c:	4127093b          	subw	s2,a4,s2
    80005250:	00f9093b          	addw	s2,s2,a5
    80005254:	fc1ff06f          	j	80005214 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005258 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005258:	fe010113          	addi	sp,sp,-32
    8000525c:	00113c23          	sd	ra,24(sp)
    80005260:	00813823          	sd	s0,16(sp)
    80005264:	00913423          	sd	s1,8(sp)
    80005268:	02010413          	addi	s0,sp,32
    8000526c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005270:	00a00513          	li	a0,10
    80005274:	ffffd097          	auipc	ra,0xffffd
    80005278:	d34080e7          	jalr	-716(ra) # 80001fa8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000527c:	00003517          	auipc	a0,0x3
    80005280:	09450513          	addi	a0,a0,148 # 80008310 <CONSOLE_STATUS+0x300>
    80005284:	00000097          	auipc	ra,0x0
    80005288:	a0c080e7          	jalr	-1524(ra) # 80004c90 <_Z11printStringPKc>
    while (getCnt()) {
    8000528c:	00048513          	mv	a0,s1
    80005290:	00000097          	auipc	ra,0x0
    80005294:	f40080e7          	jalr	-192(ra) # 800051d0 <_ZN9BufferCPP6getCntEv>
    80005298:	02050c63          	beqz	a0,800052d0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000529c:	0084b783          	ld	a5,8(s1)
    800052a0:	0104a703          	lw	a4,16(s1)
    800052a4:	00271713          	slli	a4,a4,0x2
    800052a8:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800052ac:	0007c503          	lbu	a0,0(a5)
    800052b0:	ffffd097          	auipc	ra,0xffffd
    800052b4:	cf8080e7          	jalr	-776(ra) # 80001fa8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800052b8:	0104a783          	lw	a5,16(s1)
    800052bc:	0017879b          	addiw	a5,a5,1
    800052c0:	0004a703          	lw	a4,0(s1)
    800052c4:	02e7e7bb          	remw	a5,a5,a4
    800052c8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800052cc:	fc1ff06f          	j	8000528c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800052d0:	02100513          	li	a0,33
    800052d4:	ffffd097          	auipc	ra,0xffffd
    800052d8:	cd4080e7          	jalr	-812(ra) # 80001fa8 <_ZN7Console4putcEc>
    Console::putc('\n');
    800052dc:	00a00513          	li	a0,10
    800052e0:	ffffd097          	auipc	ra,0xffffd
    800052e4:	cc8080e7          	jalr	-824(ra) # 80001fa8 <_ZN7Console4putcEc>
    mem_free(buffer);
    800052e8:	0084b503          	ld	a0,8(s1)
    800052ec:	ffffc097          	auipc	ra,0xffffc
    800052f0:	354080e7          	jalr	852(ra) # 80001640 <_Z8mem_freePv>
    delete itemAvailable;
    800052f4:	0204b503          	ld	a0,32(s1)
    800052f8:	00050863          	beqz	a0,80005308 <_ZN9BufferCPPD1Ev+0xb0>
    800052fc:	00053783          	ld	a5,0(a0)
    80005300:	0087b783          	ld	a5,8(a5)
    80005304:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005308:	0184b503          	ld	a0,24(s1)
    8000530c:	00050863          	beqz	a0,8000531c <_ZN9BufferCPPD1Ev+0xc4>
    80005310:	00053783          	ld	a5,0(a0)
    80005314:	0087b783          	ld	a5,8(a5)
    80005318:	000780e7          	jalr	a5
    delete mutexTail;
    8000531c:	0304b503          	ld	a0,48(s1)
    80005320:	00050863          	beqz	a0,80005330 <_ZN9BufferCPPD1Ev+0xd8>
    80005324:	00053783          	ld	a5,0(a0)
    80005328:	0087b783          	ld	a5,8(a5)
    8000532c:	000780e7          	jalr	a5
    delete mutexHead;
    80005330:	0284b503          	ld	a0,40(s1)
    80005334:	00050863          	beqz	a0,80005344 <_ZN9BufferCPPD1Ev+0xec>
    80005338:	00053783          	ld	a5,0(a0)
    8000533c:	0087b783          	ld	a5,8(a5)
    80005340:	000780e7          	jalr	a5
}
    80005344:	01813083          	ld	ra,24(sp)
    80005348:	01013403          	ld	s0,16(sp)
    8000534c:	00813483          	ld	s1,8(sp)
    80005350:	02010113          	addi	sp,sp,32
    80005354:	00008067          	ret

0000000080005358 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005358:	fe010113          	addi	sp,sp,-32
    8000535c:	00113c23          	sd	ra,24(sp)
    80005360:	00813823          	sd	s0,16(sp)
    80005364:	00913423          	sd	s1,8(sp)
    80005368:	01213023          	sd	s2,0(sp)
    8000536c:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005370:	00003517          	auipc	a0,0x3
    80005374:	fb850513          	addi	a0,a0,-72 # 80008328 <CONSOLE_STATUS+0x318>
    80005378:	00000097          	auipc	ra,0x0
    8000537c:	918080e7          	jalr	-1768(ra) # 80004c90 <_Z11printStringPKc>
    int test = getc() - '0';
    80005380:	ffffc097          	auipc	ra,0xffffc
    80005384:	538080e7          	jalr	1336(ra) # 800018b8 <_Z4getcv>
    80005388:	00050913          	mv	s2,a0
    8000538c:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005390:	ffffc097          	auipc	ra,0xffffc
    80005394:	528080e7          	jalr	1320(ra) # 800018b8 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    80005398:	fcb9091b          	addiw	s2,s2,-53
    8000539c:	00100793          	li	a5,1
    800053a0:	0327f463          	bgeu	a5,s2,800053c8 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800053a4:	00700793          	li	a5,7
    800053a8:	0e97e263          	bltu	a5,s1,8000548c <_Z8userMainv+0x134>
    800053ac:	00249493          	slli	s1,s1,0x2
    800053b0:	00003717          	auipc	a4,0x3
    800053b4:	19070713          	addi	a4,a4,400 # 80008540 <CONSOLE_STATUS+0x530>
    800053b8:	00e484b3          	add	s1,s1,a4
    800053bc:	0004a783          	lw	a5,0(s1)
    800053c0:	00e787b3          	add	a5,a5,a4
    800053c4:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    800053c8:	00003517          	auipc	a0,0x3
    800053cc:	f8050513          	addi	a0,a0,-128 # 80008348 <CONSOLE_STATUS+0x338>
    800053d0:	00000097          	auipc	ra,0x0
    800053d4:	8c0080e7          	jalr	-1856(ra) # 80004c90 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800053d8:	01813083          	ld	ra,24(sp)
    800053dc:	01013403          	ld	s0,16(sp)
    800053e0:	00813483          	ld	s1,8(sp)
    800053e4:	00013903          	ld	s2,0(sp)
    800053e8:	02010113          	addi	sp,sp,32
    800053ec:	00008067          	ret
            Threads_C_API_test();
    800053f0:	fffff097          	auipc	ra,0xfffff
    800053f4:	f18080e7          	jalr	-232(ra) # 80004308 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800053f8:	00003517          	auipc	a0,0x3
    800053fc:	f8050513          	addi	a0,a0,-128 # 80008378 <CONSOLE_STATUS+0x368>
    80005400:	00000097          	auipc	ra,0x0
    80005404:	890080e7          	jalr	-1904(ra) # 80004c90 <_Z11printStringPKc>
            break;
    80005408:	fd1ff06f          	j	800053d8 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    8000540c:	ffffe097          	auipc	ra,0xffffe
    80005410:	ddc080e7          	jalr	-548(ra) # 800031e8 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005414:	00003517          	auipc	a0,0x3
    80005418:	fa450513          	addi	a0,a0,-92 # 800083b8 <CONSOLE_STATUS+0x3a8>
    8000541c:	00000097          	auipc	ra,0x0
    80005420:	874080e7          	jalr	-1932(ra) # 80004c90 <_Z11printStringPKc>
            break;
    80005424:	fb5ff06f          	j	800053d8 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80005428:	ffffd097          	auipc	ra,0xffffd
    8000542c:	614080e7          	jalr	1556(ra) # 80002a3c <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005430:	00003517          	auipc	a0,0x3
    80005434:	fc850513          	addi	a0,a0,-56 # 800083f8 <CONSOLE_STATUS+0x3e8>
    80005438:	00000097          	auipc	ra,0x0
    8000543c:	858080e7          	jalr	-1960(ra) # 80004c90 <_Z11printStringPKc>
            break;
    80005440:	f99ff06f          	j	800053d8 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    80005444:	fffff097          	auipc	ra,0xfffff
    80005448:	208080e7          	jalr	520(ra) # 8000464c <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    8000544c:	00003517          	auipc	a0,0x3
    80005450:	ffc50513          	addi	a0,a0,-4 # 80008448 <CONSOLE_STATUS+0x438>
    80005454:	00000097          	auipc	ra,0x0
    80005458:	83c080e7          	jalr	-1988(ra) # 80004c90 <_Z11printStringPKc>
            break;
    8000545c:	f7dff06f          	j	800053d8 <_Z8userMainv+0x80>
            System_Mode_test();
    80005460:	00000097          	auipc	ra,0x0
    80005464:	52c080e7          	jalr	1324(ra) # 8000598c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005468:	00003517          	auipc	a0,0x3
    8000546c:	03850513          	addi	a0,a0,56 # 800084a0 <CONSOLE_STATUS+0x490>
    80005470:	00000097          	auipc	ra,0x0
    80005474:	820080e7          	jalr	-2016(ra) # 80004c90 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005478:	00003517          	auipc	a0,0x3
    8000547c:	04850513          	addi	a0,a0,72 # 800084c0 <CONSOLE_STATUS+0x4b0>
    80005480:	00000097          	auipc	ra,0x0
    80005484:	810080e7          	jalr	-2032(ra) # 80004c90 <_Z11printStringPKc>
            break;
    80005488:	f51ff06f          	j	800053d8 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    8000548c:	00003517          	auipc	a0,0x3
    80005490:	08c50513          	addi	a0,a0,140 # 80008518 <CONSOLE_STATUS+0x508>
    80005494:	fffff097          	auipc	ra,0xfffff
    80005498:	7fc080e7          	jalr	2044(ra) # 80004c90 <_Z11printStringPKc>
    8000549c:	f3dff06f          	j	800053d8 <_Z8userMainv+0x80>

00000000800054a0 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800054a0:	fe010113          	addi	sp,sp,-32
    800054a4:	00113c23          	sd	ra,24(sp)
    800054a8:	00813823          	sd	s0,16(sp)
    800054ac:	00913423          	sd	s1,8(sp)
    800054b0:	01213023          	sd	s2,0(sp)
    800054b4:	02010413          	addi	s0,sp,32
    800054b8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800054bc:	00100793          	li	a5,1
    800054c0:	02a7f863          	bgeu	a5,a0,800054f0 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800054c4:	00a00793          	li	a5,10
    800054c8:	02f577b3          	remu	a5,a0,a5
    800054cc:	02078e63          	beqz	a5,80005508 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800054d0:	fff48513          	addi	a0,s1,-1
    800054d4:	00000097          	auipc	ra,0x0
    800054d8:	fcc080e7          	jalr	-52(ra) # 800054a0 <_ZL9fibonaccim>
    800054dc:	00050913          	mv	s2,a0
    800054e0:	ffe48513          	addi	a0,s1,-2
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	fbc080e7          	jalr	-68(ra) # 800054a0 <_ZL9fibonaccim>
    800054ec:	00a90533          	add	a0,s2,a0
}
    800054f0:	01813083          	ld	ra,24(sp)
    800054f4:	01013403          	ld	s0,16(sp)
    800054f8:	00813483          	ld	s1,8(sp)
    800054fc:	00013903          	ld	s2,0(sp)
    80005500:	02010113          	addi	sp,sp,32
    80005504:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005508:	ffffc097          	auipc	ra,0xffffc
    8000550c:	2bc080e7          	jalr	700(ra) # 800017c4 <_Z15thread_dispatchv>
    80005510:	fc1ff06f          	j	800054d0 <_ZL9fibonaccim+0x30>

0000000080005514 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005514:	fe010113          	addi	sp,sp,-32
    80005518:	00113c23          	sd	ra,24(sp)
    8000551c:	00813823          	sd	s0,16(sp)
    80005520:	00913423          	sd	s1,8(sp)
    80005524:	01213023          	sd	s2,0(sp)
    80005528:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000552c:	00a00493          	li	s1,10
    80005530:	0400006f          	j	80005570 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005534:	00003517          	auipc	a0,0x3
    80005538:	d4450513          	addi	a0,a0,-700 # 80008278 <CONSOLE_STATUS+0x268>
    8000553c:	fffff097          	auipc	ra,0xfffff
    80005540:	754080e7          	jalr	1876(ra) # 80004c90 <_Z11printStringPKc>
    80005544:	00000613          	li	a2,0
    80005548:	00a00593          	li	a1,10
    8000554c:	00048513          	mv	a0,s1
    80005550:	00000097          	auipc	ra,0x0
    80005554:	8f0080e7          	jalr	-1808(ra) # 80004e40 <_Z8printIntiii>
    80005558:	00003517          	auipc	a0,0x3
    8000555c:	f4050513          	addi	a0,a0,-192 # 80008498 <CONSOLE_STATUS+0x488>
    80005560:	fffff097          	auipc	ra,0xfffff
    80005564:	730080e7          	jalr	1840(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005568:	0014849b          	addiw	s1,s1,1
    8000556c:	0ff4f493          	andi	s1,s1,255
    80005570:	00c00793          	li	a5,12
    80005574:	fc97f0e3          	bgeu	a5,s1,80005534 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005578:	00003517          	auipc	a0,0x3
    8000557c:	d0850513          	addi	a0,a0,-760 # 80008280 <CONSOLE_STATUS+0x270>
    80005580:	fffff097          	auipc	ra,0xfffff
    80005584:	710080e7          	jalr	1808(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005588:	00500313          	li	t1,5
    thread_dispatch();
    8000558c:	ffffc097          	auipc	ra,0xffffc
    80005590:	238080e7          	jalr	568(ra) # 800017c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005594:	01000513          	li	a0,16
    80005598:	00000097          	auipc	ra,0x0
    8000559c:	f08080e7          	jalr	-248(ra) # 800054a0 <_ZL9fibonaccim>
    800055a0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800055a4:	00003517          	auipc	a0,0x3
    800055a8:	cec50513          	addi	a0,a0,-788 # 80008290 <CONSOLE_STATUS+0x280>
    800055ac:	fffff097          	auipc	ra,0xfffff
    800055b0:	6e4080e7          	jalr	1764(ra) # 80004c90 <_Z11printStringPKc>
    800055b4:	00000613          	li	a2,0
    800055b8:	00a00593          	li	a1,10
    800055bc:	0009051b          	sext.w	a0,s2
    800055c0:	00000097          	auipc	ra,0x0
    800055c4:	880080e7          	jalr	-1920(ra) # 80004e40 <_Z8printIntiii>
    800055c8:	00003517          	auipc	a0,0x3
    800055cc:	ed050513          	addi	a0,a0,-304 # 80008498 <CONSOLE_STATUS+0x488>
    800055d0:	fffff097          	auipc	ra,0xfffff
    800055d4:	6c0080e7          	jalr	1728(ra) # 80004c90 <_Z11printStringPKc>
    800055d8:	0400006f          	j	80005618 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800055dc:	00003517          	auipc	a0,0x3
    800055e0:	c9c50513          	addi	a0,a0,-868 # 80008278 <CONSOLE_STATUS+0x268>
    800055e4:	fffff097          	auipc	ra,0xfffff
    800055e8:	6ac080e7          	jalr	1708(ra) # 80004c90 <_Z11printStringPKc>
    800055ec:	00000613          	li	a2,0
    800055f0:	00a00593          	li	a1,10
    800055f4:	00048513          	mv	a0,s1
    800055f8:	00000097          	auipc	ra,0x0
    800055fc:	848080e7          	jalr	-1976(ra) # 80004e40 <_Z8printIntiii>
    80005600:	00003517          	auipc	a0,0x3
    80005604:	e9850513          	addi	a0,a0,-360 # 80008498 <CONSOLE_STATUS+0x488>
    80005608:	fffff097          	auipc	ra,0xfffff
    8000560c:	688080e7          	jalr	1672(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005610:	0014849b          	addiw	s1,s1,1
    80005614:	0ff4f493          	andi	s1,s1,255
    80005618:	00f00793          	li	a5,15
    8000561c:	fc97f0e3          	bgeu	a5,s1,800055dc <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005620:	00003517          	auipc	a0,0x3
    80005624:	c8050513          	addi	a0,a0,-896 # 800082a0 <CONSOLE_STATUS+0x290>
    80005628:	fffff097          	auipc	ra,0xfffff
    8000562c:	668080e7          	jalr	1640(ra) # 80004c90 <_Z11printStringPKc>
    finishedD = true;
    80005630:	00100793          	li	a5,1
    80005634:	00005717          	auipc	a4,0x5
    80005638:	eaf70e23          	sb	a5,-324(a4) # 8000a4f0 <_ZL9finishedD>
    thread_dispatch();
    8000563c:	ffffc097          	auipc	ra,0xffffc
    80005640:	188080e7          	jalr	392(ra) # 800017c4 <_Z15thread_dispatchv>
}
    80005644:	01813083          	ld	ra,24(sp)
    80005648:	01013403          	ld	s0,16(sp)
    8000564c:	00813483          	ld	s1,8(sp)
    80005650:	00013903          	ld	s2,0(sp)
    80005654:	02010113          	addi	sp,sp,32
    80005658:	00008067          	ret

000000008000565c <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    8000565c:	fe010113          	addi	sp,sp,-32
    80005660:	00113c23          	sd	ra,24(sp)
    80005664:	00813823          	sd	s0,16(sp)
    80005668:	00913423          	sd	s1,8(sp)
    8000566c:	01213023          	sd	s2,0(sp)
    80005670:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005674:	00000493          	li	s1,0
    80005678:	0400006f          	j	800056b8 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000567c:	00003517          	auipc	a0,0x3
    80005680:	bcc50513          	addi	a0,a0,-1076 # 80008248 <CONSOLE_STATUS+0x238>
    80005684:	fffff097          	auipc	ra,0xfffff
    80005688:	60c080e7          	jalr	1548(ra) # 80004c90 <_Z11printStringPKc>
    8000568c:	00000613          	li	a2,0
    80005690:	00a00593          	li	a1,10
    80005694:	00048513          	mv	a0,s1
    80005698:	fffff097          	auipc	ra,0xfffff
    8000569c:	7a8080e7          	jalr	1960(ra) # 80004e40 <_Z8printIntiii>
    800056a0:	00003517          	auipc	a0,0x3
    800056a4:	df850513          	addi	a0,a0,-520 # 80008498 <CONSOLE_STATUS+0x488>
    800056a8:	fffff097          	auipc	ra,0xfffff
    800056ac:	5e8080e7          	jalr	1512(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800056b0:	0014849b          	addiw	s1,s1,1
    800056b4:	0ff4f493          	andi	s1,s1,255
    800056b8:	00200793          	li	a5,2
    800056bc:	fc97f0e3          	bgeu	a5,s1,8000567c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800056c0:	00003517          	auipc	a0,0x3
    800056c4:	b9050513          	addi	a0,a0,-1136 # 80008250 <CONSOLE_STATUS+0x240>
    800056c8:	fffff097          	auipc	ra,0xfffff
    800056cc:	5c8080e7          	jalr	1480(ra) # 80004c90 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800056d0:	00700313          	li	t1,7
    thread_dispatch();
    800056d4:	ffffc097          	auipc	ra,0xffffc
    800056d8:	0f0080e7          	jalr	240(ra) # 800017c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800056dc:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800056e0:	00003517          	auipc	a0,0x3
    800056e4:	b8050513          	addi	a0,a0,-1152 # 80008260 <CONSOLE_STATUS+0x250>
    800056e8:	fffff097          	auipc	ra,0xfffff
    800056ec:	5a8080e7          	jalr	1448(ra) # 80004c90 <_Z11printStringPKc>
    800056f0:	00000613          	li	a2,0
    800056f4:	00a00593          	li	a1,10
    800056f8:	0009051b          	sext.w	a0,s2
    800056fc:	fffff097          	auipc	ra,0xfffff
    80005700:	744080e7          	jalr	1860(ra) # 80004e40 <_Z8printIntiii>
    80005704:	00003517          	auipc	a0,0x3
    80005708:	d9450513          	addi	a0,a0,-620 # 80008498 <CONSOLE_STATUS+0x488>
    8000570c:	fffff097          	auipc	ra,0xfffff
    80005710:	584080e7          	jalr	1412(ra) # 80004c90 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005714:	00c00513          	li	a0,12
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	d88080e7          	jalr	-632(ra) # 800054a0 <_ZL9fibonaccim>
    80005720:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005724:	00003517          	auipc	a0,0x3
    80005728:	b4450513          	addi	a0,a0,-1212 # 80008268 <CONSOLE_STATUS+0x258>
    8000572c:	fffff097          	auipc	ra,0xfffff
    80005730:	564080e7          	jalr	1380(ra) # 80004c90 <_Z11printStringPKc>
    80005734:	00000613          	li	a2,0
    80005738:	00a00593          	li	a1,10
    8000573c:	0009051b          	sext.w	a0,s2
    80005740:	fffff097          	auipc	ra,0xfffff
    80005744:	700080e7          	jalr	1792(ra) # 80004e40 <_Z8printIntiii>
    80005748:	00003517          	auipc	a0,0x3
    8000574c:	d5050513          	addi	a0,a0,-688 # 80008498 <CONSOLE_STATUS+0x488>
    80005750:	fffff097          	auipc	ra,0xfffff
    80005754:	540080e7          	jalr	1344(ra) # 80004c90 <_Z11printStringPKc>
    80005758:	0400006f          	j	80005798 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    8000575c:	00003517          	auipc	a0,0x3
    80005760:	aec50513          	addi	a0,a0,-1300 # 80008248 <CONSOLE_STATUS+0x238>
    80005764:	fffff097          	auipc	ra,0xfffff
    80005768:	52c080e7          	jalr	1324(ra) # 80004c90 <_Z11printStringPKc>
    8000576c:	00000613          	li	a2,0
    80005770:	00a00593          	li	a1,10
    80005774:	00048513          	mv	a0,s1
    80005778:	fffff097          	auipc	ra,0xfffff
    8000577c:	6c8080e7          	jalr	1736(ra) # 80004e40 <_Z8printIntiii>
    80005780:	00003517          	auipc	a0,0x3
    80005784:	d1850513          	addi	a0,a0,-744 # 80008498 <CONSOLE_STATUS+0x488>
    80005788:	fffff097          	auipc	ra,0xfffff
    8000578c:	508080e7          	jalr	1288(ra) # 80004c90 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005790:	0014849b          	addiw	s1,s1,1
    80005794:	0ff4f493          	andi	s1,s1,255
    80005798:	00500793          	li	a5,5
    8000579c:	fc97f0e3          	bgeu	a5,s1,8000575c <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800057a0:	00003517          	auipc	a0,0x3
    800057a4:	a8050513          	addi	a0,a0,-1408 # 80008220 <CONSOLE_STATUS+0x210>
    800057a8:	fffff097          	auipc	ra,0xfffff
    800057ac:	4e8080e7          	jalr	1256(ra) # 80004c90 <_Z11printStringPKc>
    finishedC = true;
    800057b0:	00100793          	li	a5,1
    800057b4:	00005717          	auipc	a4,0x5
    800057b8:	d2f70ea3          	sb	a5,-707(a4) # 8000a4f1 <_ZL9finishedC>
    thread_dispatch();
    800057bc:	ffffc097          	auipc	ra,0xffffc
    800057c0:	008080e7          	jalr	8(ra) # 800017c4 <_Z15thread_dispatchv>
}
    800057c4:	01813083          	ld	ra,24(sp)
    800057c8:	01013403          	ld	s0,16(sp)
    800057cc:	00813483          	ld	s1,8(sp)
    800057d0:	00013903          	ld	s2,0(sp)
    800057d4:	02010113          	addi	sp,sp,32
    800057d8:	00008067          	ret

00000000800057dc <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800057dc:	fe010113          	addi	sp,sp,-32
    800057e0:	00113c23          	sd	ra,24(sp)
    800057e4:	00813823          	sd	s0,16(sp)
    800057e8:	00913423          	sd	s1,8(sp)
    800057ec:	01213023          	sd	s2,0(sp)
    800057f0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800057f4:	00000913          	li	s2,0
    800057f8:	0400006f          	j	80005838 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800057fc:	ffffc097          	auipc	ra,0xffffc
    80005800:	fc8080e7          	jalr	-56(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005804:	00148493          	addi	s1,s1,1
    80005808:	000027b7          	lui	a5,0x2
    8000580c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005810:	0097ee63          	bltu	a5,s1,8000582c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005814:	00000713          	li	a4,0
    80005818:	000077b7          	lui	a5,0x7
    8000581c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005820:	fce7eee3          	bltu	a5,a4,800057fc <_ZL11workerBodyBPv+0x20>
    80005824:	00170713          	addi	a4,a4,1
    80005828:	ff1ff06f          	j	80005818 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000582c:	00a00793          	li	a5,10
    80005830:	04f90663          	beq	s2,a5,8000587c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005834:	00190913          	addi	s2,s2,1
    80005838:	00f00793          	li	a5,15
    8000583c:	0527e463          	bltu	a5,s2,80005884 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005840:	00003517          	auipc	a0,0x3
    80005844:	9f050513          	addi	a0,a0,-1552 # 80008230 <CONSOLE_STATUS+0x220>
    80005848:	fffff097          	auipc	ra,0xfffff
    8000584c:	448080e7          	jalr	1096(ra) # 80004c90 <_Z11printStringPKc>
    80005850:	00000613          	li	a2,0
    80005854:	00a00593          	li	a1,10
    80005858:	0009051b          	sext.w	a0,s2
    8000585c:	fffff097          	auipc	ra,0xfffff
    80005860:	5e4080e7          	jalr	1508(ra) # 80004e40 <_Z8printIntiii>
    80005864:	00003517          	auipc	a0,0x3
    80005868:	c3450513          	addi	a0,a0,-972 # 80008498 <CONSOLE_STATUS+0x488>
    8000586c:	fffff097          	auipc	ra,0xfffff
    80005870:	424080e7          	jalr	1060(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005874:	00000493          	li	s1,0
    80005878:	f91ff06f          	j	80005808 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    8000587c:	14102ff3          	csrr	t6,sepc
    80005880:	fb5ff06f          	j	80005834 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005884:	00003517          	auipc	a0,0x3
    80005888:	9b450513          	addi	a0,a0,-1612 # 80008238 <CONSOLE_STATUS+0x228>
    8000588c:	fffff097          	auipc	ra,0xfffff
    80005890:	404080e7          	jalr	1028(ra) # 80004c90 <_Z11printStringPKc>
    finishedB = true;
    80005894:	00100793          	li	a5,1
    80005898:	00005717          	auipc	a4,0x5
    8000589c:	c4f70d23          	sb	a5,-934(a4) # 8000a4f2 <_ZL9finishedB>
    thread_dispatch();
    800058a0:	ffffc097          	auipc	ra,0xffffc
    800058a4:	f24080e7          	jalr	-220(ra) # 800017c4 <_Z15thread_dispatchv>
}
    800058a8:	01813083          	ld	ra,24(sp)
    800058ac:	01013403          	ld	s0,16(sp)
    800058b0:	00813483          	ld	s1,8(sp)
    800058b4:	00013903          	ld	s2,0(sp)
    800058b8:	02010113          	addi	sp,sp,32
    800058bc:	00008067          	ret

00000000800058c0 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800058c0:	fe010113          	addi	sp,sp,-32
    800058c4:	00113c23          	sd	ra,24(sp)
    800058c8:	00813823          	sd	s0,16(sp)
    800058cc:	00913423          	sd	s1,8(sp)
    800058d0:	01213023          	sd	s2,0(sp)
    800058d4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800058d8:	00000913          	li	s2,0
    800058dc:	0380006f          	j	80005914 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800058e0:	ffffc097          	auipc	ra,0xffffc
    800058e4:	ee4080e7          	jalr	-284(ra) # 800017c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800058e8:	00148493          	addi	s1,s1,1
    800058ec:	000027b7          	lui	a5,0x2
    800058f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800058f4:	0097ee63          	bltu	a5,s1,80005910 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800058f8:	00000713          	li	a4,0
    800058fc:	000077b7          	lui	a5,0x7
    80005900:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005904:	fce7eee3          	bltu	a5,a4,800058e0 <_ZL11workerBodyAPv+0x20>
    80005908:	00170713          	addi	a4,a4,1
    8000590c:	ff1ff06f          	j	800058fc <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005910:	00190913          	addi	s2,s2,1
    80005914:	00900793          	li	a5,9
    80005918:	0527e063          	bltu	a5,s2,80005958 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000591c:	00003517          	auipc	a0,0x3
    80005920:	8fc50513          	addi	a0,a0,-1796 # 80008218 <CONSOLE_STATUS+0x208>
    80005924:	fffff097          	auipc	ra,0xfffff
    80005928:	36c080e7          	jalr	876(ra) # 80004c90 <_Z11printStringPKc>
    8000592c:	00000613          	li	a2,0
    80005930:	00a00593          	li	a1,10
    80005934:	0009051b          	sext.w	a0,s2
    80005938:	fffff097          	auipc	ra,0xfffff
    8000593c:	508080e7          	jalr	1288(ra) # 80004e40 <_Z8printIntiii>
    80005940:	00003517          	auipc	a0,0x3
    80005944:	b5850513          	addi	a0,a0,-1192 # 80008498 <CONSOLE_STATUS+0x488>
    80005948:	fffff097          	auipc	ra,0xfffff
    8000594c:	348080e7          	jalr	840(ra) # 80004c90 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005950:	00000493          	li	s1,0
    80005954:	f99ff06f          	j	800058ec <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005958:	00003517          	auipc	a0,0x3
    8000595c:	8c850513          	addi	a0,a0,-1848 # 80008220 <CONSOLE_STATUS+0x210>
    80005960:	fffff097          	auipc	ra,0xfffff
    80005964:	330080e7          	jalr	816(ra) # 80004c90 <_Z11printStringPKc>
    finishedA = true;
    80005968:	00100793          	li	a5,1
    8000596c:	00005717          	auipc	a4,0x5
    80005970:	b8f703a3          	sb	a5,-1145(a4) # 8000a4f3 <_ZL9finishedA>
}
    80005974:	01813083          	ld	ra,24(sp)
    80005978:	01013403          	ld	s0,16(sp)
    8000597c:	00813483          	ld	s1,8(sp)
    80005980:	00013903          	ld	s2,0(sp)
    80005984:	02010113          	addi	sp,sp,32
    80005988:	00008067          	ret

000000008000598c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000598c:	fd010113          	addi	sp,sp,-48
    80005990:	02113423          	sd	ra,40(sp)
    80005994:	02813023          	sd	s0,32(sp)
    80005998:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000599c:	00000613          	li	a2,0
    800059a0:	00000597          	auipc	a1,0x0
    800059a4:	f2058593          	addi	a1,a1,-224 # 800058c0 <_ZL11workerBodyAPv>
    800059a8:	fd040513          	addi	a0,s0,-48
    800059ac:	ffffc097          	auipc	ra,0xffffc
    800059b0:	cf8080e7          	jalr	-776(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    800059b4:	00003517          	auipc	a0,0x3
    800059b8:	8fc50513          	addi	a0,a0,-1796 # 800082b0 <CONSOLE_STATUS+0x2a0>
    800059bc:	fffff097          	auipc	ra,0xfffff
    800059c0:	2d4080e7          	jalr	724(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800059c4:	00000613          	li	a2,0
    800059c8:	00000597          	auipc	a1,0x0
    800059cc:	e1458593          	addi	a1,a1,-492 # 800057dc <_ZL11workerBodyBPv>
    800059d0:	fd840513          	addi	a0,s0,-40
    800059d4:	ffffc097          	auipc	ra,0xffffc
    800059d8:	cd0080e7          	jalr	-816(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800059dc:	00003517          	auipc	a0,0x3
    800059e0:	8ec50513          	addi	a0,a0,-1812 # 800082c8 <CONSOLE_STATUS+0x2b8>
    800059e4:	fffff097          	auipc	ra,0xfffff
    800059e8:	2ac080e7          	jalr	684(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800059ec:	00000613          	li	a2,0
    800059f0:	00000597          	auipc	a1,0x0
    800059f4:	c6c58593          	addi	a1,a1,-916 # 8000565c <_ZL11workerBodyCPv>
    800059f8:	fe040513          	addi	a0,s0,-32
    800059fc:	ffffc097          	auipc	ra,0xffffc
    80005a00:	ca8080e7          	jalr	-856(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005a04:	00003517          	auipc	a0,0x3
    80005a08:	8dc50513          	addi	a0,a0,-1828 # 800082e0 <CONSOLE_STATUS+0x2d0>
    80005a0c:	fffff097          	auipc	ra,0xfffff
    80005a10:	284080e7          	jalr	644(ra) # 80004c90 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005a14:	00000613          	li	a2,0
    80005a18:	00000597          	auipc	a1,0x0
    80005a1c:	afc58593          	addi	a1,a1,-1284 # 80005514 <_ZL11workerBodyDPv>
    80005a20:	fe840513          	addi	a0,s0,-24
    80005a24:	ffffc097          	auipc	ra,0xffffc
    80005a28:	c80080e7          	jalr	-896(ra) # 800016a4 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005a2c:	00003517          	auipc	a0,0x3
    80005a30:	8cc50513          	addi	a0,a0,-1844 # 800082f8 <CONSOLE_STATUS+0x2e8>
    80005a34:	fffff097          	auipc	ra,0xfffff
    80005a38:	25c080e7          	jalr	604(ra) # 80004c90 <_Z11printStringPKc>
    80005a3c:	00c0006f          	j	80005a48 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005a40:	ffffc097          	auipc	ra,0xffffc
    80005a44:	d84080e7          	jalr	-636(ra) # 800017c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005a48:	00005797          	auipc	a5,0x5
    80005a4c:	aab7c783          	lbu	a5,-1365(a5) # 8000a4f3 <_ZL9finishedA>
    80005a50:	fe0788e3          	beqz	a5,80005a40 <_Z16System_Mode_testv+0xb4>
    80005a54:	00005797          	auipc	a5,0x5
    80005a58:	a9e7c783          	lbu	a5,-1378(a5) # 8000a4f2 <_ZL9finishedB>
    80005a5c:	fe0782e3          	beqz	a5,80005a40 <_Z16System_Mode_testv+0xb4>
    80005a60:	00005797          	auipc	a5,0x5
    80005a64:	a917c783          	lbu	a5,-1391(a5) # 8000a4f1 <_ZL9finishedC>
    80005a68:	fc078ce3          	beqz	a5,80005a40 <_Z16System_Mode_testv+0xb4>
    80005a6c:	00005797          	auipc	a5,0x5
    80005a70:	a847c783          	lbu	a5,-1404(a5) # 8000a4f0 <_ZL9finishedD>
    80005a74:	fc0786e3          	beqz	a5,80005a40 <_Z16System_Mode_testv+0xb4>
    }

}
    80005a78:	02813083          	ld	ra,40(sp)
    80005a7c:	02013403          	ld	s0,32(sp)
    80005a80:	03010113          	addi	sp,sp,48
    80005a84:	00008067          	ret

0000000080005a88 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005a88:	fe010113          	addi	sp,sp,-32
    80005a8c:	00113c23          	sd	ra,24(sp)
    80005a90:	00813823          	sd	s0,16(sp)
    80005a94:	00913423          	sd	s1,8(sp)
    80005a98:	01213023          	sd	s2,0(sp)
    80005a9c:	02010413          	addi	s0,sp,32
    80005aa0:	00050493          	mv	s1,a0
    80005aa4:	00058913          	mv	s2,a1
    80005aa8:	0015879b          	addiw	a5,a1,1
    80005aac:	0007851b          	sext.w	a0,a5
    80005ab0:	00f4a023          	sw	a5,0(s1)
    80005ab4:	0004a823          	sw	zero,16(s1)
    80005ab8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005abc:	00251513          	slli	a0,a0,0x2
    80005ac0:	ffffc097          	auipc	ra,0xffffc
    80005ac4:	bac080e7          	jalr	-1108(ra) # 8000166c <_Z9mem_allocm>
    80005ac8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005acc:	00000593          	li	a1,0
    80005ad0:	02048513          	addi	a0,s1,32
    80005ad4:	ffffc097          	auipc	ra,0xffffc
    80005ad8:	e30080e7          	jalr	-464(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
    sem_open(&spaceAvailable, _cap);
    80005adc:	00090593          	mv	a1,s2
    80005ae0:	01848513          	addi	a0,s1,24
    80005ae4:	ffffc097          	auipc	ra,0xffffc
    80005ae8:	e20080e7          	jalr	-480(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexHead, 1);
    80005aec:	00100593          	li	a1,1
    80005af0:	02848513          	addi	a0,s1,40
    80005af4:	ffffc097          	auipc	ra,0xffffc
    80005af8:	e10080e7          	jalr	-496(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexTail, 1);
    80005afc:	00100593          	li	a1,1
    80005b00:	03048513          	addi	a0,s1,48
    80005b04:	ffffc097          	auipc	ra,0xffffc
    80005b08:	e00080e7          	jalr	-512(ra) # 80001904 <_Z8sem_openPP10MojSemaforj>
}
    80005b0c:	01813083          	ld	ra,24(sp)
    80005b10:	01013403          	ld	s0,16(sp)
    80005b14:	00813483          	ld	s1,8(sp)
    80005b18:	00013903          	ld	s2,0(sp)
    80005b1c:	02010113          	addi	sp,sp,32
    80005b20:	00008067          	ret

0000000080005b24 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005b24:	fe010113          	addi	sp,sp,-32
    80005b28:	00113c23          	sd	ra,24(sp)
    80005b2c:	00813823          	sd	s0,16(sp)
    80005b30:	00913423          	sd	s1,8(sp)
    80005b34:	01213023          	sd	s2,0(sp)
    80005b38:	02010413          	addi	s0,sp,32
    80005b3c:	00050493          	mv	s1,a0
    80005b40:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005b44:	01853503          	ld	a0,24(a0)
    80005b48:	ffffc097          	auipc	ra,0xffffc
    80005b4c:	cec080e7          	jalr	-788(ra) # 80001834 <_Z8sem_waitP10MojSemafor>

    sem_wait(mutexTail);
    80005b50:	0304b503          	ld	a0,48(s1)
    80005b54:	ffffc097          	auipc	ra,0xffffc
    80005b58:	ce0080e7          	jalr	-800(ra) # 80001834 <_Z8sem_waitP10MojSemafor>
    buffer[tail] = val;
    80005b5c:	0084b783          	ld	a5,8(s1)
    80005b60:	0144a703          	lw	a4,20(s1)
    80005b64:	00271713          	slli	a4,a4,0x2
    80005b68:	00e787b3          	add	a5,a5,a4
    80005b6c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005b70:	0144a783          	lw	a5,20(s1)
    80005b74:	0017879b          	addiw	a5,a5,1
    80005b78:	0004a703          	lw	a4,0(s1)
    80005b7c:	02e7e7bb          	remw	a5,a5,a4
    80005b80:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005b84:	0304b503          	ld	a0,48(s1)
    80005b88:	ffffc097          	auipc	ra,0xffffc
    80005b8c:	cd8080e7          	jalr	-808(ra) # 80001860 <_Z10sem_signalP10MojSemafor>

    sem_signal(itemAvailable);
    80005b90:	0204b503          	ld	a0,32(s1)
    80005b94:	ffffc097          	auipc	ra,0xffffc
    80005b98:	ccc080e7          	jalr	-820(ra) # 80001860 <_Z10sem_signalP10MojSemafor>

}
    80005b9c:	01813083          	ld	ra,24(sp)
    80005ba0:	01013403          	ld	s0,16(sp)
    80005ba4:	00813483          	ld	s1,8(sp)
    80005ba8:	00013903          	ld	s2,0(sp)
    80005bac:	02010113          	addi	sp,sp,32
    80005bb0:	00008067          	ret

0000000080005bb4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005bb4:	fe010113          	addi	sp,sp,-32
    80005bb8:	00113c23          	sd	ra,24(sp)
    80005bbc:	00813823          	sd	s0,16(sp)
    80005bc0:	00913423          	sd	s1,8(sp)
    80005bc4:	01213023          	sd	s2,0(sp)
    80005bc8:	02010413          	addi	s0,sp,32
    80005bcc:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80005bd0:	02053503          	ld	a0,32(a0)
    80005bd4:	ffffc097          	auipc	ra,0xffffc
    80005bd8:	c60080e7          	jalr	-928(ra) # 80001834 <_Z8sem_waitP10MojSemafor>

    sem_wait(mutexHead);
    80005bdc:	0284b503          	ld	a0,40(s1)
    80005be0:	ffffc097          	auipc	ra,0xffffc
    80005be4:	c54080e7          	jalr	-940(ra) # 80001834 <_Z8sem_waitP10MojSemafor>

    int ret = buffer[head];
    80005be8:	0084b703          	ld	a4,8(s1)
    80005bec:	0104a783          	lw	a5,16(s1)
    80005bf0:	00279693          	slli	a3,a5,0x2
    80005bf4:	00d70733          	add	a4,a4,a3
    80005bf8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005bfc:	0017879b          	addiw	a5,a5,1
    80005c00:	0004a703          	lw	a4,0(s1)
    80005c04:	02e7e7bb          	remw	a5,a5,a4
    80005c08:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005c0c:	0284b503          	ld	a0,40(s1)
    80005c10:	ffffc097          	auipc	ra,0xffffc
    80005c14:	c50080e7          	jalr	-944(ra) # 80001860 <_Z10sem_signalP10MojSemafor>

    sem_signal(spaceAvailable);
    80005c18:	0184b503          	ld	a0,24(s1)
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	c44080e7          	jalr	-956(ra) # 80001860 <_Z10sem_signalP10MojSemafor>

    return ret;
}
    80005c24:	00090513          	mv	a0,s2
    80005c28:	01813083          	ld	ra,24(sp)
    80005c2c:	01013403          	ld	s0,16(sp)
    80005c30:	00813483          	ld	s1,8(sp)
    80005c34:	00013903          	ld	s2,0(sp)
    80005c38:	02010113          	addi	sp,sp,32
    80005c3c:	00008067          	ret

0000000080005c40 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005c40:	fe010113          	addi	sp,sp,-32
    80005c44:	00113c23          	sd	ra,24(sp)
    80005c48:	00813823          	sd	s0,16(sp)
    80005c4c:	00913423          	sd	s1,8(sp)
    80005c50:	01213023          	sd	s2,0(sp)
    80005c54:	02010413          	addi	s0,sp,32
    80005c58:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005c5c:	02853503          	ld	a0,40(a0)
    80005c60:	ffffc097          	auipc	ra,0xffffc
    80005c64:	bd4080e7          	jalr	-1068(ra) # 80001834 <_Z8sem_waitP10MojSemafor>
    sem_wait(mutexTail);
    80005c68:	0304b503          	ld	a0,48(s1)
    80005c6c:	ffffc097          	auipc	ra,0xffffc
    80005c70:	bc8080e7          	jalr	-1080(ra) # 80001834 <_Z8sem_waitP10MojSemafor>

    if (tail >= head) {
    80005c74:	0144a783          	lw	a5,20(s1)
    80005c78:	0104a903          	lw	s2,16(s1)
    80005c7c:	0327ce63          	blt	a5,s2,80005cb8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005c80:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005c84:	0304b503          	ld	a0,48(s1)
    80005c88:	ffffc097          	auipc	ra,0xffffc
    80005c8c:	bd8080e7          	jalr	-1064(ra) # 80001860 <_Z10sem_signalP10MojSemafor>
    sem_signal(mutexHead);
    80005c90:	0284b503          	ld	a0,40(s1)
    80005c94:	ffffc097          	auipc	ra,0xffffc
    80005c98:	bcc080e7          	jalr	-1076(ra) # 80001860 <_Z10sem_signalP10MojSemafor>

    return ret;
}
    80005c9c:	00090513          	mv	a0,s2
    80005ca0:	01813083          	ld	ra,24(sp)
    80005ca4:	01013403          	ld	s0,16(sp)
    80005ca8:	00813483          	ld	s1,8(sp)
    80005cac:	00013903          	ld	s2,0(sp)
    80005cb0:	02010113          	addi	sp,sp,32
    80005cb4:	00008067          	ret
        ret = cap - head + tail;
    80005cb8:	0004a703          	lw	a4,0(s1)
    80005cbc:	4127093b          	subw	s2,a4,s2
    80005cc0:	00f9093b          	addw	s2,s2,a5
    80005cc4:	fc1ff06f          	j	80005c84 <_ZN6Buffer6getCntEv+0x44>

0000000080005cc8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80005cc8:	fe010113          	addi	sp,sp,-32
    80005ccc:	00113c23          	sd	ra,24(sp)
    80005cd0:	00813823          	sd	s0,16(sp)
    80005cd4:	00913423          	sd	s1,8(sp)
    80005cd8:	02010413          	addi	s0,sp,32
    80005cdc:	00050493          	mv	s1,a0
    putc('\n');
    80005ce0:	00a00513          	li	a0,10
    80005ce4:	ffffc097          	auipc	ra,0xffffc
    80005ce8:	bfc080e7          	jalr	-1028(ra) # 800018e0 <_Z4putcc>
    printString("Buffer deleted!\n");
    80005cec:	00002517          	auipc	a0,0x2
    80005cf0:	62450513          	addi	a0,a0,1572 # 80008310 <CONSOLE_STATUS+0x300>
    80005cf4:	fffff097          	auipc	ra,0xfffff
    80005cf8:	f9c080e7          	jalr	-100(ra) # 80004c90 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005cfc:	00048513          	mv	a0,s1
    80005d00:	00000097          	auipc	ra,0x0
    80005d04:	f40080e7          	jalr	-192(ra) # 80005c40 <_ZN6Buffer6getCntEv>
    80005d08:	02a05c63          	blez	a0,80005d40 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005d0c:	0084b783          	ld	a5,8(s1)
    80005d10:	0104a703          	lw	a4,16(s1)
    80005d14:	00271713          	slli	a4,a4,0x2
    80005d18:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005d1c:	0007c503          	lbu	a0,0(a5)
    80005d20:	ffffc097          	auipc	ra,0xffffc
    80005d24:	bc0080e7          	jalr	-1088(ra) # 800018e0 <_Z4putcc>
        head = (head + 1) % cap;
    80005d28:	0104a783          	lw	a5,16(s1)
    80005d2c:	0017879b          	addiw	a5,a5,1
    80005d30:	0004a703          	lw	a4,0(s1)
    80005d34:	02e7e7bb          	remw	a5,a5,a4
    80005d38:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005d3c:	fc1ff06f          	j	80005cfc <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005d40:	02100513          	li	a0,33
    80005d44:	ffffc097          	auipc	ra,0xffffc
    80005d48:	b9c080e7          	jalr	-1124(ra) # 800018e0 <_Z4putcc>
    putc('\n');
    80005d4c:	00a00513          	li	a0,10
    80005d50:	ffffc097          	auipc	ra,0xffffc
    80005d54:	b90080e7          	jalr	-1136(ra) # 800018e0 <_Z4putcc>
    mem_free(buffer);
    80005d58:	0084b503          	ld	a0,8(s1)
    80005d5c:	ffffc097          	auipc	ra,0xffffc
    80005d60:	8e4080e7          	jalr	-1820(ra) # 80001640 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005d64:	0204b503          	ld	a0,32(s1)
    80005d68:	ffffc097          	auipc	ra,0xffffc
    80005d6c:	aa0080e7          	jalr	-1376(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
    sem_close(spaceAvailable);
    80005d70:	0184b503          	ld	a0,24(s1)
    80005d74:	ffffc097          	auipc	ra,0xffffc
    80005d78:	a94080e7          	jalr	-1388(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexTail);
    80005d7c:	0304b503          	ld	a0,48(s1)
    80005d80:	ffffc097          	auipc	ra,0xffffc
    80005d84:	a88080e7          	jalr	-1400(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexHead);
    80005d88:	0284b503          	ld	a0,40(s1)
    80005d8c:	ffffc097          	auipc	ra,0xffffc
    80005d90:	a7c080e7          	jalr	-1412(ra) # 80001808 <_Z9sem_closeP10MojSemafor>
}
    80005d94:	01813083          	ld	ra,24(sp)
    80005d98:	01013403          	ld	s0,16(sp)
    80005d9c:	00813483          	ld	s1,8(sp)
    80005da0:	02010113          	addi	sp,sp,32
    80005da4:	00008067          	ret

0000000080005da8 <start>:
    80005da8:	ff010113          	addi	sp,sp,-16
    80005dac:	00813423          	sd	s0,8(sp)
    80005db0:	01010413          	addi	s0,sp,16
    80005db4:	300027f3          	csrr	a5,mstatus
    80005db8:	ffffe737          	lui	a4,0xffffe
    80005dbc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff309f>
    80005dc0:	00e7f7b3          	and	a5,a5,a4
    80005dc4:	00001737          	lui	a4,0x1
    80005dc8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005dcc:	00e7e7b3          	or	a5,a5,a4
    80005dd0:	30079073          	csrw	mstatus,a5
    80005dd4:	00000797          	auipc	a5,0x0
    80005dd8:	16078793          	addi	a5,a5,352 # 80005f34 <system_main>
    80005ddc:	34179073          	csrw	mepc,a5
    80005de0:	00000793          	li	a5,0
    80005de4:	18079073          	csrw	satp,a5
    80005de8:	000107b7          	lui	a5,0x10
    80005dec:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005df0:	30279073          	csrw	medeleg,a5
    80005df4:	30379073          	csrw	mideleg,a5
    80005df8:	104027f3          	csrr	a5,sie
    80005dfc:	2227e793          	ori	a5,a5,546
    80005e00:	10479073          	csrw	sie,a5
    80005e04:	fff00793          	li	a5,-1
    80005e08:	00a7d793          	srli	a5,a5,0xa
    80005e0c:	3b079073          	csrw	pmpaddr0,a5
    80005e10:	00f00793          	li	a5,15
    80005e14:	3a079073          	csrw	pmpcfg0,a5
    80005e18:	f14027f3          	csrr	a5,mhartid
    80005e1c:	0200c737          	lui	a4,0x200c
    80005e20:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005e24:	0007869b          	sext.w	a3,a5
    80005e28:	00269713          	slli	a4,a3,0x2
    80005e2c:	000f4637          	lui	a2,0xf4
    80005e30:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005e34:	00d70733          	add	a4,a4,a3
    80005e38:	0037979b          	slliw	a5,a5,0x3
    80005e3c:	020046b7          	lui	a3,0x2004
    80005e40:	00d787b3          	add	a5,a5,a3
    80005e44:	00c585b3          	add	a1,a1,a2
    80005e48:	00371693          	slli	a3,a4,0x3
    80005e4c:	00004717          	auipc	a4,0x4
    80005e50:	6b470713          	addi	a4,a4,1716 # 8000a500 <timer_scratch>
    80005e54:	00b7b023          	sd	a1,0(a5)
    80005e58:	00d70733          	add	a4,a4,a3
    80005e5c:	00f73c23          	sd	a5,24(a4)
    80005e60:	02c73023          	sd	a2,32(a4)
    80005e64:	34071073          	csrw	mscratch,a4
    80005e68:	00000797          	auipc	a5,0x0
    80005e6c:	6e878793          	addi	a5,a5,1768 # 80006550 <timervec>
    80005e70:	30579073          	csrw	mtvec,a5
    80005e74:	300027f3          	csrr	a5,mstatus
    80005e78:	0087e793          	ori	a5,a5,8
    80005e7c:	30079073          	csrw	mstatus,a5
    80005e80:	304027f3          	csrr	a5,mie
    80005e84:	0807e793          	ori	a5,a5,128
    80005e88:	30479073          	csrw	mie,a5
    80005e8c:	f14027f3          	csrr	a5,mhartid
    80005e90:	0007879b          	sext.w	a5,a5
    80005e94:	00078213          	mv	tp,a5
    80005e98:	30200073          	mret
    80005e9c:	00813403          	ld	s0,8(sp)
    80005ea0:	01010113          	addi	sp,sp,16
    80005ea4:	00008067          	ret

0000000080005ea8 <timerinit>:
    80005ea8:	ff010113          	addi	sp,sp,-16
    80005eac:	00813423          	sd	s0,8(sp)
    80005eb0:	01010413          	addi	s0,sp,16
    80005eb4:	f14027f3          	csrr	a5,mhartid
    80005eb8:	0200c737          	lui	a4,0x200c
    80005ebc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005ec0:	0007869b          	sext.w	a3,a5
    80005ec4:	00269713          	slli	a4,a3,0x2
    80005ec8:	000f4637          	lui	a2,0xf4
    80005ecc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005ed0:	00d70733          	add	a4,a4,a3
    80005ed4:	0037979b          	slliw	a5,a5,0x3
    80005ed8:	020046b7          	lui	a3,0x2004
    80005edc:	00d787b3          	add	a5,a5,a3
    80005ee0:	00c585b3          	add	a1,a1,a2
    80005ee4:	00371693          	slli	a3,a4,0x3
    80005ee8:	00004717          	auipc	a4,0x4
    80005eec:	61870713          	addi	a4,a4,1560 # 8000a500 <timer_scratch>
    80005ef0:	00b7b023          	sd	a1,0(a5)
    80005ef4:	00d70733          	add	a4,a4,a3
    80005ef8:	00f73c23          	sd	a5,24(a4)
    80005efc:	02c73023          	sd	a2,32(a4)
    80005f00:	34071073          	csrw	mscratch,a4
    80005f04:	00000797          	auipc	a5,0x0
    80005f08:	64c78793          	addi	a5,a5,1612 # 80006550 <timervec>
    80005f0c:	30579073          	csrw	mtvec,a5
    80005f10:	300027f3          	csrr	a5,mstatus
    80005f14:	0087e793          	ori	a5,a5,8
    80005f18:	30079073          	csrw	mstatus,a5
    80005f1c:	304027f3          	csrr	a5,mie
    80005f20:	0807e793          	ori	a5,a5,128
    80005f24:	30479073          	csrw	mie,a5
    80005f28:	00813403          	ld	s0,8(sp)
    80005f2c:	01010113          	addi	sp,sp,16
    80005f30:	00008067          	ret

0000000080005f34 <system_main>:
    80005f34:	fe010113          	addi	sp,sp,-32
    80005f38:	00813823          	sd	s0,16(sp)
    80005f3c:	00913423          	sd	s1,8(sp)
    80005f40:	00113c23          	sd	ra,24(sp)
    80005f44:	02010413          	addi	s0,sp,32
    80005f48:	00000097          	auipc	ra,0x0
    80005f4c:	0c4080e7          	jalr	196(ra) # 8000600c <cpuid>
    80005f50:	00004497          	auipc	s1,0x4
    80005f54:	4f048493          	addi	s1,s1,1264 # 8000a440 <started>
    80005f58:	02050263          	beqz	a0,80005f7c <system_main+0x48>
    80005f5c:	0004a783          	lw	a5,0(s1)
    80005f60:	0007879b          	sext.w	a5,a5
    80005f64:	fe078ce3          	beqz	a5,80005f5c <system_main+0x28>
    80005f68:	0ff0000f          	fence
    80005f6c:	00002517          	auipc	a0,0x2
    80005f70:	62450513          	addi	a0,a0,1572 # 80008590 <CONSOLE_STATUS+0x580>
    80005f74:	00001097          	auipc	ra,0x1
    80005f78:	a78080e7          	jalr	-1416(ra) # 800069ec <panic>
    80005f7c:	00001097          	auipc	ra,0x1
    80005f80:	9cc080e7          	jalr	-1588(ra) # 80006948 <consoleinit>
    80005f84:	00001097          	auipc	ra,0x1
    80005f88:	158080e7          	jalr	344(ra) # 800070dc <printfinit>
    80005f8c:	00002517          	auipc	a0,0x2
    80005f90:	50c50513          	addi	a0,a0,1292 # 80008498 <CONSOLE_STATUS+0x488>
    80005f94:	00001097          	auipc	ra,0x1
    80005f98:	ab4080e7          	jalr	-1356(ra) # 80006a48 <__printf>
    80005f9c:	00002517          	auipc	a0,0x2
    80005fa0:	5c450513          	addi	a0,a0,1476 # 80008560 <CONSOLE_STATUS+0x550>
    80005fa4:	00001097          	auipc	ra,0x1
    80005fa8:	aa4080e7          	jalr	-1372(ra) # 80006a48 <__printf>
    80005fac:	00002517          	auipc	a0,0x2
    80005fb0:	4ec50513          	addi	a0,a0,1260 # 80008498 <CONSOLE_STATUS+0x488>
    80005fb4:	00001097          	auipc	ra,0x1
    80005fb8:	a94080e7          	jalr	-1388(ra) # 80006a48 <__printf>
    80005fbc:	00001097          	auipc	ra,0x1
    80005fc0:	4ac080e7          	jalr	1196(ra) # 80007468 <kinit>
    80005fc4:	00000097          	auipc	ra,0x0
    80005fc8:	148080e7          	jalr	328(ra) # 8000610c <trapinit>
    80005fcc:	00000097          	auipc	ra,0x0
    80005fd0:	16c080e7          	jalr	364(ra) # 80006138 <trapinithart>
    80005fd4:	00000097          	auipc	ra,0x0
    80005fd8:	5bc080e7          	jalr	1468(ra) # 80006590 <plicinit>
    80005fdc:	00000097          	auipc	ra,0x0
    80005fe0:	5dc080e7          	jalr	1500(ra) # 800065b8 <plicinithart>
    80005fe4:	00000097          	auipc	ra,0x0
    80005fe8:	078080e7          	jalr	120(ra) # 8000605c <userinit>
    80005fec:	0ff0000f          	fence
    80005ff0:	00100793          	li	a5,1
    80005ff4:	00002517          	auipc	a0,0x2
    80005ff8:	58450513          	addi	a0,a0,1412 # 80008578 <CONSOLE_STATUS+0x568>
    80005ffc:	00f4a023          	sw	a5,0(s1)
    80006000:	00001097          	auipc	ra,0x1
    80006004:	a48080e7          	jalr	-1464(ra) # 80006a48 <__printf>
    80006008:	0000006f          	j	80006008 <system_main+0xd4>

000000008000600c <cpuid>:
    8000600c:	ff010113          	addi	sp,sp,-16
    80006010:	00813423          	sd	s0,8(sp)
    80006014:	01010413          	addi	s0,sp,16
    80006018:	00020513          	mv	a0,tp
    8000601c:	00813403          	ld	s0,8(sp)
    80006020:	0005051b          	sext.w	a0,a0
    80006024:	01010113          	addi	sp,sp,16
    80006028:	00008067          	ret

000000008000602c <mycpu>:
    8000602c:	ff010113          	addi	sp,sp,-16
    80006030:	00813423          	sd	s0,8(sp)
    80006034:	01010413          	addi	s0,sp,16
    80006038:	00020793          	mv	a5,tp
    8000603c:	00813403          	ld	s0,8(sp)
    80006040:	0007879b          	sext.w	a5,a5
    80006044:	00779793          	slli	a5,a5,0x7
    80006048:	00005517          	auipc	a0,0x5
    8000604c:	4e850513          	addi	a0,a0,1256 # 8000b530 <cpus>
    80006050:	00f50533          	add	a0,a0,a5
    80006054:	01010113          	addi	sp,sp,16
    80006058:	00008067          	ret

000000008000605c <userinit>:
    8000605c:	ff010113          	addi	sp,sp,-16
    80006060:	00813423          	sd	s0,8(sp)
    80006064:	01010413          	addi	s0,sp,16
    80006068:	00813403          	ld	s0,8(sp)
    8000606c:	01010113          	addi	sp,sp,16
    80006070:	ffffc317          	auipc	t1,0xffffc
    80006074:	b4830067          	jr	-1208(t1) # 80001bb8 <main>

0000000080006078 <either_copyout>:
    80006078:	ff010113          	addi	sp,sp,-16
    8000607c:	00813023          	sd	s0,0(sp)
    80006080:	00113423          	sd	ra,8(sp)
    80006084:	01010413          	addi	s0,sp,16
    80006088:	02051663          	bnez	a0,800060b4 <either_copyout+0x3c>
    8000608c:	00058513          	mv	a0,a1
    80006090:	00060593          	mv	a1,a2
    80006094:	0006861b          	sext.w	a2,a3
    80006098:	00002097          	auipc	ra,0x2
    8000609c:	c5c080e7          	jalr	-932(ra) # 80007cf4 <__memmove>
    800060a0:	00813083          	ld	ra,8(sp)
    800060a4:	00013403          	ld	s0,0(sp)
    800060a8:	00000513          	li	a0,0
    800060ac:	01010113          	addi	sp,sp,16
    800060b0:	00008067          	ret
    800060b4:	00002517          	auipc	a0,0x2
    800060b8:	50450513          	addi	a0,a0,1284 # 800085b8 <CONSOLE_STATUS+0x5a8>
    800060bc:	00001097          	auipc	ra,0x1
    800060c0:	930080e7          	jalr	-1744(ra) # 800069ec <panic>

00000000800060c4 <either_copyin>:
    800060c4:	ff010113          	addi	sp,sp,-16
    800060c8:	00813023          	sd	s0,0(sp)
    800060cc:	00113423          	sd	ra,8(sp)
    800060d0:	01010413          	addi	s0,sp,16
    800060d4:	02059463          	bnez	a1,800060fc <either_copyin+0x38>
    800060d8:	00060593          	mv	a1,a2
    800060dc:	0006861b          	sext.w	a2,a3
    800060e0:	00002097          	auipc	ra,0x2
    800060e4:	c14080e7          	jalr	-1004(ra) # 80007cf4 <__memmove>
    800060e8:	00813083          	ld	ra,8(sp)
    800060ec:	00013403          	ld	s0,0(sp)
    800060f0:	00000513          	li	a0,0
    800060f4:	01010113          	addi	sp,sp,16
    800060f8:	00008067          	ret
    800060fc:	00002517          	auipc	a0,0x2
    80006100:	4e450513          	addi	a0,a0,1252 # 800085e0 <CONSOLE_STATUS+0x5d0>
    80006104:	00001097          	auipc	ra,0x1
    80006108:	8e8080e7          	jalr	-1816(ra) # 800069ec <panic>

000000008000610c <trapinit>:
    8000610c:	ff010113          	addi	sp,sp,-16
    80006110:	00813423          	sd	s0,8(sp)
    80006114:	01010413          	addi	s0,sp,16
    80006118:	00813403          	ld	s0,8(sp)
    8000611c:	00002597          	auipc	a1,0x2
    80006120:	4ec58593          	addi	a1,a1,1260 # 80008608 <CONSOLE_STATUS+0x5f8>
    80006124:	00005517          	auipc	a0,0x5
    80006128:	48c50513          	addi	a0,a0,1164 # 8000b5b0 <tickslock>
    8000612c:	01010113          	addi	sp,sp,16
    80006130:	00001317          	auipc	t1,0x1
    80006134:	5c830067          	jr	1480(t1) # 800076f8 <initlock>

0000000080006138 <trapinithart>:
    80006138:	ff010113          	addi	sp,sp,-16
    8000613c:	00813423          	sd	s0,8(sp)
    80006140:	01010413          	addi	s0,sp,16
    80006144:	00000797          	auipc	a5,0x0
    80006148:	2fc78793          	addi	a5,a5,764 # 80006440 <kernelvec>
    8000614c:	10579073          	csrw	stvec,a5
    80006150:	00813403          	ld	s0,8(sp)
    80006154:	01010113          	addi	sp,sp,16
    80006158:	00008067          	ret

000000008000615c <usertrap>:
    8000615c:	ff010113          	addi	sp,sp,-16
    80006160:	00813423          	sd	s0,8(sp)
    80006164:	01010413          	addi	s0,sp,16
    80006168:	00813403          	ld	s0,8(sp)
    8000616c:	01010113          	addi	sp,sp,16
    80006170:	00008067          	ret

0000000080006174 <usertrapret>:
    80006174:	ff010113          	addi	sp,sp,-16
    80006178:	00813423          	sd	s0,8(sp)
    8000617c:	01010413          	addi	s0,sp,16
    80006180:	00813403          	ld	s0,8(sp)
    80006184:	01010113          	addi	sp,sp,16
    80006188:	00008067          	ret

000000008000618c <kerneltrap>:
    8000618c:	fe010113          	addi	sp,sp,-32
    80006190:	00813823          	sd	s0,16(sp)
    80006194:	00113c23          	sd	ra,24(sp)
    80006198:	00913423          	sd	s1,8(sp)
    8000619c:	02010413          	addi	s0,sp,32
    800061a0:	142025f3          	csrr	a1,scause
    800061a4:	100027f3          	csrr	a5,sstatus
    800061a8:	0027f793          	andi	a5,a5,2
    800061ac:	10079c63          	bnez	a5,800062c4 <kerneltrap+0x138>
    800061b0:	142027f3          	csrr	a5,scause
    800061b4:	0207ce63          	bltz	a5,800061f0 <kerneltrap+0x64>
    800061b8:	00002517          	auipc	a0,0x2
    800061bc:	49850513          	addi	a0,a0,1176 # 80008650 <CONSOLE_STATUS+0x640>
    800061c0:	00001097          	auipc	ra,0x1
    800061c4:	888080e7          	jalr	-1912(ra) # 80006a48 <__printf>
    800061c8:	141025f3          	csrr	a1,sepc
    800061cc:	14302673          	csrr	a2,stval
    800061d0:	00002517          	auipc	a0,0x2
    800061d4:	49050513          	addi	a0,a0,1168 # 80008660 <CONSOLE_STATUS+0x650>
    800061d8:	00001097          	auipc	ra,0x1
    800061dc:	870080e7          	jalr	-1936(ra) # 80006a48 <__printf>
    800061e0:	00002517          	auipc	a0,0x2
    800061e4:	49850513          	addi	a0,a0,1176 # 80008678 <CONSOLE_STATUS+0x668>
    800061e8:	00001097          	auipc	ra,0x1
    800061ec:	804080e7          	jalr	-2044(ra) # 800069ec <panic>
    800061f0:	0ff7f713          	andi	a4,a5,255
    800061f4:	00900693          	li	a3,9
    800061f8:	04d70063          	beq	a4,a3,80006238 <kerneltrap+0xac>
    800061fc:	fff00713          	li	a4,-1
    80006200:	03f71713          	slli	a4,a4,0x3f
    80006204:	00170713          	addi	a4,a4,1
    80006208:	fae798e3          	bne	a5,a4,800061b8 <kerneltrap+0x2c>
    8000620c:	00000097          	auipc	ra,0x0
    80006210:	e00080e7          	jalr	-512(ra) # 8000600c <cpuid>
    80006214:	06050663          	beqz	a0,80006280 <kerneltrap+0xf4>
    80006218:	144027f3          	csrr	a5,sip
    8000621c:	ffd7f793          	andi	a5,a5,-3
    80006220:	14479073          	csrw	sip,a5
    80006224:	01813083          	ld	ra,24(sp)
    80006228:	01013403          	ld	s0,16(sp)
    8000622c:	00813483          	ld	s1,8(sp)
    80006230:	02010113          	addi	sp,sp,32
    80006234:	00008067          	ret
    80006238:	00000097          	auipc	ra,0x0
    8000623c:	3cc080e7          	jalr	972(ra) # 80006604 <plic_claim>
    80006240:	00a00793          	li	a5,10
    80006244:	00050493          	mv	s1,a0
    80006248:	06f50863          	beq	a0,a5,800062b8 <kerneltrap+0x12c>
    8000624c:	fc050ce3          	beqz	a0,80006224 <kerneltrap+0x98>
    80006250:	00050593          	mv	a1,a0
    80006254:	00002517          	auipc	a0,0x2
    80006258:	3dc50513          	addi	a0,a0,988 # 80008630 <CONSOLE_STATUS+0x620>
    8000625c:	00000097          	auipc	ra,0x0
    80006260:	7ec080e7          	jalr	2028(ra) # 80006a48 <__printf>
    80006264:	01013403          	ld	s0,16(sp)
    80006268:	01813083          	ld	ra,24(sp)
    8000626c:	00048513          	mv	a0,s1
    80006270:	00813483          	ld	s1,8(sp)
    80006274:	02010113          	addi	sp,sp,32
    80006278:	00000317          	auipc	t1,0x0
    8000627c:	3c430067          	jr	964(t1) # 8000663c <plic_complete>
    80006280:	00005517          	auipc	a0,0x5
    80006284:	33050513          	addi	a0,a0,816 # 8000b5b0 <tickslock>
    80006288:	00001097          	auipc	ra,0x1
    8000628c:	494080e7          	jalr	1172(ra) # 8000771c <acquire>
    80006290:	00004717          	auipc	a4,0x4
    80006294:	1b470713          	addi	a4,a4,436 # 8000a444 <ticks>
    80006298:	00072783          	lw	a5,0(a4)
    8000629c:	00005517          	auipc	a0,0x5
    800062a0:	31450513          	addi	a0,a0,788 # 8000b5b0 <tickslock>
    800062a4:	0017879b          	addiw	a5,a5,1
    800062a8:	00f72023          	sw	a5,0(a4)
    800062ac:	00001097          	auipc	ra,0x1
    800062b0:	53c080e7          	jalr	1340(ra) # 800077e8 <release>
    800062b4:	f65ff06f          	j	80006218 <kerneltrap+0x8c>
    800062b8:	00001097          	auipc	ra,0x1
    800062bc:	098080e7          	jalr	152(ra) # 80007350 <uartintr>
    800062c0:	fa5ff06f          	j	80006264 <kerneltrap+0xd8>
    800062c4:	00002517          	auipc	a0,0x2
    800062c8:	34c50513          	addi	a0,a0,844 # 80008610 <CONSOLE_STATUS+0x600>
    800062cc:	00000097          	auipc	ra,0x0
    800062d0:	720080e7          	jalr	1824(ra) # 800069ec <panic>

00000000800062d4 <clockintr>:
    800062d4:	fe010113          	addi	sp,sp,-32
    800062d8:	00813823          	sd	s0,16(sp)
    800062dc:	00913423          	sd	s1,8(sp)
    800062e0:	00113c23          	sd	ra,24(sp)
    800062e4:	02010413          	addi	s0,sp,32
    800062e8:	00005497          	auipc	s1,0x5
    800062ec:	2c848493          	addi	s1,s1,712 # 8000b5b0 <tickslock>
    800062f0:	00048513          	mv	a0,s1
    800062f4:	00001097          	auipc	ra,0x1
    800062f8:	428080e7          	jalr	1064(ra) # 8000771c <acquire>
    800062fc:	00004717          	auipc	a4,0x4
    80006300:	14870713          	addi	a4,a4,328 # 8000a444 <ticks>
    80006304:	00072783          	lw	a5,0(a4)
    80006308:	01013403          	ld	s0,16(sp)
    8000630c:	01813083          	ld	ra,24(sp)
    80006310:	00048513          	mv	a0,s1
    80006314:	0017879b          	addiw	a5,a5,1
    80006318:	00813483          	ld	s1,8(sp)
    8000631c:	00f72023          	sw	a5,0(a4)
    80006320:	02010113          	addi	sp,sp,32
    80006324:	00001317          	auipc	t1,0x1
    80006328:	4c430067          	jr	1220(t1) # 800077e8 <release>

000000008000632c <devintr>:
    8000632c:	142027f3          	csrr	a5,scause
    80006330:	00000513          	li	a0,0
    80006334:	0007c463          	bltz	a5,8000633c <devintr+0x10>
    80006338:	00008067          	ret
    8000633c:	fe010113          	addi	sp,sp,-32
    80006340:	00813823          	sd	s0,16(sp)
    80006344:	00113c23          	sd	ra,24(sp)
    80006348:	00913423          	sd	s1,8(sp)
    8000634c:	02010413          	addi	s0,sp,32
    80006350:	0ff7f713          	andi	a4,a5,255
    80006354:	00900693          	li	a3,9
    80006358:	04d70c63          	beq	a4,a3,800063b0 <devintr+0x84>
    8000635c:	fff00713          	li	a4,-1
    80006360:	03f71713          	slli	a4,a4,0x3f
    80006364:	00170713          	addi	a4,a4,1
    80006368:	00e78c63          	beq	a5,a4,80006380 <devintr+0x54>
    8000636c:	01813083          	ld	ra,24(sp)
    80006370:	01013403          	ld	s0,16(sp)
    80006374:	00813483          	ld	s1,8(sp)
    80006378:	02010113          	addi	sp,sp,32
    8000637c:	00008067          	ret
    80006380:	00000097          	auipc	ra,0x0
    80006384:	c8c080e7          	jalr	-884(ra) # 8000600c <cpuid>
    80006388:	06050663          	beqz	a0,800063f4 <devintr+0xc8>
    8000638c:	144027f3          	csrr	a5,sip
    80006390:	ffd7f793          	andi	a5,a5,-3
    80006394:	14479073          	csrw	sip,a5
    80006398:	01813083          	ld	ra,24(sp)
    8000639c:	01013403          	ld	s0,16(sp)
    800063a0:	00813483          	ld	s1,8(sp)
    800063a4:	00200513          	li	a0,2
    800063a8:	02010113          	addi	sp,sp,32
    800063ac:	00008067          	ret
    800063b0:	00000097          	auipc	ra,0x0
    800063b4:	254080e7          	jalr	596(ra) # 80006604 <plic_claim>
    800063b8:	00a00793          	li	a5,10
    800063bc:	00050493          	mv	s1,a0
    800063c0:	06f50663          	beq	a0,a5,8000642c <devintr+0x100>
    800063c4:	00100513          	li	a0,1
    800063c8:	fa0482e3          	beqz	s1,8000636c <devintr+0x40>
    800063cc:	00048593          	mv	a1,s1
    800063d0:	00002517          	auipc	a0,0x2
    800063d4:	26050513          	addi	a0,a0,608 # 80008630 <CONSOLE_STATUS+0x620>
    800063d8:	00000097          	auipc	ra,0x0
    800063dc:	670080e7          	jalr	1648(ra) # 80006a48 <__printf>
    800063e0:	00048513          	mv	a0,s1
    800063e4:	00000097          	auipc	ra,0x0
    800063e8:	258080e7          	jalr	600(ra) # 8000663c <plic_complete>
    800063ec:	00100513          	li	a0,1
    800063f0:	f7dff06f          	j	8000636c <devintr+0x40>
    800063f4:	00005517          	auipc	a0,0x5
    800063f8:	1bc50513          	addi	a0,a0,444 # 8000b5b0 <tickslock>
    800063fc:	00001097          	auipc	ra,0x1
    80006400:	320080e7          	jalr	800(ra) # 8000771c <acquire>
    80006404:	00004717          	auipc	a4,0x4
    80006408:	04070713          	addi	a4,a4,64 # 8000a444 <ticks>
    8000640c:	00072783          	lw	a5,0(a4)
    80006410:	00005517          	auipc	a0,0x5
    80006414:	1a050513          	addi	a0,a0,416 # 8000b5b0 <tickslock>
    80006418:	0017879b          	addiw	a5,a5,1
    8000641c:	00f72023          	sw	a5,0(a4)
    80006420:	00001097          	auipc	ra,0x1
    80006424:	3c8080e7          	jalr	968(ra) # 800077e8 <release>
    80006428:	f65ff06f          	j	8000638c <devintr+0x60>
    8000642c:	00001097          	auipc	ra,0x1
    80006430:	f24080e7          	jalr	-220(ra) # 80007350 <uartintr>
    80006434:	fadff06f          	j	800063e0 <devintr+0xb4>
	...

0000000080006440 <kernelvec>:
    80006440:	f0010113          	addi	sp,sp,-256
    80006444:	00113023          	sd	ra,0(sp)
    80006448:	00213423          	sd	sp,8(sp)
    8000644c:	00313823          	sd	gp,16(sp)
    80006450:	00413c23          	sd	tp,24(sp)
    80006454:	02513023          	sd	t0,32(sp)
    80006458:	02613423          	sd	t1,40(sp)
    8000645c:	02713823          	sd	t2,48(sp)
    80006460:	02813c23          	sd	s0,56(sp)
    80006464:	04913023          	sd	s1,64(sp)
    80006468:	04a13423          	sd	a0,72(sp)
    8000646c:	04b13823          	sd	a1,80(sp)
    80006470:	04c13c23          	sd	a2,88(sp)
    80006474:	06d13023          	sd	a3,96(sp)
    80006478:	06e13423          	sd	a4,104(sp)
    8000647c:	06f13823          	sd	a5,112(sp)
    80006480:	07013c23          	sd	a6,120(sp)
    80006484:	09113023          	sd	a7,128(sp)
    80006488:	09213423          	sd	s2,136(sp)
    8000648c:	09313823          	sd	s3,144(sp)
    80006490:	09413c23          	sd	s4,152(sp)
    80006494:	0b513023          	sd	s5,160(sp)
    80006498:	0b613423          	sd	s6,168(sp)
    8000649c:	0b713823          	sd	s7,176(sp)
    800064a0:	0b813c23          	sd	s8,184(sp)
    800064a4:	0d913023          	sd	s9,192(sp)
    800064a8:	0da13423          	sd	s10,200(sp)
    800064ac:	0db13823          	sd	s11,208(sp)
    800064b0:	0dc13c23          	sd	t3,216(sp)
    800064b4:	0fd13023          	sd	t4,224(sp)
    800064b8:	0fe13423          	sd	t5,232(sp)
    800064bc:	0ff13823          	sd	t6,240(sp)
    800064c0:	ccdff0ef          	jal	ra,8000618c <kerneltrap>
    800064c4:	00013083          	ld	ra,0(sp)
    800064c8:	00813103          	ld	sp,8(sp)
    800064cc:	01013183          	ld	gp,16(sp)
    800064d0:	02013283          	ld	t0,32(sp)
    800064d4:	02813303          	ld	t1,40(sp)
    800064d8:	03013383          	ld	t2,48(sp)
    800064dc:	03813403          	ld	s0,56(sp)
    800064e0:	04013483          	ld	s1,64(sp)
    800064e4:	04813503          	ld	a0,72(sp)
    800064e8:	05013583          	ld	a1,80(sp)
    800064ec:	05813603          	ld	a2,88(sp)
    800064f0:	06013683          	ld	a3,96(sp)
    800064f4:	06813703          	ld	a4,104(sp)
    800064f8:	07013783          	ld	a5,112(sp)
    800064fc:	07813803          	ld	a6,120(sp)
    80006500:	08013883          	ld	a7,128(sp)
    80006504:	08813903          	ld	s2,136(sp)
    80006508:	09013983          	ld	s3,144(sp)
    8000650c:	09813a03          	ld	s4,152(sp)
    80006510:	0a013a83          	ld	s5,160(sp)
    80006514:	0a813b03          	ld	s6,168(sp)
    80006518:	0b013b83          	ld	s7,176(sp)
    8000651c:	0b813c03          	ld	s8,184(sp)
    80006520:	0c013c83          	ld	s9,192(sp)
    80006524:	0c813d03          	ld	s10,200(sp)
    80006528:	0d013d83          	ld	s11,208(sp)
    8000652c:	0d813e03          	ld	t3,216(sp)
    80006530:	0e013e83          	ld	t4,224(sp)
    80006534:	0e813f03          	ld	t5,232(sp)
    80006538:	0f013f83          	ld	t6,240(sp)
    8000653c:	10010113          	addi	sp,sp,256
    80006540:	10200073          	sret
    80006544:	00000013          	nop
    80006548:	00000013          	nop
    8000654c:	00000013          	nop

0000000080006550 <timervec>:
    80006550:	34051573          	csrrw	a0,mscratch,a0
    80006554:	00b53023          	sd	a1,0(a0)
    80006558:	00c53423          	sd	a2,8(a0)
    8000655c:	00d53823          	sd	a3,16(a0)
    80006560:	01853583          	ld	a1,24(a0)
    80006564:	02053603          	ld	a2,32(a0)
    80006568:	0005b683          	ld	a3,0(a1)
    8000656c:	00c686b3          	add	a3,a3,a2
    80006570:	00d5b023          	sd	a3,0(a1)
    80006574:	00200593          	li	a1,2
    80006578:	14459073          	csrw	sip,a1
    8000657c:	01053683          	ld	a3,16(a0)
    80006580:	00853603          	ld	a2,8(a0)
    80006584:	00053583          	ld	a1,0(a0)
    80006588:	34051573          	csrrw	a0,mscratch,a0
    8000658c:	30200073          	mret

0000000080006590 <plicinit>:
    80006590:	ff010113          	addi	sp,sp,-16
    80006594:	00813423          	sd	s0,8(sp)
    80006598:	01010413          	addi	s0,sp,16
    8000659c:	00813403          	ld	s0,8(sp)
    800065a0:	0c0007b7          	lui	a5,0xc000
    800065a4:	00100713          	li	a4,1
    800065a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800065ac:	00e7a223          	sw	a4,4(a5)
    800065b0:	01010113          	addi	sp,sp,16
    800065b4:	00008067          	ret

00000000800065b8 <plicinithart>:
    800065b8:	ff010113          	addi	sp,sp,-16
    800065bc:	00813023          	sd	s0,0(sp)
    800065c0:	00113423          	sd	ra,8(sp)
    800065c4:	01010413          	addi	s0,sp,16
    800065c8:	00000097          	auipc	ra,0x0
    800065cc:	a44080e7          	jalr	-1468(ra) # 8000600c <cpuid>
    800065d0:	0085171b          	slliw	a4,a0,0x8
    800065d4:	0c0027b7          	lui	a5,0xc002
    800065d8:	00e787b3          	add	a5,a5,a4
    800065dc:	40200713          	li	a4,1026
    800065e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800065e4:	00813083          	ld	ra,8(sp)
    800065e8:	00013403          	ld	s0,0(sp)
    800065ec:	00d5151b          	slliw	a0,a0,0xd
    800065f0:	0c2017b7          	lui	a5,0xc201
    800065f4:	00a78533          	add	a0,a5,a0
    800065f8:	00052023          	sw	zero,0(a0)
    800065fc:	01010113          	addi	sp,sp,16
    80006600:	00008067          	ret

0000000080006604 <plic_claim>:
    80006604:	ff010113          	addi	sp,sp,-16
    80006608:	00813023          	sd	s0,0(sp)
    8000660c:	00113423          	sd	ra,8(sp)
    80006610:	01010413          	addi	s0,sp,16
    80006614:	00000097          	auipc	ra,0x0
    80006618:	9f8080e7          	jalr	-1544(ra) # 8000600c <cpuid>
    8000661c:	00813083          	ld	ra,8(sp)
    80006620:	00013403          	ld	s0,0(sp)
    80006624:	00d5151b          	slliw	a0,a0,0xd
    80006628:	0c2017b7          	lui	a5,0xc201
    8000662c:	00a78533          	add	a0,a5,a0
    80006630:	00452503          	lw	a0,4(a0)
    80006634:	01010113          	addi	sp,sp,16
    80006638:	00008067          	ret

000000008000663c <plic_complete>:
    8000663c:	fe010113          	addi	sp,sp,-32
    80006640:	00813823          	sd	s0,16(sp)
    80006644:	00913423          	sd	s1,8(sp)
    80006648:	00113c23          	sd	ra,24(sp)
    8000664c:	02010413          	addi	s0,sp,32
    80006650:	00050493          	mv	s1,a0
    80006654:	00000097          	auipc	ra,0x0
    80006658:	9b8080e7          	jalr	-1608(ra) # 8000600c <cpuid>
    8000665c:	01813083          	ld	ra,24(sp)
    80006660:	01013403          	ld	s0,16(sp)
    80006664:	00d5179b          	slliw	a5,a0,0xd
    80006668:	0c201737          	lui	a4,0xc201
    8000666c:	00f707b3          	add	a5,a4,a5
    80006670:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006674:	00813483          	ld	s1,8(sp)
    80006678:	02010113          	addi	sp,sp,32
    8000667c:	00008067          	ret

0000000080006680 <consolewrite>:
    80006680:	fb010113          	addi	sp,sp,-80
    80006684:	04813023          	sd	s0,64(sp)
    80006688:	04113423          	sd	ra,72(sp)
    8000668c:	02913c23          	sd	s1,56(sp)
    80006690:	03213823          	sd	s2,48(sp)
    80006694:	03313423          	sd	s3,40(sp)
    80006698:	03413023          	sd	s4,32(sp)
    8000669c:	01513c23          	sd	s5,24(sp)
    800066a0:	05010413          	addi	s0,sp,80
    800066a4:	06c05c63          	blez	a2,8000671c <consolewrite+0x9c>
    800066a8:	00060993          	mv	s3,a2
    800066ac:	00050a13          	mv	s4,a0
    800066b0:	00058493          	mv	s1,a1
    800066b4:	00000913          	li	s2,0
    800066b8:	fff00a93          	li	s5,-1
    800066bc:	01c0006f          	j	800066d8 <consolewrite+0x58>
    800066c0:	fbf44503          	lbu	a0,-65(s0)
    800066c4:	0019091b          	addiw	s2,s2,1
    800066c8:	00148493          	addi	s1,s1,1
    800066cc:	00001097          	auipc	ra,0x1
    800066d0:	a9c080e7          	jalr	-1380(ra) # 80007168 <uartputc>
    800066d4:	03298063          	beq	s3,s2,800066f4 <consolewrite+0x74>
    800066d8:	00048613          	mv	a2,s1
    800066dc:	00100693          	li	a3,1
    800066e0:	000a0593          	mv	a1,s4
    800066e4:	fbf40513          	addi	a0,s0,-65
    800066e8:	00000097          	auipc	ra,0x0
    800066ec:	9dc080e7          	jalr	-1572(ra) # 800060c4 <either_copyin>
    800066f0:	fd5518e3          	bne	a0,s5,800066c0 <consolewrite+0x40>
    800066f4:	04813083          	ld	ra,72(sp)
    800066f8:	04013403          	ld	s0,64(sp)
    800066fc:	03813483          	ld	s1,56(sp)
    80006700:	02813983          	ld	s3,40(sp)
    80006704:	02013a03          	ld	s4,32(sp)
    80006708:	01813a83          	ld	s5,24(sp)
    8000670c:	00090513          	mv	a0,s2
    80006710:	03013903          	ld	s2,48(sp)
    80006714:	05010113          	addi	sp,sp,80
    80006718:	00008067          	ret
    8000671c:	00000913          	li	s2,0
    80006720:	fd5ff06f          	j	800066f4 <consolewrite+0x74>

0000000080006724 <consoleread>:
    80006724:	f9010113          	addi	sp,sp,-112
    80006728:	06813023          	sd	s0,96(sp)
    8000672c:	04913c23          	sd	s1,88(sp)
    80006730:	05213823          	sd	s2,80(sp)
    80006734:	05313423          	sd	s3,72(sp)
    80006738:	05413023          	sd	s4,64(sp)
    8000673c:	03513c23          	sd	s5,56(sp)
    80006740:	03613823          	sd	s6,48(sp)
    80006744:	03713423          	sd	s7,40(sp)
    80006748:	03813023          	sd	s8,32(sp)
    8000674c:	06113423          	sd	ra,104(sp)
    80006750:	01913c23          	sd	s9,24(sp)
    80006754:	07010413          	addi	s0,sp,112
    80006758:	00060b93          	mv	s7,a2
    8000675c:	00050913          	mv	s2,a0
    80006760:	00058c13          	mv	s8,a1
    80006764:	00060b1b          	sext.w	s6,a2
    80006768:	00005497          	auipc	s1,0x5
    8000676c:	e7048493          	addi	s1,s1,-400 # 8000b5d8 <cons>
    80006770:	00400993          	li	s3,4
    80006774:	fff00a13          	li	s4,-1
    80006778:	00a00a93          	li	s5,10
    8000677c:	05705e63          	blez	s7,800067d8 <consoleread+0xb4>
    80006780:	09c4a703          	lw	a4,156(s1)
    80006784:	0984a783          	lw	a5,152(s1)
    80006788:	0007071b          	sext.w	a4,a4
    8000678c:	08e78463          	beq	a5,a4,80006814 <consoleread+0xf0>
    80006790:	07f7f713          	andi	a4,a5,127
    80006794:	00e48733          	add	a4,s1,a4
    80006798:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000679c:	0017869b          	addiw	a3,a5,1
    800067a0:	08d4ac23          	sw	a3,152(s1)
    800067a4:	00070c9b          	sext.w	s9,a4
    800067a8:	0b370663          	beq	a4,s3,80006854 <consoleread+0x130>
    800067ac:	00100693          	li	a3,1
    800067b0:	f9f40613          	addi	a2,s0,-97
    800067b4:	000c0593          	mv	a1,s8
    800067b8:	00090513          	mv	a0,s2
    800067bc:	f8e40fa3          	sb	a4,-97(s0)
    800067c0:	00000097          	auipc	ra,0x0
    800067c4:	8b8080e7          	jalr	-1864(ra) # 80006078 <either_copyout>
    800067c8:	01450863          	beq	a0,s4,800067d8 <consoleread+0xb4>
    800067cc:	001c0c13          	addi	s8,s8,1
    800067d0:	fffb8b9b          	addiw	s7,s7,-1
    800067d4:	fb5c94e3          	bne	s9,s5,8000677c <consoleread+0x58>
    800067d8:	000b851b          	sext.w	a0,s7
    800067dc:	06813083          	ld	ra,104(sp)
    800067e0:	06013403          	ld	s0,96(sp)
    800067e4:	05813483          	ld	s1,88(sp)
    800067e8:	05013903          	ld	s2,80(sp)
    800067ec:	04813983          	ld	s3,72(sp)
    800067f0:	04013a03          	ld	s4,64(sp)
    800067f4:	03813a83          	ld	s5,56(sp)
    800067f8:	02813b83          	ld	s7,40(sp)
    800067fc:	02013c03          	ld	s8,32(sp)
    80006800:	01813c83          	ld	s9,24(sp)
    80006804:	40ab053b          	subw	a0,s6,a0
    80006808:	03013b03          	ld	s6,48(sp)
    8000680c:	07010113          	addi	sp,sp,112
    80006810:	00008067          	ret
    80006814:	00001097          	auipc	ra,0x1
    80006818:	1d8080e7          	jalr	472(ra) # 800079ec <push_on>
    8000681c:	0984a703          	lw	a4,152(s1)
    80006820:	09c4a783          	lw	a5,156(s1)
    80006824:	0007879b          	sext.w	a5,a5
    80006828:	fef70ce3          	beq	a4,a5,80006820 <consoleread+0xfc>
    8000682c:	00001097          	auipc	ra,0x1
    80006830:	234080e7          	jalr	564(ra) # 80007a60 <pop_on>
    80006834:	0984a783          	lw	a5,152(s1)
    80006838:	07f7f713          	andi	a4,a5,127
    8000683c:	00e48733          	add	a4,s1,a4
    80006840:	01874703          	lbu	a4,24(a4)
    80006844:	0017869b          	addiw	a3,a5,1
    80006848:	08d4ac23          	sw	a3,152(s1)
    8000684c:	00070c9b          	sext.w	s9,a4
    80006850:	f5371ee3          	bne	a4,s3,800067ac <consoleread+0x88>
    80006854:	000b851b          	sext.w	a0,s7
    80006858:	f96bf2e3          	bgeu	s7,s6,800067dc <consoleread+0xb8>
    8000685c:	08f4ac23          	sw	a5,152(s1)
    80006860:	f7dff06f          	j	800067dc <consoleread+0xb8>

0000000080006864 <consputc>:
    80006864:	10000793          	li	a5,256
    80006868:	00f50663          	beq	a0,a5,80006874 <consputc+0x10>
    8000686c:	00001317          	auipc	t1,0x1
    80006870:	9f430067          	jr	-1548(t1) # 80007260 <uartputc_sync>
    80006874:	ff010113          	addi	sp,sp,-16
    80006878:	00113423          	sd	ra,8(sp)
    8000687c:	00813023          	sd	s0,0(sp)
    80006880:	01010413          	addi	s0,sp,16
    80006884:	00800513          	li	a0,8
    80006888:	00001097          	auipc	ra,0x1
    8000688c:	9d8080e7          	jalr	-1576(ra) # 80007260 <uartputc_sync>
    80006890:	02000513          	li	a0,32
    80006894:	00001097          	auipc	ra,0x1
    80006898:	9cc080e7          	jalr	-1588(ra) # 80007260 <uartputc_sync>
    8000689c:	00013403          	ld	s0,0(sp)
    800068a0:	00813083          	ld	ra,8(sp)
    800068a4:	00800513          	li	a0,8
    800068a8:	01010113          	addi	sp,sp,16
    800068ac:	00001317          	auipc	t1,0x1
    800068b0:	9b430067          	jr	-1612(t1) # 80007260 <uartputc_sync>

00000000800068b4 <consoleintr>:
    800068b4:	fe010113          	addi	sp,sp,-32
    800068b8:	00813823          	sd	s0,16(sp)
    800068bc:	00913423          	sd	s1,8(sp)
    800068c0:	01213023          	sd	s2,0(sp)
    800068c4:	00113c23          	sd	ra,24(sp)
    800068c8:	02010413          	addi	s0,sp,32
    800068cc:	00005917          	auipc	s2,0x5
    800068d0:	d0c90913          	addi	s2,s2,-756 # 8000b5d8 <cons>
    800068d4:	00050493          	mv	s1,a0
    800068d8:	00090513          	mv	a0,s2
    800068dc:	00001097          	auipc	ra,0x1
    800068e0:	e40080e7          	jalr	-448(ra) # 8000771c <acquire>
    800068e4:	02048c63          	beqz	s1,8000691c <consoleintr+0x68>
    800068e8:	0a092783          	lw	a5,160(s2)
    800068ec:	09892703          	lw	a4,152(s2)
    800068f0:	07f00693          	li	a3,127
    800068f4:	40e7873b          	subw	a4,a5,a4
    800068f8:	02e6e263          	bltu	a3,a4,8000691c <consoleintr+0x68>
    800068fc:	00d00713          	li	a4,13
    80006900:	04e48063          	beq	s1,a4,80006940 <consoleintr+0x8c>
    80006904:	07f7f713          	andi	a4,a5,127
    80006908:	00e90733          	add	a4,s2,a4
    8000690c:	0017879b          	addiw	a5,a5,1
    80006910:	0af92023          	sw	a5,160(s2)
    80006914:	00970c23          	sb	s1,24(a4)
    80006918:	08f92e23          	sw	a5,156(s2)
    8000691c:	01013403          	ld	s0,16(sp)
    80006920:	01813083          	ld	ra,24(sp)
    80006924:	00813483          	ld	s1,8(sp)
    80006928:	00013903          	ld	s2,0(sp)
    8000692c:	00005517          	auipc	a0,0x5
    80006930:	cac50513          	addi	a0,a0,-852 # 8000b5d8 <cons>
    80006934:	02010113          	addi	sp,sp,32
    80006938:	00001317          	auipc	t1,0x1
    8000693c:	eb030067          	jr	-336(t1) # 800077e8 <release>
    80006940:	00a00493          	li	s1,10
    80006944:	fc1ff06f          	j	80006904 <consoleintr+0x50>

0000000080006948 <consoleinit>:
    80006948:	fe010113          	addi	sp,sp,-32
    8000694c:	00113c23          	sd	ra,24(sp)
    80006950:	00813823          	sd	s0,16(sp)
    80006954:	00913423          	sd	s1,8(sp)
    80006958:	02010413          	addi	s0,sp,32
    8000695c:	00005497          	auipc	s1,0x5
    80006960:	c7c48493          	addi	s1,s1,-900 # 8000b5d8 <cons>
    80006964:	00048513          	mv	a0,s1
    80006968:	00002597          	auipc	a1,0x2
    8000696c:	d2058593          	addi	a1,a1,-736 # 80008688 <CONSOLE_STATUS+0x678>
    80006970:	00001097          	auipc	ra,0x1
    80006974:	d88080e7          	jalr	-632(ra) # 800076f8 <initlock>
    80006978:	00000097          	auipc	ra,0x0
    8000697c:	7ac080e7          	jalr	1964(ra) # 80007124 <uartinit>
    80006980:	01813083          	ld	ra,24(sp)
    80006984:	01013403          	ld	s0,16(sp)
    80006988:	00000797          	auipc	a5,0x0
    8000698c:	d9c78793          	addi	a5,a5,-612 # 80006724 <consoleread>
    80006990:	0af4bc23          	sd	a5,184(s1)
    80006994:	00000797          	auipc	a5,0x0
    80006998:	cec78793          	addi	a5,a5,-788 # 80006680 <consolewrite>
    8000699c:	0cf4b023          	sd	a5,192(s1)
    800069a0:	00813483          	ld	s1,8(sp)
    800069a4:	02010113          	addi	sp,sp,32
    800069a8:	00008067          	ret

00000000800069ac <console_read>:
    800069ac:	ff010113          	addi	sp,sp,-16
    800069b0:	00813423          	sd	s0,8(sp)
    800069b4:	01010413          	addi	s0,sp,16
    800069b8:	00813403          	ld	s0,8(sp)
    800069bc:	00005317          	auipc	t1,0x5
    800069c0:	cd433303          	ld	t1,-812(t1) # 8000b690 <devsw+0x10>
    800069c4:	01010113          	addi	sp,sp,16
    800069c8:	00030067          	jr	t1

00000000800069cc <console_write>:
    800069cc:	ff010113          	addi	sp,sp,-16
    800069d0:	00813423          	sd	s0,8(sp)
    800069d4:	01010413          	addi	s0,sp,16
    800069d8:	00813403          	ld	s0,8(sp)
    800069dc:	00005317          	auipc	t1,0x5
    800069e0:	cbc33303          	ld	t1,-836(t1) # 8000b698 <devsw+0x18>
    800069e4:	01010113          	addi	sp,sp,16
    800069e8:	00030067          	jr	t1

00000000800069ec <panic>:
    800069ec:	fe010113          	addi	sp,sp,-32
    800069f0:	00113c23          	sd	ra,24(sp)
    800069f4:	00813823          	sd	s0,16(sp)
    800069f8:	00913423          	sd	s1,8(sp)
    800069fc:	02010413          	addi	s0,sp,32
    80006a00:	00050493          	mv	s1,a0
    80006a04:	00002517          	auipc	a0,0x2
    80006a08:	c8c50513          	addi	a0,a0,-884 # 80008690 <CONSOLE_STATUS+0x680>
    80006a0c:	00005797          	auipc	a5,0x5
    80006a10:	d207a623          	sw	zero,-724(a5) # 8000b738 <pr+0x18>
    80006a14:	00000097          	auipc	ra,0x0
    80006a18:	034080e7          	jalr	52(ra) # 80006a48 <__printf>
    80006a1c:	00048513          	mv	a0,s1
    80006a20:	00000097          	auipc	ra,0x0
    80006a24:	028080e7          	jalr	40(ra) # 80006a48 <__printf>
    80006a28:	00002517          	auipc	a0,0x2
    80006a2c:	a7050513          	addi	a0,a0,-1424 # 80008498 <CONSOLE_STATUS+0x488>
    80006a30:	00000097          	auipc	ra,0x0
    80006a34:	018080e7          	jalr	24(ra) # 80006a48 <__printf>
    80006a38:	00100793          	li	a5,1
    80006a3c:	00004717          	auipc	a4,0x4
    80006a40:	a0f72623          	sw	a5,-1524(a4) # 8000a448 <panicked>
    80006a44:	0000006f          	j	80006a44 <panic+0x58>

0000000080006a48 <__printf>:
    80006a48:	f3010113          	addi	sp,sp,-208
    80006a4c:	08813023          	sd	s0,128(sp)
    80006a50:	07313423          	sd	s3,104(sp)
    80006a54:	09010413          	addi	s0,sp,144
    80006a58:	05813023          	sd	s8,64(sp)
    80006a5c:	08113423          	sd	ra,136(sp)
    80006a60:	06913c23          	sd	s1,120(sp)
    80006a64:	07213823          	sd	s2,112(sp)
    80006a68:	07413023          	sd	s4,96(sp)
    80006a6c:	05513c23          	sd	s5,88(sp)
    80006a70:	05613823          	sd	s6,80(sp)
    80006a74:	05713423          	sd	s7,72(sp)
    80006a78:	03913c23          	sd	s9,56(sp)
    80006a7c:	03a13823          	sd	s10,48(sp)
    80006a80:	03b13423          	sd	s11,40(sp)
    80006a84:	00005317          	auipc	t1,0x5
    80006a88:	c9c30313          	addi	t1,t1,-868 # 8000b720 <pr>
    80006a8c:	01832c03          	lw	s8,24(t1)
    80006a90:	00b43423          	sd	a1,8(s0)
    80006a94:	00c43823          	sd	a2,16(s0)
    80006a98:	00d43c23          	sd	a3,24(s0)
    80006a9c:	02e43023          	sd	a4,32(s0)
    80006aa0:	02f43423          	sd	a5,40(s0)
    80006aa4:	03043823          	sd	a6,48(s0)
    80006aa8:	03143c23          	sd	a7,56(s0)
    80006aac:	00050993          	mv	s3,a0
    80006ab0:	4a0c1663          	bnez	s8,80006f5c <__printf+0x514>
    80006ab4:	60098c63          	beqz	s3,800070cc <__printf+0x684>
    80006ab8:	0009c503          	lbu	a0,0(s3)
    80006abc:	00840793          	addi	a5,s0,8
    80006ac0:	f6f43c23          	sd	a5,-136(s0)
    80006ac4:	00000493          	li	s1,0
    80006ac8:	22050063          	beqz	a0,80006ce8 <__printf+0x2a0>
    80006acc:	00002a37          	lui	s4,0x2
    80006ad0:	00018ab7          	lui	s5,0x18
    80006ad4:	000f4b37          	lui	s6,0xf4
    80006ad8:	00989bb7          	lui	s7,0x989
    80006adc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006ae0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006ae4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006ae8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80006aec:	00148c9b          	addiw	s9,s1,1
    80006af0:	02500793          	li	a5,37
    80006af4:	01998933          	add	s2,s3,s9
    80006af8:	38f51263          	bne	a0,a5,80006e7c <__printf+0x434>
    80006afc:	00094783          	lbu	a5,0(s2)
    80006b00:	00078c9b          	sext.w	s9,a5
    80006b04:	1e078263          	beqz	a5,80006ce8 <__printf+0x2a0>
    80006b08:	0024849b          	addiw	s1,s1,2
    80006b0c:	07000713          	li	a4,112
    80006b10:	00998933          	add	s2,s3,s1
    80006b14:	38e78a63          	beq	a5,a4,80006ea8 <__printf+0x460>
    80006b18:	20f76863          	bltu	a4,a5,80006d28 <__printf+0x2e0>
    80006b1c:	42a78863          	beq	a5,a0,80006f4c <__printf+0x504>
    80006b20:	06400713          	li	a4,100
    80006b24:	40e79663          	bne	a5,a4,80006f30 <__printf+0x4e8>
    80006b28:	f7843783          	ld	a5,-136(s0)
    80006b2c:	0007a603          	lw	a2,0(a5)
    80006b30:	00878793          	addi	a5,a5,8
    80006b34:	f6f43c23          	sd	a5,-136(s0)
    80006b38:	42064a63          	bltz	a2,80006f6c <__printf+0x524>
    80006b3c:	00a00713          	li	a4,10
    80006b40:	02e677bb          	remuw	a5,a2,a4
    80006b44:	00002d97          	auipc	s11,0x2
    80006b48:	b74d8d93          	addi	s11,s11,-1164 # 800086b8 <digits>
    80006b4c:	00900593          	li	a1,9
    80006b50:	0006051b          	sext.w	a0,a2
    80006b54:	00000c93          	li	s9,0
    80006b58:	02079793          	slli	a5,a5,0x20
    80006b5c:	0207d793          	srli	a5,a5,0x20
    80006b60:	00fd87b3          	add	a5,s11,a5
    80006b64:	0007c783          	lbu	a5,0(a5)
    80006b68:	02e656bb          	divuw	a3,a2,a4
    80006b6c:	f8f40023          	sb	a5,-128(s0)
    80006b70:	14c5d863          	bge	a1,a2,80006cc0 <__printf+0x278>
    80006b74:	06300593          	li	a1,99
    80006b78:	00100c93          	li	s9,1
    80006b7c:	02e6f7bb          	remuw	a5,a3,a4
    80006b80:	02079793          	slli	a5,a5,0x20
    80006b84:	0207d793          	srli	a5,a5,0x20
    80006b88:	00fd87b3          	add	a5,s11,a5
    80006b8c:	0007c783          	lbu	a5,0(a5)
    80006b90:	02e6d73b          	divuw	a4,a3,a4
    80006b94:	f8f400a3          	sb	a5,-127(s0)
    80006b98:	12a5f463          	bgeu	a1,a0,80006cc0 <__printf+0x278>
    80006b9c:	00a00693          	li	a3,10
    80006ba0:	00900593          	li	a1,9
    80006ba4:	02d777bb          	remuw	a5,a4,a3
    80006ba8:	02079793          	slli	a5,a5,0x20
    80006bac:	0207d793          	srli	a5,a5,0x20
    80006bb0:	00fd87b3          	add	a5,s11,a5
    80006bb4:	0007c503          	lbu	a0,0(a5)
    80006bb8:	02d757bb          	divuw	a5,a4,a3
    80006bbc:	f8a40123          	sb	a0,-126(s0)
    80006bc0:	48e5f263          	bgeu	a1,a4,80007044 <__printf+0x5fc>
    80006bc4:	06300513          	li	a0,99
    80006bc8:	02d7f5bb          	remuw	a1,a5,a3
    80006bcc:	02059593          	slli	a1,a1,0x20
    80006bd0:	0205d593          	srli	a1,a1,0x20
    80006bd4:	00bd85b3          	add	a1,s11,a1
    80006bd8:	0005c583          	lbu	a1,0(a1)
    80006bdc:	02d7d7bb          	divuw	a5,a5,a3
    80006be0:	f8b401a3          	sb	a1,-125(s0)
    80006be4:	48e57263          	bgeu	a0,a4,80007068 <__printf+0x620>
    80006be8:	3e700513          	li	a0,999
    80006bec:	02d7f5bb          	remuw	a1,a5,a3
    80006bf0:	02059593          	slli	a1,a1,0x20
    80006bf4:	0205d593          	srli	a1,a1,0x20
    80006bf8:	00bd85b3          	add	a1,s11,a1
    80006bfc:	0005c583          	lbu	a1,0(a1)
    80006c00:	02d7d7bb          	divuw	a5,a5,a3
    80006c04:	f8b40223          	sb	a1,-124(s0)
    80006c08:	46e57663          	bgeu	a0,a4,80007074 <__printf+0x62c>
    80006c0c:	02d7f5bb          	remuw	a1,a5,a3
    80006c10:	02059593          	slli	a1,a1,0x20
    80006c14:	0205d593          	srli	a1,a1,0x20
    80006c18:	00bd85b3          	add	a1,s11,a1
    80006c1c:	0005c583          	lbu	a1,0(a1)
    80006c20:	02d7d7bb          	divuw	a5,a5,a3
    80006c24:	f8b402a3          	sb	a1,-123(s0)
    80006c28:	46ea7863          	bgeu	s4,a4,80007098 <__printf+0x650>
    80006c2c:	02d7f5bb          	remuw	a1,a5,a3
    80006c30:	02059593          	slli	a1,a1,0x20
    80006c34:	0205d593          	srli	a1,a1,0x20
    80006c38:	00bd85b3          	add	a1,s11,a1
    80006c3c:	0005c583          	lbu	a1,0(a1)
    80006c40:	02d7d7bb          	divuw	a5,a5,a3
    80006c44:	f8b40323          	sb	a1,-122(s0)
    80006c48:	3eeaf863          	bgeu	s5,a4,80007038 <__printf+0x5f0>
    80006c4c:	02d7f5bb          	remuw	a1,a5,a3
    80006c50:	02059593          	slli	a1,a1,0x20
    80006c54:	0205d593          	srli	a1,a1,0x20
    80006c58:	00bd85b3          	add	a1,s11,a1
    80006c5c:	0005c583          	lbu	a1,0(a1)
    80006c60:	02d7d7bb          	divuw	a5,a5,a3
    80006c64:	f8b403a3          	sb	a1,-121(s0)
    80006c68:	42eb7e63          	bgeu	s6,a4,800070a4 <__printf+0x65c>
    80006c6c:	02d7f5bb          	remuw	a1,a5,a3
    80006c70:	02059593          	slli	a1,a1,0x20
    80006c74:	0205d593          	srli	a1,a1,0x20
    80006c78:	00bd85b3          	add	a1,s11,a1
    80006c7c:	0005c583          	lbu	a1,0(a1)
    80006c80:	02d7d7bb          	divuw	a5,a5,a3
    80006c84:	f8b40423          	sb	a1,-120(s0)
    80006c88:	42ebfc63          	bgeu	s7,a4,800070c0 <__printf+0x678>
    80006c8c:	02079793          	slli	a5,a5,0x20
    80006c90:	0207d793          	srli	a5,a5,0x20
    80006c94:	00fd8db3          	add	s11,s11,a5
    80006c98:	000dc703          	lbu	a4,0(s11)
    80006c9c:	00a00793          	li	a5,10
    80006ca0:	00900c93          	li	s9,9
    80006ca4:	f8e404a3          	sb	a4,-119(s0)
    80006ca8:	00065c63          	bgez	a2,80006cc0 <__printf+0x278>
    80006cac:	f9040713          	addi	a4,s0,-112
    80006cb0:	00f70733          	add	a4,a4,a5
    80006cb4:	02d00693          	li	a3,45
    80006cb8:	fed70823          	sb	a3,-16(a4)
    80006cbc:	00078c93          	mv	s9,a5
    80006cc0:	f8040793          	addi	a5,s0,-128
    80006cc4:	01978cb3          	add	s9,a5,s9
    80006cc8:	f7f40d13          	addi	s10,s0,-129
    80006ccc:	000cc503          	lbu	a0,0(s9)
    80006cd0:	fffc8c93          	addi	s9,s9,-1
    80006cd4:	00000097          	auipc	ra,0x0
    80006cd8:	b90080e7          	jalr	-1136(ra) # 80006864 <consputc>
    80006cdc:	ffac98e3          	bne	s9,s10,80006ccc <__printf+0x284>
    80006ce0:	00094503          	lbu	a0,0(s2)
    80006ce4:	e00514e3          	bnez	a0,80006aec <__printf+0xa4>
    80006ce8:	1a0c1663          	bnez	s8,80006e94 <__printf+0x44c>
    80006cec:	08813083          	ld	ra,136(sp)
    80006cf0:	08013403          	ld	s0,128(sp)
    80006cf4:	07813483          	ld	s1,120(sp)
    80006cf8:	07013903          	ld	s2,112(sp)
    80006cfc:	06813983          	ld	s3,104(sp)
    80006d00:	06013a03          	ld	s4,96(sp)
    80006d04:	05813a83          	ld	s5,88(sp)
    80006d08:	05013b03          	ld	s6,80(sp)
    80006d0c:	04813b83          	ld	s7,72(sp)
    80006d10:	04013c03          	ld	s8,64(sp)
    80006d14:	03813c83          	ld	s9,56(sp)
    80006d18:	03013d03          	ld	s10,48(sp)
    80006d1c:	02813d83          	ld	s11,40(sp)
    80006d20:	0d010113          	addi	sp,sp,208
    80006d24:	00008067          	ret
    80006d28:	07300713          	li	a4,115
    80006d2c:	1ce78a63          	beq	a5,a4,80006f00 <__printf+0x4b8>
    80006d30:	07800713          	li	a4,120
    80006d34:	1ee79e63          	bne	a5,a4,80006f30 <__printf+0x4e8>
    80006d38:	f7843783          	ld	a5,-136(s0)
    80006d3c:	0007a703          	lw	a4,0(a5)
    80006d40:	00878793          	addi	a5,a5,8
    80006d44:	f6f43c23          	sd	a5,-136(s0)
    80006d48:	28074263          	bltz	a4,80006fcc <__printf+0x584>
    80006d4c:	00002d97          	auipc	s11,0x2
    80006d50:	96cd8d93          	addi	s11,s11,-1684 # 800086b8 <digits>
    80006d54:	00f77793          	andi	a5,a4,15
    80006d58:	00fd87b3          	add	a5,s11,a5
    80006d5c:	0007c683          	lbu	a3,0(a5)
    80006d60:	00f00613          	li	a2,15
    80006d64:	0007079b          	sext.w	a5,a4
    80006d68:	f8d40023          	sb	a3,-128(s0)
    80006d6c:	0047559b          	srliw	a1,a4,0x4
    80006d70:	0047569b          	srliw	a3,a4,0x4
    80006d74:	00000c93          	li	s9,0
    80006d78:	0ee65063          	bge	a2,a4,80006e58 <__printf+0x410>
    80006d7c:	00f6f693          	andi	a3,a3,15
    80006d80:	00dd86b3          	add	a3,s11,a3
    80006d84:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006d88:	0087d79b          	srliw	a5,a5,0x8
    80006d8c:	00100c93          	li	s9,1
    80006d90:	f8d400a3          	sb	a3,-127(s0)
    80006d94:	0cb67263          	bgeu	a2,a1,80006e58 <__printf+0x410>
    80006d98:	00f7f693          	andi	a3,a5,15
    80006d9c:	00dd86b3          	add	a3,s11,a3
    80006da0:	0006c583          	lbu	a1,0(a3)
    80006da4:	00f00613          	li	a2,15
    80006da8:	0047d69b          	srliw	a3,a5,0x4
    80006dac:	f8b40123          	sb	a1,-126(s0)
    80006db0:	0047d593          	srli	a1,a5,0x4
    80006db4:	28f67e63          	bgeu	a2,a5,80007050 <__printf+0x608>
    80006db8:	00f6f693          	andi	a3,a3,15
    80006dbc:	00dd86b3          	add	a3,s11,a3
    80006dc0:	0006c503          	lbu	a0,0(a3)
    80006dc4:	0087d813          	srli	a6,a5,0x8
    80006dc8:	0087d69b          	srliw	a3,a5,0x8
    80006dcc:	f8a401a3          	sb	a0,-125(s0)
    80006dd0:	28b67663          	bgeu	a2,a1,8000705c <__printf+0x614>
    80006dd4:	00f6f693          	andi	a3,a3,15
    80006dd8:	00dd86b3          	add	a3,s11,a3
    80006ddc:	0006c583          	lbu	a1,0(a3)
    80006de0:	00c7d513          	srli	a0,a5,0xc
    80006de4:	00c7d69b          	srliw	a3,a5,0xc
    80006de8:	f8b40223          	sb	a1,-124(s0)
    80006dec:	29067a63          	bgeu	a2,a6,80007080 <__printf+0x638>
    80006df0:	00f6f693          	andi	a3,a3,15
    80006df4:	00dd86b3          	add	a3,s11,a3
    80006df8:	0006c583          	lbu	a1,0(a3)
    80006dfc:	0107d813          	srli	a6,a5,0x10
    80006e00:	0107d69b          	srliw	a3,a5,0x10
    80006e04:	f8b402a3          	sb	a1,-123(s0)
    80006e08:	28a67263          	bgeu	a2,a0,8000708c <__printf+0x644>
    80006e0c:	00f6f693          	andi	a3,a3,15
    80006e10:	00dd86b3          	add	a3,s11,a3
    80006e14:	0006c683          	lbu	a3,0(a3)
    80006e18:	0147d79b          	srliw	a5,a5,0x14
    80006e1c:	f8d40323          	sb	a3,-122(s0)
    80006e20:	21067663          	bgeu	a2,a6,8000702c <__printf+0x5e4>
    80006e24:	02079793          	slli	a5,a5,0x20
    80006e28:	0207d793          	srli	a5,a5,0x20
    80006e2c:	00fd8db3          	add	s11,s11,a5
    80006e30:	000dc683          	lbu	a3,0(s11)
    80006e34:	00800793          	li	a5,8
    80006e38:	00700c93          	li	s9,7
    80006e3c:	f8d403a3          	sb	a3,-121(s0)
    80006e40:	00075c63          	bgez	a4,80006e58 <__printf+0x410>
    80006e44:	f9040713          	addi	a4,s0,-112
    80006e48:	00f70733          	add	a4,a4,a5
    80006e4c:	02d00693          	li	a3,45
    80006e50:	fed70823          	sb	a3,-16(a4)
    80006e54:	00078c93          	mv	s9,a5
    80006e58:	f8040793          	addi	a5,s0,-128
    80006e5c:	01978cb3          	add	s9,a5,s9
    80006e60:	f7f40d13          	addi	s10,s0,-129
    80006e64:	000cc503          	lbu	a0,0(s9)
    80006e68:	fffc8c93          	addi	s9,s9,-1
    80006e6c:	00000097          	auipc	ra,0x0
    80006e70:	9f8080e7          	jalr	-1544(ra) # 80006864 <consputc>
    80006e74:	ff9d18e3          	bne	s10,s9,80006e64 <__printf+0x41c>
    80006e78:	0100006f          	j	80006e88 <__printf+0x440>
    80006e7c:	00000097          	auipc	ra,0x0
    80006e80:	9e8080e7          	jalr	-1560(ra) # 80006864 <consputc>
    80006e84:	000c8493          	mv	s1,s9
    80006e88:	00094503          	lbu	a0,0(s2)
    80006e8c:	c60510e3          	bnez	a0,80006aec <__printf+0xa4>
    80006e90:	e40c0ee3          	beqz	s8,80006cec <__printf+0x2a4>
    80006e94:	00005517          	auipc	a0,0x5
    80006e98:	88c50513          	addi	a0,a0,-1908 # 8000b720 <pr>
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	94c080e7          	jalr	-1716(ra) # 800077e8 <release>
    80006ea4:	e49ff06f          	j	80006cec <__printf+0x2a4>
    80006ea8:	f7843783          	ld	a5,-136(s0)
    80006eac:	03000513          	li	a0,48
    80006eb0:	01000d13          	li	s10,16
    80006eb4:	00878713          	addi	a4,a5,8
    80006eb8:	0007bc83          	ld	s9,0(a5)
    80006ebc:	f6e43c23          	sd	a4,-136(s0)
    80006ec0:	00000097          	auipc	ra,0x0
    80006ec4:	9a4080e7          	jalr	-1628(ra) # 80006864 <consputc>
    80006ec8:	07800513          	li	a0,120
    80006ecc:	00000097          	auipc	ra,0x0
    80006ed0:	998080e7          	jalr	-1640(ra) # 80006864 <consputc>
    80006ed4:	00001d97          	auipc	s11,0x1
    80006ed8:	7e4d8d93          	addi	s11,s11,2020 # 800086b8 <digits>
    80006edc:	03ccd793          	srli	a5,s9,0x3c
    80006ee0:	00fd87b3          	add	a5,s11,a5
    80006ee4:	0007c503          	lbu	a0,0(a5)
    80006ee8:	fffd0d1b          	addiw	s10,s10,-1
    80006eec:	004c9c93          	slli	s9,s9,0x4
    80006ef0:	00000097          	auipc	ra,0x0
    80006ef4:	974080e7          	jalr	-1676(ra) # 80006864 <consputc>
    80006ef8:	fe0d12e3          	bnez	s10,80006edc <__printf+0x494>
    80006efc:	f8dff06f          	j	80006e88 <__printf+0x440>
    80006f00:	f7843783          	ld	a5,-136(s0)
    80006f04:	0007bc83          	ld	s9,0(a5)
    80006f08:	00878793          	addi	a5,a5,8
    80006f0c:	f6f43c23          	sd	a5,-136(s0)
    80006f10:	000c9a63          	bnez	s9,80006f24 <__printf+0x4dc>
    80006f14:	1080006f          	j	8000701c <__printf+0x5d4>
    80006f18:	001c8c93          	addi	s9,s9,1
    80006f1c:	00000097          	auipc	ra,0x0
    80006f20:	948080e7          	jalr	-1720(ra) # 80006864 <consputc>
    80006f24:	000cc503          	lbu	a0,0(s9)
    80006f28:	fe0518e3          	bnez	a0,80006f18 <__printf+0x4d0>
    80006f2c:	f5dff06f          	j	80006e88 <__printf+0x440>
    80006f30:	02500513          	li	a0,37
    80006f34:	00000097          	auipc	ra,0x0
    80006f38:	930080e7          	jalr	-1744(ra) # 80006864 <consputc>
    80006f3c:	000c8513          	mv	a0,s9
    80006f40:	00000097          	auipc	ra,0x0
    80006f44:	924080e7          	jalr	-1756(ra) # 80006864 <consputc>
    80006f48:	f41ff06f          	j	80006e88 <__printf+0x440>
    80006f4c:	02500513          	li	a0,37
    80006f50:	00000097          	auipc	ra,0x0
    80006f54:	914080e7          	jalr	-1772(ra) # 80006864 <consputc>
    80006f58:	f31ff06f          	j	80006e88 <__printf+0x440>
    80006f5c:	00030513          	mv	a0,t1
    80006f60:	00000097          	auipc	ra,0x0
    80006f64:	7bc080e7          	jalr	1980(ra) # 8000771c <acquire>
    80006f68:	b4dff06f          	j	80006ab4 <__printf+0x6c>
    80006f6c:	40c0053b          	negw	a0,a2
    80006f70:	00a00713          	li	a4,10
    80006f74:	02e576bb          	remuw	a3,a0,a4
    80006f78:	00001d97          	auipc	s11,0x1
    80006f7c:	740d8d93          	addi	s11,s11,1856 # 800086b8 <digits>
    80006f80:	ff700593          	li	a1,-9
    80006f84:	02069693          	slli	a3,a3,0x20
    80006f88:	0206d693          	srli	a3,a3,0x20
    80006f8c:	00dd86b3          	add	a3,s11,a3
    80006f90:	0006c683          	lbu	a3,0(a3)
    80006f94:	02e557bb          	divuw	a5,a0,a4
    80006f98:	f8d40023          	sb	a3,-128(s0)
    80006f9c:	10b65e63          	bge	a2,a1,800070b8 <__printf+0x670>
    80006fa0:	06300593          	li	a1,99
    80006fa4:	02e7f6bb          	remuw	a3,a5,a4
    80006fa8:	02069693          	slli	a3,a3,0x20
    80006fac:	0206d693          	srli	a3,a3,0x20
    80006fb0:	00dd86b3          	add	a3,s11,a3
    80006fb4:	0006c683          	lbu	a3,0(a3)
    80006fb8:	02e7d73b          	divuw	a4,a5,a4
    80006fbc:	00200793          	li	a5,2
    80006fc0:	f8d400a3          	sb	a3,-127(s0)
    80006fc4:	bca5ece3          	bltu	a1,a0,80006b9c <__printf+0x154>
    80006fc8:	ce5ff06f          	j	80006cac <__printf+0x264>
    80006fcc:	40e007bb          	negw	a5,a4
    80006fd0:	00001d97          	auipc	s11,0x1
    80006fd4:	6e8d8d93          	addi	s11,s11,1768 # 800086b8 <digits>
    80006fd8:	00f7f693          	andi	a3,a5,15
    80006fdc:	00dd86b3          	add	a3,s11,a3
    80006fe0:	0006c583          	lbu	a1,0(a3)
    80006fe4:	ff100613          	li	a2,-15
    80006fe8:	0047d69b          	srliw	a3,a5,0x4
    80006fec:	f8b40023          	sb	a1,-128(s0)
    80006ff0:	0047d59b          	srliw	a1,a5,0x4
    80006ff4:	0ac75e63          	bge	a4,a2,800070b0 <__printf+0x668>
    80006ff8:	00f6f693          	andi	a3,a3,15
    80006ffc:	00dd86b3          	add	a3,s11,a3
    80007000:	0006c603          	lbu	a2,0(a3)
    80007004:	00f00693          	li	a3,15
    80007008:	0087d79b          	srliw	a5,a5,0x8
    8000700c:	f8c400a3          	sb	a2,-127(s0)
    80007010:	d8b6e4e3          	bltu	a3,a1,80006d98 <__printf+0x350>
    80007014:	00200793          	li	a5,2
    80007018:	e2dff06f          	j	80006e44 <__printf+0x3fc>
    8000701c:	00001c97          	auipc	s9,0x1
    80007020:	67cc8c93          	addi	s9,s9,1660 # 80008698 <CONSOLE_STATUS+0x688>
    80007024:	02800513          	li	a0,40
    80007028:	ef1ff06f          	j	80006f18 <__printf+0x4d0>
    8000702c:	00700793          	li	a5,7
    80007030:	00600c93          	li	s9,6
    80007034:	e0dff06f          	j	80006e40 <__printf+0x3f8>
    80007038:	00700793          	li	a5,7
    8000703c:	00600c93          	li	s9,6
    80007040:	c69ff06f          	j	80006ca8 <__printf+0x260>
    80007044:	00300793          	li	a5,3
    80007048:	00200c93          	li	s9,2
    8000704c:	c5dff06f          	j	80006ca8 <__printf+0x260>
    80007050:	00300793          	li	a5,3
    80007054:	00200c93          	li	s9,2
    80007058:	de9ff06f          	j	80006e40 <__printf+0x3f8>
    8000705c:	00400793          	li	a5,4
    80007060:	00300c93          	li	s9,3
    80007064:	dddff06f          	j	80006e40 <__printf+0x3f8>
    80007068:	00400793          	li	a5,4
    8000706c:	00300c93          	li	s9,3
    80007070:	c39ff06f          	j	80006ca8 <__printf+0x260>
    80007074:	00500793          	li	a5,5
    80007078:	00400c93          	li	s9,4
    8000707c:	c2dff06f          	j	80006ca8 <__printf+0x260>
    80007080:	00500793          	li	a5,5
    80007084:	00400c93          	li	s9,4
    80007088:	db9ff06f          	j	80006e40 <__printf+0x3f8>
    8000708c:	00600793          	li	a5,6
    80007090:	00500c93          	li	s9,5
    80007094:	dadff06f          	j	80006e40 <__printf+0x3f8>
    80007098:	00600793          	li	a5,6
    8000709c:	00500c93          	li	s9,5
    800070a0:	c09ff06f          	j	80006ca8 <__printf+0x260>
    800070a4:	00800793          	li	a5,8
    800070a8:	00700c93          	li	s9,7
    800070ac:	bfdff06f          	j	80006ca8 <__printf+0x260>
    800070b0:	00100793          	li	a5,1
    800070b4:	d91ff06f          	j	80006e44 <__printf+0x3fc>
    800070b8:	00100793          	li	a5,1
    800070bc:	bf1ff06f          	j	80006cac <__printf+0x264>
    800070c0:	00900793          	li	a5,9
    800070c4:	00800c93          	li	s9,8
    800070c8:	be1ff06f          	j	80006ca8 <__printf+0x260>
    800070cc:	00001517          	auipc	a0,0x1
    800070d0:	5d450513          	addi	a0,a0,1492 # 800086a0 <CONSOLE_STATUS+0x690>
    800070d4:	00000097          	auipc	ra,0x0
    800070d8:	918080e7          	jalr	-1768(ra) # 800069ec <panic>

00000000800070dc <printfinit>:
    800070dc:	fe010113          	addi	sp,sp,-32
    800070e0:	00813823          	sd	s0,16(sp)
    800070e4:	00913423          	sd	s1,8(sp)
    800070e8:	00113c23          	sd	ra,24(sp)
    800070ec:	02010413          	addi	s0,sp,32
    800070f0:	00004497          	auipc	s1,0x4
    800070f4:	63048493          	addi	s1,s1,1584 # 8000b720 <pr>
    800070f8:	00048513          	mv	a0,s1
    800070fc:	00001597          	auipc	a1,0x1
    80007100:	5b458593          	addi	a1,a1,1460 # 800086b0 <CONSOLE_STATUS+0x6a0>
    80007104:	00000097          	auipc	ra,0x0
    80007108:	5f4080e7          	jalr	1524(ra) # 800076f8 <initlock>
    8000710c:	01813083          	ld	ra,24(sp)
    80007110:	01013403          	ld	s0,16(sp)
    80007114:	0004ac23          	sw	zero,24(s1)
    80007118:	00813483          	ld	s1,8(sp)
    8000711c:	02010113          	addi	sp,sp,32
    80007120:	00008067          	ret

0000000080007124 <uartinit>:
    80007124:	ff010113          	addi	sp,sp,-16
    80007128:	00813423          	sd	s0,8(sp)
    8000712c:	01010413          	addi	s0,sp,16
    80007130:	100007b7          	lui	a5,0x10000
    80007134:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007138:	f8000713          	li	a4,-128
    8000713c:	00e781a3          	sb	a4,3(a5)
    80007140:	00300713          	li	a4,3
    80007144:	00e78023          	sb	a4,0(a5)
    80007148:	000780a3          	sb	zero,1(a5)
    8000714c:	00e781a3          	sb	a4,3(a5)
    80007150:	00700693          	li	a3,7
    80007154:	00d78123          	sb	a3,2(a5)
    80007158:	00e780a3          	sb	a4,1(a5)
    8000715c:	00813403          	ld	s0,8(sp)
    80007160:	01010113          	addi	sp,sp,16
    80007164:	00008067          	ret

0000000080007168 <uartputc>:
    80007168:	00003797          	auipc	a5,0x3
    8000716c:	2e07a783          	lw	a5,736(a5) # 8000a448 <panicked>
    80007170:	00078463          	beqz	a5,80007178 <uartputc+0x10>
    80007174:	0000006f          	j	80007174 <uartputc+0xc>
    80007178:	fd010113          	addi	sp,sp,-48
    8000717c:	02813023          	sd	s0,32(sp)
    80007180:	00913c23          	sd	s1,24(sp)
    80007184:	01213823          	sd	s2,16(sp)
    80007188:	01313423          	sd	s3,8(sp)
    8000718c:	02113423          	sd	ra,40(sp)
    80007190:	03010413          	addi	s0,sp,48
    80007194:	00003917          	auipc	s2,0x3
    80007198:	2bc90913          	addi	s2,s2,700 # 8000a450 <uart_tx_r>
    8000719c:	00093783          	ld	a5,0(s2)
    800071a0:	00003497          	auipc	s1,0x3
    800071a4:	2b848493          	addi	s1,s1,696 # 8000a458 <uart_tx_w>
    800071a8:	0004b703          	ld	a4,0(s1)
    800071ac:	02078693          	addi	a3,a5,32
    800071b0:	00050993          	mv	s3,a0
    800071b4:	02e69c63          	bne	a3,a4,800071ec <uartputc+0x84>
    800071b8:	00001097          	auipc	ra,0x1
    800071bc:	834080e7          	jalr	-1996(ra) # 800079ec <push_on>
    800071c0:	00093783          	ld	a5,0(s2)
    800071c4:	0004b703          	ld	a4,0(s1)
    800071c8:	02078793          	addi	a5,a5,32
    800071cc:	00e79463          	bne	a5,a4,800071d4 <uartputc+0x6c>
    800071d0:	0000006f          	j	800071d0 <uartputc+0x68>
    800071d4:	00001097          	auipc	ra,0x1
    800071d8:	88c080e7          	jalr	-1908(ra) # 80007a60 <pop_on>
    800071dc:	00093783          	ld	a5,0(s2)
    800071e0:	0004b703          	ld	a4,0(s1)
    800071e4:	02078693          	addi	a3,a5,32
    800071e8:	fce688e3          	beq	a3,a4,800071b8 <uartputc+0x50>
    800071ec:	01f77693          	andi	a3,a4,31
    800071f0:	00004597          	auipc	a1,0x4
    800071f4:	55058593          	addi	a1,a1,1360 # 8000b740 <uart_tx_buf>
    800071f8:	00d586b3          	add	a3,a1,a3
    800071fc:	00170713          	addi	a4,a4,1
    80007200:	01368023          	sb	s3,0(a3)
    80007204:	00e4b023          	sd	a4,0(s1)
    80007208:	10000637          	lui	a2,0x10000
    8000720c:	02f71063          	bne	a4,a5,8000722c <uartputc+0xc4>
    80007210:	0340006f          	j	80007244 <uartputc+0xdc>
    80007214:	00074703          	lbu	a4,0(a4)
    80007218:	00f93023          	sd	a5,0(s2)
    8000721c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007220:	00093783          	ld	a5,0(s2)
    80007224:	0004b703          	ld	a4,0(s1)
    80007228:	00f70e63          	beq	a4,a5,80007244 <uartputc+0xdc>
    8000722c:	00564683          	lbu	a3,5(a2)
    80007230:	01f7f713          	andi	a4,a5,31
    80007234:	00e58733          	add	a4,a1,a4
    80007238:	0206f693          	andi	a3,a3,32
    8000723c:	00178793          	addi	a5,a5,1
    80007240:	fc069ae3          	bnez	a3,80007214 <uartputc+0xac>
    80007244:	02813083          	ld	ra,40(sp)
    80007248:	02013403          	ld	s0,32(sp)
    8000724c:	01813483          	ld	s1,24(sp)
    80007250:	01013903          	ld	s2,16(sp)
    80007254:	00813983          	ld	s3,8(sp)
    80007258:	03010113          	addi	sp,sp,48
    8000725c:	00008067          	ret

0000000080007260 <uartputc_sync>:
    80007260:	ff010113          	addi	sp,sp,-16
    80007264:	00813423          	sd	s0,8(sp)
    80007268:	01010413          	addi	s0,sp,16
    8000726c:	00003717          	auipc	a4,0x3
    80007270:	1dc72703          	lw	a4,476(a4) # 8000a448 <panicked>
    80007274:	02071663          	bnez	a4,800072a0 <uartputc_sync+0x40>
    80007278:	00050793          	mv	a5,a0
    8000727c:	100006b7          	lui	a3,0x10000
    80007280:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007284:	02077713          	andi	a4,a4,32
    80007288:	fe070ce3          	beqz	a4,80007280 <uartputc_sync+0x20>
    8000728c:	0ff7f793          	andi	a5,a5,255
    80007290:	00f68023          	sb	a5,0(a3)
    80007294:	00813403          	ld	s0,8(sp)
    80007298:	01010113          	addi	sp,sp,16
    8000729c:	00008067          	ret
    800072a0:	0000006f          	j	800072a0 <uartputc_sync+0x40>

00000000800072a4 <uartstart>:
    800072a4:	ff010113          	addi	sp,sp,-16
    800072a8:	00813423          	sd	s0,8(sp)
    800072ac:	01010413          	addi	s0,sp,16
    800072b0:	00003617          	auipc	a2,0x3
    800072b4:	1a060613          	addi	a2,a2,416 # 8000a450 <uart_tx_r>
    800072b8:	00003517          	auipc	a0,0x3
    800072bc:	1a050513          	addi	a0,a0,416 # 8000a458 <uart_tx_w>
    800072c0:	00063783          	ld	a5,0(a2)
    800072c4:	00053703          	ld	a4,0(a0)
    800072c8:	04f70263          	beq	a4,a5,8000730c <uartstart+0x68>
    800072cc:	100005b7          	lui	a1,0x10000
    800072d0:	00004817          	auipc	a6,0x4
    800072d4:	47080813          	addi	a6,a6,1136 # 8000b740 <uart_tx_buf>
    800072d8:	01c0006f          	j	800072f4 <uartstart+0x50>
    800072dc:	0006c703          	lbu	a4,0(a3)
    800072e0:	00f63023          	sd	a5,0(a2)
    800072e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800072e8:	00063783          	ld	a5,0(a2)
    800072ec:	00053703          	ld	a4,0(a0)
    800072f0:	00f70e63          	beq	a4,a5,8000730c <uartstart+0x68>
    800072f4:	01f7f713          	andi	a4,a5,31
    800072f8:	00e806b3          	add	a3,a6,a4
    800072fc:	0055c703          	lbu	a4,5(a1)
    80007300:	00178793          	addi	a5,a5,1
    80007304:	02077713          	andi	a4,a4,32
    80007308:	fc071ae3          	bnez	a4,800072dc <uartstart+0x38>
    8000730c:	00813403          	ld	s0,8(sp)
    80007310:	01010113          	addi	sp,sp,16
    80007314:	00008067          	ret

0000000080007318 <uartgetc>:
    80007318:	ff010113          	addi	sp,sp,-16
    8000731c:	00813423          	sd	s0,8(sp)
    80007320:	01010413          	addi	s0,sp,16
    80007324:	10000737          	lui	a4,0x10000
    80007328:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000732c:	0017f793          	andi	a5,a5,1
    80007330:	00078c63          	beqz	a5,80007348 <uartgetc+0x30>
    80007334:	00074503          	lbu	a0,0(a4)
    80007338:	0ff57513          	andi	a0,a0,255
    8000733c:	00813403          	ld	s0,8(sp)
    80007340:	01010113          	addi	sp,sp,16
    80007344:	00008067          	ret
    80007348:	fff00513          	li	a0,-1
    8000734c:	ff1ff06f          	j	8000733c <uartgetc+0x24>

0000000080007350 <uartintr>:
    80007350:	100007b7          	lui	a5,0x10000
    80007354:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007358:	0017f793          	andi	a5,a5,1
    8000735c:	0a078463          	beqz	a5,80007404 <uartintr+0xb4>
    80007360:	fe010113          	addi	sp,sp,-32
    80007364:	00813823          	sd	s0,16(sp)
    80007368:	00913423          	sd	s1,8(sp)
    8000736c:	00113c23          	sd	ra,24(sp)
    80007370:	02010413          	addi	s0,sp,32
    80007374:	100004b7          	lui	s1,0x10000
    80007378:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000737c:	0ff57513          	andi	a0,a0,255
    80007380:	fffff097          	auipc	ra,0xfffff
    80007384:	534080e7          	jalr	1332(ra) # 800068b4 <consoleintr>
    80007388:	0054c783          	lbu	a5,5(s1)
    8000738c:	0017f793          	andi	a5,a5,1
    80007390:	fe0794e3          	bnez	a5,80007378 <uartintr+0x28>
    80007394:	00003617          	auipc	a2,0x3
    80007398:	0bc60613          	addi	a2,a2,188 # 8000a450 <uart_tx_r>
    8000739c:	00003517          	auipc	a0,0x3
    800073a0:	0bc50513          	addi	a0,a0,188 # 8000a458 <uart_tx_w>
    800073a4:	00063783          	ld	a5,0(a2)
    800073a8:	00053703          	ld	a4,0(a0)
    800073ac:	04f70263          	beq	a4,a5,800073f0 <uartintr+0xa0>
    800073b0:	100005b7          	lui	a1,0x10000
    800073b4:	00004817          	auipc	a6,0x4
    800073b8:	38c80813          	addi	a6,a6,908 # 8000b740 <uart_tx_buf>
    800073bc:	01c0006f          	j	800073d8 <uartintr+0x88>
    800073c0:	0006c703          	lbu	a4,0(a3)
    800073c4:	00f63023          	sd	a5,0(a2)
    800073c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800073cc:	00063783          	ld	a5,0(a2)
    800073d0:	00053703          	ld	a4,0(a0)
    800073d4:	00f70e63          	beq	a4,a5,800073f0 <uartintr+0xa0>
    800073d8:	01f7f713          	andi	a4,a5,31
    800073dc:	00e806b3          	add	a3,a6,a4
    800073e0:	0055c703          	lbu	a4,5(a1)
    800073e4:	00178793          	addi	a5,a5,1
    800073e8:	02077713          	andi	a4,a4,32
    800073ec:	fc071ae3          	bnez	a4,800073c0 <uartintr+0x70>
    800073f0:	01813083          	ld	ra,24(sp)
    800073f4:	01013403          	ld	s0,16(sp)
    800073f8:	00813483          	ld	s1,8(sp)
    800073fc:	02010113          	addi	sp,sp,32
    80007400:	00008067          	ret
    80007404:	00003617          	auipc	a2,0x3
    80007408:	04c60613          	addi	a2,a2,76 # 8000a450 <uart_tx_r>
    8000740c:	00003517          	auipc	a0,0x3
    80007410:	04c50513          	addi	a0,a0,76 # 8000a458 <uart_tx_w>
    80007414:	00063783          	ld	a5,0(a2)
    80007418:	00053703          	ld	a4,0(a0)
    8000741c:	04f70263          	beq	a4,a5,80007460 <uartintr+0x110>
    80007420:	100005b7          	lui	a1,0x10000
    80007424:	00004817          	auipc	a6,0x4
    80007428:	31c80813          	addi	a6,a6,796 # 8000b740 <uart_tx_buf>
    8000742c:	01c0006f          	j	80007448 <uartintr+0xf8>
    80007430:	0006c703          	lbu	a4,0(a3)
    80007434:	00f63023          	sd	a5,0(a2)
    80007438:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000743c:	00063783          	ld	a5,0(a2)
    80007440:	00053703          	ld	a4,0(a0)
    80007444:	02f70063          	beq	a4,a5,80007464 <uartintr+0x114>
    80007448:	01f7f713          	andi	a4,a5,31
    8000744c:	00e806b3          	add	a3,a6,a4
    80007450:	0055c703          	lbu	a4,5(a1)
    80007454:	00178793          	addi	a5,a5,1
    80007458:	02077713          	andi	a4,a4,32
    8000745c:	fc071ae3          	bnez	a4,80007430 <uartintr+0xe0>
    80007460:	00008067          	ret
    80007464:	00008067          	ret

0000000080007468 <kinit>:
    80007468:	fc010113          	addi	sp,sp,-64
    8000746c:	02913423          	sd	s1,40(sp)
    80007470:	fffff7b7          	lui	a5,0xfffff
    80007474:	00005497          	auipc	s1,0x5
    80007478:	2eb48493          	addi	s1,s1,747 # 8000c75f <end+0xfff>
    8000747c:	02813823          	sd	s0,48(sp)
    80007480:	01313c23          	sd	s3,24(sp)
    80007484:	00f4f4b3          	and	s1,s1,a5
    80007488:	02113c23          	sd	ra,56(sp)
    8000748c:	03213023          	sd	s2,32(sp)
    80007490:	01413823          	sd	s4,16(sp)
    80007494:	01513423          	sd	s5,8(sp)
    80007498:	04010413          	addi	s0,sp,64
    8000749c:	000017b7          	lui	a5,0x1
    800074a0:	01100993          	li	s3,17
    800074a4:	00f487b3          	add	a5,s1,a5
    800074a8:	01b99993          	slli	s3,s3,0x1b
    800074ac:	06f9e063          	bltu	s3,a5,8000750c <kinit+0xa4>
    800074b0:	00004a97          	auipc	s5,0x4
    800074b4:	2b0a8a93          	addi	s5,s5,688 # 8000b760 <end>
    800074b8:	0754ec63          	bltu	s1,s5,80007530 <kinit+0xc8>
    800074bc:	0734fa63          	bgeu	s1,s3,80007530 <kinit+0xc8>
    800074c0:	00088a37          	lui	s4,0x88
    800074c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800074c8:	00003917          	auipc	s2,0x3
    800074cc:	f9890913          	addi	s2,s2,-104 # 8000a460 <kmem>
    800074d0:	00ca1a13          	slli	s4,s4,0xc
    800074d4:	0140006f          	j	800074e8 <kinit+0x80>
    800074d8:	000017b7          	lui	a5,0x1
    800074dc:	00f484b3          	add	s1,s1,a5
    800074e0:	0554e863          	bltu	s1,s5,80007530 <kinit+0xc8>
    800074e4:	0534f663          	bgeu	s1,s3,80007530 <kinit+0xc8>
    800074e8:	00001637          	lui	a2,0x1
    800074ec:	00100593          	li	a1,1
    800074f0:	00048513          	mv	a0,s1
    800074f4:	00000097          	auipc	ra,0x0
    800074f8:	5e4080e7          	jalr	1508(ra) # 80007ad8 <__memset>
    800074fc:	00093783          	ld	a5,0(s2)
    80007500:	00f4b023          	sd	a5,0(s1)
    80007504:	00993023          	sd	s1,0(s2)
    80007508:	fd4498e3          	bne	s1,s4,800074d8 <kinit+0x70>
    8000750c:	03813083          	ld	ra,56(sp)
    80007510:	03013403          	ld	s0,48(sp)
    80007514:	02813483          	ld	s1,40(sp)
    80007518:	02013903          	ld	s2,32(sp)
    8000751c:	01813983          	ld	s3,24(sp)
    80007520:	01013a03          	ld	s4,16(sp)
    80007524:	00813a83          	ld	s5,8(sp)
    80007528:	04010113          	addi	sp,sp,64
    8000752c:	00008067          	ret
    80007530:	00001517          	auipc	a0,0x1
    80007534:	1a050513          	addi	a0,a0,416 # 800086d0 <digits+0x18>
    80007538:	fffff097          	auipc	ra,0xfffff
    8000753c:	4b4080e7          	jalr	1204(ra) # 800069ec <panic>

0000000080007540 <freerange>:
    80007540:	fc010113          	addi	sp,sp,-64
    80007544:	000017b7          	lui	a5,0x1
    80007548:	02913423          	sd	s1,40(sp)
    8000754c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007550:	009504b3          	add	s1,a0,s1
    80007554:	fffff537          	lui	a0,0xfffff
    80007558:	02813823          	sd	s0,48(sp)
    8000755c:	02113c23          	sd	ra,56(sp)
    80007560:	03213023          	sd	s2,32(sp)
    80007564:	01313c23          	sd	s3,24(sp)
    80007568:	01413823          	sd	s4,16(sp)
    8000756c:	01513423          	sd	s5,8(sp)
    80007570:	01613023          	sd	s6,0(sp)
    80007574:	04010413          	addi	s0,sp,64
    80007578:	00a4f4b3          	and	s1,s1,a0
    8000757c:	00f487b3          	add	a5,s1,a5
    80007580:	06f5e463          	bltu	a1,a5,800075e8 <freerange+0xa8>
    80007584:	00004a97          	auipc	s5,0x4
    80007588:	1dca8a93          	addi	s5,s5,476 # 8000b760 <end>
    8000758c:	0954e263          	bltu	s1,s5,80007610 <freerange+0xd0>
    80007590:	01100993          	li	s3,17
    80007594:	01b99993          	slli	s3,s3,0x1b
    80007598:	0734fc63          	bgeu	s1,s3,80007610 <freerange+0xd0>
    8000759c:	00058a13          	mv	s4,a1
    800075a0:	00003917          	auipc	s2,0x3
    800075a4:	ec090913          	addi	s2,s2,-320 # 8000a460 <kmem>
    800075a8:	00002b37          	lui	s6,0x2
    800075ac:	0140006f          	j	800075c0 <freerange+0x80>
    800075b0:	000017b7          	lui	a5,0x1
    800075b4:	00f484b3          	add	s1,s1,a5
    800075b8:	0554ec63          	bltu	s1,s5,80007610 <freerange+0xd0>
    800075bc:	0534fa63          	bgeu	s1,s3,80007610 <freerange+0xd0>
    800075c0:	00001637          	lui	a2,0x1
    800075c4:	00100593          	li	a1,1
    800075c8:	00048513          	mv	a0,s1
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	50c080e7          	jalr	1292(ra) # 80007ad8 <__memset>
    800075d4:	00093703          	ld	a4,0(s2)
    800075d8:	016487b3          	add	a5,s1,s6
    800075dc:	00e4b023          	sd	a4,0(s1)
    800075e0:	00993023          	sd	s1,0(s2)
    800075e4:	fcfa76e3          	bgeu	s4,a5,800075b0 <freerange+0x70>
    800075e8:	03813083          	ld	ra,56(sp)
    800075ec:	03013403          	ld	s0,48(sp)
    800075f0:	02813483          	ld	s1,40(sp)
    800075f4:	02013903          	ld	s2,32(sp)
    800075f8:	01813983          	ld	s3,24(sp)
    800075fc:	01013a03          	ld	s4,16(sp)
    80007600:	00813a83          	ld	s5,8(sp)
    80007604:	00013b03          	ld	s6,0(sp)
    80007608:	04010113          	addi	sp,sp,64
    8000760c:	00008067          	ret
    80007610:	00001517          	auipc	a0,0x1
    80007614:	0c050513          	addi	a0,a0,192 # 800086d0 <digits+0x18>
    80007618:	fffff097          	auipc	ra,0xfffff
    8000761c:	3d4080e7          	jalr	980(ra) # 800069ec <panic>

0000000080007620 <kfree>:
    80007620:	fe010113          	addi	sp,sp,-32
    80007624:	00813823          	sd	s0,16(sp)
    80007628:	00113c23          	sd	ra,24(sp)
    8000762c:	00913423          	sd	s1,8(sp)
    80007630:	02010413          	addi	s0,sp,32
    80007634:	03451793          	slli	a5,a0,0x34
    80007638:	04079c63          	bnez	a5,80007690 <kfree+0x70>
    8000763c:	00004797          	auipc	a5,0x4
    80007640:	12478793          	addi	a5,a5,292 # 8000b760 <end>
    80007644:	00050493          	mv	s1,a0
    80007648:	04f56463          	bltu	a0,a5,80007690 <kfree+0x70>
    8000764c:	01100793          	li	a5,17
    80007650:	01b79793          	slli	a5,a5,0x1b
    80007654:	02f57e63          	bgeu	a0,a5,80007690 <kfree+0x70>
    80007658:	00001637          	lui	a2,0x1
    8000765c:	00100593          	li	a1,1
    80007660:	00000097          	auipc	ra,0x0
    80007664:	478080e7          	jalr	1144(ra) # 80007ad8 <__memset>
    80007668:	00003797          	auipc	a5,0x3
    8000766c:	df878793          	addi	a5,a5,-520 # 8000a460 <kmem>
    80007670:	0007b703          	ld	a4,0(a5)
    80007674:	01813083          	ld	ra,24(sp)
    80007678:	01013403          	ld	s0,16(sp)
    8000767c:	00e4b023          	sd	a4,0(s1)
    80007680:	0097b023          	sd	s1,0(a5)
    80007684:	00813483          	ld	s1,8(sp)
    80007688:	02010113          	addi	sp,sp,32
    8000768c:	00008067          	ret
    80007690:	00001517          	auipc	a0,0x1
    80007694:	04050513          	addi	a0,a0,64 # 800086d0 <digits+0x18>
    80007698:	fffff097          	auipc	ra,0xfffff
    8000769c:	354080e7          	jalr	852(ra) # 800069ec <panic>

00000000800076a0 <kalloc>:
    800076a0:	fe010113          	addi	sp,sp,-32
    800076a4:	00813823          	sd	s0,16(sp)
    800076a8:	00913423          	sd	s1,8(sp)
    800076ac:	00113c23          	sd	ra,24(sp)
    800076b0:	02010413          	addi	s0,sp,32
    800076b4:	00003797          	auipc	a5,0x3
    800076b8:	dac78793          	addi	a5,a5,-596 # 8000a460 <kmem>
    800076bc:	0007b483          	ld	s1,0(a5)
    800076c0:	02048063          	beqz	s1,800076e0 <kalloc+0x40>
    800076c4:	0004b703          	ld	a4,0(s1)
    800076c8:	00001637          	lui	a2,0x1
    800076cc:	00500593          	li	a1,5
    800076d0:	00048513          	mv	a0,s1
    800076d4:	00e7b023          	sd	a4,0(a5)
    800076d8:	00000097          	auipc	ra,0x0
    800076dc:	400080e7          	jalr	1024(ra) # 80007ad8 <__memset>
    800076e0:	01813083          	ld	ra,24(sp)
    800076e4:	01013403          	ld	s0,16(sp)
    800076e8:	00048513          	mv	a0,s1
    800076ec:	00813483          	ld	s1,8(sp)
    800076f0:	02010113          	addi	sp,sp,32
    800076f4:	00008067          	ret

00000000800076f8 <initlock>:
    800076f8:	ff010113          	addi	sp,sp,-16
    800076fc:	00813423          	sd	s0,8(sp)
    80007700:	01010413          	addi	s0,sp,16
    80007704:	00813403          	ld	s0,8(sp)
    80007708:	00b53423          	sd	a1,8(a0)
    8000770c:	00052023          	sw	zero,0(a0)
    80007710:	00053823          	sd	zero,16(a0)
    80007714:	01010113          	addi	sp,sp,16
    80007718:	00008067          	ret

000000008000771c <acquire>:
    8000771c:	fe010113          	addi	sp,sp,-32
    80007720:	00813823          	sd	s0,16(sp)
    80007724:	00913423          	sd	s1,8(sp)
    80007728:	00113c23          	sd	ra,24(sp)
    8000772c:	01213023          	sd	s2,0(sp)
    80007730:	02010413          	addi	s0,sp,32
    80007734:	00050493          	mv	s1,a0
    80007738:	10002973          	csrr	s2,sstatus
    8000773c:	100027f3          	csrr	a5,sstatus
    80007740:	ffd7f793          	andi	a5,a5,-3
    80007744:	10079073          	csrw	sstatus,a5
    80007748:	fffff097          	auipc	ra,0xfffff
    8000774c:	8e4080e7          	jalr	-1820(ra) # 8000602c <mycpu>
    80007750:	07852783          	lw	a5,120(a0)
    80007754:	06078e63          	beqz	a5,800077d0 <acquire+0xb4>
    80007758:	fffff097          	auipc	ra,0xfffff
    8000775c:	8d4080e7          	jalr	-1836(ra) # 8000602c <mycpu>
    80007760:	07852783          	lw	a5,120(a0)
    80007764:	0004a703          	lw	a4,0(s1)
    80007768:	0017879b          	addiw	a5,a5,1
    8000776c:	06f52c23          	sw	a5,120(a0)
    80007770:	04071063          	bnez	a4,800077b0 <acquire+0x94>
    80007774:	00100713          	li	a4,1
    80007778:	00070793          	mv	a5,a4
    8000777c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007780:	0007879b          	sext.w	a5,a5
    80007784:	fe079ae3          	bnez	a5,80007778 <acquire+0x5c>
    80007788:	0ff0000f          	fence
    8000778c:	fffff097          	auipc	ra,0xfffff
    80007790:	8a0080e7          	jalr	-1888(ra) # 8000602c <mycpu>
    80007794:	01813083          	ld	ra,24(sp)
    80007798:	01013403          	ld	s0,16(sp)
    8000779c:	00a4b823          	sd	a0,16(s1)
    800077a0:	00013903          	ld	s2,0(sp)
    800077a4:	00813483          	ld	s1,8(sp)
    800077a8:	02010113          	addi	sp,sp,32
    800077ac:	00008067          	ret
    800077b0:	0104b903          	ld	s2,16(s1)
    800077b4:	fffff097          	auipc	ra,0xfffff
    800077b8:	878080e7          	jalr	-1928(ra) # 8000602c <mycpu>
    800077bc:	faa91ce3          	bne	s2,a0,80007774 <acquire+0x58>
    800077c0:	00001517          	auipc	a0,0x1
    800077c4:	f1850513          	addi	a0,a0,-232 # 800086d8 <digits+0x20>
    800077c8:	fffff097          	auipc	ra,0xfffff
    800077cc:	224080e7          	jalr	548(ra) # 800069ec <panic>
    800077d0:	00195913          	srli	s2,s2,0x1
    800077d4:	fffff097          	auipc	ra,0xfffff
    800077d8:	858080e7          	jalr	-1960(ra) # 8000602c <mycpu>
    800077dc:	00197913          	andi	s2,s2,1
    800077e0:	07252e23          	sw	s2,124(a0)
    800077e4:	f75ff06f          	j	80007758 <acquire+0x3c>

00000000800077e8 <release>:
    800077e8:	fe010113          	addi	sp,sp,-32
    800077ec:	00813823          	sd	s0,16(sp)
    800077f0:	00113c23          	sd	ra,24(sp)
    800077f4:	00913423          	sd	s1,8(sp)
    800077f8:	01213023          	sd	s2,0(sp)
    800077fc:	02010413          	addi	s0,sp,32
    80007800:	00052783          	lw	a5,0(a0)
    80007804:	00079a63          	bnez	a5,80007818 <release+0x30>
    80007808:	00001517          	auipc	a0,0x1
    8000780c:	ed850513          	addi	a0,a0,-296 # 800086e0 <digits+0x28>
    80007810:	fffff097          	auipc	ra,0xfffff
    80007814:	1dc080e7          	jalr	476(ra) # 800069ec <panic>
    80007818:	01053903          	ld	s2,16(a0)
    8000781c:	00050493          	mv	s1,a0
    80007820:	fffff097          	auipc	ra,0xfffff
    80007824:	80c080e7          	jalr	-2036(ra) # 8000602c <mycpu>
    80007828:	fea910e3          	bne	s2,a0,80007808 <release+0x20>
    8000782c:	0004b823          	sd	zero,16(s1)
    80007830:	0ff0000f          	fence
    80007834:	0f50000f          	fence	iorw,ow
    80007838:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000783c:	ffffe097          	auipc	ra,0xffffe
    80007840:	7f0080e7          	jalr	2032(ra) # 8000602c <mycpu>
    80007844:	100027f3          	csrr	a5,sstatus
    80007848:	0027f793          	andi	a5,a5,2
    8000784c:	04079a63          	bnez	a5,800078a0 <release+0xb8>
    80007850:	07852783          	lw	a5,120(a0)
    80007854:	02f05e63          	blez	a5,80007890 <release+0xa8>
    80007858:	fff7871b          	addiw	a4,a5,-1
    8000785c:	06e52c23          	sw	a4,120(a0)
    80007860:	00071c63          	bnez	a4,80007878 <release+0x90>
    80007864:	07c52783          	lw	a5,124(a0)
    80007868:	00078863          	beqz	a5,80007878 <release+0x90>
    8000786c:	100027f3          	csrr	a5,sstatus
    80007870:	0027e793          	ori	a5,a5,2
    80007874:	10079073          	csrw	sstatus,a5
    80007878:	01813083          	ld	ra,24(sp)
    8000787c:	01013403          	ld	s0,16(sp)
    80007880:	00813483          	ld	s1,8(sp)
    80007884:	00013903          	ld	s2,0(sp)
    80007888:	02010113          	addi	sp,sp,32
    8000788c:	00008067          	ret
    80007890:	00001517          	auipc	a0,0x1
    80007894:	e7050513          	addi	a0,a0,-400 # 80008700 <digits+0x48>
    80007898:	fffff097          	auipc	ra,0xfffff
    8000789c:	154080e7          	jalr	340(ra) # 800069ec <panic>
    800078a0:	00001517          	auipc	a0,0x1
    800078a4:	e4850513          	addi	a0,a0,-440 # 800086e8 <digits+0x30>
    800078a8:	fffff097          	auipc	ra,0xfffff
    800078ac:	144080e7          	jalr	324(ra) # 800069ec <panic>

00000000800078b0 <holding>:
    800078b0:	00052783          	lw	a5,0(a0)
    800078b4:	00079663          	bnez	a5,800078c0 <holding+0x10>
    800078b8:	00000513          	li	a0,0
    800078bc:	00008067          	ret
    800078c0:	fe010113          	addi	sp,sp,-32
    800078c4:	00813823          	sd	s0,16(sp)
    800078c8:	00913423          	sd	s1,8(sp)
    800078cc:	00113c23          	sd	ra,24(sp)
    800078d0:	02010413          	addi	s0,sp,32
    800078d4:	01053483          	ld	s1,16(a0)
    800078d8:	ffffe097          	auipc	ra,0xffffe
    800078dc:	754080e7          	jalr	1876(ra) # 8000602c <mycpu>
    800078e0:	01813083          	ld	ra,24(sp)
    800078e4:	01013403          	ld	s0,16(sp)
    800078e8:	40a48533          	sub	a0,s1,a0
    800078ec:	00153513          	seqz	a0,a0
    800078f0:	00813483          	ld	s1,8(sp)
    800078f4:	02010113          	addi	sp,sp,32
    800078f8:	00008067          	ret

00000000800078fc <push_off>:
    800078fc:	fe010113          	addi	sp,sp,-32
    80007900:	00813823          	sd	s0,16(sp)
    80007904:	00113c23          	sd	ra,24(sp)
    80007908:	00913423          	sd	s1,8(sp)
    8000790c:	02010413          	addi	s0,sp,32
    80007910:	100024f3          	csrr	s1,sstatus
    80007914:	100027f3          	csrr	a5,sstatus
    80007918:	ffd7f793          	andi	a5,a5,-3
    8000791c:	10079073          	csrw	sstatus,a5
    80007920:	ffffe097          	auipc	ra,0xffffe
    80007924:	70c080e7          	jalr	1804(ra) # 8000602c <mycpu>
    80007928:	07852783          	lw	a5,120(a0)
    8000792c:	02078663          	beqz	a5,80007958 <push_off+0x5c>
    80007930:	ffffe097          	auipc	ra,0xffffe
    80007934:	6fc080e7          	jalr	1788(ra) # 8000602c <mycpu>
    80007938:	07852783          	lw	a5,120(a0)
    8000793c:	01813083          	ld	ra,24(sp)
    80007940:	01013403          	ld	s0,16(sp)
    80007944:	0017879b          	addiw	a5,a5,1
    80007948:	06f52c23          	sw	a5,120(a0)
    8000794c:	00813483          	ld	s1,8(sp)
    80007950:	02010113          	addi	sp,sp,32
    80007954:	00008067          	ret
    80007958:	0014d493          	srli	s1,s1,0x1
    8000795c:	ffffe097          	auipc	ra,0xffffe
    80007960:	6d0080e7          	jalr	1744(ra) # 8000602c <mycpu>
    80007964:	0014f493          	andi	s1,s1,1
    80007968:	06952e23          	sw	s1,124(a0)
    8000796c:	fc5ff06f          	j	80007930 <push_off+0x34>

0000000080007970 <pop_off>:
    80007970:	ff010113          	addi	sp,sp,-16
    80007974:	00813023          	sd	s0,0(sp)
    80007978:	00113423          	sd	ra,8(sp)
    8000797c:	01010413          	addi	s0,sp,16
    80007980:	ffffe097          	auipc	ra,0xffffe
    80007984:	6ac080e7          	jalr	1708(ra) # 8000602c <mycpu>
    80007988:	100027f3          	csrr	a5,sstatus
    8000798c:	0027f793          	andi	a5,a5,2
    80007990:	04079663          	bnez	a5,800079dc <pop_off+0x6c>
    80007994:	07852783          	lw	a5,120(a0)
    80007998:	02f05a63          	blez	a5,800079cc <pop_off+0x5c>
    8000799c:	fff7871b          	addiw	a4,a5,-1
    800079a0:	06e52c23          	sw	a4,120(a0)
    800079a4:	00071c63          	bnez	a4,800079bc <pop_off+0x4c>
    800079a8:	07c52783          	lw	a5,124(a0)
    800079ac:	00078863          	beqz	a5,800079bc <pop_off+0x4c>
    800079b0:	100027f3          	csrr	a5,sstatus
    800079b4:	0027e793          	ori	a5,a5,2
    800079b8:	10079073          	csrw	sstatus,a5
    800079bc:	00813083          	ld	ra,8(sp)
    800079c0:	00013403          	ld	s0,0(sp)
    800079c4:	01010113          	addi	sp,sp,16
    800079c8:	00008067          	ret
    800079cc:	00001517          	auipc	a0,0x1
    800079d0:	d3450513          	addi	a0,a0,-716 # 80008700 <digits+0x48>
    800079d4:	fffff097          	auipc	ra,0xfffff
    800079d8:	018080e7          	jalr	24(ra) # 800069ec <panic>
    800079dc:	00001517          	auipc	a0,0x1
    800079e0:	d0c50513          	addi	a0,a0,-756 # 800086e8 <digits+0x30>
    800079e4:	fffff097          	auipc	ra,0xfffff
    800079e8:	008080e7          	jalr	8(ra) # 800069ec <panic>

00000000800079ec <push_on>:
    800079ec:	fe010113          	addi	sp,sp,-32
    800079f0:	00813823          	sd	s0,16(sp)
    800079f4:	00113c23          	sd	ra,24(sp)
    800079f8:	00913423          	sd	s1,8(sp)
    800079fc:	02010413          	addi	s0,sp,32
    80007a00:	100024f3          	csrr	s1,sstatus
    80007a04:	100027f3          	csrr	a5,sstatus
    80007a08:	0027e793          	ori	a5,a5,2
    80007a0c:	10079073          	csrw	sstatus,a5
    80007a10:	ffffe097          	auipc	ra,0xffffe
    80007a14:	61c080e7          	jalr	1564(ra) # 8000602c <mycpu>
    80007a18:	07852783          	lw	a5,120(a0)
    80007a1c:	02078663          	beqz	a5,80007a48 <push_on+0x5c>
    80007a20:	ffffe097          	auipc	ra,0xffffe
    80007a24:	60c080e7          	jalr	1548(ra) # 8000602c <mycpu>
    80007a28:	07852783          	lw	a5,120(a0)
    80007a2c:	01813083          	ld	ra,24(sp)
    80007a30:	01013403          	ld	s0,16(sp)
    80007a34:	0017879b          	addiw	a5,a5,1
    80007a38:	06f52c23          	sw	a5,120(a0)
    80007a3c:	00813483          	ld	s1,8(sp)
    80007a40:	02010113          	addi	sp,sp,32
    80007a44:	00008067          	ret
    80007a48:	0014d493          	srli	s1,s1,0x1
    80007a4c:	ffffe097          	auipc	ra,0xffffe
    80007a50:	5e0080e7          	jalr	1504(ra) # 8000602c <mycpu>
    80007a54:	0014f493          	andi	s1,s1,1
    80007a58:	06952e23          	sw	s1,124(a0)
    80007a5c:	fc5ff06f          	j	80007a20 <push_on+0x34>

0000000080007a60 <pop_on>:
    80007a60:	ff010113          	addi	sp,sp,-16
    80007a64:	00813023          	sd	s0,0(sp)
    80007a68:	00113423          	sd	ra,8(sp)
    80007a6c:	01010413          	addi	s0,sp,16
    80007a70:	ffffe097          	auipc	ra,0xffffe
    80007a74:	5bc080e7          	jalr	1468(ra) # 8000602c <mycpu>
    80007a78:	100027f3          	csrr	a5,sstatus
    80007a7c:	0027f793          	andi	a5,a5,2
    80007a80:	04078463          	beqz	a5,80007ac8 <pop_on+0x68>
    80007a84:	07852783          	lw	a5,120(a0)
    80007a88:	02f05863          	blez	a5,80007ab8 <pop_on+0x58>
    80007a8c:	fff7879b          	addiw	a5,a5,-1
    80007a90:	06f52c23          	sw	a5,120(a0)
    80007a94:	07853783          	ld	a5,120(a0)
    80007a98:	00079863          	bnez	a5,80007aa8 <pop_on+0x48>
    80007a9c:	100027f3          	csrr	a5,sstatus
    80007aa0:	ffd7f793          	andi	a5,a5,-3
    80007aa4:	10079073          	csrw	sstatus,a5
    80007aa8:	00813083          	ld	ra,8(sp)
    80007aac:	00013403          	ld	s0,0(sp)
    80007ab0:	01010113          	addi	sp,sp,16
    80007ab4:	00008067          	ret
    80007ab8:	00001517          	auipc	a0,0x1
    80007abc:	c7050513          	addi	a0,a0,-912 # 80008728 <digits+0x70>
    80007ac0:	fffff097          	auipc	ra,0xfffff
    80007ac4:	f2c080e7          	jalr	-212(ra) # 800069ec <panic>
    80007ac8:	00001517          	auipc	a0,0x1
    80007acc:	c4050513          	addi	a0,a0,-960 # 80008708 <digits+0x50>
    80007ad0:	fffff097          	auipc	ra,0xfffff
    80007ad4:	f1c080e7          	jalr	-228(ra) # 800069ec <panic>

0000000080007ad8 <__memset>:
    80007ad8:	ff010113          	addi	sp,sp,-16
    80007adc:	00813423          	sd	s0,8(sp)
    80007ae0:	01010413          	addi	s0,sp,16
    80007ae4:	1a060e63          	beqz	a2,80007ca0 <__memset+0x1c8>
    80007ae8:	40a007b3          	neg	a5,a0
    80007aec:	0077f793          	andi	a5,a5,7
    80007af0:	00778693          	addi	a3,a5,7
    80007af4:	00b00813          	li	a6,11
    80007af8:	0ff5f593          	andi	a1,a1,255
    80007afc:	fff6071b          	addiw	a4,a2,-1
    80007b00:	1b06e663          	bltu	a3,a6,80007cac <__memset+0x1d4>
    80007b04:	1cd76463          	bltu	a4,a3,80007ccc <__memset+0x1f4>
    80007b08:	1a078e63          	beqz	a5,80007cc4 <__memset+0x1ec>
    80007b0c:	00b50023          	sb	a1,0(a0)
    80007b10:	00100713          	li	a4,1
    80007b14:	1ae78463          	beq	a5,a4,80007cbc <__memset+0x1e4>
    80007b18:	00b500a3          	sb	a1,1(a0)
    80007b1c:	00200713          	li	a4,2
    80007b20:	1ae78a63          	beq	a5,a4,80007cd4 <__memset+0x1fc>
    80007b24:	00b50123          	sb	a1,2(a0)
    80007b28:	00300713          	li	a4,3
    80007b2c:	18e78463          	beq	a5,a4,80007cb4 <__memset+0x1dc>
    80007b30:	00b501a3          	sb	a1,3(a0)
    80007b34:	00400713          	li	a4,4
    80007b38:	1ae78263          	beq	a5,a4,80007cdc <__memset+0x204>
    80007b3c:	00b50223          	sb	a1,4(a0)
    80007b40:	00500713          	li	a4,5
    80007b44:	1ae78063          	beq	a5,a4,80007ce4 <__memset+0x20c>
    80007b48:	00b502a3          	sb	a1,5(a0)
    80007b4c:	00700713          	li	a4,7
    80007b50:	18e79e63          	bne	a5,a4,80007cec <__memset+0x214>
    80007b54:	00b50323          	sb	a1,6(a0)
    80007b58:	00700e93          	li	t4,7
    80007b5c:	00859713          	slli	a4,a1,0x8
    80007b60:	00e5e733          	or	a4,a1,a4
    80007b64:	01059e13          	slli	t3,a1,0x10
    80007b68:	01c76e33          	or	t3,a4,t3
    80007b6c:	01859313          	slli	t1,a1,0x18
    80007b70:	006e6333          	or	t1,t3,t1
    80007b74:	02059893          	slli	a7,a1,0x20
    80007b78:	40f60e3b          	subw	t3,a2,a5
    80007b7c:	011368b3          	or	a7,t1,a7
    80007b80:	02859813          	slli	a6,a1,0x28
    80007b84:	0108e833          	or	a6,a7,a6
    80007b88:	03059693          	slli	a3,a1,0x30
    80007b8c:	003e589b          	srliw	a7,t3,0x3
    80007b90:	00d866b3          	or	a3,a6,a3
    80007b94:	03859713          	slli	a4,a1,0x38
    80007b98:	00389813          	slli	a6,a7,0x3
    80007b9c:	00f507b3          	add	a5,a0,a5
    80007ba0:	00e6e733          	or	a4,a3,a4
    80007ba4:	000e089b          	sext.w	a7,t3
    80007ba8:	00f806b3          	add	a3,a6,a5
    80007bac:	00e7b023          	sd	a4,0(a5)
    80007bb0:	00878793          	addi	a5,a5,8
    80007bb4:	fed79ce3          	bne	a5,a3,80007bac <__memset+0xd4>
    80007bb8:	ff8e7793          	andi	a5,t3,-8
    80007bbc:	0007871b          	sext.w	a4,a5
    80007bc0:	01d787bb          	addw	a5,a5,t4
    80007bc4:	0ce88e63          	beq	a7,a4,80007ca0 <__memset+0x1c8>
    80007bc8:	00f50733          	add	a4,a0,a5
    80007bcc:	00b70023          	sb	a1,0(a4)
    80007bd0:	0017871b          	addiw	a4,a5,1
    80007bd4:	0cc77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007bd8:	00e50733          	add	a4,a0,a4
    80007bdc:	00b70023          	sb	a1,0(a4)
    80007be0:	0027871b          	addiw	a4,a5,2
    80007be4:	0ac77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007be8:	00e50733          	add	a4,a0,a4
    80007bec:	00b70023          	sb	a1,0(a4)
    80007bf0:	0037871b          	addiw	a4,a5,3
    80007bf4:	0ac77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007bf8:	00e50733          	add	a4,a0,a4
    80007bfc:	00b70023          	sb	a1,0(a4)
    80007c00:	0047871b          	addiw	a4,a5,4
    80007c04:	08c77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c08:	00e50733          	add	a4,a0,a4
    80007c0c:	00b70023          	sb	a1,0(a4)
    80007c10:	0057871b          	addiw	a4,a5,5
    80007c14:	08c77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c18:	00e50733          	add	a4,a0,a4
    80007c1c:	00b70023          	sb	a1,0(a4)
    80007c20:	0067871b          	addiw	a4,a5,6
    80007c24:	06c77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c28:	00e50733          	add	a4,a0,a4
    80007c2c:	00b70023          	sb	a1,0(a4)
    80007c30:	0077871b          	addiw	a4,a5,7
    80007c34:	06c77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c38:	00e50733          	add	a4,a0,a4
    80007c3c:	00b70023          	sb	a1,0(a4)
    80007c40:	0087871b          	addiw	a4,a5,8
    80007c44:	04c77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c48:	00e50733          	add	a4,a0,a4
    80007c4c:	00b70023          	sb	a1,0(a4)
    80007c50:	0097871b          	addiw	a4,a5,9
    80007c54:	04c77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c58:	00e50733          	add	a4,a0,a4
    80007c5c:	00b70023          	sb	a1,0(a4)
    80007c60:	00a7871b          	addiw	a4,a5,10
    80007c64:	02c77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c68:	00e50733          	add	a4,a0,a4
    80007c6c:	00b70023          	sb	a1,0(a4)
    80007c70:	00b7871b          	addiw	a4,a5,11
    80007c74:	02c77663          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c78:	00e50733          	add	a4,a0,a4
    80007c7c:	00b70023          	sb	a1,0(a4)
    80007c80:	00c7871b          	addiw	a4,a5,12
    80007c84:	00c77e63          	bgeu	a4,a2,80007ca0 <__memset+0x1c8>
    80007c88:	00e50733          	add	a4,a0,a4
    80007c8c:	00b70023          	sb	a1,0(a4)
    80007c90:	00d7879b          	addiw	a5,a5,13
    80007c94:	00c7f663          	bgeu	a5,a2,80007ca0 <__memset+0x1c8>
    80007c98:	00f507b3          	add	a5,a0,a5
    80007c9c:	00b78023          	sb	a1,0(a5)
    80007ca0:	00813403          	ld	s0,8(sp)
    80007ca4:	01010113          	addi	sp,sp,16
    80007ca8:	00008067          	ret
    80007cac:	00b00693          	li	a3,11
    80007cb0:	e55ff06f          	j	80007b04 <__memset+0x2c>
    80007cb4:	00300e93          	li	t4,3
    80007cb8:	ea5ff06f          	j	80007b5c <__memset+0x84>
    80007cbc:	00100e93          	li	t4,1
    80007cc0:	e9dff06f          	j	80007b5c <__memset+0x84>
    80007cc4:	00000e93          	li	t4,0
    80007cc8:	e95ff06f          	j	80007b5c <__memset+0x84>
    80007ccc:	00000793          	li	a5,0
    80007cd0:	ef9ff06f          	j	80007bc8 <__memset+0xf0>
    80007cd4:	00200e93          	li	t4,2
    80007cd8:	e85ff06f          	j	80007b5c <__memset+0x84>
    80007cdc:	00400e93          	li	t4,4
    80007ce0:	e7dff06f          	j	80007b5c <__memset+0x84>
    80007ce4:	00500e93          	li	t4,5
    80007ce8:	e75ff06f          	j	80007b5c <__memset+0x84>
    80007cec:	00600e93          	li	t4,6
    80007cf0:	e6dff06f          	j	80007b5c <__memset+0x84>

0000000080007cf4 <__memmove>:
    80007cf4:	ff010113          	addi	sp,sp,-16
    80007cf8:	00813423          	sd	s0,8(sp)
    80007cfc:	01010413          	addi	s0,sp,16
    80007d00:	0e060863          	beqz	a2,80007df0 <__memmove+0xfc>
    80007d04:	fff6069b          	addiw	a3,a2,-1
    80007d08:	0006881b          	sext.w	a6,a3
    80007d0c:	0ea5e863          	bltu	a1,a0,80007dfc <__memmove+0x108>
    80007d10:	00758713          	addi	a4,a1,7
    80007d14:	00a5e7b3          	or	a5,a1,a0
    80007d18:	40a70733          	sub	a4,a4,a0
    80007d1c:	0077f793          	andi	a5,a5,7
    80007d20:	00f73713          	sltiu	a4,a4,15
    80007d24:	00174713          	xori	a4,a4,1
    80007d28:	0017b793          	seqz	a5,a5
    80007d2c:	00e7f7b3          	and	a5,a5,a4
    80007d30:	10078863          	beqz	a5,80007e40 <__memmove+0x14c>
    80007d34:	00900793          	li	a5,9
    80007d38:	1107f463          	bgeu	a5,a6,80007e40 <__memmove+0x14c>
    80007d3c:	0036581b          	srliw	a6,a2,0x3
    80007d40:	fff8081b          	addiw	a6,a6,-1
    80007d44:	02081813          	slli	a6,a6,0x20
    80007d48:	01d85893          	srli	a7,a6,0x1d
    80007d4c:	00858813          	addi	a6,a1,8
    80007d50:	00058793          	mv	a5,a1
    80007d54:	00050713          	mv	a4,a0
    80007d58:	01088833          	add	a6,a7,a6
    80007d5c:	0007b883          	ld	a7,0(a5)
    80007d60:	00878793          	addi	a5,a5,8
    80007d64:	00870713          	addi	a4,a4,8
    80007d68:	ff173c23          	sd	a7,-8(a4)
    80007d6c:	ff0798e3          	bne	a5,a6,80007d5c <__memmove+0x68>
    80007d70:	ff867713          	andi	a4,a2,-8
    80007d74:	02071793          	slli	a5,a4,0x20
    80007d78:	0207d793          	srli	a5,a5,0x20
    80007d7c:	00f585b3          	add	a1,a1,a5
    80007d80:	40e686bb          	subw	a3,a3,a4
    80007d84:	00f507b3          	add	a5,a0,a5
    80007d88:	06e60463          	beq	a2,a4,80007df0 <__memmove+0xfc>
    80007d8c:	0005c703          	lbu	a4,0(a1)
    80007d90:	00e78023          	sb	a4,0(a5)
    80007d94:	04068e63          	beqz	a3,80007df0 <__memmove+0xfc>
    80007d98:	0015c603          	lbu	a2,1(a1)
    80007d9c:	00100713          	li	a4,1
    80007da0:	00c780a3          	sb	a2,1(a5)
    80007da4:	04e68663          	beq	a3,a4,80007df0 <__memmove+0xfc>
    80007da8:	0025c603          	lbu	a2,2(a1)
    80007dac:	00200713          	li	a4,2
    80007db0:	00c78123          	sb	a2,2(a5)
    80007db4:	02e68e63          	beq	a3,a4,80007df0 <__memmove+0xfc>
    80007db8:	0035c603          	lbu	a2,3(a1)
    80007dbc:	00300713          	li	a4,3
    80007dc0:	00c781a3          	sb	a2,3(a5)
    80007dc4:	02e68663          	beq	a3,a4,80007df0 <__memmove+0xfc>
    80007dc8:	0045c603          	lbu	a2,4(a1)
    80007dcc:	00400713          	li	a4,4
    80007dd0:	00c78223          	sb	a2,4(a5)
    80007dd4:	00e68e63          	beq	a3,a4,80007df0 <__memmove+0xfc>
    80007dd8:	0055c603          	lbu	a2,5(a1)
    80007ddc:	00500713          	li	a4,5
    80007de0:	00c782a3          	sb	a2,5(a5)
    80007de4:	00e68663          	beq	a3,a4,80007df0 <__memmove+0xfc>
    80007de8:	0065c703          	lbu	a4,6(a1)
    80007dec:	00e78323          	sb	a4,6(a5)
    80007df0:	00813403          	ld	s0,8(sp)
    80007df4:	01010113          	addi	sp,sp,16
    80007df8:	00008067          	ret
    80007dfc:	02061713          	slli	a4,a2,0x20
    80007e00:	02075713          	srli	a4,a4,0x20
    80007e04:	00e587b3          	add	a5,a1,a4
    80007e08:	f0f574e3          	bgeu	a0,a5,80007d10 <__memmove+0x1c>
    80007e0c:	02069613          	slli	a2,a3,0x20
    80007e10:	02065613          	srli	a2,a2,0x20
    80007e14:	fff64613          	not	a2,a2
    80007e18:	00e50733          	add	a4,a0,a4
    80007e1c:	00c78633          	add	a2,a5,a2
    80007e20:	fff7c683          	lbu	a3,-1(a5)
    80007e24:	fff78793          	addi	a5,a5,-1
    80007e28:	fff70713          	addi	a4,a4,-1
    80007e2c:	00d70023          	sb	a3,0(a4)
    80007e30:	fec798e3          	bne	a5,a2,80007e20 <__memmove+0x12c>
    80007e34:	00813403          	ld	s0,8(sp)
    80007e38:	01010113          	addi	sp,sp,16
    80007e3c:	00008067          	ret
    80007e40:	02069713          	slli	a4,a3,0x20
    80007e44:	02075713          	srli	a4,a4,0x20
    80007e48:	00170713          	addi	a4,a4,1
    80007e4c:	00e50733          	add	a4,a0,a4
    80007e50:	00050793          	mv	a5,a0
    80007e54:	0005c683          	lbu	a3,0(a1)
    80007e58:	00178793          	addi	a5,a5,1
    80007e5c:	00158593          	addi	a1,a1,1
    80007e60:	fed78fa3          	sb	a3,-1(a5)
    80007e64:	fee798e3          	bne	a5,a4,80007e54 <__memmove+0x160>
    80007e68:	f89ff06f          	j	80007df0 <__memmove+0xfc>

0000000080007e6c <__putc>:
    80007e6c:	fe010113          	addi	sp,sp,-32
    80007e70:	00813823          	sd	s0,16(sp)
    80007e74:	00113c23          	sd	ra,24(sp)
    80007e78:	02010413          	addi	s0,sp,32
    80007e7c:	00050793          	mv	a5,a0
    80007e80:	fef40593          	addi	a1,s0,-17
    80007e84:	00100613          	li	a2,1
    80007e88:	00000513          	li	a0,0
    80007e8c:	fef407a3          	sb	a5,-17(s0)
    80007e90:	fffff097          	auipc	ra,0xfffff
    80007e94:	b3c080e7          	jalr	-1220(ra) # 800069cc <console_write>
    80007e98:	01813083          	ld	ra,24(sp)
    80007e9c:	01013403          	ld	s0,16(sp)
    80007ea0:	02010113          	addi	sp,sp,32
    80007ea4:	00008067          	ret

0000000080007ea8 <__getc>:
    80007ea8:	fe010113          	addi	sp,sp,-32
    80007eac:	00813823          	sd	s0,16(sp)
    80007eb0:	00113c23          	sd	ra,24(sp)
    80007eb4:	02010413          	addi	s0,sp,32
    80007eb8:	fe840593          	addi	a1,s0,-24
    80007ebc:	00100613          	li	a2,1
    80007ec0:	00000513          	li	a0,0
    80007ec4:	fffff097          	auipc	ra,0xfffff
    80007ec8:	ae8080e7          	jalr	-1304(ra) # 800069ac <console_read>
    80007ecc:	fe844503          	lbu	a0,-24(s0)
    80007ed0:	01813083          	ld	ra,24(sp)
    80007ed4:	01013403          	ld	s0,16(sp)
    80007ed8:	02010113          	addi	sp,sp,32
    80007edc:	00008067          	ret

0000000080007ee0 <console_handler>:
    80007ee0:	fe010113          	addi	sp,sp,-32
    80007ee4:	00813823          	sd	s0,16(sp)
    80007ee8:	00113c23          	sd	ra,24(sp)
    80007eec:	00913423          	sd	s1,8(sp)
    80007ef0:	02010413          	addi	s0,sp,32
    80007ef4:	14202773          	csrr	a4,scause
    80007ef8:	100027f3          	csrr	a5,sstatus
    80007efc:	0027f793          	andi	a5,a5,2
    80007f00:	06079e63          	bnez	a5,80007f7c <console_handler+0x9c>
    80007f04:	00074c63          	bltz	a4,80007f1c <console_handler+0x3c>
    80007f08:	01813083          	ld	ra,24(sp)
    80007f0c:	01013403          	ld	s0,16(sp)
    80007f10:	00813483          	ld	s1,8(sp)
    80007f14:	02010113          	addi	sp,sp,32
    80007f18:	00008067          	ret
    80007f1c:	0ff77713          	andi	a4,a4,255
    80007f20:	00900793          	li	a5,9
    80007f24:	fef712e3          	bne	a4,a5,80007f08 <console_handler+0x28>
    80007f28:	ffffe097          	auipc	ra,0xffffe
    80007f2c:	6dc080e7          	jalr	1756(ra) # 80006604 <plic_claim>
    80007f30:	00a00793          	li	a5,10
    80007f34:	00050493          	mv	s1,a0
    80007f38:	02f50c63          	beq	a0,a5,80007f70 <console_handler+0x90>
    80007f3c:	fc0506e3          	beqz	a0,80007f08 <console_handler+0x28>
    80007f40:	00050593          	mv	a1,a0
    80007f44:	00000517          	auipc	a0,0x0
    80007f48:	6ec50513          	addi	a0,a0,1772 # 80008630 <CONSOLE_STATUS+0x620>
    80007f4c:	fffff097          	auipc	ra,0xfffff
    80007f50:	afc080e7          	jalr	-1284(ra) # 80006a48 <__printf>
    80007f54:	01013403          	ld	s0,16(sp)
    80007f58:	01813083          	ld	ra,24(sp)
    80007f5c:	00048513          	mv	a0,s1
    80007f60:	00813483          	ld	s1,8(sp)
    80007f64:	02010113          	addi	sp,sp,32
    80007f68:	ffffe317          	auipc	t1,0xffffe
    80007f6c:	6d430067          	jr	1748(t1) # 8000663c <plic_complete>
    80007f70:	fffff097          	auipc	ra,0xfffff
    80007f74:	3e0080e7          	jalr	992(ra) # 80007350 <uartintr>
    80007f78:	fddff06f          	j	80007f54 <console_handler+0x74>
    80007f7c:	00000517          	auipc	a0,0x0
    80007f80:	7b450513          	addi	a0,a0,1972 # 80008730 <digits+0x78>
    80007f84:	fffff097          	auipc	ra,0xfffff
    80007f88:	a68080e7          	jalr	-1432(ra) # 800069ec <panic>
	...
