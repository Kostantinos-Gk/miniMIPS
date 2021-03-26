--test bench code
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY test_register4 IS
END test_register4;

ARCHITECTURE behavioral OF test_register4 IS
	COMPONENT register4 PORT(
		d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		resetn,clk : IN STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;
	
	signal reset1 : STD_LOGIC:='1';
	signal clk1 : STD_LOGIC;
	signal d1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal q1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	constant clk_period : time := 100 ns;
	
	BEGIN
	REG4 : register4 PORT MAP (
			d => d1,
			q => q1,
			resetn => reset1,
			clk => clk1);
	
	--process for clock
	clk_process :PROCESS
	BEGIN
		clk1 <= '0';
		wait for clk_period/2;
		clk1 <= '1';
		wait for clk_period/2;
	END PROCESS;
	
	--process which controls the 'd' entry
	simulation : PROCESS
	BEGIN
		d1 <= "0010"; wait for 200 ns; --different entries every 200 ns
		d1 <= "1110"; wait for 200 ns;
		d1 <= "1010"; wait for 200 ns;
	END PROCESS;
END;