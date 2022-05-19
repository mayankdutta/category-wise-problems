[992. Subarrays with K Different Integers](https://leetcode.com/problems/subarrays-with-k-different-integers/) Hard, 2 pointers

### atmost(k) - atmost(k - 1) method

Approach 
- `atMost` concept used here.
- using 2 pointer we cant find the **exact** thing, for that we have to tweak something like `atMost(k) - atMost(k - 1)`
- for better [visualization](https://leetcode.com/problems/subarrays-with-k-different-integers/discuss/523136/JavaC%2B%2BPython-Sliding-Window), check comments.


<details> 
<summary> Code </summary>

```cpp

  int atMost(const vector<int> &nums, const int &k) {
    if (k == 0)
      return 0;
    map<int, int> mp;
    int left = 0, right = 0, ans = 0;

    for (int right = 0; right < nums.size(); right++) {
      mp[nums[right]]++;
      while (left <= right and mp.size() > k) {
        mp[nums[left]]--;
        if (mp[nums[left]] == 0)
          mp.erase(mp.find(nums[left]));
        left++;
      }
      ans += (right - left + 1);
    }
    return ans;
  }

  int subarraysWithKDistinct(vector<int> &nums, int k) {
    return atMost(nums, k) - atMost(nums, k - 1);
  }


```
</details> 
