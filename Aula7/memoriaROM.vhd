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
tmp(12) := STA & '0' & x"00";	-- STA @0 	#Armazena o valor do acumulador em MEM[0](unidades)
tmp(13) := STA & '0' & x"01";	-- STA @1 	#Armazena o valor do acumulador em MEM[1](dezenas)
tmp(14) := STA & '0' & x"02";	-- STA @2 	#Armazena o valor do acumulador em MEM[2](centenas)
tmp(15) := STA & '0' & x"03";	-- STA @3 	#Armazena o valor do acumulador em MEM[3](milhares)
tmp(16) := STA & '0' & x"04";	-- STA @4 	#Armazena o valor do acumulador em MEM[4](dez milhares)
tmp(17) := STA & '0' & x"05";	-- STA @5 	#Armazena o valor do acumulador em MEM[5](cent milhares)

--#FLAG 
tmp(18) := STA & '0' & x"06";	-- STA @6 	#Armazena o valor do acumulador em MEM[6]=0 (flag)

--#VARIAVEIS DE COMPARAÇÃO 
tmp(19) := LDI & '0' & x"00";	-- LDI $0
tmp(20) := STA & '0' & x"0A";	-- STA @10 	#Armaena o valor do acumulador em MEM[10]
tmp(21) := LDI & '0' & x"01";	-- LDI $1 	#Carrega acumulador com valor 1
tmp(22) := STA & '0' & x"0B";	-- STA @11 	#Armazena o valor do acumulador em MEM[11]
tmp(23) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(24) := STA & '0' & x"0C";	-- STA @12 	#Armazena o valor do acumulador em MEM[12]
tmp(25) := LDI & '0' & x"0A";	-- LDI $10 	#Carrega acumulador com valor 10
tmp(26) := STA & '0' & x"0D";	-- STA @13 	#Armazena o valor do acumulador em MEM[13]

--#ARMAZENANDO LIMITES DE CONTAGEM 
tmp(27) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(28) := STA & '0' & x"1E";	-- STA @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(29) := STA & '0' & x"1F";	-- STA @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(30) := STA & '0' & x"20";	-- STA @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(31) := STA & '0' & x"21";	-- STA @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(32) := STA & '0' & x"22";	-- STA @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(33) := STA & '0' & x"23";	-- STA @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)

--#LOOP PRINCIPAL => CHECA KEY 0/1/FPGA
tmp(34) := NOP;	-- NOP @0

--#CHECA FLAG
tmp(35) := LDA & '0' & x"06";	-- LDA @6 	#Carrega acumulador com valor da flag MEM[6]
tmp(36) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se o valor do acumulador é igual a 1
tmp(37) := JEQ & '0' & x"2A";	-- JEQ @42 	#Se for igual, pula para o endereço:

--#CHECA KEY 0
tmp(38) := LDA & '1' & x"60";	-- LDA @352 	#Carrega acumulador com o valor de KEY0
tmp(39) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(40) := JEQ & '0' & x"2A";	-- JEQ @42  	#Se for igual 0 pula para o endereço:
tmp(41) := JSR & '0' & x"36";	-- JSR @54 	#Se for igual 1 pula para o endereço:

--#CHECA KEY 1
tmp(42) := LDA & '1' & x"61";	-- LDA @353 	#Carrega acumulador com o valor de KEY1
tmp(43) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 1 (Se key1 foi pressionado)
tmp(44) := JEQ & '0' & x"2F";	-- JEQ @47 	#PULA PARA CHECA LIMITPULA PARA CHECA LIMITEE DE CONTAGEM(DEFINIR AINDA) 
tmp(45) := JSR & '0' & x"9D";	-- JSR @157   	#PULA PARA DEFINIR LIMITE(DEFINIR AINDA)
tmp(46) := NOP;	-- NOP @0
tmp(47) := JSR & '0' & x"81";	-- JSR @129 	#pula para checar limite(definir ainda)

--#CHECA FPGA_RESET
tmp(48) := LDA & '1' & x"64";	-- LDA @356 	#Carrega acumulador com o valor de FPGA_RESET
tmp(49) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se o valor do acumulador é igual a 0 
tmp(50) := JEQ & '0' & x"34";	-- JEQ @52 	#Se for igual 0 pula para o endereço:
tmp(51) := JSR & '0' & x"76";	-- JSR @118 	#Pula para subrotina: RESETAR PLACA(DEFINIR AINDA)

