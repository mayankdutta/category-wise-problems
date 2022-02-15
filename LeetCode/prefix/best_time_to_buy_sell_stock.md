[121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

NOTE: try doing via kadane's version

- we have just have to buy and sell the stock.
- also will have to perform only one transaction.
- therefore it was best to choose one small price and after that a large price.
- to see the larger prices after every instant, prepared a prefix sum in one method.
- later taken maximum.

##### prefix sums

```cpp
class Solution {
    public int maxProfit(int[] prices) {
        ArrayList<Integer> arr = new ArrayList<>();
        for (int i = prices.length - 1; i >= 0; i--) {
            if (arr.isEmpty()) arr.add(prices[i]);
            else               arr.add(Math.max(prices[i], arr.get(arr.size() - 1)));

        }
        Collections.reverse(arr);

        int ans = 0;

        for (int i = 0; i < prices.length; i++)
            if (prices[i] < arr.get(i))
                ans = Math.max(ans, arr.get(i) - prices[i]);

        return ans;
    }
}
```

##### kadane type

[pre requisite](/notes/dp/kadane.md)

```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int n = prices.size();
        int curr = 0;
        int mn = INT_MAX;
        for (int i = 0; i < n; i++) {
            mn = min(mn, prices[i]);
            curr = max(curr, prices[i] - mn);
        }
        return curr;
    }
};
```
