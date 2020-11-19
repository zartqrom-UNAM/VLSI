library IEEE;
use IEEE.std_logic_1164.all;

entity ASM is
port (
    clk         : in std_logic;
    x, y, reset : in std_logic;
    v1,v2,v3,v4 : out std_logic
);
end entity ASM;

architecture arqASM of ASM is
    signal clk_lento   : std_logic;
begin
    u1 : entity work.relojlento(arqrelojlento) port map (clk, clk_lento);
    u2 : entity work.carta_ASM (arqcarta_ASM) port map (clk_lento, x, y, reset, v1,v2,v3,v4);
end architecture arqASM;