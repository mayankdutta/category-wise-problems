[First negative integer in every window of size k] (https://practice.geeksforgeeks.org/problems/first-negative-integer-in-every-window-of-size-k3345/1/)

[monotonic deque](/LeetCode/2p/sliding_window_maximum.md)

```cpp

using ll = long long int;

vector<long long> printFirstNegativeInteger(ll A[], ll N, ll K) {
    deque<ll> dq;

    for (int i = 0; i < K; i++) {
        if (A[i] < 0) {
            dq.push_back(i);
        }
    }

    vector<ll> ans;

    ans.push_back(dq.empty() ? 0 : A[dq.front()]);
    for (int i = K; i < N; i++) {
        if (!dq.empty() and i >= dq.front() + K) {
            dq.pop_front();
        }

        if (A[i] < 0)
            dq.push_back(i);

        ans.push_back(dq.empty() ? 0 : A[dq.front()]);

    }
    return ans;

 }
```
