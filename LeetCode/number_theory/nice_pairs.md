[1814. Count Nice Pairs in an Array](https://leetcode.com/problems/count-nice-pairs-in-an-array/)

- store the diff b/w new and old nos.
- `nCr` it.

<details>
<summary> Implementation </summary>

```cpp
using ll = long long int;
const int mod = int(1e9 + 7);

class Solution {
    public:

    int rev(int n){
        int revNum = 0;
        while(n) revNum = revNum * 10 + (n % 10), n /= 10;
        return revNum;
    }
    int countNicePairs(vector<int>& nums) {
        ll count = 0;
        map<int, ll> mp;
        for(const auto& num : nums) mp[num - rev(num)]++;
        for(const auto& pair : mp)
            count = (count + (pair.second * (pair.second - 1)) / 2) % mod;
        return count;
    }
};
```

</details>
