[237. Delete Node in a Linked List](https://leetcode.com/problems/delete-node-in-a-linked-list/), Easy

- Logic was really simple.
- we have been provided a copy of `node` and we don't have to return, means we will have to **reflect back** the changes.
- *Why added here then?*, to emphasise use of **double pointer**.

```cpp

    void deleteNode(ListNode* node) {
        *node = *(node -> next);
    }

```

