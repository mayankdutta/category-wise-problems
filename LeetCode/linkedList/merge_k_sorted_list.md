[23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

### Brute

- kind of brute method,
- keep all the nodes in priority queue,
- form a new sorted queue and return it.

<details> 
<summary> Java Implementation </summary>

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

</details>

<details> 
<summary> cpp Implementation </summary>

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

</details>

### Optimal

##### binary search + merge sort

- for the merge sort part kindly refer to [sort list](/LeetCode/linkedList/sort_list.md).
- do the binary search, send `one` node at a time that is when `start == mid`.
- in this manner we will have two `Nodes` to merge them.

<details>

<summary>Java Implementation</summary>

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
    public ListNode merge(ListNode list1, ListNode list2) {
        ListNode dummy = new ListNode(-1, null);
        ListNode head = dummy;

        while (list1 != null && list2 != null) {
            if (list1.val < list2.val) {
                dummy.next = list1;
                list1 = list1.next;
            }
            else {
                dummy.next = list2;
                list2 = list2.next;
            }
            dummy = dummy.next;
        }
        if (list1 != null) dummy.next = list1;
        if (list2 != null) dummy.next = list2;

        return head.next;
    }
    public ListNode mergeSort(ListNode[] lists, int start, int end) {
        if (start == end) {
            return lists[start];
        }
        if (end < start) {
            return null;
        }

        int mid = (start + end) / 2;

        ListNode list1 = mergeSort(lists, start, mid);
        ListNode list2 = mergeSort(lists, mid + 1, end);

        return merge(list1, list2);
    }

    public ListNode mergeKLists(ListNode[] lists) {
        return mergeSort(lists, 0, lists.length - 1);
    }

}

```

</details>
