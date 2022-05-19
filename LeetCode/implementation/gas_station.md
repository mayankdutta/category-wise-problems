[134. Gas Station ](https://leetcode.com/problems/gas-station/)

- just wrote whatever asked to do.
<details>
<summary> brute </summary>

```cpp

class Solution {
    public:
    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
        vector<int> start;
        int n = gas.size();
        for (int i = 0; i < n; i++)
            if (gas[i] > cost[i])
                start.push_back(i);

        if (start.empty())
        for (int i = 0; i < n; i++)
            if (gas[i] >= cost[i])
                start.push_back(i);

        for (const auto& s: start) {
            bool flag = true;
            int petrol = gas[s];
            for (int i = s + 1, index = 0; index < n; i++, index++) {
                i %= n;
                int curr = i;
                int prev = (n + i - 1) % n;
                petrol -= cost[prev];

                if (petrol < 0) {
                    flag = false;
                    break;
                }
                petrol += gas[curr];
            }
            if (flag) {
                return s;
            }
        }
        return -1;
    }
};

```

</details>

<hr>

- we proceed by choosing the first element
- if we encounter any `-ve` element, we will immediately choose that one.
- we will traverse twice the size of original array, so that we may have each element.

<details> 
<summary> optimal </summary>

```cpp
class Solution {
    public int canCompleteCircuit(int[] gas, int[] cost) {
        int diff = 0;
        int count = 0;
        int n = gas.length;

        for (int i = 0; i < 2 * n; i++) {
            diff += gas[i % n] - cost[i % n];
            count ++;

            if (diff < 0) {
                count = 0;
                diff = 0;
            }

            if (count == n) {
                return (i + 1) % n;
            }
        }
        return -1;
    }
}
```

</details>
