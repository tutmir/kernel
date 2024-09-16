//
// Created by os on 8/20/24.
//
#include "../h/syscall_c.h"
#include "../test/printing.hpp"
#include "../h/MemoryAllocator.hpp"
void* operator new(size_t velicina)
{
    //printString("Pozvao new\n");
    return MemoryAllocator::mem_alloc(velicina);
}

void* operator new[](size_t velicina)
{
    return MemoryAllocator::mem_alloc(velicina);
}

void operator delete(void* pokazivac) noexcept
{
    MemoryAllocator::mem_free(pokazivac);
}

void operator delete[](void* pokazivac) noexcept
{
    MemoryAllocator::mem_free(pokazivac);
}
