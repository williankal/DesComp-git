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
      
--		--TESTE HEX
--        tmp(0)  := LDA & '1' & x"40";    
--        tmp(1)  := STA & '1' & x"20";
--		  tmp(2)  := LDA & '1' & x"41";
--        tmp(3)  := STA & '1' & x"21";
--        tmp(4)  := LDA & '1' & x"42";
--		  tmp(5)  := STA & '1' & x"22";
--		  tmp(6)  := LDA & '1' & x"60";
--		  tmp(7)  := STA & '1' & x"23"; 
--		  tmp(8)  := LDA & '1' & x"61";
--		  tmp(9)  := STA & '1' & x"23";
--		  tmp(10)  := LDA & '1' & x"62";
--		  tmp(11) := STA & '1' & x"15";
--		  
		 --TESTE LED 
--		tmp(0):= LDI & '0' & x"01";
--		tmp(1) := STA & '0' & x"00";
--		tmp(2) := SOMA & '0' & x"00";
--		tmp(3) := STA & '0' & x"01";
--		tmp(4) := LDA & '0' & x"00";
--		tmp(5) := STA & '1' & x"01";
--		tmp(6) := STA & '1' & x"02";
--		tmp(7) := LDI & '0' & x"55";
--		tmp(8) := STA & '1' & x"00";
--		tmp(9) := LDI & '0' & x"AA";
--
----ACUMULADOR
--	tmp(0) := LDI & '0' & x"00"; 
--	tmp(1) := STA & '1' & x"20";
--	tmp(2) := STA & '1' & x"21";
--	tmp(3) := STA & '1' & x"22";
--	tmp(4) := STA & '1' & x"23";
--	tmp(5) := STA & '1' & x"24";
--	tmp(6) := STA & '1' & x"25";
--	
--	tmp(7) := LDI & '0' & x"00"; 
--	tmp(8) := STA & '1' & x"00";
--	tmp(9) := STA & '1' & x"01";
--	tmp(10) := STA & '1' & x"02";
--	
--	tmp(11) := LDI & '0' & x"00"; 
--	tmp(12) := STA & '0' & x"00";
--	tmp(13) := STA & '0' & x"01";
--	tmp(14) := STA & '0' & x"02";
--	
--	-- COMPARCOES
--	tmp(15) := LDI & '0' & x"00";
--	tmp(16) := STA & '0' & x"0A"; -- 0 
--	tmp(17) := LDI & '0' & x"01";
--	tmp(18) := STA & '0' & x"0B"; -- 1
--	tmp(19) := LDI & '0' & x"09";
--	tmp(20) := STA & '0' & x"0C"; -- 9
--	tmp(21) := LDI & '0' & x"0A"; 
--	tmp(22) := STA & '0' & x"0D"; -- 10
	
