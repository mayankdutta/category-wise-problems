[Blackboard GCD](https://atcoder.jp/contests/abc125/tasks/abc125_c)

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

