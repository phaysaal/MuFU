open Hflmc2_syntax
open Transformer
   
module H = Raw_hflz
module P = Printer
         

let print_cnf_goal_formula cnf_goal =
  print_endline "CNF of Goal:";
  print_endline (P.pp_formula cnf_goal);
;;

let print_goal goal =
  print_endline "GOAL:";
  print_endline (P.pp_rule goal);
;;


let print_seperation aux goal =
  print_goal goal;
  print_endline "AUX:";
  print_endline (P.pp_hes aux);
;;

         
let transform (hes : H.hes) : H.hes =
  let aux, goals = Seperator.seperate_goal_and_defs hes in
  let goal = List.hd goals in
  print_seperation aux goal;
  
  let cnf_goal = cnf_ext goal.H.body in
  print_cnf_goal_formula cnf_goal;
  let goal' : H.hes_rule = transform_hes aux goal 1 in
  
  goal'::aux

