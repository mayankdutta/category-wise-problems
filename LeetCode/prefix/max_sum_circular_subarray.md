##### [918. Maximum Sum Circular Subarray](https://leetcode.com/problems/maximum-sum-circular-subarray/)

- kadane's variant
- note that to calculate the maximum ans.

  ```js

    let say we are to choose positive no.s and they are in following order.
    startng from 'S' and ending at 'E'
    PPPP NNNNN PPPP
    -->E       S---->

    indirectly we want to have all 'P' OR we can say we want all values but not 'N'
    therefore why not just calculate value of 'N' then subtract from overall 'SUM'.
  ```

- Algorithm

  ```js
    PPPP NNNNN PPP

    invert the array

    NNNN PPPPP NNN

    apply kadane
    get MAX VALUE

    it is MIN VALUE(in disguise)

    sum - MIN VALUE
  ```

<details>
<summary> implementation 1 </summary>

```cpp
class Solution {
    public:
    int kadane(const vector<int>& arr) {
        int sum = 0;
        int ans = INT_MIN;
        for (const auto &i: arr) {
            sum = max(i, sum + i);
            ans = max(ans, sum);
        }
        return ans;
    }

    int maxSubarraySumCircular(vector<int>& nums) {
        int n = nums.size();

        int ans1 = kadane(nums);

        bool neg = true;
        bool pos = true;
        int sum = 0;

        for (int& i: nums) {
            sum += i;
            i *= -1;
            if (i < 0) pos = false;
            if (i > 0) neg = false;
        }

        if (neg || pos) {
            return ans1;
        }

        int ans2 = -1 * kadane(nums);
        printf("%d, %d\n", ans1, ans2);
        return max(ans1, sum - ans2);

    }
};
```

</details>

<details> 
<summary> implementation 2 </summary>

```cpp
class Solution {
    public:
    int maxSubarraySumCircular(vector<int>& nums) {
        int sum = 0;
        int sum1 = 0;
        int sum2 = 0;

        bool neg = true;
        bool pos = true;

        int mx = INT_MIN;
        int mn = INT_MAX;

        for (const auto &i: nums) {
            sum1 = max(i, sum1 + i);
            sum2 = min(i, sum2 + i);

            mx = max(mx, sum1);
            mn = min(mn, sum2);

            sum += i;
            if (i < 0) pos = false;
            if (i > 0) neg = false;
        }

        if (neg || pos) {
            return mx;
        }

        return max(mx, sum - mn);
    }
};

```

</details>
