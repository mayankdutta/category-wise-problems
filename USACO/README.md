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
    - Hence we can make 2 seperate cases and then proceed via `coin change`.
      , `money and sum`
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
