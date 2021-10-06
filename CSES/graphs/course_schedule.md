[Course Schedule](https://cses.fi/problemset/task/1679/),
 - Intro type problem on topological sorting.
 - Approach(Kahn's algo)
     - Kahn's algo maintain an extra array to keep record of `in_degree edges`(i.e. how many receiving directed edge a node could have).
     - We then keep edges having 0 inDegree at top, in queue, and perform BFS type approach.
     - Keep subtracting the `indegree` of edge having `indegree > 0`
       -Why? *if in_degree is not 0, this indicates that there exixt some other node, which is making receiving edge to that node.*
     - 
     <details>
     <summary>Code sample (Kahn's algo)</summary>

     ```cpp
     int n, m;
     std::cin >> n >> m;
     
     std::vector<int> graph[n + 1], revGraph[n + 1], inEdge(n + 1);
     for (int i = 0; i < m; i++) {
         int a, b;
         std::cin >> a >> b;
         graph[a].push_back(b);
         revGraph[b].push_back(a);
         inEdge[b]++;
     }
     
     std::queue<int> qu;
     for (int i = 1; i <= n; i++) {
         if (inEdge[i] == 0) {
             qu.push(i);
         }
     }
     
     std::vector<int> order, dp(n + 1, 0);
     while (!qu.empty()) {
         auto u = qu.front();
         qu.pop();
         order.push_back(u);
         for (const auto &v : graph[u]) {
                 if (--inEdge[v] == 0) {
                     qu.push(v);
                 }
         }
     }
         
     dp[0] = dp[1] = 1;
     for (int i = 1; i < n; i++) {
         int u = order[i];
         for (const auto &v : revGraph[u]) {
             dp[u] += dp[v];
             dp[u] %= mod;
         }
     }    
     std::cout << dp[n] << '\n';
     int main() {
     int n, m;
     cin >> n >> m;
     
     vector<vector<int>> graph(n + 1);
     vector<int> in_degree(n + 1);
     
     for (int i = 0; i < m; i++) {
         int a, b;
         cin >> a >> b;
         graph[a].push_back(b);
         in_degree[b]++;
     }
     
     queue<int> qu;
     for (int i = 1; i <= n; i++)
         if (in_degree[i] == 0)
             qu.push(i);
     
     vector<int> order;
     while (!qu.empty()) {
         auto u = qu.front();
         qu.pop();
         
         order.push_back(u);
         for (const auto &v : graph[u]) {
             if (--in_degree[v] == 0) {
                 qu.push(v);
             }
         }
     }
     
     if (int(order.size()) != n) {
         cout << "IMPOSSIBLE\n";
     } else {
         for (const auto &i : order) {
         cout << i << ' ';
     }
     ```
     </details>
- Approach(DFS type) *... to be updated.*

