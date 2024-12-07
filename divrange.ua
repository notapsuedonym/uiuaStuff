# div range function
# output is an array of everything divisible
# by a specific number
# in a specific range
# Standard signatures;
#  - DivRange :: Int -> Int -> Array
#  - std::vector<int> DivRange(int num, int range)
# Stack signature;
#  - In : [range, num]
#  - Out: [[divrange]]
DivRange ← (
  +1,      # adds 1 to $range so its properly 0..$range
  :⟜:⇡     # creates the range with $range
           # and does some convoluted stack manipulation
           # (flips the stack so $num is on top,
           #  but calls it with ⟜ so the range actually
           #  stays on top, then flips it again
           #  we need to prep the stack
           #  to look like;
           #    [..range..]
           #    $num
           #    [..range..]
           # )
           # this is because the next operation consumes
           # the 2nd [..range..]
           # and it consumes $num
           # so we need the first [..range..] for
           # creating the final array
           #
  (=0◿)    # creates a new array of 0 or 1
           # depending on [i] % $num == 0 | 1
           #
  ⊜∘       # uses the 0|1 array and the original range
           # to create a new array of only every match
           #
  ◌:       # cleans up the stack
           # by swapping the 2 values on it,
           # then popping $range
           # then all that's left on the stack
           # is [divrange]
)
# In one line (the canonical form);
DivRange ← ◌:⊜∘(=0◿):⟜:⇡+1,

# Examples
DivRange 2 50 # [all even numbers  from 0..50]
DivRange 5 50 # [all divisors of 5 from 0..50]
