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
	 KEY_RST: in std_logic;
    LEDR  : out std_logic_vector(9 downto 0);
	 SW: in std_logic_vector(9 downto 0);
	 HEX0 : out std_logic_vector(6 downto 0);
	 HEX1 : out std_logic_vector(6 downto 0);
	 HEX2 : out std_logic_vector(6 downto 0);
	 HEX3 : out std_logic_vector(6 downto 0);
	 HEX4 : out std_logic_vector(6 downto 0);
	 HEX5 : out std_logic_vector(6 downto 0);
	 
	 Reg_retorno: out std_logic_vector(7 downto 0);
	 
	 	 --CPU
	 ENTRADAX_ULA: out std_logic_vector(7 downto 0);
	 ENTRADAY_ULA: out std_logic_vector(7 downto 0);
	 SAIDA_ULTA: out std_logic_vector(7 downto 0);
	 SELE_ULA: out std_logic_vector(1 downto 0);
	 -- TOP LEVEL
	 HABILITASW: out std_logic;
	 HABLITAHEX: out std_logic;
	 OUT_HEXTESTE: out std_logic_vector(3 downto 0);
	 WRITETESTE : out std_logic;
	READTESTE : out std_logic
	 
  );
  
end entity;


architecture arquitetura of Aula7 is

signal OUT_HEX0: std_logic_vector(3 downto 0);
signal OUT_HEX1: std_logic_vector(3 downto 0);
signal OUT_HEX2: std_logic_vector(3 downto 0);
signal OUT_HEX3: std_logic_vector(3 downto 0);
signal OUT_HEX4: std_logic_vector(3 downto 0);
signal OUT_HEX5: std_logic_vector(3 downto 0);

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
signal LED : std_logic_vector (9 downto 0);
signal Habilita_LED : std_logic;
signal Habilita_LED8 : std_logic;
signal Habilita_LED9 : std_logic;

signal Habilita_HEX0: std_logic;
signal Habilita_HEX1: std_logic;  
signal Habilita_HEX2: std_logic;
signal Habilita_HEX3: std_logic;
signal Habilita_HEX4: std_logic;  
signal Habilita_HEX5: std_logic;


signal Habilita_KEY0: std_logic;
signal Habilita_KEY1: std_logic;
signal Habilita_KEY2: std_logic;
signal Habilita_KEY3: std_logic;
signal Habilita_KEY_RST: std_logic;
  
  
 signal Debounce_BuffKEY0: std_logic;
 signal DebouNCE_BuffKEY1: std_logic;
 
signal Habilita_SW: std_logic;
signal Habilita_SW8: std_logic;
signal Habilita_SW9: std_logic;

 signal CLK1 : std_logic;
 signal CLK0 : std_logic;
 signal limpaKEY0: std_logic;
 signal limpaKEY1: std_logic;

signal fio_teste: std_logic_vector(7 downto 0);


begin


gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK0);

detectorSub1: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(1)), saida => CLK1);
		  
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
					  
					  Teste => fio_teste,
					  ENTRADAX_ULA => ENTRADAX_ULA,
					  ENTRADAY_ULA => ENTRADAY_ULA,
					  SAIDA_ULTA => SAIDA_ULTA,
					  SELE_ULA => SELE_ULA
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

DECODER2 : entity work.decoder3X8
          port map (entrada => Decoder_Entrada2, saida => Decoder_Saida2);
			 

		  
REG_HEX0: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX0, ENABLE => Habilita_HEX0, CLK => CLK, RST=>'0');
		
REG_HEX1: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX1, ENABLE => Habilita_HEX1, CLK => CLK, RST=>'0');
		
REG_HEX2: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX2, ENABLE => Habilita_HEX2, CLK => CLK, RST=>'0');
		
REG_HEX3: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX3, ENABLE => Habilita_HEX3, CLK => CLK, RST=>'0');
		
REG_HEX4: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX4, ENABLE => Habilita_HEX4, CLK => CLK, RST=>'0');
		
REG_HEX5: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX5, ENABLE => Habilita_HEX5, CLK => CLK, RST=>'0');
	

	
CONV_HEX0 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX0,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX0);

CONV_HEX1 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX1,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX1);

CONV_HEX2 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX2,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX2);
					  

CONV_HEX3 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX3,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX3);
					  
CONV_HEX4 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX4,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX4);

CONV_HEX5 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX5,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX5);
		


BUFF_KEY0:   entity work.buffer_3_state_1porta
        port map(entrada => Debounce_BuffKEY0, habilita =>  Habilita_KEY0, saida => LidoRam_CPU);	

BUFF_KEY1:   entity work.buffer_3_state_1porta
        port map(entrada => Debounce_BuffKEY1, habilita =>  Habilita_KEY1, saida => LidoRam_CPU);	

