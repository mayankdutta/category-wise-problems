[128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

#### method 1

- O(nlogN) solution
- sort them
- erase duplicates if any(can be optimized further)
- start from certain element, check for his next.
- increment `i` pointer along with inner loop.

```cpp
class Solution {
    public:
    int longestConsecutive(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        int n = unique(nums.begin(), nums.end()) - nums.begin();
        nums.resize(n);
        
        int ans = 0; 

        for (int i = 0; i < nums.size(); i++) {
            int count = 1;
            while (i + 1 < nums.size() and nums[i + 1] == nums[i] + 1) 
                i++, count ++;
            ans = max(count, ans);
        }
        return ans;
    }
};
```

#### method 2

- O(n) solution
- push all elements in unordered set.
- while iterating in the array, check if we have `value - 1` is present in the set.
- if `YES` then we will start our calculation from there, because from there only we will be getting the maximum.
- if `NO` start finding from here.

```cpp
class Solution {
    public:
    int longestConsecutive(vector<int>& nums) {
        unordered_set<int> st(nums.begin(), nums.end());
        
        int n = nums.size();
        int ans = 0;
        for (int i = 0; i < n; i++) {
            if (st.find(nums[i] - 1) == st.end()) {
                int count = 1; 
                int temp = nums[i] + 1;
                while (st.find(temp) != st.end()) {
                    temp ++; 
                    count ++;
                }
                ans = max(ans, count);
            }
        }
        return ans;
    }
};
```

