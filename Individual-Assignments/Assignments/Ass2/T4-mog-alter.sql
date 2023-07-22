--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mog-alter.sql

--Student ID: 31165176
--Student Name: Rian Barrett
--Unit Code: FIT2094
--Applied Class No: A02

/* Comments for your marker:




*/

--4(a)
/**
MOG would like to be able to easily determine the total number of artworks that each artist has submitted which have been sold or are currently available for sale (i.e., not including the ones that have been returned).
Based on the data which is currently stored in the system, this attribute must be initialised to the correct current number of artworks. 
Add a new attribute which will record this requirement. */


--Add a new attribute which will record this requirement.
alter table artist add (
    artist_total_artwork NUMBER(4) default 0 not null
);

COMMENT ON COLUMN artist.artist_total_artwork IS
    'Total number of Artworks sold or for sale by the Artist';
    


--Based on the data which is currently stored in the system, this attribute must be initialised to the correct current number of artworks.
-- determine the total number of artworks that each artist has submitted which have been sold or are currently available for sale (i.e., not including the ones that have been returned).

--has to be G or S. Skip if R

--To test for R
/**
INSERT INTO aw_status VALUES (
    32,
    9,
    1,
    TO_DATE('15-Aug-2023 10:00', 'DD-MON-YYYY HH24:MI'),
    'R',
    5
);
*/
        
UPDATE artist
SET
    artist_total_artwork = total_art_num
where
    artist_code = 
        (select artist_code from
        (select artist_code,
        count(artist_code) as total_art_num
        from
        (select artist_code from(
        select distinct
        artist_code, artwork_no
        from 
            (select artist_code, artwork_no, aws_status
            from aw_status
            where (artist_code, artwork_no) not in 
                (select artist_code, artwork_no
                from aw_status
                where aws_status = 'R'
                )
            order by   
            artist_code,artwork_no)
        where
        aws_status = 'G' or 
        aws_status = 'S'
        order by artist_code,artwork_no))
        group by 
        artist_code
        order by
        artist_code));   
        
    

create table total_art_details (
    artist_code           NUMERIC(4) NOT NULL,
    total_art_num         NUMERIC(4) NOT NULL
);

insert into total_art_details values (
        (
        select artist_code,
        count(artist_code) as total_art_num
        from
        (select artist_code from(
        select distinct
        artist_code, artwork_no
        from 
            (select artist_code, artwork_no, aws_status
            from aw_status
            where (artist_code, artwork_no) not in 
                (select artist_code, artwork_no
                from aw_status
                where aws_status = 'R'
                )
            order by   
            artist_code,artwork_no)
        where
        aws_status = 'G' or 
        aws_status = 'S'
        order by artist_code,artwork_no))
        group by 
        artist_code
        order by artist_code)
        
        );
        
    
UPDATE artist
SET
    artist_total_artwork = total_art_num
where

        
        
        ;   
        
        
      
--4(b)
/**
In order to make it easy to promote customers based on their loyalty level, MOG would like to classify customers into three different levels based on the amount of money they have spent at MOG using the following criteria:
D: Diamond customer who have spent more than or equal to $100000
P: Platinum customer who have spent more than $50000 but less than $100000
G: Gold customer who have spent less than and equal to $50000 including the customers who haven’t spent anything (e.g., a newly registered customer).
MOG would like to record this data in their database and wish to initialise the correct customer level based on the data that is currently stored in the database. 
Change the database to meet this requirement.*/


select * from customer;
select * from sale;

ALTER TABLE customer ADD (
    customer_loyalty_level CHAR(1) DEFAULT 'G' NOT NULL
);

COMMENT ON COLUMN customer.customer_loyalty_level IS
    'Loyalty Level of Customer either (D,P,G)';

ALTER TABLE customer
    ADD CONSTRAINT customer_loyalty_level_chk CHECK ( customer_loyalty_level IN ( 'D', 'P', 'G' ) );    
    

-- MOG would like to classify customers into three different levels based on the amount of money they have spent at MOG using the following criteria:
--D: Diamond customer who have spent more than or equal to $100000
--P: Platinum customer who have spent more than $50000 but less than $100000
--G: Gold customer who have spent less than and equal to $50000 including the customers

UPDATE customer
SET
    customer_loyalty_level = 'P'
WHERE
    
    
    
    
UPDATE customer
SET customer_loyalty_level = 'D'
from customer as c
Inner join
    (SELECT
        customer_id,
        SUM(sale_price) AS total_pay
    FROM
        sale
    GROUP BY
        customer_id
    ORDER BY
        customer_id) q 
where c.customer_id = q.customer_id and q.total_pay >= 100000;



COMMIT;

select * 
FROM
    customer
    NATURAL JOIN ;


        
--4(c)
/**
MOG has observed that many customers seem to purchase artworks from the same artist. 
They want to record the number of artworks that each customer has purchased from each artist so as to assist with future marketing opportunities for particular artists.
Change the database to meet this requirement. Your solution must record the correct number of artworks that each customer has purchased from each artist based on the data that is currently stored in the database.*/



--many customers seem to purchase artworks from the same artist.
--record the number of artworks that each customer has purchased from each artist
DROP TABLE marketing purge;

create table marketing 
--customerid
--artist_id_purch
--...
--





