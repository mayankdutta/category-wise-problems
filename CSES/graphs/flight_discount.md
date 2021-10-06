[Flight discount](https://cses.fi/problemset/task/1195/), Medium
 - modified Djikstra
 - Approach
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
 
