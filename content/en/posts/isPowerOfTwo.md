---
title: isPowerOfTwo
date: 2020-03-08
categories: ['algorithm']
draft: false
---

```
public boolean isPowerOfTwo(int n) {
        return n > 0 && (n & (n - 1)) == 0;
    }

```
