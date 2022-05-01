[138. Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer/)

```java

class Solution {
    public Node copyRandomList(Node head) {
        Node left = null;
        Node right = null;

        Map<Integer, Node> integerToNode = new HashMap<>();
        Map<Node, Integer> nodeToInteger = new HashMap<>();

        for (var i = head; i != null; i = i.next) {
            Node temp = new Node(i.val);
            if (left == null && right == null) {
                left = temp;
                right = temp;
            } else {
                temp.next = right.next;
                right.next = temp;
                right = temp;
            }
        }

        int index = 0;
        for (var i = left; i != null; i = i.next)
            integerToNode.put(index ++, i);

        index = 0;
        for (var i = head; i != null; i = i.next)
            nodeToInteger.put(i, index ++);

        for (Node i = head, j = left; i != null && j != null; i = i.next, j = j.next) {
            j.random = (i.random == null) ? null :
            integerToNode.get(nodeToInteger.get(i.random));
        }
        return left;
    }
}
```
