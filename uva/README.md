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
    
    
2. [1213 - Sum of Different Primes](https://onlinejudge.org/index.php?option=onlinejudge&Itemid=8&page=show_problem&problem=3654)
    - first 3 state dp problem of mine.
    - States are, `index, n, k` _(not hard to realize)_.
    - Variation of the above problem, base on 01 knapsack.
      <details>
      <summary>Code sample </summary>
      
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













