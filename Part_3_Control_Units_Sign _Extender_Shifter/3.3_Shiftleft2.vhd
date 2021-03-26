--MIPS Part_3
--LEFT SHIFTER '2'
--15/06/2020, Konstantinos Gkousaris, 711171073, UniWA

LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY shiftleft2 IS PORT (
	in1: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	d: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END shiftleft2;

ARCHITECTURE behavioral OF shiftleft2 IS 
--code base on implemantation "?????????? ??? ???????? ???????? ??????????"
 	
	signal tmp : unsigned(31 DOWNTO 0);
	--put another signal if someone want to work with shift left higher than '2'
	--signal num : std_logic_vector(3 DOWNTO 0):= "0010";-- shift left 2


BEGIN
	--tmp <= to_unsigned(to_integer(signed(in1)),tmp'length) sll 2;
		--to_integer(signed(num));

	 d <= std_logic_vector(to_signed(to_integer(in1S),d'length)) sll 2;

  

END behavioral;
