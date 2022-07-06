[Convert binary tree to mirror tree](https://www.codingninjas.com/codestudio/problems/convert-binary-tree-to-mirror-tree_873140?topList=top-trees-interview-questions&leftPanelTab=0)

- you need to swap.
- you cannot do swapping while traversing, this will disturb your traversal.
- However you can do after traversing.
- therefore postorder **(do operation while backtracking, after traversing while tracing back).**

```java
/*************************************************************

    Following is the Binary Tree node structure:

    class BinaryTreeNode
    {

        int data;
        BinaryTreeNode left;
        BinaryTreeNode right;

        BinaryTreeNode(int data) {
            this.data = data;
            this.left = null;
            this.right = null;
        }
    }

*************************************************************/

public class Solution {
    public static BinaryTreeNode fun(BinaryTreeNode node) {
        if (node == null) {
            return node;
        }
        node.left = fun(node.left);
        node.right = fun(node.right);

        BinaryTreeNode temp = node.right;
        node.right = node.left;
        node.left = temp;
        return node;
    }
	public static void mirrorTree(BinaryTreeNode node) {
        node = fun(node);
	}
}
```
