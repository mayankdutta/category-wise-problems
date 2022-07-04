## Contains duplicate

### contains duplicate 2
[219. Contains Duplicate 2](https://leetcode.com/problems/contains-duplicate-ii/)

```java
class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        if (k == 0) {
            return false;
        }
        Set<Integer> st = new HashSet<>();
        for (int i=  0; i < Math.min(nums.length, k); i++) {
            if (!st.add(nums[i])) {
                return true;
            }
        }
        
        for (int i = k; i < nums.length; i++) {
            if (!st.add(nums[i])) {
                return true;
            }
            st.remove(nums[i - k]);
        }
        return false;
    }
}
```
