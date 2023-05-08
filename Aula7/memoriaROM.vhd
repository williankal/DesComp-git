library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 13;
          addrWidth: natural := 3
    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0)
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria is array(0 TO 2**addrWidth - 1) of std_logic_vector(dataWidth-1 DOWNTO 0);

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
		  

  constant LDA  : std_logic_vector(3 downto 0) := "0001";
  constant SOMA : std_logic_vector(3 downto 0) := "0010";
  constant SUB  : std_logic_vector(3 downto 0) := "0011";
  constant LDI : std_logic_vector(3 downto 0) := "0100";
  constant STA : std_logic_vector(3 downto 0) := "0101";
  constant JMP : std_logic_vector(3 downto 0) := "0110";
  constant JEQ : std_logic_vector(3 downto 0) := "0111";
  constant CEQ : std_logic_vector(3 downto 0) := "1000";
  constant JSR : std_logic_vector(3 downto 0) := "1001";
  constant RET : std_logic_vector(3 downto 0) := "1010";
  constant ANDI: std_logic_vector(3 downto 0) := "1011"; 
  constant NOP: std_logic_vector(14 downto 0) := "000000000000000";
  
  constant R0 : std_logic_vector(1 downto 0) := "00"; 
  constant R1 : std_logic_vector(1 downto 0) := "01"; 
  constant R2 : std_logic_vector(1 downto 0) := "10"; 
  constant R3 : std_logic_vector(1 downto 0) := "11"; 
	
  begin
 --Preparando os componentes


-- Segundos = REG[0] REG[1]

-- Uso geral = REG[2] REG[3]

-- Armazenanmento de valor na RAM =  MEM[10] unidades

--                                    MEM[11] dezenas

--                                    MEM[12] centenas

--                                    MEM[13] milhares

--                                    MEM[14] dez milhares

--                                    MEM[15] cent milhares

--                                    MEM[16] flag

-- Armazenamento de limite na RAM = MEM[30] unidades

--                                  MEM[31] dezenas

--                                  MEM[32] centenas

--                                  MEM[33] milhares

--                                  MEM[34] dez milhares

--                                  MEM[35] cent milhares

-- MEM[0] = 0

-- MEM[1] = 1

-- MEM[2] = 9

-- MEM[3] = 10
--SP:

--LIMPA BOTOESBACK
tmp(0) := STA & R0 & '1' & x"FF";	-- STA %R0 .CLEARKEY0 	#Limpa KEY 0
tmp(1) := STA & R0 & '1' & x"FE";	-- STA %R0 .CLEARKEY1 	#Limpa KEY 1
tmp(2) := STA & R0 & '1' & x"FD";	-- STA %R0 .CLEARKEY2 	#Limpa KEY 2
tmp(3) := STA & R0 & '1' & x"FC";	-- STA %R0 .CLEARKEY3 	#Limpa KEY 3
tmp(4) := STA & R0 & '1' & x"FB";	-- STA %R0 .CLEARFPGA 	#Limpa FPGA_RESET
tmp(5) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0

--ESCREVE 0 NOS DISPLAYS
tmp(6) := STA & R0 & '1' & x"20";	-- STA %R0 .HEX0 	#Armazena o valor 0 no HEX0
tmp(7) := STA & R0 & '1' & x"21";	-- STA %R0 .HEX1 	#Armazena o valor 0 no HEX1
tmp(8) := STA & R0 & '1' & x"22";	-- STA %R0 .HEX2 	#Armazena o valor 0 no HEX2
tmp(9) := STA & R0 & '1' & x"23";	-- STA %R0 .HEX3 	#Armazena o valor 0 no HEX3
tmp(10) := STA & R0 & '1' & x"24";	-- STA %R0 .HEX4 	#Armazena o valor 0 no HEX4
tmp(11) := STA & R0 & '1' & x"25";	-- STA %R0 .HEX5 	#Armazena o valor 0 no HEX5

--APAGANDO OS LEDS
tmp(12) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0
tmp(13) := STA & R0 & '1' & x"00";	-- STA %R0 .LED07 	#Armazena o valor 0 no LEDR7~0
tmp(14) := STA & R0 & '1' & x"01";	-- STA %R0 .LED8 	#Armazena o valor 0 no LEDR8
tmp(15) := STA & R0 & '1' & x"02";	-- STA %R0 .LED9 	#Armazena o valor 0 no LEDR9

