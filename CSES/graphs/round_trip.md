[Round Trip II](https://cses.fi/problemset/task/1678/),

- Normal DFS with some coloring and keeping tracks of parents.
- [Similar question (problem 2) and approach](https://github.com/mayankdutta/category-wise-problems/blob/main/JMI%20on%20campus/README.md)

<details>
<summary>Code sample </summary>

```cpp
#include <bits/stdc++.h>
using namespace std;

std ::vector<std ::vector<int>> graph;
std ::vector<int> parent;
std ::vector<int> color;

void dfs(const int &u) {
    color[u] = 1;
    for (const auto &v : graph[u]) {
        if (color[v] == 0) {
          parent[v] = u;
          dfs(v);
        } else if (color[v] == 1) {
            int start = u;
            int end = v;

            std ::vector<int> ans;
            auto temp = start;
            while (start != end) {
                ans.push_back(start);
                start = parent[start];
            }
            ans.push_back(end);
            ans.push_back(temp);

            cout << ans.size() << '\n';
            reverse(ans.begin(), ans.end());
            for (const auto &i : ans) {
                cout << i << ' ';
            }
            exit(0);
        }
    }
    color[u] = 2;
}

int main() {
    int n, m;
    cin >> n >> m;

    graph = std ::vector<std ::vector<int>>(n + 1);
    parent = std ::vector<int>(n + 1);
    color = std ::vector<int>(n + 1);

    for (int i = 0; i < m; i++) {
        int a, b;
        cin >> a >> b;
        graph[a].push_back(b);
    }

    for (int i = 1; i <= n; i++)
        if (color[i] != 2)
            dfs(i);
    cout << "IMPOSSIBLE\n";
}

```

</details>
