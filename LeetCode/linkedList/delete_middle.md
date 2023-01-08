[2095. Delete the Middle Node of a Linked List](https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/)

#### method 1

- using extra variable.
- fast, slow with previous pointer. 

```cpp
ListNode* deleteMiddle(ListNode* head) {
    if (head->next == nullptr) {
        return nullptr;
    }
    
    auto slow = head; 
    auto fast = head; 
    auto prev = head; 
    
    while (fast != nullptr && fast->next != nullptr) {
        prev = slow;
        slow = slow->next;
        fast = fast->next;
        fast = fast->next;
    }
    
    prev->next = slow->next;
    return head;
}
```


#### method 2

- without extra variable. 
- notice the starting point of fast pointer.

```cpp
ListNode* deleteMiddle(ListNode* head) {
    if (head->next == nullptr) {
        return nullptr;
    }
    
    auto slow = head; 
    auto fast = head->next->next; 
    
    while (fast != nullptr && fast->next != nullptr) {
        slow = slow->next;
        fast = fast->next;
        fast = fast->next;
    }
    
    slow->next = slow->next->next;
    return head;
}
```

