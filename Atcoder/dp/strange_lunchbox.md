
4. [D - Strange Lunchbox](https://atcoder.jp/contests/abc219/tasks/abc219_d), Binary Search, Dynamic programming.
    - Dynamic programming Approach.
      - Simple 01 knapsack type
      - [Reference 1](https://github.com/mayankdutta/category-wise-problems/blob/main/CSES/README.md)
      - [Reference 2](https://github.com/mayankdutta/category-wise-problems/blob/main/USACO/README.md)
      - <details>
          <summary>Memo Implementation</summary>

         ```cpp
          int n;
          int x, y;
          vector<ll> one, two;
          vector<vector<vector<ll>>>
          memo(305, vector<vector<ll>>(305, vector<ll>(305, ll(1e18))));
          
          int fun(int a, int b, int i) {
              if (a <= 0 and b <= 0) return 0;
              if (i < 0) return INF;
              
              ll &ans = memo[i][a][b];
              if (ans != ll(1e18)) return ans;
        
              ans = min(fun(max(0ll, a - one[i]), max(0ll, b - two[i]), i - 1) + 1, fun(a, b, i - 1));
        
              return ans;
          }
          
          void solve() {
              cin >> n;
              cin >> x >> y;
              one = two = vector<ll>(n);
              for (int i = 0; i < n; i++)
              cin >> one[i] >> two[i];
              
              int ans = fun(x, y, n - 1);
              
              cout << (ans == INF ? -1 : ans) << '\n';
          }
  
        ```
        </details>
      - <details>
          <summary>Iterative Implementation</summary>

         ```cpp
      
           ll n;
           ll x, y;
           cin >> n >> x >> y;
           
           vector<ll> one, two;
           one = two = vector<ll>(n);
           for (int i = 0; i < n; i++)
           cin >> one[i] >> two[i];
           
           vector<vector<vector<ll>>> dp(305,
           vector<vector<ll>>(305, vector<ll>(305, 1e12)));
           
           dp[0][0][0] = 0;
           for (int i = 1; i <= n; i++) {
           for (int j = 0; j <= x; j++) {
           for (int k = 0; k <= y; k++) {
           dp[i][j][k] = dp[i - 1][j][k];
           ll prevOne = max(0ll, j - one[i - 1]);
           ll prevTwo = max(0ll, k - two[i - 1]);
           
                   dp[i][j][k] = min(dp[i][j][k], dp[i - 1][prevOne][prevTwo] + 1);
                 }
               }
           }
           
           ll ans = dp[n][x][y];
           
           if (ans >= 1e12)
           ans = -1;
           cout << ans << '\n';


        ```
      </details>
    - Binary search approach(to be updated)

