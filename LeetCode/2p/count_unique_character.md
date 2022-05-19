[828. Count Unique Characters of All Substrings of a Given String](https://leetcode.com/problems/count-unique-characters-of-all-substrings-of-a-given-string/)

similar to [total appealing strings](/LeetCode/2p/total_appeal_string.md)
<br>
just differ the calculation part.

```cpp
using ll = long long;
class Solution {
    public:
    ll solve(const int& n) {
        return (n * (n + 1)) / 2;
    }

    ll fun(const string& s, const char& c) {
        ll ans = 0;
        ll n = s.size();

        vector<int> index;

        index.push_back(0);
        for (int i = 0; i < s.size(); i++)
            if (s[i] == c)
                index.push_back(i + 1);

        index.push_back(s.size() + 1);
        for (int i = 1; i < index.size() - 1; i++) {
            int left = index[i] - index[i - 1] - 1;
            int right = index[i + 1] - index[i] - 1;
            int total = index[i + 1] - index[i - 1] - 1;

            ans += (solve(total) - solve(right) -  solve(left));
        }
        return ans;
    }

    int uniqueLetterString(string s) {
        ll ans = 0;
        set<char> st(s.begin(), s.end());
        for (const auto& i: st) {
            ans += fun(s, i);
        }
        return (int)ans;
    }
};


```
