use dwhouse;


# Create table for machine location dimension
CREATE TABLE machinelocation_dim(
   key_dim INT PRIMARY KEY,
   machine varchar(40),
   factoryarea int,
   UNIQUE(key_dim,machine)
);

# Create fact
CREATE TABLE pwrconsumption_fact(
   key_fact INT AUTO_INCREMENT PRIMARY KEY,
   key_time INT,
   key_machinelocation INT,
   consumpkwh FLOAT(10,3),
   foreign KEY(key_time) REFERENCES time_dim(key_dim),
   foreign KEY(key_machinelocation) REFERENCES machinelocation_dim(key_dim) 
);

drop table pwrconsumption_fact;
drop table machinelocation_dim;
