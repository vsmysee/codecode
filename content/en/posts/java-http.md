---
title: FileToString
date: 2020-03-08
categories: ['http']
draft: false
---

```
 static public HttpResult invokeURL(String url, List<String> headers, String encoding) throws IOException {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection)new URL(url).openConnection();

            conn.setConnectTimeout(TIMEOUT);
            conn.setReadTimeout(TIMEOUT);
            conn.setRequestMethod("GET");

            if (null != headers && !StringUtils.isEmpty(encoding)) {
                for (Iterator<String> iter = headers.iterator(); iter.hasNext(); ) {
                    conn.addRequestProperty(iter.next(), iter.next());
                }
            }
            conn.addRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + encoding);
            /**
             *  建立TCP连接
             */
            conn.connect();
            /**
             * 这里内部发送请求
             */
            int respCode = conn.getResponseCode();
            String resp = null;

            if (HttpServletResponse.SC_OK == respCode) {
                resp = IOUtils.toString(conn.getInputStream());
            } else {
                resp = IOUtils.toString(conn.getErrorStream());
            }
            return new HttpResult(respCode, resp);
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }
```
