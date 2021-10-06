### Visualization of iterative approach
- inside a 2D loop mainly two things going on.
     ```cpp
      1. memo[coin][s] = memo[coin - 1][s];
      2. int left = s - coins[coin - 1];
         if (left >= 0 and memo[coin - 1][left]) {
           memo[coin][s] = 1;
         }
      OR 
  
      1. if () memo[index][m] = memo[index - 1][m];
      2. else {
              memo[index][m] = max(memo[index - 1][m],
              memo[index - 1][m - prices[index - 1]] + pages[index - 1]);
          }
    ```
- what 1st statement does, if you draw `dp` table,  you will notice that it just copying previous row data in this newer row.
- 1st statement is the same as the recursive call of `not taken in account, and continuing` in terms of knapsack.
- 2nd statement on the other hand means `things picked up` in terms of 01 knapsack.
- what 2nd statement does is `from the updated data` (means after copying data in current row), it check values from previous cols, and then decided for upcoming cols of `updated rows`

