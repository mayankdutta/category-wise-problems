[D - FG Operation](https://atcoder.jp/contests/abc220/tasks/abc220_d), Dynamic programming, Coin change type

Approach.

- [Reference 1](https://github.com/mayankdutta/category-wise-problems/blob/main/CSES/README.md)
- [Reference 2](https://github.com/mayankdutta/category-wise-problems/blob/main/USACO/README.md)
- Try to make at least one recurrence relation by yourself, with the help of test case.
- For example in this problem
  - If i take `size of array` in row and `0 - 9` in column.
  - Note that `0 - 9` signifies **values whose `mod` taken in previous iteration**.
  - hence recurrence relation will roughly be like.
    - `dp[2][j + arr[i - 1]] += dp[2 - 1][j];`
    - `dp[2][j * arr[i - 1]] += dp[2 - 1][j];`
    - assuming that i is from `1 -> n + 1`, for the sake of `2D dp array`.
    - then generalise the above statement.

<details>
<summary>Implementation</summary>

```cpp

  ll n;
  cin >> n;
  vector<ll> arr(n);
  for (ll i = 0; i < n; i++)
      cin >> arr[i];

  ll dp[n + 1][10];
  memset(dp, 0, sizeof(dp));
  dp[1][arr[0]] = 1;

  for (int i = 1; i <= n; i++) {
      for (int j = 0; j < 10; j++) {
          dp[i][(j + arr[i - 1]) % 10] += dp[i - 1][j];
          dp[i][(j * arr[i - 1]) % 10] += dp[i - 1][j];
          dp[i][(j + arr[i - 1]) % 10] %= mod;
          dp[i][(j * arr[i - 1]) % 10] %= mod;
      }
  }

  for (int j = 0; j < 10; j++) {
      cout << dp[n][j] << '\n';
  }
  cout << '\n';


```

</details>
