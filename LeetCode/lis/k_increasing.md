[2111. Minimum Operations to Make the Array K-Increasing](https://leetcode.com/contest/weekly-contest-272/problems/minimum-operations-to-make-the-array-k-increasing/)

- observe and find the pattern
- you will be then finding the LIS pattern.

<details>
<summary> code </summary>

```cpp

/* implementation of LIS */
int lis(const vector<int>& arr) {
    int n = arr.size();
    vector<int> trackNum, trackIndex, parent(2 * arr.size(), 0);
    int lis_end = 0; 
    for (int i = 0; i < n; ++i) {
        int pos = upper_bound(trackNum.begin(), trackNum.end(), arr[i]) - trackNum.begin();
        if (pos >= trackNum.size()) {
            trackNum.push_back(arr[i]);
            trackIndex.push_back(i);
            lis_end = max(lis_end, i);
        } else {
            trackNum[pos] = arr[i];
            trackIndex[pos] = i;
        }
        parent[i] = pos ? trackIndex[pos - 1] : -1;
    }
    return trackNum.size();
}

/* real code */
int kIncreasing(vector<int>& arr, int k) {
    int ans = 0;
    int n = arr.size();
    for (int i = 0; i < k; i++) {
        vector<int> temp;
        for (int j = i; j < n; j += k) 
            temp.push_back(arr[j]);
        int count = lis(temp);
        ans += int(temp.size()) - count;
    }
        return ans;
}
```
</details>
