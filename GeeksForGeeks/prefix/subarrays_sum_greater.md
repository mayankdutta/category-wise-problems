[Number of subarrays having absolute sum greater than K ](https://www.geeksforgeeks.org/number-of-subarrays-having-absolute-sum-greater-than-k-set-2/)

###### similar to [1590. Make Sum Divisible by P ](/LeetCode/prefix/make_sum_divisible.md) and [Count of subarrays having sum equal to its length](/GeeksForGeeks/prefix/subarrays_sum_equals_length.md)

<details> 
<summary> Explanation </summary>

- You need to remember `subarray(i, j) = prefix(i) - prefix(j)`, where `i >= j`
- relation reduced to `prefix(j) <= prefix(i) - k`
- relation reduced to `prefix(j) + k <= prefix(i)`
- at each jth value apply upper bound to count the values
- **corner case**, count each number having `value >= k` individually.

</details>
