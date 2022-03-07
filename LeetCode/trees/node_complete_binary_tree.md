[222. Count Complete Tree Nodes](https://leetcode.com/problems/count-complete-tree-nodes/)

#### in complete binary tree.

- every level is filled except possible the `last level`.
- if the last level is not filled completely
- then all nodes should be from the `left to right` manner.

#### approach

- we will check if from the node we are standing upon it is binary tree or not !!
- for that we'll check the height from it's left and right.
- if same, simply return `2^height - 1`.
- else check the same for it's left or right.
- given the properties of binary tree this will always work.

```cpp
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
    public int countNodes(TreeNode root) {
        if (root == null)
            return 0;
        int hr = 0;
        int hl = 0;
        TreeNode r = root;
        TreeNode l = root;

        while (r != null) {
            r = r.right;
            hr ++;
        }
        while (l != null) {
            l = l.left;
            hl ++;
        }

        if (hl == hr) {
            return (1 << hl) - 1;
        }
        return 1 + countNodes(root.right) + countNodes(root.left);
    }
}

```
