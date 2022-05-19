In Graph theory, the depth-first search algorithm (abbreviated as DFS) is mainly used to:

1. Traverse all vertices in a “graph” _(LeetCode 1971 - Find if Path Exists in Graph - DFS)_
2. Traverse all paths between any two vertices in a “graph”. _(Leetcode 797 - Find all the paths from source to target)_

##### for type 1 problems

```java
class Solution {
    public boolean validPath(int n, int[][] edges, int start, int end) {
        List<List<Integer>> adjacency_list = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adjacency_list.add(new ArrayList<>());
        }

        for (int[] edge : edges) {
            adjacency_list.get(edge[0]).add(edge[1]);
            adjacency_list.get(edge[1]).add(edge[0]);
        }

        Deque<Integer> stack = new ArrayDeque<>();
        stack.push(start);
        boolean seen[] = new boolean[n];
        Arrays.fill(seen, false);

        while (!stack.isEmpty()) {
            // Get the current node.
            int node = stack.pop();

            // Check if we have reached the target node.
            if (node == end) {
                return true;
            }

            // Check if we've already visited this node.
            if (seen[node]) {
                continue;
            }
            seen[node] = true;

            // Add all neighbors to the stack.
            for (int neighbor : adjacency_list.get(node)) {
                stack.push(neighbor);
            }
        }

        return false;
    }
}
```

##### for type 2 problems

```java
class Solution {
    // DFS
    public List<List<Integer>> allPathsSourceTarget(int[][] graph) {
        List<List<Integer>> paths = new ArrayList<>();
        if (graph == null || graph.length == 0) {
            return paths;
        }

        dfs(graph, 0, new ArrayList<>(), paths);
        return paths;
    }

    void dfs(int[][] graph, int node, List<Integer> path, List<List<Integer>> paths) {
        path.add(node);
        if (node == graph.length - 1) {
            paths.add(new ArrayList<>(path));
            return;
        }
        int[] nextNodes = graph[node];
        for (int nextNode: nextNodes) {
            dfs(graph, nextNode, path, paths);
            path.remove(path.size() - 1);
        }
    }
}
```

```cpp
class Solution {
    public:
    vector<vector<int>> ans, graph;
    vector<int> current;
    int n;

    void dfs(const int& u) {
        if (u == n -1) {
            ans.push_back(current);
            return;
        }
        for (const auto& v: graph[u]) {
            current.push_back(v);
            dfs(v);
            current.pop_back();
        }
    }

    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        n = graph.size();
        this -> graph = graph;

        current = vector<int>{0};

        dfs(0);
        return ans;
    }
};
```
