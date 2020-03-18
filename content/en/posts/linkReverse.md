---
title: linkReverse
date: 2020-03-18
categories: ['algorithm']
draft: false
---

```
struct ListNode  {  
    int value;  
    ListNode *next;  
};  

ListNode * ReverseList(ListNode * head)  {  
    //递归终止条件：找到链表最后一个结点  
    if (head == NULL || head->next == NULL)  
        return head;  
    else  {  
        ListNode * newhead = ReverseList(head->next);//先反转后面的链表，从最后面的两个结点开始反转，依次向前  
        head->next->next = head;//将后一个链表结点指向前一个结点  
        head->next = NULL;//将原链表中前一个结点指向后一个结点的指向关系断开  
        return newhead;  
    }  
}  
```
