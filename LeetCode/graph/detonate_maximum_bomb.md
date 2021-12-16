[2101. Detonate the Maximum Bombs](https://leetcode.com/contest/biweekly-contest-67/problems/detonate-the-maximum-bombs/), Medium 

```js
the instant you recognize that this is a graph problem, you would have won.
```


- with the given details 
- we have to check if the other bomb's center is lying in one's bomb range
  - if so, then we would explode that too
- base on that we will form the edges 
- and then BFS / DFS it. 
- **DSU won't work, because edges will be of directed nature.**

<details>
<summary> BFS implementation </summary> 

```cpp

class Solution {
    using ll = long long int;
    public:
    ll dist(int x, int y, int xx, int yy) {
        ll one = x - xx;
        ll two = y - yy;
        return (one * one  + two * two);
    }
    int maximumDetonation(vector<vector<int>>& bombs) {
        int n = bombs.size();
        vector<vector<int>> arr(n + 1);

        for (int i = 0; i < bombs.size(); i++) {
            ll x = bombs[i][0];
            ll y = bombs[i][1];
            ll r = bombs[i][2];

            for (int j = 0; j < bombs.size(); j++) {
                if (i == j) continue;

                ll xx = bombs[j][0];
                ll yy = bombs[j][1];
                ll rr = bombs[j][2];

                long long int d = dist(x, y, xx, yy);
                if (d <= r * r) {
                    ll a = i; 
                    ll b = j;
                    arr[a].push_back(b);
                }
            }
        }

        int ans = 0; 
        for (int i = 0; i < n; i++) {
            queue<int> qu; 
            vector<int> dist(n + 1, 0);

            qu.push(i);
            dist[i] = 0;

            while (!qu.empty()) {
                auto u = qu.front();
                qu.pop();

                for (const auto& v: arr[u]) {
                    if  (!dist[v]) {
                        qu.push(v);
                        dist[v] = dist[u] + 1;
                    }
                }
            }

            int count = 1; 
            for (int j = 0; j < n; j++)  {
                if (i == j) 
                    continue; 
                count += (dist[j] != 0);
            }
            ans = max(ans, count);
        }

        return ans;
    }
};

```

</details> 
