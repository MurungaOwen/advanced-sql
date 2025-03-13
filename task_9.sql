/*
    SQL Script: Classify Nodes in a Binary Search Tree (BST)
    Author: [Your Name]
    Date: [Current Date]
    Description:
    This script classifies each node in a BST as either:
    - "Root": The node with no parent (P IS NULL).
    - "Leaf": The node that does not appear as a parent (i.e., does not exist in column P).
    - "Inner": The node that has both a parent and at least one child.
*/

-- Create the BST table (if not exists)
CREATE TABLE IF NOT EXISTS BST (
    N INT PRIMARY KEY,  -- Node Value
    P INT               -- Parent Node (NULL if Root)
);

-- Insert sample data into BST table
INSERT INTO BST (N, P) VALUES
    (1, 2), (3, 2), (5, 6), (7, 6),
    (2, 4), (6, 4), (4, 15), (8, 9),
    (10, 9), (12, 13), (14, 13), (9, 11),
    (13, 11), (11, 15), (15, NULL);

-- Query to classify nodes as Root, Inner, or Leaf
SELECT N, 
    CASE
        WHEN P IS NULL THEN 'Root'  -- Node with no parent is the Root
        WHEN N IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'  -- Node appearing as a Parent
        ELSE 'Leaf'  -- Node that is not a parent (no children)
    END AS type_node
FROM BST
ORDER BY N;  -- Order output by Node value for better readability
