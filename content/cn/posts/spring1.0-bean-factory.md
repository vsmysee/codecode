---
title: Spring1.0-BeanFactory
date: 2020-02-05
categories: ['Spring']
draft: false
---

```
public interface BeanFactory {

	/**
	 * Return an instance (possibly shared or independent) of the given bean name.
	 * This method allows a bean factory to be used as a replacement for
	 * the Singleton or Prototype design pattern.
	 * <p>Note that callers should retain references to returned objects. There is
	 * no guarantee that this method will be implemented to be efficient. For example,
	 * it may be synchronized, or may need to run an RDBMS query.
	 * <p>Will ask the parent factory if the bean cannot be found in this factory instance.
	 * @param name name of the bean to return
	 * @return the instance of the bean
	 * @throws NoSuchBeanDefinitionException if there's no such bean definition
	 * @throws BeansException if the bean could not be created
	 */
	Object getBean(String name) throws BeansException;

	/**
	 * Return an instance (possibly shared or independent) of the given bean name.
	 * Provides a measure of type safety by throwing an exception if the bean is not
	 * of the required type.
	 * <p>Note that callers should retain references to returned objects. There is
	 * no guarantee that this method will be implemented to be efficient. For example,
	 * it may be synchronized, or may need to run an RDBMS query.
	 * <p>Will ask the parent factory if the bean cannot be found in this factory instance.
	 * @param name name of the bean to return
	 * @param requiredType type the bean may match. Can be an interface or superclass
	 * of the actual class. For example, if the value is Object.class, this method will
	 * succeed whatever the class of the returned instance.
	 * @return the instance of the bean
	 * @throws BeanNotOfRequiredTypeException if the bean is not of the required type
	 * @throws NoSuchBeanDefinitionException if there's no such bean definition
	 * @throws BeansException if the bean could not be created
	 */
	Object getBean(String name, Class requiredType) throws BeansException;

	/**
	 * Does this bean factory contain a bean with the given name?
	 * <p>Will ask the parent factory if the bean cannot be found in this factory instance.
	 * @param name name of the bean to query
	 * @return whether a bean with the given name is defined
	 */
	boolean containsBean(String name);

	/**
	 * Is this bean a singleton? That is, will getBean() always return the same object?
	 * <p>Will ask the parent factory if the bean cannot be found in this factory instance.
	 * @param name name of the bean to query
	 * @return is this bean a singleton
	 * @throws NoSuchBeanDefinitionException if there is no bean with the given name
	 */
	boolean isSingleton(String name) throws NoSuchBeanDefinitionException;

	/**
	 * Return the aliases for the given bean name, if defined.
	 * <p>Will ask the parent factory if the bean cannot be found in this factory instance.
	 * @param name the bean name to check for aliases
	 * @return the aliases, or an empty array if none
	 * @throws NoSuchBeanDefinitionException if there's no such bean definition
	 */
	String[] getAliases(String name) throws NoSuchBeanDefinitionException;

}
```