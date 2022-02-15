[C. Kill the Monster](https://codeforces.com/contest/1633/problem/C)

- amazing approach
- in O(N) checked the both.

```cpp

void solve() {
  ll hc, dc, hm, dm, k, w, a;
  cin >> hc >> dc >> hm >> dm >> k >> w >> a;

  for (int i = 0; i <= k; i++) {
    ll new_health = hc + i * a;
    ll new_power = dc + (k - i) * w;

    ll h_damage_m = hm / new_power + (hm % new_power != 0);
    ll m_damage_h = new_health / dm + (new_health % dm != 0);

    if (h_damage_m <= m_damage_h) {
      cout << "YES\n";
      return;
    }
  }
  cout << "NO\n";
}

```
