---
title: progress-builder
date: 2020-03-08
categories: ['util']
draft: false
---


```
final java.lang.ProcessBuilder processBuilder =
          new java.lang.ProcessBuilder("/bin/bash", "-c", "/bin/cat /proc/loadavg");
try {
final ArrayList<String> output = new ArrayList<>();
final Process process = processBuilder.start();
process.waitFor();
final InputStream inputStream = process.getInputStream();
try {
  final java.io.BufferedReader reader = new java.io.BufferedReader(
      new InputStreamReader(inputStream, StandardCharsets.UTF_8));
  String line = null;
  while ((line = reader.readLine()) != null) {
    output.add(line);
  }
} finally {
  inputStream.close();
}

```