--VARIAVEIS QUE ARMAZENAM O VALOR DO DISPLAY
tmp(16) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 
tmp(17) := STA & R0 & '0' & x"0A";	-- STA %R0 @10 	#Armazena o valor do acumulador em MEM[10](unidades)
tmp(18) := STA & R0 & '0' & x"0B";	-- STA %R0 @11 	#Armazena o valor do acumulador em MEM[11](dezenas)
tmp(19) := STA & R0 & '0' & x"0C";	-- STA %R0 @12 	#Armazena o valor do acumulador em MEM[12](centenas)
tmp(20) := STA & R0 & '0' & x"0D";	-- STA %R0 @13 	#Armazena o valor do acumulador em MEM[13](milhares)
tmp(21) := STA & R0 & '0' & x"0E";	-- STA %R0 @14 	#Armazena o valor do acumulador em MEM[14](dez milhares)
tmp(22) := STA & R0 & '0' & x"0F";	-- STA %R0 @15 	#Armazena o valor do acumulador em MEM[15](cent milhares)

--FLAG 
tmp(23) := STA & R0 & '0' & x"10";	-- STA %R0 @16 	#Armazena o valor do acumulador em MEM[16]=0 (flag)

--VARIAVEIS DE COMPARAÇÃO 
tmp(24) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0
tmp(25) := STA & R0 & '0' & x"00";	-- STA %R0 @0 	#Armaena o valor do acumulador em MEM[0]
tmp(26) := LDI & R0 & '0' & x"01";	-- LDI %R0 $1 	#Carrega acumulador com valor 1
tmp(27) := STA & R0 & '0' & x"01";	-- STA %R0 @1 	#Armazena o valor do acumulador em MEM[1]
tmp(28) := LDI & R0 & '0' & x"09";	-- LDI %R0 $9 	#Carrega acumulador com valor 9
tmp(29) := STA & R0 & '0' & x"02";	-- STA %R0 @2 	#Armazena o valor do acumulador em MEM[2]
tmp(30) := LDI & R0 & '0' & x"0A";	-- LDI %R0 $10 	#Carrega acumulador com valor 10
tmp(31) := STA & R0 & '0' & x"03";	-- STA %R0 @3 	#Armazena o valor do acumulador em MEM[3]

--ARMAZENANDO LIMITES DE CONTAGEM
tmp(32) := LDI & R0 & '0' & x"09";	-- LDI %R0 $9 	#Carrega acumulador com valor 9
tmp(33) := STA & R0 & '0' & x"1E";	-- STA %R0 @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(34) := STA & R0 & '0' & x"1F";	-- STA %R0 @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(35) := STA & R0 & '0' & x"20";	-- STA %R0 @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(36) := STA & R0 & '0' & x"21";	-- STA %R0 @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(37) := STA & R0 & '0' & x"22";	-- STA %R0 @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(38) := STA & R0 & '0' & x"23";	-- STA %R0 @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)
--L:

--CHECA KEY 0
tmp(39) := LDA & R0 & '1' & x"60";	-- LDA %R0 .KEY0 	#Carrega acumulador com o valor de KEY0
tmp(40) := ANDI & R0 & '0' & x"01";	-- ANDI %R0 $1 	#Faz a operação AND com o valor 1
tmp(41) := CEQ & R0 & '0' & x"01";	-- CEQ %R0 @1 	#OLha para se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(42) := JEQ & R0 & '0' & x"31";	-- JEQ %R0 .INCREMENTA 	#Se for igual pula para fpga_reset
--B:

--CHECA FPGA_RESET
tmp(43) := LDA & R0 & '1' & x"FA";	-- LDA %R0 .RST_FPGA 	#Carrega acumulador com o valor de FPGA_RESET
tmp(44) := ANDI & R0 & '0' & x"01";	-- ANDI %R0 $1 	#Faz a operação AND com o valor 1
tmp(45) := CEQ & R0 & '0' & x"01";	-- CEQ %R0 @1 	#Compara se o valor do acumulador é igual a 0 
tmp(46) := JEQ & R0 & '0' & x"00";	-- JEQ %R0 .SETUP 	#Se  n foi pressionado pulta para atualiza display

--ATUALIZA DISPLAY
tmp(47) := JSR & R0 & '0' & x"69";	-- JSR %R0 .ATUALIZA_DISPLAY 	#Chama a subrotina atualiza display
tmp(48) := JMP & R0 & '0' & x"27";	-- JMP %R0 .LOOP 	#Volta para o loop principal

