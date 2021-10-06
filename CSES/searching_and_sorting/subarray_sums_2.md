[Subarray sums II](https://cses.fi/problemset/task/1661/), kind of map problem
 - Greedy.
 - Prerequisite, STL, or atleast how to maintain count of no.s in array.
 - Kind of classical problem.
 <details>
   <summary>Correct implementation</summary>

 ```cpp
 ll n, x; 
 cin >> n >> x;
 
 vector<ll> arr(n);
 for (auto& i: arr)
     cin >> i;
 
 map<ll, ll> mp;
 ll sum = 0;
 ll ans = 0;
 
 mp[0] = 1;
 for (int i = 0; i < n; i++) {
     sum += arr[i];
     if (mp.count(sum - x)) {
         ans += (mp[sum - x]);
     }
     mp[sum] ++;
 }
 cout << ans << '\n';
 ```
 </details>
 <details>
   <summary>wrong submission, Dont assume SUM problems to DIVISIBLITY type problems</summary>

 ```cpp
 ll n, x;
 cin >> n >> x;
 
 vll arr(n); 
 cin >> arr;
 
 map<ll, ll> mp;
 
 for (int i = 0; i < n; i++) {
     if (i > 0)
     arr[i] += arr[i - 1];
     arr[i] %= x;
     mp[arr[i]]++;
 }
 
 ll ans = 0;
 for (const auto &i : mp) {
     if (i.first == 0)
         continue;
     if (i.second >= 2) {
         ans += (i.second * (i.second - 1) / 2);
     }
 }
 ans += mp[0];
 cout << ans << '\n';
 ```
 </details>

