library ieee;
use ieee.std_logic_1164.all;

entity decoder3x8 is
  port ( entrada : in std_logic_vector(2 downto 0);
         saida : out std_logic_vector(7 downto 0)
  );
end entity;

architecture comportamento of decoder3x8 is
  constant Bloco0: std_logic_vector(7 downto 0) := "00000001";
  constant Bloco1: std_logic_vector(7 downto 0) := "00000010";
  constant Bloco2: std_logic_vector(7 downto 0) := "00000100";
  constant Bloco3: std_logic_vector(7 downto 0) := "00001000";
  constant Bloco4: std_logic_vector(7 downto 0) := "00010000";
  constant Bloco5: std_logic_vector(7 downto 0) := "00100000";
  constant Bloco6: std_logic_vector(7 downto 0) := "01000000";
  constant Bloco7: std_logic_vector(7 downto 0) := "10000000";
  


  begin
    saida <= Bloco0 when entrada = "000" else
             Bloco1 when entrada = "001" else
             Bloco2 when entrada = "010" else
             Bloco3 when entrada = "011" else
             Bloco4 when entrada = "100" else
             Bloco5 when entrada = "101" else
             Bloco6 when entrada = "110" else
             Bloco7 when entrada = "111" else
             "00000000";

    
end architecture;