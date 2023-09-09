-------------------------------------------------------------------------------
--
-- Title       : conteur_ent
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : conteur.vhd
-- Generated   : Sun Nov  6 14:36:20 2022
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
--{entity {conteur_ent} architecture {conteur_arc}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity conteur_ent is
	 port(
		 clk : in STD_LOGIC;
		 cpt : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end conteur_ent;

--}} End of automatically maintained section

architecture conteur_arc of conteur_ent is
signal c: integer range 0 to 7 :=0;
begin
	
	-- enter your statements here --
	process (clk)
	begin
	if rising_edge(clk)then
		c<=(c+1) mod 8;
	end if;
	end process;
	cpt<= STD_LOGIC_VECTOR(To_unsigned(c,3));
end conteur_arc;
