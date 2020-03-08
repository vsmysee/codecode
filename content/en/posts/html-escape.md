---
title: html-escape
date: 2020-03-08
categories: ['http']
draft: false
---


```
    public static String htmlElementContent(String content) {
        if (content == null) {
            return null;
        }

        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < content.length(); i++) {
            char c = content.charAt(i);
            if (c == '<') {
                sb.append("&lt;");
            } else if (c == '>') {
                sb.append("&gt;");
            } else if (c == '\'') {
                sb.append("&#39;");
            } else if (c == '&') {
                sb.append("&amp;");
            } else if (c == '"') {
                sb.append("&quot;");
            } else if (c == '/') {
                sb.append("&#47;");
            } else {
                sb.append(c);
            }
        }

        return (sb.length() > content.length()) ? sb.toString() : content;
    }
```
