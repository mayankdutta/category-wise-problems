
1. [1143. Longest Common Subsequence ](https://leetcode.com/problems/longest-common-subsequence/), Easy, classic dp
    - Given two string, we are required to find the longest Common subsequence.
    - Approach
        - consider two pointers `i and j`, pointing towards string `s, t`.
        - The process of increasing the pointers can be seen as moving fwd *(if i is increase)*, or moving dwn *(if j is increase)*.
        - *or* moving `diagonally` if both i and j increases. 
        - Then our ans. will be maximum no. of **diagonal movements.** *(the no. of times both increase)*

   - <details>
     <summary> memoization Implementation</summary>

       ```cpp
       /* Pay attention to the base cases. */
     
       class Solution {
       public:
       std ::vector<std ::vector<int>> memo;
       int n, m;
       string s, t;
       
       int dp(int i, int j) {
       /* Don't something like -INFINITY, it should be 0. */
       /* This being 0 means that we atleast paid visit to beginning of memo */
       /* Essential for adding up one to diagonal elements. */
       
           if (i < 1 or j < 1)
             return 0;
       
           int &ans = memo[i][j];
       
           if (ans != -1)
             return ans;
       
           if (s[i - 1] == t[j - 1]) {
             ans = max(dp(i - 1, j - 1) + 1, ans);
           } else
             ans = max(dp(i - 1, j), dp(i, j - 1));
       
           return ans;
       }
       
       int longestCommonSubsequence(string s, string t) {
           n = s.size(), m = t.size();
     
           this->s = s;
           this->t = t;
       
           memo = vvi(n + 1, vi(m + 1, -1));
           int ans = dp(n, m);
       
           if (ans == -1)
             return 0;
           return ans;
       }

       ```
     </details>
   - <details>
     <summary>Iterative Implementation</summary>

        ```cpp
        int longestCommonSubsequence(string s, string t) {
            int n = s.size(); 
            int m = t.size();
            int dp[n + 1][m + 1];
            
            for (int i = 0; i <= n; i++) {
                for (int j = 0; j <= m; j++) {
                    if (i == 0 or j == 0) dp[i][j] = 0;
                    else if (s[i - 1] == t[j - 1])  dp[i][j] = dp[i - 1][j - 1] + 1;
                    else dp[i][j] = max(dp[i][j-  1], dp[i - 1][j]);
                }
            }
            return dp[n][m];
        }

        ```
     </details>
