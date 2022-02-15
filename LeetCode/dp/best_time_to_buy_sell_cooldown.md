[309. Best Time to Buy and Sell Stock with Cooldown](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/)

follow up of [714. Best Time to Buy and Sell Stock with Transaction Fee](/LeetCode/dp/best_time_to_buy_sell_free.md) and [188. Best Time to Buy and Sell Stock IV](/LeetCode/dp/best_time_to_buy_sell_stock4.md).

<details>
<summary> Memoization </summary>

```cpp
class Solution {
    public:
    vector<vector<int>> dp;
    vector<int> prices;

    int fun(int i, int bought) {
        if (i >= prices.size()) {
            return 0;
        }

        int &ans = dp[i][bought];
        if (ans == -1) {
            int doNothing = fun(i + 1, bought);
            int doSomeThing;
            if (bought)
                doSomeThing = fun(i + 2, !bought) + prices[i];
            else
                doSomeThing = fun(i + 1, !bought) - prices[i];

            ans = max(doNothing, doSomeThing);
        }
        return ans;
    }
    int maxProfit(vector<int>& prices) {
        dp.resize(prices.size() + 1, vector<int>(2, -1));
        this->prices = prices;
        return fun(0, 0);
    }
};
```

</details>

<details>
<summary> Iterative </summary>

```cpp
class Solution {
    public:
    int maxProfit(vector<int>& prices) {
        vector<vector<int>> dp;
        dp.resize(prices.size() + 2, vector<int>(2, 0));

        for (int i = prices.size() - 1; i >= 0; i--) {
            for (int bought = 1; bought >= 0; bought --) {
                dp[i][bought] = dp[i + 1][bought];
                dp[i][bought] = max(dp[i][bought],
                                    bought
                                    ? dp[i + 2][!bought] + prices[i]
                                    : dp[i + 1][!bought] - prices[i]);
            }
        }
        return dp[0][0];
    }
};
```

</details>
