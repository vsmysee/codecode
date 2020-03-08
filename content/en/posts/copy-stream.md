---
title: application-provider
date: 2020-03-08
categories: ['io']
draft: false
---

```
  public static void copyStream(final InputStream input, final OutputStream output)
      throws IOException {
    final byte[] buffer = new byte[1024];
    int bytesRead;
    while ((bytesRead = input.read(buffer)) != -1) {
      output.write(buffer, 0, bytesRead);
    }
  }
```