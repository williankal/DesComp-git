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
  constant NOP: std_logic_vector(12 downto 0) := "0000000000000";
  
  begin
   


--#MAPA MEMORIA

--#MEM[10] = UNIDADES

--#MEM[11] = DEZENAS

--#MEM[12] = CENTENAS

--#MEM[13] = MILHARES

--#MEM[14] = DEZ MILHARES

--#MEM[15] = CENT MILHARES

--#MEM[16] = FLAG

--#VALORES DE COMPARAÇÕES:

--#MEM[0] = 0

--#MEM[1] = 1

--#MEM[2] = 9

--#MEM[3] = 10

--#LIMITES DE CONTAGEM:

--#MEM[30] = UNIDADES

--#MEM[31] = DEZENAS

--#MEM[32] = CENTENAS

--#MEM[33] = MILHARES

--#MEM[34] = DEZ MILHARES

--#MEM[35] = CENT MILHARES

--#KEYS:

--#MEM[352] = KEY0

--#MEM[353] = KEY1

--#MEM[356] = FPGA_RESET

--#LIMPEZA DE LEITURA

--#MEM[511] = KEY0

--#MEM[510] = KEY1

--#MEM[509] = FPGA_RESET

--#DISPLAYS:

--#MEM[288] = HEX0

--#MEM[289] = HEX1

--#MEM[290] = HEX2

--#MEM[291] = HEX3

--#MEM[292] = HEX4

--#MEM[293] = HEX5

--#LEDS:

--#MEM[256] = LEDR7~0

--#MEM[257] = LEDR8

--#MEM[258] = LEDR9

--#SETUP INICIAL
tmp(0) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0

--#ESCREVE 0 NOS DISPLAYS
tmp(1) := STA & '1' & x"20";	-- STA @288 	#Armazena o valor 0 no HEX0
tmp(2) := STA & '1' & x"21";	-- STA @289 	#Armazena o valor 0 no HEX1
tmp(3) := STA & '1' & x"22";	-- STA @290 	#Armazena o valor 0 no HEX2
tmp(4) := STA & '1' & x"23";	-- STA @291 	#Armazena o valor 0 no HEX3
tmp(5) := STA & '1' & x"24";	-- STA @292 	#Armazena o valor 0 no HEX4
tmp(6) := STA & '1' & x"25";	-- STA @293 	#Armazena o valor 0 no HEX5

--#APAGANDO OS LEDS
tmp(7) := LDI & '0' & x"00";	-- LDI $0
tmp(8) := STA & '1' & x"00";	-- STA @256 	#Armazena o valor 0 no LEDR7~0
tmp(9) := STA & '1' & x"01";	-- STA @257 	#Armazena o valor 0 no LEDR8
tmp(10) := STA & '1' & x"02";	-- STA @258 	#Armazena o valor 0 no LEDR9

--#VARIAVEIS QUE ARMAZENAM O VALOR DO DISPLAY
tmp(11) := LDI & '0' & x"00";	-- LDI $0 
tmp(12) := STA & '0' & x"0A";	-- STA @10 	#Armazena o valor do acumulador em MEM[0](unidades)
tmp(13) := STA & '0' & x"0B";	-- STA @11 	#Armazena o valor do acumulador em MEM[1](dezenas)
tmp(14) := STA & '0' & x"0C";	-- STA @12 	#Armazena o valor do acumulador em MEM[2](centenas)
tmp(15) := STA & '0' & x"0D";	-- STA @13 	#Armazena o valor do acumulador em MEM[3](milhares)
tmp(16) := STA & '0' & x"0E";	-- STA @14 	#Armazena o valor do acumulador em MEM[4](dez milhares)
tmp(17) := STA & '0' & x"0F";	-- STA @15 	#Armazena o valor do acumulador em MEM[5](cent milhares)

--#FLAG 
tmp(18) := STA & '0' & x"10";	-- STA @16 	#Armazena o valor do acumulador em MEM[16]=0 (flag)

