## kind of topological sorting 
[D - Restricted Permutation](https://atcoder.jp/contests/abc223/tasks/abc223_d), Hard
 - What make it difficult.
   - We have to figure out if this is actually question of topological sorting
   - then we will have to think of the modification we have to carry out to get desirable result.
 - Approach
   - Approach is the same as classic topological sorting have.
   - From few test case it is not hard to realize that we have to use priority_queue/set type data structure.
   <details>
   <summary>Sample Code</summary>

     ```cpp

        int n, m;
        cin >> n >> m;

        std ::vector<std ::vector<int>> graph(n + 1);
        std ::vector<int> indegree(n + 1);

        for (int i = 0; i < m; i++) {
          int a, b;
          cin >> a >> b;
          graph[a].push_back(b);
          indegree[b]++;
        }

        priority_queue<int, std ::vector<int>, std::greater<int>> pq;
        for (int i = 1; i <= n; i++)
          if (indegree[i] == 0)
            pq.push(i);

        std ::vector<int> order;
        while (!pq.empty()) {
          auto u = pq.top();
          pq.pop();
          order.push_back(u);
          for (const auto &v : graph[u])
            if (--indegree[v] == 0)
              pq.push(v);
        }

        if (order.size() != n) {
          cout << "-1\n";
          return;
        }
        for (const auto &i : order)
          cout << i << ' ';


     ```
  </details>
