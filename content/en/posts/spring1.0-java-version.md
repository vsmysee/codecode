---
title: Spring1.0-JavaVersion
date: 2020-03-05
categories: ['Spring']
draft: false
---

```
	static {
		String javaVersion = System.getProperty("java.version");
		// should look like "1.4.1_02"
		if (javaVersion.indexOf("1.4") != -1) {
			majorJavaVersion = JAVA_14;
		}
		else if (javaVersion.indexOf("1.5") != -1) {
			majorJavaVersion = JAVA_15;
		}
		// else leave as 1.3 default
	}

```