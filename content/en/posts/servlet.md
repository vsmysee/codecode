---
title: servlet
date: 2020-03-10
categories: ['servlet']
draft: false
---

```
@WebServlet("/syncHello")
public class SyncHelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        new LongRunningProcess().run();
        response.getWriter().write("Hello World!");
    }
}
```

```
@WebServlet(value = "/simpleAsync", asyncSupported = true)
public class SimpleAsyncHelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AsyncContext asyncContext = request.startAsync();

        asyncContext.start(() -> {
            new LongRunningProcess().run();
            try {
                asyncContext.getResponse().getWriter().write("Hello World!");
            } catch (IOException e) {
                e.printStackTrace();
            }
            asyncContext.complete();
        });

    }

}
```

```
@WebServlet(value = "/threadPoolAsync", asyncSupported = true)
public class ThreadPoolAsyncHelloServlet extends HttpServlet {

    private static ThreadPoolExecutor executor = new ThreadPoolExecutor(100, 200, 50000L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(100));

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AsyncContext asyncContext = request.startAsync();

        executor.execute(() -> {

            new LongRunningProcess().run();

            try {
                asyncContext.getResponse().getWriter().write("Hello World!");
            } catch (IOException e) {
                e.printStackTrace();
            }

            asyncContext.complete();

        });
    }

}
```

```
@WebServlet(value = "/nonBlockingThreadPoolAsync", asyncSupported = true)
public class NonBlockingAsyncHelloServlet extends HttpServlet {

    private static ThreadPoolExecutor executor = new ThreadPoolExecutor(100, 200, 50000L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(100));

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AsyncContext asyncContext = request.startAsync();

        ServletInputStream inputStream = request.getInputStream();

        inputStream.setReadListener(new ReadListener() {
            @Override
            public void onDataAvailable() throws IOException {

            }

            @Override
            public void onAllDataRead() throws IOException {
                executor.execute(() -> {
                    new LongRunningProcess().run();

                    try {
                        asyncContext.getResponse().getWriter().write("Hello World!");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                    asyncContext.complete();

                });
            }

            @Override
            public void onError(Throwable t) {
                asyncContext.complete();
            }
        });


    }

}
```
