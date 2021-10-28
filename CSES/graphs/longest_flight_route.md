[Longest Flight Route](https://cses.fi/problemset/task/1680), Medium
 - Pre Requisites - Topological Sorting (Kahn's Algorithm)
 - Approach
     - Idea is to do topological sorting twice to get the longest route from 1 to n, once without taking node "1" in consideration and then a topo sort from node "1" itself.
     - Dijkstra or modified BFS shortest path wont work. (reason not known)
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

- Similar question [G - Longest Path](https://atcoder.jp/contests/dp/tasks/dp_g)

     <details>
     <summary>Code </summary>

     ```cpp
   
     int n, m;
     cin >> n >> m;

     std ::vector<std ::vector<int>> graph(n);
     std ::vector<int> inDegree(n);
     for (int i = 0; i < m; i++) {
       int a, b;
       cin >> a >> b;
       a--, b--;
       graph[a].push_back(b);
       inDegree[b]++;
     }

     queue<int> qu, emptyQueue;
     for (int i = 0; i < n; i++) {
       if (inDegree[i] == 0) {
         qu.push(i);
       }
     }
     std ::vector<int> topoOrder;

     while (!qu.empty()) {
       auto u = qu.front();
       qu.pop();

       topoOrder.push_back(u);
       for (const auto &v : graph[u]) {
         if (--inDegree[v] == 0) {
           qu.push(v);
         }
       }
     }

     swap(qu, emptyQueue);

     std ::vector<int> dist(n, 0);
     for (const auto &i : topoOrder) {

       qu.push(i);
       if (!dist[i])
         dist[i] = 1;

       while (!qu.empty()) {
         auto u = qu.front();
         qu.pop();

         for (const auto &v : graph[u]) {
           if (!dist[v]) {
             qu.push(v);
             dist[v] = dist[u] + 1;
           } else {
             dist[v] = max(dist[u] + 1, dist[v]);
           }
         }
       }
     }

     cout << *max_element(begin(dist), end(dist)) - 1 << '\n';


     ```
     </details>
