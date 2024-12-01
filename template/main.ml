open! Core

let a _filename  = (* Remember to replace _filename with filename to bring it in scope *)
  print_endline "0"

let%expect_test "a test" = 
  a("test_input.txt");
  [% expect {| 0 |}]

let%expect_test "a solution" =
  a("input.txt");
  [%expect {| 0 |}]

let b _filename = (* Remember to replace _filename with filename to bring it in scope *)
  print_endline "0"

  let%expect_test "b test" = 
  b("test_input.txt");
  [% expect {| 0 |}]

let%expect_test "b solution" =
  b("input.txt");
  [%expect {| 0 |}]