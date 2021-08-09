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

## Cumulative / Prefix Sums 
1. [Blackboard GCD](https://atcoder.jp/contests/abc125/tasks/abc125_c)
    - Slight description. 
      - Problem was to get the maximum gcd if we exclude one no.
      - sample code.         
        ```
        int main () {

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
     - Things I learnt
        - was new approach to me. 
     - similar questions
        - to be added. 
