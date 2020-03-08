---
title: FileToString
date: 2020-03-08
categories: ['ip']
draft: false
---

```
    public static String fileAsString(String filename) {
        StringBuilder result = new StringBuilder();
        try {
            File file = new File(filename);
            if (file.exists()) {
                BufferedReader reader = new BufferedReader(new FileReader(file));
                while (true) {
                    String line = reader.readLine();
                    if (line == null) {
                        break;
                    }
                    result.append(line).append("\n");
                }
            } else {
                // Does not exist:
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }
```