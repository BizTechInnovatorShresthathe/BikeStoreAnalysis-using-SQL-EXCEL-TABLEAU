--Total units and Revenue of each customer with place and date

SELECT 
o.order_id,
CONCAT(c.first_name,' ',c.last_name) Customer,
c.city,
c.state,
o.order_date,
p.product_name,br.brand_name,
cat.category_name,s.store_name,
CONCAT(staff.first_name,' ',staff.last_name) Staff,
SUM(i.quantity) AS 'total units', 
SUM(i.quantity * i.list_price) AS 'revenue'
FROM sales.orders o  JOIN sales.customers c ON o.customer_id=c.customer_id
JOIN sales.order_items i ON o.order_id=i.order_id 
JOIN production.products p On i.product_id = p.product_id
JOIN production.categories cat on p.category_id= cat.category_id
JOIN sales.stores s On o.store_id=s.store_id
JOIN sales.staffs staff On o.staff_id=staff.staff_id
JOIN production.brands br ON  p.brand_id=br.brand_id
Group by o.order_id,
CONCAT(c.first_name,' ',c.last_name),
c.city,
c.state,
o.order_date,
p.product_name,cat.category_name, s.store_name,
CONCAT(staff.first_name,' ',staff.last_name),
br.brand_name
