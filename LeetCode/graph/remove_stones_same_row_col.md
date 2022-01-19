[947. Most Stones Removed with Same Row or Column](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/)

#### DSU

- first we must strike that we will have to form edges.
- we will also have to merge the one's having same edge.
- at the end we just have to count the total no. of unique parents, so that we may remove all the stones but the parents.
- also there may be various disconnected components hence we will have to collect all the parents.
- you might want to check the method to have parents.

<details> 
<summary> implementation </summary>

```cpp
class Solution {
    public:

    class UnionFind {
        public:
        std::vector<int> Parent;
        std::vector<int> Size;

        void init(int n) {
            Size.resize(1005);
            Parent.resize(1005);

            for (int i = 0; i < n; i++)
                add(i);
        }

        void add(int n) {
            Parent[n] = n;
            Size[n] = 1;
        }

        int find(int i) {
            return (Parent[i] == i) ? i : (Parent[i] = find(Parent[i]));
        }

        bool is_same(int i, int j) { return find(i) == find(j); }

        void merge(int a, int b) {
            a = find(a);
            b = find(b);
            if (a == b)
                return;
            if (Size[a] < Size[b])
                std::swap(a, b);

            Parent[b] = a;
            Size[a] += Size[b];
        }
    } dsu;


    int removeStones(vector<vector<int>>& stones) {
        int n = stones.size();
        dsu.init(1005);

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (stones[i][0] == stones[j][0])  dsu.merge(i, j);
                if (stones[i][1] == stones[j][1])  dsu.merge(i, j);
            }
        }

        int ans = 0;
        set<int> parents;
        for (int i = 0; i < n; i++)
            parents.insert(dsu.find(i));

        for (const auto& i: parents)
            ans += (dsu.Size[i]) - 1;

        return ans;
    }
};

```

</details>
