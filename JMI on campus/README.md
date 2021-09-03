## Sapient test : OA Jmi on campus

**Problem 1 : Insert a linked list in the middle of another linked list**

**Problem 2 : given a unweighted undirected graph with exactly one cycle. Find the distance of each node from the cycle. Return an array. The nodes in the cycle have distance 0**


**Solution 1**
- [Leetcode](https://leetcode.com/problems/merge-in-between-linked-lists/) of the same Problem
  Code of the same
```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* mergeInBetween(ListNode* list1, int a, int b, ListNode* list2) {
        
        ListNode* first = NULL ; ListNode *second = NULL;   // store a and b in them //
        ListNode *curr = list1;
        int i = 0;
        while (curr != nullptr){
            
            if (i == a-1){
                first = curr;                 // find a-1 index 
            }
            else if ( i == b){
                second = curr->next;            /// find b index store
                curr->next = nullptr;
                break;
            }
            curr = curr->next;
            i++;
        }
        first->next = nullptr;
        first->next = list2;
        
        ListNode *temp = list2;
        while (temp->next != nullptr){
            temp = temp->next;
        }                                     
        temp->next = second;                 
        return list1;
    }
};

```


**Solution 2**
Approach
- First motive is to find cycle.
- Once found, then we can put all elements on queue, and go for (multisource BFS / multisource shortest path).
- Colouring
  - color == 0: unvisited.
  - color == 1: Exploring, seen somewhere before, either parent-child or **cycle**.
  - color == 2: visited, no need to visted again.
- Then there is a parent array, to store the parents and to backtrack once we found the cycle.
- As we found cycle, we will then backtrack all related nodes and store them in a queue, to BFS them.
- Code for the same.
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
