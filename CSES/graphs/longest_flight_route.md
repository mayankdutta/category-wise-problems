
7. [Longest Flight Route](https://cses.fi/problemset/task/1680), Medium
    - Pre Requisites - Topological Sorting (Kahn's Algorithm)
    - Approach
        - Idea is to do topological sorting twice to get the longest route from 1 to n, once without taking node "1" in consideration and then a topo sort from node "1" itself.
        - Dijkstra or modified BFS shortest path might not work.
        - In this graph there are only directed edges with no cycle.
        - Using Kahn's Algortihm for topo sort, we can easily find the longest route in a DAG.
        - the main edge case is finding whether we can visit the node 'n' without using node '1', in which case the answer would be "IMPOSSIBLE".
        - else follow the simple bfs path traversed using the topo sort.
        <details>
        <summary>Code sample </summary>

        ```cpp
      
       void solve(){
          ll n, m;    cin >> n >> m;
          vector<ll> adj[n+1];
          vector<ll> id(n+1);

          while(m--){
              ll u, v;    cin >> u >> v;
              adj[u].push_back(v);
              id[v]++;
          }
          unordered_set<ll> topo;

          vector<ll> par(n+1, -1);
          queue<ll> bfs;

          for (ll i = 2; i<=n; i++){
              if (id[i] == 0) bfs.push(i);
          }


          while(bfs.size()){
              ll u = bfs.front();     bfs.pop();
              topo.insert(u);
              for (auto v: adj[u]){
                  id[v]--;
                  if (id[v] == 0) {
                      bfs.push(v);
                      par[v] = u;
                  }
              }
          }

          if (id[n] == 0 and topo.find(1) == topo.end())  {
              cout << "IMPOSSIBLE\n";
              return;
          }

          bfs.push(1);

          while(bfs.size()){
              ll u = bfs.front();     bfs.pop();
              topo.insert(u);
              for (auto v: adj[u]){
                  id[v]--;
                  if (id[v] == 0) {
                      bfs.push(v);
                      par[v] = u;
                  }
              }
          }


          if (par[n] == -1)     cout << "IMPOSSIBLE\n"; 
          else{
              vector<ll> temp;
              temp.push_back(n);
              while(temp.back() != 1){
                  temp.push_back(par[temp.back()]);
              }
              reverse(temp.begin(), temp.end());

              cout << temp.size() << endl;
              for (auto &i: temp){
                  cout << i << " ";
              }
          }
      }
       

        ```
        </details>

