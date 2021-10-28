[2 - Add two numbers](https://leetcode.com/problems/add-two-numbers/), Medium
- Idea is to add given no.s as traverse
- we must take care of the case that if sum > 10, we will have to use an extra variable `carry`.
- *what if at the end a two digit no. remained like 12*, 1 will be added within `while(condition1 && condition2)`
  for the digit `2`, extra if condition is added at the end.


<details>
<summary> Code </summary>


```cpp
   ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* head = nullptr;
        ListNode* tail = head;
        int carry = 0;
        while (l1 != nullptr or l2 != nullptr) {
            int current = 0;
            if (l1 != nullptr and l2 != nullptr) {
                current = l1 -> val + l2 -> val + carry;
                carry = current / 10;
                current %= 10;
            }
            else if (l1 != nullptr) {
                current = l1 -> val + carry;
                carry = current / 10;
                current %= 10;
            }
            else {
                current = l2 -> val + carry;
                carry = current / 10;
                current %= 10;
            }
            ListNode *temp = new ListNode;
            temp -> val = current;
            temp -> next = nullptr;

            if (head == nullptr) {
                head = tail = temp;
            } else {
                tail -> next = temp;
                tail = temp;
            }

            if (l1 != nullptr) l1 = l1 -> next;
            if (l2 != nullptr) l2 = l2 -> next;
        }
        if (carry) {
            ListNode *temp = new ListNode;
            temp -> val = carry;
            temp -> next = nullptr;
            
            tail -> next = temp;
            tail = temp;
        }
        
        return head;
    }

```
</details>
