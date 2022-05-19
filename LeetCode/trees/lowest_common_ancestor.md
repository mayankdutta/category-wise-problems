[236. Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)

- if we encounter any of the `p`, `q` or `nullptr`, we will immediately return root.
  - if root was `p`, we need not to further in that subtree, only search in another one.
  - if root was `q`, reason same as above.
  - it it was `nullptr`, no `TreeNode` exists for which we were finding
- we then check if `left` and `right` both **not nullptr**.
  - it means `p` must be in one subtree and `q` must be in separate subtree
- if one of the `left` or `right` were **nullptr**.
  - it means other one is parent of the other.
- else we have no choice but to return **nullptr** itself.

<details>
<summary> Code </summary>

```cpp
class Solution {
  public:
  TreeNode* fun(TreeNode *root, TreeNode *p, TreeNode *q) {
    if (root == p or root == q or root == nullptr) return root;
    auto left = fun(root -> left, p, q);
    auto right = fun(root -> right, p, q);

    if (left && right) 
      return root;
    return (left != nullptr) ? left  : right;
  }

  TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
    return fun(root, p, q);
  }
};

```
</details>
