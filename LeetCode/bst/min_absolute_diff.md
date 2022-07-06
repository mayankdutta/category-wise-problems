[530. Minimum Absolute Difference in BST](https://leetcode.com/problems/minimum-absolute-difference-in-bst/)

- Trick is to catch the inorder traversal.
- store the inorder traversal, which will always be in sorted order.
- pick up two consecutive elements, store their minimum.
- for further optimization below approach can be adopted.

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
    int ans;
    int prev;
    void inorder(TreeNode* root) {
        if (root == nullptr) {
            return;
        }

        inorder(root->left);
        if (prev != -1) {
            ans = min(ans, root->val - prev);
        }
        prev = root->val;
        inorder(root->right);
    }
    int getMinimumDifference(TreeNode* root) {
        this->ans = INT_MAX;
        this->prev = -1;
        inorder(root);
        return ans;
    }
};
```
