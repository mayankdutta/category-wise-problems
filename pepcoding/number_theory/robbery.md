### Problem statement

A thief plans to rob in a shop having 2 types of toys typeA toy and typeB toy.
Toys have some weight and cost. i.e. Toy A has weight given by "weightOfA" and
cost given by "ValueOfA" similarly ToyB has weight given by "weightOfB" and cost
given by "ValueOfB". Shop has Infinite toys of both type. Now thief has to rob some toys from the shop
such that he generates maximum cost but the problem is that the thief has to carry the toys in a
truck and the truck has a capacity (maximum weight which can be load on truck) given by "cap"
Now you have to help Robber to generate maximum amount such that the toys can be carried in given capacity truck.

##### Constraints

```java
1 <= cap       <= 10^9
1 <= valueOfA  <= 10^9
1 <= valueOfB  <= 10^9
1 <= weightOfA <= 10^9
1 <= weightOfB <= 10^9

```

##### Format

###### Input

The only line contains 5 space separated integers denoting cap capacity of Truck), valueOfA(cost of
type A toy), valueOfB(cost of type B toy), weightOfA(weight of type A toy)
weightOfB(weight of type B toy) respectively.

###### Output

MAX AMOUNT THAT CAN BE GENERATED

##### Example

###### Sample Input

```js
10 3 5 2 3

```

###### Sample Output

```java
16
```

### Possible solution

<details> 
<summary>  click to expand </summary>

- let say the `capacity = x`.
- take `LCM` of both the prices.
- till the `k * LCM` take the maximum either A or B.
- let the `remaining capacity(y)` `=` `x - k * LCM`
- possible sceneraios
  - `0 < y < capacity_of_A < capacity_of_B < LCM` :  have no option, can't choose.
  - `0 < capacity_of_A < y < capacity_of_B < LCM` :  have no other option, will have to pick A.
  - `0 < capacity_of_A < capacity_of_B < y < LCM` :  coin change **DP**.

</details>
