---
title: gradle-cache
date: 2020-03-07
categories: ['gradle']
draft: false
---

```
configurations.all {
        resolutionStrategy.cacheChangingModulesFor 0, 'seconds'
}
```