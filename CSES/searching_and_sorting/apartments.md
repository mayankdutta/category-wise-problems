[Apartments](https://cses.fi/problemset/task/1084), Two pointers, Sorting, Binary search, easy.
 - Greedy.
 - Prerequisite, STL *(lower_bound, upper_bound, set, muliset)*, OR *Concept of 2 pointers*
 - Kind of classical problem.
 - 2 pointers approach
   - First Sort both arrays, keep `i` at `students choice array` and `j` at `apartments array`
   - Traverse accordingly, after making cases.
   - Relatively easier then binary search.
   - <details>
      <summary>Implementation</summary>

      ```cpp
      int n, m, k;
      cin >> n >> m >> k;
      
      std ::vector<int> arr(n), brr(m);
      
      for (auto &i : arr) cin >> i;
      for (auto &i : brr) cin >> i;
      
      int ans = 0;
      
      sort((arr).begin(), (arr).end());
      sort((brr).begin(), (brr).end());
      
      int i = 0;
      int j = 0;
      
      while (i < n and j < m) {
          int diff = abs(brr[j] - arr[i]);
          if (brr[j] < arr[i]) {
              if (diff <= k) {
                  ans++;
                  i++, j++;
              } else {
                  j++;
              }
          } else {
              if (diff <= k) {
                  ans++;
                  i++, j++;
              } else {
                  i++;
              }    
          }
      }
      cout << ans << '\n';

      ```
      </details>
 - Binary search approach 
   - Maintain a mulitset of apartments.
   - so that we may apply `erase`, `lower_bound`  in `logn`
   - binary search over apartments, for the user's choice. 
   - Make sure to choose smallest apartment that is fitting in user's choice.
   - Implementation (will be added soon)


