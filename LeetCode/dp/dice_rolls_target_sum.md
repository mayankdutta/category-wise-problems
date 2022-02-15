[1155. Number of Dice Rolls With Target Sum](https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/)

```cpp
const int mod = int(1e9 + 7);
using ll = long long int;
class Solution {
    public:
    ll dp[31][1001];
    int n, k, target;

    int fun(int n, int target) {
        if (n == 0 and target == 0) return 1;
        if (n == 0 or target < 0) return 0;

        ll &ans = dp[n][target];
        if (ans == -1) {
            ans = 0;
            for (int i = 1; i <= k; i++) {
                ans = (ans + fun(n - 1, target - i));
                ans %= mod;
            }
        }
        return ans;
    }
    int numRollsToTarget(int n, int k, int target) {
        for (int i = 0; i < 31; i++)
            for (int j = 0; j < 1001; j++)
                dp[i][j] = -1;

        this->n = n;
        this->k = k;
        this->target = target;

        return fun(n, target);
    }
};
```

```java
class Solution {
    public int numRollsToTarget(int n, int K, int target) {

        int[][] dp = new int [n + 1][target + 1];
        dp[0][0] = 1;
        int mod = (int)(1e9 + 7);

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= target; j++) {
                for (int k = 1; k <= K; k++) {
                    if (j >= k) {
                        dp[i][j] = (dp[i][j]%mod + dp[i - 1][j - k]%mod)%mod;
                    }
                }
            }
        }
        return dp[n][target];
    }
}
```
