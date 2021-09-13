## DP _(2-states, True 0-1 knapsack)_

### Visualization of iterative approach
- inside a 2D loop mainly two things going on.
     ```cpp
      1. memo[coin][s] = memo[coin - 1][s];
      2. int left = s - coins[coin - 1];
         if (left >= 0 and memo[coin - 1][left]) {
           memo[coin][s] = 1;
         }
      OR 
  
      1. if () memo[index][m] = memo[index - 1][m];
      2. else {
              memo[index][m] = max(memo[index - 1][m],
              memo[index - 1][m - prices[index - 1]] + pages[index - 1]);
          }
    ```
- what 1st statement does, if you draw `dp` table,  you will notice that it just copying previous row data in this newer row.
- 1st statement is the same as the recursive call of `not taken in account, and continuing` in terms of knapsack.
- 2nd statement on the other hand means `things picked up` in terms of 01 knapsack.
- what 2nd statement does is `from the updated data` (means after copying data in current row), it check values from previous cols, and then decided for upcoming cols of `updated rows`


1. [Book shop](https://cses.fi/problemset/task/1158), Classic problem, easy
    - 0-1 Knapsack without any variant
    - States are, `money and index`
      - memoisation approach
        - take a carefull look on the calling in recursive function.
          <details>
          <summary>Code sample </summary>

          ```cpp
           vector<vector<int>> memo;
           vector<int> prices, pages;
           int dp(int money, int index) {
               if (money <= 0)
               return 0;
               if (index >= pages.size())
                   return 0;
             
               int &ans = memo[index][money];
               if (ans != -1)
                   return ans;
             
               if (money < prices[index])
                   return ans = dp(money, index + 1);
        
               /* Important point */
               return ans = max(dp(money - prices[index], index + 1) + pages[index],
                               dp(money, index + 1));
           }
         
           void solve() {
               int n, money;
               cin >> n >> money;
             
               prices = pages = vector<int>(n);
               memo = vector<vector<int>>(n + 1, vector<int>(money + 1, -1));
             
               cin >> prices >> pages;
             
               int ans = dp(money, 0);
               cout << ans << '\n';
           }
          ```
          </details>
      - Iterative approach
        - do note that loop are like **First index loop then money loop**.
        - If we reverse the loop order then we will be getting **TLE**.
        - therefore **CHOOSE ORDER OF YOUR STATES CAREFULLY**.
          <details>
          <summary>Code sample </summary>

          ```cpp
           vector<vector<int>> memo;
           vector<int> prices, pages;
           
           void solve() {
               int n, money;
               cin >> n >> money;
               
               prices = pages = vector<int>(n);
               cin >> prices >> pages;
               memo = vector<vector<int>>(n + 2, vector<int>(money + 2, -1));
               
               for (int index = 0; index <= n; index++) {
                   for (int m = 0; m <= money; m++) {
                       if (m == 0 or index == 0) {
                           memo[index][m] = 0;
                           continue;
                       }
               
                      if (m < prices[index - 1]) {
                          memo[index][m] = memo[index - 1][m];
                      } else {
               
                          memo[index][m] = max(memo[index - 1][m],
                          memo[index - 1][m - prices[index - 1]] + pages[index - 1]);
                      }
                  }
               }
               cout << memo[n][money];
           }

          ```
          </details>
          <details>
          <summary>shorter Implementation </summary>

          ```cpp
           int n, target;
           cin >> n >> target;
           
           vector<int> prices(n), pages(n);
           for (auto &i : prices)
           cin >> i;
           for (auto &i : pages)
           cin >> i;
           
           vector<vector<int>> memo(n + 1, vector<int>(target + 1, 0));
           
           for (int i = 1; i <= n; i++) {
               for (int j = 0; j <= target; j++) {
                   memo[i][j] = memo[i - 1][j];
                   int rem = j - prices[i - 1];
           
                   if (rem >= 0)
                       memo[i][j] = max(memo[i][j], memo[i - 1][rem] + pages[i - 1]);
               }
           }
           cout << memo[n][target] << '\n';


          ```
          </details>

    
    
2. [Money sums](https://cses.fi/problemset/task/1745/), Base on 01 Knapsack
    - 0-1 Knapsack variant
    - coins should not be repeated. 
    - therefore coin array at top, because we don't want it to repeat.
    - States are, `money and sum`
        - iterative approach
            - take a carefull look on the data filling in 2d array.
              <details>
              <summary>Code sample </summary>

              ```cpp
              int main() {
                  int n;
                  cin >> n;
                  
                  vector<int> coins(n);
                  for (auto &i : coins)
                      cin >> i;
                  
                  int sum = accumulate(coins.begin(), coins.end(), 0);
                  vector<vector<int>> memo(n + 1, vector<int>(sum + 1, 0));
                  memo[0][0] = 1;
                  
                  for (int coin = 1; coin <= n; coin++) { // for coins array
                      for (int s = 0; s <= sum; s++) {      // for sum array
                          memo[coin][s] = memo[coin - 1][s];
                          int left = s - coins[coin - 1];
                          if (left >= 0 and memo[coin - 1][left]) {
                              memo[coin][s] = 1;
                          }
                      }
                  }
                  vector<int> ans;
                  for (int i = 1; i <= sum; i++) {
                      if (memo[n][i]) {
                          ans.push_back(i);
                      }
                  }
                  cout << ans.size() << '\n';
                  for (const auto &i : ans) {
                      cout << i << ' ';
                  }
                  cout << '\n';
              }
              ```
              </details>

3. [Two Sets II ](https://cses.fi/problemset/task/1093/), Base on 01 Knapsack
    - 0-1 Knapsack in disguise. 
    - We just have to check if we can make sum of `total_sum / 2` with given elements.
      - Now of course `total_sum / 2` won't be `integer` if `total_sum` is **odd**.
      - This brings us to `No solution` if `total_sum` is odd.
    - Observe carefully the upper limit of `outer knapsack loop`. we are only traversing upto n - 1.
      - why?
      - the moment we start taking even tha last element in our account it will bring `repititions` in our counting.
      - Every count will be `twice`.
      - By ignoring the last element we are making sure, that last one stays in `second set`.
    - States are, `Nautural No.s upto given target` and `total_sum / 2`
        - iterative approach
           <details>
           <summary>Code sample </summary>

           ```cpp
         
           long long int n;
           cin >> n;

           long long int target = n * (n + 1) / 2;
           if (target & 1) {
               cout << 0 << '\n';
               return;
           }
           target /= 2;
           vector<vector<long long int>> dp(n + 1, vector<long long int>(target + 1));
           
           dp[0][0] = 1;
           for (int i = 1; i < n; i++) { /* OUTER KNAPSACK LOOP */
               for (int j = 0; j <= target; j++) {
                   dp[i][j] += dp[i - 1][j];
                   int rem = j - i;
                   if (rem >= 0) {
                       dp[i][j] += dp[i - 1][rem];
                       dp[i][j] %= mod;
                   }
               }
           }
           cout << dp[n - 1][target] << '\n';

           ```
           </details>

4. [Grid Paths](https://cses.fi/problemset/task/1638/), classic levinshtein distance.
    - Classic problem, one of it's kind.
    - Approach
      - If `grid[i][j] == '#'` then `dp[i][j] = 0`
      - else, the same way we used to count the no. of ways in `1-D ` array.
      - This is the only recurrence relation keep filling the `dp` in the same manner.
    - <details>
      <summary>Code sample </summary>

      ```cpp
      int n;
      cin >> n;
      char grid[n][n];
      for (int i = 0; i < n; i++)
          for (int j = 0; j < n; j++)
              cin >> grid[i][j];
      
      vector<vector<int>> dp(n, vector<int>(n, 0));
      
      for (int i = 0; i < n; i++) {
          for (int j = 0; j < n; j++) {
              if (i == 0 and j == 0)
                  grid[i][j] == '.' ? dp[i][j] = 1 : dp[i][j] = 0;
              else if (i == 0)
                  grid[i][j] == '.' ? dp[i][j] = dp[i][j] % mod + dp[i][j - 1] % mod
                                    : dp[i][j] = 0;
              else if (j == 0)
                  grid[i][j] == '.' ? dp[i][j] = dp[i][j] % mod + dp[i - 1][j] % mod
                                    : dp[i][j] = 0;
              else
                  grid[i][j] == '.'
                              ? dp[i][j] = dp[i][j] % mod + dp[i - 1][j] % mod + dp[i][j - 1]
                              : dp[i][j] = 0;
              dp[i][j] %= mod;
          }
      }
      cout << dp[n - 1][n - 1] << '\n';

      ```
      </details>


## Graphs(Topological sort) 
1. [Course Schedule](https://cses.fi/problemset/task/1679/),
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



2. [Round Trip II](https://cses.fi/problemset/task/1678/),
    - Normal DFS with some coloring and keeping tracks of parents.
    - [Similar question (problem 2) and approach](https://github.com/mayankdutta/category-wise-problems/blob/main/JMI%20on%20campus/README.md)
        <details>
        <summary>Code sample </summary>

        ```cpp
        #include <bits/stdc++.h>
        using namespace std;
        
        std ::vector<std ::vector<int>> graph;
        std ::vector<int> parent;
        std ::vector<int> color;
        
        void dfs(const int &u) {
            color[u] = 1;
            for (const auto &v : graph[u]) {
                if (color[v] == 0) {
                  parent[v] = u;
                  dfs(v);
                } else if (color[v] == 1) {
                    int start = u;
                    int end = v;
        
                    std ::vector<int> ans;
                    auto temp = start;
                    while (start != end) {
                        ans.push_back(start);
                        start = parent[start];
                    }
                    ans.push_back(end);
                    ans.push_back(temp);
        
                    cout << ans.size() << '\n';
                    reverse(ans.begin(), ans.end());
                    for (const auto &i : ans) {
                        cout << i << ' ';
                    }
                    exit(0);
                }
            }
            color[u] = 2;
        }
        
        int main() {
            int n, m;
            cin >> n >> m;
            
            graph = std ::vector<std ::vector<int>>(n + 1);
            parent = std ::vector<int>(n + 1);
            color = std ::vector<int>(n + 1);
            
            for (int i = 0; i < m; i++) {
                int a, b;
                cin >> a >> b;
                graph[a].push_back(b);
            }
            
            for (int i = 1; i <= n; i++)
                if (color[i] != 2)
                    dfs(i);
            cout << "IMPOSSIBLE\n";
        }

        ```
        </details>


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
