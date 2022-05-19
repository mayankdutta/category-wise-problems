[2110. Number of Smooth Descent Periods of a Stock](https://leetcode.com/contest/weekly-contest-272/problems/number-of-smooth-descent-periods-of-a-stock/), DP, 1D type

- cakewalk
- just observe what kind of thing you have to save
- and then go along

<details>
<summary> Code </summary>

```cpp
long long getDescentPeriods(vector<int>& prices) {
    int n = prices.size();
    vector<long long> dp(n, 1);
    for (int i = 1; i < n; i++) {
        if (prices[i - 1] == prices[i] + 1) {
            dp[i] += dp[i - 1];
        }
    }
    long long sum = 0;
    for (const auto & i: dp) {
        cout << i << ' ';
        sum += i;
    }
    return sum;


```

</details>
