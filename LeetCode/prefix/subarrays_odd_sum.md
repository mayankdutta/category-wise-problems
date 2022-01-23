[1524. Number of Sub-arrays With Odd Sum](https://leetcode.com/problems/number-of-sub-arrays-with-odd-sum/)

```cpp

class Solution {
    public:
    bool is_odd(const int &n) { return (n & 1); }
    bool is_even(const int &n) { return !(n & 1); }

    int numOfSubarrays(vector<int>& arr) {
        const int mod = 1e9 + 7;
        int n = arr.size();
        for (auto& i: arr) i %= 2;

        vector<int> even(n, 0), odd(n, 0);

        (is_even(arr.back())) ?
            even[n - 1] = 1 : odd[n - 1] = 1;

        for (int i = n - 2; i >= 0; i--) {
            if (is_even(arr[i])) {
                even[i] = even[i + 1] + 1;
                odd[i] = odd[i + 1];
            }
            else {
                odd[i] = even[i + 1] + 1;
                even[i] = odd[i + 1];
            }

            even[i] %= mod;
            odd[i] %= mod;
        }

        int sum = 0;
        for (const auto& i: odd)
            sum = (sum + i) % mod;

        return sum;

    }
};

```

```cpp
class Solution {
public:
    int numOfSubarrays(vector<int>& arr) {
        int res = 0, odd = 0, even = 0;
        for (auto x: arr) {
            even += 1;
            if (x % 2)
                swap(odd, even);
            res = (res + odd) % 1000000007;
        }
        return res;
    }
};
```
