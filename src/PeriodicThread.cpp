//
// Created by os on 9/9/24.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.h"
#include "../h/TCB.hpp"

void PeriodicThread::terminate()
    {
       myHandle->postaviStatus(true);
       thread_dispatch();
    }


PeriodicThread::PeriodicThread(time_t period) : period(period) {}
