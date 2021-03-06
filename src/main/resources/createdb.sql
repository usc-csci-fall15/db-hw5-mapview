-- Name : ThammeGowda Narayanaswamy
-- USCID : 2074669439
-- Topic : USC CSCI585 HW5 Solutions


-- This file Creates Tables for storing spatial data
--   1. Ambulance area : Circle
--   2. Region : 2D polygon
--   3. Pond   : Circle
--   4. Lion   : 2D point
-- Then the spatial index will be created.


CREATE TABLE ambulance ( id VARCHAR(5) NOT NULL, geom MDSYS.SDO_GEOMETRY,  PRIMARY KEY(id));
CREATE TABLE region ( id VARCHAR(5) NOT NULL, geom MDSYS.SDO_GEOMETRY,  PRIMARY KEY(id));
CREATE TABLE pond ( id VARCHAR(5) NOT NULL, geom MDSYS.SDO_GEOMETRY,  PRIMARY KEY(id));
CREATE TABLE lion ( id VARCHAR(5) NOT NULL, geom MDSYS.SDO_GEOMETRY,  PRIMARY KEY(id));

-- or all in  one table : 
-- CREATE TABLE geo ( id VARCHAR(10) NOT NULL, kind varchar(10) CHECK(kind IN('region', 'lion', 'pond', 'ambulance')), geom MDSYS.SDO_GEOMETRY,  PRIMARY KEY(id));


-- ambulance.txt
-- cat ambulance.txt | awk -F ',' '{printf "INSERT INTO ambulance VALUES('\''%s'\'', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(%d,%d, %d,%d, %d,%d)));\n", $1, $2-$4,$3,  $2, $3+$4, $2+$4, $3}'

INSERT INTO ambulance VALUES('A1', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(10,400, 100,490, 190,400)));
INSERT INTO ambulance VALUES('A3', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(310,400, 400,490, 490,400)));
INSERT INTO ambulance VALUES('A2', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(160,400, 250,490, 340,400)));
INSERT INTO ambulance VALUES('A5', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(210,100, 300,190, 390,100)));
INSERT INTO ambulance VALUES('A4', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(310,250, 400,340, 490,250)));


-- regions
-- cat region.txt | awk -F ',' '{printf "INSERT INTO region VALUES('\''%s'\'', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(%s,%s, %s,%s, %s,%s, %s,%s, %s,%s))); \n", $1,  $3, $4, $5, $6, $7, $8, $9, $10, $3, $4}'
INSERT INTO region VALUES('R4', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(400,0, 500,0, 500,100, 400,100, 400,0))); 
INSERT INTO region VALUES('R5', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(400,100, 500,100, 500,250, 400,200, 400,100))); 
INSERT INTO region VALUES('R6', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(300,150, 400,100, 400,200, 250,250, 300,150))); 
INSERT INTO region VALUES('R7', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(100,100, 300,150, 250,250, 150,250, 100,100))); 
INSERT INTO region VALUES('R12', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(400,200, 500,250, 500,350, 400,350, 400,200))); 
INSERT INTO region VALUES('R1', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(0,0, 150,0, 100,100, 0,100, 0,0))); 
INSERT INTO region VALUES('R2', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(150,0, 250,0, 300,150, 100,100, 150,0))); 
INSERT INTO region VALUES('R3', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(250,0, 400,0, 400,100, 300,150, 250,0))); 
INSERT INTO region VALUES('R11', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(250,250, 400,200, 400,350, 300,350, 250,250))); 
INSERT INTO region VALUES('R8', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(0,100, 100,100, 150,250, 0,250, 0,100))); 
INSERT INTO region VALUES('R9', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(0,250, 150,250, 150,400, 0,350, 0,250))); 
INSERT INTO region VALUES('R10', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(150,250, 250,250, 300,350, 150,400, 150,250))); 
INSERT INTO region VALUES('R15', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(150,400, 300,350, 300,500, 150,500, 150,400))); 
INSERT INTO region VALUES('R14', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(300,350, 400,350, 400,500, 300,500, 300,350))); 
INSERT INTO region VALUES('R16', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(0,350, 150,400, 150,500, 0,500, 0,350))); 
INSERT INTO region VALUES('R13', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1, 1003, 1), MDSYS.SDO_ORDINATE_ARRAY(400,350, 500,350, 500,500, 400,500, 400,350)));


