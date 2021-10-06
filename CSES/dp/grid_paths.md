

5. [Grid Paths](https://cses.fi/problemset/task/1638/), classic levinshtein distance.
    - Classic problem, one of it's kind.
    - Approach
      - If `grid[i][j] == '#'` then `dp[i][j] = 0`
      - else, the same way we used to count the no. of ways in `1-D ` array.
      - This is the only recurrence relation keep filling the `dp` in the same manner.
   - <details>
     <summary>Memoization sample </summary>

     ```cpp
     std ::vector<std ::vector<char>> grid;
     std ::vector<std ::vector<long long int>> memo;
     int row;
     int dp(int i, int j) {
         if (i == 0 and j == 0)
             return (grid[i][j] == '*' ? 0 : 1);
         
         if (i < 0 or j < 0)
             return 0;
         
         auto &ans = memo[i][j];
         if (ans != -1)
             return ans;
         
         if (grid[i][j] == '*')
             ans = 0;
         else
             ans = dp(i - 1, j) % mod + dp(i, j - 1) % mod;
         return ans % mod;
     }
     
     void solve() {
         cin >> row;
         grid = std ::vector<std ::vector<char>>(row, vc(row));
         memo = std ::vector<std ::vector<long long int>>(row, vll(row, -1));
         
         for (int i = 0; i < row; i++)
             for (int j = 0; j < row; j++)
                 cin >> grid[i][j];
         
         cout << dp(row - 1, row - 1) << '\n';
     }
     ```
     </details>
   - <details>
     <summary>iterative version </summary>

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


