## DP _(2-states, 0-1 knapsack)_

1. [11450 - Wedding shopping](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=2445)
    - Problem require us to find the maximum amount of dresses(have multiple brands) in given amount of money.
    - Kind of 0-1 Knapsack
    - States are, `money and index_of_brands`
      <details>
      <summary>Code sample </summary>
      
      ```cpp
       /*
        * price being the 2d-array storing data
        * memo being 2d-array used for memoization.
        */
  
       int ourFunction(CurrentMoney, index) {
        if (CurrentMoney < 0) 
          return -INF; /* INF, being very large values. */
                             
        if (index == TotalBrands) 
          return TotalMoney - CurrentMoney; 

        int &ans = memo[money][g];
                      
        if (ans != -1) 
          return ans;
        
        /* Loop isnt the part of the template, loop is just to access data from the given 2d data, 
         * if data were 1d then we would have gone without loop 
         */
        for (int brand = 1; brand <= price[index][0]; brand++)  /* at index,0 we have stored the size of that specific brand. */
          ans = max(ans, ourFunction(CurrentMoney - price[index][CurrentMoney], index + 1)); 
  
        return ans;
       }
  
      ```

      </details>




2. [562 - Dividing coins](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=503)
    - States are, `index and currentSum`
    - Variation of the above problem.
      <details>
      <summary>Code sample </summary>
      
      ```cpp
        const int UNKNOWN = -1;
        const int HIGHEST_POS_FOR_COIN_VAL = 501;

        int totalCoins;
        int memo[105][105 * 501];
        int coins[105];

        int dp(int index, int sum) {
          if (index == totalCoins)
            return sum;

          int &ans = memo[index][sum];

          if (ans == -1)
            ans = min(dp(index + 1, sum + coins[index]),
                      dp(index + 1, abs(sum - coins[index])));

          return ans;
        }

        int main() {
          int T;
          cin >> T;

          while (T--) {
            cin >> totalCoins;
            int highest = HIGHEST_POS_FOR_COIN_VAL * totalCoins;

            for (int i = 0; i < totalCoins; ++i) {
              cin >> coins[i];
              for (int j = 0; j < highest; ++j) {
                memo[i][j] = UNKNOWN;
              }
            }

            cout << dp(0, 0) << '\n';
          }
        }
      ```

      </details>
    
    
