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
  constant NOP: std_logic_vector(12 downto 0) := "0000000000000";
  
  begin
 
-- #LIMPA BOTOES
tmp(0) := STA & '1' & x"FF";	-- STA .CLEARKEY0 	#Limpa KEY 0
tmp(1) := STA & '1' & x"FE";	-- STA .CLEARKEY1 	#Limpa KEY 1
tmp(2) := STA & '1' & x"FD";	-- STA .CLEARKEY2 	#Limpa KEY 2
tmp(3) := STA & '1' & x"FC";	-- STA .CLEARKEY3 	#Limpa KEY 3
tmp(4) := STA & '1' & x"FB";	-- STA .CLEARFPGA 	#Limpa FPGA_RESET
tmp(5) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
-- #ESCREVE 0 NOS DISPLAYS
tmp(6) := STA & '1' & x"20";	-- STA .HEX0 	#Armazena o valor 0 no HEX0
tmp(7) := STA & '1' & x"21";	-- STA .HEX1 	#Armazena o valor 0 no HEX1
tmp(8) := STA & '1' & x"22";	-- STA .HEX2 	#Armazena o valor 0 no HEX2
tmp(9) := STA & '1' & x"23";	-- STA .HEX3 	#Armazena o valor 0 no HEX3
tmp(10) := STA & '1' & x"24";	-- STA .HEX4 	#Armazena o valor 0 no HEX4
tmp(11) := STA & '1' & x"25";	-- STA .HEX5 	#Armazena o valor 0 no HEX5
-- #APAGANDO OS LEDS
tmp(12) := LDI & '0' & x"00";	-- LDI $0
tmp(13) := STA & '1' & x"00";	-- STA .LED07 	#Armazena o valor 0 no LEDR7~0
tmp(14) := STA & '1' & x"01";	-- STA .LED8 	#Armazena o valor 0 no LEDR8
tmp(15) := STA & '1' & x"02";	-- STA .LED9 	#Armazena o valor 0 no LEDR9
-- #VARIAVEIS QUE ARMAZENAM O VALOR DO DISPLAY
tmp(16) := LDI & '0' & x"00";	-- LDI $0
tmp(17) := STA & '0' & x"0A";	-- STA @10 	#Armazena o valor do acumulador em MEM[10](unidades)
tmp(18) := STA & '0' & x"0B";	-- STA @11 	#Armazena o valor do acumulador em MEM[11](dezenas)
tmp(19) := STA & '0' & x"0C";	-- STA @12 	#Armazena o valor do acumulador em MEM[12](centenas)
tmp(20) := STA & '0' & x"0D";	-- STA @13 	#Armazena o valor do acumulador em MEM[13](milhares)
tmp(21) := STA & '0' & x"0E";	-- STA @14 	#Armazena o valor do acumulador em MEM[14](dez milhares)
tmp(22) := STA & '0' & x"0F";	-- STA @15 	#Armazena o valor do acumulador em MEM[15](cent milhares)
-- #FLAG 
tmp(23) := STA & '0' & x"10";	-- STA @16 	#Armazena o valor do acumulador em MEM[16]=0 (flag)
-- #VARIAVEIS DE COMPARAÇÃO 
tmp(24) := LDI & '0' & x"00";	-- LDI $0
tmp(25) := STA & '0' & x"00";	-- STA @0 	#Armaena o valor do acumulador em MEM[0]
tmp(26) := LDI & '0' & x"01";	-- LDI $1 	#Carrega acumulador com valor 1
tmp(27) := STA & '0' & x"01";	-- STA @1 	#Armazena o valor do acumulador em MEM[1]
tmp(28) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(29) := STA & '0' & x"02";	-- STA @2 	#Armazena o valor do acumulador em MEM[2]
tmp(30) := LDI & '0' & x"0A";	-- LDI $10 	#Carrega acumulador com valor 10
tmp(31) := STA & '0' & x"03";	-- STA @3 	#Armazena o valor do acumulador em MEM[3]
-- #ARMAZENANDO LIMITES DE CONTAGEM 
tmp(32) := LDI & '0' & x"09";	-- LDI $9 	#Carrega acumulador com valor 9
tmp(33) := STA & '0' & x"1E";	-- STA @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(34) := STA & '0' & x"1F";	-- STA @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(35) := STA & '0' & x"20";	-- STA @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(36) := STA & '0' & x"21";	-- STA @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(37) := STA & '0' & x"22";	-- STA @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(38) := STA & '0' & x"23";	-- STA @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)
-- #CHECA KEY 0
tmp(39) := LDA & '1' & x"60";	-- LDA .KEY0 	#Carrega acumulador com o valor de KEY0
tmp(40) := ANDI & '0' & x"01";	-- ANDI $1 	#Faz a operação AND com o valor 1
tmp(41) := CEQ & '0' & x"01";	-- CEQ @1 	#OLha para se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(42) := JEQ & '0' & x"31";	-- JEQ .INCREMENTA 	#Se for igual pula para fpga_reset
-- #CHECA FPGA_RESET
tmp(43) := LDA & '1' & x"64";	-- LDA .RST_FPGA 	#Carrega acumulador com o valor de FPGA_RESET
tmp(44) := ANDI & '0' & x"01";	-- ANDI $1 	#Faz a operação AND com o valor 1
tmp(45) := CEQ & '0' & x"01";	-- CEQ @1 	#Compara se o valor do acumulador é igual a 0
tmp(46) := JEQ & '0' & x"00";	-- JEQ .SETUP 	#Se  n foi pressionado pulta para atualiza display
-- #ATUALIZA DISPLAY
tmp(47) := JSR & '0' & x"69";	-- JSR .ATUALIZA_DISPLAY 	#Chama a subrotina atualiza display
tmp(48) := JMP & '0' & x"27";	-- JMP .LOOP 	#Volta para o loop principal
-- #loop INCREMENTO
tmp(49) := STA & '1' & x"FF";	-- STA .CLEARKEY0 	#Limpa KEY 0
tmp(50) := LDA & '0' & x"0A";	-- LDA @10 	#Carrega acumulador com o valor de MEM[10](unidades)
tmp(51) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor das unidades
tmp(52) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara com valor 10
tmp(53) := JEQ & '0' & x"38";	-- JEQ .INCREMENTO_DEZENA 	#Se for igual 10 pula para o endereço incrementar dezena(definir ainda)
tmp(54) := STA & '0' & x"0A";	-- STA @10 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(55) := JMP & '0' & x"2B";	-- JMP .BACK 	#VOLTA PRO loop PRINCIPAL
tmp(56) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(57) := STA & '0' & x"0A";	-- STA @10 	#Salva o valor 0 em MEM[10]
tmp(58) := STA & '1' & x"20";	-- STA .HEX0 	#Salva o valor do acumulador em HEX0
tmp(59) := LDA & '0' & x"0B";	-- LDA @11 	#Carrega acumulador com o valor de MEM[1](dezenas)
tmp(60) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor da dezenas
tmp(61) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(62) := JEQ & '0' & x"41";	-- JEQ .INCREMENTO_CENTENA 	#Se for igual a 10 pula para incremento centena(DEFINIR AINDA)
tmp(63) := STA & '0' & x"0B";	-- STA @11 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(64) := JMP & '0' & x"2B";	-- JMP .BACK 	#return
tmp(65) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(66) := STA & '0' & x"0B";	-- STA @11 	#Salva o valor 0 em MEM[11]
tmp(67) := STA & '1' & x"21";	-- STA .HEX1 	#Salva o valor do acumulador em HEX1
tmp(68) := LDA & '0' & x"0C";	-- LDA @12 	#Carrega acumulador com o valor de MEM[2](centenas)
tmp(69) := SOMA & '0' & x"01";	-- SOMA @1
tmp(70) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(71) := JEQ & '0' & x"4A";	-- JEQ .INCREMENTO_MILHAR 	#Se for igual a 10 pula para incremento milhar(DEFINIR AINDA)
tmp(72) := STA & '0' & x"0C";	-- STA @12 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(73) := JMP & '0' & x"2B";	-- JMP .BACK
tmp(74) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(75) := STA & '0' & x"0C";	-- STA @12 	#Salva o valor 0 em MEM[12]
tmp(76) := STA & '1' & x"22";	-- STA .HEX2 	#Salva o valor do acumulador em HEX0
tmp(77) := LDA & '0' & x"0D";	-- LDA @13 	#Carrega acumulador com o valor de MEM[3](milhares)
tmp(78) := SOMA & '0' & x"01";	-- SOMA @1 	#Soma 1 ao valor da milhar
tmp(79) := CEQ & '0' & x"0D";	-- CEQ @13 	#Compara o valor com 10
tmp(80) := JEQ & '0' & x"53";	-- JEQ .INCREMENTO_DEZENA_MILHAR 	#Se for igual a 10 pula para incremento dezena milhar(DEFINIR AINDA)
tmp(81) := STA & '0' & x"0D";	-- STA @13 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(82) := JMP & '0' & x"2B";	-- JMP .BACK
tmp(83) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(84) := STA & '0' & x"0D";	-- STA @13 	#Salva o valor 0 em MEM[12]
tmp(85) := STA & '1' & x"23";	-- STA .HEX3 	#Salva o valor do acumulador em HEX0
tmp(86) := LDA & '0' & x"0E";	-- LDA @14 	#Carrega acumulador com o valor de MEM[4](dez milhares)
tmp(87) := SOMA & '0' & x"01";	-- SOMA @1
tmp(88) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(89) := JEQ & '0' & x"5C";	-- JEQ .INCREMENTO_CENTENA_MILHAR 	#Se for igual a 10 pula para incremento centena milhar(DEFINIR AINDA)
tmp(90) := STA & '0' & x"0E";	-- STA @14 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(91) := JMP & '0' & x"2B";	-- JMP .BACK
tmp(92) := LDI & '0' & x"00";	-- LDI $0 	#Carrega acumulador com valor 0
tmp(93) := STA & '0' & x"0E";	-- STA @14 	#Salva o valor 0 em MEM[12]
tmp(94) := STA & '1' & x"24";	-- STA .HEX4 	#Salva o valor do acumulador em HEX0
tmp(95) := LDA & '0' & x"0F";	-- LDA @15 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(96) := SOMA & '0' & x"01";	-- SOMA @1
tmp(97) := CEQ & '0' & x"03";	-- CEQ @3 	#Compara o valor com 10
tmp(98) := JEQ & '0' & x"65";	-- JEQ .LED_OVERFLOW 	#PULA PARA LED OVERFL0W (DEFINIR AINDA)
tmp(99) := STA & '0' & x"0F";	-- STA @15 	#Salva o valor do acumulador em MEM[10](unidades)
tmp(100) := JMP & '0' & x"2B";	-- JMP .BACK
tmp(101) := LDA & '0' & x"01";	-- LDA @1 	#Carrega acumulador com 1
tmp(102) := STA & '0' & x"10";	-- STA @16 	#Salva o valor do acumulador na mem[6]
tmp(103) := STA & '1' & x"02";	-- STA .LED9 	#Acende o LED de overflow
tmp(104) := RET & '0' & x"00";	-- RET
-- #SUBROTINA ATUALIZA DISPLAY
-- #HEX0
tmp(105) := LDA & '0' & x"0A";	-- LDA @10
tmp(106) := STA & '1' & x"20";	-- STA .HEX0
-- #HEX1
tmp(107) := LDA & '0' & x"0B";	-- LDA @11
tmp(108) := STA & '1' & x"21";	-- STA .HEX1
-- #HEX2
tmp(109) := LDA & '0' & x"0C";	-- LDA @12
tmp(110) := STA & '1' & x"22";	-- STA .HEX2
-- #HEX3
tmp(111) := LDA & '0' & x"0D";	-- LDA @13
tmp(112) := STA & '1' & x"23";	-- STA .HEX3
-- #HEX4
tmp(113) := LDA & '0' & x"0E";	-- LDA @14
tmp(114) := STA & '1' & x"24";	-- STA .HEX4
-- #HEX5
tmp(115) := LDA & '0' & x"0F";	-- LDA @15
tmp(116) := STA & '1' & x"25";	-- STA .HEX5
tmp(117) := RET & '0' & x"00";	-- RET
-- #SUBROTINA RESET FPGA
tmp(118) := STA & '1' & x"FD";	-- STA @509 	#Limpa FPGA_RESET
tmp(119) := LDA & '0' & x"0A";	-- LDA @10
tmp(120) := STA & '0' & x"00";	-- STA @0 	#Salva mem[0] com o valor do acumulador
tmp(121) := STA & '0' & x"01";	-- STA @1 	#Salva mem[1] com o valor do acumulador
tmp(122) := STA & '0' & x"02";	-- STA @2 	#Salva mem[2] com o valor do acumulador
tmp(123) := STA & '0' & x"03";	-- STA @3 	#Salva mem[3] com o valor do acumulador
tmp(124) := STA & '0' & x"04";	-- STA @4 	#Salva mem[4] com o valor do acumulador
tmp(125) := STA & '0' & x"05";	-- STA @5 	#Salva mem[5] com o valor do acumulador
tmp(126) := STA & '0' & x"06";	-- STA @6 	#Salva mem[6] com o valor do acumulador
tmp(127) := STA & '1' & x"01";	-- STA @257 	#Apaga o LED[8] de overflow
tmp(128) := STA & '1' & x"02";	-- STA @258 	#Apaga o LED[9] de limite de contagem
tmp(129) := RET & '0' & x"00";	-- RET
        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;