--#ATUALIZA DISPLAY
tmp(52) := JSR & '0' & x"69";	-- JSR @105 	#Pula para subrotina: ATUALIZA DISPLAY(DEFINIR AINDA)
tmp(53) := JMP & '0' & x"22";	-- JMP @34 	#Volta para o loop principal

--#LOOP INCREMENTO 
tmp(54) := STA & '1' & x"FF";	-- STA @511 	#Limpa KEY 0

--#INCREMENTO UNIDADE
tmp(55) := LDA & '0' & x"00";	-- LDA @0 	#Carrega acumulador com o valor de MEM[0](unidades)
tmp(56) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(57) := STA & '0' & x"00";	-- STA @0
tmp(58) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(59) := JEQ & '0' & x"3D";	-- JEQ @61	#Se for igual 10 pula para o endereço incrementar dezena(definir ainda)
tmp(60) := RET & '0' & x"00";	-- RET @0 	#VOLTA PRO LOOP PRINCIPAL

--#INCREMENTO DEZENA 
tmp(61) := LDA & '0' & x"0A";	-- LDA @10
tmp(62) := STA & '0' & x"00";	-- STA @0 
tmp(63) := LDA & '0' & x"01";	-- LDA @1 	#Carrega acumulador com o valor de MEM[1](dezenas)
tmp(64) := SOMA & '0' & x"0B";	-- SOMA @11 	#Soma 1 ao valor da dezenas
tmp(65) := STA & '0' & x"01";	-- STA @1
tmp(66) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(67) := JEQ & '0' & x"45";	-- JEQ @69 	#Se for igual a 10 pula para incremento centena(DEFINIR AINDA)
tmp(68) := RET & '0' & x"00";	-- RET @0 	#return

--#INCREMENTO CENTENA
tmp(69) := LDA & '0' & x"0A";	-- LDA @10
tmp(70) := STA & '0' & x"00";	-- STA @0
tmp(71) := LDA & '0' & x"02";	-- LDA @2 	#Carrega acumulador com o valor de MEM[2](centenas)
tmp(72) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(73) := STA & '0' & x"02";	-- STA @2 	#Salva mem[2] com o valor do acumulador
tmp(74) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(75) := JEQ & '0' & x"4D";	-- JEQ @77 	#Se for igual a 10 pula para incremento milhar(DEFINIR AINDA)
tmp(76) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO MILHAR
tmp(77) := LDA & '0' & x"0A";	-- LDA @10
tmp(78) := STA & '0' & x"00";	-- STA @0
tmp(79) := LDA & '0' & x"03";	-- LDA @3 	#Carrega acumulador com o valor de MEM[3](milhares)
tmp(80) := SOMA & '0' & x"0B";	-- SOMA @11 	#Soma 1 ao valor da milhar
tmp(81) := STA & '0' & x"03";	-- STA @3 	#Salva mem[3] com o valor do acumulador
tmp(82) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(83) := JEQ & '0' & x"55";	-- JEQ @85 	#Se for igual a 10 pula para incremento dezena milhar(DEFINIR AINDA)
tmp(84) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO DEZENA MILHAR
tmp(85) := LDA & '0' & x"0A";	-- LDA @10
tmp(86) := STA & '0' & x"00";	-- STA @0
tmp(87) := LDA & '0' & x"04";	-- LDA @4 	#Carrega acumulador com o valor de MEM[4](dez milhares)
tmp(88) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(89) := STA & '0' & x"04";	-- STA @4 	#Salva mem[4] com o valor do acumulador  
tmp(90) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(91) := JEQ & '0' & x"5D";	-- JEQ @93 	#Se for igual a 10 pula para incremento centena milhar(DEFINIR AINDA)
tmp(92) := RET & '0' & x"00";	-- RET @0

--#INCREMENTO CENTENA MILHAR
tmp(93) := LDA & '0' & x"0A";	-- LDA @10 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(94) := STA & '0' & x"00";	-- STA @0 	#Salva mem[5] com o valor do acumulador
tmp(95) := LDA & '0' & x"05";	-- LDA @5 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(96) := SOMA & '0' & x"0B";	-- SOMA @11 
tmp(97) := STA & '0' & x"05";	-- STA @5 	#Salva mem[5] com o valor do acumulador
tmp(98) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(99) := JEQ & '0' & x"65";	-- JEQ @101 	#PULA PARA LED OVERFL0W (DEFINIR AINDA)
tmp(100) := RET & '0' & x"00";	-- RET @0

