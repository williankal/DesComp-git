library ieee;
use ieee.std_logic_1164.all;

entity CPU is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 8;
        simulacao : boolean := FALSE-- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 Data_Address: out std_logic_vector(8 downto 0);
	 Data_OUT: out std_logic_vector(7 downto 0);
	 Data_IN: in std_logic_vector(7 downto 0);
	 ROM_Address: out std_logic_vector( 8 downto 0);
	 ROM_InstructionIN: in std_logic_vector (12 downto 0);
	 we: out std_logic;
	 re: out std_logic;
	 Teste: out std_logic_vector(7 downto 0);
	 
	 
	 --CPU
	 ENTRADAX_ULA: out std_logic_vector(7 downto 0);
	 ENTRADAY_ULA: out std_logic_vector(7 downto 0);
	 SAIDA_ULTA: out std_logic_vector(7 downto 0);
	 SELE_ULA: out std_logic_vector(1 downto 0)


  );
end entity;


architecture arquitetura of CPU is

  signal CLK : std_logic;
  signal MUX_REG1 : std_logic_vector (larguraDados-1 downto 0);
  signal REG1_ULA_A : std_logic_vector (7 downto 0);
  signal Saida_ULA : std_logic_vector (7 downto 0);
  signal Sinais_Controle : std_logic_vector (11 downto 0);
  signal Endereco : std_logic_vector (8 downto 0);
  signal proxPC : std_logic_vector (8 downto 0);
  signal SelMUX : std_logic;
  signal Habilita_A : std_logic;
  signal Reset_A : std_logic;
  signal hab_Leituramem:std_logic;
  signal hab_Escritamem: std_logic;
  signal RamOut_MUX: std_logic_vector(7 downto 0);
  signal SaidaMux_ULAB: std_logic_vector(7 downto 0);
  signal DadosROM : std_logic_vector (12 downto 0);
  signal Operacao_Ula : std_logic_vector(1 downto 0);
  signal habLeituraMem : std_logic;
  signal habEscritaMem : std_logic;
  signal Endereco_Ram : std_logic_vector(7 downto 0);
  signal Valor_Imediato : std_logic_vector(larguraDados - 1 downto 0);
  signal Decoder_Control : std_logic_vector (3 downto 0);
  signal MuxRetorno_PC : std_logic_vector (larguraDados downto 0);
  signal Incrementa_Mux_Retorno : std_logic_vector (larguraDados downto 0);
  signal REGRetorno_MUX: std_logic_vector ( 8 downto 0);
  signal retorno_EntradaC: std_logic_vector ( larguraDados downto 0);
  signal Destino : std_logic_vector (8 downto 0);
  signal ULA_Flag: std_logic;
  signal Sel_Desvio: std_logic_vector (1 downto 0);
  signal empty: std_logic_vector(larguraDados downto 0);
  signal Habilita_Escrita_Retorno: std_logic;
  signal FLAG: std_logic;
  signal JMP: std_logic;
  signal RET: std_logic;
  signal JSR: std_logic;
  signal JEQ: std_logic;
  signal habFlagIgual: std_logic;
  signal EnderecoRam: std_logic_vector (5 downto 0);

begin
CLK <= CLOCK_50;
-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => 8)
        port map( entradaA_MUX => Data_IN,
                 entradaB_MUX =>  ROM_InstructionIN(7 downto 0) ,
                 seletor_MUX => SelMUX,
                 saida_MUX => SaidaMux_ULAB);

MUX2 :  entity work.muxGenerico4x1  generic map (larguraDados => 9)
        port map( entradaA_MUX => Incrementa_Mux_Retorno,
                 entradaB_MUX =>  Destino,
					  entradaC_MUX => retorno_EntradaC,
					  entradaD_MUX => empty,
                 seletor_MUX => Sel_Desvio,
                 saida_MUX => MuxRetorno_PC);
					  

-- O port map completo do Acumulador.
REGA : entity work.registradorGenerico   generic map (larguraDados => 8)
          port map (DIN => Saida_ULA, DOUT => REG1_ULA_A, ENABLE => Habilita_A, CLK => CLK, RST => Reset_A);

REGRetorno: entity work.registradorGenerico   generic map (larguraDados => 9)
          port map (DIN => Incrementa_Mux_Retorno, DOUT => retorno_EntradaC, ENABLE => Habilita_Escrita_Retorno, CLK => CLK, RST => '0');
			 
REGFlag: entity work.registradorBooleano   generic 	map (larguraDados => 1)
          port map (DIN => ULA_Flag, DOUT => FLAG, ENABLE => habFlagIgual, CLK => CLK, RST => '0');

-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 9)
          port map (DIN => MuxRetorno_PC, DOUT => Endereco, ENABLE => '1', CLK => CLK, RST => '0');

			 

incrementaPC :  entity work.somaConstante  generic map (larguraDados => 9, constante => 1)
        port map( entrada => Endereco, saida => Incrementa_Mux_Retorno);
		  
logicaDesvio : entity work.logicDesvio 
						port map(JMP => JMP, FLAG => FLAG, JEQ => JEQ, JSR => JSR, RET => RET, Sel_Desvio => Sel_Desvio);

-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 8)
          port map (entradaA => REG1_ULA_A, entradaB => SaidaMux_ULAB, saida => Saida_ULA, flag => ULA_Flag, seletor => Operacao_ULA);

-- Falta acertar o conteudo da ROM (no arquivo memoriaROM.vhd)

DECODER:  entity work.decoderInstru port map( opcode => Decoder_Control,
                 saida => Sinais_Controle);
					  

Habilita_Escrita_Retorno <= Sinais_Controle(11);
JMP <= Sinais_Controle(10);
RET <= Sinais_Controle(9);
JSR <= Sinais_Controle(8);
JEQ <= Sinais_Controle(7);
selMUX <= Sinais_Controle(6);
Habilita_A <= Sinais_Controle(5);
Operacao_ULA <= Sinais_Controle(4 downto 3);	
habFlagIgual <= Sinais_Controle(2);
habLeituraMem <= Sinais_Controle(1);
habEscritaMem <= Sinais_Controle(0);

Valor_Imediato <= ROM_InstructionIN(7 downto 0);
Destino <=  ROM_InstructionIN(8 downto 0);
Decoder_Control <= ROM_InstructionIN(12 downto 9);
EnderecoRam <= ROM_InstructionIN(5 downto 0);
Data_OUT <= REG1_ULA_A;
ROM_Address <= Endereco;
we <= habEscritaMem;
re <= habLeituraMem;
Teste <= SaidaMux_ULAB;
Data_Address <=ROM_InstructionIN(8 downto 0);

ENTRADAX_ULA <= REG1_ULA_A;
ENTRADAY_ULA <= SaidaMux_ULAB;
SAIDA_ULTA <= Saida_ULA;
SELE_ULA <= Operacao_ULA;
	 
end architecture;