tmp(0) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(1) := STA & '1' & x"20";	-- STA @288 	#Armazena o valor 0 no HEX0
tmp(2) := STA & '1' & x"21";	-- STA @289 	#Armazena o valor 0 no HEX1
tmp(3) := STA & '1' & x"22";	-- STA @290 	#Armazena o valor 0 no HEX2
tmp(4) := STA & '1' & x"23";	-- STA @291 	#Armazena o valor 0 no HEX3
tmp(5) := STA & '1' & x"24";	-- STA @292 	#Armazena o valor 0 no HEX4
tmp(6) := STA & '1' & x"25";	-- STA @293 	#Armazena o valor 0 no HEX5
tmp(7) := LDI & '0' & x"00";	-- LDI $0
tmp(8) := STA & '1' & x"00";	-- STA @256 	#Armazena o valor 0 no LEDR7~0
tmp(9) := STA & '1' & x"01";	-- STA @257 	#Armazena o valor 0 no LEDR8
tmp(10) := STA & '1' & x"02";	-- STA @258 	#Armazena o valor 0 no LEDR9
tmp(11) := LDI & '0' & x"00";	-- LDI $0 
tmp(12) := STA & '0' & x"00";	-- STA @0 	#Armazena o valor do acumulador em MEM[0](unidades)
tmp(13) := STA & '0' & x"01";	-- STA @1 	#Armazena o valor do acumulador em MEM[1](dezenas)
tmp(14) := STA & '0' & x"02";	-- STA @2 	#Armazena o valor do acumulador em MEM[2](centenas)
tmp(15) := STA & '0' & x"03";	-- STA @3 	#Armazena o valor do acumulador em MEM[3](milhares)
tmp(16) := STA & '0' & x"04";	-- STA @4 	#Armazena o valor do acumulador em MEM[4](dez milhares)
tmp(17) := STA & '0' & x"05";	-- STA @5 	#Armazena o valor do acumulador em MEM[5](cent milhares)
tmp(18) := STA & '0' & x"06";	-- STA @6 	#Armazena o valor do acumulador em MEM[6] (flag)
tmp(19) := LDI & '0' & x"00";	-- LDI $0
tmp(20) := STA & '0' & x"0A";	-- STA @10 	#Armaena o valor do acumulador em MEM[10]
tmp(21) := LDI & '0' & x"01";	-- LDI $1 	#Carrega acumulador com valor 1
tmp(22) := STA & '0' & x"0B";	-- STA @11 	#Armazena o valor do acumulador em MEM[11]
tmp(23) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(24) := STA & '0' & x"0C";	-- STA @12 	#Armazena o valor do acumulador em MEM[12]
tmp(25) := LDI & '0' & x"0A";	-- LDI $10 	#Carrega acumulador com valor 10
tmp(26) := STA & '0' & x"0D";	-- STA @13 	#Armazena o valor do acumulador em MEM[13]
tmp(27) := STA & '0' & x"1E";	-- STA @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(28) := STA & '0' & x"1F";	-- STA @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(29) := STA & '0' & x"20";	-- STA @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(30) := STA & '0' & x"21";	-- STA @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(31) := STA & '0' & x"22";	-- STA @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(32) := STA & '0' & x"23";	-- STA @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)
tmp(33) := NOP;	-- NOP @0
tmp(34) := LDA & '0' & x"06";	-- LDA @6 	#Carrega acumulador com valor de MEM[6](FLAG)
tmp(35) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se o valor do acumulador é igual a 1
tmp(36) := JEQ & '0' & x"2A";	-- JEQ @42 	#Se for igual, pula para o endereço:
tmp(37) := LDA & '1' & x"60";	-- LDA @352 	#Carrega acumulador com o valor de KEY0
tmp(38) := CEQ & '0' & x"0B";	-- CEQ @11 	#Compara se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(39) := JEQ & '0' & x"2A";	-- JEQ @42  	#Se for igual 0 pula para o endereço:
tmp(40) := JSR & '0' & x"34";	-- JSR @52 	#Se for igual 1 pula para o endereço:
tmp(41) := LDA & '1' & x"61";	-- LDA @353 	#Carrega acumulador com o valor de KEY1
tmp(42) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 1 (Se key1 foi pressionado)
tmp(43) := JEQ & '0' & x"32";	-- JEQ @50 
tmp(44) := JSR & '0' & x"64";	-- JSR @100 
tmp(45) := NOP;	-- NOP @0
tmp(46) := JSR & '0' & x"64";	-- JSR @100
tmp(47) := LDA & '1' & x"64";	-- LDA @356 	#Carrega acumulador com o valor de FPGA_RESET
tmp(48) := CEQ & '0' & x"0A";	-- CEQ @10 	#Compara se o valor do acumulador é igual a 0 
tmp(49) := JEQ & '0' & x"33";	-- JEQ @51 	#Se for igual 0 pula para o endereço:
tmp(50) := JSR & '0' & x"64";	-- JSR @100 	#Pula para subrotina: DEFINICAO DE LIMITES
tmp(51) := JSR & '0' & x"21";	-- JSR @33 	#CHECA LIMITE
tmp(52) := STA & '1' & x"FF";	-- STA @511 	#Limpa KEY 0
tmp(53) := LDA & '0' & x"00";	-- LDA @0 	#Carrega acumulador com o valor de MEM[0](unidades)
tmp(54) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(55) := STA & '0' & x"00";	-- STA @0
tmp(56) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(57) := JEQ & '0' & x"3B";	-- JEQ @59	#Se for igual 10 pula para o endereço
tmp(58) := RET & '0' & x"00";	-- RET @0 	#VOLTA PRO LOOP PRINCIPAL
tmp(59) := LDA & '0' & x"0A";	-- LDA @10
tmp(60) := STA & '0' & x"00";	-- STA @0
tmp(61) := LDA & '0' & x"01";	-- LDA @1 	#Carrega acumulador com o valor de MEM[1](dezenas)
tmp(62) := SOMA & '0' & x"0B";	-- SOMA @11 	#Soma 1 ao valor da dezenas
tmp(63) := STA & '0' & x"01";	-- STA @1
tmp(64) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(65) := JEQ & '0' & x"64";	-- JEQ @100 	#PULA PRA CENTENA
tmp(66) := RET & '0' & x"00";	-- RET @0 	#return
tmp(67) := LDA & '0' & x"0A";	-- LDA @10
tmp(68) := STA & '0' & x"00";	-- STA @0
tmp(69) := LDA & '0' & x"02";	-- LDA @2
tmp(70) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(71) := STA & '0' & x"02";	-- STA @2
tmp(72) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(73) := JEQ & '0' & x"64";	-- JEQ @100 	#PULA PRA MILHAR
tmp(74) := RET & '0' & x"00";	-- RET @0
tmp(75) := LDA & '0' & x"0A";	-- LDA @10
tmp(76) := STA & '0' & x"00";	-- STA @0
tmp(77) := LDA & '0' & x"03";	-- LDA @3
tmp(78) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(79) := STA & '0' & x"03";	-- STA @3
tmp(80) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(81) := JEQ & '0' & x"64";	-- JEQ @100 	#PULA PARA DEZENA MILHAR
tmp(82) := RET & '0' & x"00";	-- RET @0
tmp(83) := LDA & '0' & x"0A";	-- LDA @10
tmp(84) := STA & '0' & x"00";	-- STA @0
tmp(85) := LDA & '0' & x"04";	-- LDA @4
tmp(86) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(87) := STA & '0' & x"04";	-- STA @4
tmp(88) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(89) := JEQ & '0' & x"64";	-- JEQ @100 	#PULA PARA CENTENA MILHAR
tmp(90) := RET & '0' & x"00";	-- RET @0
tmp(91) := LDA & '0' & x"0A";	-- LDA @10
tmp(92) := STA & '0' & x"00";	-- STA @0
tmp(93) := LDA & '0' & x"05";	-- LDA @5
tmp(94) := SOMA & '0' & x"0B";	-- SOMA @11
tmp(95) := STA & '0' & x"05";	-- STA @5
tmp(96) := CEQ & '0' & x"0D";	-- CEQ @13
tmp(97) := JEQ & '0' & x"64";	-- JEQ @100 	#PULA PARA LED OVERFL0W
tmp(98) := RET & '0' & x"00";	-- RET @0
tmp(99) := LDA & '0' & x"0B";	-- LDA @11
tmp(100) := STA & '0' & x"06";	-- STA @6
tmp(101) := STA & '1' & x"02";	-- STA @258
tmp(102) := RET & '0' & x"00";	-- RET @0
tmp(103) := LDA & '0' & x"0A";	-- LDA @10
tmp(104) := STA & '0' & x"00";	-- STA @0
tmp(105) := STA & '0' & x"01";	-- STA @1
tmp(106) := STA & '0' & x"02";	-- STA @2
tmp(107) := STA & '0' & x"03";	-- STA @3
tmp(108) := STA & '0' & x"04";	-- STA @4
tmp(109) := STA & '0' & x"05";	-- STA @5
tmp(110) := STA & '0' & x"06";	-- STA @6
tmp(111) := STA & '1' & x"01";	-- STA @257
tmp(112) := STA & '1' & x"02";	-- STA @258
tmp(113) := RET & '0' & x"00";	-- RET @0
tmp(114) := LDA & '0' & x"00";	-- LDA @0
tmp(115) := STA & '1' & x"20";	-- STA @288
tmp(116) := LDA & '0' & x"01";	-- LDA @1
tmp(117) := STA & '1' & x"21";	-- STA @289
tmp(118) := LDA & '0' & x"02";	-- LDA @2
tmp(119) := STA & '1' & x"22";	-- STA @290
tmp(120) := LDA & '0' & x"03";	-- LDA @3
tmp(121) := STA & '1' & x"23";	-- STA @291
tmp(122) := LDA & '0' & x"04";	-- LDA @4
tmp(123) := STA & '1' & x"24";	-- STA @292
tmp(124) := LDA & '0' & x"05";	-- LDA @5
tmp(125) := STA & '1' & x"25";	-- STA @293
tmp(126) := RET & '0' & x"00";	-- RET @0
tmp(127) := LDA & '0' & x"1E";	-- LDA @30
tmp(128) := CEQ & '0' & x"00";	-- CEQ @0
tmp(129) := JEQ & '0' & x"8D";	-- JEQ @141 	#Pula para dezena
tmp(130) := RET & '0' & x"00";	-- RET @0
tmp(131) := LDA & '0' & x"1F";	-- LDA @31
tmp(132) := CEQ & '0' & x"01";	-- CEQ @1
tmp(133) := JEQ & '0' & x"8F";	-- JEQ @143 	#Pula para centena
tmp(134) := RET & '0' & x"00";	-- RET @0
tmp(135) := LDA & '0' & x"20";	-- LDA @32
tmp(136) := CEQ & '0' & x"02";	-- CEQ @2
tmp(137) := JEQ & '0' & x"91";	-- JEQ @145 	#Pula para milhares
tmp(138) := RET & '0' & x"00";	-- RET @0
tmp(139) := LDA & '0' & x"21";	-- LDA @33
tmp(140) := CEQ & '0' & x"03";	-- CEQ @3
tmp(141) := JEQ & '0' & x"93";	-- JEQ @147 	#Pula para dezena milhares
tmp(142) := RET & '0' & x"00";	-- RET @0
tmp(143) := LDA & '0' & x"22";	-- LDA @34
tmp(144) := CEQ & '0' & x"04";	-- CEQ @4
tmp(145) := JEQ & '0' & x"95";	-- JEQ @149 	#Pula para centena milhares
tmp(146) := RET & '0' & x"00";	-- RET @0
tmp(147) := LDA & '0' & x"23";	-- LDA @35
tmp(148) := CEQ & '0' & x"05";	-- CEQ @5
tmp(149) := JEQ & '0' & x"97";	-- JEQ @151 	#Pula para checa flag
tmp(150) := RET & '0' & x"00";	-- RET @0
tmp(151) := LDA & '0' & x"0B";	-- LDA @11
tmp(152) := STA & '0' & x"06";	-- STA @6
tmp(153) := STA & '0' & x"9E";	-- STA @158
tmp(154) := RET & '0' & x"00";	-- RET @0
tmp(155) := STA & '1' & x"FE";	-- STA @510 	#zera key1
tmp(156) := LDI & '0' & x"01";	-- LDI @1
tmp(157) := STA & '1' & x"00";	-- STA @256
tmp(158) := LDA & '1' & x"61";	-- LDA @353
tmp(159) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(160) := LDA & '1' & x"54";	-- LDA @340
tmp(161) := JEQ & '0' & x"9C";	-- JEQ @156 	#PULA PARA LDI 
tmp(162) := STA & '0' & x"1E";	-- STA @30
tmp(163) := STA & '1' & x"FE";	-- STA @510
tmp(164) := LDI & '0' & x"03";	-- LDI @3
tmp(165) := STA & '1' & x"00";	-- STA @256
tmp(166) := LDA & '1' & x"61";	-- LDA @353
tmp(167) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(168) := LDA & '1' & x"40";	-- LDA @320
tmp(169) := JEQ & '0' & x"A2";	-- JEQ @162 	#PULA PARA LDI
tmp(170) := STA & '0' & x"1F";	-- STA @31
tmp(171) := STA & '1' & x"FE";	-- STA @510
tmp(172) := LDI & '0' & x"07";	-- LDI @7
tmp(173) := STA & '1' & x"00";	-- STA @256
tmp(174) := LDA & '1' & x"61";	-- LDA @353
tmp(175) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(176) := LDA & '1' & x"40";	-- LDA @320
tmp(177) := JEQ & '0' & x"AC";	-- JEQ @172 	#PULA PARA LDI
tmp(178) := STA & '0' & x"20";	-- STA @32
tmp(179) := STA & '1' & x"FE";	-- STA @510
tmp(180) := LDI & '0' & x"0F";	-- LDI @15
tmp(181) := STA & '1' & x"00";	-- STA @256
tmp(182) := LDA & '1' & x"61";	-- LDA @353
tmp(183) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(184) := LDA & '1' & x"40";	-- LDA @320
tmp(185) := JEQ & '0' & x"B4";	-- JEQ @180 	#PULA PARA LDI
tmp(186) := STA & '0' & x"21";	-- STA @33
tmp(187) := STA & '1' & x"FE";	-- STA @510
tmp(188) := LDI & '0' & x"1F";	-- LDI @31
tmp(189) := STA & '1' & x"00";	-- STA @256
tmp(190) := LDA & '1' & x"61";	-- LDA @353
tmp(191) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(192) := LDA & '1' & x"40";	-- LDA @320
tmp(193) := JEQ & '0' & x"BC";	-- JEQ @188 	#PULA PARA LDI
tmp(194) := STA & '0' & x"22";	-- STA @34
tmp(195) := STA & '1' & x"FE";	-- STA @510
tmp(196) := LDI & '0' & x"3F";	-- LDI @63
tmp(197) := STA & '1' & x"00";	-- STA @256
tmp(198) := LDA & '1' & x"61";	-- LDA @353    
tmp(199) := CEQ & '0' & x"0A";	-- CEQ @10
tmp(200) := LDA & '1' & x"40";	-- LDA @320
tmp(201) := JEQ & '0' & x"C4";	-- JEQ @196 	#PULA PARA LDI
tmp(202) := STA & '0' & x"23";	-- STA @35
tmp(203) := STA & '1' & x"FE";	-- STA @510
tmp(204) := LDA & '0' & x"0A";	-- LDA @10
tmp(205) := STA & '1' & x"00";	-- STA @256
tmp(206) := RET & '0' & x"00";	-- RET @0




		
		  

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;