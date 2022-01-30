[D - Multiply and Rotate](https://atcoder.jp/contests/abc235/tasks/abc235_d)

- main thing was to indentify the problem.
- once identified only implementation remains.
- implementation was the real pain .....
- one corner was to check if the number has 0 as last digit.

<details>

<summary> implementation </summary>

```cpp

  ll a, n;
  cin >> a >> n;

  queue<ll> qu;
  vector<ll> distance(1000005, -1);

  qu.push(1);
  distance[1] = 0;

  while (!qu.empty()) {
    auto u = qu.front();
    qu.pop();

    ll v = 1LL * u * a;
    if (v < 1e6 and distance[v] == -1) {
      qu.push(v);
      distance[v] = distance[u] + 1;
    }

    if (u >= 10 and u % 10 != 0) {
      v = (u % 10) * pow(10, digits(u / 10 - 1)) + u / 10;

      if (v < 1e6 and distance[v] == -1) {
        qu.push(v);
        distance[v] = distance[u] + 1;
      }
    }
  }

  cout << distance[n] << '\n';

```

</details>
