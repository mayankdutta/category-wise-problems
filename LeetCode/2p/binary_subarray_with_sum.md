[930. Binary Subarrays With Sum](https://leetcode.com/problems/binary-subarrays-with-sum/)

### method 1, fast
[concept used](/LeetCode/2p/maxConsecutiveOne.md)


### method 2

<details>
<summary> code </summary> 

```cpp
class Solution {
public:
    int numSubarraysWithSum(vector<int>& nums, int goal) {
        int n = nums.size(); 
        map<int, int> mp;
        
        int sum = 0; 
        int ans = 0;
        mp[0] = 1;
        
        for (int i = 0; i < n; i ++) {
            sum += nums[i];
            ans += mp[sum - goal];
            mp[sum] ++;
        }
        return ans;
    }
};
```
</details>
