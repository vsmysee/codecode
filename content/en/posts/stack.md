---
title: Stack
date: 2020-03-18
categories: ['algorithm']
draft: false
---

```
public class Stack{
    private Node first = null;
    public boolean isEmpty(){
        return first == null;
    }
    public Object Pop(){
        if(isEmpty()) 
            throw new Exception("Can't Pop from an empty Stack.");
        else{
            Object temp = first.value;
            first = first.next;
            return temp;
        }
    }
    public void Push(Object o){
        first = new Node(o, first);
    }
    class Node{
        public Node next;
        public Object value;
        public Node(Object value){
            this(value, null); 
        }
        public Node(Object value, Node next){
            this.next = next;
            this.value = value;
        }
    }
}
```


```
function Stack() {
    this.data = new Array();
 
    this.push  = function(element) {this.data.push(element)}
    this.pop   = function() {return this.data.pop()}
    this.empty = function() {return this.data.length == 0}
    this.peek  = function() {return this.data[this.data.length - 1]}
}
```

