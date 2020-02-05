use factory;

CREATE TABLE factory_areas(
   id INT AUTO_INCREMENT PRIMARY KEY,
   description VARCHAR(40)
);


INSERT INTO factory_areas(description)
VALUES('painting');
INSERT INTO factory_areas(description)
VALUES('pasting');
INSERT INTO factory_areas(description)
VALUES('assembly');
INSERT INTO factory_areas(description)
VALUES('packaging');
