
---
title: CyclicBarrier
date: 2020-03-08
categories: ['thread']
draft: false
---


```
def concurrent(int count, Closure closure) {
        def values = []
        def futures = []

        ExecutorService executor = Executors.newFixedThreadPool(count)
        CyclicBarrier barrier = new CyclicBarrier(count)

        (1..count).each {
            futures << executor.submit({
                barrier.await()
                closure.call()
            } as Callable)
        }


        futures.each {
            try {
                values << it.get()
            } catch (ExecutionException e) {
                values << e.cause
            }
        }

        values
    }
```
