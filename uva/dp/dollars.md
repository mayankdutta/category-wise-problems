
[147-Dollars](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=83)
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




