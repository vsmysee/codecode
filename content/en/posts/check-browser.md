---
title: check-browser
date: 2020-03-08
categories: ['util']
draft: false
---

```

private static final Pattern BROWSWER_PATTERN = Pattern.compile(".*Gecko.*|.*AppleWebKit.*|.*Trident.*|.*Chrome.*");


public static boolean isFromBrowser(final String userAgent) {
    if (userAgent == null) {
      return false;
    }

    if (BROWSWER_PATTERN.matcher(userAgent).matches()) {
      return true;
    } else {
      return false;
    }
  }
```
