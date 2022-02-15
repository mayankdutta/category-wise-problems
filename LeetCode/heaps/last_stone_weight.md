[ 1046. Last Stone Weight](https://leetcode.com/problems/last-stone-weight/)

- just see what we can do
- if it is typical, always get smaller one or greater one type of problem
- read no more, go with `priority queue`.

```java
class Solution {
    public int lastStoneWeight(int[] stones) {
        PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<>() {
            @Override
            public int compare(Integer one, Integer two) {
                return two.compareTo(one);

            }
        });

        for (Integer i: stones) pq.add(i);
        while (pq.size() > 1) {
            int one = pq.poll();
            int two = pq.poll();
            pq.add(Math.abs(one - two));
        }
        if (pq.isEmpty()) return 0;
        return pq.peek();
    }
}
```
