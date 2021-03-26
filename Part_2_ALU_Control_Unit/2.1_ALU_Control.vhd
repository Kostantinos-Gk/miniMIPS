--MIPS Part_2
--UNIT control ALU
--30/05/2020, Konstantinos Gkousaris, 711171073, UniWA--

LIBRARY ieee; 
USE ieee.std_logic_1164.all;

ENTITY ALU_Control IS PORT(
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALU_op  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Operation : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU_Control;

ARCHITECTURE ALUControl_1 OF ALU_Control IS



BEGIN 
	--code base on github
	Operation(3) <= '0'; 
	Operation(2) <= ALU_op(0) or (ALU_op(1) and OP_5to0(1)); 
	Operation(1) <= not ALU_op(1) or not OP_5to0(2); 
	Operation(0) <= (OP_5to0(3) or OP_5to0(0)) and ALU_op(1);
END;