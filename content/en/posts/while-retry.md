---
title: while-retry
date: 2020-03-08
categories: ['util']
draft: false
---

```
int retryAttempt = 1;
while (retryAttempt < 1000) {
      sleep(1000L * 15);
      retryAttempt++;
}
    
```

```
  private void sleep(final long milliseconds) {
    try {
      Thread.sleep(milliseconds);
    } catch (final InterruptedException e) {
      logger.error("Sleep interrupted", e);
    }
  }
```
