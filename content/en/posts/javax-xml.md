---
title: javax-xml
date: 2020-03-08
categories: ['xml']
draft: false
---


```
final DocumentBuilderFactory docBuilderFactory =
        DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = null;
    try {
      builder = docBuilderFactory.newDocumentBuilder();
    } catch (final ParserConfigurationException e) {
      throw new IllegalArgumentException(
          "Exception while parsing project whitelist xml. Document builder not created.", e);
    }

    Document doc = null;
    try {
      doc = builder.parse(file);
    } catch (final SAXException e) {
      throw new IllegalArgumentException("Exception while parsing " + xmlFile
          + ". Invalid XML.", e);
    } catch (final IOException e) {
      throw new IllegalArgumentException("Exception while parsing " + xmlFile
          + ". Error reading file.", e);
    }

    final NodeList tagList = doc.getChildNodes();

```
