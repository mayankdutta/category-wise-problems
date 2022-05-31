[96. Unique Binary Search Trees](https://leetcode.com/problems/unique-binary-search-trees/)

### Permutation and combination

##### Catalan number

#### $C(2n, n) \over (n + 1)$ = $(2n!) \over (n! \times n!) \times (n + 1)$

```cpp
using ll = long long int;
class Solution {
public:
     ll C(int n, int r) {
        if(r > n - r)
            r = n - r;
        ll ans = 1;
        ll i;

        for(i = 1; i <= r; i++) {
            ans = ans * (n - r + i);
            ans /= i;
        }
        return ans;
    }
    int numTrees(int n) {
        ll ans = C(2 * n, n);
        ans /= (n + 1);
        return ans;
    }
};
```

### Dp

- guess for the first 2, 3
- make the relation for the next 
- in this way make the recurrence relation

```cpp
int numTrees(int n) {
        vector<int> dp(21 , 0);
        dp[0] = 1;
        dp[1] = 1;
        dp[2] = 2;
        for (int i = 3 ; i <= n ; i++){
            for (int j = i ; j >= 1 ; j--){
                dp[i] = dp[i] + dp[j-1]*dp[i-j];
            }
        }
        return dp[n];
    }
```
