
3. [Game Routes](https://cses.fi/problemset/task/1681), 
    - Utilizes the concept of topological sorting.
    - Innvolves basic of dynamic programming(*dont sweat, it's just fibonacci type*)
    - Approach
      - We wish to first order our edges in terms of their requirement (i.e. we are going to apply topological sort)
        - Why?, so that we can later apply dp in right order.
      - then, we will be storing `no. of ways` as DP. 
      - initializing `dp[0] = 1`, and then storing like fibonacci type. 
      - very simple dp innvolved. 
      - also we had to traverse in reverse order of directed edge, hence two graphs were taken.
        - Why?(try dry run test cases)
      - 
          <details>
          <summary>Code sample </summary>

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
          ```
          </details>
      
    
