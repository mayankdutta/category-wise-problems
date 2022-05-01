[D - Moves on Binary Tree ](https://atcoder.jp/contests/abc243/tasks/abc243_d)

```java
import java.util.*;

import java.math.BigInteger;

import java.util.Scanner;

class  Main{ // only main accepted @atcoder
  public static void main(String args[]) {
    Scanner in = new Scanner(System.in);

    int n = in.nextInt();
    long x = in.nextLong();
    String s = in.next();

    StringBuilder t = new StringBuilder();
    for (int i = 0; i < s.length(); i++) {
      if (t.length() == 0) {
        t.append(s.charAt(i));
      } else if ((t.charAt(t.length() - 1) == 'R' && s.charAt(i) == 'U')
          || (t.charAt(t.length() - 1) == 'L' && s.charAt(i) == 'U')) {
        t.deleteCharAt(t.length() - 1);
      } else {
        t.append(s.charAt(i));
      }
    }

    for (int i = 0; i < t.length(); i++) {
      if (t.charAt(i) == 'U')
        x /= 2;
      else if (t.charAt(i) == 'R')
        x = 2 * x + 1;
      else
        x = 2 * x;
    }
    System.out.println(x);
    in.close();
  }
}

```
