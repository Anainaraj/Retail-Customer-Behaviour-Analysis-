select * from customer;

---1
SELECT "purchase-amount" AS revenue
FROM customer;

---2
select "customer-id", "purchase-amount" from customer
where "discount-applied" = 'Yes' and "purchase-amount" >= (
select avg("purchase-amount")
from customer
);

---3
select "item-purchased" , round(avg("review-rating"):: numeric,2) as "avg_review_rating"
from customer
group by "item-purchased"
order by "avg_review_rating"
limit 5;

---4
select  "shipping-type","item-purchased"
from customer
where "shipping-type" in ('Express','Standard')
group by "shipping-type", "item-purchased";

---5
select  count("customer-id"), "subscription-status", round(avg("purchase-amount")::numeric,2) as "avg_spend", sum("purchase-amount") as "total_revenue"
from customer
group by "subscription-status"
order by "avg_spend", "total_revenue";

--6
select "item-purchased", round(100*sum(case when "discount-applied"= 'Yes' then 1 else 0 end)/count(*),2) as "discount_rate"
from customer
group by "item-purchased"
order by "discount_rate" desc;

---7
with customer_type as(
select "customer-id", "previous-purchases",
case when "previous-purchases" = 1 then 'NEW' when "previous-purchases" between 2 and 10 then 'RETURNING' else 'LOYAL' end as "customer-segment" 
from customer
)
select "customer-segment", count(*) as "no-of-counts"
from "customer_type"
group by "customer-segment";

---8
WITH "item_counts" AS (
SELECT
category,
"item-purchased",
COUNT("customer-id") AS "total-orders",
ROW_NUMBER() OVER (
PARTITION BY category
ORDER BY COUNT("customer-id") DESC
) AS "item-rank"
FROM customer
GROUP BY category, "item-purchased"
)
SELECT
"item-rank",
category,
"item-purchased",
"total-orders"
FROM "item_counts"
WHERE "item-rank" <= 3;

---9
select "subscription-status", count("customer-id") as "repeated-buyers"
from customer
where "previous-purchases" >5
group by "subscription-status";

---10
select "age-group", sum("purchase-amount") as "total-revenue"
from customer
group by "age-group"
order by "total-revenue";