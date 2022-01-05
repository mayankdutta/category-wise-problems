[2121. Intervals Between Identical Elements](https://leetcode.com/problems/intervals-between-identical-elements/), medium, prefix sums.

**NOTE** <br>
prefix sums is structured in index form rather then value form.
you might have seen prefix sum like

```cpp
  for (int i = 1; i < n; i++) 
    prefix[i] = prefix[i - 1] + arr[i];
```

whereas this will be

```cpp
  for (int i = 1; i < n; i++) 
    prefix[arr[i]] = prefix[arr[i - 1]] + something.
```
_notice we are storing values at the value of that array_


### Approach 
- we first maintained the count of indexes of the same elements through a map.
- now we have our data in organized form, only counting all the differences is remaining. 
- we wish to count the absolute differences in optimize way `O(n)`. _(can be extended in `O(n^2)`)_.
- lets say for the element 1 is repeating @index `0, 2, 4, 5, 6`.
- and by some means we have distance of `4` from `0, 2`.
- we would like to extend this for `5`.
  - so, we will have to extend for `0 -- 4 -> 5`.
  - so, we will have to extend for `2 -- 4 -> 5`.
  - so, we will have to extend for `4 -- 4 -> 5`.
  - or, we will have to extend for all **the elements smaller** then `4`. means `3 times`.
  - and, we will have to extend **them by** `5 - 4`.

in generalise form
```js
      prefix[current_element] = prefix[previous_element] + 
                                (elements_to_the_left)   * 
                                (current_element - previous_element)
```

**We will then prepare a prefix array and suffix array to maintain this value from both sides.**



<details> 
<summary> implementation of the same </summary>

```cpp

vector<long long> getDistances(vector<int>& arr) {
    map<int, vector<int>> mp; 
    int n = arr.size();
    for (int i = 0; i < n; i++) 
        mp[arr[i]].push_back(i);

    vector<long long> prefix(n, 0), suffix(n, 0);
    for (const auto& [key, value]: mp) {
        for (int i = 1; i < value.size(); i++) {
            int diff = value[i] - value[i - 1];
            int elements_to_left = i;
            prefix[value[i]] = prefix[value[i - 1]] + elements_to_left * diff;
        }
        for (int i = value.size() - 2; i >= 0; i--) {
            int diff = value[i + 1] - value[i];
            int elements_to_right = (value.size() - i - 1);
            suffix[value[i]] = suffix[value[i + 1]] + elements_to_right * diff;
        }
    }

    vector<long long> ans; 
    for (int i = 0; i < n; i++) 
        ans.push_back(prefix[i] + suffix[i]);
    return ans;
}

```
</details> 
