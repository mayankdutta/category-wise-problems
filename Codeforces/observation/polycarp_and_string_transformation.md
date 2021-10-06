
1. [E. Polycarp and String Transformation](https://codeforces.com/contest/1560/problem/E), Medium, Observation question
    - We just have to figure out the way by which given string is formed.
    - Once You found the way start kind of Backtracking and create the given string.
    - Always remember to Check the answer with base case
    - One corner case you should check. 
    - corner case  `qweqeewew` , output : `-1`
    - Approach
    - <details>
      
      - observe carefully last element of the `string t` must be the last element to be removed
      - lets just say we found that there are `n` different characters in `string t`
      - if we know the frequency of last character of `string t` and divide it by `n`
      - we can find the frequency of that `last character`
      - similarly by using this approach and gradually decreasing `n` we can get the frequency of every character
      - which is going to be present in my answer then
      - looping over `t` until the `frequency is zero` and we get
      - `string s` but to check the corner case we again
      - make `t` from `s` and compare it with initial given string
        </details>
      <details>
      <summary>Code sample </summary>
      
      ```cpp

       #include <bits/stdc++.h>
       using namespace std;
       
       string helper(string str, char ch) {
           str.erase(remove(str.begin(), str.end(), ch), str.end());
           return str;
       }
       
       int main() {
           int test;
           cin >> test;
           while (test--) {
               string str;
               cin >> str;
      
               unordered_map<char, int> mp;
               string tempString = "";
               vector<int> hash(26, 0);
               
               for (int i = 0; i < str.length(); ++i)
                 hash[str[i] - 'a']++;
               
               int countElements = 0;
               for (auto i : hash)
                 if (i > 0)
                   countElements++;
               
               int flag = 0;
               for (int i = str.length() - 1; i >= 0; i--) {
                 if (!mp.count(str[i]) && countElements > 0) {
                   if (hash[str[i] - 'a'] % countElements != 0) {
                     flag = 1;
                     break;
                   }
                   int k = hash[str[i] - 'a'] / countElements;
                   mp[str[i]] = k;
                   tempString += str[i];
                   countElements--;
                 }
               }
               
               if (flag == 0) {
                 reverse(tempString.begin(), tempString.end());
                 string ans = "";
                 for (int i = 0; i < str.length(); ++i) {
                   if (mp[str[i]] == 0)
                     break;
                   ans += str[i];
                   mp[str[i]]--;
                 }
                 string temp = ans, temp2 = ans;
               
                 for (int i = 0; i < tempString.length(); ++i) {
                   // Use helper function to remove all occurance of a character from string!!
                   temp2 = helper(temp2, tempString[i]);
                   temp += temp2;
                 }
               
                 if (temp == temp2)
                   cout << ans << " " << tempString << endl;
                 else
                   cout << -1 << endl;
               
               } else {
                 cout << -1 << endl;
               }
           }
       }


      ```
      </details>
