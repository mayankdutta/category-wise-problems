[1590. Make Sum Divisible by P](https://leetcode.com/problems/make-sum-divisible-by-p/)

```js
Proof for those who want a mathematical explanation:
Let pre[] be the prefix sum array,
then pre[i] is running prefix sum or prefix sum of i elements,
pre[j] is the prefix sum such that pre[i]-pre[j] is the subarray we need to remove to make pre[n] (sum of all elements) divisible by p

(pre[n] - (pre[i]-pre[j])) % p = 0 ... (remove a subarray to make pre[n] divisible by p)
=> pre[n] % p = (pre[i]-pre[j]) % p ... ((a-b)%m = a%m - b%m)
=> pre[j]%p = pre[i]%p - pre[n]%p ... (same property used above)
since RHS can be negative we make it positive modulus by adding p and taking modulus
=> pre[j]%p = (pre[i]%p - pre[n]%p + p) % p
```

<details>
<summary>
c++ implementation
</summary>

```cpp
using ll = long long int;
class Solution {
    public:
    int minSubarray(vector<int>& nums, int p) {
        vector<ll> prefix(1, nums.front() % p);
        for (int i = 1; i < nums.size(); i++) {
            prefix.push_back(nums[i] + prefix[i - 1]);
            prefix[i] %= p;
        }

        map<ll, ll> mp;
        mp[0] = -1;
        ll need = prefix.back() % p;
        ll ans = INT_MAX;

        for (int i = 0; i < nums.size(); i++) {
            mp[prefix[i]] = i;
            ll want = (prefix[i] - need + p) % p;

            if (mp.count(want)) {
                ans = min(ans, i - mp[want]);
            }
        }

        if (ans >= nums.size()) return -1;
        if (ans == INT_MAX) return -1;
        return ans;
    }
};
```

</details>

<details>
<summary>
Java implementation
</summary>

```java
class Solution {
    public int minSubarray(int[] nums, int p) {
        int need = 0;
        for (int i = 0; i < nums.length; i++)
            need = (need + nums[i] % p) % p;


        int currentSum = 0;
        int ans = Integer.MAX_VALUE;

        Map<Integer, Integer> storePrefixSum = new HashMap<>();
        storePrefixSum.put(0, -1);

        for (int i = 0; i < nums.length; i++) {
            currentSum = (currentSum + nums[i] % p) % p;
            storePrefixSum.put(currentSum, i);

            int want = (currentSum -  need + p) % p;
            if (storePrefixSum.containsKey(want))
                ans = Math.min(ans, i - storePrefixSum.get(want));
        }

        if (ans == Integer.MAX_VALUE) return -1;
        if (ans >= nums.length) return -1;
        return ans;
    }
}
```

</details>
