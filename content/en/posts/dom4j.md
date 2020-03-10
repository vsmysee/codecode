---
title: dom4j
date: 2020-03-10
categories: ['xml']
draft: false
---

```
SAXReader reader = new SAXReader();
Document document = reader.read(url);
return document;
```

```
Element root = document.getRootElement();
for (Iterator<Element> it = root.elementIterator(); it.hasNext();) {
    Element element = it.next();
}
```

```
List<Node> list = document.selectNodes("//foo/bar");
Node node = document.selectSingleNode("//foo/bar/author");
String name = node.valueOf("@name");
```


