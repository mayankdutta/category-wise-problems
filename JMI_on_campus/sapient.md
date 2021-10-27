## Sapient test : OA Jmi on campus

**Problem 1 :** Insert a linked list in the middle of another linked list <br>
[Leetcode](https://leetcode.com/problems/merge-in-between-linked-lists/) of the same Problem <br>

**Solution 1**
<details>
<summary> Code </summary>

```cpp
SinglyLinkedListNode f=list1,s=list1;
for(int i=0;i<a-2;i++) 
  f=f.next;

for(int i=0;i<b-1;i++) 
  s=s.next;
  
if(a>=2)
  f.next=list2;
else
  list1=list2;
  
while(list2.next!=NULL)
    list2=list2.next;

list2.next=s.next;
return list1;
```
</details>


**Problem 2 :** given a unweighted undirected graph with exactly one cycle. Find the distance of each node from the cycle. Return an array. The nodes in the cycle have distance 0 <br>
[Similar Question to problem 2](https://cses.fi/problemset/task/1678/)

<details>
<summary>Approach</summary>

- First motive is to find cycle.
- Once found, then we can put all elements on queue, and go for (multisource BFS / multisource shortest path).
- Colouring
    - color == 0: unvisited.
    - color == 1: Exploring, seen somewhere before, either parent-child or **cycle**.
    - color == 2: visited, no need to visted again.
- Then there is a parent array, to store the parents and to backtrack once we found the cycle.
- As we found cycle, we will then backtrack all related nodes and store them in a queue, to BFS them.
 
</details>

<details>
<summary> Code for the same.</summary>

```cpp
#include <bits/stdc++.h>
using namespace std;
using ll = long long int;

vector<vector<int>> graph;
vector<int> color;
vector<int> parent;
int n;

void dfs(const int &u) {
  color[u] = 1;
  for (const auto &v : graph[u]) {
    if (color[v] == 0) {
      parent[v] = u;
      dfs(v);
    } else if (color[v] == 1) {
      if (parent[u] == v) {
        // Baap hai uska wo
      } else {
        // yeah, cycle
        int start = u;
        int end = v;

        queue<int> qu;
        vector<bool> used(n + 1);
        vector<int> dist(n + 1, 0);

        while (start != end) {
          qu.push(start);
          used[start] = true;
          dist[start] = 0;

          start = parent[start];
        }

        qu.push(end);
        used[end] = true;
        dist[end] = 0;

        while (!qu.empty()) {
          auto curr = qu.front();
          qu.pop();

          for (const auto &c : graph[curr]) {
            if (used[c])
              continue;
            used[c] = true;
            dist[c] = dist[curr] + 1;
            qu.push(c);
          }
        }
        for (int i = 1; i <= n; i++) {
          cout << dist[i] << ' ';
        }
        cout << '\n';
        exit(0);
      }
    }
  }
  color[u] = 2;
}

void solve() {
  int m;
  cin >> n >> m;

  graph = vector<vector<int>>(n + 1);
  color = vector<int>(n + 1, 0);
  parent = vector<int>(n + 1, 0);

  for (int i = 0; i < m; i++) {
    int a, b;
    cin >> a >> b;
    graph[a].push_back(b);
    graph[b].push_back(a);
  }

  dfs(1);
}

int main() { solve(); }

```
</details>