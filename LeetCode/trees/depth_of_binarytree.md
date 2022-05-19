[104. Maximum Depth of Binary Tree ](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

can do via 
- [level order](/LeetCode/trees/levelorder.md) traversal(iteratively)
- via recursive(DFS type).

<details>
<summary> iterative </summary>

```cpp
class Solution {
  public:
  int maxDepth(TreeNode* root) {
    int ans = 0; 
    queue<TreeNode*> qu;
    if (root == nullptr) return 0;

    qu.push(root); 

    while (!qu.empty()) {
      int Size = qu.size(); 
      ans ++; 
      for (int i = 0; i < Size; i++) {
        auto top = qu.front(); 
        qu.pop(); 


        if (top -> left) qu.push(top -> left);
        if (top -> right) qu.push(top -> right);
      }
    }
    return ans;

  }
};
```
</details>

<details>
<summary> recursive </summary>

```cpp
class Solution {
  public:
  int maxDepth(TreeNode* root) {
    auto fun = [&](const auto& self, const auto& root) -> int {
      return root == nullptr ? 0 
                             : max(self(self, root -> right), 
                                   self(self, root -> left)) + 1;
    };
    return fun(fun, root);
  }
};
```
</details>
