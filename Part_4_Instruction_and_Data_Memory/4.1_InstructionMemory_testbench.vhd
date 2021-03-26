LIBRARY ieee;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.ALL;

ENTITY test_instruction_memory IS
END test_instruction_memory;


ARCHITECTURE behabioral OF test_instruction_memory IS 

	
COMPONENT instrMemory PORT (
		Addr : IN STD_LOGIC_VECTOR(3 downto 0);
		C : OUT STD_LOGIC_VECTOR(31 downto 0));
END COMPONENT;

	SIGNAL  Addr1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL  C1 : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
	INSTRUCTIONMEMORY1 : instrMemory PORT MAP (
		Addr => Addr1,
		C => C1);

	read_instruction : PROCESS
	BEGIN 
		FOR I IN 0 TO 3 LOOP
			Addr1 <= std_logic_vector(to_unsigned(I, 4));
		WAIT FOR 50 ns;
		END LOOP;
		--ASSERT FALSE
			--REPORT "end";
			--SEVERITY failure;
	END PROCESS;
END;
	

