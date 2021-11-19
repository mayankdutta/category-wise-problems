[461. Hamming Distance](https://leetcode.com/problems/hamming-distance/)

In layman terms hammering distance is the no. of times when both the no.s had different bits.


```js
  1: 0 0 0 1
  4: 0 1 0 0
```

there were 2 places where both bits were different.



### XOR method 

- xor basically will allow to have one on the places having different bits.
- can exploit this property

<details>
<summary>Implementation</summary>

```cpp
int hammingDistance(int x, int y) {
  int temp = x ^ y;
  int ans = 0;
  while (temp) {
    ans += (temp & 1);
    temp = temp >> 1;
  }
  return ans;
}
```
</details>


### Brian-Kernighan algo
- this specific algo counts no. of set bits
  ```js
  For example - 
  let n = 13 (1101).
  1.
     n-1 = 1100            => Each bit from rightmost set bit is flipped
     n = n&(n-1) = 1100    => rightmost bit got unset
  
  2. Now, n = 1100
     n-1 = 1011            => Each bit from rightmost set bit is flipped
     n = n&(n-1) = 1000    => rightmost bit unset
  
  3. Now, n = 1000
     n-1 = 0111            => Each bit from rightmost set bit is flipped
     n = n&(n-1) = 0000    => rightmost bit unset
  
  n becomes 0 and we get the count of set bits which is 3.
  ```
- method adopted in this is kind of `n - (n & -n)`.
- other methods can be `n ^ (n & (~n + 1))`
- a more simpler one is `n & (n-1)`

<details> 
<summary>Implementation</summary>

```java
class Solution {
  public int hammingDistance(int x, int y) {
    int n = x ^ y;
    int count = 0;
    while (n > 0) {
      count++;
      int rsb = n & (-n);
      n &= ~(rsb); // subtracting rsb from original no, n -= rsb will also do. 
    }
    return count;

  }
}
```
