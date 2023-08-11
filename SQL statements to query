--Display the tank name, tank size, fish size, and the number of fish in each tank.


SELECT t.TANK_NAME, t.TANK_SIZE, f.FISH_SIZE, COUNT(f.FISH_ID) AS Num_of_Fish
FROM Tank t
LEFT JOIN Fish f ON t.TANK_ID = f.TANK_ID
GROUP BY t.TANK_ID, t.TANK_NAME, t.TANK_SIZE, f.FISH_SIZE;

--add a new maintenance schedule to the Maintenance table.

INSERT INTO Maintenance (MAINTENANCE_ID, TANK_ID, TASK, FREQUENCY)
VALUES (11, 11, 'Inspect equipment', 'Quarterly');

--Update the tank size and heater status for tank 9.

UPDATE Tank
SET TANK_SIZE = 'XL', TANK_HEATER = 'Yes'
WHERE TANK_ID = 9;

--delete from maintenance where ID = 11.

DELETE FROM Maintenance
WHERE MAINTENANCE_ID = 11 

