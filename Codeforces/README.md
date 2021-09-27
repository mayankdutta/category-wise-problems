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

2.  [C. King's Path](https://codeforces.com/contest/242/problem/C), Easy

    - question similar to the Leetcode question - Word Ladder.
    - do a simple BFS shortest paths with unit weight.
    - Main intuition was to have a bfs in grid that moves in 8 directions, because the king in a chess game moves in these 8 directions.
    - We have a set of cells, these are the only cells we can use. If we can make a path starting from the given node to the final node, we return the shortest distance.
    - if we can't reach the final cell, we return -1.
    - maintain a queue of pairs that store the input cell (x,y) and we traverse on the adjacent cells of this cell, i.e., the cells connected from common edge or corner of this cell.

        <details>
        	 <summary> Implementation stuff </summary> <br>
    
      ```cpp
        #include<bits/stdc++.h>
        using namespace std;
        #define ll long long int
        #define lld long double
        #define pii pair<ll,ll>
        #define vi  vector<ll>
        #define vii vector<pii>
        #define vvi vector<vector<ll>> 
        #define fast ios_base::sync_with_stdio(0);cin.tie(0);cout.tie(0);
        const ll MOD = 1e9 + 7;
        const ll N = 1e8;
        const ll M = 1e12 + 10;
        const ll inf = 1e9;
         
        int dx[8] = {0, 1, 0, -1, 1, -1, 1, -1};
        int dy[8] = {1, 0, -1, 0, 1, 1, -1, -1};
         
        ll solve(){
            ll x0, y0, x1, y1;
            cin >> x0 >> y0 >> x1 >> y1;
         
            map<pii, ll> in;
         
            ll n;   cin >> n;
            while(n--){
                ll r, a, b;     cin >> r >> a >> b;
                for (ll i = a; i<=b; i++){
                    in[{r, i}]++;
                }
            }
         
            if (in.find({x1, y1}) == in.end())  return -1;
            else{
                queue<pii> bfs;
                bfs.push({x0, y0});
                ll ct = 0;
                bool found = false;
         
                while(!bfs.empty()){
                    ct++;
                    ll n = bfs.size();
                    while(n--){
                        pii i = bfs.front();    bfs.pop();
                        ll x = i.first, y = i.second;
                        for (int j = 0; j<8; j++){
                            ll nx = x + dx[j], ny = y + dy[j];
                            if ((nx>=0 and nx<inf) and (ny>=0 and ny<inf)){
         
                                if (nx == x1 and ny == y1){
                                    return ct;
                                }
         
                                if (in[{nx, ny}] > 0){
                                    bfs.push({nx, ny});
                                    in[{nx, ny}] --;
                                }
         
                            }
                        }
                    }
                }
         
            }
         
            return -1;
        }
         
         
        int main(){
            fast;
         
            ll ans = solve();
            cout << ans << '\n';
         
            return 0;
        }
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

## Observation, Implementation

1. [E. Polycarp and String Transformation](https://codeforces.com/contest/1560/problem/E), Medium, Observation question
    - We just have to figure out the way by which given string is formed.
    - Once You found the way start kind of Backtracking and create the given string.
    - Always remember to Check the answer with base case
    - One corner case you should check. 
    - corner case  `qweqeewew` , output : `-1`
    - Approach
    - <details>
      
      - observe carefully last element of the `string t` must be the last element to be removed
      - lets just say we found that there are `n` different characters in `string t`
      - if we know the frequency of last character of `string t` and divide it by `n`
      - we can find the frequency of that `last character`
      - similarly by using this approach and gradually decreasing `n` we can get the frequency of every character
      - which is going to be present in my answer then
      - looping over `t` until the `frequency is zero` and we get
      - `string s` but to check the corner case we again
      - make `t` from `s` and compare it with initial given string
        </details>
      <details>
      <summary>Code sample </summary>
      
      ```cpp

       #include <bits/stdc++.h>
       using namespace std;
       
       string helper(string str, char ch) {
           str.erase(remove(str.begin(), str.end(), ch), str.end());
           return str;
       }
       
       int main() {
           int test;
           cin >> test;
           while (test--) {
               string str;
               cin >> str;
      
               unordered_map<char, int> mp;
               string tempString = "";
               vector<int> hash(26, 0);
               
               for (int i = 0; i < str.length(); ++i)
                 hash[str[i] - 'a']++;
               
               int countElements = 0;
               for (auto i : hash)
                 if (i > 0)
                   countElements++;
               
               int flag = 0;
               for (int i = str.length() - 1; i >= 0; i--) {
                 if (!mp.count(str[i]) && countElements > 0) {
                   if (hash[str[i] - 'a'] % countElements != 0) {
                     flag = 1;
                     break;
                   }
                   int k = hash[str[i] - 'a'] / countElements;
                   mp[str[i]] = k;
                   tempString += str[i];
                   countElements--;
                 }
               }
               
               if (flag == 0) {
                 reverse(tempString.begin(), tempString.end());
                 string ans = "";
                 for (int i = 0; i < str.length(); ++i) {
                   if (mp[str[i]] == 0)
                     break;
                   ans += str[i];
                   mp[str[i]]--;
                 }
                 string temp = ans, temp2 = ans;
               
                 for (int i = 0; i < tempString.length(); ++i) {
                   // Use helper function to remove all occurance of a character from string!!
                   temp2 = helper(temp2, tempString[i]);
                   temp += temp2;
                 }
               
                 if (temp == temp2)
                   cout << ans << " " << tempString << endl;
                 else
                   cout << -1 << endl;
               
               } else {
                 cout << -1 << endl;
               }
           }
       }


      ```
      </details>
