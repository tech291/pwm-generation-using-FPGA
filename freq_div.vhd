----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2025 20:53:16
-- Design Name: 
-- Module Name: freq_div - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_div is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
constant N : integer := 6250000; -- 125MHz / (2 * 10Hz)
  signal counter : integer := 0;
  signal clk_div : STD_LOGIC := '0';
begin
  process(clk_in)
  begin
    if rising_edge(clk_in) then
      if counter = N-1 then
        counter <= 0;
        clk_div <= NOT clk_div;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
  clk_out <= clk_div;

end Behavioral;
