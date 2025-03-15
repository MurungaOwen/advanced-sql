## Overview of the Topics covered 

### Joins
- Lets say we have like 2 tables one for storing shoe details `Shoe`  and has attributes `shoe_name` and `sole` then another for storing sole info `Sole` with attributes sole_name and sole_colour.
    - #### Inner join
        What inner join does is it takes data that appears in both tables , in our case it takes sole that is in `Shoe` and in `Sole` table.
        Syntax:
        ```sql
        SELECT shoe_name, sole, S.sole_colour FROM Shoe Sh INNER JOIN Sole S on Sh.sole = S.sole;
        ```
    - #### Left Join
        Left join takes data from table 1 as it is and doesnt emit any `takes all from table 1` and maps to table 2 if it doesnt have a value it specifies `null`.
        Syntax:
       ```sql
        SELECT shoe_name, sole, S.sole_colour FROM Shoe Sh LEFT JOIN Sole S on Sh.sole = S.sole;
        ```
      our table one in this case is Shoe and table 2 is Sole. So in short it takes all Shoes even ones that dont have a sole.

  - #### Right Join
      Right join `preserves data from table 2` and maps to table 1 where from table 2 dont have a value in table 1 it is replaced with null.
    Syntax:
      ```sql
        SELECT shoe_name, sole, S.sole_colour FROM Shoe sh RIGHT JOIN Sole S on Sh.sole = S.sole;
      ```
      In short it maps all soles even ones that dont have a shoe
- ##### FUll join
    This aggregates from all table , more like spreading them all on the floor.
    Syntax:
  ```sql
        SELECT shoe_name, sole, S.sole_colour FROM Shoe Sh FULL JOIN Sole S on Sh.sole = S.sole;
  ```
    This will show all soles that dont have a shoe and all shoes that dont have a sole all data there.
