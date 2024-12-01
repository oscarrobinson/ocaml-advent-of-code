open! Core

let get_line_nums line =
  let raw_nums =
    String.split ~on:' ' line |> List.filter ~f:(Fn.non String.is_empty)
  in
  match raw_nums with
  | raw_num_1 :: raw_num_2 :: _ ->
      (Int.of_string raw_num_1, Int.of_string raw_num_2)
  | _ -> failwith "Line did not contain two numbers"

let get_file_nums filename =
  let lines = In_channel.read_lines filename in
  let nums1, nums2 =
    List.fold lines ~init:([], []) ~f:(fun (nums1, nums2) line ->
        let num1, num2 = get_line_nums line in
        (num1 :: nums1, num2 :: nums2))
  in
  (nums1, nums2)

let a filename =
  let nums1, nums2 = get_file_nums filename in

  let sorted_nums1 = List.sort ~compare:Int.compare nums1 in
  let sorted_nums2 = List.sort ~compare:Int.compare nums2 in

  let result =
    List.zip_exn sorted_nums1 sorted_nums2
    |> List.sum (module Int) ~f:(fun (num1, num2) -> Int.abs (num1 - num2))
  in

  printf "%d" result

let%expect_test "a test" =
  a "test_input.txt";
  [%expect {| 11 |}]

let%expect_test "a solution" =
  a "input.txt";
  [%expect {| 1970720 |}]

let count_occurences nums =
  List.fold nums
    ~init:(Map.empty (module Int))
    ~f:(fun count_map num ->
      Map.update count_map num ~f:(function
        | Some count -> count + 1
        | None -> 1))

let b filename =
  let nums1, nums2 = get_file_nums filename in
  let nums_counts = count_occurences nums2 in
  let result =
    List.sum
      (module Int)
      nums1
      ~f:(fun num -> num * Option.value ~default:0 (Map.find nums_counts num))
  in
  printf "%d" result

let%expect_test "b test" =
  b "test_input.txt";
  [%expect {| 31 |}]

let%expect_test "b solution" =
  b "input.txt";
  [%expect {| 17191599 |}]
