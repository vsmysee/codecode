---
title: springsecurity
date: 2020-03-10
categories: ['spring']
draft: false
---

```
 http.authorizeRequests()
                .antMatchers("/static/**",
                        "/public/**",
                        "/bower_components/**",
                        "/actuator/**",
                        "/alert/webhook",
                        "/build/notify/**")
                .permitAll()
                .antMatchers("/user/**").hasRole("USER")
                .anyRequest()
                .authenticated()


                .and()
                .csrf().disable()


                .formLogin()
                .defaultSuccessUrl("/")
                .loginPage("/login")
                .failureUrl("/login?error=1")
                .permitAll()

                .and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400)

                .and()
                .logout()
                .deleteCookies("JSESSIONID")
                .permitAll();

```
