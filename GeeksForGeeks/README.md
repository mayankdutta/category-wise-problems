## Binary Trees
1. [All Duplicate Sub Trees](https://practice.geeksforgeeks.org/problems/duplicate-subtrees/1), Medium
    - Algorithm
      - Doing the post order traversal(but storing the hash of traversal in form of inorder) and at each node maintaing the frequency of the traversal hash 
      string by using an unordered map

        <details>
        <summary>Sample Code</summary>

          ```cpp
          string inOrderInString(Node* root, unordered_map<string,int> &m, vector<Node*> &duplicates{
            if(!root){
                string temp = "N";
                return temp;
            }
            string leftSubTree, rightSubTree,rootTree;
            leftSubTree = inOrderInString(root->left,m,duplicates);
            rightSubTree = inOrderInString(root->right,m,duplicates);
            rootTree = leftSubTree + "#" + to_string(root->data) + "#" + rightSubTree;
            ++m[rootTree];
            if(m[rootTree] == 2) duplicates.push_back(root);
            return rootTree;
          }
          vector<Node*> printAllDups(Node* root){
            unordered_map<string,int> m;
            vector<Node*> ans;
            inOrderInString(root,m,ans);
            return ans;
          }

          ```
       </details>

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
