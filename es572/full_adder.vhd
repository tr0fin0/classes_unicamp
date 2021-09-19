
--initial configuration

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
	PORT (Cin, x, y : IN  STD_LOGIC;
			s, Cout 	 : OUT STD_LOGIC);
END full_adder;
ARCHITTECTURE LogicFunc OR full_adder IS
BEGIN
	s <= x XOR y XOR Cin;
	Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y);
END Logic Func;