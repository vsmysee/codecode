---
title: isPrime
date: 2020-03-18
categories: ['algorithm']
draft: false
---

```
public boolean isPrime(int n) {
	if(n < 2) 
		return false;
	for(int i = 2; i < n; ++i)
		if( n % i == 0) 
			return false;
	return true;
}
```
