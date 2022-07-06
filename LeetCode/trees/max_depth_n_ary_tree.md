[559. Maximum Depth of N-ary Tree] (https://leetcode.com/problems/maximum-depth-of-n-ary-tree/)

- very similar to [Depth of binary tree](/leetcode/trees/depth_of_binarytree.md)
- for n-ary we will have to rely on the DFS.

```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    vector<Node*> children;

    Node() {}

    Node(int _val) {
        val = _val;
    }

    Node(int _val, vector<Node*> _children) {
        val = _val;
        children = _children;
    }
};
*/

class Solution {
public:
    int maxDepth(Node* root) {
        if (root == nullptr) {
            return 0;
        }
        int height = 1;
        for (const auto& v: root->children) {
            height = max(height, maxDepth(v) + 1);
        }
        return height;
    }
};
```
