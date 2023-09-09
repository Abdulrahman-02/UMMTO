-------------------------------------------------------------------------------
--
-- Title       : ram_ent
-- Design      : first
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : ram.vhd
-- Generated   : Sun Nov 13 15:18:03 2022
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
--{entity {ram_ent} architecture {ram_arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

entity ram_ent is
	 port(
		 r : in STD_LOGIC;
		 w : in STD_LOGIC;
		 adr : in STD_LOGIC_VECTOR(3 downto 0);
		 data : inout STD_LOGIC_VECTOR(7 downto 0)
	     );
end ram_ent;

--}} End of automatically maintained section

architecture ram_arch of ram_ent is
type Ram is array (15 downto 0) of std_logic_vector (7 downto 0);
begin

	ramProc : process(r,w)
	variable Nram : ram;
	variable adress : integer;
	
	begin
		adress := conv_integer (adr);
		
		if w = '1' then
				Nram (adress) := data;
		elsif r = '1' then 
			data <= Nram (adress);
			
		end if;
		
		end process;

end ram_arch;
