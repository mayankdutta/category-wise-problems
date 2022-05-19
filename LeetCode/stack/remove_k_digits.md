[402. Remove K Digits](https://leetcode.com/problems/remove-k-digits/)

[refer to notes please](/notes/stacks/README.md)

```cpp
class Solution {
    public:
    string removeKdigits(string num, int k) {
        if (num.size() <= k) {
            return "0";
        }

        string ans;
        int n = num.size();

        for (int i = 0; i < n; i++) {
            while (!ans.empty() and k > 0 and ans.back() > num[i]) {
                if (ans.back() != 0)
                    k --;
                ans.pop_back();
            }
            ans.push_back(num[i]);
        }

        while (k > 0) {
            ans.pop_back();
            k --;
            if (ans.empty())
                return ans;
        }

        while (ans.front() == '0')
            ans.erase(ans.begin());

        if (ans.empty())
            return "0";

        return ans;
    }
};
```
