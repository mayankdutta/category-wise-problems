```txt
Interview me ek se LRU Cache pucha tha 
Baakio se Tree and LinkedList related 
Ek do se shyd string/stack(balanced paranthesis) b pucha tha
```


1. In this problem lets call the alphabet string the string that consists of all uppercase englist letters in the order they appear in the alphabet: "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
    Given a string consisting of uppercase english letters, your task is to find the length of the shortest substring that contains the alphabet string as subsequence.
    lets have input: **FORCESABCDEFDIVGHIJKLMNOPQRSTUVWXYZ**. the shortest substrig as a subsequence is **ABCDEFDIVGHIJKLMNOPQRSTUVWXYZ**, and it's length is 29.
    
    *constraints* 
    26 <= length of S <= 1e5
    Time limit: 1 sec
    
    input: 
    ```txt
    ABCDEFDIVGHIJKLMNICPCOPQRSTUVWXYZO
    ```
    output: `33`
    
2. Your friend is a property tycoon and own many plots of a given area. Hoever, he wants to merge the plots to make one big plot, for which he goes to Agent. 
   The agent tell him that in one oeration, any two plots can be merged, and in return, he will receive one plot of area `Ax + Ay` (where `Ax` and `Ay` are the areas
   of two plots merged in one operation) and the resulting plot will be added to his inventroy of plots again, but the cost of one opearation is equal to the 
   merged area is cost = `Ax  + Ay`
   
   This operation is performed until he left with one plot. 
   
   **Help him merge the plots such that in the end, he is left with one plot whose area is the sum of all his current plots, but the cost shall remain minimum.**
   
   Also let him know if this is profitable to merge the plots.
   You are given the colst per unit area of each plot. 
   
   **The total cost of the plots** = (sigma)Area * cost per unit area. 
   **He considers it profitable to merge them if the cost to merge the plots is less than the total cost of the plot**
   
   *input*
   ```txt
   N = 2
   array plots = [10, 20] 
   array_costs = [1, 1]
   ```
   
   *approach*
   **the total cost of the plots** = (total area) * cost per unit area => `10 * 1 + 20 * 1` = 30 
   **total cost to merge the plots** = 10 + 20 = `30`
   
   **as the total cost to merge the plots isn't less than the total cost of the plots. therefore it isn't profitable to merge. 
   
   *constraints* 
   ```txt
   1 <= N <= 1e4
   1 <= Ai <= 1e4
   1 <= cost per unit area <= 10
   ```
   
   *sample input* 
   ```txt
   5
   10 20 35 70 150
   2 4 6 1 3
   ```
   
   
   *output* 
   ```txt
   515
   yes
   ```
   
   *explanation* 
   ```txt
   initially cost = 0 and plots = [10 20 35 70 150]
   plots of area 10 and 20 were merged lead to cost = 0 + 10 + 20 = 30
   and plot of 30 was added to the inventory. 
   
   plots of the area 30 and 35 were merged which lead to cost = 30 + (30 + 35) = 95
   and a plot of area 65 is added to the inventory. 
   
   Plots of area 10 and 20 were merged which lead to Cost = 0+10+20) = 30
   And a Plot of area 30 was added to the inventory.
   Now, Plots = [30, 35, 50, 85]

   Plots of area 30 and 35 were merged which lead to Cost = 30+(30+35) = 95
   And a Plot of area 65 was added to the inventory.
   Now, Plots = (65,70,150)

   Plots of area 65 and 70 were merged which lead to Cost = 95+(65+70) = 230
   And a Plot of area 135 was added to the inventory.
   Now, Plots (135,150)

   Plots of rea 135 and 150 were merg which lead to Cost = 230+(135+150) = 515
   And now we are left with one plot of area 285.
   Hence Cost = 515

   Now, Cost per unit area= (2.4.6.1.3)
   cost of a plot = area * cost per unit area
   hence total cost of all plots = 10*2 + 20*4 + 35*6 + 70*1 + 150*3 = 830
   as cost to merge is less than the total cost of the plots, it is profitableto merge them. 
   ```
 
3. In OOP which one of the following is ued by the compiler process objects based on the data type or class? 
   i. inheritance
   ii. polymorphism
   iii. abstraction
   iv. encapsulation

4. In which of the following algos the maximum element is found and then placed at the end. 
   i. heap sort
   ii. recursive bubble
   iii. bubble
   iv. NOTA
   
5. Tara downloaded a movie on her laptop and want to share it with his friend. So she connects her friend's phone to the laptop and started copying it to the phone. While the movie was still transferring, suddenly due to low charging the laptop got shut down. After Backing it up the movie was not copied into her friend's phone and the movie file was safe on her laptop. She wanted to know why the data(Movie file) wasn't lost in the middle of a process. Which of the following statements will give Tara a better understanding of the situation?

    Statements
    1. Data stored on the buffer get lost during system crashes.
    2. Data stored on the buffer does not get lost during system crashes.
    3. Data stored on the disk get lost during disk crashes.
    4. Data stored on the disk does not get lost during disk crashes.
    
    options: 
    i. 1 and 3 
    ii. 1 and 4
    iii. 2 and 3 
    iv. 2 and 4

