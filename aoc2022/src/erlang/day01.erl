-module(day01).
-export([part1/0, part2/0]).

part1() ->
  {ok, Data} = file:read_file("./input/day01.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Totals = parseLines(Lines),
  Solution = lists:max(Totals),

  io:format("Part 1: ~p ~n", [Solution]),
  ok.

part2() ->
  {ok, Data} = file:read_file("./input/day01.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Totals = parseLines(Lines),
  ReverseSort = fun (A, B) -> A >= B end,
  SortedTotals = lists:sort(ReverseSort, Totals),
  [Elf1, Elf2, Elf3 | _] = SortedTotals,
  Solution = Elf1 + Elf2 + Elf3,

  io:format("Part 2: ~p ~n", [Solution]),
  ok.

parseLines(Lines) ->
  parseLines(Lines, 0).

parseLines(Lines, Acc) when length(Lines) =:= 0 andalso Acc =:= 0 ->
  [];

parseLines(Lines, Acc) when length(Lines) =:= 0 ->
  [Acc];

parseLines(Lines, SoFar) ->
  [Line | Rest] = Lines,
  if
    Line =:= <<>> andalso SoFar > 0 ->
      [SoFar | parseLines(Rest, 0)];
    Line =:= <<>> ->
      parseLines(Rest, 0);
    true ->
      Value = binary_to_integer(Line),
      parseLines(Rest, SoFar + Value)
  end.