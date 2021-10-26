. [D - 8 Puzzle on Graph](https://atcoder.jp/contests/abc224/tasks/abc224_d)
   - A reasonably good problem on shortest paths in strings.
   - Key observation : only 9! possible states, find the shortest path from given state to - '123456789'
   
    

   - Above approach with few optimization. 
     ```cpp
               #include <bits/stdc++.h>
               using namespace std;

               int main()
               {
                   int m;
                   cin >> m;
                   vector<int> G[10];

                   for(int i = 0 ; i < m ; i++){
                       int u,v;
                       cin >> u >> v;
                       u--; v--;
                       G[u].push_back(v);
                       G[v].push_back(u);
                   }
                   string goal = "999999999";
                   for(int i = 1 ; i <= 8 ; i++){
                       int p;
                       cin >> p;
                       goal[p-1]='0'+i;
                   }

                   string s = "123456789"; // s[t-1]=p  場所tにコマpが置かれている
                   queue<string> que;
                   map<string,int> ma;
                   ma[s] = 0;
                   que.push(s);
                   while(!que.empty()){
                       string now_s = que.front(); que.pop();
                       int pos_empty;
                       for(int i = 0 ; i < 9 ; i++){
                           if(now_s[i]=='9'){
                               pos_empty = i;
                           }
                       }

                       for(int next_empty : G[pos_empty]){
                           string next_s = now_s;
                           swap(next_s[next_empty],next_s[pos_empty]);
                           if(ma.count(next_s)==0){
                               que.push(next_s);
                               ma[next_s] = ma[now_s]+1;
                           }
                       }
                   }

                   if(ma.count(goal)==0){
                       cout << -1 << endl;
                   }else{
                       cout << ma[goal] << endl;
                   }
               }
               
     ```
      </details>
   - Approach
      - Breadth first search 
