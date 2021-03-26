--MIPS Part_0
--Decoder 2 to 4
--24/05/2020, Konstantinos Gkousaris, 711171073, UniWA
--0.2_dec2to4.vhd

LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mips_dec2to4 IS PORT(
	a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mips_dec2to4;

ARCHITECTURE behavioral OF mips_dec2to4 IS
BEGIN 
PROCESS(a)
	BEGIN
	IF ( a = "00" ) THEN
		d <= "0001" ; 
	ELSIF ( a = "01" ) THEN
		d <= "0010" ;
	ELSIF ( a = "10" ) THEN
		d <= "0100";
	ELSE
		d <= "1000";
	END IF;
END PROCESS;
END ; 
