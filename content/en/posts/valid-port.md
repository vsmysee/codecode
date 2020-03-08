---
title: valid-port
date: 2020-03-08
categories: ['net']
draft: false
---

```
  public static boolean isValidPort(final int port) {
    if (port >= 1 && port <= 65535) {
      return true;
    }
    return false;
  }
```