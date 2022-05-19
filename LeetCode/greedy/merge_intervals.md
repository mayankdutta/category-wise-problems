[56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

- kind of opposite approach of [non overlapping Intervals](/LeetCode/greedy/merge_intervals.md)
- sorted according to first index.
- if overlapping noticed we immediately deleted that part kept the previous part with extended version.
- extended version means the `end` value is extended by the max of both intervals.


<details>
<summary> implementation </summary>

```cpp
vector<pair<int, int>> arr; 
    vector<vector<int>> ans;
    for (const auto& i: intervals) 
        arr.push_back({i[0], i[1]});
    
    sort(arr.begin(), arr.end());
    
    int curr = 0; 
    for (int i = 1; i < arr.size(); i++) {
        if (arr[i].first <= arr[curr].second) {
            arr[curr].second = max(arr[i].second, arr[curr].second);
            arr[i].first = -1; 
            arr[i].second = -1; 
        }
        else {
            curr = i;
        }
    }
    for (const auto& i: arr)  if (i.first != -1) 
        ans.push_back({i.first, i.second});
    
    return ans;
}


```
</details>
