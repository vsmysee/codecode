---
title: Redis-Lock
date: 2020-03-17
categories: ['jdk']
draft: false
---

```
    private final ReentrantLock runLock = new ReentrantLock();

        public void runLoop() {
            if (runLock.tryLock()) {
                isRunningFuture.complete(null);
                try {
                    setThread();
                    while (isOpen()) {
                        singleLoop();
                    }
                } finally {
                    try {
                        cleanupAndCloseChannels();
                    } finally {
                        try {
                            selector.close();
                        } catch (IOException e) {
                            eventHandler.selectorException(e);
                        } finally {
                            runLock.unlock();
                            exitedLoop.countDown();
                        }
                    }
                }
            } else {
                throw new IllegalStateException("selector is already running");
            }
        }

```
