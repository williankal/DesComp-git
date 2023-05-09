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
  constant ADDI: std_logic_vector(3 downto 0) := "1100";
  
  constant R0 : std_logic_vector(1 downto 0) := "00"; 
  constant R1 : std_logic_vector(1 downto 0) := "01"; 
  constant R2 : std_logic_vector(1 downto 0) := "10"; 
  constant R3 : std_logic_vector(1 downto 0) := "11"; 
	
  begin

-- Segundos = REG[0] REG[1]

-- Uso geral = REG[2] 

-- Clock_check = REG[3]

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

--
--SP:

--LIMPA BOTOESBACK
tmp(0) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0 	#Limpa KEY 0
tmp(1) := STA & R2 & '1' & x"FE";	-- STA %R2 .CLEARKEY1 	#Limpa KEY 1
tmp(2) := STA & R2 & '1' & x"FD";	-- STA %R2 .CLEARKEY2 	#Limpa KEY 2
tmp(3) := STA & R2 & '1' & x"FC";	-- STA %R2 .CLEARKEY3 	#Limpa KEY 3
tmp(4) := STA & R2 & '1' & x"FB";	-- STA %R2 .CLEARFPGA 	#Limpa FPGA_RESET
tmp(5) := LDI & R2 & '0' & x"00";	-- LDI %R2 $0 	#Carrega acumulador com valor 0

--ESCREVE 0 NOS DISPLAYS
tmp(6) := STA & R2 & '1' & x"20";	-- STA %R2 .HEX0 	#Armazena o valor 0 no HEX0
tmp(7) := STA & R2 & '1' & x"21";	-- STA %R2 .HEX1 	#Armazena o valor 0 no HEX1
tmp(8) := STA & R2 & '1' & x"22";	-- STA %R2 .HEX2 	#Armazena o valor 0 no HEX2
tmp(9) := STA & R2 & '1' & x"23";	-- STA %R2 .HEX3 	#Armazena o valor 0 no HEX3
tmp(10) := STA & R2 & '1' & x"24";	-- STA %R2 .HEX4 	#Armazena o valor 0 no HEX4
tmp(11) := STA & R2 & '1' & x"25";	-- STA %R2 .HEX5 	#Armazena o valor 0 no HEX5

--APAGANDO OS LEDS
tmp(12) := LDI & R2 & '0' & x"00";	-- LDI %R2 $0
tmp(13) := STA & R2 & '1' & x"00";	-- STA %R2 .LED07 	#Armazena o valor 0 no LEDR7~0
tmp(14) := STA & R2 & '1' & x"01";	-- STA %R2 .LED8 	#Armazena o valor 0 no LEDR8
tmp(15) := STA & R2 & '1' & x"02";	-- STA %R2 .LED9 	#Armazena o valor 0 no LEDR9

--VARIAVEIS QUE ARMAZENAM O VALOR DO DISPLAY
tmp(16) := STA & R2 & '0' & x"0A";	-- STA %R2 @10 	#Armazena o valor do acumulador em MEM[10](unidades)
tmp(17) := STA & R2 & '0' & x"0B";	-- STA %R2 @11 	#Armazena o valor do acumulador em MEM[11](dezenas)
tmp(18) := STA & R2 & '0' & x"0C";	-- STA %R2 @12 	#Armazena o valor do acumulador em MEM[12](centenas)
tmp(19) := STA & R2 & '0' & x"0D";	-- STA %R2 @13 	#Armazena o valor do acumulador em MEM[13](milhares)
tmp(20) := STA & R2 & '0' & x"0E";	-- STA %R2 @14 	#Armazena o valor do acumulador em MEM[14](dez milhares)
tmp(21) := STA & R2 & '0' & x"0F";	-- STA %R2 @15 	#Armazena o valor do acumulador em MEM[15](cent milhares)

--FLAG 
tmp(22) := STA & R2 & '0' & x"10";	-- STA %R2 @16 	#Armazena o valor do acumulador em MEM[16]=0 (flag)

