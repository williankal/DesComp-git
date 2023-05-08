LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity divisorGenerico_e_Interface is
   port(clk      :   in std_logic;
      habilitaLeitura : in std_logic;
      limpaLeitura : in std_logic;
		escolheBase : in std_logic;
      leituraUmSegundo :   out std_logic_vector(7 downto 0)
   );
end entity;

architecture interface of divisorGenerico_e_Interface is
  signal sinalUmSegundo : std_logic;
  signal saidaclk_reg1seg : std_logic;
  signal saidaclk_reg1seg_rapido: std_logic;
  signal saidaclk_base: std_logic_vector(7 downto 0);
begin

baseTempo: entity work.divisorGenerico
           generic map (divisor => 25000000)   -- divide por 10.
           port map (clk => clk, saida_clk => saidaclk_reg1seg);

baseTempoRapida: entity work.divisorGenerico
           generic map (divisor => 40000)   -- divide por 10.
           port map (clk => clk, saida_clk => saidaclk_reg1seg_rapido);
			  
MUX_CLOCK : entity work.muxGenerico2x1 generic map (larguraDados => 8)
			port map(
				entradaA_MUX =>  "0000000"  & saidaclk_reg1seg,
				entradaB_MUX =>  "0000000"  & saidaclk_reg1seg_rapido,
				seletor_MUX => escolheBase,
				saida_MUX => saidaclk_base
			);

			  
registraUmSegundo: entity work.registradorBooleano
   port map (DIN => '1', DOUT => sinalUmSegundo,
         ENABLE => '1', CLK => saidaclk_base(0),
         RST => limpaLeitura);

-- Faz o tristate de saida:
leituraUmSegundo <=  "0000000" & sinalUmSegundo when habilitaLeitura = '1' else "ZZZZZZZZ";

end architecture interface;