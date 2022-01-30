[1835. Find XOR Sum of All Pairs Bitwise AND ](https://leetcode.com/problems/find-xor-sum-of-all-pairs-bitwise-and/)

##### method 1

- property of XOR: `(a AND b) XOR (a AND c) == a AND (b XOR c)`
- try to frame problem in above property.

<details>
<summary>
implementation
</summary>

```cpp
class Solution {
public:
    int getXORSum(vector<int>& arr1, vector<int>& arr2) {
        using ll = long long int;
        ll one = 0;
        ll two = 0;
        for (auto& i: arr1) one ^= i;
        for (auto& i: arr2) two ^= i;
        return (one & two);
    }
};
```

</details>

##### method 2
