[145. Binary Tree Postorder Traversal ](https://leetcode.com/problems/binary-tree-postorder-traversal/)


<details>
<summary> Recursive </summary>

```cpp
class Solution {
  public:
  vector<int> ans;
  void postOrder(TreeNode* root) {
    if (root == nullptr) return; 
    postOrder(root -> left); 
    postOrder(root -> right);
    ans.push_back(root -> val);
  }
  vector<int> postorderTraversal(TreeNode* root) {
    postOrder(root);
    return ans;

  }
};
```
</details>
