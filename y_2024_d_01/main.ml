open! Core

let get_line_nums line =
  let raw_nums =  String.split ~on:' ' line |> List.filter ~f:(Fn.non String.is_empty) in
  match raw_nums with
  | raw_num_1 :: raw_num_2 :: _ -> (Int.of_string raw_num_1, Int.of_string raw_num_2)
  | _ -> failwith "Line did not contain two numbers"


let a filename  = (* Remember to replace _filename with filename to bring it in scope *)
  let lines = In_channel.read_lines filename in
  let (nums1, nums2) = List.fold lines ~init:([], []) ~f:(fun (nums1, nums2) line ->
      let (num1, num2) = get_line_nums line in
      (num1 :: nums1, num2 :: nums2)
    ) in
  let sorted_nums1 = List.sort ~compare:Int.compare nums1 in
  let sorted_nums2 = List.sort ~compare:Int.compare nums2 in

  let result = List.zip_exn sorted_nums1 sorted_nums2 |> 
    List.sum (module Int) ~f:(fun (num1, num2) -> Int.abs (num1 - num2)) in

  printf "%d" result

let%expect_test "a test" = 
  a("test_input.txt");
  [% expect {| 11 |}]

let%expect_test "a solution" =
  a("input.txt");
  [%expect {| 1970720 |}]

let b _filename = (* Remember to replace _filename with filename to bring it in scope *)
  print_endline "0"

  let%expect_test "b test" = 
  b("test_input.txt");
  [% expect {| 0 |}]

let%expect_test "b solution" =
  b("input.txt");
  [%expect {| 0 |}]