## [Atcoder DP Series](https://atcoder.jp/contests/dp/tasks)
3. [Vacation](https://atcoder.jp/contests/dp/tasks/dp_c), Medium
    - based on coin change problems, just a modified version
    - States are (`index` and `sub_index` (*0/1/2* ))
    - Approach
        - We know that each time we have to choose previous elment but not of same index, we are at.
            - like if we at `index = 2, subIndex = 0` then we can pick `index = 1, subIndex = 1/2`
            - Or i should say `dp[2][0] = max(dp[2 - 1][1], dp[2 - 1][2]);` **kind of**.
        - Since we able to look though the reccurrence relation, we just now have to implement this.
        - Exact Relation is `dp[2][0] = max(dp[2 - 1][1] + arr[2 - 1], dp[2 - 1][2] + arr[2 - 1]`
        - You should try to figure out implementation. 
        <details>
        <summary>sample implementation</summary>

        ```cpp
        int n; cin >> n;
        std ::vector<std ::vector<int>> arr(n, vi(3));
        
        for (int i = 0; i < n; i++)
            for (int j = 0; j < 3; j++)
                cin >> arr[i][j];
                
        std ::vector<std ::vector<int>> dp(n + 1, vi(3, 0));
        
        for (int i = 0; i <= n; i++) {
            for (int j = 0; j < 3; j++) {
                if (i == 0) {
                    dp[i][j] = 0;
                } else {
                    dp[i][j] = max(dp[i - 1][(j + 1) % 3] + arr[i - 1][j],
                    dp[i - 1][(j + 2) % 3] + arr[i - 1][j]);
                }
        }
        cout << max(dp[n][0], max(dp[n][1], dp[n][2])) << '\n';

        ```
        </details>
