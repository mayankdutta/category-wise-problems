[841. Keys and Rooms](https://leetcode.com/problems/keys-and-rooms/)

- it should strike DFS kind of approach
- there is nothing else to mention but the Implementation.

##### DFS

<details>
<summary> DFS Implementation </summary>

```cpp
class Solution {
public:
    bool canVisitAllRooms(vector<vector<int>>& rooms) {
        int n = rooms.size();
        int m = rooms[0].size();

        vector<bool> used(n + 1, false);
        auto dfs = [&](const auto& self, const int& u) -> void {
            used[u] = true;

            for (const auto& v: rooms[u]) {
                if (!used[v]) {
                    self(self, v);
                }
            }
        };

        for (const auto& i: rooms[0])
            dfs(dfs, i);

        for (int i = 1; i < n; i++) {
           if (!used[i]) {
               return false;
           }
        }

        return true;
    }
};
```

</details>

##### BFS

<details>
<summary> BFS Implementation </summary>

```cpp
class Solution {
    public:
    bool canVisitAllRooms(vector<vector<int>>& rooms) {
        queue<int> qu;
        vector<bool> used(rooms.size(), false);
        for (auto& i: rooms[0]) {
            used[i] = true;
            qu.push(i);
        }

        while (!qu.empty()) {
            auto u = qu.front();
            qu.pop();

            for (const auto& v: rooms[u]) {
                if (used[v]) continue;
                used[v] = true;
                qu.push(v);
            }
        }
        for (int i = 1; i < rooms.size(); i++) {
            if (!used[i]) {
                return false;
            }
        }
        return true;
    }
};
```

</details>
