[100. Same Tree](https://leetcode.com/problems/same-tree/), Easy 

- again dfs concept same as of depth of the tree was used. 

<details>
<summary> implementation</summary> 

```cpp
class Solution {
  public:
  bool isSameTree(TreeNode* p, TreeNode* q) {
    if (p == nullptr and q == nullptr) 
      return true;
    if (p == nullptr or q == nullptr) 
      return false;

    return      (p -> val == q -> val)  && 
      isSameTree(p -> left,  q -> left) && 
      isSameTree(p -> right, q -> right);
  }
};

```

</details>
