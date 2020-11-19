library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1 is
    port (
        a,b,sel  : in std_logic;
        sal      : out std_logic
    );
end entity mux2x1;

architecture arqmux2x1 of mux2x1 is
begin
    with sel select
        sal <=  a   when '0',
                b   when '1';
end architecture arqmux2x1;