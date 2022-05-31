[297. Serialize and Deserialize Binary Tree ](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)

- thing is to decode a particular traverse in such a way so that we may decode again.
- in this we have placed `space` after every single digit _(to notice single digit, two digit no.s)_
- `#` _(to notice the null values)_
- `data >> val` moves string until space to `val` at a time.
- `out << root->val` moves string to `out stream`.

```cpp
string serialize(TreeNode* root) {
        ostringstream out;
        pre(root, out);
        return out.str();
    }

    TreeNode* deserialize(string data) {
        istringstream in(data);
        return fun(in);
    }

    void pre(TreeNode* root, ostringstream& out) {
        if (root == nullptr) {
            out << "# ";
        }
        else {
            out << root->val << ' ';
            pre(root->left, out);
            pre(root->right, out);
        }
    }
    TreeNode* fun(istringstream& data) {
        string val;
        data >> val;

        if (val == "#")
            return nullptr;

        TreeNode* root = new TreeNode(stoi(val), fun(data), fun(data));
        return root;
    }
```
