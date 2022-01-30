[1202. Smallest string with swaps](https://leetcode.com/problems/smallest-string-with-swaps/)

- main point was implementation.
- we will have to form edges this was obvious.
- but how to sort all connecting edges was major concern.
- try to implement on your own first.

<details> 
<summary> </summary>

```cpp
class UnionFind {
    public:
    vector<int> p, s;
    UnionFind(int n) {
        p = s = vector<int>(n + 2, 0);
        for (int i = 0; i <= n; i++)
            p[i] = i;
    }
    bool is_same(const int& a, const int& b) {
        return find(a) == find(b);
    }
    int find(int i) {
        return (i == p[i] ? i : p[i] = find(p[i]));
    }

    void merge(int a, int b) {
        int x = find(a);
        int y = find(b);
        if (x == y) return;
        if (s[x] > s[y]) swap(x, y);
        p[x] = y;
        s[x] += s[y];
    }
};

class Solution {
    public:
    string smallestStringWithSwaps(string s, vector<vector<int>>& pairs) {
        int n = s.size();
        UnionFind dsu(n);

        for (const auto& i: pairs)
            dsu.merge(i[0], i[1]);

        vector<multiset<int>> graph(n);
        for (int i = 0; i < n; i++) {

            int a = dsu.find(i);
            int b = i;
            graph[a].insert(b);
        }

        string ans;
        ans.resize(n);
        for (const auto& i: graph) {
            string temp;
            for (const auto& j: i)
                temp.push_back(s[j]);

            sort(temp.begin(), temp.end());

            int k = 0;
            for (const auto& j: i)
                ans[j] = temp[k++];
        }
        return ans;
    }

};
```

</details>
