[Inorder Morris traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/)

- we will traverse in the tree starting from left (since inorder)
- till we can visit the rightmost part we will proceed
- just to check if we already been there or not.
- if already been there we will traverse root to right else we will proceed to left.

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
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> ans;
        while (root != nullptr) {
          /*
           * if we can go, to left then proceed.
           */
            if (root->left != nullptr) {
                TreeNode* pre = root->left;

                /*
                 * this is the judging part, where
                 * we only checking if we already been there, or not
                 * if already been there then will break the edge,
                 * else form a new edge.
                 * pushing values meanwhile,
                 * judging if we want to traverse(root, left, right) OR (left, root, right);
                 */

                while (pre->right != nullptr and pre->right != root) {
                    pre = pre->right;
                }

                /*
                 * if already edge then break the edge, and move to right part
                 * because if there is already edge, then we already been in our left part.
                 * we are prioritizing the root in inorder traversal,
                 * therefore AFTER the whole traversal of LEFT done, and after coming back
                 * we will store the node.
                 */
                if (pre->right == root) {
                    pre->right = nullptr;
                    ans.push_back(root->val);
                    root = root->right;
                }

                /*
                 * we will form the edge, and move root to left,
                 * because it is not explored.
                 */
                else {
                    pre->right = root;
                    root = root->left;
                }
            }
            else {
                ans.push_back(root->val);
                root = root->right;
            }
        }
        return ans;
    }
};

```
