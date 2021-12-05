[bottom view of the binary tree](https://practice.geeksforgeeks.org/problems/bottom-view-of-binary-tree/1)

- horizontal distance approach. 
- we will find form how much particular node differs from origin one.
- will store till the last occurrence, if store only to the first occurrence then it would be **TOP VIEW TRAVERSAL**.

<details>
<summary> Code </summary>

```cpp
class Solution {
  public:
    vector <int> bottomView(Node *root) {
        map<int, int> mp; 
        queue<pair<Node*, int>> qu;
        qu.push({root, 0}); 
        
        while (!qu.empty()) {
            int Size = qu.size(); 
            for (int i = 0; i < Size; i++) {
    
                auto root = qu.front().first; 
                auto hd = qu.front().second; 
                
                qu.pop(); 
                
                // if (!mp.count(hd)) {
                    mp[hd] = root -> data;
                // }
                
                if (root -> left) qu.push({root -> left, hd - 1});
                if (root -> right) qu.push({root -> right, hd + 1});
            }
        }
        vector<int> ans; 
        
        for (const auto& i: mp) 
            ans.push_back(i.second); 
        
        return ans;
    }
};
```
</details>
