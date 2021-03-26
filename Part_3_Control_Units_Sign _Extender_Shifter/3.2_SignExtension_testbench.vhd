--test bench
LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY test_SignExtension IS
END test_SignExtension;

ARCHITECTURE behavioral OF test_SignExtension IS

COMPONENT SIGN_Extension PORT ( 
	Insrt_15to0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Sign_extended: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;


	SIGNAL Insrt_15to0S   : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL Sign_extendedS : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN 

	SIGNEXTENSIONTEST : SIGN_Extension PORT MAP (
		Insrt_15to0=> Insrt_15to0S,
		Sign_extended =>Sign_extendedS);

	sign_extender_process : PROCESS 
	BEGIN 
		Insrt_15to0S <= x"0010"; wait for 100 ns;
		Insrt_15to0S <= x"1001"; wait for 100 ns;
		Insrt_15to0S <= x"80A0"; wait for 100 ns;
	END PROCESS;
END;