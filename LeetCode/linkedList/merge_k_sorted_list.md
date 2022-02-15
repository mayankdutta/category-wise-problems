[23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

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
    public ListNode mergeKLists(ListNode[] lists) {
        PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                if (o1.equals(o2)) return 1;
                return o2.compareTo(o1);
            }
        });
        for (ListNode list : lists) {
            for (ListNode temp = list; temp != null; temp = temp.next) {
                pq.add(temp.val);
            }
        }
        ListNode head = null;
        while (!pq.isEmpty()) {
            Integer top = pq.poll();
            ListNode temp = new ListNode(top, head);
            head = temp;
        }
        return head;
    }
}
```

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
    ListNode* mergeKLists(vector<ListNode*>& lists) {
        priority_queue<int> pq;
        for (const auto& list: lists)
            for (auto temp = list; temp != nullptr; temp = temp->next)
                pq.push(temp->val);

        ListNode* head = nullptr;
        while (!pq.empty()) {
            auto top = pq.top();
            ListNode *temp = new ListNode(top, head);
            head = temp;
            pq.pop();
        }

        return head;
    }
};
```
