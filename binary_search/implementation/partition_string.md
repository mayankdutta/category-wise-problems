[Partition String](https://binarysearch.com/problems/Partition-String)

- implementation base problem

##### cpp implementation

```cpp
vector<int> solve(string s) {
    map<char, int> char_to_int;
    for (int i = 0; i < s.size(); i++) {
        char_to_int[s[i]] = i;
    }

    vector<int> ans;
    int current = 0;
    int prev =  0;
    for (int i = 0; i < s.size(); i++) {
        current = max(current, char_to_int[s[i]]);
        if (current == i) {
            ans.push_back(current - prev + 1);
            prev = current + 1;
        }
    }

    return ans;
}
```

##### Java implementation

```java
import java.util.*;

class Solution {
    public int[] solve(String s) {
        Map<Character, Integer> charToInt = new HashMap<>();
        for (int i = 0; i < s.length(); i++)
            charToInt.put(s.charAt(i), i);
        int current = 0;
        int prev = 0;
        ArrayList<Integer> arr = new ArrayList<>();

        for (int i = 0; i < s.length(); i++) {
            current = Math.max(current, charToInt.get(s.charAt(i)));
            if (current == i) {
                arr.add(current - prev  + 1);
                prev = current + 1;
            }
        }

        int[] ans = new int[arr.size()];
        for (int i = 0; i < arr.size(); i++) {
            ans[i] = arr.get(i);
        }
        return ans;
    }
}
```
