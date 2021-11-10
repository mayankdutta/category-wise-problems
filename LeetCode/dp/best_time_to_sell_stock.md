### Best time to sell the stocks I

### Best time to sell the stocks II

- we have to buy a stock and then sell it.
- we can have at most one stock.
- we can buy and sell stock on same day.

<details>

<summary>Greedy</summary>

- if we encountered a lower price.
- why not have it and sell on the high price day.
- since no transaction limit, we can implement this.

```cpp
class Solution {
public:
  int maxProfit(vector<int>& prices) {
    int ans = 0;
    for (int i = 0; i < prices.size() - 1; i++) {
      if (prices[i + 1] > prices[i]) {
        ans += (prices[i + 1] - prices[i]);
      }
    }
    return ans;
  }
};

```

</details>
<details>

<summary> DP (memo) </summary>

```cpp
class Solution {
public:
  vector<int> prices;
  vector<vector<int>> memo;
  int find(int i, bool buy) {
    if (i >= prices.size()) return 0;

    int &ans = memo[i][buy];
    if (ans != -1) return ans;

    ans = find(i + 1, buy);
    ans = buy ? max(-prices[i] + find(i + 1, !buy), ans)
              : max(prices[i] + find(i + 1, !buy), ans);
    return ans;
  }
  int maxProfit(vector<int> &prices) {

    int n = prices.size();
    if (n < 2)
      return 0;
    this->prices = prices;
    memo = vector<vector<int>>(n + 1, vector<int>(2, -1));
    return find(0, 1);
  }
};


```

</details>
<details>

<summary> DP (iterative) </summary>

```cpp

```

</details>

### Best time to sell the stocks III
