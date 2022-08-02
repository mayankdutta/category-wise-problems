[1049. Last Stone Weight II ](https://leetcode.com/problems/last-stone-weight-ii/)

<hr>

##### MEMOIZATION

- we will be storing the sum of only one set.
- unstored sum can be derived via subtraction.
- and at the end we need to minimized that.

<details>
<summary> Implementation </summary>

```cpp
class Solution {
    public:
    int n;
    vector<vector<int>> dp;
    vector<int> arr;
    int totalSum;
    int fun(int i, int sum) {
        if (i == n) {
            return abs((totalSum - sum) - sum);
        }

        int &ans = dp[i][sum];
        if (ans == -1) {
            ans = min(fun(i + 1, sum + arr[i]), fun(i + 1, sum));
        }
        return ans;

    }
    int lastStoneWeightII(vector<int>& stones) {
        this->arr = stones;
        this->n = stones.size();
        this->totalSum = accumulate(arr.begin(), arr.end(), 0);
        this->dp.resize(n + 1, vector<int>(totalSum + 1, -1));

        return fun(0, 0);
    }
};
```

</details>

<hr>

##### ITERATIVE

- This question equals to partition an array into 2 subsets whose difference is minimal
  - 1. S1 + SUM = TOTAL_SUM
  - 2. S1 - SUM = diff
- `diff = TOTAL_SUM - 2 * SUM` minimize diff equals to maximize SUM
- Now we should find the maximum of SUM , range from 0 to SUM/2, using dp can solve this
- `dp[i][j] = {true if some subset from 1st to j'th has a sum equal to sum i, false otherwise}`
  - i ranges from (sum of all elements) {1..n}
  - j ranges from {1..n}
- same as [494. Target Sum](https://leetcode.com/problems/target-sum/)

<details>
<summary> Implementation </summary>

```cpp
class Solution {
public:
    int lastStoneWeightII(vector<int>& stones) {
        int n = stones.size();
        int total_sum = accumulate(stones.begin(), stones.end(), 0);
        int half = total_sum / 2 + (total_sum%2 != 0);

        vector<vector<int>> dp(n + 1, vector<int>(half + 1, 0));
        dp[0][0] = 1;

        int curr_sum = 0;
        for (int i = 1; i <= n; i++) {
            for (int sum = 0; sum <= half; sum++) {
                dp[i][sum] = dp[i - 1][sum];
                if (sum >= stones[i - 1]) {
                    if (dp[i][sum] < dp[i - 1][sum - stones[i - 1]]) {
                        curr_sum = max(curr_sum, sum);
                        dp[i][sum] = dp[i - 1][sum - stones[i - 1]];
                    }
                }
            }
        }

        return abs(total_sum - 2 * curr_sum);
    }
};

```

</details>

<hr>

##### MORE CONCISE ITERATIVE

###### [notes](/notes/dp/bounded_vs_unbounded_knapsack.md)

- only state is the SUM.
- but we need to run the loop in **REVERSE ORDER** from that of state.
- If we run the loop in the **NORMAL FASHION** we will be getting the **UNBOUNDED KNAPSACK**
  - that would mean that we are taking each qty infinite no. of times.
- for **BOUNDED KNAPSACK** we will have to run in reverse order, by doing so we are making sure to count each in limited fashion.

<details>
<summary> Implementation </summary>

```cpp
class Solution {
public:
    int lastStoneWeightII(vector<int>& stones) {
        int n = stones.size();
        int total_sum = accumulate(stones.begin(), stones.end(), 0);
        int half = total_sum / 2 + (total_sum%2 != 0);

        vector<int> dp(half + 1, 0);
        dp[0] = 1;

        int curr_sum = 0;
        for (int i = 1; i <= n; i++) {
            for (int sum = half; sum >= 0; sum --) {
                if (sum >= stones[i - 1]) {
                    dp[sum] += dp[sum - stones[i - 1]];
                    if (dp[sum]) {
                        curr_sum = max(curr_sum, sum);
                    }
                }
            }
        }

        return abs(total_sum - 2 * curr_sum);
    }
};
```

</details>
