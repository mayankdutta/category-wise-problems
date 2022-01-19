[2134. Minimum Swaps to Group All 1's Together II](https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii/)

- basic two pointer question. 
- just visualize the final picture of the array, all the ones together. 
- if all the ones will have to come together, then simply evaluate a sliding window of total_one's size.
- count the zeroes in b/w and record it's minimal value. 
- after all we will have to fill all 0's with 1's.

<details>
<summary> code implementation </summary>

```cpp
class Solution {
    public:
    int minSwaps(vector<int>& nums) {
        vector<int> arr(nums);
        int n = arr.size();
        int k = count(arr.begin(), arr.end(), 1);

        int count = 0;

        for (int i = 0; i < k; i++)
            count += (arr[i] == 0);

        int ans = count;
        for (int i = k; i < n + k; i++) {
            count -= (arr[i - k] == 0);
            count += (arr[i % n] == 0);
            ans = min(ans, count);
        }
        return ans;
    }
};
```

</details>
