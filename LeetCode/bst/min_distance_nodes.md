[783. Minimum Distance Between BST Nodes](https://leetcode.com/problems/minimum-distance-between-bst-nodes/)


- taken advantage of BST and it's inorder nature
- inorder traversal of BST always gives sorted array.


```java
class Solution {
    int ans;
    TreeNode prev;
    public void inorder(TreeNode root) {
        if (root == null)
            return;

        inorder(root.left);
        if (prev != null)
            ans = Math.min(ans, Math.abs(root.val - prev.val));
        prev = root;
        inorder(root.right);
    }

    public int minDiffInBST(TreeNode root) {
        prev = null;
        ans = Integer.MAX_VALUE;
        inorder(root);
        return ans;
    }
}
```
