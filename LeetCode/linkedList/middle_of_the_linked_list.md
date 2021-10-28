[878 Middle of the linked list](https://leetcode.com/problems/middle-of-the-linked-list/)
- Based on the concept of [cycle finding in linked list](/Leetcode/linkedList/LLcycle.md)
- If there is no cycle, then by the time faster one reached to the end, slower one should be at `half` the distance.
- because rate of faster one was doubled.

<details> 
<summary> Code </summary>

```cpp

    ListNode* middleNode(ListNode* head) {
        auto s = head; 
        auto f = head; 
        
        while (f and f -> next) {
            s = s -> next; 
            f = f -> next -> next;
        }
        
        return s;
    }
```
</details> 
