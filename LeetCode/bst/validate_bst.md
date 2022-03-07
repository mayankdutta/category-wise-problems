[98. Validate Binary Search Tree ](https://leetcode.com/problems/validate-binary-search-tree/)

#### inorder

- inorder traversal of the BST will always result in sorted order.

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    vector<int> ans;
    void inorder (TreeNode* root) {
        if (root == nullptr)
            return;
        inorder (root->left);
        ans.push_back(root->val);
        inorder (root->right);
    }
    bool isValidBST(TreeNode* root) {
        inorder(root);
        for (int i = 1; i < ans.size(); i++) {
            if (ans[i - 1] >= ans[i]) {
                return false;
            }
        }
        return true;
    }
};
```

#### MAX MIN

- took the root as a reference.
- values to the left, must be smaller then root.
- values to the right, must be greater then root.
- repeat the same for the subsequent nodes.
- better to pass `max, min` of `TreeNode` type, then the `int` type

```java
class Solution {
    public boolean isValidBST(TreeNode root, TreeNode min, TreeNode max) {
        if (root == null)
            return true;
        if (min != null && root.val <= min.val) return false;
        if (max != null && max.val <= root.val) return false;
        return isValidBST(root.left, min, root) &&
               isValidBST(root.right, root, max);
    }
    public boolean isValidBST(TreeNode root) {
        if (root == null)
            return true;
        return isValidBST(root, null, null);
    }
}
```
