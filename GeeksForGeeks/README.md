## Binary Trees
1. [All Duplicate Sub Trees](https://practice.geeksforgeeks.org/problems/duplicate-subtrees/1), Medium
    - Key Concept
        - Storing the hash in form of a string of inorder traversals of every  sub tree.
       
          <details>
          <summary>Example</summary>

            ```
                     10            inorder traversal = 4 2 5 10 3
                    /  \           string format = 4#2#5#10#N#3#N  , where N is for NULL
                   2    3
                  / \
                 4   5
      
            ```
          </details>
