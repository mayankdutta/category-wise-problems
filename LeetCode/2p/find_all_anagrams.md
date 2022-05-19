[438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

- since we have to compare anagrams.
- therefore storing characters in sorted order as we proceed seems nice idea.
- for that we have many options, store @index of string, map.
- try equating as go further.

```cpp
class Solution {
    public:
    vector<int> findAnagrams(string s, string t) {
        if (s.size() < t.size()) return {};
        vector<int> ans, st(26, 0), must(26, 0);
        int k = t.size();

        for (int i = 0; i < k; i++)
            st[s[i] - 'a'] ++, must[t[i] - 'a'] ++;

        if (st == must)
            ans.push_back(0);

        for (int i = k; i < s.size(); i++) {
            st[s[i - k] - 'a'] --;
            st[s[i] - 'a'] ++;

            bool good = true;
            for (int i = 0; i < 26; i++) {
                if (st[i] != must[i]) {
                    good = false;
                    break;
                }
            }
            if (good)
                ans.push_back(i - k + 1);
        }
        return ans;
    }
};
```
