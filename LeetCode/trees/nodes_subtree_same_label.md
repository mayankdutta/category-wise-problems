[1519. Number of Nodes in the Sub-Tree With the Same Label ](https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/)

- so as to follow up from leaves to root manner.
- we keep calculation part @bottom, the tree calculation part will be done while backtracking.
- to avoid extra array `used[]`, we have used extra variable, `parent` since it is a tree as given.
- we are keep storing the occurrence as we are arising from the `leaves -> root`.
- in doing so `ans[u] += count[labels[u] - 'a']` is a crucial statement.

```cpp
class Solution {
public:
    string labels;
    vector<vector<int>> graph;
    vector<int> ans;

    vector<int> dfs(int u, int parent = -1) {
        vector<int> count(26, 0);
        count[labels[u] - 'a'] ++;
        for (const auto& v: graph[u]) {
            if (v != parent) {
                auto temp = dfs(v, u);
                for (int i = 0; i < 26; i++) {
                    count[i] += temp[i];
                }
            }
        }
        ans[u] += count[labels[u] - 'a'];
        return count;
    }
    vector<int> countSubTrees(int n, vector<vector<int>>& edges, string labels) {
        graph = vector<vector<int>>(n + 1);
        this->labels = labels;
        this->ans.resize(n, 0);

        for (const auto& i: edges) {
            int a = i[0];
            int b = i[1];
            graph[a].push_back(b);
            graph[b].push_back(a);
        }

        auto count = dfs(0);
        return ans;
    }
};
```
