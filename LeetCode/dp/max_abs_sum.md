[1749. Maximum Absolute Sum of Any Subarray](https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/)

- kadane's variation
- you should first try to relate this with kadane with pen and paper and with several test cases.

<details> 
<summary> code implementation </summary>

```cpp
class Solution {
public:
    int kadane(vector<int>& arr) {
        int sum = 0; int best = 0;
        for (const auto& i: arr) {
            sum = max(sum + i, i);
            best = max(best, sum);
        }
        return best;
    }
    int maxAbsoluteSum(vector<int>& nums) {
        int one = kadane(nums);
        for (auto& i: nums) i *= -1;
        int two = kadane(nums);
        return max(one, two);
    }
};

```

</details>
