[Divide and print](https://www.codingninjas.com/codestudio/contests/codestudio-weekend-contest-5/problems/15192?leftPanelTab=0)

- it was a basic problem.
- only implementation matters in this one.
- below is mine.

<details>
<summary> implementation </summary>

```cpp
string isFlexible(int n, vector<int> arr) {
  int i = 1;
  while (i < n and arr[i - 1] < arr[i])
    i++;
  int stop_one = i;

  while (i < n and arr[i - 1] == arr[i])
    i++;
  int stop_two = i;

  if (stop_one == stop_two)
    return "NO";
  if (stop_two == n)
    return "YES";

  while (i < n and arr[i - 1] > arr[i])
    i++;

  return (i == n ? "YES" : "NO");
}

```

</details>
