[692. Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)

- implementation type problem

<details>
<summary> without using heaps </summary>

```cpp
class Solution {
    public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        map<string, int> mp;
        for (int i = 0; i < words.size(); i++) {
            mp[words[i]] ++;
        }

        vector<string> ans;
        map<int, multiset<string>> mp2;
        for (const auto& i: mp) {
            mp2[i.second].insert(i.first);
        }

        vector<pair<int, multiset<string>>> arr;
        for (const auto& i: mp2)
            arr.push_back(i);

        sort(arr.begin(), arr.end(), [](const auto& one, const auto& two) -> bool {
            return one.first > two.first;
        });

        for (const auto& i: arr) {
            if (ans.size() >= k) break;
            for (const auto& j: i.second) {
                ans.push_back(j);
            if (ans.size() >= k) break;
            }
        }
        return ans;
    }
};
```

</details>

<details>
<summary> using priority queue and operator overloading </summary>

```cpp
class mine {
    public:
    int count;
    string name;

};

bool operator<(const mine& a, const mine& b) {
    if (a.count == b.count) {
        return a.name > b.name;
    }
    return a.count < b.count;
}

class Solution {
    public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        map<string, int> mp;
        for (const auto& i: words) mp[i] ++;

        priority_queue<mine> pq;
        for (const auto& i: mp) {
            mine temp;
            temp.name = i.first;
            temp.count = i.second;

            pq.push(temp);
        }

        vector<string> ans;
        while (ans.size() < k) {
            ans.push_back(pq.top().name);
            pq.pop();
        }
        return ans;

    }
};
```

</details>

<details>
<summary> override the default priority queue comparitor this time. </summary>

```cpp
struct Comparitor {
    bool operator()(const pair<int, string>& one, const pair<int, string>& two) {
        if (one.first == two.first) {
            return one.second > two.second;
        }
        return one.first < two.first;
    }
};

class Solution {
    public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        map<string, int> mp;
        for (int i = 0; i < words.size(); i++) {
            mp[words[i]] ++;
        }

        vector<string> ans;

        priority_queue<pair<int, string>, vector<pair<int, string>>, Comparitor> pq;
        for (const auto& i: mp) {
            pq.push({i.second, i.first});
        }

        while (ans.size() < k) {
            ans.push_back(pq.top().second);
            pq.pop();
        }
        return ans;
    }
};
```

</details>
