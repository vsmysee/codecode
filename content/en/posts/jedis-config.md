---
title: jedis-config
date: 2020-03-07
categories: ['redis']
draft: false
---

```
  <bean id="sentinelConfig" class="org.springframework.data.redis.connection.RedisSentinelConfiguration">
        <property name="master">
            <bean class="org.springframework.data.redis.connection.RedisNode">
                <property name="name" value="${REDIS_SENTINELS_MASTER}"></property>
            </bean>
        </property>

        <property name="sentinels">
            <set>
                <bean class="org.springframework.data.redis.connection.RedisNode">
                    <constructor-arg name="host" value="${REDIS_SENTINELS_NODE1}"></constructor-arg>
                    <constructor-arg name="port" value="${REDIS_SENTINELS_NODE1_PORT}"></constructor-arg>
                </bean>
                <bean class="org.springframework.data.redis.connection.RedisNode">
                    <constructor-arg name="host" value="${REDIS_SENTINELS_NODE2}"></constructor-arg>
                    <constructor-arg name="port" value="${REDIS_SENTINELS_NODE2_PORT}"></constructor-arg>
                </bean>
                <bean class="org.springframework.data.redis.connection.RedisNode">
                    <constructor-arg name="host" value="${REDIS_SENTINELS_NODE3}"></constructor-arg>
                    <constructor-arg name="port" value="${REDIS_SENTINELS_NODE3_PORT}"></constructor-arg>
                </bean>
            </set>
        </property>
    </bean>

    <bean id="jedisConnFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory">
        <constructor-arg name="sentinelConfig" ref="sentinelConfig"/>
    </bean>

    <bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
        <property name="connectionFactory" ref="jedisConnFactory"/>
    </bean>

```