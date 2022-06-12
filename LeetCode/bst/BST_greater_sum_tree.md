[1038. Binary Search Tree to Greater Sum Tree](https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/)

- relate it to the concepts of constructing a BST from inorder and preorder.
- you might get the concept of declaring the prefix global.

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int prefix;
    public void dfs(TreeNode root) {
        if (root == null) {
            return;
        }

        dfs(root.right);

        prefix += root.val;
        root.val = prefix;

        dfs(root.left);
    }

    public TreeNode bstToGst(TreeNode root) {
        this.prefix = 0;
        dfs(root);
        return root;
    }
}

```
