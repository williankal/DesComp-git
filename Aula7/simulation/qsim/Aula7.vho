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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "03/22/2023 12:50:01"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Aula7 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	LEDR : OUT std_logic_vector(9 DOWNTO 0);
	Reg_retorno : OUT std_logic_vector(7 DOWNTO 0)
	);
END Aula7;

-- Design Ports Information
-- CLOCK_50	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_AA2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[1]	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[2]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[3]	=>  Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[4]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[5]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[6]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[7]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[8]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[9]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- Reg_retorno[0]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[1]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[2]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[3]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[4]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[5]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[6]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reg_retorno[7]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_U7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Aula7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_Reg_retorno : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~inputCLKENA0_outclk\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~1_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~2\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~5_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~10_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~30\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~26\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~21_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~22\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~17_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[8]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~12_combout\ : std_logic;
SIGNAL \ROM1|memROM~5_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~6\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~10\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~14\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~33_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~34\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~29_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|DOUT[7]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|DOUT[4]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~11_combout\ : std_logic;
SIGNAL \ROM1|memROM~4_combout\ : std_logic;
SIGNAL \ROM1|memROM~4_wirecell_combout\ : std_logic;
SIGNAL \ROM1|memROM~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~3_combout\ : std_logic;
SIGNAL \CPU|DECODER|Equal10~0_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~25_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~2_combout\ : std_logic;
SIGNAL \ROM1|memROM~6_combout\ : std_logic;
SIGNAL \ROM1|memROM~7_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~13_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~8_combout\ : std_logic;
SIGNAL \ROM1|memROM~9_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~9_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~0_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida[6]~0_combout\ : std_logic;
SIGNAL \CPU|DECODER|Equal10~1_combout\ : std_logic;
SIGNAL \RAM|process_0~1_combout\ : std_logic;
SIGNAL \RAM|process_0~0_combout\ : std_logic;
SIGNAL \RAM|ram~545_combout\ : std_logic;
SIGNAL \RAM|ram~39_q\ : std_logic;
SIGNAL \RAM|ram~546_combout\ : std_logic;
SIGNAL \RAM|ram~31_q\ : std_logic;
SIGNAL \RAM|ram~544_combout\ : std_logic;
SIGNAL \RAM|ram~15_q\ : std_logic;
SIGNAL \RAM|ram~23feeder_combout\ : std_logic;
SIGNAL \RAM|ram~543_combout\ : std_logic;
SIGNAL \RAM|ram~23_q\ : std_logic;
SIGNAL \RAM|ram~527_combout\ : std_logic;
SIGNAL \RAM|ram~528_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~34_cout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~1_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida[4]~1_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida~2_combout\ : std_logic;
SIGNAL \LED_COMBO|DOUT[0]~feeder_combout\ : std_logic;
SIGNAL \Habilita_LED~0_combout\ : std_logic;
SIGNAL \RAM|ram~24feeder_combout\ : std_logic;
SIGNAL \RAM|ram~24_q\ : std_logic;
SIGNAL \RAM|ram~40_q\ : std_logic;
SIGNAL \RAM|ram~32_q\ : std_logic;
SIGNAL \RAM|ram~16_q\ : std_logic;
SIGNAL \RAM|ram~529_combout\ : std_logic;
SIGNAL \RAM|ram~530_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~2\ : std_logic;
SIGNAL \CPU|ULA1|Add0~5_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[1]~1_combout\ : std_logic;
SIGNAL \LED_COMBO|DOUT[1]~feeder_combout\ : std_logic;
SIGNAL \RAM|ram~25feeder_combout\ : std_logic;
SIGNAL \RAM|ram~25_q\ : std_logic;
SIGNAL \RAM|ram~41_q\ : std_logic;
SIGNAL \RAM|ram~17feeder_combout\ : std_logic;
SIGNAL \RAM|ram~17_q\ : std_logic;
SIGNAL \RAM|ram~33_q\ : std_logic;
SIGNAL \RAM|ram~531_combout\ : std_logic;
SIGNAL \RAM|ram~532_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~6\ : std_logic;
SIGNAL \CPU|ULA1|Add0~9_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[2]~2_combout\ : std_logic;
SIGNAL \LED_COMBO|DOUT[2]~feeder_combout\ : std_logic;
SIGNAL \RAM|ram~42_q\ : std_logic;
SIGNAL \RAM|ram~18_q\ : std_logic;
SIGNAL \RAM|ram~26_q\ : std_logic;
SIGNAL \RAM|ram~34_q\ : std_logic;
SIGNAL \RAM|ram~533_combout\ : std_logic;
SIGNAL \RAM|ram~534_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~10\ : std_logic;
SIGNAL \CPU|ULA1|Add0~13_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[3]~3_combout\ : std_logic;
SIGNAL \RAM|ram~35_q\ : std_logic;
SIGNAL \RAM|ram~43_q\ : std_logic;
SIGNAL \RAM|ram~27_q\ : std_logic;
SIGNAL \RAM|ram~19_q\ : std_logic;
SIGNAL \RAM|ram~535_combout\ : std_logic;
SIGNAL \RAM|ram~536_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~14\ : std_logic;
SIGNAL \CPU|ULA1|Add0~17_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[4]~4_combout\ : std_logic;
SIGNAL \RAM|ram~28_q\ : std_logic;
SIGNAL \RAM|ram~20_q\ : std_logic;
SIGNAL \RAM|ram~44_q\ : std_logic;
SIGNAL \RAM|ram~36_q\ : std_logic;
SIGNAL \RAM|ram~537_combout\ : std_logic;
SIGNAL \RAM|ram~538_combout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[5]~5_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~18\ : std_logic;
SIGNAL \CPU|ULA1|Add0~21_sumout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \LED_COMBO|DOUT[5]~feeder_combout\ : std_logic;
SIGNAL \RAM|ram~45feeder_combout\ : std_logic;
SIGNAL \RAM|ram~45_q\ : std_logic;
SIGNAL \RAM|ram~29_q\ : std_logic;
SIGNAL \RAM|ram~21_q\ : std_logic;
SIGNAL \RAM|ram~37_q\ : std_logic;
SIGNAL \RAM|ram~539_combout\ : std_logic;
SIGNAL \RAM|ram~540_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~22\ : std_logic;
SIGNAL \CPU|ULA1|Add0~25_sumout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[6]~6_combout\ : std_logic;
SIGNAL \RAM|ram~38_q\ : std_logic;
SIGNAL \RAM|ram~30feeder_combout\ : std_logic;
SIGNAL \RAM|ram~30_q\ : std_logic;
SIGNAL \RAM|ram~46_q\ : std_logic;
SIGNAL \RAM|ram~22_q\ : std_logic;
SIGNAL \RAM|ram~541_combout\ : std_logic;
SIGNAL \RAM|ram~542_combout\ : std_logic;
SIGNAL \CPU|MUX1|saida_MUX[7]~7_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add0~26\ : std_logic;
SIGNAL \CPU|ULA1|Add0~29_sumout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[7]~DUPLICATE_q\ : std_logic;
SIGNAL \LEDR8|DOUT~0_combout\ : std_logic;
SIGNAL \LEDR8|DOUT~q\ : std_logic;
SIGNAL \LEDR9|DOUT~0_combout\ : std_logic;
SIGNAL \LEDR9|DOUT~q\ : std_logic;
SIGNAL \LED_COMBO|DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|REGA|DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|PC|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|REGA|ALT_INV_DOUT[7]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[4]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[7]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[8]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|REGA|ALT_INV_DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|PC|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\ : std_logic;
SIGNAL \RAM|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~12_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \CPU|DECODER|ALT_INV_Equal10~1_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~542_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~541_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~38_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~46_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~22_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~30_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~540_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~539_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~37_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~45_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~21_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~29_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~538_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~537_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~36_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~44_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~20_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~28_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~536_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~535_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~35_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~43_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~19_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~27_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~534_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~533_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~34_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~42_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~18_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~26_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~532_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~531_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~33_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~41_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~17_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~25_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~530_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~529_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~32_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~40_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~16_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~24_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~528_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~527_combout\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~31_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~39_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~15_q\ : std_logic;
SIGNAL \RAM|ALT_INV_ram~23_q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \CPU|DECODER|ALT_INV_saida[6]~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \LEDR9|ALT_INV_DOUT~q\ : std_logic;
SIGNAL \LEDR8|ALT_INV_DOUT~q\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
LEDR <= ww_LEDR;
Reg_retorno <= ww_Reg_retorno;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\CPU|REGA|ALT_INV_DOUT[7]~DUPLICATE_q\ <= NOT \CPU|REGA|DOUT[7]~DUPLICATE_q\;
\CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\ <= NOT \CPU|REGA|DOUT[5]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[4]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[4]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[5]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[6]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[7]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[7]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[8]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[8]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[3]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[2]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[1]~DUPLICATE_q\;
\CPU|REGA|ALT_INV_DOUT\(7) <= NOT \CPU|REGA|DOUT\(7);
\CPU|REGA|ALT_INV_DOUT\(6) <= NOT \CPU|REGA|DOUT\(6);
\CPU|REGA|ALT_INV_DOUT\(5) <= NOT \CPU|REGA|DOUT\(5);
\CPU|REGA|ALT_INV_DOUT\(4) <= NOT \CPU|REGA|DOUT\(4);
\CPU|REGA|ALT_INV_DOUT\(3) <= NOT \CPU|REGA|DOUT\(3);
\CPU|REGA|ALT_INV_DOUT\(2) <= NOT \CPU|REGA|DOUT\(2);
\CPU|REGA|ALT_INV_DOUT\(1) <= NOT \CPU|REGA|DOUT\(1);
\CPU|REGA|ALT_INV_DOUT\(0) <= NOT \CPU|REGA|DOUT\(0);
\CPU|PC|ALT_INV_DOUT\(4) <= NOT \CPU|PC|DOUT\(4);
\CPU|PC|ALT_INV_DOUT\(5) <= NOT \CPU|PC|DOUT\(5);
\CPU|PC|ALT_INV_DOUT\(6) <= NOT \CPU|PC|DOUT\(6);
\CPU|PC|ALT_INV_DOUT\(7) <= NOT \CPU|PC|DOUT\(7);
\CPU|PC|ALT_INV_DOUT\(8) <= NOT \CPU|PC|DOUT\(8);
\CPU|PC|ALT_INV_DOUT\(3) <= NOT \CPU|PC|DOUT\(3);
\CPU|PC|ALT_INV_DOUT\(2) <= NOT \CPU|PC|DOUT\(2);
\CPU|PC|ALT_INV_DOUT\(1) <= NOT \CPU|PC|DOUT\(1);
\CPU|PC|ALT_INV_DOUT\(0) <= NOT \CPU|PC|DOUT\(0);
\CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[0]~DUPLICATE_q\;
\RAM|ALT_INV_process_0~1_combout\ <= NOT \RAM|process_0~1_combout\;
\ROM1|ALT_INV_memROM~12_combout\ <= NOT \ROM1|memROM~12_combout\;
\ROM1|ALT_INV_memROM~11_combout\ <= NOT \ROM1|memROM~11_combout\;
\CPU|DECODER|ALT_INV_Equal10~1_combout\ <= NOT \CPU|DECODER|Equal10~1_combout\;
\RAM|ALT_INV_process_0~0_combout\ <= NOT \RAM|process_0~0_combout\;
\ROM1|ALT_INV_memROM~10_combout\ <= NOT \ROM1|memROM~10_combout\;
\RAM|ALT_INV_ram~542_combout\ <= NOT \RAM|ram~542_combout\;
\RAM|ALT_INV_ram~541_combout\ <= NOT \RAM|ram~541_combout\;
\RAM|ALT_INV_ram~38_q\ <= NOT \RAM|ram~38_q\;
\RAM|ALT_INV_ram~46_q\ <= NOT \RAM|ram~46_q\;
\RAM|ALT_INV_ram~22_q\ <= NOT \RAM|ram~22_q\;
\RAM|ALT_INV_ram~30_q\ <= NOT \RAM|ram~30_q\;
\RAM|ALT_INV_ram~540_combout\ <= NOT \RAM|ram~540_combout\;
\RAM|ALT_INV_ram~539_combout\ <= NOT \RAM|ram~539_combout\;
\RAM|ALT_INV_ram~37_q\ <= NOT \RAM|ram~37_q\;
\RAM|ALT_INV_ram~45_q\ <= NOT \RAM|ram~45_q\;
\RAM|ALT_INV_ram~21_q\ <= NOT \RAM|ram~21_q\;
\RAM|ALT_INV_ram~29_q\ <= NOT \RAM|ram~29_q\;
\RAM|ALT_INV_ram~538_combout\ <= NOT \RAM|ram~538_combout\;
\RAM|ALT_INV_ram~537_combout\ <= NOT \RAM|ram~537_combout\;
\RAM|ALT_INV_ram~36_q\ <= NOT \RAM|ram~36_q\;
\RAM|ALT_INV_ram~44_q\ <= NOT \RAM|ram~44_q\;
\RAM|ALT_INV_ram~20_q\ <= NOT \RAM|ram~20_q\;
\RAM|ALT_INV_ram~28_q\ <= NOT \RAM|ram~28_q\;
\RAM|ALT_INV_ram~536_combout\ <= NOT \RAM|ram~536_combout\;
\RAM|ALT_INV_ram~535_combout\ <= NOT \RAM|ram~535_combout\;
\RAM|ALT_INV_ram~35_q\ <= NOT \RAM|ram~35_q\;
\RAM|ALT_INV_ram~43_q\ <= NOT \RAM|ram~43_q\;
\RAM|ALT_INV_ram~19_q\ <= NOT \RAM|ram~19_q\;
\RAM|ALT_INV_ram~27_q\ <= NOT \RAM|ram~27_q\;
\RAM|ALT_INV_ram~534_combout\ <= NOT \RAM|ram~534_combout\;
\RAM|ALT_INV_ram~533_combout\ <= NOT \RAM|ram~533_combout\;
\RAM|ALT_INV_ram~34_q\ <= NOT \RAM|ram~34_q\;
\RAM|ALT_INV_ram~42_q\ <= NOT \RAM|ram~42_q\;
\RAM|ALT_INV_ram~18_q\ <= NOT \RAM|ram~18_q\;
\RAM|ALT_INV_ram~26_q\ <= NOT \RAM|ram~26_q\;
\RAM|ALT_INV_ram~532_combout\ <= NOT \RAM|ram~532_combout\;
\RAM|ALT_INV_ram~531_combout\ <= NOT \RAM|ram~531_combout\;
\RAM|ALT_INV_ram~33_q\ <= NOT \RAM|ram~33_q\;
\RAM|ALT_INV_ram~41_q\ <= NOT \RAM|ram~41_q\;
\RAM|ALT_INV_ram~17_q\ <= NOT \RAM|ram~17_q\;
\RAM|ALT_INV_ram~25_q\ <= NOT \RAM|ram~25_q\;
\RAM|ALT_INV_ram~530_combout\ <= NOT \RAM|ram~530_combout\;
\RAM|ALT_INV_ram~529_combout\ <= NOT \RAM|ram~529_combout\;
\RAM|ALT_INV_ram~32_q\ <= NOT \RAM|ram~32_q\;
\RAM|ALT_INV_ram~40_q\ <= NOT \RAM|ram~40_q\;
\RAM|ALT_INV_ram~16_q\ <= NOT \RAM|ram~16_q\;
\RAM|ALT_INV_ram~24_q\ <= NOT \RAM|ram~24_q\;
\RAM|ALT_INV_ram~528_combout\ <= NOT \RAM|ram~528_combout\;
\ROM1|ALT_INV_memROM~9_combout\ <= NOT \ROM1|memROM~9_combout\;
\ROM1|ALT_INV_memROM~8_combout\ <= NOT \ROM1|memROM~8_combout\;
\ROM1|ALT_INV_memROM~7_combout\ <= NOT \ROM1|memROM~7_combout\;
\ROM1|ALT_INV_memROM~6_combout\ <= NOT \ROM1|memROM~6_combout\;
\RAM|ALT_INV_ram~527_combout\ <= NOT \RAM|ram~527_combout\;
\RAM|ALT_INV_ram~31_q\ <= NOT \RAM|ram~31_q\;
\RAM|ALT_INV_ram~39_q\ <= NOT \RAM|ram~39_q\;
\RAM|ALT_INV_ram~15_q\ <= NOT \RAM|ram~15_q\;
\RAM|ALT_INV_ram~23_q\ <= NOT \RAM|ram~23_q\;
\ROM1|ALT_INV_memROM~5_combout\ <= NOT \ROM1|memROM~5_combout\;
\ROM1|ALT_INV_memROM~4_combout\ <= NOT \ROM1|memROM~4_combout\;
\CPU|DECODER|ALT_INV_saida[6]~0_combout\ <= NOT \CPU|DECODER|saida[6]~0_combout\;
\ROM1|ALT_INV_memROM~3_combout\ <= NOT \ROM1|memROM~3_combout\;
\ROM1|ALT_INV_memROM~2_combout\ <= NOT \ROM1|memROM~2_combout\;
\ROM1|ALT_INV_memROM~1_combout\ <= NOT \ROM1|memROM~1_combout\;
\ROM1|ALT_INV_memROM~0_combout\ <= NOT \ROM1|memROM~0_combout\;
\LEDR9|ALT_INV_DOUT~q\ <= NOT \LEDR9|DOUT~q\;
\LEDR8|ALT_INV_DOUT~q\ <= NOT \LEDR8|DOUT~q\;

