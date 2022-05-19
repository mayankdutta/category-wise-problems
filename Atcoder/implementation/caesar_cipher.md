[B - Caesar Cipher](https://atcoder.jp/contests/abc232/tasks/abc232_b), easy, string, implementation

- problem was of implementation type, no such approach to write.
- one main issue one can get is in modulus part, make sure to avoid that.
- get everything +ve.

<details> 
<summary> method 1 </summary>

```cpp
  string s, t;
  cin >> s >> t;

  for (int diff = 0; diff <= 25; diff++) {
    string ans;
    for (int i = 0; i < s.size(); i++) {
      char next_character = ((s[i] + diff - 'a') % 26 + 'a'); // important step
      ans.push_back(next_character);
    }
    if (ans == t) {
      cout << "Yes\n";
      return;
    }
  }
  cout << "No\n";
  return;

```

</details>

<details> 
<summary> method 2 </summary>

```cpp
  string s, t;
  cin >> s >> t;

  int k = (s[0] - t[0]) % 26;
  if (k < 0)
    k += 26;

  for (int i = 0; i < s.size(); i++) {
    int u = ((int)s[i] - (int)t[i]) % 26;
    if (u < 0)
      u += 26;

    if (k != u) {
      cout << "No" << endl;
      return;
    }
  }
  cout << "Yes" << endl;


```

</details>
