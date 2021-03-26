--MIPS Part_3
--Control_Unit
--15/06/2020, Konstantinos Gkousaris, 711171073, UniWA

LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY SIGN_Extension IS PORT ( 
	Insrt_15to0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Sign_extended: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END SIGN_Extension;

--code base on implemantation "?????????? ??? ???????? ???????? ??????????"
ARCHITECTURE signextend_1 OF SIGN_Extension IS
 	SIGNAL ones : STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS=>'1');
	SIGNAL zeros : STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS=>'0');

BEGIN
	 Sign_extended <= ones & Insrt_15to0 when Insrt_15to0(15) = '1'
	 else
			  zeros & Insrt_15to0 when Insrt_15to0(15) = '0';
END;
