[Maximal square](https://leetcode.com/problems/maximal-square/)

###### Brute

<details>
<summary>brute solution</summary>

```cpp

class Solution {
    public:
    int maximalSquare(vector<vector<char>>& matrix) {
        int n = matrix.size();
        int m = matrix[0].size();

        int ans = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (matrix[i][j] == '1') {
                    for (int side = 0; side <= min(n - i, m - j); side++) {
                        bool flag = true;
                        for (int ii = 0; ii < side; ii++) {
                            for (int jj = 0; jj < side; jj++) {
                                if (matrix[i + ii][j + jj] == '0') {
                                    flag = false;
                                    break;
                                }
                            }
                            if (!flag) break;
                        }
                        if (flag) ans = max(ans, side);
                    }
                }
            }
        }
        return ans * ans;
    }
};

```

</details>

###### Optimal

- We initialize another matrix DP with the same dimensions as the original one initialized with all 0’s.
- DP(i,j) represents the side length of the maximum square whose bottom right corner is the cell with index (i,j) in the original matrix.
- Starting from index (0,0), for every 1 found in the original matrix, we update the value of the current element as

```js
dp[i][j] = min({dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]}) + 1;
```

We also remember the size of the largest square found so far. In this way, we traverse the original matrix once and find out the required maximum size. This gives the side length of the square (say side). The required result is the area side\*side.

<details>
<summary> optimal solution </summary>

```cpp
class Solution {
    public:
    int maximalSquare(vector<vector<char>>& matrix) {
        int n = matrix.size();
        int m = matrix[0].size();

        int ans = 0;
        int dp[n + 1][m + 1];
        for (int i = 0; i < n; i++) for (int j = 0; j < m; j++) dp[i][j] = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (i == 0 or j == 0) {
                    dp[i][j] = matrix[i][j] -'0';
                }
                else {
                    if (matrix[i][j] == '1') {
                        dp[i][j] = min({dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]}) + 1;
                    }
                }
                ans = max(ans, dp[i][j]);
            }
        }
        return ans * ans;
    }
};
```

</details>
