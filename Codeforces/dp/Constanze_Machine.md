# DP, 1d, fibonacci type

[C. Constanze's Machine ](https://codeforces.com/problemset/problem/1245/C)
- personally i find this difficult to realize fibonacci base problem.
- you might want to see the tutorial for this problem.

<details> 
<summary> Code </summary>

```cpp
void solve() {
  string s;
  cin >> s;

  if (count(all(s), 'w') or count(all(s), 'm')) {
    cout << 0 << '\n';
    return;
  }

  vll dp(s.size() + 1, 0);
  dp[0] = 1;

  for (int i = 1; i <= s.length(); i++) {
    if (i >= 2 and s[i - 1] == s[i - 2] and
        (s[i - 1] == 'n' or s[i - 1] == 'u')) {

      dp[i] = dp[i - 1] + dp[i - 2];
    } else {

      dp[i] = dp[i - 1];
    }
    dp[i] %= mod;
  }
  cout << dp.back() << '\n';
}
```

</details>
