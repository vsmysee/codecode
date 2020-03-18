---
title: binaryTree-Order
date: 2020-03-10
categories: ['algorithm']
draft: false
---

```
// 递归先序遍历
public static void recursionPreorderTraversal(TreeNode root) {
    if (root != null) {
        System.out.print(root.val + " ");
        recursionPreorderTraversal(root.left);
        recursionPreorderTraversal(root.right);
    }
}

// 递归中序遍历
public static void recursionMiddleorderTraversal(TreeNode root) {
    if (root != null) {
        recursionMiddleorderTraversal(root.left);
        System.out.print(root.val + " ");
        recursionMiddleorderTraversal(root.right);
    }
}

// 递归后序遍历
public static void recursionPostorderTraversal(TreeNode root) {
    if (root != null) {
        recursionPostorderTraversal(root.left);
        recursionPostorderTraversal(root.right);
        System.out.print(root.val + " ");
    }
}
```

```
public void preOrderWithoutRecursion() { 
    Stack<TreeNode> nodes = new Stack<>(); 
    nodes.push(root); 
    while (!nodes.isEmpty()) { 
    TreeNode current = nodes.pop(); 
    System.out.printf("%s ", current.data); 
    if (current.right != null) { 
        nodes.push(current.right); } 
    if (current.left != null) { nodes.push(current.left); } } 
}
```

