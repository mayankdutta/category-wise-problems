## DFS / DSU / Connected components 
1. [Little Alawn's Puzzle](https://codeforces.com/contest/1534/problem/C)
    - A combinatorics problem that uses DFS.
	- Rated 1300 which is rare for a graph(related) problem

  <summary><b>⚙️ Things I use to get stuff done</b></summary>
  	<ul>
  	    <li><b>OS:</b> #include<bits/stdc++.h>
using namespace std;
typedef long long int ll;
typedef long double ld;
#define rep(i,a,b)  for(ll i=a;i<b;i++)
#define nl cout<<endl

#define pii pair<ll,ll>
#define vi  vector<ll>
#define vii vector<pii>
#define mi  map<ll,ll>
#define all(a)  (a).begin(),(a).end()

#define FOREACH(it, l) for (auto it = l.begin(); it != l.end(); it++)
#define print_arr(arr, n) for (int i = 0; i < n; i++) std::cout << arr[i] << ' '; std::cout << '\n';
#define fast std::ios_base::sync_with_stdio(0);std::cin.tie(0);std::cout.tie(0);

#define pb push_back
#define ff first
#define ss second
#define mod 1000000007

#define test4(x,y,z,a) cout<<"x is "<<x<<"		y is "<<y<<"		z is "<<z<<"		a is "<<a<<endl;
#define test3(x,y,z) cout<<"x is "<<x<<"		y is "<<y<<"		z is "<<z<<endl;
#define test2(x,y) cout<<"x is "<<x<<"		y is "<<y<<endl;
#define test1(x) cout<<"x is "<<x<<endl;
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
 </li>
	    <li><b>Laptop: </b> A random Monitor connected to a dying laptop </li>
  	    <li><b>Browser: </b> Chrome </li>
	    <li><b>Terminal: </b> ZSH: Oh My Zsh </li>
	    <li><b>Code Editor:</b> Sublime Text </li>
	    <li><b>To Stay Updated:</b> Dev.to, Medium, Linkedin and Twitter.</li>
	    <br />
	⚛️ Checkout My Sublime Configrations <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Here</a>.
	</ul>	

