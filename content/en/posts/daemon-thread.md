---
title: daemon-thread
date: 2020-03-08
categories: ['md5']
draft: false
---

```

protected static class LoggerThread extends Thread {
        public LoggerThread() {
            this.setDaemon(true);
            this.setName("AsyncFileHandlerWriter-" + System.identityHashCode(this));
        }

        @Override
        public void run() {
            while (true) {
                try {
                    LogEntry entry = queue.poll(LOGGER_SLEEP_TIME, TimeUnit.MILLISECONDS);
                    if (entry != null) {
                        entry.flush();
                    }
                } catch (InterruptedException x) {
                    // Ignore the attempt to interrupt the thread.
                } catch (Exception x) {
                    x.printStackTrace();
                }
            }
        }
    }

```
