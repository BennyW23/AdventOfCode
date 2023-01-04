-module(template).
-export([part1/0, part2/0]).

part1() ->
  {ok, Data} = file:read_file("./input/template.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  ok.

part2() ->
  ok.