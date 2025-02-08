-- Lesson on Triggers
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS items (
    name varchar(20) NOT NULL,
    quantity int NOT NULL DEFAULT 10
);

CREATE TABLE IF NOT EXISTS orders (
    item_name VARCHAR(20) NOT NULL,
    number int NOT NULL
);

INSERT INTO items (name) VALUES ("apple"), ("pineapple"), ("pear");

-- TRIGGER when order is added we decrease the item quantity
delimiter //
CREATE TRIGGER subtract_quantity BEFORE INSERT ON orders
FOR EACH ROW
    BEGIN
        UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name;
    END;
//
delimiter ;

-- Show and add orders
SELECT * FROM items;
SELECT * FROM orders;

INSERT INTO orders (item_name, number) VALUES ('apple', 1);
INSERT INTO orders (item_name, number) VALUES ('apple', 3);
INSERT INTO orders (item_name, number) VALUES ('pear', 2);

SELECT "------------------------";

SELECT * FROM items;
SELECT * FROM orders;