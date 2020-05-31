library ieee;
use ieee.std_logic_1164.all;

	entity Vending_Machine is 
	    port (clock: IN STD_LOGIC;
			rst: IN STD_LOGIC;
			Coin_input: IN STD_LOGIC_VECTOR (3 downto 0);
			Coin_output: OUT STD_LOGIC_VECTOR (3 downto 0);
			Pringles: OUT STD_LOGIC);
	end entity;
								 

	architecture behavior of Vending_Machine is
	
			type state_type is (idle_state, Money_input, coin1, coins3, coins5, coins6, Pringles_out );								
				signal current_state: state_type; 
				signal next_state: state_type;
				
					begin
						process(clock, rst)
							begin
								if(rst='0') then
									current_state <= idle_state;
								elsif rising_edge (clock) then
									current_state<=next_state;
								end if;
						end process;
						
						process(current_state,Coin_input)
							begin
							
								if (current_state = idle_state) then
									Pringles <= '0'; 
									Coin_output <= "0000";
									next_state <= Money_input;

									elsif (current_state = Money_input) then
									
										case Coin_input is
										 
												when "0000" => Pringles <= '0' ;
															Coin_output<="0000";
															next_state<= Money_input;
														
												when "0001" => Pringles <= '0' ;
															Coin_output<="0000";
															next_state<= coin1;
														
												when "0010" =>Pringles <= '0' ;
															Coin_output<="0000"; 
															next_state<= Pringles_out;
														
												when "0101" =>Pringles <= '0' ;
															Coin_output<="0000"; 
															next_state<= coins5;
												when others =>null;		
											
										end case;
									
									elsif (current_state = coin1) then
										 case Coin_input is
										 
												when "0000" =>Pringles <= '0' ;
															Coin_output <= "0000";
															next_state <= coin1;
												when "0001" =>Pringles <= '0' ;
															Coin_output <= "0000";
															next_state <= Pringles_out;
												when "0010" =>Pringles <= '0' ;
															Coin_output <= "0000";
															next_state <= coins3;
												when "0101" =>Pringles <= '0' ;
															Coin_output <= "0000";
															next_state <= coins6;
												when others =>null;
										  end case;
													
									elsif  (current_state = coins5) then
														Pringles <= '0' ;
														Coin_output <= "0010";
														next_state <= coins3;
													
									elsif (current_state = coins6) then 
														Pringles <= '0' ;
														Coin_output <= "0001";
														next_state <= coins5;
									elsif (current_state = coins3) then
														Pringles <= '1' ;
														Coin_output <= "0001";
														next_state <= Money_input;
	
									else   
														Pringles <= '1' ;
														Coin_output <="0000";
														next_state <= Money_input;

								end if;
 						
						end process;

	end behavior;