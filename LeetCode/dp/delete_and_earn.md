[740. Delete and Earn](https://leetcode.com/problems/delete-and-earn/)

- since we can only delete the arr[i] - 1 and arr[i] + 1, therefore sorting and counting frequencies it would be a good idea.
- we framed this problem as house robber type, to take or not to take.
- but here if the previous element isn't the current - 1, then we can take that too, unlike house robber.

#### how to start

1. States
   First, we need to decide on state variables. As a reminder, state variables should be fully capable of describing a scenario.
2. Recurrence relation
   Next, we need to find a recurrence relation, which is typically the hardest part of the problem. For any recurrence relation, a good place to start is to think about a general state
3. Base case
4. Code it

you might want to solve [House robber](/LeetCode/dp/house_robber.md) first.

<details>
<summary> implementation </summary>

```cpp
class Solution {
    public:
    int deleteAndEarn(vector<int>& nums) {
        using ll = long long int;

        map<ll, ll> mp;
        for (const auto& i: nums) mp[i] ++;

        sort(nums.begin(), nums.end());
        nums.resize(unique(nums.begin(), nums.end()) - nums.begin());

        ll n = nums.size();

        vector<ll> dp(n + 1, 0);

        dp[0] = nums[0] * mp[nums[0]];
        if (n == 1)  return dp[0];

        if (nums[1] == nums[0] + 1)
            dp[1] = max(dp[0], mp[nums[1]] * nums[1]);
        else
            dp[1] =(dp[0] + mp[nums[1]] * nums[1]);

        for (int i = 2; i < n; i++)  {
            if (nums[i] == nums[i - 1] + 1)
                dp[i] = max(dp[i - 2] + nums[i] * mp[nums[i]], dp[i - 1]);
            else
                dp[i] = max(dp[i - 2], dp[i - 1]) + nums[i] * mp[nums[i]];
        }

        return dp[n - 1];
    }
};
```

</details>
