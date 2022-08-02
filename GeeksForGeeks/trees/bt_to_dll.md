[Binary tree to DLL](https://practice.geeksforgeeks.org/problems/binary-tree-to-dll/1)

### DFS

- just do what the question is saying.
- take help of the dummy node.

<details>
<summary> Implementation </summary>

```cpp
class Solution
{
    public:

    Node *head;
    Node *prev;
    void dfs(Node* root) {
        if (root == nullptr) {
            return;
        }

        dfs(root->left);

        prev->right = root;
        root->left = prev;
        prev = root;

        dfs(root->right);
    }

    Node * bToDLL(Node *root) {
        head = new Node();
        prev = head;


        dfs(root);

       head = head->right;
        head->left = nullptr;

        return head;
    }
};

```

</details>

### Morris

#### NOTE:

###### PREV in the Morris traversal always points to the PARENT OF ROOT iff the linking is done, to the bottom-est child otherwise.

- form a dummy node.
- make links, usual morris.
- after linking done, if prev happens to point root
  - means prev is parent of root,
  - with the help of dummy make links with root.
  - dont change the prev here.
- proceed in the similar fashion

<details>
<summary> Implementation </summary>

```cpp
class Solution {
    public:

    Node * bToDLL(Node *root) {
        Node *head = new Node();
        Node *dummy = head;

        while (root) {
            if (root->left != nullptr) {
                auto prev = root->left;
                while (prev->right != nullptr && prev != root) {
                    prev = prev->right;
                }

                if (prev == root) {
                    root->left = dummy;
                    dummy->right = root;
                    dummy = root;
                    root = root->right;
                } else {
                    prev->right = root;
                    root = root->left;
                }
            } else {
                root->left = dummy;
                dummy->right = root;
                dummy = root;
                root = root->right;
            }
        }
        head = head->right;
        head->left = nullptr;
        return head;
    }
};

```

</details>
