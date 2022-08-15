[2375. Construct Smallest Number From DI String](https://leetcode.com/problems/construct-smallest-number-from-di-string/)

#### Complete search

- can be optimised by using bit-masking.

<details> 
<summary> Implementation </summary>

```cpp
class Solution {
    public:
    string pattern;
    string temp;
    map<char, bool> used;
    string ans;

    void fun(int i) {
        if (i == pattern.size()) {
            if (ans.empty())  ans = temp;
            else              ans = min(ans, temp);

            return;
        }

        if (pattern[i] == 'I') {
            for (char ch = temp.back() + 1; ch <= '9'; ch++) {
                if (used[ch]) continue;

                temp.push_back(ch);
                used[ch] = true;

                fun(i + 1);

                used[ch] = false;
                temp.pop_back();
            }
        } else {
            for (char ch = temp.back() - 1; ch >= '1'; ch--) {
                if (used[ch]) continue;
                temp.push_back(ch);
                used[ch] = true;

                fun(i + 1);

                used[ch] = false;
                temp.pop_back();
            }
        }
    }

    string smallestNumber(string pattern) {
        this->pattern = pattern;
        for (char ch = '1'; ch <= '9'; ch++) {
            temp.push_back(ch);
            used[ch] = true;

            fun(0);

            used[ch] = false;
            temp.pop_back();
        }
        return ans;
    }
};
```

</details>

#### Observation

[source](https://leetcode.com/problems/construct-smallest-number-from-di-string/discuss/2422380/JavaC%2B%2BPython-Easy-Reverse)

```js
Intuition
If we meet I,II,III...
we can greedily pick the smallest numebr.

If we meet D,
we can pick second smallest and then pick the smallest,
like 21.

If we meet D,
we can pick the third smallest, then the second smallest, then the smallest,
like 321.


Explanation
1 2 3 4 5 6 7 8 9
D D I D D I D D

Match the input string and the sequence 1,2,3,4,5,6,7,8,9.
Reverse all numbers between "I".

For example:
first 'I' at 3, then reverse 1,2,3, we have 3,2,1
second 'I' at 6, then reverse 4,5,6, we have 6,5,4
Reverse the last group 7,8,9, we have 9,8,7

Final result for D D I D D I D D,
is 3,2,1,6,5,4,9,8,7

```

<details> 
<summary>
Implementation
</summary>

```cpp
class Solution {
public:
    string smallestNumber(string s) {
        string ans = "123456789";
        for (int i = 0; i < s.size(); i++) {
            if (s[i] == 'D') {
                int start = i - 1;
                while (i + 1 < s.size() && s[i + 1] == s[i]) {
                    i ++;
                }
                reverse(ans.begin() + start + 1, ans.begin() + i + 2);
            }
        }
        return ans.substr(0, s.size() + 1);

    }

};

```

</details>

- if it wasn't for the **smallest** then something like this could also be done.
- but here lexicographical order was required.

<details> 
<summary> Implementation </summary>

```cpp
class Solution {
public:
    vector<int> diStringMatch(string s) {
        int mx = 0;
        int mn = 0;

        vector<int> ans;
        ans.push_back(0);

        for (auto i: s) {
            if (i == 'I') ans.push_back(mx + 1), mx  ++;
            else if (i == 'D') ans.push_back(mn - 1), mn --;
        }

        for (int i = 0; i < ans.size(); i++)
            ans[i] -= mn;
        return ans;
    }
};
```

</details>
