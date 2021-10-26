## topological sorting, longest path
[2050. Parallel Courses III ](https://leetcode.com/problems/parallel-courses-iii/), Hard
 - question was really simple to understand
     - we have been given several directed edges, we had to identify the longest path.
 - What make it difficult.
   - At first glance it may seem djikstra problem, but **IT IS NOT**.
   - We will do kind of `djikstra relaxation`, but at topological step.
 - Approach
   - Store the indegrees of vertices.
   - Store apriori the distance of vertices who have `indegree == 0`
   - Then during calculating the topological order, just add a relaxation step.
     - If `distance of child` happens to be less then `distance of parent` + `weight of the vertex`.
     - then update the values
   <details>
   <summary>Sample Code</summary>

     ```cpp

     vector<vector<int>> graph(n); 
        vector<int> inDegree(n), dist(n, 0);
        for (auto& i: relations) {
            int a = i[0], b = i[1];
            a --, b --;
            graph[a].push_back(b);
            inDegree[b] ++;
        }
        queue<int> qu; 
        for (int i = 0; i < n; i++) {
            if (inDegree[i] == 0) {
                qu.push(i);
                dist[i] = time[i];
            }
        }
        
        while (!qu.empty()) {
            auto u = qu.front(); 
            qu.pop();
            
            for (auto& v: graph[u]) {
                dist[v] = max(dist[v], dist[u] + time[v]);
                if (--inDegree[v] == 0) {
                    qu.push(v);
                }
            }
        }
        return *max_element(begin(dist), end(dist));


     ```
  </details>
