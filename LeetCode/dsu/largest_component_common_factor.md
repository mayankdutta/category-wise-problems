[952. Largest Component Size by Common Factor](https://leetcode.com/problems/largest-component-size-by-common-factor/?utm_source=pocket_mylist)

- finding way to add edge in graph, was the most difficult part.
- for that we will store the edges, common factor wise, later make edge b/w all of them.
- for example
  ```js
  edges: [2, 4, 6, 9, 10]
  index: [0, 1, 2, 3, 4]

  mapping common factor to index

  2: 0, 1, 2, 4
  3: 2, 3
  5: 4
  7: NA
  ```

<details>
<summary> Code implementation </summary>

```cpp
class UnionFind {
  public:
  std::vector<int> Parent;
  std::vector<int> Size;

  void init(int n) {
      Size.resize(int(3e5) + 5, 1);
      Parent.resize(int(3e5) + 5, 0);

      for (int i = 0; i < n; i++)
          Parent[i] = i;
  }

  void makeSet(int n) {
      Parent[n] = n;
      Size[n] = 1;
  }

  int findSet(int i) {
      return (Parent[i] == i) ? i : (Parent[i] = findSet(Parent[i]));
  }

  bool isSameSet(int i, int j) { return findSet(i) == findSet(j); }

  void unionSet(int a, int b) {
      a = findSet(a);
      b = findSet(b);
      if (a == b)
          return;
      if (Size[a] < Size[b])
          std::swap(a, b);

      Parent[b] = a;
      Size[a] += Size[b];
  }
};

class Solution {
  public:
  int largestComponentSize(vector<int> &nums) {
      UnionFind dsu;
      map<int, vi> mp;
      for (int i = 0; i < nums.size(); i++) {
          auto temp = factorize(nums[i]);
          for (const auto &[key, value] : temp)
              mp[key].push_back(i);
      }
      dsu.init(2e5);
      for (const auto &[key, value] : mp) {
          for (int i = 0; i < value.size() - 1; i++) {
              dsu.unionSet(value[i], value[i + 1]);
          }
      }
      return *max_element(all(dsu.Size));
  }
};



```

</details>
