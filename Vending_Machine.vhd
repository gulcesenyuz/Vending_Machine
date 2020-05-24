library IEEE;
USE ieee.std_logic_1164.all;

entity Vending_Machine is 
		    port (clock: IN STD_LOGIC;
			  reset: IN STD_LOGIC;
			 Coin_input: IN STD_LOGIC_VECTOR (1 downto 0);
			  T: IN STD_LOGIC;
			  Coin_output: 	OUT STD_LOGIC_VECTOR (1 downto 0);
			  Pringles: 	OUT STD_LOGIC);
end entity;
								 

	architecture behavior of Vending_Machine is
	
			type state_type is (idle_state, Money_input, coin1, coins3, coins5, coins6, Pringles_out );								
				signal current_state: state_type; 
				signal next_state: state_type;
								

				
					begin
						process(clock, reset)
							begin
								if(reset='0') then
									current_state <= idle_state;
								elsif rising_edge (clock) then
									current_state<=next_state;
								end if;
						end process;
						
						process(current_state,Coin_input)
							begin
								if (current_state = idle_state) then
									Pringles <= '0'; 
									Coin_output <= "00";
									next_state <= Money_input;
										
									elsif (current_state = Money_input) then
									
										case Coin_input is
										 
												when "00" => Pringles <= '0' ;
															Coin_output<="00";
															next_state<= Money_input;
														
												when "01" => Pringles <= '0' ;
															Coin_output<="00";
															next_state<= coin1;
														
												when "10" =>Pringles <= '0' ;
															Coin_output<="00"; 
															next_state<= Pringles_out;
														
												when "11" =>Pringles <= '0' ;
															Coin_output<="00"; 
															next_state<= coins5;
												when others =>null;		
											
										end case;
									
										
									
									elsif (current_state = coin1) then
										 case Coin_input is
										 
												when "00" =>Pringles <= '0' ;
															Coin_output <= "00";
															next_state <= coin1;
												when "01" =>Pringles <= '0' ;
															Coin_output <= "00";
															next_state <= Pringles_out;
												when "10" =>Pringles <= '0' ;
															Coin_output <= "00";
															next_state <= coins3;
												when "11" =>Pringles <= '0' ;
															Coin_output <= "00";
															next_state <= coins6;
												when others =>null;
										  end case;
									
													
									elsif  (current_state = coins5) then
														Pringles <= '0' ;
														Coin_output <= "10";
														next_state <= coins3;
													
									elsif (current_state = coins6) then 
														Pringles <= '0' ;
														Coin_output <= "01";
														next_state <= coins5;
									
									else   
														Pringles <= '1' ;
														Coin_output <="00";
														next_state <= Money_input;
								end if;
 
						end process;
	end behavior;