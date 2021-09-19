
--initial configuration

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ripple_carry_adder IS
	GENERIC(N : INTEGER := 8);
	PORT ( A,B  : IN  STD_LOGIC_VECTOR(N-1 downto 0);
			 Cin  : IN  STD_LOGIC;
			 Soma : OUT STD_LOGIC_VECTOR(N-1 downto 0);
			 Cout : OUT STD_LOGIC);
END ripple_carry_adder;

ARCHITECTURE structural OF ripple_carry_adder IS

	COMPONENT full_adder IS
		PORT ( Cin, x, y, : IN STD_LOGIC;
					S, Cout  : OUT STD_LOGIC);
	END COMPONENT;
	
	signal emp_carry : std_logic_vector(N-1 downto 0);
	
	BEGIN
		add0 : full_adder port map (Cin , A(0), B(0), Soma(0), temp_carry(0));
		
		GEN_REG: for I in 1 to n-1 generae
			ADDX : full_adder port map (temp_carry(I-1), A(I), B(I), Soma(I), temp_carry(I));
		END GENERATE GEN_REG;
		
		Cout <= temp_carry(N-1);
		
END structural;
