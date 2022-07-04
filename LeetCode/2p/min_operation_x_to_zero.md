[1658. Minimum Operations to Reduce X to Zero ](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/)

- We only allowed to delete from beginning and the end.
- we have to choose the shortest subarray from `left` and `right` which make `sum = x`.
- or we can rephrase it.
- we have to choose the LONGEST subarray from .......middle...... which makes `sum = TOTAL_SUM - x`
- thats where the sliding window jumps in.

```cpp
int minOperations(vector<int>& nums, int x) {
    int ans = 0;
    int l = 0;
    int n = nums.size();
    int sum = 0;

    if (x == accumulate(nums.begin(), nums.end(), 0)) {
        return nums.size();
    }
    int target = accumulate(nums.begin(), nums.end(), 0) - x;

    for (int r = 0; r < n; r++) {
        sum += nums[r];
        while (l <= r && sum > target) {
            sum -= nums[l++];
        }
        if (sum == target) {
            ans = max(ans, r - l + 1);
        }
    }
    if (ans == 0)
        return -1;
    return n - ans;
}
```
