--First function: function to calculate the average temperature for a given tank type.
CREATE OR REPLACE FUNCTION get_avg_temperature(p_tank_type VARCHAR2) RETURN NUMBER IS
  v_avg_temperature NUMBER;
BEGIN
  SELECT AVG(temperature)
  INTO v_avg_temperature
  FROM Water_Quality wq
  JOIN Tank t ON wq.tank_id = t.tank_id
  WHERE t.tank_type = p_tank_type;

  RETURN v_avg_temperature;
END;
/


--Second function: function to count the number of tanks with a heater.
CREATE OR REPLACE FUNCTION count_tanks_with_heater RETURN NUMBER IS
  v_num_tanks NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_num_tanks
  FROM Tank
  WHERE tank_heater = 'Yes';

  RETURN v_num_tanks;
END;
/


--To Call The functions from an anonymous block
DECLARE
  v_avg_temp_freshwater NUMBER;
  v_avg_temp_saltwater NUMBER;
  v_num_tanks_with_heater NUMBER;
BEGIN
  v_avg_temp_freshwater := get_avg_temperature('Freshwater');
  v_avg_temp_saltwater := get_avg_temperature('Saltwater');
  v_num_tanks_with_heater := count_tanks_with_heater;

  DBMS_OUTPUT.PUT_LINE('Average temperature for Freshwater tanks: ' || v_avg_temp_freshwater || '°C');
  DBMS_OUTPUT.PUT_LINE('Average temperature for Saltwater tanks: ' || v_avg_temp_saltwater || '°C');
  DBMS_OUTPUT.PUT_LINE('Number of tanks with heater: ' || v_num_tanks_with_heater);
END;
/

