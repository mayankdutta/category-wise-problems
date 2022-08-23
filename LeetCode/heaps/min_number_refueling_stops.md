[871. Minimum Number of Refueling Stops](https://leetcode.com/problems/minimum-number-of-refueling-stops/)

#### [Explanation similar to](/Codeforces/greedy/potions.md)

<details>
<summary> Implementation </summary>

```cpp
class Solution {
    public:
    int minRefuelStops(int target, int startFuel, vector<vector<int>>& stations) {
        int n = stations.size();
        priority_queue<int> pq;
        int prev = 0;
        int tank = startFuel;
        int count = 0;

        for (int i = 0; i < n; i++) {
            int position = stations[i][0];
            int fuel = stations[i][1];

            tank -= (position - prev);

            while (!pq.empty() && tank < 0) {
                tank += pq.top();
                pq.pop();
                count ++;
            }

            if (tank < 0) {
                return -1;
            }

            pq.push(fuel);
            prev = position;
        }

        tank -= (target - prev);
        while (!pq.empty() && tank < 0) {
            tank += pq.top();
            pq.pop();
            count ++;
        }

        if (tank < 0) {
            return -1;
        }

        return count;
    }
};

```

</details>
