--MIPS Part_3
--Control_Unit
--15/06/2020, Konstantinos Gkousaris, 711171073, UniWA

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 


ENTITY Control IS PORT (
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	RegDst, RegWrite, ALUSrc, Branch: OUT STD_LOGIC;
	MemRead, MemWrite, MemtoReg : OUT STD_LOGIC;
	ALU_op: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END Control;

--CONTROL UNIT MAPPING
--INSTRUCTION REGDST ALUSRC MEMTOREG REGWRITE MEMREAD MEMWRITE BRANCH ALUOP1 ALUOP2
--     R        1      0       0        1        0       0        0      1     0
--    LW        0      1       1        1        1       0        0      0     0
--    SW        X      1       X        0        0       1        0      0     0
--   BEQ        X      0       X        0        0       0        1      0     1

--INSTRUCTION
--TYPE R 	OPCODE  -> 000000
--LOAD WORD	OPCODE 	-> 100011
--STORE WORD 	OPCODE	-> 101011
--BRANCH EQUAL 	OPCODE 	-> 000100 
--ELSE
ARCHITECTURE behavioral OF Control IS 

BEGIN 
	PROCESS(Op_5to0)
	BEGIN
	IF (Op_5to0 = "000000") THEN	--TYPE R, ADD, SUB, AND, OR
		RegDst        <= '1';
		ALUsrc        <= '0';
		MemToReg      <= '0';
		RegWrite      <= '1';
		MemRead       <= '0';
		MemWrite      <= '0';
		Branch        <= '0';
		ALU_op(1)     <= '1';
		ALU_op(0)     <= '0';
	ELSIF (Op_5to0 = "100011") THEN  --LOAD WORD	
		RegDst        <= '0';
		ALUsrc        <= '1';
		MemToReg      <= '1';
		RegWrite      <= '1';
		MemRead       <= '1';
		MemWrite      <= '0';
		Branch        <= '0';
		ALU_op(1)     <= '0';
		ALU_op(0)     <= '0';
	ELSIF (Op_5to0 = "101011") THEN  --STORE WORD	
		RegDst        <= 'X';
		ALUsrc        <= '1';
		MemToReg      <= 'X';
		RegWrite      <= '0';
		MemRead       <= '0';
		MemWrite      <= '1';
		Branch        <= '0';
		ALU_op(1)     <= '0';
		ALU_op(0)     <= '0';
	ELSIF (Op_5to0 = "000100") THEN	
		RegDst        <= 'X';
		ALUsrc        <= '0';
		MemToReg      <= 'X';
		RegWrite      <= '0';
		MemRead       <= '0';
		MemWrite      <= '0';
		Branch        <= '1';
		ALU_op(1)     <= '0';
		ALU_op(0)     <= '1';
	ELSE
		RegDst        <= '0';
		ALUsrc        <= '0';
		MemToReg      <= '0';
		RegWrite      <= '0';
		MemRead       <= '0';
		MemWrite      <= '0';
		Branch        <= '0';
		ALU_op(1)     <= '0';
		ALU_op(0)     <= '0';
		
	END IF;
	END PROCESS;
END;