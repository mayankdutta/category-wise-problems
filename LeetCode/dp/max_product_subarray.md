[152. Maximum Product Subarray ](https://leetcode.com/problems/maximum-product-subarray/), kadane's variant, medium

- will take help of two variable `mx`, `mn`.
- if we encounter any `-ve` element the of course their place will get switch.
- will proceed as kadane

<details> 

<summary> Code </summary>

```cpp
class Solution {
  public:
  int maxProduct(vector<int>& nums) {
    int mx, mn, ans;
    ans = mx = mn = nums.front();
    
    for (int i = 1; i < nums.size(); i++) {
      if (nums[i] < 0) swap(mx, mn);
      
      mx = max(nums[i], mx * nums[i]);
      mn = min(nums[i], mn * nums[i]);
      
      ans = max({ans, mx, mn});
    }
    
    return ans;
  }
};

```
</details>
