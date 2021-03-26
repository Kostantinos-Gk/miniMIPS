--test bench code
--this test bench runs for 800 ns
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY test_registerfileMP IS
END test_registerfileMP;

ARCHITECTURE behavioral OF test_registerfileMP IS

	COMPONENT registerfile PORT(
		Datain : IN STD_LOGIC_VECTOR(3 downto 0);
		Addr : IN STD_LOGIC_VECTOR(2 downto 0);
		we : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		Dataout : OUT STD_LOGIC_VECTOR(3 downto 0));
	END COMPONENT;
	
	--component signals
	signal Datain1,Dataout1 : std_logic_vector(3 downto 0);
	signal Addr1 : std_logic_vector(2 downto 0);
	signal we1,clk1 : std_logic;
	
	constant clk_period : time := 100 ns;

BEGIN
 	REGISTERFILE1 : registerfile PORT MAP (
		Datain=>Datain1,
		Addr=>Addr1,
		we=>we1,
		clk=>clk1,
		Dataout=>Dataout1);
	
	--process for clock
	clk_process :PROCESS
  	BEGIN
  	clk1 <= '0';
  	wait for clk_period/2;
  	clk1 <= '1';
  	wait for clk_period/2;
  	END PROCESS;
	--process which controls the 'd' entry
 	
	write_process : PROCESS
 	BEGIN
		we1 <= '1'; wait for 400 ns;  --write for 400 ns  
		we1 <= '0'; wait for 400 ns;  --read for 400 ns
	END PROCESS;
	
	simulation : PROCESS
 	BEGIN
		-- write this data in memory
		Datain1 <= "0101"; wait for 100 ns;   
		Datain1 <= "1101"; wait for 100 ns;
		Datain1 <= "0010"; wait for 100 ns;
		Datain1 <= "1001"; wait for 100 ns; 
		--after specific inputs reset the datain
		Datain1 <= "0000"; wait; 
	END PROCESS;

	address_process : PROCESS	
	BEGIN
		--write the data on a specific address for 400ns
		addr1 <= "000"; wait for 100 ns; 
		addr1 <= "001"; wait for 100 ns;
		addr1 <= "010"; wait for 100 ns;
		addr1 <= "011"; wait for 100 ns;
                --read the data from memory to check if writing process works good
		addr1 <= "000"; wait for 100 ns;
		addr1 <= "001"; wait for 100 ns;
		addr1 <= "010"; wait for 100 ns;
		addr1 <= "011"; wait for 100 ns;
	END PROCESS;
END;