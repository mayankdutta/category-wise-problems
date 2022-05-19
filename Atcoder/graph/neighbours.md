[Neighbours](https://atcoder.jp/contests/abc231/tasks/abc231_d), Medium

- On analyzing we will find out that 
- no vertex should have more then 2 edges 
- there shouldn't be any cycle.
- [dsu template](https://github.com/mayankdutta/code_template/blob/main/dsu.cpp)

<details> 
<summary> DSU implementation </summary>

```cpp

int n, m;
cin >> n >> m;
dsu.init(n + 1);
vector<int> Size(n + 1);

for (int i = 0; i < m; i++) {
  int a, b;
  cin >> a >> b;

  if (!dsu.isSameSet(a, b)) {
    dsu.unionSet(a, b);
    Size[a]++;
    Size[b]++;

    if (Size[a] > 2 or Size[b] > 2) {
      cout << "No\n";
      return;
    }
  } else {
    cout << "No\n";
    return;
  }
}
cout << "Yes\n";

```

</details>

<details>
<summary> DFS implementation </summary> 

```cpp
void solve() {
  int n, m;
  cin >> n >> m;
 
  vector<vector<int>> arr(n + 1);
  for (int i = 0; i < m; i++) {
    int a, b;
    cin >> a >> b;
    arr[a].push_back(b);
    arr[b].push_back(a);
 
    if (arr[a].size() > 2 or arr[b].size() > 2) {
      cout << "No\n";
      return;
    }
  }
 
  vector<int> color(n + 1, 0), parent(n + 1, 0);
 
  auto dfs = [&](const auto &self, const int &u) -> void {
    color[u] = 1;
    for (const auto &v : arr[u]) {
      if (color[v] == 0) {
        parent[v] = u;
        self(self, v);
 
      } else if (color[v] == 1) {
        if (parent[u] == v) {
        } else {
          cout << "No\n";
          exit(0);
        }
      } else {
        cout << "No\n";
        exit(0);
      }
    }
    color[u] = 2;
  };

  for (int i = 1; i <= n; i++)
    if (!color[i])
      dfs(dfs, i);
 
  cout << "Yes\n";
}
```

</details>
