LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY bcd7seg IS
PORT(	bcd : IN std_logic_vector(3 DOWNTO 0);
		led : OUT std_logic_vector(6 DOWNTO 0)
);
END bcd7seg;
ARCHITECTURE arqbcd7seg OF bcd7seg IS
BEGIN
	WITH bcd SELECT
	led <=	"1000000" WHEN "0000",
				"1111001" WHEN "0001",
				"0100100" WHEN "0010",
				"0110000" WHEN "0011",
				"0011001" WHEN "0100",
				"0010010" WHEN "0101",
				"0000010" WHEN "0110",
				"1111000" WHEN "0111",
				"0000000" WHEN "1000",
				"0011000" WHEN "1001",
				"0111111" WHEN OTHERS;
END arqbcd7seg;