#Binary Lifting
Find the kth ancestor.

in the code upto 2^6 th ancestor.

```cpp
#include<bits/stdc++.h>
using namespace std;
 
int main(){
 
    // binary lifting
    vector<int> parent = {-1 , 0 , 1 , 3 , 5 , 1 , 1, 3 , 2 , 8};
    int n = parent.size();
    int dp[6][10];
 
    // build table
    for (int i = 0 ; i < n ; i++){
        dp[0][i] = parent[i];
    }
 
    for (int i = 1 ; i < 6 ; i++){
        for (int node = 0 ; node < parent.size() ; node++){
            int parent = dp[i-1][node];
            if (parent != -1){
                dp[i][node] = dp[i-1][parent];
            }
            else {
                dp[i][node] = -1;
            }
        }
    }
 
    int q;
    cin >> q;
    while (q--)
    {
        int node , k;
        cin >> node >> k;
 
        for (int i = 0 ; i < 6 and node != -1 ; i++){
            if ((k & (1<<i)) > 0){
                node = dp[i][node];
            }
        }
        cout << node << endl;
    }
 
 
    return 0;
}
```
