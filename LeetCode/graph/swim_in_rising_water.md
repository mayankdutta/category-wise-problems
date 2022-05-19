[778. Swim in Rising Water](https://leetcode.com/problems/swim-in-rising-water/), implementation, djikstra, BFS, binary search

#### Binary search on the answer 
- we dont know the answer !! 
- _we can always binary search the answer._
- we have assumed the answer and check if we can reach to the end or not. 
  - if we can, **record it.**
  - if we can'nt, **ignore it.**

<details>
<summary> Binary search + BFS </summary>

```cpp
int swimInWater(vector<vector<int>>& grid) {
    int n = grid.size();
    int m = grid[0].size();

    int low = 0;
    int high = 51 * 51;

    int dr[] = {-1, 1, 0, 0};
    int dc[] = {0, 0, -1, 1};

    int ans = INT_MAX;
    for (int kk = 0; kk < 50; kk++) {
        int mid = (low + (high - low)/2);
        queue<pair<int, int>> qu;
        vector<vector<bool>> used(n, vector<bool>(m, false));

        qu.push({0, 0});
        used[0][0] = true;
        int mini_ans = grid[0][0];

        while (!qu.empty()) {
            auto [r, c] = qu.front();
            qu.pop();

            for (int i = 0; i < 4; i++) {
                int rr = r + dr[i];
                int cc = c + dc[i];

                if (rr < 0 or cc < 0 or rr >= n or cc >= m) continue;
                if (used[rr][cc]) continue;
                if (grid[rr][cc] > mid) continue;

                qu.push({rr, cc});
                used[rr][cc] = 1;
                mini_ans = max(mini_ans, grid[rr][cc]);
            }
        }
        bool good = used[n - 1][m - 1];

        if (good) high = mid;
        else low = mid;

        if (used[n - 1][m - 1])
            ans = min(ans, mini_ans);
    }
    return ans;
}
```

</details>


#### Shortest path 
- we always we have to choose the shortest value, from where we are standing on.
- `shortest` must click djikstra.
- rest is the implementation.

<details>
<summary> Djikstra implementation </summary>

```cpp
int swimInWater(vector<vector<int>>& grid) {
    #define tiii tuple<int, int, int>
    int dr[] = {-1, 1, 0, 0};
    int dc[] = {0, 0, -1, 1};

    int n = grid.size();
    int m = grid[0].size();
    int t = grid[0][0];

    priority_queue<tiii, vector<tiii>, greater<tiii>> pq;
    vector<vector<int>> dist(n, vector<int>(m, 0));

    pq.push({t, 0, 0});
    dist[0][0] = 1;

    int ans = 0;
    while (!pq.empty()) {
        auto [value, r, c] = pq.top();
        ans = max(ans, value);
        pq.pop();

        if (r == n - 1 and c == m - 1)
            return ans;

        dist[r][c] = 1;
        for (int i = 0; i < 4; i++) {
            int rr = r + dr[i];
            int cc = c + dc[i];

            if (rr < 0 or rr >= n or cc < 0 or cc >= m or dist[rr][cc]) continue;

            pq.push({grid[rr][cc], rr, cc});
        }
    }
    return -1;
}
```

</details>
