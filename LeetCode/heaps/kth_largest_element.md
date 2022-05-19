[ 215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/)

- typical `heap` question.
- try to think what you can do with priority queue.
- there are other ways also like sorting and all.

```java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<>() {
            @Override
            public int compare(Integer one, Integer two) {
                return two.compareTo(one);
            }
        });
        for (Integer i: nums) {
            pq.add(i);
        }
        int ans = 0;
        for (int i = 0; i < k; i ++) {
            ans = pq.poll();
        }
        return ans;

    }
}
```
