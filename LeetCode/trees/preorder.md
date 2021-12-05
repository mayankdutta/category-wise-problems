[144. Binary Tree Preorder Traversal ](https://leetcode.com/problems/binary-tree-preorder-traversal/), Easy, Tree

<details> 
<summary> iterative</summary> 

```cpp
class Solution {
  public:
  vector<int> preorderTraversal(TreeNode* root) {
    if (root == nullptr) return {};
    
    vector<int> ans;
    stack<TreeNode*> st;
    st.push(root);

    while (!st.empty()) {
      auto top = st.top(); 
      st.pop();
      ans.push_back(top -> val); 

      if (top -> right != nullptr)
        st.push(top -> right);

      if (top -> left != nullptr)
        st.push(top -> left);
    }

    return ans;
  }
};
```
</details>


<details>
<summary> Recursive </summary>

```cpp
class Solution {
  public:
  vector<int> ans;
  void preOrder(TreeNode* root) {
    if (root == nullptr) return; 
    ans.push_back(root -> val);
    preOrder(root -> left); 
    preOrder(root -> right);
  }
  vector<int> preorderTraversal(TreeNode* root) {
    preOrder(root);
    return ans;
  }
};
```
</details>
