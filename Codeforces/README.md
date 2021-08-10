## DFS / DSU / Connected components 
1. [Little Alawn's Puzzle](https://codeforces.com/contest/1534/problem/C)
    - A combinatorics problem that uses DFS.
	- Rated 1300 which is rare for a graph(related) problem
	
<details>
<summary>How do I dropdown?</summary>
<br>

```cpp
#include<bits/stdc++.h>
using namespace std;


#define pii pair<ll,ll>
#define vi  vector<ll>
#define vii vector<pii>
#define mi  map<ll,ll>
#define all(a)  (a).begin(),(a).end()

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
	for(int i=1;i <=  n; i++)
	{
		cin >> arr[i][0];
		visited[i] = false;
		adj[i] = vector<int>();
	}
	for(int i=1;i <=  n; i++)
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
			ans= ans * 2 % mod;
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
This is how you dropdown.
</details>



