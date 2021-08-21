## CP Templates

<details>
<summary>Normal template</summary>

```cpp
#include <bits/stdc++.h>
/* #include <algorithm> */
/* #include <iostream> */
/* #include <map> */
/* #include <numeric> */
/* #include <queue> */
/* #include <set> */
/* #include <stack> */
/* #include <vector> */
using namespace std;
using ll = long long int;
using lld = long double;

#define mp make_pair
#define pb push_back
#define accu accumulate

#define vi std::vector<int>
#define vb std::vector<bool>
#define vc std::vector<char>
#define vd std::vector<double>
#define vlld std::vector<long double>
#define vll std::vector<long long int>

#define vvi std::vector<std::vector<int>>
#define vvb std::vector<std::vector<bool>>
#define vvc std::vector<std::vector<char>>
#define vvd std::vector<std::vector<double>>
#define vvlld std::vector<std::vector<long double>>
#define vvll std::vector<std::vector<long long int>>

#define pll std::pair<ll, ll>
#define pii std::pair<int, int>
#define pci std::pair<char, int>
#define pic std::pair<int, char>
#define pls std::pair<ll, std::string>
#define psl std::pair<std::string, ll>
#define pis std::pair<int, std::string>
#define psi std::pair<std::string, int>

#define vpll std::vector<std::pair<ll, ll>>
#define vpii std::vector<std::pair<int, int>>
#define vpci std::vector<std::pair<char, int>>
#define vpic std::vector<std::pair<int, char>>
#define vpls std::vector<std::pair<ll, std::string>>
#define vpsl std::vector<std::pair<std::string, ll>>
#define vpis std::vector<std::pair<int, std::string>>
#define vpsi std::vector<std::pair<std::string, int>>
#define x first
#define y second

#define fast                                                                   \
std::ios_base::sync_with_stdio(0);                                           \
std::cin.tie(0);

#define INF (int)1e9 // for INT_MAX which still allows for INF + INF
#define rep(i, a, n) for (ll i = a; i < n; i++)
#define per(i, a, n) for (ll i = n - 1; i >= a; i--)
#define repp(i, a, n, p) for (ll i = a; i < n; i += p)
#define all(c) (c).begin(), (c).end()
#define lla(c) (c).rbegin(), (c).rend()
#define mod 1000000007

/* Reading vector */
template <typename T> inline istream &operator>>(istream &CIN, vector<T> &a) {
    for (auto &x : a)
    CIN >> x;
    return CIN;
}

void solve() {}

int main() {
    fast;
    int t = 1;
    cin >> t;
    while (t--)
    solve();
}
```
</details>