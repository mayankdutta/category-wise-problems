[Graph girth](https://cses.fi/problemset/task/1707/), Medium, modified BFS

##### Approach

- Idea is to find the distance of all the nodes from every node, one by one.
- Yes it is `O(n * (n + m))`
- If you are thinking something like [this](https://github.com/mayankdutta/Examples/blob/main/graphs/adj/cycle_in_graph.cpp), this will give error.
- In this graph there are multiple edges along with many cycle, if their were only one cycle then above one will do fine.
- Here Every node has MULTIPLE PARENTS.

<details>
<summary>Code sample </summary>

```cpp
int n, m;
cin >> n >> m;
vector<vector<int>> graph(n);
for (int i = 0; i < m; i++) {
    int a, b;
    cin >> a >> b;
    a--, b--;
    graph[a].push_back(b);
    graph[b].push_back(a);
}

int ans = INT_MAX;

for (int i = 0; i < n; i++) {
    vector<int> dist(n, -1);
    queue<int> qu;

    qu.push(i);
    dist[i] = 0;

    while (!qu.empty()) {
      auto u = qu.front();
      qu.pop();

      for (const auto &v : graph[u]) {
        if (dist[v] == -1) {
          dist[v] = dist[u] + 1;
          qu.push(v);
        } else if (dist[v] >= dist[u]) {
          ans = min(ans, dist[u] + dist[v] + 1);
        }
      }
    }
}
cout << (ans == INT_MAX ? -1 : ans) << '\n';
```

</details>
