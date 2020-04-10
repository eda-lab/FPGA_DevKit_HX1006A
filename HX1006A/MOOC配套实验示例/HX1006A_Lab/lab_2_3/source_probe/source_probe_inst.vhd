	component source_probe is
		port (
			source : out std_logic_vector(23 downto 0);                    -- source
			probe  : in  std_logic_vector(23 downto 0) := (others => 'X')  -- probe
		);
	end component source_probe;

	u0 : component source_probe
		port map (
			source => CONNECTED_TO_source, -- sources.source
			probe  => CONNECTED_TO_probe   --  probes.probe
		);

