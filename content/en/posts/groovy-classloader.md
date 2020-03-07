---
title: groovy-classloader
date: 2020-03-07
categories: ['groovy']
draft: false
---

```
 public Class compile(String sCode, String sName) {
        GroovyClassLoader loader = getGroovyClassLoader();
        return loader.parseClass(sCode, sName);
    }


    private GroovyClassLoader getGroovyClassLoader() {
        return new GroovyClassLoader();
    }
```