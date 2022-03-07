[662. Maximum Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/)

- utilize the heap indexing
- normal indexing wont' work because they don't give us idea of how many `nullptr` would have been there.
- heap indexing `2 * i, 2 * i + 1` or `2 * i + 1, 2 * i + 2` takes care of that.
- to prevent further overflow, `curr -= mn` added.

```cpp
class Solution {
    public:
    int widthOfBinaryTree(TreeNode* root) {
        queue<pair<TreeNode*, long long int>> qu;
        qu.push({root, 1});
        long long int ans = 0;
        while (!qu.empty()) {
            int Size = qu.size();

            long long int mx = LONG_MIN;
            long long int mn = LONG_MAX;
            for (int i = 0; i < Size; i++) {
                TreeNode* u = qu.front().first;
                long long int curr = qu.front().second;

                mx = max(mx, curr);
                mn = min(mn, curr);

                curr -= mn;

                qu.pop();

                if (u->left != nullptr) qu.push({u->left, 2 * curr + 0});
                if (u->right != nullptr) qu.push({u->right, 2 * curr + 1});
            }

            ans = max(ans, ((mx) - (mn) + 1));
        }
        return ans;
    }
};
```
