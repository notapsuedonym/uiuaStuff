# Standard signatures;
#   - GCD :: Int -> Int -> Int
#   - int GCD(int a, int b)
# Stack signature;
#   - In : [b, a]
#   - Out: [gcd]
GCD ← (
  ⍢(×2.1| # function signature (2 input values, 1 out)
    ◿     # does modulo on the 2 values on the stack
  )≠0     # until the top value (b) is 0
  ◌       # pops the top value (b), leaving only a
)
# The one-liner looks like;
GCD ← ◌⍢(×2.1|◿)≠0        # ◌ is at the start because
                          # code in Uiua is parsed
                          # right-to-left, top-to-bottom
                          # so in the multi-line,
                          # it needs to be at the bottom
                          # so it happens after everythin
                          # but here, its placed "first"
                          # because right-to-left,
                          # the leftmost is last
GCD 500 5  # GCD(5, 500) => 5
GCD 27 9   # GCD(9, 27)  => 9
