library IEEE;
use IEEE.std_logic_1164.all;

entity Moore is
port (
    clk, reset  : in std_logic;
    led1, led2  : out std_logic_vector(6 downto 0)
);
end entity Moore;

architecture arqMoore of Moore is
    signal clkL         : std_logic;
    signal salMoore     : std_logic_vector(3 downto 0);
    
begin
    u1 : entity work.relojlento(arqrelojlento) port map (clk, clkL);
    u2 : entity work.estados(arqestados) port map (clkL, reset, salMoore);
    u3 : entity work.bcd7seg(arqbcd7seg) port map (salMoore, led1, led2);
end architecture arqMoore;