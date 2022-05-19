[435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)

- sorted as per the ending one.
- if some index overlapping, 
  - i.e. starting of that interval occurring before the ending of previous one.
- we will skip that, and count how many such intervals exist.

<details>
<summary> correct approach </summary>

```cpp
 int eraseOverlapIntervals(vector<vector<int>>& intervals) {
        vector<pair<int, int>> arr;
        for (const auto& i: intervals)
            arr.push_back({i[0], i[1]});

        sort(arr.begin(), arr.end(), [](const auto& one, const auto& two) -> bool {
            if (one.second == two.second )  return one.first < two.first ;
            return one.second < two.second;
        });

        int mx = 0;
        int count = 0;
        int curr = 0;
        int n = arr.size();

        for (int i = 1; i < n; i++) {
            (arr[i].first < arr[curr].second) ?
                count ++ : 
                curr = i;
        }
        return count;
    }
```

</details>



- similar approach but won't work
- this calculate maximum overlapping that there is, **won't calculate how many !!**

<details>
<summary>  failed approach </summary>

```cpp
int eraseOverlapIntervals(vector<vector<int>>& intervals) {
    vector<pair<int, int>> arr;
    for (const auto& i: intervals) {
        arr.push_back({i[0], 1});
        arr.push_back({i[1], 0});
    }
    
    sort(arr.begin(), arr.end());
    int mx = 0;
    int count = 0;
    for (const auto& i: arr) {
        (i.first == 1) ?
            count ++:
            count --;
        
        mx = max(mx, count);
    }
    
    return  mx- 1;
        
    
}
```
</details>

