[2196. Create Binary Tree From Descriptions](https://leetcode.com/problems/create-binary-tree-from-descriptions/)

- Question was to how to orgaise data in more usable way.
- one method is shared below
- more of the implementation kind of problem
- if this is your first time, you might wanna have a look over implementation.
- used a map to store the `value -> TreeNode` format.
- used another map to store parent of every node in `TreeNode -> TreeNode` format.
  - parent map later used to find the root of the whole tree.

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
    public TreeNode createBinaryTree(int[][] descriptions) {
        Map<Integer, TreeNode> mp      = new HashMap<>();
        Map<TreeNode, TreeNode> parent = new HashMap<>();
        TreeNode root = null;

        for (int i = 0; i < descriptions.length; i++) {
            int p    = descriptions[i][0];
            int c    = descriptions[i][1];
            int left = descriptions[i][2];

            if (!mp.containsKey(p)) mp.put(p, new TreeNode(p, null, null));
            if (!mp.containsKey(c)) mp.put(c, new TreeNode(c, null, null));

            var parentNode = mp.get(p);
            var childNode  = mp.get(c);

            if (left == 1) parentNode.left  = childNode;
            else           parentNode.right = childNode;

            parent.put(childNode, parentNode);
            root = childNode;
        }

        for (; parent.containsKey(root) && root != null; root = parent.getOrDefault(root, null)) {
            System.out.println(root.val);
        }
        return root;
    }
}
```
