library IEEE;
use IEEE.std_logic_1164.all;

entity cand is
    port (
        a,b : in std_logic;
        c : out std_logic
    );
end entity cand;

architecture arqcand of cand is
begin
    c <= a and b; 
end architecture arqcand;