BUFF_KEY2:   entity work.buffer_3_state_1porta
        port map(entrada => KEY(2), habilita =>  Habilita_KEY2, saida => LidoRam_CPU);	

BUFF_KEY3:   entity work.buffer_3_state_1porta
        port map(entrada => KEY(3), habilita =>  Habilita_KEY3, saida => LidoRam_CPU);	

BUFF_KEY_RESET:   entity work.buffer_3_state_1porta
        port map(entrada => KEY_RST, habilita =>  Habilita_KEY_RST, saida => LidoRam_CPU);	
		  
		  
		  
BUFF_SW :  entity work.buffer_3_state_8_portas
        port map(entrada => SW(7 downto 0), habilita =>  Habilita_SW, saida => LidoRam_CPU);
		  
BUFF_SW8 :  entity work.buffer_3_state_1porta
        port map(entrada => SW(8), habilita =>  Habilita_SW8, saida => LidoRam_CPU);
		  
BUFF_SW9 :  entity work.buffer_3_state_1porta
        port map(entrada => SW(9), habilita =>  Habilita_SW9, saida => LidoRam_CPU);
		  

DEBOUNCE_KEY0_TESTE : entity work.DebounceMem
		  port map(saida => Debounce_BuffKEY0, clk => CLK0, rst => limpaKEY0);

DEBOUNCE_KEY1_TESTE : entity work.DebounceMem
		  port map(saida => Debounce_BuffKEY1, clk => CLK1, rst => limpaKEY1);


limpaKEY0 <= Data_Address(0) and Data_Address(1) and Data_address(2) and Data_Address(3) and Data_Address(4) and Data_Address(5) and Data_Address(6) and Data_Address(7) and Data_Address(8);
limpaKEY1 <= not(Data_Address(0) and Data_Address(1) and Data_address(2) and Data_Address(3) and Data_Address(4) and Data_Address(5) and Data_Address(6) and Data_Address(7) and Data_Address(8));  
		  
Habilita_LED <= '1' when (Decoder_Saida2(0) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';
Habilita_LED8 <= '1' when (Decoder_Saida2(1) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';
Habilita_LED9 <= '1' when (Decoder_Saida2(2) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';


Habilita_HEX0 <= Decoder_Saida1(4) and Decoder_Saida2(0) and CPU_wr and Data_Address(5);
Habilita_HEX1 <= Decoder_Saida1(4) and Decoder_Saida2(1) and CPU_wr and Data_Address(5);
Habilita_HEX2 <= Decoder_Saida1(4) and Decoder_Saida2(2) and CPU_wr and Data_Address(5);
Habilita_HEX3 <= Decoder_Saida1(4) and Decoder_Saida2(3) and CPU_wr and Data_Address(5);
Habilita_HEX4 <= Decoder_Saida1(4) and Decoder_Saida2(4) and CPU_wr and Data_Address(5);
Habilita_HEX5 <= Decoder_Saida1(4) and Decoder_Saida2(5) and CPU_wr and Data_Address(5);

Habilita_KEY0 <= Decoder_Saida1(4) and Decoder_Saida2(0) and CPU_rd and Data_Address(5);
Habilita_KEY1 <= Decoder_Saida1(4) and Decoder_Saida2(1) and CPU_rd and Data_Address(5);
Habilita_KEY2 <= Decoder_Saida1(4) and Decoder_Saida2(2) and CPU_rd and Data_Address(5);
Habilita_KEY3 <= Decoder_Saida1(4) and Decoder_Saida2(3) and CPU_rd and Data_Address(5);
Habilita_KEY_RST <= Decoder_Saida1(4) and Decoder_Saida2(4) and CPU_rd and Data_Address(5);

Habilita_SW <= Decoder_Saida1(5) and Decoder_Saida2(0) and CPU_rd and not(Data_Address(5));
Habilita_SW8 <= Decoder_Saida1(5) and Decoder_Saida2(1) and CPU_rd and not(Data_Address(5));
Habilita_SW9 <= Decoder_Saida1(5) and Decoder_Saida2(2) and CPU_rd and not(Data_Address(5));



CPU_EnderecoRam <= Data_Address(5 downto 0);
Decoder_Entrada1 <= Data_Address(8 downto 6);
Decoder_Entrada2 <= Data_Address(2 downto 0);
Habilita_Ram <= Decoder_Saida1(0);
LEDR <= LED;

HABILITASW <= Habilita_KEY0;
HABLITAHEX <= Habilita_HEX0;
OUT_HEXTESTE<= OUT_HEX0;
Reg_retorno <= fio_teste;

WRITETESTE <= CPU_wr;
READTESTE <= CPU_rd;

end architecture;