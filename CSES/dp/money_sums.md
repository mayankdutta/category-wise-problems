[Money sums](https://cses.fi/problemset/task/1745/), Base on 01 Knapsack
 - 0-1 Knapsack variant
 - coins should not be repeated. 
 - therefore coin array at top, because we don't want it to repeat.
 - States are, `money and sum`
     - iterative approach
         - take a carefull look on the data filling in 2d array.
           <details>
           <summary>Code sample </summary>

           ```cpp
           int main() {
               int n;
               cin >> n;
               
               vector<int> coins(n);
               for (auto &i : coins)
                   cin >> i;
               
               int sum = accumulate(coins.begin(), coins.end(), 0);
               vector<vector<int>> memo(n + 1, vector<int>(sum + 1, 0));
               memo[0][0] = 1;
               
               for (int coin = 1; coin <= n; coin++) { // for coins array
                   for (int s = 0; s <= sum; s++) {      // for sum array
                       memo[coin][s] = memo[coin - 1][s];
                       int left = s - coins[coin - 1];
                       if (left >= 0 and memo[coin - 1][left]) {
                           memo[coin][s] = 1;
                       }
                   }
               }
               vector<int> ans;
               for (int i = 1; i <= sum; i++) {
                   if (memo[n][i]) {
                       ans.push_back(i);
                   }
               }
               cout << ans.size() << '\n';
               for (const auto &i : ans) {
                   cout << i << ' ';
               }
               cout << '\n';
           }
           ```
           </details>

