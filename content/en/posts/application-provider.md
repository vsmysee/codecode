---
title: application-provider
date: 2020-03-07
categories: ['spring']
draft: false
---

```
public class ApplicationContextProvider implements ApplicationContextAware {

    private static ApplicationContext context;

    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        IOC.context = applicationContext;
    }

    public static ApplicationContext getApplicationContext() {
        return context;
    }

    public static <T> T get(String name) {
        return (T) context.getBean(name);
    }

    public static <T> T get(Class<T> type) {
        return context.getBean(type);
    }
}

```