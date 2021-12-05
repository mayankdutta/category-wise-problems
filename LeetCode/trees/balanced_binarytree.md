[110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)

- concept of [depth of binary tree](/LeetCode/trees/depth_of_binarytree.md) is used.

<details>
<summary> Code </summary>

```cpp
class Solution {
public:
    bool isBalanced(TreeNode* root) {
      bool ans = true;
      auto balance = [&](const auto& self, const auto& root) -> int {
        if (root == nullptr) return 0;
        
        int left = self(self, root -> left);
        int right = self(self, root -> right);
        
        ans = ans & (abs(left - right) <= 1);
        return max(left, right) + 1;
      };
      balance(balance, root);
      return ans;
    }
};
```
</details>
