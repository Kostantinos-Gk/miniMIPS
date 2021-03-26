--test bench
LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY test_ALUControl_Unit IS
END test_ALUControl_Unit;


ARCHITECTURE behavioral OF test_AluControl_Unit IS
	
COMPONENT TEST_ALUCONTROL_ALU PORT (
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALU_op  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ALUin1  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ALUin2	: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	ALUout1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	zero    : OUT STD_LOGIC);
END COMPONENT;

	SIGNAL ALUin1S, ALUin2S, ALUout1S : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL zeroS     : STD_LOGIC;
	SIGNAL ALU_opS    : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL OP_5to0S   : STD_LOGIC_VECTOR(5 DOWNTO 0);
BEGIN 

	TESTALUCONTROLALU1 : TEST_ALUCONTROL_ALU PORT MAP (
		OP_5to0 => OP_5to0S,
		ALU_op => ALU_opS,
		ALUin1 => ALUin1S,
		ALUin2 => ALUin2S,
		ALUout1 => ALUout1S,
		zero => zeroS);

	alu_op_process : PROCESS 
	BEGIN 
		ALU_opS <= "00"; wait for 50 ns; --00 (1)
		ALU_opS <= "00"; wait for 50 ns; --00 (2)
		ALU_opS <= "01"; wait for 50 ns; --01 (3)
		ALU_opS <= "10"; wait for 50 ns; --10 (4)
		ALU_opS <= "10"; wait for 50 ns; --10 (5)
		ALU_opS <= "10"; wait for 50 ns; --10 (6)
		ALU_opS <= "10"; wait for 50 ns; --10 (7)
		ALU_opS <= "10"; wait for 50 ns; --10 (8)
	END PROCESS;

	opfunction :  PROCESS
	BEGIN
		OP_5to0S <= "001001"; wait for 50 ns; --001001 (1)
		OP_5to0S <= "001010"; wait for 50 ns; --001010 (2)
		OP_5to0S <= "100111"; wait for 50 ns; --100111 (3)
		OP_5to0S <= "100000"; wait for 50 ns; --001000 (4)
		OP_5to0S <= "100010"; wait for 50 ns; --100010 (5)
		OP_5to0S <= "100100"; wait for 50 ns; --100100 (6)
		OP_5to0S <= "100101"; wait for 50 ns; --100101 (7)
		OP_5to0S <= "101010"; wait for 50 ns; --101010 (8)
	END PROCESS;

	aluin1_process : PROCESS
	BEGIN 
		ALUin1S <= "1100"; wait for 50 ns; --1100 (1)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (2)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (3)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (4)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (5)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (6)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (7)
		ALUin1S <= "1100"; wait for 50 ns; --1100 (8)
	END PROCESS;

	aluin2_process : PROCESS
	BEGIN 
		ALUin2S <= "1100"; wait for 50 ns; --1100 (1)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (2)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (3)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (4)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (5)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (6)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (7)
		ALUin2S <= "1100"; wait for 50 ns; --1100 (8)
	END PROCESS;

END;