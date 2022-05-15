module OrderedZ =
  struct
    type t = (Z.t)
    let compare n1 n2 = compare n1 n2
  end 


module AssocZ = Map.Make (OrderedZ) 

open Z 

let two = of_int 2
let three = of_int 3
let nine = of_int 9
let six = of_int 6


let optf =
let table = ref AssocZ.empty in
let rec s_m n =
try AssocZ.find n !table
with Not_found ->
let rec ret =
  if lt n zero then minus_one else
  if equal n one then one
  else if equal n two then one
  else if equal n three then three
  else divexact (sub (mul (sub (mul six n) nine) (s_m((sub n one))))
              (mul (sub n three) (s_m((sub n two)))))
              (n) in table := AssocZ.add n ret !table; ret in s_m;;

let k = read_int()
let option = (Z.of_int (k))
let option_a = Z.to_string (mul (optf((add option one))) two )

let () = Printf.printf "%s\n" option_a
