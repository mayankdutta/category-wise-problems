[Multiple Length](https://www.codingninjas.com/codestudio/contests/love-babbar-contest-4/problems/15544?leftPanelTab=0)

- one way was to get the product and then check the size of bits.
- but this would ended up in TLE.
- since we only need size of bit in the end.
- therefore taken `log with base 2`.

```cpp
int multipleLength(vector<int> &arr, int n) {
   double ans = 0;
    for (int i = 0; i < n; i++) {
        ans += (double)log2(arr[i]);
    }
    int result = (int)(ans) + 1;
    return result;
}
```
