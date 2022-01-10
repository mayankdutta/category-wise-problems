[1094. Car Pooling](https://leetcode.com/problems/car-pooling/)

- just compute the net passenger on the boat on each day.
- check if that not exceed the limit.

<details>
<summary> Java Code </summary>

```java
class Solution {
    public boolean carPooling(int[][] trips, int capacity) {
        Map<Integer, Integer> mp = new TreeMap<>();
        Integer count = 0;

        for (int i = 0; i < trips.length; i++) {
            int passenger = trips[i][0];
            int a = trips[i][1];
            int b = trips[i][2];

            if (mp.containsKey(a)) mp.put(a, mp.get(a) + passenger);
            else mp.put(a, passenger);

            if (mp.containsKey(b)) mp.put(b, mp.get(b) - passenger);
            else mp.put(b, -passenger);
        }

        for (var i : mp.entrySet()) {
            count += i.getValue();
            if (count > capacity)
                return false;
        }

        return true;
    }
}

```

</details>

<details>
<summary> C++ Code </summary>

```cpp
class Solution {
    public:
    bool carPooling(vector<vector<int>>& trips, int capacity) {
        map<int, int> arr;
        for (const auto& i: trips) {
            auto value = i[0];
            auto start = i[1];
            auto end = i[2];

            arr[start] += value;
            arr[end] += -value;
        }

        int sum = 0;
        for (auto& i: arr) {
            sum += i.second;
            if (sum > capacity)
                return false;
        }
        return true;
    }
};

```

</details>
