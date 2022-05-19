[481 - What goes up](https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=651&page=show_problem&problem=422)

- Classic problem to calculate LIS
- Required time is O(NlogN)
- Appraoch (to be added)
- Increasing sequence was also asked.

<details>
<summary>Code sample</summary>

```cpp
 vector<int> getSeq(int start, vector<int> parent, vector<int> arr) {
     vector<int> ans;
     ans.push_back(arr[start]);
     while (parent[start] >= 0) {
         start = parent[start];
         ans.push_back(arr[start]);
     }
     reverse(ans.begin(), ans.end());
     return ans;
 }

 int main() {
     int n;
     vector<int> arr;
     while (cin >> n)
     arr.push_back(n);

     n = arr.size();
     vector<int> parent(2 * n + 1), trackNum, trackIndex;
     int parentSize = 0;

     for (int i = 0; i < n; i++) {
     int pos = lower_bound(trackNum.begin(), trackNum.end(), arr[i]) -
     trackNum.begin();

         if (pos >= trackNum.size()) {
           trackNum.push_back(arr[i]);
           trackIndex.push_back(i);
           parentSize = max(parentSize, i);
         } else {
           trackNum[pos] = arr[i];
           trackIndex[pos] = i;
         }
         parent[i] = pos ? trackIndex[pos - 1] : -1;
     }

     auto ans = getSeq(parentSize, parent, arr);
     cout << ans.size() << '\n';
     cout << "-\n";
     for (const auto &i : ans)
     cout << i << '\n';
 }
```

</details>