-- Location: IOOBUF_X0_Y18_N79
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(0),
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X0_Y18_N96
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(1),
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X0_Y18_N62
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(2),
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X0_Y18_N45
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(3),
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X0_Y19_N39
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(4),
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X0_Y19_N56
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(5),
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X0_Y19_N5
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(6),
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X0_Y19_N22
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LED_COMBO|DOUT\(7),
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X0_Y20_N39
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR8|DOUT~q\,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X0_Y20_N56
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR9|DOUT~q\,
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOOBUF_X10_Y0_N59
\Reg_retorno[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(0));

-- Location: IOOBUF_X8_Y45_N76
\Reg_retorno[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(1));

-- Location: IOOBUF_X54_Y21_N56
\Reg_retorno[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(2));

-- Location: IOOBUF_X10_Y0_N76
\Reg_retorno[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(3));

-- Location: IOOBUF_X11_Y0_N53
\Reg_retorno[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(4));

-- Location: IOOBUF_X11_Y0_N19
\Reg_retorno[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(5));

-- Location: IOOBUF_X8_Y45_N59
\Reg_retorno[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(6));

-- Location: IOOBUF_X10_Y0_N42
\Reg_retorno[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|MUX1|saida_MUX[7]~7_combout\,
	devoe => ww_devoe,
	o => ww_Reg_retorno(7));

