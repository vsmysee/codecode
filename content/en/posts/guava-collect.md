---
title: guava-collect
date: 2020-03-08
categories: ['guava']
draft: false
---

```
ImmutableSet.of("apple", "watermelon", "cherry", "mango");

ImmutableList<String> immutableList = ImmutableList.of("a", "b", "c");

Map<String, String> map = Maps.newHashMap();

Set<Object> hashSet = Sets.newHashSet();


BiMap<String, String> biMap = HashBiMap.create();
biMap.put("k1", "v1");
biMap.put("k2", "v2");
biMap.put("k3", "v3");


ArrayListMultimap<String, String> multimap = ArrayListMultimap.create();


List<String> list = Lists.newArrayList("a", "b", "c");
String join = Joiner.on(",").join(list);



String value = "a,b,c,d      ";
List<String> list = Splitter.on(",").trimResults().splitToList(value);



```