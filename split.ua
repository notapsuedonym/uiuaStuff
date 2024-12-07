# Standard signatures;
#  - Split :: Chr -> String -> Array
#  - vector<string> Split(char delim, string tosplit)
# Stack signature;
#  - In : [tosplit, delim]
#  - Out: [[split]]
𐤀     ←(
  ,           # basic stack prep
              # $tosplit
              # $delim
              # $tosplit
              #
  !=          # consumes the top 2 values,
              # creating a new array of only [0|1]
              # it applies this for every char in the
              # input string
              # its basically "char != $delim"
              # but applied to the entire input string
              #
  ⊜∘         # uses the previously created array and
              # $tosplit to create the final array,
              # which is the split string
)
# canon;
𐤀     ← ⊜∘≠,
Split ← 𐤀     # latin script alias
𐤀 @  "moo yay"
# =>
# ╭─       
# ╷ "moo"  
#   "yay"  
#         ╯
