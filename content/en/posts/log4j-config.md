---
title: log4j-config
date: 2020-03-07
categories: ['log']
draft: false
---

```
log4j.rootLogger=INFO, Console
  
#Console  
log4j.appender.Console=org.apache.log4j.ConsoleAppender  
log4j.appender.Console.layout=org.apache.log4j.PatternLayout  
log4j.appender.Console.layout.ConversionPattern=%d [%t] %-5p [%c] - %m%n

log4j.category.org.springframework=ERROR
```