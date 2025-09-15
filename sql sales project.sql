use project;
select * from restaurants;
select restaurant,area,price,avg_ratings from restaurants where city="Los Angeles";
select restaurant,city,avg_ratings,total_ratings from restaurants order by avg_ratings desc,total_ratings limit 5;
select food_type,count(restaurant) from restaurants group by food_type order by count(restaurant) desc;
select city,avg(price) from restaurants group by city order by avg(price) desc;
select restaurant,total_ratings from restaurants where total_ratings > 1000;
select city,restaurant from restaurants order by restaurant;
select city,restaurant,price from restaurants r where price = (select min(price) from restaurants where city = r.city);
select food_type,restaurant from restaurants r where price = (select max(price) from restaurants where food_type= r.food_type);
select food_type,max(restaurant) from restaurants group by food_type;
select Delivery_time,avg(avg_ratings) from restaurants group by delivery_time order by avg(avg_ratings) desc; 
select restaurant,total_ratings,price from restaurants where total_ratings>=4.5 and price>50;
select area,sum(restaurant) from restaurants where city="Los Angeles" group by area;
select Food_type,avg(price) from restaurants group by food_type;
select city,max(restaurant) from restaurants group by city order by max(restaurant) desc limit 1;
select restaurant from restaurants where delivery_time<30 and total_ratings>4.0;
select * from restaurants where total_ratings > (select avg(total_ratings) from restaurants);
select city,restaurant,total_ratings,rank() over (partition by city order by total_ratings desc) as ranked from restaurants;
select restaurant,city,total_ratings,(total_ratings*price) as expected_revenue from restaurants order by expected_revenue desc;
with ranked as (select City, Restaurant, Avg_ratings, Total_ratings,rank() over (partition by City order by Avg_ratings desc, Total_ratings desc) as rnk from restaurants) select City, Restaurant, Avg_ratings, Total_ratings, rnk from ranked
where rnk <= 3 order by City, rnk;
with avg_delivery as (Select avg(Delivery_time) as global_avg from restaurants) Select Food_type, avg(Delivery_time) as food_avg from restaurants, avg_delivery group by Food_type, global_avg having avg(Delivery_time) < global_avg order by food_avg;
Select food_type, avg(Price) AS food_avg, (select avg(Price) from restaurants) as overall_avg from restaurants group by Food_type order by food_avg desc;
Select r.Restaurant, r.City, r.Avg_ratings from restaurants r where r.Avg_ratings > (select avg(r2.Avg_ratings) from restaurants r2 where r2.City = r.City) order by r.City, r.Avg_ratings desc;

