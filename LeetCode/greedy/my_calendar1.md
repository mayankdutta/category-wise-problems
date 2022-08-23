[729. My Calendar I](https://leetcode.com/problems/my-calendar-i/)

#### Brute

- to check the overlapping, `max(s, start) < min(e, end)`.
- rest is easy to read.

```cpp
class MyCalendar {
public:
    vector<pair<int, int>> arr;
    MyCalendar() { }

    bool book(int start, int end) {
        for (const auto& [s, e]: arr) {
            if (max(s, start) < min(e, end)) {
                return false;
            }
        }
        arr.push_back({start, end});
        return true;
    }
};

```

### Optimized

- lower bound on set works like the following way.
  - if `first key` matches then it applies the same `lower bound` on the `second key`.
  - There are the chances of exact same interval, if it exists.
  - though finding the immediate greater neighbour, it is best suited
  - recommended then `upper bound`.
- then all the corner cases analyzed.
- sadly our above formula may not work here.

```cpp
class MyCalendar {
    public:
    set<pair<int, int>> st;
    MyCalendar() { }

    bool book(int start, int end) {
        if (st.empty()) {
            st.insert({start, end});
            return true;
        }

        auto it = st.lower_bound({start, end});
        if (it == st.end()) {
            -- it;
            if (it->second <= start) {
                st.insert({start, end});
                return true;
            }
        } else if (it == st.begin()) {
            if (end <= it->first) {
                st.insert({start, end});
                return true;
            }
        } else {
            auto prev = it;
            --prev;
            if (prev->second <= start && end <= it->first) {
                st.insert({start, end});
                return true;
            }
        }
        return false;
    }
};
```
