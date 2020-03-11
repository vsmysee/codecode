---
title: kikari-pool
date: 2020-03-07
categories: ['jdbc']
draft: false
---

```
    <bean id="dataSourceConfig" class="com.zaxxer.hikari.HikariConfig">
        <property name="poolName" value="decisionHikariCP"/>
        <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
        <property name="maximumPoolSize" value="${mysql_pool}"/>
        <property name="jdbcUrl" value="${mysql_url}"/>
        <property name="username" value="${mysql_username}"/>
        <property name="password" value="${mysql_password}"/>
    </bean>


    <bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
        <constructor-arg ref="dataSourceConfig"/>
    </bean>

    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>
```