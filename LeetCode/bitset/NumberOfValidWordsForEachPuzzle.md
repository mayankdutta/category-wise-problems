[1178. Number of Valid Words for Each Puzzle](https://leetcode.com/problems/number-of-valid-words-for-each-puzzle/), Hard

Resources

1. [Submasking and masking](https://github.com/mayankdutta/Examples/blob/main/bitset/printing_all_submask.md)
2. [cp-algo](https://cp-algorithms.com/algebra/all-submasks.html)

Approach

- we have kind of encrypted/hashed all the strings in word and stored their occurrence them in a map.
- we then check each string in puzzle
  - peel the hash of puzzle one by one resource_1, this peeling process is knows as submasking of mask.
  - check if it was present in mp also the first character condition.
- record this variable count.

```cpp
class Solution {
public:
  int encrypt(string word) {
    int mask = 0;
    for (const auto &w : word) {
      mask |= (1 << (w - 'a'));
    }
    return mask;
  }
  vector<int> findNumOfValidWords(vector<string> &words,
                                  vector<string> &puzzles) {
    map<int, int> mapWord;
    for (const auto &word : words) {
      mapWord[encrypt(word)]++;
    }
    vector<int> ans;

    for (const auto &p : puzzles) {
      int mask = encrypt(p);
      int first = (1 << (p.front() - 'a'));
      int count = 0;

      for (int submask = mask; submask; submask = (submask - 1) & mask) {
        if (submask & first) {
          count += mapWord[submask];
        }
      }
      ans.push_back(count);
    }
    return ans;
  }
};
```
