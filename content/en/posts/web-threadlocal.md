---
title: web-threadlocal
date: 2020-03-08
categories: ['thread']
draft: false
---

```

    private static ThreadLocal<HttpServletRequest> request = new ThreadLocal<>();
    private static ThreadLocal<HttpServletResponseProxy> response = new ThreadLocal<>();
    private static ThreadLocal<FilterConfig> filterConfig = new ThreadLocal<>();
    private static ThreadLocal<ControllerResponse> controllerResponse = new ThreadLocal<>();
    private static ThreadLocal<AppContext> appContext = new ThreadLocal<>();
    private static ThreadLocal<RequestVo> requestVo = new ThreadLocal<>();
    private static ThreadLocal<String> format = new ThreadLocal<>();
    private static ThreadLocal<String> encoding = new ThreadLocal<>();
    private static ThreadLocal<Route> route = new ThreadLocal<>();
    private static ThreadLocal<Map<String, Object>> values = new ThreadLocal<>();
    private static ThreadLocal<Boolean> exceptionHappened = new ThreadLocal<>();
    private static ThreadLocal<List<FormItem>> formItems = new ThreadLocal<>();
    private static ThreadLocal<Map<String, String>> params1st = new ThreadLocal<>();
    
    
    static void clear() {
            request.set(null);
            response.set(null);
            controllerResponse.set(null);
            route.set(null);
            filterConfig.set(null);
            requestVo.set(null);
            format.set(null);
            encoding.set(null);
            appContext.set(null);
            values.set(null);
            exceptionHappened.set(false);
            formItems.set(null);
            params1st.set(null);
        }
    
    
```