--loop INCREMENTO
--IEMENTA:
tmp(49) := STA & R0 & '1' & x"FF";	-- STA %R0 .CLEARKEY0 	#Limpa KEY 0
--IEMENTO_UNIDADE:
tmp(50) := LDA & R0 & '0' & x"0A";	-- LDA %R0 @10 	#Carrega acumulador com o valor de MEM[10](unidades)
tmp(51) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1 	#Soma 1 ao valor das unidades
tmp(52) := CEQ & R0 & '0' & x"03";	-- CEQ %R0 @3 	#Compara com valor 10
tmp(53) := JEQ & R0 & '0' & x"38";	-- JEQ %R0 .INCREMENTO_DEZENA 	#Se for igual 10 pula para o endereço incrementar dezena(definir ainda)
tmp(54) := STA & R0 & '0' & x"0A";	-- STA %R0 @10 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(55) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK 	#VOLTA PRO loop PRINCIPAL
--IEMENTO_DEZENA:
tmp(56) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(57) := STA & R0 & '0' & x"0A";	-- STA %R0 @10 	#Salva o valor 0 em MEM[10]
tmp(58) := STA & R0 & '1' & x"20";	-- STA %R0 .HEX0 	#Salva o valor do acumulador em HEX0
tmp(59) := LDA & R0 & '0' & x"0B";	-- LDA %R0 @11 	#Carrega acumulador com o valor de MEM[1](dezenas)
tmp(60) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1 	#Soma 1 ao valor da dezenas
tmp(61) := CEQ & R0 & '0' & x"03";	-- CEQ %R0 @3 	#Compara o valor com 10
tmp(62) := JEQ & R0 & '0' & x"41";	-- JEQ %R0 .INCREMENTO_CENTENA 	#Se for igual a 10 pula para incremento centena(DEFINIR AINDA)
tmp(63) := STA & R0 & '0' & x"0B";	-- STA %R0 @11 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(64) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK 	#return
--IEMENTO_CENTENA:
tmp(65) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(66) := STA & R0 & '0' & x"0B";	-- STA %R0 @11 	#Salva o valor 0 em MEM[11]
tmp(67) := STA & R0 & '1' & x"21";	-- STA %R0 .HEX1 	#Salva o valor do acumulador em HEX1
tmp(68) := LDA & R0 & '0' & x"0C";	-- LDA %R0 @12 	#Carrega acumulador com o valor de MEM[2](centenas)
tmp(69) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1
tmp(70) := CEQ & R0 & '0' & x"03";	-- CEQ %R0 @3 	#Compara o valor com 10
tmp(71) := JEQ & R0 & '0' & x"4A";	-- JEQ %R0 .INCREMENTO_MILHAR 	#Se for igual a 10 pula para incremento milhar(DEFINIR AINDA)
tmp(72) := STA & R0 & '0' & x"0C";	-- STA %R0 @12 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(73) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK
--IEMENTO_MILHAR:
tmp(74) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(75) := STA & R0 & '0' & x"0C";	-- STA %R0 @12 	#Salva o valor 0 em MEM[12]
tmp(76) := STA & R0 & '1' & x"22";	-- STA %R0 .HEX2 	#Salva o valor do acumulador em HEX0
tmp(77) := LDA & R0 & '0' & x"0D";	-- LDA %R0 @13 	#Carrega acumulador com o valor de MEM[3](milhares)
tmp(78) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1 	#Soma 1 ao valor da milhar
tmp(79) := CEQ & R0 & '0' & x"0D";	-- CEQ %R0 @13 	#Compara o valor com 10
tmp(80) := JEQ & R0 & '0' & x"53";	-- JEQ %R0 .INCREMENTO_DEZENA_MILHAR 	#Se for igual a 10 pula para incremento dezena milhar
tmp(81) := STA & R0 & '0' & x"0D";	-- STA %R0 @13 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(82) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK
--IEMENTO_DEZENA_MILHAR:
tmp(83) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(84) := STA & R0 & '0' & x"0D";	-- STA %R0 @13 	#Salva o valor 0 em MEM[12]
tmp(85) := STA & R0 & '1' & x"23";	-- STA %R0 .HEX3 	#Salva o valor do acumulador em HEX0
tmp(86) := LDA & R0 & '0' & x"0E";	-- LDA %R0 @14 	#Carrega acumulador com o valor de MEM[4](dez milhares)
tmp(87) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1
tmp(88) := CEQ & R0 & '0' & x"03";	-- CEQ %R0 @3 	#Compara o valor com 10
tmp(89) := JEQ & R0 & '0' & x"5C";	-- JEQ %R0 .INCREMENTO_CENTENA_MILHAR 	#Se for igual a 10 pula para incremento centena milhar
tmp(90) := STA & R0 & '0' & x"0E";	-- STA %R0 @14 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(91) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK
--IEMENTO_CENTENA_MILHAR:
tmp(92) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(93) := STA & R0 & '0' & x"0E";	-- STA %R0 @14 	#Salva o valor 0 em MEM[12]
tmp(94) := STA & R0 & '1' & x"24";	-- STA %R0 .HEX4 	#Salva o valor do acumulador em HEX0
tmp(95) := LDA & R0 & '0' & x"0F";	-- LDA %R0 @15 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(96) := SOMA & R0 & '0' & x"01";	-- SOMA %R0 @1 
tmp(97) := CEQ & R0 & '0' & x"03";	-- CEQ %R0 @3 	#Compara o valor com 10
tmp(98) := JEQ & R0 & '0' & x"65";	-- JEQ %R0 .LED_OVERFLOW 	#PULA PARA LED OVERFL0W (DEFINIR AINDA)
tmp(99) := STA & R0 & '0' & x"0F";	-- STA %R0 @15 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(100) := JMP & R0 & '0' & x"2B";	-- JMP %R0 .BACK
--LOVERFLOW:
tmp(101) := LDA & R0 & '0' & x"01";	-- LDA %R0 @1 	#Carrega acumulador com 1
tmp(102) := STA & R0 & '0' & x"10";	-- STA %R0 @16 	#Salva o valor do acumulador na mem[6]
tmp(103) := STA & R0 & '1' & x"02";	-- STA %R0 .LED9 	#Acende o LED de overflow
tmp(104) := RET & R0 & '0' & x"00";	-- RET %R0