--#VARIAVEIS DE COMPARAÇÃO 
tmp(19) := LDI & '0' & x"00";	-- LDI $0
tmp(20) := STA & '0' & x"00";	-- STA @0 	#Armaena o valor do acumulador em MEM[0]
tmp(21) := LDI & '0' & x"01";	-- LDI $1 	#Carrega acumulador com valor 1
tmp(22) := STA & '0' & x"01";	-- STA @1 	#Armazena o valor do acumulador em MEM[1]
tmp(23) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(24) := STA & '0' & x"02";	-- STA @2 	#Armazena o valor do acumulador em MEM[2]
tmp(25) := LDI & '0' & x"0A";	-- LDI $10 	#Carrega acumulador com valor 10
tmp(26) := STA & '0' & x"03";	-- STA @3 	#Armazena o valor do acumulador em MEM[3]

--#ARMAZENANDO LIMITES DE CONTAGEM 
tmp(27) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(28) := STA & '0' & x"1E";	-- STA @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(29) := STA & '0' & x"1F";	-- STA @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(30) := STA & '0' & x"20";	-- STA @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(31) := STA & '0' & x"21";	-- STA @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(32) := STA & '0' & x"22";	-- STA @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(33) := STA & '0' & x"23";	-- STA @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)

--#LOOP PRINCIPAL => CHECA KEY 0/1/FPGA

--#CHECA FLAG
tmp(34) := LDA & '0' & x"06";	-- LDA @6 	#Carrega acumulador com valor da flag MEM[6]
tmp(35) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se a flag MEM[6] está ativa
tmp(36) := JEQ & '0' & x"29";	-- JEQ @41 	#Se for igual, pula para o endereço (CHECA KEY1[pula key0])

--#CHECA KEY 0
tmp(37) := LDA & '1' & x"60";	-- LDA @352 	#Carrega acumulador com o valor de KEY0
tmp(38) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(39) := JEQ & '0' & x"2A";	-- JEQ @42  	#Se não for igual pula para key1
tmp(40) := JSR & '0' & x"36";	-- JSR @54 	#Pula para a subrotina de incremento

--#CHECA KEY 1
tmp(41) := LDA & '1' & x"61";	-- LDA @353 	#Carrega acumulador com o valor de KEY1
tmp(42) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 1 (Se key1 foi pressionado)
tmp(43) := JEQ & '0' & x"2D";	-- JEQ @45 	#PULA PARA CHECA LIMITPULA PARA CHECA LIMITEE DE CONTAGEM(DEFINIR AINDA) 
tmp(44) := JSR & '0' & x"9C";	-- JSR @156   	#PULA PARA DEFINIR LIMITE
tmp(45) := JSR & '0' & x"80";	-- JSR @128 	#pula para checar limite(definir ainda)

--#CHECA FPGA_RESET
tmp(46) := LDA & '1' & x"64";	-- LDA @356 	#Carrega acumulador com o valor de FPGA_RESET
tmp(47) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se o valor do acumulador é igual a 0 
tmp(48) := JEQ & '0' & x"34";	-- JEQ @52 	#Se foi pressionado pulta para atualiza display
tmp(49) := JSR & '0' & x"74";	-- JSR @116 	#Pula para subrotina: RESETAR PLACA(DEFINIR AINDA)

--#ATUALIZA DISPLAY
tmp(50) := JSR & '0' & x"67";	-- JSR @103 	#Pula para subrotina: ATUALIZA DISPLAY(DEFINIR AINDA)
tmp(51) := JMP & '0' & x"22";	-- JMP @34 	#Volta para o loop principal

--#LOOP INCREMENTO 
tmp(52) := STA & '1' & x"FF";	-- STA @511 	#Limpa KEY 0

--#INCREMENTO UNIDADE
tmp(53) := LDA & '0' & x"0A";	-- LDA @10 	#Carrega acumulador com o valor de MEM[10](unidades)
tmp(54) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor das unidades
tmp(55) := STA & '0' & x"00";	-- STA @0
tmp(56) := CEQ & '0' & x"03";	-- CEQ @3
tmp(57) := JEQ & '0' & x"3B";	-- JEQ @59	#Se for igual 10 pula para o endereço incrementar dezena(definir ainda)
tmp(58) := RET & '0' & x"00";	-- RET @0 	#VOLTA PRO LOOP PRINCIPAL

