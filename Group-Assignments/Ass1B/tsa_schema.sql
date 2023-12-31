-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-01-09 11:04:45 CST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

--student id: 28981510
--student name: YingHua Sun
--student id: 31165176
--student name: Rian Barrett

set echo on
SPOOL tsa_schema_output.txt

DROP TABLE booking CASCADE CONSTRAINTS;

DROP TABLE company CASCADE CONSTRAINTS;

DROP TABLE member CASCADE CONSTRAINTS;

DROP TABLE member_fee CASCADE CONSTRAINTS;

DROP TABLE point_of_interest CASCADE CONSTRAINTS;

DROP TABLE rate CASCADE CONSTRAINTS;

DROP TABLE rating_level CASCADE CONSTRAINTS;

DROP TABLE resort CASCADE CONSTRAINTS;

DROP TABLE review CASCADE CONSTRAINTS;

DROP TABLE town CASCADE CONSTRAINTS;

DROP TABLE unit CASCADE CONSTRAINTS;

DROP TABLE unit_maint CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE booking (
    book_no         NUMBER(4) NOT NULL,
    member_no       NUMBER(3) NOT NULL,
    resort_id       NUMBER(7) NOT NULL,
    resort_id1      NUMBER(7) NOT NULL,
    book_start_date DATE NOT NULL,
    book_end_date   DATE NOT NULL,
    book_adult_num  NUMBER(3) NOT NULL,
    book_child_num  NUMBER(3) NOT NULL,
    book_cost       NUMBER(5) NOT NULL,
    resort_id2      NUMBER(7) NOT NULL,
    unit_no         NUMBER(3) NOT NULL
);

COMMENT ON COLUMN booking.book_no IS
    'booking number';

COMMENT ON COLUMN booking.member_no IS
    'member number';

COMMENT ON COLUMN booking.resort_id IS
    'resort id';

COMMENT ON COLUMN booking.resort_id1 IS
    'resort id';

COMMENT ON COLUMN booking.book_start_date IS
    'booking start date';

COMMENT ON COLUMN booking.book_end_date IS
    'booking end date';

COMMENT ON COLUMN booking.book_adult_num IS
    'booking adult number';

COMMENT ON COLUMN booking.book_child_num IS
    'booking child number';

COMMENT ON COLUMN booking.book_cost IS
    'booking point cost';

COMMENT ON COLUMN booking.resort_id2 IS
    'resort id';

COMMENT ON COLUMN booking.unit_no IS
    'unit number';

ALTER TABLE booking
    ADD CONSTRAINT booking_pk PRIMARY KEY ( book_no,
                                            member_no,
                                            resort_id,
                                            resort_id1 );

