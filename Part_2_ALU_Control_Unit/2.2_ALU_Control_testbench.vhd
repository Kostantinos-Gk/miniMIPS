--test bench
LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY test_ALUControl IS
END test_ALUControl;


ARCHITECTURE behavioral OF test_AluControl IS

COMPONENT Alu_Control PORT(
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALU_op  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Operation : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

	SIGNAL OP_5to01  : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL ALU_op1   : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL Operation1: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN 

	ALUCONTROL1 : Alu_control PORT MAP (
		OP_5to0 => OP_5to01,
		ALU_op => ALU_op1,
		Operation => Operation1);

	alu_op_process : PROCESS 
	BEGIN 
		ALU_op1 <= "00"; wait for 50 ns; --00 (1)
		ALU_op1 <= "00"; wait for 50 ns; --00 (2)
		ALU_op1 <= "01"; wait for 50 ns; --01 (3)
		ALU_op1 <= "10"; wait for 50 ns; --10 (4)
		ALU_op1 <= "10"; wait for 50 ns; --10 (5)
		ALU_op1 <= "10"; wait for 50 ns; --10 (6)
		ALU_op1 <= "10"; wait for 50 ns; --10 (7)
		ALU_op1 <= "10"; wait for 50 ns; --10 (8)
	END PROCESS;

	opfunction :  PROCESS
	BEGIN
		OP_5to01 <= "001001"; wait for 50 ns; --001001 (1)
		OP_5to01 <= "001010"; wait for 50 ns; --001010 (2)
		OP_5to01 <= "100111"; wait for 50 ns; --100111 (3)
		OP_5to01 <= "100000"; wait for 50 ns; --001000 (4)
		OP_5to01 <= "100010"; wait for 50 ns; --100010 (5)
		OP_5to01 <= "100100"; wait for 50 ns; --100100 (6)
		OP_5to01 <= "100101"; wait for 50 ns; --100101 (7)
		OP_5to01 <= "101010"; wait for 50 ns; --101010 (8)
	END PROCESS;
END;