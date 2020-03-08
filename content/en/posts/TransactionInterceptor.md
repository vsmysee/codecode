---
title: TransactionInterceptor
date: 2020-03-08
categories: ['spring']
draft: false
---


```
public class TransactionInterceptor implements MethodInterceptor, InitializingBean {
	
	/** Holder to support the currentTransactionStatus() method */
	
	//当前事务
	private static ThreadLocal currentTransactionStatus = new ThreadLocal();


            // the transaction manager will flag an error if an incompatible tx already exists
			status = this.transactionManager.getTransaction(transAtt);
			
			// make the TransactionStatus available to callees
			oldTransactionStatus = (TransactionStatus) currentTransactionStatus.get();
			
			currentTransactionStatus.set(status);


}

```