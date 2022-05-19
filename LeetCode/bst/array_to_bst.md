[108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

- hint can be taken from the fact that _inorder traversal of BST always result in sorted sequence_.
- therefore middle of the array must be the root.

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
    public TreeNode fun(int[] nums, int low, int high) {
        if (low > high)
            return null;
        int mid = (low + high) / 2;
        TreeNode temp = new TreeNode(nums[mid]);
        temp.left = fun(nums, low, mid - 1);
        temp.right = fun(nums, mid + 1, high);
        return temp;
    }

    public TreeNode sortedArrayToBST(int[] nums) {
        if (nums.length == 0)
            return null;
        return fun(nums, 0, nums.length - 1);
    }
}
```
