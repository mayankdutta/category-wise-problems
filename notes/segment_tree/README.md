<h2>SEGMENT TREE (BUILD UPDATE AND QUERY)</h2>

```cpp
#include <bits/stdc++.h>

using namespace std;
using ll = long long int;

void updateTree(vector<ll> &arr, vector<ll> &tree, ll start, ll end, ll idx, ll i, ll value) {

    if (start > end) return;
    if (start == end) {
        arr[i] = value;
        tree[idx] = value;
        return;
    }

    ll mid = (start + end) / 2;
    if (i > mid) {
        //  cout << "right" << endl;
        updateTree(arr, tree, mid + 1, end, 2 * idx + 1, i, value);
    } else {
        // cout << "left" << endl;
        updateTree(arr, tree, start, mid, 2 * idx, i, value);
    }
    tree[idx] = tree[2 * idx] + tree[2 * idx + 1];
}


void build_tree(vector<ll> &ar, ll s, ll e, ll idx, vector<ll> &tree) {
    if (s > e) return;
    if (s == e) {
        tree[idx] = ar[s];
        return;
    }

    ll mid = (s + e) / 2;
    build_tree(ar, s, mid, 2 * idx, tree);
    build_tree(ar, mid + 1, e, 2 * idx + 1, tree);

    tree[idx] = tree[2 * idx] + tree[2 * idx + 1];
}

ll query(vector<ll> &tree, ll start, ll end, ll treenode, ll left, ll right) {
    // completely outside given range
    if (start > right or left > end) {
        return 0;
    }
    // completely inside given range
    if (start >= left and end <= right)
        return tree[treenode];
    // partially outside and partially inside
    ll mid = (start + end) / 2;
    ll ans1 = query(tree, start, mid, 2 * treenode, left, right);
    ll ans2 = query(tree, mid + 1, end, 2 * treenode + 1, left, right);
    return ans1 + ans2;
}


int main() {
    vector<ll> ar = {1, 2, 3, 4};
    vector<ll> tree(4 * ar.size(), 0);
    build_tree(ar, 0, ar.size() - 1, 1, tree);   // o(n)
    updateTree(ar, tree, 0, ar.size() - 1, 1, 0, 2); // o(logn)
    ll ans = query(tree, 0, ar.size() - 1, 1, 2, 3);
    cout << ans << endl;
    for (auto x : tree)
        cout << x << " ";
    return 0;
}
```