[563. Binary Tree Tilt](https://leetcode.com/problems/binary-tree-tilt/), kind of DFS

- we have to do dfs on trees type of thing
- we have been doing the same in calculating height of the tree and several more problems.

<details>
<summary> Code </summary>

```cpp
class Solution {
  public:
  int ans = 0;
  int dfs(TreeNode* root) {
    int left = root -> left ? dfs(root -> left) : 0;
    int right = root -> right ? dfs(root -> right) : 0;
    ans += abs(left - right);
    return abs(left - right) + root -> val;
  }
  int findTilt(TreeNode* root) {
    int something = dfs(root);
    return ans;
  }
};
```
</details>
