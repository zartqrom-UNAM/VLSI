library IEEE;
use IEEE.std_logic_1164.all;

entity par is
port (
    clk, e, reset  : in std_logic;
    s              : out std_logic := '0'
);
end entity par;

architecture arqpar of par is
    subtype state is std_logic_vector(1 downto 0);
    signal present_state, next_state : state;
    constant e0     : state := "00";
    constant par    : state := "10";
    constant non    : state := "01";
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
            when e0 =>
                if e = '0' then
                    next_state <= e0;
                end if;
                if e = '1' then
                    next_state <= non;
                end if;
                s <= '0';
            when non =>
                if e = '0' then
                    next_state <= non;
                end if;
                if e = '1' then
                    next_state <= par;
                    s <= '1';
                end if;
                s <= '0';
            when par =>
                if e = '0' then
                    next_state <= par;
                end if;
                if e = '1' then
                    next_state <= non;
                end if;
                s <= '1';
            when others => next_state <= e0;
        end case;
    end process transiciones;
end architecture arqpar;