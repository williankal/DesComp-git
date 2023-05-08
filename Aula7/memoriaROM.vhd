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



tmp(0) := LDI & R0 & '0' & x"00";	-- LDI %R0 $0
tmp(1) := ADDI & R0 & '0' & x"01";	-- ADDI %R0 $1
tmp(2) := STA & R0 & '1' & x"20";	-- LDA %R0 .HEX0
tmp(3) := ADDI & R0 & '0' & x"02";	-- ADDI %R0 $2
tmp(4) := STA & R0 & '1' & x"21";	-- LDA %R0 .HEX1
tmp(5) := ADDI & R0 & '0' & x"03";	-- ADDI %R0 $3
tmp(6) := STA & R0 & '1' & x"22";	-- LDA %R0 .HEX2
tmp(7) := ADDI & R0 & '0' & x"05";	-- ADDI %R0 $5
tmp(8) := STA & R0 & '1' & x"23";	-- LDA %R0 .HEX3
tmp(9) := ADDI & R1 & '0' & x"01";	-- ADDI %R1 $1
tmp(10) := LDI & R2 & '0' & x"05";	-- LDI %R2 $5
tmp(11) := STA & R2 & '0' & x"05";	-- STA %R2 @5
tmp(12) := SOMA & R2 & '0' & x"05";	-- SOMA %R2 @5
tmp(13) := STA & R2 & '1' & x"24";	-- LDA %R2 .HEX4
tmp(14) := STA & R1 & '1' & x"25";	-- LDA %R1 .HEX5




        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;