create database supplies;

create database components_inventory;


use supplies;

CREATE TABLE providers(
   id INT AUTO_INCREMENT PRIMARY KEY,
   provname VARCHAR(40),
   information VARCHAR(255)
);

CREATE TABLE component_family(
   id INT AUTO_INCREMENT PRIMARY KEY,
   familyname VARCHAR(40)
);

CREATE TABLE lifespan_unit(
   id INT AUTO_INCREMENT PRIMARY KEY,
   lifespanunit VARCHAR(40)
);


CREATE TABLE partnumbers(
   partnbr INT AUTO_INCREMENT PRIMARY KEY,
   manufacturerpartnumb VARCHAR(40),
   provider INT,
   family INT,
   lifespan FLOAT(10,3),
   lifespanunit INT,
   foreign KEY(provider) REFERENCES providers(id),
   foreign KEY(family) REFERENCES component_family(id),
   foreign KEY(lifespanunit) REFERENCES lifespan_unit(id)
);

# Providers
INSERT INTO providers(provname,information)
VALUES('PumpTech','Pumps and accesories, Paris - France');

INSERT INTO providers(provname,information)
VALUES('ElecValves Engineering','Electrovalves and hydraulic actuators, Toulouse - France');

INSERT INTO providers(provname,information)
VALUES('Cablesys','Cables and connectivty, Rennes - France');

INSERT INTO providers(provname,information)
VALUES('InfoTech','Computer hardware, Nantes - France');


# Component family
INSERT INTO component_family(familyname)
VALUES('Pump');

INSERT INTO component_family(familyname)
VALUES('ElectroValve');

INSERT INTO component_family(familyname)
VALUES('Cable');

INSERT INTO component_family(familyname)
VALUES('Electronic');

INSERT INTO component_family(familyname)
VALUES('Software');

# life span units
INSERT INTO lifespan_unit(lifespanunit)
VALUES('hours');

INSERT INTO lifespan_unit(lifespanunit)
VALUES('actions');


# Part numbers
INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(180001, 'PU020',1, 1, 20000, 1);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'PU035', 1, 1, 35000, 1);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'PU050', 1, 1, 50000, 1);
# ---------
INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(180011, 'EV0220', 2, 2, 220000, 2);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'EV0320', 2, 2, 320000, 2);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'EV0400', 2, 2, 400000, 2);
# ---------
INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(180021, 'CAB01', 3, 3, NULL, NULL);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'CAB02',3, 3, NULL, NULL);

INSERT INTO partnumbers(partnbr, manufacturerpartnumb,provider, family, lifespan, lifespanunit)
VALUES(NULL, 'CAB03',3, 3, NULL, NULL);




use components_inventory;

CREATE TABLE component_state(
   id INT AUTO_INCREMENT PRIMARY KEY,
   sts VARCHAR(40)
);
drop table components;
CREATE TABLE components(
   id INT AUTO_INCREMENT PRIMARY KEY,
   partnbr INT,
   serialnbr VARCHAR(40),
   compstate INT,
   machineifapp INT, 
   datelastchange date,
   foreign KEY(compstate) REFERENCES component_state(id),
   foreign KEY(partnbr) REFERENCES supplies.partnumbers(partnbr),   
   foreign KEY(machineifapp) REFERENCES machine_inventory.machines(id)
);

# component_state
INSERT INTO component_state(sts)
VALUES('stored');
INSERT INTO component_state(sts)
VALUES('installed');
INSERT INTO component_state(sts)
VALUES('maintenance');
INSERT INTO component_state(sts)
VALUES('discarded');


# components
# Insert PU020
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1824697A', 3, '2019-10-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1824887A', 3, '2019-10-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1824897A', 3, '2019-10-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1824898A', 3, '2019-10-30');

INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822297A', 1, '2019-08-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822587A', 1, '2019-07-28');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822397A', 1, '2019-06-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1827798A', 1, '2019-06-12');

INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822205A', 1, '2019-12-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822508A', 1, '2019-12-28');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1822311A', 1, '2019-12-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180001, '1827712A', 1, '2019-12-12');

# Insert PU035 ------------------------------------------------------------------------------------
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1823540B', 3, '2019-09-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1823687B', 3, '2019-08-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1823997B', 3, '2019-09-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1822898B', 3, '2019-08-30');

INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180002, '1821597B', 2, 50001, '2019-05-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1821487B', 1, '2019-03-28');
INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180002, '1824797B', 2, 50002, '2019-11-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1822598B', 1, '2019-10-12');

INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1823305B', 1, '2019-11-30');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1824408B', 1, '2019-07-28');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1828811B', 1, '2019-08-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180002, '1822212B', 1, '2019-10-12');


# Insert EV0220 ------------------------------------------------------------------------------------
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2824675A', 3, '2019-10-12');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2824844A', 3, '2019-10-13');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2824849A', 3, '2019-10-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2824850A', 3, '2019-10-20');

INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180011, '2822257A', 2, 50001, '2019-08-24');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2822558A', 1, '2019-07-25');
INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180011, '2822359A', 2, 50002, '2019-06-15');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2827763A', 1, '2019-06-10');

INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2822266A', 1, '2019-12-13');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2822568A', 1, '2019-12-18');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2822377A', 1, '2019-12-20');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180011, '2827780A', 1, '2019-12-29');

# Insert EV0320 ------------------------------------------------------------------------------------
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2823515B', 3, '2019-09-14');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2823620B', 3, '2019-08-18');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2823925B', 3, '2019-09-27');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2822830B', 3, '2019-08-22');

INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180012, '2821535B', 2, 50001, '2019-05-23');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2821437B', 1, '2019-03-16');
INSERT INTO components(partnbr, serialnbr,compstate, machineifapp, datelastchange)
VALUES(180012, '2824738B', 2, 50002, '2019-11-19');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2822539B', 1, '2019-10-22');

INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2823348B', 1, '2019-11-17');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2824455B', 1, '2019-07-12');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2828866B', 1, '2019-08-02');
INSERT INTO components(partnbr, serialnbr,compstate, datelastchange)
VALUES(180012, '2822277B', 1, '2019-10-01');
