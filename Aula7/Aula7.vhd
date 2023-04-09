library ieee;
use ieee.std_logic_1164.all;

entity Aula7 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 8;
        simulacao : boolean := TRUE-- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
    LEDR  : out std_logic_vector(9 downto 0);
	 Reg_retorno: out std_logic_vector( 7 downto 0)
	 
  );
end entity;


architecture arquitetura of Aula7 is

signal CPU_EnderecoRam: std_logic_vector(5 downto 0);
signal CPU_EscritoRam: std_logic_vector (7 downto 0);
signal LidoRam_CPU: std_logic_vector(7 downto 0);
signal CPU_wr: std_logic;
signal CPU_rd: std_logic;
signal CPU_EnderecoROM: std_logic_vector(8 downto 0);
signal DadoROM_CPU: std_logic_vector(12 downto 0);
signal Habilita_Ram: std_logic;
signal Data_Address: std_logic_vector(8 downto 0);
signal clk: std_logic;
signal Decoder_Entrada1 : std_logic_vector (2 downto 0);
signal Decoder_Entrada2 : std_logic_vector (2 downto 0);
signal Decoder_Saida1 : std_logic_vector (7 downto 0);
signal Decoder_Saida2: std_logic_vector(7 downto 0);
signal ROM_Address: std_logic_vector(8 downto 0);
signal LED : std_logic_vector (9 downto 0);
signal Habilita_LED : std_logic;
signal Habilita_LED8 : std_logic;
signal Habilita_LED9 : std_logic;
signal fio_teste: std_logic_vector(7 downto 0);

begin
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;


-- O port map completo do MUX.
CPU:  entity work.CPU  
        port map(CLOCK_50 => clk,
					  KEY => KEY,
					  Data_Address => Data_Address,
                 Data_OUT =>  CPU_EscritoRam,
                 Data_IN => LidoRam_CPU,
                 ROM_Address => CPU_EnderecoROM,
					  ROM_InstructionIN => DadoROM_CPU,
					  we => CPU_wr,
					  re => CPU_rd,
					  Teste => fio_teste
					  );
					  
RAM : entity work.memoriaRAM   generic map (dataWidth => 8, addrWidth => 6)
          port map (addr => CPU_EnderecoRam, we => CPU_wr, re => CPU_rd, habilita  => Habilita_Ram, dado_in => CPU_EscritoRam, dado_out =>  LidoRam_CPU, clk => CLK);

ROM1 : entity work.memoriaROM   generic map (dataWidth => 13, addrWidth => 9)
          port map (Endereco =>CPU_EnderecoROM, Dado => DadoROM_CPU);
			 
LED_COMBO : entity work.registradorGenerico   generic map (larguraDados => 8)
		 port map (DIN => CPU_EscritoRam, DOUT => LED(7 downto 0), ENABLE => Habilita_LED, CLK => CLK, RST => '0');
			 
LEDR8 : entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => CPU_EscritoRam(0), DOUT => LED(8), ENABLE => Habilita_LED8, CLK => CLK, RST => '0');
			 
LEDR9 :	entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => CPU_EscritoRam(0), DOUT => LED(9), ENABLE => Habilita_LED9, CLK => CLK, RST => '0');
			 
DECODER1 :  entity work.decoder3x8
        port map( entrada => Decoder_Entrada1,
                 saida => Decoder_Saida1);

DECODER2 : entity work.Decoder3X8
          port map (entrada => Decoder_Entrada2, saida => Decoder_Saida2);

Habilita_LED <= '1' when (Decoder_Saida2(0) and Decoder_Saida1(4) and CPU_wr) else '0';
Habilita_LED8 <= '1' when (Decoder_Saida2(1) and Decoder_Saida1(4) and CPU_wr) else '0';
Habilita_LED9 <= '1' when (Decoder_Saida2(2) and Decoder_Saida1(4) and CPU_wr) else '0';

CPU_EnderecoRam <= Data_Address(5 downto 0);
Decoder_Entrada1 <= Data_Address(8 downto 6);
Decoder_Entrada2 <= Data_Address(2 downto 0);
Habilita_Ram <= Decoder_Saida1(0);
Reg_retorno <= fio_teste;
ROM_Address <= CPU_EnderecoROM;
LEDR <= LED;

end architecture;