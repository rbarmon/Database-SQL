--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mog-dm.sql

--Student ID: 31165176
--Student Name: Rian Barrett
--Unit Code: FIT2094
--Applied Class No: A02

/* Comments for your marker:




*/

--3
--(a)Oracle sequences are going to be implemented in the database for the subsequent insertion of records into the database for the AW_DISPLAY, AW_STATUS and SALE tables.
-- create three sequences which could be used to provide primary key values for the AW_DISPLAY, AW_STATUS and SALE tables.
--All sequences should start at 100 and increment by 10

DROP SEQUENCE aw_display_id_seq;

DROP SEQUENCE aws_id_seq;

DROP SEQUENCE sale_id_seq;

CREATE SEQUENCE aw_display_id_seq START WITH 000100 INCREMENT BY 10;

CREATE SEQUENCE aws_id_seq START WITH 000100 INCREMENT BY 10;

CREATE SEQUENCE sale_id_seq START WITH 000100 INCREMENT BY 10;

--3(b)
/**
Suppose it is now 11 AM on 30th December 2022, a new artwork called The Sunny Christmas in Oz has just been received by the MOG central warehouse from the artist with artist code 1. 
The minimum payment this artist is prepared to accept for this artwork is $25000. 
You may assume that artist code 1 only has one artwork titled The Sunny Christmas in Oz. 
Take the necessary steps in the database to record the required entries for this new arrival (for this task you may make changes to the provided ARTWORK table).*/



INSERT INTO artwork VALUES (
    1,
    (select max(artwork_no) + 1 from artwork where artist_code = 1),
    'The Sunny Christmas in Oz',
    25000,
    TO_DATE('30-Dec-2022', 'DD-MON-YYYY')
);

--select * from artwork;

INSERT INTO aw_status VALUES (
    aws_id_seq.nextval,
    1,
    (select artwork_no from artwork where artwork_title = 'The Sunny Christmas in Oz'),
    TO_DATE('30-Dec-2022 11:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);


COMMIT;

--3(c)
/**
The above artwork titled The Sunny Christmas in Oz is then transited from the MOG central warehouse to Art Smart gallery (ph: 0490556646) on 1st January 2023 at 1:00 PM.
2 hours and 30 minutes later, the gallery informed MOG by a phone call that the artwork arrived safely at their location. On the next day, the gallery places the artwork on display for a duration of 14 days.
Make these required changes to the data in the database.*/

INSERT INTO aw_status VALUES (
    aws_id_seq.NEXTVAL,
    1,
    (
        SELECT
            artwork_no
        FROM
            artwork
        WHERE
            artwork_title = 'The Sunny Christmas in Oz'
    ),
    TO_DATE('1-Jan-2023 13:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0490556646'
    )
);

INSERT INTO aw_status VALUES (
    aws_id_seq.NEXTVAL,
    1,
    (
        SELECT
            artwork_no
        FROM
            artwork
        WHERE
            artwork_title = 'The Sunny Christmas in Oz'
    ),
    (
        SELECT
            aws_date_time + 2 / 24 + 30 / 60 / 24
        FROM
            aw_status
        WHERE
                artwork_no = (
                    SELECT
                        artwork_no
                    FROM
                        artwork
                    WHERE
                        artwork_title = 'The Sunny Christmas in Oz'
                )
            AND aws_status = 'T'
            AND gallery_id = (
                SELECT
                    gallery_id
                FROM
                    gallery
                WHERE
                    gallery_phone = '0490556646'
            )
    ),
    'G',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0490556646'
    )
);

INSERT INTO aw_display VALUES (
    aw_display_id_seq.NEXTVAL,
    1,
    (
        SELECT
            artwork_no
        FROM
            artwork
        WHERE
            artwork_title = 'The Sunny Christmas in Oz'
    ),
    (
        SELECT
            aws_date_time + 1
        FROM
            aw_status
        WHERE
                artwork_no = (
                    SELECT
                        artwork_no
                    FROM
                        artwork
                    WHERE
                        artwork_title = 'The Sunny Christmas in Oz'
                )
            AND aws_status = 'T'
            AND gallery_id = (
                SELECT
                    gallery_id
                FROM
                    gallery
                WHERE
                    gallery_phone = '0490556646'
            )
    ),
    (
        SELECT
            aws_date_time + 14
        FROM
            aw_status
        WHERE
                artwork_no = (
                    SELECT
                        artwork_no
                    FROM
                        artwork
                    WHERE
                        artwork_title = 'The Sunny Christmas in Oz'
                )
            AND aws_status = 'T'
            AND gallery_id = (
                SELECT
                    gallery_id
                FROM
                    gallery
                WHERE
                    gallery_phone = '0490556646'
            )
    ),
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0490556646'
    )
);

COMMIT;

--3(d)
/**
On the 4th January 2023 at 11:30 AM, the artwork titled The Sunny Christmas in Oz was sold to a customer named Haleigh Bonifacio (ph: 0480445917) at the price of $29,499.99. 
The gallery was then instructed to stop displaying this artwork on this sale date.
Make these required changes to the data in the database.*/
 
INSERT INTO sale VALUES (
    sale_id_seq.NEXTVAL,
    TO_DATE('4-Jan-2023', 'DD-MON-YYYY'),
    29499.99,
    (
        SELECT
            customer_id
        FROM
            customer
        WHERE
            customer_phone = '0480445917'
    ),
    (
        SELECT
            aw_display_id
        FROM
            aw_display
        WHERE
                artist_code = 1
            AND artwork_no = (
                SELECT
                    artwork_no
                FROM
                    artwork
                WHERE
                    artwork_title = 'The Sunny Christmas in Oz'
            )
            AND gallery_id = (
                SELECT
                    gallery_id
                FROM
                    gallery
                WHERE
                    gallery_phone = '0490556646'
            )
    )
);

INSERT INTO aw_status VALUES (
    aws_id_seq.NEXTVAL,
    1,
    (
        SELECT
            artwork_no
        FROM
            artwork
        WHERE
            artwork_title = 'The Sunny Christmas in Oz'
    ),
    TO_DATE('4-Jan-2023 11:30', 'DD-MON-YYYY HH24:MI'),
    'S',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0490556646'
    )
);

COMMIT;

--3(e)
/**
Before delivering the sold artwork to the customer’s address, MOG was informed that the customer was involved in illegal financial activities (the customer was accused of involvement in a money laundering case). 
As a result, MOG management decided to cancel the sale (remove it from the system) and have the payment refunded to the customer. 
The artwork was placed back in the gallery for continuing display for sale based on its original gallery display start date.
Make these required changes to the data in the database.*/

DELETE FROM sale
WHERE
        customer_id = (
            SELECT
                customer_id
            FROM
                customer
            WHERE
                customer_phone = '0480445917'
        )
    AND aw_display_id = (
        SELECT
            aw_display_id
        FROM
            aw_display
        WHERE
                artist_code = 1
            AND artwork_no = (
                SELECT
                    artwork_no
                FROM
                    artwork
                WHERE
                    artwork_title = 'The Sunny Christmas in Oz'
            )
            AND gallery_id = (
                SELECT
                    gallery_id
                FROM
                    gallery
                WHERE
                    gallery_phone = '0490556646'
            )
    );

DELETE FROM aw_status
WHERE
        artist_code = 1
    AND artwork_no = (
        SELECT
            artwork_no
        FROM
            artwork
        WHERE
            artwork_title = 'The Sunny Christmas in Oz'
    )
    AND aws_status = 'S';

COMMIT;