-- Location: IOIBUF_X10_Y0_N92
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: CLKCTRL_G6
\KEY[0]~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~input_o\,
	outclk => \KEY[0]~inputCLKENA0_outclk\);

-- Location: MLABCELL_X9_Y21_N30
\CPU|incrementaPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~1_sumout\ = SUM(( \CPU|PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))
-- \CPU|incrementaPC|Add0~2\ = CARRY(( \CPU|PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(0),
	cin => GND,
	sumout => \CPU|incrementaPC|Add0~1_sumout\,
	cout => \CPU|incrementaPC|Add0~2\);

-- Location: FF_X9_Y21_N46
\CPU|PC|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~29_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(5));

-- Location: MLABCELL_X9_Y21_N33
\CPU|incrementaPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~5_sumout\ = SUM(( \CPU|PC|DOUT\(1) ) + ( GND ) + ( \CPU|incrementaPC|Add0~2\ ))
-- \CPU|incrementaPC|Add0~6\ = CARRY(( \CPU|PC|DOUT\(1) ) + ( GND ) + ( \CPU|incrementaPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(1),
	cin => \CPU|incrementaPC|Add0~2\,
	sumout => \CPU|incrementaPC|Add0~5_sumout\,
	cout => \CPU|incrementaPC|Add0~6\);

-- Location: FF_X9_Y21_N32
\CPU|PC|DOUT[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~1_sumout\,
	asdata => \ROM1|memROM~4_wirecell_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[0]~DUPLICATE_q\);

-- Location: MLABCELL_X9_Y21_N24
\ROM1|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~10_combout\ = ( \ROM1|memROM~2_combout\ & ( \CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & (!\CPU|PC|DOUT\(1) & !\CPU|PC|DOUT[2]~DUPLICATE_q\)) ) ) ) # ( \ROM1|memROM~2_combout\ & ( !\CPU|PC|DOUT[3]~DUPLICATE_q\ & ( 
-- (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & (\CPU|PC|DOUT\(1) & \CPU|PC|DOUT[2]~DUPLICATE_q\)) # (\CPU|PC|DOUT[0]~DUPLICATE_q\ & (!\CPU|PC|DOUT\(1) $ (!\CPU|PC|DOUT[2]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110011110000000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT\(1),
	datad => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	combout => \ROM1|memROM~10_combout\);

-- Location: FF_X9_Y21_N56
\CPU|PC|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~17_sumout\,
	asdata => \ROM1|memROM~10_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(8));

-- Location: MLABCELL_X9_Y21_N45
\CPU|incrementaPC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~29_sumout\ = SUM(( \CPU|PC|DOUT\(5) ) + ( GND ) + ( \CPU|incrementaPC|Add0~34\ ))
-- \CPU|incrementaPC|Add0~30\ = CARRY(( \CPU|PC|DOUT\(5) ) + ( GND ) + ( \CPU|incrementaPC|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(5),
	cin => \CPU|incrementaPC|Add0~34\,
	sumout => \CPU|incrementaPC|Add0~29_sumout\,
	cout => \CPU|incrementaPC|Add0~30\);

-- Location: MLABCELL_X9_Y21_N48
\CPU|incrementaPC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~25_sumout\ = SUM(( \CPU|PC|DOUT\(6) ) + ( GND ) + ( \CPU|incrementaPC|Add0~30\ ))
-- \CPU|incrementaPC|Add0~26\ = CARRY(( \CPU|PC|DOUT\(6) ) + ( GND ) + ( \CPU|incrementaPC|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(6),
	cin => \CPU|incrementaPC|Add0~30\,
	sumout => \CPU|incrementaPC|Add0~25_sumout\,
	cout => \CPU|incrementaPC|Add0~26\);

-- Location: MLABCELL_X9_Y21_N51
\CPU|incrementaPC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~21_sumout\ = SUM(( \CPU|PC|DOUT\(7) ) + ( GND ) + ( \CPU|incrementaPC|Add0~26\ ))
-- \CPU|incrementaPC|Add0~22\ = CARRY(( \CPU|PC|DOUT\(7) ) + ( GND ) + ( \CPU|incrementaPC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(7),
	cin => \CPU|incrementaPC|Add0~26\,
	sumout => \CPU|incrementaPC|Add0~21_sumout\,
	cout => \CPU|incrementaPC|Add0~22\);

-- Location: FF_X9_Y21_N52
\CPU|PC|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~21_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(7));

-- Location: MLABCELL_X9_Y21_N54
\CPU|incrementaPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~17_sumout\ = SUM(( \CPU|PC|DOUT\(8) ) + ( GND ) + ( \CPU|incrementaPC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(8),
	cin => \CPU|incrementaPC|Add0~22\,
	sumout => \CPU|incrementaPC|Add0~17_sumout\);

-- Location: FF_X9_Y21_N55
\CPU|PC|DOUT[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~17_sumout\,
	asdata => \ROM1|memROM~10_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[8]~DUPLICATE_q\);

-- Location: FF_X9_Y21_N34
\CPU|PC|DOUT[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~5_sumout\,
	asdata => \ROM1|memROM~5_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[1]~DUPLICATE_q\);

-- Location: LABCELL_X10_Y21_N42
\ROM1|memROM~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~12_combout\ = ( \CPU|PC|DOUT[1]~DUPLICATE_q\ & ( \CPU|PC|DOUT\(2) & ( (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT[3]~DUPLICATE_q\) ) ) ) # ( \CPU|PC|DOUT[1]~DUPLICATE_q\ & ( !\CPU|PC|DOUT\(2) & ( (!\CPU|PC|DOUT\(0) & \CPU|PC|DOUT[3]~DUPLICATE_q\) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(0),
	datac => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datae => \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT\(2),
	combout => \ROM1|memROM~12_combout\);

-- Location: LABCELL_X10_Y21_N27
\ROM1|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~5_combout\ = ( !\CPU|PC|DOUT\(4) & ( \ROM1|memROM~12_combout\ & ( (!\CPU|PC|DOUT\(5) & (!\CPU|PC|DOUT\(6) & (!\CPU|PC|DOUT[8]~DUPLICATE_q\ & !\CPU|PC|DOUT\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(5),
	datab => \CPU|PC|ALT_INV_DOUT\(6),
	datac => \CPU|PC|ALT_INV_DOUT[8]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT\(7),
	datae => \CPU|PC|ALT_INV_DOUT\(4),
	dataf => \ROM1|ALT_INV_memROM~12_combout\,
	combout => \ROM1|memROM~5_combout\);

-- Location: FF_X9_Y21_N35
\CPU|PC|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~5_sumout\,
	asdata => \ROM1|memROM~5_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(1));

-- Location: MLABCELL_X9_Y21_N36
\CPU|incrementaPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~9_sumout\ = SUM(( \CPU|PC|DOUT\(2) ) + ( GND ) + ( \CPU|incrementaPC|Add0~6\ ))
-- \CPU|incrementaPC|Add0~10\ = CARRY(( \CPU|PC|DOUT\(2) ) + ( GND ) + ( \CPU|incrementaPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(2),
	cin => \CPU|incrementaPC|Add0~6\,
	sumout => \CPU|incrementaPC|Add0~9_sumout\,
	cout => \CPU|incrementaPC|Add0~10\);

-- Location: MLABCELL_X9_Y21_N39
\CPU|incrementaPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~13_sumout\ = SUM(( \CPU|PC|DOUT\(3) ) + ( GND ) + ( \CPU|incrementaPC|Add0~10\ ))
-- \CPU|incrementaPC|Add0~14\ = CARRY(( \CPU|PC|DOUT\(3) ) + ( GND ) + ( \CPU|incrementaPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(3),
	cin => \CPU|incrementaPC|Add0~10\,
	sumout => \CPU|incrementaPC|Add0~13_sumout\,
	cout => \CPU|incrementaPC|Add0~14\);

-- Location: MLABCELL_X9_Y21_N42
\CPU|incrementaPC|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~33_sumout\ = SUM(( \CPU|PC|DOUT\(4) ) + ( GND ) + ( \CPU|incrementaPC|Add0~14\ ))
-- \CPU|incrementaPC|Add0~34\ = CARRY(( \CPU|PC|DOUT\(4) ) + ( GND ) + ( \CPU|incrementaPC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(4),
	cin => \CPU|incrementaPC|Add0~14\,
	sumout => \CPU|incrementaPC|Add0~33_sumout\,
	cout => \CPU|incrementaPC|Add0~34\);

-- Location: FF_X9_Y21_N43
\CPU|PC|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~33_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(4));

-- Location: FF_X9_Y21_N47
\CPU|PC|DOUT[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~29_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[5]~DUPLICATE_q\);

-- Location: FF_X9_Y21_N53
\CPU|PC|DOUT[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~21_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[7]~DUPLICATE_q\);

-- Location: FF_X9_Y21_N44
\CPU|PC|DOUT[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~33_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[4]~DUPLICATE_q\);

-- Location: MLABCELL_X9_Y21_N15
\ROM1|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~11_combout\ = ( \CPU|PC|DOUT\(1) & ( (!\CPU|PC|DOUT\(3) & \CPU|PC|DOUT[0]~DUPLICATE_q\) ) ) # ( !\CPU|PC|DOUT\(1) & ( (!\CPU|PC|DOUT\(3) & (!\CPU|PC|DOUT[0]~DUPLICATE_q\ $ (\CPU|PC|DOUT[2]~DUPLICATE_q\))) # (\CPU|PC|DOUT\(3) & 
-- (\CPU|PC|DOUT[0]~DUPLICATE_q\ & !\CPU|PC|DOUT[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001100001100110000110000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|PC|ALT_INV_DOUT\(3),
	datac => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT\(1),
	combout => \ROM1|memROM~11_combout\);

-- Location: MLABCELL_X9_Y21_N18
\ROM1|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~4_combout\ = ( \CPU|PC|DOUT\(8) & ( \ROM1|memROM~11_combout\ ) ) # ( !\CPU|PC|DOUT\(8) & ( \ROM1|memROM~11_combout\ & ( (((\CPU|PC|DOUT[4]~DUPLICATE_q\) # (\CPU|PC|DOUT[7]~DUPLICATE_q\)) # (\CPU|PC|DOUT[5]~DUPLICATE_q\)) # 
-- (\CPU|PC|DOUT[6]~DUPLICATE_q\) ) ) ) # ( \CPU|PC|DOUT\(8) & ( !\ROM1|memROM~11_combout\ ) ) # ( !\CPU|PC|DOUT\(8) & ( !\ROM1|memROM~11_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\,
	datab => \CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT[7]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT[4]~DUPLICATE_q\,
	datae => \CPU|PC|ALT_INV_DOUT\(8),
	dataf => \ROM1|ALT_INV_memROM~11_combout\,
	combout => \ROM1|memROM~4_combout\);

-- Location: MLABCELL_X9_Y21_N0
\ROM1|memROM~4_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~4_wirecell_combout\ = ( !\ROM1|memROM~4_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \ROM1|memROM~4_wirecell_combout\);

-- Location: FF_X9_Y21_N31
\CPU|PC|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~1_sumout\,
	asdata => \ROM1|memROM~4_wirecell_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(0));

-- Location: LABCELL_X10_Y21_N54
\ROM1|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~1_combout\ = ( \CPU|PC|DOUT[1]~DUPLICATE_q\ & ( \CPU|PC|DOUT[3]~DUPLICATE_q\ & ( \CPU|PC|DOUT\(2) ) ) ) # ( !\CPU|PC|DOUT[1]~DUPLICATE_q\ & ( \CPU|PC|DOUT[3]~DUPLICATE_q\ & ( \CPU|PC|DOUT\(2) ) ) ) # ( \CPU|PC|DOUT[1]~DUPLICATE_q\ & ( 
-- !\CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(2) & !\CPU|PC|DOUT\(0)) ) ) ) # ( !\CPU|PC|DOUT[1]~DUPLICATE_q\ & ( !\CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (\CPU|PC|DOUT\(2) & !\CPU|PC|DOUT\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101000001010000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(2),
	datac => \CPU|PC|ALT_INV_DOUT\(0),
	datae => \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	combout => \ROM1|memROM~1_combout\);

