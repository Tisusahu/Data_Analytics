create database group2;
use group2;
show tables;
create table Student(id int primary key,Name varchar(30) not null,course varchar(30) default"computer",Age int);
desc table Student;
insert into Student values(001,"Tisu","IT",20);
insert into Student values(002,"Ayush","IT",20),(003,"sudhir","IT",21);
insert into Student values(004,"divyanshu","IT",20);
select * from Student;
select * from books;
                 #basic queries 
select * from books where genre="fiction"; #Q1
select * from books where Published_year>1950; #Q2
select * from books where price=(select max(price) from books); #Q6
select * from customers;
select * from orders;
select * from customers where country = "canada"; #Q3
select * from orders where order_date between "2023-11-01" and "2023-11-30"; #Q4
select sum(stock) as total_stock from books; #Q5
select * from orders where Quantity>1; #Q7
select * from orders where Total_Amount>20; #Q8
select distinct genre from books ; #Q9
select * from books where stock=(select min(stock) from books); #Q10
select sum(Total_Amount) from orders; #Q11
                #Advance queries
                #Q1
SELECT * FROM ORDERS;

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;
#Q2
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';
#Q3
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;
#Q4
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;
#Q5
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;
#Q6
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;
#Q7
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;
#Q8
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;
#Q9
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

