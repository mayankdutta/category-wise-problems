[1387. Sort Integers by The Power Value ](https://leetcode.com/problems/sort-integers-by-the-power-value/?utm_source=pocket_mylist)

- brute kind of problem
- do as said in question.

<details>
<summary> code </summary>

```cpp
class Solution {
    public:
    int getKth(int lo, int hi, int k) {
        vector<int> ans;
        unordered_map<int, int> dp;

        for(int i = lo; i <= hi; i++) {
            if (!dp.count(i)) {
                int count = 0;
                for (auto temp = i; temp > 1; temp = (temp % 2 ? temp * 3 + 1 : temp/2))
                    count ++;
                dp[i] = count;
                ans.push_back(i);
            }
        }

        sort(ans.begin(), ans.end(), [&dp](const auto& one, const auto& two) -> bool {
            if (dp[one] == dp[two])  return one < two;
            return dp[one] < dp[two];
        });
        return ans[k - 1];
    }
};
```

</details>
