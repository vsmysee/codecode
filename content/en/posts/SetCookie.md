---
title: SetCookie
date: 2020-03-10
categories: ['web']
draft: false
---

```
	private static void set(HttpServletResponse response, String key, String value, String domain, String path, int maxAge, boolean isHttpOnly) {
		Cookie cookie = new Cookie(key, value);
		if (domain != null) {
			cookie.setDomain(domain);
		}
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		cookie.setHttpOnly(isHttpOnly);
		response.addCookie(cookie);
	}
```
