[ 799. Champagne Tower ](https://leetcode.com/problems/champagne-tower/)

- just do as said.
- but keep them stored.
- though pattern was similar to pascal triangle, but knowing that won't help much.

```java

class Solution {
    public double champagneTower(int x, int row, int col) {
        double[][] dp = new double[101][101];
        for (int i = 0; i < dp.length; i++)
            for (int j = 0; j < dp[i].length; j++)
                dp[i][j] = 0;

        dp[0][0] = x;

        for (int i = 0; i <= row; i++) {
            for (int j = 0; j <= i; j++) {
                dp[i][j] --;
                if (dp[i][j] > 0) {
                    dp[i + 1][j] += dp[i][j] / 2.0;
                    dp[i + 1][j + 1] += dp[i][j] / 2.0;
                }
                dp[i][j] ++;
            }
        }

        return Math.min(dp[row][col], 1);

    }
}
```
