[Little Alawn's Puzzle](https://codeforces.com/contest/1534/problem/C),

- A combinatorics problem that uses DFS.
- Rated 1300 which is rare for a graph(related) problem

<details>
  <summary>Sample Code</summary><br>

  ```cpp
    #include <bits/stdc++.h>
    using namespace std;
    
    int arr[400001][2];
    vector<int> adj[400001];
    bool visited[400001] = {0};
    
    void dfs(int br) {
    
      visited[br] = true;
      for (auto &x : adj[br]) {
    
        if (!visited[x])
          dfs(x);
      }
    }
    void sol() {
      int n;
      cin >> n;
      for (int i = 1; i <= n; i++) {
        cin >> arr[i][0];
        visited[i] = false;
        adj[i] = vector<int>();
      }
      for (int i = 1; i <= n; i++) {
        cin >> arr[i][1];
      }
    
      for (int i = 1; i <= n; i++) {
    
        adj[arr[i][0]].push_back(arr[i][1]);
        adj[arr[i][1]].push_back(arr[i][0]);
      }
      ll ans = 1;
      for (int i = 1; i <= n; i++) {
        if (!visited[i]) {
          ans = ans * 2 % mod;
          dfs(i);
        }
      }
      cout << ans << '\n';
    }
    int main() {
      int testCases;
      cin >> testCases;
      while (testCases--)
        sol();
      return 0;
    }

  ```

 </details>
