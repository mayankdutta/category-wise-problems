[21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

- Create a dummy node.
- Keep constructing new links*(breaking the old links)*, as condition satisfies.
- Therefore no need to take new space.
- keep in mind while returning, return the next space.

<details> 
<summary> Implementation, Constant space </summary>

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
    ListNode* mergeTwoLists(ListNode* one, ListNode* two) {
        ListNode* dummy = new ListNode();
        ListNode* head  = dummy;

        while (one != nullptr && two != nullptr) {
            if (one->val < two->val) {
                dummy->next = one;
                one = one->next;
            }
            else {
                dummy->next = two;
                two = two->next;
            }
            dummy = dummy->next;
        }
        if (one != nullptr) dummy->next = one;
        if (two != nullptr) dummy->next = two;
        return head->next;
    }
};

```

</details>
