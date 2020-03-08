---
title: HmacSha1
date: 2020-03-08
categories: ['encrypt']
draft: false
---

```

  private static final String HMAC_SHA1 = 'HmacSHA1'

  private static String sign(final String body, final String secret) {
    def key = new SecretKeySpec(secret.bytes, HMAC_SHA1)
    def mac = Mac.getInstance(HMAC_SHA1)
    mac.init(key)
    def bytes = mac.doFinal(body.bytes)
    return HEX.encode(bytes)
  }
```