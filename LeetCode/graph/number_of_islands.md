[200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

## BFS

<details>
<summary> implementation </summary> 

```cpp
int numIslands(vector<vector<char>>& grid) {
    int dr[] = {-1, 1, 0, 0}; 
    int dc[] = {0, 0, -1, 1};
    
    queue<pair<int, int>> qu; 
    int n = grid.size();
    int m = grid[0].size();
    vector<vector<bool>> used(n, vector<bool>(m, false));

    int count = 0;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (grid[i][j] == '1' and !used[i][j]) {
                count ++;
                qu.push({i, j});
                used[i][j] = true;
                
                while (!qu.empty()) {
                    auto [r, c] = qu.front(); qu.pop();
                    for (int d = 0; d < 4; d++) {
                        int rr = r + dr[d]; 
                        int cc = c + dc[d];
                        
                        if (rr < 0 or rr >= n or cc < 0 or cc >= m) continue;
                        if (used[rr][cc]) continue;
                        if (grid[rr][cc] == '0') continue;
                        
                        qu.push({rr, cc}); 
                        used[rr][cc] = true;
                    }
                }
            }
        }
    }
    return count;
}


```
</details>

## DFS
## DSU
