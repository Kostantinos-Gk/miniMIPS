--test bench code
LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

ENTITY test_control_unit IS 
END test_control_unit;

ARCHITECTURE BEHAVIRAL OF test_control_unit IS

COMPONENT Control IS PORT (
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	RegDst, RegWrite, ALUSrc, Branch: OUT STD_LOGIC;
	MemRead, MemWrite, MemtoReg : OUT STD_LOGIC;
	ALU_op: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END COMPONENT;

	SIGNAL OP_5to0S : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL RegDstS, RegWriteS, ALUSrcS, BranchS,MemReadS, MemWriteS, MemtoRegS : STD_LOGIC;
	SIGNAL ALU_opS : STD_LOGIC_VE(1 DOWNTO 0);
BEGIN 
	
	TESTCONTROLUNIT1 : Control PORT MAP (OP_5to0S, 
			RegDstS, RegWriteS, ALUSrcS, BranchS,
			MemReadS, MemWriteS, MemtoRegS, 
			ALU_opS);
	
	simulation : PROCESS
	BEGIN
		OP_5to0s <= "000000"; wait for 100 ns;
		OP_5to0s <= "100011"; wait for 100 ns;
		OP_5to0s <= "101011"; wait for 100 ns;
		OP_5to0s <= "000100"; wait for 100 ns;
	END PROCESS;
END;