--VARIAVEIS DE COMPARAÇÃO 
tmp(23) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0
tmp(24) := LDI & R2 & '0' & x"00";	-- LDI %R2 $0
tmp(25) := STA & R2 & '0' & x"00";	-- STA %R2 @0 	#Armaena o valor do acumulador em MEM[0]
tmp(26) := LDI & R2 & '0' & x"01";	-- LDI %R2 $1
tmp(27) := STA & R2 & '0' & x"01";	-- STA %R2 @1 	#Armazena o valor do acumulador em MEM[1]
tmp(28) := LDI & R2 & '0' & x"09";	-- LDI %R2 $9 	#Carrega acumulador com valor 9
tmp(29) := STA & R2 & '0' & x"02";	-- STA %R2 @2 	#Armazena o valor do acumulador em MEM[2]
tmp(30) := LDI & R2 & '0' & x"0A";	-- LDI %R2 $10 	#Carrega acumulador com valor 10
tmp(31) := STA & R2 & '0' & x"03";	-- STA %R2 @3 	#Armazena o valor do acumulador em MEM[3]
tmp(32) := LDI & R2 & '0' & x"04";	-- LDI %R2 $4 	#Carrega acumulador com valor 10
tmp(33) := STA & R2 & '0' & x"04";	-- STA %R2 @4 	#Armazena o valor do acumulador em MEM[3]

--ARMAZENANDO LIMITES DE CONTAGEM
tmp(34) := LDI & R2 & '0' & x"0A";	-- LDI %R2 $10 	#Carrega acumulador com valor 9
tmp(35) := STA & R2 & '0' & x"1E";	-- STA %R2 @30  	#Armazena o limie de contagem em MEM[30] (segundos)
tmp(36) := STA & R2 & '0' & x"20";	-- STA %R2 @32 	#Armazena o limie de contagem em MEM[32] (minutos)
tmp(37) := LDI & R2 & '0' & x"06";	-- LDI %R2 $6 
tmp(38) := STA & R2 & '0' & x"1F";	-- STA %R2 @31 	#Armazena o limie de contagem em MEM[31] (segundos dezenas)
tmp(39) := STA & R2 & '0' & x"21";	-- STA %R2 @33 	#Armazena o limie de contagem em MEM[33] (minutos dezenas)
tmp(40) := LDI & R2 & '0' & x"0A";	-- LDI %R2 $10
tmp(41) := STA & R2 & '0' & x"22";	-- STA %R2 @34 	#Armazena o limie de contagem em MEM[34] (horas)
tmp(42) := LDI & R2 & '0' & x"02";	-- LDI %R2 $2
tmp(43) := STA & R2 & '0' & x"23";	-- STA %R2 @35 	#Armazena o limie de contagem em MEM[35] (horas dezenas)
--L:

--CHECA CLOCK
tmp(44) := LDA & R3 & '1' & x"65";	-- LDA %R3 .HABCLOCK 	#Carrega acumulador com o valor de KEY0
tmp(45) := ANDI & R3 & '0' & x"01";	-- ANDI %R3 $1 	#Faz a operação AND com o valor 1
tmp(46) := CEQ & R3 & '0' & x"01";	-- CEQ %R3 @1 	#OLha para se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(47) := JEQ & R3 & '0' & x"3B";	-- JEQ %R3 .INCREMENTA 	#Se for igual pula para fpga_reset
--B:

--CHECA KEY0
tmp(48) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(49) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(50) := CEQ & R2 & '0' & x"01";	-- CEQ %R2 @1 	#OLha para se o valor do acumulador é igual a 1 (Se key0 foi pressionado)    
tmp(51) := JEQ & R2 & '0' & x"81";	-- JEQ %R2 .AJUSTE_HORARIO

--CHECA FPGA_RESET
tmp(52) := LDA & R2 & '1' & x"64";	-- LDA %R2 .RST_FPGA 	#Carrega acumulador com o valor de FPGA_RESET
tmp(53) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(54) := CEQ & R2 & '0' & x"01";	-- CEQ %R2 @1 	#Compara se o valor do acumulador é igual a 0 
tmp(55) := JEQ & R2 & '0' & x"00";	-- JEQ %R2 .SETUP 	#Se  n foi pressionado pulta para atualiza display

--ATUALIZA DISPLAY
tmp(56) := LDI & R2 & '0' & x"00";	-- LDI %R2 $0 	#Carrega acumulador com valor 1
tmp(57) := JSR & R2 & '0' & x"75";	-- JSR %R2 .ATUALIZA_DISPLAY 	#Chama a subrotina atualiza display
tmp(58) := JMP & R2 & '0' & x"2C";	-- JMP %R2 .LOOP 	#Volta para o loop principal

