[735. Asteroid Collision](https://leetcode.com/problems/asteroid-collision/)

- used vector in place of stack, for debugging purposes.
- but method is still the same.
- keep pushing element till no opposite one noticed.
- if noticed then according to it's absolute value, delete the previously recorded elements.

<details>
<summary> implementation </summary>

```cpp
class Solution {
    public:
    bool opposite(int a, int b) {
        if (a > 0 and b < 0) return true;
        if (a < 0 and b > 0) return true;
        return false;
    }

    vector<int> asteroidCollision(vector<int>& asteroids) {
        vector<int> ans;
        for (const auto& i: asteroids) {
            if (ans.empty()) {
                ans.push_back(i);
                continue;
            }

            if (!opposite(i, ans.back())) {
                ans.push_back(i);
            }
            else {
                bool flag = true;
                while (flag and !ans.empty() and opposite(i, ans.back())) {
                    int top = ans.back();
                    ans.pop_back();

                    if (abs(top) == abs(i)) {}
                    else {
                        int mx = max(abs(top), abs(i));
                        if (mx == abs(top)) {
                            ans.push_back(top < 0 ? -1*mx : mx);
                            flag = false;
                        }
                        else {
                            ans.push_back(i < 0 ? -1*mx : mx);
                        }
                    }
                    for (const auto& i: ans) cout << i << ' '; cout << '\n';
                }

            }
        }
        return ans;
    }
};
```

</details>
