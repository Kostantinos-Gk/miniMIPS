--MIPS Part_1
--A.L.U. 32bits
--27/05/2020, Konstantinos Gkousaris, 711171073, UniWA--


LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY alu32 IS PORT (
	aluin1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	aluin2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	aluctrl: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	
	aluout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	zero   : OUT STD_LOGIC);
END alu32;

-- OP mapping :
-- 0000 AND
-- 0001 OR
-- 0010 ADD
-- 0110 SUBTRACT
-- 0111 set on less than

ARCHITECTURE alu_1 OF alu32 IS
signal result :std_logic_vector(31 downto 0);
BEGIN
PROCESS(aluctrl,aluin1,aluin2,result) 
	BEGIN
	IF (aluctrl = "0000") THEN
		result <= aluin1 AND aluin2; 
	ELSIF (aluctrl = "0001") THEN
		result <= aluin1 OR aluin2; 
	ELSIF (aluctrl = "0010") THEN
		result <= aluin1 + aluin2; 
	ELSIF (aluctrl = "0110") THEN
		result <= aluin1 - aluin2;
	ELSIF (aluctrl = "0111") THEN
		IF (aluin1 < aluin2) THEN
			result <= "00000000000000000000000000000001";
		ELSE
			result <= "00000000000000000000000000000000";
		END IF;
	ELSE 
		result <= "00000000000000000000000000000000";
	END IF;


       IF (result="00000000000000000000000000000000") THEN
		zero <= '1';
	ELSE 
		zero <= '0';
	END IF;

END PROCESS;
	--zero<='1' WHEN result="00000000000000000000000000000000" ELSE '0';
	aluout <= result;
END;



 