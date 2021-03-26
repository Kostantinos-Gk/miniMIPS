--MIPS Part_6
--PROGRAM COUNTER, 
--27/05/2020, Konstantinos Gkousaris, 711171073, UniWA


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY programCounter IS PORT (
	inPC 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	outPC	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk     : IN STD_LOGIC;
	reset   : IN STD_LOGIC);
END programCounter;

ARCHITECTURE programCounter_1 OF programCounter IS
BEGIN
	reg : PROCESS(clk)
	BEGIN
		IF( reset = '1' ) THEN
			outPC <= STD_LOGIC_VECTOR(to_signed(-1,4));
		END IF;
		IF RISING_EDGE(clk) THEN
			outPC <= inPC;
		END IF;
	END PROCESS;
END programCounter_1;