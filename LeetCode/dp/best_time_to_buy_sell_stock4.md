[188. Best Time to Buy and Sell Stock IV](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/)

[pre requisite](/notes/dp/state_transition_by_inaction.md)

<details>
<summary> 1. states </summary>

A function that answers the problem for a given state.
We need to know what day it is (so we can look up the current price of the stock), and we need to know how many transactions we have left. These two are directly related to the input.

The note in the problem description says that we cannot engage in multiple transactions at the same time. This means that at any moment, we are either bought one unit of stock or not bought any stock. We should have a state variable that indicates if we are currently bought stock. This variable is fine as a boolean, but for caching purposes, let's use an integer alternating between 0 and 1 (0 means not bought, 1 means bought).

summary

1. i: the ith day. The current price of the stock is price[i].
2. transactionsRemaining: how many transactions we have left. it goes down by one, when we sell (we can also implement, goes down when purchasing).
3. bought means if we have any prior stock, if it is 1, then we need to sell it before.

problem is about maximum achievable profit. Therefore, lets have a function dp where
dp(i, transactionsRemaining, bought) returns the maximum achievable profit starting from ith day with transactionsRemaining transactions remaining, and bought indictes if we start with a stock or not.
dp(0, k, 0) will be the answer of the original problem.

implementation of dp(0, 0, 0) also done and provided.

</details>

<details>
<summary> 2. Recurrence relation </summary>

At each state we will have to decide what to do, based on the status of bought.

```js
1. if we are bought a stock the we have two options.
  1. do nothing: dp(i + 1, transactionsRemaining, 1);
  2. sell it: dp(i + 1, transactionsRemaining - 1, 0) + prices[i];
2. if we are not bought a stock the we have two options
  1. do nothing: dp(i + 1, transactionsRemaining, 1);
  2. buy it: dp(i + 1, transactionsRemaining, 0) - prices[i]
```

to summarise:

```js
dp(i, transactionsRemaining, bought) = if bought == 1
                                            max(doNothing, sellStock)
                                        otherwise
                                            max(doNothing, buyStock)

Where,
  doNothing = dp(i + 1, transactionsRemaining, bought),
  sellStock = prices[i] + dp(i + 1, transactionsRemaining - 1, 0), and
  buyStock = -prices[i] + dp(i + 1, transactionsRemaining, 1).
```

</details>

<details>
<summary> 3. Base Case </summary>

If we are out of transactions transactionsRemaining = 0), then we should immediately return 0 as we cannot make any more money. If the stock is no longer on the market (i = prices.length), then we should also return 0, as we cannot make any more money.

</details>

<details>
<summary> Top down implementation </summary>

<details> 
<summary> C++ implementation </summary>

```cpp
class Solution {
    public:
    int dp[1001][1001][2];
    vector<int> prices;
    int K;

    int fun(int i, int k, int bought) {
        if (k >= K or i >= prices.size()) {
            return 0;
        }

        int &ans = dp[i][k][bought];
        if (ans == -1) {
            int doNothing = fun(i + 1, k, bought);
            int two;
            (bought)
            ? two = fun(i + 1, k + 1, !bought) + prices[i]
                : two = fun(i + 1, k, !bought) - prices[i];

            ans = max(doNothing, two);
        }
        return ans;
    }

    int maxProfit(int k, vector<int>& prices) {
        for (int i = 0; i <= 1000; i++)
            for (int j = 0; j < 1001; j++)
                for (int k = 0; k < 2; k++)
                    dp[i][j][k] = -1;

        this->prices = prices;
        this->K = k;
        return fun(0, 0, 0);
    }
};

```

</details>

<details> 
<summary> 
java implementation
</summary>

```java
class Solution {
    private int[] prices;
    private int[][][] memo;

    private int dp(int i, int transactionsRemaining, int bought) {
        // Base cases
        if (transactionsRemaining == 0 || i == prices.length) {
            return 0;
        }

        if (memo[i][transactionsRemaining][bought] == 0) {
            int doNothing = dp(i + 1, transactionsRemaining, bought);
            int doSomething;

            if (bought == 1) {
                // Sell Stock
                doSomething = prices[i] + dp(i + 1, transactionsRemaining - 1, 0);
            } else {
                // Buy Stock
                doSomething = -prices[i] + dp(i + 1, transactionsRemaining, 1);
            }

            // Recurrence relation. Choose the most profitable option.
            memo[i][transactionsRemaining][bought] = Math.max(doNothing, doSomething);
        }

        return memo[i][transactionsRemaining][bought];
    }

    public int maxProfit(int k, int[] prices) {
        this.prices = prices;
        this.memo = new int[prices.length][k + 1][2];
        return dp(0, k, 0);
    }
}
```

</details>

</details>

<details>
<summary> bottom up implementation </summary>

Again, the recurrence relation is the same with top-down, but we need to be careful about how we configure our for loops. The base cases are automatically handled because the dp array is initialized with all values set to 0. For iteration direction and order, remember with bottom-up we start at the base cases. Therefore we will start iterating from the end of the input and with only 1 transaction remaining.

<details> 
<summary> java implementation </summary>

```java
class Solution {
    public int maxProfit(int k, int[] prices) {
        int n = prices.length;
        int dp[][][] = new int[n + 1][k + 1][2];

        for (int i = n - 1; i >= 0; i--) {
            for (int transactionsRemaining = 1; transactionsRemaining <= k; transactionsRemaining++) {
                for (int bought = 0; bought < 2; bought++) {
                    int doNothing = dp[i + 1][transactionsRemaining][bought];
                    int doSomething;
                    if (bought == 1) {
                        // Sell stock
                        doSomething = prices[i] + dp[i + 1][transactionsRemaining - 1][0];
                    } else {
                        // Buy stock
                        doSomething = -prices[i] + dp[i + 1][transactionsRemaining][1];
                    }

                    // Recurrence relation
                    dp[i][transactionsRemaining][bought] = Math.max(doNothing, doSomething);
                }
            }
        }

        return dp[0][k][0];
    }
}
```

</details> 
<details> 
<summary> C++ implementation </summary>

```cpp
class Solution {
    public:
    int maxProfit(int K, vector<int> &prices) {
        int n = prices.size();
        int dp[n + 1][K + 1][2];
        for (int i = 0; i <= n; i++)
            for (int transactions = 0; transactions <= K; transactions++)
                for (int bought = 0; bought < 2; bought++)
                    dp[i][transactions][bought] = 0;

        for (int i = n - 1; i >= 0; i--) {
            for (int transactions = K - 1; transactions >= 0; transactions--) {
                // for (int transactions = 1; transactions <= K; transactions++) {
                for (int bought = 0; bought < 2; bought++) {
                    dp[i][transactions][bought] = dp[i + 1][transactions][bought];
                    if (bought) {
                        dp[i][transactions][bought] =
                            max(dp[i + 1][transactions + 1][!bought] + prices[i],
                                dp[i][transactions][bought]);
                    } else {
                        dp[i][transactions][bought] =
                            max(dp[i + 1][transactions][!bought] - prices[i],
                                dp[i][transactions][bought]);
                    }
                }
            }
        }
        return (dp[0][0][0]);
    }
};
```

</details>
</details>

<details>
<summary> Time complexity </summary>

The time and space complexity of this problem for both implementations is the number of states since the recurrence relation is just a constant time formula. If n = prices.length, then this means the time and space complexity is O(n k 2) = O(n k)O(n⋅k⋅2)=O(n⋅k).

</details>
