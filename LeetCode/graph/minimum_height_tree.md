[310. Minimum Height Trees](https://leetcode.com/problems/minimum-height-trees/), topological sorting, medium

explanation at [gardner and tree](/Codeforces/graphs/gardner_and_tree.md)

instead of whole array we just want the last level.
therefore erasing whole vector every time.

<details>

<summary> Code </summary>

```cpp

class Solution {
    public:
    vector<int> findMinHeightTrees(int n, vector<vector<int>>& edges) {
        if (n == 1) return {0};
        vector<vector<int>> tree(n + 1); 
        vector<int> indegree(n + 1, 0);
        for (const auto& i: edges) {
            int a = i[0], b = i[1];
            tree[a].push_back(b);
            tree[b].push_back(a);

            indegree[a] ++;
            indegree[b] ++;
        }
        queue<int> qu; 
        for (int i = 0; i < indegree.size(); i++) {
            if (indegree[i] == 1) {
                qu.push(i);
            }
        }

        vector<int> topo;
        while (!qu.empty()) {
            int current_size = qu.size(); 
            topo.clear();
            for (int i = 0; i < current_size; i++) {
                auto u = qu.front(); 
                qu.pop(); 
                topo.push_back(u);

                for (const auto& v: tree[u]) {
                    if (--indegree[v] == 1) {
                        qu.push(v);
                    }
                }
            }
        }
        return topo;
    }
};

```

</details>
