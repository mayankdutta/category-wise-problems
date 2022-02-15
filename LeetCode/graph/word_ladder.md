## BFS, shortest paths.

[127. Word Ladder ](https://leetcode.com/problems/word-ladder/), Hard

- question was really simple,
  - you have been given several words
  - You are allowed to make edge on the words having only one distinct word.
- What make it difficult.
  - we are given strings hence, normal adjacency list won't work
  - we'll have to make using maps
  - Searching for one distinct word may get little trickier.
- Approach
  - Starting from BeginWord we initiated our BFS.
  - Meanwhile stored their distance in `distance map`, just as normal BFS
  - While comparing two string have one distinct or not.
    - We replace each character of a `particular string`, index wise from `a - z`
    - Aslo we make sure if this modified string is already present in wordList or not.
    - Since we only changing one character per time, therefore if modified string is already present, we insert this in our queue.

<details>
<summary>C++ implementation</summary>

```cpp
int ladderLength(string beginWord, string endWord, vector<string> &s) {
    queue<string> que;
    que.push(beginWord);

    unordered_map<string, int> distance;
    unordered_set<string> wordListsSet;

    /* so that searching string can be easier */
    for (const auto &i : s)
        wordListsSet.insert(i);

    distance[beginWord] = 1;

    while (!que.empty()) {
        auto u = que.front();
        que.pop();

       /* replaced each character index wise in string  */
       /* and checked if that modified string is present in the set or not */
       for (int j = 0; j < u.size(); j++) {
           auto temp = u;
           for (char ch = 'a'; ch <= 'z'; ch++) {
               temp[j] = ch;
               if (distance.count(temp))
                   continue;
               if (wordListsSet.find(temp) != wordListsSet.end()) {
                   que.push(temp);
                   distance[temp] = distance[u] + 1;

                   if (temp == endWord)
                       return distance[temp];
               }
           }
       }
    }
    return distance[endWord];
}

```

</details>

<details>
<summary> Java implementation </summary>

```java
class Solution {
    public int ladderLength(String beginWord, String endWord, List<String> wordList) {
        Set<String> wordListSet = new HashSet<String>();
        wordListSet.addAll(wordList);

        Queue<StringBuilder> qu = new LinkedList<>();
        qu.add(new StringBuilder(beginWord));

        if (wordListSet.contains(endWord) == false)
            return 0;

        int count = 1;
        while (!qu.isEmpty()) {
            int Size = qu.size();
            for (int t = 0; t < Size; t++) {
                StringBuilder u = qu.poll();
                if (u.toString().equals(endWord))  {
                    return count;
                }

                for (int i = 0; i < u.length(); i++) {
                    StringBuilder temp = new StringBuilder(u);
                    for (char ch = 'a'; ch <= 'z'; ch++) {
                        temp.setCharAt(i, ch);
                        if (wordListSet.contains(temp.toString())) {
                            qu.add(new StringBuilder(temp));
                            wordListSet.remove(temp.toString());
                        }
                    }
                }
            }
            count ++;
        }
        return 0;
    }
}
```

</details>
