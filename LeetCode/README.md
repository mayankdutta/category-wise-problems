##  Dijkstra algorithm / Floyd warshall
1. [Network Delay Time](https://leetcode.com/problems/network-delay-time/), Medium
    - Things I learnt
      - basic implementation of Djikstra
      - this can also be solved via floyd, iff constraints are low. 

## Binary Search
1. [875. Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/)
    
	- A fine problem on binary search (a good example of BS over unsorted content)
      
      <details>
      <summary>Sample Code</summary>

        ```cpp
        class Solution {
        public:
            int minEatingSpeed(vector<int>& piles, int h) {
                // consider this as a sequence of ( possible[0] , possible[1] , possible[2] , possible[3] , ..)
                // then for values it will look something like (false, false , false , . .. true,true true)
                // intuition is that if any x is a possible answer it is guaranteed that x+1, x+2 .. will also be an answer
                
                int high = *max_element(piles.begin(),piles.end());
                int low = 1;
                
                while(low < high){
                    int mid = low + (high-low)/2;
                    int timeNeeded = 0; 
                    for(auto&x:piles){
                        timeNeeded += (x/mid);
                        if(x%mid) timeNeeded++;
                    }
                    if(timeNeeded > h)
                        low = mid + 1;
                    else high = mid;
                }
                return low;
                
            }
        };

        ```
     </details>
	
##  MSSP
   1. [01 Matrix](https://leetcode.com/problems/01-matrix/), Medium
       - Base on classical approach of MSSP(multisource shortest path OR multisource BFS)
       - similar problem, [monsters](https://cses.fi/problemset/task/1194)
       - Things I learnt
           - basic implementation of multisouce BFS
       - Approach 
         - stored all the points in the queue, whose distance is known to me. 
         - will traverse BFS on rest of the points, which question is asking me to.
            <details>
            <summary>Implementation</summary>

            ```cpp
            
            int dr[] = {-1, 1, 0, 0}; 
            int dc[] = {0, 0, -1, 1};
            class Solution {
                public:
                vector<vector<int>> updateMatrix(vector<vector<int>>& mat) {
                    int n = mat.size();
                    int m = mat[0].size();
                    vector<vector<int>> dist(n, vector<int>(m, 1e9));
                    vector<vector<bool>> used(n, vector<bool>(m, false));
                    queue<pair<int, int>> qu;
            
                    for (int i = 0; i < n; i++)
                        for (int j = 0; j < m; j++)
                            if (mat[i][j] == 0) {
                                qu.push({i, j});
                                dist[i][j] = 0;
                                used[i][j] = true;
                            }
            
                    while (!qu.empty()) {
                        auto [r, c] = qu.front();
                        qu.pop();
            
                        for (int i = 0; i < 4; i++) {
                            int rr = dr[i] + r;
                            int cc = dc[i] + c;
            
                            if (rr < 0 or cc < 0 or rr >= n or cc >= m or used[rr][cc])
                                continue;
            
                            used[rr][cc] = true;
                            qu.push({rr, cc});
            
                            dist[rr][cc] = dist[r][c] + 1;
                        }
                    }
                    return dist;
                }
            };
            
            
            ```
            </details>
         
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
