LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY test_datamemory IS 
END test_datamemory;

ARCHITECTURE behavioral OF test_datamemory IS

COMPONENT dataMemory IS PORT (
	Addr : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	writeD : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	we : IN STD_LOGIC;
	re : IN STD_LOGIC;
	readD : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	clk : IN STD_LOGIC);
END COMPONENT;

	SIGNAL AddrS : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL readD_S, writeD_S : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL we_S, re_S, clkS : STD_LOGIC;
	
	constant clk_period : time := 100 ns;
	

BEGIN 
	
	TESTDATAMEMORY1 : dataMemory PORT MAP (AddrS, writeD_S, we_S, re_S, readD_S, clkS);
	
	--process for clock
	clk_process :PROCESS
	BEGIN
		clkS<= '0'; wait for clk_period/2;
		clkS <= '1'; wait for clk_period/2;
	END PROCESS;
	
	simulation_Address: PROCESS
	BEGIN
		AddrS 	<= "000000"; wait for 100 ns;
		AddrS 	<= "000001"; wait for 100 ns;
		AddrS   <= "000010"; wait for 100 ns;
 		AddrS   <= "000011"; wait for 100 ns;
		AddrS 	<= "000000"; wait for 100 ns;
		AddrS 	<= "000001"; wait for 100 ns;
	
	END PROCESS;

	simulation_write: PROCESS
	BEGIN
		we_S 	<= '1'; wait for 100 ns;
		we_S 	<= '1'; wait for 100 ns;
		we_S    <= '1'; wait for 100 ns;
 		we_S    <= '1'; wait for 100 ns;
		we_S 	<= '0'; wait for 100 ns;
		we_S 	<= '0'; wait for 100 ns;
	END PROCESS; 

	simulation_read: PROCESS
	BEGIN
		re_S 	<= '0'; wait for 100 ns;
		re_S 	<= '0'; wait for 100 ns;
		re_S    <= '0'; wait for 100 ns;
 		re_S    <= '0'; wait for 100 ns;
		re_S 	<= '1'; wait for 100 ns;
		re_S 	<= '1'; wait for 100 ns;
	END PROCESS;

	simulation_data: PROCESS
	BEGIN
		writeD_S 	<= "01010101010101010101010101010101"; wait for 100 ns;
		writeD_S 	<= "11011101110111011101110111011101"; wait for 100 ns;
		writeD_S    <= "00100010001000100010001000100010"; wait for 100 ns;
 		writeD_S    <= "10011001100110011001100110011001"; wait for 100 ns;
		writeD_S 	<= "00000000000000000000000000000000"; wait;
	END PROCESS;  

	
END;