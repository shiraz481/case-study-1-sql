#Which item was the most popular for each customer?
select x.customer_id, x.product_id, max(x.num) from
(SELECT customer_id, product_id, count(product_id) as num FROM dannys_diner.sales
group by customer_id, product_id)x
group by customer_id