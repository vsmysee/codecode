---
title: fibonacci
date: 2020-03-18
categories: ['algorithm']
draft: false
---

```
int [] fib = new int[max];
int fibonacci( int  i) {
	if(i==0 || i == 1) return i;
	if(fib[i] != 0) return fib[i];
	fib[i] = fibonacci(i-1) + fibonacci(i-2);
	return fib[i];
}
```
