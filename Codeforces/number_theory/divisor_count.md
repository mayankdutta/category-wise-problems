[Divisors count](https://codeforces.com/group/yg7WhsFsAp/contest/355493/problem/P22), medium

#### method 1

<details>
<summary> Brute kind of </summary>

```cpp
map<int, int> factorize(int n) {
  map<int, int> mp;
  for (int i = 2; i * i <= n; i++) {
    while (n % i == 0) {
      n /= i;
      mp[i]++;
    }
  }

  if (n > 1)
    mp[n] += 1;
  return mp;
}

void solve() {
   ll ans = 0;
   int n;
   cin>> n;

   for (int i = 1; i <= n; i++) {
     auto mp = factorize(i);
     ll count = 1;
     for (const auto& [value, freq]: mp)
       count *= (freq + 1);
     ans += count;
   }
   cout << ans << '\n';
}

```

</details>

#### method 2

<details>
<summary> Seive type </summary>

```cpp
void solve() {
  int n;
  cin >> n;
  vi dp(n + 1, 1);

  for (int i = 2; i <= (n) + 1; i++) {
    for (int j = i ; j <= n; j += i) {
      dp[j]++;
    }
  }

  ll ans = 0;
  for (int i = 1; i <= n; i++) {
    ans += dp[i];
  }
  cout << ans << '\n';
}

```

</details>

#### method 3

<details>
<summary> optimal one </summary>

```cpp
int main() {
  int n, ans=0;
  cin >> n;

  for (int i = 1; i <= n; i++)
    ans += n/i;

  cout<<ans;
}

```

</details>
