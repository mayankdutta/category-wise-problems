[148. Sort List ](https://leetcode.com/problems/sort-list/)

- break down code into following steps.
  - merging the List
  - divide and conquer
- while merging the list, please refer to the part of [merging two sorted list](/LeetCode/likedList/merge_two_sorted_list.md)
- for divide and conquer, we will have to keep dividing the list until it's size is 1, or 2.
- for that we need to find `mid` repeatedly and pass to the merge function.
- we also need to have `prev`, `slow`, `fast` pointers for finding the `mid`.
- `prev` for having the just previous part after the mid.

<details> 
<summary> Implementation </summary>

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
    public ListNode merge(ListNode arr, ListNode brr) {
        ListNode dummy = new ListNode(-1, null);
        ListNode head = dummy;

        while (arr != null && brr != null) {
            if (arr.val < brr.val) {
                head.next = arr;
                arr = arr.next;
            }
            else {
                head.next = brr;
                brr = brr.next;
            }
            head = head.next;
        }
        if (arr != null) head.next = arr;
        if (brr != null) head.next = brr;
        return dummy.next;

    }
    public ListNode mergeSort(ListNode head) {
        if (head == null || head.next == null)
            return head;

        ListNode slow = head;
        ListNode fast = head;
        ListNode prev = slow;

        while (fast != null && fast.next != null) {
            prev = slow;
            slow = slow.next;
            fast = fast.next.next;
        }

        prev.next = null;
        slow = mergeSort(slow);
        head = mergeSort(head);

        return merge(slow, head);
    }

    public ListNode sortList(ListNode head) {
        return mergeSort(head);
    }
}
```

</details>
