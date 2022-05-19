[229. Majority Element II](https://leetcode.com/problems/majority-element-ii/)

<details>
<summary> hash map </summary>

```cpp
class Solution {
    public:
    vector<int> majorityElement(vector<int>& nums) {
        map<int, int> mp;
        for (const auto& i: nums) mp[i] ++;

        vector<int> ans;
        for (const auto& [k, v]: mp)
            if (v > (nums.size()) / 3)
                ans.push_back(k);
        return ans;
    }

};

````

</details>


##### moore

- either ans can one number or two number
- can't be greater then size two.
- and with moore analysis we have got two most occurring elements.

<details>
<summary> moore </summary>

```cpp
class Solution {
    public:
    vector<int> majorityElement(vector<int>& nums) {
        int count1 = 0, count2 = 0, a = 0, b = 1;

        for (auto n : nums) {
            if (a == n) {
                count1++;
            } else if (b == n) {
                count2++;
            } else if (count1 == 0) {
                a = n;
                count1 = 1;
            } else if (count2 == 0) {
                b = n;
                count2 = 1;
            } else {
                count1--;
                count2--;
            }
        }

        count1 = count2 = 0;
        for (const auto &i : nums) {
            if (i == a)
                count1++;
            else if (i == b)
                count2++;
        }

        vector<int> res;
        if (count1 > nums.size() / 3)
            res.push_back(a);
        if (count2 > nums.size() / 3)
            res.push_back(b);
        return res;

    }
};

````

</details>
