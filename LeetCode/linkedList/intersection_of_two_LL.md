[160. Intersection of Two Linked Lists ](https://leetcode.com/problems/intersection-of-two-linked-lists/), Easy

- Kind of regular problem
- Idea is to find the diff. in the length and then traverse forward pointer of the shorter linked list, 
  so that while moving forward simulatenously they can be same at some place.


<details>
<summary> code </summary>

```cpp
    int Size(ListNode* head) {
        int count = 0;
        while (head != nullptr) {
            head = head -> next; 
            count ++;
        }
        return count;
    }
    ListNode *findIntersection(ListNode* one, ListNode* two) {
        if (one == two)  
            return one;
        
        while (one != nullptr and two != nullptr) {
            one = one -> next; 
            two = two -> next;
            if (one == two) 
                return one;
        }
        return nullptr;
    }
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        auto one = headA; 
        auto two = headB;
        
        int count1 = Size(one);
        int count2 = Size(two);

        one = headA;
        two = headB;

        int diff = count1 - count2; 
        if (diff > 0) {
            while (diff--) 
                one = one -> next;
        }
        else {
            diff *= -1;
            while (diff--) 
                two = two -> next;
        }
        return findIntersection(one, two);
    }
```
</details>
