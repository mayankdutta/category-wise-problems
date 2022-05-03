[Hoof, Paper, Scissors](http://www.usaco.org/index.php?page=viewproblem2&cpid=694), Easy

- Variant of 01 knapsack.
- Imp things.
  - 3 states are required. _(index, steps_remaining, H/P/S)_.
  - Implementation is tedius and important as well.
- Things I learnt
  - Implementing 01 knapsack in three-states
  - method to define base case.

<details>

<summary>Code sample </summary>

```cpp

void solve() {
    int n, K;
    cin >> n >> K;

    vector<vvi> dp = vector<vvi>(n + 1, vvi(K + 1, vi(3, 0)));

    vi moves(n);
    for (int i = 0; i < n; i++) {
        char ch;
        cin >> ch;
        if (ch == 'H') moves[i] = 0;
        if (ch == 'P') moves[i] = 1;
        if (ch == 'S') moves[i] = 2;
    }

    for (int i = 0; i <= n; i++) {
        for (int j = 0; j <= K; j++) {
            for (int state = 0; state < 3; state++) {
                if (i == 0) {
                    dp[i][j][state] = 0;
                } else {
                    if (j == 0) {
                        dp[i][j][state] = dp[i - 1][j][state] + (moves[i - 1] == state);
                    } else {
                        int other_state1 = (state + 1) % 3;
                        int other_state2 = (state + 2) % 3;

                        int original = dp[i - 1][j][state] + (moves[i - 1] == state);
                        int possible1 =
                            dp[i - 1][j - 1][other_state1] + (moves[i - 1] == other_state1);
                        int possible2 =
                            dp[i - 1][j - 1][other_state2] + (moves[i - 1] == other_state2);

                        dp[i][j][state] = max(original, max(possible1, possible2));
                    }
                }
            }
        }
    }
    cout << max(dp[n][K][0], max(dp[n][K][1], dp[n][K][2]));
}

```

 </details>