--#LED OVERFLOW
tmp(101) := LDA & '0' & x"0B";	-- LDA @11 	#Carrega acumulador com 1
tmp(102) := STA & '0' & x"06";	-- STA @6 	#Salva o valor do acumulador na mem[6]
tmp(103) := STA & '1' & x"02";	-- STA @258 	#Acende o LED de overflow
tmp(104) := RET & '0' & x"00";	-- RET @0

--#SUBROTINA ATUALIZA DISPLAY

--#HEX0
tmp(105) := LDA & '0' & x"00";	-- LDA @0
tmp(106) := STA & '1' & x"20";	-- STA @288

--#HEX1
tmp(107) := LDA & '0' & x"01";	-- LDA @1
tmp(108) := STA & '1' & x"21";	-- STA @289

--#HEX2
tmp(109) := LDA & '0' & x"02";	-- LDA @2
tmp(110) := STA & '1' & x"22";	-- STA @290

--#HEX3
tmp(111) := LDA & '0' & x"03";	-- LDA @3
tmp(112) := STA & '1' & x"23";	-- STA @291

--#HEX4
tmp(113) := LDA & '0' & x"04";	-- LDA @4
tmp(114) := STA & '1' & x"24";	-- STA @292

--#HEX5
tmp(115) := LDA & '0' & x"05";	-- LDA @5
tmp(116) := STA & '1' & x"25";	-- STA @293
tmp(117) := RET & '0' & x"00";	-- RET @0

--#SUBROTINA RESET FPGA
tmp(118) := LDA & '0' & x"0A";	-- LDA @10
tmp(119) := STA & '0' & x"00";	-- STA @0 	#Salva mem[0] com o valor do acumulador
tmp(120) := STA & '0' & x"01";	-- STA @1 	#Salva mem[1] com o valor do acumulador
tmp(121) := STA & '0' & x"02";	-- STA @2 	#Salva mem[2] com o valor do acumulador
tmp(122) := STA & '0' & x"03";	-- STA @3 	#Salva mem[3] com o valor do acumulador
tmp(123) := STA & '0' & x"04";	-- STA @4 	#Salva mem[4] com o valor do acumulador
tmp(124) := STA & '0' & x"05";	-- STA @5 	#Salva mem[5] com o valor do acumulador
tmp(125) := STA & '0' & x"06";	-- STA @6 	#Salva mem[6] com o valor do acumulador
tmp(126) := STA & '1' & x"01";	-- STA @257 	#Apaga o LED[8] de overflow
tmp(127) := STA & '1' & x"02";	-- STA @258 	#Apaga o LED[9] de limite de contagem
tmp(128) := RET & '0' & x"00";	-- RET @0

--#CHECA LIMITE DE CONTAGEM -ZZZZZZ

--#CHECA UNIDADE
tmp(129) := LDA & '0' & x"1E";	-- LDA @30
tmp(130) := CEQ & '0' & x"00";	-- CEQ @0
tmp(131) := JEQ & '0' & x"85";	-- JEQ @133 	#Pula para checa dezena(definir ainda)
tmp(132) := RET & '0' & x"00";	-- RET @0

--#CHECA dezena
tmp(133) := LDA & '0' & x"1F";	-- LDA @31
tmp(134) := CEQ & '0' & x"01";	-- CEQ @1
tmp(135) := JEQ & '0' & x"89";	-- JEQ @137 	#Pula para centena (definir ainda)
tmp(136) := RET & '0' & x"00";	-- RET @0

--#CHECA centena
tmp(137) := LDA & '0' & x"20";	-- LDA @32
tmp(138) := CEQ & '0' & x"02";	-- CEQ @2
tmp(139) := JEQ & '0' & x"8D";	-- JEQ @141 	#Pula para milhares (definir ainda)
tmp(140) := RET & '0' & x"00";	-- RET @0

--#CHECA milhares
tmp(141) := LDA & '0' & x"21";	-- LDA @33
tmp(142) := CEQ & '0' & x"03";	-- CEQ @3
tmp(143) := JEQ & '0' & x"91";	-- JEQ @145 	#Pula para dezena milhares (definir ainda)
tmp(144) := RET & '0' & x"00";	-- RET @0

--#CHECA dezena milhares
tmp(145) := LDA & '0' & x"22";	-- LDA @34
tmp(146) := CEQ & '0' & x"04";	-- CEQ @4
tmp(147) := JEQ & '0' & x"95";	-- JEQ @149 	#Pula para centena milhares    (definir ainda)
tmp(148) := RET & '0' & x"00";	-- RET @0

