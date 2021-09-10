## Prefix / Cumulative Sums
1. [Subsequences Summing to Sevens](http://www.usaco.org/index.php?page=viewproblem2&cpid=595), Medium 
   - Imp things. 
      - You will be hitting a wall, if negative remainders will not be taken care of.
      - This includes some concept of **NT(number theory)**
   - Things I learnt
      - How to do number theory with prefix sum
      - was new approach to me. 
   - More problems. 
      - [Subarray Divisibility](https://cses.fi/problemset/task/1662/), Medium
## Dynamic Programming
1. [Fruit Feast](http://www.usaco.org/index.php?page=viewproblem2&cpid=574), Medium
    - Base on the variant of `coin change`.
    - Notice that if there were no `water` condition, then we could've solved this via coin change. 
    - There is only 2 cases, either she drinks water or not. 
    - Hence we can make 2 seperate cases and then proceed via `coin change`. , `money and sum`
        - iterative approach
            - take a carefull look on the data filling in 2d array.
              <details>
              <summary>Code sample </summary>

              ```cpp
              void solve() {
                  int n, a, b;
                  cin >> n >> a >> b;

                  vvi memo = vvi(2, vi(5'000'010, 0));
                  memo[0][0] = 1;

                  for (int i = 0; i <= n; i++) {
                      if (i >= a)
                          memo[0][i] |= memo[0][i - a];
                      if (i >= b)
                          memo[0][i] |= memo[0][i - b];
                      memo[1][i / 2] |= memo[0][i];
                  }

                  for (int i = 0; i <= n; i++) {
                      if (i >= a)
                          memo[1][i] |= memo[1][i - a];
                      if (i >= b)
                          memo[1][i] |= memo[1][i - b];
                  }

                  int ans = 0;
                  for (int i = 0; i <= n; i++) {
                      if (memo[0][i])
                          ans = max(ans, i);
                      if (memo[1][i])
                          ans = max(ans, i);
                  }
                  cout << ans << '\n';
              }
              ```
              </details>
        - Memoization approach
            - You will find similar to iterative one. 
              <details>
              <summary>Code sample </summary>

              ```cpp
              #define MAXN 5000000
              int T, A, B;
              int memo[MAXN][2];
            
              int recur(int fullness, bool used) {
                  if (memo[fullness][used] > 0)
                      return memo[fullness][used];
                  if (fullness > T)
                      return 0;
                  int mx = fullness;
            
                  mx = max(mx, recur(fullness + A, used));
                  mx = max(mx, recur(fullness + B, used));
            
                  if (!used) {
                      mx = max(mx, recur(fullness / 2, true));
                  }
                  memo[fullness][used] = mx;
                  return mx;
              }

              ```
              </details>
        - BFS approach
              <details>
              <summary>To be added</summary>
              </details>
2. [Hoof, Paper, Scissors](http://www.usaco.org/index.php?page=viewproblem2&cpid=694), Easy
    - Variant of 01 knapsack.
    - Imp things.
        - 3 states are required. *(index, steps_remaining, H/P/S)*.
        - Implementation is tedius and important as well.
    - Things I learnt
        - Implementing 01 knapsack in three-states
        - method to define base case.
      <details>
    
      <summary>Code sample </summary>

      ```cpp
      void solve() {
          int n, a, b;
          cin >> n >> a >> b;

          vvi memo = vvi(2, vi(5'000'010, 0));
          memo[0][0] = 1;

          for (int i = 0; i <= n; i++) {
              if (i >= a)
                  memo[0][i] |= memo[0][i - a];
              if (i >= b)
                  memo[0][i] |= memo[0][i - b];
              memo[1][i / 2] |= memo[0][i];
          }

          for (int i = 0; i <= n; i++) {
              if (i >= a)
                  memo[1][i] |= memo[1][i - a];
              if (i >= b)
                  memo[1][i] |= memo[1][i - b];
          }

          int ans = 0;
          for (int i = 0; i <= n; i++) {
              if (memo[0][i])
                  ans = max(ans, i);
              if (memo[1][i])
                  ans = max(ans, i);
          }
          cout << ans << '\n';
      }
      
      void solve() {
          int n, K;
          cin >> n >> K;
          
          vector<vvi> dp = vector<vvi>(n + 1, vvi(K + 1, vi(3, 0)));
          
          vi moves(n);
          for (int i = 0; i < n; i++) {
              char ch;
              cin >> ch;
              if (ch == 'H') moves[i] = 0;
              if (ch == 'P') moves[i] = 1;
              if (ch == 'S') moves[i] = 2;
          }
          
          for (int i = 0; i <= n; i++) {
              for (int j = 0; j <= K; j++) {
                  for (int state = 0; state < 3; state++) {
                      if (i == 0) {
                          dp[i][j][state] = 0;
                      } else {
                          if (j == 0) {
                              dp[i][j][state] = dp[i - 1][j][state] + (moves[i - 1] == state);
                          } else {
                              int other_state1 = (state + 1) % 3;
                              int other_state2 = (state + 2) % 3;
                          
                              int original = dp[i - 1][j][state] + (moves[i - 1] == state);
                              int possible1 =
                                  dp[i - 1][j - 1][other_state1] + (moves[i - 1] == other_state1);
                              int possible2 =
                                  dp[i - 1][j - 1][other_state2] + (moves[i - 1] == other_state2);
                          
                              dp[i][j][state] = max(original, max(possible1, possible2));
                          }
                      }
                  }
              }
          }
          cout << max(dp[n][K][0], max(dp[n][K][1], dp[n][K][2]));
      }

      ```
    </details>
