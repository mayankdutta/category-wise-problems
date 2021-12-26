[821. Shortest Distance to a Character](https://leetcode.com/problems/shortest-distance-to-a-character/), BFS, implementation

#### multisource bfs
- multisource BFS has to implement it is pretty clear. 
- we may stuck in, what to store in dist array.
- ans. would be index, so that we can uniquely identify each element.
- using string value such as `'a', 'b' ... 'z'`, would lead us to wrong ans.

<details>
<summary> implementation </summary>

```cpp
vector<int> shortestToChar(string s, char c) {
  int n = s.size();
  vector<int> dist(n + 10, 0);
  queue<int> qu;

  for (int i = 0; i < n; i++) {
    if (s[i] == c) {
      qu.push(i);
      dist[i] = 1;
    }
  }

  int dir[] = {-1, 1};
  while (!qu.empty()) {
    auto u = qu.front();
    qu.pop();

    for (int i = 0; i < 2; i++) {
      int v = u + dir[i];

      if (v < 0 or v >= n or dist[v])
        continue;

      qu.push(v);
      dist[v] = dist[u] + 1;
    }
  }

  vector<int> ans;
  for (int i = 0; i < n; i++)
    ans.push_back(dist[i] - 1);

  return ans;
}

```
</details>

#### searching sorting

- 2 pass approach
- assign every neighbour of `c` shortest value it can get.

<details>
<summary> implementation </summary>

```cpp
vector<int> shortestToChar(string s, char c) {
      int n = s.size();
      vector<int> ans(n, 1e9); 
      
      int count = 1e9;
      for (int i = 0; i < n; i++) {
          count ++;
          (s[i] == c) ? count = 0: ans[i] = min(ans[i], count);
      }
      
      count = 1e9;
      for (int i = n - 1; i >= 0; i--) {
          count ++;
          (s[i] == c) ? count = 0: ans[i] = min(ans[i], count);
      }
      
      for (auto& i: ans) 
          if (i == 1e9) 
              i = 0;
      
      return ans;
  }

```
</details>
