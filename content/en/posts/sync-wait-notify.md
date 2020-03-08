---
title: sync-notify-wait
date: 2020-03-08
categories: ['thread']
draft: false
---

```
public class ConcurrencyThrottleInterceptor implements MethodInterceptor {

	protected final Log logger = LogFactory.getLog(getClass());

	private int concurrencyLimit = 1;

	private int concurrencyCount = 0;

	/**
	 * Set the maximum number of parallel invocations that this interceptor
	 * allows. Default is 1 (having the same effect as a synchronized block).
	 */
	public void setConcurrencyLimit(int concurrencyLimit) {
		this.concurrencyLimit = concurrencyLimit;
	}

	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		boolean debug = logger.isDebugEnabled();
		synchronized (this) {
			while (this.concurrencyCount >= this.concurrencyLimit) {
				if (debug) {
					logger.debug("Concurrency count " + this.concurrencyCount +
											 " has reached limit " + this.concurrencyLimit + " - blocking");
				}
				try {
					wait();
				}
				catch (InterruptedException ex) {
				}
			}
			if (debug) {
				logger.debug("Entering method at concurrency count " + this.concurrencyCount);
			}
			this.concurrencyCount++;
		}
		try {
			return methodInvocation.proceed();
		}
		finally {
			synchronized (this) {
				this.concurrencyCount--;
				if (debug) {
					logger.debug("Returning from method at concurrency count " + this.concurrencyCount);
				}
				notify();
			}
		}
	}

}
```
