---
title: start-some-docker
date: 2020-03-07
categories: ['spring']
draft: false
---

```
docker run  --name mysql -p 3307:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.6

docker run -p 6379:6379 -d redis:3.2 redis-server --appendonly yes

docker run -d --name myrabbit -p 15672:15672 -p 5672:5672 rabbitmq:3.6.15-management

docker run --name zk -p 2181:2181 -p 2888:2888 -p 3888:3888 --restart always -d zookeeper:3.5.6
```