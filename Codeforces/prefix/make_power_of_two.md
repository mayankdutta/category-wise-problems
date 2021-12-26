
[D. Make a Power of Two](https://codeforces.com/contest/1560/problem/D), Easy
- We just have to figure out that it is asking for prefix of main string, with power of 2, to be matched.
- The string which matched the most, will be tracked.
  <details>
  <summary>Code sample </summary>

  ```cpp
  void solve() {
      std::string s;
      std::cin >> s;

      int res = 1E9;

      for (int i = 0; i < 64; i++) {
      std::string t = std::to_string(1ULL << i);

          int k = 0;
          for (int j = 0; j < int(s.length()); j++) {
              if (k < int(t.length()) && s[j] == t[k]) {
                  k++;
              }
          }
          
          res = std::min(res, int(s.length()) + int(t.length()) - 2 * k);
      }
      std::cout << res << "\n";
  }
  ```
  </details>

