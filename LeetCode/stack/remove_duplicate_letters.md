[316. Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/)

[refer to notes please](/notes/stacks/README.md)

```cpp
class Solution {
public:
    string removeDuplicateLetters(string s) {
        string st;
        vector<int> mp(256, 0), used(256, 0);

        for (const auto& i: s) {
            mp[i] ++;
        }

        for (int i= 0; i< s.size(); i++) {
            mp[s[i]] --;
            if (used[s[i]]) continue;

            while (!st.empty() and mp[st.back()] > 0 and st.back() > s[i]) {
                used[st.back()] = 0;
                st.pop_back();
            }
            st.push_back(s[i]);
            used[s[i]] = 1;
        }
        return st;
    }
};
```

```java
class Solution {
    public String removeDuplicateLetters(String s) {
        boolean[] used = new boolean[256];
        int[] mp = new int[256];

        for (int i = 0; i < s.length(); i++) {
            used[s.charAt(i)] = false;
            mp[s.charAt(i)] ++;
        }

        StringBuilder ans = new StringBuilder("0");

        for (var i: s.toCharArray()) {
            mp[i] --;
            if (used[i])
                continue;

            while (i < ans.charAt(ans.length() - 1) && mp[ans.charAt(ans.length() - 1)] > 0) {
                used[ans.charAt(ans.length() - 1)] = false;
                ans.deleteCharAt(ans.length() - 1);
            }
            ans.append(i);
            used[i] = true;
        }

        return ans.toString().substring(1, ans.length());


    }
}
```
