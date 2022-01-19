[701. Insert into a Binary Search Tree](https://leetcode.com/problems/insert-into-a-binary-search-tree/)

- we just have to traverse in the tree till we encounter a leaf.
- while traversing we must obey the rules of BST.

<details>
<summary> naive kind of implementation </summary>

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
    void insert(TreeNode root, int n) {

    }
    void dfs(TreeNode* root, int n) {
        if (root == nullptr) return;
        if (n < root -> val) {
            if (root -> left == nullptr) {
                root -> left = new TreeNode;
                root -> left -> left = nullptr;
                root -> left -> right = nullptr;
                root -> left -> val = n;
            }
            else {
                dfs(root -> left, n);
            }
        }
        else {
            if (root -> right == nullptr) {
                root -> right = new TreeNode;
                root -> right -> left = nullptr;
                root -> right -> right = nullptr;
                root -> right -> val = n;
            }
            else {
                dfs(root -> right, n);
            }
        }
    }
    TreeNode* insertIntoBST(TreeNode* root, int val) {
        if (root == nullptr) {
            root  = new TreeNode;
            root  -> left = nullptr;
            root  -> right = nullptr;
            root  -> val = val;
            return root;
        }
        dfs(root, val);
        return root;

    }

};

```

</details>

<details>
<summary> more concise Solution </summary>

```cpp
TreeNode* insertIntoBST(TreeNode *node, int val) {
    if (!node) {
        TreeNode *newNode = new TreeNode(val);
        return newNode;
    }
    if (val < node->val) {
        node->left = insertIntoBST(node->left, val);
    }
    else {
        node->right = insertIntoBST(node->right, val);
    }
    return node;
}
```

</details>
