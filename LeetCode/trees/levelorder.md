[102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)


- if `pre/in/post` were `DFS` type then this is kind of `BFS` type.
- there we used stack, here it will be queue.

<details> 
<summary> code </summary> 

```cpp
class Solution {
  public:
  vector<vector<int>> levelOrder(TreeNode* root) {
    vector<vector<int>> ans;
    if (root == nullptr) return {};
    queue<TreeNode*> qu;

    qu.push(root); 
    while (!qu.empty()) {
      vector<int> temp;
      int Size = qu.size();

      for (int i = 0; i < Size; i++) {
        auto root = qu.front(); qu.pop();
        temp.push_back(root -> val);

        if (root -> left) qu.push(root -> left); 
        if (root -> right) qu.push(root -> right);
      }
      ans.push_back(temp);
    }
    return ans;
  }
};
```
</details>
