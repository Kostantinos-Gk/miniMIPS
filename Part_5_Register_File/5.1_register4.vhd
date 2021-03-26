--MIPS Part_5
--Register 4bit
--27/05/2020, Konstantinos Gkousaris, 711171073, UniWA--

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY register4 IS PORT (
d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
resetn, clk : IN STD_LOGIC;
q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END register4;


ARCHITECTURE behavioral OF register4 IS
BEGIN
		PROCESS(resetn, clk)
		BEGIN
			IF resetn = '0' THEN
				q <= "0000";
		ELSIF rising_edge(clk) THEN
				q <= d;
		END IF;
		END PROCESS;
END behavioral;