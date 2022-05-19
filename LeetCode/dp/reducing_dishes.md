[1402. Reducing dishes](https://leetcode.com/problems/reducing-dishes/)

- to approach these type of question.
- one just have to see if there are chance of building some relation b/w states.
- you may get intution from kadane or similar type question.

<details> 
<summary> implementation 
</summary>

```cpp
class Solution {
    public:
    int maxSatisfaction(vector<int>& arr) {
        sort(arr.begin(), arr.end());
        if (arr.back() <= 0) return 0;
        int ans = 0, till = -1, sum = 0, mx = 0;
        for (int i = 0; i < arr.size(); i++) {
            mx += (arr[i] * (i + 1));
            sum += arr[i];
        }

        for (int i = 0; i < arr.size(); i++) {
            ans = max(ans, mx);
            mx -= sum;
            sum -= arr[i];
        }

        return ans;

    }
};
```

</details>

<details> 
<summary>
more concise
</summary>

```cpp
int maxSatisfaction(vector<int> &s) {
  sort(s.begin(), s.end());
  int n = s.size(), res = 0, sum = 0, ans = 0;
  for (int i = n - 1; i >= 0; i--) {
    ans += sum + s[i];
    sum += s[i];
    res = res > ans ? res : ans;
  }
  return res;
}
```

</details>
