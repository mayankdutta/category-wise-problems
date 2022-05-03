[D - 8 Puzzle on Graph](https://atcoder.jp/contests/abc224/tasks/abc224_d)

- A reasonably good problem on shortest paths in strings.
- Key observation : only 9! possible states, find the shortest path from given state to - '123456789'
- Above approach with few optimization.

<details>
<summary> implementation </summary>

```cpp
int main() {
    int m;
    cin >> m;
    vector<vector<int>> graph(9);
    for (int i = 0; i < m; i++) {
        int u, v;
        cin >> u >> v;
        u--;
        v--;
        graph[u].push_back(v);
        graph[v].push_back(u);
    }
    string p = "999999999";
    for (int i = 0; i < 8; i++) {
        int k;
        cin >> k;
        p[k - 1] = '1' + i;
    }
    queue<string> que;
    unordered_map<string, int> dp;
    que.push(p);
    dp[p] = 0;
    while (!que.empty()) {
        string s = que.front();
        que.pop();
        if (s == "123456789") break;
        int v = 0;
        for (int i = 0; i < 9; i++) {
            if (s[i] == '9') {
                v = i;
            }
        }
        int now = dp[s];
        for (auto u : graph[v]) {
            swap(s[u], s[v]);
            if (!dp.count(s)) {
                dp[s] = now + 1;
                que.push(s);
            }
            swap(s[u], s[v]);
        }
    }
    if (!dp.count("123456789"))
        cout << -1 << endl;
    else
        cout << dp["123456789"] << endl;
}
```

</details>
    
- Approach
    - Breadth first search
