---
title: logback-gelf
date: 2020-03-07
categories: ['log']
draft: false
---

普通配置

```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%-5level] %logger{15} - %msg%n%rEx</pattern>
            <immediateFlush>false</immediateFlush>
        </encoder>
    </appender>
    <root level="WARN">
        <appender-ref ref="CONSOLE" />
    </root>
</configuration>
```

Gelf配置

```
<!DOCTYPE configuration>

<configuration>
    <jmxConfigurator/>
    <appender name="gelf" class="biz.paluch.logging.gelf.logback.GelfLogbackAppender">
        <host>redis://localhost:6379#gelf</host>
        <port>6379</port>
        <version>1.1</version>
        <facility>logback</facility>
        <extractStackTrace>true</extractStackTrace>
        <filterStackTrace>true</filterStackTrace>
        <mdcProfiling>true</mdcProfiling>
        <timestampPattern>yyyy-MM-dd HH:mm:ss,SSSS</timestampPattern>
        <maximumMessageSize>8192</maximumMessageSize>

        <!-- This are static fields -->
        <additionalFields>application=test-app,environment=dev,source_host=172.22.47.1
        </additionalFields>

        <!-- This are fields using MDC -->
        <!--
        <mdcFields>mdcField1,mdcField2</mdcFields>
        <dynamicMdcFields>mdc.*,(mdc|MDC)fields</dynamicMdcFields>
        -->
        <includeFullMdc>true</includeFullMdc>
        <!--
        <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
            <level>INFO</level>
        </filter>
        -->
    </appender>
    
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <!-- encoders are assigned the type
             ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
        <encoder>
            <pattern>%-4relative [%thread] %-5level %logger{35} - %msg %n</pattern>
        </encoder>
    </appender>
    
    <appender name ="ASYNC" class= "ch.qos.logback.classic.AsyncAppender">
        <queueSize>256</queueSize>
        <appender-ref ref ="gelf"/>
        <neverBlock>true</neverBlock>
        <includeCallerData>true</includeCallerData>
    </appender>
    
    
    <root level="INFO">
        <appender-ref ref="ASYNC" />
        <appender-ref ref="STDOUT" />
    </root>
</configuration>

```