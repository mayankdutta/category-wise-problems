[198. House Robber ](https://leetcode.com/problems/house-robber/)

### map to approach the problem

1. first find the state of the problem
2. then recurrence relation
3. and finally base case.

<details>
  <summary>state of the problem</summary> 
  
  - First, we need to decide on state variables. As a reminder, state variables should be fully capable of describing a scenario. Imagine if you had this scenario in real life - you're a robber and you have a lineup of houses. If you are at one of the houses, the only variable you would need to describe your situation is an integer - the index of the house you are currently at. Therefore, the only state variable is an integer, say `i`, that indicates the index of a house.
  - The problem is asking for _"the maximum amount of money you can rob"_. Therefore, we would use either a function dp(i) that returns the maximum amount of money you can rob up to and including house i, or an array dp where dp[i] represents the maximum amount of money you can rob up to and including house i.
  - This means that after all the subproblems have been solved, `dp[i]` and `dp(i)` both return the answer to the original problem for the subarray of nums that spans 00 to i inclusive. To solve the original problem, we will just need to return `dp[nums.length - 1]` or `dp(nums.length - 1)`, depending if we do bottom-up or top-down.
</details>

<details> 
<summary>recurrence relation </summary>

- Next, we need to find a recurrence relation, which is typically the hardest part of the problem. For any recurrence relation, a good place to start is to think about a general state (in this case, let's say we're at the house at index \text{i}i), and use information from the problem description to think about how other states relate to the current one.
- If we are at some house, logically, we have 2 options: we can choose to rob this house, or we can choose to not rob this house.
- If we decide not to rob the house, then we don't gain any money. Whatever money we had from the previous house is how much money we will have at this house - which is `dp(i - 1)`.
- If we decide to rob the house, then we gain `nums[i]` money. However, this is only possible if we did not rob the previous house. This means the money we had when arriving at this house is the money we had from the previous house without robbing it, which would be however much money we had 2 houses ago, `dp(i - 2)`. After robbing the current house, we will have `dp(i - 2) + nums[i]` money.
- From these two options, we always want to pick the one that gives us maximum profits. Putting it together, we have our recurrence relation:

```cpp
dp(i - 1), dp(i - 2) + nums[i]})dp(i)=max(dp(i - 1), dp(i - 2) + nums[i])
```

</details>

<details> 
<summary> base case </summary>

- The last thing we need is base cases so that our recurrence relation knows when to stop. The base cases are often found from clues in the problem description or found using logical thinking. In this problem, if there is only one house, then the most money we can make is by robbing the house (the alternative is to not rob the house). If there are only two houses, then the most money we can make is by robbing the house with more money (since we have to choose between them). Therefore, our base cases are:

```cpp
dp(0) = nums[0]
dp(1)=max(nums[0], nums[1])
```

</details>

###### don't be in hurry you should read twice thrice before seeing implementation.

<details>
<summary> code implementation </summary>

```cpp
class Solution {
public:
    int rob(vector<int>& nums) {
        int n = nums.size();
        if (n == 1) return nums.front();
        if (n == 2) return max(nums[0], nums[1]);

        vector<int> dp(n + 1, 0);
        dp[0] = nums[0];
        dp[1] = max(nums[1], nums[0]);

        for (int i = 2; i < n; i++) {
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i]);
        }
        return dp[n - 1];
    }
};

```

</details>
