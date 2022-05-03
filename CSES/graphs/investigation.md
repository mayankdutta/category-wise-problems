### [Investigation](https://cses.fi/problemset/task/1202/), Medium, modified Djikstra, slight dp.

##### Approach

- Idea is to save everything as we proceed.
- Simple dp innvolved.

<details>
<summary>Code sample </summary>

```cpp
#define Graph vector<vector<pair<long long int, long long int>>>

struct info {
    int from, to, w;
};
void solve() {
    ll n, m;
    cin >> n >> m;

    Graph graph(n + 2);
    for (int i = 0; i < m; i++) {
        ll a, b, w;
        cin >> a >> b >> w;
        graph[a].push_back({b, w});
    }

    priority_queue<pll, vector<pair<ll, ll>>, std::greater<pair<ll, ll>>> pq;
    vll dist(n + 1, INF);
    vll ways(n + 1, 0);
    vll mn(n + 1, INF);
    vll mx(n + 1, 0);

    pq.push({0, 1});
    dist[1] = 0;
    ways[1] = 1;
    mn[1] = 0;
    mx[1] = 0;

    while (!pq.empty()) {
        auto [d, father] = pq.top();
        pq.pop();

        if (dist[father] < d)
          continue;

        for (const auto &[son, dd] : graph[father]) {
          if (dist[father] + dd < dist[son]) {
            dist[son] = dist[father] + dd;
            ways[son] = ways[father] % mod;
            mn[son] = mn[father] + 1;
            mx[son] = mx[father] + 1;

            pq.push({dist[son], son});
          } else if (dist[father] + dd == dist[son]) {
            ways[son] = (ways[son] % mod + ways[father] % mod) % mod;
            mn[son] = min(mn[father] + 1, mn[son]);
            mx[son] = max(mx[father] + 1, mx[son]);
          }
        }
    }

    cout << dist[n] << ' ';
    cout << ways[n] << ' ';
    cout << mn[n] << ' ';
    cout << mx[n] << ' ';
}
```

</details>
 
 
### [Fligh discount](https://cses.fi/problemset/task/1195/), Medium , modified Djikstra
##### Approach
- Idea is to find the distance of all the nodes from `source` and from `destination`
    - We then can do something like,
    - `ans = min(ans, dist[source -> curr_node] + dist [curr_node -> destination] + weight_of_current_node / 2`
    - meaning, we are providing chance to every node, to add **HALF** of it's weight
- We will be forming `Two graphs`, since given graph is `directed`.
- And we will be preparing two diff. `dist` arrays, to store distance, one from `source side` and another from `destination side`.
<details>
<summary>Code sample </summary>

```cpp
#define Graph vector<vector<pair<long long int, long long int>>>
Graph graph, graphRev;

vector<ll> dji(const ll &source, const Graph &graph) {
    ll n = graph.size();
    vector<ll> dist(n + 1, 2e18);

    priority_queue<pll, vector<pll>, greater<pll>> pq;
    pq.push({0, source});
    dist[source] = 0;

    while (!pq.empty()) {
        auto [d, u] = pq.top();
        pq.pop();

        if (dist[u] < d)
          continue;

        for (const auto &[v, dd] : graph[u]) {
          if (dd + dist[u] < dist[v]) {
            dist[v] = dd + dist[u];
            pq.push({dist[v], v});
          }
        }
    }
    return dist;
}

void solve() {
    ll n, m;
    cin >> n >> m;

    graph = graphRev = Graph(n + 1);
    vector<tuple<ll, ll, ll>> arr;
        for (int i = 0; i < m; i++) {
        ll a, b, w;
        cin >> a >> b >> w;
        graph[a].push_back({b, w});
        graphRev[b].push_back({a, w});

        arr.push_back({a, b, w});
    }

    auto one = dji(1, graph);
    auto two = dji(n, graphRev);

    ll ans = ll(2e18);
    for (const auto &[from, to, w] : arr) {
        ans = min(ans, one[from] + two[to] + (w) / 2);
    }
    cout << ans << '\n';
}
```

</details>
 
 
### [Graph girth](https://cses.fi/problemset/task/1707/), Medium , modified BFS
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
