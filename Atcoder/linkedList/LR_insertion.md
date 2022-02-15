[D - LR insertion ](https://atcoder.jp/contests/abc237/tasks/abc237_d)

##### Doubly linked list implementation

<details>
<summary> implementation </summary>

```cpp

struct node {
    int val;
    node *next;
    node *prev;
};

void solve() {
    int n;
    cin >> n;
    string s;
    cin >> s;

    node *left = nullptr, *right = nullptr, *previous = nullptr;

    node *temp = new node;
    temp->val = 0;

    temp->next = nullptr;
    temp->prev = nullptr;
    left = temp;
    right = temp;
    previous = temp;


    for (int i = 0; i < n; i++) {
        node *temp = new node;
        temp->val = i + 1;
        temp->next = nullptr;
        temp->prev = nullptr;

        if (s[i] == 'L') {
            if (previous == left) {
                temp->next = left;
                left->prev = temp;
                temp->prev = nullptr;
                left = temp;
                previous = temp;
            } else {
                node *left_prev = previous->prev;

                temp->next = previous;
                temp->prev = left_prev;

                previous->prev = temp;
                left_prev->next = temp;
                previous = temp;

            }
        } else {
            if (previous == right) {
                temp->prev = right;
                right->next = temp;
                temp->next = nullptr;
                right = temp;
                previous = temp;

            } else {
                node *right_prev = previous->next;

                temp->next = right_prev;
                temp->prev = previous;

                previous->next = temp;
                right_prev->prev = temp;
                previous = temp;
            }

        }
    }
    for (auto temp = left; temp != nullptr; temp = temp->next) {
        cout << temp->val << ' ';
    }
}

```

</details>

<hr>

##### List implementation

- do note that the value will always be inserted prior to the position, where iterator is currently at.

<details>
<summary> C++ list implementation </summary>

```cpp
int main() {
    int n;
    cin >> n;
    string s;
    cin >> s;

    list<int> ls;

    ls.push_back(0);
    auto it = ls.begin();
    for (int i = 0; i < n; i++) {
        if (s[i] == 'R')
            it++;

        it = ls.insert(it, i + 1);
    }

    for (int &i: ls)
        cout << i << " ";
    cout << endl;


}

```

</details>

<details>
<summary> Java list implementation </summary>

```java

import java.util.*;

public class Main {
  public static void main(String[] args) {

    try (Scanner sc = new Scanner(System.in)) {
      int N = sc.nextInt();
      char[] S = sc.next().toCharArray();

      LinkedList<Integer> list = new LinkedList<>();
      list.add(0);
      ListIterator<Integer> iter = list.listIterator();
      iter.next();

      for (int i = 0;i < N;++ i) {
        if (S[i] == 'L')
          iter.previous();
        iter.add(i + 1);
      }

      for (int i : list)
        System.out.print(i + " ");

    }
  }
}



```

</details>

<hr>

##### Deque implementation
