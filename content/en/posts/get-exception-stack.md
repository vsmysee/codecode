---
title: get-stack-exception
date: 2020-03-07
categories: ['exception']
draft: false
---

```
    public static String getStackTraceString(Throwable t) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw, true);
        while (t != null) {
            t.printStackTrace(pw);
            t = t.getCause();
        }
        pw.flush();
        sw.flush();
        return sw.toString();
    }
```