3. [1213 - Sum of Different Primes](https://onlinejudge.org/index.php?option=onlinejudge&Itemid=8&page=show_problem&problem=3654)
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



4. [10616 - Divisible Group Sums ](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=652&page=show_problem&problem=1557), medium.
    - 01 knapsack variant
    - innvoled 3 states.
      <details>
      <summary>Memoization version</summary>

      ```cpp
        #define MAX 205
        #define vi vector<int>
        #define vvi vector<vi>
        #define vvvi vector<vvi>
        
        int N, M, D, Q;
        vi arr;
        vvvi memo;
        
        int dp(int n, int sum, int m) {
            if (m == 0)
                return sum == 0;
            if (n == N)
                return 0;
            
            int &ans = memo[n][sum][m];
            
            if (ans != -1)
                return ans;
            
            ans = dp(n + 1, (sum % D + D) % D, m) +
                  dp(n + 1, (D + sum % D + arr[n] % D) % D, m + 1);
            return ans;
        }
        
        int main() {
            int i, j, res;
            
            j = 1;
            while (1) {
            scanf("%d %d", &N, &Q);
            
                if (N == 0 && Q == 0)
                  break;
            
                arr = vi(N);
                for (auto &i : arr)
                  scanf("%d", &i);
            
                printf("SET %d:\n", j);
            
                for (i = 0; i < Q; i++) {
                  scanf("%d %d", &D, &M);
                  memo = vvvi(MAX, vvi(MAX, vi(15, -1)));
            
                  res = dp(0, 0, M);
                  printf("QUERY %d: %d\n", i + 1, res);
                }
                j++;
            }
        }


      ```

      </details>
    - Iterative version, approach mentioned in comments.




## DP _(1-state, Coin change)_

1. [147-Dollars](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=83)
   - UNORDERED counting.
   - whatif we wish to calculate no. of solutions
   - Solution mentioned below didn't work on mentioned problem, **WHY?** (answered in second mentioned) 
   - given that each combination is counted differently
   - States are only in this case, `remaining money`
   - Pay attention to the for loop in the sample code's recursive function.
   - What this doing is running the loop from 0, hence forcing it to count every possible combinations.
   - If we don't wish to do so, we will have to pass the index from where it should continue counting. 
     <details>
     <summary>Code sample memoization version</summary>

     ```cpp
      vector<int> memo;
      vector<int> coins{1, 2, 3};
      
      int dp(int N) {
         print();
         if (N < 0)
         return 0;
         
         int &ans = memo[N];
         
         if (ans != 0)
            return ans;
         
         for (const auto &i : coins) {
            ans += dp(N - i);
         }
         return ans;
      }
      
      void solve() {
         double n;
         while (cin >> n) {
            int N = ((n + 0.001) * 100);
            if (N == 0)
               return;
      
             memo = vector<int> (40000, 0);
             memo[0] = 1;
     
             // consider N to be 4 
             cout << dp(N) << '\n';
         }
      }
     ```
     </details>
   
     <details>
     <summary>Code sample iterative version</summary>

     ```cpp
      vector<int> memo;
      vector<int> coins{1, 2, 3};
     
      void solve() {
         double n;
         while (cin >> n) {
            int N = ((n + 0.001) * 100);
            if (N == 0)
               return;
      
            memo = vector<int> (40000, 0);
            memo[0] = 1;
     
            /*
             * Sinvce we have to find ans. of diff combinations. 
             * Therefore coins must repeat as was in recursive function.
             * hence in 2d loop coins at second.
             */
     
            for (int weight = 0; weight <= x; weight++) {
		       for (int i = 1; i <= coins.size(); i++) {
			       if(weight - coins[i - 1] >= 0) {
				       memo[weight] += memo[weight - coins[i - 1]];
				       memo[weight] %= MOD;
                   }
               }
            }
         }
      }
     ```

     </details>



## DP _(1-state, Coin change)_

1. [147-Dollars](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=83)
    - ORDERED counting
   - True coin change problem via memoization.
   - States as discussed in above one are two, `remainging money, current index`
   - advised to use `memo 2d array` such as **LESS ROWS, MORE COLS**, *i may be wrong*
   - surprisingly if `memo 2d array` declared as mentioned, code will be faster.
     <details>
     <summary>Code sample memoization version</summary>

     ```cpp
      ll dp(int N, int index) {
      if (N == 0) return 1;
      if (index >= coins.size() or N < 0) return 0;
      
      ll &ans = memo[index][N];
      
      if (ans != 0)
      return ans;
      
      ans = dp(N - coins[index], index) + dp(N, index + 1);
        return ans;
      }
      
      void solve() {
        double n;
        memo = vvll(11, vll(30001, 0));
        memo[0][0] = 1;
        int ans = dp(300, 0);
        
        while (cin >> n) {
            int N = ((n + 0.001) * 100);
            if (N == 0) return;
            
            int ans = memo[10][N];
            cout << std::fixed;
            cout << setprecision(2) << setw(3) << n;
            cout << setw(17) << dp(N, 0) << '\n';
        }
      }
     ```

     </details>
     <details>
     <summary>Code sample iterative version</summary>

     ```cpp
      vector<int> memo;
      vector<int> coins{1, 2, 3};
     
      void solve() {
         double n;
         while (cin >> n) {
            int N = ((n + 0.001) * 100);
            if (N == 0)
               return;
      
            memo = vector<int> (40000, 0);
            memo[0] = 1;
     
            /*
             * Sinvce we have to find ans. of unique combinations. 
             * Therefore coins must NOT repeat coins.
             * hence in 2d loop coins was first, and weight second.
             */
     
            for (int i = 1; i <= coins.size(); i++) {
               for (int weight = 0; weight <= x; weight++) {
                   if(weight - coins[i - 1] >= 0) {
                       memo[weight] += memo[weight - coins[i - 1]];
                       memo[weight] %= MOD;
                   }
               }
            }
         }
      }
     ```

     </details>




