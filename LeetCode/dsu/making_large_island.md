[827. Making A Large Island ](https://leetcode.com/problems/making-a-large-island/)

## BFS

- BFS'ed all the connected components and allotted them Size.
- stored them in a map, in `color -> size` manner.
- then traversed over zeroes and check if neighbouring element is 1?
  - if yes, then from which colour that belongs.
  - what is the size.
- stored and returned the max ans.

<details>
<summary> BFS and coloring</summary>

```cpp
int dr[] = {1, -1, 0, 0};
int dc[] = {0, 0, -1, 1};

class Solution {
public:
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

              if (rr < 0 or cc < 0 or rr >= n or cc >= n or used[rr][cc] or
                  grid[rr][cc] != 1)
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
  }
};


```

</details>

## DSU

- converted 2D values into 1D, so that they may get store in DSU.
  ```js
  (current_row, current_col) -> (current_row * total_rows + current_col) OR
                                (current_row + current_col * total_cols)
  ```
- stored in DSU
- traversed over zeroes in graph
- if the neighbouring element is 1, then did the calculation to store the maximum area.

<details>
<summary> implementation </summary>

```cpp
int dr[] = {-1, 1, 0, 0};
int dc[] = {0, 0, -1, 1};

class Solution {

  // Dsu implementation, begin

  class UnionFind {
  public:
    std::vector<int> Parent;
    std::vector<int> Size;

    void init(int n) {
      Size.resize(int(3e5) + 5, 1);
      Parent.resize(int(3e5) + 5, 0);

      for (int i = 0; i < n; i++)
        Parent[i] = i;
    }

    void makeSet(int n) {
      Parent[n] = n;
      Size[n] = 1;
    }

    int findSet(int i) {
      return (Parent[i] == i) ? i : (Parent[i] = findSet(Parent[i]));
    }

    bool isSameSet(int i, int j) { return findSet(i) == findSet(j); }

    void unionSet(int a, int b) {
      a = findSet(a);
      b = findSet(b);
      if (a == b)
        return;
      if (Size[a] < Size[b])
        std::swap(a, b);

      Parent[b] = a;
      Size[a] += Size[b];
    }
  } dsu;

  // Dsu implementation, end

public:
  int largestIsland(vector<vector<int>> &grid) {
    int n = grid.size();
    int m = grid[0].size();

    dsu.init(n * m);

    queue<pair<int, int>> qu;
    for (int i = 0; i < n; i++)
      for (int j = 0; j < m; j++)
        if (grid[i][j] == 1)
          qu.push({i, j});

    vector<vector<bool>> used(n, vector<bool>(m, false));
    while (!qu.empty()) {
      auto [r, c] = qu.front();
      qu.pop();

      int u = r + c * m;

      for (int i = 0; i < 4; i++) {
        int rr = dr[i] + r;
        int cc = dc[i] + c;

        if (rr < 0 or rr >= n or cc < 0 or cc >= m)
          continue;
        if (used[rr][cc])
          continue;
        if (grid[rr][cc] == 0)
          continue;

        used[rr][cc] = true;
        int v = rr + cc * m;

        if (dsu.isSameSet(v, u))
          continue;

        dsu.unionSet(v, u);
      }
    }

    int ans = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (grid[i][j] == 0) {
          int count = 0;
          set<int> parents;
          for (int k = 0; k < 4; k++) {
            int r = dr[k] + i;
            int c = dc[k] + j;

            if (r < 0 or r >= n or c < 0 or c >= m)
              continue;
            if (grid[r][c] == 0)
              continue;
            parents.insert(dsu.findSet(r + c * m));
          }

          for (const auto &k : parents)
            count += dsu.Size[k];

          ans = max(ans, count + 1);
        } else {
          ans = max(ans, dsu.Size[dsu.findSet(i + j * m)]);
        }
      }
    }
    return ans;
  }
};

```

</details>
