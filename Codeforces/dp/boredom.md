## 1 state, dp, Fibonacci type

[A. Boredom ](https://codeforces.com/contest/455/problem/A), Easy
- You might face problem to see this as Fibonacci type first.
- you might wanna try to see the reccurence first.

<details>
<summary> code </summary> 
 
 ```cpp
  int n;
  cin >> n;
  vector<ll> arr(n), freq(1e5 + 2, 0), dp(1e5 + 2, 0);
  ll limit = 0;
  for (auto &i : arr) {
    cin >> i;
    freq[i]++;
    limit = max(i, limit);
  }

  dp[1] = freq[1];
  for (int i = 2; i <= limit; i++) {
    dp[i] = max(dp[i - 1], dp[i - 2] + i * freq[i]);
  }
  cout << dp[limit] << '\n';

```
</details>
