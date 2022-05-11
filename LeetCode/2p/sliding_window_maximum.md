[Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

##### multiset

- during traversal element being inserted.
- and the element being at the end being popped out.
- max element will be by default at the end of set.

```cpp
class Solution {
    public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        int l = 0, r = 0;
        multiset<int> st;
        vector<int> ans;
        for (r = 0; r < k; r++)
            st.insert(nums[r]);

        ans.push_back(*st.rbegin());

        // maintaining a sliding window of [l .... .r]
        for (r = k; r < nums.size(); r++) {
            st.insert(nums[r]);
            st.erase(st.find(nums[l]));
            l ++;
            ans.push_back(*st.rbegin());
        }
        return ans;
    }
};
```

##### monotonic deque

- following stack kind of thing but in queue.
- hence needed deque.
- first filled upto the size of window.
- then popped if the first index is less then the current window size.
- if the element to be inserted is greater then element at the back of deque, we will pop that out.

```cpp
class Solution {
    public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        deque<int> dq;
        vector<int> ans;

        for (int i = 0; i < k; i++) {
            while (!dq.empty() and nums[dq.back()] < nums[i])
                dq.pop_back();
            dq.push_back(i);
        }

        ans.push_back(nums[dq.front()]);

        for (int i = k; i < nums.size(); i++) {
            while (!dq.empty() and dq.front() <= i - k      )  dq.pop_front();
            while (!dq.empty() and nums[dq.back()] < nums[i])  dq.pop_back();
            dq.push_back(i);
            ans.push_back(nums[dq.front()]);
        }

        return ans;
    }
};

```

```java
public int[] maxSlidingWindow(int[] a, int k) {
		if (a == null || k <= 0) {
			return new int[0];
		}
		int n = a.length;
		int[] r = new int[n-k+1];
		int ri = 0;

		Deque<Integer> q = new ArrayDeque<>();
		for (int i = 0; i < a.length; i++) {

			while (!q.isEmpty() && q.peekFirst() < i - k + 1) {
				q.pollFirst(); // or poll(), since queue so by default first one is popped out.
			}

			while (!q.isEmpty() && a[q.peekLast()] < a[i]) {
				q.pollLast();
			}

			q.offer(i);
			if (i >= k - 1) {
				r[ri++] = a[q.peekFirst()];
			}
		}
		return r;
	}

```
