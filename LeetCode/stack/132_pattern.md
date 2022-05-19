[456. 132 Pattern](https://leetcode.com/problems/132-pattern/)

[refer to notes please](/notes/stacks/README.md)

```cpp
class Solution {
public:
    bool find132pattern(vector<int>& nums) {
        int n = nums.size();
        vector<int> mins(n, INT_MAX);

        mins[0] = nums[0];
        for (int i = 1; i < n; i++)
            mins[i] = min(mins[i - 1], nums[i]);

        stack<int> st;
        int curr = INT_MIN;
        for (int i = n - 1; i >= 1; i--) {
            while (!st.empty() and nums[i] > st.top()) {
                curr = max(curr, st.top());
                st.pop();
            }

            if (curr < nums[i] and mins[i - 1] < curr)  {
                cout << mins[i - 1] << ' ' << curr << ' ' << nums[i] << '\n';
                return true;

            }

            st.push(nums[i]);
        }
        return false;

    }
};
```
