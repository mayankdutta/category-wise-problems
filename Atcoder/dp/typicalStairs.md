# Fibonacci type

[C - Typical stairs](https://atcoder.jp/contests/abc129/tasks/abc129_c), Easy, 1D DP

- base one kind of popular variation of Fibonacci, so directly reading code shouldn't be problem
- just take care of the dead step

<details> 
<summary> Style 1 </summary>

```cpp
  int n, m;
  cin >> n >> m;
  set<int> st;
  for (int i = 0; i < m; i++) {
    int a;
    cin >> a;
    st.insert(a);
  }

  std ::vector<long long int> dp(n + 1, 0);
  dp[0] = 1;
  dp[1] = 1;

  if (st.find(1) != st.end())
    dp[1] = 0;

  for (int i = 2; i <= n; i++) {
    if (st.find(i) != st.end())
      continue;
    dp[i] = dp[i - 1] + dp[i - 2];
    dp[i] %= mod;
  }
  cout << dp[n] << '\n';

```

</details>

<details> 
<summary> Style 2 </summary>

```cpp
  int n, m;
  cin >> n >> m;
  set<int> st;
  for (int i = 0; i < m; i++) {
    int a;
    cin >> a;
    st.insert(a);
  }

  std ::vector<long long int> dp(n + 10, 0);
  dp[0] = 1;

  for (int i = 0; i <= n; i++) {
    if (st.find(i) != st.end())
      continue;
    dp[i] %= mod;
    dp[i + 1] += dp[i];
    dp[i + 2] += dp[i];
  }
  cout << dp[n] << '\n';



```

</details>