--loop INCREMENTO
--IEMENTA:
tmp(59) := STA & R3 & '1' & x"F8";	-- STA %R3 .CLEARCLOCK 	#Limpa KEY 0

--INCREMENTA SEGUNDOS
tmp(60) := ADDI & R0 & '0' & x"01";	-- ADDI %R0 $1 	#Incrementa o valor de REG[0] em 1
tmp(61) := CEQ & R0 & '0' & x"1E";	-- CEQ %R0 @30
tmp(62) := JEQ & R0 & '0' & x"40";	-- JEQ %R0 .INCREMENTA_DEZENAS 	#Se REG[0] for igual a REG[30] pula para incrementa dezenas segundos
tmp(63) := JMP & R0 & '0' & x"75";	-- JMP %R0 .ATUALIZA_DISPLAY 	#Volta para o loop principal
--IEMENTA_DEZENAS:
tmp(64) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0 	#Carrega acumulador com valor 0
tmp(65) := LDA & R1 & '0' & x"0B";	-- LDA %R1 @11 	#Carrega o valor do acumulador em MEM[30] (segundos)
tmp(66) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1 	#Soma o valor de REG[1] com o valor de REG[0]
tmp(67) := STA & R1 & '0' & x"0B";	-- STA %R1 @11 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(68) := CEQ & R1 & '0' & x"1F";	-- CEQ %R1 @31
tmp(69) := JEQ & R1 & '0' & x"47";	-- JEQ %R1 .INCREMENTA_MINUTOS 	#Se REG[1] for igual a REG[31] pula para incrementa minutos
tmp(70) := JMP & R1 & '0' & x"75";	-- JMP %R1 .ATUALIZA_DISPLAY
--IEMENTA_MINUTOS:
tmp(71) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0 	#Carrega acumulador com valor 0
tmp(72) := STA & R1 & '0' & x"0B";	-- STA %R1 @11 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(73) := LDA & R1 & '0' & x"0C";	-- LDA %R1 @12
tmp(74) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1 	#Soma o valor de REG[1] com o valor de REG[0]
tmp(75) := STA & R1 & '0' & x"0C";	-- STA %R1 @12 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(76) := CEQ & R1 & '0' & x"20";	-- CEQ %R1 @32
tmp(77) := JEQ & R1 & '0' & x"4F";	-- JEQ %R1 .INCREMENTA_DEZENAS_MINUTOS 	#Se REG[1] for igual a REG[32] pula para incrementa dezenas minutos
tmp(78) := JMP & R1 & '0' & x"75";	-- JMP %R1 .ATUALIZA_DISPLAY
--IEMENTA_DEZENAS_MINUTOS:
tmp(79) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0 	#Carrega acumulador com valor 0
tmp(80) := STA & R1 & '0' & x"0C";	-- STA %R1 @12 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(81) := LDA & R1 & '0' & x"0D";	-- LDA %R1 @13
tmp(82) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1 	#Soma o valor de REG[1] com o valor de REG[0]
tmp(83) := STA & R1 & '0' & x"0D";	-- STA %R1 @13 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(84) := CEQ & R1 & '0' & x"21";	-- CEQ %R1 @33
tmp(85) := JEQ & R1 & '0' & x"57";	-- JEQ %R1 .INCREMENTA_HORA 	#Se REG[1] for igual a REG[33] pula para incrementa horas
tmp(86) := JMP & R1 & '0' & x"75";	-- JMP %R1 .ATUALIZA_DISPLAY
--IEMENTA_HORA:
tmp(87) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0 	#Carrega acumulador com valor 0
tmp(88) := STA & R1 & '0' & x"0D";	-- STA %R1 @13 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(89) := LDA & R1 & '0' & x"0E";	-- LDA %R1 @14
tmp(90) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1 	#Soma o valor de REG[1] com o valor de REG[0]
tmp(91) := STA & R1 & '0' & x"0E";	-- STA %R1 @14 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(92) := CEQ & R1 & '0' & x"04";	-- CEQ %R1 @4
tmp(93) := JEQ & R1 & '0' & x"68";	-- JEQ %R1 .CHECK_2 	#Se REG[1] for igual a REG[4] pula para incrementa horas
--SCHECK:
tmp(94) := LDA & R1 & '0' & x"0E";	-- LDA %R1 @14 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(95) := CEQ & R1 & '0' & x"22";	-- CEQ %R1 @34
tmp(96) := JEQ & R1 & '0' & x"62";	-- JEQ %R1 .INCREMENTA_DEZENAS_HORAS 	#Se REG[1] for igual a REG[34] pula para incrementa dezenas horas
tmp(97) := JMP & R1 & '0' & x"75";	-- JMP %R1 .ATUALIZA_DISPLAY
--IEMENTA_DEZENAS_HORAS:
tmp(98) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0 	#Carrega acumulador com valor 0
tmp(99) := STA & R1 & '0' & x"0E";	-- STA %R1 @14 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(100) := LDA & R1 & '0' & x"0F";	-- LDA %R1 @15
tmp(101) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1 	#Soma o valor de REG[1] com o valor de REG[0]
tmp(102) := STA & R1 & '0' & x"0F";	-- STA %R1 @15 	#Armazena o valor do acumulador em MEM[30] (segundos)
tmp(103) := JMP & R1 & '0' & x"2C";	-- JMP %R1 .LOOP
--CK_2:
tmp(104) := LDA & R1 & '0' & x"0F";	-- LDA %R1 @15
tmp(105) := CEQ & R1 & '0' & x"23";	-- CEQ %R1 @35
tmp(106) := JEQ & R1 & '0' & x"6C";	-- JEQ %R1 .ZERADISPLAY 	#Se REG[1] for igual a REG[35] pula para incrementa horas
tmp(107) := JMP & R1 & '0' & x"5E";	-- JMP %R1 .SEM_CHECK
--ZDISPLAY:
tmp(108) := LDI & R2 & '0' & x"00";	-- LDI %R2 $0 	#Carrega acumulador com valor 0
tmp(109) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0 	#Carrega acumulador com valor 0
tmp(110) := STA & R2 & '0' & x"0A";	-- STA %R2 @10 	#Armazena o valor do acumulador em MEM[10] (segundos)
tmp(111) := STA & R2 & '0' & x"0C";	-- STA %R2 @12 	#Armazena o valor do acumulador em MEM[11] (dezenas segundos)
tmp(112) := STA & R2 & '0' & x"0D";	-- STA %R2 @13 	#Armazena o valor do acumulador em MEM[12] (minutos)
tmp(113) := STA & R2 & '0' & x"0E";	-- STA %R2 @14 	#Armazena o valor do acumulador em MEM[13] (dezenas minutos)
tmp(114) := STA & R2 & '0' & x"0B";	-- STA %R2 @11 	#Armazena o valor do acumulador em MEM[14] (horas)
tmp(115) := STA & R2 & '0' & x"0F";	-- STA %R2 @15 	#Armazena o valor do acumulador em MEM[15] (dezenas horas)
tmp(116) := JMP & R2 & '0' & x"75";	-- JMP %R2 .ATUALIZA_DISPLAY
--ALIZA_DISPLAY:
tmp(117) := STA & R0 & '1' & x"20";	-- STA %R0 .HEX0 	#Armazena o valor do REGISTRADOR em HEX0
tmp(118) := LDA & R2 & '0' & x"0B";	-- LDA %R2 @11
tmp(119) := STA & R2 & '1' & x"21";	-- STA %R2 .HEX1 	#Armazena o valor do REGISTRADOR em HEX1
tmp(120) := LDA & R2 & '0' & x"0C";	-- LDA %R2 @12
tmp(121) := STA & R2 & '1' & x"22";	-- STA %R2 .HEX2 	#Armazena o valor do REGISTRADOR em HEX2
tmp(122) := LDA & R2 & '0' & x"0D";	-- LDA %R2 @13
tmp(123) := STA & R2 & '1' & x"23";	-- STA %R2 .HEX3 	#Armazena o valor do REGISTRADOR em HEX3
tmp(124) := LDA & R2 & '0' & x"0E";	-- LDA %R2 @14
tmp(125) := STA & R2 & '1' & x"24";	-- STA %R2 .HEX4 	#Armazena o valor do REGISTRADOR em HEX4
tmp(126) := LDA & R2 & '0' & x"0F";	-- LDA %R2 @15
tmp(127) := STA & R2 & '1' & x"25";	-- STA %R2 .HEX5 	#Armazena o valor do REGISTRADOR em HEX5
tmp(128) := JMP & R2 & '0' & x"2C";	-- JMP %R2 .LOOP
--ATE_HORARIO:
tmp(129) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(130) := LDI & R1 & '0' & x"01";	-- LDI %R1 $1 
--AA_LED_SEGUNDO:
tmp(131) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(132) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(133) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(134) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(135) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(136) := JEQ & R2 & '0' & x"83";	-- JEQ  %R2 .ATIVA_LED_SEGUNDO
tmp(137) := STA & R3 & '0' & x"14";	-- STA %R3 @20
tmp(138) := LDA & R0 & '0' & x"14";	-- LDA %R0 @20
tmp(139) := STA & R0 & '1' & x"20";	-- STA %R0 .HEX0
tmp(140) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(141) := LDI & R1 & '0' & x"03";	-- LDI %R1 $3
--AA_LED_DEZENA_SEGUNDO:
tmp(142) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(143) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(144) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(145) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(146) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(147) := JEQ & R2 & '0' & x"8E";	-- JEQ  %R2 .ATIVA_LED_DEZENA_SEGUNDO
tmp(148) := STA & R3 & '0' & x"0B";	-- STA %R3 @11
tmp(149) := STA & R3 & '1' & x"21";	-- STA %R3 .HEX1
tmp(150) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(151) := LDI & R1 & '0' & x"07";	-- LDI %R1 $7
--AA_LED_MINUTO:
tmp(152) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(153) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(154) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(155) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(156) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(157) := JEQ & R2 & '0' & x"98";	-- JEQ  %R2 .ATIVA_LED_MINUTO
tmp(158) := STA & R3 & '0' & x"0C";	-- STA %R3 @12
tmp(159) := STA & R3 & '1' & x"22";	-- STA %R3 .HEX2
tmp(160) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(161) := LDI & R1 & '0' & x"0F";	-- LDI %R1 $15
--AA_LED_DEZENA_MINUTO:
tmp(162) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(163) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(164) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(165) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(166) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(167) := JEQ & R2 & '0' & x"A2";	-- JEQ  %R2 .ATIVA_LED_DEZENA_MINUTO
tmp(168) := STA & R3 & '0' & x"0D";	-- STA %R3 @13
tmp(169) := STA & R3 & '1' & x"23";	-- STA %R3 .HEX3
tmp(170) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(171) := LDI & R1 & '0' & x"1F";	-- LDI %R1 $31
--AA_LED_HORA:
tmp(172) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(173) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(174) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(175) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(176) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(177) := JEQ & R2 & '0' & x"AC";	-- JEQ  %R2 .ATIVA_LED_HORA
tmp(178) := STA & R3 & '0' & x"0E";	-- STA %R3 @14
tmp(179) := STA & R3 & '1' & x"24";	-- STA %R3 .HEX4
tmp(180) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(181) := LDI & R1 & '0' & x"3F";	-- LDI %R1 $63
--AA_LED_DEZENA_HORA:
tmp(182) := STA & R1 & '1' & x"00";	-- STA %R1 .LED07
tmp(183) := LDA & R2 & '1' & x"60";	-- LDA %R2 .KEY0
tmp(184) := ANDI & R2 & '0' & x"01";	-- ANDI %R2 $1 	#Faz a operação AND com o valor 1
tmp(185) := CEQ & R2 & '0' & x"00";	-- CEQ %R2 @0
tmp(186) := LDA & R3 & '1' & x"40";	-- LDA %R3 .SW0-7
tmp(187) := JEQ & R2 & '0' & x"B6";	-- JEQ  %R2 .ATIVA_LED_DEZENA_HORA
tmp(188) := STA & R3 & '0' & x"0F";	-- STA %R3 @15
tmp(189) := STA & R3 & '1' & x"25";	-- STA %R3 .HEX5
tmp(190) := LDA & R0 & '0' & x"14";	-- LDA %R0 @20
tmp(191) := STA & R2 & '1' & x"FF";	-- STA %R2 .CLEARKEY0
tmp(192) := LDI & R1 & '0' & x"00";	-- LDI %R1 $0
tmp(193) := STA & R1 & '1' & x"00";	-- STA $R1 .LED07
tmp(194) := JMP & R2 & '0' & x"2C";	-- JMP %R2 .LOOP





        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;