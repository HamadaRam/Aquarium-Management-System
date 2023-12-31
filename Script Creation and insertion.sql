--Create Aquarium Tables


DROP TABLE Maintenance cascade constraints;
DROP TABLE Tank cascade constraints;
DROP TABLE Water_Quality cascade constraints;
DROP TABLE Fish cascade constraints;
DROP TABLE Feeding cascade constraints;

CREATE TABLE Tank (
  tank_id number(4),
  tank_name varchar2(30) not null,
  tank_size varchar2(10) not null,
  tank_type varchar2(10) not null,
  tank_filter varchar2(10),
  tank_heater varchar2(10),
  constraint tank_tank_id_pk primary key (tank_id)
);

CREATE TABLE Maintenance (
  maintenance_id number(4),
  tank_id number(4),
  task varchar2(30) not null,
  frequency varchar2(30) not null,
  constraint maintenance_pk primary key (maintenance_id),
  constraint maintenance_tank_id_fk foreign key (tank_id) references Tank(tank_id)
);

CREATE TABLE Water_Quality (
  waterq_id number(4),
  tank_id number(4),
  temperature varchar2(10) not null,
  ph varchar2(10) not null,
  constraint water_waterq_id_pk primary key (waterq_id),
  constraint water_tank_id_fk foreign key (tank_id) references Tank(tank_id)
);

CREATE TABLE Fish (
  fish_id number(4),
  tank_id number(4),
  fish_size varchar2(10) not null,
  constraint fish_fish_id_pk primary key(fish_id),
  constraint fish_tank_id_fk foreign key (tank_id) references Tank(tank_id)
);

CREATE TABLE Feeding (
  tank_id number(4),
  fish_id number(4),
  food varchar2(30),
  quantity number(10),
  frequency varchar2(30),
  constraint feeding_pk primary key (tank_id, fish_id),
  constraint feeding_tank_id_fk foreign key (tank_id) references Tank(tank_id),
  constraint feeding_fish_id_fk foreign key (fish_id) references Fish(fish_id)
);






--Information Insertion 

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (1, 'Tank 1', 'Small', 'Freshwater', 'Yes', 'No');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (2, 'Tank 2', 'Medium', 'Saltwater', 'Yes', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (3, 'Tank 3', 'Large', 'Freshwater', 'Yes', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (4, 'Tank 4', 'Medium', 'Freshwater', 'No', 'No');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (5, 'Tank 5', 'Small', 'Saltwater', 'No', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (6, 'Tank 6', 'Large', 'Freshwater', 'Yes', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (7, 'Tank 7', 'Medium', 'Saltwater', 'Yes', 'No');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (8, 'Tank 8', 'Small', 'Freshwater', 'No', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (9, 'Tank 9', 'Large', 'Saltwater', 'Yes', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (10, 'Tank 10', 'Medium', 'Freshwater', 'Yes', 'No');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (11, 'Tank 11', 'Small', 'Saltwater', 'No', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (12, 'Tank 12', 'Large', 'Freshwater', 'Yes', 'Yes');

INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
VALUES (13, 'Tank 13', 'Medium', 'Saltwater', 'Yes', 'No');


INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (1, 1, 'Clean filter', 'Weekly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (2, 2, 'Replace salt', 'Monthly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (3, 3, 'Check pH levels', 'Daily');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (4, 4, 'Clean tank', 'Bi-weekly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (5, 5, 'Feed fish', 'Twice daily');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (6,

 6, 'Trim plants', 'Monthly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (7, 7, 'Check water temperature', 'Daily');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (8, 8, 'Change water', 'Bi-weekly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (9, 9, 'Clean gravel', 'Monthly');

INSERT INTO Maintenance (maintenance_id, tank_id, task, frequency)
VALUES (10, 10, 'Test ammonia levels', 'Daily');


INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (1, 1, '25°C', '7.2');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (2, 2, '28°C', '8.0');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (3, 3, '22°C', '6.5');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (4, 4, '24°C', '7.0');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (5, 5, '26°C', '7.8');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (6, 6, '23°C', '6.8');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (7, 7, '27°C', '7.5');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (8, 8, '25°C', '7.0');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (9, 9, '28°C', '7.5');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (10, 10, '22°C', '6.8');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (11, 11, '24°C', '7.2');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (12, 12, '26°C', '8.0');

INSERT INTO Water_Quality (waterq_id, tank_id, temperature, ph)
VALUES (13, 13, '25°C', '7.5');


INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (1, 1, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (2, 2, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (3, 3, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (4, 4, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (5, 5, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (6, 6, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (7, 7, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (8, 8, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (9, 9, 'Medium');

INSERT INTO Fish (fish_id

, tank_id, fish_size)
VALUES (10, 10, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (11, 11, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (12, 12, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (13, 13, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (14, 1, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (15, 2, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (16, 3, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (17, 4, 'Small');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (18, 5, 'Medium');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (19, 6, 'Large');

INSERT INTO Fish (fish_id, tank_id, fish_size)
VALUES (20, 7, 'Medium');


INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (1, 1, 'Flakes', 2, 'Daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (2, 2, 'Pellets', 3, 'Twice daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (3, 3, 'Frozen brine shrimp', 4, 'Every other day');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (4, 4, 'Live worms', 1, 'Weekly');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (5, 5, 'Flakes', 2, 'Daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (6, 6, 'Pellets', 3, 'Twice daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (7, 7, 'Frozen brine shrimp', 4, 'Every other day');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (8, 8, 'Live worms', 1, 'Weekly');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (9, 9, 'Flakes', 2, 'Daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (10, 10, 'Pellets', 3, 'Twice daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (11, 11, 'Frozen brine shrimp', 4, 'Every other day');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (12, 12, 'Live worms', 1, 'Weekly');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (13, 13, 'Flakes', 2, 'Daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (1, 14, 'Pellets', 3, 'Twice daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (2, 15, '

Frozen brine shrimp', 4, 'Every other day');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (3, 16, 'Live worms', 1, 'Weekly');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (4, 17, 'Flakes', 2, 'Daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (5, 18, 'Pellets', 3, 'Twice daily');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (6, 19, 'Frozen brine shrimp', 4, 'Every other day');

INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
VALUES (7, 20, 'Live worms', 1, 'Weekly');



