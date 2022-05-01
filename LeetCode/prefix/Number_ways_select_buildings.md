[2222. Number of Ways to Select Buildings] (https://leetcode.com/problems/number-of-ways-to-select-buildings/)

```java
class Solution {
    public long numberOfWays(String str) {
        int n = str.length();

        StringBuilder s = new StringBuilder(str),
        t = new StringBuilder();

        for (int i = 0; i < s.length(); i++)
            t.append(s.charAt(i) == '1' ? '0' : '1');

        long ans = 0;
        List<Integer> prefix = new ArrayList<Integer>(),
        suffix = new ArrayList<>();

        int count = 0;
        for (int i = 0; i < n; i++) {
            if (s.charAt(i) == '0') count ++;
            else prefix.add(count);
        }

        count = 0;
        for (int i = n - 1; i >= 0; i--) {
            if (s.charAt(i) == '0') count ++;
            else suffix.add(count);
        }

        Collections.reverse(suffix);
        for (int i = 0; i < prefix.size(); i++)
            ans += (prefix.get(i) * suffix.get(i));

        prefix.clear();
        suffix.clear();

        count = 0;
        for (int i = 0; i < n; i++) {
            if (t.charAt(i) == '0') count ++;
            else prefix.add(count);
        }

        count = 0;
        for (int i = n - 1; i >= 0; i--) {
            if (t.charAt(i) == '0') count ++;
            else suffix.add(count);
        }

        Collections.reverse(suffix);
        for (int i = 0; i < prefix.size(); i++)
            ans += (prefix.get(i) * suffix.get(i));

        return ans;
    }
}
```

```cpp
#define ll long long
class Solution {
    public:
    ll helper(string s) {
        int sze = s.size();
        vector<int> left(sze, 0), right(sze, 0);
        int count = 0;
        for (int i = 0; i < sze; i++) {
            if (s[i] == '0')
                count++;
            else
                left[i] = count;
        }

        count = 0;
        for (int i = sze - 1; i >= 0; i--) {
            if (s[i] == '0')
                count++;
            else
                right[i] = count;
        }

        long long ans = 0LL;
        for (int i = 0; i < sze; i++)
            ans += left[i] * right[i];
        return ans;
    }

    ll numberOfWays(string s) {
        auto t = s;
        for (auto &x : t)
            x = (x == '0') ? '1' : '0';

        ll ans = helper(t) + helper(s);
        return ans;
    }
};


```