-- pond
-- cat pond.txt | awk -F ',' '{printf "INSERT INTO pond values('\''%s'\'', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(%d,%d, %d,%d, %d,%d)));\n", $1, $2-$4,$3,  $2, $3+$4, $2+$4, $3}'

INSERT INTO pond values('P2', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(205,430, 220,445, 235,430)));
INSERT INTO pond values('P3', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(355,435, 370,450, 385,435)));
INSERT INTO pond values('P1', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(60,430, 75,445, 90,430)));
INSERT INTO pond values('P6', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(205,320, 220,335, 235,320)));
INSERT INTO pond values('P7', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(455,280, 470,295, 485,280)));
INSERT INTO pond values('P4', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(60,330, 75,345, 90,330)));
INSERT INTO pond values('P5', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(305,280, 320,295, 335,280)));
INSERT INTO pond values('P8', MDSYS.SDO_GEOMETRY(2003, NULL, NULL, MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4), MDSYS.SDO_ORDINATE_ARRAY(360,175, 375,190, 390,175)));


-- Insert lions;
-- cat lion.txt | sed -e "s/\(.*\),\([0-9]*\),\([0-9]*\)/INSERT INTO lion VALUES('\1', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(\2, \3, NULL), NULL, NULL));/g"
INSERT INTO lion VALUES('L14', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(350, 50, NULL), NULL, NULL));
INSERT INTO lion VALUES('L10', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(355, 190, NULL), NULL, NULL));
INSERT INTO lion VALUES('L11', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(30, 210, NULL), NULL, NULL));
INSERT INTO lion VALUES('L12', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(50, 200, NULL), NULL, NULL));
INSERT INTO lion VALUES('L13', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(170, 230, NULL), NULL, NULL));
INSERT INTO lion VALUES('L6', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(350, 300, NULL), NULL, NULL));
INSERT INTO lion VALUES('L7', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(35, 10, NULL), NULL, NULL));
INSERT INTO lion VALUES('L4', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(450, 300, NULL), NULL, NULL));
INSERT INTO lion VALUES('L5', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(20, 20, NULL), NULL, NULL));
INSERT INTO lion VALUES('L2', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(230, 475, NULL), NULL, NULL));
INSERT INTO lion VALUES('L3', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(370, 455, NULL), NULL, NULL));
INSERT INTO lion VALUES('L1', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(50, 450, NULL), NULL, NULL));
INSERT INTO lion VALUES('L8', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(115, 350, NULL), NULL, NULL));
INSERT INTO lion VALUES('L9', MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(240, 335, NULL), NULL, NULL));

--- create spatial index

-- metadata entries
INSERT INTO USER_SDO_GEOM_METADATA VALUES ('ambulance', 'geom', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 0, 1000, 0.05), MDSYS.SDO_DIM_ELEMENT('Y', 0, 1000, 0.05)),  NULL);

INSERT INTO USER_SDO_GEOM_METADATA VALUES ('region', 'geom', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 0, 1000, 0.05), MDSYS.SDO_DIM_ELEMENT('Y', 0, 1000, 0.05)),  NULL);

INSERT INTO USER_SDO_GEOM_METADATA VALUES ('pond', 'geom', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 0, 1000, 0.05), MDSYS.SDO_DIM_ELEMENT('Y', 0, 1000, 0.05)),  NULL);

INSERT INTO USER_SDO_GEOM_METADATA VALUES ('lion', 'geom', MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X', 0, 1000, 0.05), MDSYS.SDO_DIM_ELEMENT('Y', 0, 1000, 0.05)),  NULL);

-- Index
CREATE INDEX idx_ambulance ON ambulance(geom) INDEXTYPE IS MDSYS.SPATIAL_INDEX;
CREATE INDEX idx_region ON region(geom) INDEXTYPE IS MDSYS.SPATIAL_INDEX;
CREATE INDEX idx_pond ON pond(geom) INDEXTYPE IS MDSYS.SPATIAL_INDEX;
CREATE INDEX idx_lion ON lion(geom) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

