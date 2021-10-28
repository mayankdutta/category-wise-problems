[141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/), Easy

- a Must know problem
- Idea is to use two pointer, one is `slow` and one is `fast`.
- Traverse them, one with normal rate, other one with twice the rate, 
- If they match somewhere then there must be cycle, else not.

<details> 
<summary> Code </summary>

```cpp

   bool hasCycle(ListNode *head) {
        if (!head) return false;
        auto s = head; 
        auto f = head;
        
        while (f -> next and f -> next -> next) {
            s = s -> next;
            f = f -> next -> next;
            
            if (s == f) return true;
        }
        return false;
        
    }
```
</details> 
