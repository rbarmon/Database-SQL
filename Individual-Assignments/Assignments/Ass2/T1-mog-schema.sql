--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-mog-schema.sql

--Student ID: 31165176
--Student Name: Rian Barrett
--Unit Code: FIT2094
--Applied Class No: A02

/* Comments for your marker:


*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script
/* Create table AW_DISPLAY*/
CREATE TABLE aw_display (
    aw_display_id         NUMERIC(6) NOT NULL,
    artist_code           NUMERIC(4) NOT NULL,
    artwork_no            NUMERIC(4) NOT NULL,
    aw_display_start_date DATE NOT NULL,
    aw_display_end_date   DATE,
    gallery_id            NUMERIC(3) NOT NULL
);

COMMENT ON COLUMN aw_display.aw_display_id IS
    'Identifier for Artwork Display';

COMMENT ON COLUMN aw_display.artist_code IS
    'Identifier for artist';

COMMENT ON COLUMN aw_display.artwork_no IS
    'Identifier for artwork within this artist';

COMMENT ON COLUMN aw_display.aw_display_start_date IS
    'Date this artwork display in the gallery began';

COMMENT ON COLUMN aw_display.aw_display_end_date IS
    'Date this artwork display in the gallery ends';

COMMENT ON COLUMN aw_display.gallery_id IS
    'Identifier for Gallery'; 

/* AW_DISPLAY non FK constraints*/

ALTER TABLE aw_display ADD CONSTRAINT aw_display_pk PRIMARY KEY ( aw_display_id );

ALTER TABLE aw_display
    ADD CONSTRAINT aw_display_uq UNIQUE ( artist_code,
                                          artwork_no,
                                          aw_display_start_date );

/* Create table AW_STATUS*/
CREATE TABLE aw_status (
    aws_id        NUMERIC(6) NOT NULL,
    artist_code   NUMERIC(4) NOT NULL,
    artwork_no    NUMERIC(4) NOT NULL,
    aws_date_time DATE NOT NULL,
    aws_status    CHAR(1) NOT NULL,
    gallery_id    NUMERIC(3)
);

COMMENT ON COLUMN aw_status.aws_id IS
    'Identifier for Artwork Status';

COMMENT ON COLUMN aw_status.artist_code IS
    'Identifier for artist';

COMMENT ON COLUMN aw_status.artwork_no IS
    'Identifier for artwork within this artist';

COMMENT ON COLUMN aw_status.aws_date_time IS
    'Date and time of status change took place';

COMMENT ON COLUMN aw_status.aws_status IS
    'The Artwork Status either (W, T, G, S, R)';

COMMENT ON COLUMN aw_status.gallery_id IS
    'Identifier for Gallery'; 

/* AW_STATUS non FK constraints*/

ALTER TABLE aw_status ADD CONSTRAINT aw_status_pk PRIMARY KEY ( aws_id );

ALTER TABLE aw_status
    ADD CONSTRAINT aw_status_uq UNIQUE ( artist_code,
                                         artwork_no,
                                         aws_date_time );

/**                                          
● W - in MOG storage at the MOG central warehouse
● T - in transit (being shipped to/from a gallery), include to/from which gallery id
● G - located at a gallery, include gallery id
● S-sold,or
● R - returned to the artist */

ALTER TABLE aw_status
    ADD CONSTRAINT ck_aws_status CHECK ( aws_status IN ( 'W', 'T', 'G', 'S', 'R' ) );
    
    

/* Create table SALE*/
CREATE TABLE sale (
    sale_id       NUMERIC(5) NOT NULL,
    sale_date     DATE NOT NULL,
    sale_price    NUMERIC(9, 2) NOT NULL,
    customer_id   NUMERIC(5) NOT NULL,
    aw_display_id NUMERIC(6) NOT NULL
);

COMMENT ON COLUMN sale.sale_id IS
    'Identifier for sale';

COMMENT ON COLUMN sale.sale_date IS
    'Date sale was closed';

COMMENT ON COLUMN sale.sale_price IS
    'Price customer paid for artwork';

COMMENT ON COLUMN sale.customer_id IS
    'Identifier for customer';

COMMENT ON COLUMN sale.aw_display_id IS
    'Identifier for Artwork Display'; 

/* SALE non FK constraints*/
ALTER TABLE sale ADD CONSTRAINT sale_pk PRIMARY KEY ( sale_id );



/* Add all missing FK Constraints below here*/
/* AW_DISPLAY FK constraints*/

ALTER TABLE aw_display
    ADD CONSTRAINT artwork_aw_display FOREIGN KEY ( artist_code,
                                                    artwork_no )
        REFERENCES artwork ( artist_code,
                             artwork_no );

ALTER TABLE aw_display
    ADD CONSTRAINT gallery_aw_display FOREIGN KEY ( gallery_id )
        REFERENCES gallery ( gallery_id );        
        
/* AW_STATUS FK constraints*/

ALTER TABLE aw_status
    ADD CONSTRAINT artwork_aw_status FOREIGN KEY ( artist_code,
                                                   artwork_no )
        REFERENCES artwork ( artist_code,
                             artwork_no );

ALTER TABLE aw_status
    ADD CONSTRAINT gallery_aw_status FOREIGN KEY ( gallery_id )
        REFERENCES gallery ( gallery_id );    

/* SALE FK constraints*/

ALTER TABLE sale
    ADD CONSTRAINT aw_display_sale FOREIGN KEY ( aw_display_id )
        REFERENCES aw_display ( aw_display_id );

ALTER TABLE sale
    ADD CONSTRAINT customer_sale FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );
        
        
        