--#CHECA centena milhares
tmp(149) := LDA & '0' & x"23";	-- LDA @35
tmp(150) := CEQ & '0' & x"05";	-- CEQ @5
tmp(151) := JEQ & '0' & x"99";	-- JEQ @153 	#Pula para checa flag (definir ainda)
tmp(152) := RET & '0' & x"00";	-- RET @0

--#CHECA FLAG
tmp(153) := LDA & '0' & x"0B";	-- LDA @11
tmp(154) := STA & '0' & x"06";	-- STA @6
tmp(155) := STA & '0' & x"9E";	-- STA @158 	#Acende o LED[9] de limite de contagem
tmp(156) := RET & '0' & x"00";	-- RET @0

--#DEFINICAO DE LIMTE unidades 
tmp(157) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(158) := LDI & '0' & x"01";	-- LDI @1
tmp(159) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(160) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(161) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(162) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(163) := JEQ & '0' & x"A5";	-- JEQ @165 	#pula para definicao de limite dezena(definir ainda)
tmp(164) := STA & '0' & x"1E";	-- STA @30 	#armazena o novo limite de contagem das unidades

--#DEFINICAO DE LIMTE dezenas
tmp(165) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(166) := LDI & '0' & x"03";	-- LDI @3
tmp(167) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(168) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(169) := CEQ & '0' & x"0A";	-- CEQ @10 	#verifica se key1 = 0
tmp(170) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(171) := JEQ & '0' & x"AD";	-- JEQ @173 	#PULA PARA definir limite centena(definir ainda)
tmp(172) := STA & '0' & x"1F";	-- STA @31 	#armazena o novo limite de contagem das dezenas

--#DEFINICAO DE LIMTE centenas
tmp(173) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(174) := LDI & '0' & x"07";	-- LDI @7
tmp(175) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(176) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(177) := CEQ & '0' & x"0A";	-- CEQ @10 	#verifica se key1 = 0
tmp(178) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(179) := JEQ & '0' & x"B5";	-- JEQ @181 	#PULA PARA definir limite milhares(definir ainda)
tmp(180) := STA & '0' & x"20";	-- STA @32 	#armazena o novo limite de contagem das centenas

--#DEFINICAO DE LIMTE milhares
tmp(181) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(182) := LDI & '0' & x"0F";	-- LDI $15
tmp(183) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(184) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(185) := CEQ & '0' & x"0A";	-- CEQ @10     	#verifica se key1 = 0
tmp(186) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(187) := JEQ & '0' & x"BD";	-- JEQ @189 	#PULA PARA definir limite dezena milhares(definir ainda)
tmp(188) := STA & '0' & x"21";	-- STA @33 	#armazena o novo limite de contagem das milhares

--#DEFINICAO DE LIMTE dezena milhares
tmp(189) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(190) := LDI & '0' & x"1F";	-- LDI $31
tmp(191) := STA & '1' & x"00";	-- STA @256 	#ativa led7
tmp(192) := LDA & '1' & x"61";	-- LDA @353 	#carrega acumulador com o valor de key1
tmp(193) := CEQ & '0' & x"0A";	-- CEQ @10 	#verifica se key1 = 0
tmp(194) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(195) := JEQ & '0' & x"C5";	-- JEQ @197 	#PULA PARA definir limite centena milhares(definir ainda)
tmp(196) := STA & '0' & x"22";	-- STA @34 	#armazena o novo limite de contagem das dezena milhares

--#DEFINICAO DE LIMTE centena milhares
tmp(197) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(198) := LDI & '0' & x"3F";	-- LDI $63 
tmp(199) := STA & '1' & x"00";	-- STA @256 
tmp(200) := LDA & '1' & x"61";	-- LDA @353  	#carrega acumulador com o valor de key1 
tmp(201) := CEQ & '0' & x"0A";	-- CEQ @10 	#verifica se key1 = 0
tmp(202) := LDA & '1' & x"40";	-- LDA @320 	#verifica SW7 to 0
tmp(203) := JEQ & '0' & x"C6";	-- JEQ @198 	#PULA PARA definir limite flag(definir ainda)
tmp(204) := STA & '0' & x"23";	-- STA @35
tmp(205) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(206) := LDA & '0' & x"0A";	-- LDA @10 	#carrega mem[10]
tmp(207) := STA & '1' & x"00";	-- STA @256 	#desliga LEDR8
tmp(208) := RET & '0' & x"00";	-- RET @0



        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;