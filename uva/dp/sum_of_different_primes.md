[1213 - Sum of Different Primes](https://onlinejudge.org/index.php?option=onlinejudge&Itemid=8&page=show_problem&problem=3654)
 - first 3 state dp problem of mine.
 - States are, `index, n, k` _(not hard to realize)_.
 - Variation of the above problem, base on 01 knapsack.
   <details>
   <summary>Memoization version</summary>
   
   ```cpp
     /*
      * arePrimes store prime no.s till 1120 because that was the limit given in the que. 
      * memo used to memoization purpose. 
      */
       
     vector<vector<vector<int>>> memo;
     int dp(int n, int k, int i) {
       if (n == 0 and k == 0)
         return 1;
       if (n == 0 or k == 0)
         return 0;
       if (n < 0 or k < 0)
         return 0;

       if (arePrimes[i] > n)
         return 0;

       int &ans = memo[n][k][i];
       if (ans != -1)
         return ans;
       ans = dp(n - arePrimes[i], k - 1, i + 1) + dp(n, k, i + 1);
       return ans;
     }

     void solve() {
       int n, k;
       while (cin >> n >> k) {
         if (n == 0 and k == 0)
           return;
         memo.resize(1121);
         for (auto &i : memo) {
           i = vvi(15, vi(200, -1));
         }

         cout << dp(n, k, 0) << '\n';
       }
     }                                      
   ```

   </details>
- Iterative version, approach mentioned in comments.
  <details>
  <summary>Iterative version</summary>

  ```cpp
    /*
     * arePrimes store prime no.s till 1120 because that was the limit given in the que. 
     * memo used to memoization purpose. 
     */
      
    int N, K;

    while (cin >> N >> K) {
    if (N == 0 and K == 0)
        return;
    
    vector<vector<int>> dp(16, vector<int>(1180, 0));
    
    dp[0][0] = 1;
  
    /* This loop has to be in the start, if this is added as 3rd one, WA, reason
     * yet to know */
  
    for (int i = 0; i < arePrimes.size(); i++)
      /* Bottom up approach, building our table from bottom most element*/
      for (int k = 14; k >= 1; k--)
        for (int n = 1170; n >= arePrimes[i]; n--)
          /* simple 01 knapsack */
          dp[k][n] += dp[k - 1][n - arePrimes[i]];
    
    cout << dp[K][N] << '\n';
    

  ```

  </details>

