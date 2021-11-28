[E - Graph Destruction](https://atcoder.jp/contests/abc229/tasks/abc229_e)

#### Approach

- concept of reverse DSU
- we will do the reverse of Destruction that is creation, because it's what DSU allow us to do.
- During creation we will make all edges concerning that vertex, **except those who yet not revived**
  _which are smaller vertices then the current one._
- we will increment the count as proceed and decrease the count as we unite.

[DSU snippets](https://github.com/mayankdutta/code_template/blob/main/dsu.cpp)

<details> 
<summary> Code </summary>

```cpp
  int n, m;
  cin >> n >> m;

  std ::vector<std ::vector<int>> graph(n + 1);
  for (int i = 0; i < m; i++) {
    int a, b;
    cin >> a >> b;
    graph[a].push_back(b);
    graph[b].push_back(a);
  }

  dsu.init(n + 10);
  std ::vector<int> ans{0};
  int count = 0;

  for (int u = n; u >= 2; u--) {
    count++;
    for (const auto &v : graph[u]) {
      if (v < u)
        continue;
      if (!dsu.isSameSet(u, v)) {
        dsu.unionSet(v, u);
        count--;
      }
    }
    ans.push_back(count);
  }

  reverse((ans).begin(), (ans).end());
  for (const auto &i : ans)
    cout << i << '\n';


```

</details>
