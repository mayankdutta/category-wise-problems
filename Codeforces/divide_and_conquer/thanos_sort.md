[Thanos Sort](https://codeforces.com/group/yg7WhsFsAp/contest/355494/problem/P33)

- statement is fairly simple
- you must have strike merge sort kind of approach after reading this.
- if not i will suggest you to try out merge sort, quick sort first.

<details>
<summary> Code </summary>

```cpp
int ans = 1;
std ::vector<int> arr;

void divide_conquer(int l, int r) {
  if (l >= r)
    return;

  int mid = (l + r) / 2;
  divide_conquer(l, mid);
  divide_conquer(mid + 1, r);

  bool flag = true;

  for (int i = l; i < r; i++)
    flag = (flag && (arr[i] <= arr[i + 1]));

  if (flag)
    ans = max(ans, r - l + 1);
}
void solve() {
  int n;
  cin >> n;
  arr = std ::vector<int>(n);
  for (auto &i : arr)
    cin >> i;
  divide_conquer(0, n - 1);
  cout << ans << '\n';
}

```

</details>
