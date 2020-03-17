---
title: binarySearch
date: 2020-03-10
categories: ['algorithm']
draft: false
---

```
public static void binarySearch(int[] input, int number) {
        int first = 0;
        int last = input.length - 1;
        int middle = (first + last) / 2;

        while (first <= last) {
            if (input[middle] < number) {
                first = middle + 1;
            } else if (input[middle] == number) {
                System.out.printf(number + " found at location %d %n", middle);
                break;
            } else {
                last = middle - 1;
            }
            middle = (first + last) / 2;
        }
        if (first &gt; last) {
            System.out.println(number + " is not present in the list.\n");
        }
    }
```
