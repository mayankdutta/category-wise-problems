[790. Domino and Tromino Tiling](https://leetcode.com/problems/domino-and-tromino-tiling/), medium, fibonacci type

- pick up a notebook
- find the answers on various `n` yourself.
- make relations b/w them.

<details> 
<summary> code </summary>

```cpp

int numTilings(int n) {
    const int mod = 1e9 + 7;
    vector<int> dp(1020, 0);

    dp[0] = 1;
    dp[1] = 1;
    dp[2] = 2;

    for (int i = 3; i <= n; i++) {
        dp[i] = (2 * (dp[i - 1]) % mod + (dp[i - 3] % mod)) % mod;
        dp[i] %= mod;
    }

    return dp[n];
}



```
</details> 
