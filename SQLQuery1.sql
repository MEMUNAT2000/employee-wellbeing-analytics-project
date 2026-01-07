            
alter table dbo.[supermarket_sales ] alter column rating int;

select max (Rating) as lowestvalue 
from dbo.[supermarket_sales ]; --------- To get the minimum value in a column. 

select max (Unit_price) as highestmoney,
max (Tax_5) as morevalue 
from dbo.[supermarket_sales ]; ----- for mutiple columns.

alter table dbo.[supermarket_sales ] add order_time TIME;

alter table dbo.[supermarket_sales ] drop column order_time;
EXEC sp_rename 'dbo.[supermarket_sales ].cogs', 'COGS', 'COLUMN'; ---- To rename a column name. 

alter table dbo.supermarket_sales alter column gross_income decimal (10,2);

select * into storesales from dbo.[supermarket_sales ] ------ to create a duplicate table but limitation is that it does not copy primary keys, indexes, or constraints. 
select * from storesales; 
select * from dbo.[supermarket_sales ]

select sum(Total) as Total_Revenue from DBO.[supermarket_sales ] ---- Total revenue/sales.
select sum(gross_income) as Total_Income from DBO.[supermarket_sales ] ------ Total Income
select count(Invoice_ID) as Total_Goods_Sold from dbo.[supermarket_sales ] ---- Total goods sold
select sum(COGS) as Overall_Cost_Of_Soldgoods from dbo.[supermarket_sales ] ----- Overall COGS.

select sum (COGS) as Overall_Cost_Of_Soldgoods,
sum(Total) as Total_Revenue,
sum(Total - COGS) as Total_Profit
from dbo.[supermarket_sales ];


select Product_line,
sum(Total) as Total_Revenue,
round(
sum(Total) * 100.0 /
sum(sum(Total)) over (),
2
) as PercentageOfTotalRevenue
from dbo.[supermarket_sales ]
group by Product_line
order by Total_Revenue desc; ----- Product lines based on the percentage contributed on the total revenue.

select Product_line,
sum(gross_income) as TotalProfit
from dbo.[supermarket_sales ]
group by Product_line
order by TotalProfit desc;  ----- Profit generated based to each product line.

select Customer_type, 
sum(Total) as highestpayingcustomer
from dbo.[supermarket_sales ]
group by Customer_type
order by highestpayingcustomer desc; ----- customer with the highest sales.

select Product_line, count(Product_line) as Total_Product
from dbo.[supermarket_sales ]
group by Product_line
order by Total_Product desc; -------- The most popular product among customers. 

select Payment, count(*) as Total_Transaction
from dbo.[supermarket_sales ]
group by Payment
order by Total_Transaction desc; ----- The payment method with the highest transaction

select Payment, count(*) as Total_Transaction,
sum(Total) as Total_Revenue,
avg(Total) as Total_avg_Revenue
from dbo.[supermarket_sales ]
group by Payment
order by Total_Revenue desc; ------ The payment method that generation the highest sales.

select Gender, count(Invoice_ID) as Total_Revenue
from dbo.[supermarket_sales ]
group by Gender
order by Total_Revenue desc; ------- Which gender contributes more to total revenue.

alter table dbo.[supermarket_sales ] add Satisfaction_Level nvarchar(20);

update dbo.[supermarket_sales ]
set Satisfaction_Level = 
case
when Rating between 4 and 5 then 'Poor'
when Rating between 6 and 7 then 'Average'
when Rating between 8 and 9 then 'Good'
when Rating = 10 then 'Excellent'
Else 'Unknown'
end; ------- For grouping variables into category.

select Gender, 
count(*) as Rating_count
from dbo.[supermarket_sales ]
group by Gender
order by Rating_count;

select Gender, Satisfaction_Level,
count(*) as Rating_value
from dbo.[supermarket_sales ]
group by Gender, Satisfaction_Level
order by Rating_value;

select Customer_type, Satisfaction_Level,
count(*) as Rating_value
from dbo.[supermarket_sales ]
group by Customer_type, Satisfaction_Level
order by Rating_value;

select Product_line, Satisfaction_Level,
count(Invoice_ID) as Rating_value
from dbo.[supermarket_sales ]
group by Product_line, Satisfaction_Level
order by Rating_value desc;

select Branch, sum(gross_income) as Total_Income
from dbo.[supermarket_sales ]
group by Branch order by Total_Income desc;

select Branch, sum(Total) as Total_Revenue
from dbo.[supermarket_sales ]
group by Branch order by Total_Revenue desc;

select branch, payment, count(payment) as total_paymentmethod
from dbo.[supermarket_sales ]
group by payment, Branch
order by total_paymentmethod desc;

select Product_line, count(invoice_ID) as sales_volume
from dbo.[supermarket_sales ]
group by Product_line
order by sales_volume desc;

select Product_line, sum(gross_income) as Total_revenue
from dbo.[supermarket_sales ]
group by Product_line
order by Total_revenue desc;

select Date, Time,
case
when Time >= '05:00:00' and Time < '12:00:00' then 'Morning'
when Time >= '12:00:00' and Time < '16:00:00' then 'Afternoon'
when Time >= '16:00:00' and Time < '19:00:00' then 'Evening'
else 'Night'
end as Time_of_Day
from dbo.[supermarket_sales ];

alter table dbo.[supermarket_sales ] add Time_Of_Day nvarchar(20);

update dbo.[supermarket_sales ]
set Time_Of_Day = 
case
when Time >= '05:00:00' and Time < '12:00:00' then 'Morning'
when Time >= '12:00:00' and Time < '16:00:00' then 'Afternoon'
when Time >= '16:00:00' and Time < '19:00:00' then 'Evening'
Else 'Night'
end;

select Date,
Datename(weekday, date) as Day_Of_Purchase
from dbo.[supermarket_sales ]

alter table dbo.[supermarket_sales ] add Day_Of_Purchase as datename(weekday, Date);
alter table dbo.[supermarket_sales ] add Month_Of_Purchase as datename(month, Date);

select Time_Of_Day, sum(Total) as Totalsales
from dbo.[supermarket_sales ]
group by Time_Of_Day
order by Totalsales desc;

select Day_Of_Purchase, sum(Total) as Totalsales
from dbo.[supermarket_sales ]
group by Day_Of_Purchase
order by Totalsales desc;

select Month_Of_Purchase, sum(Total) as Totalsales
from dbo.[supermarket_sales ]
group by Month_Of_Purchase
order by Totalsales desc;

SELECT
    Product_line,
    SUM(COGS) AS Subtotal,
    SUM(Tax_5) AS TaxAmount,
    SUM(COGS + Tax_5) AS FinalTotal
FROM dbo.[supermarket_sales ]
GROUP BY Product_line
ORDER BY FinalTotal desc;

select * from dbo.[supermarket_sales ] where Product_line <> null;


select * from dbo.[supermarket_sales ]









