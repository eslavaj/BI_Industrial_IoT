use dwhouse;


# Create table for machine location dimension
CREATE TABLE component_dim(
   key_dim INT AUTO_INCREMENT UNIQUE,
   compidinventory INT,
   partnumber INT,
   serialnumber VARCHAR(40)
);

# Create fact
CREATE TABLE usage_fact(
   key_fact INT AUTO_INCREMENT PRIMARY KEY,
   key_time INT,
   key_component INT, 
   key_machinelocation INT,
   usageperhour INT,
   foreign KEY(key_time) REFERENCES time_dim(key_dim),
   foreign KEY(key_component) REFERENCES component_dim(key_dim),
   foreign KEY(key_machinelocation) REFERENCES machinelocation_dim(key_dim) 
);

drop table usage_fact;
drop table component_dim;