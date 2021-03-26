--MIPS Part_5
--RegisterFile
--27/05/2020, Konstantinos Gkousaris, 711171073, UniWA--


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


ENTITY registerfile IS PORT (
	Datain : IN STD_LOGIC_VECTOR(3 downto 0);
	Addr : IN STD_LOGIC_VECTOR(2 downto 0);
	we : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	Dataout : OUT STD_LOGIC_VECTOR(3 downto 0));
END registerfile;

ARCHITECTURE behavioral OF registerfile IS

TYPE regArray IS ARRAY(0 TO 7) OF STD_LOGIC_VECTOR(3 DOWNTO 0);

	SIGNAL registerfile: regArray;
	BEGIN
	PROCESS(clk)
	BEGIN
		IF (clk'event and clk='0') THEN
			IF we='1' THEN
				registerfile(to_integer(unsigned(Addr))) <= Datain;
			END IF;
		END IF;
			Dataout <= registerfile(to_integer(unsigned(Addr)));
	END PROCESS;
END;