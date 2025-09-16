----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2025 20:50:17
-- Design Name: 
-- Module Name: counter4 - Behavioral
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

entity counter4 is
    Port ( Clk_ctr : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Pause : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end counter4;

architecture Behavioral of counter4 is
signal count : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
  process(Clk_ctr, Clr)
  begin
    if Clr = '1' then
      count <= "0000";
    elsif rising_edge(Clk_ctr) then
      if Enable = '1' and Pause = '0' then
        count <= count + 1;
      end if;
    end if;
  end process;
  Q <= count;

end Behavioral;