--SUBROTINA ATUALIZA DISPLAY

--HEX0
--ALIZA_DISPLAY:
tmp(105) := LDA & R0 & '0' & x"0A";	-- LDA %R0 @10
tmp(106) := STA & R0 & '1' & x"20";	-- STA %R0 .HEX0

--HEX1
tmp(107) := LDA & R0 & '0' & x"0B";	-- LDA %R0 @11
tmp(108) := STA & R0 & '1' & x"21";	-- STA %R0 .HEX1

--HEX2
tmp(109) := LDA & R0 & '0' & x"0C";	-- LDA %R0 @12
tmp(110) := STA & R0 & '1' & x"22";	-- STA %R0 .HEX2

--HEX3
tmp(111) := LDA & R0 & '0' & x"0D";	-- LDA %R0 @13
tmp(112) := STA & R0 & '1' & x"23";	-- STA %R0 .HEX3

--HEX4
tmp(113) := LDA & R0 & '0' & x"0E";	-- LDA %R0 @14
tmp(114) := STA & R0 & '1' & x"24";	-- STA %R0 .HEX4

--HEX5
tmp(115) := LDA & R0 & '0' & x"0F";	-- LDA %R0 @15
tmp(116) := STA & R0 & '1' & x"25";	-- STA %R0 .HEX5
tmp(117) := RET & R0 & '0' & x"00";	-- RET %R0

--SUBROTINA RESET FPGA
tmp(118) := STA & R0 & '1' & x"FD";	-- STA %R0 @509 	#Limpa FPGA_RESET
tmp(119) := LDA & R0 & '0' & x"0A";	-- LDA %R0 @10
tmp(120) := STA & R0 & '0' & x"00";	-- STA %R0 @0 	#Salva mem[0] com o valor do acumulador
tmp(121) := STA & R0 & '0' & x"01";	-- STA %R0 @1 	#Salva mem[1] com o valor do acumulador
tmp(122) := STA & R0 & '0' & x"02";	-- STA %R0 @2 	#Salva mem[2] com o valor do acumulador
tmp(123) := STA & R0 & '0' & x"03";	-- STA %R0 @3 	#Salva mem[3] com o valor do acumulador
tmp(124) := STA & R0 & '0' & x"04";	-- STA %R0 @4 	#Salva mem[4] com o valor do acumulador
tmp(125) := STA & R0 & '0' & x"05";	-- STA %R0 @5 	#Salva mem[5] com o valor do acumulador
tmp(126) := STA & R0 & '0' & x"06";	-- STA %R0 @6 	#Salva mem[6] com o valor do acumulador
tmp(127) := STA & R0 & '1' & x"01";	-- STA %R0 @257 	#Apaga o LED[8] de overflow
tmp(128) := STA & R0 & '1' & x"02";	-- STA %R0 @258 	#Apaga o LED[9] de limite de contagem
tmp(129) := RET & R0 & '0' & x"00";	-- RET %R0


        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;