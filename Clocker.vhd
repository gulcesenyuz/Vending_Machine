library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity Clocker is
 
end entity;

	architecture sim of Clocker is

		constant ClkFr : integer := 100e6;
		constant ClkPr    : time    := 1000 ms / ClkFr;
		
		signal clock    : std_logic := '1';
		signal rst : std_logic := '1';
		signal Coin_input : std_logic_vector (3 downto 0);
		signal Coin_output : std_logic_vector (3 downto 0);
		signal Pringles : std_logic := '0';
	
begin

		i_FSM: entity work.Vending_Machine(behavior)
		port map (
		clock => clock,
		rst => rst,
		Coin_input =>  Coin_input,
		Coin_output => Coin_output,
		Pringles => Pringles);


		clock <= not clock after ClkPr / 2;
		

end architecture;