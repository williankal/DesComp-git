library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounceMem is
    port (
          saida : out std_logic;
         clk : in std_logic;
		   rst: in std_logic
	  );
end entity;

architecture comportamento of debounceMem is
begin
    process(rst, clk)
    begin
		if(rst = '1') then
			saida <= '0';
		elsif (rising_edge(clk)) then
			saida <= '1';
		end if;
		
    end process;
	 
	 
end architecture;