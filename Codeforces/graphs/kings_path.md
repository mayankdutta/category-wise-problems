
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
    

