[283. Move zeros](https://leetcode.com/problems/move-zeroes/)

- more of a implementation type problem

<details>
<summary> naive type implementation </summary>

```cpp
class Solution {
    public:
    void moveZeroes(vector<int>& nums) {
        vector<int> ans;
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i]) {
                ans.push_back(nums[i]);
            }
            else {
                count ++;
            }

        }
        while (count--) ans.push_back(0);
        swap(ans, nums);

    }

};

```

</details>

<details>
<summary> more concise </summary>

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i]) {
                nums[j++] = nums[i];
            }
        }

        for (; j < nums.size(); j++) {
            nums[j] = 0;
        }

    }
};
```

</details>
