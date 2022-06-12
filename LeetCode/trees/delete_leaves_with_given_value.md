[Delete Leaves With a Given Value](https://leetcode.com/problems/delete-leaves-with-a-given-value/)

- as we keep noticing the target, we make them null _(starting from leaf)_
- since we have made a child of a parent null, this will also be served as a message for parent.
- if his both children are null that means they both were **targets**.

```java
class Solution {
    public TreeNode dfs(TreeNode root, int target) {
        if (root == null) {
            return root;
        }

        root.left = dfs(root.left, target);
        root.right = dfs(root.right, target);

        if (root.val == target)
            if (root.left == null && root.right == null)
                return null;

        return root;
    }
    public TreeNode removeLeafNodes(TreeNode root, int target) {
        return dfs(root, target);

    }
}
```

#### another implementation

- we have passed an extra parameter `true/false`.
- to tell parents that their children were _targets_.

```cpp
bool dfs(BinaryTreeNode<int> *root, int x) {
    if (root == nullptr) {
        return false;
    }

    bool left = dfs(root->left, x);
    bool right = dfs(root->right, x);

    if (root->data == x) {
        if (!left && !right) {
            root->left = nullptr;
            root->right = nullptr;
            return false;
        }
    }
    return true;
}

BinaryTreeNode<int>* deleteLeafNodes(BinaryTreeNode<int> *root, int x) {
    auto ans = dfs(root, x);
    return root;
}
```
