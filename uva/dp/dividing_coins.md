[562 - Dividing coins](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=503)

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

