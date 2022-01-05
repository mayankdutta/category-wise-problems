[2115. Find All Possible Recipes from Given Supplies](https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/), topological sorting, medium, implementation

- reading it out and understanding was the real pain in ....
- after hit and trial, it can be figured out that concept of topological sorting is being used here.
- but **how to implement??**
- for those which are already present in supply won't be any problem.
- problem will be those which aren't present directly.
- and those are the ones which are pushed in queue for topological sorting.

<details> 
<summary> Code implementation </summary>

```cpp
vector<string> findAllRecipes(vector<string> &recipe,
                              vector<vector<string>> &ingredients,
                              vector<string> &supplies) {

  map<string, vector<string>> graph;

  set<string> supply_set;
  for (auto &x : supplies)
    supply_set.insert(x);

  map<string, int> indegree;
  for (auto &x : recipe)
    indegree[x] = 0;

  int n = recipe.size();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < ingredients[i].size(); j++) {

      auto supply_finder = supply_set.find(ingredients[i][j]);
      if (supply_finder == supply_set.end()) {
        graph[ingredients[i][j]].push_back(recipe[i]);
        indegree[recipe[i]]++;
      }
    }
  }

  queue<string> qu;
  for (auto x : indegree)
    if (x.second == 0)
      qu.push(x.first);

  vector<string> topo;

  while (!qu.empty()) {
    string u = qu.front();
    qu.pop();
    topo.push_back(u);

    for (auto &v : graph[u]) {
      indegree[v]--;
      if (indegree[v] == 0)
        qu.push(v);
    }
  }

  return topo;
}



```

</details>
