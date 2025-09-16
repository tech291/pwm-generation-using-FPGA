----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2025 20:57:43
-- Design Name: 
-- Module Name: hex_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_counter is
  Port ( clk_in : in STD_LOGIC;
         clr     : in STD_LOGIC;
         enable  : in STD_LOGIC;
         pause   : in STD_LOGIC;
         seg     : out STD_LOGIC_VECTOR(6 downto 0);
         an      : out STD_LOGIC_VECTOR(3 downto 0));
end hex_counter;


architecture Behavioral of hex_counter is

 signal clk_10Hz : STD_LOGIC;
  signal q : STD_LOGIC_VECTOR(3 downto 0);
begin

  div_inst: entity work.freq_div
    port map ( clk_in => clk_in, clk_out => clk_10Hz );

  count_inst: entity work.counter4
    port map ( Clk_ctr => clk_10Hz, Clr => clr, Enable => enable, Pause => pause, Q => q );

  dec_inst: entity work.decoder
    port map ( binary_in => q, seg => seg );

  -- Activer uniquement l'afficheur 1 (anode commune)
  an <= "1110";


end Behavioral;
