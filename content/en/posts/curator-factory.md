---
title: CuratorBuild
date: 2020-03-07
categories: ['zookeeper']
draft: false
---

```
CuratorFrameworkFactory.builder()
               .connectString(connectionString)
               .retryPolicy(retryPolicy)
               .connectionTimeoutMs(connectionTimeoutMs)
               .sessionTimeoutMs(sessionTimeoutMs)
               .build();
```