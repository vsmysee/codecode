---
title: ClassLoader
date: 2020-03-16
categories: ['jdk']
draft: false
---


```
static class AllPluginsLoader extends ClassLoader {
    static final AllPluginsLoader INSTANCE = new AllPluginsLoader();

    final ConcurrentMap<Long, ClassLoader> myLuckyGuess = ContainerUtil.newConcurrentMap();

    AllPluginsLoader() {
      // Groovy performance: do not specify parent loader to enable our luckyGuesser
      // Also specify null explicitly to suppress getSystemClassLoader() as parent
      super(null);
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
      //long ts = System.currentTimeMillis();

      int p0 = name.indexOf("$");
      boolean hasBase = p0 > 0;
      int p1 = hasBase ? name.indexOf("$", p0 + 1) : -1;
      String base = hasBase ? name.substring(0, Math.max(p0, p1)) : name;
      long hash = StringHash.calc(base);

      Class<?> c = null;
      ClassLoader guess1 = myLuckyGuess.get(hash);   // cached loader
      ClassLoader guess2 = myLuckyGuess.get(0L);     // last recently used
      for (ClassLoader loader : JBIterable.of(guess1, guess2)) {
        if (loader == this) throw new ClassNotFoundException(name);
        if (loader == null) continue;
        try {
          c = loader.loadClass(name);
          break;
        }
        catch (ClassNotFoundException ignored) {
        }
      }
      if (c == null) {
        for (IdeaPluginDescriptor descriptor : PluginManagerCore.getPlugins()) {
          ClassLoader l = descriptor.getPluginClassLoader();
          if (l == null || l == guess1 || l == guess2) continue;
          try {
            if (hasBase) {
              l.loadClass(base);
              myLuckyGuess.putIfAbsent(hash, l);
            }
            try {
              c = l.loadClass(name);
              myLuckyGuess.putIfAbsent(hash, l);
              myLuckyGuess.put(0L, l);
              break;
            }
            catch (ClassNotFoundException e) {
              if (hasBase) break;
              if (name.startsWith("java.") || name.startsWith("groovy.")) break;
            }
          }
          catch (ClassNotFoundException ignored) {
          }
        }
      }

      //LOG.info("AllPluginsLoader [" + StringUtil.formatDuration(System.currentTimeMillis() - ts) + "]: " + (c != null ? "+" : "-") + name);
      if (c != null) {
        return c;
      }
      else {
        myLuckyGuess.putIfAbsent(hash, this);
        throw new ClassNotFoundException(name);
      }
    }
```
