[Geekland Colesseum](https://practice.geeksforgeeks.org/contest/job-a-thon-exclusive-hiring-challenge-for-amazon-alexa/problems#)

- idea is to use TWO sliding window of size `N`, one from front, one from backwards.
- we will keep storing the maximum no.s we encounter and keep updating it at every step in 1st sliding window.
- for the second one we will keep updating it with the minimum.
- now for every `i` in `suffix` and `prefix` we have maximum window and the minimum window.

```cpp
class Solution {
public:
    long long colosseum(int N,vector<int> arr) {
        using ll = long long int;
        priority_queue<ll> mx_heap; // top will be the smallest
        priority_queue<ll, vector<ll>, greater<ll>> mn_heap; // top will be the largest

        int n = arr.size();
        vector<ll> suffix(n, 0), prefix(n, 0);

        ll sum = 0;

        // preparing a window of size N
        for (int i = 0; i < N; i++) {
            sum += arr[i];
            prefix[i] = sum;
            mn_heap.push(arr[i]);
        }

        // working on window, keeping sum always the maximum, storing in prefix.
        for (int i = N; i < 2*N; i++) {
            if (mn_heap.top() < arr[i]) {
                sum -= mn_heap.top();
                mn_heap.pop();
                mn_heap.push(arr[i]);
                sum += arr[i];
            }
            prefix[i] = sum;
        }

        sum = 0;

        // preparing the window
        for (int i = 3*N - 1; i >= 2*N; i--) {
            sum += arr[i];
            suffix[i] = sum;
            mx_heap.push(arr[i]);
        }

        // working on the window, keeping the sum always the minimum, storing in suffix.
        for (int i = 2*N - 1; i >= N; i--) {
            if (mx_heap.top() > arr[i]) {
                sum -= mx_heap.top();
                mx_heap.pop();
                mx_heap.push(arr[i]);
                sum += arr[i];
            }
            suffix[i] = sum;
        }

        ll ans = -1e15;

        // for every i, checking if the window size of N from left is eligible or not.
        for (int i = N - 1; i < 2*N; i++) {
            ans = max(ans, prefix[i] - suffix[i + 1]);
        }
        return ans;
   }
};
```
