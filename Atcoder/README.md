## 0 - 1 BFS

1. [D-Wizard in maze](https://atcoder.jp/contests/abc176/tasks/abc176_d), ABC problem-D, jiangly solution.<br>
   - Things I learnt
     - How/Why To implement 0-1 BFS
     - Detailed view acc. to my perspective, will be updated soon.
   - Same problems on above topic, no new techniques.
     - [E-stronger takashi](https://atcoder.jp/contests/abc213/tasks/abc213_e), ABC problem-E

## DP

1. [D. cooking](https://atcoder.jp/contests/abc204/tasks/abc204_d), ABC problem-D<br>
   - Will be updated soon
    

2. [D. aab](https://atcoder.jp/contests/abc202/tasks/abc202_d), ABC problem-D
   - Will be updated soon
   

3. [D. Shipping center](https://atcoder.jp/contests/abc195/tasks/abc195_d), ABC problem-D
   - Will be updated soon
    

4. [D - Strange Lunchbox](https://atcoder.jp/contests/abc219/tasks/abc219_d), Binary Search, Dynamic programming.
    - Dynamic programming Approach.
      - Simple 01 knapsack type
      - [Reference 1](https://github.com/mayankdutta/category-wise-problems/blob/main/CSES/README.md)
      - [Reference 2](https://github.com/mayankdutta/category-wise-problems/blob/main/USACO/README.md)
      - <details>
          <summary>Memo Implementation</summary>

         ```cpp
          int n;
          int x, y;
          vector<ll> one, two;
          vector<vector<vector<ll>>>
          memo(305, vector<vector<ll>>(305, vector<ll>(305, ll(1e18))));
          
          int fun(int a, int b, int i) {
              if (a <= 0 and b <= 0) return 0;
              if (i < 0) return INF;
              
              ll &ans = memo[i][a][b];
              if (ans != ll(1e18)) return ans;
        
              ans = min(fun(max(0ll, a - one[i]), max(0ll, b - two[i]), i - 1) + 1, fun(a, b, i - 1));
        
              return ans;
          }
          
          void solve() {
              cin >> n;
              cin >> x >> y;
              one = two = vector<ll>(n);
              for (int i = 0; i < n; i++)
              cin >> one[i] >> two[i];
              
              int ans = fun(x, y, n - 1);
              
              cout << (ans == INF ? -1 : ans) << '\n';
          }
  
        ```
        </details>
      - <details>
          <summary>Iterative Implementation</summary>

         ```cpp
      
           ll n;
           ll x, y;
           cin >> n >> x >> y;
           
           vector<ll> one, two;
           one = two = vector<ll>(n);
           for (int i = 0; i < n; i++)
           cin >> one[i] >> two[i];
           
           vector<vector<vector<ll>>> dp(305,
           vector<vector<ll>>(305, vector<ll>(305, 1e12)));
           
           dp[0][0][0] = 0;
           for (int i = 1; i <= n; i++) {
           for (int j = 0; j <= x; j++) {
           for (int k = 0; k <= y; k++) {
           dp[i][j][k] = dp[i - 1][j][k];
           ll prevOne = max(0ll, j - one[i - 1]);
           ll prevTwo = max(0ll, k - two[i - 1]);
           
                   dp[i][j][k] = min(dp[i][j][k], dp[i - 1][prevOne][prevTwo] + 1);
                 }
               }
           }
           
           ll ans = dp[n][x][y];
           
           if (ans >= 1e12)
           ans = -1;
           cout << ans << '\n';


        ```
      </details>
    - Binary search approach(to be updated)



5. [D - FG Operation](https://atcoder.jp/contests/abc220/tasks/abc220_d), Dynamic programming, Coin change type
    - Approach.
        - [Reference 1](https://github.com/mayankdutta/category-wise-problems/blob/main/CSES/README.md)
        - [Reference 2](https://github.com/mayankdutta/category-wise-problems/blob/main/USACO/README.md)
        - Try to make at least one recurrence relation by yourself, with the help of test case.
        - For example in this problem
          - If i take `size of array` in row and `0 - 9` in column.
          - Note that `0 - 9` signifies **values whose `mod` taken in previous iteration**.
          - hence recurrence relation will roughly be like.
            - `dp[2][j + arr[i - 1]] += dp[2 - 1][j];`
            - `dp[2][j * arr[i - 1]] += dp[2 - 1][j];`
            - assuming that i is from `1 -> n + 1`, for the sake of `2D dp array`.
            - then generalise the above statement.
    - <details>
        <summary>Implementation</summary>

       ```cpp
    
         ll n;
         cin >> n;
         vector<ll> arr(n);
         for (ll i = 0; i < n; i++)
             cin >> arr[i];
         
         ll dp[n + 1][10];
         memset(dp, 0, sizeof(dp));
         dp[1][arr[0]] = 1;
         
         for (int i = 1; i <= n; i++) {
             for (int j = 0; j < 10; j++) {
                 dp[i][(j + arr[i - 1]) % 10] += dp[i - 1][j];
                 dp[i][(j * arr[i - 1]) % 10] += dp[i - 1][j];
                 dp[i][(j + arr[i - 1]) % 10] %= mod;
                 dp[i][(j * arr[i - 1]) % 10] %= mod;
             }
         }
         
         for (int j = 0; j < 10; j++) {
             cout << dp[n][j] << '\n';
         }
         cout << '\n';


        ```
    </details>


## Cumulative / Prefix Sums

1. [Blackboard GCD](https://atcoder.jp/contests/abc125/tasks/abc125_c)

   - Slight description.

     - Problem was to get the maximum gcd if we exclude one no.
     <details>
       <summary> Sample code </summary>

     ```cpp
       main () {

       int n;
       cin >> n;

       vector <int> arr (n + 2, 0);
       vector <int> prefix (n + 2, 0);
       vector <int> suffix (n + 2, 0);

       for (int i=1; i<=n; i++) cin >> arr[i];

       for (int i=1; i<=n; i++) {
           prefix [i] = gcd (prefix[i-1], arr[i]);
       }

       for (int i=n; i>=1; i--) {
           suffix [i] = gcd (suffix[i+1], arr[i]);
       }

       int mx = 0;
       for (int i=0; i<=n; i++) {
           mx = max (gcd(prefix[i-1] ,suffix [i+1]), mx );
       }

       cout << mx << "\n";
       }
     ```

      </details>

   - Things I learnt
     - was new approach to me.
   - similar questions
     - to be added.



## Greedy, Maths
1. [E - Amusement Park ](https://atcoder.jp/contests/abc216/tasks/abc216_e)
    - Straight fwd problem if done simpler one. 
    - Idea just to apply `priority queue / multiset / map` will lead to **TLE**.
      <details>
        <summary> Naive solution, gave TLE</summary>

      ```cpp
        void solve() {
            int n, k;
            cin >> n >> k;
            ll ans = 0;
            
            priority_queue<int> pq;
            for (int i = 0; i < n; i++) {
                int num;
                cin >> num;
                pq.push(num);
            }
            
            while (k-- and !pq.empty()) {
                auto curr = pq.top();
                pq.pop();
                ans += curr;
                if (curr - 1 > 0)
                    pq.push(curr - 1);
            }
            cout << ans << '\n';
        }
      
      ```
       </details>

    - Above approach with few optimization. 
      ```cpp
        int n;
        long long int K;
        scanf("%d%lld", &n, &K);
        map<long long int, long long int> mp;
        for (int i = 0; i < n i++) {
            long long int a;
            scanf("%lld", &a);
            ++mp[a];
        }
        priority_queue<pair<long long int, long long int> que;
        for (auto [key, val] : mp)
            que.emplace(key, val);
        que.emplace(0, 0);
        
        long long int ans = 0;
        while (K > 0 && que.top().fi > 0) {
            auto [element, freq] = que.top();
            que.pop();
            long long int diff = element - que.top().first;
      
            if (diff * freq <= K) {
                K -= diff * freq;
                ans += sum(element, element - diff) * freq;
                freq += que.top().second;
                que.pop();
                que.emplace(element - diff, freq);
            } else {
                diff = K / freq;
                ans += sum(element, element - diff) * freq 
                    + (element - diff) * (K % freq);
                break;
            }
        }
        printf("%lld\n", ans);
      ```
       </details>
    - Approach
        - no.s stored in array, frequency wise. 
        - for a certain element the no.s of element to be shifted down (i.e. -1, till the last smallest element in our queue) will be `that element * it's frequency`
        - if this value `element * its_freq` is `<= k`.
          - then accordingly smaller element in queue is updated, ans. is updated as well. 
        - else 
          - we have to check, with current value of `k` how many elements we can shift down.
          - then we will `value down` till that value,
          - **CORNER CASE** even if some value of `k` got left as a remainder, we would have to settle this by furher decreasing the value elements.
          - Above point is taken care of by line `(element - diff) * (K % diff)`.

