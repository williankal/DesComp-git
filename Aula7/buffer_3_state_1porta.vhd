library IEEE;
use ieee.std_logic_1164.all;

entity buffer_3_state_1porta is
    port(
        entrada  : in std_logic;
        habilita : in std_logic;
        saida    : out std_logic);

end entity;

architecture comportamento of buffer_3_state_1porta is

begin
    saida <= (entrada) when (habilita = '1') else 'Z';
end;