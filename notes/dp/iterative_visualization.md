## Question

```js
Check if string has all the unique characters
ex - hello ANS- False

hel - True

```

## Approach 1

```cpp
void solve() {
 string str;
 cin>>str;
 int check = 0;

 for(int i = 0;i<str.size();i++){
 	int temp = str[i]-'a';
 	if((check & 1 << temp)>0){
 		cout<<"false"<<endl;
 		return;
 	}
 	check = (check | (1<<temp));   // | & these are bitwise operator
 }
 cout<<"true";
 return;


}

```

## Approach 2

```cpp
void solve() {
  string str;
  cin >> str;
  vector<bool> vp(128, false);

  for (int i = 0; i < str.size(); i++) {
    if (vp[str[i] - 'a']) {
      cout << false;
      return;
    }
    vp[str[i] - 'a'] = true;
  }
  cout << true << endl;
  return;
}


```
