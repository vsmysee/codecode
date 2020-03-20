---
title: RateLimiter
date: 2020-03-08
categories: ['jdk']
draft: false
---

```
  RateLimiter rateLimiter = RateLimiter.create(100);
  ExecutorService executorService = Executors.newFixedThreadPool(100);
  Runnable runnable = ()->{
    if(!rateLimiter.tryAcquire(1,100,TimeUnit.MILLISECONDS)){
      System.out.println("F"+Thread.currentThread().getName());
    }else {
      System.out.println("A"+Thread.currentThread().getName());
    }
  };
  for (int i = 0; i < 20; i++) {
    executorService.execute(runnable);
  }
  try {
    executorService.awaitTermination(1,TimeUnit.SECONDS);
  } catch (InterruptedException e) {
    e.printStackTrace();
  }
```
