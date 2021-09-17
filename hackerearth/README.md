## MST
1. [3- types](https://www.hackerearth.com/practice/algorithms/graphs/minimum-spanning-tree/practice-problems/algorithm/3-types/), Medium-hard
    - base on concept of MST, with some maths
    - Things I learnt
        - When to use two MST side by side. 
        - Do note that calculation part.
    - Approach
       - Made `2 MST's` to maintain individual count and mixed count.
       - if `type is 3` then added to both MST, else to individuals.
       - do note that the `common count` will get `doubled` at the end, because it is getting count twice every time.
       - Do note that calculation part.
       - then we checked if the vertices in each MST is equal to the vertices provided?
       - Mathematical part
         - A MST is a `tree`
         - if a tree has `n` vertices then it must have `n - 1` edges. 
         - Therefore MST `men` and `women` must be tree hence equated to `n - 1`
         - and later equation means that, we had `m` edges
           - out of that `common / 2` taken by `type 3`
           - `women` by `type 2`
           - `men` by 'type 1'
         - we simply printing the remaining edges.
       
    - [DSU template](https://github.com/mayankdutta/code_template/blob/main/dsu.cpp)
    - <details>

       <summary>Kruskal's implementation</summary>

       ```cpp
       struct info {
           int from, to, weight;
       };
      
       void solve() {
           int n, m;
           cin >> n >> m;
          
           vector<info> edges(m);
          
           for (int i = 0; i < m; i++) {
               cin >> edges[i].from >> edges[i].to >> edges[i].weight;
           }
          
           sort(all(edges),
               [](const auto &a, const auto &b) -> bool { return a.wt > b.wt; });
          
           UnionFind men(n + 5);
           UnionFind women(n + 5);
          
           int common = 0;
           int countMen = 0;
           int countWomen = 0;
          
           for (const auto &i : edges) {
               if (i.weight == 3) {
                   if (!men.isSameSet(i.from, i.to)) {
                       men.unionSet(i.from, i.to);
                       common++;
                   }
                   if (!women.isSameSet(i.from, i.to)) {
                       women.unionSet(i.from, i.to);
                       common++;
                   }
               } else if (i.weight == 2) {
                   if (!women.isSameSet(i.from, i.to)) {
                       women.unionSet(i.from, i.to);
                       countWomen++;
                   }
               } else if (i.weight == 1) {
                   if (!men.isSameSet(i.from, i.to)) {
                       men.unionSet(i.from, i.to);
                       countMen++;
                   }
               }
           }
          
           if (common / 2 + countMen == n - 1 and common / 2 + countWomen == n - 1) {
               cout << m - common / 2 - countMen - countWomen << '\n';
           } else
               cout << "-1\n";
       }

       ```
    </details>
    
    - <details>

       <summary>Prims(TLE in 2TC's) implementation</summary>

       ```cpp
       void add_edge(map<int, vector<pair<int, int>>> &mp, int u, int v, int type) {
           mp[u].push_back(make_pair(type, v));
           mp[v].push_back(make_pair(type, u));
       }
       
       int main() {
           int n, k;
           cin >> n >> k;
           map<int, vector<pair<int, int>>> edges;
           
           for (int i = 0; i < k; i++) {
               int u, v, type;
               cin >> u >> v >> type;
               
               add_edge(edges, u, v, type);
           }
           
           vector<int> male(n, false);
           vector<int> female(n, false);
           
           priority_queue<pair<int, int>> pq;
           
           pq.push({0, 1});
           male[0] = true;
           female[0] = true;
           
           int cnt = 0;
           
           while (!pq.empty()) {
               pair<int, int> temp = pq.top();
               pq.pop();
               
               int temp2 = temp.first;
               int node = temp.second;
               
               if (temp2 == 3 && (!male[node - 1] || !female[node - 1])) {
                 male[node - 1] = true;
                 female[node - 1] = true;
                 cnt++;
               } else if (temp2 == 2 && !female[node - 1]) {
                 female[node - 1] = true;
                 cnt++;
               } else if (temp2 == 1 && !male[node - 1]) {
                 male[node - 1] = true;
                 cnt++;
               }
               
               for (auto x : edges[node]) {
                 if (x.first == 3 && (!male[x.second - 1] || !female[x.second - 1]))
                   pq.push(x);
                 if (x.first == 2 && !female[x.second - 1])
                   pq.push(x);
                 if (x.first == 1 && !male[x.second - 1])
                   pq.push(x);
               }
           }
           bool flag = true;
           for (int i = 0; i < n; i++) {
               if (!male[i] || !female[i]) {
                   flag = false;
                   break;
               }
           }
           if (!flag)
               cout << "-1\n";
           else
               cout << k - cnt << '\n';
           return 0;
       }

       ```
    </details>
