---
title: maxDepth
date: 2020-03-08
categories: ['algorithm']
draft: false
---

```
   private static int maxDepth(TreeNode root) {
        //递归退出条件，到叶子节点
        if (root == null) {
            return 0;
        }
        //计算左子树最大深度
        int leftMaxDepth = maxDepth(root.left);
        //计算右子树最大深度
        int rightMaxDepth = maxDepth(root.right);
        //以某个节点为根节点的数的最大深度为max
        //max=max(leftMaxDepth,rightMaxDepth)+1
        return Math.max(leftMaxDepth, rightMaxDepth) + 1;
    }

```
