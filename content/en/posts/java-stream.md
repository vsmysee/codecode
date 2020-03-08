---
title: java-stream
date: 2020-03-08
categories: ['java']
draft: false
---

```

static List<Employee> empList = Arrays.asList(arrayOfEmps);
empList.stream();



Stream.Builder<Employee> empStreamBuilder = Stream.builder();

empStreamBuilder.accept(arrayOfEmps[0]);
empStreamBuilder.accept(arrayOfEmps[1]);
empStreamBuilder.accept(arrayOfEmps[2]);

Stream<Employee> empStream = empStreamBuilder.build();



empList.stream().forEach(e -> e.salaryIncrement(10.0));


Integer[] empIds = { 1, 2, 3 };
List<Employee> employees = Stream.of(empIds)
    .map(employeeRepository::findById)
    .collect(Collectors.toList());


List<Employee> employees = Stream.of(empIds)
      .map(employeeRepository::findById)
      .filter(e -> e != null)
      .filter(e -> e.getSalary() > 200000)
      .collect(Collectors.toList());


Employee employee = Stream.of(empIds)
      .map(employeeRepository::findById)
      .filter(e -> e != null)
      .filter(e -> e.getSalary() > 100000)
      .findFirst()
      .orElse(null);
      
    
Employee[] employees = empList.stream().toArray(Employee[]::new);


List<String> namesFlatStream = namesNested.stream()
      .flatMap(Collection::stream)
      .collect(Collectors.toList());


empList.stream()
      .peek(e -> e.salaryIncrement(10.0))
      .peek(System.out::println)
      .collect(Collectors.toList());


boolean allEven = intList.stream().allMatch(i -> i % 2 == 0);
boolean oneEven = intList.stream().anyMatch(i -> i % 2 == 0);



IntStream.of(1, 2, 3);
IntStream.range(10, 20)

Double sumSal = empList.stream()
      .map(Employee::getSalary)
      .reduce(0.0, Double::sum);


String empNames = empList.stream()
      .map(Employee::getName)
      .collect(Collectors.joining(", "))
      .toString();
    
    
empList.stream().parallel().forEach(e -> e.salaryIncrement(10.0));


```
