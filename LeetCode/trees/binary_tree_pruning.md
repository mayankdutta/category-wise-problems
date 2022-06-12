[814. Binary Tree Pruning](https://leetcode.com/problems/binary-tree-pruning/)

for explanation refer to [Delete leaves with Given Value](/LeetCode/trees/delete_leaves_with_given_value.md)

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
    TreeNode dfs(TreeNode root) {
        if (root == null) {
            return root;
        }

        root.left  = dfs(root.left);
        root.right = dfs(root.right);

        if (root.val == 0) {
            if (root.left == null && root.right == null) {
                return null;
            }
        }
        return root;
    }

    public TreeNode pruneTree(TreeNode root) {
        root = dfs(root);
        return root;
    }
}
```
