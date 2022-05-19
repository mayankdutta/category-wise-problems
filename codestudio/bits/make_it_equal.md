[Make it equal](https://www.codingninjas.com/codestudio/contests/love-babbar-contest-3/problems/16572?leftPanelTab=0&utm_source=pocket_mylist), Medium

- greedy type problem
- just traverse and count

#### NOTE

- for bits there are only two no.s **0 or 1**
- but the `&` operator will return values **0 or >0** _like 1, 2, 3 ,4_
- so always use `== 0, != 0` while checking conditions.

<details>
<summary> Implementation </summary>

```cpp
int makeItEqual(int a, int b, int c) {
    int p = a & b;
    int count = 0;
    for (int i = 0; i < 31; i++) {
        int current = (1 << i);
        int want = (c & current);

        if (want == 0)
            count += ((a & current) != 0 and (b & current) != 0);

        else {
            count += ((a & current) == 0 and (b & current) != 0);
            count += ((a & current) != 0 and (b & current) == 0);
            count += 2 * ((a & current) == 0 and (b & current) == 0);
        }
    }
    return count;
}

```

</details>
