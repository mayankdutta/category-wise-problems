[714. Best Time to Buy and Sell Stock with Transaction Fee](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/)

follow up of [188. Best Time to Buy and Sell Stock IV](/LeetCode/dp/best_time_to_buy_sell_stock4.md)

```cpp
class Solution {
    public:
    int maxProfit(vector<int>& prices, int fee) {
        int n = prices.size();
        vector<vector<int>> dp(n + 1, vector<int>(2, 0));
        for (int i = n - 1; i >= 0; i--) {
            for (int bought = 0; bought < 2; bought++) {
                if (bought) {
                    dp[i][bought] = max(dp[i + 1][bought], dp[i + 1][!bought] + prices[i] - fee);
                }
                else {
                    dp[i][bought] = max(dp[i + 1][bought], dp[i + 1][!bought] - prices[i]);
                }
            }
        }
        return dp[0][0];
    }
};
```

```cpp
class Solution {
    public:
    int maxProfit(vector<int>& prices, int fee) {
        int n = prices.size();
        vector<vector<int>> dp(n + 1, vector<int>(2, 0));
        for (int i = n - 1; i >= 0; i--) {
            for (int bought = 0; bought < 2; bought++) {
                dp[i][bought] = dp[i + 1][bought];
                if (bought) {
                    dp[i][bought] = max(dp[i][bought], dp[i + 1][!bought] + prices[i] - fee);
                }
                else {
                    dp[i][bought] = max(dp[i][bought], dp[i + 1][!bought] - prices[i]);
                }
            }
        }
        return dp[0][0];
    }
};
```