CREATE TABLE company (
    company_abn      NUMBER(11) NOT NULL,
    company_name     VARCHAR2(50) NOT NULL,
    company_ceo      VARCHAR2(60) NOT NULL,
    company_phone_no NUMBER(10) NOT NULL,
    company_address  VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN company.company_abn IS
    'company Australian Business Number';

COMMENT ON COLUMN company.company_name IS
    'company name';

COMMENT ON COLUMN company.company_ceo IS
    'company CEO''s name';

COMMENT ON COLUMN company.company_address IS
    'company address';

ALTER TABLE company ADD CONSTRAINT company_pk PRIMARY KEY ( company_abn );

CREATE TABLE member (
    member_no        NUMBER(3) NOT NULL,
    resort_id        NUMBER(7) NOT NULL,
    member_name      VARCHAR2(60) NOT NULL,
    member_address   VARCHAR2(60) NOT NULL,
    member_email     VARCHAR2(60) NOT NULL,
    member_phone_no  VARCHAR2(10) NOT NULL,
    member_joindate  DATE NOT NULL,
    member_point     NUMBER(7) NOT NULL,
    resort_id1       NUMBER(7),
    member_recommend NUMBER(3)
);

COMMENT ON COLUMN member.member_no IS
    'member number';

COMMENT ON COLUMN member.resort_id IS
    'resort id';

COMMENT ON COLUMN member.member_name IS
    'member name';

COMMENT ON COLUMN member.member_address IS
    'member home address';

COMMENT ON COLUMN member.member_email IS
    'member email';

COMMENT ON COLUMN member.member_phone_no IS
    'member phone number';

COMMENT ON COLUMN member.member_joindate IS
    'member join date';

COMMENT ON COLUMN member.member_point IS
    'member point';

COMMENT ON COLUMN member.resort_id1 IS
    'resort id';

COMMENT ON COLUMN member.member_recommend IS
    'member number';

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( member_no,
                                                          resort_id );

CREATE TABLE member_fee (
    mf_feeyear              NUMBER(4) NOT NULL,
    member_no               NUMBER(3) NOT NULL,
    resort_id               NUMBER(7) NOT NULL,
    mf_maintfee             NUMBER(4) NOT NULL,
    mf_management_annualfee NUMBER(4) NOT NULL,
    mf_totalcharge          NUMBER(5) NOT NULL,
    mf_datepaid             DATE,
    mf_initialpayment       CHAR(1),
    mf_initialfee           NUMBER(4)
);

ALTER TABLE member_fee
    ADD CONSTRAINT chk_mf_initialpayment CHECK ( mf_initialpayment IN ( 'N', 'Y' ) );

COMMENT ON COLUMN member_fee.mf_feeyear IS
    'fee year';

COMMENT ON COLUMN member_fee.member_no IS
    'member number';

COMMENT ON COLUMN member_fee.resort_id IS
    'resort id';

COMMENT ON COLUMN member_fee.mf_maintfee IS
    'member maintenance fee';

COMMENT ON COLUMN member_fee.mf_management_annualfee IS
    'member annual fee';

COMMENT ON COLUMN member_fee.mf_totalcharge IS
    'member total charge';

COMMENT ON COLUMN member_fee.mf_datepaid IS
    'member date paid';

COMMENT ON COLUMN member_fee.mf_initialpayment IS
    'initial fees, check constraint which are ''Y'' for yes and ''N'' for no';

COMMENT ON COLUMN member_fee.mf_initialfee IS
    'cost for initial fees';

ALTER TABLE member_fee
    ADD CONSTRAINT member_fee_pk PRIMARY KEY ( mf_feeyear,
                                               member_no,
                                               resort_id );

CREATE TABLE point_of_interest (
    poi_address     VARCHAR2(60) NOT NULL,
    poi_type        VARCHAR2(20) NOT NULL,
    poi_name        VARCHAR2(50) NOT NULL,
    poi_hour_open   VARCHAR2(50),
    poi_hour_close  VARCHAR2(50),
    poi_description VARCHAR2(100) NOT NULL,
    town_id         NUMBER(4) NOT NULL,
    rl_id           NUMBER(4)
);

COMMENT ON COLUMN point_of_interest.poi_address IS
    'point of interest street address';

COMMENT ON COLUMN point_of_interest.poi_type IS
    'point of interest type (e.g. art gallery)';

COMMENT ON COLUMN point_of_interest.poi_name IS
    'point of interest name';

COMMENT ON COLUMN point_of_interest.poi_hour_open IS
    'point of interest hour open';

COMMENT ON COLUMN point_of_interest.poi_hour_close IS
    'point of interest hour close';

COMMENT ON COLUMN point_of_interest.poi_description IS
    'point of interest description';

COMMENT ON COLUMN point_of_interest.town_id IS
    'town id ';

COMMENT ON COLUMN point_of_interest.rl_id IS
    'rating level id';

ALTER TABLE point_of_interest ADD CONSTRAINT point_of_interest_pk PRIMARY KEY ( poi_address
);

CREATE TABLE rate (
    rate_season CHAR(1) NOT NULL,
    unit_no     NUMBER(3) NOT NULL,
    resort_id   NUMBER(7) NOT NULL,
    rate_cost   NUMBER(9, 2) NOT NULL
);

COMMENT ON COLUMN rate.rate_season IS
    'rate holiday season (peak, off, school holidays).';

COMMENT ON COLUMN rate.unit_no IS
    'unit number';

COMMENT ON COLUMN rate.resort_id IS
    'resort id';

COMMENT ON COLUMN rate.rate_cost IS
    'rate cost ';

ALTER TABLE rate
    ADD CONSTRAINT rate_pk PRIMARY KEY ( rate_season,
                                         unit_no,
                                         resort_id );

CREATE TABLE rating_level (
    rl_id      NUMBER(4) NOT NULL,
    rl_average NUMBER(2, 1) NOT NULL
);

COMMENT ON COLUMN rating_level.rl_id IS
    'rating level id';

COMMENT ON COLUMN rating_level.rl_average IS
    'Average rating';

ALTER TABLE rating_level ADD CONSTRAINT rating_level_pk PRIMARY KEY ( rl_id );

CREATE TABLE resort (
    resort_id         NUMBER(7) NOT NULL,
    resort_name       VARCHAR2(50) NOT NULL,
    resort_address    NUMBER(2) NOT NULL,
    resort_phone_no   CHAR(10),
    resort_year       NUMBER(4) NOT NULL,
    resort_point_cost NUMBER(5, 2) NOT NULL,
    town_id           NUMBER(4) NOT NULL,
    company_abn       NUMBER(11) NOT NULL
);

COMMENT ON COLUMN resort.resort_id IS
    'resort id';

COMMENT ON COLUMN resort.resort_name IS
    'resort name';

COMMENT ON COLUMN resort.resort_address IS
    'resort address';

COMMENT ON COLUMN resort.resort_phone_no IS
    'resort phone number';

COMMENT ON COLUMN resort.resort_year IS
    'resort year built or purchased';

COMMENT ON COLUMN resort.resort_point_cost IS
    'resort current cost for a member to purchase 1000 points';

COMMENT ON COLUMN resort.town_id IS
    'town id ';

COMMENT ON COLUMN resort.company_abn IS
    'company Australian Business Number';

ALTER TABLE resort ADD CONSTRAINT resort_pk PRIMARY KEY ( resort_id );

CREATE TABLE review (
    review_id      NUMBER(7) NOT NULL,
    review_date    DATE NOT NULL,
    member_no      NUMBER(3) NOT NULL,
    resort_id      NUMBER(7) NOT NULL,
    poi_address    VARCHAR2(60) NOT NULL,
    review_rating  CHAR(1) NOT NULL,
    review_comment VARCHAR2(100)
);

ALTER TABLE review
    ADD CONSTRAINT chk_review_rating CHECK ( review_rating IN ( '1', '2', '3', '4', '5'
    ) );

COMMENT ON COLUMN review.review_id IS
    'review id';

COMMENT ON COLUMN review.review_date IS
    'review date';

COMMENT ON COLUMN review.member_no IS
    'member number';

COMMENT ON COLUMN review.resort_id IS
    'resort id';

COMMENT ON COLUMN review.poi_address IS
    'point of interest street address';

COMMENT ON COLUMN review.review_rating IS
    'reveiew rating, 5 grades which are ''1'',''2'',''3'',''4'',''5''';

COMMENT ON COLUMN review.review_comment IS
    'review comment';

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( review_id );

ALTER TABLE review
    ADD CONSTRAINT review_nk UNIQUE ( review_date,
                                      member_no,
                                      resort_id,
                                      poi_address );

CREATE TABLE town (
    town_id         NUMBER(4) NOT NULL,
    town_lat        VARCHAR2(10) NOT NULL,
    town_long       VARCHAR2(10) NOT NULL,
    town_name       VARCHAR2(50) NOT NULL,
    town_state      VARCHAR2(50) NOT NULL,
    town_s_temp     NUMBER(4, 2) NOT NULL,
    town_w_temp     NUMBER(4, 2) NOT NULL,
    town_population NUMBER(6) NOT NULL
);

COMMENT ON COLUMN town.town_id IS
    'town id ';

COMMENT ON COLUMN town.town_lat IS
    'town lattitude';

COMMENT ON COLUMN town.town_long IS
    'town longitude';

COMMENT ON COLUMN town.town_name IS
    'town name';

COMMENT ON COLUMN town.town_state IS
    'town state name';

COMMENT ON COLUMN town.town_s_temp IS
    'town average summer  temperature';

COMMENT ON COLUMN town.town_w_temp IS
    'town average summer temperature';

COMMENT ON COLUMN town.town_population IS
    'town population number';

ALTER TABLE town ADD CONSTRAINT town_pk PRIMARY KEY ( town_id );

ALTER TABLE town ADD CONSTRAINT town_nk UNIQUE ( town_lat,
                                                 town_long );

CREATE TABLE unit (
    unit_no          NUMBER(3) NOT NULL,
    resort_id        NUMBER(7) NOT NULL,
    unit_type        CHAR(1) NOT NULL,
    unit_bedroom_num NUMBER(2) NOT NULL,
    unit_capacity    NUMBER(2) NOT NULL,
    unit_description VARCHAR2(100) NOT NULL
);

ALTER TABLE unit
    ADD CONSTRAINT chk_unit_type CHECK ( unit_type IN ( 'A', 'O', 'S' ) );

COMMENT ON COLUMN unit.unit_no IS
    'unit number';

COMMENT ON COLUMN unit.resort_id IS
    'resort id';

COMMENT ON COLUMN unit.unit_type IS
    'classify type of units (A: apartment, S: self-standing, O: other ) ';

COMMENT ON COLUMN unit.unit_bedroom_num IS
    'unit bedroom number';

COMMENT ON COLUMN unit.unit_capacity IS
    'unit sleeping capacity';

COMMENT ON COLUMN unit.unit_description IS
    'unit description';

ALTER TABLE unit ADD CONSTRAINT unit_pk PRIMARY KEY ( unit_no,
                                                      resort_id );

CREATE TABLE unit_maint (
    um_id            NUMBER(7) NOT NULL,
    maintenance_date DATE NOT NULL,
    maintenance_type CHAR(1) NOT NULL,
    unit_no          NUMBER(3) NOT NULL,
    resort_id        NUMBER(7) NOT NULL,
    maintenance_cost NUMBER(4) NOT NULL
);

ALTER TABLE unit_maint
    ADD CONSTRAINT chk_maintenance_type CHECK ( maintenance_type IN ( 'M', 'O', 'R', 'T'
    , 'W' ) );

COMMENT ON COLUMN unit_maint.um_id IS
    'unit maintenance id';

COMMENT ON COLUMN unit_maint.maintenance_date IS
    'maintenance date';

COMMENT ON COLUMN unit_maint.maintenance_type IS
    'maintenance type, added check constraint ( ''R'' for Recarpet, ''T'' for Repaint, ''M'' for Media refit, ''W'' for Whitegoods Refit and ''O'' for other)
';

COMMENT ON COLUMN unit_maint.unit_no IS
    'unit number';

COMMENT ON COLUMN unit_maint.resort_id IS
    'resort id';

COMMENT ON COLUMN unit_maint.maintenance_cost IS
    'maintenance cost';

ALTER TABLE unit_maint ADD CONSTRAINT unit_maint_pk PRIMARY KEY ( um_id );

ALTER TABLE unit_maint
    ADD CONSTRAINT unit_maint_nk UNIQUE ( maintenance_date,
                                          maintenance_type,
                                          unit_no,
                                          resort_id );

ALTER TABLE resort
    ADD CONSTRAINT company_resort FOREIGN KEY ( company_abn )
        REFERENCES company ( company_abn );

ALTER TABLE booking
    ADD CONSTRAINT member_booking FOREIGN KEY ( member_no,
                                                resort_id )
        REFERENCES member ( member_no,
                            resort_id );

ALTER TABLE member
    ADD CONSTRAINT member_member FOREIGN KEY ( member_recommend,
                                               resort_id1 )
        REFERENCES member ( member_no,
                            resort_id );

ALTER TABLE member_fee
    ADD CONSTRAINT member_member_fee FOREIGN KEY ( member_no,
                                                   resort_id )
        REFERENCES member ( member_no,
                            resort_id );

ALTER TABLE review
    ADD CONSTRAINT member_review FOREIGN KEY ( member_no,
                                               resort_id )
        REFERENCES member ( member_no,
                            resort_id );

ALTER TABLE point_of_interest
    ADD CONSTRAINT poi_rating_level FOREIGN KEY ( rl_id )
        REFERENCES rating_level ( rl_id );

ALTER TABLE booking
    ADD CONSTRAINT resort_booking FOREIGN KEY ( resort_id1 )
        REFERENCES resort ( resort_id );

ALTER TABLE member
    ADD CONSTRAINT resort_member FOREIGN KEY ( resort_id )
        REFERENCES resort ( resort_id );

ALTER TABLE unit
    ADD CONSTRAINT resort_unit FOREIGN KEY ( resort_id )
        REFERENCES resort ( resort_id );

ALTER TABLE review
    ADD CONSTRAINT review_poi FOREIGN KEY ( poi_address )
        REFERENCES point_of_interest ( poi_address );

ALTER TABLE point_of_interest
    ADD CONSTRAINT town_poi FOREIGN KEY ( town_id )
        REFERENCES town ( town_id );

ALTER TABLE resort
    ADD CONSTRAINT town_resort FOREIGN KEY ( town_id )
        REFERENCES town ( town_id );

ALTER TABLE booking
    ADD CONSTRAINT unit_booking FOREIGN KEY ( unit_no,
                                              resort_id2 )
        REFERENCES unit ( unit_no,
                          resort_id );

ALTER TABLE unit_maint
    ADD CONSTRAINT unit_maint_unit FOREIGN KEY ( unit_no,
                                                 resort_id )
        REFERENCES unit ( unit_no,
                          resort_id );

ALTER TABLE rate
    ADD CONSTRAINT unit_rate FOREIGN KEY ( unit_no,
                                           resort_id )
        REFERENCES unit ( unit_no,
                          resort_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
SPOOL off
set echo off
