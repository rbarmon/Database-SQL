--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio1_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio1.sql

--Student ID: 31165176
--Student Name: Rian Barrett
--Unit Code: FIT2094
--Applied Class No: A02

DROP TABLE inspect_item CASCADE CONSTRAINTS PURGE;
DROP TABLE inspect_item PURGE;

/*Task 1: CREATE table INSPECT_ITEM and non FK constraints*/
/**
Write a code to create the INSPECT_ITEM table and its required constraints. The table below provides details of the meaning of the attributes in the INSPECT_ITEM table. You must pick RESTRICT/NO ACTION on the delete rule for all FK constraints.
*/

-- W7
CREATE TABLE inspect_item (
    inspitem_id        NUMERIC(7) NOT NULL,
    prop_no            NUMERIC(4) NOT NULL,
    inspect_datetime   DATE NOT NULL,
    item_code          CHAR(3) NOT NULL,
    inspitem_result    CHAR(1) NOT NULL,
    inspitem_statement VARCHAR(200)
);

COMMENT ON COLUMN inspect_item.inspitem_id IS
    'Inspect item unique identifier (surrogate key)((unique for each inspect item record)'
    ;

COMMENT ON COLUMN inspect_item.prop_no IS
    'Property identifier';

COMMENT ON COLUMN inspect_item.inspect_datetime IS
    'Inspection date and time';

COMMENT ON COLUMN inspect_item.item_code IS
    'Item identifier';

COMMENT ON COLUMN inspect_item.inspitem_result IS
    'Result of inspection item: U: Urgent Action, S: Standard Met, N: Standard Not Met'
    ;

COMMENT ON COLUMN inspect_item.inspitem_statement IS
    'Brief statement of inspection item (not mandatory)';
-- non FK constraints
ALTER TABLE inspect_item ADD CONSTRAINT inspect_item_pk PRIMARY KEY ( inspitem_id );

ALTER TABLE inspect_item
    ADD CONSTRAINT inspect_item_uq UNIQUE ( prop_no,
                                            inspect_datetime,
                                            item_code );

-- U: Urgent Action, S: Standard Met, N: Standard Not Met'
ALTER TABLE inspect_item
    ADD CONSTRAINT ck_inspitem_result CHECK ( inspitem_result IN ( 'U', 'S', 'N' ) );
    
    
    
/*Task 1: Add FK constraints*/
ALTER TABLE inspect_item
    ADD CONSTRAINT inspection_inspect_item FOREIGN KEY ( prop_no,
                                                         inspect_datetime )
        REFERENCES inspection ( prop_no,
                                inspect_datetime );

ALTER TABLE inspect_item
    ADD CONSTRAINT item_inspect_item FOREIGN KEY ( item_code )
        REFERENCES item ( item_code );



/*Task 2: Insert INSPECTOR, INSPECTION and INSPECT_ITEMs*/
-- W8
/**
*/



DROP SEQUENCE inspitem_id_seq;
-- Created sequence inspitem_id_seq because it is the only thing that increments by a value
CREATE SEQUENCE inspitem_id_seq START WITH 0000001 INCREMENT BY 1;

--one INSPECTOR named James Knight,
INSERT INTO inspector VALUES (
    00001,
    'James',
    'Knight'
);

COMMIT;
--one INSPECTION carried on by James Knight for property number 9346 on 15-Dec-2022 10:00 AM
INSERT INTO inspection VALUES (
    9346,
    TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM'),
    00001
);

COMMIT;
/*
and two INSPECT_ITEM entries:
i. an Urgent Action (U) for a jammed lock (LCK) on the garage back entry door. A locksmith has been called to fix the lock
ii. a Standard Met (S) for mould and damp (MLD) */
INSERT INTO inspect_item VALUES (
    inspitem_id_seq.NEXTVAL,
    9346,
    TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM'),
    'LCK',
    'U',
    'A locksmith has been called to fix the lock'
);

COMMIT;

INSERT INTO inspect_item VALUES (
    inspitem_id_seq.NEXTVAL,
    9346,
    TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM'),
    'MLD',
    'S',
    NULL
);

COMMIT;

SELECT
    *
FROM
    inspector;

SELECT
    *
FROM
    inspection;

SELECT
    *
FROM
    inspect_item;

/*Task 3: Change of status for mould and damp to Not Met*/
/*
After the inspection for property number 9346 on 15-Dec-2022 10:00 AM, James 
Knight double checked all the rooms and found a small patch of mould is present 
in the main bathroom. Tenant has been advised to remove the mould with chemicals
. Change the status for mould and damp in this inspection as Standard Not Met 
(N) and add the necessary statement. */

UPDATE inspect_item
SET
    inspitem_result = 'N'
WHERE
        item_code = 'MLD'
    AND inspect_datetime = TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM');
/*where item_code = 'MLD';*/
UPDATE inspect_item
SET
    inspitem_statement = 'Tenant has been advised to remove the mould with chemicals.'
WHERE
        item_code = 'MLD'
    AND inspect_datetime = TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM');

SELECT
    *
FROM
    inspect_item;

COMMIT;

/*Task 4: Removal of inspection*/
/*The property agent determined that the inspection carried on by James Knight 
for property number 9346 on 15-Dec-2022 10:00 AM was invalid, thus all details 
related to this inspection must be removed from the database. Make these changes
to the data in the database. */

SELECT
    *
FROM
    inspect_item;

DELETE FROM inspect_item
WHERE
        prop_no = 9346
    AND inspect_datetime = TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM');

SELECT
    *
FROM
    inspect_item;

COMMIT;

SELECT
    *
FROM
    inspection;

DELETE FROM inspection
WHERE
        prop_no = 9346
    AND inspect_datetime = TO_DATE('15-Dec-2022 10:00', 'dd-Mon-yyyy hh:mi AM');

SELECT
    *
FROM
    inspection;

COMMIT;

SELECT
    *
FROM
    inspector;
DELETE FROM inspector
WHERE
        inspector_givname = 'James'
    AND inspector_famname = 'Knight';

SELECT
    *
FROM
    inspector;

COMMIT;


--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF