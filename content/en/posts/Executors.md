
---
title: Executors
date: 2020-03-08
categories: ['thread']
draft: false
---


```
def c = new Counter()
def pool = Executors.newFixedThreadPool(4)
1000.times {
    pool.submit { c.incrementAndGet() }
}
pool.shutdown()
pool.awaitTermination(5, TimeUnit.SECONDS)
```


```
class Counter {
    int cpt
    private final Object myLock = new Object()
    
    @Synchronized('myLock')
    int incrementAndGet() {
        cpt++
    }
    int get() {
        cpt
    }
}
```
