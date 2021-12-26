[C - Tsundoku](https://atcoder.jp/contests/abc172/tasks/abc172_c), binary search, prefix sums


- problem statements are really simple, like most of AC problems, unlike problem itself.
- we can't sort as books are stacked given in the question.
- since time to read a book will only accumulate over time.
- therefore constructing a prefix array seems reasonable.
- and then comes the implementing the binary search.
  - will traverse over one array, count how many elements present in the second array less then `(k - array_one[i])`
  - will store in some variable.

<details> 
<summary> Code </summary>

```cpp
  long long int n, m, k;
  cin >> n >> m >> k;

  std ::vector<long long int> arr(n), brr(m);
  for (int i = 0; i < n; i++) {
    cin >> arr[i];
    arr[i] += (i > 0 ? arr[i - 1] : 0);
  }

  for (int i = 0; i < m; i++) {
    cin >> brr[i];
    brr[i] += (i > 0 ? brr[i - 1] : 0);
  }

  long long int ans = 0;
  for (int i = 0; i < n; i++) {
    if (arr[i] > k)
      break;
    auto it = upper_bound((brr).begin(), (brr).end(), k - arr[i]);
    ans = max(1 + i + (ll)(it - brr.begin()), ans);
  }

  for (int i = 0; i < m; i++) {
    if (brr[i] > k)
      break;
    auto it = upper_bound((arr).begin(), (arr).end(), k - brr[i]);
    ans = max(1 + i + (ll)(it - arr.begin()), ans);
  }
  cout << ans << '\n';

```
</details> 
