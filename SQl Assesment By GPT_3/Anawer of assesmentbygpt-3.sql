create database assesmentbygpt_3;
use assesmentbygpt_3;

drop database assesmentbygpt_3;

select * from products;

-- Find the total order amount for each customer.

select c.customerid, c.firstname, c.lastname, sum(o.amount) as total_amount 
from orders o join customers c on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname order by total_amount desc;

-- Find customers who have placed more than 1 order.
select customerid, count(orderid) as total_ordered from orders
group by customerid
having total_ordered > 1;

-- Get the top 3 highest order amounts.

select customerid, sum(amount) as total_amount from orders
group by customerid order by total_amount desc limit 3;

-- Find total quantity of products sold by category.

select p.category as category, sum(o.quantity) as total_quantity from orderitems o
join products p on p.productid = o.productid
group by category order by total_quantity desc;

-- List all orders with their total value (price × quantity).

  select o.orderid as orderid, sum(p.price*oi.quantity) as total_value 
  from orderitems oi join products p on p.productid = oi.productid
  join orders o on o.orderid = oi.orderid
  group by orderid order by total_value desc;
  
  --  Find the customer who spent the most overall.

select c.customerid, c.firstname, c.lastname, sum(o.amount) as most_spent
from orders o join customers c on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname order by most_spent desc limit 1;

-- Find the average order value per customer.

select c.customerid, c.firstname, c.lastname, round(avg(o.amount),2) as average_spent
from orders o join customers c on c.customerid = o.customerid
group by c.customerid, c.firstname, c.lastname order by average_spent desc;

-- Get all customers who joined before 2022 and have placed an order.

SELECT DISTINCT c.firstname, c.lastname, sum(o.amount) as total_order
FROM customers c
JOIN orders o ON c.customerid = o.customerid
WHERE c.joindate < '2022-01-01'
group by c.firstname, c.lastname order by total_order ;

-- Find products that have been sold more than once.
SELECT p.productname as productname, SUM(oi.quantity) AS total_sold
FROM orderitems oi
JOIN products p ON oi.productid = p.productid
GROUP BY productname
HAVING total_sold > 1 order by total_sold desc;

-- Get each customer’s latest order date.

SELECT c.firstname, c.lastname, MAX(o.orderdate) AS last_order
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.firstname, c.lastname order by last_order desc;








