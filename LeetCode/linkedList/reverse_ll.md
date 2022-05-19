[206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/), Easy

- Classic type of question, and a must know problem.
- Elegant use of 3 pointers.
- You should first dry run on notebook.

```cpp
    ListNode* reverseList(ListNode* head) {
        if (head == nullptr or head -> next == nullptr) 
            return head;

        ListNode* a = nullptr;
        ListNode* b = head;
        ListNode* c = b -> next;

        while (c != nullptr) {
            b -> next = a;

            a = b; 
            b = c;

            c = c -> next;
        }
        
        b -> next = a;
        return b;
    }

```

