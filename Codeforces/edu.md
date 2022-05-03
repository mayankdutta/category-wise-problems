## DSU 
### Step 1
##### C. [Experience](https://codeforces.com/edu/course/2/lesson/7/1/practice/contest/289390/problem/C)
- Approach
  - Idea was to slightly change the implementation of DSU.
  - During `get` operation we should include the rating of `parents` as well. 
  - To work out above statement, we will have to implement `naive` findSet operation without `heurastic`.
  - and we also need to store prior sum somewhere. so that it may not include in the account of children.


<details>
<summary> implementation</summary>

```cpp

  class UnionFindSlow {
  public:
    std::vector<int> Parent;
    std::vector<int> Size;
    std::vector<int> score;
  
    void init(int n) {
      /* You may want to change the size. */
      Size.resize(int(3e5) + 5, 1);
      Parent.resize(int(3e5) + 5, 0);
      score.resize(int(3e5) + 5, 0);
  
      for (int i = 0; i < n; i++)
        Parent[i] = i;
    }
  
    void makeSet(int n) {
      Parent[n] = n;
      Size[n] = 1;
    }
  
    int findSet(int v) { return (v == Parent[v] ? v : findSet(Parent[v])); }
  
    int get(int v) {
      return (v == Parent[v] ? score[v] : score[v] + get(Parent[v]));
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
      score[b] -= score[a];
    }
  } sdsu;
  
  void solve() {
    int n, q;
    cin >> n >> q;
  
    sdsu.init(n + 10);
    while (q--) {
      string s;
      cin >> s;
      if (s == "get") {
        int n;
        cin >> n;
        cout << sdsu.get(n) << '\n';
  
      } else if (s == "join") {
        int a, b;
        cin >> a >> b;
        sdsu.unionSet(a, b);
  
      } else if (s == "add") {
        int index, value;
        cin >> index >> value;
        sdsu.score[sdsu.findSet(index)] += value;
      }
    }
  }
```
</details>



## Binary Search
### Step 1
### Step 2
### Step 3
### Step 4
### Step 5

## Two pointers
### Step 1
### Step 2
### Step 3
