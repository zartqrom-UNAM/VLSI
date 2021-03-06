library IEEE;
use IEEE.std_logic_1164.all;

entity carta_ASM is
    port (
        clk, x, y, reset  : in std_logic;
        v1,v2,v3,v4       : out std_logic := '0'
    );
    end entity carta_ASM;
    
    architecture arqcarta_ASM of carta_ASM is
        subtype state is std_logic_vector(3 downto 0);
        signal present_state, next_state : state;
        constant e0     : state := "0000";
        constant e1     : state := "0001";
        constant e2     : state := "0010";
        constant e3     : state := "0011";
        constant e4     : state := "0100";
        constant e5     : state := "0101";
        constant e6     : state := "0110";
        constant e7     : state := "0111";
        constant e8     : state := "1000";
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
                    if x = '0' then
                        next_state <= e1;
                    end if;
                    if x = '1' then
                        next_state <= e2;
                    end if;
					v1 <= '0';
                    v2 <= '0';
                    v3 <= '0';
                    v4 <= '0';
                when e1 =>
                    if y = '0' then
                        next_state <= e3;
                    end if;
                    if y = '1' then
                        next_state <= e8;
                    end if;
                    v1 <= '1';
                    v2 <= '0';
                    v3 <= '0';
                    v4 <= '0';
                when e2 =>
                    if y = '0' then
                        next_state <= e5;
                    end if;
                    if y = '1' then
                        next_state <= e7;
                    end if;
                    v1 <= '1';
                    v2 <= '1';
                    v3 <= '0';
                    v4 <= '0';
                when e3 =>
                    next_state <= e4;
                    v1 <= '0';
                    v2 <= '0';
                    v3 <= '1';
                    v4 <= '0';
                when e4 =>
                    next_state <= e8;
                    v1 <= '0';
                    v2 <= '0';
                    v3 <= '1';
                    v4 <= '1';
                when e5 =>
                    next_state <= e6;
                    v1 <= '0';
                    v2 <= '0';
                    v3 <= '1';
                    v4 <= '1';
                when e6 =>
                    next_state <= e7;
                    v1 <= '0';
                    v2 <= '0';
                    v3 <= '1';
                    v4 <= '0';
                when e7 =>
                    next_state <= e0;
                    v1 <= '1';
                    v2 <= '0';
                    v3 <= '0';
                    v4 <= '0';
                when e8 =>
                    next_state <= e0;
                    v1 <= '0';
                    v2 <= '0';
                    v3 <= '1';
                    v4 <= '1';
                when others => next_state <= e0;
            end case;
        end process transiciones;
    end architecture arqcarta_ASM;