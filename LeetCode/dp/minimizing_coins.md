[Minimizing Coins](https://cses.fi/problemset/task/1634/), Foundational, Knapsack.

- given the no.s of coins and an amount.
- we were supposed to minimize the no. of coins.
- typical unbounded knapsack type dp.
- 1D state: no. of coins required to construct coins x.

```cpp
vi arr;
vi dp;

int answer(int n) {
  if (n == 0) return 0;
  if (n <= 0) return INF;

  if (dp[n] != 0) return dp[n];
  int mn = INF;
  for (const auto& i: arr) {
    mn = min(answer(n - i) + 1, mn);
  }

  dp[n] = mn;
  return mn;
}

void solve() {
  int n; cin >> n;
  int target; cin >> target;

  arr = vi(n);
  dp = vi(target + 1, 0);
  for (auto& i: arr) cin >> i;

  auto k = answer(target);

  if (dp[target] == INF) cout << "-1\n";
  else cout << dp[target] << '\n';

}
```
