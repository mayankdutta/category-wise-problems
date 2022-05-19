[328. Odd Even Linked List ](https://leetcode.com/problems/odd-even-linked-list/), Medium

#### method 1
- could form separate LL and then merge them later.

#### optimal method

- instead of using extra space. 
- we can play with `next address`.

<details> 
<summary> Code </summary>

```cpp

class Solution {
  public:
  ListNode* oddEvenList(ListNode* head) {
    if (head == nullptr) 
      return head;

    ListNode *even = head -> next;
    ListNode *odd = head;
    ListNode *evenHead = even;

    while (even != nullptr and even -> next != nullptr) {
      odd -> next = odd -> next -> next; 
      even -> next = even -> next -> next; 

      odd = odd -> next; 
      even = even -> next;
    }

    odd -> next = evenHead;
    return head;
  }
};

```
</details> 
