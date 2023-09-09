-------------------------------------------------------------------------------
--
-- Title       : ent
-- Design      : Final
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : park.vhd
-- Generated   : Mon Feb  6 13:13:06 2023
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
--{entity {ent} architecture {arc}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ent is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 entrer : in STD_LOGIC;
		 sortie : in STD_LOGIC;
		 complet : out STD_LOGIC;
		 unite : out STD_LOGIC_VECTOR(6 downto 0);
		 dix : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end ent;

architecture arc of ent is
	signal cpt:integer range 0 to 40 ; --------- variable compteur -----------
	signal u: integer ; --------- variable pour récupérer les unités -----------
	signal d:integer ; --------- variable pour récupérer les dizaines -----------
begin
	process(clk)
	variable e:integer:=0;
	variable s:integer:=0;
	begin
	if (reset='0' )then 
		cpt<=0;
		
	elsif (rising_edge(clk)) then
	if (entrer='0') then 
	if (cpt<40) and (e=0) then -------------- verification que nombre de vehicule inf à 40 -------
		cpt<=cpt+1; 		 ---------- incrémentation 
		e:=1;
	end if ;
	
	elsif (sortie='0') then 	
	if (cpt>0) and (s=0) then 	-------verification si nombre de vehicule sup à 0 --------
		cpt<=cpt-1; 				------------ décrémentation ------------
		s:=1;
	end if ;
	end if ;
	end if ;
	
		if (entrer='1') then
			e:= 0;
		end if ; 
		if (sortie='1') then
			s:= 0;
		end if ;
		
	u<= cpt mod 10 ;   ------ récupérer les unités   --------------
	d<= cpt/10 ; 	   ------ récupérer les dizaines --------------
	end process;																							  
	----- afficheur 7 segments ------																										  
	
	------- Dizaines --------
	dix<="1000000" when d<=0
	else "1111001" when d<=1
	else "0100100" when d<=2
	else "0110000" when d<=3
	else "0011001" when d<=4
	else "0010010" when d<=5
	else "0000010" when d<=6
	else "1111000" when d<=7
	else "0000000" when d<=8
	else "0010000";
	---------- Unités ----------
	unite<="1000000" when u<=0
	else "1111001" when u<=1
	else "0100100" when u<=2
	else "0110000" when u<=3
	else "0011001" when u<=4
	else "0010010" when u<=5
	else "0000010" when u<=6
	else "1111000" when u<=7
	else "0000000" when u<=8
	else "0010000";
		
	complet<='1' when cpt=40 else '0';
	 
end arc;
