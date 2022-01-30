[208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

###### implementation of trie.

- we need to decide what each node of Trie will be carrying
  - like it was `value` and `address` of the next node in linked list.
  - for trie, it will be `address of all the nodes` it will be connecting through and `value` of course.
  - this was TrieNode part.
- since we are talking about trie, it has quite lengthy methods for inserting and searching
- that bring us to implement another class just to encapsulate it's methods.

<details> 
<summary> implementation </summary>

```cpp
class TrieNode {
    public:
    vector<string> word;
    int prefix;
    vector<TrieNode *> next;

    TrieNode() {
        prefix = 0;
        next = vector<TrieNode *>(26, nullptr);
    }
};

class Trie {
    public:
    TrieNode *root;
    Trie() {
        root = new TrieNode();
    }

    void insert(string word) {
        TrieNode *curr = root;
        for (const auto& w: word) {
            int i = w - 'a';
            curr->prefix ++;
            if (curr->next[i] == nullptr)
                curr->next[i] = new TrieNode();
            curr = curr->next[i];
        }
        curr->word.push_back(word);
    }

    bool search(string word) {
        TrieNode *curr = root;
        for (const auto& w: word) {
            int i = w - 'a';
            curr->prefix ++;
            if (curr->next[i] == nullptr) return false;
            curr = curr->next[i];
        }
        return !curr->word.empty();
    }

    bool startsWith(string word) {
        TrieNode *curr = root;
        for (const auto& w: word) {
            int i = w - 'a';
            curr->prefix ++;
            if (curr->next[i] == nullptr) return false;
            curr = curr->next[i];
        }
        return true;
    }
};


```

</details>

<hr>

###### implementation of trie using hashmap.

- we just want to be comfortable enough
- what if string consist both lower case and upper case.
- in those cases instead of interfere in the class, we can now rest easy.

<details> 
<summary> implementation with unordered map </summary>

```cpp
class TrieNode {
public:
  char value;
  unordered_map<char, TrieNode *> freq;
  bool is_leaf;

  TrieNode(char data) {
    value = data;
    is_leaf = false;
  }
};

class Trie {
public:
  TrieNode *root;

  Trie() { root = new TrieNode('\0'); }

  void insert(string word) {
    TrieNode *temp = root;

    for (auto ch : word) {
      if (temp->freq.count(ch) == 0) {
        temp->freq[ch] = new TrieNode(ch);
      }
      temp = temp->freq[ch];
    }

    temp->is_leaf = true;
  }

  bool find(string word) {
    TrieNode *temp = root;

    for (auto ch : word) {
      if (temp->freq.count(ch)) {
        temp = temp->freq[ch];
      } else {
        return false;
      }
    }

    return temp->is_leaf;
  }

  bool is_prefix(string prefix) {
    TrieNode *temp = root;

    for (auto ch : prefix) {
      if (temp->freq.count(ch)) {
        temp = temp->freq[ch];
      } else {
        return false;
      }
    }

    return true;
  }
};



```

</details>
