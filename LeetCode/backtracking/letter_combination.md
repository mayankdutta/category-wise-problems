[17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

- first map the values to the alphabets.
- keep yourself @digit string then move fwd. 
- keep storing the values and then recurse them in similar way.

<details> 
<summary> Implementation </summary> 

```cpp
class Solution {
    public:
    string s;
    vector<string> ans;
    map<char, string> mp;

    void fun(string digits) {
        if (digits.empty()) {
            if (!s.empty())
                ans.push_back(s);
            return;
        }

        for (const char& ch: mp[digits.front()]) {
            s.push_back(ch);
            fun(digits.substr(1));
            s.pop_back();
        }
    }

    vector<string> letterCombinations(string digits) {
        mp['2'] = "abc";
        mp['3'] = "def";
        mp['4'] = "ghi";
        mp['5'] = "jkl";
        mp['6'] = "mno";
        mp['7'] = "pqrs";
        mp['8'] = "tuv";
        mp['9'] = "wxyz";

        fun(digits);

        return ans;
    }
};
```
</details> 
