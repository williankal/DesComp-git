library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULASomaSub is
    generic ( larguraDados : natural := 4 );
    port (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR(1 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0);
		flag: out std_logic
		
    );
end entity;

architecture comportamento of ULASomaSub is
   signal soma :      STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal subtracao : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal andi : STD_LOGIC_VECTOR((larguraDados-1) downto 0);

	signal passa :STD_LOGIC_VECTOR((larguraDados-1) downto 0);
    begin
      soma      <= STD_LOGIC_VECTOR(unsigned(entradaA) + unsigned(entradaB));
      subtracao <= STD_LOGIC_VECTOR(unsigned(entradaA) - unsigned(entradaB));
		andi <= (entradaA(7) and entradaB(7)) & (entradaA(6) and entradaB(6)) & (entradaA(5) and entradaB(5)) & (entradaA(4) and entradaB(4)) & (entradaA(3) and entradaB(3)) & (entradaA(2) and entradaB(2)) & (entradaA(1) and entradaB(1)) & (entradaA(0) and entradaB(0));		passa <= entradaB;
      
		
      saida <= soma when (seletor = "01") else 
		subtracao when(seletor = "00") else
      andi when (seletor = "11") else
		passa;
		flag <= not (Saida(7) or Saida(6) or Saida(5) or Saida(4) or Saida(3) or Saida(2) or Saida(1) or Saida(0));
		
end architecture;