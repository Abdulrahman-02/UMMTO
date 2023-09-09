-------------------------------------------------------------------------------
--
-- Title       : parite_ent
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : parite.vhd
-- Generated   : Sun Nov 13 13:32:12 2022
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
--{entity {parite_ent} architecture {parite_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity parite_ent is
	 port(
		 i : in STD_LOGIC_VECTOR(7 downto 0);
		 p : out STD_LOGIC
	     );
end parite_ent;

--}} End of automatically maintained section

architecture parite_arch of parite_ent is
begin

	parite: process(i)
	 -- declaration variable compteur et index --
	variable compteur : integer:= 0;
	variable index : integer;
	
	begin
		-- boucle --
		for index in 7 downto 0 loop
			if i(index)='1' then
				compteur:= compteur+1;
			end if;
		end loop;
		-- test pour la parité --
		if compteur mod 2=0 then 
			p<='0';
		else
			p<='1';
		end if;
	
		end process;

end parite_arch;
