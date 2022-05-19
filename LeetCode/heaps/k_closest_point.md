[ 973. K Closest Points to Origin](https://leetcode.com/problems/k-closest-points-to-origin/)

NOTE: originally priority queue problem

- typical `k` problem, means `heap` problem.
- try to fit in `priority queue` somehow.

```cpp
class Solution {
    public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        vector<vector<int>> ans;
        vector<pair<int, int>> arr;
        for (const auto& i: points)
            arr.push_back({i[0], i[1]});

        sort(arr.begin(), arr.end(), [](const auto& one, const auto& two) -> bool {
            return (one.first * one.first + one.second * one.second <
                    two.first * two.first + two.second * two.second);
        });
        for (int i = 0; i < k; i++)
            ans.push_back({arr[i].first, arr[i].second});
        return ans;
    }
};
```
