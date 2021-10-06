

1. [Removing Digits](https://cses.fi/problemset/task/1637/), easy
    - Coin change variant
    - Approach
        - Coin change problem variant.
        - In this case `fix amount` is the no. given, and `coins` are it's digits.
          <details>
          <summary> Sample Implementation </summary>

          ```cpp
           /* precomputation */
           int MAX = 1e6 + 5;
           vector<int> dp(MAX + 1, (int)1e9);
           dp[0] = 0;
           
           for (int i = 1; i < MAX; i++) {
               vector<int> tempArr;
               auto tempNum = i;
               while (tempNum) {
                   tempArr.push_back(tempNum % 10);
                   tempNum /= 10;
               }
               
               for (const auto &element : tempArr)
                 if (i - element >= 0)
                   dp[i] = min(dp[i - element] + 1, dp[i]);
           }
           /* precomputation over */
          
           int n;
           cin >> n;
           cout << dp[n] << '\n';

          ```
          </details>
    

