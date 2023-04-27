
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 32;
          addrWidth: natural := 32

    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0);
			 clk: in std_logic
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria is array(0 TO 2**addrWidth - 1) of std_logic_vector(dataWidth-1 DOWNTO 0);

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
		--		  OPCODE Rs    Rt    Rd    shamt funct
		
       tmp(0) := "000000" & "01001" & "01000" & "01010" & "00000" & "100000";
        tmp(4) := "000000" & "01001" & "01000" & "01010" & "00000" & "100000";
        tmp(8) := 32x"00";
        tmp(12) := 32x"00";
        tmp(16) := 32x"00";
        tmp(20) := 32x"00";
        tmp(24) := 32x"00";
        tmp(28) := 32x"00";
        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;