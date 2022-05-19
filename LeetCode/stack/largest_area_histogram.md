[84. Largest Rectangle in Histogram ](https://leetcode.com/problems/largest-rectangle-in-histogram/)

[refer to notes please](/notes/stacks/README.md)

- The largest rectangle must have the same height as the shortest bar that it contains.
- For each i, consider the largest rectangle with height H[i] such that bar i is the shortest bar it contains.
- The answer is simply the largest of these N rectangles.
- Since the heights of these rectangles are fixed, we just want them to be as wide as possible.
- Notice how the rectangle of bar $i$ is bounded by the closest shorter bars on each side of bar `i`.
- _(or the ends of the histogram if these bars don't exist)._
- We can use a monotone stack twice to find the closest shorter bars on each side of each bar.

also refer to [notes](/notes/stacks/)

<details> 
<summary> implementation </summary>

```cpp
class Solution {
    public:
    int largestRectangleArea(vector<int>& arr) {
        int n = arr.size();
        stack<int> temp, st;
        vector<int> previous_less(n), next_less(n);

        for (int i = 0; i < arr.size(); i++) {
            previous_less[i] = -1;
            next_less[i] = arr.size();
        }

        // for previous less
        for (int i = 0; i < n; i++) {
            while (!st.empty() && arr[st.top()] >= arr[i])
                st.pop();
            previous_less[i] = st.empty() ? -1 : st.top();
            st.push(i);
        }

        std::swap(temp, st);

        // for next less
        for (int i = n - 1; i >= 0; i--) {
            while (!st.empty() && arr[st.top()] >= arr[i])
                st.pop();
            next_less[i] = st.empty() ? n : st.top();
            st.push(i);
        }

        int ans = 0;
        for (int i = 0; i < arr.size(); i++)
            ans = max(ans, (next_less[i] - previous_less[i] - 1) * arr[i]);

        return ans;

    }
};
```

<details>

<details> 
<summary> implementation </summary>

```cpp
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        int n = heights.size();
        stack<int> st;
        vector<int> ans(n, 0);
        for (int i = 0; i < n; i++) {
            while (!st.empty() and heights[st.top()] >= heights[i])
                st.pop();
            int width = i - (st.empty() ? -1 : st.top());
            ans[i] = width * heights[i];
            st.push(i);
        }
        while (!st.empty()) st.pop();
        for (int i = n - 1; i >= 0; i--) {
            while (!st.empty() and heights[st.top()] >= heights[i])
                st.pop();
            int width = (st.empty() ? n : st.top()) - 1 - i;
            ans[i] += width * heights[i];
            st.push(i);
        }
        return *max_element(ans.begin(), ans.end());
    }
};
```

<details>
