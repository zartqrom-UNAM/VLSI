LIBRARY ieee;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY decseg IS
PORT( 
	clk, reset : IN std_logic;
	clkUniMin : out std_logic := '0';
	salida : OUT std_logic_vector(3 DOWNTO 0)
);
END decseg;

ARCHITECTURE arqdecseg OF decseg IS
BEGIN
	PROCESS (reset, clk)
	VARIABLE cuenta : std_logic_vector (3 DOWNTO 0) := "0000";
	BEGIN
		IF rising_edge (clk) THEN
			IF cuenta = "0101" THEN
				cuenta := "0000";
				clkUniMin <= '1';
			ELSE
				cuenta := cuenta + 1;
				--clkUniMin <= '0';
			END IF;
		END IF;
		IF reset = '0' THEN
			cuenta := "0000";
		END IF;
	salida <= cuenta;
	END PROCESS;
END arqdecseg;