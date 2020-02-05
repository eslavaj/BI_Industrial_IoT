use machine_inventory;

CREATE TABLE machine_states(
   id INT AUTO_INCREMENT PRIMARY KEY,
   sts VARCHAR(40)
);

INSERT INTO machine_states(sts)
VALUES('stored');
INSERT INTO machine_states(sts)
VALUES('installed');
INSERT INTO machine_states(sts)
VALUES('maintenance');
INSERT INTO machine_states(sts)
VALUES('discarded');


CREATE TABLE machines(
   id INT AUTO_INCREMENT PRIMARY KEY,
   serialnbr VARCHAR(40),
   machinestate INT,
   factoryarea INT, 
   datelastchange date,
   description VARCHAR(250),
   foreign KEY(machinestate) REFERENCES machine_states(id),
   foreign KEY(factoryarea) REFERENCES factory.factory_areas(id)   
);


# Inserting machines

INSERT INTO machines(id, serialnbr, machinestate, factoryarea, datelastchange, description)
VALUES(50001, '50001P', 2, 1, '2019-01-05', 'Machine1');
INSERT INTO machines(serialnbr, machinestate, factoryarea, datelastchange, description)
VALUES('50002P', 2, 1, '2019-02-05', 'Machine2');
