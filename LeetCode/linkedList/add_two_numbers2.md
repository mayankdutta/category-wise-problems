[445. Add Two Numbers II ](https://leetcode.com/problems/add-two-numbers-ii/)

##### Prerequisites

- concept of linked list and reversing linked list.
- [Add two numbers 1](/LeetCode/linkedlist/add_two_numbers2.md)

<hr>

##### Approach

- reversed linked list first,
- traverse till `nullptr` to take sum.
- took care of `sum > 10` with remainder variable.

<details>

<summary>  C++ implementation </summary>

```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
    public:
    ListNode* reverse(ListNode* head) {
        ListNode *a = nullptr, *b = head, *c = b -> next;
        while (c != nullptr) {
            b -> next = a;
            a = b;
            b = c;
            c = c -> next;
        }
        b -> next = a;
        return b;
    }

    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        l1 = reverse(l1);
        l2 = reverse(l2);

        ListNode *tail = nullptr;
        ListNode *head = nullptr;
        int rem = 0;

        ListNode *one = l1, * two = l2;
        while (one != nullptr or two != nullptr) {

            if (one != nullptr and two != nullptr) {
                int sum = one -> val + two -> val + rem;
                rem = sum/10;

                one = one -> next ;
                two = two -> next ;

                ListNode *temp = new ListNode(sum % 10, nullptr);
                if (head == nullptr and tail == nullptr) {
                    head = tail = temp;
                }
                else {
                    tail -> next = temp;
                    tail = temp;
                }
            }
            else if (one != nullptr) {
                int sum = one -> val + rem;
                rem = sum/10;

                one = one -> next ;

                ListNode *temp = new ListNode(sum % 10, nullptr);
                if (head == nullptr and tail == nullptr) {
                    head = tail = temp;
                }
                else {
                    tail -> next = temp;
                    tail = temp;
                }
            }
            else if (two != nullptr) {
                int sum = two -> val + rem;
                rem = sum/10;

                two = two -> next ;
                ListNode *temp = new ListNode(sum % 10, nullptr);
                if (head == nullptr and tail == nullptr) {
                    head = tail = temp;
                }
                else {
                    tail -> next = temp;
                    tail = temp;
                }
            }
        }

        if (rem) {
            ListNode *temp = new ListNode(rem, nullptr);
            if (head == nullptr and tail == nullptr) {
                head = tail = temp;
            }
            else {
                tail -> next = temp;
                tail = temp;
            }
        }

        if (head == nullptr)
            return new ListNode(0, nullptr);

        return reverse(head);
    }
};
```

</details>

<hr>

- this time, took help of stacks.
- thus prevented the reversing the linked list.
- later made another array for storing result.

<details>
<summary> Java implementation </summary>

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode reverse(ListNode head) {
        ListNode a = null;
        ListNode b = head;
        ListNode c = b.next;

        while (c != null) {
            b.next = a;
            a = b;
            b = c;
            c = c.next;
        }
        b.next = a;
        return b;
    }
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        Stack<Integer> one = new Stack<>();
        Stack<Integer> two = new Stack<>();

        for (ListNode temp = l1; temp != null; temp = temp.next)
            one.push(temp.val);
        for (ListNode temp = l2; temp != null; temp = temp.next)
            two.push(temp.val);

        ListNode head = null, tail = null;
        int rem = 0;

        while (!one.empty() || !two.empty()) {
            if (!one.empty() && !two.empty()) {
                int sum = one.pop() + two.pop() + rem;
                rem = sum/10;

                ListNode temp = new ListNode(sum%10, null);
                if (head == null && tail == null) {
                    head = temp;
                    tail = temp;
                }
                else {
                    tail.next = temp;
                    tail = temp;
                }
            }
            else if (!one.empty()) {
                int sum = one.pop() + rem;
                rem = sum/10;
                ListNode temp = new ListNode(sum%10, null);
                if (head == null && tail == null) {
                    head = temp;
                    tail = temp;
                }
                else {
                    tail.next = temp;
                    tail = temp;
                }
            }
            else if (!two.empty()) {
                int sum = two.pop() + rem;
                rem = sum/10;
                ListNode temp = new ListNode(sum%10, null);
                if (head == null && tail == null) {
                    head = temp;
                    tail = temp;
                }
                else {
                    tail.next = temp;
                    tail = temp;
                }

            }
        }
        if (rem > 0) {
            ListNode temp = new ListNode(rem, null);
            if (head == null && tail == null) {
                head = temp;
                tail = temp;
            }
            else {
                tail.next = temp;
                tail = temp;
            }
        }

        return reverse(head);
    }

}

```

</details>
