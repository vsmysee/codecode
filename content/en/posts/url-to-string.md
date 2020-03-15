---
title: url-to-string
date: 2020-03-15
categories: ['http']
draft: false
---

```
    public static String getUrlContent(String url) {
        Long startLong=System.currentTimeMillis();
        String curLine = "";
        StringBuilder content = new StringBuilder();

        try {
            URL server = null;
            server = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) server.openConnection();
            connection.setConnectTimeout(60 * 1000 * 2);
            connection.setReadTimeout(60 * 1000 * 2);
            connection.connect();
            InputStream is = connection.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is, "utf-8"));
            while ((curLine = reader.readLine()) != null) {
                content.append(curLine).append("\r\n");
            }
            is.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return content.toString();
    }
```
