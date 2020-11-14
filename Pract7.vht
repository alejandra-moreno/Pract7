-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Altera Program License
-- Subscription Agreement, Altera MegaCore Function License
-- Agreement, or other applicable license agreement, including,
-- without limitation, that your use is for the sole purpose of
-- programming logic devices manufactured by Altera and sold by
-- Altera or its authorized distributors.  Please refer to the
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to
-- suit user's needs .Comments are provided in each section to help the user
-- fill out necessary details.
-- ***************************************************************************
-- Generated on "11/12/2020 18:48:13"

-- Vhdl Test Bench template for design  :  Pract7
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Pract7_vhd_tst IS
END Pract7_vhd_tst;
ARCHITECTURE Pract7_arch OF Pract7_vhd_tst IS
-- constants
-- signals
SIGNAL a : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL d0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL d1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL ov : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT Pract7
	PORT (
	a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	d0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	d1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	ov : OUT STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Pract7
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	d0 => d0,
	d1 => d1,
	ov => ov,
	sel => sel
	);
init : PROCESS
-- variable declarations
BEGIN
        -- code that executes only once
WAIT;
END PROCESS init;
always : PROCESS
-- optional sensitivity list
-- (        )
-- variable declarations
BEGIN
        -- code executes for every event on sensitivity list
WAIT;
END PROCESS always;
END Pract7_arch;
