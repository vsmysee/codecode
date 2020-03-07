---
title: kafka-holder
date: 2020-03-07
categories: ['kafka']
draft: false
---

```
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;

import java.util.HashMap;
import java.util.Map;

public class KafkaHolder {

    private final static String STRING_KAFKA_SERVERS = "";
    public final static String STRING_KAFKA_TOPIC_FINGERPRINT = "";

    private static class InstanceHolder {
        public static KafkaTemplate<String, String> template = createTemplate();
    }

    public static KafkaTemplate<String, String> getInstance() {
        return InstanceHolder.template;
    }


    private static KafkaTemplate<String, String> createTemplate() {
        Map<String, Object> senderProps = senderProps();
        ProducerFactory<String, String> pf =
                new DefaultKafkaProducerFactory<>(senderProps);
        KafkaTemplate<String, String> template = new KafkaTemplate<>(pf);
        return template;
    }


    private static Map<String, Object> senderProps() {
        Map<String, Object> props = new HashMap<>();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, STRING_KAFKA_SERVERS);
        props.put(ProducerConfig.RETRIES_CONFIG, 0);
        props.put(ProducerConfig.BATCH_SIZE_CONFIG, 16384);
        props.put(ProducerConfig.LINGER_MS_CONFIG, 1);
        props.put(ProducerConfig.BUFFER_MEMORY_CONFIG, 33554432);
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        return props;
    }


}

```