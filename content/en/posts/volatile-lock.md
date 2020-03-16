---
title: Volatile-Lock
date: 2020-03-16
categories: ['jdk']
draft: false
---

```
 static final class SimpleFSLock extends Lock {
    private final Path path;
    private final FileTime creationTime;
    private volatile boolean closed;

    SimpleFSLock(Path path, FileTime creationTime) throws IOException {
      this.path = path;
      this.creationTime = creationTime;
    }

    @Override
    public void ensureValid() throws IOException {
      if (closed) {
        throw new AlreadyClosedException("Lock instance already released: " + this);
      }
      // try to validate the backing file name, that it still exists,
      // and has the same creation time as when we obtained the lock. 
      // if it differs, someone deleted our lock file (and we are ineffective)
      FileTime ctime = Files.readAttributes(path, BasicFileAttributes.class).creationTime(); 
      if (!creationTime.equals(ctime)) {
        throw new AlreadyClosedException("Underlying file changed by an external force at " + ctime + ", (lock=" + this + ")");
      }
    }

    @Override
    public synchronized void close() throws IOException {
      if (closed) {
        return;
      }
      try {
        // NOTE: unlike NativeFSLockFactory, we can potentially delete someone else's
        // lock if things have gone wrong. we do best-effort check (ensureValid) to
        // avoid doing this.
        try {
          ensureValid();
        } catch (Throwable exc) {
          // notify the user they may need to intervene.
          throw new LockReleaseFailedException("Lock file cannot be safely removed. Manual intervention is recommended.", exc);
        }
        // we did a best effort check, now try to remove the file. if something goes wrong,
        // we need to make it clear to the user that the directory may still remain locked.
        try {
          Files.delete(path);
        } catch (Throwable exc) {
          throw new LockReleaseFailedException("Unable to remove lock file. Manual intervention is recommended", exc);
        }
      } finally {
        closed = true;
      }
    }

```
