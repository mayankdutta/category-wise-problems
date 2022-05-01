[2262. Total Appeal of A String](https://leetcode.com/problems/total-appeal-of-a-string/)

- we will count the contribution of each character, present in the string.
- `total no. of substring - total substring where character is absent`
- adding above sums will lead us to ans...

```cpp
using ll = long long;
class Solution {
public:
    ll fun(const string& s, const char& c) {
        ll count = 0;
        ll ans = 0;
        ll n = s.size();

        for (int i = 0; i < n; i++) {
            if (s[i] == c) {
                ans += (count * (count + 1)) / 2;
                count = 0;
            }
            else {
                count ++;
            }
        }
        ans += (count * (count + 1)) / 2;

        return (n * (n + 1)/2) - ans;
    }

    long long appealSum(string s) {
        ll ans = 0;
        for (char c = 'a'; c <= 'z'; c++) {
            ans += fun(s, c);
        }
        return ans;
    }
};
```
