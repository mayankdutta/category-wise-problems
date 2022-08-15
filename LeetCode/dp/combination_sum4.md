[Combination Sum IV](https://leetcode.com/problems/combination-sum-iv/), Unbounded knapsack, 1D

- Given an amount, we were supposed to find different combinations.
- unbounded knapsack type
- 1D state.

```cpp
class Solution {
    public:
    int combinationSum4(vector<int>& nums, int target) {
        vector<unsigned long long int> dp(target + 1, 0);
        dp[0] = 1;

        for (int i = 0; i <= target; i++) {

            for (const auto& c: nums) {
                if (c <= i) {
                    dp[i] += dp[i - c];
                }
            }

        }
        return dp[target];

    }
};
```
