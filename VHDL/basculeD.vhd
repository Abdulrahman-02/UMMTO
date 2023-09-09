-------------------------------------------------------------------------------
--
-- Title       : bascD
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : basculeD.vhd
-- Generated   : Sat Nov  5 18:34:03 2022
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
--{entity {bascD} architecture {bascD_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bascD is
	 port(
		 reset : in STD_LOGIC;
		 clock : in STD_LOGIC;
		 d : in STD_LOGIC;
		 q : out STD_LOGIC;
		 qbar : out STD_LOGIC
	     );
end bascD;

--}} End of automatically maintained section

architecture bascD_arch of bascD is
begin
	process(clock,reset)
	begin
		if(rising_edge(clock))then
			if(reset='1')then
				q<='0';q<='1';
			else
				q<=d;qbar<=not d;
			end if;
		end if;
	end process;	
end bascD_arch;

-- asynchrone: différente horloge :: synchrone: meme horloge -- 
