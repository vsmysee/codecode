---
title: grab-http
date: 2020-03-08
categories: ['groovy']
draft: false
---

```
@Grab(group = 'com.sparkjava', module = 'spark-core', version = '2.1')
import static spark.Spark.*

staticFileLocation '.'
port(8000)

get '/', { req, res -> 'this is groovy k8s proxy' }
```
