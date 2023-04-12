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
	
tmp(0) := "0100000000000";	-- LDI $0				#Carrega o acumulador com o valor 0
tmp(1) := "0101000000000";	-- STA @0				#Armazena o valor do acumulador em MEM[0] (constante 0)
tmp(2) := "0101000000010";	-- STA @2				#Armazena o valor do acumulador em MEM[2] (contador)
tmp(3) := "0100000000001";	-- LDI $1				#Carrega o acumulador com o valor 1
tmp(4) := "0101000000001";	-- STA @1				#Armazena o valor do acumulador em MEM[1] (constante 1)
tmp(5) := "0000000000000";	-- NOP
tmp(6) := "0001101100000";	-- LDA @352				#Carrega o acumulador com a leitura do botão KEY0
tmp(7) := "0101100100000";	-- STA @288				#Armazena o valor lido em HEX0 (para verificar erros de leitura)
tmp(8) := "1000000000000";	-- CEQ @0				#Compara com o valor de MEM[0] (constante 0)
tmp(9) := "0111000001011";	-- JEQ @11				#Desvia se igual a 0 (botão não foi pressionado)
tmp(10) := "1001000001101";	-- JSR @13				#O botão foi pressionado, chama a sub-rotina de incremento
tmp(11) := "0000000000000";	-- NOP				#Retorno da sub-rotina de incremento
tmp(12) := "0110000000101";	-- JMP @5				#Fecha o laço principal, faz uma nova leitura de KEY0
tmp(13) := "0101111111111";	-- STA @511				#Limpa a leitura do botão
tmp(14) := "0001000000010";	-- LDA @2				#Carrega o valor de MEM[2] (contador)
tmp(15) := "0010000000001";	-- SOMA @1				#Soma com a constante em MEM[1]
tmp(16) := "0101000000010";	-- STA @2				#Salva o incremento em MEM[2] (contador)
tmp(17) := "0101100000010";	-- STA @258				#Armazena o valor do bit0 do acumulador no LDR9
tmp(18) := "0101100100101";	-- STA @293				#Armazena o valor do acumulador no HEX5
tmp(19) := "1010000000000";	-- RET				#Retorna da sub-rotina
	
	
	

	





		
		  

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;