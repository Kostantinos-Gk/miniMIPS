--MIPS Part_0
--Multiplexer 4 to 1
--24/05/2020, Konstantinos Gkousaris, 711171073, UniWA
--0.1_mux2to1.vhd

LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mips_mux2to1gen IS 
GENERIC (
	dw : natural := 4); 
PORT(
	a : IN STD_LOGIC_VECTOR(dw-1 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(dw-1 DOWNTO 0);
	s : IN STD_LOGIC;
	d : OUT STD_LOGIC_VECTOR(4 DOWNTO 1));
END mips_mux2to1gen;

ARCHITECTURE dataflow OF mips_mux2to1gen IS
BEGIN 
	d <= a when (s='0') else b;
END dataflow;