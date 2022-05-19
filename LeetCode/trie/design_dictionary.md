[211. Design Add and Search Words Data Structure ](https://leetcode.com/problems/design-add-and-search-words-data-structure/)

##### Trie

- [implement trie](/LeetCode/trie/implementing_trie.md) first.
- had to find some way to tackle `.` we going to encounter.
- it was test of knowledge with linked list basically.
- concept of recursion was used, but still any mistype could have brought TLE.

<details> 
<summary> via trie </summary>

```cpp

class TrieNode {
public:
  vector<string> word;
  int prefix;
  vector<TrieNode *> next;

  TrieNode() {
    prefix = 0;
    next.resize(26, nullptr);
  }
};

class Trie {
public:
  TrieNode *root;
  Trie() { root = new TrieNode(); }
  void insert(const string &s) {
    TrieNode *curr = root;
    for (const auto &i : s) {
      int x = i - 'a';
      if (curr->next[x] == nullptr) {
        curr->next[x] = new TrieNode();
      }
      curr->prefix++;
      curr = curr->next[x];
    }
    curr->word.push_back(s);
  }
  bool find(const string &s) { return find(s, root); }

  bool find(string s, TrieNode *curr) {
    for (int index = 0; index < s.size(); index++) {
      char i = s[index];
      if (i == '.') {
        bool flag = false;
        int j;
        for (j = 0; j < 26; j++) {
          if (curr->next[j] != nullptr) {
            flag |= find(s.substr(index + 1), curr->next[j]);
          }
          if (flag)
            return true;
        }
        if (j == 26)
          return false;
      } else {
        curr->prefix++;
        int x = i - 'a';
        if (curr->next[x] == nullptr) {
          return false;
        }
        curr = curr->next[x];
      }
    }
    return !curr->word.empty();
  }
};

class WordDictionary {
public:
  Trie t;
  WordDictionary() {}

  void addWord(string word) { t.insert(word); }

  bool search(string word) { return t.find(word); }
};


```

</details>

##### more concise, using hashmap

- stored each word in map
- later ignore that whole word with every word having same size.
- while comparing with that word we ignore the place where `.` was occuring.

<details>
<summary> code implementation </summary>

```cpp
class WordDictionary {
public:
    WordDictionary() {}

    void addWord(string word) {
        words[word.size()].push_back(word);
    }

    bool search(string word) {
        for(auto s: words[word.size()])
          if(isEqual(s, word))
            return true;
        return false;
    }

private:
    unordered_map<int, vector<string>>words;

    bool isEqual(string a, string b){
        for(int i = 0; i < a.size(); i++){
            if(b[i] == '.') continue;
            if(a[i] != b[i]) return false;
        }
        return true;
    }
};

```

</details>
