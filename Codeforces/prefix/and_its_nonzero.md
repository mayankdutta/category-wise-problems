[B. And It's Non-Zero](https://codeforces.com/contest/1615/problem/B), bitwise, prefix sums

- we will count the no. of zeros we will be getting at every bit.
- will take minimum of those.

#### brute force

- will result in TLE 

<details> 
<summary> brute force </summary>

```cpp
int main() {
  int t = 1;
  cin >> t;

  for (int i = 1; i <= t; i++) {
    int l, r;
    cin >> l >> r;
    int ans = r - l;

    for (int place = 0; place <= 18; place++) {
      int count = 0;
      int temp = 1 << place;
      for (int i = l; i <= r; i++) {
        count += ((i & temp) == 0);
      }
      ans = min(ans, count);
    }
    cout << ans << '\n';
  }
}
```
</details>


- to work on the above method we will have to store the values.
- for that prepare a prefix sum of zeroes
- and then ans. the queries.

<details> 
<summary> correct one </summary>

```cpp
int main() {
  vector<vector<int>> dp(32, vector<int>(2e5, 0));
  for (int place = 0; place <= 18; place++) {
    int temp = 1 << place;
    for (int i = 1; i <= 2e5; i++) {
      dp[place][i] = ((i & temp) == 0);
    }
  }

  for (int place = 0; place <= 18; place++) {
    for (int i = 2; i <= 2e5; i++) {
      dp[place][i] += dp[place][i - 1];
    }
  }

  int t = 1;
  cin >> t;

  for (int i = 1; i <= t; i++) {
    int l, r;
    cin >> l >> r;
    int ans = r - l;

    for (int i = 0; i <= 18; i++) {
      ans = min(ans, (dp[i][r] - dp[i][l - 1]));
    }

    cout << ans << '\n';
  }
}
```
</details>
