[2135. Count Words Obtained After Adding a Letter](https://leetcode.com/problems/count-words-obtained-after-adding-a-letter/)

#### Binary search

###### Note _avoid using multiset, use map instead (easier in counting)._

- this is just a brute force variation
- all the desired strings already stored.
- then individually checked after adding letter, if it matches to desired string.

<details> 
<summary> binary search implementation </summary>

```cpp
class Solution {
    public:
    int wordCount(vector<string>& startWords, vector<string>& targetWords) {
        unordered_map<string, int> target;

        for(auto &t: targetWords) {
            sort(t.begin(), t.end());
            target[t]++;
        }

        for (auto& s: startWords)
            sort(s.begin(), s.end());

        int ans = 0;
        for(auto &s: startWords)  {
            for(char c = 'a'; c <= 'z'; ++c) {
                if (binary_search(s.begin(), s.end(), c)) continue;
                auto t = s;
                t.push_back(c);
                sort(t.begin(), t.end());

                if(target.find(t) != target.end()) {
                    ans += target[t];
                    target.erase(t);
                }
            }
        }
        return ans;
    }

};

```

</details>

#### bit manipulation

- in order to avoid hashing, we can take advantage of only **26 characters in string**, hence store them in bits instead.
- rest of the implementation is same as above one.

<details>
<summary> bits solution </summary>

```cpp
class Solution {
    public:
    int wordCount(vector<string>& startWords, vector<string>& targetWords) {
        unordered_map<int, int> mp;
        for (const auto& i: targetWords) {
            int bits = 0;
            for (const auto& j: i)
                bits += (1 << (j - 'a'));
            mp[bits] ++;
        }

        int count = 0;
        for (const auto& i: startWords) {
            int bits = 0;
            for (const auto& j: i)
                bits += (1 << (j - 'a'));

            for (char ch = 'a'; ch <= 'z'; ch++) {
                int current = (1 << (ch - 'a'));
                if ((current & bits) == 0) {
                    if (mp.count(current | bits)) {
                        count += mp[current | bits];
                        mp.erase(current | bits);
                    }
                }
            }
        }
        return count;
    }
};
```

</details>
