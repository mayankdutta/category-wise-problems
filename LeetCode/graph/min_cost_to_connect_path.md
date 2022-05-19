[1584. Min Cost to Connect All Points](https://leetcode.com/problems/min-cost-to-connect-all-points/)

- basic implementation of MST.
- sort all possible connections (edges) by its distance;
- from the shortest edge, try to merge islands (union), 
- if it enables 2 islands merged, 
- this edges will be a critical connection, count it in as part of MST.


<details>
<summary> implementation </summary>

```cpp
class UnionFind {
    std::vector <int> p;
    std::vector <int> rank;
    public:

    UnionFind (int N) {
        rank.resize (int(1e6)+ 2, 0);
        p.resize (int(1e6)+ 2, 0);
        for (int i=0; i<N; i++) p[i] = i;
    }

    int findSet (int i) {
        return (p[i] == i) ? i : (p[i] = findSet (p[i]));
    }

    bool isSameSet (int i, int j) {
        return findSet(i) == findSet(j);
    }

    void unionSet (int i, int j) {
        if (!isSameSet (i, j)) {
            int x = findSet (i), y = findSet (j);
            if (rank [x] > rank[y]) p[y] = x;
            else {
                p[x] = y;
                if (rank [x] == rank[y]) rank [y] ++;
            }
        }
    }
};

struct edge {
    int from, to, w;
};

class Solution {
public:
    int minCostConnectPoints(vector<vector<int>>& points) {
        vector<edge> arr;
        for (int i= 0; i < points.size(); i++) {
            for (int j = 0; j < i; j++) {
                int dist = abs(points[j][1] - points[i][1]) + abs(points[j][0] - points[i][0]);
                arr.push_back({i,j, dist});
            }
        }

        UnionFind dsu(arr.size() + 6);
        sort(arr.begin(), arr.end(), [](const edge& a, const edge& b) -> bool{
            return a.w < b.w;
        });

        int ans = 0;
        for (int i = 0; i < arr.size(); i++) {
            if (!dsu.isSameSet(arr[i].from, arr[i].to)) {
                ans += arr[i].w;
                dsu.unionSet(arr[i].from, arr[i].to);
            }
        }
        return ans;
    }
};

```

</details>
