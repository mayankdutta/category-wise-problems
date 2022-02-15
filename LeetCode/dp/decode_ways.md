[91. Decode Ways](https://leetcode.com/problems/decode-ways/)

- follow the roadmap
- first check the no. of states.
  - means how many distinct variables you will be requiring to identifying your conditions.
- get the recurrence relation b/w states.
  - let say you're at arbitrarily index, now given the states you have how will you relate the next state.
  - finally the base case.

```cpp
class Solution {
public:
    string s;
    vector<int> dp;
    int fun(int i) {
        if (s[i] == '0')
            return 0;
        if (i >= s.size())
            return 1;

        int &ans = dp[i];
        if (ans == -1) {
            ans = fun(i + 1);
            if (i + 1 < s.size() and stoi(s.substr(i, 2)) <= 26) {
                ans += fun(i + 2);
            }
        }
        return ans;
    }

    int numDecodings(string s) {
        this->s = s;
        dp.resize(s.size() + 1, -1);
        return fun(0);
    }
};
```

```cpp
class Solution {
    public:
    int numDecodings(string s) {
        int n = s.size();
        vector<int> dp(n + 1, 0);
        dp[n] = 1;

        for (int i = n - 1; i >= 0; i--) {
            if (s[i] == '0')
                dp[i] = 0;
            else {
                dp[i] += dp[i + 1];
                if (i < s.size() - 1 and stoi(s.substr(i, 2)) <= 26)
                    dp[i] += dp[i + 2];
            }
        }
        return dp[0];
    }
};
```
