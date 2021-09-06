## DFS / DSU / Connected components

1.  [Little Alawn's Puzzle](https://codeforces.com/contest/1534/problem/C),

    - A combinatorics problem that uses DFS.
    - Rated 1300 which is rare for a graph(related) problem

        <details>

      <summary>Sample Code</summary><br>

      ```cpp
        #include<bits/stdc++.h>
        using namespace std;

        #define pii pair<ll,ll>
        #define vi vector<ll>
        #define vii vector<pii>
        #define mi map<ll,ll>
        #define all(a) (a).begin(),(a).end()

        #define pb push_back
        #define ff first
        #define ss second
        #define mod 1000000007

        #define N 400001

        int arr[N][2];
        vector<int> adj[N];
        bool visited[N]={0};

        void dfs(int br){

            visited[br] = true;
            for(auto&x:adj[br])
            {

        if(!visited[x])
        dfs(x);
        }

        }
        void sol()
        {
        int n;
        cin >> n;
        for(int i=1;i <= n; i++)
        {
        cin >> arr[i][0];
        visited[i] = false;
        adj[i] = vector<int>();
        }
        for(int i=1;i <= n; i++)
        {
        cin >> arr[i][1];
        }

            for(int i=1;i<=n;i++){

        adj[arr[i][0]].push_back(arr[i][1]);
        adj[arr[i][1]].push_back(arr[i][0]);
        }
        ll ans = 1;
        for(int i=1;i<=n;i++)
        {
        if(!visited[i]){
        ans= ans \* 2 % mod;
        dfs(i);
        }
        }
        cout << ans << '\n';
        }
        int main()
        {
        int tc;
        cin>>tc;
        while(tc--)
        sol();
        return 0;
        }
      ```

     </details>

## Graphs, Dijkstra

1.  [C. Dijkstra?](https://codeforces.com/problemset/problem/20/C), Easy

    - no tricks just plain implementation.
    - implemented the most basic dijsktra
    - implementation method was using priority queue
        <details>
        	<summary> Headers </summary> <br>

      ```cpp
        #define vll vector<long long int>
        using ll = long long int;

        vector<vector<pll>> adj = vector<vector<pll>>(n + 1);
        for (int i = 0; i < m; i++) {
          ll a, b, w;
          cin >> a >> b >> w;
          adj[a].push_back({b, w});
          adj[b].push_back({a, w});
        }

        int s = 1; /* source */
        vll dist(n + 1, INF);
        vll path(n + 1, INF);
        dist[s] = 0;

      ```

        </details>

        <details>
        	 <summary> Implementation stuff </summary> <br>

      ```cpp
        priority_queue<pll, vector<pll>, greater<pll>> pq;

        pq.push({0, s});
        /* Format is (distance, vertex) */

        while (!pq.empty()) {
        auto front = pq.top();
        pq.pop();
        ll d = front.first;
        ll u = front.second;

        if (d > dist[u])
           continue; // trying to understand this

      	for (const auto &v : adj[u]) {
        	/*
      	 	 * take v.first as 'to'
      	 	 * u as 'from'
         	*/
        		if (dist[u] + v.second < dist[v.first]) {
      			dist[v.first] = dist[u] + v.second;
      			pq.push({dist[v.first], v.first});
      			path[v.first] = u;
        		}
      	}
      	}
      ```

      </details>
      <details>
      	<summary> Tracking Shortest distance </summary>

      ```cpp
        vll ans;
        for (int i = n; i != 1; i = path[i])
         ans.push_back(i);
      	  ans.push_back(1);

         reverse(all(ans));

      ```
      </details>

## Prefix, cummulative sum

1.  [D. Make a Power of Two](https://codeforces.com/contest/1560/problem/D), Easy
    - We just have to figure out that it is asking for prefix of main string, with power of 2, to be matched.
    - The string which matched the most, will be tracked.
      <details>
      <summary>Code sample </summary>

      ```cpp
      void solve() {
          std::string s;
          std::cin >> s;

          int res = 1E9;

          for (int i = 0; i < 64; i++) {
          std::string t = std::to_string(1ULL << i);

              int k = 0;
              for (int j = 0; j < int(s.length()); j++) {
                  if (k < int(t.length()) && s[j] == t[k]) {
                      k++;
                  }
              }
              
              res = std::min(res, int(s.length()) + int(t.length()) - 2 * k);
          }
          std::cout << res << "\n";
      }
      ```
      </details>

## Map, String, Pattern, Implementation

1.  [E. Polycarp and String Transformation](https://codeforces.com/contest/1560/problem/E), Medium
    - We just have to figure out the way by which given string is formed.
    - Once You found the way start Backtracking and create the given string.
    - Always remember to Check the answer with base case
      <details>
      <summary>Code sample </summary>

      ```cpp
     #include<bits/stdc++.h>
      using namespace std;
      
      string er(string str, char a){
          str.erase(remove(str.begin(), str.end(), a), str.end());
          return str;
      }
      int main(){
          int test;
          cin>>test;
          while(test--){
              string s;
              cin>>s;
              unordered_map<char,int>m;
              string se="";
              vector<int>v(26,0);
              for (int i = 0; i < s.length(); ++i) {
                  v[s[i]-'a']++;
              }
              int cd=0;
              for(auto x:v){
                  if(x>0){
                      cd++;
                  }
              }
            // cd++;
      //       m[s[s.length()-1]]=v[s[s.length()-1]-'a']/cd;
      //        cd--;
              int f=0;
              for (int i = s.length()-1; i >=0 ; i--) {
                  if(!m.count(s[i]) && cd>0){
                      if(v[s[i]-'a']%cd!=0){
                          f=1;
                          break;
                      }
                      int k=v[s[i]-'a']/cd;
      //                cout<<s[i]<<" ";
                      m[s[i]]=k;
                      se+=s[i];
                      cd--;
                  }
              }
      //        for (auto itr=se.begin();itr!=se.end();itr++){
      //            cout<<(*itr)<<endl;
      //        }
            if(f==0){
                reverse(se.begin(),se.end());
                //cout<<se;
                string ans="";
                for (int i = 0; i < s.length(); ++i) {
                    if(m[s[i]]==0){
                        break;
                    }
                    ans+=s[i];
                    m[s[i]]--;
                }
                string res1=ans,str=ans;
      
                for (int i = 0; i < se.length(); ++i) {
                      str= er(str,se[i]);
                    res1+= str;
                }
                if(res1==s)
                cout<<ans<<" "<<se<<endl;
                else{
                    cout<<-1<<endl;
                }
            }
            else{
                cout<<-1<<endl;
            }
          }
          return 0;
      }
      </details>
