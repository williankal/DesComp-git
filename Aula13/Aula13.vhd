library ieee;
use ieee.std_logic_1164.all;

entity Aula13 is
  generic ( 
	larguraDados : natural := 32;
	larguraAddrRegistradores : natural := 5;
	simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
	 WR_R3: in std_logic;
	 Operacao_ULA: in std_logic;
	 ULA_A: out std_logic_vector(larguraDados-1 downto 0);
	 ULA_B: out std_logic_vector(larguraDados-1 downto 0);
	 Instruction: out std_logic_vector(larguraDados-1 downto 0);
	 
	 --TESTE
	 PC_OUT: out std_logic_vector(31 downto 0);
	 INST_OUT: out std_logic_vector(31 downto 0);
	 ULA_OUT: out std_logic_vector(31 downto 0)
  );
end entity;

architecture arquitetura of Aula13 is
	signal CLK : std_logic;
	signal PC_ROM_SOMA : std_logic_vector(larguraDados-1 downto 0);
	signal somador_PC: std_logic_vector(larguraDados-1 downto 0);
	signal bancoReg_ULA_A: std_logic_vector(larguraDados-1 downto 0);
	signal bancoReg_ULA_B: std_logic_vector(larguraDados-1 downto 0);
	signal saida_ULA: std_logic_vector(larguraDados-1 downto 0);
	
	signal REG_RS: std_logic_vector(4 downto 0);
	signal REG_RT: std_logic_vector(4 downto 0);
	signal REG_RD: std_logic_vector(4 downto 0);
	
	begin

CLK <= CLOCK_50;
	
PC : entity work.registradorGenerico   generic map (larguraDados => larguraDados)
          port map (DIN => somador_PC, DOUT => PC_ROM_SOMA, ENABLE => '1', CLK => CLK, RST => '0');
			 
somadorConstante :  entity work.somaConstante  generic map (larguraDados => larguraDados, constante => 4)
        port map( entrada => PC_ROM_SOMA, saida => somador_PC);

ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraDados)
          port map (entradaA => bancoReg_ULA_A, entradaB => bancoReg_ULA_B, saida => Saida_ULA, seletor => Operacao_ULA);		
			 
Banco_Registradores : entity work.bancoReg
		generic map (larguraDados => larguraDados, larguraEndBancoRegs => larguraAddrRegistradores)
		port map ( 
			  clk => CLK,
			  enderecoA => REG_RS,
			  enderecoB => REG_RT,
			  enderecoC => REG_RD,
			  dadoEscritaC => saida_ULA,
			  escreveC => Wr_R3,
			  saidaA => bancoReg_ULA_A,
			  saidaB => bancoReg_ULA_B
		 );
		 
--ROM : entity work.memoriaROM   generic map (dataWidth => 32, addrWidth => 32)
--          port map (Endereco => PC_ROM_SOMA, Dado => instruction, clk => CLK);
			 
ROMMIPS: entity work.ROMMIPS 
          port map (Endereco => PC_ROM_SOMA, Dado => instruction);
			 
ULA_A <= bancoReg_ULA_A;
ULA_B <= bancoReg_ULA_B;
REG_RS <= instruction(25 downto 21);
REG_RT <= instruction (20 downto 16);
REG_RD <= instruction(15 downto 11);

--TESTEPC
PC_OUT <= PC_ROM_SOMA;
INST_OUT<= instruction;
ULA_OUT <= Saida_ULA;
end architecture;