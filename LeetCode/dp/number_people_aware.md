[2327. Number of People Aware of a Secret](https://leetcode.com/problems/number-of-people-aware-of-a-secret/), Knapsack
type, medium

- we have to find the size of window.
- till when we can keep up the incrementing.
- and when to stop.
- after realizing these, this is nothing but the knapsack type dp.

```cpp
class Solution {
public:
    int peopleAwareOfSecret(int n, int delay, int forget) {
        const int mod = 1e9 + 7;
        using ll = long long int;
        
        vector<ll> dp(n + 2, 0);
        
        dp[1] = 1;
        for (int i = 1; i <= n; i++) {
            if (dp[i]) {
                for (int j = i + delay; j <= n && j < (i + forget); j++) {
                    dp[j] += dp[i];
                    dp[j] %= mod;
                }
            }
        }
        ll ans  = 0;
        for (int i = n; i > max(n - forget, 0); i--) {
            ans += dp[i]; 
            ans %= mod;
        }
        return ans;
    }
};
```