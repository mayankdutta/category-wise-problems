[931. Minimum Falling Path Sum](https://leetcode.com/problems/minimum-falling-path-sum/)

spin off of [Unique Paths](/LeetCode/dp/unique_paths.md#unique-paths-1) and [Minimum Path sum](/LeetCode/dp/min_path_sum.md)

```cpp
class Solution {
    public:
    int minFallingPathSum(vector<vector<int>>& matrix) {
        int n = matrix.size();
        int m = matrix[0].size();
        vector<vector<int>> dp(n, vector<int>(m, 0));

        for (int i = 0; i < m; i++)
            dp[n - 1][i] = matrix[n - 1][i];

        for (int i = n - 2; i >= 0; i--) {
            for (int j = 0; j < m; j++) {
                dp[i][j] = matrix[i][j];
                int temp = dp[i + 1][j];

                if (j + 1 < n)
                    temp = min(temp, dp[i + 1][j + 1]);
                if (j - 1 >= 0)
                    temp = min(temp, dp[i + 1][j - 1]);

                dp[i][j] += temp;
            }
        }

        return *min_element(dp[0].begin(), dp[0].end());
    }
};
```
