//
// Created by os on 8/13/24.
//

#ifndef syscall_c
#define syscall_c

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"
#include "TCB.hpp"
#include "../lib/console.h"

using Telo = void (*) (void*);

typedef TCB* thread_t;

int mem_free(void* memorija);

void* mem_alloc(size_t velicina);

int thread_create(thread_t* handle, void (*start_routine) (void*), void* argumenti);

int thread_exit();

void thread_dispatch();

void thread_start(TCB*);

int thread_no_start(thread_t* handle, void(*start_routine) (void*), void* argumenti);

char getc();

void putc(char c);



#endif
