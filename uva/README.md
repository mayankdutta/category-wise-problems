## DP _(2-states)_

1. [11450 - Wedding shopping](https://onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=2445)
    - Problem require us to find the maximum amount of dresses(have multiple brands) in given amount of money.
    - Kind of 0-1 Knapsack
    - States are, `money and index_of_brands`
      <details>
      <summary>Code sample </summary>
      
      ```cpp
       /*
        * price being the 2d-array storing data
        * memo being 2d-array used for memoization.
        */
  
       int ourFunction(CurrentMoney, index) {
        if (CurrentMoney < 0) 
          return -INF; /* INF, being very large values. */
                             
        if (index == TotalBrands) 
          return TotalMoney - CurrentMoney; 

        int &ans = memo[money][g];
                      
        if (ans != -1) 
          return ans;
        
        for (int brand = 1; brand <= price[index][0]; brand++)  /* at index,0 we have stored the size of that specific brand. */
          ans = max(ans, ourFunction(CurrentMoney - price[index][CurrentMoney], index + 1)); 
  
        return ans;
       }
  
      ```

      </details>


















