//
// Created by os on 8/13/24.
//

#ifndef syscall_c
#define syscall_c

#include "../lib/hw.h"
#include "MemoryAllocator.hpp"
#include "TCB.hpp"
#include "MojSemafor.hpp"

using Telo = void (*) (void*);

typedef TCB* thread_t;
typedef MojSemafor* sem_t;

int mem_free(void* memorija);

void* mem_alloc(size_t velicina);

int thread_create(thread_t* handle, void (*start_routine) (void*), void* argumenti);

int thread_exit();

void thread_dispatch();

void thread_start(TCB*);

int thread_no_start(thread_t* handle, void(*start_routine) (void*), void* argumenti);

int sem_open(sem_t* handle, unsigned init);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_signal(sem_t id);

int sem_trywait(sem_t id);

int time_sleep(time_t vreme);

char getc();

void putc(char c);



#endif
