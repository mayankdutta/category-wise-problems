##  MSSP
[01 Matrix](https://leetcode.com/problems/01-matrix/), Medium
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
