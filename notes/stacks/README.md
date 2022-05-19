## leetcode [blog](https://leetcode.com/problems/sum-of-subarray-minimums/discuss/178876/stack-solution-with-very-detailed-explanation-step-by-step)

### Same concept applied in Max. Rectangle area.

##### 1. Initialization part.

```cpp
    int n = arr.size();
    stack<int> temp, st;
    vector<int> previous_less(n), next_less(n);

    /*
     * default values
     * values will change if calculating previous_Greater or previous_Lesser.
     */
    for (int i = 0; i < arr.size(); i++) {
      previous_less[i] = -1;
      next_less[i] = arr.size();
    }


```

##### 2. To calculate previous less

```cpp
    // for previous less
    for (int i = 0; i < n; i++) {

      // you might want to change >= to > according to your need.
      while (!st.empty() && arr[st.top()] >= arr[i])
        st.pop();
      previous_less[i] = st.empty() ? -1 : st.top();
      st.push(i);
    }
```

##### 3. To calculate next less

```cpp
    std::swap(temp, st); // for emptying stack.

    // for next less
    for (int i = 0; i < n; i++) {
      // you might want to change >= to > according to your need.
      while (!st.empty() && arr[st.top()] >= arr[i]) {
        auto x = st.top();
        st.pop();
        next_less[x] = i;
      }
      st.push(i);
    }
```

##### or

```cpp
    std::swap(temp, st); // for emptying stack.

    // for next less
    for (int i = n - 1; i >= 0; i--) {
      while (!st.empty() && arr[st.top()] >= arr[i])
        st.pop();
      next_less[i] = st.empty() ? n : st.top();
      st.push(i);
    }
```

##### 4. Final calculation

```cpp

    int ans = 0;
    for (int i = 0; i < arr.size(); i++)
      ans = max(ans, (next_less[i] - previous_less[i] - 1) * arr[i]);

    return ans;

```
