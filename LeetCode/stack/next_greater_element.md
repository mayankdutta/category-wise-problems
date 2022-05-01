[ 503. Next Greater Element II ] ( https://leetcode.com/problems/next-greater-element-ii/ )

refer to [notes](/notes/stacks/)

```java
class Solution {
    public int[] nextGreaterElements(int[] nums) {
        int n = nums.length;
        int[] next_greater = new int[n];
        for (int i = 0; i < n; i++)
            next_greater[i] = -1;

        Stack<Integer> st = new Stack<>();

        for (int i = 0; i < 2 * n; i++) {
            while (!st.isEmpty() && nums[st.peek()] < nums[i % n]) {
                var x = st.peek();
                st.pop();
                next_greater[x] = nums[i % n];
            }
            st.push(i % n);
        }
        return next_greater;
    }
}
```
