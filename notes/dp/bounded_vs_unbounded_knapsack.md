### GENERAL TEMPLATE

- Each 0/1 Knapsack can be done by taking O(n) space of DP.
- assuming `1-based` in `for loop` we are using `index - 1` every place.

##### UNBOUNDED

```js
dp = [INDEX][AMOUNT]
for (index ...)
  for (amount ...)
    dp[index][amount] = dp[index - 1][amount]
    if (GIVEN_AMOUNT_ARRAY[index - 1] <= amount)
      dp[index][amount] = MAX(... , dp[index][amount - GIVEN_AMOUNT_ARRAY[index - 1]] + GIVEN_VALUE_ARRAY[index - 1])

```

```js
dp = [AMOUNT]
for (index ...)
  for (amount ...)
    dp[amount] = MAX(dp[amount], dp[amount - GIVEN_AMOUNT_ARRAY[index - 1]] + GIVEN_VALUE_ARRAY[index - 1])

```

- try this on pen and paper.
- we will be taking each value **UNBOUNDED\***ly\*.

##### BOUNDED

- earlier.

```js
dp = [INDEX][AMOUNT]
for (index ... )
  for (amount ...)
    dp[index][amount] = dp[index - 1][amount]
    if (GIVEN_AMOUNT_ARRAY[index - 1] <= amount)
      dp[index][amount] = dp[index - 1][amount - GIVEN_AMOUNT_ARRAY[index - 1]]
```

- so as to make this thing bounded.

```js
dp = [AMOUNT]
for (index ... )
  for (amount ...)
    if (GIVEN_AMOUNT_ARRAY[index - 1] <= amount)
    dp[amount] = +/min/max (dp[amount - GIVEN_AMOUNT_ARRAY[index - 1]])


```
