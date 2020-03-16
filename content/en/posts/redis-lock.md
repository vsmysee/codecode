---
title: Redis-Lock
date: 2020-03-16
categories: ['redis']
draft: false
---


不可靠
```
setnx lock:code true

expire lock:code 5

del lock:code
```

相对好点

```
        local key   = KEYS[1]
        local value = ARGV[1]
        local ttl   = ARGV[2]

        local ok = redis.call('setnx', key, value)
        if ok == 1 then
            redis.call('expire', key, ttl)
        end
        return ok
```

```
!redis-cli set lock:code true ex 5 nx
```


```
if redis.call("get",KEYS[1]) == ARGV[1] then
    return redis.call("del",KEYS[1])
else
    return 0
end

```


