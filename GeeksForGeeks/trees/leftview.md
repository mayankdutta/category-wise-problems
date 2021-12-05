[Left view of the binary tree](https://practice.geeksforgeeks.org/problems/left-view-of-binary-tree/1#)

- Left view is nothing but first element if we traverse level wise.
- last element would fall in **right view category**.
 
<details>
<summary> Code </summary>

```cpp
vector<int> leftView(Node *root){
   if (root == nullptr) return {};
   vector<int> ans; 
   queue<Node*> qu; 
   qu.push(root);
   
   while (!qu.empty()) {
       int Size = qu.size(); 
       vector<int> temp; 
       
       for (int i = 0; i < Size; i++) {
           auto root = qu.front(); 
           qu.pop(); 
           
           temp.push_back(root -> data); 
           
           if (root -> left) qu.push(root -> left); 
           if (root -> right) qu.push(root -> right); 
       }
       if (!temp.empty()) ans.push_back(temp.front());
   }
   return ans; 
}
```
</details>
