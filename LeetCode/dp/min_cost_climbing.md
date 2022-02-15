- follow up of fibonacci no.s
- try to do it in const space.

[746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)

```cpp
class Solution {
    public:
    int minCostClimbingStairs(vector<int>& cost) {
        int n = cost.size();
        vector<int> dp(n + 1, 0);

        dp[0] = dp[1] = 0;

        for (int i = 2; i <= n; i++)
            dp[i] = min(dp[i - 2] + cost[i - 2], dp[i - 1] + cost[i - 1]);

        return dp[n];
    }
};
```

by [state reduction](/notes/dp/state_reduction.md)

```cpp
class Solution {
    public:
    int minCostClimbingStairs(vector<int>& cost) {
        int n = cost.size();
        int one = 0;
        int two = 0;
        int curr = INT_MAX;

        for (int i = 2; i <= n; i++) {
            int curr = min(one + cost[i - 1], two + cost[i - 2]);
            int temp = one;
            one = curr;
            two = temp;
        }

        return one;
    }
};
```
