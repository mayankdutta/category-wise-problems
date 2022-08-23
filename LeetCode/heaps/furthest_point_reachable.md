[ 1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach/)


#### [Explanation similar to](/Codeforces/greedy/potions.md)

<details>
<summary> Implementation </summary>

```cpp
   int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
        int n = heights.size(); 
        priority_queue<int, vector<int>, greater<int>> pq; 
        
        for (int i = 1; i < n; i++) {
            int diff = heights[i] - heights[i - 1];
            if (0 < diff) {
                pq.push(diff);
            }
            if (ladders < pq.size()) {
                bricks -= pq.top(); 
                pq.pop();
            }
            if (bricks < 0) {
                return i - 1;
            }
        }
        return n - 1;
    }

```
</details>
