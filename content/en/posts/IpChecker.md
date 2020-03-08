---
title: IpChecker
date: 2020-03-08
categories: ['ip']
draft: false
---

```
public class IPUtil {

    private static final Pattern IPV4_PATTERN = Pattern.compile("^((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$");
    private static final Pattern IPV6_PATTERN = Pattern.compile("^([\\da-fA-F]{1,4}:){7}[\\da-fA-F]{1,4}$");

    public static boolean isIPV4(String addr) {
        return isMatch(addr, IPV4_PATTERN);
    }

    public static boolean isIPV6(String addr) {
        return isMatch(addr, IPV6_PATTERN);
    }

    private static boolean isMatch(String data, Pattern pattern) {
        if (StringUtils.isBlank(data)) {
            return false;
        }
        Matcher mat = pattern.matcher(data);
        return mat.find();
    }
}

```