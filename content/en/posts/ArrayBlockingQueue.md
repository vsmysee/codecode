---
title: ArrayBlockingQueue
date: 2020-03-10
categories: ['jdk']
draft: false
---

```
public class BlockingResultHandler<T> implements ResultHandler<T> {
    private final BlockingQueue<Object> queue = new ArrayBlockingQueue<Object>(1);
    private final Class<T> resultType;
    private static final Object NULL = new Object();

    public BlockingResultHandler(Class<T> resultType) {
        this.resultType = resultType;
    }

    public T getResult() {
        Object result;
        try {
            result = queue.take();
        } catch (InterruptedException e) {
            throw UncheckedException.throwAsUncheckedException(e);
        }

        if (result instanceof Throwable) {
            throw UncheckedException.throwAsUncheckedException(attachCallerThreadStackTrace((Throwable) result));
        }
        if (result == NULL) {
            return null;
        }
        return resultType.cast(result);
    }

    public static Throwable attachCallerThreadStackTrace(Throwable failure) {
        List<StackTraceElement> adjusted = new ArrayList<StackTraceElement>();
        adjusted.addAll(Arrays.asList(failure.getStackTrace()));
        List<StackTraceElement> currentThreadStack = Arrays.asList(Thread.currentThread().getStackTrace());
        if (!currentThreadStack.isEmpty()) {
            adjusted.addAll(currentThreadStack.subList(2, currentThreadStack.size()));
        }
        failure.setStackTrace(adjusted.toArray(new StackTraceElement[0]));
        return failure;
    }

    public void onComplete(T result) {
        queue.add(result == null ? NULL : result);
    }

    public void onFailure(GradleConnectionException failure) {
        queue.add(failure);
    }
}
```


