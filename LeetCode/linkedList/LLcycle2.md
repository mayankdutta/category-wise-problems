[142. Linked List Cycle II] (https://leetcode.com/problems/linked-list-cycle-ii/?utm_source=pocket_mylist)

```cpp
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
// https://leetcode.com/problems/linked-list-cycle-ii/discuss/44774/Java-O(1)-space-solution-with-detailed-explanation.
public class Solution {
    public ListNode detectCycle(ListNode head) {
        ListNode slow = head;
        ListNode fast = head;

        while (fast != null && fast.next != null) {
            fast = fast.next;
            fast = fast.next;
            slow = slow.next;

            if (slow == fast) {
                ListNode slower = head;

                while (slower != slow) {
                    slow = slow.next;
                    slower = slower.next;
                }
                return slow;
            }
        }
        return null;
    }
}
```
