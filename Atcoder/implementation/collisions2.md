[C - Collision 2](https://atcoder.jp/contests/abc243/tasks/abc243_c)

```cpp
  int n;
  cin >> n;
  map<int, vector<pair<int, int>>> mp;

  for (int i = 0; i < n; i++) {
    int x, y;
    cin >> x >> y;
    mp[y].push_back({x, i});
  }
  string s;
  cin >> s;

  for (auto &[key, value] : mp) {
    bool good = false;

    sort((value).begin(), (value).end());
    for (const auto &[x, i] : value) {
      if (s[i] == 'R') {
        good = true;
      } else if (good) {
        cout << "Yes\n";
        return;
      }
    }
  }
  cout << "No\n";
```
