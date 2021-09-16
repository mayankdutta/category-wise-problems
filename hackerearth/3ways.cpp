#include <bits/stdc++.h>
using namespace std;

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