--MIPS Part_5
--RegisterFileFull
--27/05/2020, Konstantinos Gkousaris, 711171073, UniWA--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY registerfile_full IS 
	GENERIC (	dw : natural := 4;
	 	 	size : natural := 4;
		  	adrw : natural := 2);

	PORT 	( 	Datain : IN STD_LOGIC_VECTOR(dw-1 downto 0);
	       		rAddr1: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		rAddr2: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		wAddr : IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		we : IN STD_LOGIC;
               		clk :  IN STD_LOGIC;
               		reset : IN STD_LOGIC;
               		Dataout1 : OUT STD_LOGIC_VECTOR(dw-1 downto 0);
	       		Dataout2 : OUT STD_LOGIC_VECTOR(dw-1 downto 0));
end registerfile_full;

ARCHITECTURE behavioral OF registerfile_full IS

TYPE regArray IS ARRAY(0 to size-1) OF std_logic_vector(dw-1 DOWNTO 0);
signal regfileb : regArray;

BEGIN
	PROCESS(clk)
	BEGIN
	IF reset= '1' THEN --reset entire circuit
		Dataout1 <= "0000" ; 
		Dataout2 <= "0000" ;
	ELSIF (clk'event AND clk='0') then
		IF we='1' then
			regfileb(to_integer(unsigned(wAddr))) <= Datain;
		END IF;
	END IF;
	Dataout1 <= regfileb(to_integer(unsigned(rAddr1)));
	Dataout2 <= regfileb(to_integer(unsigned(rAddr2)));
	END PROCESS;
END behavioral;