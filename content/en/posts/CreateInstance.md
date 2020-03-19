---
title: CreateInstance
date: 2020-03-10
categories: ['jdk']
draft: false
---

```
Employee.class.newInstance();
Employee emp = (Employee) Class.forName("org.programming.mitra.exercises.Employee").newInstance();
Constructor<Employee> constructor = Employee.class.getConstructor();
Employee emp3 = constructor.newInstance();
```
