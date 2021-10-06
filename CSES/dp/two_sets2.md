[Two Sets II ](https://cses.fi/problemset/task/1093/), Base on 01 Knapsack
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
