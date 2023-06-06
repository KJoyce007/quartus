
library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is
   component fulladd is
     port(A, B,C: in std_logic;
         S,Cout: out std_logic);
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: fulladd 
			port map (
					-- order of inputs A B C
					B => input_vector(1),
					A => input_vector(2),
					C => input_vector(0),
               -- order of output OUTPUT
					Cout=> output_vector(0),
					S=>output_vector(1));
end DutWrap;