[322. Coin Change](https://leetcode.com/problems/coin-change/)

- unbounded knapsack type problem
- require only 1 state, that is no. of coins for amount `x`.
- 2 states would be overkill.

<details> 
<summary> Naive Approach </summary>

```cpp
class Solution {
    public:
    vector<vector<int>> dp;
    vector<int> coins;

    int fun(int index, int value) {
        if (value == 0) return 0;
        if (value < 0) return 1e6;
        if (index == coins.size())  {
            return 1e6;
        }

        int &ans = dp[index][value];

        if (ans == -1) {
            int op1 = fun(index + 1, value);
            int op2 = fun(index, value - coins[index]) + 1;

            ans = min(op1, op2);
        }
        return ans;
    }

    int coinChange(vector<int>& coins, int amount) {
        dp = vector<vector<int>>(coins.size() + 1, vector<int>(amount + 1, -1));
        this->coins = coins;
        int ans = fun(0, amount);
        if (ans == 1e6) ans = -1;
        return ans;
    }
};
```

</details>

<details> 
<summary> Correct approach memo version. </summary>

```cpp
class Solution {
    public:
    vector<int> dp, coins;
    int fun(int i) {
        if (i == 0) return 0;
        if (i < 0) return 1e9;

        int &ans = dp[i];
        if (ans == -1) {
            dp[i] = 1e9;
            for (const auto& c: coins) {
                if (c <= i) {
                    dp[i] = min(dp[i], fun(i - c) + 1);
                }
            }
        }
        return ans;
    }

    int coinChange(vector<int>& coins, int amount) {
        dp = vector<int>(amount + 1, -1);
        this->coins = coins;
        int ans = fun(amount);
        if (ans ==  1e9) ans = -1;
        return ans;
    }
};
```

</details>

<details> 
<summary> Correct approach iterative version. </summary>

```cpp
class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        vector<int> dp(amount + 1, 1e9);
        dp[0] = 0;

        for (int i = 0; i <= amount; i++) {
            for (const auto& c: coins) {
                if (c <= i) {
                    dp[i] = min(dp[i - c] + 1, dp[i]);
                }
            }
        }
        int ans = dp[amount];
        if (ans == 1e9) ans = -1;
        return ans;
    }
};
```

</details>
