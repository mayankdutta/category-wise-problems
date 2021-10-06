[10616 - Divisible Group Sums ](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=652&page=show_problem&problem=1557), medium.
 - 01 knapsack variant
 - innvoled 3 states.
   <details>
   <summary>Memoization version</summary>

   ```cpp
     #define MAX 205
     #define vi vector<int>
     #define vvi vector<vi>
     #define vvvi vector<vvi>
     
     int N, M, D, Q;
     vi arr;
     vvvi memo;
     
     int dp(int n, int sum, int m) {
         if (m == 0)
             return sum == 0;
         if (n == N)
             return 0;
         
         int &ans = memo[n][sum][m];
         
         if (ans != -1)
             return ans;
         
         ans = dp(n + 1, (sum % D + D) % D, m) +
               dp(n + 1, (D + sum % D + arr[n] % D) % D, m + 1);
         return ans;
     }
     
     int main() {
         int i, j, res;
         
         j = 1;
         while (1) {
         scanf("%d %d", &N, &Q);
         
             if (N == 0 && Q == 0)
               break;
         
             arr = vi(N);
             for (auto &i : arr)
               scanf("%d", &i);
         
             printf("SET %d:\n", j);
         
             for (i = 0; i < Q; i++) {
               scanf("%d %d", &D, &M);
               memo = vvvi(MAX, vvi(MAX, vi(15, -1)));
         
               res = dp(0, 0, M);
               printf("QUERY %d: %d\n", i + 1, res);
             }
             j++;
         }
     }


   ```

   </details>
 - Iterative version, approach mentioned in comments.


