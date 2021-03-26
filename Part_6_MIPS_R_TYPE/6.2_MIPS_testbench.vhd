LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY testBench_MIPS IS
END testBench_MIPS;

ARCHITECTURE behavioral OF testBench_MIPS IS

	COMPONENT mips PORT (
		CLK 	: IN STD_LOGIC;
		Reset 	: IN STD_LOGIC;
		outMIPS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;

	SIGNAL CLK 	 : STD_LOGIC;
	SIGNAL RST 	 : STD_LOGIC;
	SIGNAL outMIPS 	 : std_logic_vector(31 DOWNTO 0);

	constant clk_period : time := 100 ns;

BEGIN
	UUT : mips PORT MAP (CLK, RST, outMIPS);
	--process for clock
	clk_process :PROCESS
	BEGIN
		clk<= '0'; wait for clk_period/2;
		clk <= '1'; wait for clk_period/2;
	END PROCESS;
	
	simulation_mips : PROCESS
	BEGIN
		--Rst <= '1'; wait for 10 ns;
		Rst <= '0'; wait for 400 ns;
		Rst <= '1'; wait for 50 ns;
	END PROCESS;
	
END;