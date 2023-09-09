-------------------------------------------------------------------------------
--
-- Title       : tp1
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : tp1.vhd
-- Generated   : Sun Oct 16 13:00:17 2022
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
--{entity {tp1} architecture {tp1}}

 library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tp1 is
	 port(
	 A : in Std_logic;
	 B: in std_logic;
		 S : out STD_LOGIC;
		 R : out STD_LOGIC
	     );
end tp1;

--}} End of automatically maintained section

architecture tp1 of tp1 is
begin

	-- enter your statements here -- 
	--S<= A XOR B; --
	--R<= A and B; --
	

	
S<='0' when (A=B)else '1';
R<='1' when (A='1' and B='1') else '0';
	

end tp1;
