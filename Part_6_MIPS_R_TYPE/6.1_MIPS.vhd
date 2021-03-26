--MIPS Part_6
--MIPS, main implementation 
--14/05/2020, Konstantinos Gkousaris, 711171073, UniWA
--Architecture based, code base on implemantation of book
--"?????????? ??? ???????? ???????? ??????????",Third Edition, Ioannis Vogiatzis

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mips IS PORT (
	clk 	: IN STD_LOGIC;
	Reset 	: IN STD_LOGIC;
	outMIPS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END mips;

ARCHITECTURE mips_ar_1 OF mips IS
--for implementation to execute the R type instruction we need the components:
--ALU 32bit
--Register File 
--Instruction Memory
--Control Unit
--ALU Control Unit
--Program Counter(PC)

--(1)ALU 32bit
COMPONENT alu32 PORT (
	aluin1 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	aluin2 	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	aluctrl	: IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	
	aluout 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	zero   	: OUT STD_LOGIC);
END COMPONENT;

--(2)Register File
COMPONENT registerfile_full_for_MIPS PORT(
	Datain 	 : IN STD_LOGIC_VECTOR(31 downto 0);
	rAddr1	 : IN STD_LOGIC_VECTOR(4 downto 0);
        rAddr2	 : IN STD_LOGIC_VECTOR(4 downto 0);
        wAddr 	 : IN STD_LOGIC_VECTOR(4 downto 0);
        we 	 : IN STD_LOGIC;
        clk 	 : IN STD_LOGIC;
        reset 	 : IN STD_LOGIC;
        Dataout1 : OUT STD_LOGIC_VECTOR(31 downto 0);
	Dataout2 : OUT STD_LOGIC_VECTOR(31 downto 0));
END COMPONENT;

--(3)Instruction Memory
COMPONENT instrMemoryMIPS PORT (
	Addr 	: IN STD_LOGIC_VECTOR(3 downto 0);
	C 	: OUT STD_LOGIC_VECTOR(31 downto 0));
END COMPONENT;

--(4)Control Unit
COMPONENT Control IS PORT (
	OP_5to0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	RegDst, RegWrite, ALUSrc, Branch : OUT STD_LOGIC;
	MemRead, MemWrite, MemtoReg : OUT STD_LOGIC;
	ALU_op: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END COMPONENT;

--(5)ALU Control Unit
COMPONENT Alu_Control PORT(
	Funct : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	ALU_op  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Operation : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

--(6)Full Adder -- 4bit 
COMPONENT Fulladder32bit PORT (
	in1, in2  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	carryin   : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	sum	  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	carryout  : OUT STD_LOGIC);
END  COMPONENT;

--(7)Program Counter --4bit
COMPONENT programCounter PORT (
	inPC 	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	outPC	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	clk     : IN STD_LOGIC;
	reset   : IN STD_LOGIC);
END COMPONENT;

--signal between blocks
--first step design, PC,FA,IM with out to RegFile
signal ProgramC_to_FA_IM  : std_logic_vector(3 DOWNTO 0):=(others => '0'); --signal from the output of PC-->FA/IM
signal FullAdder_to_PC	  : std_logic_vector(3 DOWNTO 0):= (others => '0'); --signal the result of Fulladder to PC
signal INST_MEM_out       : std_logic_vector(31 DOWNTO 0):= (others => '0'); --SIGNAL which is result from Instruction Memory

--second step design control Unit
signal RegWrite_S 	: std_logic:='1';
signal ALUSrc_S 	: std_logic:='0';
signal MemWrite_S	: std_logic:='0';
signal MemRead_S        : std_logic:='0';
signal RegDist_S        : std_logic:='0';
signal MemToReg_S       : std_logic:='0';
signal Branch_S         : std_logic:='0';
signal ALU_op_S		: std_logic_vector(1 DOWNTO 0):=(others => '0');  --out to ALU_control

--third step design RegisterFile
signal DataOut1_S	: std_logic_vector(31 DOWNTO 0):=(others => '0'); --SIGNAL from register to ALUin1
signal DataOut2_S	: std_logic_vector(31 DOWNTO 0):=(others => '0'); --SIGNAL from register to ALUin2


--fourth step design ALU
signal ALUresult	  : std_logic_vector(31 DOWNTO 0):=(others => '0'); --SIGNAL from ALU to REGFILE 
signal zero_Signal	  : std_logic:='0';			   	    --ZERO
signal ALU_Control_Signal : std_logic_vector(3 DOWNTO 0):=(others => '0');  --SIGNAL from Alu Control to ALU32
signal ALUoperation       : std_logic_vector(1 DOWNTO 0):=(others => '0');  --SIGNAL For ALU Operations


BEGIN



FULLADDER_CON	    : Fulladder32bit PORT MAP(
			in1        => ProgramC_to_FA_IM,
			in2        => "0001",
			carryin    => "0",
			sum        => FullAdder_to_PC
			);	
INSTMEM_CON 	    : instrMemoryMIPS PORT MAP(
			Addr      =>  ProgramC_to_FA_IM,
			C         =>  INST_MEM_out --outMIPS
			);
PROGRAMCOUNTER_CON  : programCounter PORT MAP(
			inPC     => FullAdder_to_PC,
			outPC    => ProgramC_to_FA_IM,
			clk      => clk,
			reset    => reset    
			);
REGISTER_FILE_CON : registerfile_full_for_MIPS PORT MAP (
			Datain    => ALUresult, 
			rAddr1    => INST_MEM_out(25 DOWNTO 21), 
			rAddr2	  => INST_MEM_out(20 DOWNTO 16), 
			wAddr     => INST_MEM_out(15 DOWNTO 11), 
			we        => RegWrite_S, 
			clk       => clk, 
			Reset     => Reset, 
			Dataout1  => DataOut1_S, 
			Dataout2  => DataOut2_S
			);			
CONTROLUNIT_CON   : Control PORT MAP(
			--CLK	=> clk,
			OP_5to0   => INST_MEM_out(31 DOWNTO 26),	--it is used
			RegDst	  => RegDist_S, 
			RegWrite  => RegWrite_S, 				--it is used
			ALUSrc	  => ALUSrc_S, 				
			Branch	  => Branch_S,
			MemRead	  => MemRead_S, 	
		        MemWrite  => MemWrite_S, 
			MemtoReg  => MemtoReg_S,
			ALU_op    => ALU_op_S				--it is used
			);

ALU_CONTROL_CON   : Alu_Control PORT MAP(
			Funct       =>  INST_MEM_out(5 DOWNTO 0),
			ALU_op      =>  ALU_op_S, 
			Operation   =>  ALU_Control_Signal
			);

ALU_32_CONNECCT   : alu32 PORT MAP (
			aluin1      => DataOut1_S, 	
			aluin2      => DataOut2_S, 
			aluctrl     => ALU_Control_Signal, 
			aluout      => ALUresult,
			zero        => zero_Signal
			);

outMIPS <= ALUresult;

END;