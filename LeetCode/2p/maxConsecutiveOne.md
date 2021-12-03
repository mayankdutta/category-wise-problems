[1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/), Medium, 2 pointers

### The atmost method
##### Approach 

- since we can switch up to `k` elements therefore we will prepare a sliding window of `k` size.
- meaning, we will trigger the internal while loop only when `count_of_zero > k`

<details> 
<summary> code </summary>

```cpp

int longestOnes(vector<int>& nums, int k) {
    int count = 0;
    int ans = 0;
    int l = 0;
    for (int r = 0; r < nums.size(); r++) {
      count += nums[r] == 0;
      while (count > k and l <= r) {
        count -= nums[l] == 0;
        l++;
      }
      ans = max(ans, r - l + 1);
    }
    return ans;
  }

```

</details>
