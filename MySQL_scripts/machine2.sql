use machine2;

CREATE TABLE machine_components(
   compid INT AUTO_INCREMENT PRIMARY KEY,
   partnbr INT,
   serialnbr VARCHAR(40),  
   compstatus INT,
   foreign KEY(compstatus) REFERENCES component_status(id)
);


CREATE TABLE usage_log(
   logid INT AUTO_INCREMENT PRIMARY KEY,
   compid INT,
   logdate date,
   logtime time,
   week INT,
   actionsnbr INT,
   usageduration time,
   foreign KEY(compid) REFERENCES machine_components(compid)
);

CREATE TABLE pwrconsumption_log(
   logid INT AUTO_INCREMENT PRIMARY KEY,
   logdate date,
   logtime time,
   week INT,
   kwh FLOAT(10,3)  
);

CREATE TABLE component_status(
   id INT AUTO_INCREMENT PRIMARY KEY,
   compstatus VARCHAR(40)  
);


show tables;

# machine components -------------------------------------------------------------
INSERT INTO machine_components(partnbr,serialnbr, compstatus)
VALUES(180002,'1824797B', 1);

INSERT INTO machine_components(partnbr,serialnbr, compstatus)
VALUES(180011,'2822359A', 1);

INSERT INTO machine_components(partnbr,serialnbr, compstatus)
VALUES(180012,'2824738B', 1);

# component status -----------------------------------------------------------------
INSERT INTO component_status(compstatus)
VALUES('NormalOFF');
INSERT INTO component_status(compstatus)
VALUES('NormalON');
INSERT INTO component_status(compstatus)
VALUES('Overloaded');
INSERT INTO component_status(compstatus)
VALUES('NeedInspection');
INSERT INTO component_status(compstatus)
VALUES('PreNOK');
INSERT INTO component_status(compstatus)
VALUES('NOK');

drop table usage_log;
drop table pwrconsumption_log;
drop table component_status;
drop table machine_components;

