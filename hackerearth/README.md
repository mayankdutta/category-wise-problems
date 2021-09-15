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
   - [DSU template](https://github.com/mayankdutta/code_template/blob/main/dsu.cpp)
      <details>

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
