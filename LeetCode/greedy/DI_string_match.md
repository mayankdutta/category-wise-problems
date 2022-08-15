[942. DI String Match](https://leetcode.com/problems/di-string-match/)

- since we are required to return the array in any order.
- **if the lexically smallest would required, then this wouldn't have work**, in this case refer to [this](/LeetCode/greedy/construct_DI_smallest.md)

<details> 
<summary> Implementation </summary>

```cpp
class Solution {
public:
    vector<int> diStringMatch(string s) {
        int mx = 0;
        int mn = 0;

        vector<int> ans;
        ans.push_back(0);

        for (auto i: s) {
            if (i == 'I') ans.push_back(mx + 1), mx  ++;
            else if (i == 'D') ans.push_back(mn - 1), mn --;
        }

        for (int i = 0; i < ans.size(); i++)
            ans[i] -= mn;
        return ans;
    }
};
```
</details> 