--#INCREMENTO DEZENA 
tmp(59) := LDA & '0' & x"0A";	-- LDA @10 	#MEM[10] = 0
tmp(60) := STA & '0' & x"00";	-- STA @0 	#Salva o valor 0 em MEM[10]
tmp(61) := LDA & '0' & x"0B";	-- LDA @11 	#Carrega acumulador com o valor de MEM[11](dezenas)
tmp(62) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor da dezenas
tmp(63) := STA & '0' & x"0B";	-- STA @11
tmp(64) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(65) := JEQ & '0' & x"43";	-- JEQ @67 	#Se for igual a 10 pula para incremento centena(DEFINIR AINDA)
tmp(66) := RET & '0' & x"00";	-- RET @0 	#return

--#INCREMENTO CENTENA
tmp(67) := LDA & '0' & x"0B";	-- LDA @11 	#Carrega acumulador com o valor de MEM[11](dezenas)
tmp(68) := STA & '0' & x"00";	-- STA @0 	#MEM[11] = 0
tmp(69) := LDA & '0' & x"0C";	-- LDA @12 	#Carrega acumulador com o valor de MEM[12](centenas)
tmp(70) := SOMA & '0' & x"01";	-- SOMA @1
tmp(71) := STA & '0' & x"0C";	-- STA @12 	#Salva mem[2] com o valor do acumulador
tmp(72) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(73) := JEQ & '0' & x"4B";	-- JEQ @75 	#Se for igual a 10 pula para incremento milhar(DEFINIR AINDA)
tmp(74) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO MILHAR
tmp(75) := LDA & '0' & x"0C";	-- LDA @12 	#Carrega acumulador com o valor de MEM[12](centenas)
tmp(76) := STA & '0' & x"00";	-- STA @0 	#MEM[12] = 0
tmp(77) := LDA & '0' & x"0D";	-- LDA @13 	#Carrega acumulador com o valor de MEM[3](milhares)
tmp(78) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor da milhar
tmp(79) := STA & '0' & x"0D";	-- STA @13 	#Salva mem[3] com o valor do acumulador
tmp(80) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(81) := JEQ & '0' & x"53";	-- JEQ @83 	#Se for igual a 10 pula para incremento dezena milhar
tmp(82) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO DEZENA MILHAR
tmp(83) := LDA & '0' & x"0D";	-- LDA @13 	#Carrega acumulador com o valor de MEM[13](milhares)
tmp(84) := STA & '0' & x"00";	-- STA @0 
tmp(85) := LDA & '0' & x"0E";	-- LDA @14 	#Carrega acumulador com o valor de MEM[4](dez milhares)
tmp(86) := SOMA & '0' & x"01";	-- SOMA @1
tmp(87) := STA & '0' & x"0E";	-- STA @14 	#Salva mem[4] com o valor do acumulador  
tmp(88) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(89) := JEQ & '0' & x"5B";	-- JEQ @91 	#Se for igual a 10 pula para incremento centena milhar
tmp(90) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO CENTENA MILHAR
tmp(91) := LDA & '0' & x"0E";	-- LDA @14 	#Carrega acumulador com o valor de MEM[14](dez milhares)
tmp(92) := STA & '0' & x"00";	-- STA @0 	#Salva mem[5] com o valor do acumulador
tmp(93) := LDA & '0' & x"0F";	-- LDA @15 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(94) := SOMA & '0' & x"01";	-- SOMA @1 
tmp(95) := STA & '0' & x"0F";	-- STA @15 	#Salva mem[15] com o valor do acumulador
tmp(96) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(97) := JEQ & '0' & x"63";	-- JEQ @99 	#PULA PARA LED OVERFL0W 
tmp(98) := RET & '0' & x"00";	-- RET @0

--#LED OVERFLOW
tmp(99) := LDA & '0' & x"01";	-- LDA @1 	#Carrega acumulador com 1
tmp(100) := STA & '0' & x"10";	-- STA @16 	#Salva o valor do acumulador na mem[16] = FLAG
tmp(101) := STA & '1' & x"02";	-- STA @258 	#Acende o LED de overflow [LEDR9]
tmp(102) := RET & '0' & x"00";	-- RET @0

--#SUBROTINA ATUALIZA DISPLAY

--#HEX0
tmp(103) := LDA & '0' & x"0A";	-- LDA @10
tmp(104) := STA & '1' & x"20";	-- STA @288

