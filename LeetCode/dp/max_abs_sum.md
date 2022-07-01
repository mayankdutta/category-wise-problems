[1749. Maximum Absolute Sum of Any Subarray](https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/)

- kadane's variation
- you should first try to relate this with kadane with pen and paper and with several test cases.

<details> 
<summary> Implementation 1 </summary>

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

    
<details> 
<summary> Implementation 2 </summary>

```cpp
class Solution {
    public:
    int maxAbsoluteSum(vector<int>& nums) {
        int sum1 = 0;
        int sum2 = 0;  
        
        int mx = INT_MIN;
        int mn = INT_MAX;
        
        for (int i = 0; i < nums.size(); i++) {
            sum1 = max(nums[i], sum1 + nums[i]);
            sum2 = min(nums[i], sum2 + nums[i]);
            mx = max(mx , sum1);
            mn = min(mn , sum2); 
        }         

        return max(mx , abs(mn));
    }
};
```

</details>
