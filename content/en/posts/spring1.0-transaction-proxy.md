---
title: Spring1.0-Transaction-Proxy
date: 2020-03-05
categories: ['Spring']
draft: false
---

```
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
		<property name="driverClassName"><value>${jdbc.driverClassName}</value></property>
		<property name="url"><value>${jdbc.url}</value></property>
		<property name="username"><value>${jdbc.username}</value></property>
		<property name="password"><value>${jdbc.password}</value></property>
</bean>

<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource"><ref local="dataSource"/></property>
</bean>
	
	
<bean id="petStoreTarget" class="org.springframework.samples.jpetstore.domain.logic.PetStoreImpl">
		<property name="accountDao"><ref bean="accountDao"/></property>
		<property name="categoryDao"><ref bean="categoryDao"/></property>
		<property name="productDao"><ref bean="productDao"/></property>
		<property name="itemDao"><ref bean="itemDao"/></property>
		<property name="orderDao"><ref bean="orderDao"/></property>
</bean>


<bean id="petStore" class="org.springframework.transaction.interceptor.TransactionProxyFactoryBean">
		<property name="transactionManager"><ref bean="transactionManager"/></property>
		<property name="target"><ref local="petStoreTarget"/></property>
		<property name="transactionAttributes">
			<props>
				<prop key="insert*">PROPAGATION_REQUIRED</prop>
				<prop key="update*">PROPAGATION_REQUIRED</prop>
				<prop key="*">PROPAGATION_REQUIRED,readOnly</prop>
			</props>
		</property>
</bean>
```