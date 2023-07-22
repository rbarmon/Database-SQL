/******PLEASE ENTER YOUR DETAILS BELOW******/
/*T2-mog-insert.sql*/

/*Student ID: 31165176*/
/*Student Name: Rian Barrett*/
/*Unit Code: FIT2094*/
/*Applied Class No: A02*/

/* Comments for your marker:



*/

/* Task 2 Load the AW_DISPLAY, AW_STATUS and SALE tables with your own*/
/* test data following the data requirements expressed in the brief*/

/* =======================================*/
/* AW_DISPLAY*/
/* =======================================*/

/*(i) 10 AW_DISPLAY entries*/
/*● Involved at least 2 different display galleries*/
/*● Included at least 3 different artwork display start dates*/
/*● Included at least 5 different artworks*/
/*● Involved at least 2 different artists*/


INSERT INTO aw_display VALUES (
    1,
    1,
    1,
    TO_DATE('7-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    1
);

INSERT INTO aw_display VALUES (
    2,
    1,
    1,
    TO_DATE('15-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('20-Jun-2022', 'DD-MON-YYYY'),
    1
);


INSERT INTO aw_display VALUES (
    3,
    2,
    1,
    TO_DATE('6-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('11-Jun-2022', 'DD-MON-YYYY'),
    2
);


INSERT INTO aw_display VALUES (
    4,
    3,
    1,
    TO_DATE('7-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    2
);


INSERT INTO aw_display VALUES (
    5,
    4,
    1,
    TO_DATE('8-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    3
);

INSERT INTO aw_display VALUES (
    6,
    4,
    1,
    TO_DATE('14-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('17-Jun-2022', 'DD-MON-YYYY'),
    3
);


INSERT INTO aw_display VALUES (
    7,
    7,
    1,
    TO_DATE('11-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('15-Jun-2022', 'DD-MON-YYYY'),
    4
);


INSERT INTO aw_display VALUES (
    8,
    8,
    1,
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    TO_DATE('20-Jun-2022', 'DD-MON-YYYY'),
    4
);


INSERT INTO aw_display VALUES (
    9,
    5,
    1,
    TO_DATE('18-Jul-2022', 'DD-MON-YYYY'),
    TO_DATE('22-Jul-2022', 'DD-MON-YYYY'),
    5
);

INSERT INTO aw_display VALUES (
    10,
    9,
    1,
    TO_DATE('16-Aug-2022', 'DD-MON-YYYY'),
    TO_DATE('20-Aug-2022', 'DD-MON-YYYY'),
    5
);


/* =======================================*/
/* SALE*/
/* =======================================*/
/*(ii) 4 SALE entries*/
/**

INSERT INTO sale VALUES (
    1,
    TO_DATE('11-Jun-2022', 'DD-MON-YYYY'),
    70000,
    2,
    2
);

INSERT INTO sale VALUES (
    2,
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    30000,
    2,
    2
);

INSERT INTO sale VALUES (
    3,
    TO_DATE('12-Jun-2022', 'DD-MON-YYYY'),
    40000,
    3,
    3
);

INSERT INTO sale VALUES (
    4,
    TO_DATE('20-Jun-2022', 'DD-MON-YYYY'),
    40000,
    1,
    1
);


-- =======================================
-- AW_STATUS
-- =======================================
--(iii) Required AW_STATUS entries to support the AW_DISPLAY and SALE data you add

INSERT INTO aw_status VALUES (
    1,
    1,
    1,
    TO_DATE('2-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    2,
    1,
    1,
    TO_DATE('3-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    1
);

INSERT INTO aw_status VALUES (
    3,
    1,
    1,
    TO_DATE('3-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    1
);

INSERT INTO aw_status VALUES (
    4,
    2,
    1,
    TO_DATE('4-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    5,
    2,
    1,
    TO_DATE('5-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    2
);

INSERT INTO aw_status VALUES (
    6,
    2,
    1,
    TO_DATE('5-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    2
);

INSERT INTO aw_status VALUES (
    7,
    3,
    1,
    TO_DATE('5-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    8,
    3,
    1,
    TO_DATE('6-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    2
);

INSERT INTO aw_status VALUES (
    9,
    3,
    1,
    TO_DATE('6-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    2
);

INSERT INTO aw_status VALUES (
    10,
    4,
    1,
    TO_DATE('6-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    11,
    4,
    1,
    TO_DATE('7-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    3
);

INSERT INTO aw_status VALUES (
    12,
    4,
    1,
    TO_DATE('7-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    3
);

INSERT INTO aw_status VALUES (
    13,
    7,
    1,
    TO_DATE('7-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    14,
    7,
    1,
    TO_DATE('8-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    4
);

INSERT INTO aw_status VALUES (
    15,
    7,
    1,
    TO_DATE('8-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    4
);

INSERT INTO aw_status VALUES (
    16,
    8,
    1,
    TO_DATE('8-Jun-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    17,
    8,
    1,
    TO_DATE('9-Jun-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    4
);

INSERT INTO aw_status VALUES (
    18,
    8,
    1,
    TO_DATE('9-Jun-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    4
);

INSERT INTO aw_status VALUES (
    19,
    2,
    1,
    TO_DATE('11-Jun-2022 14:00', 'DD-MON-YYYY HH24:MI'),
    'S',
    NULL
);

INSERT INTO aw_status VALUES (
    20,
    3,
    1,
    TO_DATE('12-Jun-2022 14:00', 'DD-MON-YYYY HH24:MI'),
    'S',
    NULL
);

INSERT INTO aw_status VALUES (
    21,
    4,
    1,
    TO_DATE('12-Jun-2022 14:00', 'DD-MON-YYYY HH24:MI'),
    'S',
    NULL
);

INSERT INTO aw_status VALUES (
    22,
    1,
    1,
    TO_DATE('20-Jun-2022 14:00', 'DD-MON-YYYY HH24:MI'),
    'S',
    NULL
);

INSERT INTO aw_status VALUES (
    23,
    5,
    1,
    TO_DATE('15-Jul-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    24,
    5,
    1,
    TO_DATE('16-Jul-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    5
);

INSERT INTO aw_status VALUES (
    25,
    5,
    1,
    TO_DATE('16-Jul-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    5
);

INSERT INTO aw_status VALUES (
    26,
    9,
    1,
    TO_DATE('14-Aug-2022 18:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

INSERT INTO aw_status VALUES (
    27,
    9,
    1,
    TO_DATE('15-Aug-2022 8:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    5
);

INSERT INTO aw_status VALUES (
    28,
    9,
    1,
    TO_DATE('15-Aug-2022 10:00', 'DD-MON-YYYY HH24:MI'),
    'G',
    5
);

COMMIT;






