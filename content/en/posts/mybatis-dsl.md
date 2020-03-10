---
title: mybatis-dsl
date: 2020-03-10
categories: ['mybatis']
draft: false
---

```
private String selectPersonSql() {
      return new SQL() {{
        SELECT("P.ID, P.USERNAME, P.PASSWORD, P.FULL_NAME");
        SELECT("P.LAST_NAME, P.CREATED_ON, P.UPDATED_ON");
        FROM("PERSON P");
        FROM("ACCOUNT A");
        INNER_JOIN("DEPARTMENT D on D.ID = P.DEPARTMENT_ID");
        INNER_JOIN("COMPANY C on D.COMPANY_ID = C.ID");
        WHERE("P.ID = A.ID");
        WHERE("P.FIRST_NAME like ?");
        OR();
        WHERE("P.LAST_NAME like ?");
        GROUP_BY("P.ID");
        HAVING("P.LAST_NAME like ?");
        OR();
        HAVING("P.FIRST_NAME like ?");
        ORDER_BY("P.ID");
        ORDER_BY("P.FULL_NAME");
      }}.toString();
    }
```


```
public String selectPersonLike(final String id, final String firstName, final String lastName) {
      return new SQL() {{
        SELECT("P.ID, P.USERNAME, P.PASSWORD, P.FIRST_NAME, P.LAST_NAME");
        FROM("PERSON P");
        if (id != null) {
          WHERE("P.ID like ${id}");
        }
        if (firstName != null) {
          WHERE("P.FIRST_NAME like ${firstName}");
        }
        if (lastName != null) {
          WHERE("P.LAST_NAME like ${lastName}");
        }
        ORDER_BY("P.LAST_NAME");
      }}.toString();
}
```