-- Location: MLABCELL_X9_Y21_N12
\ROM1|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~3_combout\ = ( \CPU|PC|DOUT[0]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(3) & ((!\CPU|PC|DOUT\(1)) # (!\CPU|PC|DOUT[2]~DUPLICATE_q\))) ) ) # ( !\CPU|PC|DOUT[0]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(3) & ((\CPU|PC|DOUT[2]~DUPLICATE_q\))) # (\CPU|PC|DOUT\(3) 
-- & (!\CPU|PC|DOUT\(1) & !\CPU|PC|DOUT[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011001100001100001100110011001100110000001100110011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|PC|ALT_INV_DOUT\(3),
	datac => \CPU|PC|ALT_INV_DOUT\(1),
	datad => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	combout => \ROM1|memROM~3_combout\);

-- Location: LABCELL_X10_Y21_N21
\CPU|DECODER|Equal10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|Equal10~0_combout\ = ( \ROM1|memROM~0_combout\ & ( !\ROM1|memROM~3_combout\ & ( (!\ROM1|memROM~1_combout\ & \ROM1|memROM~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~1_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~0_combout\,
	dataf => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \CPU|DECODER|Equal10~0_combout\);

-- Location: FF_X9_Y21_N49
\CPU|PC|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~25_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(6));

-- Location: FF_X9_Y21_N50
\CPU|PC|DOUT[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~25_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[6]~DUPLICATE_q\);

-- Location: MLABCELL_X9_Y21_N3
\ROM1|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~2_combout\ = ( !\CPU|PC|DOUT[7]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[6]~DUPLICATE_q\ & (!\CPU|PC|DOUT[4]~DUPLICATE_q\ & (!\CPU|PC|DOUT[5]~DUPLICATE_q\ & !\CPU|PC|DOUT\(8)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\,
	datab => \CPU|PC|ALT_INV_DOUT[4]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT\(8),
	dataf => \CPU|PC|ALT_INV_DOUT[7]~DUPLICATE_q\,
	combout => \ROM1|memROM~2_combout\);

-- Location: MLABCELL_X9_Y21_N9
\ROM1|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~6_combout\ = ( \CPU|PC|DOUT\(1) & ( (\CPU|PC|DOUT\(3) & (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & !\CPU|PC|DOUT[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000000000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|PC|ALT_INV_DOUT\(3),
	datac => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT\(1),
	combout => \ROM1|memROM~6_combout\);

-- Location: MLABCELL_X9_Y21_N6
\ROM1|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~7_combout\ = ( \ROM1|memROM~6_combout\ & ( \ROM1|memROM~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \ROM1|memROM~7_combout\);

-- Location: FF_X9_Y21_N41
\CPU|PC|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~13_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(3));

-- Location: FF_X9_Y21_N40
\CPU|PC|DOUT[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~13_sumout\,
	asdata => \ROM1|memROM~7_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[3]~DUPLICATE_q\);

-- Location: LABCELL_X10_Y21_N36
\ROM1|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~8_combout\ = ( \CPU|PC|DOUT[1]~DUPLICATE_q\ & ( \CPU|PC|DOUT\(0) & ( (\CPU|PC|DOUT\(2) & !\CPU|PC|DOUT[3]~DUPLICATE_q\) ) ) ) # ( !\CPU|PC|DOUT[1]~DUPLICATE_q\ & ( \CPU|PC|DOUT\(0) & ( (!\CPU|PC|DOUT\(2) & \CPU|PC|DOUT[3]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000010100101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(2),
	datac => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datae => \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT\(0),
	combout => \ROM1|memROM~8_combout\);

-- Location: LABCELL_X10_Y21_N33
\ROM1|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~9_combout\ = ( \ROM1|memROM~8_combout\ & ( \ROM1|memROM~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \ROM1|memROM~9_combout\);

-- Location: FF_X9_Y21_N37
\CPU|PC|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~9_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(2));

-- Location: FF_X9_Y21_N38
\CPU|PC|DOUT[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~9_sumout\,
	asdata => \ROM1|memROM~9_combout\,
	sload => \CPU|DECODER|Equal10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[2]~DUPLICATE_q\);

-- Location: LABCELL_X7_Y21_N3
\ROM1|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_combout\ = ( \CPU|PC|DOUT[0]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[2]~DUPLICATE_q\ & (\CPU|PC|DOUT\(1) & \CPU|PC|DOUT[3]~DUPLICATE_q\)) ) ) # ( !\CPU|PC|DOUT[0]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[2]~DUPLICATE_q\ & (\CPU|PC|DOUT\(1) & 
-- !\CPU|PC|DOUT[3]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000000000000010100000000000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT\(1),
	datad => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	combout => \ROM1|memROM~0_combout\);

-- Location: LABCELL_X6_Y21_N18
\CPU|DECODER|saida[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida[6]~0_combout\ = ( !\ROM1|memROM~1_combout\ & ( (!\ROM1|memROM~0_combout\ & (!\ROM1|memROM~3_combout\ & \ROM1|memROM~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \ROM1|ALT_INV_memROM~3_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \CPU|DECODER|saida[6]~0_combout\);

-- Location: LABCELL_X7_Y21_N36
\CPU|DECODER|Equal10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|Equal10~1_combout\ = ( \ROM1|memROM~1_combout\ & ( (\ROM1|memROM~2_combout\ & (\ROM1|memROM~0_combout\ & !\ROM1|memROM~3_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	datad => \ROM1|ALT_INV_memROM~3_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \CPU|DECODER|Equal10~1_combout\);

-- Location: LABCELL_X5_Y21_N51
\RAM|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|process_0~1_combout\ = ( \ROM1|memROM~2_combout\ & ( \CPU|PC|DOUT[0]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[3]~DUPLICATE_q\ & ((!\CPU|PC|DOUT\(1)) # (!\CPU|PC|DOUT[2]~DUPLICATE_q\))) ) ) ) # ( \ROM1|memROM~2_combout\ & ( !\CPU|PC|DOUT[0]~DUPLICATE_q\ & ( 
-- (!\CPU|PC|DOUT\(1) & (!\CPU|PC|DOUT[2]~DUPLICATE_q\ & \CPU|PC|DOUT[3]~DUPLICATE_q\)) # (\CPU|PC|DOUT\(1) & (\CPU|PC|DOUT[2]~DUPLICATE_q\ & !\CPU|PC|DOUT[3]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001011010000000000000000000001111101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(1),
	datac => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	combout => \RAM|process_0~1_combout\);

-- Location: LABCELL_X5_Y21_N54
\RAM|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|process_0~0_combout\ = ( !\ROM1|memROM~10_combout\ & ( \RAM|process_0~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ROM1|ALT_INV_memROM~10_combout\,
	dataf => \RAM|ALT_INV_process_0~1_combout\,
	combout => \RAM|process_0~0_combout\);

-- Location: LABCELL_X6_Y21_N0
\RAM|ram~545\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~545_combout\ = ( \RAM|process_0~0_combout\ & ( (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & (!\ROM1|memROM~4_combout\ & \ROM1|memROM~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \RAM|ALT_INV_process_0~0_combout\,
	combout => \RAM|ram~545_combout\);

-- Location: FF_X7_Y21_N16
\RAM|ram~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~39_q\);

-- Location: LABCELL_X6_Y21_N12
\RAM|ram~546\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~546_combout\ = ( \RAM|process_0~0_combout\ & ( (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & (\ROM1|memROM~4_combout\ & \ROM1|memROM~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \RAM|ALT_INV_process_0~0_combout\,
	combout => \RAM|ram~546_combout\);

-- Location: FF_X7_Y21_N28
\RAM|ram~31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~31_q\);

-- Location: LABCELL_X6_Y21_N27
\RAM|ram~544\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~544_combout\ = ( \RAM|process_0~0_combout\ & ( (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & (\ROM1|memROM~4_combout\ & !\ROM1|memROM~5_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \RAM|ALT_INV_process_0~0_combout\,
	combout => \RAM|ram~544_combout\);

-- Location: FF_X6_Y21_N10
\RAM|ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~15_q\);

-- Location: MLABCELL_X4_Y21_N6
\RAM|ram~23feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~23feeder_combout\ = ( \CPU|REGA|DOUT\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(0),
	combout => \RAM|ram~23feeder_combout\);

-- Location: MLABCELL_X4_Y21_N54
\RAM|ram~543\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~543_combout\ = ( \RAM|process_0~0_combout\ & ( !\ROM1|memROM~9_combout\ & ( (!\ROM1|memROM~7_combout\ & (!\ROM1|memROM~4_combout\ & !\ROM1|memROM~5_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~7_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~5_combout\,
	datae => \RAM|ALT_INV_process_0~0_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \RAM|ram~543_combout\);

-- Location: FF_X4_Y21_N7
\RAM|ram~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~23feeder_combout\,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~23_q\);

-- Location: LABCELL_X10_Y21_N51
\RAM|ram~527\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~527_combout\ = ( \ROM1|memROM~5_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM|ram~31_q\ ) ) ) # ( !\ROM1|memROM~5_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM|ram~15_q\ ) ) ) # ( \ROM1|memROM~5_combout\ & ( !\ROM1|memROM~4_combout\ & ( 
-- \RAM|ram~39_q\ ) ) ) # ( !\ROM1|memROM~5_combout\ & ( !\ROM1|memROM~4_combout\ & ( \RAM|ram~23_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100001111000011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~39_q\,
	datab => \RAM|ALT_INV_ram~31_q\,
	datac => \RAM|ALT_INV_ram~15_q\,
	datad => \RAM|ALT_INV_ram~23_q\,
	datae => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM|ram~527_combout\);

-- Location: LABCELL_X10_Y21_N6
\RAM|ram~528\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~528_combout\ = ( !\ROM1|memROM~7_combout\ & ( \RAM|ram~527_combout\ & ( !\ROM1|memROM~9_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datae => \ROM1|ALT_INV_memROM~7_combout\,
	dataf => \RAM|ALT_INV_ram~527_combout\,
	combout => \RAM|ram~528_combout\);

-- Location: LABCELL_X6_Y21_N30
\CPU|ULA1|Add0~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~34_cout\ = CARRY(( !\CPU|DECODER|Equal10~1_combout\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	cin => GND,
	cout => \CPU|ULA1|Add0~34_cout\);

-- Location: LABCELL_X6_Y21_N33
\CPU|ULA1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~1_sumout\ = SUM(( \CPU|REGA|DOUT\(0) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~528_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (!\ROM1|memROM~4_combout\)))) ) + ( 
-- \CPU|ULA1|Add0~34_cout\ ))
-- \CPU|ULA1|Add0~2\ = CARRY(( \CPU|REGA|DOUT\(0) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~528_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (!\ROM1|memROM~4_combout\)))) ) + ( \CPU|ULA1|Add0~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011000111100100100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(0),
	dataf => \RAM|ALT_INV_ram~528_combout\,
	cin => \CPU|ULA1|Add0~34_cout\,
	sumout => \CPU|ULA1|Add0~1_sumout\,
	cout => \CPU|ULA1|Add0~2\);

-- Location: LABCELL_X7_Y21_N21
\CPU|MUX1|saida_MUX[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[0]~0_combout\ = ( \RAM|ram~528_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\) # (!\ROM1|memROM~4_combout\) ) ) # ( !\RAM|ram~528_combout\ & ( (\CPU|DECODER|saida[6]~0_combout\ & !\ROM1|memROM~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000011111111111100001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \RAM|ALT_INV_ram~528_combout\,
	combout => \CPU|MUX1|saida_MUX[0]~0_combout\);

-- Location: LABCELL_X7_Y21_N18
\CPU|DECODER|saida[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida[4]~1_combout\ = ( \ROM1|memROM~1_combout\ & ( (\ROM1|memROM~2_combout\ & (\ROM1|memROM~3_combout\ & !\ROM1|memROM~0_combout\)) ) ) # ( !\ROM1|memROM~1_combout\ & ( (\ROM1|memROM~2_combout\ & (!\ROM1|memROM~3_combout\ & 
-- !\ROM1|memROM~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000010000000100000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~2_combout\,
	datab => \ROM1|ALT_INV_memROM~3_combout\,
	datac => \ROM1|ALT_INV_memROM~0_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \CPU|DECODER|saida[4]~1_combout\);

-- Location: LABCELL_X7_Y21_N45
\CPU|DECODER|saida~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida~2_combout\ = (\ROM1|memROM~2_combout\ & (!\ROM1|memROM~1_combout\ $ (((\ROM1|memROM~0_combout\) # (\ROM1|memROM~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000100000101010000010000010101000001000001010100000100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~2_combout\,
	datab => \ROM1|ALT_INV_memROM~3_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~0_combout\,
	combout => \CPU|DECODER|saida~2_combout\);

-- Location: FF_X6_Y21_N34
\CPU|REGA|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~1_sumout\,
	asdata => \CPU|MUX1|saida_MUX[0]~0_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(0));

-- Location: MLABCELL_X4_Y21_N24
\LED_COMBO|DOUT[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \LED_COMBO|DOUT[0]~feeder_combout\ = ( \CPU|REGA|DOUT\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(0),
	combout => \LED_COMBO|DOUT[0]~feeder_combout\);

-- Location: MLABCELL_X4_Y21_N15
\Habilita_LED~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Habilita_LED~0_combout\ = ( \ROM1|memROM~10_combout\ & ( !\ROM1|memROM~5_combout\ & ( (\RAM|process_0~1_combout\ & \ROM1|memROM~4_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_process_0~1_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \ROM1|ALT_INV_memROM~10_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \Habilita_LED~0_combout\);

-- Location: FF_X4_Y21_N25
\LED_COMBO|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LED_COMBO|DOUT[0]~feeder_combout\,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(0));

-- Location: MLABCELL_X4_Y21_N9
\RAM|ram~24feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~24feeder_combout\ = ( \CPU|REGA|DOUT\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(1),
	combout => \RAM|ram~24feeder_combout\);

-- Location: FF_X4_Y21_N11
\RAM|ram~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~24feeder_combout\,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~24_q\);

-- Location: FF_X6_Y21_N4
\RAM|ram~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(1),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~40_q\);

-- Location: FF_X7_Y21_N38
\RAM|ram~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(1),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~32_q\);

-- Location: FF_X6_Y21_N29
\RAM|ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(1),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~16_q\);

-- Location: LABCELL_X7_Y21_N12
\RAM|ram~529\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~529_combout\ = ( \ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~32_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~40_q\ ) ) ) # ( \ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( 
-- \RAM|ram~16_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( \RAM|ram~24_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000001111111100110011001100110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~24_q\,
	datab => \RAM|ALT_INV_ram~40_q\,
	datac => \RAM|ALT_INV_ram~32_q\,
	datad => \RAM|ALT_INV_ram~16_q\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \RAM|ram~529_combout\);

-- Location: LABCELL_X6_Y21_N6
\RAM|ram~530\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~530_combout\ = ( \RAM|ram~529_combout\ & ( (!\ROM1|memROM~7_combout\ & !\ROM1|memROM~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \RAM|ALT_INV_ram~529_combout\,
	combout => \RAM|ram~530_combout\);

-- Location: LABCELL_X6_Y21_N36
\CPU|ULA1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~5_sumout\ = SUM(( \CPU|REGA|DOUT\(1) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~530_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~5_combout\)))) ) + ( \CPU|ULA1|Add0~2\ ))
-- \CPU|ULA1|Add0~6\ = CARRY(( \CPU|REGA|DOUT\(1) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~530_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~5_combout\)))) ) + ( \CPU|ULA1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~5_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(1),
	dataf => \RAM|ALT_INV_ram~530_combout\,
	cin => \CPU|ULA1|Add0~2\,
	sumout => \CPU|ULA1|Add0~5_sumout\,
	cout => \CPU|ULA1|Add0~6\);

-- Location: LABCELL_X7_Y21_N54
\CPU|MUX1|saida_MUX[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[1]~1_combout\ = ( \ROM1|memROM~5_combout\ & ( (\RAM|ram~530_combout\) # (\CPU|DECODER|saida[6]~0_combout\) ) ) # ( !\ROM1|memROM~5_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\ & \RAM|ram~530_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datac => \RAM|ALT_INV_ram~530_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \CPU|MUX1|saida_MUX[1]~1_combout\);

-- Location: FF_X6_Y21_N38
\CPU|REGA|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~5_sumout\,
	asdata => \CPU|MUX1|saida_MUX[1]~1_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(1));

-- Location: MLABCELL_X4_Y21_N33
\LED_COMBO|DOUT[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \LED_COMBO|DOUT[1]~feeder_combout\ = ( \CPU|REGA|DOUT\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(1),
	combout => \LED_COMBO|DOUT[1]~feeder_combout\);

-- Location: FF_X4_Y21_N34
\LED_COMBO|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LED_COMBO|DOUT[1]~feeder_combout\,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(1));

-- Location: MLABCELL_X4_Y21_N36
\RAM|ram~25feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~25feeder_combout\ = ( \CPU|REGA|DOUT\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(2),
	combout => \RAM|ram~25feeder_combout\);

-- Location: FF_X4_Y21_N38
\RAM|ram~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~25feeder_combout\,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~25_q\);

-- Location: FF_X7_Y21_N53
\RAM|ram~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~41_q\);

-- Location: LABCELL_X5_Y21_N39
\RAM|ram~17feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~17feeder_combout\ = ( \CPU|REGA|DOUT\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(2),
	combout => \RAM|ram~17feeder_combout\);

-- Location: FF_X5_Y21_N41
\RAM|ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~17feeder_combout\,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~17_q\);

-- Location: FF_X7_Y21_N26
\RAM|ram~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~33_q\);

-- Location: LABCELL_X7_Y21_N24
\RAM|ram~531\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~531_combout\ = ( \RAM|ram~33_q\ & ( \ROM1|memROM~5_combout\ & ( (\ROM1|memROM~4_combout\) # (\RAM|ram~41_q\) ) ) ) # ( !\RAM|ram~33_q\ & ( \ROM1|memROM~5_combout\ & ( (\RAM|ram~41_q\ & !\ROM1|memROM~4_combout\) ) ) ) # ( \RAM|ram~33_q\ & ( 
-- !\ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~4_combout\ & (\RAM|ram~25_q\)) # (\ROM1|memROM~4_combout\ & ((\RAM|ram~17_q\))) ) ) ) # ( !\RAM|ram~33_q\ & ( !\ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~4_combout\ & (\RAM|ram~25_q\)) # (\ROM1|memROM~4_combout\ 
-- & ((\RAM|ram~17_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100110000001100000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~25_q\,
	datab => \RAM|ALT_INV_ram~41_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \RAM|ALT_INV_ram~17_q\,
	datae => \RAM|ALT_INV_ram~33_q\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \RAM|ram~531_combout\);

-- Location: LABCELL_X6_Y21_N15
\RAM|ram~532\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~532_combout\ = (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & \RAM|ram~531_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \RAM|ALT_INV_ram~531_combout\,
	combout => \RAM|ram~532_combout\);

-- Location: LABCELL_X6_Y21_N39
\CPU|ULA1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~9_sumout\ = SUM(( \CPU|REGA|DOUT\(2) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~532_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~6\ ))
-- \CPU|ULA1|Add0~10\ = CARRY(( \CPU|REGA|DOUT\(2) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~532_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(2),
	dataf => \RAM|ALT_INV_ram~532_combout\,
	cin => \CPU|ULA1|Add0~6\,
	sumout => \CPU|ULA1|Add0~9_sumout\,
	cout => \CPU|ULA1|Add0~10\);

-- Location: LABCELL_X6_Y21_N21
\CPU|MUX1|saida_MUX[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[2]~2_combout\ = ( \RAM|ram~532_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\) # (\ROM1|memROM~9_combout\) ) ) # ( !\RAM|ram~532_combout\ & ( (\ROM1|memROM~9_combout\ & \CPU|DECODER|saida[6]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	dataf => \RAM|ALT_INV_ram~532_combout\,
	combout => \CPU|MUX1|saida_MUX[2]~2_combout\);

-- Location: FF_X6_Y21_N40
\CPU|REGA|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~9_sumout\,
	asdata => \CPU|MUX1|saida_MUX[2]~2_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(2));

-- Location: MLABCELL_X4_Y21_N48
\LED_COMBO|DOUT[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \LED_COMBO|DOUT[2]~feeder_combout\ = ( \CPU|REGA|DOUT\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(2),
	combout => \LED_COMBO|DOUT[2]~feeder_combout\);

-- Location: FF_X4_Y21_N49
\LED_COMBO|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LED_COMBO|DOUT[2]~feeder_combout\,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(2));

-- Location: FF_X7_Y21_N2
\RAM|ram~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~42_q\);

-- Location: FF_X6_Y21_N8
\RAM|ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~18_q\);

-- Location: FF_X4_Y21_N41
\RAM|ram~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~26_q\);

-- Location: FF_X7_Y21_N7
\RAM|ram~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~34_q\);

-- Location: LABCELL_X7_Y21_N48
\RAM|ram~533\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~533_combout\ = ( \ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~34_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~42_q\ ) ) ) # ( \ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( 
-- \RAM|ram~18_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( \RAM|ram~26_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110011001101010101010101010000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~42_q\,
	datab => \RAM|ALT_INV_ram~18_q\,
	datac => \RAM|ALT_INV_ram~26_q\,
	datad => \RAM|ALT_INV_ram~34_q\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \RAM|ram~533_combout\);

-- Location: LABCELL_X7_Y21_N6
\RAM|ram~534\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~534_combout\ = ( \RAM|ram~533_combout\ & ( (!\ROM1|memROM~7_combout\ & !\ROM1|memROM~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \RAM|ALT_INV_ram~533_combout\,
	combout => \RAM|ram~534_combout\);

-- Location: LABCELL_X6_Y21_N42
\CPU|ULA1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~13_sumout\ = SUM(( \CPU|REGA|DOUT\(3) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~534_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\)))) ) + ( \CPU|ULA1|Add0~10\ ))
-- \CPU|ULA1|Add0~14\ = CARRY(( \CPU|REGA|DOUT\(3) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~534_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\)))) ) + ( \CPU|ULA1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(3),
	dataf => \RAM|ALT_INV_ram~534_combout\,
	cin => \CPU|ULA1|Add0~10\,
	sumout => \CPU|ULA1|Add0~13_sumout\,
	cout => \CPU|ULA1|Add0~14\);

-- Location: LABCELL_X7_Y21_N9
\CPU|MUX1|saida_MUX[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[3]~3_combout\ = ( \RAM|ram~534_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\) # (\ROM1|memROM~7_combout\) ) ) # ( !\RAM|ram~534_combout\ & ( (\ROM1|memROM~7_combout\ & \CPU|DECODER|saida[6]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	dataf => \RAM|ALT_INV_ram~534_combout\,
	combout => \CPU|MUX1|saida_MUX[3]~3_combout\);

-- Location: FF_X6_Y21_N43
\CPU|REGA|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~13_sumout\,
	asdata => \CPU|MUX1|saida_MUX[3]~3_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(3));

-- Location: FF_X4_Y21_N43
\LED_COMBO|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(3));

