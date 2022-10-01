[2398. Maximum Number of Robots Within Budget](https://leetcode.com/problems/maximum-number-of-robots-within-budget/)

- typical sliding window question.
- same concept as of above question, might take little time to think.


```cpp
class Solution {
    public:
    int maximumRobots(vector<int> &times, vector<int> &costs, long long budget) {
        long long l = 0, j, sum = 0, n = times.size();

        multiset<int> st;
        long long ans = 0;

        for (int r = 0; r < n; ++r) {
            sum += costs[r];
            st.insert(times[r]);

            long long current_budget = (*st.rbegin()) + sum * (r - l + 1);
            if (l <= r && budget < current_budget) {
                sum -= costs[l];
                st.erase(st.find(times[l++]));
                current_budget = st.empty() ? 0 : (*st.rbegin()) + sum * (r - l + 1);
            }
            ans = max(ans, r - l + 1);
        }
        return ans;
    }
};

```
