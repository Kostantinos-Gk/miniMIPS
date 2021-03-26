--test bench code
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY test_registerfilefull IS
END test_registerfilefull;

ARCHITECTURE behavioral OF test_registerfilefull IS
	
	--variables for generic to pass into component
	signal dw : natural := 4;
    	signal size : natural := 4;
   	signal adrw : natural := 2;
	


	COMPONENT registerfile_full PORT(
		Datain : IN STD_LOGIC_VECTOR(dw-1 downto 0);
	        rAddr1: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
                rAddr2: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
                wAddr : IN STD_LOGIC_VECTOR(adrw-1 downto 0);
                we : IN STD_LOGIC;
                clk :  IN STD_LOGIC;
                reset : IN STD_LOGIC;
                Dataout1 : OUT STD_LOGIC_VECTOR(dw-1 downto 0);
	        Dataout2 : OUT STD_LOGIC_VECTOR(dw-1 downto 0));
	END COMPONENT;
	
	
	--component signals
	signal A1,C1,B1 : std_logic_vector(4-1 downto 0);--dw
	signal rAddr1a, rAddr2b, wAddr1 : std_logic_vector(2-1 downto 0);--adrw
	signal we1,clk1, reset1 : std_logic;
	
	constant clk_period : time := 200 ns;

BEGIN --this test bench runs for 1200ns
 	REGISTERFILE_FULL1 : registerfile_full PORT MAP (
		Datain => a1,
		rAddr1 => rAddr1a,
		rAddr2 => rAddr2b,
		wAddr => wAddr1,
		we => we1,
		reset => reset1,
		clk => clk1,
		Dataout1 => c1,
		Dataout2 => b1);
	
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
		we1 <= '1'; wait for 800 ns;  --write for 800 ns  
		we1 <= '0'; wait for 400 ns;  --read for 400 ns
	END PROCESS;
	
	simulation : PROCESS
 	BEGIN
		a1 <= "0101"; wait for 200 ns;  --different entries every 200ns 
		a1 <= "1101"; wait for 200 ns;
		a1 <= "0010"; wait for 200 ns;
		a1 <= "1001"; wait for 200 ns; 
	END PROCESS;

	write_address_process : PROCESS	
	BEGIN
		wAddr1 <= "00"; wait for 200 ns; --change address every 200ns
		wAddr1 <= "01"; wait for 200 ns;
		wAddr1 <= "10"; wait for 200 ns;
		wAddr1 <= "11"; wait for 200 ns;
	END PROCESS;
	
	read1_address_process : PROCESS	
	BEGIN
		wait for 800 ns;
		rAddr1a <= "00"; wait for 200 ns;
		rAddr1a <= "10"; wait for 200 ns;
	END PROCESS;

    	read2_address_process : PROCESS	
	BEGIN
		wait for 800 ns;
		rAddr2b <= "01"; wait for 200 ns;
		rAddr2b <= "10"; wait for 200 ns;
	END PROCESS;

	reset_prosess : PROCESS
	BEGIN
		reset1 <= '0'; wait for 1200 ns;
	END PROCESS; 
	
END;