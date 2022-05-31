[Delete Node in a BST](https://leetcode.com/problems/delete-node-in-a-bst/)


- traverse till the `key` matched, 
- now have to take the decision whether to 
  - make it `null`?
  - replace with `left`
  - replace with `right`
- can choose latter two, first one may lead to data lose.
- below implementation based upon replacing `current` one with the `right`
- but where to attach `left`?
- the `leftmost` of the `right` will be the smallest in so forming new Tree. 
- therefore we should attach there.

```cpp
 TreeNode* dfs(TreeNode* root, int key) {
        if (root == nullptr) {
            return root;
        }
        if (root->val == key) {
            if (root->right) {
                
                auto temp = root->right;
                while (temp->left != nullptr) temp = temp->left;
               temp->left = root->left;
                
                return root->right;
            }
            else {
                return root->left;
            }
            
        }
        
        root->left = dfs(root->left, key); 
        root->right = dfs(root->right, key); 
        return root;
    }
    
    TreeNode* deleteNode(TreeNode* root, int key) {
        root = dfs(root, key); 
        return root;
        
    }
```
