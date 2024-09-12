show databases;
create database Air_bnb;
use Air_bnb;

select * from listing;
select * from booking;

#Q2 Write a query to show names from Listings table
select name from listing;

#Q3 Write a query to fetch total listings from the listings table
select count(*) from listing;

#Q4 Write a query to fetch total listing_id from the booking_details table
select count(listing_id) from booking;

#Q5 Write a query to fetch host ids from listings table
select host_id from listing;

#Q6 Write a query to fetch all unique host name from listings table
select distinct(host_name) from listing;

#Q7 Write a query to show all unique neighbourhood_group from listings table
select distinct(neighbourhood_group) from listing;

#Q8 Write a query to show all unique neighbourhood from listings table
select distinct(neighbourhood) from listing;

#Q9 Write a query to fetch unique room_type from listings tables
select distinct(room_type) from listing;

# Q10 Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listing where neighbourhood_group in ('Brooklyn','Manhattan')

#Q11 Write a query to show maximum price from booking_details table
select max(price) from booking;

#Q12 Write a query to show minimum price fron booking_details table
select min(price) from booking

#Q13 Write a query to show average price from booking_details table
select avg(price) from booking

#Q14 Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from booking

#Q15 Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from booking

#Q16 Write a query to show average availability_365
select avg(availability_365) from booking

#Q17 Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from booking where availability_365 > 300;

#Q18 Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from booking where price > 300 and price <400; 

#Q19 Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from booking where minimum_nights < 5;

#Q20 Write a query to show count where minimum_nights spend is greater than 100
select count(minimum_nights) from booking where minimum_nights > 100;

select * from listing;
select * from booking;

#Q21 Write a query to show all data of listings & booking_details
select * from 
listing inner join booking 
on listing.id = booking.listing_id;

#Q22 Write a query to show host name and price
select listing.host_name , booking.price  from 
listing inner join booking 
on listing.id = booking.listing_id;

#Q23 Write a query to show room_type and price
select listing.room_type , booking.price  from 
listing inner join booking 
on listing.id = booking.listing_id;

#Q24 Write a query to show neighbourhood_group & minimum_nights spend
select listing.neighbourhood_group , booking.minimum_nights  from 
listing inner join booking 
on listing.id = booking.listing_id;

#Q25 Write a query to show neighbourhood & availability_365
select listing.neighbourhood , booking.availability_365  from 
listing inner join booking 
on listing.id = booking.listing_id;

#Q26 Write a query to show total price by neighbourhood_group
select listing.neighbourhood_group , sum(booking.price) as Total_price  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.neighbourhood_group;

#Q27 Write a query to show maximum price by neighbourhood_group
select listing.neighbourhood_group , max(booking.price) as Maximum_price  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.neighbourhood_group;

#Q28 Write a query to show maximum night spend by neighbourhood_group
select listing.neighbourhood_group , max(booking.minimum_nights) as Maximum_night_spend  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.neighbourhood_group;

#Q29 Write a query to show maximum reviews_per_month spend by neighbourhood
select listing.neighbourhood , max(booking.reviews_per_month) as Maximum_reviews_per_month  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.neighbourhood;

#Q30 Write a query to show maximum price by room type
select listing.room_type  , max(booking.price) as Maximum_price  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.room_type ;

#Q31 Write a query to show average number_of_reviews by room_type
select listing.room_type  , avg(booking.number_of_reviews) as Average_no_of_reviews  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.room_type ;

#Q32 Write a query to show average price by room type
select listing.room_type  , avg(booking.price) as Average_price  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.room_type ;

#Q33 Write a query to show average night spend by room type
select listing.room_type  , avg(booking.minimum_nights) as Average_night_spend  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.room_type ;

#Q34 Write a query to show average price by room type but average price is less than 100
select listing.room_type  , avg(booking.price) as Average_price  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.room_type 
having avg(booking.price)<100;

#Q35 Write a query to show average night by neighbourhood and average_nights is greater than 5
select listing.neighbourhood , avg(booking.minimum_nights) as Average_night_spend  from 
listing inner join booking 
on listing.id = booking.listing_id
group by listing.neighbourhood  
having avg(booking.minimum_nights)>5;

#Q36 Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listing where id in (select listing_id from booking where price > 200);

#Q37 Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from booking where listing_id in (select id from listing where host_id=314941);

#Q38 Find all pairs of id having the same host id, each pair coming once only.
select distinct l1.id , l1.host_id from 
listing l1, listing l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;


#Q39 Write an sql query to show fetch all records that have the term cozy in name
select * from listing where name like "%cozy%"

#Q40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select listing.host_id, booking.price, listing.neighbourhood_group from
listing inner join booking
on listing.id=booking.listing_id
having listing.neighbourhood_group in ('manhattan');

#Q41 Write a query to show id , host name, neighbourhood and price but only for Upper West Side & 
#Williamsburg neighbourhood, also make sure price is greater than 100

select listing.id, listing.host_name, listing.neighbourhood, booking.price from
listing inner join booking
on listing.id=booking.listing_id
having listing.neighbourhood in ('West Side','Williamsburg') and booking.price > 100;

#Q42 Write a query to show id , host name, neighbourhood and price for host name Elise and 
#neighbourhood is Bedford-Stuyvesant

select listing.id, listing.host_name, listing.neighbourhood, booking.price from
listing inner join booking
on listing.id=booking.listing_id
having listing.host_name  in ('Elise') and listing.neighbourhood in ('Bedford-Stuyvesant');

#Q43 Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 
#and minimum_nights

select listing.host_name, booking.availability_365, booking.minimum_nights  from
listing inner join booking
on listing.id=booking.listing_id
having booking.availability_365 > 100 and booking.minimum_nights > 100;

#Q44 Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show 
#only that records where number of reviews are 500+ and review per month is 5+

select listing.id ,listing.host_name, booking.number_of_reviews , booking.reviews_per_month  from
listing inner join booking
on listing.id=booking.listing_id
having booking.number_of_reviews > 500 and booking.reviews_per_month  > 5;

#Q45 Write a query to show neighbourhood_group which have most total number of review
select listing.neighbourhood_group ,sum(booking.number_of_reviews) as Total_number_of_reviews from
listing inner join booking
on listing.id=booking.listing_id
group by listing.neighbourhood_group
order by sum(booking.number_of_reviews) desc
limit 1;

#Q46 Write a query to show host name which have most cheaper total price
select listing.host_name  ,sum(booking.price) as Total_price from
listing inner join booking
on listing.id=booking.listing_id
group by listing.host_name 
order by sum(booking.price)
limit 1;

#Q47 Write a query to show host name which have most costly total price
select listing.host_name  ,sum(booking.price) as Total_price from
listing inner join booking
on listing.id=booking.listing_id
group by listing.host_name 
order by sum(booking.price) desc
limit 1;

#Q48 Write a query to show host name which have max price using sub-query
select host_name from listing where id in 
(select listing_id from booking where price = (select max(price) from booking))

#Q49 Write a query to show neighbourhood_group where price is less than 100
select neighbourhood_group from listing where id in 
(select listing_id from booking where price < 100)

#Q50 Write a query to find max price, average availability_365 for each room type 
#and order in ascending by maximum price.

select listing.room_type  ,max(booking.price), avg(booking.availability_365) from
listing inner join booking
on listing.id=booking.listing_id
group by listing.room_type  
order by max(booking.price);






