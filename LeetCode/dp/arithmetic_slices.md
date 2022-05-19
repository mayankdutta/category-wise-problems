[413. Arithmetic Slices](https://leetcode.com/problems/arithmetic-slices/)

#### Brute

<details>
<summary> implementation </summary>

```cpp
class Solution {
    public:
    int numberOfArithmeticSlices(vector<int>& arr) {
        int ans = 0;
        for (int i = 0; i < arr.size(); i++) {
            int diff = INT_MAX;

            for (int j = i; j > 0; j--) {
                if (i - j + 1 < 2) {
                    if (diff == INT_MAX)
                        diff = arr[j] - arr[j - 1];
                    else if (diff != arr[j] - arr[j - 1])
                        break;

                }
                else {
                    if (diff == arr[j] - arr[j - 1])
                        ans ++;
                    else
                        break;

                }
            }
        }
        return ans;
    }
};

```

</details>

#### DP

<details>
<summary> implementation </summary>

```cpp
class Solution {
    public:
    int numberOfArithmeticSlices(vector<int>& arr) {
        if (arr.size() <= 2)
            return 0;

        vector<int> dp(arr.size(), -1);

        dp[1] = 0;

        for (int i = 2; i < arr.size(); i++) {
            if (arr[i] - arr[i - 1] == arr[i - 1] - arr[i - 2])
                dp[i] = dp[i - 1] + 1;
            else
                dp[i] = 0;

        }

        int ans = 0;
        for (const auto& i: dp)
            if (i >= 0)
                ans += i;

        return ans;
    }
};
```

</details>

#### DP with state compression

<details>
<summary> implementation </summary>

```cpp
class Solution {
    public:
    int numberOfArithmeticSlices(vector<int>& arr) {
        if (arr.size() <= 2)
            return 0;

        int ans = 0;
        int prev = 0;

        for (int i = 2; i < arr.size(); i++) {
            if (arr[i] - arr[i - 1] == arr[i - 1] - arr[i - 2]) {
                prev += 1;
                ans += prev;
            }
            else  {
                prev = 0;
            }
        }

        return ans;
    }
};
```

</details>
