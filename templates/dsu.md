## DSU 
1. Make sure to change the size of `parent` and `rank` according to your requirements.
2. Sometimes you may need to change the style of unionSet.
```cpp
    class UnionFind {
        std::vector <int> p;
        std::vector <int> rank;
        public:
    
        UnionFind (int N) { 
            /* Check what size you need and change accordingly*/
            rank.resize ((int)2e5, 0);  
            p.resize ((int)2e5, 0); 
    
            for (int i=0; i<N; i++) p[i] = i; 
        }
    
        int findSet (int i) { 
            return (p[i] == i) ? i : (p[i] = findSet (p[i])); 
        }
    
        bool isSameSet (int i, int j) { 
            return findSet(i) == findSet(j); 
        }
    
        void unionSet (int i, int j) { 
            if (!isSameSet (i, j)) {
                int x = findSet (i), y = findSet (j); 
                if (rank [x] > rank[y]) p[y] = x; 
                else { 
                    p[x] = y; 
                    if (rank [x] == rank[y]) rank [y] ++; 
                }
            }
        }
    };
```
