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
 
tmp(0) := LDI & '0' & x"00";	-- DI $0 	#Carrega acumulador com valor 0
--ESCREVE 0 NOS DISPLAYS
tmp(1) := STA & '1' & x"20";	-- TA @288 	#Armazena o valor 0 no HEX0
tmp(2) := STA & '1' & x"21";	-- TA @289 	#Armazena o valor 0 no HEX1
tmp(3) := STA & '1' & x"22";	-- TA @290 	#Armazena o valor 0 no HEX2
tmp(4) := STA & '1' & x"23";	-- TA @291 	#Armazena o valor 0 no HEX3
tmp(5) := STA & '1' & x"24";	-- TA @292 	#Armazena o valor 0 no HEX4
tmp(6) := STA & '1' & x"25";	-- TA @293 	#Armazena o valor 0 no HEX5
--APAGANDO OS LEDS
tmp(7) := LDI & '0' & x"00";	-- DI $0
tmp(8) := STA & '1' & x"00";	-- TA @256 	#Armazena o valor 0 no LEDR7~0
tmp(9) := STA & '1' & x"01";	-- TA @257 	#Armazena o valor 0 no LEDR8
tmp(10) := STA & '1' & x"02";	-- TA @258 	#Armazena o valor 0 no LEDR9
--VARIAVEIS QUE ARMAZENAM O VALOR DO DISPLAY
tmp(11) := LDI & '0' & x"00";	-- DI $0 
tmp(12) := STA & '0' & x"0A";	-- TA @10 	#Armazena o valor do acumulador em MEM[10](unidades)
tmp(13) := STA & '0' & x"0B";	-- TA @11 	#Armazena o valor do acumulador em MEM[11](dezenas)
tmp(14) := STA & '0' & x"0C";	-- TA @12 	#Armazena o valor do acumulador em MEM[12](centenas)
tmp(15) := STA & '0' & x"0D";	-- TA @13 	#Armazena o valor do acumulador em MEM[13](milhares)
tmp(16) := STA & '0' & x"0E";	-- TA @14 	#Armazena o valor do acumulador em MEM[14](dez milhares)
tmp(17) := STA & '0' & x"0F";	-- TA @15 	#Armazena o valor do acumulador em MEM[15](cent milhares)
--FLAG 
tmp(18) := STA & '0' & x"10";	-- TA @16 	#Armazena o valor do acumulador em MEM[16]=0 (flag)
--VARIAVEIS DE COMPARAÇÃO 
tmp(19) := LDI & '0' & x"00";	-- DI $0
tmp(20) := STA & '0' & x"00";	-- TA @0 	#Armaena o valor do acumulador em MEM[0]
tmp(21) := LDI & '0' & x"01";	-- DI $1 	#Carrega acumulador com valor 1
tmp(22) := STA & '0' & x"01";	-- TA @1 	#Armazena o valor do acumulador em MEM[1]
tmp(23) := LDI & '0' & x"09";	-- DI $9 	#Carrega acumulador com valor 9
tmp(24) := STA & '0' & x"02";	-- TA @2 	#Armazena o valor do acumulador em MEM[2]
tmp(25) := LDI & '0' & x"0A";	-- DI $10 	#Carrega acumulador com valor 10
tmp(26) := STA & '0' & x"03";	-- TA @3 	#Armazena o valor do acumulador em MEM[3]
--ARMAZENANDO LIMITES DE CONTAGEM 
tmp(27) := LDI & '0' & x"09";	-- DI $9 	#Carrega acumulador com valor 9
tmp(28) := STA & '0' & x"1E";	-- TA @30  	#Armazena o limie de contagem em MEM[30] (unidades)
tmp(29) := STA & '0' & x"1F";	-- TA @31 	#Armazena o limie de contagem em MEM[31] (dezenas)
tmp(30) := STA & '0' & x"20";	-- TA @32 	#Armazena o limie de contagem em MEM[32] (centenas)
tmp(31) := STA & '0' & x"21";	-- TA @33 	#Armazena o limie de contagem em MEM[33] (milhares)
tmp(32) := STA & '0' & x"22";	-- TA @34 	#Armazena o limie de contagem em MEM[34] (dez milhares)
tmp(33) := STA & '0' & x"23";	-- TA @35 	#Armazena o limie de contagem em MEM[35] (cent milhares)
tmp(34) := LDA & '0' & x"10";	-- DA @16 	#Carrega acumulador com valor da flag MEM[6]
tmp(35) := CEQ & '0' & x"01";	-- EQ @1 	#Compara se a flag MEM[16] está ativa
tmp(36) := JEQ & '0' & x"29";	-- EQ @41 	#Se for igual, pula para o endereço (CHECA KEY1[pula key0])
tmp(37) := LDA & '1' & x"60";	-- DA @352 	#Carrega acumulador com o valor de KEY0
tmp(38) := CEQ & '0' & x"00";	-- EQ @0 	#OLha para se o valor do acumulador é igual a 1 (Se key0 foi pressionado)
tmp(39) := JEQ & '0' & x"29";	-- EQ @41 	#Se for igual pula para checa fpga
tmp(40) := JSR & '0' & x"2F";	-- SR @47 	#LOOP INCREMENTO
tmp(41) := LDA & '1' & x"64";	-- DA @356 	#Carrega acumulador com o valor de FPGA_RESET
tmp(42) := CEQ & '0' & x"01";	-- EQ @1 	#Compara se o valor do acumulador é igual a 0 
tmp(43) := JEQ & '0' & x"6F";	-- EQ @111 	#Se foi pressionado para para subrotina RESET FPGA
tmp(44) := JSR & '0' & x"2D";	-- SR @45 	#Pula para subrotina: RESETAR PLACA(DEFINIR AINDA)
tmp(45) := JSR & '0' & x"62";	-- SR @98 	#Pula para subrotina: ATUALIZA DISPLAY
tmp(46) := JMP & '0' & x"22";	-- MP @34 	#Volta para o loop principal
tmp(47) := STA & '1' & x"FF";	-- TA @511 	#Limpa KEY 0
tmp(48) := LDA & '0' & x"0A";	-- DA @10 	#Carrega acumulador com o valor de MEM[10](unidades)
tmp(49) := SOMA & '0' & x"01";	-- OMA @1 	#Soma 1 ao valor das unidades
tmp(50) := STA & '0' & x"0A";	-- TA @10
tmp(51) := CEQ & '0' & x"03";	-- EQ @3 	#Compara com valor 10
tmp(52) := JEQ & '0' & x"36";	-- EQ @54 	#Se for igual 10 pula para o endereço incrementar dezena(definir ainda)
tmp(53) := RET & '0' & x"00";	-- ET @0 	#VOLTA PRO LOOP PRINCIPAL
tmp(54) := LDA & '0' & x"0A";	-- DA @10
tmp(55) := STA & '0' & x"00";	-- TA @0 	#Salva o valor 0 em MEM[10]
tmp(56) := LDA & '0' & x"0B";	-- DA @11 	#Carrega acumulador com o valor de MEM[1](dezenas)
tmp(57) := SOMA & '0' & x"01";	-- OMA @1 	#Soma 1 ao valor da dezenas
tmp(58) := STA & '0' & x"0B";	-- TA @11
tmp(59) := CEQ & '0' & x"03";	-- EQ @3 	#Compara o valor com 10
tmp(60) := JEQ & '0' & x"3E";	-- EQ @62 	#Se for igual a 10 pula para incremento centena(DEFINIR AINDA)
tmp(61) := RET & '0' & x"00";	-- ET @0 	#return
tmp(62) := LDA & '0' & x"0B";	-- DA @11 	#Carrega acumulador com o valor de MEM[11](dezenas)
tmp(63) := STA & '0' & x"00";	-- TA @0 	#MEM[11] =0
tmp(64) := LDA & '0' & x"0C";	-- DA @12 	#Carrega acumulador com o valor de MEM[2](centenas)
tmp(65) := SOMA & '0' & x"01";	-- OMA @1
tmp(66) := STA & '0' & x"0C";	-- TA @12 	#Salva mem[2] com o valor do acumulador
tmp(67) := CEQ & '0' & x"03";	-- EQ @3 	#Compara o valor com 10
tmp(68) := JEQ & '0' & x"46";	-- EQ @70 	#Se for igual a 10 pula para incremento milhar(DEFINIR AINDA)
tmp(69) := RET & '0' & x"00";	-- ET @0
tmp(70) := LDA & '0' & x"0C";	-- DA @12
tmp(71) := STA & '0' & x"00";	-- TA @0
tmp(72) := LDA & '0' & x"0D";	-- DA @13 	#Carrega acumulador com o valor de MEM[3](milhares)
tmp(73) := SOMA & '0' & x"01";	-- OMA @1 	#Soma 1 ao valor da milhar
tmp(74) := STA & '0' & x"0D";	-- TA @13 	#Salva mem[3] com o valor do acumulador
tmp(75) := CEQ & '0' & x"03";	-- EQ @3 	#Compara o valor com 10
tmp(76) := JEQ & '0' & x"4E";	-- EQ @78 	#Se for igual a 10 pula para incremento dezena milhar(DEFINIR AINDA)
tmp(77) := RET & '0' & x"00";	-- ET @0
tmp(78) := LDA & '0' & x"0D";	-- DA @13
tmp(79) := STA & '0' & x"00";	-- TA @0
tmp(80) := LDA & '0' & x"0E";	-- DA @14 	#Carrega acumulador com o valor de MEM[4](dez milhares)
tmp(81) := SOMA & '0' & x"01";	-- OMA @1
tmp(82) := STA & '0' & x"0E";	-- TA @14 	#Salva mem[4] com o valor do acumulador  
tmp(83) := CEQ & '0' & x"03";	-- EQ @3 	#Compara o valor com 10
tmp(84) := JEQ & '0' & x"56";	-- EQ @86 	#Se for igual a 10 pula para incremento centena milhar(DEFINIR AINDA)
tmp(85) := RET & '0' & x"00";	-- ET @0
tmp(86) := LDA & '0' & x"0E";	-- DA @14 	#Carrega acumulador com o valor de MEM[14](dze milhares)
tmp(87) := STA & '0' & x"00";	-- TA @0 	#Salva mem[14] com o valor 0
tmp(88) := LDA & '0' & x"0F";	-- DA @15 	#Carrega acumulador com o valor de MEM[5](cent milhares)
tmp(89) := SOMA & '0' & x"01";	-- OMA @1 
tmp(90) := STA & '0' & x"0F";	-- TA @15 	#Salva mem[5] com o valor do acumulador
tmp(91) := CEQ & '0' & x"03";	-- EQ @3 	#Compara o valor com 10
tmp(92) := JEQ & '0' & x"5E";	-- EQ @94 	#PULA PARA LED OVERFL0W (DEFINIR AINDA)
tmp(93) := RET & '0' & x"00";	-- ET @0
tmp(94) := LDA & '0' & x"01";	-- DA @1 	#Carrega acumulador com 1
tmp(95) := STA & '0' & x"10";	-- TA @16 	#Salva o valor do acumulador na mem[6]
tmp(96) := STA & '1' & x"02";	-- TA @258 	#Acende o LED de overflow
tmp(97) := RET & '0' & x"00";	-- ET @0
tmp(98) := LDA & '0' & x"0A";	-- DA @10
tmp(99) := STA & '1' & x"20";	-- TA @288
tmp(100) := LDA & '0' & x"0B";	-- DA @11
tmp(101) := STA & '1' & x"21";	-- TA @289
tmp(102) := LDA & '0' & x"0C";	-- DA @12
tmp(103) := STA & '1' & x"22";	-- TA @290
tmp(104) := LDA & '0' & x"0D";	-- DA @13
tmp(105) := STA & '1' & x"23";	-- TA @291
tmp(106) := LDA & '0' & x"0E";	-- DA @14
tmp(107) := STA & '1' & x"24";	-- TA @292
tmp(108) := LDA & '0' & x"0F";	-- DA @15
tmp(109) := STA & '1' & x"25";	-- TA @293
tmp(110) := RET & '0' & x"00";	-- ET @0
tmp(111) := STA & '1' & x"FD";	-- TA @509 	#Limpa FPGA_RESET
tmp(112) := LDA & '0' & x"00";	-- DA @0
tmp(113) := STA & '0' & x"0A";	-- TA @10 	#Salva mem[10] com o valor do acumulador
tmp(114) := STA & '0' & x"0B";	-- TA @11 	#Salva mem[11] com o valor do acumulador
tmp(115) := STA & '0' & x"0C";	-- TA @12 	#Salva mem[12] com o valor do acumulador
tmp(116) := STA & '0' & x"0D";	-- TA @13 	#Salva mem[13] com o valor do acumulador
tmp(117) := STA & '0' & x"0E";	-- TA @14 	#Salva mem[14] com o valor do acumulador
tmp(118) := STA & '0' & x"0F";	-- TA @15 	#Salva mem[15] com o valor do acumulador
tmp(119) := STA & '0' & x"10";	-- TA @16 	#Salva mem[16] com o valor do acumulador
tmp(120) := STA & '1' & x"01";	-- TA @257 	#Apaga o LED[8] de overflow
tmp(121) := STA & '1' & x"02";	-- TA @258 	#Apaga o LED[9] de limite de contagem
tmp(122) := RET & '0' & x"00";	-- ET @0

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;