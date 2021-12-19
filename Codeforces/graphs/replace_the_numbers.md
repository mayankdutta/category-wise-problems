[E. Replace the Numbers](https://codeforces.com/contest/1620/problem/E), implementation


<details> 
<summary> Neal wu method(kind of brute force) </summary> 

```cpp
const int CF_SIZE = 5e5 + 5;
void solve() {
  int q;
  cin >> q;
  std ::vector<std ::vector<int>> graph(CF_SIZE);
  int i = 0;
  while (q--) {
    int type;
    cin >> type;

    if (type == 1) {
      int x;
      cin >> x;
      graph[x].push_back(i);
      i++;
    } else {
      int a, b;
      cin >> a >> b;

      if (a == b) continue;

      auto &from = graph[a];
      auto &to = graph[b];

      if (from.size() > to.size())
        swap(from, to);

      for (const auto &j : from)
        to.push_back(j);
      from.clear();
    }
  }

  std ::vector<int> arr(CF_SIZE, 0);
  for (int value = 0; value < CF_SIZE; value++)
    for (const auto &index : graph[value])
      arr[index] = value;

  for (int i = 0; i < arr.size(); i++)
    if (arr[i])
      cout << arr[i] << ' ';

  cout << '\n';
}
```
</details> 