-- Location: FF_X7_Y21_N20
\RAM|ram~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(4),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~35_q\);

-- Location: FF_X6_Y21_N1
\RAM|ram~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(4),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~43_q\);

-- Location: FF_X4_Y21_N8
\RAM|ram~27\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(4),
	sload => VCC,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~27_q\);

-- Location: FF_X7_Y21_N44
\RAM|ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(4),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~19_q\);

-- Location: LABCELL_X7_Y21_N33
\RAM|ram~535\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~535_combout\ = ( \ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~35_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~5_combout\ & ( \RAM|ram~43_q\ ) ) ) # ( \ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( 
-- \RAM|ram~19_q\ ) ) ) # ( !\ROM1|memROM~4_combout\ & ( !\ROM1|memROM~5_combout\ & ( \RAM|ram~27_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000001111111100110011001100110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~35_q\,
	datab => \RAM|ALT_INV_ram~43_q\,
	datac => \RAM|ALT_INV_ram~27_q\,
	datad => \RAM|ALT_INV_ram~19_q\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \RAM|ram~535_combout\);

-- Location: LABCELL_X7_Y21_N42
\RAM|ram~536\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~536_combout\ = ( \RAM|ram~535_combout\ & ( (!\ROM1|memROM~7_combout\ & !\ROM1|memROM~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \RAM|ALT_INV_ram~535_combout\,
	combout => \RAM|ram~536_combout\);

-- Location: LABCELL_X6_Y21_N45
\CPU|ULA1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~17_sumout\ = SUM(( \CPU|REGA|DOUT\(4) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~536_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~14\ ))
-- \CPU|ULA1|Add0~18\ = CARRY(( \CPU|REGA|DOUT\(4) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~536_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(4),
	dataf => \RAM|ALT_INV_ram~536_combout\,
	cin => \CPU|ULA1|Add0~14\,
	sumout => \CPU|ULA1|Add0~17_sumout\,
	cout => \CPU|ULA1|Add0~18\);

-- Location: LABCELL_X7_Y21_N0
\CPU|MUX1|saida_MUX[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[4]~4_combout\ = ( \RAM|ram~536_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\) # (\ROM1|memROM~9_combout\) ) ) # ( !\RAM|ram~536_combout\ & ( (\CPU|DECODER|saida[6]~0_combout\ & \ROM1|memROM~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111110011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \RAM|ALT_INV_ram~536_combout\,
	combout => \CPU|MUX1|saida_MUX[4]~4_combout\);

-- Location: FF_X6_Y21_N46
\CPU|REGA|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~17_sumout\,
	asdata => \CPU|MUX1|saida_MUX[4]~4_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(4));

-- Location: FF_X4_Y21_N32
\LED_COMBO|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(4),
	sload => VCC,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(4));

-- Location: FF_X4_Y21_N37
\RAM|ram~28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~28_q\);

