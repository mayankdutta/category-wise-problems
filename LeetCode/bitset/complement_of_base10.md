[1009. Complement of Base 10 Integer](https://leetcode.com/problems/complement-of-base-10-integer/)

- idea is to take all the bits and XOR them.
- we were unaware of the size, so we did find that out first.
- there are more optimal approach, will add them.

```cpp
int bitwiseComplement(int n) {
  if (n == 0) return 1;
  int temp = n; 
  int Size = 0; 
  while (temp) {
    temp = temp >> 1;
    Size ++;
  }

  for (int i = 0; i < Size; i++) 
    n ^= (1 << i);

  return n;
}
```
