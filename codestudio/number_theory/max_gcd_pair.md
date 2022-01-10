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
