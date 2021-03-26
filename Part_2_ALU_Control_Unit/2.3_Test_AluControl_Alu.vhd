--MIPS Part_2
--TEST ALU_CONTROL_ALU
--30/05/2020, Konstantinos Gkousaris, 711171073, UniWA--

LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY TEST_ALUCONTROL_ALU IS PORT (
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALU_op  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ALUin1  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ALUin2	: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	ALUout1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	zero    : OUT STD_LOGIC);
END TEST_ALUCONTROL_ALU;

ARCHITECTURE stuctural OF TEST_ALUCONTROL_ALU IS

	COMPONENT alu4 PORT (
		aluin1  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		aluin2  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		aluctrl : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	
		aluout  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero    : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT ALU_Control PORT(
		OP_5to0  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALU_op   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);   
		Operation : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;

	SIGNAL CONTROL : STD_LOGIC_VECTOR(3 DOWNTO 0); --the only eternal signal
	
BEGIN
	
	ALU_CONTROL_TEST1 : Alu_Control PORT MAP (OP_5to0,ALU_op,CONTROL);
	ALU4_TEST1 :  alu4 PORT MAP (ALUin1,ALUin2,CONTROL,ALUout1,zero); 

	--ALU_CONTROL_TEST1 : Alu_Control PORT MAP (
	--	OP_5to0 => OP_5to0,
	--	ALU_op => ALU_op,
	--	Operation => Operation);

	--ALU4_TEST1 : alu4 PORT MAP (
	--	ALUin1 => aluin1,
	--	ALUin2 => aluin2,
	--	aluctrl => Operation,
	--	aluout => aluout,
	--	zero => zero); 

END;
