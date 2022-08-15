[Knapsack with Duplicate Items](https://practice.geeksforgeeks.org/problems/knapsack-with-duplicate-items4201/1)

- unbounded knapsack problem.
- @first glance states might seem 2, but actually only one needed.
- refer to [notes](/notes/dp/bounded_vs_unbounded_knapsack.md).

<details>
<summary> Naive Implementation, memo </summary>

```cpp
class Solution{
public:
    vector<int> val, wt;
    int N, W;
    vector<vector<int>> dp;

    int dfs(int i, int Weight) {
        if (i >= N) {
            return 0;
        }


        int &ans = dp[i][Weight];
        if (ans == -1) {
            ans = dfs(i + 1, Weight);
            if (wt[i] <= Weight) {
                ans = max(ans, dfs(i, Weight - wt[i]) + val[i]);
            }
        }
        return ans;
    }

    int knapSack(int N, int W, int val[], int wt[]) {
        this->N = N;
        this->W = W;
        this->dp.resize(N + 1, vector<int>(W + 1, -1));
        for (int i = 0; i < N; i++) this->val.push_back(val[i]);
        for (int i = 0; i < N; i++)  this->wt.push_back(wt[i]);

        return dfs(0, W);
    }
};

```

</details>

<details>
<summary> Correct Implementation, memo </summary>

```cpp
class Solution{
public:
    int N, W;
    vector<int> val, wt;
    vector<int> dp;

    int fun(int i) {

        if (i == 0)
          return 0;
        if (i < 0)
          return 1e9;

        int &ans = dp[i];
        if (ans == -1) {
          ans = 0;
          for (int v = 0; v < val.size(); v++) {
            if (wt[v] <= i)
              ans = max(ans, fun(i - wt[v]) + val[v]);
          }
        }
        return ans;


    }
    int knapSack(int N, int W, int val[], int wt[]) {

        this->N = N;
        this->W = W;
        for (int i = 0; i < N; i++)
            this->val.push_back(val[i]);
        for (int i = 0; i < N; i++)
            this->wt.push_back(wt[i]);

        dp.resize(W + 1, -1);
        return fun(W);

    }
};
```

</details>

<details>
<summary>
Correct Implementation, iterative
</summary>

```cpp
 int knapSack(int N, int W, int val[], int wt[]) {

        int dp[N+1][W+1];
        for(int i = 0; i<=W; i++) dp[0][i]=0;
        for(int i = 0; i<=N; i++) dp[i][0]=0;

        for(int i = 1; i<=N; i++)
            for(int j = 1; j<=W; j++) {
              if(j>=wt[i-1])
                dp[i][j] = max(val[i-1]+dp[i][j-wt[i-1]], dp[i-1][j]);
              else
                dp[i][j]=dp[i-1][j];
            }
        return dp[N][W];

    }

```

</details>

<details>
<summary> Correct Implementation, iterative, java </summary>

```java
static int knapSack(int N, int W, int val[], int wt[]) {
        int[] dp = new int[W + 1];
        int ans = 0;
        dp[0] = 0;
        for (int i = 1; i <= N; i++) {
            for (int j = 0; j <= W; j++) {
                if (wt[i - 1] <= j) {
                    dp[j] = Math.max(dp[j], dp[j - wt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[W];
    }
```

</details>
