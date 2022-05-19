### [Book shop](https://cses.fi/problemset/task/1158)

Classic problem, easy

- 0-1 Knapsack without any variant
- States are, `money and index`

##### memo approach

- take a carefull look on the calling in recursive function.

<details>
<summary>Code sample </summary>

```cpp
 vector<vector<int>> memo;
 vector<int> prices, pages;
 int dp(int money, int index) {
     if (money <= 0)
     return 0;
     if (index >= pages.size())
         return 0;

     int &ans = memo[index][money];
     if (ans != -1)
         return ans;

     if (money < prices[index])
         return ans = dp(money, index + 1);

     /* Important point */
     return ans = max(dp(money - prices[index], index + 1) + pages[index],
                     dp(money, index + 1));
 }

 void solve() {
     int n, money;
     cin >> n >> money;

     prices = pages = vector<int>(n);
     memo = vector<vector<int>>(n + 1, vector<int>(money + 1, -1));

     cin >> prices >> pages;

     int ans = dp(money, 0);
     cout << ans << '\n';
 }
```

</details>

#### Iterative approach

- do note that loop are like **First index loop then money loop**.
- If we reverse the loop order then we will be getting **TLE**.
- therefore **CHOOSE ORDER OF YOUR STATES CAREFULLY**.
<details>
<summary>Code sample </summary>

```cpp
 vector<vector<int>> memo;
 vector<int> prices, pages;

 void solve() {
     int n, money;
     cin >> n >> money;

     prices = pages = vector<int>(n);
     cin >> prices >> pages;
     memo = vector<vector<int>>(n + 2, vector<int>(money + 2, -1));

     for (int index = 0; index <= n; index++) {
         for (int m = 0; m <= money; m++) {
             if (m == 0 or index == 0) {
                 memo[index][m] = 0;
                 continue;
             }

            if (m < prices[index - 1]) {
                memo[index][m] = memo[index - 1][m];
            } else {

                memo[index][m] = max(memo[index - 1][m],
                memo[index - 1][m - prices[index - 1]] + pages[index - 1]);
            }
        }
     }
     cout << memo[n][money];
 }

```

</details>
<details>
<summary>more concise implementation</summary>

```cpp
 int n, target;
 cin >> n >> target;

 vector<int> prices(n), pages(n);
 for (auto &i : prices)
 cin >> i;
 for (auto &i : pages)
 cin >> i;

 vector<vector<int>> memo(n + 1, vector<int>(target + 1, 0));

 for (int i = 1; i <= n; i++) {
     for (int j = 0; j <= target; j++) {
         memo[i][j] = memo[i - 1][j];
         int rem = j - prices[i - 1];

         if (rem >= 0)
             memo[i][j] = max(memo[i][j], memo[i - 1][rem] + pages[i - 1]);
     }
 }
 cout << memo[n][target] << '\n';


```

</details>
