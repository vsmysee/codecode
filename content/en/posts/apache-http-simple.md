---
title: apache-http-simple
date: 2020-03-08
categories: ['http']
draft: false
---


```
  protected T sendAndReturn(final HttpUriRequest request) throws IOException {
    try (CloseableHttpClient client = HttpClients.createDefault()) {
      return this.parseResponse(client.execute(request));
    }
  }
```
