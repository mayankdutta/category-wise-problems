
## Flood fill
1. [827. Making A Large Island](https://leetcode.com/problems/making-a-large-island/), **Medium** *(if aware of flood fill) else* **Hard**
    - Problem necessitates Flood fill concepts and coloring the graphs.
    - Approach 
      - We first traverse accross components that are **not connected**
      - We give them some color *(0, 1, 2 ,3 ... )* and store their size.
      - We then in another loop traverse only at points of no Land *i.e. where grid[i][j] == 0*
      - and check what is the colour of the point located to its *(left /right/ down/ up)*.
    - code

      <details>
      <summary>BFS Implementation</summary>

        ```cpp
      
        int dr[] = {1, -1, 0, 0};
        int dc[] = {0, 0, -1, 1};
        int largestIsland(vector<vector<int>> &grid) {
        int n = grid.size();
        int m = grid[0].size();
        
        vector<vector<int>> used(n, vector<int>(m, false));
        queue<pair<int, int>> qu;
        map<int, int> mp;
        
        int color = 1;
        mp[0] = 0;
        int ans = 0;
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 1 and !used[i][j]) {
                    int Size = 1;
                    qu.push({i, j});
                    used[i][j] = color;
                    
                    while (!qu.empty()) {
                        auto [r, c] = qu.front();
                        qu.pop();
                        
                        for (int k = 0; k < 4; k++) {
                            int rr = r + dr[k];
                            int cc = c + dc[k];
                            
                            if (rr < 0 or cc < 0 or rr >= n or cc >= n or used[rr][cc] or grid[rr][cc] != 1)
                                continue;
                            qu.push({rr, cc});
                            used[rr][cc] = color;
                            Size++;
                        }
                    }
                    ans = max(ans, Size);
                    mp[color] = Size;
                    color++;
                }
            }
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 0) {
                    int sum = 0;
                    map<int, bool> usedColor;
                    for (int k = 0; k < 4; k++) {
                        int rr = i + dr[k];
                        int cc = j + dc[k];
                        
                        if (rr < 0 or cc < 0 or rr >= n or cc >= n)
                            continue;
                        int currentColor = used[rr][cc];
                        if (usedColor.count(currentColor))
                            continue;
                        
                        sum += (mp[currentColor]);
                        if (currentColor != 0) {
                            usedColor[currentColor] = true;
                        }
                    }
                    ans = max(ans, sum + 1);
                }
            }
        }
        return ans;

        ```
     </details>
