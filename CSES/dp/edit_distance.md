
6. [Edit Distance ](https://cses.fi/problemset/task/1639/), classic levinshtein distance.
    - Classic problem, one of it's kind.
    - Approach *(memo version)*
        - Base Case
          - consider we have string, `ABC` and `DC`.
          - we have to carry out our operation(insertion) on ABC
          - letsay after carrying out operation, *DC***ABC**, *DC*
          - our fist pointer `i` is at `A` of 1st string and second one `j` is at `C` of 2nd
          - since j is towards the end of the string, this brings us to the base case.
          - if (j == endOfString) OR if j < 1 : in bottom up appraoch
          - we will be returning the remaining of the `i-th string`
          - because we have yet to delete that part, hence will have to count it.
        - Now if two characters are same, then no need to `add / remove / replace` anything, just traverse `topDown / bottomUp`
        - else make your steps `inserting / removing / replacing` and take minimum.
        - [Video Resource](https://www.youtube.com/watch?v=8wv_hIRZCRg)
    - <details>
      <summary>Memoization sample </summary>

      ```cpp
      string s, t;
      std ::vector<std ::vector<int>> memo;
      int n, m;

      int editDistance(int i, int j) {
          if (i < 1)
             return j;
          if (j < 1)
             return i;
          
          int &ans = memo[i][j];
          if (ans != INF)
             return ans;
          
          if (s[i - 1] == t[j - 1])
              ans = min(ans, editDistance(i - 1, j - 1));
              else {
              int insert = 1 + editDistance(i, j - 1);
              int replace = 1 + editDistance(i - 1, j - 1);
              int del = 1 + editDistance(i - 1, j);
      
              ans = min(insert, min(replace, min(del, ans)));
          }
          
          return ans;
      }
      
      void solve() {
          cin >> s >> t;
          n = s.size();
          m = t.size();
          
          memo = std ::vector<std ::vector<int>>(n + 1, std ::vector<int>(m + 1, INF));
          cout << (editDistance(n, m) == INF ? 0 : editDistance(n, m)) << '\n';
      }

      ```
      </details>

