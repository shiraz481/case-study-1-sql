# restaurant
The data is of Indian restaurant, the goal is to learn on the customers visiting patterns and set the points of  a new membership

Q1: Which item was the most popular for each customer?
select x.customer_id, x.product_id, max(x.num) from
(SELECT customer_id, product_id, count(product_id) as num FROM dannys_diner.sales
group by customer_id, product_id)x
group by customer_id

Q2:In the first week after a customer joins the program (including their join date) 
they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

select customer_id, if(day(order_date)-day(join_date)<=7 , price*2, price*1)
as points, sum(price) as total_points from
(SELECT s.customer_id, s.order_date, s.product_id, m.join_date FROM dannys_diner.sales s
left join dannys_diner.members m on m.customer_id=s.customer_id) x
join dannys_diner.menu on menu.product_id=x.product_id
where join_date is not null
group by customer_id
