[146. LRU Cache](https://leetcode.com/problems/lru-cache/)

- make sure to make dummy node for `head` and `tail`.
- other wise there will be more corner cases to handle.
- make sure to break code in functions for better understanding, like `add()` and `put()`

<details> 
<summary> Code </summary>

```cpp
struct Node {
    int value;
    int key;
    Node *next;
    Node *prev;
    Node() : next(nullptr), prev(nullptr), key(-1), value(-1) { }
};

class LRUCache {
public:
    Node *head, *tail;
    unordered_map<int, Node*> mp;
    int capacity;

    LRUCache(int capacity) {
        this->capacity = capacity;

        head = new Node();
        tail = new Node();

        head->next = tail;
        tail->prev = head;
    }

    int get(int key) {
        if (!mp.count(key))
            return -1;

        remove(mp[key]);
        add(mp[key]);

        mp[key] = head->next;

        return head->next->value;
    }

    void put(int key, int value) {
        if (mp.count(key)) {
            remove(mp[key]);
            mp.erase(key);
        }

        if (mp.size() == capacity) {
            mp.erase(tail->prev->key);
            remove(tail->prev);
        }

        auto temp = new Node();
        temp->key = key;
        temp->value = value;

        add(temp);
        mp[key] = head->next;
    }

    void add(Node *temp) {
        temp->next = head->next;
        head->next->prev = temp;
        head->next = temp;
        temp->prev = head;
    }

    void remove(Node *temp) {
        temp->prev->next = temp->next;
        temp->next->prev = temp->prev;
    }
};

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache* obj = new LRUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */

```

</details>
