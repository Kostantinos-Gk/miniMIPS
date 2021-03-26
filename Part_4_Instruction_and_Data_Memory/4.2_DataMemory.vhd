--MIPS Part_4
--DATA MEMORY
--18/05/2020, Konstantinos Gkousaris, 711171073, UniWA

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY dataMemory IS PORT (
	Addr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	writeD : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	we : IN STD_LOGIC;
	re : IN STD_LOGIC;
	readD : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	clk : IN STD_LOGIC); 
END dataMemory;

--add a clock input, because the process works with clock
--i dont know if i use it in MIPS implentation yet
--or change the component, but for the separate trial 
--needs clock.

ARCHITECTURE behavioral OF datamemory IS

TYPE memArray IS ARRAY(0 TO 63) OF STD_LOGIC_VECTOR(31 downto 0);
SIGNAL memfile : memArray;
	BEGIN
	PROCESS(clk)
	BEGIN
		IF (clk'event and clk='0') THEN
			IF we='1' THEN
				memfile(to_integer(unsigned(Addr))) <= writeD;
			END IF;
		END IF;
		IF re='1' THEN
			readD <= memfile(to_integer(unsigned(Addr)));
		END IF;	
	END PROCESS;
END behavioral;