---
title: case-insensitive-hashmap
date: 2020-03-08
categories: ['hashmap']
draft: false
---

```
public class CaseInsensitiveConcurrentHashMap<V> {

  private final ConcurrentHashMap<String, V> map = new ConcurrentHashMap<>();

  public V put(final String key, final V value) {
    return this.map.put(key.toLowerCase(), value);
  }

  public V get(final String key) {
    return this.map.get(key.toLowerCase());
  }

  public boolean containsKey(final String key) {
    return this.map.containsKey(key.toLowerCase());
  }

  public V remove(final String key) {
    return this.map.remove(key.toLowerCase());
  }

}
```