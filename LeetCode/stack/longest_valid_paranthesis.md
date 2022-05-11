[32. Longest Valid Parentheses ](https://leetcode.com/problems/longest-valid-parentheses/), Classical, medium

- Storing index instead of characters really a good way.

<details>
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

#### constant space

- we will first count the valid combination via traversal
- also verify that traversal after reversing.
- because if we only go one way, having just `open`, `close` provide us no provision to get valid parantheses.
- will return the maximum one.

```cpp
class Solution {
public:
    int longestValidParentheses(string s) {
        int ans = 0;
        int open = 0;
        int close = 0;

        for (char& ch: s) {
            open += (ch == '(');
            close += (ch == ')');

            if (open < close) {
                open = 0;
                close = 0;
            }
            else if (open == close) {
                ans = max(ans, open);
            }
        }
        reverse(s.begin(), s.end());

        open = 0;
        close = 0;
        for (char& ch: s) {
            open += (ch == '(');
            close += (ch == ')');

            if (open > close) {
                open = 0;
                close = 0;
            }
            else if (open == close) {
                ans = max(ans, open);
            }
        }

        return 2 * ans;
    }
};
```

##### more concise

```cpp
class Solution {
    public:
    void fun(const string& s, bool flag, int& ans) {
        int open = 0;
        int close = 0;

        for (const char& ch: s) {
            open  += (ch == '(');
            close += (ch == ')');

            if (open == close)
                ans = max(ans, open);
            if ((!flag && (open < close)) or (flag && (open > close)))
                open = 0, close = 0;
        }
    }

    int longestValidParentheses(string s) {
        int ans = 0;
        fun(s, false, ans);
        reverse(s.begin(), s.end());
        fun(s, true, ans);

        return 2 * ans;
    }
};
```
