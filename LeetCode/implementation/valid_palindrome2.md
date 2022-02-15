[680. Valid Palindrome II](https:/leetcode.com/problems/valid-palindrome-ii/)

- implementation type of problem.
- have to made choice only once.
  - if left != right, then either skip left or right.
- for readability, used recursion.

```cpp
class Solution {
    public:
    string s;
    bool isPalindrome(int l, int r) {
        for (l, r; l <= r; l++, r--)
            if (s[l] != s[r])
                return false;
        return true;
    }

    bool validPalindrome(string s) {
        this->s = s;
        int left = 0;
        int right = s.size() - 1;
        int count = 0;

        while (left <= right) {
            if (s[left] == s[right]) {
                left ++;
                right --;
            }
            else {
                if (s[left] != s[right]) {
                    return (isPalindrome(left + 1, right) or
                            isPalindrome(left, right - 1));
                }
            }
        }
        return true;
    }
};
```
