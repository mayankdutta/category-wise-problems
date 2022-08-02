[#46 Permutations](https://leetcode.com/problems/permutations/)

#### General Solution

- general pick non-pick kind of solution.
- same trick works in N-Queen type of problems.

<details>
<summary> Implementation </summary>

```cpp

class Solution {
public:
    vector<int> nums;
    vector<int> arr;
    map<int, bool> used;
    vector<vector<int>> ans;

    void fun(int i) {
        if (i == nums.size()) {
            ans.push_back(arr);
        }

        for (int j = 0; j < nums.size(); j++) {
            if (!used[j]) {
                used[j] = true;
                arr.push_back(nums[j]);

                fun(i + 1);

                used[j] = false;
                arr.pop_back();
            }
        }
    }

    vector<vector<int>> permute(vector<int>& nums) {
        this->nums = nums;
        fun(0);
        return ans;
    }
};

```

</details>

#### Optimized.

- instead of marking it `used`, we have swapped it to the element before the `i`.
- later when our work happen to be incomplete we swapped it back, to not lose any data.

<details>
<summary> Implementation </summary>

```cpp
class Solution {
    public:
    vector<int> nums;
    vector<vector<int>> ans;

    void fun(int i) {
        if (i == nums.size()) {
            ans.push_back(nums);
            return;
        }

        for (int j = i; j < nums.size(); j++) {
            swap(nums[j], nums[i]);
            fun(i + 1);
            swap(nums[j], nums[i]);
        }
    }

    vector<vector<int>> permute(vector<int>& nums) {
        this->nums = nums;
        fun(0);
        return ans;
    }
};

```

</details>