-- Location: FF_X6_Y21_N13
\RAM|ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(5),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~20_q\);

-- Location: FF_X6_Y21_N20
\RAM|ram~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~44_q\);

-- Location: FF_X5_Y21_N32
\RAM|ram~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~36_q\);

-- Location: LABCELL_X5_Y21_N30
\RAM|ram~537\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~537_combout\ = ( \RAM|ram~36_q\ & ( \ROM1|memROM~4_combout\ & ( (\ROM1|memROM~5_combout\) # (\RAM|ram~20_q\) ) ) ) # ( !\RAM|ram~36_q\ & ( \ROM1|memROM~4_combout\ & ( (\RAM|ram~20_q\ & !\ROM1|memROM~5_combout\) ) ) ) # ( \RAM|ram~36_q\ & ( 
-- !\ROM1|memROM~4_combout\ & ( (!\ROM1|memROM~5_combout\ & (\RAM|ram~28_q\)) # (\ROM1|memROM~5_combout\ & ((\RAM|ram~44_q\))) ) ) ) # ( !\RAM|ram~36_q\ & ( !\ROM1|memROM~4_combout\ & ( (!\ROM1|memROM~5_combout\ & (\RAM|ram~28_q\)) # (\ROM1|memROM~5_combout\ 
-- & ((\RAM|ram~44_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100110000001100000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~28_q\,
	datab => \RAM|ALT_INV_ram~20_q\,
	datac => \ROM1|ALT_INV_memROM~5_combout\,
	datad => \RAM|ALT_INV_ram~44_q\,
	datae => \RAM|ALT_INV_ram~36_q\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM|ram~537_combout\);

-- Location: LABCELL_X6_Y21_N24
\RAM|ram~538\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~538_combout\ = (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & \RAM|ram~537_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \RAM|ALT_INV_ram~537_combout\,
	combout => \RAM|ram~538_combout\);

-- Location: LABCELL_X6_Y21_N9
\CPU|MUX1|saida_MUX[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[5]~5_combout\ = ( \RAM|ram~538_combout\ & ( (!\CPU|DECODER|saida[6]~0_combout\) # (\ROM1|memROM~7_combout\) ) ) # ( !\RAM|ram~538_combout\ & ( (\CPU|DECODER|saida[6]~0_combout\ & \ROM1|memROM~7_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	dataf => \RAM|ALT_INV_ram~538_combout\,
	combout => \CPU|MUX1|saida_MUX[5]~5_combout\);

-- Location: FF_X6_Y21_N50
\CPU|REGA|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~21_sumout\,
	asdata => \CPU|MUX1|saida_MUX[5]~5_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(5));

-- Location: LABCELL_X6_Y21_N48
\CPU|ULA1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~21_sumout\ = SUM(( \CPU|REGA|DOUT\(5) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~538_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\)))) ) + ( \CPU|ULA1|Add0~18\ ))
-- \CPU|ULA1|Add0~22\ = CARRY(( \CPU|REGA|DOUT\(5) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~538_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\)))) ) + ( \CPU|ULA1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(5),
	dataf => \RAM|ALT_INV_ram~538_combout\,
	cin => \CPU|ULA1|Add0~18\,
	sumout => \CPU|ULA1|Add0~21_sumout\,
	cout => \CPU|ULA1|Add0~22\);

