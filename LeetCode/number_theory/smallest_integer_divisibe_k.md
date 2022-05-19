[1015. Smallest Integer Divisible by K](https://leetcode.com/problems/smallest-integer-divisible-by-k/)

- let the number be `n`.
- to keep 1 in no. keep adding multiplying like `n = n * 10 + 1`.
- to avoid memory limit to be exceeded keep modulating `n` with `k`.
- if we encounter any multiple of `k` we immediately will get 0.

<details> 
<summary> Code implementation </summary>

```cpp
class Solution {
public:
    int smallestRepunitDivByK(int k) {
        if (k % 2 == 0 or k % 5 == 0) return -1;

        long long int num = 1;
        int ans = 1;

        if (num % k == 0) return ans;

        while (num) {
            num = num * 10 + 1;
            num %= k;
            ans ++;
        }
        return ans;
    }
};
```
</details> 
