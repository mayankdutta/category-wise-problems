[32. Longest Valid Parentheses ](https://leetcode.com/problems/longest-valid-parentheses/), Classical, medium
 - Storing index instead of characters really a good way.

 - <details>
   <summary> sample Implementation</summary>

     ```cpp
      int longestValidParentheses(string s) {
          int ans = 0;
          vector<int> st; 
          st.push_back(-1);
          for (int i = 0; i < s.size(); i++) {
              if (st.back() == -1) {
                  st.push_back(i); continue;
              }
              if (s[st.back()] == '(' and s[i] == ')') {
                  st.pop_back();
                  ans = max(ans,i - st.back());
                  continue;
              }
              st.push_back(i);
         }
         return ans;
      }


     ```
   </details>
