[1026. Maximum Difference Between Node and Ancestor](https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/)

#### Brute force

- choose every node as an ancestor
- apply DFS to find maximum difference.

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
    int ans = 0;
    void preOrder(TreeNode* root, int val) {
        if (root == nullptr) return;
        ans = max(ans, abs(val - root -> val));
        preOrder(root -> left, val);
        preOrder(root -> right, val);
    }
    int maxAncestorDiff(TreeNode* root) {
        queue<TreeNode*> qu;
        qu.push(root);

        while (!qu.empty()) {
            auto u = qu.front(); qu.pop();
            preOrder(u, u -> val);
            if (u->left) qu.push(u -> left);
            if (u->right) qu.push(u -> right);
        }
        return ans;
    }
};
```

</details>

#### optimal

- DFS it
- meanwhile keep track of maximum and minimum values encounter.
- make sure to pass them as parameter, because they are unique to every node.

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
    int ans;
    void pre_order(TreeNode* root, int mx, int mn) {
        if (root == nullptr) return;

        mx = max(mx, root -> val);
        mn = min(mn, root -> val);

        ans = max(ans, abs(mx - mn));

        pre_order(root->left, mx, mn);
        pre_order(root->right, mx, mn);

    }
    int maxAncestorDiff(TreeNode* root) {
        ans = 0;
        pre_order(root, root->val, root->val);
        return ans;
    }
};

```

</details>
