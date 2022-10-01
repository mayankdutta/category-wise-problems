[42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

- for every block
- we going to calculate maximum to it's left and to it's right. 
- we want to see how much water block can store **ABOVE ITSELF.**
- for that we will also have to subtract the height of the block itself. 

<details>
<summary> implementation </summary>

```cpp
#define vi vector<int> 

class Solution {
    public:
    int trap(vector<int>& height) {
        int n = height.size();
        
        vi mx_left(n);
        vi mx_right(n);
        
        mx_left[0] = height[0]; 
        mx_right[n - 1] = height[n - 1];
        
        for (int i = 1; i < n; i++) {
            mx_left[i] = max(height[i], mx_left[i - 1]);
        }
        
        for (int i = n - 2; i >= 0; i--) {
            mx_right[i] = max(height[i], mx_right[i + 1]);
        }
        
        int ans = 0; 
        for (int i = 0; i < n; i++) {
            ans += min(mx_left[i], mx_right[i]) - height[i];
        }
        
        return ans;
    }
};

```
</details>
