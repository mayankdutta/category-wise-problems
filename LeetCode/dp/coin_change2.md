[518. Coin Change 2](https://leetcode.com/problems/coin-change-2/)

[pre requisite](/notes/dp/counting_dp.md)

NOTE: If you interchange the loop, that would mean now you are considering different permutations different, therefore now you will get large answer.

```cpp
class Solution {
    public:
    int change(int amount, vector<int>& coins) {
        int n = coins.size();
        vector<int> dp(amount+ 1, 0);
        dp[0] = 1;
        for (const auto& c: coins) {
            for (int i = 1; i <= amount; i++) {
                if (i >= c)
                    dp[i] += dp[i - c];
            }
        }
        return dp[amount];
    }
};
```
