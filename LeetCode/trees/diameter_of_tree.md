[543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

- diameter of the tree is the largest distance b/w any two nodes of the tree. 
- the distance may or may not pass through root.
- concept of [depth of the binary tree](/LeetCode/trees/depth_of_binarytree.md) is used.

<details> 
<summary> code </summary>

```cpp
class Solution {
  public:
  int diameterOfBinaryTree(TreeNode* root) {
    int ans = 0;
    auto diameter = [&](const auto& self, const auto& root) -> int {
      if (root == nullptr) return 0;

      int left = self(self, root -> left);
      int right = self(self, root -> right);
      
      ans = max({ans, left + right});
      return max(left, right) + 1;
    };
    
    diameter(diameter, root);
    return ans;
  }
};
```
</details>
