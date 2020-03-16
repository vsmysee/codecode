---
title: ConcurrentHashMap-Lock
date: 2020-03-16
categories: ['jdk']
draft: false
---


锁在了桶的头节点上

```

Node<K,V> f; 

int n, i, fh;
            if (tab == null || (n = tab.length) == 0)
                tab = initTable();
            else if ((f = tabAt(tab, i = (n - 1) & hash)) == null) {
                if (casTabAt(tab, i, null,
                             new Node<K,V>(hash, key, value, null)))
                    break;                   // no lock when adding to empty bin
            }
            

 synchronized (f) {
                    if (tabAt(tab, i) == f) {
                    
```
