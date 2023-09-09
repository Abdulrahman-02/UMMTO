-------------------------------------------------------------------------------
--
-- Title       : ent
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : exo7.vhd
-- Generated   : Sat Nov 19 10:16:06 2022
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
--{entity {ent} architecture {arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ent is
	 port(
		 d : in integer
	     );
end ent;

--}} End of automatically maintained section

architecture arch of ent is
	signal a: integer :=1;
	signal b: integer :=2;
	signal c: integer :=3;
begin
	
a<=b;
b<=c;
c<=d;

end arch;
