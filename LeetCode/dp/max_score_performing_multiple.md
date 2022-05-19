[1770. Maximum Score from Performing Multiplication Operations](https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/)

#### Top down implementation

###### some key points:

- do not pass in the parameter the calculated value let it be store in memo.

  ```js
  fun(int index, int value) WRONG, this will confuse the states of dp
  fun(int index) LET VALUE BE IN MEMO.

  ```

- try to pass only states in function, let others be declared globally.
  - this will help in converting `memo -> tabular`.
- try to reduce the states as much as possible, for example in the above question, `r` can be reduced.

###### Approach

- Since we're doing top-down, we need to decide on two things for our function DP.
- What state variables we need to pass to it, and what it will return.
- We are given two input arrays: nums and multipliers. The problem says we need to do m operations, and on the ith.
- operation, we gain score equal to multipliers[i] times a number from either the left or right end of nums,
- which we remove after the operation. That means we need to know 3 things for each operation:
- suppressing our states.
  - It may seem like we need all 3 of these state variables, but we can formulate an equation for one of them using the other two.
  - If we know how many elements we have picked from the leftside, left, and we know how many elements we have picked in total, i,
  - then we know that we must have picked `i - left` elements from the rightside.
  - The original length of nums is n, which means the index of the rightmost element is `right = n - 1 - (i - left)`
  - Therefore, we only need 2 state variables: i and left, and we can calculate right inside the function.

<details>
<summary> Wrong Implementation </summary>

```cpp

#define vvi vector<vector<int>>
#define vi vector<int>
class Solution {
public:
vvi dp;
int n, m;
vector<int> nums, multipliers;

    int fun(int i, int l, int r) {
        // printf("%d %d %d \n", i, l, r);
        if (i >= m) return 0;
        if (l > r) return 0;

        int &one = dp[i][l];
        int &two = dp[i][r];

        if (one != -1 and two != -1) return max(one, two);
        else if (one == -1 and two != -1) return two;
        else if (one != -1 and two == -1) return one;

        else {
            int one = fun(i + 1, l + 1, r) + nums[l] * multipliers[i];
            int two = fun(i + 1, l, r - 1) + nums[r] * multipliers[i];
            return max(one, two);
        }
    }

    int maximumScore(vector<int>& nums, vector<int>& multipliers) {
        n = nums.size();
        m = multipliers.size();

        this -> nums = nums;
        this -> multipliers = multipliers;

        dp = vvi(m + 1, vi(n + 1, -1));

        return fun(0, 0, n - 1);
    }

};

```

</details>

<details> 
<summary> Top-Down implementation </summary>

```cpp

class Solution {
public:
vector<vector<int>> dp;
int n, m;
vector<int> nums, multipliers;

    int fun(int i, int l) {
        if (i >= m) return 0;

        int r = (n - 1) - (i - l);
        if (l > r) return 0;

        int &ans = dp[i][l];
        if (ans != -1) return ans;

        ans = max(fun(i + 1, l + 1) + nums[l] * multipliers[i],
                  fun(i + 1, l) + nums[r] * multipliers[i]);
        return ans;
    }

    int maximumScore(vector<int>& nums, vector<int>& multipliers) {
        n = nums.size();
        m = multipliers.size();

        this -> nums = nums;
        this -> multipliers = multipliers;

        dp = vector<vector<int>> (m + 1, vi(m + 1, -1));

        return fun(0, 0);
    }

};

```

</details>

#### Bottom up implementation

- it is often harder to implement, because the order in which we iterate needs to be precise.
- we need to iterate backwards starting from m (because the base case happens when i equals m).
- We also need to initialize DP with one extra row so that we don't go out of bounds in the first iteration of the outer loop.
- Try to apply loops in such a way to keep minimise distance from the `BASE CASES`, we have to build the solution upon the base case.

<details>
<summary> code implementation </summary>

```cpp

class Solution {
    public:
    int maximumScore(vector<int>& nums, vector<int>& multipliers) {
        int n = nums.size();
        int m = multipliers.size();

        vector<vector<int>> dp(m + 1, vector<int>(m + 1, 0));

        for (int i = m - 1; i >= 0; i--) {
            for (int left = i; left >= 0; left --) {
                int right = (n - 1) - (i - left);
                dp[i][left] = max(dp[i + 1][left + 1] + nums[left] * multipliers[i],
                                  dp[i + 1][left]     + nums[right] * multipliers[i]);
            }
        }
        return dp[0][0];
    }
};


```

</details>
