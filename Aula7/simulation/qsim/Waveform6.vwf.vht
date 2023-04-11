-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "04/11/2023 11:49:53"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Aula7
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Aula7_vhd_vec_tst IS
END Aula7_vhd_vec_tst;
ARCHITECTURE Aula7_arch OF Aula7_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL ENTRADAX_ULA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ENTRADAY_ULA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL HABILITASW : STD_LOGIC;
SIGNAL HABLITAHEX : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL KEY_RST : STD_LOGIC;
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL OUT_HEXTESTE : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL READTESTE : STD_LOGIC;
SIGNAL Reg_retorno : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SAIDA_ULTA : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SELE_ULA : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL WRITETESTE : STD_LOGIC;
COMPONENT Aula7
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	ENTRADAX_ULA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ENTRADAY_ULA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	HABILITASW : OUT STD_LOGIC;
	HABLITAHEX : OUT STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	KEY_RST : IN STD_LOGIC;
	LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	OUT_HEXTESTE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	READTESTE : OUT STD_LOGIC;
	Reg_retorno : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SAIDA_ULTA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SELE_ULA : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	WRITETESTE : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Aula7
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	ENTRADAX_ULA => ENTRADAX_ULA,
	ENTRADAY_ULA => ENTRADAY_ULA,
	HABILITASW => HABILITASW,
	HABLITAHEX => HABLITAHEX,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	KEY_RST => KEY_RST,
	LEDR => LEDR,
	OUT_HEXTESTE => OUT_HEXTESTE,
	READTESTE => READTESTE,
	Reg_retorno => Reg_retorno,
	SAIDA_ULTA => SAIDA_ULTA,
	SELE_ULA => SELE_ULA,
	SW => SW,
	WRITETESTE => WRITETESTE
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
	CLOCK_50 <= '0';
WAIT;
END PROCESS t_prcs_CLOCK_50;

-- KEY[3]
t_prcs_KEY_3: PROCESS
BEGIN
	KEY(3) <= '0';
WAIT;
END PROCESS t_prcs_KEY_3;

-- KEY[2]
t_prcs_KEY_2: PROCESS
BEGIN
	KEY(2) <= '0';
WAIT;
END PROCESS t_prcs_KEY_2;

-- KEY[1]
t_prcs_KEY_1: PROCESS
BEGIN
	KEY(1) <= '0';
WAIT;
END PROCESS t_prcs_KEY_1;

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
LOOP
	KEY(0) <= '0';
	WAIT FOR 20000 ps;
	KEY(0) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_KEY_0;

-- KEY_RST
t_prcs_KEY_RST: PROCESS
BEGIN
	KEY_RST <= '0';
WAIT;
END PROCESS t_prcs_KEY_RST;
-- SW[9]
t_prcs_SW_9: PROCESS
BEGIN
	SW(9) <= '0';
WAIT;
END PROCESS t_prcs_SW_9;
-- SW[8]
t_prcs_SW_8: PROCESS
BEGIN
	SW(8) <= '0';
WAIT;
END PROCESS t_prcs_SW_8;
-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
WAIT;
END PROCESS t_prcs_SW_7;
-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	SW(6) <= '0';
WAIT;
END PROCESS t_prcs_SW_6;
-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
	SW(5) <= '0';
WAIT;
END PROCESS t_prcs_SW_5;
-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
	SW(4) <= '0';
WAIT;
END PROCESS t_prcs_SW_4;
-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
	SW(3) <= '0';
WAIT;
END PROCESS t_prcs_SW_3;
-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
	SW(2) <= '0';
WAIT;
END PROCESS t_prcs_SW_2;
-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	SW(1) <= '0';
WAIT;
END PROCESS t_prcs_SW_1;
-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	SW(0) <= '0';
WAIT;
END PROCESS t_prcs_SW_0;
END Aula7_arch;
