--test bench code
LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY test_ALU4bits IS
END test_ALU4bits;

ARCHITECTURE behavioral OF test_ALU4bits IS


	COMPONENT alu4 IS PORT (
		aluin1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		aluin2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		aluctrl: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	
		aluout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero   : OUT STD_LOGIC);
	END COMPONENT;
	
	--component signal 
	signal  aluin1s, aluin2s, aluctrls, aluouts : std_logic_vector(3 downto 0);
	signal  zeros : std_logic;

BEGIN
	ALU4bit1: alu4 PORT MAP (aluin1=>aluin1s,
				 aluin2=>aluin2s,
				 aluctrl=>aluctrls,
				 aluout=>aluouts,
			 	 zero=>zeros);
	
	aluin1_process : PROCESS 
	BEGIN 
		aluin1s <= "0010"; wait for 100 ns; --1
		aluin1s <= "0100"; wait for 100 ns; --2
		aluin1s <= "0100"; wait for 100 ns; --3
		aluin1s <= "0100"; wait for 100 ns; --4
		aluin1s <= "0100"; wait for 100 ns; --5
		aluin1s <= "0100"; wait for 100 ns; --6
	END PROCESS;

	aluin2_process : PROCESS 
	BEGIN 
		aluin2s <= "0100"; wait for 100 ns; --1
		aluin2s <= "1111"; wait for 100 ns; --2
		aluin2s <= "1111"; wait for 100 ns; --3
		aluin2s <= "0010"; wait for 100 ns; --4
		aluin2s <= "0110"; wait for 100 ns; --5
		aluin2s <= "0110"; wait for 100 ns; --6
	END PROCESS;
	
	aluctrl_process : PROCESS 
	BEGIN 
		aluctrls <= "0010"; wait for 100 ns; --1
		aluctrls <= "0000"; wait for 100 ns; --2
		aluctrls <= "0001"; wait for 100 ns; --3
		aluctrls <= "0110"; wait for 100 ns; --4
		aluctrls <= "0110"; wait for 100 ns; --5
		aluctrls <= "0111"; wait for 100 ns; --6
	END PROCESS;
END;