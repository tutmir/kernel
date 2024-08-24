
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	ef013103          	ld	sp,-272(sp) # 80009ef0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3b4050ef          	jal	ra,800053d0 <start>

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
    800011e0:	730000ef          	jal	ra,80001910 <_ZN5Riscv20handleTimerInterruptEv>

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
    800012f0:	640000ef          	jal	ra,80001930 <_ZN5Riscv22handleConsoleInterruptEv>

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
    8000142c:	d60080e7          	jalr	-672(ra) # 80002188 <_ZN15MemoryAllocator9mem_allocEm>

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
    80001474:	f00080e7          	jalr	-256(ra) # 80002370 <_ZN15MemoryAllocator8mem_freeEPv>
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
    8000149c:	4c0080e7          	jalr	1216(ra) # 80001958 <_Znwm>
    800014a0:	00050493          	mv	s1,a0
    800014a4:	000a8693          	mv	a3,s5
    800014a8:	000a0613          	mv	a2,s4
    800014ac:	00090593          	mv	a1,s2
    800014b0:	00001097          	auipc	ra,0x1
    800014b4:	b1c080e7          	jalr	-1252(ra) # 80001fcc <_ZN3TCBC1EPFvPvES0_S0_>
    800014b8:	0099b023          	sd	s1,0(s3)
     if(telo != nullptr)
    800014bc:	00090863          	beqz	s2,800014cc <_ZN5Riscv20handleSupervisorTrapEv+0x124>
       Scheduler::stavi(*handle);
    800014c0:	00048513          	mv	a0,s1
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	574080e7          	jalr	1396(ra) # 80001a38 <_ZN9Scheduler5staviEP3TCB>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800014cc:	00000793          	li	a5,0
    800014d0:	14079073          	csrw	sscratch,a5
       break;
    800014d4:	f65ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    800014d8:	00050913          	mv	s2,a0
     *handle = (thread_t) new TCB(telo, argumenti, stek);
    800014dc:	00048513          	mv	a0,s1
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	4c8080e7          	jalr	1224(ra) # 800019a8 <_ZdlPv>
    800014e8:	00090513          	mv	a0,s2
    800014ec:	0000a097          	auipc	ra,0xa
    800014f0:	bcc080e7          	jalr	-1076(ra) # 8000b0b8 <_Unwind_Resume>
       TCB::trenutnaNit->exit();
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	be0080e7          	jalr	-1056(ra) # 800020d4 <_ZN3TCB4exitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800014fc:	00000793          	li	a5,0
    80001500:	14079073          	csrw	sscratch,a5
       break;
    80001504:	f35ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       TCB::dispatch();
    80001508:	00001097          	auipc	ra,0x1
    8000150c:	b58080e7          	jalr	-1192(ra) # 80002060 <_ZN3TCB8dispatchEv>
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
    80001524:	518080e7          	jalr	1304(ra) # 80001a38 <_ZN9Scheduler5staviEP3TCB>
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
    80001544:	418080e7          	jalr	1048(ra) # 80001958 <_Znwm>
    80001548:	00050493          	mv	s1,a0
    8000154c:	000a8693          	mv	a3,s5
    80001550:	000a0613          	mv	a2,s4
    80001554:	00098593          	mv	a1,s3
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	a74080e7          	jalr	-1420(ra) # 80001fcc <_ZN3TCBC1EPFvPvES0_S0_>
    80001560:	00993023          	sd	s1,0(s2)
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    80001564:	00000793          	li	a5,0
    80001568:	14079073          	csrw	sscratch,a5
       break;
    8000156c:	ecdff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
    80001570:	00050913          	mv	s2,a0
    80001574:	00048513          	mv	a0,s1
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	430080e7          	jalr	1072(ra) # 800019a8 <_ZdlPv>
    80001580:	00090513          	mv	a0,s2
    80001584:	0000a097          	auipc	ra,0xa
    80001588:	b34080e7          	jalr	-1228(ra) # 8000b0b8 <_Unwind_Resume>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    8000158c:	00058513          	mv	a0,a1
       __asm__ volatile("mv %0, a2" : "=r"(init));
    80001590:	00060593          	mv	a1,a2
       pv = MojSemafor::sem_open(handle, init);
    80001594:	0005859b          	sext.w	a1,a1
    80001598:	00001097          	auipc	ra,0x1
    8000159c:	f64080e7          	jalr	-156(ra) # 800024fc <_ZN10MojSemafor8sem_openEPPS_j>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015a0:	14051073          	csrw	sscratch,a0
       break;
    800015a4:	e95ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(handle));
    800015a8:	00058513          	mv	a0,a1
       pv = handle->close();
    800015ac:	00001097          	auipc	ra,0x1
    800015b0:	110080e7          	jalr	272(ra) # 800026bc <_ZN10MojSemafor5closeEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015b4:	14051073          	csrw	sscratch,a0
       break;
    800015b8:	e81ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015bc:	00058513          	mv	a0,a1
       pv = id->wait();
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	03c080e7          	jalr	60(ra) # 800025fc <_ZN10MojSemafor4waitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015c8:	14051073          	csrw	sscratch,a0
       break;
    800015cc:	e6dff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015d0:	00058513          	mv	a0,a1
       pv = id->signal();
    800015d4:	00001097          	auipc	ra,0x1
    800015d8:	f8c080e7          	jalr	-116(ra) # 80002560 <_ZN10MojSemafor6signalEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015dc:	14051073          	csrw	sscratch,a0
       break;
    800015e0:	e59ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile("mv %0, a1" : "=r"(id));
    800015e4:	00058513          	mv	a0,a1
       pv = id->trywait();
    800015e8:	00001097          	auipc	ra,0x1
    800015ec:	1a0080e7          	jalr	416(ra) # 80002788 <_ZN10MojSemafor7trywaitEv>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    800015f0:	14051073          	csrw	sscratch,a0
       break;
    800015f4:	e45ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       pv = __getc();
    800015f8:	00006097          	auipc	ra,0x6
    800015fc:	ed0080e7          	jalr	-304(ra) # 800074c8 <__getc>
       __asm__ volatile ("csrw sscratch, %0" : : "r"(pv));
    80001600:	14051073          	csrw	sscratch,a0
       break;
    80001604:	e35ff06f          	j	80001438 <_ZN5Riscv20handleSupervisorTrapEv+0x90>
       __asm__ volatile ("mv %0, a1" : "=r"(c));
    80001608:	00058513          	mv	a0,a1
       __putc(c);
    8000160c:	0ff57513          	andi	a0,a0,255
    80001610:	00006097          	auipc	ra,0x6
    80001614:	e7c080e7          	jalr	-388(ra) # 8000748c <__putc>
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
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00813423          	sd	s0,8(sp)
    800017ec:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a2, %0" : : "r"(handle));
    800017f0:	00050613          	mv	a2,a0
  __asm__ volatile("mv a1, %0" : : "r"(init));
    800017f4:	00058593          	mv	a1,a1
  __asm__ volatile("li a0, 0x21");
    800017f8:	02100513          	li	a0,33
  __asm__ volatile("ecall");
    800017fc:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001800:	00050513          	mv	a0,a0
  return pv;
}
    80001804:	0005051b          	sext.w	a0,a0
    80001808:	00813403          	ld	s0,8(sp)
    8000180c:	01010113          	addi	sp,sp,16
    80001810:	00008067          	ret

0000000080001814 <_Z9sem_closeP10MojSemafor>:

int sem_close(sem_t handle)
{
    80001814:	ff010113          	addi	sp,sp,-16
    80001818:	00813423          	sd	s0,8(sp)
    8000181c:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(handle));
    80001820:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x22");
    80001824:	02200513          	li	a0,34
  __asm__ volatile("ecall");
    80001828:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    8000182c:	00050513          	mv	a0,a0
  return pv;
}
    80001830:	0005051b          	sext.w	a0,a0
    80001834:	00813403          	ld	s0,8(sp)
    80001838:	01010113          	addi	sp,sp,16
    8000183c:	00008067          	ret

0000000080001840 <_Z8sem_waitP10MojSemafor>:

int sem_wait(sem_t id)
{
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00813423          	sd	s0,8(sp)
    80001848:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    8000184c:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x23");
    80001850:	02300513          	li	a0,35
  __asm__ volatile("ecall");
    80001854:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001858:	00050513          	mv	a0,a0
  return pv;
}
    8000185c:	0005051b          	sext.w	a0,a0
    80001860:	00813403          	ld	s0,8(sp)
    80001864:	01010113          	addi	sp,sp,16
    80001868:	00008067          	ret

000000008000186c <_Z10sem_signalP10MojSemafor>:

int sem_signal(sem_t id)
{
    8000186c:	ff010113          	addi	sp,sp,-16
    80001870:	00813423          	sd	s0,8(sp)
    80001874:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    80001878:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x24");
    8000187c:	02400513          	li	a0,36
  __asm__ volatile("ecall");
    80001880:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    80001884:	00050513          	mv	a0,a0
  return pv;
}
    80001888:	0005051b          	sext.w	a0,a0
    8000188c:	00813403          	ld	s0,8(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <_Z11sem_trywaitP10MojSemafor>:

int sem_trywait(sem_t id)
{
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813423          	sd	s0,8(sp)
    800018a0:	01010413          	addi	s0,sp,16
  uint64 pv;
  __asm__ volatile("mv a1, %0" : : "r"(id));
    800018a4:	00050593          	mv	a1,a0
  __asm__ volatile("li a0, 0x26");
    800018a8:	02600513          	li	a0,38
  __asm__ volatile("ecall");
    800018ac:	00000073          	ecall
  __asm__ volatile("mv %0, a0" : "=r"(pv));
    800018b0:	00050513          	mv	a0,a0
  return pv;
}
    800018b4:	0005051b          	sext.w	a0,a0
    800018b8:	00813403          	ld	s0,8(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret

00000000800018c4 <_Z4getcv>:

char getc()
{
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813423          	sd	s0,8(sp)
    800018cc:	01010413          	addi	s0,sp,16
  char c;
  __asm__ volatile ("li a0, 0x41");
    800018d0:	04100513          	li	a0,65
  __asm__ volatile ("ecall");
    800018d4:	00000073          	ecall
  __asm__ volatile ("mv %0, a0" : "=r"(c));
    800018d8:	00050513          	mv	a0,a0
  return c;
}
    800018dc:	0ff57513          	andi	a0,a0,255
    800018e0:	00813403          	ld	s0,8(sp)
    800018e4:	01010113          	addi	sp,sp,16
    800018e8:	00008067          	ret

00000000800018ec <_Z4putcc>:

void putc(char c)
{
    800018ec:	ff010113          	addi	sp,sp,-16
    800018f0:	00813423          	sd	s0,8(sp)
    800018f4:	01010413          	addi	s0,sp,16
  __asm__ volatile("mv a1, %0" : : "r"(c));
    800018f8:	00050593          	mv	a1,a0
  __asm__ volatile ("li a0, 0x42");
    800018fc:	04200513          	li	a0,66
  __asm__ volatile ("ecall");
    80001900:	00000073          	ecall

}
    80001904:	00813403          	ld	s0,8(sp)
    80001908:	01010113          	addi	sp,sp,16
    8000190c:	00008067          	ret

0000000080001910 <_ZN5Riscv20handleTimerInterruptEv>:

void Riscv::handleTimerInterrupt() {
    80001910:	ff010113          	addi	sp,sp,-16
    80001914:	00813423          	sd	s0,8(sp)
    80001918:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000191c:	00200793          	li	a5,2
    80001920:	1447b073          	csrc	sip,a5
  mc_sip(SIP_SSIP);
}
    80001924:	00813403          	ld	s0,8(sp)
    80001928:	01010113          	addi	sp,sp,16
    8000192c:	00008067          	ret

0000000080001930 <_ZN5Riscv22handleConsoleInterruptEv>:

void Riscv::handleConsoleInterrupt() {
    80001930:	ff010113          	addi	sp,sp,-16
    80001934:	00113423          	sd	ra,8(sp)
    80001938:	00813023          	sd	s0,0(sp)
    8000193c:	01010413          	addi	s0,sp,16
  console_handler();
    80001940:	00006097          	auipc	ra,0x6
    80001944:	bc0080e7          	jalr	-1088(ra) # 80007500 <console_handler>
}
    80001948:	00813083          	ld	ra,8(sp)
    8000194c:	00013403          	ld	s0,0(sp)
    80001950:	01010113          	addi	sp,sp,16
    80001954:	00008067          	ret

0000000080001958 <_Znwm>:
//

#include "../h/syscall_c.h"

void* operator new(size_t velicina)
{
    80001958:	ff010113          	addi	sp,sp,-16
    8000195c:	00113423          	sd	ra,8(sp)
    80001960:	00813023          	sd	s0,0(sp)
    80001964:	01010413          	addi	s0,sp,16
  return mem_alloc(velicina);
    80001968:	00000097          	auipc	ra,0x0
    8000196c:	ce0080e7          	jalr	-800(ra) # 80001648 <_Z9mem_allocm>
}
    80001970:	00813083          	ld	ra,8(sp)
    80001974:	00013403          	ld	s0,0(sp)
    80001978:	01010113          	addi	sp,sp,16
    8000197c:	00008067          	ret

0000000080001980 <_Znam>:

void* operator new[](size_t velicina)
{
    80001980:	ff010113          	addi	sp,sp,-16
    80001984:	00113423          	sd	ra,8(sp)
    80001988:	00813023          	sd	s0,0(sp)
    8000198c:	01010413          	addi	s0,sp,16
  return mem_alloc(velicina);
    80001990:	00000097          	auipc	ra,0x0
    80001994:	cb8080e7          	jalr	-840(ra) # 80001648 <_Z9mem_allocm>
}
    80001998:	00813083          	ld	ra,8(sp)
    8000199c:	00013403          	ld	s0,0(sp)
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret

00000000800019a8 <_ZdlPv>:

void operator delete(void* pokazivac) noexcept
{
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00113423          	sd	ra,8(sp)
    800019b0:	00813023          	sd	s0,0(sp)
    800019b4:	01010413          	addi	s0,sp,16
  mem_free(pokazivac);
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	c64080e7          	jalr	-924(ra) # 8000161c <_Z8mem_freePv>
}
    800019c0:	00813083          	ld	ra,8(sp)
    800019c4:	00013403          	ld	s0,0(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_ZdaPv>:

void operator delete[](void* pokazivac) noexcept
{
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00113423          	sd	ra,8(sp)
    800019d8:	00813023          	sd	s0,0(sp)
    800019dc:	01010413          	addi	s0,sp,16
  mem_free(pokazivac);
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	c3c080e7          	jalr	-964(ra) # 8000161c <_Z8mem_freePv>
}
    800019e8:	00813083          	ld	ra,8(sp)
    800019ec:	00013403          	ld	s0,0(sp)
    800019f0:	01010113          	addi	sp,sp,16
    800019f4:	00008067          	ret

00000000800019f8 <_Z41__static_initialization_and_destruction_0ii>:
}

TCB* Scheduler::uzmi()
{
   return listaNiti.izbaciPrvi();
    800019f8:	ff010113          	addi	sp,sp,-16
    800019fc:	00813423          	sd	s0,8(sp)
    80001a00:	01010413          	addi	s0,sp,16
    80001a04:	00100793          	li	a5,1
    80001a08:	00f50863          	beq	a0,a5,80001a18 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001a0c:	00813403          	ld	s0,8(sp)
    80001a10:	01010113          	addi	sp,sp,16
    80001a14:	00008067          	ret
    80001a18:	000107b7          	lui	a5,0x10
    80001a1c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001a20:	fef596e3          	bne	a1,a5,80001a0c <_Z41__static_initialization_and_destruction_0ii+0x14>

  Cvor *pocetak, *kraj;

public:

Lista(): pocetak(nullptr), kraj(nullptr) {}
    80001a24:	00008797          	auipc	a5,0x8
    80001a28:	54c78793          	addi	a5,a5,1356 # 80009f70 <_ZN9Scheduler9listaNitiE>
    80001a2c:	0007b023          	sd	zero,0(a5)
    80001a30:	0007b423          	sd	zero,8(a5)
    80001a34:	fd9ff06f          	j	80001a0c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001a38 <_ZN9Scheduler5staviEP3TCB>:
{
    80001a38:	fe010113          	addi	sp,sp,-32
    80001a3c:	00113c23          	sd	ra,24(sp)
    80001a40:	00813823          	sd	s0,16(sp)
    80001a44:	00913423          	sd	s1,8(sp)
    80001a48:	02010413          	addi	s0,sp,32
    80001a4c:	00050493          	mv	s1,a0
  kraj = noviCvor;
}

void dodajNaKraj(T* t)
{
Cvor *noviCvor = new Cvor(t, nullptr);
    80001a50:	01000513          	li	a0,16
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	f04080e7          	jalr	-252(ra) # 80001958 <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80001a5c:	00953023          	sd	s1,0(a0) # 1000 <_entry-0x7ffff000>
    80001a60:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    80001a64:	00008797          	auipc	a5,0x8
    80001a68:	5147b783          	ld	a5,1300(a5) # 80009f78 <_ZN9Scheduler9listaNitiE+0x8>
    80001a6c:	02078263          	beqz	a5,80001a90 <_ZN9Scheduler5staviEP3TCB+0x58>
  {
     kraj = kraj->sledeci = noviCvor;
    80001a70:	00a7b423          	sd	a0,8(a5)
    80001a74:	00008797          	auipc	a5,0x8
    80001a78:	50a7b223          	sd	a0,1284(a5) # 80009f78 <_ZN9Scheduler9listaNitiE+0x8>
}
    80001a7c:	01813083          	ld	ra,24(sp)
    80001a80:	01013403          	ld	s0,16(sp)
    80001a84:	00813483          	ld	s1,8(sp)
    80001a88:	02010113          	addi	sp,sp,32
    80001a8c:	00008067          	ret
  }
  else
  {
    pocetak = kraj = noviCvor;
    80001a90:	00008797          	auipc	a5,0x8
    80001a94:	4e078793          	addi	a5,a5,1248 # 80009f70 <_ZN9Scheduler9listaNitiE>
    80001a98:	00a7b423          	sd	a0,8(a5)
    80001a9c:	00a7b023          	sd	a0,0(a5)
    80001aa0:	fddff06f          	j	80001a7c <_ZN9Scheduler5staviEP3TCB+0x44>

0000000080001aa4 <_ZN9Scheduler4uzmiEv>:
{
    80001aa4:	fe010113          	addi	sp,sp,-32
    80001aa8:	00113c23          	sd	ra,24(sp)
    80001aac:	00813823          	sd	s0,16(sp)
    80001ab0:	00913423          	sd	s1,8(sp)
    80001ab4:	02010413          	addi	s0,sp,32
  }
}

T* izbaciPrvi()
{
  if(pocetak == nullptr)
    80001ab8:	00008517          	auipc	a0,0x8
    80001abc:	4b853503          	ld	a0,1208(a0) # 80009f70 <_ZN9Scheduler9listaNitiE>
    80001ac0:	04050263          	beqz	a0,80001b04 <_ZN9Scheduler4uzmiEv+0x60>
    return nullptr;

  Cvor *cvor = pocetak;
  pocetak = pocetak->sledeci;
    80001ac4:	00853783          	ld	a5,8(a0)
    80001ac8:	00008717          	auipc	a4,0x8
    80001acc:	4af73423          	sd	a5,1192(a4) # 80009f70 <_ZN9Scheduler9listaNitiE>

  if(pocetak == nullptr)
    80001ad0:	02078463          	beqz	a5,80001af8 <_ZN9Scheduler4uzmiEv+0x54>
    kraj = nullptr;

  T* pv = cvor->podaci;
    80001ad4:	00053483          	ld	s1,0(a0)
  delete cvor;
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	ed0080e7          	jalr	-304(ra) # 800019a8 <_ZdlPv>
    80001ae0:	00048513          	mv	a0,s1
    80001ae4:	01813083          	ld	ra,24(sp)
    80001ae8:	01013403          	ld	s0,16(sp)
    80001aec:	00813483          	ld	s1,8(sp)
    80001af0:	02010113          	addi	sp,sp,32
    80001af4:	00008067          	ret
    kraj = nullptr;
    80001af8:	00008797          	auipc	a5,0x8
    80001afc:	4807b023          	sd	zero,1152(a5) # 80009f78 <_ZN9Scheduler9listaNitiE+0x8>
    80001b00:	fd5ff06f          	j	80001ad4 <_ZN9Scheduler4uzmiEv+0x30>
    return nullptr;
    80001b04:	00050493          	mv	s1,a0
   return listaNiti.izbaciPrvi();
    80001b08:	fd9ff06f          	j	80001ae0 <_ZN9Scheduler4uzmiEv+0x3c>

0000000080001b0c <_GLOBAL__sub_I__ZN9Scheduler9listaNitiE>:
    80001b0c:	ff010113          	addi	sp,sp,-16
    80001b10:	00113423          	sd	ra,8(sp)
    80001b14:	00813023          	sd	s0,0(sp)
    80001b18:	01010413          	addi	s0,sp,16
    80001b1c:	000105b7          	lui	a1,0x10
    80001b20:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001b24:	00100513          	li	a0,1
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	ed0080e7          	jalr	-304(ra) # 800019f8 <_Z41__static_initialization_and_destruction_0ii>
    80001b30:	00813083          	ld	ra,8(sp)
    80001b34:	00013403          	ld	s0,0(sp)
    80001b38:	01010113          	addi	sp,sp,16
    80001b3c:	00008067          	ret

0000000080001b40 <_Z11wrapperMainPv>:
#include "../h/MemoryAllocator.hpp"

extern void userMain();

void wrapperMain(void* argumenti)
{
    80001b40:	ff010113          	addi	sp,sp,-16
    80001b44:	00113423          	sd	ra,8(sp)
    80001b48:	00813023          	sd	s0,0(sp)
    80001b4c:	01010413          	addi	s0,sp,16
  userMain();
    80001b50:	00003097          	auipc	ra,0x3
    80001b54:	f30080e7          	jalr	-208(ra) # 80004a80 <_Z8userMainv>
}
    80001b58:	00813083          	ld	ra,8(sp)
    80001b5c:	00013403          	ld	s0,0(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <main>:


int main() {
    80001b68:	fc010113          	addi	sp,sp,-64
    80001b6c:	02113c23          	sd	ra,56(sp)
    80001b70:	02813823          	sd	s0,48(sp)
    80001b74:	04010413          	addi	s0,sp,64

 static void tryToJoin(DataBlock* curr);

 static void initFreeBlock() {

  MemoryAllocator::free = (DataBlock*)((char*)HEAP_START_ADDR);
    80001b78:	00008797          	auipc	a5,0x8
    80001b7c:	3507b783          	ld	a5,848(a5) # 80009ec8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b80:	0007b683          	ld	a3,0(a5)
    80001b84:	00008717          	auipc	a4,0x8
    80001b88:	34c73703          	ld	a4,844(a4) # 80009ed0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001b8c:	00d73023          	sd	a3,0(a4)
  used = nullptr;
    80001b90:	00008617          	auipc	a2,0x8
    80001b94:	37063603          	ld	a2,880(a2) # 80009f00 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001b98:	00063023          	sd	zero,0(a2)

  free->next = nullptr;
    80001b9c:	0006b023          	sd	zero,0(a3)
  free->prev  = nullptr;
    80001ba0:	00073703          	ld	a4,0(a4)
    80001ba4:	00073423          	sd	zero,8(a4)
  free->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(DataBlock)); //FOR NOW
    80001ba8:	0007b783          	ld	a5,0(a5)
    80001bac:	00008697          	auipc	a3,0x8
    80001bb0:	36c6b683          	ld	a3,876(a3) # 80009f18 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001bb4:	0006b683          	ld	a3,0(a3)
    80001bb8:	40d787b3          	sub	a5,a5,a3
    80001bbc:	fe878793          	addi	a5,a5,-24
    80001bc0:	00f73823          	sd	a5,16(a4)


  //testing purposes
  newCalled = 0;
    80001bc4:	00008797          	auipc	a5,0x8
    80001bc8:	3447b783          	ld	a5,836(a5) # 80009f08 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001bcc:	0007a023          	sw	zero,0(a5)
  newArrayCalled = 0;
    80001bd0:	00008797          	auipc	a5,0x8
    80001bd4:	3287b783          	ld	a5,808(a5) # 80009ef8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001bd8:	0007a023          	sw	zero,0(a5)
  deleteCalled= 0;
    80001bdc:	00008797          	auipc	a5,0x8
    80001be0:	3047b783          	ld	a5,772(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001be4:	0007a023          	sw	zero,0(a5)
  deleteArrayCalled = 0;
    80001be8:	00008797          	auipc	a5,0x8
    80001bec:	3007b783          	ld	a5,768(a5) # 80009ee8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bf0:	0007a023          	sw	zero,0(a5)
TCB *threads[5];


 MemoryAllocator::initFreeBlock();
 Riscv::w_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
    80001bf4:	00008797          	auipc	a5,0x8
    80001bf8:	2e47b783          	ld	a5,740(a5) # 80009ed8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001bfc:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c00:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c04:	00200793          	li	a5,2
    80001c08:	1007a073          	csrs	sstatus,a5
 Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

 thread_create(&threads[0], nullptr, nullptr);
    80001c0c:	00000613          	li	a2,0
    80001c10:	00000593          	li	a1,0
    80001c14:	fc840513          	addi	a0,s0,-56
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	a68080e7          	jalr	-1432(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
 TCB::trenutnaNit = threads[0];
    80001c20:	fc843703          	ld	a4,-56(s0)
    80001c24:	00008797          	auipc	a5,0x8
    80001c28:	2ec7b783          	ld	a5,748(a5) # 80009f10 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001c2c:	00e7b023          	sd	a4,0(a5)


 thread_create(&threads[1], &wrapperMain, nullptr);
    80001c30:	00000613          	li	a2,0
    80001c34:	00000597          	auipc	a1,0x0
    80001c38:	f0c58593          	addi	a1,a1,-244 # 80001b40 <_Z11wrapperMainPv>
    80001c3c:	fd040513          	addi	a0,s0,-48
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	a40080e7          	jalr	-1472(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>


 while( !threads[1]->daLiJeZavrsena())
    80001c48:	fd043783          	ld	a5,-48(s0)

   static TCB* trenutnaNit;

   bool daLiJeZavrsena() const
   {
      return zavrsena;
    80001c4c:	0287c783          	lbu	a5,40(a5)
    80001c50:	00079863          	bnez	a5,80001c60 <main+0xf8>
{
  thread_dispatch();
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	b4c080e7          	jalr	-1204(ra) # 800017a0 <_Z15thread_dispatchv>
    80001c5c:	fedff06f          	j	80001c48 <main+0xe0>
}

 return 0;

    80001c60:	00000513          	li	a0,0
    80001c64:	03813083          	ld	ra,56(sp)
    80001c68:	03013403          	ld	s0,48(sp)
    80001c6c:	04010113          	addi	sp,sp,64
    80001c70:	00008067          	ret

0000000080001c74 <_ZN6ThreadD1Ev>:
Thread::Thread(void (*telo)(void*), void* argumenti)
{
  thread_create(&myHandle, telo, argumenti);
}

Thread::~Thread()
    80001c74:	fe010113          	addi	sp,sp,-32
    80001c78:	00113c23          	sd	ra,24(sp)
    80001c7c:	00813823          	sd	s0,16(sp)
    80001c80:	00913423          	sd	s1,8(sp)
    80001c84:	02010413          	addi	s0,sp,32
    80001c88:	00008797          	auipc	a5,0x8
    80001c8c:	0d078793          	addi	a5,a5,208 # 80009d58 <_ZTV6Thread+0x10>
    80001c90:	00f53023          	sd	a5,0(a0)
{
 delete myHandle;
    80001c94:	00853483          	ld	s1,8(a0)
    80001c98:	02048063          	beqz	s1,80001cb8 <_ZN6ThreadD1Ev+0x44>
     return this->blokirana;
   }

   ~TCB()
   {
     delete stek;
    80001c9c:	0084b503          	ld	a0,8(s1)
    80001ca0:	00050663          	beqz	a0,80001cac <_ZN6ThreadD1Ev+0x38>
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	d04080e7          	jalr	-764(ra) # 800019a8 <_ZdlPv>
    80001cac:	00048513          	mv	a0,s1
    80001cb0:	00000097          	auipc	ra,0x0
    80001cb4:	cf8080e7          	jalr	-776(ra) # 800019a8 <_ZdlPv>
}
    80001cb8:	01813083          	ld	ra,24(sp)
    80001cbc:	01013403          	ld	s0,16(sp)
    80001cc0:	00813483          	ld	s1,8(sp)
    80001cc4:	02010113          	addi	sp,sp,32
    80001cc8:	00008067          	ret

0000000080001ccc <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80001ccc:	fe010113          	addi	sp,sp,-32
    80001cd0:	00113c23          	sd	ra,24(sp)
    80001cd4:	00813823          	sd	s0,16(sp)
    80001cd8:	00913423          	sd	s1,8(sp)
    80001cdc:	02010413          	addi	s0,sp,32
    80001ce0:	00050493          	mv	s1,a0
}
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	f90080e7          	jalr	-112(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80001cec:	00048513          	mv	a0,s1
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	cb8080e7          	jalr	-840(ra) # 800019a8 <_ZdlPv>
    80001cf8:	01813083          	ld	ra,24(sp)
    80001cfc:	01013403          	ld	s0,16(sp)
    80001d00:	00813483          	ld	s1,8(sp)
    80001d04:	02010113          	addi	sp,sp,32
    80001d08:	00008067          	ret

0000000080001d0c <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned init)
{
  sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore()
    80001d0c:	ff010113          	addi	sp,sp,-16
    80001d10:	00113423          	sd	ra,8(sp)
    80001d14:	00813023          	sd	s0,0(sp)
    80001d18:	01010413          	addi	s0,sp,16
    80001d1c:	00008797          	auipc	a5,0x8
    80001d20:	06478793          	addi	a5,a5,100 # 80009d80 <_ZTV9Semaphore+0x10>
    80001d24:	00f53023          	sd	a5,0(a0)
{
  sem_close(myHandle);
    80001d28:	00853503          	ld	a0,8(a0)
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	ae8080e7          	jalr	-1304(ra) # 80001814 <_Z9sem_closeP10MojSemafor>
}
    80001d34:	00813083          	ld	ra,8(sp)
    80001d38:	00013403          	ld	s0,0(sp)
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret

0000000080001d44 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore()
    80001d44:	fe010113          	addi	sp,sp,-32
    80001d48:	00113c23          	sd	ra,24(sp)
    80001d4c:	00813823          	sd	s0,16(sp)
    80001d50:	00913423          	sd	s1,8(sp)
    80001d54:	02010413          	addi	s0,sp,32
    80001d58:	00050493          	mv	s1,a0
}
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	fb0080e7          	jalr	-80(ra) # 80001d0c <_ZN9SemaphoreD1Ev>
    80001d64:	00048513          	mv	a0,s1
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	c40080e7          	jalr	-960(ra) # 800019a8 <_ZdlPv>
    80001d70:	01813083          	ld	ra,24(sp)
    80001d74:	01013403          	ld	s0,16(sp)
    80001d78:	00813483          	ld	s1,8(sp)
    80001d7c:	02010113          	addi	sp,sp,32
    80001d80:	00008067          	ret

0000000080001d84 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*telo)(void*), void* argumenti)
    80001d84:	ff010113          	addi	sp,sp,-16
    80001d88:	00113423          	sd	ra,8(sp)
    80001d8c:	00813023          	sd	s0,0(sp)
    80001d90:	01010413          	addi	s0,sp,16
    80001d94:	00008797          	auipc	a5,0x8
    80001d98:	fc478793          	addi	a5,a5,-60 # 80009d58 <_ZTV6Thread+0x10>
    80001d9c:	00f53023          	sd	a5,0(a0)
  thread_create(&myHandle, telo, argumenti);
    80001da0:	00850513          	addi	a0,a0,8
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	8dc080e7          	jalr	-1828(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001dac:	00813083          	ld	ra,8(sp)
    80001db0:	00013403          	ld	s0,0(sp)
    80001db4:	01010113          	addi	sp,sp,16
    80001db8:	00008067          	ret

0000000080001dbc <_ZN6Thread5startEv>:
{
    80001dbc:	ff010113          	addi	sp,sp,-16
    80001dc0:	00113423          	sd	ra,8(sp)
    80001dc4:	00813023          	sd	s0,0(sp)
    80001dc8:	01010413          	addi	s0,sp,16
  thread_start(this->myHandle);
    80001dcc:	00853503          	ld	a0,8(a0)
    80001dd0:	00000097          	auipc	ra,0x0
    80001dd4:	9f0080e7          	jalr	-1552(ra) # 800017c0 <_Z12thread_startP3TCB>
}
    80001dd8:	00000513          	li	a0,0
    80001ddc:	00813083          	ld	ra,8(sp)
    80001de0:	00013403          	ld	s0,0(sp)
    80001de4:	01010113          	addi	sp,sp,16
    80001de8:	00008067          	ret

0000000080001dec <_ZN6Thread8dispatchEv>:
{
    80001dec:	ff010113          	addi	sp,sp,-16
    80001df0:	00113423          	sd	ra,8(sp)
    80001df4:	00813023          	sd	s0,0(sp)
    80001df8:	01010413          	addi	s0,sp,16
  thread_dispatch();
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	9a4080e7          	jalr	-1628(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80001e04:	00813083          	ld	ra,8(sp)
    80001e08:	00013403          	ld	s0,0(sp)
    80001e0c:	01010113          	addi	sp,sp,16
    80001e10:	00008067          	ret

0000000080001e14 <_ZN6Thread5sleepEm>:
{
    80001e14:	ff010113          	addi	sp,sp,-16
    80001e18:	00813423          	sd	s0,8(sp)
    80001e1c:	01010413          	addi	s0,sp,16
}
    80001e20:	00000513          	li	a0,0
    80001e24:	00813403          	ld	s0,8(sp)
    80001e28:	01010113          	addi	sp,sp,16
    80001e2c:	00008067          	ret

0000000080001e30 <_ZN6ThreadC1Ev>:
Thread::Thread()
    80001e30:	ff010113          	addi	sp,sp,-16
    80001e34:	00113423          	sd	ra,8(sp)
    80001e38:	00813023          	sd	s0,0(sp)
    80001e3c:	01010413          	addi	s0,sp,16
    80001e40:	00008797          	auipc	a5,0x8
    80001e44:	f1878793          	addi	a5,a5,-232 # 80009d58 <_ZTV6Thread+0x10>
    80001e48:	00f53023          	sd	a5,0(a0)
  thread_no_start(&myHandle, &runWrapper, this);
    80001e4c:	00050613          	mv	a2,a0
    80001e50:	00000597          	auipc	a1,0x0
    80001e54:	13058593          	addi	a1,a1,304 # 80001f80 <_ZN6Thread10runWrapperEPv>
    80001e58:	00850513          	addi	a0,a0,8
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	8a0080e7          	jalr	-1888(ra) # 800016fc <_Z15thread_no_startPP3TCBPFvPvES2_>
}
    80001e64:	00813083          	ld	ra,8(sp)
    80001e68:	00013403          	ld	s0,0(sp)
    80001e6c:	01010113          	addi	sp,sp,16
    80001e70:	00008067          	ret

0000000080001e74 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init)
    80001e74:	ff010113          	addi	sp,sp,-16
    80001e78:	00113423          	sd	ra,8(sp)
    80001e7c:	00813023          	sd	s0,0(sp)
    80001e80:	01010413          	addi	s0,sp,16
    80001e84:	00008797          	auipc	a5,0x8
    80001e88:	efc78793          	addi	a5,a5,-260 # 80009d80 <_ZTV9Semaphore+0x10>
    80001e8c:	00f53023          	sd	a5,0(a0)
  sem_open(&this->myHandle, init);
    80001e90:	00850513          	addi	a0,a0,8
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	950080e7          	jalr	-1712(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
}
    80001e9c:	00813083          	ld	ra,8(sp)
    80001ea0:	00013403          	ld	s0,0(sp)
    80001ea4:	01010113          	addi	sp,sp,16
    80001ea8:	00008067          	ret

0000000080001eac <_ZN9Semaphore4waitEv>:

int Semaphore::wait()
{
    80001eac:	ff010113          	addi	sp,sp,-16
    80001eb0:	00113423          	sd	ra,8(sp)
    80001eb4:	00813023          	sd	s0,0(sp)
    80001eb8:	01010413          	addi	s0,sp,16
  return sem_wait(myHandle);
    80001ebc:	00853503          	ld	a0,8(a0)
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	980080e7          	jalr	-1664(ra) # 80001840 <_Z8sem_waitP10MojSemafor>
}
    80001ec8:	00813083          	ld	ra,8(sp)
    80001ecc:	00013403          	ld	s0,0(sp)
    80001ed0:	01010113          	addi	sp,sp,16
    80001ed4:	00008067          	ret

0000000080001ed8 <_ZN9Semaphore6signalEv>:

int Semaphore::signal()
{
    80001ed8:	ff010113          	addi	sp,sp,-16
    80001edc:	00113423          	sd	ra,8(sp)
    80001ee0:	00813023          	sd	s0,0(sp)
    80001ee4:	01010413          	addi	s0,sp,16
  return sem_signal(myHandle);
    80001ee8:	00853503          	ld	a0,8(a0)
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	980080e7          	jalr	-1664(ra) # 8000186c <_Z10sem_signalP10MojSemafor>
}
    80001ef4:	00813083          	ld	ra,8(sp)
    80001ef8:	00013403          	ld	s0,0(sp)
    80001efc:	01010113          	addi	sp,sp,16
    80001f00:	00008067          	ret

0000000080001f04 <_ZN9Semaphore7tryWaitEv>:

int Semaphore::tryWait()
{
    80001f04:	ff010113          	addi	sp,sp,-16
    80001f08:	00113423          	sd	ra,8(sp)
    80001f0c:	00813023          	sd	s0,0(sp)
    80001f10:	01010413          	addi	s0,sp,16
  return sem_trywait(myHandle);
    80001f14:	00853503          	ld	a0,8(a0)
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	980080e7          	jalr	-1664(ra) # 80001898 <_Z11sem_trywaitP10MojSemafor>
}
    80001f20:	00813083          	ld	ra,8(sp)
    80001f24:	00013403          	ld	s0,0(sp)
    80001f28:	01010113          	addi	sp,sp,16
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN7Console4getcEv>:

char Console::getc()
{
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00113423          	sd	ra,8(sp)
    80001f38:	00813023          	sd	s0,0(sp)
    80001f3c:	01010413          	addi	s0,sp,16
 return syscall_c::getc();
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	984080e7          	jalr	-1660(ra) # 800018c4 <_Z4getcv>
}
    80001f48:	00813083          	ld	ra,8(sp)
    80001f4c:	00013403          	ld	s0,0(sp)
    80001f50:	01010113          	addi	sp,sp,16
    80001f54:	00008067          	ret

0000000080001f58 <_ZN7Console4putcEc>:

void Console::putc(char c)
{
    80001f58:	ff010113          	addi	sp,sp,-16
    80001f5c:	00113423          	sd	ra,8(sp)
    80001f60:	00813023          	sd	s0,0(sp)
    80001f64:	01010413          	addi	s0,sp,16
  syscall_c::putc(c);
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	984080e7          	jalr	-1660(ra) # 800018ec <_Z4putcc>
    80001f70:	00813083          	ld	ra,8(sp)
    80001f74:	00013403          	ld	s0,0(sp)
    80001f78:	01010113          	addi	sp,sp,16
    80001f7c:	00008067          	ret

0000000080001f80 <_ZN6Thread10runWrapperEPv>:
int start();
static void dispatch();
static int sleep (time_t);
static void runWrapper(void* thread)
{
  if(thread != nullptr)
    80001f80:	02050863          	beqz	a0,80001fb0 <_ZN6Thread10runWrapperEPv+0x30>
static void runWrapper(void* thread)
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00113423          	sd	ra,8(sp)
    80001f8c:	00813023          	sd	s0,0(sp)
    80001f90:	01010413          	addi	s0,sp,16
   ((Thread*) thread)->run();
    80001f94:	00053783          	ld	a5,0(a0)
    80001f98:	0107b783          	ld	a5,16(a5)
    80001f9c:	000780e7          	jalr	a5
}
    80001fa0:	00813083          	ld	ra,8(sp)
    80001fa4:	00013403          	ld	s0,0(sp)
    80001fa8:	01010113          	addi	sp,sp,16
    80001fac:	00008067          	ret
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZN6Thread3runEv>:

protected:
 Thread();
 virtual void run() {};
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00813423          	sd	s0,8(sp)
    80001fbc:	01010413          	addi	s0,sp,16
    80001fc0:	00813403          	ld	s0,8(sp)
    80001fc4:	01010113          	addi	sp,sp,16
    80001fc8:	00008067          	ret

0000000080001fcc <_ZN3TCBC1EPFvPvES0_S0_>:
#include "../h/syscall_c.h"


TCB* TCB::trenutnaNit = nullptr;

TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80001fcc:	fd010113          	addi	sp,sp,-48
    80001fd0:	02113423          	sd	ra,40(sp)
    80001fd4:	02813023          	sd	s0,32(sp)
    80001fd8:	00913c23          	sd	s1,24(sp)
    80001fdc:	01213823          	sd	s2,16(sp)
    80001fe0:	01313423          	sd	s3,8(sp)
    80001fe4:	03010413          	addi	s0,sp,48
    80001fe8:	00050493          	mv	s1,a0
    80001fec:	00058913          	mv	s2,a1
    80001ff0:	00060993          	mv	s3,a2
, context(
{((uint64) &TCB::wrapper),
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80001ff4:	00b53023          	sd	a1,0(a0)
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80001ff8:	04058c63          	beqz	a1,80002050 <_ZN3TCBC1EPFvPvES0_S0_+0x84>
    80001ffc:	00008537          	lui	a0,0x8
    80002000:	00000097          	auipc	ra,0x0
    80002004:	980080e7          	jalr	-1664(ra) # 80001980 <_Znam>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80002008:	00a4b423          	sd	a0,8(s1)
    8000200c:	00000797          	auipc	a5,0x0
    80002010:	12078793          	addi	a5,a5,288 # 8000212c <_ZN3TCB7wrapperEv>
    80002014:	00f4b823          	sd	a5,16(s1)
    80002018:	04090063          	beqz	s2,80002058 <_ZN3TCBC1EPFvPvES0_S0_+0x8c>
    8000201c:	000087b7          	lui	a5,0x8
    80002020:	00f50533          	add	a0,a0,a5
    80002024:	00a4bc23          	sd	a0,24(s1)
    80002028:	0334b023          	sd	s3,32(s1)
    8000202c:	02048423          	sb	zero,40(s1)
    80002030:	020484a3          	sb	zero,41(s1)
    80002034:	02813083          	ld	ra,40(sp)
    80002038:	02013403          	ld	s0,32(sp)
    8000203c:	01813483          	ld	s1,24(sp)
    80002040:	01013903          	ld	s2,16(sp)
    80002044:	00813983          	ld	s3,8(sp)
    80002048:	03010113          	addi	sp,sp,48
    8000204c:	00008067          	ret
TCB::TCB(Telo telo, void* argumenti, void* stek) : telo(telo), stek(telo != nullptr ? new uint64[DEFAULT_STACK_SIZE] : nullptr)
    80002050:	00000513          	li	a0,0
    80002054:	fb5ff06f          	j	80002008 <_ZN3TCBC1EPFvPvES0_S0_+0x3c>
 telo == nullptr ? 0 : (uint64) &this->stek[DEFAULT_STACK_SIZE]}), argumenti(argumenti), zavrsena(false), blokirana(false) {}
    80002058:	00000513          	li	a0,0
    8000205c:	fc9ff06f          	j	80002024 <_ZN3TCBC1EPFvPvES0_S0_+0x58>

0000000080002060 <_ZN3TCB8dispatchEv>:
  trenutnaNit->postaviStatus(true);
  thread_dispatch();
}

void TCB::dispatch()
{
    80002060:	fe010113          	addi	sp,sp,-32
    80002064:	00113c23          	sd	ra,24(sp)
    80002068:	00813823          	sd	s0,16(sp)
    8000206c:	00913423          	sd	s1,8(sp)
    80002070:	02010413          	addi	s0,sp,32
  TCB* staraNit = trenutnaNit;
    80002074:	00008497          	auipc	s1,0x8
    80002078:	f0c4b483          	ld	s1,-244(s1) # 80009f80 <_ZN3TCB11trenutnaNitE>
      return zavrsena;
    8000207c:	0284c783          	lbu	a5,40(s1)
  if(!staraNit->daLiJeZavrsena() && !staraNit->daLiJeBlokirana())
    80002080:	00079663          	bnez	a5,8000208c <_ZN3TCB8dispatchEv+0x2c>
     return this->blokirana;
    80002084:	0294c783          	lbu	a5,41(s1)
    80002088:	02078e63          	beqz	a5,800020c4 <_ZN3TCB8dispatchEv+0x64>
  {
    Scheduler::stavi(staraNit);
  }

  trenutnaNit = Scheduler::uzmi();
    8000208c:	00000097          	auipc	ra,0x0
    80002090:	a18080e7          	jalr	-1512(ra) # 80001aa4 <_ZN9Scheduler4uzmiEv>
    80002094:	00008797          	auipc	a5,0x8
    80002098:	eea7b623          	sd	a0,-276(a5) # 80009f80 <_ZN3TCB11trenutnaNitE>

  if(staraNit != trenutnaNit)
    8000209c:	00a48a63          	beq	s1,a0,800020b0 <_ZN3TCB8dispatchEv+0x50>
  {
    TCB::yield(&staraNit->context, &trenutnaNit->context);
    800020a0:	01050593          	addi	a1,a0,16 # 8010 <_entry-0x7fff7ff0>
    800020a4:	01048513          	addi	a0,s1,16
    800020a8:	fffff097          	auipc	ra,0xfffff
    800020ac:	f58080e7          	jalr	-168(ra) # 80001000 <_ZN3TCB5yieldEPNS_7ContextES1_>
  }
}
    800020b0:	01813083          	ld	ra,24(sp)
    800020b4:	01013403          	ld	s0,16(sp)
    800020b8:	00813483          	ld	s1,8(sp)
    800020bc:	02010113          	addi	sp,sp,32
    800020c0:	00008067          	ret
    Scheduler::stavi(staraNit);
    800020c4:	00048513          	mv	a0,s1
    800020c8:	00000097          	auipc	ra,0x0
    800020cc:	970080e7          	jalr	-1680(ra) # 80001a38 <_ZN9Scheduler5staviEP3TCB>
    800020d0:	fbdff06f          	j	8000208c <_ZN3TCB8dispatchEv+0x2c>

00000000800020d4 <_ZN3TCB4exitEv>:

void TCB::exit()
{
    800020d4:	ff010113          	addi	sp,sp,-16
    800020d8:	00113423          	sd	ra,8(sp)
    800020dc:	00813023          	sd	s0,0(sp)
    800020e0:	01010413          	addi	s0,sp,16
     this->zavrsena = status;
    800020e4:	00008797          	auipc	a5,0x8
    800020e8:	e9c7b783          	ld	a5,-356(a5) # 80009f80 <_ZN3TCB11trenutnaNitE>
    800020ec:	00100713          	li	a4,1
    800020f0:	02e78423          	sb	a4,40(a5)
  trenutnaNit->postaviStatus(true);
  dispatch();
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	f6c080e7          	jalr	-148(ra) # 80002060 <_ZN3TCB8dispatchEv>
}
    800020fc:	00813083          	ld	ra,8(sp)
    80002100:	00013403          	ld	s0,0(sp)
    80002104:	01010113          	addi	sp,sp,16
    80002108:	00008067          	ret

000000008000210c <_ZN3TCB10popSppSpieEv>:

void TCB::popSppSpie()
{
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00813423          	sd	s0,8(sp)
    80002114:	01010413          	addi	s0,sp,16
  __asm__ volatile ("csrw sepc, ra");
    80002118:	14109073          	csrw	sepc,ra
  __asm__ volatile("sret");
    8000211c:	10200073          	sret
    80002120:	00813403          	ld	s0,8(sp)
    80002124:	01010113          	addi	sp,sp,16
    80002128:	00008067          	ret

000000008000212c <_ZN3TCB7wrapperEv>:
{
    8000212c:	fe010113          	addi	sp,sp,-32
    80002130:	00113c23          	sd	ra,24(sp)
    80002134:	00813823          	sd	s0,16(sp)
    80002138:	00913423          	sd	s1,8(sp)
    8000213c:	02010413          	addi	s0,sp,32
  popSppSpie();
    80002140:	00000097          	auipc	ra,0x0
    80002144:	fcc080e7          	jalr	-52(ra) # 8000210c <_ZN3TCB10popSppSpieEv>
  trenutnaNit->telo((void*) trenutnaNit->argumenti);
    80002148:	00008497          	auipc	s1,0x8
    8000214c:	e3848493          	addi	s1,s1,-456 # 80009f80 <_ZN3TCB11trenutnaNitE>
    80002150:	0004b783          	ld	a5,0(s1)
    80002154:	0007b703          	ld	a4,0(a5)
    80002158:	0207b503          	ld	a0,32(a5)
    8000215c:	000700e7          	jalr	a4
  trenutnaNit->postaviStatus(true);
    80002160:	0004b783          	ld	a5,0(s1)
    80002164:	00100713          	li	a4,1
    80002168:	02e78423          	sb	a4,40(a5)
  thread_dispatch();
    8000216c:	fffff097          	auipc	ra,0xfffff
    80002170:	634080e7          	jalr	1588(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80002174:	01813083          	ld	ra,24(sp)
    80002178:	01013403          	ld	s0,16(sp)
    8000217c:	00813483          	ld	s1,8(sp)
    80002180:	02010113          	addi	sp,sp,32
    80002184:	00008067          	ret

0000000080002188 <_ZN15MemoryAllocator9mem_allocEm>:
int MemoryAllocator::newArrayCalled = 0;
int MemoryAllocator::deleteCalled = 0;
int MemoryAllocator::deleteArrayCalled = 0;


void *MemoryAllocator::mem_alloc(size_t size) {
    80002188:	ff010113          	addi	sp,sp,-16
    8000218c:	00813423          	sd	s0,8(sp)
    80002190:	01010413          	addi	s0,sp,16
    80002194:	00050793          	mv	a5,a0
    size_t newSize;
    if(size%MEM_BLOCK_SIZE != 0) {
    80002198:	03f57713          	andi	a4,a0,63
    8000219c:	00070663          	beqz	a4,800021a8 <_ZN15MemoryAllocator9mem_allocEm+0x20>
        newSize = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800021a0:	03f50793          	addi	a5,a0,63
    800021a4:	fc07f793          	andi	a5,a5,-64
    }
    else {
        newSize = size;
    }

    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    800021a8:	00008517          	auipc	a0,0x8
    800021ac:	de053503          	ld	a0,-544(a0) # 80009f88 <_ZN15MemoryAllocator4freeE>
    800021b0:	06050e63          	beqz	a0,8000222c <_ZN15MemoryAllocator9mem_allocEm+0xa4>
        if(curr->size<newSize) continue;
    800021b4:	01053703          	ld	a4,16(a0)
    800021b8:	08f76063          	bltu	a4,a5,80002238 <_ZN15MemoryAllocator9mem_allocEm+0xb0>
        if(curr->size > newSize) {
    800021bc:	0ce7f663          	bgeu	a5,a4,80002288 <_ZN15MemoryAllocator9mem_allocEm+0x100>
            //new fragment needs to be created
            //novi ce biti offsetovan od curr za novi size i plus za sizeof(DataBlock) zato sto se posle curr
            // nalazi taj "header"
            DataBlock *newBlock;
            newBlock = (DataBlock*) ((char*)curr + newSize + sizeof(DataBlock));
    800021c0:	01878713          	addi	a4,a5,24
    800021c4:	00e50733          	add	a4,a0,a4

            //Azuriranje free liste
            if(curr->prev) curr->prev->next = newBlock;
    800021c8:	00853683          	ld	a3,8(a0)
    800021cc:	06068a63          	beqz	a3,80002240 <_ZN15MemoryAllocator9mem_allocEm+0xb8>
    800021d0:	00e6b023          	sd	a4,0(a3)
            else MemoryAllocator::free = newBlock;
            if(curr->next) curr->next->prev = newBlock;
    800021d4:	00053683          	ld	a3,0(a0)
    800021d8:	00068463          	beqz	a3,800021e0 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    800021dc:	00e6b423          	sd	a4,8(a3)
            newBlock->prev = curr->prev;
    800021e0:	00853683          	ld	a3,8(a0)
    800021e4:	00d73423          	sd	a3,8(a4)
            newBlock->next = curr->next;
    800021e8:	00053683          	ld	a3,0(a0)
    800021ec:	00d73023          	sd	a3,0(a4)

            newBlock->size = curr->size - newSize - sizeof(DataBlock);
    800021f0:	01053683          	ld	a3,16(a0)
    800021f4:	40f686b3          	sub	a3,a3,a5
    800021f8:	fe868693          	addi	a3,a3,-24
    800021fc:	00d73823          	sd	a3,16(a4)
            curr->size = newSize;
    80002200:	00f53823          	sd	a5,16(a0)

            //azuriranje USED liste
            if(used == nullptr) {
    80002204:	00008797          	auipc	a5,0x8
    80002208:	d8c7b783          	ld	a5,-628(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
    8000220c:	04078063          	beqz	a5,8000224c <_ZN15MemoryAllocator9mem_allocEm+0xc4>
                used = curr;
                curr->next = nullptr;
                curr->prev = nullptr;
            }
            else if((char*) curr < (char*)used) {
    80002210:	04f57863          	bgeu	a0,a5,80002260 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                //treba da ide pre trenutnog used
                used->prev = curr;
    80002214:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    80002218:	00053423          	sd	zero,8(a0)
                curr->next = used;
    8000221c:	00f53023          	sd	a5,0(a0)
                used = curr;
    80002220:	00008797          	auipc	a5,0x8
    80002224:	d6a7b823          	sd	a0,-656(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
                curr->prev = currUsed;
                if(curr->next) curr->next->prev = curr;
                currUsed->next = curr;
            }
        }
        return (char*)curr + sizeof(DataBlock);
    80002228:	01850513          	addi	a0,a0,24
    }
    return nullptr; //should not enter here
}
    8000222c:	00813403          	ld	s0,8(sp)
    80002230:	01010113          	addi	sp,sp,16
    80002234:	00008067          	ret
    for(DataBlock* curr = MemoryAllocator::free; curr != nullptr; curr=curr->next) {
    80002238:	00053503          	ld	a0,0(a0)
    8000223c:	f75ff06f          	j	800021b0 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            else MemoryAllocator::free = newBlock;
    80002240:	00008697          	auipc	a3,0x8
    80002244:	d4e6b423          	sd	a4,-696(a3) # 80009f88 <_ZN15MemoryAllocator4freeE>
    80002248:	f8dff06f          	j	800021d4 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
                used = curr;
    8000224c:	00008797          	auipc	a5,0x8
    80002250:	d4a7b223          	sd	a0,-700(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    80002254:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    80002258:	00053423          	sd	zero,8(a0)
    8000225c:	fcdff06f          	j	80002228 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    80002260:	00078713          	mv	a4,a5
    80002264:	0007b783          	ld	a5,0(a5)
    80002268:	00078463          	beqz	a5,80002270 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
    8000226c:	fea7eae3          	bltu	a5,a0,80002260 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
                curr->next = currUsed->next;
    80002270:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    80002274:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    80002278:	00078463          	beqz	a5,80002280 <_ZN15MemoryAllocator9mem_allocEm+0xf8>
    8000227c:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    80002280:	00a73023          	sd	a0,0(a4)
    80002284:	fa5ff06f          	j	80002228 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            if (curr->prev) curr->prev->next = curr->next;
    80002288:	00853783          	ld	a5,8(a0)
    8000228c:	04078263          	beqz	a5,800022d0 <_ZN15MemoryAllocator9mem_allocEm+0x148>
    80002290:	00053703          	ld	a4,0(a0)
    80002294:	00e7b023          	sd	a4,0(a5)
            if(curr->next) curr->next->prev = curr->prev;
    80002298:	00053783          	ld	a5,0(a0)
    8000229c:	00078663          	beqz	a5,800022a8 <_ZN15MemoryAllocator9mem_allocEm+0x120>
    800022a0:	00853703          	ld	a4,8(a0)
    800022a4:	00e7b423          	sd	a4,8(a5)
            if(used == nullptr) {
    800022a8:	00008797          	auipc	a5,0x8
    800022ac:	ce87b783          	ld	a5,-792(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
    800022b0:	02078863          	beqz	a5,800022e0 <_ZN15MemoryAllocator9mem_allocEm+0x158>
            else if((char*) curr < (char*)used) {
    800022b4:	04f57063          	bgeu	a0,a5,800022f4 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                used->prev = curr;
    800022b8:	00a7b423          	sd	a0,8(a5)
                curr->prev = nullptr;
    800022bc:	00053423          	sd	zero,8(a0)
                curr->next = used;
    800022c0:	00f53023          	sd	a5,0(a0)
                used = curr;
    800022c4:	00008797          	auipc	a5,0x8
    800022c8:	cca7b623          	sd	a0,-820(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
    800022cc:	f5dff06f          	j	80002228 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
            else MemoryAllocator::free = curr->next;
    800022d0:	00053783          	ld	a5,0(a0)
    800022d4:	00008717          	auipc	a4,0x8
    800022d8:	caf73a23          	sd	a5,-844(a4) # 80009f88 <_ZN15MemoryAllocator4freeE>
    800022dc:	fbdff06f          	j	80002298 <_ZN15MemoryAllocator9mem_allocEm+0x110>
                used = curr;
    800022e0:	00008797          	auipc	a5,0x8
    800022e4:	caa7b823          	sd	a0,-848(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
                curr->next = nullptr;
    800022e8:	00053023          	sd	zero,0(a0)
                curr->prev = nullptr;
    800022ec:	00053423          	sd	zero,8(a0)
    800022f0:	f39ff06f          	j	80002228 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                for(; currUsed->next && (char*)(currUsed->next) < (char*) curr; currUsed = currUsed->next);
    800022f4:	00078713          	mv	a4,a5
    800022f8:	0007b783          	ld	a5,0(a5)
    800022fc:	00078463          	beqz	a5,80002304 <_ZN15MemoryAllocator9mem_allocEm+0x17c>
    80002300:	fea7eae3          	bltu	a5,a0,800022f4 <_ZN15MemoryAllocator9mem_allocEm+0x16c>
                curr->next = currUsed->next;
    80002304:	00f53023          	sd	a5,0(a0)
                curr->prev = currUsed;
    80002308:	00e53423          	sd	a4,8(a0)
                if(curr->next) curr->next->prev = curr;
    8000230c:	00078463          	beqz	a5,80002314 <_ZN15MemoryAllocator9mem_allocEm+0x18c>
    80002310:	00a7b423          	sd	a0,8(a5)
                currUsed->next = curr;
    80002314:	00a73023          	sd	a0,0(a4)
    80002318:	f11ff06f          	j	80002228 <_ZN15MemoryAllocator9mem_allocEm+0xa0>

000000008000231c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>:
        tryToJoin(currFree);
    }
    return 0;
}

void MemoryAllocator::tryToJoin(DataBlock *curr) {
    8000231c:	ff010113          	addi	sp,sp,-16
    80002320:	00813423          	sd	s0,8(sp)
    80002324:	01010413          	addi	s0,sp,16
    if(curr->next && (char*)curr + sizeof(DataBlock) + curr->size == (char*)curr->next) {
    80002328:	00053783          	ld	a5,0(a0)
    8000232c:	00078a63          	beqz	a5,80002340 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    80002330:	01053683          	ld	a3,16(a0)
    80002334:	01868713          	addi	a4,a3,24
    80002338:	00e50733          	add	a4,a0,a4
    8000233c:	00e78863          	beq	a5,a4,8000234c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x30>
        curr->size += curr->next->size + sizeof(DataBlock);
        curr->next = curr->next->next;
        if(curr->next) curr->next->prev = curr;
    }
}
    80002340:	00813403          	ld	s0,8(sp)
    80002344:	01010113          	addi	sp,sp,16
    80002348:	00008067          	ret
        curr->size += curr->next->size + sizeof(DataBlock);
    8000234c:	0107b703          	ld	a4,16(a5)
    80002350:	00e686b3          	add	a3,a3,a4
    80002354:	01868693          	addi	a3,a3,24
    80002358:	00d53823          	sd	a3,16(a0)
        curr->next = curr->next->next;
    8000235c:	0007b783          	ld	a5,0(a5)
    80002360:	00f53023          	sd	a5,0(a0)
        if(curr->next) curr->next->prev = curr;
    80002364:	fc078ee3          	beqz	a5,80002340 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>
    80002368:	00a7b423          	sd	a0,8(a5)
}
    8000236c:	fd5ff06f          	j	80002340 <_ZN15MemoryAllocator9tryToJoinEP9DataBlock+0x24>

0000000080002370 <_ZN15MemoryAllocator8mem_freeEPv>:
    if(used == nullptr) return -1;
    80002370:	00008797          	auipc	a5,0x8
    80002374:	c207b783          	ld	a5,-992(a5) # 80009f90 <_ZN15MemoryAllocator4usedE>
    80002378:	12078863          	beqz	a5,800024a8 <_ZN15MemoryAllocator8mem_freeEPv+0x138>
    8000237c:	00050713          	mv	a4,a0
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    80002380:	12050863          	beqz	a0,800024b0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    80002384:	00008697          	auipc	a3,0x8
    80002388:	b446b683          	ld	a3,-1212(a3) # 80009ec8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000238c:	0006b683          	ld	a3,0(a3)
    80002390:	12d56463          	bltu	a0,a3,800024b8 <_ZN15MemoryAllocator8mem_freeEPv+0x148>
    80002394:	00008697          	auipc	a3,0x8
    80002398:	b846b683          	ld	a3,-1148(a3) # 80009f18 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000239c:	0006b683          	ld	a3,0(a3)
    800023a0:	12a6e063          	bltu	a3,a0,800024c0 <_ZN15MemoryAllocator8mem_freeEPv+0x150>
    DataBlock* curr = (DataBlock*)((char*)ptr - sizeof(DataBlock));
    800023a4:	fe850513          	addi	a0,a0,-24
    if(curr < used) return -3;
    800023a8:	12f56063          	bltu	a0,a5,800024c8 <_ZN15MemoryAllocator8mem_freeEPv+0x158>
    if(used == curr) {
    800023ac:	08a78c63          	beq	a5,a0,80002444 <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
        curr->prev->next = curr->next;
    800023b0:	ff073683          	ld	a3,-16(a4)
    800023b4:	fe873783          	ld	a5,-24(a4)
    800023b8:	00f6b023          	sd	a5,0(a3)
        if(curr->next) curr->next->prev = curr->prev;
    800023bc:	00078663          	beqz	a5,800023c8 <_ZN15MemoryAllocator8mem_freeEPv+0x58>
    800023c0:	ff073683          	ld	a3,-16(a4)
    800023c4:	00d7b423          	sd	a3,8(a5)
        curr->next = nullptr;
    800023c8:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    800023cc:	fe073823          	sd	zero,-16(a4)
    if (free == nullptr) {
    800023d0:	00008797          	auipc	a5,0x8
    800023d4:	bb87b783          	ld	a5,-1096(a5) # 80009f88 <_ZN15MemoryAllocator4freeE>
    800023d8:	08078663          	beqz	a5,80002464 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
int MemoryAllocator::mem_free(void* ptr) {
    800023dc:	fe010113          	addi	sp,sp,-32
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00813823          	sd	s0,16(sp)
    800023e8:	00913423          	sd	s1,8(sp)
    800023ec:	02010413          	addi	s0,sp,32
    else if((char*)curr < (char*)free) {
    800023f0:	08f56663          	bltu	a0,a5,8000247c <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
        for(currFree = free; currFree->next && (char*)(currFree->next) < (char*) curr; currFree = currFree->next);
    800023f4:	00078493          	mv	s1,a5
    800023f8:	0007b783          	ld	a5,0(a5)
    800023fc:	00078463          	beqz	a5,80002404 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    80002400:	fea7eae3          	bltu	a5,a0,800023f4 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
        curr->next = currFree->next;
    80002404:	fef73423          	sd	a5,-24(a4)
        curr->prev = currFree;
    80002408:	fe973823          	sd	s1,-16(a4)
        if(curr->next) curr->next->prev = curr;
    8000240c:	00078463          	beqz	a5,80002414 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    80002410:	00a7b423          	sd	a0,8(a5)
        currFree->next = curr;
    80002414:	00a4b023          	sd	a0,0(s1)
        tryToJoin(curr);
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	f04080e7          	jalr	-252(ra) # 8000231c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
        tryToJoin(currFree);
    80002420:	00048513          	mv	a0,s1
    80002424:	00000097          	auipc	ra,0x0
    80002428:	ef8080e7          	jalr	-264(ra) # 8000231c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    8000242c:	00000513          	li	a0,0
}
    80002430:	01813083          	ld	ra,24(sp)
    80002434:	01013403          	ld	s0,16(sp)
    80002438:	00813483          	ld	s1,8(sp)
    8000243c:	02010113          	addi	sp,sp,32
    80002440:	00008067          	ret
        used = curr->next;
    80002444:	fe873783          	ld	a5,-24(a4)
    80002448:	00008697          	auipc	a3,0x8
    8000244c:	b4f6b423          	sd	a5,-1208(a3) # 80009f90 <_ZN15MemoryAllocator4usedE>
        if(used) used->prev = nullptr;
    80002450:	00078463          	beqz	a5,80002458 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
    80002454:	0007b423          	sd	zero,8(a5)
        curr->next = nullptr;
    80002458:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    8000245c:	fe073823          	sd	zero,-16(a4)
    80002460:	f71ff06f          	j	800023d0 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        free = curr;
    80002464:	00008797          	auipc	a5,0x8
    80002468:	b2a7b223          	sd	a0,-1244(a5) # 80009f88 <_ZN15MemoryAllocator4freeE>
        curr->next = nullptr;
    8000246c:	fe073423          	sd	zero,-24(a4)
        curr->prev = nullptr;
    80002470:	fe073823          	sd	zero,-16(a4)
    return 0;
    80002474:	00000513          	li	a0,0
    80002478:	00008067          	ret
        free->prev = curr;
    8000247c:	00a7b423          	sd	a0,8(a5)
        curr->prev = nullptr;
    80002480:	fe073823          	sd	zero,-16(a4)
        curr->next = free;
    80002484:	00008797          	auipc	a5,0x8
    80002488:	b0478793          	addi	a5,a5,-1276 # 80009f88 <_ZN15MemoryAllocator4freeE>
    8000248c:	0007b683          	ld	a3,0(a5)
    80002490:	fed73423          	sd	a3,-24(a4)
        free = curr;
    80002494:	00a7b023          	sd	a0,0(a5)
        tryToJoin(free);
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	e84080e7          	jalr	-380(ra) # 8000231c <_ZN15MemoryAllocator9tryToJoinEP9DataBlock>
    return 0;
    800024a0:	00000513          	li	a0,0
    800024a4:	f8dff06f          	j	80002430 <_ZN15MemoryAllocator8mem_freeEPv+0xc0>
    if(used == nullptr) return -1;
    800024a8:	fff00513          	li	a0,-1
    800024ac:	00008067          	ret
    if(ptr == nullptr || ptr < HEAP_START_ADDR || ptr > HEAP_END_ADDR) return -2;
    800024b0:	ffe00513          	li	a0,-2
    800024b4:	00008067          	ret
    800024b8:	ffe00513          	li	a0,-2
    800024bc:	00008067          	ret
    800024c0:	ffe00513          	li	a0,-2
    800024c4:	00008067          	ret
    if(curr < used) return -3;
    800024c8:	ffd00513          	li	a0,-3
}
    800024cc:	00008067          	ret

00000000800024d0 <_ZN10MojSemaforC1Ei>:
{
  if(otvoren)
    close();
}

MojSemafor::MojSemafor(int v)
    800024d0:	ff010113          	addi	sp,sp,-16
    800024d4:	00813423          	sd	s0,8(sp)
    800024d8:	01010413          	addi	s0,sp,16
Lista(): pocetak(nullptr), kraj(nullptr) {}
    800024dc:	00053023          	sd	zero,0(a0)
    800024e0:	00053423          	sd	zero,8(a0)
{
  vrednost = v;
    800024e4:	00b52a23          	sw	a1,20(a0)
  otvoren = true;
    800024e8:	00100793          	li	a5,1
    800024ec:	00f50823          	sb	a5,16(a0)
}
    800024f0:	00813403          	ld	s0,8(sp)
    800024f4:	01010113          	addi	sp,sp,16
    800024f8:	00008067          	ret

00000000800024fc <_ZN10MojSemafor8sem_openEPPS_j>:
{
    800024fc:	fd010113          	addi	sp,sp,-48
    80002500:	02113423          	sd	ra,40(sp)
    80002504:	02813023          	sd	s0,32(sp)
    80002508:	00913c23          	sd	s1,24(sp)
    8000250c:	01213823          	sd	s2,16(sp)
    80002510:	01313423          	sd	s3,8(sp)
    80002514:	03010413          	addi	s0,sp,48
    80002518:	00050493          	mv	s1,a0
    8000251c:	00058993          	mv	s3,a1
  *handle = new MojSemafor(init);
    80002520:	01800513          	li	a0,24
    80002524:	fffff097          	auipc	ra,0xfffff
    80002528:	434080e7          	jalr	1076(ra) # 80001958 <_Znwm>
    8000252c:	00050913          	mv	s2,a0
    80002530:	00098593          	mv	a1,s3
    80002534:	00000097          	auipc	ra,0x0
    80002538:	f9c080e7          	jalr	-100(ra) # 800024d0 <_ZN10MojSemaforC1Ei>
    8000253c:	0124b023          	sd	s2,0(s1)
}
    80002540:	00000513          	li	a0,0
    80002544:	02813083          	ld	ra,40(sp)
    80002548:	02013403          	ld	s0,32(sp)
    8000254c:	01813483          	ld	s1,24(sp)
    80002550:	01013903          	ld	s2,16(sp)
    80002554:	00813983          	ld	s3,8(sp)
    80002558:	03010113          	addi	sp,sp,48
    8000255c:	00008067          	ret

0000000080002560 <_ZN10MojSemafor6signalEv>:

int MojSemafor::signal()
{
  if(!otvoren)
    80002560:	01054703          	lbu	a4,16(a0)
    80002564:	08070863          	beqz	a4,800025f4 <_ZN10MojSemafor6signalEv+0x94>
    80002568:	00050793          	mv	a5,a0
    return -1;

  TCB *thread;
  if(++vrednost <= 0)
    8000256c:	01452703          	lw	a4,20(a0)
    80002570:	0017071b          	addiw	a4,a4,1
    80002574:	0007069b          	sext.w	a3,a4
    80002578:	00e52a23          	sw	a4,20(a0)
    8000257c:	00d05663          	blez	a3,80002588 <_ZN10MojSemafor6signalEv+0x28>
  {
    thread = blokirane.izbaciPrvi();
    thread->odblokiraj();
    Scheduler::stavi(thread);
  }
  return 0;
    80002580:	00000513          	li	a0,0
}
    80002584:	00008067          	ret
{
    80002588:	fe010113          	addi	sp,sp,-32
    8000258c:	00113c23          	sd	ra,24(sp)
    80002590:	00813823          	sd	s0,16(sp)
    80002594:	00913423          	sd	s1,8(sp)
    80002598:	02010413          	addi	s0,sp,32
  if(pocetak == nullptr)
    8000259c:	00053503          	ld	a0,0(a0)
    800025a0:	04050663          	beqz	a0,800025ec <_ZN10MojSemafor6signalEv+0x8c>
  pocetak = pocetak->sledeci;
    800025a4:	00853703          	ld	a4,8(a0)
    800025a8:	00e7b023          	sd	a4,0(a5)
  if(pocetak == nullptr)
    800025ac:	02070c63          	beqz	a4,800025e4 <_ZN10MojSemafor6signalEv+0x84>
  T* pv = cvor->podaci;
    800025b0:	00053483          	ld	s1,0(a0)
  delete cvor;
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	3f4080e7          	jalr	1012(ra) # 800019a8 <_ZdlPv>
     this->blokirana = false;
    800025bc:	020484a3          	sb	zero,41(s1)
    Scheduler::stavi(thread);
    800025c0:	00048513          	mv	a0,s1
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	474080e7          	jalr	1140(ra) # 80001a38 <_ZN9Scheduler5staviEP3TCB>
  return 0;
    800025cc:	00000513          	li	a0,0
}
    800025d0:	01813083          	ld	ra,24(sp)
    800025d4:	01013403          	ld	s0,16(sp)
    800025d8:	00813483          	ld	s1,8(sp)
    800025dc:	02010113          	addi	sp,sp,32
    800025e0:	00008067          	ret
    kraj = nullptr;
    800025e4:	0007b423          	sd	zero,8(a5)
    800025e8:	fc9ff06f          	j	800025b0 <_ZN10MojSemafor6signalEv+0x50>
    return nullptr;
    800025ec:	00050493          	mv	s1,a0
    800025f0:	fcdff06f          	j	800025bc <_ZN10MojSemafor6signalEv+0x5c>
    return -1;
    800025f4:	fff00513          	li	a0,-1
    800025f8:	00008067          	ret

00000000800025fc <_ZN10MojSemafor4waitEv>:

int MojSemafor::wait()
{
  if(!otvoren)
    800025fc:	01054783          	lbu	a5,16(a0)
    80002600:	0a078663          	beqz	a5,800026ac <_ZN10MojSemafor4waitEv+0xb0>
{
    80002604:	fe010113          	addi	sp,sp,-32
    80002608:	00113c23          	sd	ra,24(sp)
    8000260c:	00813823          	sd	s0,16(sp)
    80002610:	00913423          	sd	s1,8(sp)
    80002614:	01213023          	sd	s2,0(sp)
    80002618:	02010413          	addi	s0,sp,32
    8000261c:	00050493          	mv	s1,a0
    return -1;

  if(--vrednost < 0)
    80002620:	01452783          	lw	a5,20(a0)
    80002624:	fff7879b          	addiw	a5,a5,-1
    80002628:	00f52a23          	sw	a5,20(a0)
    8000262c:	02079713          	slli	a4,a5,0x20
    80002630:	02074063          	bltz	a4,80002650 <_ZN10MojSemafor4waitEv+0x54>
    blokirane.dodajNaKraj(TCB::trenutnaNit);
    TCB::dispatch();
    if(!otvoren)
      return -2;
  }
  return 0;
    80002634:	00000513          	li	a0,0

}
    80002638:	01813083          	ld	ra,24(sp)
    8000263c:	01013403          	ld	s0,16(sp)
    80002640:	00813483          	ld	s1,8(sp)
    80002644:	00013903          	ld	s2,0(sp)
    80002648:	02010113          	addi	sp,sp,32
    8000264c:	00008067          	ret
    TCB::trenutnaNit->blokiraj();
    80002650:	00008797          	auipc	a5,0x8
    80002654:	8c07b783          	ld	a5,-1856(a5) # 80009f10 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002658:	0007b903          	ld	s2,0(a5)
     this->blokirana = true;
    8000265c:	00100793          	li	a5,1
    80002660:	02f904a3          	sb	a5,41(s2)
Cvor *noviCvor = new Cvor(t, nullptr);
    80002664:	01000513          	li	a0,16
    80002668:	fffff097          	auipc	ra,0xfffff
    8000266c:	2f0080e7          	jalr	752(ra) # 80001958 <_Znwm>
    Cvor(T* podaci, Cvor* sledeci) : podaci(podaci), sledeci(sledeci) {}
    80002670:	01253023          	sd	s2,0(a0)
    80002674:	00053423          	sd	zero,8(a0)
if(kraj != nullptr)
    80002678:	0084b783          	ld	a5,8(s1)
    8000267c:	02078263          	beqz	a5,800026a0 <_ZN10MojSemafor4waitEv+0xa4>
     kraj = kraj->sledeci = noviCvor;
    80002680:	00a7b423          	sd	a0,8(a5)
    80002684:	00a4b423          	sd	a0,8(s1)
    TCB::dispatch();
    80002688:	00000097          	auipc	ra,0x0
    8000268c:	9d8080e7          	jalr	-1576(ra) # 80002060 <_ZN3TCB8dispatchEv>
    if(!otvoren)
    80002690:	0104c783          	lbu	a5,16(s1)
    80002694:	02078063          	beqz	a5,800026b4 <_ZN10MojSemafor4waitEv+0xb8>
  return 0;
    80002698:	00000513          	li	a0,0
    8000269c:	f9dff06f          	j	80002638 <_ZN10MojSemafor4waitEv+0x3c>
    pocetak = kraj = noviCvor;
    800026a0:	00a4b423          	sd	a0,8(s1)
    800026a4:	00a4b023          	sd	a0,0(s1)
    800026a8:	fe1ff06f          	j	80002688 <_ZN10MojSemafor4waitEv+0x8c>
    return -1;
    800026ac:	fff00513          	li	a0,-1
}
    800026b0:	00008067          	ret
      return -2;
    800026b4:	ffe00513          	li	a0,-2
    800026b8:	f81ff06f          	j	80002638 <_ZN10MojSemafor4waitEv+0x3c>

00000000800026bc <_ZN10MojSemafor5closeEv>:

int MojSemafor::close()
{
  if(!otvoren)
    800026bc:	01054783          	lbu	a5,16(a0)
    800026c0:	06078463          	beqz	a5,80002728 <_ZN10MojSemafor5closeEv+0x6c>
{
    800026c4:	fe010113          	addi	sp,sp,-32
    800026c8:	00113c23          	sd	ra,24(sp)
    800026cc:	00813823          	sd	s0,16(sp)
    800026d0:	00913423          	sd	s1,8(sp)
    800026d4:	01213023          	sd	s2,0(sp)
    800026d8:	02010413          	addi	s0,sp,32
    800026dc:	00050493          	mv	s1,a0
    return -1;

  otvoren = false;
    800026e0:	00050823          	sb	zero,16(a0)
    800026e4:	0240006f          	j	80002708 <_ZN10MojSemafor5closeEv+0x4c>
    kraj = nullptr;
    800026e8:	0004b423          	sd	zero,8(s1)
  T* pv = cvor->podaci;
    800026ec:	00053903          	ld	s2,0(a0)
  delete cvor;
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	2b8080e7          	jalr	696(ra) # 800019a8 <_ZdlPv>
     this->blokirana = false;
    800026f8:	020904a3          	sb	zero,41(s2)
  while(blokirane.dohvatiPrvi() != nullptr)
  {
    TCB *thread = blokirane.izbaciPrvi();
    thread->odblokiraj();
    Scheduler::stavi(thread);
    800026fc:	00090513          	mv	a0,s2
    80002700:	fffff097          	auipc	ra,0xfffff
    80002704:	338080e7          	jalr	824(ra) # 80001a38 <_ZN9Scheduler5staviEP3TCB>
    return pv;
}

T* dohvatiPrvi()
{
if(pocetak == nullptr)
    80002708:	0004b503          	ld	a0,0(s1)
    8000270c:	02050263          	beqz	a0,80002730 <_ZN10MojSemafor5closeEv+0x74>
  return nullptr;

return pocetak->podaci;
    80002710:	00053783          	ld	a5,0(a0)
  while(blokirane.dohvatiPrvi() != nullptr)
    80002714:	02078c63          	beqz	a5,8000274c <_ZN10MojSemafor5closeEv+0x90>
  pocetak = pocetak->sledeci;
    80002718:	00853783          	ld	a5,8(a0)
    8000271c:	00f4b023          	sd	a5,0(s1)
  if(pocetak == nullptr)
    80002720:	fc0796e3          	bnez	a5,800026ec <_ZN10MojSemafor5closeEv+0x30>
    80002724:	fc5ff06f          	j	800026e8 <_ZN10MojSemafor5closeEv+0x2c>
    return -1;
    80002728:	fff00513          	li	a0,-1
  }

  return 0;
}
    8000272c:	00008067          	ret
  return 0;
    80002730:	00000513          	li	a0,0
}
    80002734:	01813083          	ld	ra,24(sp)
    80002738:	01013403          	ld	s0,16(sp)
    8000273c:	00813483          	ld	s1,8(sp)
    80002740:	00013903          	ld	s2,0(sp)
    80002744:	02010113          	addi	sp,sp,32
    80002748:	00008067          	ret
  return 0;
    8000274c:	00000513          	li	a0,0
    80002750:	fe5ff06f          	j	80002734 <_ZN10MojSemafor5closeEv+0x78>

0000000080002754 <_ZN10MojSemaforD1Ev>:
  if(otvoren)
    80002754:	01054783          	lbu	a5,16(a0)
    80002758:	00079463          	bnez	a5,80002760 <_ZN10MojSemaforD1Ev+0xc>
    8000275c:	00008067          	ret
MojSemafor::~MojSemafor()
    80002760:	ff010113          	addi	sp,sp,-16
    80002764:	00113423          	sd	ra,8(sp)
    80002768:	00813023          	sd	s0,0(sp)
    8000276c:	01010413          	addi	s0,sp,16
    close();
    80002770:	00000097          	auipc	ra,0x0
    80002774:	f4c080e7          	jalr	-180(ra) # 800026bc <_ZN10MojSemafor5closeEv>
}
    80002778:	00813083          	ld	ra,8(sp)
    8000277c:	00013403          	ld	s0,0(sp)
    80002780:	01010113          	addi	sp,sp,16
    80002784:	00008067          	ret

0000000080002788 <_ZN10MojSemafor7trywaitEv>:

int MojSemafor::trywait()
{
    80002788:	ff010113          	addi	sp,sp,-16
    8000278c:	00813423          	sd	s0,8(sp)
    80002790:	01010413          	addi	s0,sp,16
  if(vrednost <= 0)
    80002794:	01452783          	lw	a5,20(a0)
    80002798:	00f05e63          	blez	a5,800027b4 <_ZN10MojSemafor7trywaitEv+0x2c>
    return 1;
  else
  {
    vrednost--;
    8000279c:	fff7879b          	addiw	a5,a5,-1
    800027a0:	00f52a23          	sw	a5,20(a0)
    return 0;
    800027a4:	00000513          	li	a0,0
  }
}
    800027a8:	00813403          	ld	s0,8(sp)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret
    return 1;
    800027b4:	00100513          	li	a0,1
    800027b8:	ff1ff06f          	j	800027a8 <_ZN10MojSemafor7trywaitEv+0x20>

00000000800027bc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800027bc:	fe010113          	addi	sp,sp,-32
    800027c0:	00113c23          	sd	ra,24(sp)
    800027c4:	00813823          	sd	s0,16(sp)
    800027c8:	00913423          	sd	s1,8(sp)
    800027cc:	01213023          	sd	s2,0(sp)
    800027d0:	02010413          	addi	s0,sp,32
    800027d4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800027d8:	00000913          	li	s2,0
    800027dc:	00c0006f          	j	800027e8 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800027e0:	fffff097          	auipc	ra,0xfffff
    800027e4:	fc0080e7          	jalr	-64(ra) # 800017a0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    800027e8:	fffff097          	auipc	ra,0xfffff
    800027ec:	0dc080e7          	jalr	220(ra) # 800018c4 <_Z4getcv>
    800027f0:	0005059b          	sext.w	a1,a0
    800027f4:	01b00793          	li	a5,27
    800027f8:	02f58a63          	beq	a1,a5,8000282c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800027fc:	0084b503          	ld	a0,8(s1)
    80002800:	00003097          	auipc	ra,0x3
    80002804:	94c080e7          	jalr	-1716(ra) # 8000514c <_ZN6Buffer3putEi>
        i++;
    80002808:	0019071b          	addiw	a4,s2,1
    8000280c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002810:	0004a683          	lw	a3,0(s1)
    80002814:	0026979b          	slliw	a5,a3,0x2
    80002818:	00d787bb          	addw	a5,a5,a3
    8000281c:	0017979b          	slliw	a5,a5,0x1
    80002820:	02f767bb          	remw	a5,a4,a5
    80002824:	fc0792e3          	bnez	a5,800027e8 <_ZL16producerKeyboardPv+0x2c>
    80002828:	fb9ff06f          	j	800027e0 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000282c:	00100793          	li	a5,1
    80002830:	00007717          	auipc	a4,0x7
    80002834:	76f72c23          	sw	a5,1912(a4) # 80009fa8 <_ZL9threadEnd>
    data->buffer->put('!');
    80002838:	02100593          	li	a1,33
    8000283c:	0084b503          	ld	a0,8(s1)
    80002840:	00003097          	auipc	ra,0x3
    80002844:	90c080e7          	jalr	-1780(ra) # 8000514c <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002848:	0104b503          	ld	a0,16(s1)
    8000284c:	fffff097          	auipc	ra,0xfffff
    80002850:	020080e7          	jalr	32(ra) # 8000186c <_Z10sem_signalP10MojSemafor>
}
    80002854:	01813083          	ld	ra,24(sp)
    80002858:	01013403          	ld	s0,16(sp)
    8000285c:	00813483          	ld	s1,8(sp)
    80002860:	00013903          	ld	s2,0(sp)
    80002864:	02010113          	addi	sp,sp,32
    80002868:	00008067          	ret

000000008000286c <_ZL8producerPv>:

static void producer(void *arg) {
    8000286c:	fe010113          	addi	sp,sp,-32
    80002870:	00113c23          	sd	ra,24(sp)
    80002874:	00813823          	sd	s0,16(sp)
    80002878:	00913423          	sd	s1,8(sp)
    8000287c:	01213023          	sd	s2,0(sp)
    80002880:	02010413          	addi	s0,sp,32
    80002884:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002888:	00000913          	li	s2,0
    8000288c:	00c0006f          	j	80002898 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002890:	fffff097          	auipc	ra,0xfffff
    80002894:	f10080e7          	jalr	-240(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002898:	00007797          	auipc	a5,0x7
    8000289c:	7107a783          	lw	a5,1808(a5) # 80009fa8 <_ZL9threadEnd>
    800028a0:	02079e63          	bnez	a5,800028dc <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800028a4:	0004a583          	lw	a1,0(s1)
    800028a8:	0305859b          	addiw	a1,a1,48
    800028ac:	0084b503          	ld	a0,8(s1)
    800028b0:	00003097          	auipc	ra,0x3
    800028b4:	89c080e7          	jalr	-1892(ra) # 8000514c <_ZN6Buffer3putEi>
        i++;
    800028b8:	0019071b          	addiw	a4,s2,1
    800028bc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800028c0:	0004a683          	lw	a3,0(s1)
    800028c4:	0026979b          	slliw	a5,a3,0x2
    800028c8:	00d787bb          	addw	a5,a5,a3
    800028cc:	0017979b          	slliw	a5,a5,0x1
    800028d0:	02f767bb          	remw	a5,a4,a5
    800028d4:	fc0792e3          	bnez	a5,80002898 <_ZL8producerPv+0x2c>
    800028d8:	fb9ff06f          	j	80002890 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800028dc:	0104b503          	ld	a0,16(s1)
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	f8c080e7          	jalr	-116(ra) # 8000186c <_Z10sem_signalP10MojSemafor>
}
    800028e8:	01813083          	ld	ra,24(sp)
    800028ec:	01013403          	ld	s0,16(sp)
    800028f0:	00813483          	ld	s1,8(sp)
    800028f4:	00013903          	ld	s2,0(sp)
    800028f8:	02010113          	addi	sp,sp,32
    800028fc:	00008067          	ret

0000000080002900 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002900:	fd010113          	addi	sp,sp,-48
    80002904:	02113423          	sd	ra,40(sp)
    80002908:	02813023          	sd	s0,32(sp)
    8000290c:	00913c23          	sd	s1,24(sp)
    80002910:	01213823          	sd	s2,16(sp)
    80002914:	01313423          	sd	s3,8(sp)
    80002918:	03010413          	addi	s0,sp,48
    8000291c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002920:	00000993          	li	s3,0
    80002924:	01c0006f          	j	80002940 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002928:	fffff097          	auipc	ra,0xfffff
    8000292c:	e78080e7          	jalr	-392(ra) # 800017a0 <_Z15thread_dispatchv>
    80002930:	0500006f          	j	80002980 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002934:	00a00513          	li	a0,10
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	fb4080e7          	jalr	-76(ra) # 800018ec <_Z4putcc>
    while (!threadEnd) {
    80002940:	00007797          	auipc	a5,0x7
    80002944:	6687a783          	lw	a5,1640(a5) # 80009fa8 <_ZL9threadEnd>
    80002948:	06079063          	bnez	a5,800029a8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    8000294c:	00893503          	ld	a0,8(s2)
    80002950:	00003097          	auipc	ra,0x3
    80002954:	88c080e7          	jalr	-1908(ra) # 800051dc <_ZN6Buffer3getEv>
        i++;
    80002958:	0019849b          	addiw	s1,s3,1
    8000295c:	0004899b          	sext.w	s3,s1
        putc(key);
    80002960:	0ff57513          	andi	a0,a0,255
    80002964:	fffff097          	auipc	ra,0xfffff
    80002968:	f88080e7          	jalr	-120(ra) # 800018ec <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    8000296c:	00092703          	lw	a4,0(s2)
    80002970:	0027179b          	slliw	a5,a4,0x2
    80002974:	00e787bb          	addw	a5,a5,a4
    80002978:	02f4e7bb          	remw	a5,s1,a5
    8000297c:	fa0786e3          	beqz	a5,80002928 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80002980:	05000793          	li	a5,80
    80002984:	02f4e4bb          	remw	s1,s1,a5
    80002988:	fa049ce3          	bnez	s1,80002940 <_ZL8consumerPv+0x40>
    8000298c:	fa9ff06f          	j	80002934 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002990:	00893503          	ld	a0,8(s2)
    80002994:	00003097          	auipc	ra,0x3
    80002998:	848080e7          	jalr	-1976(ra) # 800051dc <_ZN6Buffer3getEv>
        putc(key);
    8000299c:	0ff57513          	andi	a0,a0,255
    800029a0:	fffff097          	auipc	ra,0xfffff
    800029a4:	f4c080e7          	jalr	-180(ra) # 800018ec <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    800029a8:	00893503          	ld	a0,8(s2)
    800029ac:	00003097          	auipc	ra,0x3
    800029b0:	8bc080e7          	jalr	-1860(ra) # 80005268 <_ZN6Buffer6getCntEv>
    800029b4:	fca04ee3          	bgtz	a0,80002990 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800029b8:	01093503          	ld	a0,16(s2)
    800029bc:	fffff097          	auipc	ra,0xfffff
    800029c0:	eb0080e7          	jalr	-336(ra) # 8000186c <_Z10sem_signalP10MojSemafor>
}
    800029c4:	02813083          	ld	ra,40(sp)
    800029c8:	02013403          	ld	s0,32(sp)
    800029cc:	01813483          	ld	s1,24(sp)
    800029d0:	01013903          	ld	s2,16(sp)
    800029d4:	00813983          	ld	s3,8(sp)
    800029d8:	03010113          	addi	sp,sp,48
    800029dc:	00008067          	ret

00000000800029e0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800029e0:	f2010113          	addi	sp,sp,-224
    800029e4:	0c113c23          	sd	ra,216(sp)
    800029e8:	0c813823          	sd	s0,208(sp)
    800029ec:	0c913423          	sd	s1,200(sp)
    800029f0:	0d213023          	sd	s2,192(sp)
    800029f4:	0e010413          	addi	s0,sp,224
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    800029f8:	00005517          	auipc	a0,0x5
    800029fc:	73850513          	addi	a0,a0,1848 # 80008130 <CONSOLE_STATUS+0x120>
    80002a00:	00002097          	auipc	ra,0x2
    80002a04:	9b8080e7          	jalr	-1608(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 5;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    80002a08:	00005517          	auipc	a0,0x5
    80002a0c:	74850513          	addi	a0,a0,1864 # 80008150 <CONSOLE_STATUS+0x140>
    80002a10:	00002097          	auipc	ra,0x2
    80002a14:	9a8080e7          	jalr	-1624(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    80002a18:	00005517          	auipc	a0,0x5
    80002a1c:	75850513          	addi	a0,a0,1880 # 80008170 <CONSOLE_STATUS+0x160>
    80002a20:	00002097          	auipc	ra,0x2
    80002a24:	998080e7          	jalr	-1640(ra) # 800043b8 <_Z11printStringPKc>
    80002a28:	00000613          	li	a2,0
    80002a2c:	00a00593          	li	a1,10
    80002a30:	00500513          	li	a0,5
    80002a34:	00002097          	auipc	ra,0x2
    80002a38:	b34080e7          	jalr	-1228(ra) # 80004568 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002a3c:	00005517          	auipc	a0,0x5
    80002a40:	74c50513          	addi	a0,a0,1868 # 80008188 <CONSOLE_STATUS+0x178>
    80002a44:	00002097          	auipc	ra,0x2
    80002a48:	974080e7          	jalr	-1676(ra) # 800043b8 <_Z11printStringPKc>
    80002a4c:	00000613          	li	a2,0
    80002a50:	00a00593          	li	a1,10
    80002a54:	00a00513          	li	a0,10
    80002a58:	00002097          	auipc	ra,0x2
    80002a5c:	b10080e7          	jalr	-1264(ra) # 80004568 <_Z8printIntiii>
    printString(".\n");
    80002a60:	00005517          	auipc	a0,0x5
    80002a64:	74050513          	addi	a0,a0,1856 # 800081a0 <CONSOLE_STATUS+0x190>
    80002a68:	00002097          	auipc	ra,0x2
    80002a6c:	950080e7          	jalr	-1712(ra) # 800043b8 <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    Buffer *buffer = new Buffer(n);
    80002a70:	03800513          	li	a0,56
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	ee4080e7          	jalr	-284(ra) # 80001958 <_Znwm>
    80002a7c:	00050913          	mv	s2,a0
    80002a80:	00a00593          	li	a1,10
    80002a84:	00002097          	auipc	ra,0x2
    80002a88:	62c080e7          	jalr	1580(ra) # 800050b0 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    80002a8c:	00000593          	li	a1,0
    80002a90:	00007517          	auipc	a0,0x7
    80002a94:	52050513          	addi	a0,a0,1312 # 80009fb0 <_ZL10waitForAll>
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	d4c080e7          	jalr	-692(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];

    data[threadNum].id = threadNum;
    80002aa0:	00500793          	li	a5,5
    80002aa4:	fcf42023          	sw	a5,-64(s0)
    data[threadNum].buffer = buffer;
    80002aa8:	fd243423          	sd	s2,-56(s0)
    data[threadNum].wait = waitForAll;
    80002aac:	00007797          	auipc	a5,0x7
    80002ab0:	5047b783          	ld	a5,1284(a5) # 80009fb0 <_ZL10waitForAll>
    80002ab4:	fcf43823          	sd	a5,-48(s0)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002ab8:	fc040613          	addi	a2,s0,-64
    80002abc:	00000597          	auipc	a1,0x0
    80002ac0:	e4458593          	addi	a1,a1,-444 # 80002900 <_ZL8consumerPv>
    80002ac4:	fd840513          	addi	a0,s0,-40
    80002ac8:	fffff097          	auipc	ra,0xfffff
    80002acc:	bb8080e7          	jalr	-1096(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    80002ad0:	00000493          	li	s1,0
    80002ad4:	00400793          	li	a5,4
    80002ad8:	0697cc63          	blt	a5,s1,80002b50 <_Z22producerConsumer_C_APIv+0x170>
        data[i].id = i;
    80002adc:	00149793          	slli	a5,s1,0x1
    80002ae0:	009787b3          	add	a5,a5,s1
    80002ae4:	00379793          	slli	a5,a5,0x3
    80002ae8:	fe040713          	addi	a4,s0,-32
    80002aec:	00f707b3          	add	a5,a4,a5
    80002af0:	f697a423          	sw	s1,-152(a5)
        data[i].buffer = buffer;
    80002af4:	f727b823          	sd	s2,-144(a5)
        data[i].wait = waitForAll;
    80002af8:	00007717          	auipc	a4,0x7
    80002afc:	4b873703          	ld	a4,1208(a4) # 80009fb0 <_ZL10waitForAll>
    80002b00:	f6e7bc23          	sd	a4,-136(a5)

        thread_create(threads + i,
    80002b04:	00048613          	mv	a2,s1
    80002b08:	00349513          	slli	a0,s1,0x3
    80002b0c:	f2040713          	addi	a4,s0,-224
    80002b10:	00a70533          	add	a0,a4,a0
    80002b14:	02905863          	blez	s1,80002b44 <_Z22producerConsumer_C_APIv+0x164>
    80002b18:	00000597          	auipc	a1,0x0
    80002b1c:	d5458593          	addi	a1,a1,-684 # 8000286c <_ZL8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80002b20:	00161793          	slli	a5,a2,0x1
    80002b24:	00c787b3          	add	a5,a5,a2
    80002b28:	00379793          	slli	a5,a5,0x3
        thread_create(threads + i,
    80002b2c:	f4840613          	addi	a2,s0,-184
    80002b30:	00f60633          	add	a2,a2,a5
    80002b34:	fffff097          	auipc	ra,0xfffff
    80002b38:	b4c080e7          	jalr	-1204(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002b3c:	0014849b          	addiw	s1,s1,1
    80002b40:	f95ff06f          	j	80002ad4 <_Z22producerConsumer_C_APIv+0xf4>
        thread_create(threads + i,
    80002b44:	00000597          	auipc	a1,0x0
    80002b48:	c7858593          	addi	a1,a1,-904 # 800027bc <_ZL16producerKeyboardPv>
    80002b4c:	fd5ff06f          	j	80002b20 <_Z22producerConsumer_C_APIv+0x140>
    }

    thread_dispatch();
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	c50080e7          	jalr	-944(ra) # 800017a0 <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    80002b58:	00000493          	li	s1,0
    80002b5c:	00500793          	li	a5,5
    80002b60:	0097ce63          	blt	a5,s1,80002b7c <_Z22producerConsumer_C_APIv+0x19c>
        sem_wait(waitForAll);
    80002b64:	00007517          	auipc	a0,0x7
    80002b68:	44c53503          	ld	a0,1100(a0) # 80009fb0 <_ZL10waitForAll>
    80002b6c:	fffff097          	auipc	ra,0xfffff
    80002b70:	cd4080e7          	jalr	-812(ra) # 80001840 <_Z8sem_waitP10MojSemafor>
    for (int i = 0; i <= threadNum; i++) {
    80002b74:	0014849b          	addiw	s1,s1,1
    80002b78:	fe5ff06f          	j	80002b5c <_Z22producerConsumer_C_APIv+0x17c>
    }

    sem_close(waitForAll);
    80002b7c:	00007517          	auipc	a0,0x7
    80002b80:	43453503          	ld	a0,1076(a0) # 80009fb0 <_ZL10waitForAll>
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	c90080e7          	jalr	-880(ra) # 80001814 <_Z9sem_closeP10MojSemafor>

    delete buffer;
    80002b8c:	00090e63          	beqz	s2,80002ba8 <_Z22producerConsumer_C_APIv+0x1c8>
    80002b90:	00090513          	mv	a0,s2
    80002b94:	00002097          	auipc	ra,0x2
    80002b98:	75c080e7          	jalr	1884(ra) # 800052f0 <_ZN6BufferD1Ev>
    80002b9c:	00090513          	mv	a0,s2
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	e08080e7          	jalr	-504(ra) # 800019a8 <_ZdlPv>

}
    80002ba8:	0d813083          	ld	ra,216(sp)
    80002bac:	0d013403          	ld	s0,208(sp)
    80002bb0:	0c813483          	ld	s1,200(sp)
    80002bb4:	0c013903          	ld	s2,192(sp)
    80002bb8:	0e010113          	addi	sp,sp,224
    80002bbc:	00008067          	ret
    80002bc0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80002bc4:	00090513          	mv	a0,s2
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	de0080e7          	jalr	-544(ra) # 800019a8 <_ZdlPv>
    80002bd0:	00048513          	mv	a0,s1
    80002bd4:	00008097          	auipc	ra,0x8
    80002bd8:	4e4080e7          	jalr	1252(ra) # 8000b0b8 <_Unwind_Resume>

0000000080002bdc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002bdc:	fe010113          	addi	sp,sp,-32
    80002be0:	00113c23          	sd	ra,24(sp)
    80002be4:	00813823          	sd	s0,16(sp)
    80002be8:	00913423          	sd	s1,8(sp)
    80002bec:	01213023          	sd	s2,0(sp)
    80002bf0:	02010413          	addi	s0,sp,32
    80002bf4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002bf8:	00100793          	li	a5,1
    80002bfc:	02a7f863          	bgeu	a5,a0,80002c2c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002c00:	00a00793          	li	a5,10
    80002c04:	02f577b3          	remu	a5,a0,a5
    80002c08:	02078e63          	beqz	a5,80002c44 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002c0c:	fff48513          	addi	a0,s1,-1
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	fcc080e7          	jalr	-52(ra) # 80002bdc <_ZL9fibonaccim>
    80002c18:	00050913          	mv	s2,a0
    80002c1c:	ffe48513          	addi	a0,s1,-2
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	fbc080e7          	jalr	-68(ra) # 80002bdc <_ZL9fibonaccim>
    80002c28:	00a90533          	add	a0,s2,a0
}
    80002c2c:	01813083          	ld	ra,24(sp)
    80002c30:	01013403          	ld	s0,16(sp)
    80002c34:	00813483          	ld	s1,8(sp)
    80002c38:	00013903          	ld	s2,0(sp)
    80002c3c:	02010113          	addi	sp,sp,32
    80002c40:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	b5c080e7          	jalr	-1188(ra) # 800017a0 <_Z15thread_dispatchv>
    80002c4c:	fc1ff06f          	j	80002c0c <_ZL9fibonaccim+0x30>

0000000080002c50 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002c50:	fe010113          	addi	sp,sp,-32
    80002c54:	00113c23          	sd	ra,24(sp)
    80002c58:	00813823          	sd	s0,16(sp)
    80002c5c:	00913423          	sd	s1,8(sp)
    80002c60:	01213023          	sd	s2,0(sp)
    80002c64:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002c68:	00000913          	li	s2,0
    80002c6c:	0380006f          	j	80002ca4 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002c70:	fffff097          	auipc	ra,0xfffff
    80002c74:	b30080e7          	jalr	-1232(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002c78:	00148493          	addi	s1,s1,1
    80002c7c:	000027b7          	lui	a5,0x2
    80002c80:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002c84:	0097ee63          	bltu	a5,s1,80002ca0 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002c88:	00000713          	li	a4,0
    80002c8c:	000077b7          	lui	a5,0x7
    80002c90:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002c94:	fce7eee3          	bltu	a5,a4,80002c70 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002c98:	00170713          	addi	a4,a4,1
    80002c9c:	ff1ff06f          	j	80002c8c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002ca0:	00190913          	addi	s2,s2,1
    80002ca4:	00900793          	li	a5,9
    80002ca8:	0527e063          	bltu	a5,s2,80002ce8 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002cac:	00005517          	auipc	a0,0x5
    80002cb0:	4fc50513          	addi	a0,a0,1276 # 800081a8 <CONSOLE_STATUS+0x198>
    80002cb4:	00001097          	auipc	ra,0x1
    80002cb8:	704080e7          	jalr	1796(ra) # 800043b8 <_Z11printStringPKc>
    80002cbc:	00000613          	li	a2,0
    80002cc0:	00a00593          	li	a1,10
    80002cc4:	0009051b          	sext.w	a0,s2
    80002cc8:	00002097          	auipc	ra,0x2
    80002ccc:	8a0080e7          	jalr	-1888(ra) # 80004568 <_Z8printIntiii>
    80002cd0:	00005517          	auipc	a0,0x5
    80002cd4:	49850513          	addi	a0,a0,1176 # 80008168 <CONSOLE_STATUS+0x158>
    80002cd8:	00001097          	auipc	ra,0x1
    80002cdc:	6e0080e7          	jalr	1760(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002ce0:	00000493          	li	s1,0
    80002ce4:	f99ff06f          	j	80002c7c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002ce8:	00005517          	auipc	a0,0x5
    80002cec:	4c850513          	addi	a0,a0,1224 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80002cf0:	00001097          	auipc	ra,0x1
    80002cf4:	6c8080e7          	jalr	1736(ra) # 800043b8 <_Z11printStringPKc>
    finishedA = true;
    80002cf8:	00100793          	li	a5,1
    80002cfc:	00007717          	auipc	a4,0x7
    80002d00:	2af70e23          	sb	a5,700(a4) # 80009fb8 <_ZL9finishedA>
}
    80002d04:	01813083          	ld	ra,24(sp)
    80002d08:	01013403          	ld	s0,16(sp)
    80002d0c:	00813483          	ld	s1,8(sp)
    80002d10:	00013903          	ld	s2,0(sp)
    80002d14:	02010113          	addi	sp,sp,32
    80002d18:	00008067          	ret

0000000080002d1c <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002d1c:	fe010113          	addi	sp,sp,-32
    80002d20:	00113c23          	sd	ra,24(sp)
    80002d24:	00813823          	sd	s0,16(sp)
    80002d28:	00913423          	sd	s1,8(sp)
    80002d2c:	01213023          	sd	s2,0(sp)
    80002d30:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002d34:	00000913          	li	s2,0
    80002d38:	0380006f          	j	80002d70 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002d3c:	fffff097          	auipc	ra,0xfffff
    80002d40:	a64080e7          	jalr	-1436(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002d44:	00148493          	addi	s1,s1,1
    80002d48:	000027b7          	lui	a5,0x2
    80002d4c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002d50:	0097ee63          	bltu	a5,s1,80002d6c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002d54:	00000713          	li	a4,0
    80002d58:	000077b7          	lui	a5,0x7
    80002d5c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002d60:	fce7eee3          	bltu	a5,a4,80002d3c <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002d64:	00170713          	addi	a4,a4,1
    80002d68:	ff1ff06f          	j	80002d58 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80002d6c:	00190913          	addi	s2,s2,1
    80002d70:	00f00793          	li	a5,15
    80002d74:	0527e063          	bltu	a5,s2,80002db4 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80002d78:	00005517          	auipc	a0,0x5
    80002d7c:	44850513          	addi	a0,a0,1096 # 800081c0 <CONSOLE_STATUS+0x1b0>
    80002d80:	00001097          	auipc	ra,0x1
    80002d84:	638080e7          	jalr	1592(ra) # 800043b8 <_Z11printStringPKc>
    80002d88:	00000613          	li	a2,0
    80002d8c:	00a00593          	li	a1,10
    80002d90:	0009051b          	sext.w	a0,s2
    80002d94:	00001097          	auipc	ra,0x1
    80002d98:	7d4080e7          	jalr	2004(ra) # 80004568 <_Z8printIntiii>
    80002d9c:	00005517          	auipc	a0,0x5
    80002da0:	3cc50513          	addi	a0,a0,972 # 80008168 <CONSOLE_STATUS+0x158>
    80002da4:	00001097          	auipc	ra,0x1
    80002da8:	614080e7          	jalr	1556(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002dac:	00000493          	li	s1,0
    80002db0:	f99ff06f          	j	80002d48 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80002db4:	00005517          	auipc	a0,0x5
    80002db8:	41450513          	addi	a0,a0,1044 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002dbc:	00001097          	auipc	ra,0x1
    80002dc0:	5fc080e7          	jalr	1532(ra) # 800043b8 <_Z11printStringPKc>
    finishedB = true;
    80002dc4:	00100793          	li	a5,1
    80002dc8:	00007717          	auipc	a4,0x7
    80002dcc:	1ef708a3          	sb	a5,497(a4) # 80009fb9 <_ZL9finishedB>
    thread_dispatch();
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	9d0080e7          	jalr	-1584(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80002dd8:	01813083          	ld	ra,24(sp)
    80002ddc:	01013403          	ld	s0,16(sp)
    80002de0:	00813483          	ld	s1,8(sp)
    80002de4:	00013903          	ld	s2,0(sp)
    80002de8:	02010113          	addi	sp,sp,32
    80002dec:	00008067          	ret

0000000080002df0 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002df0:	fe010113          	addi	sp,sp,-32
    80002df4:	00113c23          	sd	ra,24(sp)
    80002df8:	00813823          	sd	s0,16(sp)
    80002dfc:	00913423          	sd	s1,8(sp)
    80002e00:	01213023          	sd	s2,0(sp)
    80002e04:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002e08:	00000493          	li	s1,0
    80002e0c:	0400006f          	j	80002e4c <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002e10:	00005517          	auipc	a0,0x5
    80002e14:	3c850513          	addi	a0,a0,968 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80002e18:	00001097          	auipc	ra,0x1
    80002e1c:	5a0080e7          	jalr	1440(ra) # 800043b8 <_Z11printStringPKc>
    80002e20:	00000613          	li	a2,0
    80002e24:	00a00593          	li	a1,10
    80002e28:	00048513          	mv	a0,s1
    80002e2c:	00001097          	auipc	ra,0x1
    80002e30:	73c080e7          	jalr	1852(ra) # 80004568 <_Z8printIntiii>
    80002e34:	00005517          	auipc	a0,0x5
    80002e38:	33450513          	addi	a0,a0,820 # 80008168 <CONSOLE_STATUS+0x158>
    80002e3c:	00001097          	auipc	ra,0x1
    80002e40:	57c080e7          	jalr	1404(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80002e44:	0014849b          	addiw	s1,s1,1
    80002e48:	0ff4f493          	andi	s1,s1,255
    80002e4c:	00200793          	li	a5,2
    80002e50:	fc97f0e3          	bgeu	a5,s1,80002e10 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80002e54:	00005517          	auipc	a0,0x5
    80002e58:	38c50513          	addi	a0,a0,908 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80002e5c:	00001097          	auipc	ra,0x1
    80002e60:	55c080e7          	jalr	1372(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80002e64:	00700313          	li	t1,7
    thread_dispatch();
    80002e68:	fffff097          	auipc	ra,0xfffff
    80002e6c:	938080e7          	jalr	-1736(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80002e70:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80002e74:	00005517          	auipc	a0,0x5
    80002e78:	37c50513          	addi	a0,a0,892 # 800081f0 <CONSOLE_STATUS+0x1e0>
    80002e7c:	00001097          	auipc	ra,0x1
    80002e80:	53c080e7          	jalr	1340(ra) # 800043b8 <_Z11printStringPKc>
    80002e84:	00000613          	li	a2,0
    80002e88:	00a00593          	li	a1,10
    80002e8c:	0009051b          	sext.w	a0,s2
    80002e90:	00001097          	auipc	ra,0x1
    80002e94:	6d8080e7          	jalr	1752(ra) # 80004568 <_Z8printIntiii>
    80002e98:	00005517          	auipc	a0,0x5
    80002e9c:	2d050513          	addi	a0,a0,720 # 80008168 <CONSOLE_STATUS+0x158>
    80002ea0:	00001097          	auipc	ra,0x1
    80002ea4:	518080e7          	jalr	1304(ra) # 800043b8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80002ea8:	00c00513          	li	a0,12
    80002eac:	00000097          	auipc	ra,0x0
    80002eb0:	d30080e7          	jalr	-720(ra) # 80002bdc <_ZL9fibonaccim>
    80002eb4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002eb8:	00005517          	auipc	a0,0x5
    80002ebc:	34050513          	addi	a0,a0,832 # 800081f8 <CONSOLE_STATUS+0x1e8>
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	4f8080e7          	jalr	1272(ra) # 800043b8 <_Z11printStringPKc>
    80002ec8:	00000613          	li	a2,0
    80002ecc:	00a00593          	li	a1,10
    80002ed0:	0009051b          	sext.w	a0,s2
    80002ed4:	00001097          	auipc	ra,0x1
    80002ed8:	694080e7          	jalr	1684(ra) # 80004568 <_Z8printIntiii>
    80002edc:	00005517          	auipc	a0,0x5
    80002ee0:	28c50513          	addi	a0,a0,652 # 80008168 <CONSOLE_STATUS+0x158>
    80002ee4:	00001097          	auipc	ra,0x1
    80002ee8:	4d4080e7          	jalr	1236(ra) # 800043b8 <_Z11printStringPKc>
    80002eec:	0400006f          	j	80002f2c <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002ef0:	00005517          	auipc	a0,0x5
    80002ef4:	2e850513          	addi	a0,a0,744 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80002ef8:	00001097          	auipc	ra,0x1
    80002efc:	4c0080e7          	jalr	1216(ra) # 800043b8 <_Z11printStringPKc>
    80002f00:	00000613          	li	a2,0
    80002f04:	00a00593          	li	a1,10
    80002f08:	00048513          	mv	a0,s1
    80002f0c:	00001097          	auipc	ra,0x1
    80002f10:	65c080e7          	jalr	1628(ra) # 80004568 <_Z8printIntiii>
    80002f14:	00005517          	auipc	a0,0x5
    80002f18:	25450513          	addi	a0,a0,596 # 80008168 <CONSOLE_STATUS+0x158>
    80002f1c:	00001097          	auipc	ra,0x1
    80002f20:	49c080e7          	jalr	1180(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80002f24:	0014849b          	addiw	s1,s1,1
    80002f28:	0ff4f493          	andi	s1,s1,255
    80002f2c:	00500793          	li	a5,5
    80002f30:	fc97f0e3          	bgeu	a5,s1,80002ef0 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80002f34:	00005517          	auipc	a0,0x5
    80002f38:	27c50513          	addi	a0,a0,636 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80002f3c:	00001097          	auipc	ra,0x1
    80002f40:	47c080e7          	jalr	1148(ra) # 800043b8 <_Z11printStringPKc>
    finishedC = true;
    80002f44:	00100793          	li	a5,1
    80002f48:	00007717          	auipc	a4,0x7
    80002f4c:	06f70923          	sb	a5,114(a4) # 80009fba <_ZL9finishedC>
    thread_dispatch();
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	850080e7          	jalr	-1968(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80002f58:	01813083          	ld	ra,24(sp)
    80002f5c:	01013403          	ld	s0,16(sp)
    80002f60:	00813483          	ld	s1,8(sp)
    80002f64:	00013903          	ld	s2,0(sp)
    80002f68:	02010113          	addi	sp,sp,32
    80002f6c:	00008067          	ret

0000000080002f70 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002f70:	fe010113          	addi	sp,sp,-32
    80002f74:	00113c23          	sd	ra,24(sp)
    80002f78:	00813823          	sd	s0,16(sp)
    80002f7c:	00913423          	sd	s1,8(sp)
    80002f80:	01213023          	sd	s2,0(sp)
    80002f84:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002f88:	00a00493          	li	s1,10
    80002f8c:	0400006f          	j	80002fcc <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002f90:	00005517          	auipc	a0,0x5
    80002f94:	27850513          	addi	a0,a0,632 # 80008208 <CONSOLE_STATUS+0x1f8>
    80002f98:	00001097          	auipc	ra,0x1
    80002f9c:	420080e7          	jalr	1056(ra) # 800043b8 <_Z11printStringPKc>
    80002fa0:	00000613          	li	a2,0
    80002fa4:	00a00593          	li	a1,10
    80002fa8:	00048513          	mv	a0,s1
    80002fac:	00001097          	auipc	ra,0x1
    80002fb0:	5bc080e7          	jalr	1468(ra) # 80004568 <_Z8printIntiii>
    80002fb4:	00005517          	auipc	a0,0x5
    80002fb8:	1b450513          	addi	a0,a0,436 # 80008168 <CONSOLE_STATUS+0x158>
    80002fbc:	00001097          	auipc	ra,0x1
    80002fc0:	3fc080e7          	jalr	1020(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002fc4:	0014849b          	addiw	s1,s1,1
    80002fc8:	0ff4f493          	andi	s1,s1,255
    80002fcc:	00c00793          	li	a5,12
    80002fd0:	fc97f0e3          	bgeu	a5,s1,80002f90 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80002fd4:	00005517          	auipc	a0,0x5
    80002fd8:	23c50513          	addi	a0,a0,572 # 80008210 <CONSOLE_STATUS+0x200>
    80002fdc:	00001097          	auipc	ra,0x1
    80002fe0:	3dc080e7          	jalr	988(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80002fe4:	00500313          	li	t1,5
    thread_dispatch();
    80002fe8:	ffffe097          	auipc	ra,0xffffe
    80002fec:	7b8080e7          	jalr	1976(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002ff0:	01000513          	li	a0,16
    80002ff4:	00000097          	auipc	ra,0x0
    80002ff8:	be8080e7          	jalr	-1048(ra) # 80002bdc <_ZL9fibonaccim>
    80002ffc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003000:	00005517          	auipc	a0,0x5
    80003004:	22050513          	addi	a0,a0,544 # 80008220 <CONSOLE_STATUS+0x210>
    80003008:	00001097          	auipc	ra,0x1
    8000300c:	3b0080e7          	jalr	944(ra) # 800043b8 <_Z11printStringPKc>
    80003010:	00000613          	li	a2,0
    80003014:	00a00593          	li	a1,10
    80003018:	0009051b          	sext.w	a0,s2
    8000301c:	00001097          	auipc	ra,0x1
    80003020:	54c080e7          	jalr	1356(ra) # 80004568 <_Z8printIntiii>
    80003024:	00005517          	auipc	a0,0x5
    80003028:	14450513          	addi	a0,a0,324 # 80008168 <CONSOLE_STATUS+0x158>
    8000302c:	00001097          	auipc	ra,0x1
    80003030:	38c080e7          	jalr	908(ra) # 800043b8 <_Z11printStringPKc>
    80003034:	0400006f          	j	80003074 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003038:	00005517          	auipc	a0,0x5
    8000303c:	1d050513          	addi	a0,a0,464 # 80008208 <CONSOLE_STATUS+0x1f8>
    80003040:	00001097          	auipc	ra,0x1
    80003044:	378080e7          	jalr	888(ra) # 800043b8 <_Z11printStringPKc>
    80003048:	00000613          	li	a2,0
    8000304c:	00a00593          	li	a1,10
    80003050:	00048513          	mv	a0,s1
    80003054:	00001097          	auipc	ra,0x1
    80003058:	514080e7          	jalr	1300(ra) # 80004568 <_Z8printIntiii>
    8000305c:	00005517          	auipc	a0,0x5
    80003060:	10c50513          	addi	a0,a0,268 # 80008168 <CONSOLE_STATUS+0x158>
    80003064:	00001097          	auipc	ra,0x1
    80003068:	354080e7          	jalr	852(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000306c:	0014849b          	addiw	s1,s1,1
    80003070:	0ff4f493          	andi	s1,s1,255
    80003074:	00f00793          	li	a5,15
    80003078:	fc97f0e3          	bgeu	a5,s1,80003038 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    8000307c:	00005517          	auipc	a0,0x5
    80003080:	1b450513          	addi	a0,a0,436 # 80008230 <CONSOLE_STATUS+0x220>
    80003084:	00001097          	auipc	ra,0x1
    80003088:	334080e7          	jalr	820(ra) # 800043b8 <_Z11printStringPKc>
    finishedD = true;
    8000308c:	00100793          	li	a5,1
    80003090:	00007717          	auipc	a4,0x7
    80003094:	f2f705a3          	sb	a5,-213(a4) # 80009fbb <_ZL9finishedD>
    thread_dispatch();
    80003098:	ffffe097          	auipc	ra,0xffffe
    8000309c:	708080e7          	jalr	1800(ra) # 800017a0 <_Z15thread_dispatchv>
}
    800030a0:	01813083          	ld	ra,24(sp)
    800030a4:	01013403          	ld	s0,16(sp)
    800030a8:	00813483          	ld	s1,8(sp)
    800030ac:	00013903          	ld	s2,0(sp)
    800030b0:	02010113          	addi	sp,sp,32
    800030b4:	00008067          	ret

00000000800030b8 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800030b8:	fc010113          	addi	sp,sp,-64
    800030bc:	02113c23          	sd	ra,56(sp)
    800030c0:	02813823          	sd	s0,48(sp)
    800030c4:	02913423          	sd	s1,40(sp)
    800030c8:	03213023          	sd	s2,32(sp)
    800030cc:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800030d0:	02000513          	li	a0,32
    800030d4:	fffff097          	auipc	ra,0xfffff
    800030d8:	884080e7          	jalr	-1916(ra) # 80001958 <_Znwm>
    800030dc:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800030e0:	fffff097          	auipc	ra,0xfffff
    800030e4:	d50080e7          	jalr	-688(ra) # 80001e30 <_ZN6ThreadC1Ev>
    800030e8:	00007797          	auipc	a5,0x7
    800030ec:	cb878793          	addi	a5,a5,-840 # 80009da0 <_ZTV7WorkerA+0x10>
    800030f0:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800030f4:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    800030f8:	00005517          	auipc	a0,0x5
    800030fc:	14850513          	addi	a0,a0,328 # 80008240 <CONSOLE_STATUS+0x230>
    80003100:	00001097          	auipc	ra,0x1
    80003104:	2b8080e7          	jalr	696(ra) # 800043b8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003108:	02000513          	li	a0,32
    8000310c:	fffff097          	auipc	ra,0xfffff
    80003110:	84c080e7          	jalr	-1972(ra) # 80001958 <_Znwm>
    80003114:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003118:	fffff097          	auipc	ra,0xfffff
    8000311c:	d18080e7          	jalr	-744(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80003120:	00007797          	auipc	a5,0x7
    80003124:	ca878793          	addi	a5,a5,-856 # 80009dc8 <_ZTV7WorkerB+0x10>
    80003128:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    8000312c:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003130:	00005517          	auipc	a0,0x5
    80003134:	12850513          	addi	a0,a0,296 # 80008258 <CONSOLE_STATUS+0x248>
    80003138:	00001097          	auipc	ra,0x1
    8000313c:	280080e7          	jalr	640(ra) # 800043b8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003140:	02000513          	li	a0,32
    80003144:	fffff097          	auipc	ra,0xfffff
    80003148:	814080e7          	jalr	-2028(ra) # 80001958 <_Znwm>
    8000314c:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003150:	fffff097          	auipc	ra,0xfffff
    80003154:	ce0080e7          	jalr	-800(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80003158:	00007797          	auipc	a5,0x7
    8000315c:	c9878793          	addi	a5,a5,-872 # 80009df0 <_ZTV7WorkerC+0x10>
    80003160:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003164:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003168:	00005517          	auipc	a0,0x5
    8000316c:	10850513          	addi	a0,a0,264 # 80008270 <CONSOLE_STATUS+0x260>
    80003170:	00001097          	auipc	ra,0x1
    80003174:	248080e7          	jalr	584(ra) # 800043b8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003178:	02000513          	li	a0,32
    8000317c:	ffffe097          	auipc	ra,0xffffe
    80003180:	7dc080e7          	jalr	2012(ra) # 80001958 <_Znwm>
    80003184:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003188:	fffff097          	auipc	ra,0xfffff
    8000318c:	ca8080e7          	jalr	-856(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80003190:	00007797          	auipc	a5,0x7
    80003194:	c8878793          	addi	a5,a5,-888 # 80009e18 <_ZTV7WorkerD+0x10>
    80003198:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    8000319c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800031a0:	00005517          	auipc	a0,0x5
    800031a4:	0e850513          	addi	a0,a0,232 # 80008288 <CONSOLE_STATUS+0x278>
    800031a8:	00001097          	auipc	ra,0x1
    800031ac:	210080e7          	jalr	528(ra) # 800043b8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800031b0:	00000493          	li	s1,0
    800031b4:	00300793          	li	a5,3
    800031b8:	0297c663          	blt	a5,s1,800031e4 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800031bc:	00349793          	slli	a5,s1,0x3
    800031c0:	fe040713          	addi	a4,s0,-32
    800031c4:	00f707b3          	add	a5,a4,a5
    800031c8:	fe07b503          	ld	a0,-32(a5)
    800031cc:	fffff097          	auipc	ra,0xfffff
    800031d0:	bf0080e7          	jalr	-1040(ra) # 80001dbc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800031d4:	0014849b          	addiw	s1,s1,1
    800031d8:	fddff06f          	j	800031b4 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800031dc:	fffff097          	auipc	ra,0xfffff
    800031e0:	c10080e7          	jalr	-1008(ra) # 80001dec <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800031e4:	00007797          	auipc	a5,0x7
    800031e8:	dd47c783          	lbu	a5,-556(a5) # 80009fb8 <_ZL9finishedA>
    800031ec:	fe0788e3          	beqz	a5,800031dc <_Z20Threads_CPP_API_testv+0x124>
    800031f0:	00007797          	auipc	a5,0x7
    800031f4:	dc97c783          	lbu	a5,-567(a5) # 80009fb9 <_ZL9finishedB>
    800031f8:	fe0782e3          	beqz	a5,800031dc <_Z20Threads_CPP_API_testv+0x124>
    800031fc:	00007797          	auipc	a5,0x7
    80003200:	dbe7c783          	lbu	a5,-578(a5) # 80009fba <_ZL9finishedC>
    80003204:	fc078ce3          	beqz	a5,800031dc <_Z20Threads_CPP_API_testv+0x124>
    80003208:	00007797          	auipc	a5,0x7
    8000320c:	db37c783          	lbu	a5,-589(a5) # 80009fbb <_ZL9finishedD>
    80003210:	fc0786e3          	beqz	a5,800031dc <_Z20Threads_CPP_API_testv+0x124>
    80003214:	fc040493          	addi	s1,s0,-64
    80003218:	0080006f          	j	80003220 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    8000321c:	00848493          	addi	s1,s1,8
    80003220:	fe040793          	addi	a5,s0,-32
    80003224:	08f48663          	beq	s1,a5,800032b0 <_Z20Threads_CPP_API_testv+0x1f8>
    80003228:	0004b503          	ld	a0,0(s1)
    8000322c:	fe0508e3          	beqz	a0,8000321c <_Z20Threads_CPP_API_testv+0x164>
    80003230:	00053783          	ld	a5,0(a0)
    80003234:	0087b783          	ld	a5,8(a5)
    80003238:	000780e7          	jalr	a5
    8000323c:	fe1ff06f          	j	8000321c <_Z20Threads_CPP_API_testv+0x164>
    80003240:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003244:	00048513          	mv	a0,s1
    80003248:	ffffe097          	auipc	ra,0xffffe
    8000324c:	760080e7          	jalr	1888(ra) # 800019a8 <_ZdlPv>
    80003250:	00090513          	mv	a0,s2
    80003254:	00008097          	auipc	ra,0x8
    80003258:	e64080e7          	jalr	-412(ra) # 8000b0b8 <_Unwind_Resume>
    8000325c:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003260:	00048513          	mv	a0,s1
    80003264:	ffffe097          	auipc	ra,0xffffe
    80003268:	744080e7          	jalr	1860(ra) # 800019a8 <_ZdlPv>
    8000326c:	00090513          	mv	a0,s2
    80003270:	00008097          	auipc	ra,0x8
    80003274:	e48080e7          	jalr	-440(ra) # 8000b0b8 <_Unwind_Resume>
    80003278:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    8000327c:	00048513          	mv	a0,s1
    80003280:	ffffe097          	auipc	ra,0xffffe
    80003284:	728080e7          	jalr	1832(ra) # 800019a8 <_ZdlPv>
    80003288:	00090513          	mv	a0,s2
    8000328c:	00008097          	auipc	ra,0x8
    80003290:	e2c080e7          	jalr	-468(ra) # 8000b0b8 <_Unwind_Resume>
    80003294:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003298:	00048513          	mv	a0,s1
    8000329c:	ffffe097          	auipc	ra,0xffffe
    800032a0:	70c080e7          	jalr	1804(ra) # 800019a8 <_ZdlPv>
    800032a4:	00090513          	mv	a0,s2
    800032a8:	00008097          	auipc	ra,0x8
    800032ac:	e10080e7          	jalr	-496(ra) # 8000b0b8 <_Unwind_Resume>
}
    800032b0:	03813083          	ld	ra,56(sp)
    800032b4:	03013403          	ld	s0,48(sp)
    800032b8:	02813483          	ld	s1,40(sp)
    800032bc:	02013903          	ld	s2,32(sp)
    800032c0:	04010113          	addi	sp,sp,64
    800032c4:	00008067          	ret

00000000800032c8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800032c8:	ff010113          	addi	sp,sp,-16
    800032cc:	00113423          	sd	ra,8(sp)
    800032d0:	00813023          	sd	s0,0(sp)
    800032d4:	01010413          	addi	s0,sp,16
    800032d8:	00007797          	auipc	a5,0x7
    800032dc:	ac878793          	addi	a5,a5,-1336 # 80009da0 <_ZTV7WorkerA+0x10>
    800032e0:	00f53023          	sd	a5,0(a0)
    800032e4:	fffff097          	auipc	ra,0xfffff
    800032e8:	990080e7          	jalr	-1648(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800032ec:	00813083          	ld	ra,8(sp)
    800032f0:	00013403          	ld	s0,0(sp)
    800032f4:	01010113          	addi	sp,sp,16
    800032f8:	00008067          	ret

00000000800032fc <_ZN7WorkerAD0Ev>:
    800032fc:	fe010113          	addi	sp,sp,-32
    80003300:	00113c23          	sd	ra,24(sp)
    80003304:	00813823          	sd	s0,16(sp)
    80003308:	00913423          	sd	s1,8(sp)
    8000330c:	02010413          	addi	s0,sp,32
    80003310:	00050493          	mv	s1,a0
    80003314:	00007797          	auipc	a5,0x7
    80003318:	a8c78793          	addi	a5,a5,-1396 # 80009da0 <_ZTV7WorkerA+0x10>
    8000331c:	00f53023          	sd	a5,0(a0)
    80003320:	fffff097          	auipc	ra,0xfffff
    80003324:	954080e7          	jalr	-1708(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80003328:	00048513          	mv	a0,s1
    8000332c:	ffffe097          	auipc	ra,0xffffe
    80003330:	67c080e7          	jalr	1660(ra) # 800019a8 <_ZdlPv>
    80003334:	01813083          	ld	ra,24(sp)
    80003338:	01013403          	ld	s0,16(sp)
    8000333c:	00813483          	ld	s1,8(sp)
    80003340:	02010113          	addi	sp,sp,32
    80003344:	00008067          	ret

0000000080003348 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003348:	ff010113          	addi	sp,sp,-16
    8000334c:	00113423          	sd	ra,8(sp)
    80003350:	00813023          	sd	s0,0(sp)
    80003354:	01010413          	addi	s0,sp,16
    80003358:	00007797          	auipc	a5,0x7
    8000335c:	a7078793          	addi	a5,a5,-1424 # 80009dc8 <_ZTV7WorkerB+0x10>
    80003360:	00f53023          	sd	a5,0(a0)
    80003364:	fffff097          	auipc	ra,0xfffff
    80003368:	910080e7          	jalr	-1776(ra) # 80001c74 <_ZN6ThreadD1Ev>
    8000336c:	00813083          	ld	ra,8(sp)
    80003370:	00013403          	ld	s0,0(sp)
    80003374:	01010113          	addi	sp,sp,16
    80003378:	00008067          	ret

000000008000337c <_ZN7WorkerBD0Ev>:
    8000337c:	fe010113          	addi	sp,sp,-32
    80003380:	00113c23          	sd	ra,24(sp)
    80003384:	00813823          	sd	s0,16(sp)
    80003388:	00913423          	sd	s1,8(sp)
    8000338c:	02010413          	addi	s0,sp,32
    80003390:	00050493          	mv	s1,a0
    80003394:	00007797          	auipc	a5,0x7
    80003398:	a3478793          	addi	a5,a5,-1484 # 80009dc8 <_ZTV7WorkerB+0x10>
    8000339c:	00f53023          	sd	a5,0(a0)
    800033a0:	fffff097          	auipc	ra,0xfffff
    800033a4:	8d4080e7          	jalr	-1836(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800033a8:	00048513          	mv	a0,s1
    800033ac:	ffffe097          	auipc	ra,0xffffe
    800033b0:	5fc080e7          	jalr	1532(ra) # 800019a8 <_ZdlPv>
    800033b4:	01813083          	ld	ra,24(sp)
    800033b8:	01013403          	ld	s0,16(sp)
    800033bc:	00813483          	ld	s1,8(sp)
    800033c0:	02010113          	addi	sp,sp,32
    800033c4:	00008067          	ret

00000000800033c8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800033c8:	ff010113          	addi	sp,sp,-16
    800033cc:	00113423          	sd	ra,8(sp)
    800033d0:	00813023          	sd	s0,0(sp)
    800033d4:	01010413          	addi	s0,sp,16
    800033d8:	00007797          	auipc	a5,0x7
    800033dc:	a1878793          	addi	a5,a5,-1512 # 80009df0 <_ZTV7WorkerC+0x10>
    800033e0:	00f53023          	sd	a5,0(a0)
    800033e4:	fffff097          	auipc	ra,0xfffff
    800033e8:	890080e7          	jalr	-1904(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800033ec:	00813083          	ld	ra,8(sp)
    800033f0:	00013403          	ld	s0,0(sp)
    800033f4:	01010113          	addi	sp,sp,16
    800033f8:	00008067          	ret

00000000800033fc <_ZN7WorkerCD0Ev>:
    800033fc:	fe010113          	addi	sp,sp,-32
    80003400:	00113c23          	sd	ra,24(sp)
    80003404:	00813823          	sd	s0,16(sp)
    80003408:	00913423          	sd	s1,8(sp)
    8000340c:	02010413          	addi	s0,sp,32
    80003410:	00050493          	mv	s1,a0
    80003414:	00007797          	auipc	a5,0x7
    80003418:	9dc78793          	addi	a5,a5,-1572 # 80009df0 <_ZTV7WorkerC+0x10>
    8000341c:	00f53023          	sd	a5,0(a0)
    80003420:	fffff097          	auipc	ra,0xfffff
    80003424:	854080e7          	jalr	-1964(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80003428:	00048513          	mv	a0,s1
    8000342c:	ffffe097          	auipc	ra,0xffffe
    80003430:	57c080e7          	jalr	1404(ra) # 800019a8 <_ZdlPv>
    80003434:	01813083          	ld	ra,24(sp)
    80003438:	01013403          	ld	s0,16(sp)
    8000343c:	00813483          	ld	s1,8(sp)
    80003440:	02010113          	addi	sp,sp,32
    80003444:	00008067          	ret

0000000080003448 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003448:	ff010113          	addi	sp,sp,-16
    8000344c:	00113423          	sd	ra,8(sp)
    80003450:	00813023          	sd	s0,0(sp)
    80003454:	01010413          	addi	s0,sp,16
    80003458:	00007797          	auipc	a5,0x7
    8000345c:	9c078793          	addi	a5,a5,-1600 # 80009e18 <_ZTV7WorkerD+0x10>
    80003460:	00f53023          	sd	a5,0(a0)
    80003464:	fffff097          	auipc	ra,0xfffff
    80003468:	810080e7          	jalr	-2032(ra) # 80001c74 <_ZN6ThreadD1Ev>
    8000346c:	00813083          	ld	ra,8(sp)
    80003470:	00013403          	ld	s0,0(sp)
    80003474:	01010113          	addi	sp,sp,16
    80003478:	00008067          	ret

000000008000347c <_ZN7WorkerDD0Ev>:
    8000347c:	fe010113          	addi	sp,sp,-32
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00913423          	sd	s1,8(sp)
    8000348c:	02010413          	addi	s0,sp,32
    80003490:	00050493          	mv	s1,a0
    80003494:	00007797          	auipc	a5,0x7
    80003498:	98478793          	addi	a5,a5,-1660 # 80009e18 <_ZTV7WorkerD+0x10>
    8000349c:	00f53023          	sd	a5,0(a0)
    800034a0:	ffffe097          	auipc	ra,0xffffe
    800034a4:	7d4080e7          	jalr	2004(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800034a8:	00048513          	mv	a0,s1
    800034ac:	ffffe097          	auipc	ra,0xffffe
    800034b0:	4fc080e7          	jalr	1276(ra) # 800019a8 <_ZdlPv>
    800034b4:	01813083          	ld	ra,24(sp)
    800034b8:	01013403          	ld	s0,16(sp)
    800034bc:	00813483          	ld	s1,8(sp)
    800034c0:	02010113          	addi	sp,sp,32
    800034c4:	00008067          	ret

00000000800034c8 <_ZN7WorkerA3runEv>:
    void run() override {
    800034c8:	ff010113          	addi	sp,sp,-16
    800034cc:	00113423          	sd	ra,8(sp)
    800034d0:	00813023          	sd	s0,0(sp)
    800034d4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800034d8:	00000593          	li	a1,0
    800034dc:	fffff097          	auipc	ra,0xfffff
    800034e0:	774080e7          	jalr	1908(ra) # 80002c50 <_ZN7WorkerA11workerBodyAEPv>
    }
    800034e4:	00813083          	ld	ra,8(sp)
    800034e8:	00013403          	ld	s0,0(sp)
    800034ec:	01010113          	addi	sp,sp,16
    800034f0:	00008067          	ret

00000000800034f4 <_ZN7WorkerB3runEv>:
    void run() override {
    800034f4:	ff010113          	addi	sp,sp,-16
    800034f8:	00113423          	sd	ra,8(sp)
    800034fc:	00813023          	sd	s0,0(sp)
    80003500:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003504:	00000593          	li	a1,0
    80003508:	00000097          	auipc	ra,0x0
    8000350c:	814080e7          	jalr	-2028(ra) # 80002d1c <_ZN7WorkerB11workerBodyBEPv>
    }
    80003510:	00813083          	ld	ra,8(sp)
    80003514:	00013403          	ld	s0,0(sp)
    80003518:	01010113          	addi	sp,sp,16
    8000351c:	00008067          	ret

0000000080003520 <_ZN7WorkerC3runEv>:
    void run() override {
    80003520:	ff010113          	addi	sp,sp,-16
    80003524:	00113423          	sd	ra,8(sp)
    80003528:	00813023          	sd	s0,0(sp)
    8000352c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003530:	00000593          	li	a1,0
    80003534:	00000097          	auipc	ra,0x0
    80003538:	8bc080e7          	jalr	-1860(ra) # 80002df0 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000353c:	00813083          	ld	ra,8(sp)
    80003540:	00013403          	ld	s0,0(sp)
    80003544:	01010113          	addi	sp,sp,16
    80003548:	00008067          	ret

000000008000354c <_ZN7WorkerD3runEv>:
    void run() override {
    8000354c:	ff010113          	addi	sp,sp,-16
    80003550:	00113423          	sd	ra,8(sp)
    80003554:	00813023          	sd	s0,0(sp)
    80003558:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000355c:	00000593          	li	a1,0
    80003560:	00000097          	auipc	ra,0x0
    80003564:	a10080e7          	jalr	-1520(ra) # 80002f70 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003568:	00813083          	ld	ra,8(sp)
    8000356c:	00013403          	ld	s0,0(sp)
    80003570:	01010113          	addi	sp,sp,16
    80003574:	00008067          	ret

0000000080003578 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003578:	ff010113          	addi	sp,sp,-16
    8000357c:	00113423          	sd	ra,8(sp)
    80003580:	00813023          	sd	s0,0(sp)
    80003584:	01010413          	addi	s0,sp,16
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    80003588:	00005517          	auipc	a0,0x5
    8000358c:	ba850513          	addi	a0,a0,-1112 # 80008130 <CONSOLE_STATUS+0x120>
    80003590:	00001097          	auipc	ra,0x1
    80003594:	e28080e7          	jalr	-472(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 15;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    80003598:	00005517          	auipc	a0,0x5
    8000359c:	bb850513          	addi	a0,a0,-1096 # 80008150 <CONSOLE_STATUS+0x140>
    800035a0:	00001097          	auipc	ra,0x1
    800035a4:	e18080e7          	jalr	-488(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca ");
    800035a8:	00005517          	auipc	a0,0x5
    800035ac:	bc850513          	addi	a0,a0,-1080 # 80008170 <CONSOLE_STATUS+0x160>
    800035b0:	00001097          	auipc	ra,0x1
    800035b4:	e08080e7          	jalr	-504(ra) # 800043b8 <_Z11printStringPKc>
    printInt(threadNum);
    800035b8:	00000613          	li	a2,0
    800035bc:	00a00593          	li	a1,10
    800035c0:	00f00513          	li	a0,15
    800035c4:	00001097          	auipc	ra,0x1
    800035c8:	fa4080e7          	jalr	-92(ra) # 80004568 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800035cc:	00005517          	auipc	a0,0x5
    800035d0:	bbc50513          	addi	a0,a0,-1092 # 80008188 <CONSOLE_STATUS+0x178>
    800035d4:	00001097          	auipc	ra,0x1
    800035d8:	de4080e7          	jalr	-540(ra) # 800043b8 <_Z11printStringPKc>
    printInt(n);
    800035dc:	00000613          	li	a2,0
    800035e0:	00a00593          	li	a1,10
    800035e4:	00a00513          	li	a0,10
    800035e8:	00001097          	auipc	ra,0x1
    800035ec:	f80080e7          	jalr	-128(ra) # 80004568 <_Z8printIntiii>
    printString(".\n");
    800035f0:	00005517          	auipc	a0,0x5
    800035f4:	bb050513          	addi	a0,a0,-1104 # 800081a0 <CONSOLE_STATUS+0x190>
    800035f8:	00001097          	auipc	ra,0x1
    800035fc:	dc0080e7          	jalr	-576(ra) # 800043b8 <_Z11printStringPKc>

    if (threadNum > n) {
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003600:	00005517          	auipc	a0,0x5
    80003604:	ca050513          	addi	a0,a0,-864 # 800082a0 <CONSOLE_STATUS+0x290>
    80003608:	00001097          	auipc	ra,0x1
    8000360c:	db0080e7          	jalr	-592(ra) # 800043b8 <_Z11printStringPKc>
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
}
    80003610:	00813083          	ld	ra,8(sp)
    80003614:	00013403          	ld	s0,0(sp)
    80003618:	01010113          	addi	sp,sp,16
    8000361c:	00008067          	ret

0000000080003620 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003620:	fe010113          	addi	sp,sp,-32
    80003624:	00113c23          	sd	ra,24(sp)
    80003628:	00813823          	sd	s0,16(sp)
    8000362c:	00913423          	sd	s1,8(sp)
    80003630:	01213023          	sd	s2,0(sp)
    80003634:	02010413          	addi	s0,sp,32
    80003638:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000363c:	00100793          	li	a5,1
    80003640:	02a7f863          	bgeu	a5,a0,80003670 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003644:	00a00793          	li	a5,10
    80003648:	02f577b3          	remu	a5,a0,a5
    8000364c:	02078e63          	beqz	a5,80003688 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003650:	fff48513          	addi	a0,s1,-1
    80003654:	00000097          	auipc	ra,0x0
    80003658:	fcc080e7          	jalr	-52(ra) # 80003620 <_ZL9fibonaccim>
    8000365c:	00050913          	mv	s2,a0
    80003660:	ffe48513          	addi	a0,s1,-2
    80003664:	00000097          	auipc	ra,0x0
    80003668:	fbc080e7          	jalr	-68(ra) # 80003620 <_ZL9fibonaccim>
    8000366c:	00a90533          	add	a0,s2,a0
}
    80003670:	01813083          	ld	ra,24(sp)
    80003674:	01013403          	ld	s0,16(sp)
    80003678:	00813483          	ld	s1,8(sp)
    8000367c:	00013903          	ld	s2,0(sp)
    80003680:	02010113          	addi	sp,sp,32
    80003684:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	118080e7          	jalr	280(ra) # 800017a0 <_Z15thread_dispatchv>
    80003690:	fc1ff06f          	j	80003650 <_ZL9fibonaccim+0x30>

0000000080003694 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80003694:	fe010113          	addi	sp,sp,-32
    80003698:	00113c23          	sd	ra,24(sp)
    8000369c:	00813823          	sd	s0,16(sp)
    800036a0:	00913423          	sd	s1,8(sp)
    800036a4:	01213023          	sd	s2,0(sp)
    800036a8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800036ac:	00a00493          	li	s1,10
    800036b0:	0400006f          	j	800036f0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800036b4:	00005517          	auipc	a0,0x5
    800036b8:	b5450513          	addi	a0,a0,-1196 # 80008208 <CONSOLE_STATUS+0x1f8>
    800036bc:	00001097          	auipc	ra,0x1
    800036c0:	cfc080e7          	jalr	-772(ra) # 800043b8 <_Z11printStringPKc>
    800036c4:	00000613          	li	a2,0
    800036c8:	00a00593          	li	a1,10
    800036cc:	00048513          	mv	a0,s1
    800036d0:	00001097          	auipc	ra,0x1
    800036d4:	e98080e7          	jalr	-360(ra) # 80004568 <_Z8printIntiii>
    800036d8:	00005517          	auipc	a0,0x5
    800036dc:	a9050513          	addi	a0,a0,-1392 # 80008168 <CONSOLE_STATUS+0x158>
    800036e0:	00001097          	auipc	ra,0x1
    800036e4:	cd8080e7          	jalr	-808(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800036e8:	0014849b          	addiw	s1,s1,1
    800036ec:	0ff4f493          	andi	s1,s1,255
    800036f0:	00c00793          	li	a5,12
    800036f4:	fc97f0e3          	bgeu	a5,s1,800036b4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800036f8:	00005517          	auipc	a0,0x5
    800036fc:	b1850513          	addi	a0,a0,-1256 # 80008210 <CONSOLE_STATUS+0x200>
    80003700:	00001097          	auipc	ra,0x1
    80003704:	cb8080e7          	jalr	-840(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003708:	00500313          	li	t1,5
    thread_dispatch();
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	094080e7          	jalr	148(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003714:	01000513          	li	a0,16
    80003718:	00000097          	auipc	ra,0x0
    8000371c:	f08080e7          	jalr	-248(ra) # 80003620 <_ZL9fibonaccim>
    80003720:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003724:	00005517          	auipc	a0,0x5
    80003728:	afc50513          	addi	a0,a0,-1284 # 80008220 <CONSOLE_STATUS+0x210>
    8000372c:	00001097          	auipc	ra,0x1
    80003730:	c8c080e7          	jalr	-884(ra) # 800043b8 <_Z11printStringPKc>
    80003734:	00000613          	li	a2,0
    80003738:	00a00593          	li	a1,10
    8000373c:	0009051b          	sext.w	a0,s2
    80003740:	00001097          	auipc	ra,0x1
    80003744:	e28080e7          	jalr	-472(ra) # 80004568 <_Z8printIntiii>
    80003748:	00005517          	auipc	a0,0x5
    8000374c:	a2050513          	addi	a0,a0,-1504 # 80008168 <CONSOLE_STATUS+0x158>
    80003750:	00001097          	auipc	ra,0x1
    80003754:	c68080e7          	jalr	-920(ra) # 800043b8 <_Z11printStringPKc>
    80003758:	0400006f          	j	80003798 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000375c:	00005517          	auipc	a0,0x5
    80003760:	aac50513          	addi	a0,a0,-1364 # 80008208 <CONSOLE_STATUS+0x1f8>
    80003764:	00001097          	auipc	ra,0x1
    80003768:	c54080e7          	jalr	-940(ra) # 800043b8 <_Z11printStringPKc>
    8000376c:	00000613          	li	a2,0
    80003770:	00a00593          	li	a1,10
    80003774:	00048513          	mv	a0,s1
    80003778:	00001097          	auipc	ra,0x1
    8000377c:	df0080e7          	jalr	-528(ra) # 80004568 <_Z8printIntiii>
    80003780:	00005517          	auipc	a0,0x5
    80003784:	9e850513          	addi	a0,a0,-1560 # 80008168 <CONSOLE_STATUS+0x158>
    80003788:	00001097          	auipc	ra,0x1
    8000378c:	c30080e7          	jalr	-976(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003790:	0014849b          	addiw	s1,s1,1
    80003794:	0ff4f493          	andi	s1,s1,255
    80003798:	00f00793          	li	a5,15
    8000379c:	fc97f0e3          	bgeu	a5,s1,8000375c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800037a0:	00005517          	auipc	a0,0x5
    800037a4:	a9050513          	addi	a0,a0,-1392 # 80008230 <CONSOLE_STATUS+0x220>
    800037a8:	00001097          	auipc	ra,0x1
    800037ac:	c10080e7          	jalr	-1008(ra) # 800043b8 <_Z11printStringPKc>
    finishedD = true;
    800037b0:	00100793          	li	a5,1
    800037b4:	00007717          	auipc	a4,0x7
    800037b8:	80f70623          	sb	a5,-2036(a4) # 80009fc0 <_ZL9finishedD>
    thread_dispatch();
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	fe4080e7          	jalr	-28(ra) # 800017a0 <_Z15thread_dispatchv>
}
    800037c4:	01813083          	ld	ra,24(sp)
    800037c8:	01013403          	ld	s0,16(sp)
    800037cc:	00813483          	ld	s1,8(sp)
    800037d0:	00013903          	ld	s2,0(sp)
    800037d4:	02010113          	addi	sp,sp,32
    800037d8:	00008067          	ret

00000000800037dc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800037dc:	fe010113          	addi	sp,sp,-32
    800037e0:	00113c23          	sd	ra,24(sp)
    800037e4:	00813823          	sd	s0,16(sp)
    800037e8:	00913423          	sd	s1,8(sp)
    800037ec:	01213023          	sd	s2,0(sp)
    800037f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800037f4:	00000493          	li	s1,0
    800037f8:	0400006f          	j	80003838 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800037fc:	00005517          	auipc	a0,0x5
    80003800:	9dc50513          	addi	a0,a0,-1572 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80003804:	00001097          	auipc	ra,0x1
    80003808:	bb4080e7          	jalr	-1100(ra) # 800043b8 <_Z11printStringPKc>
    8000380c:	00000613          	li	a2,0
    80003810:	00a00593          	li	a1,10
    80003814:	00048513          	mv	a0,s1
    80003818:	00001097          	auipc	ra,0x1
    8000381c:	d50080e7          	jalr	-688(ra) # 80004568 <_Z8printIntiii>
    80003820:	00005517          	auipc	a0,0x5
    80003824:	94850513          	addi	a0,a0,-1720 # 80008168 <CONSOLE_STATUS+0x158>
    80003828:	00001097          	auipc	ra,0x1
    8000382c:	b90080e7          	jalr	-1136(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003830:	0014849b          	addiw	s1,s1,1
    80003834:	0ff4f493          	andi	s1,s1,255
    80003838:	00200793          	li	a5,2
    8000383c:	fc97f0e3          	bgeu	a5,s1,800037fc <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003840:	00005517          	auipc	a0,0x5
    80003844:	9a050513          	addi	a0,a0,-1632 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80003848:	00001097          	auipc	ra,0x1
    8000384c:	b70080e7          	jalr	-1168(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003850:	00700313          	li	t1,7
    thread_dispatch();
    80003854:	ffffe097          	auipc	ra,0xffffe
    80003858:	f4c080e7          	jalr	-180(ra) # 800017a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000385c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003860:	00005517          	auipc	a0,0x5
    80003864:	99050513          	addi	a0,a0,-1648 # 800081f0 <CONSOLE_STATUS+0x1e0>
    80003868:	00001097          	auipc	ra,0x1
    8000386c:	b50080e7          	jalr	-1200(ra) # 800043b8 <_Z11printStringPKc>
    80003870:	00000613          	li	a2,0
    80003874:	00a00593          	li	a1,10
    80003878:	0009051b          	sext.w	a0,s2
    8000387c:	00001097          	auipc	ra,0x1
    80003880:	cec080e7          	jalr	-788(ra) # 80004568 <_Z8printIntiii>
    80003884:	00005517          	auipc	a0,0x5
    80003888:	8e450513          	addi	a0,a0,-1820 # 80008168 <CONSOLE_STATUS+0x158>
    8000388c:	00001097          	auipc	ra,0x1
    80003890:	b2c080e7          	jalr	-1236(ra) # 800043b8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80003894:	00c00513          	li	a0,12
    80003898:	00000097          	auipc	ra,0x0
    8000389c:	d88080e7          	jalr	-632(ra) # 80003620 <_ZL9fibonaccim>
    800038a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800038a4:	00005517          	auipc	a0,0x5
    800038a8:	95450513          	addi	a0,a0,-1708 # 800081f8 <CONSOLE_STATUS+0x1e8>
    800038ac:	00001097          	auipc	ra,0x1
    800038b0:	b0c080e7          	jalr	-1268(ra) # 800043b8 <_Z11printStringPKc>
    800038b4:	00000613          	li	a2,0
    800038b8:	00a00593          	li	a1,10
    800038bc:	0009051b          	sext.w	a0,s2
    800038c0:	00001097          	auipc	ra,0x1
    800038c4:	ca8080e7          	jalr	-856(ra) # 80004568 <_Z8printIntiii>
    800038c8:	00005517          	auipc	a0,0x5
    800038cc:	8a050513          	addi	a0,a0,-1888 # 80008168 <CONSOLE_STATUS+0x158>
    800038d0:	00001097          	auipc	ra,0x1
    800038d4:	ae8080e7          	jalr	-1304(ra) # 800043b8 <_Z11printStringPKc>
    800038d8:	0400006f          	j	80003918 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800038dc:	00005517          	auipc	a0,0x5
    800038e0:	8fc50513          	addi	a0,a0,-1796 # 800081d8 <CONSOLE_STATUS+0x1c8>
    800038e4:	00001097          	auipc	ra,0x1
    800038e8:	ad4080e7          	jalr	-1324(ra) # 800043b8 <_Z11printStringPKc>
    800038ec:	00000613          	li	a2,0
    800038f0:	00a00593          	li	a1,10
    800038f4:	00048513          	mv	a0,s1
    800038f8:	00001097          	auipc	ra,0x1
    800038fc:	c70080e7          	jalr	-912(ra) # 80004568 <_Z8printIntiii>
    80003900:	00005517          	auipc	a0,0x5
    80003904:	86850513          	addi	a0,a0,-1944 # 80008168 <CONSOLE_STATUS+0x158>
    80003908:	00001097          	auipc	ra,0x1
    8000390c:	ab0080e7          	jalr	-1360(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003910:	0014849b          	addiw	s1,s1,1
    80003914:	0ff4f493          	andi	s1,s1,255
    80003918:	00500793          	li	a5,5
    8000391c:	fc97f0e3          	bgeu	a5,s1,800038dc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003920:	00005517          	auipc	a0,0x5
    80003924:	89050513          	addi	a0,a0,-1904 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80003928:	00001097          	auipc	ra,0x1
    8000392c:	a90080e7          	jalr	-1392(ra) # 800043b8 <_Z11printStringPKc>
    finishedC = true;
    80003930:	00100793          	li	a5,1
    80003934:	00006717          	auipc	a4,0x6
    80003938:	68f706a3          	sb	a5,1677(a4) # 80009fc1 <_ZL9finishedC>
    thread_dispatch();
    8000393c:	ffffe097          	auipc	ra,0xffffe
    80003940:	e64080e7          	jalr	-412(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003944:	01813083          	ld	ra,24(sp)
    80003948:	01013403          	ld	s0,16(sp)
    8000394c:	00813483          	ld	s1,8(sp)
    80003950:	00013903          	ld	s2,0(sp)
    80003954:	02010113          	addi	sp,sp,32
    80003958:	00008067          	ret

000000008000395c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000395c:	fe010113          	addi	sp,sp,-32
    80003960:	00113c23          	sd	ra,24(sp)
    80003964:	00813823          	sd	s0,16(sp)
    80003968:	00913423          	sd	s1,8(sp)
    8000396c:	01213023          	sd	s2,0(sp)
    80003970:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003974:	00000913          	li	s2,0
    80003978:	0380006f          	j	800039b0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    8000397c:	ffffe097          	auipc	ra,0xffffe
    80003980:	e24080e7          	jalr	-476(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003984:	00148493          	addi	s1,s1,1
    80003988:	000027b7          	lui	a5,0x2
    8000398c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003990:	0097ee63          	bltu	a5,s1,800039ac <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003994:	00000713          	li	a4,0
    80003998:	000077b7          	lui	a5,0x7
    8000399c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800039a0:	fce7eee3          	bltu	a5,a4,8000397c <_ZL11workerBodyBPv+0x20>
    800039a4:	00170713          	addi	a4,a4,1
    800039a8:	ff1ff06f          	j	80003998 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800039ac:	00190913          	addi	s2,s2,1
    800039b0:	00f00793          	li	a5,15
    800039b4:	0527e063          	bltu	a5,s2,800039f4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800039b8:	00005517          	auipc	a0,0x5
    800039bc:	80850513          	addi	a0,a0,-2040 # 800081c0 <CONSOLE_STATUS+0x1b0>
    800039c0:	00001097          	auipc	ra,0x1
    800039c4:	9f8080e7          	jalr	-1544(ra) # 800043b8 <_Z11printStringPKc>
    800039c8:	00000613          	li	a2,0
    800039cc:	00a00593          	li	a1,10
    800039d0:	0009051b          	sext.w	a0,s2
    800039d4:	00001097          	auipc	ra,0x1
    800039d8:	b94080e7          	jalr	-1132(ra) # 80004568 <_Z8printIntiii>
    800039dc:	00004517          	auipc	a0,0x4
    800039e0:	78c50513          	addi	a0,a0,1932 # 80008168 <CONSOLE_STATUS+0x158>
    800039e4:	00001097          	auipc	ra,0x1
    800039e8:	9d4080e7          	jalr	-1580(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800039ec:	00000493          	li	s1,0
    800039f0:	f99ff06f          	j	80003988 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800039f4:	00004517          	auipc	a0,0x4
    800039f8:	7d450513          	addi	a0,a0,2004 # 800081c8 <CONSOLE_STATUS+0x1b8>
    800039fc:	00001097          	auipc	ra,0x1
    80003a00:	9bc080e7          	jalr	-1604(ra) # 800043b8 <_Z11printStringPKc>
    finishedB = true;
    80003a04:	00100793          	li	a5,1
    80003a08:	00006717          	auipc	a4,0x6
    80003a0c:	5af70d23          	sb	a5,1466(a4) # 80009fc2 <_ZL9finishedB>
    thread_dispatch();
    80003a10:	ffffe097          	auipc	ra,0xffffe
    80003a14:	d90080e7          	jalr	-624(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80003a18:	01813083          	ld	ra,24(sp)
    80003a1c:	01013403          	ld	s0,16(sp)
    80003a20:	00813483          	ld	s1,8(sp)
    80003a24:	00013903          	ld	s2,0(sp)
    80003a28:	02010113          	addi	sp,sp,32
    80003a2c:	00008067          	ret

0000000080003a30 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00113c23          	sd	ra,24(sp)
    80003a38:	00813823          	sd	s0,16(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	01213023          	sd	s2,0(sp)
    80003a44:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003a48:	00000913          	li	s2,0
    80003a4c:	0380006f          	j	80003a84 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003a50:	ffffe097          	auipc	ra,0xffffe
    80003a54:	d50080e7          	jalr	-688(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003a58:	00148493          	addi	s1,s1,1
    80003a5c:	000027b7          	lui	a5,0x2
    80003a60:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003a64:	0097ee63          	bltu	a5,s1,80003a80 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003a68:	00000713          	li	a4,0
    80003a6c:	000077b7          	lui	a5,0x7
    80003a70:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003a74:	fce7eee3          	bltu	a5,a4,80003a50 <_ZL11workerBodyAPv+0x20>
    80003a78:	00170713          	addi	a4,a4,1
    80003a7c:	ff1ff06f          	j	80003a6c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003a80:	00190913          	addi	s2,s2,1
    80003a84:	00900793          	li	a5,9
    80003a88:	0527e063          	bltu	a5,s2,80003ac8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003a8c:	00004517          	auipc	a0,0x4
    80003a90:	71c50513          	addi	a0,a0,1820 # 800081a8 <CONSOLE_STATUS+0x198>
    80003a94:	00001097          	auipc	ra,0x1
    80003a98:	924080e7          	jalr	-1756(ra) # 800043b8 <_Z11printStringPKc>
    80003a9c:	00000613          	li	a2,0
    80003aa0:	00a00593          	li	a1,10
    80003aa4:	0009051b          	sext.w	a0,s2
    80003aa8:	00001097          	auipc	ra,0x1
    80003aac:	ac0080e7          	jalr	-1344(ra) # 80004568 <_Z8printIntiii>
    80003ab0:	00004517          	auipc	a0,0x4
    80003ab4:	6b850513          	addi	a0,a0,1720 # 80008168 <CONSOLE_STATUS+0x158>
    80003ab8:	00001097          	auipc	ra,0x1
    80003abc:	900080e7          	jalr	-1792(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003ac0:	00000493          	li	s1,0
    80003ac4:	f99ff06f          	j	80003a5c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80003ac8:	00004517          	auipc	a0,0x4
    80003acc:	6e850513          	addi	a0,a0,1768 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80003ad0:	00001097          	auipc	ra,0x1
    80003ad4:	8e8080e7          	jalr	-1816(ra) # 800043b8 <_Z11printStringPKc>
    finishedA = true;
    80003ad8:	00100793          	li	a5,1
    80003adc:	00006717          	auipc	a4,0x6
    80003ae0:	4ef703a3          	sb	a5,1255(a4) # 80009fc3 <_ZL9finishedA>
}
    80003ae4:	01813083          	ld	ra,24(sp)
    80003ae8:	01013403          	ld	s0,16(sp)
    80003aec:	00813483          	ld	s1,8(sp)
    80003af0:	00013903          	ld	s2,0(sp)
    80003af4:	02010113          	addi	sp,sp,32
    80003af8:	00008067          	ret

0000000080003afc <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003afc:	fd010113          	addi	sp,sp,-48
    80003b00:	02113423          	sd	ra,40(sp)
    80003b04:	02813023          	sd	s0,32(sp)
    80003b08:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003b0c:	00000613          	li	a2,0
    80003b10:	00000597          	auipc	a1,0x0
    80003b14:	f2058593          	addi	a1,a1,-224 # 80003a30 <_ZL11workerBodyAPv>
    80003b18:	fd040513          	addi	a0,s0,-48
    80003b1c:	ffffe097          	auipc	ra,0xffffe
    80003b20:	b64080e7          	jalr	-1180(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003b24:	00004517          	auipc	a0,0x4
    80003b28:	71c50513          	addi	a0,a0,1820 # 80008240 <CONSOLE_STATUS+0x230>
    80003b2c:	00001097          	auipc	ra,0x1
    80003b30:	88c080e7          	jalr	-1908(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003b34:	00000613          	li	a2,0
    80003b38:	00000597          	auipc	a1,0x0
    80003b3c:	e2458593          	addi	a1,a1,-476 # 8000395c <_ZL11workerBodyBPv>
    80003b40:	fd840513          	addi	a0,s0,-40
    80003b44:	ffffe097          	auipc	ra,0xffffe
    80003b48:	b3c080e7          	jalr	-1220(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003b4c:	00004517          	auipc	a0,0x4
    80003b50:	70c50513          	addi	a0,a0,1804 # 80008258 <CONSOLE_STATUS+0x248>
    80003b54:	00001097          	auipc	ra,0x1
    80003b58:	864080e7          	jalr	-1948(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003b5c:	00000613          	li	a2,0
    80003b60:	00000597          	auipc	a1,0x0
    80003b64:	c7c58593          	addi	a1,a1,-900 # 800037dc <_ZL11workerBodyCPv>
    80003b68:	fe040513          	addi	a0,s0,-32
    80003b6c:	ffffe097          	auipc	ra,0xffffe
    80003b70:	b14080e7          	jalr	-1260(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003b74:	00004517          	auipc	a0,0x4
    80003b78:	6fc50513          	addi	a0,a0,1788 # 80008270 <CONSOLE_STATUS+0x260>
    80003b7c:	00001097          	auipc	ra,0x1
    80003b80:	83c080e7          	jalr	-1988(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80003b84:	00000613          	li	a2,0
    80003b88:	00000597          	auipc	a1,0x0
    80003b8c:	b0c58593          	addi	a1,a1,-1268 # 80003694 <_ZL11workerBodyDPv>
    80003b90:	fe840513          	addi	a0,s0,-24
    80003b94:	ffffe097          	auipc	ra,0xffffe
    80003b98:	aec080e7          	jalr	-1300(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80003b9c:	00004517          	auipc	a0,0x4
    80003ba0:	6ec50513          	addi	a0,a0,1772 # 80008288 <CONSOLE_STATUS+0x278>
    80003ba4:	00001097          	auipc	ra,0x1
    80003ba8:	814080e7          	jalr	-2028(ra) # 800043b8 <_Z11printStringPKc>
    80003bac:	00c0006f          	j	80003bb8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80003bb0:	ffffe097          	auipc	ra,0xffffe
    80003bb4:	bf0080e7          	jalr	-1040(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003bb8:	00006797          	auipc	a5,0x6
    80003bbc:	40b7c783          	lbu	a5,1035(a5) # 80009fc3 <_ZL9finishedA>
    80003bc0:	fe0788e3          	beqz	a5,80003bb0 <_Z18Threads_C_API_testv+0xb4>
    80003bc4:	00006797          	auipc	a5,0x6
    80003bc8:	3fe7c783          	lbu	a5,1022(a5) # 80009fc2 <_ZL9finishedB>
    80003bcc:	fe0782e3          	beqz	a5,80003bb0 <_Z18Threads_C_API_testv+0xb4>
    80003bd0:	00006797          	auipc	a5,0x6
    80003bd4:	3f17c783          	lbu	a5,1009(a5) # 80009fc1 <_ZL9finishedC>
    80003bd8:	fc078ce3          	beqz	a5,80003bb0 <_Z18Threads_C_API_testv+0xb4>
    80003bdc:	00006797          	auipc	a5,0x6
    80003be0:	3e47c783          	lbu	a5,996(a5) # 80009fc0 <_ZL9finishedD>
    80003be4:	fc0786e3          	beqz	a5,80003bb0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80003be8:	02813083          	ld	ra,40(sp)
    80003bec:	02013403          	ld	s0,32(sp)
    80003bf0:	03010113          	addi	sp,sp,48
    80003bf4:	00008067          	ret

0000000080003bf8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80003bf8:	fd010113          	addi	sp,sp,-48
    80003bfc:	02113423          	sd	ra,40(sp)
    80003c00:	02813023          	sd	s0,32(sp)
    80003c04:	00913c23          	sd	s1,24(sp)
    80003c08:	01213823          	sd	s2,16(sp)
    80003c0c:	01313423          	sd	s3,8(sp)
    80003c10:	03010413          	addi	s0,sp,48
    80003c14:	00050993          	mv	s3,a0
    80003c18:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003c1c:	00000913          	li	s2,0
    80003c20:	00c0006f          	j	80003c2c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003c24:	ffffe097          	auipc	ra,0xffffe
    80003c28:	1c8080e7          	jalr	456(ra) # 80001dec <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80003c2c:	ffffe097          	auipc	ra,0xffffe
    80003c30:	c98080e7          	jalr	-872(ra) # 800018c4 <_Z4getcv>
    80003c34:	0005059b          	sext.w	a1,a0
    80003c38:	01b00793          	li	a5,27
    80003c3c:	02f58a63          	beq	a1,a5,80003c70 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003c40:	0084b503          	ld	a0,8(s1)
    80003c44:	00001097          	auipc	ra,0x1
    80003c48:	b98080e7          	jalr	-1128(ra) # 800047dc <_ZN9BufferCPP3putEi>
        i++;
    80003c4c:	0019071b          	addiw	a4,s2,1
    80003c50:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003c54:	0004a683          	lw	a3,0(s1)
    80003c58:	0026979b          	slliw	a5,a3,0x2
    80003c5c:	00d787bb          	addw	a5,a5,a3
    80003c60:	0017979b          	slliw	a5,a5,0x1
    80003c64:	02f767bb          	remw	a5,a4,a5
    80003c68:	fc0792e3          	bnez	a5,80003c2c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80003c6c:	fb9ff06f          	j	80003c24 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003c70:	00100793          	li	a5,1
    80003c74:	00006717          	auipc	a4,0x6
    80003c78:	34f72a23          	sw	a5,852(a4) # 80009fc8 <_ZL9threadEnd>
    td->buffer->put('!');
    80003c7c:	0209b783          	ld	a5,32(s3)
    80003c80:	02100593          	li	a1,33
    80003c84:	0087b503          	ld	a0,8(a5)
    80003c88:	00001097          	auipc	ra,0x1
    80003c8c:	b54080e7          	jalr	-1196(ra) # 800047dc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80003c90:	0104b503          	ld	a0,16(s1)
    80003c94:	ffffe097          	auipc	ra,0xffffe
    80003c98:	244080e7          	jalr	580(ra) # 80001ed8 <_ZN9Semaphore6signalEv>
}
    80003c9c:	02813083          	ld	ra,40(sp)
    80003ca0:	02013403          	ld	s0,32(sp)
    80003ca4:	01813483          	ld	s1,24(sp)
    80003ca8:	01013903          	ld	s2,16(sp)
    80003cac:	00813983          	ld	s3,8(sp)
    80003cb0:	03010113          	addi	sp,sp,48
    80003cb4:	00008067          	ret

0000000080003cb8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80003cb8:	fe010113          	addi	sp,sp,-32
    80003cbc:	00113c23          	sd	ra,24(sp)
    80003cc0:	00813823          	sd	s0,16(sp)
    80003cc4:	00913423          	sd	s1,8(sp)
    80003cc8:	01213023          	sd	s2,0(sp)
    80003ccc:	02010413          	addi	s0,sp,32
    80003cd0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003cd4:	00000913          	li	s2,0
    80003cd8:	00c0006f          	j	80003ce4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003cdc:	ffffe097          	auipc	ra,0xffffe
    80003ce0:	110080e7          	jalr	272(ra) # 80001dec <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80003ce4:	00006797          	auipc	a5,0x6
    80003ce8:	2e47a783          	lw	a5,740(a5) # 80009fc8 <_ZL9threadEnd>
    80003cec:	02079e63          	bnez	a5,80003d28 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80003cf0:	0004a583          	lw	a1,0(s1)
    80003cf4:	0305859b          	addiw	a1,a1,48
    80003cf8:	0084b503          	ld	a0,8(s1)
    80003cfc:	00001097          	auipc	ra,0x1
    80003d00:	ae0080e7          	jalr	-1312(ra) # 800047dc <_ZN9BufferCPP3putEi>
        i++;
    80003d04:	0019071b          	addiw	a4,s2,1
    80003d08:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d0c:	0004a683          	lw	a3,0(s1)
    80003d10:	0026979b          	slliw	a5,a3,0x2
    80003d14:	00d787bb          	addw	a5,a5,a3
    80003d18:	0017979b          	slliw	a5,a5,0x1
    80003d1c:	02f767bb          	remw	a5,a4,a5
    80003d20:	fc0792e3          	bnez	a5,80003ce4 <_ZN12ProducerSync8producerEPv+0x2c>
    80003d24:	fb9ff06f          	j	80003cdc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003d28:	0104b503          	ld	a0,16(s1)
    80003d2c:	ffffe097          	auipc	ra,0xffffe
    80003d30:	1ac080e7          	jalr	428(ra) # 80001ed8 <_ZN9Semaphore6signalEv>
}
    80003d34:	01813083          	ld	ra,24(sp)
    80003d38:	01013403          	ld	s0,16(sp)
    80003d3c:	00813483          	ld	s1,8(sp)
    80003d40:	00013903          	ld	s2,0(sp)
    80003d44:	02010113          	addi	sp,sp,32
    80003d48:	00008067          	ret

0000000080003d4c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80003d4c:	fd010113          	addi	sp,sp,-48
    80003d50:	02113423          	sd	ra,40(sp)
    80003d54:	02813023          	sd	s0,32(sp)
    80003d58:	00913c23          	sd	s1,24(sp)
    80003d5c:	01213823          	sd	s2,16(sp)
    80003d60:	01313423          	sd	s3,8(sp)
    80003d64:	01413023          	sd	s4,0(sp)
    80003d68:	03010413          	addi	s0,sp,48
    80003d6c:	00050993          	mv	s3,a0
    80003d70:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003d74:	00000a13          	li	s4,0
    80003d78:	01c0006f          	j	80003d94 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80003d7c:	ffffe097          	auipc	ra,0xffffe
    80003d80:	070080e7          	jalr	112(ra) # 80001dec <_ZN6Thread8dispatchEv>
    80003d84:	0500006f          	j	80003dd4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003d88:	00a00513          	li	a0,10
    80003d8c:	ffffe097          	auipc	ra,0xffffe
    80003d90:	b60080e7          	jalr	-1184(ra) # 800018ec <_Z4putcc>
    while (!threadEnd) {
    80003d94:	00006797          	auipc	a5,0x6
    80003d98:	2347a783          	lw	a5,564(a5) # 80009fc8 <_ZL9threadEnd>
    80003d9c:	06079263          	bnez	a5,80003e00 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003da0:	00893503          	ld	a0,8(s2)
    80003da4:	00001097          	auipc	ra,0x1
    80003da8:	ac8080e7          	jalr	-1336(ra) # 8000486c <_ZN9BufferCPP3getEv>
        i++;
    80003dac:	001a049b          	addiw	s1,s4,1
    80003db0:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003db4:	0ff57513          	andi	a0,a0,255
    80003db8:	ffffe097          	auipc	ra,0xffffe
    80003dbc:	b34080e7          	jalr	-1228(ra) # 800018ec <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003dc0:	00092703          	lw	a4,0(s2)
    80003dc4:	0027179b          	slliw	a5,a4,0x2
    80003dc8:	00e787bb          	addw	a5,a5,a4
    80003dcc:	02f4e7bb          	remw	a5,s1,a5
    80003dd0:	fa0786e3          	beqz	a5,80003d7c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003dd4:	05000793          	li	a5,80
    80003dd8:	02f4e4bb          	remw	s1,s1,a5
    80003ddc:	fa049ce3          	bnez	s1,80003d94 <_ZN12ConsumerSync8consumerEPv+0x48>
    80003de0:	fa9ff06f          	j	80003d88 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003de4:	0209b783          	ld	a5,32(s3)
    80003de8:	0087b503          	ld	a0,8(a5)
    80003dec:	00001097          	auipc	ra,0x1
    80003df0:	a80080e7          	jalr	-1408(ra) # 8000486c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80003df4:	0ff57513          	andi	a0,a0,255
    80003df8:	ffffe097          	auipc	ra,0xffffe
    80003dfc:	160080e7          	jalr	352(ra) # 80001f58 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80003e00:	0209b783          	ld	a5,32(s3)
    80003e04:	0087b503          	ld	a0,8(a5)
    80003e08:	00001097          	auipc	ra,0x1
    80003e0c:	af0080e7          	jalr	-1296(ra) # 800048f8 <_ZN9BufferCPP6getCntEv>
    80003e10:	fca04ae3          	bgtz	a0,80003de4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80003e14:	01093503          	ld	a0,16(s2)
    80003e18:	ffffe097          	auipc	ra,0xffffe
    80003e1c:	0c0080e7          	jalr	192(ra) # 80001ed8 <_ZN9Semaphore6signalEv>
}
    80003e20:	02813083          	ld	ra,40(sp)
    80003e24:	02013403          	ld	s0,32(sp)
    80003e28:	01813483          	ld	s1,24(sp)
    80003e2c:	01013903          	ld	s2,16(sp)
    80003e30:	00813983          	ld	s3,8(sp)
    80003e34:	00013a03          	ld	s4,0(sp)
    80003e38:	03010113          	addi	sp,sp,48
    80003e3c:	00008067          	ret

0000000080003e40 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003e40:	f0010113          	addi	sp,sp,-256
    80003e44:	0e113c23          	sd	ra,248(sp)
    80003e48:	0e813823          	sd	s0,240(sp)
    80003e4c:	0e913423          	sd	s1,232(sp)
    80003e50:	0f213023          	sd	s2,224(sp)
    80003e54:	0d313c23          	sd	s3,216(sp)
    80003e58:	0d413823          	sd	s4,208(sp)
    80003e5c:	0d513423          	sd	s5,200(sp)
    80003e60:	10010413          	addi	s0,sp,256
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    80003e64:	00004517          	auipc	a0,0x4
    80003e68:	2cc50513          	addi	a0,a0,716 # 80008130 <CONSOLE_STATUS+0x120>
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	54c080e7          	jalr	1356(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 5;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    80003e74:	00004517          	auipc	a0,0x4
    80003e78:	2dc50513          	addi	a0,a0,732 # 80008150 <CONSOLE_STATUS+0x140>
    80003e7c:	00000097          	auipc	ra,0x0
    80003e80:	53c080e7          	jalr	1340(ra) # 800043b8 <_Z11printStringPKc>
    //getString(input, 30);
    n = 10;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    80003e84:	00004517          	auipc	a0,0x4
    80003e88:	2ec50513          	addi	a0,a0,748 # 80008170 <CONSOLE_STATUS+0x160>
    80003e8c:	00000097          	auipc	ra,0x0
    80003e90:	52c080e7          	jalr	1324(ra) # 800043b8 <_Z11printStringPKc>
    80003e94:	00000613          	li	a2,0
    80003e98:	00a00593          	li	a1,10
    80003e9c:	00500513          	li	a0,5
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	6c8080e7          	jalr	1736(ra) # 80004568 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003ea8:	00004517          	auipc	a0,0x4
    80003eac:	2e050513          	addi	a0,a0,736 # 80008188 <CONSOLE_STATUS+0x178>
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	508080e7          	jalr	1288(ra) # 800043b8 <_Z11printStringPKc>
    80003eb8:	00000613          	li	a2,0
    80003ebc:	00a00593          	li	a1,10
    80003ec0:	00a00513          	li	a0,10
    80003ec4:	00000097          	auipc	ra,0x0
    80003ec8:	6a4080e7          	jalr	1700(ra) # 80004568 <_Z8printIntiii>
    printString(".\n");
    80003ecc:	00004517          	auipc	a0,0x4
    80003ed0:	2d450513          	addi	a0,a0,724 # 800081a0 <CONSOLE_STATUS+0x190>
    80003ed4:	00000097          	auipc	ra,0x0
    80003ed8:	4e4080e7          	jalr	1252(ra) # 800043b8 <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    BufferCPP *buffer = new BufferCPP(n);
    80003edc:	03800513          	li	a0,56
    80003ee0:	ffffe097          	auipc	ra,0xffffe
    80003ee4:	a78080e7          	jalr	-1416(ra) # 80001958 <_Znwm>
    80003ee8:	00050993          	mv	s3,a0
    80003eec:	00a00593          	li	a1,10
    80003ef0:	00000097          	auipc	ra,0x0
    80003ef4:	798080e7          	jalr	1944(ra) # 80004688 <_ZN9BufferCPPC1Ei>

    waitForAll = new Semaphore(0);
    80003ef8:	01000513          	li	a0,16
    80003efc:	ffffe097          	auipc	ra,0xffffe
    80003f00:	a5c080e7          	jalr	-1444(ra) # 80001958 <_Znwm>
    80003f04:	00050493          	mv	s1,a0
    80003f08:	00000593          	li	a1,0
    80003f0c:	ffffe097          	auipc	ra,0xffffe
    80003f10:	f68080e7          	jalr	-152(ra) # 80001e74 <_ZN9SemaphoreC1Ej>
    80003f14:	00006797          	auipc	a5,0x6
    80003f18:	0a97be23          	sd	s1,188(a5) # 80009fd0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    Thread* consumerThread;

    struct thread_data data[threadNum + 1];

    data[threadNum].id = threadNum;
    80003f1c:	00500793          	li	a5,5
    80003f20:	faf42423          	sw	a5,-88(s0)
    data[threadNum].buffer = buffer;
    80003f24:	fb343823          	sd	s3,-80(s0)
    data[threadNum].wait = waitForAll;
    80003f28:	fa943c23          	sd	s1,-72(s0)
    consumerThread = new ConsumerSync(data+threadNum);
    80003f2c:	02800513          	li	a0,40
    80003f30:	ffffe097          	auipc	ra,0xffffe
    80003f34:	a28080e7          	jalr	-1496(ra) # 80001958 <_Znwm>
    80003f38:	00050a13          	mv	s4,a0
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80003f3c:	ffffe097          	auipc	ra,0xffffe
    80003f40:	ef4080e7          	jalr	-268(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80003f44:	00006797          	auipc	a5,0x6
    80003f48:	f4c78793          	addi	a5,a5,-180 # 80009e90 <_ZTV12ConsumerSync+0x10>
    80003f4c:	00fa3023          	sd	a5,0(s4)
    80003f50:	fa840793          	addi	a5,s0,-88
    80003f54:	02fa3023          	sd	a5,32(s4)
    consumerThread->start();
    80003f58:	000a0513          	mv	a0,s4
    80003f5c:	ffffe097          	auipc	ra,0xffffe
    80003f60:	e60080e7          	jalr	-416(ra) # 80001dbc <_ZN6Thread5startEv>

    for (int i = 0; i < threadNum; i++) {
    80003f64:	00000493          	li	s1,0
    80003f68:	0400006f          	j	80003fa8 <_Z29producerConsumer_CPP_Sync_APIv+0x168>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80003f6c:	00006797          	auipc	a5,0x6
    80003f70:	efc78793          	addi	a5,a5,-260 # 80009e68 <_ZTV12ProducerSync+0x10>
    80003f74:	00f93023          	sd	a5,0(s2)
    80003f78:	03593023          	sd	s5,32(s2)
        data[i].id = i;
        data[i].buffer = buffer;
        data[i].wait = waitForAll;

        if(i>0) {
            threads[i] = new ProducerSync(data+i);
    80003f7c:	00349793          	slli	a5,s1,0x3
    80003f80:	fc040713          	addi	a4,s0,-64
    80003f84:	00f707b3          	add	a5,a4,a5
    80003f88:	f527b423          	sd	s2,-184(a5)
        } else {
            threads[i] = new ProducerKeyboard(data+i);
        }

        threads[i]->start();
    80003f8c:	00349793          	slli	a5,s1,0x3
    80003f90:	fc040713          	addi	a4,s0,-64
    80003f94:	00f707b3          	add	a5,a4,a5
    80003f98:	f487b503          	ld	a0,-184(a5)
    80003f9c:	ffffe097          	auipc	ra,0xffffe
    80003fa0:	e20080e7          	jalr	-480(ra) # 80001dbc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003fa4:	0014849b          	addiw	s1,s1,1
    80003fa8:	00400793          	li	a5,4
    80003fac:	0a97c663          	blt	a5,s1,80004058 <_Z29producerConsumer_CPP_Sync_APIv+0x218>
        data[i].id = i;
    80003fb0:	00149793          	slli	a5,s1,0x1
    80003fb4:	009787b3          	add	a5,a5,s1
    80003fb8:	00379793          	slli	a5,a5,0x3
    80003fbc:	fc040713          	addi	a4,s0,-64
    80003fc0:	00f707b3          	add	a5,a4,a5
    80003fc4:	f697a823          	sw	s1,-144(a5)
        data[i].buffer = buffer;
    80003fc8:	f737bc23          	sd	s3,-136(a5)
        data[i].wait = waitForAll;
    80003fcc:	00006717          	auipc	a4,0x6
    80003fd0:	00473703          	ld	a4,4(a4) # 80009fd0 <_ZL10waitForAll>
    80003fd4:	f8e7b023          	sd	a4,-128(a5)
        if(i>0) {
    80003fd8:	02905a63          	blez	s1,8000400c <_Z29producerConsumer_CPP_Sync_APIv+0x1cc>
            threads[i] = new ProducerSync(data+i);
    80003fdc:	02800513          	li	a0,40
    80003fe0:	ffffe097          	auipc	ra,0xffffe
    80003fe4:	978080e7          	jalr	-1672(ra) # 80001958 <_Znwm>
    80003fe8:	00050913          	mv	s2,a0
    80003fec:	00149793          	slli	a5,s1,0x1
    80003ff0:	009787b3          	add	a5,a5,s1
    80003ff4:	00379793          	slli	a5,a5,0x3
    80003ff8:	f3040a93          	addi	s5,s0,-208
    80003ffc:	00fa8ab3          	add	s5,s5,a5
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	e30080e7          	jalr	-464(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80004008:	f65ff06f          	j	80003f6c <_Z29producerConsumer_CPP_Sync_APIv+0x12c>
            threads[i] = new ProducerKeyboard(data+i);
    8000400c:	02800513          	li	a0,40
    80004010:	ffffe097          	auipc	ra,0xffffe
    80004014:	948080e7          	jalr	-1720(ra) # 80001958 <_Znwm>
    80004018:	00050913          	mv	s2,a0
    8000401c:	01800793          	li	a5,24
    80004020:	02f487b3          	mul	a5,s1,a5
    80004024:	f3040a93          	addi	s5,s0,-208
    80004028:	00fa8ab3          	add	s5,s5,a5
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000402c:	ffffe097          	auipc	ra,0xffffe
    80004030:	e04080e7          	jalr	-508(ra) # 80001e30 <_ZN6ThreadC1Ev>
    80004034:	00006797          	auipc	a5,0x6
    80004038:	e0c78793          	addi	a5,a5,-500 # 80009e40 <_ZTV16ProducerKeyboard+0x10>
    8000403c:	00f93023          	sd	a5,0(s2)
    80004040:	03593023          	sd	s5,32(s2)
            threads[i] = new ProducerKeyboard(data+i);
    80004044:	00349793          	slli	a5,s1,0x3
    80004048:	fc040713          	addi	a4,s0,-64
    8000404c:	00f707b3          	add	a5,a4,a5
    80004050:	f527b423          	sd	s2,-184(a5)
    80004054:	f39ff06f          	j	80003f8c <_Z29producerConsumer_CPP_Sync_APIv+0x14c>
    }

    Thread::dispatch();
    80004058:	ffffe097          	auipc	ra,0xffffe
    8000405c:	d94080e7          	jalr	-620(ra) # 80001dec <_ZN6Thread8dispatchEv>

    for (int i = 0; i <= threadNum; i++) {
    80004060:	00000493          	li	s1,0
    80004064:	00500793          	li	a5,5
    80004068:	0097ce63          	blt	a5,s1,80004084 <_Z29producerConsumer_CPP_Sync_APIv+0x244>
        waitForAll->wait();
    8000406c:	00006517          	auipc	a0,0x6
    80004070:	f6453503          	ld	a0,-156(a0) # 80009fd0 <_ZL10waitForAll>
    80004074:	ffffe097          	auipc	ra,0xffffe
    80004078:	e38080e7          	jalr	-456(ra) # 80001eac <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000407c:	0014849b          	addiw	s1,s1,1
    80004080:	fe5ff06f          	j	80004064 <_Z29producerConsumer_CPP_Sync_APIv+0x224>
    }

    for (int i = 0; i < threadNum; i++) {
    80004084:	00000493          	li	s1,0
    80004088:	0080006f          	j	80004090 <_Z29producerConsumer_CPP_Sync_APIv+0x250>
    8000408c:	0014849b          	addiw	s1,s1,1
    80004090:	00400793          	li	a5,4
    80004094:	0297c463          	blt	a5,s1,800040bc <_Z29producerConsumer_CPP_Sync_APIv+0x27c>
        delete threads[i];
    80004098:	00349793          	slli	a5,s1,0x3
    8000409c:	fc040713          	addi	a4,s0,-64
    800040a0:	00f707b3          	add	a5,a4,a5
    800040a4:	f487b503          	ld	a0,-184(a5)
    800040a8:	fe0502e3          	beqz	a0,8000408c <_Z29producerConsumer_CPP_Sync_APIv+0x24c>
    800040ac:	00053783          	ld	a5,0(a0)
    800040b0:	0087b783          	ld	a5,8(a5)
    800040b4:	000780e7          	jalr	a5
    800040b8:	fd5ff06f          	j	8000408c <_Z29producerConsumer_CPP_Sync_APIv+0x24c>
    }
    delete consumerThread;
    800040bc:	000a0a63          	beqz	s4,800040d0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
    800040c0:	000a3783          	ld	a5,0(s4)
    800040c4:	0087b783          	ld	a5,8(a5)
    800040c8:	000a0513          	mv	a0,s4
    800040cc:	000780e7          	jalr	a5
    delete waitForAll;
    800040d0:	00006517          	auipc	a0,0x6
    800040d4:	f0053503          	ld	a0,-256(a0) # 80009fd0 <_ZL10waitForAll>
    800040d8:	00050863          	beqz	a0,800040e8 <_Z29producerConsumer_CPP_Sync_APIv+0x2a8>
    800040dc:	00053783          	ld	a5,0(a0)
    800040e0:	0087b783          	ld	a5,8(a5)
    800040e4:	000780e7          	jalr	a5
    delete buffer;
    800040e8:	00098e63          	beqz	s3,80004104 <_Z29producerConsumer_CPP_Sync_APIv+0x2c4>
    800040ec:	00098513          	mv	a0,s3
    800040f0:	00001097          	auipc	ra,0x1
    800040f4:	890080e7          	jalr	-1904(ra) # 80004980 <_ZN9BufferCPPD1Ev>
    800040f8:	00098513          	mv	a0,s3
    800040fc:	ffffe097          	auipc	ra,0xffffe
    80004100:	8ac080e7          	jalr	-1876(ra) # 800019a8 <_ZdlPv>

}
    80004104:	0f813083          	ld	ra,248(sp)
    80004108:	0f013403          	ld	s0,240(sp)
    8000410c:	0e813483          	ld	s1,232(sp)
    80004110:	0e013903          	ld	s2,224(sp)
    80004114:	0d813983          	ld	s3,216(sp)
    80004118:	0d013a03          	ld	s4,208(sp)
    8000411c:	0c813a83          	ld	s5,200(sp)
    80004120:	10010113          	addi	sp,sp,256
    80004124:	00008067          	ret
    80004128:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000412c:	00098513          	mv	a0,s3
    80004130:	ffffe097          	auipc	ra,0xffffe
    80004134:	878080e7          	jalr	-1928(ra) # 800019a8 <_ZdlPv>
    80004138:	00048513          	mv	a0,s1
    8000413c:	00007097          	auipc	ra,0x7
    80004140:	f7c080e7          	jalr	-132(ra) # 8000b0b8 <_Unwind_Resume>
    80004144:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004148:	00048513          	mv	a0,s1
    8000414c:	ffffe097          	auipc	ra,0xffffe
    80004150:	85c080e7          	jalr	-1956(ra) # 800019a8 <_ZdlPv>
    80004154:	00090513          	mv	a0,s2
    80004158:	00007097          	auipc	ra,0x7
    8000415c:	f60080e7          	jalr	-160(ra) # 8000b0b8 <_Unwind_Resume>
    80004160:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004164:	000a0513          	mv	a0,s4
    80004168:	ffffe097          	auipc	ra,0xffffe
    8000416c:	840080e7          	jalr	-1984(ra) # 800019a8 <_ZdlPv>
    80004170:	00048513          	mv	a0,s1
    80004174:	00007097          	auipc	ra,0x7
    80004178:	f44080e7          	jalr	-188(ra) # 8000b0b8 <_Unwind_Resume>
    8000417c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004180:	00090513          	mv	a0,s2
    80004184:	ffffe097          	auipc	ra,0xffffe
    80004188:	824080e7          	jalr	-2012(ra) # 800019a8 <_ZdlPv>
    8000418c:	00048513          	mv	a0,s1
    80004190:	00007097          	auipc	ra,0x7
    80004194:	f28080e7          	jalr	-216(ra) # 8000b0b8 <_Unwind_Resume>
    80004198:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    8000419c:	00090513          	mv	a0,s2
    800041a0:	ffffe097          	auipc	ra,0xffffe
    800041a4:	808080e7          	jalr	-2040(ra) # 800019a8 <_ZdlPv>
    800041a8:	00048513          	mv	a0,s1
    800041ac:	00007097          	auipc	ra,0x7
    800041b0:	f0c080e7          	jalr	-244(ra) # 8000b0b8 <_Unwind_Resume>

00000000800041b4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800041b4:	ff010113          	addi	sp,sp,-16
    800041b8:	00113423          	sd	ra,8(sp)
    800041bc:	00813023          	sd	s0,0(sp)
    800041c0:	01010413          	addi	s0,sp,16
    800041c4:	00006797          	auipc	a5,0x6
    800041c8:	ccc78793          	addi	a5,a5,-820 # 80009e90 <_ZTV12ConsumerSync+0x10>
    800041cc:	00f53023          	sd	a5,0(a0)
    800041d0:	ffffe097          	auipc	ra,0xffffe
    800041d4:	aa4080e7          	jalr	-1372(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800041d8:	00813083          	ld	ra,8(sp)
    800041dc:	00013403          	ld	s0,0(sp)
    800041e0:	01010113          	addi	sp,sp,16
    800041e4:	00008067          	ret

00000000800041e8 <_ZN12ConsumerSyncD0Ev>:
    800041e8:	fe010113          	addi	sp,sp,-32
    800041ec:	00113c23          	sd	ra,24(sp)
    800041f0:	00813823          	sd	s0,16(sp)
    800041f4:	00913423          	sd	s1,8(sp)
    800041f8:	02010413          	addi	s0,sp,32
    800041fc:	00050493          	mv	s1,a0
    80004200:	00006797          	auipc	a5,0x6
    80004204:	c9078793          	addi	a5,a5,-880 # 80009e90 <_ZTV12ConsumerSync+0x10>
    80004208:	00f53023          	sd	a5,0(a0)
    8000420c:	ffffe097          	auipc	ra,0xffffe
    80004210:	a68080e7          	jalr	-1432(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80004214:	00048513          	mv	a0,s1
    80004218:	ffffd097          	auipc	ra,0xffffd
    8000421c:	790080e7          	jalr	1936(ra) # 800019a8 <_ZdlPv>
    80004220:	01813083          	ld	ra,24(sp)
    80004224:	01013403          	ld	s0,16(sp)
    80004228:	00813483          	ld	s1,8(sp)
    8000422c:	02010113          	addi	sp,sp,32
    80004230:	00008067          	ret

0000000080004234 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00113423          	sd	ra,8(sp)
    8000423c:	00813023          	sd	s0,0(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	00006797          	auipc	a5,0x6
    80004248:	c2478793          	addi	a5,a5,-988 # 80009e68 <_ZTV12ProducerSync+0x10>
    8000424c:	00f53023          	sd	a5,0(a0)
    80004250:	ffffe097          	auipc	ra,0xffffe
    80004254:	a24080e7          	jalr	-1500(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80004258:	00813083          	ld	ra,8(sp)
    8000425c:	00013403          	ld	s0,0(sp)
    80004260:	01010113          	addi	sp,sp,16
    80004264:	00008067          	ret

0000000080004268 <_ZN12ProducerSyncD0Ev>:
    80004268:	fe010113          	addi	sp,sp,-32
    8000426c:	00113c23          	sd	ra,24(sp)
    80004270:	00813823          	sd	s0,16(sp)
    80004274:	00913423          	sd	s1,8(sp)
    80004278:	02010413          	addi	s0,sp,32
    8000427c:	00050493          	mv	s1,a0
    80004280:	00006797          	auipc	a5,0x6
    80004284:	be878793          	addi	a5,a5,-1048 # 80009e68 <_ZTV12ProducerSync+0x10>
    80004288:	00f53023          	sd	a5,0(a0)
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	9e8080e7          	jalr	-1560(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80004294:	00048513          	mv	a0,s1
    80004298:	ffffd097          	auipc	ra,0xffffd
    8000429c:	710080e7          	jalr	1808(ra) # 800019a8 <_ZdlPv>
    800042a0:	01813083          	ld	ra,24(sp)
    800042a4:	01013403          	ld	s0,16(sp)
    800042a8:	00813483          	ld	s1,8(sp)
    800042ac:	02010113          	addi	sp,sp,32
    800042b0:	00008067          	ret

00000000800042b4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800042b4:	ff010113          	addi	sp,sp,-16
    800042b8:	00113423          	sd	ra,8(sp)
    800042bc:	00813023          	sd	s0,0(sp)
    800042c0:	01010413          	addi	s0,sp,16
    800042c4:	00006797          	auipc	a5,0x6
    800042c8:	b7c78793          	addi	a5,a5,-1156 # 80009e40 <_ZTV16ProducerKeyboard+0x10>
    800042cc:	00f53023          	sd	a5,0(a0)
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	9a4080e7          	jalr	-1628(ra) # 80001c74 <_ZN6ThreadD1Ev>
    800042d8:	00813083          	ld	ra,8(sp)
    800042dc:	00013403          	ld	s0,0(sp)
    800042e0:	01010113          	addi	sp,sp,16
    800042e4:	00008067          	ret

00000000800042e8 <_ZN16ProducerKeyboardD0Ev>:
    800042e8:	fe010113          	addi	sp,sp,-32
    800042ec:	00113c23          	sd	ra,24(sp)
    800042f0:	00813823          	sd	s0,16(sp)
    800042f4:	00913423          	sd	s1,8(sp)
    800042f8:	02010413          	addi	s0,sp,32
    800042fc:	00050493          	mv	s1,a0
    80004300:	00006797          	auipc	a5,0x6
    80004304:	b4078793          	addi	a5,a5,-1216 # 80009e40 <_ZTV16ProducerKeyboard+0x10>
    80004308:	00f53023          	sd	a5,0(a0)
    8000430c:	ffffe097          	auipc	ra,0xffffe
    80004310:	968080e7          	jalr	-1688(ra) # 80001c74 <_ZN6ThreadD1Ev>
    80004314:	00048513          	mv	a0,s1
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	690080e7          	jalr	1680(ra) # 800019a8 <_ZdlPv>
    80004320:	01813083          	ld	ra,24(sp)
    80004324:	01013403          	ld	s0,16(sp)
    80004328:	00813483          	ld	s1,8(sp)
    8000432c:	02010113          	addi	sp,sp,32
    80004330:	00008067          	ret

0000000080004334 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004334:	ff010113          	addi	sp,sp,-16
    80004338:	00113423          	sd	ra,8(sp)
    8000433c:	00813023          	sd	s0,0(sp)
    80004340:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004344:	02053583          	ld	a1,32(a0)
    80004348:	00000097          	auipc	ra,0x0
    8000434c:	8b0080e7          	jalr	-1872(ra) # 80003bf8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004350:	00813083          	ld	ra,8(sp)
    80004354:	00013403          	ld	s0,0(sp)
    80004358:	01010113          	addi	sp,sp,16
    8000435c:	00008067          	ret

0000000080004360 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004360:	ff010113          	addi	sp,sp,-16
    80004364:	00113423          	sd	ra,8(sp)
    80004368:	00813023          	sd	s0,0(sp)
    8000436c:	01010413          	addi	s0,sp,16
        producer(td);
    80004370:	02053583          	ld	a1,32(a0)
    80004374:	00000097          	auipc	ra,0x0
    80004378:	944080e7          	jalr	-1724(ra) # 80003cb8 <_ZN12ProducerSync8producerEPv>
    }
    8000437c:	00813083          	ld	ra,8(sp)
    80004380:	00013403          	ld	s0,0(sp)
    80004384:	01010113          	addi	sp,sp,16
    80004388:	00008067          	ret

000000008000438c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000438c:	ff010113          	addi	sp,sp,-16
    80004390:	00113423          	sd	ra,8(sp)
    80004394:	00813023          	sd	s0,0(sp)
    80004398:	01010413          	addi	s0,sp,16
        consumer(td);
    8000439c:	02053583          	ld	a1,32(a0)
    800043a0:	00000097          	auipc	ra,0x0
    800043a4:	9ac080e7          	jalr	-1620(ra) # 80003d4c <_ZN12ConsumerSync8consumerEPv>
    }
    800043a8:	00813083          	ld	ra,8(sp)
    800043ac:	00013403          	ld	s0,0(sp)
    800043b0:	01010113          	addi	sp,sp,16
    800043b4:	00008067          	ret

00000000800043b8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800043b8:	fe010113          	addi	sp,sp,-32
    800043bc:	00113c23          	sd	ra,24(sp)
    800043c0:	00813823          	sd	s0,16(sp)
    800043c4:	00913423          	sd	s1,8(sp)
    800043c8:	02010413          	addi	s0,sp,32
    800043cc:	00050493          	mv	s1,a0
    LOCK();
    800043d0:	00100613          	li	a2,1
    800043d4:	00000593          	li	a1,0
    800043d8:	00006517          	auipc	a0,0x6
    800043dc:	c0050513          	addi	a0,a0,-1024 # 80009fd8 <lockPrint>
    800043e0:	ffffd097          	auipc	ra,0xffffd
    800043e4:	fa8080e7          	jalr	-88(ra) # 80001388 <copy_and_swap>
    800043e8:	00050863          	beqz	a0,800043f8 <_Z11printStringPKc+0x40>
    800043ec:	ffffd097          	auipc	ra,0xffffd
    800043f0:	3b4080e7          	jalr	948(ra) # 800017a0 <_Z15thread_dispatchv>
    800043f4:	fddff06f          	j	800043d0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800043f8:	0004c503          	lbu	a0,0(s1)
    800043fc:	00050a63          	beqz	a0,80004410 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004400:	ffffd097          	auipc	ra,0xffffd
    80004404:	4ec080e7          	jalr	1260(ra) # 800018ec <_Z4putcc>
        string++;
    80004408:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000440c:	fedff06f          	j	800043f8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004410:	00000613          	li	a2,0
    80004414:	00100593          	li	a1,1
    80004418:	00006517          	auipc	a0,0x6
    8000441c:	bc050513          	addi	a0,a0,-1088 # 80009fd8 <lockPrint>
    80004420:	ffffd097          	auipc	ra,0xffffd
    80004424:	f68080e7          	jalr	-152(ra) # 80001388 <copy_and_swap>
    80004428:	fe0514e3          	bnez	a0,80004410 <_Z11printStringPKc+0x58>
}
    8000442c:	01813083          	ld	ra,24(sp)
    80004430:	01013403          	ld	s0,16(sp)
    80004434:	00813483          	ld	s1,8(sp)
    80004438:	02010113          	addi	sp,sp,32
    8000443c:	00008067          	ret

0000000080004440 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004440:	fd010113          	addi	sp,sp,-48
    80004444:	02113423          	sd	ra,40(sp)
    80004448:	02813023          	sd	s0,32(sp)
    8000444c:	00913c23          	sd	s1,24(sp)
    80004450:	01213823          	sd	s2,16(sp)
    80004454:	01313423          	sd	s3,8(sp)
    80004458:	01413023          	sd	s4,0(sp)
    8000445c:	03010413          	addi	s0,sp,48
    80004460:	00050993          	mv	s3,a0
    80004464:	00058a13          	mv	s4,a1
    LOCK();
    80004468:	00100613          	li	a2,1
    8000446c:	00000593          	li	a1,0
    80004470:	00006517          	auipc	a0,0x6
    80004474:	b6850513          	addi	a0,a0,-1176 # 80009fd8 <lockPrint>
    80004478:	ffffd097          	auipc	ra,0xffffd
    8000447c:	f10080e7          	jalr	-240(ra) # 80001388 <copy_and_swap>
    80004480:	00050863          	beqz	a0,80004490 <_Z9getStringPci+0x50>
    80004484:	ffffd097          	auipc	ra,0xffffd
    80004488:	31c080e7          	jalr	796(ra) # 800017a0 <_Z15thread_dispatchv>
    8000448c:	fddff06f          	j	80004468 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004490:	00000913          	li	s2,0
    80004494:	00090493          	mv	s1,s2
    80004498:	0019091b          	addiw	s2,s2,1
    8000449c:	03495a63          	bge	s2,s4,800044d0 <_Z9getStringPci+0x90>
        cc = getc();
    800044a0:	ffffd097          	auipc	ra,0xffffd
    800044a4:	424080e7          	jalr	1060(ra) # 800018c4 <_Z4getcv>
        if(cc < 1)
    800044a8:	02050463          	beqz	a0,800044d0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800044ac:	009984b3          	add	s1,s3,s1
    800044b0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800044b4:	00a00793          	li	a5,10
    800044b8:	00f50a63          	beq	a0,a5,800044cc <_Z9getStringPci+0x8c>
    800044bc:	00d00793          	li	a5,13
    800044c0:	fcf51ae3          	bne	a0,a5,80004494 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800044c4:	00090493          	mv	s1,s2
    800044c8:	0080006f          	j	800044d0 <_Z9getStringPci+0x90>
    800044cc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800044d0:	009984b3          	add	s1,s3,s1
    800044d4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800044d8:	00000613          	li	a2,0
    800044dc:	00100593          	li	a1,1
    800044e0:	00006517          	auipc	a0,0x6
    800044e4:	af850513          	addi	a0,a0,-1288 # 80009fd8 <lockPrint>
    800044e8:	ffffd097          	auipc	ra,0xffffd
    800044ec:	ea0080e7          	jalr	-352(ra) # 80001388 <copy_and_swap>
    800044f0:	fe0514e3          	bnez	a0,800044d8 <_Z9getStringPci+0x98>
    return buf;
}
    800044f4:	00098513          	mv	a0,s3
    800044f8:	02813083          	ld	ra,40(sp)
    800044fc:	02013403          	ld	s0,32(sp)
    80004500:	01813483          	ld	s1,24(sp)
    80004504:	01013903          	ld	s2,16(sp)
    80004508:	00813983          	ld	s3,8(sp)
    8000450c:	00013a03          	ld	s4,0(sp)
    80004510:	03010113          	addi	sp,sp,48
    80004514:	00008067          	ret

0000000080004518 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004518:	ff010113          	addi	sp,sp,-16
    8000451c:	00813423          	sd	s0,8(sp)
    80004520:	01010413          	addi	s0,sp,16
    80004524:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004528:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000452c:	0006c603          	lbu	a2,0(a3)
    80004530:	fd06071b          	addiw	a4,a2,-48
    80004534:	0ff77713          	andi	a4,a4,255
    80004538:	00900793          	li	a5,9
    8000453c:	02e7e063          	bltu	a5,a4,8000455c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004540:	0025179b          	slliw	a5,a0,0x2
    80004544:	00a787bb          	addw	a5,a5,a0
    80004548:	0017979b          	slliw	a5,a5,0x1
    8000454c:	00168693          	addi	a3,a3,1
    80004550:	00c787bb          	addw	a5,a5,a2
    80004554:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004558:	fd5ff06f          	j	8000452c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000455c:	00813403          	ld	s0,8(sp)
    80004560:	01010113          	addi	sp,sp,16
    80004564:	00008067          	ret

0000000080004568 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004568:	fc010113          	addi	sp,sp,-64
    8000456c:	02113c23          	sd	ra,56(sp)
    80004570:	02813823          	sd	s0,48(sp)
    80004574:	02913423          	sd	s1,40(sp)
    80004578:	03213023          	sd	s2,32(sp)
    8000457c:	01313c23          	sd	s3,24(sp)
    80004580:	04010413          	addi	s0,sp,64
    80004584:	00050493          	mv	s1,a0
    80004588:	00058913          	mv	s2,a1
    8000458c:	00060993          	mv	s3,a2
    LOCK();
    80004590:	00100613          	li	a2,1
    80004594:	00000593          	li	a1,0
    80004598:	00006517          	auipc	a0,0x6
    8000459c:	a4050513          	addi	a0,a0,-1472 # 80009fd8 <lockPrint>
    800045a0:	ffffd097          	auipc	ra,0xffffd
    800045a4:	de8080e7          	jalr	-536(ra) # 80001388 <copy_and_swap>
    800045a8:	00050863          	beqz	a0,800045b8 <_Z8printIntiii+0x50>
    800045ac:	ffffd097          	auipc	ra,0xffffd
    800045b0:	1f4080e7          	jalr	500(ra) # 800017a0 <_Z15thread_dispatchv>
    800045b4:	fddff06f          	j	80004590 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800045b8:	00098463          	beqz	s3,800045c0 <_Z8printIntiii+0x58>
    800045bc:	0804c463          	bltz	s1,80004644 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800045c0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800045c4:	00000593          	li	a1,0
    }

    i = 0;
    800045c8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800045cc:	0009079b          	sext.w	a5,s2
    800045d0:	0325773b          	remuw	a4,a0,s2
    800045d4:	00048613          	mv	a2,s1
    800045d8:	0014849b          	addiw	s1,s1,1
    800045dc:	02071693          	slli	a3,a4,0x20
    800045e0:	0206d693          	srli	a3,a3,0x20
    800045e4:	00006717          	auipc	a4,0x6
    800045e8:	8c470713          	addi	a4,a4,-1852 # 80009ea8 <digits>
    800045ec:	00d70733          	add	a4,a4,a3
    800045f0:	00074683          	lbu	a3,0(a4)
    800045f4:	fd040713          	addi	a4,s0,-48
    800045f8:	00c70733          	add	a4,a4,a2
    800045fc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004600:	0005071b          	sext.w	a4,a0
    80004604:	0325553b          	divuw	a0,a0,s2
    80004608:	fcf772e3          	bgeu	a4,a5,800045cc <_Z8printIntiii+0x64>
    if(neg)
    8000460c:	00058c63          	beqz	a1,80004624 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004610:	fd040793          	addi	a5,s0,-48
    80004614:	009784b3          	add	s1,a5,s1
    80004618:	02d00793          	li	a5,45
    8000461c:	fef48823          	sb	a5,-16(s1)
    80004620:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004624:	fff4849b          	addiw	s1,s1,-1
    80004628:	0204c463          	bltz	s1,80004650 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    8000462c:	fd040793          	addi	a5,s0,-48
    80004630:	009787b3          	add	a5,a5,s1
    80004634:	ff07c503          	lbu	a0,-16(a5)
    80004638:	ffffd097          	auipc	ra,0xffffd
    8000463c:	2b4080e7          	jalr	692(ra) # 800018ec <_Z4putcc>
    80004640:	fe5ff06f          	j	80004624 <_Z8printIntiii+0xbc>
        x = -xx;
    80004644:	4090053b          	negw	a0,s1
        neg = 1;
    80004648:	00100593          	li	a1,1
        x = -xx;
    8000464c:	f7dff06f          	j	800045c8 <_Z8printIntiii+0x60>

    UNLOCK();
    80004650:	00000613          	li	a2,0
    80004654:	00100593          	li	a1,1
    80004658:	00006517          	auipc	a0,0x6
    8000465c:	98050513          	addi	a0,a0,-1664 # 80009fd8 <lockPrint>
    80004660:	ffffd097          	auipc	ra,0xffffd
    80004664:	d28080e7          	jalr	-728(ra) # 80001388 <copy_and_swap>
    80004668:	fe0514e3          	bnez	a0,80004650 <_Z8printIntiii+0xe8>
    8000466c:	03813083          	ld	ra,56(sp)
    80004670:	03013403          	ld	s0,48(sp)
    80004674:	02813483          	ld	s1,40(sp)
    80004678:	02013903          	ld	s2,32(sp)
    8000467c:	01813983          	ld	s3,24(sp)
    80004680:	04010113          	addi	sp,sp,64
    80004684:	00008067          	ret

0000000080004688 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004688:	fd010113          	addi	sp,sp,-48
    8000468c:	02113423          	sd	ra,40(sp)
    80004690:	02813023          	sd	s0,32(sp)
    80004694:	00913c23          	sd	s1,24(sp)
    80004698:	01213823          	sd	s2,16(sp)
    8000469c:	01313423          	sd	s3,8(sp)
    800046a0:	03010413          	addi	s0,sp,48
    800046a4:	00050493          	mv	s1,a0
    800046a8:	00058913          	mv	s2,a1
    800046ac:	0015879b          	addiw	a5,a1,1
    800046b0:	0007851b          	sext.w	a0,a5
    800046b4:	00f4a023          	sw	a5,0(s1)
    800046b8:	0004a823          	sw	zero,16(s1)
    800046bc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800046c0:	00251513          	slli	a0,a0,0x2
    800046c4:	ffffd097          	auipc	ra,0xffffd
    800046c8:	f84080e7          	jalr	-124(ra) # 80001648 <_Z9mem_allocm>
    800046cc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800046d0:	01000513          	li	a0,16
    800046d4:	ffffd097          	auipc	ra,0xffffd
    800046d8:	284080e7          	jalr	644(ra) # 80001958 <_Znwm>
    800046dc:	00050993          	mv	s3,a0
    800046e0:	00000593          	li	a1,0
    800046e4:	ffffd097          	auipc	ra,0xffffd
    800046e8:	790080e7          	jalr	1936(ra) # 80001e74 <_ZN9SemaphoreC1Ej>
    800046ec:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800046f0:	01000513          	li	a0,16
    800046f4:	ffffd097          	auipc	ra,0xffffd
    800046f8:	264080e7          	jalr	612(ra) # 80001958 <_Znwm>
    800046fc:	00050993          	mv	s3,a0
    80004700:	00090593          	mv	a1,s2
    80004704:	ffffd097          	auipc	ra,0xffffd
    80004708:	770080e7          	jalr	1904(ra) # 80001e74 <_ZN9SemaphoreC1Ej>
    8000470c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004710:	01000513          	li	a0,16
    80004714:	ffffd097          	auipc	ra,0xffffd
    80004718:	244080e7          	jalr	580(ra) # 80001958 <_Znwm>
    8000471c:	00050913          	mv	s2,a0
    80004720:	00100593          	li	a1,1
    80004724:	ffffd097          	auipc	ra,0xffffd
    80004728:	750080e7          	jalr	1872(ra) # 80001e74 <_ZN9SemaphoreC1Ej>
    8000472c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004730:	01000513          	li	a0,16
    80004734:	ffffd097          	auipc	ra,0xffffd
    80004738:	224080e7          	jalr	548(ra) # 80001958 <_Znwm>
    8000473c:	00050913          	mv	s2,a0
    80004740:	00100593          	li	a1,1
    80004744:	ffffd097          	auipc	ra,0xffffd
    80004748:	730080e7          	jalr	1840(ra) # 80001e74 <_ZN9SemaphoreC1Ej>
    8000474c:	0324b823          	sd	s2,48(s1)
}
    80004750:	02813083          	ld	ra,40(sp)
    80004754:	02013403          	ld	s0,32(sp)
    80004758:	01813483          	ld	s1,24(sp)
    8000475c:	01013903          	ld	s2,16(sp)
    80004760:	00813983          	ld	s3,8(sp)
    80004764:	03010113          	addi	sp,sp,48
    80004768:	00008067          	ret
    8000476c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004770:	00098513          	mv	a0,s3
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	234080e7          	jalr	564(ra) # 800019a8 <_ZdlPv>
    8000477c:	00048513          	mv	a0,s1
    80004780:	00007097          	auipc	ra,0x7
    80004784:	938080e7          	jalr	-1736(ra) # 8000b0b8 <_Unwind_Resume>
    80004788:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000478c:	00098513          	mv	a0,s3
    80004790:	ffffd097          	auipc	ra,0xffffd
    80004794:	218080e7          	jalr	536(ra) # 800019a8 <_ZdlPv>
    80004798:	00048513          	mv	a0,s1
    8000479c:	00007097          	auipc	ra,0x7
    800047a0:	91c080e7          	jalr	-1764(ra) # 8000b0b8 <_Unwind_Resume>
    800047a4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800047a8:	00090513          	mv	a0,s2
    800047ac:	ffffd097          	auipc	ra,0xffffd
    800047b0:	1fc080e7          	jalr	508(ra) # 800019a8 <_ZdlPv>
    800047b4:	00048513          	mv	a0,s1
    800047b8:	00007097          	auipc	ra,0x7
    800047bc:	900080e7          	jalr	-1792(ra) # 8000b0b8 <_Unwind_Resume>
    800047c0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800047c4:	00090513          	mv	a0,s2
    800047c8:	ffffd097          	auipc	ra,0xffffd
    800047cc:	1e0080e7          	jalr	480(ra) # 800019a8 <_ZdlPv>
    800047d0:	00048513          	mv	a0,s1
    800047d4:	00007097          	auipc	ra,0x7
    800047d8:	8e4080e7          	jalr	-1820(ra) # 8000b0b8 <_Unwind_Resume>

00000000800047dc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800047dc:	fe010113          	addi	sp,sp,-32
    800047e0:	00113c23          	sd	ra,24(sp)
    800047e4:	00813823          	sd	s0,16(sp)
    800047e8:	00913423          	sd	s1,8(sp)
    800047ec:	01213023          	sd	s2,0(sp)
    800047f0:	02010413          	addi	s0,sp,32
    800047f4:	00050493          	mv	s1,a0
    800047f8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800047fc:	01853503          	ld	a0,24(a0)
    80004800:	ffffd097          	auipc	ra,0xffffd
    80004804:	6ac080e7          	jalr	1708(ra) # 80001eac <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004808:	0304b503          	ld	a0,48(s1)
    8000480c:	ffffd097          	auipc	ra,0xffffd
    80004810:	6a0080e7          	jalr	1696(ra) # 80001eac <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004814:	0084b783          	ld	a5,8(s1)
    80004818:	0144a703          	lw	a4,20(s1)
    8000481c:	00271713          	slli	a4,a4,0x2
    80004820:	00e787b3          	add	a5,a5,a4
    80004824:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004828:	0144a783          	lw	a5,20(s1)
    8000482c:	0017879b          	addiw	a5,a5,1
    80004830:	0004a703          	lw	a4,0(s1)
    80004834:	02e7e7bb          	remw	a5,a5,a4
    80004838:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000483c:	0304b503          	ld	a0,48(s1)
    80004840:	ffffd097          	auipc	ra,0xffffd
    80004844:	698080e7          	jalr	1688(ra) # 80001ed8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004848:	0204b503          	ld	a0,32(s1)
    8000484c:	ffffd097          	auipc	ra,0xffffd
    80004850:	68c080e7          	jalr	1676(ra) # 80001ed8 <_ZN9Semaphore6signalEv>

}
    80004854:	01813083          	ld	ra,24(sp)
    80004858:	01013403          	ld	s0,16(sp)
    8000485c:	00813483          	ld	s1,8(sp)
    80004860:	00013903          	ld	s2,0(sp)
    80004864:	02010113          	addi	sp,sp,32
    80004868:	00008067          	ret

000000008000486c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000486c:	fe010113          	addi	sp,sp,-32
    80004870:	00113c23          	sd	ra,24(sp)
    80004874:	00813823          	sd	s0,16(sp)
    80004878:	00913423          	sd	s1,8(sp)
    8000487c:	01213023          	sd	s2,0(sp)
    80004880:	02010413          	addi	s0,sp,32
    80004884:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004888:	02053503          	ld	a0,32(a0)
    8000488c:	ffffd097          	auipc	ra,0xffffd
    80004890:	620080e7          	jalr	1568(ra) # 80001eac <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004894:	0284b503          	ld	a0,40(s1)
    80004898:	ffffd097          	auipc	ra,0xffffd
    8000489c:	614080e7          	jalr	1556(ra) # 80001eac <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800048a0:	0084b703          	ld	a4,8(s1)
    800048a4:	0104a783          	lw	a5,16(s1)
    800048a8:	00279693          	slli	a3,a5,0x2
    800048ac:	00d70733          	add	a4,a4,a3
    800048b0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800048b4:	0017879b          	addiw	a5,a5,1
    800048b8:	0004a703          	lw	a4,0(s1)
    800048bc:	02e7e7bb          	remw	a5,a5,a4
    800048c0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800048c4:	0284b503          	ld	a0,40(s1)
    800048c8:	ffffd097          	auipc	ra,0xffffd
    800048cc:	610080e7          	jalr	1552(ra) # 80001ed8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800048d0:	0184b503          	ld	a0,24(s1)
    800048d4:	ffffd097          	auipc	ra,0xffffd
    800048d8:	604080e7          	jalr	1540(ra) # 80001ed8 <_ZN9Semaphore6signalEv>

    return ret;
}
    800048dc:	00090513          	mv	a0,s2
    800048e0:	01813083          	ld	ra,24(sp)
    800048e4:	01013403          	ld	s0,16(sp)
    800048e8:	00813483          	ld	s1,8(sp)
    800048ec:	00013903          	ld	s2,0(sp)
    800048f0:	02010113          	addi	sp,sp,32
    800048f4:	00008067          	ret

00000000800048f8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800048f8:	fe010113          	addi	sp,sp,-32
    800048fc:	00113c23          	sd	ra,24(sp)
    80004900:	00813823          	sd	s0,16(sp)
    80004904:	00913423          	sd	s1,8(sp)
    80004908:	01213023          	sd	s2,0(sp)
    8000490c:	02010413          	addi	s0,sp,32
    80004910:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004914:	02853503          	ld	a0,40(a0)
    80004918:	ffffd097          	auipc	ra,0xffffd
    8000491c:	594080e7          	jalr	1428(ra) # 80001eac <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004920:	0304b503          	ld	a0,48(s1)
    80004924:	ffffd097          	auipc	ra,0xffffd
    80004928:	588080e7          	jalr	1416(ra) # 80001eac <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000492c:	0144a783          	lw	a5,20(s1)
    80004930:	0104a903          	lw	s2,16(s1)
    80004934:	0327ce63          	blt	a5,s2,80004970 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004938:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000493c:	0304b503          	ld	a0,48(s1)
    80004940:	ffffd097          	auipc	ra,0xffffd
    80004944:	598080e7          	jalr	1432(ra) # 80001ed8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004948:	0284b503          	ld	a0,40(s1)
    8000494c:	ffffd097          	auipc	ra,0xffffd
    80004950:	58c080e7          	jalr	1420(ra) # 80001ed8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004954:	00090513          	mv	a0,s2
    80004958:	01813083          	ld	ra,24(sp)
    8000495c:	01013403          	ld	s0,16(sp)
    80004960:	00813483          	ld	s1,8(sp)
    80004964:	00013903          	ld	s2,0(sp)
    80004968:	02010113          	addi	sp,sp,32
    8000496c:	00008067          	ret
        ret = cap - head + tail;
    80004970:	0004a703          	lw	a4,0(s1)
    80004974:	4127093b          	subw	s2,a4,s2
    80004978:	00f9093b          	addw	s2,s2,a5
    8000497c:	fc1ff06f          	j	8000493c <_ZN9BufferCPP6getCntEv+0x44>

0000000080004980 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004980:	fe010113          	addi	sp,sp,-32
    80004984:	00113c23          	sd	ra,24(sp)
    80004988:	00813823          	sd	s0,16(sp)
    8000498c:	00913423          	sd	s1,8(sp)
    80004990:	02010413          	addi	s0,sp,32
    80004994:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004998:	00a00513          	li	a0,10
    8000499c:	ffffd097          	auipc	ra,0xffffd
    800049a0:	5bc080e7          	jalr	1468(ra) # 80001f58 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800049a4:	00004517          	auipc	a0,0x4
    800049a8:	93c50513          	addi	a0,a0,-1732 # 800082e0 <CONSOLE_STATUS+0x2d0>
    800049ac:	00000097          	auipc	ra,0x0
    800049b0:	a0c080e7          	jalr	-1524(ra) # 800043b8 <_Z11printStringPKc>
    while (getCnt()) {
    800049b4:	00048513          	mv	a0,s1
    800049b8:	00000097          	auipc	ra,0x0
    800049bc:	f40080e7          	jalr	-192(ra) # 800048f8 <_ZN9BufferCPP6getCntEv>
    800049c0:	02050c63          	beqz	a0,800049f8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800049c4:	0084b783          	ld	a5,8(s1)
    800049c8:	0104a703          	lw	a4,16(s1)
    800049cc:	00271713          	slli	a4,a4,0x2
    800049d0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800049d4:	0007c503          	lbu	a0,0(a5)
    800049d8:	ffffd097          	auipc	ra,0xffffd
    800049dc:	580080e7          	jalr	1408(ra) # 80001f58 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800049e0:	0104a783          	lw	a5,16(s1)
    800049e4:	0017879b          	addiw	a5,a5,1
    800049e8:	0004a703          	lw	a4,0(s1)
    800049ec:	02e7e7bb          	remw	a5,a5,a4
    800049f0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800049f4:	fc1ff06f          	j	800049b4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800049f8:	02100513          	li	a0,33
    800049fc:	ffffd097          	auipc	ra,0xffffd
    80004a00:	55c080e7          	jalr	1372(ra) # 80001f58 <_ZN7Console4putcEc>
    Console::putc('\n');
    80004a04:	00a00513          	li	a0,10
    80004a08:	ffffd097          	auipc	ra,0xffffd
    80004a0c:	550080e7          	jalr	1360(ra) # 80001f58 <_ZN7Console4putcEc>
    mem_free(buffer);
    80004a10:	0084b503          	ld	a0,8(s1)
    80004a14:	ffffd097          	auipc	ra,0xffffd
    80004a18:	c08080e7          	jalr	-1016(ra) # 8000161c <_Z8mem_freePv>
    delete itemAvailable;
    80004a1c:	0204b503          	ld	a0,32(s1)
    80004a20:	00050863          	beqz	a0,80004a30 <_ZN9BufferCPPD1Ev+0xb0>
    80004a24:	00053783          	ld	a5,0(a0)
    80004a28:	0087b783          	ld	a5,8(a5)
    80004a2c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004a30:	0184b503          	ld	a0,24(s1)
    80004a34:	00050863          	beqz	a0,80004a44 <_ZN9BufferCPPD1Ev+0xc4>
    80004a38:	00053783          	ld	a5,0(a0)
    80004a3c:	0087b783          	ld	a5,8(a5)
    80004a40:	000780e7          	jalr	a5
    delete mutexTail;
    80004a44:	0304b503          	ld	a0,48(s1)
    80004a48:	00050863          	beqz	a0,80004a58 <_ZN9BufferCPPD1Ev+0xd8>
    80004a4c:	00053783          	ld	a5,0(a0)
    80004a50:	0087b783          	ld	a5,8(a5)
    80004a54:	000780e7          	jalr	a5
    delete mutexHead;
    80004a58:	0284b503          	ld	a0,40(s1)
    80004a5c:	00050863          	beqz	a0,80004a6c <_ZN9BufferCPPD1Ev+0xec>
    80004a60:	00053783          	ld	a5,0(a0)
    80004a64:	0087b783          	ld	a5,8(a5)
    80004a68:	000780e7          	jalr	a5
}
    80004a6c:	01813083          	ld	ra,24(sp)
    80004a70:	01013403          	ld	s0,16(sp)
    80004a74:	00813483          	ld	s1,8(sp)
    80004a78:	02010113          	addi	sp,sp,32
    80004a7c:	00008067          	ret

0000000080004a80 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80004a80:	ff010113          	addi	sp,sp,-16
    80004a84:	00113423          	sd	ra,8(sp)
    80004a88:	00813023          	sd	s0,0(sp)
    80004a8c:	01010413          	addi	s0,sp,16
    printString("Unesite broj testa? [1-7]\n");
    80004a90:	00004517          	auipc	a0,0x4
    80004a94:	86850513          	addi	a0,a0,-1944 # 800082f8 <CONSOLE_STATUS+0x2e8>
    80004a98:	00000097          	auipc	ra,0x0
    80004a9c:	920080e7          	jalr	-1760(ra) # 800043b8 <_Z11printStringPKc>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
#endif
            break;
        case 3:
#if LEVEL_3_IMPLEMENTED == 1
            producerConsumer_C_API();
    80004aa0:	ffffe097          	auipc	ra,0xffffe
    80004aa4:	f40080e7          	jalr	-192(ra) # 800029e0 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80004aa8:	00004517          	auipc	a0,0x4
    80004aac:	87050513          	addi	a0,a0,-1936 # 80008318 <CONSOLE_STATUS+0x308>
    80004ab0:	00000097          	auipc	ra,0x0
    80004ab4:	908080e7          	jalr	-1784(ra) # 800043b8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80004ab8:	00813083          	ld	ra,8(sp)
    80004abc:	00013403          	ld	s0,0(sp)
    80004ac0:	01010113          	addi	sp,sp,16
    80004ac4:	00008067          	ret

0000000080004ac8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004ac8:	fe010113          	addi	sp,sp,-32
    80004acc:	00113c23          	sd	ra,24(sp)
    80004ad0:	00813823          	sd	s0,16(sp)
    80004ad4:	00913423          	sd	s1,8(sp)
    80004ad8:	01213023          	sd	s2,0(sp)
    80004adc:	02010413          	addi	s0,sp,32
    80004ae0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004ae4:	00100793          	li	a5,1
    80004ae8:	02a7f863          	bgeu	a5,a0,80004b18 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004aec:	00a00793          	li	a5,10
    80004af0:	02f577b3          	remu	a5,a0,a5
    80004af4:	02078e63          	beqz	a5,80004b30 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004af8:	fff48513          	addi	a0,s1,-1
    80004afc:	00000097          	auipc	ra,0x0
    80004b00:	fcc080e7          	jalr	-52(ra) # 80004ac8 <_ZL9fibonaccim>
    80004b04:	00050913          	mv	s2,a0
    80004b08:	ffe48513          	addi	a0,s1,-2
    80004b0c:	00000097          	auipc	ra,0x0
    80004b10:	fbc080e7          	jalr	-68(ra) # 80004ac8 <_ZL9fibonaccim>
    80004b14:	00a90533          	add	a0,s2,a0
}
    80004b18:	01813083          	ld	ra,24(sp)
    80004b1c:	01013403          	ld	s0,16(sp)
    80004b20:	00813483          	ld	s1,8(sp)
    80004b24:	00013903          	ld	s2,0(sp)
    80004b28:	02010113          	addi	sp,sp,32
    80004b2c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004b30:	ffffd097          	auipc	ra,0xffffd
    80004b34:	c70080e7          	jalr	-912(ra) # 800017a0 <_Z15thread_dispatchv>
    80004b38:	fc1ff06f          	j	80004af8 <_ZL9fibonaccim+0x30>

0000000080004b3c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004b3c:	fe010113          	addi	sp,sp,-32
    80004b40:	00113c23          	sd	ra,24(sp)
    80004b44:	00813823          	sd	s0,16(sp)
    80004b48:	00913423          	sd	s1,8(sp)
    80004b4c:	01213023          	sd	s2,0(sp)
    80004b50:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004b54:	00a00493          	li	s1,10
    80004b58:	0400006f          	j	80004b98 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004b5c:	00003517          	auipc	a0,0x3
    80004b60:	6ac50513          	addi	a0,a0,1708 # 80008208 <CONSOLE_STATUS+0x1f8>
    80004b64:	00000097          	auipc	ra,0x0
    80004b68:	854080e7          	jalr	-1964(ra) # 800043b8 <_Z11printStringPKc>
    80004b6c:	00000613          	li	a2,0
    80004b70:	00a00593          	li	a1,10
    80004b74:	00048513          	mv	a0,s1
    80004b78:	00000097          	auipc	ra,0x0
    80004b7c:	9f0080e7          	jalr	-1552(ra) # 80004568 <_Z8printIntiii>
    80004b80:	00003517          	auipc	a0,0x3
    80004b84:	5e850513          	addi	a0,a0,1512 # 80008168 <CONSOLE_STATUS+0x158>
    80004b88:	00000097          	auipc	ra,0x0
    80004b8c:	830080e7          	jalr	-2000(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004b90:	0014849b          	addiw	s1,s1,1
    80004b94:	0ff4f493          	andi	s1,s1,255
    80004b98:	00c00793          	li	a5,12
    80004b9c:	fc97f0e3          	bgeu	a5,s1,80004b5c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004ba0:	00003517          	auipc	a0,0x3
    80004ba4:	67050513          	addi	a0,a0,1648 # 80008210 <CONSOLE_STATUS+0x200>
    80004ba8:	00000097          	auipc	ra,0x0
    80004bac:	810080e7          	jalr	-2032(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004bb0:	00500313          	li	t1,5
    thread_dispatch();
    80004bb4:	ffffd097          	auipc	ra,0xffffd
    80004bb8:	bec080e7          	jalr	-1044(ra) # 800017a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004bbc:	01000513          	li	a0,16
    80004bc0:	00000097          	auipc	ra,0x0
    80004bc4:	f08080e7          	jalr	-248(ra) # 80004ac8 <_ZL9fibonaccim>
    80004bc8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004bcc:	00003517          	auipc	a0,0x3
    80004bd0:	65450513          	addi	a0,a0,1620 # 80008220 <CONSOLE_STATUS+0x210>
    80004bd4:	fffff097          	auipc	ra,0xfffff
    80004bd8:	7e4080e7          	jalr	2020(ra) # 800043b8 <_Z11printStringPKc>
    80004bdc:	00000613          	li	a2,0
    80004be0:	00a00593          	li	a1,10
    80004be4:	0009051b          	sext.w	a0,s2
    80004be8:	00000097          	auipc	ra,0x0
    80004bec:	980080e7          	jalr	-1664(ra) # 80004568 <_Z8printIntiii>
    80004bf0:	00003517          	auipc	a0,0x3
    80004bf4:	57850513          	addi	a0,a0,1400 # 80008168 <CONSOLE_STATUS+0x158>
    80004bf8:	fffff097          	auipc	ra,0xfffff
    80004bfc:	7c0080e7          	jalr	1984(ra) # 800043b8 <_Z11printStringPKc>
    80004c00:	0400006f          	j	80004c40 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c04:	00003517          	auipc	a0,0x3
    80004c08:	60450513          	addi	a0,a0,1540 # 80008208 <CONSOLE_STATUS+0x1f8>
    80004c0c:	fffff097          	auipc	ra,0xfffff
    80004c10:	7ac080e7          	jalr	1964(ra) # 800043b8 <_Z11printStringPKc>
    80004c14:	00000613          	li	a2,0
    80004c18:	00a00593          	li	a1,10
    80004c1c:	00048513          	mv	a0,s1
    80004c20:	00000097          	auipc	ra,0x0
    80004c24:	948080e7          	jalr	-1720(ra) # 80004568 <_Z8printIntiii>
    80004c28:	00003517          	auipc	a0,0x3
    80004c2c:	54050513          	addi	a0,a0,1344 # 80008168 <CONSOLE_STATUS+0x158>
    80004c30:	fffff097          	auipc	ra,0xfffff
    80004c34:	788080e7          	jalr	1928(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004c38:	0014849b          	addiw	s1,s1,1
    80004c3c:	0ff4f493          	andi	s1,s1,255
    80004c40:	00f00793          	li	a5,15
    80004c44:	fc97f0e3          	bgeu	a5,s1,80004c04 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004c48:	00003517          	auipc	a0,0x3
    80004c4c:	5e850513          	addi	a0,a0,1512 # 80008230 <CONSOLE_STATUS+0x220>
    80004c50:	fffff097          	auipc	ra,0xfffff
    80004c54:	768080e7          	jalr	1896(ra) # 800043b8 <_Z11printStringPKc>
    finishedD = true;
    80004c58:	00100793          	li	a5,1
    80004c5c:	00005717          	auipc	a4,0x5
    80004c60:	38f70223          	sb	a5,900(a4) # 80009fe0 <_ZL9finishedD>
    thread_dispatch();
    80004c64:	ffffd097          	auipc	ra,0xffffd
    80004c68:	b3c080e7          	jalr	-1220(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80004c6c:	01813083          	ld	ra,24(sp)
    80004c70:	01013403          	ld	s0,16(sp)
    80004c74:	00813483          	ld	s1,8(sp)
    80004c78:	00013903          	ld	s2,0(sp)
    80004c7c:	02010113          	addi	sp,sp,32
    80004c80:	00008067          	ret

0000000080004c84 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004c84:	fe010113          	addi	sp,sp,-32
    80004c88:	00113c23          	sd	ra,24(sp)
    80004c8c:	00813823          	sd	s0,16(sp)
    80004c90:	00913423          	sd	s1,8(sp)
    80004c94:	01213023          	sd	s2,0(sp)
    80004c98:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004c9c:	00000493          	li	s1,0
    80004ca0:	0400006f          	j	80004ce0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004ca4:	00003517          	auipc	a0,0x3
    80004ca8:	53450513          	addi	a0,a0,1332 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80004cac:	fffff097          	auipc	ra,0xfffff
    80004cb0:	70c080e7          	jalr	1804(ra) # 800043b8 <_Z11printStringPKc>
    80004cb4:	00000613          	li	a2,0
    80004cb8:	00a00593          	li	a1,10
    80004cbc:	00048513          	mv	a0,s1
    80004cc0:	00000097          	auipc	ra,0x0
    80004cc4:	8a8080e7          	jalr	-1880(ra) # 80004568 <_Z8printIntiii>
    80004cc8:	00003517          	auipc	a0,0x3
    80004ccc:	4a050513          	addi	a0,a0,1184 # 80008168 <CONSOLE_STATUS+0x158>
    80004cd0:	fffff097          	auipc	ra,0xfffff
    80004cd4:	6e8080e7          	jalr	1768(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004cd8:	0014849b          	addiw	s1,s1,1
    80004cdc:	0ff4f493          	andi	s1,s1,255
    80004ce0:	00200793          	li	a5,2
    80004ce4:	fc97f0e3          	bgeu	a5,s1,80004ca4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004ce8:	00003517          	auipc	a0,0x3
    80004cec:	4f850513          	addi	a0,a0,1272 # 800081e0 <CONSOLE_STATUS+0x1d0>
    80004cf0:	fffff097          	auipc	ra,0xfffff
    80004cf4:	6c8080e7          	jalr	1736(ra) # 800043b8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004cf8:	00700313          	li	t1,7
    thread_dispatch();
    80004cfc:	ffffd097          	auipc	ra,0xffffd
    80004d00:	aa4080e7          	jalr	-1372(ra) # 800017a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004d04:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004d08:	00003517          	auipc	a0,0x3
    80004d0c:	4e850513          	addi	a0,a0,1256 # 800081f0 <CONSOLE_STATUS+0x1e0>
    80004d10:	fffff097          	auipc	ra,0xfffff
    80004d14:	6a8080e7          	jalr	1704(ra) # 800043b8 <_Z11printStringPKc>
    80004d18:	00000613          	li	a2,0
    80004d1c:	00a00593          	li	a1,10
    80004d20:	0009051b          	sext.w	a0,s2
    80004d24:	00000097          	auipc	ra,0x0
    80004d28:	844080e7          	jalr	-1980(ra) # 80004568 <_Z8printIntiii>
    80004d2c:	00003517          	auipc	a0,0x3
    80004d30:	43c50513          	addi	a0,a0,1084 # 80008168 <CONSOLE_STATUS+0x158>
    80004d34:	fffff097          	auipc	ra,0xfffff
    80004d38:	684080e7          	jalr	1668(ra) # 800043b8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004d3c:	00c00513          	li	a0,12
    80004d40:	00000097          	auipc	ra,0x0
    80004d44:	d88080e7          	jalr	-632(ra) # 80004ac8 <_ZL9fibonaccim>
    80004d48:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004d4c:	00003517          	auipc	a0,0x3
    80004d50:	4ac50513          	addi	a0,a0,1196 # 800081f8 <CONSOLE_STATUS+0x1e8>
    80004d54:	fffff097          	auipc	ra,0xfffff
    80004d58:	664080e7          	jalr	1636(ra) # 800043b8 <_Z11printStringPKc>
    80004d5c:	00000613          	li	a2,0
    80004d60:	00a00593          	li	a1,10
    80004d64:	0009051b          	sext.w	a0,s2
    80004d68:	00000097          	auipc	ra,0x0
    80004d6c:	800080e7          	jalr	-2048(ra) # 80004568 <_Z8printIntiii>
    80004d70:	00003517          	auipc	a0,0x3
    80004d74:	3f850513          	addi	a0,a0,1016 # 80008168 <CONSOLE_STATUS+0x158>
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	640080e7          	jalr	1600(ra) # 800043b8 <_Z11printStringPKc>
    80004d80:	0400006f          	j	80004dc0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004d84:	00003517          	auipc	a0,0x3
    80004d88:	45450513          	addi	a0,a0,1108 # 800081d8 <CONSOLE_STATUS+0x1c8>
    80004d8c:	fffff097          	auipc	ra,0xfffff
    80004d90:	62c080e7          	jalr	1580(ra) # 800043b8 <_Z11printStringPKc>
    80004d94:	00000613          	li	a2,0
    80004d98:	00a00593          	li	a1,10
    80004d9c:	00048513          	mv	a0,s1
    80004da0:	fffff097          	auipc	ra,0xfffff
    80004da4:	7c8080e7          	jalr	1992(ra) # 80004568 <_Z8printIntiii>
    80004da8:	00003517          	auipc	a0,0x3
    80004dac:	3c050513          	addi	a0,a0,960 # 80008168 <CONSOLE_STATUS+0x158>
    80004db0:	fffff097          	auipc	ra,0xfffff
    80004db4:	608080e7          	jalr	1544(ra) # 800043b8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004db8:	0014849b          	addiw	s1,s1,1
    80004dbc:	0ff4f493          	andi	s1,s1,255
    80004dc0:	00500793          	li	a5,5
    80004dc4:	fc97f0e3          	bgeu	a5,s1,80004d84 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004dc8:	00003517          	auipc	a0,0x3
    80004dcc:	3e850513          	addi	a0,a0,1000 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80004dd0:	fffff097          	auipc	ra,0xfffff
    80004dd4:	5e8080e7          	jalr	1512(ra) # 800043b8 <_Z11printStringPKc>
    finishedC = true;
    80004dd8:	00100793          	li	a5,1
    80004ddc:	00005717          	auipc	a4,0x5
    80004de0:	20f702a3          	sb	a5,517(a4) # 80009fe1 <_ZL9finishedC>
    thread_dispatch();
    80004de4:	ffffd097          	auipc	ra,0xffffd
    80004de8:	9bc080e7          	jalr	-1604(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80004dec:	01813083          	ld	ra,24(sp)
    80004df0:	01013403          	ld	s0,16(sp)
    80004df4:	00813483          	ld	s1,8(sp)
    80004df8:	00013903          	ld	s2,0(sp)
    80004dfc:	02010113          	addi	sp,sp,32
    80004e00:	00008067          	ret

0000000080004e04 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004e04:	fe010113          	addi	sp,sp,-32
    80004e08:	00113c23          	sd	ra,24(sp)
    80004e0c:	00813823          	sd	s0,16(sp)
    80004e10:	00913423          	sd	s1,8(sp)
    80004e14:	01213023          	sd	s2,0(sp)
    80004e18:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004e1c:	00000913          	li	s2,0
    80004e20:	0400006f          	j	80004e60 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80004e24:	ffffd097          	auipc	ra,0xffffd
    80004e28:	97c080e7          	jalr	-1668(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004e2c:	00148493          	addi	s1,s1,1
    80004e30:	000027b7          	lui	a5,0x2
    80004e34:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004e38:	0097ee63          	bltu	a5,s1,80004e54 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004e3c:	00000713          	li	a4,0
    80004e40:	000077b7          	lui	a5,0x7
    80004e44:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004e48:	fce7eee3          	bltu	a5,a4,80004e24 <_ZL11workerBodyBPv+0x20>
    80004e4c:	00170713          	addi	a4,a4,1
    80004e50:	ff1ff06f          	j	80004e40 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80004e54:	00a00793          	li	a5,10
    80004e58:	04f90663          	beq	s2,a5,80004ea4 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80004e5c:	00190913          	addi	s2,s2,1
    80004e60:	00f00793          	li	a5,15
    80004e64:	0527e463          	bltu	a5,s2,80004eac <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80004e68:	00003517          	auipc	a0,0x3
    80004e6c:	35850513          	addi	a0,a0,856 # 800081c0 <CONSOLE_STATUS+0x1b0>
    80004e70:	fffff097          	auipc	ra,0xfffff
    80004e74:	548080e7          	jalr	1352(ra) # 800043b8 <_Z11printStringPKc>
    80004e78:	00000613          	li	a2,0
    80004e7c:	00a00593          	li	a1,10
    80004e80:	0009051b          	sext.w	a0,s2
    80004e84:	fffff097          	auipc	ra,0xfffff
    80004e88:	6e4080e7          	jalr	1764(ra) # 80004568 <_Z8printIntiii>
    80004e8c:	00003517          	auipc	a0,0x3
    80004e90:	2dc50513          	addi	a0,a0,732 # 80008168 <CONSOLE_STATUS+0x158>
    80004e94:	fffff097          	auipc	ra,0xfffff
    80004e98:	524080e7          	jalr	1316(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004e9c:	00000493          	li	s1,0
    80004ea0:	f91ff06f          	j	80004e30 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80004ea4:	14102ff3          	csrr	t6,sepc
    80004ea8:	fb5ff06f          	j	80004e5c <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80004eac:	00003517          	auipc	a0,0x3
    80004eb0:	31c50513          	addi	a0,a0,796 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80004eb4:	fffff097          	auipc	ra,0xfffff
    80004eb8:	504080e7          	jalr	1284(ra) # 800043b8 <_Z11printStringPKc>
    finishedB = true;
    80004ebc:	00100793          	li	a5,1
    80004ec0:	00005717          	auipc	a4,0x5
    80004ec4:	12f70123          	sb	a5,290(a4) # 80009fe2 <_ZL9finishedB>
    thread_dispatch();
    80004ec8:	ffffd097          	auipc	ra,0xffffd
    80004ecc:	8d8080e7          	jalr	-1832(ra) # 800017a0 <_Z15thread_dispatchv>
}
    80004ed0:	01813083          	ld	ra,24(sp)
    80004ed4:	01013403          	ld	s0,16(sp)
    80004ed8:	00813483          	ld	s1,8(sp)
    80004edc:	00013903          	ld	s2,0(sp)
    80004ee0:	02010113          	addi	sp,sp,32
    80004ee4:	00008067          	ret

0000000080004ee8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004ee8:	fe010113          	addi	sp,sp,-32
    80004eec:	00113c23          	sd	ra,24(sp)
    80004ef0:	00813823          	sd	s0,16(sp)
    80004ef4:	00913423          	sd	s1,8(sp)
    80004ef8:	01213023          	sd	s2,0(sp)
    80004efc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004f00:	00000913          	li	s2,0
    80004f04:	0380006f          	j	80004f3c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004f08:	ffffd097          	auipc	ra,0xffffd
    80004f0c:	898080e7          	jalr	-1896(ra) # 800017a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004f10:	00148493          	addi	s1,s1,1
    80004f14:	000027b7          	lui	a5,0x2
    80004f18:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f1c:	0097ee63          	bltu	a5,s1,80004f38 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f20:	00000713          	li	a4,0
    80004f24:	000077b7          	lui	a5,0x7
    80004f28:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f2c:	fce7eee3          	bltu	a5,a4,80004f08 <_ZL11workerBodyAPv+0x20>
    80004f30:	00170713          	addi	a4,a4,1
    80004f34:	ff1ff06f          	j	80004f24 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004f38:	00190913          	addi	s2,s2,1
    80004f3c:	00900793          	li	a5,9
    80004f40:	0527e063          	bltu	a5,s2,80004f80 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004f44:	00003517          	auipc	a0,0x3
    80004f48:	26450513          	addi	a0,a0,612 # 800081a8 <CONSOLE_STATUS+0x198>
    80004f4c:	fffff097          	auipc	ra,0xfffff
    80004f50:	46c080e7          	jalr	1132(ra) # 800043b8 <_Z11printStringPKc>
    80004f54:	00000613          	li	a2,0
    80004f58:	00a00593          	li	a1,10
    80004f5c:	0009051b          	sext.w	a0,s2
    80004f60:	fffff097          	auipc	ra,0xfffff
    80004f64:	608080e7          	jalr	1544(ra) # 80004568 <_Z8printIntiii>
    80004f68:	00003517          	auipc	a0,0x3
    80004f6c:	20050513          	addi	a0,a0,512 # 80008168 <CONSOLE_STATUS+0x158>
    80004f70:	fffff097          	auipc	ra,0xfffff
    80004f74:	448080e7          	jalr	1096(ra) # 800043b8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004f78:	00000493          	li	s1,0
    80004f7c:	f99ff06f          	j	80004f14 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004f80:	00003517          	auipc	a0,0x3
    80004f84:	23050513          	addi	a0,a0,560 # 800081b0 <CONSOLE_STATUS+0x1a0>
    80004f88:	fffff097          	auipc	ra,0xfffff
    80004f8c:	430080e7          	jalr	1072(ra) # 800043b8 <_Z11printStringPKc>
    finishedA = true;
    80004f90:	00100793          	li	a5,1
    80004f94:	00005717          	auipc	a4,0x5
    80004f98:	04f707a3          	sb	a5,79(a4) # 80009fe3 <_ZL9finishedA>
}
    80004f9c:	01813083          	ld	ra,24(sp)
    80004fa0:	01013403          	ld	s0,16(sp)
    80004fa4:	00813483          	ld	s1,8(sp)
    80004fa8:	00013903          	ld	s2,0(sp)
    80004fac:	02010113          	addi	sp,sp,32
    80004fb0:	00008067          	ret

0000000080004fb4 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80004fb4:	fd010113          	addi	sp,sp,-48
    80004fb8:	02113423          	sd	ra,40(sp)
    80004fbc:	02813023          	sd	s0,32(sp)
    80004fc0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004fc4:	00000613          	li	a2,0
    80004fc8:	00000597          	auipc	a1,0x0
    80004fcc:	f2058593          	addi	a1,a1,-224 # 80004ee8 <_ZL11workerBodyAPv>
    80004fd0:	fd040513          	addi	a0,s0,-48
    80004fd4:	ffffc097          	auipc	ra,0xffffc
    80004fd8:	6ac080e7          	jalr	1708(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004fdc:	00003517          	auipc	a0,0x3
    80004fe0:	26450513          	addi	a0,a0,612 # 80008240 <CONSOLE_STATUS+0x230>
    80004fe4:	fffff097          	auipc	ra,0xfffff
    80004fe8:	3d4080e7          	jalr	980(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004fec:	00000613          	li	a2,0
    80004ff0:	00000597          	auipc	a1,0x0
    80004ff4:	e1458593          	addi	a1,a1,-492 # 80004e04 <_ZL11workerBodyBPv>
    80004ff8:	fd840513          	addi	a0,s0,-40
    80004ffc:	ffffc097          	auipc	ra,0xffffc
    80005000:	684080e7          	jalr	1668(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005004:	00003517          	auipc	a0,0x3
    80005008:	25450513          	addi	a0,a0,596 # 80008258 <CONSOLE_STATUS+0x248>
    8000500c:	fffff097          	auipc	ra,0xfffff
    80005010:	3ac080e7          	jalr	940(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005014:	00000613          	li	a2,0
    80005018:	00000597          	auipc	a1,0x0
    8000501c:	c6c58593          	addi	a1,a1,-916 # 80004c84 <_ZL11workerBodyCPv>
    80005020:	fe040513          	addi	a0,s0,-32
    80005024:	ffffc097          	auipc	ra,0xffffc
    80005028:	65c080e7          	jalr	1628(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000502c:	00003517          	auipc	a0,0x3
    80005030:	24450513          	addi	a0,a0,580 # 80008270 <CONSOLE_STATUS+0x260>
    80005034:	fffff097          	auipc	ra,0xfffff
    80005038:	384080e7          	jalr	900(ra) # 800043b8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000503c:	00000613          	li	a2,0
    80005040:	00000597          	auipc	a1,0x0
    80005044:	afc58593          	addi	a1,a1,-1284 # 80004b3c <_ZL11workerBodyDPv>
    80005048:	fe840513          	addi	a0,s0,-24
    8000504c:	ffffc097          	auipc	ra,0xffffc
    80005050:	634080e7          	jalr	1588(ra) # 80001680 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005054:	00003517          	auipc	a0,0x3
    80005058:	23450513          	addi	a0,a0,564 # 80008288 <CONSOLE_STATUS+0x278>
    8000505c:	fffff097          	auipc	ra,0xfffff
    80005060:	35c080e7          	jalr	860(ra) # 800043b8 <_Z11printStringPKc>
    80005064:	00c0006f          	j	80005070 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005068:	ffffc097          	auipc	ra,0xffffc
    8000506c:	738080e7          	jalr	1848(ra) # 800017a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005070:	00005797          	auipc	a5,0x5
    80005074:	f737c783          	lbu	a5,-141(a5) # 80009fe3 <_ZL9finishedA>
    80005078:	fe0788e3          	beqz	a5,80005068 <_Z16System_Mode_testv+0xb4>
    8000507c:	00005797          	auipc	a5,0x5
    80005080:	f667c783          	lbu	a5,-154(a5) # 80009fe2 <_ZL9finishedB>
    80005084:	fe0782e3          	beqz	a5,80005068 <_Z16System_Mode_testv+0xb4>
    80005088:	00005797          	auipc	a5,0x5
    8000508c:	f597c783          	lbu	a5,-167(a5) # 80009fe1 <_ZL9finishedC>
    80005090:	fc078ce3          	beqz	a5,80005068 <_Z16System_Mode_testv+0xb4>
    80005094:	00005797          	auipc	a5,0x5
    80005098:	f4c7c783          	lbu	a5,-180(a5) # 80009fe0 <_ZL9finishedD>
    8000509c:	fc0786e3          	beqz	a5,80005068 <_Z16System_Mode_testv+0xb4>
    }

}
    800050a0:	02813083          	ld	ra,40(sp)
    800050a4:	02013403          	ld	s0,32(sp)
    800050a8:	03010113          	addi	sp,sp,48
    800050ac:	00008067          	ret

00000000800050b0 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800050b0:	fe010113          	addi	sp,sp,-32
    800050b4:	00113c23          	sd	ra,24(sp)
    800050b8:	00813823          	sd	s0,16(sp)
    800050bc:	00913423          	sd	s1,8(sp)
    800050c0:	01213023          	sd	s2,0(sp)
    800050c4:	02010413          	addi	s0,sp,32
    800050c8:	00050493          	mv	s1,a0
    800050cc:	00058913          	mv	s2,a1
    800050d0:	0015879b          	addiw	a5,a1,1
    800050d4:	0007851b          	sext.w	a0,a5
    800050d8:	00f4a023          	sw	a5,0(s1)
    800050dc:	0004a823          	sw	zero,16(s1)
    800050e0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800050e4:	00251513          	slli	a0,a0,0x2
    800050e8:	ffffc097          	auipc	ra,0xffffc
    800050ec:	560080e7          	jalr	1376(ra) # 80001648 <_Z9mem_allocm>
    800050f0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800050f4:	00000593          	li	a1,0
    800050f8:	02048513          	addi	a0,s1,32
    800050fc:	ffffc097          	auipc	ra,0xffffc
    80005100:	6e8080e7          	jalr	1768(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    sem_open(&spaceAvailable, _cap);
    80005104:	00090593          	mv	a1,s2
    80005108:	01848513          	addi	a0,s1,24
    8000510c:	ffffc097          	auipc	ra,0xffffc
    80005110:	6d8080e7          	jalr	1752(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexHead, 1);
    80005114:	00100593          	li	a1,1
    80005118:	02848513          	addi	a0,s1,40
    8000511c:	ffffc097          	auipc	ra,0xffffc
    80005120:	6c8080e7          	jalr	1736(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
    sem_open(&mutexTail, 1);
    80005124:	00100593          	li	a1,1
    80005128:	03048513          	addi	a0,s1,48
    8000512c:	ffffc097          	auipc	ra,0xffffc
    80005130:	6b8080e7          	jalr	1720(ra) # 800017e4 <_Z8sem_openPP10MojSemaforj>
}
    80005134:	01813083          	ld	ra,24(sp)
    80005138:	01013403          	ld	s0,16(sp)
    8000513c:	00813483          	ld	s1,8(sp)
    80005140:	00013903          	ld	s2,0(sp)
    80005144:	02010113          	addi	sp,sp,32
    80005148:	00008067          	ret

000000008000514c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000514c:	fe010113          	addi	sp,sp,-32
    80005150:	00113c23          	sd	ra,24(sp)
    80005154:	00813823          	sd	s0,16(sp)
    80005158:	00913423          	sd	s1,8(sp)
    8000515c:	01213023          	sd	s2,0(sp)
    80005160:	02010413          	addi	s0,sp,32
    80005164:	00050493          	mv	s1,a0
    80005168:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000516c:	01853503          	ld	a0,24(a0)
    80005170:	ffffc097          	auipc	ra,0xffffc
    80005174:	6d0080e7          	jalr	1744(ra) # 80001840 <_Z8sem_waitP10MojSemafor>

    sem_wait(mutexTail);
    80005178:	0304b503          	ld	a0,48(s1)
    8000517c:	ffffc097          	auipc	ra,0xffffc
    80005180:	6c4080e7          	jalr	1732(ra) # 80001840 <_Z8sem_waitP10MojSemafor>
    buffer[tail] = val;
    80005184:	0084b783          	ld	a5,8(s1)
    80005188:	0144a703          	lw	a4,20(s1)
    8000518c:	00271713          	slli	a4,a4,0x2
    80005190:	00e787b3          	add	a5,a5,a4
    80005194:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005198:	0144a783          	lw	a5,20(s1)
    8000519c:	0017879b          	addiw	a5,a5,1
    800051a0:	0004a703          	lw	a4,0(s1)
    800051a4:	02e7e7bb          	remw	a5,a5,a4
    800051a8:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800051ac:	0304b503          	ld	a0,48(s1)
    800051b0:	ffffc097          	auipc	ra,0xffffc
    800051b4:	6bc080e7          	jalr	1724(ra) # 8000186c <_Z10sem_signalP10MojSemafor>

    sem_signal(itemAvailable);
    800051b8:	0204b503          	ld	a0,32(s1)
    800051bc:	ffffc097          	auipc	ra,0xffffc
    800051c0:	6b0080e7          	jalr	1712(ra) # 8000186c <_Z10sem_signalP10MojSemafor>

}
    800051c4:	01813083          	ld	ra,24(sp)
    800051c8:	01013403          	ld	s0,16(sp)
    800051cc:	00813483          	ld	s1,8(sp)
    800051d0:	00013903          	ld	s2,0(sp)
    800051d4:	02010113          	addi	sp,sp,32
    800051d8:	00008067          	ret

00000000800051dc <_ZN6Buffer3getEv>:

int Buffer::get() {
    800051dc:	fe010113          	addi	sp,sp,-32
    800051e0:	00113c23          	sd	ra,24(sp)
    800051e4:	00813823          	sd	s0,16(sp)
    800051e8:	00913423          	sd	s1,8(sp)
    800051ec:	01213023          	sd	s2,0(sp)
    800051f0:	02010413          	addi	s0,sp,32
    800051f4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800051f8:	02053503          	ld	a0,32(a0)
    800051fc:	ffffc097          	auipc	ra,0xffffc
    80005200:	644080e7          	jalr	1604(ra) # 80001840 <_Z8sem_waitP10MojSemafor>

    sem_wait(mutexHead);
    80005204:	0284b503          	ld	a0,40(s1)
    80005208:	ffffc097          	auipc	ra,0xffffc
    8000520c:	638080e7          	jalr	1592(ra) # 80001840 <_Z8sem_waitP10MojSemafor>

    int ret = buffer[head];
    80005210:	0084b703          	ld	a4,8(s1)
    80005214:	0104a783          	lw	a5,16(s1)
    80005218:	00279693          	slli	a3,a5,0x2
    8000521c:	00d70733          	add	a4,a4,a3
    80005220:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005224:	0017879b          	addiw	a5,a5,1
    80005228:	0004a703          	lw	a4,0(s1)
    8000522c:	02e7e7bb          	remw	a5,a5,a4
    80005230:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005234:	0284b503          	ld	a0,40(s1)
    80005238:	ffffc097          	auipc	ra,0xffffc
    8000523c:	634080e7          	jalr	1588(ra) # 8000186c <_Z10sem_signalP10MojSemafor>

    sem_signal(spaceAvailable);
    80005240:	0184b503          	ld	a0,24(s1)
    80005244:	ffffc097          	auipc	ra,0xffffc
    80005248:	628080e7          	jalr	1576(ra) # 8000186c <_Z10sem_signalP10MojSemafor>

    return ret;
}
    8000524c:	00090513          	mv	a0,s2
    80005250:	01813083          	ld	ra,24(sp)
    80005254:	01013403          	ld	s0,16(sp)
    80005258:	00813483          	ld	s1,8(sp)
    8000525c:	00013903          	ld	s2,0(sp)
    80005260:	02010113          	addi	sp,sp,32
    80005264:	00008067          	ret

0000000080005268 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005268:	fe010113          	addi	sp,sp,-32
    8000526c:	00113c23          	sd	ra,24(sp)
    80005270:	00813823          	sd	s0,16(sp)
    80005274:	00913423          	sd	s1,8(sp)
    80005278:	01213023          	sd	s2,0(sp)
    8000527c:	02010413          	addi	s0,sp,32
    80005280:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005284:	02853503          	ld	a0,40(a0)
    80005288:	ffffc097          	auipc	ra,0xffffc
    8000528c:	5b8080e7          	jalr	1464(ra) # 80001840 <_Z8sem_waitP10MojSemafor>
    sem_wait(mutexTail);
    80005290:	0304b503          	ld	a0,48(s1)
    80005294:	ffffc097          	auipc	ra,0xffffc
    80005298:	5ac080e7          	jalr	1452(ra) # 80001840 <_Z8sem_waitP10MojSemafor>

    if (tail >= head) {
    8000529c:	0144a783          	lw	a5,20(s1)
    800052a0:	0104a903          	lw	s2,16(s1)
    800052a4:	0327ce63          	blt	a5,s2,800052e0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800052a8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800052ac:	0304b503          	ld	a0,48(s1)
    800052b0:	ffffc097          	auipc	ra,0xffffc
    800052b4:	5bc080e7          	jalr	1468(ra) # 8000186c <_Z10sem_signalP10MojSemafor>
    sem_signal(mutexHead);
    800052b8:	0284b503          	ld	a0,40(s1)
    800052bc:	ffffc097          	auipc	ra,0xffffc
    800052c0:	5b0080e7          	jalr	1456(ra) # 8000186c <_Z10sem_signalP10MojSemafor>

    return ret;
}
    800052c4:	00090513          	mv	a0,s2
    800052c8:	01813083          	ld	ra,24(sp)
    800052cc:	01013403          	ld	s0,16(sp)
    800052d0:	00813483          	ld	s1,8(sp)
    800052d4:	00013903          	ld	s2,0(sp)
    800052d8:	02010113          	addi	sp,sp,32
    800052dc:	00008067          	ret
        ret = cap - head + tail;
    800052e0:	0004a703          	lw	a4,0(s1)
    800052e4:	4127093b          	subw	s2,a4,s2
    800052e8:	00f9093b          	addw	s2,s2,a5
    800052ec:	fc1ff06f          	j	800052ac <_ZN6Buffer6getCntEv+0x44>

00000000800052f0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800052f0:	fe010113          	addi	sp,sp,-32
    800052f4:	00113c23          	sd	ra,24(sp)
    800052f8:	00813823          	sd	s0,16(sp)
    800052fc:	00913423          	sd	s1,8(sp)
    80005300:	02010413          	addi	s0,sp,32
    80005304:	00050493          	mv	s1,a0
    putc('\n');
    80005308:	00a00513          	li	a0,10
    8000530c:	ffffc097          	auipc	ra,0xffffc
    80005310:	5e0080e7          	jalr	1504(ra) # 800018ec <_Z4putcc>
    printString("Buffer deleted!\n");
    80005314:	00003517          	auipc	a0,0x3
    80005318:	fcc50513          	addi	a0,a0,-52 # 800082e0 <CONSOLE_STATUS+0x2d0>
    8000531c:	fffff097          	auipc	ra,0xfffff
    80005320:	09c080e7          	jalr	156(ra) # 800043b8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005324:	00048513          	mv	a0,s1
    80005328:	00000097          	auipc	ra,0x0
    8000532c:	f40080e7          	jalr	-192(ra) # 80005268 <_ZN6Buffer6getCntEv>
    80005330:	02a05c63          	blez	a0,80005368 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005334:	0084b783          	ld	a5,8(s1)
    80005338:	0104a703          	lw	a4,16(s1)
    8000533c:	00271713          	slli	a4,a4,0x2
    80005340:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005344:	0007c503          	lbu	a0,0(a5)
    80005348:	ffffc097          	auipc	ra,0xffffc
    8000534c:	5a4080e7          	jalr	1444(ra) # 800018ec <_Z4putcc>
        head = (head + 1) % cap;
    80005350:	0104a783          	lw	a5,16(s1)
    80005354:	0017879b          	addiw	a5,a5,1
    80005358:	0004a703          	lw	a4,0(s1)
    8000535c:	02e7e7bb          	remw	a5,a5,a4
    80005360:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005364:	fc1ff06f          	j	80005324 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005368:	02100513          	li	a0,33
    8000536c:	ffffc097          	auipc	ra,0xffffc
    80005370:	580080e7          	jalr	1408(ra) # 800018ec <_Z4putcc>
    putc('\n');
    80005374:	00a00513          	li	a0,10
    80005378:	ffffc097          	auipc	ra,0xffffc
    8000537c:	574080e7          	jalr	1396(ra) # 800018ec <_Z4putcc>
    mem_free(buffer);
    80005380:	0084b503          	ld	a0,8(s1)
    80005384:	ffffc097          	auipc	ra,0xffffc
    80005388:	298080e7          	jalr	664(ra) # 8000161c <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000538c:	0204b503          	ld	a0,32(s1)
    80005390:	ffffc097          	auipc	ra,0xffffc
    80005394:	484080e7          	jalr	1156(ra) # 80001814 <_Z9sem_closeP10MojSemafor>
    sem_close(spaceAvailable);
    80005398:	0184b503          	ld	a0,24(s1)
    8000539c:	ffffc097          	auipc	ra,0xffffc
    800053a0:	478080e7          	jalr	1144(ra) # 80001814 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexTail);
    800053a4:	0304b503          	ld	a0,48(s1)
    800053a8:	ffffc097          	auipc	ra,0xffffc
    800053ac:	46c080e7          	jalr	1132(ra) # 80001814 <_Z9sem_closeP10MojSemafor>
    sem_close(mutexHead);
    800053b0:	0284b503          	ld	a0,40(s1)
    800053b4:	ffffc097          	auipc	ra,0xffffc
    800053b8:	460080e7          	jalr	1120(ra) # 80001814 <_Z9sem_closeP10MojSemafor>
}
    800053bc:	01813083          	ld	ra,24(sp)
    800053c0:	01013403          	ld	s0,16(sp)
    800053c4:	00813483          	ld	s1,8(sp)
    800053c8:	02010113          	addi	sp,sp,32
    800053cc:	00008067          	ret

00000000800053d0 <start>:
    800053d0:	ff010113          	addi	sp,sp,-16
    800053d4:	00813423          	sd	s0,8(sp)
    800053d8:	01010413          	addi	s0,sp,16
    800053dc:	300027f3          	csrr	a5,mstatus
    800053e0:	ffffe737          	lui	a4,0xffffe
    800053e4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff35af>
    800053e8:	00e7f7b3          	and	a5,a5,a4
    800053ec:	00001737          	lui	a4,0x1
    800053f0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800053f4:	00e7e7b3          	or	a5,a5,a4
    800053f8:	30079073          	csrw	mstatus,a5
    800053fc:	00000797          	auipc	a5,0x0
    80005400:	16078793          	addi	a5,a5,352 # 8000555c <system_main>
    80005404:	34179073          	csrw	mepc,a5
    80005408:	00000793          	li	a5,0
    8000540c:	18079073          	csrw	satp,a5
    80005410:	000107b7          	lui	a5,0x10
    80005414:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005418:	30279073          	csrw	medeleg,a5
    8000541c:	30379073          	csrw	mideleg,a5
    80005420:	104027f3          	csrr	a5,sie
    80005424:	2227e793          	ori	a5,a5,546
    80005428:	10479073          	csrw	sie,a5
    8000542c:	fff00793          	li	a5,-1
    80005430:	00a7d793          	srli	a5,a5,0xa
    80005434:	3b079073          	csrw	pmpaddr0,a5
    80005438:	00f00793          	li	a5,15
    8000543c:	3a079073          	csrw	pmpcfg0,a5
    80005440:	f14027f3          	csrr	a5,mhartid
    80005444:	0200c737          	lui	a4,0x200c
    80005448:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000544c:	0007869b          	sext.w	a3,a5
    80005450:	00269713          	slli	a4,a3,0x2
    80005454:	000f4637          	lui	a2,0xf4
    80005458:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000545c:	00d70733          	add	a4,a4,a3
    80005460:	0037979b          	slliw	a5,a5,0x3
    80005464:	020046b7          	lui	a3,0x2004
    80005468:	00d787b3          	add	a5,a5,a3
    8000546c:	00c585b3          	add	a1,a1,a2
    80005470:	00371693          	slli	a3,a4,0x3
    80005474:	00005717          	auipc	a4,0x5
    80005478:	b7c70713          	addi	a4,a4,-1156 # 80009ff0 <timer_scratch>
    8000547c:	00b7b023          	sd	a1,0(a5)
    80005480:	00d70733          	add	a4,a4,a3
    80005484:	00f73c23          	sd	a5,24(a4)
    80005488:	02c73023          	sd	a2,32(a4)
    8000548c:	34071073          	csrw	mscratch,a4
    80005490:	00000797          	auipc	a5,0x0
    80005494:	6e078793          	addi	a5,a5,1760 # 80005b70 <timervec>
    80005498:	30579073          	csrw	mtvec,a5
    8000549c:	300027f3          	csrr	a5,mstatus
    800054a0:	0087e793          	ori	a5,a5,8
    800054a4:	30079073          	csrw	mstatus,a5
    800054a8:	304027f3          	csrr	a5,mie
    800054ac:	0807e793          	ori	a5,a5,128
    800054b0:	30479073          	csrw	mie,a5
    800054b4:	f14027f3          	csrr	a5,mhartid
    800054b8:	0007879b          	sext.w	a5,a5
    800054bc:	00078213          	mv	tp,a5
    800054c0:	30200073          	mret
    800054c4:	00813403          	ld	s0,8(sp)
    800054c8:	01010113          	addi	sp,sp,16
    800054cc:	00008067          	ret

00000000800054d0 <timerinit>:
    800054d0:	ff010113          	addi	sp,sp,-16
    800054d4:	00813423          	sd	s0,8(sp)
    800054d8:	01010413          	addi	s0,sp,16
    800054dc:	f14027f3          	csrr	a5,mhartid
    800054e0:	0200c737          	lui	a4,0x200c
    800054e4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800054e8:	0007869b          	sext.w	a3,a5
    800054ec:	00269713          	slli	a4,a3,0x2
    800054f0:	000f4637          	lui	a2,0xf4
    800054f4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800054f8:	00d70733          	add	a4,a4,a3
    800054fc:	0037979b          	slliw	a5,a5,0x3
    80005500:	020046b7          	lui	a3,0x2004
    80005504:	00d787b3          	add	a5,a5,a3
    80005508:	00c585b3          	add	a1,a1,a2
    8000550c:	00371693          	slli	a3,a4,0x3
    80005510:	00005717          	auipc	a4,0x5
    80005514:	ae070713          	addi	a4,a4,-1312 # 80009ff0 <timer_scratch>
    80005518:	00b7b023          	sd	a1,0(a5)
    8000551c:	00d70733          	add	a4,a4,a3
    80005520:	00f73c23          	sd	a5,24(a4)
    80005524:	02c73023          	sd	a2,32(a4)
    80005528:	34071073          	csrw	mscratch,a4
    8000552c:	00000797          	auipc	a5,0x0
    80005530:	64478793          	addi	a5,a5,1604 # 80005b70 <timervec>
    80005534:	30579073          	csrw	mtvec,a5
    80005538:	300027f3          	csrr	a5,mstatus
    8000553c:	0087e793          	ori	a5,a5,8
    80005540:	30079073          	csrw	mstatus,a5
    80005544:	304027f3          	csrr	a5,mie
    80005548:	0807e793          	ori	a5,a5,128
    8000554c:	30479073          	csrw	mie,a5
    80005550:	00813403          	ld	s0,8(sp)
    80005554:	01010113          	addi	sp,sp,16
    80005558:	00008067          	ret

000000008000555c <system_main>:
    8000555c:	fe010113          	addi	sp,sp,-32
    80005560:	00813823          	sd	s0,16(sp)
    80005564:	00913423          	sd	s1,8(sp)
    80005568:	00113c23          	sd	ra,24(sp)
    8000556c:	02010413          	addi	s0,sp,32
    80005570:	00000097          	auipc	ra,0x0
    80005574:	0c4080e7          	jalr	196(ra) # 80005634 <cpuid>
    80005578:	00005497          	auipc	s1,0x5
    8000557c:	9c848493          	addi	s1,s1,-1592 # 80009f40 <started>
    80005580:	02050263          	beqz	a0,800055a4 <system_main+0x48>
    80005584:	0004a783          	lw	a5,0(s1)
    80005588:	0007879b          	sext.w	a5,a5
    8000558c:	fe078ce3          	beqz	a5,80005584 <system_main+0x28>
    80005590:	0ff0000f          	fence
    80005594:	00003517          	auipc	a0,0x3
    80005598:	e0450513          	addi	a0,a0,-508 # 80008398 <CONSOLE_STATUS+0x388>
    8000559c:	00001097          	auipc	ra,0x1
    800055a0:	a70080e7          	jalr	-1424(ra) # 8000600c <panic>
    800055a4:	00001097          	auipc	ra,0x1
    800055a8:	9c4080e7          	jalr	-1596(ra) # 80005f68 <consoleinit>
    800055ac:	00001097          	auipc	ra,0x1
    800055b0:	150080e7          	jalr	336(ra) # 800066fc <printfinit>
    800055b4:	00003517          	auipc	a0,0x3
    800055b8:	bb450513          	addi	a0,a0,-1100 # 80008168 <CONSOLE_STATUS+0x158>
    800055bc:	00001097          	auipc	ra,0x1
    800055c0:	aac080e7          	jalr	-1364(ra) # 80006068 <__printf>
    800055c4:	00003517          	auipc	a0,0x3
    800055c8:	da450513          	addi	a0,a0,-604 # 80008368 <CONSOLE_STATUS+0x358>
    800055cc:	00001097          	auipc	ra,0x1
    800055d0:	a9c080e7          	jalr	-1380(ra) # 80006068 <__printf>
    800055d4:	00003517          	auipc	a0,0x3
    800055d8:	b9450513          	addi	a0,a0,-1132 # 80008168 <CONSOLE_STATUS+0x158>
    800055dc:	00001097          	auipc	ra,0x1
    800055e0:	a8c080e7          	jalr	-1396(ra) # 80006068 <__printf>
    800055e4:	00001097          	auipc	ra,0x1
    800055e8:	4a4080e7          	jalr	1188(ra) # 80006a88 <kinit>
    800055ec:	00000097          	auipc	ra,0x0
    800055f0:	148080e7          	jalr	328(ra) # 80005734 <trapinit>
    800055f4:	00000097          	auipc	ra,0x0
    800055f8:	16c080e7          	jalr	364(ra) # 80005760 <trapinithart>
    800055fc:	00000097          	auipc	ra,0x0
    80005600:	5b4080e7          	jalr	1460(ra) # 80005bb0 <plicinit>
    80005604:	00000097          	auipc	ra,0x0
    80005608:	5d4080e7          	jalr	1492(ra) # 80005bd8 <plicinithart>
    8000560c:	00000097          	auipc	ra,0x0
    80005610:	078080e7          	jalr	120(ra) # 80005684 <userinit>
    80005614:	0ff0000f          	fence
    80005618:	00100793          	li	a5,1
    8000561c:	00003517          	auipc	a0,0x3
    80005620:	d6450513          	addi	a0,a0,-668 # 80008380 <CONSOLE_STATUS+0x370>
    80005624:	00f4a023          	sw	a5,0(s1)
    80005628:	00001097          	auipc	ra,0x1
    8000562c:	a40080e7          	jalr	-1472(ra) # 80006068 <__printf>
    80005630:	0000006f          	j	80005630 <system_main+0xd4>

0000000080005634 <cpuid>:
    80005634:	ff010113          	addi	sp,sp,-16
    80005638:	00813423          	sd	s0,8(sp)
    8000563c:	01010413          	addi	s0,sp,16
    80005640:	00020513          	mv	a0,tp
    80005644:	00813403          	ld	s0,8(sp)
    80005648:	0005051b          	sext.w	a0,a0
    8000564c:	01010113          	addi	sp,sp,16
    80005650:	00008067          	ret

0000000080005654 <mycpu>:
    80005654:	ff010113          	addi	sp,sp,-16
    80005658:	00813423          	sd	s0,8(sp)
    8000565c:	01010413          	addi	s0,sp,16
    80005660:	00020793          	mv	a5,tp
    80005664:	00813403          	ld	s0,8(sp)
    80005668:	0007879b          	sext.w	a5,a5
    8000566c:	00779793          	slli	a5,a5,0x7
    80005670:	00006517          	auipc	a0,0x6
    80005674:	9b050513          	addi	a0,a0,-1616 # 8000b020 <cpus>
    80005678:	00f50533          	add	a0,a0,a5
    8000567c:	01010113          	addi	sp,sp,16
    80005680:	00008067          	ret

0000000080005684 <userinit>:
    80005684:	ff010113          	addi	sp,sp,-16
    80005688:	00813423          	sd	s0,8(sp)
    8000568c:	01010413          	addi	s0,sp,16
    80005690:	00813403          	ld	s0,8(sp)
    80005694:	01010113          	addi	sp,sp,16
    80005698:	ffffc317          	auipc	t1,0xffffc
    8000569c:	4d030067          	jr	1232(t1) # 80001b68 <main>

00000000800056a0 <either_copyout>:
    800056a0:	ff010113          	addi	sp,sp,-16
    800056a4:	00813023          	sd	s0,0(sp)
    800056a8:	00113423          	sd	ra,8(sp)
    800056ac:	01010413          	addi	s0,sp,16
    800056b0:	02051663          	bnez	a0,800056dc <either_copyout+0x3c>
    800056b4:	00058513          	mv	a0,a1
    800056b8:	00060593          	mv	a1,a2
    800056bc:	0006861b          	sext.w	a2,a3
    800056c0:	00002097          	auipc	ra,0x2
    800056c4:	c54080e7          	jalr	-940(ra) # 80007314 <__memmove>
    800056c8:	00813083          	ld	ra,8(sp)
    800056cc:	00013403          	ld	s0,0(sp)
    800056d0:	00000513          	li	a0,0
    800056d4:	01010113          	addi	sp,sp,16
    800056d8:	00008067          	ret
    800056dc:	00003517          	auipc	a0,0x3
    800056e0:	ce450513          	addi	a0,a0,-796 # 800083c0 <CONSOLE_STATUS+0x3b0>
    800056e4:	00001097          	auipc	ra,0x1
    800056e8:	928080e7          	jalr	-1752(ra) # 8000600c <panic>

00000000800056ec <either_copyin>:
    800056ec:	ff010113          	addi	sp,sp,-16
    800056f0:	00813023          	sd	s0,0(sp)
    800056f4:	00113423          	sd	ra,8(sp)
    800056f8:	01010413          	addi	s0,sp,16
    800056fc:	02059463          	bnez	a1,80005724 <either_copyin+0x38>
    80005700:	00060593          	mv	a1,a2
    80005704:	0006861b          	sext.w	a2,a3
    80005708:	00002097          	auipc	ra,0x2
    8000570c:	c0c080e7          	jalr	-1012(ra) # 80007314 <__memmove>
    80005710:	00813083          	ld	ra,8(sp)
    80005714:	00013403          	ld	s0,0(sp)
    80005718:	00000513          	li	a0,0
    8000571c:	01010113          	addi	sp,sp,16
    80005720:	00008067          	ret
    80005724:	00003517          	auipc	a0,0x3
    80005728:	cc450513          	addi	a0,a0,-828 # 800083e8 <CONSOLE_STATUS+0x3d8>
    8000572c:	00001097          	auipc	ra,0x1
    80005730:	8e0080e7          	jalr	-1824(ra) # 8000600c <panic>

0000000080005734 <trapinit>:
    80005734:	ff010113          	addi	sp,sp,-16
    80005738:	00813423          	sd	s0,8(sp)
    8000573c:	01010413          	addi	s0,sp,16
    80005740:	00813403          	ld	s0,8(sp)
    80005744:	00003597          	auipc	a1,0x3
    80005748:	ccc58593          	addi	a1,a1,-820 # 80008410 <CONSOLE_STATUS+0x400>
    8000574c:	00006517          	auipc	a0,0x6
    80005750:	95450513          	addi	a0,a0,-1708 # 8000b0a0 <tickslock>
    80005754:	01010113          	addi	sp,sp,16
    80005758:	00001317          	auipc	t1,0x1
    8000575c:	5c030067          	jr	1472(t1) # 80006d18 <initlock>

0000000080005760 <trapinithart>:
    80005760:	ff010113          	addi	sp,sp,-16
    80005764:	00813423          	sd	s0,8(sp)
    80005768:	01010413          	addi	s0,sp,16
    8000576c:	00000797          	auipc	a5,0x0
    80005770:	2f478793          	addi	a5,a5,756 # 80005a60 <kernelvec>
    80005774:	10579073          	csrw	stvec,a5
    80005778:	00813403          	ld	s0,8(sp)
    8000577c:	01010113          	addi	sp,sp,16
    80005780:	00008067          	ret

0000000080005784 <usertrap>:
    80005784:	ff010113          	addi	sp,sp,-16
    80005788:	00813423          	sd	s0,8(sp)
    8000578c:	01010413          	addi	s0,sp,16
    80005790:	00813403          	ld	s0,8(sp)
    80005794:	01010113          	addi	sp,sp,16
    80005798:	00008067          	ret

000000008000579c <usertrapret>:
    8000579c:	ff010113          	addi	sp,sp,-16
    800057a0:	00813423          	sd	s0,8(sp)
    800057a4:	01010413          	addi	s0,sp,16
    800057a8:	00813403          	ld	s0,8(sp)
    800057ac:	01010113          	addi	sp,sp,16
    800057b0:	00008067          	ret

00000000800057b4 <kerneltrap>:
    800057b4:	fe010113          	addi	sp,sp,-32
    800057b8:	00813823          	sd	s0,16(sp)
    800057bc:	00113c23          	sd	ra,24(sp)
    800057c0:	00913423          	sd	s1,8(sp)
    800057c4:	02010413          	addi	s0,sp,32
    800057c8:	142025f3          	csrr	a1,scause
    800057cc:	100027f3          	csrr	a5,sstatus
    800057d0:	0027f793          	andi	a5,a5,2
    800057d4:	10079c63          	bnez	a5,800058ec <kerneltrap+0x138>
    800057d8:	142027f3          	csrr	a5,scause
    800057dc:	0207ce63          	bltz	a5,80005818 <kerneltrap+0x64>
    800057e0:	00003517          	auipc	a0,0x3
    800057e4:	c7850513          	addi	a0,a0,-904 # 80008458 <CONSOLE_STATUS+0x448>
    800057e8:	00001097          	auipc	ra,0x1
    800057ec:	880080e7          	jalr	-1920(ra) # 80006068 <__printf>
    800057f0:	141025f3          	csrr	a1,sepc
    800057f4:	14302673          	csrr	a2,stval
    800057f8:	00003517          	auipc	a0,0x3
    800057fc:	c7050513          	addi	a0,a0,-912 # 80008468 <CONSOLE_STATUS+0x458>
    80005800:	00001097          	auipc	ra,0x1
    80005804:	868080e7          	jalr	-1944(ra) # 80006068 <__printf>
    80005808:	00003517          	auipc	a0,0x3
    8000580c:	c7850513          	addi	a0,a0,-904 # 80008480 <CONSOLE_STATUS+0x470>
    80005810:	00000097          	auipc	ra,0x0
    80005814:	7fc080e7          	jalr	2044(ra) # 8000600c <panic>
    80005818:	0ff7f713          	andi	a4,a5,255
    8000581c:	00900693          	li	a3,9
    80005820:	04d70063          	beq	a4,a3,80005860 <kerneltrap+0xac>
    80005824:	fff00713          	li	a4,-1
    80005828:	03f71713          	slli	a4,a4,0x3f
    8000582c:	00170713          	addi	a4,a4,1
    80005830:	fae798e3          	bne	a5,a4,800057e0 <kerneltrap+0x2c>
    80005834:	00000097          	auipc	ra,0x0
    80005838:	e00080e7          	jalr	-512(ra) # 80005634 <cpuid>
    8000583c:	06050663          	beqz	a0,800058a8 <kerneltrap+0xf4>
    80005840:	144027f3          	csrr	a5,sip
    80005844:	ffd7f793          	andi	a5,a5,-3
    80005848:	14479073          	csrw	sip,a5
    8000584c:	01813083          	ld	ra,24(sp)
    80005850:	01013403          	ld	s0,16(sp)
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	02010113          	addi	sp,sp,32
    8000585c:	00008067          	ret
    80005860:	00000097          	auipc	ra,0x0
    80005864:	3c4080e7          	jalr	964(ra) # 80005c24 <plic_claim>
    80005868:	00a00793          	li	a5,10
    8000586c:	00050493          	mv	s1,a0
    80005870:	06f50863          	beq	a0,a5,800058e0 <kerneltrap+0x12c>
    80005874:	fc050ce3          	beqz	a0,8000584c <kerneltrap+0x98>
    80005878:	00050593          	mv	a1,a0
    8000587c:	00003517          	auipc	a0,0x3
    80005880:	bbc50513          	addi	a0,a0,-1092 # 80008438 <CONSOLE_STATUS+0x428>
    80005884:	00000097          	auipc	ra,0x0
    80005888:	7e4080e7          	jalr	2020(ra) # 80006068 <__printf>
    8000588c:	01013403          	ld	s0,16(sp)
    80005890:	01813083          	ld	ra,24(sp)
    80005894:	00048513          	mv	a0,s1
    80005898:	00813483          	ld	s1,8(sp)
    8000589c:	02010113          	addi	sp,sp,32
    800058a0:	00000317          	auipc	t1,0x0
    800058a4:	3bc30067          	jr	956(t1) # 80005c5c <plic_complete>
    800058a8:	00005517          	auipc	a0,0x5
    800058ac:	7f850513          	addi	a0,a0,2040 # 8000b0a0 <tickslock>
    800058b0:	00001097          	auipc	ra,0x1
    800058b4:	48c080e7          	jalr	1164(ra) # 80006d3c <acquire>
    800058b8:	00004717          	auipc	a4,0x4
    800058bc:	68c70713          	addi	a4,a4,1676 # 80009f44 <ticks>
    800058c0:	00072783          	lw	a5,0(a4)
    800058c4:	00005517          	auipc	a0,0x5
    800058c8:	7dc50513          	addi	a0,a0,2012 # 8000b0a0 <tickslock>
    800058cc:	0017879b          	addiw	a5,a5,1
    800058d0:	00f72023          	sw	a5,0(a4)
    800058d4:	00001097          	auipc	ra,0x1
    800058d8:	534080e7          	jalr	1332(ra) # 80006e08 <release>
    800058dc:	f65ff06f          	j	80005840 <kerneltrap+0x8c>
    800058e0:	00001097          	auipc	ra,0x1
    800058e4:	090080e7          	jalr	144(ra) # 80006970 <uartintr>
    800058e8:	fa5ff06f          	j	8000588c <kerneltrap+0xd8>
    800058ec:	00003517          	auipc	a0,0x3
    800058f0:	b2c50513          	addi	a0,a0,-1236 # 80008418 <CONSOLE_STATUS+0x408>
    800058f4:	00000097          	auipc	ra,0x0
    800058f8:	718080e7          	jalr	1816(ra) # 8000600c <panic>

00000000800058fc <clockintr>:
    800058fc:	fe010113          	addi	sp,sp,-32
    80005900:	00813823          	sd	s0,16(sp)
    80005904:	00913423          	sd	s1,8(sp)
    80005908:	00113c23          	sd	ra,24(sp)
    8000590c:	02010413          	addi	s0,sp,32
    80005910:	00005497          	auipc	s1,0x5
    80005914:	79048493          	addi	s1,s1,1936 # 8000b0a0 <tickslock>
    80005918:	00048513          	mv	a0,s1
    8000591c:	00001097          	auipc	ra,0x1
    80005920:	420080e7          	jalr	1056(ra) # 80006d3c <acquire>
    80005924:	00004717          	auipc	a4,0x4
    80005928:	62070713          	addi	a4,a4,1568 # 80009f44 <ticks>
    8000592c:	00072783          	lw	a5,0(a4)
    80005930:	01013403          	ld	s0,16(sp)
    80005934:	01813083          	ld	ra,24(sp)
    80005938:	00048513          	mv	a0,s1
    8000593c:	0017879b          	addiw	a5,a5,1
    80005940:	00813483          	ld	s1,8(sp)
    80005944:	00f72023          	sw	a5,0(a4)
    80005948:	02010113          	addi	sp,sp,32
    8000594c:	00001317          	auipc	t1,0x1
    80005950:	4bc30067          	jr	1212(t1) # 80006e08 <release>

0000000080005954 <devintr>:
    80005954:	142027f3          	csrr	a5,scause
    80005958:	00000513          	li	a0,0
    8000595c:	0007c463          	bltz	a5,80005964 <devintr+0x10>
    80005960:	00008067          	ret
    80005964:	fe010113          	addi	sp,sp,-32
    80005968:	00813823          	sd	s0,16(sp)
    8000596c:	00113c23          	sd	ra,24(sp)
    80005970:	00913423          	sd	s1,8(sp)
    80005974:	02010413          	addi	s0,sp,32
    80005978:	0ff7f713          	andi	a4,a5,255
    8000597c:	00900693          	li	a3,9
    80005980:	04d70c63          	beq	a4,a3,800059d8 <devintr+0x84>
    80005984:	fff00713          	li	a4,-1
    80005988:	03f71713          	slli	a4,a4,0x3f
    8000598c:	00170713          	addi	a4,a4,1
    80005990:	00e78c63          	beq	a5,a4,800059a8 <devintr+0x54>
    80005994:	01813083          	ld	ra,24(sp)
    80005998:	01013403          	ld	s0,16(sp)
    8000599c:	00813483          	ld	s1,8(sp)
    800059a0:	02010113          	addi	sp,sp,32
    800059a4:	00008067          	ret
    800059a8:	00000097          	auipc	ra,0x0
    800059ac:	c8c080e7          	jalr	-884(ra) # 80005634 <cpuid>
    800059b0:	06050663          	beqz	a0,80005a1c <devintr+0xc8>
    800059b4:	144027f3          	csrr	a5,sip
    800059b8:	ffd7f793          	andi	a5,a5,-3
    800059bc:	14479073          	csrw	sip,a5
    800059c0:	01813083          	ld	ra,24(sp)
    800059c4:	01013403          	ld	s0,16(sp)
    800059c8:	00813483          	ld	s1,8(sp)
    800059cc:	00200513          	li	a0,2
    800059d0:	02010113          	addi	sp,sp,32
    800059d4:	00008067          	ret
    800059d8:	00000097          	auipc	ra,0x0
    800059dc:	24c080e7          	jalr	588(ra) # 80005c24 <plic_claim>
    800059e0:	00a00793          	li	a5,10
    800059e4:	00050493          	mv	s1,a0
    800059e8:	06f50663          	beq	a0,a5,80005a54 <devintr+0x100>
    800059ec:	00100513          	li	a0,1
    800059f0:	fa0482e3          	beqz	s1,80005994 <devintr+0x40>
    800059f4:	00048593          	mv	a1,s1
    800059f8:	00003517          	auipc	a0,0x3
    800059fc:	a4050513          	addi	a0,a0,-1472 # 80008438 <CONSOLE_STATUS+0x428>
    80005a00:	00000097          	auipc	ra,0x0
    80005a04:	668080e7          	jalr	1640(ra) # 80006068 <__printf>
    80005a08:	00048513          	mv	a0,s1
    80005a0c:	00000097          	auipc	ra,0x0
    80005a10:	250080e7          	jalr	592(ra) # 80005c5c <plic_complete>
    80005a14:	00100513          	li	a0,1
    80005a18:	f7dff06f          	j	80005994 <devintr+0x40>
    80005a1c:	00005517          	auipc	a0,0x5
    80005a20:	68450513          	addi	a0,a0,1668 # 8000b0a0 <tickslock>
    80005a24:	00001097          	auipc	ra,0x1
    80005a28:	318080e7          	jalr	792(ra) # 80006d3c <acquire>
    80005a2c:	00004717          	auipc	a4,0x4
    80005a30:	51870713          	addi	a4,a4,1304 # 80009f44 <ticks>
    80005a34:	00072783          	lw	a5,0(a4)
    80005a38:	00005517          	auipc	a0,0x5
    80005a3c:	66850513          	addi	a0,a0,1640 # 8000b0a0 <tickslock>
    80005a40:	0017879b          	addiw	a5,a5,1
    80005a44:	00f72023          	sw	a5,0(a4)
    80005a48:	00001097          	auipc	ra,0x1
    80005a4c:	3c0080e7          	jalr	960(ra) # 80006e08 <release>
    80005a50:	f65ff06f          	j	800059b4 <devintr+0x60>
    80005a54:	00001097          	auipc	ra,0x1
    80005a58:	f1c080e7          	jalr	-228(ra) # 80006970 <uartintr>
    80005a5c:	fadff06f          	j	80005a08 <devintr+0xb4>

0000000080005a60 <kernelvec>:
    80005a60:	f0010113          	addi	sp,sp,-256
    80005a64:	00113023          	sd	ra,0(sp)
    80005a68:	00213423          	sd	sp,8(sp)
    80005a6c:	00313823          	sd	gp,16(sp)
    80005a70:	00413c23          	sd	tp,24(sp)
    80005a74:	02513023          	sd	t0,32(sp)
    80005a78:	02613423          	sd	t1,40(sp)
    80005a7c:	02713823          	sd	t2,48(sp)
    80005a80:	02813c23          	sd	s0,56(sp)
    80005a84:	04913023          	sd	s1,64(sp)
    80005a88:	04a13423          	sd	a0,72(sp)
    80005a8c:	04b13823          	sd	a1,80(sp)
    80005a90:	04c13c23          	sd	a2,88(sp)
    80005a94:	06d13023          	sd	a3,96(sp)
    80005a98:	06e13423          	sd	a4,104(sp)
    80005a9c:	06f13823          	sd	a5,112(sp)
    80005aa0:	07013c23          	sd	a6,120(sp)
    80005aa4:	09113023          	sd	a7,128(sp)
    80005aa8:	09213423          	sd	s2,136(sp)
    80005aac:	09313823          	sd	s3,144(sp)
    80005ab0:	09413c23          	sd	s4,152(sp)
    80005ab4:	0b513023          	sd	s5,160(sp)
    80005ab8:	0b613423          	sd	s6,168(sp)
    80005abc:	0b713823          	sd	s7,176(sp)
    80005ac0:	0b813c23          	sd	s8,184(sp)
    80005ac4:	0d913023          	sd	s9,192(sp)
    80005ac8:	0da13423          	sd	s10,200(sp)
    80005acc:	0db13823          	sd	s11,208(sp)
    80005ad0:	0dc13c23          	sd	t3,216(sp)
    80005ad4:	0fd13023          	sd	t4,224(sp)
    80005ad8:	0fe13423          	sd	t5,232(sp)
    80005adc:	0ff13823          	sd	t6,240(sp)
    80005ae0:	cd5ff0ef          	jal	ra,800057b4 <kerneltrap>
    80005ae4:	00013083          	ld	ra,0(sp)
    80005ae8:	00813103          	ld	sp,8(sp)
    80005aec:	01013183          	ld	gp,16(sp)
    80005af0:	02013283          	ld	t0,32(sp)
    80005af4:	02813303          	ld	t1,40(sp)
    80005af8:	03013383          	ld	t2,48(sp)
    80005afc:	03813403          	ld	s0,56(sp)
    80005b00:	04013483          	ld	s1,64(sp)
    80005b04:	04813503          	ld	a0,72(sp)
    80005b08:	05013583          	ld	a1,80(sp)
    80005b0c:	05813603          	ld	a2,88(sp)
    80005b10:	06013683          	ld	a3,96(sp)
    80005b14:	06813703          	ld	a4,104(sp)
    80005b18:	07013783          	ld	a5,112(sp)
    80005b1c:	07813803          	ld	a6,120(sp)
    80005b20:	08013883          	ld	a7,128(sp)
    80005b24:	08813903          	ld	s2,136(sp)
    80005b28:	09013983          	ld	s3,144(sp)
    80005b2c:	09813a03          	ld	s4,152(sp)
    80005b30:	0a013a83          	ld	s5,160(sp)
    80005b34:	0a813b03          	ld	s6,168(sp)
    80005b38:	0b013b83          	ld	s7,176(sp)
    80005b3c:	0b813c03          	ld	s8,184(sp)
    80005b40:	0c013c83          	ld	s9,192(sp)
    80005b44:	0c813d03          	ld	s10,200(sp)
    80005b48:	0d013d83          	ld	s11,208(sp)
    80005b4c:	0d813e03          	ld	t3,216(sp)
    80005b50:	0e013e83          	ld	t4,224(sp)
    80005b54:	0e813f03          	ld	t5,232(sp)
    80005b58:	0f013f83          	ld	t6,240(sp)
    80005b5c:	10010113          	addi	sp,sp,256
    80005b60:	10200073          	sret
    80005b64:	00000013          	nop
    80005b68:	00000013          	nop
    80005b6c:	00000013          	nop

0000000080005b70 <timervec>:
    80005b70:	34051573          	csrrw	a0,mscratch,a0
    80005b74:	00b53023          	sd	a1,0(a0)
    80005b78:	00c53423          	sd	a2,8(a0)
    80005b7c:	00d53823          	sd	a3,16(a0)
    80005b80:	01853583          	ld	a1,24(a0)
    80005b84:	02053603          	ld	a2,32(a0)
    80005b88:	0005b683          	ld	a3,0(a1)
    80005b8c:	00c686b3          	add	a3,a3,a2
    80005b90:	00d5b023          	sd	a3,0(a1)
    80005b94:	00200593          	li	a1,2
    80005b98:	14459073          	csrw	sip,a1
    80005b9c:	01053683          	ld	a3,16(a0)
    80005ba0:	00853603          	ld	a2,8(a0)
    80005ba4:	00053583          	ld	a1,0(a0)
    80005ba8:	34051573          	csrrw	a0,mscratch,a0
    80005bac:	30200073          	mret

0000000080005bb0 <plicinit>:
    80005bb0:	ff010113          	addi	sp,sp,-16
    80005bb4:	00813423          	sd	s0,8(sp)
    80005bb8:	01010413          	addi	s0,sp,16
    80005bbc:	00813403          	ld	s0,8(sp)
    80005bc0:	0c0007b7          	lui	a5,0xc000
    80005bc4:	00100713          	li	a4,1
    80005bc8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005bcc:	00e7a223          	sw	a4,4(a5)
    80005bd0:	01010113          	addi	sp,sp,16
    80005bd4:	00008067          	ret

0000000080005bd8 <plicinithart>:
    80005bd8:	ff010113          	addi	sp,sp,-16
    80005bdc:	00813023          	sd	s0,0(sp)
    80005be0:	00113423          	sd	ra,8(sp)
    80005be4:	01010413          	addi	s0,sp,16
    80005be8:	00000097          	auipc	ra,0x0
    80005bec:	a4c080e7          	jalr	-1460(ra) # 80005634 <cpuid>
    80005bf0:	0085171b          	slliw	a4,a0,0x8
    80005bf4:	0c0027b7          	lui	a5,0xc002
    80005bf8:	00e787b3          	add	a5,a5,a4
    80005bfc:	40200713          	li	a4,1026
    80005c00:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005c04:	00813083          	ld	ra,8(sp)
    80005c08:	00013403          	ld	s0,0(sp)
    80005c0c:	00d5151b          	slliw	a0,a0,0xd
    80005c10:	0c2017b7          	lui	a5,0xc201
    80005c14:	00a78533          	add	a0,a5,a0
    80005c18:	00052023          	sw	zero,0(a0)
    80005c1c:	01010113          	addi	sp,sp,16
    80005c20:	00008067          	ret

0000000080005c24 <plic_claim>:
    80005c24:	ff010113          	addi	sp,sp,-16
    80005c28:	00813023          	sd	s0,0(sp)
    80005c2c:	00113423          	sd	ra,8(sp)
    80005c30:	01010413          	addi	s0,sp,16
    80005c34:	00000097          	auipc	ra,0x0
    80005c38:	a00080e7          	jalr	-1536(ra) # 80005634 <cpuid>
    80005c3c:	00813083          	ld	ra,8(sp)
    80005c40:	00013403          	ld	s0,0(sp)
    80005c44:	00d5151b          	slliw	a0,a0,0xd
    80005c48:	0c2017b7          	lui	a5,0xc201
    80005c4c:	00a78533          	add	a0,a5,a0
    80005c50:	00452503          	lw	a0,4(a0)
    80005c54:	01010113          	addi	sp,sp,16
    80005c58:	00008067          	ret

0000000080005c5c <plic_complete>:
    80005c5c:	fe010113          	addi	sp,sp,-32
    80005c60:	00813823          	sd	s0,16(sp)
    80005c64:	00913423          	sd	s1,8(sp)
    80005c68:	00113c23          	sd	ra,24(sp)
    80005c6c:	02010413          	addi	s0,sp,32
    80005c70:	00050493          	mv	s1,a0
    80005c74:	00000097          	auipc	ra,0x0
    80005c78:	9c0080e7          	jalr	-1600(ra) # 80005634 <cpuid>
    80005c7c:	01813083          	ld	ra,24(sp)
    80005c80:	01013403          	ld	s0,16(sp)
    80005c84:	00d5179b          	slliw	a5,a0,0xd
    80005c88:	0c201737          	lui	a4,0xc201
    80005c8c:	00f707b3          	add	a5,a4,a5
    80005c90:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005c94:	00813483          	ld	s1,8(sp)
    80005c98:	02010113          	addi	sp,sp,32
    80005c9c:	00008067          	ret

0000000080005ca0 <consolewrite>:
    80005ca0:	fb010113          	addi	sp,sp,-80
    80005ca4:	04813023          	sd	s0,64(sp)
    80005ca8:	04113423          	sd	ra,72(sp)
    80005cac:	02913c23          	sd	s1,56(sp)
    80005cb0:	03213823          	sd	s2,48(sp)
    80005cb4:	03313423          	sd	s3,40(sp)
    80005cb8:	03413023          	sd	s4,32(sp)
    80005cbc:	01513c23          	sd	s5,24(sp)
    80005cc0:	05010413          	addi	s0,sp,80
    80005cc4:	06c05c63          	blez	a2,80005d3c <consolewrite+0x9c>
    80005cc8:	00060993          	mv	s3,a2
    80005ccc:	00050a13          	mv	s4,a0
    80005cd0:	00058493          	mv	s1,a1
    80005cd4:	00000913          	li	s2,0
    80005cd8:	fff00a93          	li	s5,-1
    80005cdc:	01c0006f          	j	80005cf8 <consolewrite+0x58>
    80005ce0:	fbf44503          	lbu	a0,-65(s0)
    80005ce4:	0019091b          	addiw	s2,s2,1
    80005ce8:	00148493          	addi	s1,s1,1
    80005cec:	00001097          	auipc	ra,0x1
    80005cf0:	a9c080e7          	jalr	-1380(ra) # 80006788 <uartputc>
    80005cf4:	03298063          	beq	s3,s2,80005d14 <consolewrite+0x74>
    80005cf8:	00048613          	mv	a2,s1
    80005cfc:	00100693          	li	a3,1
    80005d00:	000a0593          	mv	a1,s4
    80005d04:	fbf40513          	addi	a0,s0,-65
    80005d08:	00000097          	auipc	ra,0x0
    80005d0c:	9e4080e7          	jalr	-1564(ra) # 800056ec <either_copyin>
    80005d10:	fd5518e3          	bne	a0,s5,80005ce0 <consolewrite+0x40>
    80005d14:	04813083          	ld	ra,72(sp)
    80005d18:	04013403          	ld	s0,64(sp)
    80005d1c:	03813483          	ld	s1,56(sp)
    80005d20:	02813983          	ld	s3,40(sp)
    80005d24:	02013a03          	ld	s4,32(sp)
    80005d28:	01813a83          	ld	s5,24(sp)
    80005d2c:	00090513          	mv	a0,s2
    80005d30:	03013903          	ld	s2,48(sp)
    80005d34:	05010113          	addi	sp,sp,80
    80005d38:	00008067          	ret
    80005d3c:	00000913          	li	s2,0
    80005d40:	fd5ff06f          	j	80005d14 <consolewrite+0x74>

0000000080005d44 <consoleread>:
    80005d44:	f9010113          	addi	sp,sp,-112
    80005d48:	06813023          	sd	s0,96(sp)
    80005d4c:	04913c23          	sd	s1,88(sp)
    80005d50:	05213823          	sd	s2,80(sp)
    80005d54:	05313423          	sd	s3,72(sp)
    80005d58:	05413023          	sd	s4,64(sp)
    80005d5c:	03513c23          	sd	s5,56(sp)
    80005d60:	03613823          	sd	s6,48(sp)
    80005d64:	03713423          	sd	s7,40(sp)
    80005d68:	03813023          	sd	s8,32(sp)
    80005d6c:	06113423          	sd	ra,104(sp)
    80005d70:	01913c23          	sd	s9,24(sp)
    80005d74:	07010413          	addi	s0,sp,112
    80005d78:	00060b93          	mv	s7,a2
    80005d7c:	00050913          	mv	s2,a0
    80005d80:	00058c13          	mv	s8,a1
    80005d84:	00060b1b          	sext.w	s6,a2
    80005d88:	00005497          	auipc	s1,0x5
    80005d8c:	34048493          	addi	s1,s1,832 # 8000b0c8 <cons>
    80005d90:	00400993          	li	s3,4
    80005d94:	fff00a13          	li	s4,-1
    80005d98:	00a00a93          	li	s5,10
    80005d9c:	05705e63          	blez	s7,80005df8 <consoleread+0xb4>
    80005da0:	09c4a703          	lw	a4,156(s1)
    80005da4:	0984a783          	lw	a5,152(s1)
    80005da8:	0007071b          	sext.w	a4,a4
    80005dac:	08e78463          	beq	a5,a4,80005e34 <consoleread+0xf0>
    80005db0:	07f7f713          	andi	a4,a5,127
    80005db4:	00e48733          	add	a4,s1,a4
    80005db8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005dbc:	0017869b          	addiw	a3,a5,1
    80005dc0:	08d4ac23          	sw	a3,152(s1)
    80005dc4:	00070c9b          	sext.w	s9,a4
    80005dc8:	0b370663          	beq	a4,s3,80005e74 <consoleread+0x130>
    80005dcc:	00100693          	li	a3,1
    80005dd0:	f9f40613          	addi	a2,s0,-97
    80005dd4:	000c0593          	mv	a1,s8
    80005dd8:	00090513          	mv	a0,s2
    80005ddc:	f8e40fa3          	sb	a4,-97(s0)
    80005de0:	00000097          	auipc	ra,0x0
    80005de4:	8c0080e7          	jalr	-1856(ra) # 800056a0 <either_copyout>
    80005de8:	01450863          	beq	a0,s4,80005df8 <consoleread+0xb4>
    80005dec:	001c0c13          	addi	s8,s8,1
    80005df0:	fffb8b9b          	addiw	s7,s7,-1
    80005df4:	fb5c94e3          	bne	s9,s5,80005d9c <consoleread+0x58>
    80005df8:	000b851b          	sext.w	a0,s7
    80005dfc:	06813083          	ld	ra,104(sp)
    80005e00:	06013403          	ld	s0,96(sp)
    80005e04:	05813483          	ld	s1,88(sp)
    80005e08:	05013903          	ld	s2,80(sp)
    80005e0c:	04813983          	ld	s3,72(sp)
    80005e10:	04013a03          	ld	s4,64(sp)
    80005e14:	03813a83          	ld	s5,56(sp)
    80005e18:	02813b83          	ld	s7,40(sp)
    80005e1c:	02013c03          	ld	s8,32(sp)
    80005e20:	01813c83          	ld	s9,24(sp)
    80005e24:	40ab053b          	subw	a0,s6,a0
    80005e28:	03013b03          	ld	s6,48(sp)
    80005e2c:	07010113          	addi	sp,sp,112
    80005e30:	00008067          	ret
    80005e34:	00001097          	auipc	ra,0x1
    80005e38:	1d8080e7          	jalr	472(ra) # 8000700c <push_on>
    80005e3c:	0984a703          	lw	a4,152(s1)
    80005e40:	09c4a783          	lw	a5,156(s1)
    80005e44:	0007879b          	sext.w	a5,a5
    80005e48:	fef70ce3          	beq	a4,a5,80005e40 <consoleread+0xfc>
    80005e4c:	00001097          	auipc	ra,0x1
    80005e50:	234080e7          	jalr	564(ra) # 80007080 <pop_on>
    80005e54:	0984a783          	lw	a5,152(s1)
    80005e58:	07f7f713          	andi	a4,a5,127
    80005e5c:	00e48733          	add	a4,s1,a4
    80005e60:	01874703          	lbu	a4,24(a4)
    80005e64:	0017869b          	addiw	a3,a5,1
    80005e68:	08d4ac23          	sw	a3,152(s1)
    80005e6c:	00070c9b          	sext.w	s9,a4
    80005e70:	f5371ee3          	bne	a4,s3,80005dcc <consoleread+0x88>
    80005e74:	000b851b          	sext.w	a0,s7
    80005e78:	f96bf2e3          	bgeu	s7,s6,80005dfc <consoleread+0xb8>
    80005e7c:	08f4ac23          	sw	a5,152(s1)
    80005e80:	f7dff06f          	j	80005dfc <consoleread+0xb8>

0000000080005e84 <consputc>:
    80005e84:	10000793          	li	a5,256
    80005e88:	00f50663          	beq	a0,a5,80005e94 <consputc+0x10>
    80005e8c:	00001317          	auipc	t1,0x1
    80005e90:	9f430067          	jr	-1548(t1) # 80006880 <uartputc_sync>
    80005e94:	ff010113          	addi	sp,sp,-16
    80005e98:	00113423          	sd	ra,8(sp)
    80005e9c:	00813023          	sd	s0,0(sp)
    80005ea0:	01010413          	addi	s0,sp,16
    80005ea4:	00800513          	li	a0,8
    80005ea8:	00001097          	auipc	ra,0x1
    80005eac:	9d8080e7          	jalr	-1576(ra) # 80006880 <uartputc_sync>
    80005eb0:	02000513          	li	a0,32
    80005eb4:	00001097          	auipc	ra,0x1
    80005eb8:	9cc080e7          	jalr	-1588(ra) # 80006880 <uartputc_sync>
    80005ebc:	00013403          	ld	s0,0(sp)
    80005ec0:	00813083          	ld	ra,8(sp)
    80005ec4:	00800513          	li	a0,8
    80005ec8:	01010113          	addi	sp,sp,16
    80005ecc:	00001317          	auipc	t1,0x1
    80005ed0:	9b430067          	jr	-1612(t1) # 80006880 <uartputc_sync>

0000000080005ed4 <consoleintr>:
    80005ed4:	fe010113          	addi	sp,sp,-32
    80005ed8:	00813823          	sd	s0,16(sp)
    80005edc:	00913423          	sd	s1,8(sp)
    80005ee0:	01213023          	sd	s2,0(sp)
    80005ee4:	00113c23          	sd	ra,24(sp)
    80005ee8:	02010413          	addi	s0,sp,32
    80005eec:	00005917          	auipc	s2,0x5
    80005ef0:	1dc90913          	addi	s2,s2,476 # 8000b0c8 <cons>
    80005ef4:	00050493          	mv	s1,a0
    80005ef8:	00090513          	mv	a0,s2
    80005efc:	00001097          	auipc	ra,0x1
    80005f00:	e40080e7          	jalr	-448(ra) # 80006d3c <acquire>
    80005f04:	02048c63          	beqz	s1,80005f3c <consoleintr+0x68>
    80005f08:	0a092783          	lw	a5,160(s2)
    80005f0c:	09892703          	lw	a4,152(s2)
    80005f10:	07f00693          	li	a3,127
    80005f14:	40e7873b          	subw	a4,a5,a4
    80005f18:	02e6e263          	bltu	a3,a4,80005f3c <consoleintr+0x68>
    80005f1c:	00d00713          	li	a4,13
    80005f20:	04e48063          	beq	s1,a4,80005f60 <consoleintr+0x8c>
    80005f24:	07f7f713          	andi	a4,a5,127
    80005f28:	00e90733          	add	a4,s2,a4
    80005f2c:	0017879b          	addiw	a5,a5,1
    80005f30:	0af92023          	sw	a5,160(s2)
    80005f34:	00970c23          	sb	s1,24(a4)
    80005f38:	08f92e23          	sw	a5,156(s2)
    80005f3c:	01013403          	ld	s0,16(sp)
    80005f40:	01813083          	ld	ra,24(sp)
    80005f44:	00813483          	ld	s1,8(sp)
    80005f48:	00013903          	ld	s2,0(sp)
    80005f4c:	00005517          	auipc	a0,0x5
    80005f50:	17c50513          	addi	a0,a0,380 # 8000b0c8 <cons>
    80005f54:	02010113          	addi	sp,sp,32
    80005f58:	00001317          	auipc	t1,0x1
    80005f5c:	eb030067          	jr	-336(t1) # 80006e08 <release>
    80005f60:	00a00493          	li	s1,10
    80005f64:	fc1ff06f          	j	80005f24 <consoleintr+0x50>

0000000080005f68 <consoleinit>:
    80005f68:	fe010113          	addi	sp,sp,-32
    80005f6c:	00113c23          	sd	ra,24(sp)
    80005f70:	00813823          	sd	s0,16(sp)
    80005f74:	00913423          	sd	s1,8(sp)
    80005f78:	02010413          	addi	s0,sp,32
    80005f7c:	00005497          	auipc	s1,0x5
    80005f80:	14c48493          	addi	s1,s1,332 # 8000b0c8 <cons>
    80005f84:	00048513          	mv	a0,s1
    80005f88:	00002597          	auipc	a1,0x2
    80005f8c:	50858593          	addi	a1,a1,1288 # 80008490 <CONSOLE_STATUS+0x480>
    80005f90:	00001097          	auipc	ra,0x1
    80005f94:	d88080e7          	jalr	-632(ra) # 80006d18 <initlock>
    80005f98:	00000097          	auipc	ra,0x0
    80005f9c:	7ac080e7          	jalr	1964(ra) # 80006744 <uartinit>
    80005fa0:	01813083          	ld	ra,24(sp)
    80005fa4:	01013403          	ld	s0,16(sp)
    80005fa8:	00000797          	auipc	a5,0x0
    80005fac:	d9c78793          	addi	a5,a5,-612 # 80005d44 <consoleread>
    80005fb0:	0af4bc23          	sd	a5,184(s1)
    80005fb4:	00000797          	auipc	a5,0x0
    80005fb8:	cec78793          	addi	a5,a5,-788 # 80005ca0 <consolewrite>
    80005fbc:	0cf4b023          	sd	a5,192(s1)
    80005fc0:	00813483          	ld	s1,8(sp)
    80005fc4:	02010113          	addi	sp,sp,32
    80005fc8:	00008067          	ret

0000000080005fcc <console_read>:
    80005fcc:	ff010113          	addi	sp,sp,-16
    80005fd0:	00813423          	sd	s0,8(sp)
    80005fd4:	01010413          	addi	s0,sp,16
    80005fd8:	00813403          	ld	s0,8(sp)
    80005fdc:	00005317          	auipc	t1,0x5
    80005fe0:	1a433303          	ld	t1,420(t1) # 8000b180 <devsw+0x10>
    80005fe4:	01010113          	addi	sp,sp,16
    80005fe8:	00030067          	jr	t1

0000000080005fec <console_write>:
    80005fec:	ff010113          	addi	sp,sp,-16
    80005ff0:	00813423          	sd	s0,8(sp)
    80005ff4:	01010413          	addi	s0,sp,16
    80005ff8:	00813403          	ld	s0,8(sp)
    80005ffc:	00005317          	auipc	t1,0x5
    80006000:	18c33303          	ld	t1,396(t1) # 8000b188 <devsw+0x18>
    80006004:	01010113          	addi	sp,sp,16
    80006008:	00030067          	jr	t1

000000008000600c <panic>:
    8000600c:	fe010113          	addi	sp,sp,-32
    80006010:	00113c23          	sd	ra,24(sp)
    80006014:	00813823          	sd	s0,16(sp)
    80006018:	00913423          	sd	s1,8(sp)
    8000601c:	02010413          	addi	s0,sp,32
    80006020:	00050493          	mv	s1,a0
    80006024:	00002517          	auipc	a0,0x2
    80006028:	47450513          	addi	a0,a0,1140 # 80008498 <CONSOLE_STATUS+0x488>
    8000602c:	00005797          	auipc	a5,0x5
    80006030:	1e07ae23          	sw	zero,508(a5) # 8000b228 <pr+0x18>
    80006034:	00000097          	auipc	ra,0x0
    80006038:	034080e7          	jalr	52(ra) # 80006068 <__printf>
    8000603c:	00048513          	mv	a0,s1
    80006040:	00000097          	auipc	ra,0x0
    80006044:	028080e7          	jalr	40(ra) # 80006068 <__printf>
    80006048:	00002517          	auipc	a0,0x2
    8000604c:	12050513          	addi	a0,a0,288 # 80008168 <CONSOLE_STATUS+0x158>
    80006050:	00000097          	auipc	ra,0x0
    80006054:	018080e7          	jalr	24(ra) # 80006068 <__printf>
    80006058:	00100793          	li	a5,1
    8000605c:	00004717          	auipc	a4,0x4
    80006060:	eef72623          	sw	a5,-276(a4) # 80009f48 <panicked>
    80006064:	0000006f          	j	80006064 <panic+0x58>

0000000080006068 <__printf>:
    80006068:	f3010113          	addi	sp,sp,-208
    8000606c:	08813023          	sd	s0,128(sp)
    80006070:	07313423          	sd	s3,104(sp)
    80006074:	09010413          	addi	s0,sp,144
    80006078:	05813023          	sd	s8,64(sp)
    8000607c:	08113423          	sd	ra,136(sp)
    80006080:	06913c23          	sd	s1,120(sp)
    80006084:	07213823          	sd	s2,112(sp)
    80006088:	07413023          	sd	s4,96(sp)
    8000608c:	05513c23          	sd	s5,88(sp)
    80006090:	05613823          	sd	s6,80(sp)
    80006094:	05713423          	sd	s7,72(sp)
    80006098:	03913c23          	sd	s9,56(sp)
    8000609c:	03a13823          	sd	s10,48(sp)
    800060a0:	03b13423          	sd	s11,40(sp)
    800060a4:	00005317          	auipc	t1,0x5
    800060a8:	16c30313          	addi	t1,t1,364 # 8000b210 <pr>
    800060ac:	01832c03          	lw	s8,24(t1)
    800060b0:	00b43423          	sd	a1,8(s0)
    800060b4:	00c43823          	sd	a2,16(s0)
    800060b8:	00d43c23          	sd	a3,24(s0)
    800060bc:	02e43023          	sd	a4,32(s0)
    800060c0:	02f43423          	sd	a5,40(s0)
    800060c4:	03043823          	sd	a6,48(s0)
    800060c8:	03143c23          	sd	a7,56(s0)
    800060cc:	00050993          	mv	s3,a0
    800060d0:	4a0c1663          	bnez	s8,8000657c <__printf+0x514>
    800060d4:	60098c63          	beqz	s3,800066ec <__printf+0x684>
    800060d8:	0009c503          	lbu	a0,0(s3)
    800060dc:	00840793          	addi	a5,s0,8
    800060e0:	f6f43c23          	sd	a5,-136(s0)
    800060e4:	00000493          	li	s1,0
    800060e8:	22050063          	beqz	a0,80006308 <__printf+0x2a0>
    800060ec:	00002a37          	lui	s4,0x2
    800060f0:	00018ab7          	lui	s5,0x18
    800060f4:	000f4b37          	lui	s6,0xf4
    800060f8:	00989bb7          	lui	s7,0x989
    800060fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006100:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006104:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006108:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000610c:	00148c9b          	addiw	s9,s1,1
    80006110:	02500793          	li	a5,37
    80006114:	01998933          	add	s2,s3,s9
    80006118:	38f51263          	bne	a0,a5,8000649c <__printf+0x434>
    8000611c:	00094783          	lbu	a5,0(s2)
    80006120:	00078c9b          	sext.w	s9,a5
    80006124:	1e078263          	beqz	a5,80006308 <__printf+0x2a0>
    80006128:	0024849b          	addiw	s1,s1,2
    8000612c:	07000713          	li	a4,112
    80006130:	00998933          	add	s2,s3,s1
    80006134:	38e78a63          	beq	a5,a4,800064c8 <__printf+0x460>
    80006138:	20f76863          	bltu	a4,a5,80006348 <__printf+0x2e0>
    8000613c:	42a78863          	beq	a5,a0,8000656c <__printf+0x504>
    80006140:	06400713          	li	a4,100
    80006144:	40e79663          	bne	a5,a4,80006550 <__printf+0x4e8>
    80006148:	f7843783          	ld	a5,-136(s0)
    8000614c:	0007a603          	lw	a2,0(a5)
    80006150:	00878793          	addi	a5,a5,8
    80006154:	f6f43c23          	sd	a5,-136(s0)
    80006158:	42064a63          	bltz	a2,8000658c <__printf+0x524>
    8000615c:	00a00713          	li	a4,10
    80006160:	02e677bb          	remuw	a5,a2,a4
    80006164:	00002d97          	auipc	s11,0x2
    80006168:	35cd8d93          	addi	s11,s11,860 # 800084c0 <digits>
    8000616c:	00900593          	li	a1,9
    80006170:	0006051b          	sext.w	a0,a2
    80006174:	00000c93          	li	s9,0
    80006178:	02079793          	slli	a5,a5,0x20
    8000617c:	0207d793          	srli	a5,a5,0x20
    80006180:	00fd87b3          	add	a5,s11,a5
    80006184:	0007c783          	lbu	a5,0(a5)
    80006188:	02e656bb          	divuw	a3,a2,a4
    8000618c:	f8f40023          	sb	a5,-128(s0)
    80006190:	14c5d863          	bge	a1,a2,800062e0 <__printf+0x278>
    80006194:	06300593          	li	a1,99
    80006198:	00100c93          	li	s9,1
    8000619c:	02e6f7bb          	remuw	a5,a3,a4
    800061a0:	02079793          	slli	a5,a5,0x20
    800061a4:	0207d793          	srli	a5,a5,0x20
    800061a8:	00fd87b3          	add	a5,s11,a5
    800061ac:	0007c783          	lbu	a5,0(a5)
    800061b0:	02e6d73b          	divuw	a4,a3,a4
    800061b4:	f8f400a3          	sb	a5,-127(s0)
    800061b8:	12a5f463          	bgeu	a1,a0,800062e0 <__printf+0x278>
    800061bc:	00a00693          	li	a3,10
    800061c0:	00900593          	li	a1,9
    800061c4:	02d777bb          	remuw	a5,a4,a3
    800061c8:	02079793          	slli	a5,a5,0x20
    800061cc:	0207d793          	srli	a5,a5,0x20
    800061d0:	00fd87b3          	add	a5,s11,a5
    800061d4:	0007c503          	lbu	a0,0(a5)
    800061d8:	02d757bb          	divuw	a5,a4,a3
    800061dc:	f8a40123          	sb	a0,-126(s0)
    800061e0:	48e5f263          	bgeu	a1,a4,80006664 <__printf+0x5fc>
    800061e4:	06300513          	li	a0,99
    800061e8:	02d7f5bb          	remuw	a1,a5,a3
    800061ec:	02059593          	slli	a1,a1,0x20
    800061f0:	0205d593          	srli	a1,a1,0x20
    800061f4:	00bd85b3          	add	a1,s11,a1
    800061f8:	0005c583          	lbu	a1,0(a1)
    800061fc:	02d7d7bb          	divuw	a5,a5,a3
    80006200:	f8b401a3          	sb	a1,-125(s0)
    80006204:	48e57263          	bgeu	a0,a4,80006688 <__printf+0x620>
    80006208:	3e700513          	li	a0,999
    8000620c:	02d7f5bb          	remuw	a1,a5,a3
    80006210:	02059593          	slli	a1,a1,0x20
    80006214:	0205d593          	srli	a1,a1,0x20
    80006218:	00bd85b3          	add	a1,s11,a1
    8000621c:	0005c583          	lbu	a1,0(a1)
    80006220:	02d7d7bb          	divuw	a5,a5,a3
    80006224:	f8b40223          	sb	a1,-124(s0)
    80006228:	46e57663          	bgeu	a0,a4,80006694 <__printf+0x62c>
    8000622c:	02d7f5bb          	remuw	a1,a5,a3
    80006230:	02059593          	slli	a1,a1,0x20
    80006234:	0205d593          	srli	a1,a1,0x20
    80006238:	00bd85b3          	add	a1,s11,a1
    8000623c:	0005c583          	lbu	a1,0(a1)
    80006240:	02d7d7bb          	divuw	a5,a5,a3
    80006244:	f8b402a3          	sb	a1,-123(s0)
    80006248:	46ea7863          	bgeu	s4,a4,800066b8 <__printf+0x650>
    8000624c:	02d7f5bb          	remuw	a1,a5,a3
    80006250:	02059593          	slli	a1,a1,0x20
    80006254:	0205d593          	srli	a1,a1,0x20
    80006258:	00bd85b3          	add	a1,s11,a1
    8000625c:	0005c583          	lbu	a1,0(a1)
    80006260:	02d7d7bb          	divuw	a5,a5,a3
    80006264:	f8b40323          	sb	a1,-122(s0)
    80006268:	3eeaf863          	bgeu	s5,a4,80006658 <__printf+0x5f0>
    8000626c:	02d7f5bb          	remuw	a1,a5,a3
    80006270:	02059593          	slli	a1,a1,0x20
    80006274:	0205d593          	srli	a1,a1,0x20
    80006278:	00bd85b3          	add	a1,s11,a1
    8000627c:	0005c583          	lbu	a1,0(a1)
    80006280:	02d7d7bb          	divuw	a5,a5,a3
    80006284:	f8b403a3          	sb	a1,-121(s0)
    80006288:	42eb7e63          	bgeu	s6,a4,800066c4 <__printf+0x65c>
    8000628c:	02d7f5bb          	remuw	a1,a5,a3
    80006290:	02059593          	slli	a1,a1,0x20
    80006294:	0205d593          	srli	a1,a1,0x20
    80006298:	00bd85b3          	add	a1,s11,a1
    8000629c:	0005c583          	lbu	a1,0(a1)
    800062a0:	02d7d7bb          	divuw	a5,a5,a3
    800062a4:	f8b40423          	sb	a1,-120(s0)
    800062a8:	42ebfc63          	bgeu	s7,a4,800066e0 <__printf+0x678>
    800062ac:	02079793          	slli	a5,a5,0x20
    800062b0:	0207d793          	srli	a5,a5,0x20
    800062b4:	00fd8db3          	add	s11,s11,a5
    800062b8:	000dc703          	lbu	a4,0(s11)
    800062bc:	00a00793          	li	a5,10
    800062c0:	00900c93          	li	s9,9
    800062c4:	f8e404a3          	sb	a4,-119(s0)
    800062c8:	00065c63          	bgez	a2,800062e0 <__printf+0x278>
    800062cc:	f9040713          	addi	a4,s0,-112
    800062d0:	00f70733          	add	a4,a4,a5
    800062d4:	02d00693          	li	a3,45
    800062d8:	fed70823          	sb	a3,-16(a4)
    800062dc:	00078c93          	mv	s9,a5
    800062e0:	f8040793          	addi	a5,s0,-128
    800062e4:	01978cb3          	add	s9,a5,s9
    800062e8:	f7f40d13          	addi	s10,s0,-129
    800062ec:	000cc503          	lbu	a0,0(s9)
    800062f0:	fffc8c93          	addi	s9,s9,-1
    800062f4:	00000097          	auipc	ra,0x0
    800062f8:	b90080e7          	jalr	-1136(ra) # 80005e84 <consputc>
    800062fc:	ffac98e3          	bne	s9,s10,800062ec <__printf+0x284>
    80006300:	00094503          	lbu	a0,0(s2)
    80006304:	e00514e3          	bnez	a0,8000610c <__printf+0xa4>
    80006308:	1a0c1663          	bnez	s8,800064b4 <__printf+0x44c>
    8000630c:	08813083          	ld	ra,136(sp)
    80006310:	08013403          	ld	s0,128(sp)
    80006314:	07813483          	ld	s1,120(sp)
    80006318:	07013903          	ld	s2,112(sp)
    8000631c:	06813983          	ld	s3,104(sp)
    80006320:	06013a03          	ld	s4,96(sp)
    80006324:	05813a83          	ld	s5,88(sp)
    80006328:	05013b03          	ld	s6,80(sp)
    8000632c:	04813b83          	ld	s7,72(sp)
    80006330:	04013c03          	ld	s8,64(sp)
    80006334:	03813c83          	ld	s9,56(sp)
    80006338:	03013d03          	ld	s10,48(sp)
    8000633c:	02813d83          	ld	s11,40(sp)
    80006340:	0d010113          	addi	sp,sp,208
    80006344:	00008067          	ret
    80006348:	07300713          	li	a4,115
    8000634c:	1ce78a63          	beq	a5,a4,80006520 <__printf+0x4b8>
    80006350:	07800713          	li	a4,120
    80006354:	1ee79e63          	bne	a5,a4,80006550 <__printf+0x4e8>
    80006358:	f7843783          	ld	a5,-136(s0)
    8000635c:	0007a703          	lw	a4,0(a5)
    80006360:	00878793          	addi	a5,a5,8
    80006364:	f6f43c23          	sd	a5,-136(s0)
    80006368:	28074263          	bltz	a4,800065ec <__printf+0x584>
    8000636c:	00002d97          	auipc	s11,0x2
    80006370:	154d8d93          	addi	s11,s11,340 # 800084c0 <digits>
    80006374:	00f77793          	andi	a5,a4,15
    80006378:	00fd87b3          	add	a5,s11,a5
    8000637c:	0007c683          	lbu	a3,0(a5)
    80006380:	00f00613          	li	a2,15
    80006384:	0007079b          	sext.w	a5,a4
    80006388:	f8d40023          	sb	a3,-128(s0)
    8000638c:	0047559b          	srliw	a1,a4,0x4
    80006390:	0047569b          	srliw	a3,a4,0x4
    80006394:	00000c93          	li	s9,0
    80006398:	0ee65063          	bge	a2,a4,80006478 <__printf+0x410>
    8000639c:	00f6f693          	andi	a3,a3,15
    800063a0:	00dd86b3          	add	a3,s11,a3
    800063a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800063a8:	0087d79b          	srliw	a5,a5,0x8
    800063ac:	00100c93          	li	s9,1
    800063b0:	f8d400a3          	sb	a3,-127(s0)
    800063b4:	0cb67263          	bgeu	a2,a1,80006478 <__printf+0x410>
    800063b8:	00f7f693          	andi	a3,a5,15
    800063bc:	00dd86b3          	add	a3,s11,a3
    800063c0:	0006c583          	lbu	a1,0(a3)
    800063c4:	00f00613          	li	a2,15
    800063c8:	0047d69b          	srliw	a3,a5,0x4
    800063cc:	f8b40123          	sb	a1,-126(s0)
    800063d0:	0047d593          	srli	a1,a5,0x4
    800063d4:	28f67e63          	bgeu	a2,a5,80006670 <__printf+0x608>
    800063d8:	00f6f693          	andi	a3,a3,15
    800063dc:	00dd86b3          	add	a3,s11,a3
    800063e0:	0006c503          	lbu	a0,0(a3)
    800063e4:	0087d813          	srli	a6,a5,0x8
    800063e8:	0087d69b          	srliw	a3,a5,0x8
    800063ec:	f8a401a3          	sb	a0,-125(s0)
    800063f0:	28b67663          	bgeu	a2,a1,8000667c <__printf+0x614>
    800063f4:	00f6f693          	andi	a3,a3,15
    800063f8:	00dd86b3          	add	a3,s11,a3
    800063fc:	0006c583          	lbu	a1,0(a3)
    80006400:	00c7d513          	srli	a0,a5,0xc
    80006404:	00c7d69b          	srliw	a3,a5,0xc
    80006408:	f8b40223          	sb	a1,-124(s0)
    8000640c:	29067a63          	bgeu	a2,a6,800066a0 <__printf+0x638>
    80006410:	00f6f693          	andi	a3,a3,15
    80006414:	00dd86b3          	add	a3,s11,a3
    80006418:	0006c583          	lbu	a1,0(a3)
    8000641c:	0107d813          	srli	a6,a5,0x10
    80006420:	0107d69b          	srliw	a3,a5,0x10
    80006424:	f8b402a3          	sb	a1,-123(s0)
    80006428:	28a67263          	bgeu	a2,a0,800066ac <__printf+0x644>
    8000642c:	00f6f693          	andi	a3,a3,15
    80006430:	00dd86b3          	add	a3,s11,a3
    80006434:	0006c683          	lbu	a3,0(a3)
    80006438:	0147d79b          	srliw	a5,a5,0x14
    8000643c:	f8d40323          	sb	a3,-122(s0)
    80006440:	21067663          	bgeu	a2,a6,8000664c <__printf+0x5e4>
    80006444:	02079793          	slli	a5,a5,0x20
    80006448:	0207d793          	srli	a5,a5,0x20
    8000644c:	00fd8db3          	add	s11,s11,a5
    80006450:	000dc683          	lbu	a3,0(s11)
    80006454:	00800793          	li	a5,8
    80006458:	00700c93          	li	s9,7
    8000645c:	f8d403a3          	sb	a3,-121(s0)
    80006460:	00075c63          	bgez	a4,80006478 <__printf+0x410>
    80006464:	f9040713          	addi	a4,s0,-112
    80006468:	00f70733          	add	a4,a4,a5
    8000646c:	02d00693          	li	a3,45
    80006470:	fed70823          	sb	a3,-16(a4)
    80006474:	00078c93          	mv	s9,a5
    80006478:	f8040793          	addi	a5,s0,-128
    8000647c:	01978cb3          	add	s9,a5,s9
    80006480:	f7f40d13          	addi	s10,s0,-129
    80006484:	000cc503          	lbu	a0,0(s9)
    80006488:	fffc8c93          	addi	s9,s9,-1
    8000648c:	00000097          	auipc	ra,0x0
    80006490:	9f8080e7          	jalr	-1544(ra) # 80005e84 <consputc>
    80006494:	ff9d18e3          	bne	s10,s9,80006484 <__printf+0x41c>
    80006498:	0100006f          	j	800064a8 <__printf+0x440>
    8000649c:	00000097          	auipc	ra,0x0
    800064a0:	9e8080e7          	jalr	-1560(ra) # 80005e84 <consputc>
    800064a4:	000c8493          	mv	s1,s9
    800064a8:	00094503          	lbu	a0,0(s2)
    800064ac:	c60510e3          	bnez	a0,8000610c <__printf+0xa4>
    800064b0:	e40c0ee3          	beqz	s8,8000630c <__printf+0x2a4>
    800064b4:	00005517          	auipc	a0,0x5
    800064b8:	d5c50513          	addi	a0,a0,-676 # 8000b210 <pr>
    800064bc:	00001097          	auipc	ra,0x1
    800064c0:	94c080e7          	jalr	-1716(ra) # 80006e08 <release>
    800064c4:	e49ff06f          	j	8000630c <__printf+0x2a4>
    800064c8:	f7843783          	ld	a5,-136(s0)
    800064cc:	03000513          	li	a0,48
    800064d0:	01000d13          	li	s10,16
    800064d4:	00878713          	addi	a4,a5,8
    800064d8:	0007bc83          	ld	s9,0(a5)
    800064dc:	f6e43c23          	sd	a4,-136(s0)
    800064e0:	00000097          	auipc	ra,0x0
    800064e4:	9a4080e7          	jalr	-1628(ra) # 80005e84 <consputc>
    800064e8:	07800513          	li	a0,120
    800064ec:	00000097          	auipc	ra,0x0
    800064f0:	998080e7          	jalr	-1640(ra) # 80005e84 <consputc>
    800064f4:	00002d97          	auipc	s11,0x2
    800064f8:	fccd8d93          	addi	s11,s11,-52 # 800084c0 <digits>
    800064fc:	03ccd793          	srli	a5,s9,0x3c
    80006500:	00fd87b3          	add	a5,s11,a5
    80006504:	0007c503          	lbu	a0,0(a5)
    80006508:	fffd0d1b          	addiw	s10,s10,-1
    8000650c:	004c9c93          	slli	s9,s9,0x4
    80006510:	00000097          	auipc	ra,0x0
    80006514:	974080e7          	jalr	-1676(ra) # 80005e84 <consputc>
    80006518:	fe0d12e3          	bnez	s10,800064fc <__printf+0x494>
    8000651c:	f8dff06f          	j	800064a8 <__printf+0x440>
    80006520:	f7843783          	ld	a5,-136(s0)
    80006524:	0007bc83          	ld	s9,0(a5)
    80006528:	00878793          	addi	a5,a5,8
    8000652c:	f6f43c23          	sd	a5,-136(s0)
    80006530:	000c9a63          	bnez	s9,80006544 <__printf+0x4dc>
    80006534:	1080006f          	j	8000663c <__printf+0x5d4>
    80006538:	001c8c93          	addi	s9,s9,1
    8000653c:	00000097          	auipc	ra,0x0
    80006540:	948080e7          	jalr	-1720(ra) # 80005e84 <consputc>
    80006544:	000cc503          	lbu	a0,0(s9)
    80006548:	fe0518e3          	bnez	a0,80006538 <__printf+0x4d0>
    8000654c:	f5dff06f          	j	800064a8 <__printf+0x440>
    80006550:	02500513          	li	a0,37
    80006554:	00000097          	auipc	ra,0x0
    80006558:	930080e7          	jalr	-1744(ra) # 80005e84 <consputc>
    8000655c:	000c8513          	mv	a0,s9
    80006560:	00000097          	auipc	ra,0x0
    80006564:	924080e7          	jalr	-1756(ra) # 80005e84 <consputc>
    80006568:	f41ff06f          	j	800064a8 <__printf+0x440>
    8000656c:	02500513          	li	a0,37
    80006570:	00000097          	auipc	ra,0x0
    80006574:	914080e7          	jalr	-1772(ra) # 80005e84 <consputc>
    80006578:	f31ff06f          	j	800064a8 <__printf+0x440>
    8000657c:	00030513          	mv	a0,t1
    80006580:	00000097          	auipc	ra,0x0
    80006584:	7bc080e7          	jalr	1980(ra) # 80006d3c <acquire>
    80006588:	b4dff06f          	j	800060d4 <__printf+0x6c>
    8000658c:	40c0053b          	negw	a0,a2
    80006590:	00a00713          	li	a4,10
    80006594:	02e576bb          	remuw	a3,a0,a4
    80006598:	00002d97          	auipc	s11,0x2
    8000659c:	f28d8d93          	addi	s11,s11,-216 # 800084c0 <digits>
    800065a0:	ff700593          	li	a1,-9
    800065a4:	02069693          	slli	a3,a3,0x20
    800065a8:	0206d693          	srli	a3,a3,0x20
    800065ac:	00dd86b3          	add	a3,s11,a3
    800065b0:	0006c683          	lbu	a3,0(a3)
    800065b4:	02e557bb          	divuw	a5,a0,a4
    800065b8:	f8d40023          	sb	a3,-128(s0)
    800065bc:	10b65e63          	bge	a2,a1,800066d8 <__printf+0x670>
    800065c0:	06300593          	li	a1,99
    800065c4:	02e7f6bb          	remuw	a3,a5,a4
    800065c8:	02069693          	slli	a3,a3,0x20
    800065cc:	0206d693          	srli	a3,a3,0x20
    800065d0:	00dd86b3          	add	a3,s11,a3
    800065d4:	0006c683          	lbu	a3,0(a3)
    800065d8:	02e7d73b          	divuw	a4,a5,a4
    800065dc:	00200793          	li	a5,2
    800065e0:	f8d400a3          	sb	a3,-127(s0)
    800065e4:	bca5ece3          	bltu	a1,a0,800061bc <__printf+0x154>
    800065e8:	ce5ff06f          	j	800062cc <__printf+0x264>
    800065ec:	40e007bb          	negw	a5,a4
    800065f0:	00002d97          	auipc	s11,0x2
    800065f4:	ed0d8d93          	addi	s11,s11,-304 # 800084c0 <digits>
    800065f8:	00f7f693          	andi	a3,a5,15
    800065fc:	00dd86b3          	add	a3,s11,a3
    80006600:	0006c583          	lbu	a1,0(a3)
    80006604:	ff100613          	li	a2,-15
    80006608:	0047d69b          	srliw	a3,a5,0x4
    8000660c:	f8b40023          	sb	a1,-128(s0)
    80006610:	0047d59b          	srliw	a1,a5,0x4
    80006614:	0ac75e63          	bge	a4,a2,800066d0 <__printf+0x668>
    80006618:	00f6f693          	andi	a3,a3,15
    8000661c:	00dd86b3          	add	a3,s11,a3
    80006620:	0006c603          	lbu	a2,0(a3)
    80006624:	00f00693          	li	a3,15
    80006628:	0087d79b          	srliw	a5,a5,0x8
    8000662c:	f8c400a3          	sb	a2,-127(s0)
    80006630:	d8b6e4e3          	bltu	a3,a1,800063b8 <__printf+0x350>
    80006634:	00200793          	li	a5,2
    80006638:	e2dff06f          	j	80006464 <__printf+0x3fc>
    8000663c:	00002c97          	auipc	s9,0x2
    80006640:	e64c8c93          	addi	s9,s9,-412 # 800084a0 <CONSOLE_STATUS+0x490>
    80006644:	02800513          	li	a0,40
    80006648:	ef1ff06f          	j	80006538 <__printf+0x4d0>
    8000664c:	00700793          	li	a5,7
    80006650:	00600c93          	li	s9,6
    80006654:	e0dff06f          	j	80006460 <__printf+0x3f8>
    80006658:	00700793          	li	a5,7
    8000665c:	00600c93          	li	s9,6
    80006660:	c69ff06f          	j	800062c8 <__printf+0x260>
    80006664:	00300793          	li	a5,3
    80006668:	00200c93          	li	s9,2
    8000666c:	c5dff06f          	j	800062c8 <__printf+0x260>
    80006670:	00300793          	li	a5,3
    80006674:	00200c93          	li	s9,2
    80006678:	de9ff06f          	j	80006460 <__printf+0x3f8>
    8000667c:	00400793          	li	a5,4
    80006680:	00300c93          	li	s9,3
    80006684:	dddff06f          	j	80006460 <__printf+0x3f8>
    80006688:	00400793          	li	a5,4
    8000668c:	00300c93          	li	s9,3
    80006690:	c39ff06f          	j	800062c8 <__printf+0x260>
    80006694:	00500793          	li	a5,5
    80006698:	00400c93          	li	s9,4
    8000669c:	c2dff06f          	j	800062c8 <__printf+0x260>
    800066a0:	00500793          	li	a5,5
    800066a4:	00400c93          	li	s9,4
    800066a8:	db9ff06f          	j	80006460 <__printf+0x3f8>
    800066ac:	00600793          	li	a5,6
    800066b0:	00500c93          	li	s9,5
    800066b4:	dadff06f          	j	80006460 <__printf+0x3f8>
    800066b8:	00600793          	li	a5,6
    800066bc:	00500c93          	li	s9,5
    800066c0:	c09ff06f          	j	800062c8 <__printf+0x260>
    800066c4:	00800793          	li	a5,8
    800066c8:	00700c93          	li	s9,7
    800066cc:	bfdff06f          	j	800062c8 <__printf+0x260>
    800066d0:	00100793          	li	a5,1
    800066d4:	d91ff06f          	j	80006464 <__printf+0x3fc>
    800066d8:	00100793          	li	a5,1
    800066dc:	bf1ff06f          	j	800062cc <__printf+0x264>
    800066e0:	00900793          	li	a5,9
    800066e4:	00800c93          	li	s9,8
    800066e8:	be1ff06f          	j	800062c8 <__printf+0x260>
    800066ec:	00002517          	auipc	a0,0x2
    800066f0:	dbc50513          	addi	a0,a0,-580 # 800084a8 <CONSOLE_STATUS+0x498>
    800066f4:	00000097          	auipc	ra,0x0
    800066f8:	918080e7          	jalr	-1768(ra) # 8000600c <panic>

00000000800066fc <printfinit>:
    800066fc:	fe010113          	addi	sp,sp,-32
    80006700:	00813823          	sd	s0,16(sp)
    80006704:	00913423          	sd	s1,8(sp)
    80006708:	00113c23          	sd	ra,24(sp)
    8000670c:	02010413          	addi	s0,sp,32
    80006710:	00005497          	auipc	s1,0x5
    80006714:	b0048493          	addi	s1,s1,-1280 # 8000b210 <pr>
    80006718:	00048513          	mv	a0,s1
    8000671c:	00002597          	auipc	a1,0x2
    80006720:	d9c58593          	addi	a1,a1,-612 # 800084b8 <CONSOLE_STATUS+0x4a8>
    80006724:	00000097          	auipc	ra,0x0
    80006728:	5f4080e7          	jalr	1524(ra) # 80006d18 <initlock>
    8000672c:	01813083          	ld	ra,24(sp)
    80006730:	01013403          	ld	s0,16(sp)
    80006734:	0004ac23          	sw	zero,24(s1)
    80006738:	00813483          	ld	s1,8(sp)
    8000673c:	02010113          	addi	sp,sp,32
    80006740:	00008067          	ret

0000000080006744 <uartinit>:
    80006744:	ff010113          	addi	sp,sp,-16
    80006748:	00813423          	sd	s0,8(sp)
    8000674c:	01010413          	addi	s0,sp,16
    80006750:	100007b7          	lui	a5,0x10000
    80006754:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006758:	f8000713          	li	a4,-128
    8000675c:	00e781a3          	sb	a4,3(a5)
    80006760:	00300713          	li	a4,3
    80006764:	00e78023          	sb	a4,0(a5)
    80006768:	000780a3          	sb	zero,1(a5)
    8000676c:	00e781a3          	sb	a4,3(a5)
    80006770:	00700693          	li	a3,7
    80006774:	00d78123          	sb	a3,2(a5)
    80006778:	00e780a3          	sb	a4,1(a5)
    8000677c:	00813403          	ld	s0,8(sp)
    80006780:	01010113          	addi	sp,sp,16
    80006784:	00008067          	ret

0000000080006788 <uartputc>:
    80006788:	00003797          	auipc	a5,0x3
    8000678c:	7c07a783          	lw	a5,1984(a5) # 80009f48 <panicked>
    80006790:	00078463          	beqz	a5,80006798 <uartputc+0x10>
    80006794:	0000006f          	j	80006794 <uartputc+0xc>
    80006798:	fd010113          	addi	sp,sp,-48
    8000679c:	02813023          	sd	s0,32(sp)
    800067a0:	00913c23          	sd	s1,24(sp)
    800067a4:	01213823          	sd	s2,16(sp)
    800067a8:	01313423          	sd	s3,8(sp)
    800067ac:	02113423          	sd	ra,40(sp)
    800067b0:	03010413          	addi	s0,sp,48
    800067b4:	00003917          	auipc	s2,0x3
    800067b8:	79c90913          	addi	s2,s2,1948 # 80009f50 <uart_tx_r>
    800067bc:	00093783          	ld	a5,0(s2)
    800067c0:	00003497          	auipc	s1,0x3
    800067c4:	79848493          	addi	s1,s1,1944 # 80009f58 <uart_tx_w>
    800067c8:	0004b703          	ld	a4,0(s1)
    800067cc:	02078693          	addi	a3,a5,32
    800067d0:	00050993          	mv	s3,a0
    800067d4:	02e69c63          	bne	a3,a4,8000680c <uartputc+0x84>
    800067d8:	00001097          	auipc	ra,0x1
    800067dc:	834080e7          	jalr	-1996(ra) # 8000700c <push_on>
    800067e0:	00093783          	ld	a5,0(s2)
    800067e4:	0004b703          	ld	a4,0(s1)
    800067e8:	02078793          	addi	a5,a5,32
    800067ec:	00e79463          	bne	a5,a4,800067f4 <uartputc+0x6c>
    800067f0:	0000006f          	j	800067f0 <uartputc+0x68>
    800067f4:	00001097          	auipc	ra,0x1
    800067f8:	88c080e7          	jalr	-1908(ra) # 80007080 <pop_on>
    800067fc:	00093783          	ld	a5,0(s2)
    80006800:	0004b703          	ld	a4,0(s1)
    80006804:	02078693          	addi	a3,a5,32
    80006808:	fce688e3          	beq	a3,a4,800067d8 <uartputc+0x50>
    8000680c:	01f77693          	andi	a3,a4,31
    80006810:	00005597          	auipc	a1,0x5
    80006814:	a2058593          	addi	a1,a1,-1504 # 8000b230 <uart_tx_buf>
    80006818:	00d586b3          	add	a3,a1,a3
    8000681c:	00170713          	addi	a4,a4,1
    80006820:	01368023          	sb	s3,0(a3)
    80006824:	00e4b023          	sd	a4,0(s1)
    80006828:	10000637          	lui	a2,0x10000
    8000682c:	02f71063          	bne	a4,a5,8000684c <uartputc+0xc4>
    80006830:	0340006f          	j	80006864 <uartputc+0xdc>
    80006834:	00074703          	lbu	a4,0(a4)
    80006838:	00f93023          	sd	a5,0(s2)
    8000683c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006840:	00093783          	ld	a5,0(s2)
    80006844:	0004b703          	ld	a4,0(s1)
    80006848:	00f70e63          	beq	a4,a5,80006864 <uartputc+0xdc>
    8000684c:	00564683          	lbu	a3,5(a2)
    80006850:	01f7f713          	andi	a4,a5,31
    80006854:	00e58733          	add	a4,a1,a4
    80006858:	0206f693          	andi	a3,a3,32
    8000685c:	00178793          	addi	a5,a5,1
    80006860:	fc069ae3          	bnez	a3,80006834 <uartputc+0xac>
    80006864:	02813083          	ld	ra,40(sp)
    80006868:	02013403          	ld	s0,32(sp)
    8000686c:	01813483          	ld	s1,24(sp)
    80006870:	01013903          	ld	s2,16(sp)
    80006874:	00813983          	ld	s3,8(sp)
    80006878:	03010113          	addi	sp,sp,48
    8000687c:	00008067          	ret

0000000080006880 <uartputc_sync>:
    80006880:	ff010113          	addi	sp,sp,-16
    80006884:	00813423          	sd	s0,8(sp)
    80006888:	01010413          	addi	s0,sp,16
    8000688c:	00003717          	auipc	a4,0x3
    80006890:	6bc72703          	lw	a4,1724(a4) # 80009f48 <panicked>
    80006894:	02071663          	bnez	a4,800068c0 <uartputc_sync+0x40>
    80006898:	00050793          	mv	a5,a0
    8000689c:	100006b7          	lui	a3,0x10000
    800068a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800068a4:	02077713          	andi	a4,a4,32
    800068a8:	fe070ce3          	beqz	a4,800068a0 <uartputc_sync+0x20>
    800068ac:	0ff7f793          	andi	a5,a5,255
    800068b0:	00f68023          	sb	a5,0(a3)
    800068b4:	00813403          	ld	s0,8(sp)
    800068b8:	01010113          	addi	sp,sp,16
    800068bc:	00008067          	ret
    800068c0:	0000006f          	j	800068c0 <uartputc_sync+0x40>

00000000800068c4 <uartstart>:
    800068c4:	ff010113          	addi	sp,sp,-16
    800068c8:	00813423          	sd	s0,8(sp)
    800068cc:	01010413          	addi	s0,sp,16
    800068d0:	00003617          	auipc	a2,0x3
    800068d4:	68060613          	addi	a2,a2,1664 # 80009f50 <uart_tx_r>
    800068d8:	00003517          	auipc	a0,0x3
    800068dc:	68050513          	addi	a0,a0,1664 # 80009f58 <uart_tx_w>
    800068e0:	00063783          	ld	a5,0(a2)
    800068e4:	00053703          	ld	a4,0(a0)
    800068e8:	04f70263          	beq	a4,a5,8000692c <uartstart+0x68>
    800068ec:	100005b7          	lui	a1,0x10000
    800068f0:	00005817          	auipc	a6,0x5
    800068f4:	94080813          	addi	a6,a6,-1728 # 8000b230 <uart_tx_buf>
    800068f8:	01c0006f          	j	80006914 <uartstart+0x50>
    800068fc:	0006c703          	lbu	a4,0(a3)
    80006900:	00f63023          	sd	a5,0(a2)
    80006904:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006908:	00063783          	ld	a5,0(a2)
    8000690c:	00053703          	ld	a4,0(a0)
    80006910:	00f70e63          	beq	a4,a5,8000692c <uartstart+0x68>
    80006914:	01f7f713          	andi	a4,a5,31
    80006918:	00e806b3          	add	a3,a6,a4
    8000691c:	0055c703          	lbu	a4,5(a1)
    80006920:	00178793          	addi	a5,a5,1
    80006924:	02077713          	andi	a4,a4,32
    80006928:	fc071ae3          	bnez	a4,800068fc <uartstart+0x38>
    8000692c:	00813403          	ld	s0,8(sp)
    80006930:	01010113          	addi	sp,sp,16
    80006934:	00008067          	ret

0000000080006938 <uartgetc>:
    80006938:	ff010113          	addi	sp,sp,-16
    8000693c:	00813423          	sd	s0,8(sp)
    80006940:	01010413          	addi	s0,sp,16
    80006944:	10000737          	lui	a4,0x10000
    80006948:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000694c:	0017f793          	andi	a5,a5,1
    80006950:	00078c63          	beqz	a5,80006968 <uartgetc+0x30>
    80006954:	00074503          	lbu	a0,0(a4)
    80006958:	0ff57513          	andi	a0,a0,255
    8000695c:	00813403          	ld	s0,8(sp)
    80006960:	01010113          	addi	sp,sp,16
    80006964:	00008067          	ret
    80006968:	fff00513          	li	a0,-1
    8000696c:	ff1ff06f          	j	8000695c <uartgetc+0x24>

0000000080006970 <uartintr>:
    80006970:	100007b7          	lui	a5,0x10000
    80006974:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006978:	0017f793          	andi	a5,a5,1
    8000697c:	0a078463          	beqz	a5,80006a24 <uartintr+0xb4>
    80006980:	fe010113          	addi	sp,sp,-32
    80006984:	00813823          	sd	s0,16(sp)
    80006988:	00913423          	sd	s1,8(sp)
    8000698c:	00113c23          	sd	ra,24(sp)
    80006990:	02010413          	addi	s0,sp,32
    80006994:	100004b7          	lui	s1,0x10000
    80006998:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000699c:	0ff57513          	andi	a0,a0,255
    800069a0:	fffff097          	auipc	ra,0xfffff
    800069a4:	534080e7          	jalr	1332(ra) # 80005ed4 <consoleintr>
    800069a8:	0054c783          	lbu	a5,5(s1)
    800069ac:	0017f793          	andi	a5,a5,1
    800069b0:	fe0794e3          	bnez	a5,80006998 <uartintr+0x28>
    800069b4:	00003617          	auipc	a2,0x3
    800069b8:	59c60613          	addi	a2,a2,1436 # 80009f50 <uart_tx_r>
    800069bc:	00003517          	auipc	a0,0x3
    800069c0:	59c50513          	addi	a0,a0,1436 # 80009f58 <uart_tx_w>
    800069c4:	00063783          	ld	a5,0(a2)
    800069c8:	00053703          	ld	a4,0(a0)
    800069cc:	04f70263          	beq	a4,a5,80006a10 <uartintr+0xa0>
    800069d0:	100005b7          	lui	a1,0x10000
    800069d4:	00005817          	auipc	a6,0x5
    800069d8:	85c80813          	addi	a6,a6,-1956 # 8000b230 <uart_tx_buf>
    800069dc:	01c0006f          	j	800069f8 <uartintr+0x88>
    800069e0:	0006c703          	lbu	a4,0(a3)
    800069e4:	00f63023          	sd	a5,0(a2)
    800069e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800069ec:	00063783          	ld	a5,0(a2)
    800069f0:	00053703          	ld	a4,0(a0)
    800069f4:	00f70e63          	beq	a4,a5,80006a10 <uartintr+0xa0>
    800069f8:	01f7f713          	andi	a4,a5,31
    800069fc:	00e806b3          	add	a3,a6,a4
    80006a00:	0055c703          	lbu	a4,5(a1)
    80006a04:	00178793          	addi	a5,a5,1
    80006a08:	02077713          	andi	a4,a4,32
    80006a0c:	fc071ae3          	bnez	a4,800069e0 <uartintr+0x70>
    80006a10:	01813083          	ld	ra,24(sp)
    80006a14:	01013403          	ld	s0,16(sp)
    80006a18:	00813483          	ld	s1,8(sp)
    80006a1c:	02010113          	addi	sp,sp,32
    80006a20:	00008067          	ret
    80006a24:	00003617          	auipc	a2,0x3
    80006a28:	52c60613          	addi	a2,a2,1324 # 80009f50 <uart_tx_r>
    80006a2c:	00003517          	auipc	a0,0x3
    80006a30:	52c50513          	addi	a0,a0,1324 # 80009f58 <uart_tx_w>
    80006a34:	00063783          	ld	a5,0(a2)
    80006a38:	00053703          	ld	a4,0(a0)
    80006a3c:	04f70263          	beq	a4,a5,80006a80 <uartintr+0x110>
    80006a40:	100005b7          	lui	a1,0x10000
    80006a44:	00004817          	auipc	a6,0x4
    80006a48:	7ec80813          	addi	a6,a6,2028 # 8000b230 <uart_tx_buf>
    80006a4c:	01c0006f          	j	80006a68 <uartintr+0xf8>
    80006a50:	0006c703          	lbu	a4,0(a3)
    80006a54:	00f63023          	sd	a5,0(a2)
    80006a58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006a5c:	00063783          	ld	a5,0(a2)
    80006a60:	00053703          	ld	a4,0(a0)
    80006a64:	02f70063          	beq	a4,a5,80006a84 <uartintr+0x114>
    80006a68:	01f7f713          	andi	a4,a5,31
    80006a6c:	00e806b3          	add	a3,a6,a4
    80006a70:	0055c703          	lbu	a4,5(a1)
    80006a74:	00178793          	addi	a5,a5,1
    80006a78:	02077713          	andi	a4,a4,32
    80006a7c:	fc071ae3          	bnez	a4,80006a50 <uartintr+0xe0>
    80006a80:	00008067          	ret
    80006a84:	00008067          	ret

0000000080006a88 <kinit>:
    80006a88:	fc010113          	addi	sp,sp,-64
    80006a8c:	02913423          	sd	s1,40(sp)
    80006a90:	fffff7b7          	lui	a5,0xfffff
    80006a94:	00005497          	auipc	s1,0x5
    80006a98:	7bb48493          	addi	s1,s1,1979 # 8000c24f <end+0xfff>
    80006a9c:	02813823          	sd	s0,48(sp)
    80006aa0:	01313c23          	sd	s3,24(sp)
    80006aa4:	00f4f4b3          	and	s1,s1,a5
    80006aa8:	02113c23          	sd	ra,56(sp)
    80006aac:	03213023          	sd	s2,32(sp)
    80006ab0:	01413823          	sd	s4,16(sp)
    80006ab4:	01513423          	sd	s5,8(sp)
    80006ab8:	04010413          	addi	s0,sp,64
    80006abc:	000017b7          	lui	a5,0x1
    80006ac0:	01100993          	li	s3,17
    80006ac4:	00f487b3          	add	a5,s1,a5
    80006ac8:	01b99993          	slli	s3,s3,0x1b
    80006acc:	06f9e063          	bltu	s3,a5,80006b2c <kinit+0xa4>
    80006ad0:	00004a97          	auipc	s5,0x4
    80006ad4:	780a8a93          	addi	s5,s5,1920 # 8000b250 <end>
    80006ad8:	0754ec63          	bltu	s1,s5,80006b50 <kinit+0xc8>
    80006adc:	0734fa63          	bgeu	s1,s3,80006b50 <kinit+0xc8>
    80006ae0:	00088a37          	lui	s4,0x88
    80006ae4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006ae8:	00003917          	auipc	s2,0x3
    80006aec:	47890913          	addi	s2,s2,1144 # 80009f60 <kmem>
    80006af0:	00ca1a13          	slli	s4,s4,0xc
    80006af4:	0140006f          	j	80006b08 <kinit+0x80>
    80006af8:	000017b7          	lui	a5,0x1
    80006afc:	00f484b3          	add	s1,s1,a5
    80006b00:	0554e863          	bltu	s1,s5,80006b50 <kinit+0xc8>
    80006b04:	0534f663          	bgeu	s1,s3,80006b50 <kinit+0xc8>
    80006b08:	00001637          	lui	a2,0x1
    80006b0c:	00100593          	li	a1,1
    80006b10:	00048513          	mv	a0,s1
    80006b14:	00000097          	auipc	ra,0x0
    80006b18:	5e4080e7          	jalr	1508(ra) # 800070f8 <__memset>
    80006b1c:	00093783          	ld	a5,0(s2)
    80006b20:	00f4b023          	sd	a5,0(s1)
    80006b24:	00993023          	sd	s1,0(s2)
    80006b28:	fd4498e3          	bne	s1,s4,80006af8 <kinit+0x70>
    80006b2c:	03813083          	ld	ra,56(sp)
    80006b30:	03013403          	ld	s0,48(sp)
    80006b34:	02813483          	ld	s1,40(sp)
    80006b38:	02013903          	ld	s2,32(sp)
    80006b3c:	01813983          	ld	s3,24(sp)
    80006b40:	01013a03          	ld	s4,16(sp)
    80006b44:	00813a83          	ld	s5,8(sp)
    80006b48:	04010113          	addi	sp,sp,64
    80006b4c:	00008067          	ret
    80006b50:	00002517          	auipc	a0,0x2
    80006b54:	98850513          	addi	a0,a0,-1656 # 800084d8 <digits+0x18>
    80006b58:	fffff097          	auipc	ra,0xfffff
    80006b5c:	4b4080e7          	jalr	1204(ra) # 8000600c <panic>

0000000080006b60 <freerange>:
    80006b60:	fc010113          	addi	sp,sp,-64
    80006b64:	000017b7          	lui	a5,0x1
    80006b68:	02913423          	sd	s1,40(sp)
    80006b6c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006b70:	009504b3          	add	s1,a0,s1
    80006b74:	fffff537          	lui	a0,0xfffff
    80006b78:	02813823          	sd	s0,48(sp)
    80006b7c:	02113c23          	sd	ra,56(sp)
    80006b80:	03213023          	sd	s2,32(sp)
    80006b84:	01313c23          	sd	s3,24(sp)
    80006b88:	01413823          	sd	s4,16(sp)
    80006b8c:	01513423          	sd	s5,8(sp)
    80006b90:	01613023          	sd	s6,0(sp)
    80006b94:	04010413          	addi	s0,sp,64
    80006b98:	00a4f4b3          	and	s1,s1,a0
    80006b9c:	00f487b3          	add	a5,s1,a5
    80006ba0:	06f5e463          	bltu	a1,a5,80006c08 <freerange+0xa8>
    80006ba4:	00004a97          	auipc	s5,0x4
    80006ba8:	6aca8a93          	addi	s5,s5,1708 # 8000b250 <end>
    80006bac:	0954e263          	bltu	s1,s5,80006c30 <freerange+0xd0>
    80006bb0:	01100993          	li	s3,17
    80006bb4:	01b99993          	slli	s3,s3,0x1b
    80006bb8:	0734fc63          	bgeu	s1,s3,80006c30 <freerange+0xd0>
    80006bbc:	00058a13          	mv	s4,a1
    80006bc0:	00003917          	auipc	s2,0x3
    80006bc4:	3a090913          	addi	s2,s2,928 # 80009f60 <kmem>
    80006bc8:	00002b37          	lui	s6,0x2
    80006bcc:	0140006f          	j	80006be0 <freerange+0x80>
    80006bd0:	000017b7          	lui	a5,0x1
    80006bd4:	00f484b3          	add	s1,s1,a5
    80006bd8:	0554ec63          	bltu	s1,s5,80006c30 <freerange+0xd0>
    80006bdc:	0534fa63          	bgeu	s1,s3,80006c30 <freerange+0xd0>
    80006be0:	00001637          	lui	a2,0x1
    80006be4:	00100593          	li	a1,1
    80006be8:	00048513          	mv	a0,s1
    80006bec:	00000097          	auipc	ra,0x0
    80006bf0:	50c080e7          	jalr	1292(ra) # 800070f8 <__memset>
    80006bf4:	00093703          	ld	a4,0(s2)
    80006bf8:	016487b3          	add	a5,s1,s6
    80006bfc:	00e4b023          	sd	a4,0(s1)
    80006c00:	00993023          	sd	s1,0(s2)
    80006c04:	fcfa76e3          	bgeu	s4,a5,80006bd0 <freerange+0x70>
    80006c08:	03813083          	ld	ra,56(sp)
    80006c0c:	03013403          	ld	s0,48(sp)
    80006c10:	02813483          	ld	s1,40(sp)
    80006c14:	02013903          	ld	s2,32(sp)
    80006c18:	01813983          	ld	s3,24(sp)
    80006c1c:	01013a03          	ld	s4,16(sp)
    80006c20:	00813a83          	ld	s5,8(sp)
    80006c24:	00013b03          	ld	s6,0(sp)
    80006c28:	04010113          	addi	sp,sp,64
    80006c2c:	00008067          	ret
    80006c30:	00002517          	auipc	a0,0x2
    80006c34:	8a850513          	addi	a0,a0,-1880 # 800084d8 <digits+0x18>
    80006c38:	fffff097          	auipc	ra,0xfffff
    80006c3c:	3d4080e7          	jalr	980(ra) # 8000600c <panic>

0000000080006c40 <kfree>:
    80006c40:	fe010113          	addi	sp,sp,-32
    80006c44:	00813823          	sd	s0,16(sp)
    80006c48:	00113c23          	sd	ra,24(sp)
    80006c4c:	00913423          	sd	s1,8(sp)
    80006c50:	02010413          	addi	s0,sp,32
    80006c54:	03451793          	slli	a5,a0,0x34
    80006c58:	04079c63          	bnez	a5,80006cb0 <kfree+0x70>
    80006c5c:	00004797          	auipc	a5,0x4
    80006c60:	5f478793          	addi	a5,a5,1524 # 8000b250 <end>
    80006c64:	00050493          	mv	s1,a0
    80006c68:	04f56463          	bltu	a0,a5,80006cb0 <kfree+0x70>
    80006c6c:	01100793          	li	a5,17
    80006c70:	01b79793          	slli	a5,a5,0x1b
    80006c74:	02f57e63          	bgeu	a0,a5,80006cb0 <kfree+0x70>
    80006c78:	00001637          	lui	a2,0x1
    80006c7c:	00100593          	li	a1,1
    80006c80:	00000097          	auipc	ra,0x0
    80006c84:	478080e7          	jalr	1144(ra) # 800070f8 <__memset>
    80006c88:	00003797          	auipc	a5,0x3
    80006c8c:	2d878793          	addi	a5,a5,728 # 80009f60 <kmem>
    80006c90:	0007b703          	ld	a4,0(a5)
    80006c94:	01813083          	ld	ra,24(sp)
    80006c98:	01013403          	ld	s0,16(sp)
    80006c9c:	00e4b023          	sd	a4,0(s1)
    80006ca0:	0097b023          	sd	s1,0(a5)
    80006ca4:	00813483          	ld	s1,8(sp)
    80006ca8:	02010113          	addi	sp,sp,32
    80006cac:	00008067          	ret
    80006cb0:	00002517          	auipc	a0,0x2
    80006cb4:	82850513          	addi	a0,a0,-2008 # 800084d8 <digits+0x18>
    80006cb8:	fffff097          	auipc	ra,0xfffff
    80006cbc:	354080e7          	jalr	852(ra) # 8000600c <panic>

0000000080006cc0 <kalloc>:
    80006cc0:	fe010113          	addi	sp,sp,-32
    80006cc4:	00813823          	sd	s0,16(sp)
    80006cc8:	00913423          	sd	s1,8(sp)
    80006ccc:	00113c23          	sd	ra,24(sp)
    80006cd0:	02010413          	addi	s0,sp,32
    80006cd4:	00003797          	auipc	a5,0x3
    80006cd8:	28c78793          	addi	a5,a5,652 # 80009f60 <kmem>
    80006cdc:	0007b483          	ld	s1,0(a5)
    80006ce0:	02048063          	beqz	s1,80006d00 <kalloc+0x40>
    80006ce4:	0004b703          	ld	a4,0(s1)
    80006ce8:	00001637          	lui	a2,0x1
    80006cec:	00500593          	li	a1,5
    80006cf0:	00048513          	mv	a0,s1
    80006cf4:	00e7b023          	sd	a4,0(a5)
    80006cf8:	00000097          	auipc	ra,0x0
    80006cfc:	400080e7          	jalr	1024(ra) # 800070f8 <__memset>
    80006d00:	01813083          	ld	ra,24(sp)
    80006d04:	01013403          	ld	s0,16(sp)
    80006d08:	00048513          	mv	a0,s1
    80006d0c:	00813483          	ld	s1,8(sp)
    80006d10:	02010113          	addi	sp,sp,32
    80006d14:	00008067          	ret

0000000080006d18 <initlock>:
    80006d18:	ff010113          	addi	sp,sp,-16
    80006d1c:	00813423          	sd	s0,8(sp)
    80006d20:	01010413          	addi	s0,sp,16
    80006d24:	00813403          	ld	s0,8(sp)
    80006d28:	00b53423          	sd	a1,8(a0)
    80006d2c:	00052023          	sw	zero,0(a0)
    80006d30:	00053823          	sd	zero,16(a0)
    80006d34:	01010113          	addi	sp,sp,16
    80006d38:	00008067          	ret

0000000080006d3c <acquire>:
    80006d3c:	fe010113          	addi	sp,sp,-32
    80006d40:	00813823          	sd	s0,16(sp)
    80006d44:	00913423          	sd	s1,8(sp)
    80006d48:	00113c23          	sd	ra,24(sp)
    80006d4c:	01213023          	sd	s2,0(sp)
    80006d50:	02010413          	addi	s0,sp,32
    80006d54:	00050493          	mv	s1,a0
    80006d58:	10002973          	csrr	s2,sstatus
    80006d5c:	100027f3          	csrr	a5,sstatus
    80006d60:	ffd7f793          	andi	a5,a5,-3
    80006d64:	10079073          	csrw	sstatus,a5
    80006d68:	fffff097          	auipc	ra,0xfffff
    80006d6c:	8ec080e7          	jalr	-1812(ra) # 80005654 <mycpu>
    80006d70:	07852783          	lw	a5,120(a0)
    80006d74:	06078e63          	beqz	a5,80006df0 <acquire+0xb4>
    80006d78:	fffff097          	auipc	ra,0xfffff
    80006d7c:	8dc080e7          	jalr	-1828(ra) # 80005654 <mycpu>
    80006d80:	07852783          	lw	a5,120(a0)
    80006d84:	0004a703          	lw	a4,0(s1)
    80006d88:	0017879b          	addiw	a5,a5,1
    80006d8c:	06f52c23          	sw	a5,120(a0)
    80006d90:	04071063          	bnez	a4,80006dd0 <acquire+0x94>
    80006d94:	00100713          	li	a4,1
    80006d98:	00070793          	mv	a5,a4
    80006d9c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006da0:	0007879b          	sext.w	a5,a5
    80006da4:	fe079ae3          	bnez	a5,80006d98 <acquire+0x5c>
    80006da8:	0ff0000f          	fence
    80006dac:	fffff097          	auipc	ra,0xfffff
    80006db0:	8a8080e7          	jalr	-1880(ra) # 80005654 <mycpu>
    80006db4:	01813083          	ld	ra,24(sp)
    80006db8:	01013403          	ld	s0,16(sp)
    80006dbc:	00a4b823          	sd	a0,16(s1)
    80006dc0:	00013903          	ld	s2,0(sp)
    80006dc4:	00813483          	ld	s1,8(sp)
    80006dc8:	02010113          	addi	sp,sp,32
    80006dcc:	00008067          	ret
    80006dd0:	0104b903          	ld	s2,16(s1)
    80006dd4:	fffff097          	auipc	ra,0xfffff
    80006dd8:	880080e7          	jalr	-1920(ra) # 80005654 <mycpu>
    80006ddc:	faa91ce3          	bne	s2,a0,80006d94 <acquire+0x58>
    80006de0:	00001517          	auipc	a0,0x1
    80006de4:	70050513          	addi	a0,a0,1792 # 800084e0 <digits+0x20>
    80006de8:	fffff097          	auipc	ra,0xfffff
    80006dec:	224080e7          	jalr	548(ra) # 8000600c <panic>
    80006df0:	00195913          	srli	s2,s2,0x1
    80006df4:	fffff097          	auipc	ra,0xfffff
    80006df8:	860080e7          	jalr	-1952(ra) # 80005654 <mycpu>
    80006dfc:	00197913          	andi	s2,s2,1
    80006e00:	07252e23          	sw	s2,124(a0)
    80006e04:	f75ff06f          	j	80006d78 <acquire+0x3c>

0000000080006e08 <release>:
    80006e08:	fe010113          	addi	sp,sp,-32
    80006e0c:	00813823          	sd	s0,16(sp)
    80006e10:	00113c23          	sd	ra,24(sp)
    80006e14:	00913423          	sd	s1,8(sp)
    80006e18:	01213023          	sd	s2,0(sp)
    80006e1c:	02010413          	addi	s0,sp,32
    80006e20:	00052783          	lw	a5,0(a0)
    80006e24:	00079a63          	bnez	a5,80006e38 <release+0x30>
    80006e28:	00001517          	auipc	a0,0x1
    80006e2c:	6c050513          	addi	a0,a0,1728 # 800084e8 <digits+0x28>
    80006e30:	fffff097          	auipc	ra,0xfffff
    80006e34:	1dc080e7          	jalr	476(ra) # 8000600c <panic>
    80006e38:	01053903          	ld	s2,16(a0)
    80006e3c:	00050493          	mv	s1,a0
    80006e40:	fffff097          	auipc	ra,0xfffff
    80006e44:	814080e7          	jalr	-2028(ra) # 80005654 <mycpu>
    80006e48:	fea910e3          	bne	s2,a0,80006e28 <release+0x20>
    80006e4c:	0004b823          	sd	zero,16(s1)
    80006e50:	0ff0000f          	fence
    80006e54:	0f50000f          	fence	iorw,ow
    80006e58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006e5c:	ffffe097          	auipc	ra,0xffffe
    80006e60:	7f8080e7          	jalr	2040(ra) # 80005654 <mycpu>
    80006e64:	100027f3          	csrr	a5,sstatus
    80006e68:	0027f793          	andi	a5,a5,2
    80006e6c:	04079a63          	bnez	a5,80006ec0 <release+0xb8>
    80006e70:	07852783          	lw	a5,120(a0)
    80006e74:	02f05e63          	blez	a5,80006eb0 <release+0xa8>
    80006e78:	fff7871b          	addiw	a4,a5,-1
    80006e7c:	06e52c23          	sw	a4,120(a0)
    80006e80:	00071c63          	bnez	a4,80006e98 <release+0x90>
    80006e84:	07c52783          	lw	a5,124(a0)
    80006e88:	00078863          	beqz	a5,80006e98 <release+0x90>
    80006e8c:	100027f3          	csrr	a5,sstatus
    80006e90:	0027e793          	ori	a5,a5,2
    80006e94:	10079073          	csrw	sstatus,a5
    80006e98:	01813083          	ld	ra,24(sp)
    80006e9c:	01013403          	ld	s0,16(sp)
    80006ea0:	00813483          	ld	s1,8(sp)
    80006ea4:	00013903          	ld	s2,0(sp)
    80006ea8:	02010113          	addi	sp,sp,32
    80006eac:	00008067          	ret
    80006eb0:	00001517          	auipc	a0,0x1
    80006eb4:	65850513          	addi	a0,a0,1624 # 80008508 <digits+0x48>
    80006eb8:	fffff097          	auipc	ra,0xfffff
    80006ebc:	154080e7          	jalr	340(ra) # 8000600c <panic>
    80006ec0:	00001517          	auipc	a0,0x1
    80006ec4:	63050513          	addi	a0,a0,1584 # 800084f0 <digits+0x30>
    80006ec8:	fffff097          	auipc	ra,0xfffff
    80006ecc:	144080e7          	jalr	324(ra) # 8000600c <panic>

0000000080006ed0 <holding>:
    80006ed0:	00052783          	lw	a5,0(a0)
    80006ed4:	00079663          	bnez	a5,80006ee0 <holding+0x10>
    80006ed8:	00000513          	li	a0,0
    80006edc:	00008067          	ret
    80006ee0:	fe010113          	addi	sp,sp,-32
    80006ee4:	00813823          	sd	s0,16(sp)
    80006ee8:	00913423          	sd	s1,8(sp)
    80006eec:	00113c23          	sd	ra,24(sp)
    80006ef0:	02010413          	addi	s0,sp,32
    80006ef4:	01053483          	ld	s1,16(a0)
    80006ef8:	ffffe097          	auipc	ra,0xffffe
    80006efc:	75c080e7          	jalr	1884(ra) # 80005654 <mycpu>
    80006f00:	01813083          	ld	ra,24(sp)
    80006f04:	01013403          	ld	s0,16(sp)
    80006f08:	40a48533          	sub	a0,s1,a0
    80006f0c:	00153513          	seqz	a0,a0
    80006f10:	00813483          	ld	s1,8(sp)
    80006f14:	02010113          	addi	sp,sp,32
    80006f18:	00008067          	ret

0000000080006f1c <push_off>:
    80006f1c:	fe010113          	addi	sp,sp,-32
    80006f20:	00813823          	sd	s0,16(sp)
    80006f24:	00113c23          	sd	ra,24(sp)
    80006f28:	00913423          	sd	s1,8(sp)
    80006f2c:	02010413          	addi	s0,sp,32
    80006f30:	100024f3          	csrr	s1,sstatus
    80006f34:	100027f3          	csrr	a5,sstatus
    80006f38:	ffd7f793          	andi	a5,a5,-3
    80006f3c:	10079073          	csrw	sstatus,a5
    80006f40:	ffffe097          	auipc	ra,0xffffe
    80006f44:	714080e7          	jalr	1812(ra) # 80005654 <mycpu>
    80006f48:	07852783          	lw	a5,120(a0)
    80006f4c:	02078663          	beqz	a5,80006f78 <push_off+0x5c>
    80006f50:	ffffe097          	auipc	ra,0xffffe
    80006f54:	704080e7          	jalr	1796(ra) # 80005654 <mycpu>
    80006f58:	07852783          	lw	a5,120(a0)
    80006f5c:	01813083          	ld	ra,24(sp)
    80006f60:	01013403          	ld	s0,16(sp)
    80006f64:	0017879b          	addiw	a5,a5,1
    80006f68:	06f52c23          	sw	a5,120(a0)
    80006f6c:	00813483          	ld	s1,8(sp)
    80006f70:	02010113          	addi	sp,sp,32
    80006f74:	00008067          	ret
    80006f78:	0014d493          	srli	s1,s1,0x1
    80006f7c:	ffffe097          	auipc	ra,0xffffe
    80006f80:	6d8080e7          	jalr	1752(ra) # 80005654 <mycpu>
    80006f84:	0014f493          	andi	s1,s1,1
    80006f88:	06952e23          	sw	s1,124(a0)
    80006f8c:	fc5ff06f          	j	80006f50 <push_off+0x34>

0000000080006f90 <pop_off>:
    80006f90:	ff010113          	addi	sp,sp,-16
    80006f94:	00813023          	sd	s0,0(sp)
    80006f98:	00113423          	sd	ra,8(sp)
    80006f9c:	01010413          	addi	s0,sp,16
    80006fa0:	ffffe097          	auipc	ra,0xffffe
    80006fa4:	6b4080e7          	jalr	1716(ra) # 80005654 <mycpu>
    80006fa8:	100027f3          	csrr	a5,sstatus
    80006fac:	0027f793          	andi	a5,a5,2
    80006fb0:	04079663          	bnez	a5,80006ffc <pop_off+0x6c>
    80006fb4:	07852783          	lw	a5,120(a0)
    80006fb8:	02f05a63          	blez	a5,80006fec <pop_off+0x5c>
    80006fbc:	fff7871b          	addiw	a4,a5,-1
    80006fc0:	06e52c23          	sw	a4,120(a0)
    80006fc4:	00071c63          	bnez	a4,80006fdc <pop_off+0x4c>
    80006fc8:	07c52783          	lw	a5,124(a0)
    80006fcc:	00078863          	beqz	a5,80006fdc <pop_off+0x4c>
    80006fd0:	100027f3          	csrr	a5,sstatus
    80006fd4:	0027e793          	ori	a5,a5,2
    80006fd8:	10079073          	csrw	sstatus,a5
    80006fdc:	00813083          	ld	ra,8(sp)
    80006fe0:	00013403          	ld	s0,0(sp)
    80006fe4:	01010113          	addi	sp,sp,16
    80006fe8:	00008067          	ret
    80006fec:	00001517          	auipc	a0,0x1
    80006ff0:	51c50513          	addi	a0,a0,1308 # 80008508 <digits+0x48>
    80006ff4:	fffff097          	auipc	ra,0xfffff
    80006ff8:	018080e7          	jalr	24(ra) # 8000600c <panic>
    80006ffc:	00001517          	auipc	a0,0x1
    80007000:	4f450513          	addi	a0,a0,1268 # 800084f0 <digits+0x30>
    80007004:	fffff097          	auipc	ra,0xfffff
    80007008:	008080e7          	jalr	8(ra) # 8000600c <panic>

000000008000700c <push_on>:
    8000700c:	fe010113          	addi	sp,sp,-32
    80007010:	00813823          	sd	s0,16(sp)
    80007014:	00113c23          	sd	ra,24(sp)
    80007018:	00913423          	sd	s1,8(sp)
    8000701c:	02010413          	addi	s0,sp,32
    80007020:	100024f3          	csrr	s1,sstatus
    80007024:	100027f3          	csrr	a5,sstatus
    80007028:	0027e793          	ori	a5,a5,2
    8000702c:	10079073          	csrw	sstatus,a5
    80007030:	ffffe097          	auipc	ra,0xffffe
    80007034:	624080e7          	jalr	1572(ra) # 80005654 <mycpu>
    80007038:	07852783          	lw	a5,120(a0)
    8000703c:	02078663          	beqz	a5,80007068 <push_on+0x5c>
    80007040:	ffffe097          	auipc	ra,0xffffe
    80007044:	614080e7          	jalr	1556(ra) # 80005654 <mycpu>
    80007048:	07852783          	lw	a5,120(a0)
    8000704c:	01813083          	ld	ra,24(sp)
    80007050:	01013403          	ld	s0,16(sp)
    80007054:	0017879b          	addiw	a5,a5,1
    80007058:	06f52c23          	sw	a5,120(a0)
    8000705c:	00813483          	ld	s1,8(sp)
    80007060:	02010113          	addi	sp,sp,32
    80007064:	00008067          	ret
    80007068:	0014d493          	srli	s1,s1,0x1
    8000706c:	ffffe097          	auipc	ra,0xffffe
    80007070:	5e8080e7          	jalr	1512(ra) # 80005654 <mycpu>
    80007074:	0014f493          	andi	s1,s1,1
    80007078:	06952e23          	sw	s1,124(a0)
    8000707c:	fc5ff06f          	j	80007040 <push_on+0x34>

0000000080007080 <pop_on>:
    80007080:	ff010113          	addi	sp,sp,-16
    80007084:	00813023          	sd	s0,0(sp)
    80007088:	00113423          	sd	ra,8(sp)
    8000708c:	01010413          	addi	s0,sp,16
    80007090:	ffffe097          	auipc	ra,0xffffe
    80007094:	5c4080e7          	jalr	1476(ra) # 80005654 <mycpu>
    80007098:	100027f3          	csrr	a5,sstatus
    8000709c:	0027f793          	andi	a5,a5,2
    800070a0:	04078463          	beqz	a5,800070e8 <pop_on+0x68>
    800070a4:	07852783          	lw	a5,120(a0)
    800070a8:	02f05863          	blez	a5,800070d8 <pop_on+0x58>
    800070ac:	fff7879b          	addiw	a5,a5,-1
    800070b0:	06f52c23          	sw	a5,120(a0)
    800070b4:	07853783          	ld	a5,120(a0)
    800070b8:	00079863          	bnez	a5,800070c8 <pop_on+0x48>
    800070bc:	100027f3          	csrr	a5,sstatus
    800070c0:	ffd7f793          	andi	a5,a5,-3
    800070c4:	10079073          	csrw	sstatus,a5
    800070c8:	00813083          	ld	ra,8(sp)
    800070cc:	00013403          	ld	s0,0(sp)
    800070d0:	01010113          	addi	sp,sp,16
    800070d4:	00008067          	ret
    800070d8:	00001517          	auipc	a0,0x1
    800070dc:	45850513          	addi	a0,a0,1112 # 80008530 <digits+0x70>
    800070e0:	fffff097          	auipc	ra,0xfffff
    800070e4:	f2c080e7          	jalr	-212(ra) # 8000600c <panic>
    800070e8:	00001517          	auipc	a0,0x1
    800070ec:	42850513          	addi	a0,a0,1064 # 80008510 <digits+0x50>
    800070f0:	fffff097          	auipc	ra,0xfffff
    800070f4:	f1c080e7          	jalr	-228(ra) # 8000600c <panic>

00000000800070f8 <__memset>:
    800070f8:	ff010113          	addi	sp,sp,-16
    800070fc:	00813423          	sd	s0,8(sp)
    80007100:	01010413          	addi	s0,sp,16
    80007104:	1a060e63          	beqz	a2,800072c0 <__memset+0x1c8>
    80007108:	40a007b3          	neg	a5,a0
    8000710c:	0077f793          	andi	a5,a5,7
    80007110:	00778693          	addi	a3,a5,7
    80007114:	00b00813          	li	a6,11
    80007118:	0ff5f593          	andi	a1,a1,255
    8000711c:	fff6071b          	addiw	a4,a2,-1
    80007120:	1b06e663          	bltu	a3,a6,800072cc <__memset+0x1d4>
    80007124:	1cd76463          	bltu	a4,a3,800072ec <__memset+0x1f4>
    80007128:	1a078e63          	beqz	a5,800072e4 <__memset+0x1ec>
    8000712c:	00b50023          	sb	a1,0(a0)
    80007130:	00100713          	li	a4,1
    80007134:	1ae78463          	beq	a5,a4,800072dc <__memset+0x1e4>
    80007138:	00b500a3          	sb	a1,1(a0)
    8000713c:	00200713          	li	a4,2
    80007140:	1ae78a63          	beq	a5,a4,800072f4 <__memset+0x1fc>
    80007144:	00b50123          	sb	a1,2(a0)
    80007148:	00300713          	li	a4,3
    8000714c:	18e78463          	beq	a5,a4,800072d4 <__memset+0x1dc>
    80007150:	00b501a3          	sb	a1,3(a0)
    80007154:	00400713          	li	a4,4
    80007158:	1ae78263          	beq	a5,a4,800072fc <__memset+0x204>
    8000715c:	00b50223          	sb	a1,4(a0)
    80007160:	00500713          	li	a4,5
    80007164:	1ae78063          	beq	a5,a4,80007304 <__memset+0x20c>
    80007168:	00b502a3          	sb	a1,5(a0)
    8000716c:	00700713          	li	a4,7
    80007170:	18e79e63          	bne	a5,a4,8000730c <__memset+0x214>
    80007174:	00b50323          	sb	a1,6(a0)
    80007178:	00700e93          	li	t4,7
    8000717c:	00859713          	slli	a4,a1,0x8
    80007180:	00e5e733          	or	a4,a1,a4
    80007184:	01059e13          	slli	t3,a1,0x10
    80007188:	01c76e33          	or	t3,a4,t3
    8000718c:	01859313          	slli	t1,a1,0x18
    80007190:	006e6333          	or	t1,t3,t1
    80007194:	02059893          	slli	a7,a1,0x20
    80007198:	40f60e3b          	subw	t3,a2,a5
    8000719c:	011368b3          	or	a7,t1,a7
    800071a0:	02859813          	slli	a6,a1,0x28
    800071a4:	0108e833          	or	a6,a7,a6
    800071a8:	03059693          	slli	a3,a1,0x30
    800071ac:	003e589b          	srliw	a7,t3,0x3
    800071b0:	00d866b3          	or	a3,a6,a3
    800071b4:	03859713          	slli	a4,a1,0x38
    800071b8:	00389813          	slli	a6,a7,0x3
    800071bc:	00f507b3          	add	a5,a0,a5
    800071c0:	00e6e733          	or	a4,a3,a4
    800071c4:	000e089b          	sext.w	a7,t3
    800071c8:	00f806b3          	add	a3,a6,a5
    800071cc:	00e7b023          	sd	a4,0(a5)
    800071d0:	00878793          	addi	a5,a5,8
    800071d4:	fed79ce3          	bne	a5,a3,800071cc <__memset+0xd4>
    800071d8:	ff8e7793          	andi	a5,t3,-8
    800071dc:	0007871b          	sext.w	a4,a5
    800071e0:	01d787bb          	addw	a5,a5,t4
    800071e4:	0ce88e63          	beq	a7,a4,800072c0 <__memset+0x1c8>
    800071e8:	00f50733          	add	a4,a0,a5
    800071ec:	00b70023          	sb	a1,0(a4)
    800071f0:	0017871b          	addiw	a4,a5,1
    800071f4:	0cc77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    800071f8:	00e50733          	add	a4,a0,a4
    800071fc:	00b70023          	sb	a1,0(a4)
    80007200:	0027871b          	addiw	a4,a5,2
    80007204:	0ac77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007208:	00e50733          	add	a4,a0,a4
    8000720c:	00b70023          	sb	a1,0(a4)
    80007210:	0037871b          	addiw	a4,a5,3
    80007214:	0ac77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007218:	00e50733          	add	a4,a0,a4
    8000721c:	00b70023          	sb	a1,0(a4)
    80007220:	0047871b          	addiw	a4,a5,4
    80007224:	08c77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007228:	00e50733          	add	a4,a0,a4
    8000722c:	00b70023          	sb	a1,0(a4)
    80007230:	0057871b          	addiw	a4,a5,5
    80007234:	08c77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007238:	00e50733          	add	a4,a0,a4
    8000723c:	00b70023          	sb	a1,0(a4)
    80007240:	0067871b          	addiw	a4,a5,6
    80007244:	06c77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007248:	00e50733          	add	a4,a0,a4
    8000724c:	00b70023          	sb	a1,0(a4)
    80007250:	0077871b          	addiw	a4,a5,7
    80007254:	06c77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007258:	00e50733          	add	a4,a0,a4
    8000725c:	00b70023          	sb	a1,0(a4)
    80007260:	0087871b          	addiw	a4,a5,8
    80007264:	04c77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007268:	00e50733          	add	a4,a0,a4
    8000726c:	00b70023          	sb	a1,0(a4)
    80007270:	0097871b          	addiw	a4,a5,9
    80007274:	04c77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007278:	00e50733          	add	a4,a0,a4
    8000727c:	00b70023          	sb	a1,0(a4)
    80007280:	00a7871b          	addiw	a4,a5,10
    80007284:	02c77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007288:	00e50733          	add	a4,a0,a4
    8000728c:	00b70023          	sb	a1,0(a4)
    80007290:	00b7871b          	addiw	a4,a5,11
    80007294:	02c77663          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    80007298:	00e50733          	add	a4,a0,a4
    8000729c:	00b70023          	sb	a1,0(a4)
    800072a0:	00c7871b          	addiw	a4,a5,12
    800072a4:	00c77e63          	bgeu	a4,a2,800072c0 <__memset+0x1c8>
    800072a8:	00e50733          	add	a4,a0,a4
    800072ac:	00b70023          	sb	a1,0(a4)
    800072b0:	00d7879b          	addiw	a5,a5,13
    800072b4:	00c7f663          	bgeu	a5,a2,800072c0 <__memset+0x1c8>
    800072b8:	00f507b3          	add	a5,a0,a5
    800072bc:	00b78023          	sb	a1,0(a5)
    800072c0:	00813403          	ld	s0,8(sp)
    800072c4:	01010113          	addi	sp,sp,16
    800072c8:	00008067          	ret
    800072cc:	00b00693          	li	a3,11
    800072d0:	e55ff06f          	j	80007124 <__memset+0x2c>
    800072d4:	00300e93          	li	t4,3
    800072d8:	ea5ff06f          	j	8000717c <__memset+0x84>
    800072dc:	00100e93          	li	t4,1
    800072e0:	e9dff06f          	j	8000717c <__memset+0x84>
    800072e4:	00000e93          	li	t4,0
    800072e8:	e95ff06f          	j	8000717c <__memset+0x84>
    800072ec:	00000793          	li	a5,0
    800072f0:	ef9ff06f          	j	800071e8 <__memset+0xf0>
    800072f4:	00200e93          	li	t4,2
    800072f8:	e85ff06f          	j	8000717c <__memset+0x84>
    800072fc:	00400e93          	li	t4,4
    80007300:	e7dff06f          	j	8000717c <__memset+0x84>
    80007304:	00500e93          	li	t4,5
    80007308:	e75ff06f          	j	8000717c <__memset+0x84>
    8000730c:	00600e93          	li	t4,6
    80007310:	e6dff06f          	j	8000717c <__memset+0x84>

0000000080007314 <__memmove>:
    80007314:	ff010113          	addi	sp,sp,-16
    80007318:	00813423          	sd	s0,8(sp)
    8000731c:	01010413          	addi	s0,sp,16
    80007320:	0e060863          	beqz	a2,80007410 <__memmove+0xfc>
    80007324:	fff6069b          	addiw	a3,a2,-1
    80007328:	0006881b          	sext.w	a6,a3
    8000732c:	0ea5e863          	bltu	a1,a0,8000741c <__memmove+0x108>
    80007330:	00758713          	addi	a4,a1,7
    80007334:	00a5e7b3          	or	a5,a1,a0
    80007338:	40a70733          	sub	a4,a4,a0
    8000733c:	0077f793          	andi	a5,a5,7
    80007340:	00f73713          	sltiu	a4,a4,15
    80007344:	00174713          	xori	a4,a4,1
    80007348:	0017b793          	seqz	a5,a5
    8000734c:	00e7f7b3          	and	a5,a5,a4
    80007350:	10078863          	beqz	a5,80007460 <__memmove+0x14c>
    80007354:	00900793          	li	a5,9
    80007358:	1107f463          	bgeu	a5,a6,80007460 <__memmove+0x14c>
    8000735c:	0036581b          	srliw	a6,a2,0x3
    80007360:	fff8081b          	addiw	a6,a6,-1
    80007364:	02081813          	slli	a6,a6,0x20
    80007368:	01d85893          	srli	a7,a6,0x1d
    8000736c:	00858813          	addi	a6,a1,8
    80007370:	00058793          	mv	a5,a1
    80007374:	00050713          	mv	a4,a0
    80007378:	01088833          	add	a6,a7,a6
    8000737c:	0007b883          	ld	a7,0(a5)
    80007380:	00878793          	addi	a5,a5,8
    80007384:	00870713          	addi	a4,a4,8
    80007388:	ff173c23          	sd	a7,-8(a4)
    8000738c:	ff0798e3          	bne	a5,a6,8000737c <__memmove+0x68>
    80007390:	ff867713          	andi	a4,a2,-8
    80007394:	02071793          	slli	a5,a4,0x20
    80007398:	0207d793          	srli	a5,a5,0x20
    8000739c:	00f585b3          	add	a1,a1,a5
    800073a0:	40e686bb          	subw	a3,a3,a4
    800073a4:	00f507b3          	add	a5,a0,a5
    800073a8:	06e60463          	beq	a2,a4,80007410 <__memmove+0xfc>
    800073ac:	0005c703          	lbu	a4,0(a1)
    800073b0:	00e78023          	sb	a4,0(a5)
    800073b4:	04068e63          	beqz	a3,80007410 <__memmove+0xfc>
    800073b8:	0015c603          	lbu	a2,1(a1)
    800073bc:	00100713          	li	a4,1
    800073c0:	00c780a3          	sb	a2,1(a5)
    800073c4:	04e68663          	beq	a3,a4,80007410 <__memmove+0xfc>
    800073c8:	0025c603          	lbu	a2,2(a1)
    800073cc:	00200713          	li	a4,2
    800073d0:	00c78123          	sb	a2,2(a5)
    800073d4:	02e68e63          	beq	a3,a4,80007410 <__memmove+0xfc>
    800073d8:	0035c603          	lbu	a2,3(a1)
    800073dc:	00300713          	li	a4,3
    800073e0:	00c781a3          	sb	a2,3(a5)
    800073e4:	02e68663          	beq	a3,a4,80007410 <__memmove+0xfc>
    800073e8:	0045c603          	lbu	a2,4(a1)
    800073ec:	00400713          	li	a4,4
    800073f0:	00c78223          	sb	a2,4(a5)
    800073f4:	00e68e63          	beq	a3,a4,80007410 <__memmove+0xfc>
    800073f8:	0055c603          	lbu	a2,5(a1)
    800073fc:	00500713          	li	a4,5
    80007400:	00c782a3          	sb	a2,5(a5)
    80007404:	00e68663          	beq	a3,a4,80007410 <__memmove+0xfc>
    80007408:	0065c703          	lbu	a4,6(a1)
    8000740c:	00e78323          	sb	a4,6(a5)
    80007410:	00813403          	ld	s0,8(sp)
    80007414:	01010113          	addi	sp,sp,16
    80007418:	00008067          	ret
    8000741c:	02061713          	slli	a4,a2,0x20
    80007420:	02075713          	srli	a4,a4,0x20
    80007424:	00e587b3          	add	a5,a1,a4
    80007428:	f0f574e3          	bgeu	a0,a5,80007330 <__memmove+0x1c>
    8000742c:	02069613          	slli	a2,a3,0x20
    80007430:	02065613          	srli	a2,a2,0x20
    80007434:	fff64613          	not	a2,a2
    80007438:	00e50733          	add	a4,a0,a4
    8000743c:	00c78633          	add	a2,a5,a2
    80007440:	fff7c683          	lbu	a3,-1(a5)
    80007444:	fff78793          	addi	a5,a5,-1
    80007448:	fff70713          	addi	a4,a4,-1
    8000744c:	00d70023          	sb	a3,0(a4)
    80007450:	fec798e3          	bne	a5,a2,80007440 <__memmove+0x12c>
    80007454:	00813403          	ld	s0,8(sp)
    80007458:	01010113          	addi	sp,sp,16
    8000745c:	00008067          	ret
    80007460:	02069713          	slli	a4,a3,0x20
    80007464:	02075713          	srli	a4,a4,0x20
    80007468:	00170713          	addi	a4,a4,1
    8000746c:	00e50733          	add	a4,a0,a4
    80007470:	00050793          	mv	a5,a0
    80007474:	0005c683          	lbu	a3,0(a1)
    80007478:	00178793          	addi	a5,a5,1
    8000747c:	00158593          	addi	a1,a1,1
    80007480:	fed78fa3          	sb	a3,-1(a5)
    80007484:	fee798e3          	bne	a5,a4,80007474 <__memmove+0x160>
    80007488:	f89ff06f          	j	80007410 <__memmove+0xfc>

000000008000748c <__putc>:
    8000748c:	fe010113          	addi	sp,sp,-32
    80007490:	00813823          	sd	s0,16(sp)
    80007494:	00113c23          	sd	ra,24(sp)
    80007498:	02010413          	addi	s0,sp,32
    8000749c:	00050793          	mv	a5,a0
    800074a0:	fef40593          	addi	a1,s0,-17
    800074a4:	00100613          	li	a2,1
    800074a8:	00000513          	li	a0,0
    800074ac:	fef407a3          	sb	a5,-17(s0)
    800074b0:	fffff097          	auipc	ra,0xfffff
    800074b4:	b3c080e7          	jalr	-1220(ra) # 80005fec <console_write>
    800074b8:	01813083          	ld	ra,24(sp)
    800074bc:	01013403          	ld	s0,16(sp)
    800074c0:	02010113          	addi	sp,sp,32
    800074c4:	00008067          	ret

00000000800074c8 <__getc>:
    800074c8:	fe010113          	addi	sp,sp,-32
    800074cc:	00813823          	sd	s0,16(sp)
    800074d0:	00113c23          	sd	ra,24(sp)
    800074d4:	02010413          	addi	s0,sp,32
    800074d8:	fe840593          	addi	a1,s0,-24
    800074dc:	00100613          	li	a2,1
    800074e0:	00000513          	li	a0,0
    800074e4:	fffff097          	auipc	ra,0xfffff
    800074e8:	ae8080e7          	jalr	-1304(ra) # 80005fcc <console_read>
    800074ec:	fe844503          	lbu	a0,-24(s0)
    800074f0:	01813083          	ld	ra,24(sp)
    800074f4:	01013403          	ld	s0,16(sp)
    800074f8:	02010113          	addi	sp,sp,32
    800074fc:	00008067          	ret

0000000080007500 <console_handler>:
    80007500:	fe010113          	addi	sp,sp,-32
    80007504:	00813823          	sd	s0,16(sp)
    80007508:	00113c23          	sd	ra,24(sp)
    8000750c:	00913423          	sd	s1,8(sp)
    80007510:	02010413          	addi	s0,sp,32
    80007514:	14202773          	csrr	a4,scause
    80007518:	100027f3          	csrr	a5,sstatus
    8000751c:	0027f793          	andi	a5,a5,2
    80007520:	06079e63          	bnez	a5,8000759c <console_handler+0x9c>
    80007524:	00074c63          	bltz	a4,8000753c <console_handler+0x3c>
    80007528:	01813083          	ld	ra,24(sp)
    8000752c:	01013403          	ld	s0,16(sp)
    80007530:	00813483          	ld	s1,8(sp)
    80007534:	02010113          	addi	sp,sp,32
    80007538:	00008067          	ret
    8000753c:	0ff77713          	andi	a4,a4,255
    80007540:	00900793          	li	a5,9
    80007544:	fef712e3          	bne	a4,a5,80007528 <console_handler+0x28>
    80007548:	ffffe097          	auipc	ra,0xffffe
    8000754c:	6dc080e7          	jalr	1756(ra) # 80005c24 <plic_claim>
    80007550:	00a00793          	li	a5,10
    80007554:	00050493          	mv	s1,a0
    80007558:	02f50c63          	beq	a0,a5,80007590 <console_handler+0x90>
    8000755c:	fc0506e3          	beqz	a0,80007528 <console_handler+0x28>
    80007560:	00050593          	mv	a1,a0
    80007564:	00001517          	auipc	a0,0x1
    80007568:	ed450513          	addi	a0,a0,-300 # 80008438 <CONSOLE_STATUS+0x428>
    8000756c:	fffff097          	auipc	ra,0xfffff
    80007570:	afc080e7          	jalr	-1284(ra) # 80006068 <__printf>
    80007574:	01013403          	ld	s0,16(sp)
    80007578:	01813083          	ld	ra,24(sp)
    8000757c:	00048513          	mv	a0,s1
    80007580:	00813483          	ld	s1,8(sp)
    80007584:	02010113          	addi	sp,sp,32
    80007588:	ffffe317          	auipc	t1,0xffffe
    8000758c:	6d430067          	jr	1748(t1) # 80005c5c <plic_complete>
    80007590:	fffff097          	auipc	ra,0xfffff
    80007594:	3e0080e7          	jalr	992(ra) # 80006970 <uartintr>
    80007598:	fddff06f          	j	80007574 <console_handler+0x74>
    8000759c:	00001517          	auipc	a0,0x1
    800075a0:	f9c50513          	addi	a0,a0,-100 # 80008538 <digits+0x78>
    800075a4:	fffff097          	auipc	ra,0xfffff
    800075a8:	a68080e7          	jalr	-1432(ra) # 8000600c <panic>
	...