--#HEX1
tmp(105) := LDA & '0' & x"0B";	-- LDA @11
tmp(106) := STA & '1' & x"21";	-- STA @289

--#HEX2
tmp(107) := LDA & '0' & x"0C";	-- LDA @12
tmp(108) := STA & '1' & x"22";	-- STA @290

--#HEX3
tmp(109) := LDA & '0' & x"0D";	-- LDA @13
tmp(110) := STA & '1' & x"23";	-- STA @291

--#HEX4
tmp(111) := LDA & '0' & x"0E";	-- LDA @14
tmp(112) := STA & '1' & x"24";	-- STA @292

--#HEX5
tmp(113) := LDA & '0' & x"0F";	-- LDA @15
tmp(114) := STA & '1' & x"25";	-- STA @293
tmp(115) := RET & '0' & x"00";	-- RET @0

--#SUBROTINA RESET FPGA
tmp(116) := STA & '1' & x"FD";	-- STA @509 	#Limpa FPGA_RESET
tmp(117) := LDA & '0' & x"0A";	-- LDA @10
tmp(118) := STA & '0' & x"0A";	-- STA @10 	#Salva mem[0] com o valor do acumulador
tmp(119) := STA & '0' & x"0B";	-- STA @11 	#Salva mem[1] com o valor do acumulador
tmp(120) := STA & '0' & x"0C";	-- STA @12 	#Salva mem[2] com o valor do acumulador
tmp(121) := STA & '0' & x"0D";	-- STA @13 	#Salva mem[3] com o valor do acumulador
tmp(122) := STA & '0' & x"0E";	-- STA @14 	#Salva mem[4] com o valor do acumulador
tmp(123) := STA & '0' & x"0F";	-- STA @15 	#Salva mem[5] com o valor do acumulador
tmp(124) := STA & '0' & x"10";	-- STA @16 	#Salva mem[6] com o valor do acumulador
tmp(125) := STA & '1' & x"01";	-- STA @257 	#Apaga o LED[8] de overflow
tmp(126) := STA & '1' & x"02";	-- STA @258 	#Apaga o LED[9] de limite de contagem
tmp(127) := RET & '0' & x"00";	-- RET @0

--#CHECA LIMITE DE CONTAGEM -ZZZZZZ

--#CHECA UNIDADE
tmp(128) := LDA & '0' & x"1E";	-- LDA @30
tmp(129) := CEQ & '0' & x"00";	-- CEQ @0
tmp(130) := JEQ & '0' & x"84";	-- JEQ @132 	#Pula para checa dezena(definir ainda)
tmp(131) := RET & '0' & x"00";	-- RET @0

--#CHECA dezena
tmp(132) := LDA & '0' & x"1F";	-- LDA @31
tmp(133) := CEQ & '0' & x"01";	-- CEQ @1
tmp(134) := JEQ & '0' & x"88";	-- JEQ @136 	#Pula para centena (definir ainda)
tmp(135) := RET & '0' & x"00";	-- RET @0

--#CHECA centena
tmp(136) := LDA & '0' & x"20";	-- LDA @32
tmp(137) := CEQ & '0' & x"02";	-- CEQ @2
tmp(138) := JEQ & '0' & x"8C";	-- JEQ @140 	#Pula para milhares (definir ainda)
tmp(139) := RET & '0' & x"00";	-- RET @0

--#CHECA milhares
tmp(140) := LDA & '0' & x"21";	-- LDA @33
tmp(141) := CEQ & '0' & x"03";	-- CEQ @3
tmp(142) := JEQ & '0' & x"90";	-- JEQ @144 	#Pula para dezena milhares (definir ainda)
tmp(143) := RET & '0' & x"00";	-- RET @0

--#CHECA dezena milhares
tmp(144) := LDA & '0' & x"22";	-- LDA @34
tmp(145) := CEQ & '0' & x"04";	-- CEQ @4
tmp(146) := JEQ & '0' & x"94";	-- JEQ @148 	#Pula para centena milhares    (definir ainda)
tmp(147) := RET & '0' & x"00";	-- RET @0

