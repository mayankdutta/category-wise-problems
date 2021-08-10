## DFS / DSU / Connected components 
1. [Little Alawn's Puzzle](https://codeforces.com/contest/1534/problem/C)
    - A combinatorics problem that uses DFS.
	- Rated 1300 which is rare for a graph(related) problem
	
<details>
<summary>Sample Code</summary>
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
</details>




## Binary Search
1. [875. Koko Eating Bananas]https://leetcode.com/problems/koko-eating-bananas/)
    
	- A fine problem on binary search (a good example of BS over unsorted content)

<details>
<summary>Sample Code</summary>
<br>

```cpp
class Solution {
public:
    int minEatingSpeed(vector<int>& piles, int h) {
        // consider this as a sequence of ( possible[0] , possible[1] , possible[2] , possible[3] , ..)
        // then for values it will look something like (false, false , false , . .. true,true true)
        // intuition is that if any x is a possible answer it is guaranteed that x+1, x+2 .. will also be an answer
        
        int high = *max_element(piles.begin(),piles.end());
        int low = 1;
        
        while(low < high){
            int mid = low + (high-low)/2;
            int timeNeeded = 0; 
            for(auto&x:piles){
                timeNeeded += (x/mid);
                if(x%mid) timeNeeded++;
            }
            if(timeNeeded > h)
                low = mid + 1;
            else high = mid;
        }
        return low;
        
    }
};

```
</details>

	 



