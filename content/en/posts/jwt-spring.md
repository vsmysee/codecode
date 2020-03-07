---
title: jwt-spring
date: 2020-03-07
categories: ['spring']
draft: false
---

```

import org.springframework.security.jwt.Jwt;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.security.jwt.crypto.sign.MacSigner;


final static MacSigner hmac = new MacSigner(Base64.decode(WebConfig.getAppAccessTokenKey()));
Jwt token = JwtHelper.encode(CryptUtil.encrypt(claims), hmac);
JwtHelper.decode(token).verifySignature(hmac);
String claims = JwtHelper.decode(token).getClaims();
```