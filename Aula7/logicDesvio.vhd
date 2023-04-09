library ieee;
use ieee.std_logic_1164.all;

entity logicDesvio is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
    JMP, FLAG, JEQ, JSR, RET : in std_logic;
	 Sel_Desvio: out std_logic_vector(1 downto 0)
  );
end entity;

architecture comportamento of logicDesvio is
  begin
  
Sel_Desvio <= "01" when (JMP or JSR or(FLAG and JEQ)) else
					  "10" when RET else
					  "00";

	 
end architecture;