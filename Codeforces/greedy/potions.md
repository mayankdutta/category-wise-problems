[Potions](https://codeforces.com/contest/1526/problem/C2)

_tags: Running Maximum, Minimum, Subsequences._

#### Intution

- once taken into account.
- if sum gets negative.
- pop out from priority queue
- because what we desire is the subsequence not the subarray.
- therefore order isn't the issue here.
- yes with priorityQueue/multiset at the hand.
- i can go back in time and choose to have different thing than once i had.
- because I had them stored.
- similar questions: [Maximum Performance of a team](https://leetcode.com/problems/maximum-performance-of-a-team/), [Maximum Subsequence score](https://leetcode.com/problems/maximum-subsequence-score/), [Minimum cost to hire K workers](https://leetcode.com/problems/minimum-cost-to-hire-k-workers/), [IPO](https://leetcode.com/problems/ipo/)

<details>
<summary> implementation </summary>

```cpp
void solve() {
    int n; cin >> n;
    priority_queue<int> pq;
    ll sum = 0;
    for (int i = 0; i < n; i++) {
        int num;
        cin >> num;
        pq.push(-num);

        sum += num;
        while (sum < 0) {
            sum += pq.top();
            pq.pop();
        }
    }
    cout << pq.size() << '\n';
}
```

</details>