-- Location: FF_X6_Y21_N49
\CPU|REGA|DOUT[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~21_sumout\,
	asdata => \CPU|MUX1|saida_MUX[5]~5_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[5]~DUPLICATE_q\);

-- Location: MLABCELL_X4_Y21_N51
\LED_COMBO|DOUT[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \LED_COMBO|DOUT[5]~feeder_combout\ = ( \CPU|REGA|DOUT[5]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\,
	combout => \LED_COMBO|DOUT[5]~feeder_combout\);

-- Location: FF_X4_Y21_N52
\LED_COMBO|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LED_COMBO|DOUT[5]~feeder_combout\,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(5));

-- Location: LABCELL_X5_Y21_N24
\RAM|ram~45feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~45feeder_combout\ = ( \CPU|REGA|DOUT\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(6),
	combout => \RAM|ram~45feeder_combout\);

-- Location: FF_X5_Y21_N26
\RAM|ram~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~45feeder_combout\,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~45_q\);

-- Location: FF_X4_Y21_N10
\RAM|ram~29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(6),
	sload => VCC,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~29_q\);

-- Location: FF_X6_Y21_N26
\RAM|ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(6),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~21_q\);

-- Location: FF_X5_Y21_N20
\RAM|ram~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(6),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~37_q\);

-- Location: LABCELL_X5_Y21_N18
\RAM|ram~539\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~539_combout\ = ( \RAM|ram~37_q\ & ( \ROM1|memROM~5_combout\ & ( (\ROM1|memROM~4_combout\) # (\RAM|ram~45_q\) ) ) ) # ( !\RAM|ram~37_q\ & ( \ROM1|memROM~5_combout\ & ( (\RAM|ram~45_q\ & !\ROM1|memROM~4_combout\) ) ) ) # ( \RAM|ram~37_q\ & ( 
-- !\ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~4_combout\ & (\RAM|ram~29_q\)) # (\ROM1|memROM~4_combout\ & ((\RAM|ram~21_q\))) ) ) ) # ( !\RAM|ram~37_q\ & ( !\ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~4_combout\ & (\RAM|ram~29_q\)) # (\ROM1|memROM~4_combout\ 
-- & ((\RAM|ram~21_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000111111001100000011111101010000010100000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~45_q\,
	datab => \RAM|ALT_INV_ram~29_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \RAM|ALT_INV_ram~21_q\,
	datae => \RAM|ALT_INV_ram~37_q\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \RAM|ram~539_combout\);

-- Location: LABCELL_X6_Y21_N3
\RAM|ram~540\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~540_combout\ = (!\ROM1|memROM~9_combout\ & (!\ROM1|memROM~7_combout\ & \RAM|ram~539_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \RAM|ALT_INV_ram~539_combout\,
	combout => \RAM|ram~540_combout\);

-- Location: LABCELL_X6_Y21_N51
\CPU|ULA1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~25_sumout\ = SUM(( \CPU|REGA|DOUT\(6) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~540_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~22\ ))
-- \CPU|ULA1|Add0~26\ = CARRY(( \CPU|REGA|DOUT\(6) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~540_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~9_combout\)))) ) + ( \CPU|ULA1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(6),
	dataf => \RAM|ALT_INV_ram~540_combout\,
	cin => \CPU|ULA1|Add0~22\,
	sumout => \CPU|ULA1|Add0~25_sumout\,
	cout => \CPU|ULA1|Add0~26\);

-- Location: LABCELL_X5_Y21_N12
\CPU|MUX1|saida_MUX[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[6]~6_combout\ = ( \RAM|ram~540_combout\ & ( \CPU|DECODER|saida[6]~0_combout\ & ( \ROM1|memROM~9_combout\ ) ) ) # ( !\RAM|ram~540_combout\ & ( \CPU|DECODER|saida[6]~0_combout\ & ( \ROM1|memROM~9_combout\ ) ) ) # ( \RAM|ram~540_combout\ 
-- & ( !\CPU|DECODER|saida[6]~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datae => \RAM|ALT_INV_ram~540_combout\,
	dataf => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	combout => \CPU|MUX1|saida_MUX[6]~6_combout\);

-- Location: FF_X6_Y21_N52
\CPU|REGA|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~25_sumout\,
	asdata => \CPU|MUX1|saida_MUX[6]~6_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(6));

-- Location: FF_X4_Y21_N14
\LED_COMBO|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(6),
	sload => VCC,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(6));

