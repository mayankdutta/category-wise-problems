[477. Total Hamming Distance](https://leetcode.com/problems/total-hamming-distance/)

- hammering distance is always b/w two integers.
- take XOR of them and count the set bits.
- but here this will give a TLE.
- therefore this time, we will take every place from `0 -> 31`.
- will count `noOfZeroes` and `noOfOnes`.
- and hence `noOfZeroes * noOfOnes` ones will be there if XOR is taken.



```cpp
class Solution {
  public:
    int totalHammingDistance(vector<int>& nums) {
      int ans = 0; 
      for (int i = 0; i < 32; i++) {
        int mask = (1 << i);

        int countZero = 0; 
        int countOne = 0;

        for (const auto& num: nums) 
          mask & num ? countOne ++ : countZero ++;

        ans += (countOne * countZero);
      }
      return ans;
    }
};
```
