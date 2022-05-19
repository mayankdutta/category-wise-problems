[P39. Vitamins](https://codeforces.com/group/yg7WhsFsAp/contest/355496/problem/P39)

- problem was pretty simple to understand.
- however same was not true for the implementation.

<details>
<summary> code implementation </summary>

```cpp
int n;
cin >> n;
map<string, int> mp;
vector<string> helper{"A", "B", "C", "AB", "AC", "BC", "ABC"};

for (const auto &i : helper)
  mp[i] = int(1e7);

for (int i = 0; i < n; i++) {
  int x;
  string s;
  cin >> x >> s;
  sort((s).begin(), (s).end());

  (mp.count(s)) ? mp[s] = min(mp[s], x) : mp[s] = x;
}

int ans = min({
    mp["ABC"],

    mp["A"] + mp["BC"],
    mp["AB"] + mp["C"],
    mp["AC"] + mp["B"],

    mp["AB"] + mp["BC"],
    mp["AC"] + mp["AB"],
    mp["AC"] + mp["BC"],

    mp["A"] + mp["B"] + mp["C"],
});

cout << (ans >= 1e7 ? -1 : ans) << '\n';

```

</details>
