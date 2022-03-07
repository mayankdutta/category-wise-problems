[103. Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)

- one of classic problems based on trees.
- you might wanna go through [level order traversal](/LeetCode/trees/levelorder.md) before this.
- If you have good grip on level order still stuck on this !!
  - take notebook try to make patterns
  - take deep breadths
  - You should attempt this after having a walk.

<details> 
<summary>
Implementation
</summary>

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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        if (root == nullptr)
            return {};

        vector<vector<int>> ans;
        deque<TreeNode*> qu;

        qu.push_back(root);
        ans.push_back({root->val});

        int toggle = 1;

        while (!qu.empty()) {
            int Size = qu.size();

            for (int i = 0; i < Size; i++) {
                auto u = qu.front();
                qu.pop_front();

                if (u->left != nullptr)
                    qu.push_back(u->left);
                if (u->right != nullptr)
                    qu.push_back(u->right);
            }
            vector<int> temp;
            for (const auto& i: qu)
                temp.push_back(i->val);

            if (!temp.empty()) {
                if (toggle)
                    reverse(temp.begin(), temp.end());
                ans.push_back(temp);
            }

            toggle = 1 - toggle;
        }
        return ans;
    }
};
```

</details>
