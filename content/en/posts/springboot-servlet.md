---
title: spring-boot-servlet
date: 2020-03-07
categories: ['spring']
draft: false
---

```
@Component
public class URuleServletRegistration {
	@Bean
	public ServletRegistrationBean<HttpServlet> registerURuleServlet(){
		return new ServletRegistrationBean<HttpServlet>(new URuleServlet(),"/urule/*");
	}
	@Bean
	public ServletRegistrationBean<HttpServlet> registerIndexServlet(){
		return new ServletRegistrationBean<HttpServlet>(new IndexServlet(),"/");
	}
}
```