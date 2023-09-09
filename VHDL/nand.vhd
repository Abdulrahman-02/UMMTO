-------------------------------------------------------------------------------
--
-- Title       : nand_ent
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : nand.vhd
-- Generated   : Sun Oct 16 13:36:57 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {nand_ent} architecture {nand_arc}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand_ent is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C : in STD_LOGIC;
		 T : out STD_LOGIC
	     );
end nand_ent;

--}} End of automatically maintained section

architecture nand_arc of nand_ent is
begin

	-- enter your statements here --
	T <= NOT (A and B and C);

end nand_arc;
