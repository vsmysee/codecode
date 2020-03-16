---
title: BloomFilter
date: 2020-03-16
categories: ['util']
draft: false
---

```
 BloomFilter<String> bf =
        BloomFilter.create(
            Funnels.unencodedCharsFunnel(),
            numInsertions,
            0.03,
            BloomFilterStrategies.MURMUR128_MITZ_32);

    // Insert "numInsertions" even numbers into the BF.
    for (int i = 0; i < numInsertions * 2; i += 2) {
      bf.put(Integer.toString(i));
    }

    // Assert that the BF "might" have all of the even numbers.
    for (int i = 0; i < numInsertions * 2; i += 2) {
      assertTrue(bf.mightContain(Integer.toString(i)));
    }

```
