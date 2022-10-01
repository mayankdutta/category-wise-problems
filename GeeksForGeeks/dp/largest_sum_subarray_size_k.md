[Largest Sum Subarray of Size at least K](https://practice.geeksforgeeks.org/problems/largest-sum-subarray-of-size-at-least-k3121/1)

- we are using kadane to store the `maximum sum` at every index.
- now comes the sliding window.
- after storing the sum of `[0 -> k]`.
- now @every step
  - resize the sliding window.
  - also check for the maximum subarray outside the sliding window since `at least k`.

<details>
<summary> Implementation </summary>

```cpp
using ll = long long int;

ll maxSumWithK(ll arr[], ll n, ll k) {
    using ll = long long int;
    vector<ll> max_sum(n, 0);
    max_sum[0] = arr[0];

    ll curr_max = arr[0];
    for (int i = 1; i < n; i++) {
        curr_max = max(arr[i], curr_max + arr[i]);
        max_sum[i] = curr_max;
    }

    ll sum = 0;

    for (int i = 0; i < k; i++) {
        sum += arr[i];
    }

    ll ans = sum;
    for (int i = k; i < n; i++) {
        sum += arr[i] - arr[i - k];
        ans = max({ans, sum + max_sum[i - k], sum});
    }

    return ans;
}
```

</details>
