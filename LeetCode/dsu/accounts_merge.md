[721. Accounts Merge](https://leetcode.com/problems/accounts-merge/), DSU implementation, graph, hard

### DSU approach
- using DSU over string will require more memory.
- to avoid that if we could some sort of encoding to encode string into integer.
- we need to implement our own DSU, and it is quite different this time.
- that was the key point.

<details>
<summary> code sample </summary>

```cpp

class DSU {
  public:
  vector<int> parent; 
  DSU(int n) {
    n += 2;
    parent.resize(n);
    for (int i = 0; i < n; i++) 
      parent[i] = i;
  }

  int find(int n) {
    return (n == parent[n] ? n : parent[n] = find(parent[n]));
  }

  void unionSet(int name, int email) {
    name = find(name); 
    email = find(email); 
    parent[email] = parent[name];
  }
};

class Solution {
  public:
  vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {
    map<string, int> encode;
    DSU dsu(accounts.size() + 2);

    for (int i = 0; i < accounts.size(); i++) {
      for (int j = 1; j < accounts[i].size(); j++) {
        string email = accounts[i][j];
        if (encode.count(email)) dsu.unionSet(i, encode[email]);
        else encode[email] = i;
      }
    }

    map<int, vector<string>> mp;
    for (const auto& [emailId, encodedParent]: encode) {
      int id = dsu.find(encodedParent);
      mp[id].push_back(emailId);
    }

    vector<vector<string>> ans;
    for (auto& [id, arr]: mp) {
      sort(arr.begin(), arr.end());
      vector<string> temp{accounts[id][0]};
      for (const auto& i: arr) temp.push_back(i);
      ans.push_back(temp);
    }
    return ans;
  }
};

```

</details>



### DFS

- to be updated soon.
