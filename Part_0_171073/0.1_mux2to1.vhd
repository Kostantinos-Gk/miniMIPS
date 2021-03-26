--MIPS Part_0
--Multiplexer 2 to 1
--24/05/2020, Konstantinos Gkousaris, 711171073, UniWA--


LIBRARY IEEE;
USE ieee.std_logic_1164.all;

--declare entity mux 2 to 1
ENTITY mip_mux2to1 IS PORT (
	a: IN STD_LOGIC;  --first input
	b: IN STD_LOGIC;  --second input
	s: IN STD_LOGIC;  --selection input
	d: OUT STD_LOGIC); --output
END mip_mux2to1;

ARCHITECTURE dataflow OF mip_mux2to1 IS
BEGIN 
	d <= a when (s='0') else b;
END dataflow; 