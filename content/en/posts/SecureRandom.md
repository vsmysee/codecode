---
title: SecureRandom
date: 2020-03-08
categories: ['random']
draft: false
---

```
        SecureRandom random = new SecureRandom();
        byte[] data = new byte[2048];
        random.nextBytes(data);
```
