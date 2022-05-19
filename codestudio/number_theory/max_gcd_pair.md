[Max GCD Pair](https://www.codingninjas.com/codestudio/problems/max-gcd-pair_842786?leftPanelTab=0&utm_source=pocket_mylist)

- stored the frequency of the factors in map
- since we have to find the pairs, just evaluate which factor is maximum and occurring more than once.

<details>
<summary> Implementation </summary>

```cpp
int maxGCDPair(vector<int> &arr, int n) {
    map<int, int> mp;
    for (const auto& x: arr) {
        for (int i = 1; i <= sqrt(x); i++) {
            if (x % i == 0) {
                if (x/i == i) {
                  mp[i] ++;
                }

                else {
                  mp[i] ++;
                  mp[x/i] ++;
                }
            }
        }
    }

    int mx = 0;
    for (const auto& i: mp) {
        int key = i.first;
        int value = i.second;
        if (value >= 2) mx = max(mx, key);
    }
    return mx;
}
```

</details>

- we will track if there exist some no. in the given range
- who has more then 2 factors in `a -> b`.
- if there is, that is our ans.

<details>
<summary> more optimized</summary>

```cpp
int maxGCDPair(vector<int> &arr, int n) {
  int a, b;
  cin >> a >> b;

  int ans = 1;
  for (int i = 2; i <= 1e5; i++) {
    int count = (b / i - (a - 1) / i);
    if (count > 1)
      ans = i;
  }
  cout << ans << '\n';

}
```

</details>
