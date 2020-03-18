---
title: StringReverse
date: 2020-03-18
categories: ['algorithm']
draft: false
---

```
public String reverse(String str) {  
    if (str == null || str.length() <= 1) {  
        return str;  
    }  
    return reverse(str.substring(1)) + str.charAt(0);  
}  

public String reverse(String str) {
        StringBuilder strBuilder = new StringBuilder();
        char[] strChars = str.toCharArray();

        for (int i = strChars.length - 1; i >= 0; i--) {
            strBuilder.append(strChars[i]);
        }

        return strBuilder.toString();
}
```