-- Location: FF_X7_Y21_N55
\RAM|ram~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM|ram~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~38_q\);

-- Location: MLABCELL_X4_Y21_N39
\RAM|ram~30feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~30feeder_combout\ = \CPU|REGA|DOUT[7]~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \CPU|REGA|ALT_INV_DOUT[7]~DUPLICATE_q\,
	combout => \RAM|ram~30feeder_combout\);

-- Location: FF_X4_Y21_N40
\RAM|ram~30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM|ram~30feeder_combout\,
	ena => \RAM|ram~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~30_q\);

-- Location: FF_X7_Y21_N31
\RAM|ram~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM|ram~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~46_q\);

-- Location: FF_X6_Y21_N17
\RAM|ram~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM|ram~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM|ram~22_q\);

-- Location: LABCELL_X10_Y21_N0
\RAM|ram~541\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~541_combout\ = ( \ROM1|memROM~5_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM|ram~38_q\ ) ) ) # ( !\ROM1|memROM~5_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM|ram~22_q\ ) ) ) # ( \ROM1|memROM~5_combout\ & ( !\ROM1|memROM~4_combout\ & ( 
-- \RAM|ram~46_q\ ) ) ) # ( !\ROM1|memROM~5_combout\ & ( !\ROM1|memROM~4_combout\ & ( \RAM|ram~30_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000011110000111100000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM|ALT_INV_ram~38_q\,
	datab => \RAM|ALT_INV_ram~30_q\,
	datac => \RAM|ALT_INV_ram~46_q\,
	datad => \RAM|ALT_INV_ram~22_q\,
	datae => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM|ram~541_combout\);

-- Location: LABCELL_X7_Y21_N57
\RAM|ram~542\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM|ram~542_combout\ = ( \RAM|ram~541_combout\ & ( (!\ROM1|memROM~9_combout\ & !\ROM1|memROM~7_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \ROM1|ALT_INV_memROM~7_combout\,
	dataf => \RAM|ALT_INV_ram~541_combout\,
	combout => \RAM|ram~542_combout\);

-- Location: LABCELL_X7_Y21_N39
\CPU|MUX1|saida_MUX[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX1|saida_MUX[7]~7_combout\ = (!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~542_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~7_combout\,
	datac => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datad => \RAM|ALT_INV_ram~542_combout\,
	combout => \CPU|MUX1|saida_MUX[7]~7_combout\);

-- Location: FF_X6_Y21_N56
\CPU|REGA|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~29_sumout\,
	asdata => \CPU|MUX1|saida_MUX[7]~7_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(7));

-- Location: LABCELL_X6_Y21_N54
\CPU|ULA1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add0~29_sumout\ = SUM(( \CPU|REGA|DOUT\(7) ) + ( !\CPU|DECODER|Equal10~1_combout\ $ (((!\CPU|DECODER|saida[6]~0_combout\ & ((\RAM|ram~542_combout\))) # (\CPU|DECODER|saida[6]~0_combout\ & (\ROM1|memROM~7_combout\)))) ) + ( \CPU|ULA1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001101101001110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[6]~0_combout\,
	datab => \CPU|DECODER|ALT_INV_Equal10~1_combout\,
	datac => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(7),
	dataf => \RAM|ALT_INV_ram~542_combout\,
	cin => \CPU|ULA1|Add0~26\,
	sumout => \CPU|ULA1|Add0~29_sumout\);

-- Location: FF_X6_Y21_N55
\CPU|REGA|DOUT[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|Add0~29_sumout\,
	asdata => \CPU|MUX1|saida_MUX[7]~7_combout\,
	sload => \CPU|DECODER|saida[4]~1_combout\,
	ena => \CPU|DECODER|saida~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[7]~DUPLICATE_q\);

-- Location: FF_X4_Y21_N16
\LED_COMBO|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[7]~DUPLICATE_q\,
	sload => VCC,
	ena => \Habilita_LED~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED_COMBO|DOUT\(7));

-- Location: MLABCELL_X4_Y21_N18
\LEDR8|DOUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LEDR8|DOUT~0_combout\ = ( \LEDR8|DOUT~q\ & ( \ROM1|memROM~5_combout\ ) ) # ( \LEDR8|DOUT~q\ & ( !\ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~10_combout\) # (((!\RAM|process_0~1_combout\) # (\CPU|REGA|DOUT\(0))) # (\ROM1|memROM~4_combout\)) ) ) ) # ( 
-- !\LEDR8|DOUT~q\ & ( !\ROM1|memROM~5_combout\ & ( (\ROM1|memROM~10_combout\ & (!\ROM1|memROM~4_combout\ & (\RAM|process_0~1_combout\ & \CPU|REGA|DOUT\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100111110111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \RAM|ALT_INV_process_0~1_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(0),
	datae => \LEDR8|ALT_INV_DOUT~q\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \LEDR8|DOUT~0_combout\);

-- Location: FF_X4_Y21_N19
\LEDR8|DOUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LEDR8|DOUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR8|DOUT~q\);

-- Location: MLABCELL_X4_Y21_N0
\LEDR9|DOUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LEDR9|DOUT~0_combout\ = ( \LEDR9|DOUT~q\ & ( \ROM1|memROM~5_combout\ & ( (!\ROM1|memROM~10_combout\) # ((!\ROM1|memROM~4_combout\) # ((!\RAM|process_0~1_combout\) # (\CPU|REGA|DOUT\(0)))) ) ) ) # ( !\LEDR9|DOUT~q\ & ( \ROM1|memROM~5_combout\ & ( 
-- (\ROM1|memROM~10_combout\ & (\ROM1|memROM~4_combout\ & (\RAM|process_0~1_combout\ & \CPU|REGA|DOUT\(0)))) ) ) ) # ( \LEDR9|DOUT~q\ & ( !\ROM1|memROM~5_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \RAM|ALT_INV_process_0~1_combout\,
	datad => \CPU|REGA|ALT_INV_DOUT\(0),
	datae => \LEDR9|ALT_INV_DOUT~q\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \LEDR9|DOUT~0_combout\);

-- Location: FF_X4_Y21_N1
\LEDR9|DOUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \LEDR9|DOUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR9|DOUT~q\);

-- Location: IOIBUF_X22_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: IOIBUF_X11_Y0_N35
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X14_Y0_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: MLABCELL_X9_Y3_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


