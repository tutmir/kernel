#include "buffer.hpp"
#include "../test/printing.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    printString("Control point 3\n");
    sem_open(&itemAvailable, 0);

    printString("Control point 4\n");
    sem_open(&spaceAvailable, _cap);
    sem_open(&mutexHead, 1);
    sem_open(&mutexTail, 1);
}

Buffer::~Buffer() {
    putc('\n');
    printString("Buffer deleted!\n");
    while (getCnt() > 0) {
        char ch = buffer[head];
        putc(ch);
        head = (head + 1) % cap;
    }
    putc('!');
    putc('\n');

    mem_free(buffer);
    sem_close(itemAvailable);
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    printString("Entered put\n");
    sem_wait(spaceAvailable);
    //printString("Waited on spaceAvaileble\n");

    sem_wait(mutexTail);
    //printString("Waited on mutex\n");
    buffer[tail] = val;
    tail = (tail + 1) % cap;
    sem_signal(mutexTail);
    //printString("Signaled mutex\n");

    sem_signal(itemAvailable);
    //printString("Signaled itemAvailable\n");

}

int Buffer::get() {
    sem_wait(itemAvailable);

    sem_wait(mutexHead);

    int ret = buffer[head];
    head = (head + 1) % cap;
    sem_signal(mutexHead);

    sem_signal(spaceAvailable);

    return ret;
}

int Buffer::getCnt() {
    int ret;

    sem_wait(mutexHead);
    sem_wait(mutexTail);

    if (tail >= head) {
        ret = tail - head;
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    sem_signal(mutexHead);

    return ret;
}
