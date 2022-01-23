[234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/)

```cpp

class Solution {
public:
    bool isPalindrome(ListNode* head) {
        vector<int> ans;
        for (auto temp = head; temp != nullptr; temp = temp->next)
            ans.push_back(temp -> val);

        ListNode *a = nullptr;
        ListNode *b = head;
        ListNode *c = b -> next;

        while (c != nullptr) {
            b -> next = a;

            a = b;
            b = c;
            c = c -> next;
        }

        b -> next = a;
        int i = 0;
        for (auto temp = b; temp != nullptr; temp = temp->next) {
            if (temp -> val != ans[i++]) {
                return false;
            }
        }
        return true;

    }
};
```


O(1) space to be updated
