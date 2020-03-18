---
title: quick
date: 2020-03-10
categories: ['algorithm']
draft: false
---

```
def quicksort a
  (pivot = a.pop) ? quicksort(a.select{|i| i < pivot}) + [pivot] + quicksort(a.select{|i| i > pivot}) : []
end
```