--#CHECA centena milhares
tmp(148) := LDA & '0' & x"23";	-- LDA @35
tmp(149) := CEQ & '0' & x"05";	-- CEQ @5
tmp(150) := JEQ & '0' & x"98";	-- JEQ @152 	#Pula para checa flag (definir ainda)
tmp(151) := RET & '0' & x"00";	-- RET @0

--#CHECA FLAG
tmp(152) := LDA & '0' & x"01";	-- LDA @1
tmp(153) := STA & '0' & x"10";	-- STA @16
tmp(154) := STA & '0' & x"9E";	-- STA @158 	#Acende o LED[9] de limite de contagem
tmp(155) := RET & '0' & x"00";	-- RET @0

--#SUBROTINA DEFINICAO DE LIMITES

--#DEFINICAO DE LIMTE unidades 
tmp(156) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(157) := LDA & '0' & x"01";	-- LDA @1
tmp(158) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(159) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(160) := CEQ & '0' & x"00";	-- CEQ @0
tmp(161) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(162) := JEQ & '0' & x"A4";	-- JEQ @164 	#pula para definicao de limite dezena(definir ainda)
tmp(163) := STA & '0' & x"1E";	-- STA @30 	#armazena o novo limite de contagem das unidades

--#DEFINICAO DE LIMTE dezenas
tmp(164) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(165) := LDI & '0' & x"03";	-- LDI @3
tmp(166) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(167) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(168) := CEQ & '0' & x"00";	-- CEQ @0 	#verifica se key1 = 0
tmp(169) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(170) := JEQ & '0' & x"AC";	-- JEQ @172 	#PULA PARA definir limite centena(definir ainda)
tmp(171) := STA & '0' & x"1F";	-- STA @31 	#armazena o novo limite de contagem das dezenas

--#DEFINICAO DE LIMTE centenas
tmp(172) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(173) := LDI & '0' & x"07";	-- LDI @7
tmp(174) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(175) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(176) := CEQ & '0' & x"00";	-- CEQ @0 	#verifica se key1 = 0
tmp(177) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(178) := JEQ & '0' & x"B4";	-- JEQ @180 	#PULA PARA definir limite milhares(definir ainda)
tmp(179) := STA & '0' & x"20";	-- STA @32 	#armazena o novo limite de contagem das centenas

--#DEFINICAO DE LIMTE milhares
tmp(180) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(181) := LDI & '0' & x"0F";	-- LDI $15
tmp(182) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(183) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(184) := CEQ & '0' & x"00";	-- CEQ @0     	#verifica se key1 = 0
tmp(185) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(186) := JEQ & '0' & x"BC";	-- JEQ @188 	#PULA PARA definir limite dezena milhares(definir ainda)
tmp(187) := STA & '0' & x"21";	-- STA @33 	#armazena o novo limite de contagem das milhares

--#DEFINICAO DE LIMTE dezena milhares
tmp(188) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(189) := LDI & '0' & x"1F";	-- LDI $31
tmp(190) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(191) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(192) := CEQ & '0' & x"00";	-- CEQ @0 	#verifica se key1 = 0
tmp(193) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(194) := JEQ & '0' & x"C4";	-- JEQ @196 	#PULA PARA definir limite centena milhares(definir ainda)
tmp(195) := STA & '0' & x"22";	-- STA @34 	#armazena o novo limite de contagem das dezena milhares

--#DEFINICAO DE LIMTE centena milhares
tmp(196) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(197) := LDI & '0' & x"3F";	-- LDI $63 
tmp(198) := STA & '1' & x"00";	-- STA @256 
tmp(199) := LDA & '1' & x"61";	-- LDA @353  	#carrega acumulador com o valor de key1 
tmp(200) := CEQ & '0' & x"00";	-- CEQ @0 	#verifica se key1 = 0
tmp(201) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(202) := JEQ & '0' & x"C5";	-- JEQ @197 	#PULA PARA definir limite flag(definir ainda)
tmp(203) := STA & '0' & x"23";	-- STA @35
tmp(204) := STA & '1' & x"FE";	-- STA @510 	#Limpa KEY1
tmp(205) := LDA & '0' & x"00";	-- LDA @0 	#carrega mem[10]
tmp(206) := STA & '1' & x"00";	-- STA @256 	#desliga LEDR7
tmp(207) := RET & '0' & x"00";	-- RET @0


        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;