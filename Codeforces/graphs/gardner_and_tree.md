[E. Gardener and Tree](https://codeforces.com/problemset/problem/1593/E), Medium, topological sorting variation. 

#### method 1, level by level traversing

- we applied toposort by kahn's algo 
- now during the topo sorting, we will make use of level order traversing as we used to do in [trees](/LeetCode/trees/levelorder.md)
- this will give us a clear ans.

<details>
<summary> level by level code </summary>

```cpp
void solve() {
  long long int n, k;
  cin >> n >> k;
  std ::vector<std ::vector<int>> tree(n + 1);
  std ::vector<int> indegree(n + 1, 0);

  if (n == 1) {
    cout << 0 << '\n';
    return;
  }
  for (int i = 0; i < n - 1; i++) {
    int a, b;
    cin >> a >> b;
    tree[a].push_back(b);
    tree[b].push_back(a);

    indegree[a]++;
    indegree[b]++;
  }

  queue<int> qu;
  std ::vector<int> topo;
  for (int i = 0; i < indegree.size(); i++)
    if (indegree[i] == 1)
      qu.push(i);

  while (!qu.empty() and k--) {
    int current_size = qu.size();

    for (int i = 0; i < current_size; i++) {
      auto u = qu.front();
      qu.pop();
      topo.push_back(u);
      for (const auto &v : tree[u]) {
        if (--indegree[v] == 1) {
          qu.push(v);
        }
      }
    }
  }
  cout << n - topo.size() << '\n';
}
```
</details>


#### method 2, distance method

- instead of doing this level wise.
- we stored the distance from the leaves every time. 
- though this is indirectly level wise.

<details> 
<summary> storing distance in extra vector </summary>

```cpp
void solve() {
  int n, k;
  cin >> n >> k;

  std ::vector<std ::vector<int>> tree(n + 1);
  std ::vector<int> indegree(n + 1, 0);

  for (int i = 0; i < n - 1; i++) {
    int a, b;
    cin >> a >> b;
    tree[a].push_back(b), tree[b].push_back(a);
    indegree[a]++, indegree[b]++;
  }

  if (n == 1) {
    cout << 0 << '\n';
    return;
  }
  queue<int> qu;
  std ::vector<int> dist(n + 1, inf);
  int count = 0;

  for (int i = 1; i <= n; i++) {
    if (indegree[i] == 1) {
      qu.push(i);
      dist[i] = 1;
    }
  }

  qu.push(0);

  while (!qu.empty()) {
    auto u = qu.front();
    qu.pop();

    for (const auto &v : tree[u]) {
      if (--indegree[v] == 1) {
        qu.push(v);
        dist[v] = dist[u] + 1;
      }
    }
  }

  for (int i = 1; i <= n; i++)
    count += (dist[i] <= k);

  cout << n - count << '\n';
}



```
</details> 
