[Distance between two nodes of a Tree](https://www.codingninjas.com/codestudio/problems/distance-between-two-nodes-of-a-tree_800303?topList=top-trees-interview-questions)

### binary tree specific method

- Positive distance given to the `RHS` of the tree.
- Negative distance given to the `LHS` of the tree.
- `distance_node @RHS` - `distance_node @LHS` done at the end.
- if both nodes are `@RHS` we will get the diff.
- else we will get the addition since there was already a `-ve` in `@LHS`.

```cpp

#include <bits/stdc++.h>
map<int, int> mp;
void dfs_left(TreeNode<int>* root, int dist) {
    if (root== nullptr ) return;
    dfs_left(root->left, dist - 1);
    dfs_left(root->right, dist - 1);
    mp[root->val] = dist;
}

void dfs_right(TreeNode<int>* root, int dist) {
    if (root == nullptr) return;
    dfs_right(root->left, dist + 1);
    dfs_right(root->right, dist + 1);
    mp[root->val] = dist;
}

int findDistanceBetweenNodes(TreeNode<int> *root, int node1, int node2) {
    mp.clear();
    mp[root->val] = 0;
    dfs_left(root->left, -1);
    dfs_right(root->right, +1);

    if (mp.find(node1) == mp.end() or mp.find(node2) == mp.end())
        return -1;
    return abs(mp[node2] - mp[node1]);
}

```

### using LCA

- since we have to find the shortest b/w two nodes.
- lets first find the node which is in common b/2 two nodes, which is apparently the LCA.
- find the distance of both from LCA.

```cpp
TreeNode<int> *LCA(TreeNode<int> *root , int node1 , int node2){
    if (!root) return NULL;
    if (root->val == node1 or root->val == node2)
        return root;

    TreeNode<int> *left = LCA(root->left , node1 , node2);
    TreeNode<int> *right = LCA(root->right , node1 , node2);

    if (left and right)
        return root;

    if (left) return left;
    if (right) return right;
    return NULL;
}

int distance(TreeNode<int> *node , int V){
    if (!node) return 0;
    if (node->val == V)
        return 1;
    int left = distance(node->left , V);
    int right = distance(node->right , V);
    if (left or right)
        return (1 + left + right);
    return 0;
}


int findDistanceBetweenNodes(TreeNode<int> *root, int node1, int node2)
{
   if (!root) return 0;
   TreeNode<int>* lca = LCA(root , node1 , node2);
   if (lca == NULL) return -1;
   int d1 = distance(lca , node1);
   int d2 = distance(lca , node2);
   return d1 + d2 - 2;
}
```
