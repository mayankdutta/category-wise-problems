[ 64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

spin off of [Unique Paths](/LeetCode/dp/unique_paths.md#unique-paths-1)

```cpp
class Solution {
    public:
    int minPathSum(vector<vector<int>>& grid) {
        int n = grid.size();
        int m = grid[0].size();

        int dp[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                dp[i][j] = 1e8;
            }
        }
        dp[n - 1][m - 1] = grid[n - 1][m - 1];

        for (int i = n - 1; i >= 0; i--) {
            for (int j = m - 1; j >= 0; j--) {
                if (i + 1 < n)
                    dp[i][j] = min(dp[i][j], dp[i + 1][j] + grid[i][j]);
                if (j + 1 < m)
                    dp[i][j] = min(dp[i][j], dp[i][j + 1] + grid[i][j]);
            }
        }
        return dp[0][0];
    }
};
```
