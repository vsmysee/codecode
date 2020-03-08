---
title: java-joda-time
date: 2020-03-08
categories: ['date']
draft: false
---


```
Instant - 不可变的类，用来表示时间轴上一个瞬时的点
DateTime - 不可变的类，用来替换JDK的Calendar类
LocalDate - 不可变的类，表示一个本地的日期，而不包含时间部分（没有时区信息）
LocalTime - 不可变的类，表示一个本地的时间，而不包含日期部分（没有时区信息）
LocalDateTime - 不可变的类，表示一个本地的日期－时间（没有时区信息）



DateTime dateTime1 = new DateTime();
DateTime dateTime2 = new DateTime(2016,2,14,0,0,0);
DateTime dateTime3 = new DateTime(1456473917004L);
DateTime dateTime4 = new DateTime(new Date());
DateTime dateTime5 = new DateTime("2016-02-15T00:00:00.000+08:00");


DateTime tomorrow = now.plusDays(1);
DateTime lastMonth = now.minusMonths(1);

```
