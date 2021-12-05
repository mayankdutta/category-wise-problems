[94. Binary Tree Inorder Traversal ](https://leetcode.com/problems/binary-tree-inorder-traversal/)

<details>
<summary> Recursive </summary>

```cpp
class Solution {
public:
    vector<int> inorderTraversal(TreeNode* root) {
      vector<int> ans;
      
      auto inOrder = [&](const auto& self, TreeNode* head) -> void {
        if (head == nullptr) return;
        self(self, head -> left);
        ans.push_back(head -> val);
        self(self, head -> right);
      };
      
      inOrder(inOrder, root);
      return ans;
        
    }
};
```
</details>


<details> 
<summary> Iterative </summary>

```cpp
class Solution {
  public:
  vector<int> inorderTraversal(TreeNode* root) {
    vector<int> ans;
    stack<TreeNode*> st;

    while (root != nullptr or !st.empty()) {
      while (root != nullptr) {
        st.push(root); 
        root = root -> left;
      }

      root = st.top(); 
      st.pop();
      ans.push_back(root -> val);

      root = root -> right;
    }

    return ans;
  }
};
```
</details>
