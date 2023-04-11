library IEEE;
use ieee.std_logic_1164.all;

entity buffer_3_state_1porta is
    port(
        entrada  : in std_logic;
        habilita : in std_logic;
        saida    : out std_logic_vector(7 downto 0));
end;

architecture comportamento of buffer_3_state_1porta is

begin
    saida <= ("00000001" ) when (habilita = '1') else "ZZZZZZZZ";
end;