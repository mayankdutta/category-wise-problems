#include <bits/stdc++.h>

using namespace std;

#define ar array
#define ll long long
#define ld long double
#define sza(x) ((int)x.size())
#define all(a) (a).begin(), (a).end()

const int MAX_N = 1e5 + 5;
const ll MOD = 1e9 + 7;
const ll INF = 1e9;
const ld EPS = 1e-9;

void yes(){
    cout<<"YES"<<"\n";
}
void no(){
    cout<<"NO"<<"\n";
}
// assuming all characters are lower case 
// size of int is 4bytes = 32bits there are only 26 characters
// 0000000000 we are using these bits as storing the counts and stuff as 0 1 
void solve() {
 string str;
 cin>>str;
 int check = 0;
 
 for(int i = 0;i<str.size();i++){
 	int temp = str[i]-'a';
 	if((check & 1 << temp)>0){
 		cout<<"false"<<endl;
 		return;
 	}
 	check = (check | (1<<temp));   // | & these are bitwise operator
 }
 cout<<"true";
 return;
   
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0); cout.tie(0);
    int tc = 1;
    // cin >> tc;
    for (int t = 1; t <= tc; t++) {
        // cout << "Case #" << t << ": ";
        solve();
    }
}