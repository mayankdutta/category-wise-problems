[Maximum sum of two non-overlapping subarrays of a given size](https://www.codingninjas.com/codestudio/problems/maximum-sum-two-non-overlapping-subarrays-of-a-given-size_800291?topList=top-array-coding-interview-questions&leftPanelTab=0)

###### same problem but with [subsequence](/GeeksForGeeks/prefix/geekland_colosseum.md).

- we are hoping to get two maximum sum sub-array one from left side, and another from right.
- both of them separated just from a **slider**, before the slider we should be prepared with the maximum sub-array with size `K`, and same at the right hand side.
- let's talk before the **slider** first.
- first we must prepare a window of size `K`.
- after having the window, slide it storing the maximum sum at every `i`.
- do the same for the right hand side of **slider**.
- now then we have value stored that we need.
- in another loop iterate the slider once again and get the answer by the sum of `left hand side` of slider and the `right hand side` of the slider.

```cpp
int maxSumTwoSubarray(int arr[], int N, int K) {
  vector<int> prefix(N), suffix(N);
  vector<int> pre(N), suf(N);

  int sum = 0;

  // preparing sliding window of size K.
  for (int i = 0; i < K; i++) {
    sum += arr[i];
    prefix[i] = sum;
  }

  // note that we have been asked the subarray, therefore will have to proceed
  // this way, otherwise will have to proceed the priority_queue/set method if
  // the subsequence would have been asked.
  for (int i = K; i < N; ++i) {
    sum -= arr[i - K];
    sum += arr[i];
    prefix[i] = sum;
  }

  sum = 0;

  // preparing a sliding window of size K from the end.
  for (int i = N - 1; i >= N - K; i--) {
    sum += arr[i];
    suffix[i] = sum;
  }

  for (int i = N - K - 1; i >= 0; i--) {
    sum -= arr[i + K];
    sum += arr[i];
    suffix[i] = sum;
  }

  // till i < K, means sliding window was being prepared, we wont be able to
  // judge answert at this point.
  for (int i = 0; i < K; i++)
    pre[i] = prefix[i];

  // after that we will begin the process of finding the maximum subarray sum.
  for (int i = K; i < prefix.size(); i++)
    pre[i] = max(pre[i - 1], prefix[i]);

  for (int i = N - 1; i >= N - 1 - K; i--)
    suf[i] = suffix[i];

  for (int i = N - 1 - K - 1; i >= 0; i--)
    suf[i] = max(suf[i + 1], suffix[i]);

  reverse(suf.begin(), suf.end());

  int ans = -1e9;

  // for left hand side subarray, we will be requiring just after index, maximum
  // sum subarray.
  for (int i = K - 1; i <= N - 1 - K; i++) {
    ans = max(ans, pre[i] + suf[i + 1]);
  }

  return ans;
}


```
