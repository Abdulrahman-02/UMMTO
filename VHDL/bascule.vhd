-------------------------------------------------------------------------------
--
-- Title       : bascule
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : bascule.vhd
-- Generated   : Sun Nov  6 13:58:51 2022
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
--{entity {bascule} architecture {bascule_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bascule is
	 port(
		 d : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 q : out STD_LOGIC;
		 qb : out STD_LOGIC
	     );
end bascule;

--}} End of automatically maintained section

architecture bascule_arch of bascule is
begin

	 -- enter your statements here --
	process(clk)
	begin
	if(clk'event and clk='1')then
		q<=d;
		qb<=not d;
	end if;
	end process;
end bascule_arch;
