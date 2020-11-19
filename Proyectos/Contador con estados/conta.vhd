library IEEE;
use IEEE.std_logic_1164.all;

entity conta is
port (
    clk, reset : in std_logic;
    salMoore : out std_logic_vector(1 downto 0)
);
end entity conta;

architecture arqconta of conta is
    subtype state is std_logic_vector(1 downto 0);
    signal present_state, next_state : state;
    constant e0     : state := "00";
    constant e1     : state := "01";
    constant e2     : state := "10";
    constant e3     : state := "11";
begin
    estados: process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                present_state <= e0;
            else
                present_state <= next_state;
            end if;
        end if;
    end process estados;
    transiciones: process(present_state)
    begin
        case present_state is
            when e0 => next_state <= e1;
            when e1 => next_state <= e2;
            when e2 => next_state <= e3;        
            when others => next_state <= e0;        
        end case;
        salMoore <= present_state;
    end process transiciones;
end architecture arqconta;