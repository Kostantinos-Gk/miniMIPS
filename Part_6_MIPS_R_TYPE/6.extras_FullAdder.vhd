LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Fulladder32bit IS PORT (
	in1, in2  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	carryin   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	sum	  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	carryout  : OUT STD_LOGIC);
END  Fulladder32bit;

ARCHITECTURE FA32bit OF Fulladder32bit IS 
	
	SIGNAL tmp : STD_LOGIC_VECTOR(4 DOWNTO 0); --SUM WITH CARRY ON (32)
BEGIN
	tmp <= STD_LOGIC_VECTOR(to_signed(to_integer(signed(in1)) + 
		to_integer(signed(in2)) + to_integer(signed(carryin)),5));
	carryout <= tmp(4);
	sum      <= tmp(3 DOWNTO 0);
END FA32bit;