open MuFU_syntax
   
module H = Raw_hflz 

type t =
  A of int
| B of string
         [@@deriving eq,ord,show]

let transform_hes hes : H.hes =
  let a = A 0 in
  print_string (show a);
  hes
