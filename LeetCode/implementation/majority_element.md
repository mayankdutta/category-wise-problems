[169 Majority element](https://leetcode.com/problems/majority-element/)

##### hashmap

- using map, quite simple

<details>
<summary>code implementation</summary>

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        unordered_map<int, int> mp;
        for (const auto& i: nums) mp[i] ++;
        int mx = 0;
        int ans = 0;
        for (const auto& [k, v]: mp) {
            if (mx < v) {
                mx = v;
                ans = k;
            }
        }
        return ans;
    }
};
```

</details>

##### moore

<details>
<summary>code implementation</summary>

- there has to be one ans.
- whoever occurring more, select that one.

```cpp
class Solution {
    public:
    int majorityElement(vector<int>& nums) {
        int major = nums[0];
        int count = 1;

        for (int i = 1; i < nums.size(); i++) {
            if (nums[i] == major) {
                count ++;
            }
            else if (count == 0) {
                major = nums[i];
                count = 1;
            }
            else {
                count --;
            }
        }
        return major;
    }
};
```

</details>

##### bits

- store every bit that is occurring more then n/2,
- since only one solution is possible.

<details>
<summary>code implementation</summary>

```cpp
class Solution {
    public:
    int majorityElement(vector<int>& nums) {
        int ans = 0;

        for (int mask = 0; mask < 32; mask++) {
            int curr = (1 << mask);
            int count = 0;

            for (const auto& i: nums)
                count += ((curr & i) != 0);

            if (count >= (nums.size() + 1)/2)
                ans |= curr;
        }
        return ans;
    }
};
```

</details>
