[101. Symmetric Tree ] (https://leetcode.com/problems/symmetric-tree/)

- one of the classic problems base on trees
- to have concise code, try building recurrence relation first.
- to have symmetricity left of the one node should be equal to the right of node in mirror _(try to draw)_.

<details>
<summary>
Implementation
</summary>

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
    public boolean inorder(TreeNode one, TreeNode two) {
        if ((one == null && two != null) || (one != null && two == null))
            return false;

        if (one == null && two == null)
            return true;

        if (one.val != two.val)
            return false;

        return inorder(one.left, two.right) && inorder(one.right, two.left);
    }

    public boolean isSymmetric(TreeNode root) {
        return inorder(root.left, root.right);
    }
}
```

</details>
