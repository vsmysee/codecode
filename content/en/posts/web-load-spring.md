---
title: web-load-spring
date: 2020-03-15
categories: ['spring']
draft: false
---

```
<context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
</context-param>
    
    
<listener>
      <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
    
```
