LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

ENTITY test_shiftleft2 IS 
END test_shiftleft2;

ARCHITECTURE behavioral OF test_shiftleft2 IS

COMPONENT shiftleft2 IS PORT (
	in1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	d: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;

	SIGNAL in1S, dS : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN 
	
	TESTSHIFTLEFT2 : shiftleft2 PORT MAP (in1S,dS);
	
	simulation : PROCESS
	BEGIN
		in1S 	<= x"ffffaaff"; wait for 100 ns;
		in1S 	<= x"0000aaaf"; wait for 100 ns;
		in1S    <= x"0002aabc"; wait for 100 ns;
 		in1S    <= x"ffffabfc"; wait for 100 ns;
	
	END PROCESS;
END;