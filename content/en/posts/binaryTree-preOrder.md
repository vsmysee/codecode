---
title: binaryTree-preOrder
date: 2020-03-10
categories: ['algorithm']
draft: false
---

```
private void preOrder(TreeNode node) {
    if (node == null) {
      return;
    }
    System.out.printf("%s ", node.data);
    preOrder(node.left);
    preOrder(node.right);
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

