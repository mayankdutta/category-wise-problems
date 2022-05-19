You know what to do

1. check out states
2. formulate a relation b/w states i.e. reccurence relation.
3. check out base cases.

#### Unique Paths 1

[ 62. Unique Paths](https://leetcode.com/problems/unique-paths/)

###### Bottom up implementation

```cpp
class Solution {
public:
    int uniquePaths(int n, int m) {
        int dp[n][m];
        for (int i = 0; i < n; i++)
            for (int j = 0; j < m; j++)
                dp[i][j] = 0;

        dp[n - 1][m - 1] = 1;

        for (int i = n - 1; i >= 0; i--)
            for (int j = m - 1; j >= 0; j--) {
            if (i + 1 < n) {
                dp[i][j] += dp[i + 1][j];
            }
            if (j + 1 < m) {
                dp[i][j] += dp[i][j + 1];
            }
        }
        return dp[0][0];
    }
};
```

```java
class Solution {
    public int uniquePaths(int m, int n) {
        int[][] dp = new int[m][n];
        dp[0][0] = 1;

        for (int row = 0; row < m; row++) {
            for (int col = 0; col < n; col++) {
                if (row > 0) {
                    dp[row][col] += dp[row - 1][col];
                }
                if (col > 0) {
                    dp[row][col] += dp[row][col - 1];
                }
            }
        }

        return dp[m - 1][n - 1];
    }
}
```

###### Top down implementation

```java
class Solution {
    private int[][] memo;

    private int dp(int row, int col) {
        if (row + col == 0) {
            return 1; // Base case
        }

        int ways = 0;
        if (memo[row][col] == 0) {
            if (row > 0) {
                ways += dp(row - 1, col);
            }
            if (col > 0) {
                ways += dp(row, col - 1);
            }

            memo[row][col] = ways;
        }

        return memo[row][col];
    }

    public int uniquePaths(int m, int n) {
        memo = new int[m][n];
        return dp(m - 1, n- 1);
    }
}
```

#### Unique Paths 2

[63. Unique Paths II](https://leetcode.com/problems/unique-paths-ii/)

```cpp
using ll = long long int;
class Solution {
    public:
    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {
        int n = obstacleGrid.size();
        int m = obstacleGrid[0].size();
        int mod = int(1e9 + 7);

        ll dp[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                dp[i][j] = 0;
            }
        }

        dp[n - 1][m - 1] = obstacleGrid[n - 1][m - 1] == 0 ? 1 : 0;

        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                if (!obstacleGrid[i][j]) {
                    if (i + 1 < n)
                        dp[i][j] += dp[i + 1][j];
                    if (j + 1 < m)
                        dp[i][j] += dp[i][j + 1];
                }
            }
        }
        return dp[0][0];
    }
};
```
