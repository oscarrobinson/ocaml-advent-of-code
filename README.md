# ocaml_advent_of_code

Project for writing Advent of Code solutions in ocaml

## Setup

Create opam switch

```shell
opam switch create .
```

Install deps

```shell
opam install . --deps-only  
```

## Solving a day

Copy the template dir.

Replace YYYY and DD in the dune file with the year and day you're solving.

Populate the input.txt and test_input.txt with the input and test input for the day.

Run the tests

e.g for 2024 day 1

```shell
opam exec -- dune runtest y_2024_d_01    
```

We run the solutions as test. Populate the expect test for part a running against the test input with the expected answer for part a's test input.

Once your expect test for the test input is passing, the expect test running on the main input should be providing the answer to part a.

Repeat for part b.

## Format code

```shell
opam exec -- dune fmt
opam exec -- dune promote
```