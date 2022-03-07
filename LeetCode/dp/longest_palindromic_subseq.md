[ 516. Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/)

###### Follow the rules

- find the no. of states
- find the recurrence relation
- find the base case.

```java
class Solution {
    public String s;
    public int[][] dp;

    public int fun(int i, int j) {
        if (i == j) return 1;
        if (i > j) return 0;

        if (dp[i][j] == -1) {
            if (s.charAt(i) == s.charAt(j))
                dp[i][j] = 2 + fun(i + 1, j - 1);
            else
                dp[i][j] = Math.max(fun(i + 1, j), fun(i, j - 1));
        }
        return dp[i][j] ;
    }

    public int longestPalindromeSubseq(String s) {
        this.s = s;
        dp = new int[s.length()][s.length()];
        for (int i = 0; i < s.length(); i++)
            for (int j = 0; j < s.length(); j++)
                dp[i][j] = -1;

        return fun(0, s.length() - 1);
    }
}
```
