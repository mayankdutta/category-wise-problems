[116. Populating Next Right Pointers in Each Node](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/), medium, implementation

### approach

- for the BFS traversal you should first get familiar with [Level order traversal](/LeetCode/trees/levelorder.md)

<details>
<summary> C++, BFS, deque</summary>

```cpp
Node* connect(Node* root) {
    if (root == nullptr) return root;
    deque<Node*> dq;
    dq.push_back(root);

    root->next = nullptr;
    while (!dq.empty()) {
        int temp_size = dq.size();
        for (int i = 0; i < temp_size; i++) {
            auto u = dq.front();
            dq.pop_front();
            if (u -> left) dq.push_back(u -> left);
            if (u -> right) dq.push_back(u -> right);
        }

        for (int i = 1; i < dq.size(); i++)
            dq[i - 1]->next = dq[i];

    }
    return root;

}

```

</details>

<details>
<summary> DFS variant </summary>

```java
public void connect(TreeLinkNode root) {
    TreeLinkNode level_start=root;
    while(level_start!=null){
        TreeLinkNode cur=level_start;
        while(cur!=null){
            if(cur.left!=null) cur.left.next=cur.right;
            if(cur.right!=null && cur.next!=null) cur.right.next=cur.next.left;

            cur=cur.next;
        }
        level_start=level_start.left;
    }
}

```

</details>
