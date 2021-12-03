[1358. Number of Substrings Containing All Three Characters](https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/), Medium, 2 pointers

### The atleast method

Approach
- slight different from at most one.
- just slight change

[some other approaches](https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/discuss/516979/C%2B%2B-Binary-Search-Solution)


<details> 
<summary> Code </summary>

```cpp
class Solution {
  public:
  int numberOfSubstrings(string s) {
    int a = 0; 
    int b = 0; 
    int c = 0;

    int left = 0; 
    int ans = 0;

    for (int right = 0; right < s.size(); right++) {
      a += (s[right] == 'a');
      b += (s[right] == 'b');
      c += (s[right] == 'c');

      while (a > 0 and b > 0 and c > 0) {
        a -= (s[left] == 'a');
        b -= (s[left] == 'b');
        c -= (s[left] == 'c');
        left ++;
      }
      ans += left;
    }
    
    return ans;
  }
};
```

</details> 
