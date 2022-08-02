### GENERAL TEMPLATE

- Each 0/1 Knapsack can be done by taking O(n) space of DP.

##### UNBOUNDED

```js
dp = []
for (i : start1 -> end1) 
  for (j: start2 -> end2) 
    dp[ ] = dp[ _, _ ];


```

- try this on pen and paper.
- we will be taking each value **UNBOUNDED**ly.

##### BOUNDED

- so as to make this thing bounded.

```js
dp = []
for (i : start1 -> end1) 
  for (j: end2 -> start2)
    dp[ ] = dp[ _, _ ];


```
