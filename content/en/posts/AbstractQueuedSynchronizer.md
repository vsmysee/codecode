---
title: AbstractQueuedSynchronizer
date: 2020-03-08
categories: ['jdk']
draft: false
---

```
    private volatile int state;

```


```
Node {

    int waitStatus;

    Node prev;

    Node next;

    Node nextWaiter;

    Thread thread;

}

```
