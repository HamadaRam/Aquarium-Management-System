--First procedure: procedure to add new Tanks.
CREATE OR REPLACE PROCEDURE AddTank (
  p_tank_id IN Tank.tank_id%TYPE,
  p_tank_name IN Tank.tank_name%TYPE,
  p_tank_size IN Tank.tank_size%TYPE,
  p_tank_type IN Tank.tank_type%TYPE,
  p_tank_filter IN Tank.tank_filter%TYPE,
  p_tank_heater IN Tank.tank_heater%TYPE
) AS
BEGIN
  -- Insert new Tank
  INSERT INTO Tank (tank_id, tank_name, tank_size, tank_type, tank_filter, tank_heater)
  VALUES (p_tank_id, p_tank_name, p_tank_size, p_tank_type, p_tank_filter, p_tank_heater);
  
  DBMS_OUTPUT.PUT_LINE('Tank added successfully.');
  
  -- Commit the changes
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred while adding the tank. Error: ' || SQLERRM);
END;
/




--Second procedure: procedure to retrieve Tank details given a specified Tank id.
CREATE OR REPLACE PROCEDURE GetTankDetails (
  p_tank_id IN Tank.tank_id%TYPE,
  p_tank_name OUT Tank.tank_name%TYPE,
  p_tank_size OUT Tank.tank_size%TYPE,
  p_tank_type OUT Tank.tank_type%TYPE,
  p_tank_filter OUT Tank.tank_filter%TYPE,
  p_tank_heater OUT Tank.tank_heater%TYPE
) AS
BEGIN
  -- Retrieve Tank details
  SELECT tank_name, tank_size, tank_type, tank_filter, tank_heater
  INTO p_tank_name, p_tank_size, p_tank_type, p_tank_filter, p_tank_heater
  FROM Tank
  WHERE tank_id = p_tank_id;

  DBMS_OUTPUT.PUT_LINE('Tank details retrieved successfully.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_tank_name := NULL;
    p_tank_size := NULL;
    p_tank_type := NULL;
    p_tank_filter := NULL;
    p_tank_heater := NULL;
    DBMS_OUTPUT.PUT_LINE('Tank not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred while retrieving tank details. Error: ' || SQLERRM);
END;
/


--Third procedure: procedure to add new Fish and Feeding info.
CREATE OR REPLACE PROCEDURE AddFishAndFeeding (
  p_tank_id IN Fish.tank_id%TYPE,
  p_fish_id IN Fish.fish_id%TYPE,
  p_fish_size IN Fish.fish_size%TYPE,
  p_food IN Feeding.food%TYPE,
  p_quantity IN Feeding.quantity%TYPE,
  p_frequency IN Feeding.frequency%TYPE
) AS
  v_no_tank EXCEPTION;
  PRAGMA EXCEPTION_INIT(v_no_tank, -02291);
  v_tank_id Tank.tank_id%TYPE;
BEGIN
  -- Check if Tank exists
  BEGIN
    SELECT tank_id
    INTO v_tank_id
    FROM Tank
    WHERE tank_id = p_tank_id;
    
    -- Insert new Fish
    INSERT INTO Fish (fish_id, tank_id, fish_size)
    VALUES (p_fish_id, p_tank_id, p_fish_size);
    
    -- Insert new Feeding info
    INSERT INTO Feeding (tank_id, fish_id, food, quantity, frequency)
    VALUES (p_tank_id, p_fish_id, p_food, p_quantity, p_frequency);
    
    DBMS_OUTPUT.PUT_LINE('Fish and Feeding info added successfully.');
    
    -- Commit the changes
    COMMIT;
  EXCEPTION
    WHEN v_no_tank THEN
      DBMS_OUTPUT.PUT_LINE('Tank not found. Fish and Feeding info cannot be added.');
  END;
END;
/


--Forth procedure: procedure to retrieve Fish feeding details given a specified Tank id.
CREATE OR REPLACE PROCEDURE GetFishFeedingDetails (
  p_tank_id IN Fish.tank_id%TYPE,
  p_fish_size OUT Fish.fish_size%TYPE,
  p_food OUT Feeding.food%TYPE,
  p_quantity OUT Feeding.quantity%TYPE,
  p_frequency OUT Feeding.frequency%TYPE
) AS
BEGIN
  -- Retrieve Fish feeding details
  SELECT fish_size, food, quantity, frequency
  INTO p_fish_size, p_food, p_quantity, p_frequency
  FROM Fish
  JOIN Feeding ON Fish.fish_id = Feeding.fish_id
  WHERE Fish.tank_id = p_tank_id;

  DBMS_OUTPUT.PUT_LINE('Fish feeding details retrieved successfully.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_fish_size := NULL;
    p_food := NULL;
    p_quantity := NULL;
    p_frequency := NULL;
    DBMS_OUTPUT.PUT_LINE('No Fish feeding details found for this Tank.');
END;
/



--To Call The Procedures from an anonymous block
DECLARE
  v_tank_name Tank.tank_name%TYPE;
  v_tank_size Tank.tank_size%TYPE;
  v_tank_type Tank.tank_type%TYPE;
  v_tank_filter Tank.tank_filter%TYPE;
  v_tank_heater Tank.tank_heater%TYPE;
  v_fish_size Fish.fish_size%TYPE;
  v_fish_food Feeding.food%TYPE;
  v_fish_quantity Feeding.quantity%TYPE;
  v_fish_feeding_frequency Feeding.frequency%TYPE;
  BEGIN
      -- Call the AddTank procedure
      AddTank(14, 'Tank 14', 'Large', 'Freshwater', 'Yes', 'No');
    
      -- Call the GetTankDetails procedure
      GetTankDetails(14, v_tank_name, v_tank_size, v_tank_type, v_tank_filter, v_tank_heater);
    
      -- Display the Tank details
      DBMS_OUTPUT.PUT_LINE('Tank Name: ' || v_tank_name);
      DBMS_OUTPUT.PUT_LINE('Tank Size: ' || v_tank_size);
      DBMS_OUTPUT.PUT_LINE('Tank Type: ' || v_tank_type);
      DBMS_OUTPUT.PUT_LINE('Tank Filter: ' || v_tank_filter);
      DBMS_OUTPUT.PUT_LINE('Tank Heater: ' || v_tank_heater);
  
      -- Call the AddFishAndFeeding procedure
      AddFishAndFeeding(14, 21, 'Small', 'Flakes', 2, 'Daily');
    
      -- Call the GetFishFeedingDetails procedure
      GetFishFeedingDetails(14, v_fish_size, v_fish_food, v_fish_quantity, v_fish_feeding_frequency);
    
      -- Display the Fish feeding information
      DBMS_OUTPUT.PUT_LINE('Fish Size: ' || v_fish_size);
      DBMS_OUTPUT.PUT_LINE('Fish Food: ' || v_fish_food);
      DBMS_OUTPUT.PUT_LINE('Fish Quantity: ' || v_fish_quantity);
      DBMS_OUTPUT.PUT_LINE('Feeding Frequency: ' || v_fish_feeding_frequency);

END;
/

