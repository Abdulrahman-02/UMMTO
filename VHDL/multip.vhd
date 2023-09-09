-------------------------------------------------------------------------------
--
-- Title       : mult
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : multip.vhd
-- Generated   : Sun Oct 30 13:48:33 2022
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
--{entity {mult} architecture {mult_arc}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mult is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 c : in STD_LOGIC;
		 d : in STD_LOGIC;
		 s : in STD_LOGIC_VECTOR(1 downto 0);
		 o : out STD_LOGIC
	     );
end mult;

--}} End of automatically maintained section

architecture mult_arc of mult is
begin

	 -- enter your statements here --

with s select
   o<=a when "00",
    b when "01",
    c when "10",
    d when others;

end mult_arc;
