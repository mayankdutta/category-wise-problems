[987. Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/)

- very similar to the idea of top view / bottom view of the tree.
- order of the Nodes having same height, may cause problem.

<details>
<summary> Implementation </summary>

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */

class Solution {
    public:
    vector<vector<int>> verticalTraversal(TreeNode* root) {
        int pos = 0;
        map<int, vector<int>> mp;
        queue<pair<TreeNode*, int>> qu;

        qu.push({root, pos});

        while (!qu.empty()) {
            int Size = qu.size();
            map<int, vector<int>> temp;
            for (int i = 0; i < Size; i++) {
                auto [u, current_pos] = qu.front(); qu.pop();
                temp[current_pos].push_back(u -> val);
                if (u -> left) qu.push({u -> left, current_pos - 1});
                if (u -> right) qu.push({u -> right, current_pos + 1});
            }
            for (auto& i: temp) sort(i.second.begin(), i.second.end());
            for (const auto& i: temp)
                for (const auto& j: i.second)
                    mp[i.first].push_back(j);

        }

        vector<vector<int>> ans;
        for (const auto& i: mp)
            ans.push_back(i.second);
        return ans;
    }
};
```

</details>
