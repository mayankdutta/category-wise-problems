. [D - 8 Puzzle on Graph](https://atcoder.jp/contests/abc224/tasks/abc224_d)
   - A reasonably good problem on shortest paths in strings.
   - Key observation : only 9! possible states, find the shortest path from given state to - '123456789'
   
    

   - Above approach with few optimization. 
     ```cpp
        #include<bits/stdc++.h>
        using namespace std;
          int main()
          {
            int m;
            cin>>m;
            int u,v;
            vector<int>G[10];
            while(m--)
            {
              cin>>u>>v;
              G[u].push_back(v);
              G[v].push_back(u);
            }
            int p;
            string s="999999999";
            for(int i=1;i<=8;i++)
            {
              cin>>p;
              s[p-1]=i+'0';
            }
            queue<string>q;
            map<string,int>mp;
            mp[s]=0;
            q.push(s);
            while(q.size())
            {
              string s=q.front();
              q.pop();
              for(int i=1;i<=9;i++)
                if(s[i-1]=='9')
                  v=i;
              for(auto u:G[v])
              {
                string t=s;
                swap(t[u-1],t[v-1]);
                if(mp.count(t))
                  continue;
                mp[t]=mp[s]+1;
                q.push(t);
              }
            }
            if(mp.count("123456789")==0)
              cout<<-1<<endl;
            else
              cout<<mp["123456789"]<<endl;
           } 
     ```
      </details>
   - Approach
      - Breadth first search 
