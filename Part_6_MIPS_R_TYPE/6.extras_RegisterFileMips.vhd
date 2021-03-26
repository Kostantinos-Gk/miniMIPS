--MIPS Part_6
--RegisterFileFull_for_MIPS
--29/05/2020, Konstantinos Gkousaris, 711171073, UniWA

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY registerfile_full_for_MIPS IS 
	GENERIC (	dw : natural := 32;
	 	 	size : natural := 32;
		  	adrw : natural := 5);

	PORT 	( 	Datain : IN STD_LOGIC_VECTOR(dw-1 downto 0);
	       		rAddr1: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		rAddr2: IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		wAddr : IN STD_LOGIC_VECTOR(adrw-1 downto 0);
               		we : IN STD_LOGIC;
               		clk :  IN STD_LOGIC;
               		reset : IN STD_LOGIC;
               		Dataout1 : OUT STD_LOGIC_VECTOR(dw-1 downto 0);
	       		Dataout2 : OUT STD_LOGIC_VECTOR(dw-1 downto 0));
end registerfile_full_for_MIPS;

ARCHITECTURE behavioral OF registerfile_full_for_MIPS IS

TYPE regArray IS ARRAY(0 to size-1) OF std_logic_vector(dw-1 DOWNTO 0);

--maping of register file, for our demonstration we will use the registers 
--$2, $6 which contains values 10 and 7 and $5, $4 which store the results
--there are plenty of values in other registers for testing purposes and also
--the registers have not the same names and same causes with a real MIPS implemantation because 
--this implemantion is about only for R TYPE instructions.  
signal regfileb : regArray := (			--register name (it's not full_MIPS)
		x"00000000", 			--$0
		x"00000000", 			--$1
		x"0000000a",--contains value 10	--$2
		x"00000000", 			--$3
		x"00000000", 			--$4
		x"00000000", 			--$5
		x"00000007",--contains value 7  --$6
		x"00000000", 			--$7
		x"00000000", 			--$8
		x"00000000", 			--$9
		x"0000000a",--contains value 10 --$10
		x"00000000", 			--$11
		x"00000007",--contains value 7	--$12
		x"00000005",--contains value 5  --$13
		x"00000000",			--$14
		x"00000000", 			--$15
		x"00000000", 			--$16
		x"00000000", 			--$17
		x"00000000", 			--$18
		x"00000000", 			--$19
		x"00000000", 			--$20
		x"00000000", 			--$21
		x"00000000", 			--$22
		x"00000000", 			--$23
		x"00000000", 			--$24
		x"00000000", 			--$25
		x"00000000", 			--$26
		x"00000000", 			--$27
		x"10008000", 			--$28
		x"7FFFF1EC", 			--$29
		x"eeeeeeee", 			--$30
		x"ffffffff" 			--$31
	);

BEGIN
	PROCESS(clk)
	BEGIN
	IF reset= '1' THEN --reset entire circuit
		Dataout1 <= x"FFFFFFFF" ; 
		Dataout2 <= x"FFFFFFFF" ;
	ELSIF (clk'event AND clk='0') then
		IF we='1' then
			   
		Dataout1 <= regfileb(to_integer(unsigned(rAddr1)));
		Dataout2 <= regfileb(to_integer(unsigned(rAddr2)));
			   
		END IF;
	END IF;
		Dataout1 <= regfileb(to_integer(unsigned(rAddr1)));
		Dataout2 <= regfileb(to_integer(unsigned(rAddr2)));
	END PROCESS;
END behavioral;