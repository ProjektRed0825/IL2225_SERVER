library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

package types_and_constants is

  constant FILTER_TAPS   : integer                          := 13;
  constant SAMPLE_WIDTH  : integer                          := 10;
  constant ADDRESS_WIDTH : integer                          := integer(ceil(log2(real(FILTER_TAPS))));--4
  constant MAX_TAP       : signed(ADDRESS_WIDTH-1 downto 0) := to_signed(FILTER_TAPS-1, ADDRESS_WIDTH); --4bit, 12
  constant RESULT_WIDTH  : integer                          := (2 * SAMPLE_WIDTH) + integer(ceil(log2(real(FILTER_TAPS))));--24
  -- if there is N Mbit number adding together, the maximum result will be N*(x^M) wherer x is the radix, 
  -- corresponding maximum bit will be logx(N*x^M) = M + logx(N)

  type sample_file is array (FILTER_TAPS-1 downto 0) of signed (SAMPLE_WIDTH-1 downto 0);
  type coeff_file  is array (FILTER_TAPS-1 downto 0) of signed (SAMPLE_WIDTH-1 downto 0);
  
  type result_type is array (FILTER_TAPS downto 0) of signed (RESULT_WIDTH-1  downto 0); 
  --one more bit to store final result, the rest is for intermedia results
end package;
