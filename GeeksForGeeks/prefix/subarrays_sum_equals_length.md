[Count of subarrays having sum equal to its length](https://www.geeksforgeeks.org/count-of-subarrays-having-sum-equal-to-its-length/)

[similar to](/LeetCode/prefix/make_sum_divisible.md)

<details> 
<summary> Explanation </summary>

- You need to remember `subarray(i, j) = prefix(i) - prefix(j)`
- relation reduced to `prefix(i) - prefix(j) = i - j`
- relation reduced to `prefix(i) - i = prefix(j) - j`
- count how much similar no.s present, apply `nC2`, as 2 distinct points make a subarray.
- **corner case**, count each one individually.

</details>
