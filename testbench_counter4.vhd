library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench_counter4 is
end testbench_counter4;

architecture Behavioral of testbench_counter4 is

    -- Déclaration du composant
    component counter4
        Port (
            Clk_ctr : in STD_LOGIC;
            Clr     : in STD_LOGIC;
            Enable  : in STD_LOGIC;
            Pause   : in STD_LOGIC;
            Q       : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signaux de test
    signal Clk_ctr : STD_LOGIC := '0';
    signal Clr     : STD_LOGIC := '0';
    signal Enable  : STD_LOGIC := '0';
    signal Pause   : STD_LOGIC := '0';
    signal Q       : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instanciation du composant testé
    uut: counter4 port map (
        Clk_ctr => Clk_ctr,
        Clr     => Clr,
        Enable  => Enable,
        Pause   => Pause,
        Q       => Q
    );

    -- Génération de l'horloge (période T = 20 ns)
    clk_process: process
    begin
        while now < 600 ns loop
            Clk_ctr <= '0';
            wait for 10 ns;
            Clk_ctr <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Stimuli
    stim_proc: process
    begin
        -- Reset actif pendant 10 ns
        Clr <= '1';
        wait for 10 ns;
        Clr <= '0';

        -- Enable à 0 pendant 100 ns
        Enable <= '0';
        wait for 100 ns;

        -- Enable à 1
        Enable <= '1';
        wait for 200 ns;

        -- Pause à 1 pendant 60 ns
        Pause <= '1';
        wait for 60 ns;
        Pause <= '0';

        wait for 180 ns;

        -- Désactiver le compteur
        Enable <= '0';

        wait;
    end process;

end Behavioral;
