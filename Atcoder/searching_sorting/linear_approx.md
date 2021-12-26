[C - Linear Approximation](https://atcoder.jp/contests/abc102/tasks/arc100_a)

- Define Bi = Ai−i.
- Then, we want to minimize the value of the sum of abs(Bi−b) by choosing a variable b.
- It turns out that the optimal value of b is the median of Bi
- This is because,
  _if b is not the median, if we continuously change b to the direction of the median,
  the sum of abs(Bi − b) never increases._
- We can get the median by sorting the array B.
- This solution works in O(NlogN) time.

<details>
<summary> Code implementation </summary>

```cpp
int n;
cin >> n;

std ::vector<long long int> arr(n);
for (auto &i : arr)
  cin >> i;

for (int i = 0; i < n; i++)
  arr[i] -= (i + 1);

sort((arr).begin(), (arr).end());
int median = (n & 1 ? arr[n / 2] : arr[(n - 1) / 2]);

ll ans = 0;
for (const auto &i : arr)
  ans += (abs(i - median));

cout << ans << '\n';

```

</details>
