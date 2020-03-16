---
title: ThreadPoolExecutor
date: 2020-03-16
categories: ['jdk']
draft: false
---

```
    private static ExecutorService createExecutor() {
        final int threadsCount = Math.min(
                Runtime.getRuntime().availableProcessors(),
                Utils.CI_COMPILER_COUNT);
        ExecutorService result;
        if (threadsCount > 1) {
            result = new ThreadPoolExecutor(threadsCount, threadsCount,
                    /* keepAliveTime */ 0L, TimeUnit.MILLISECONDS,
                    new ArrayBlockingQueue<>(threadsCount),
                    new ThreadPoolExecutor.CallerRunsPolicy());
        } else {
            result = new CurrentThreadExecutor();
        }
        return result;
    }

```
