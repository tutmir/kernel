//
// Created by os on 8/20/24.
//

#include "../h/syscall_c.h"

void* operator new(size_t velicina)
{
  return mem_alloc(velicina);
}

void* operator new[](size_t velicina)
{
  return mem_alloc(velicina);
}

void operator delete(void* pokazivac) noexcept
{
  mem_free(pokazivac);
}

void operator delete[](void* pokazivac) noexcept
{
  mem_free(pokazivac);
}

