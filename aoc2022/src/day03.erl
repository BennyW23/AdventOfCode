-module(day03).
-export([part1/0, part2/0]).

part1() ->
  {ok, Data} = file:read_file("./input/day03.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Shared = findRepeatedCharacters(Lines, []),
  Priorities = lists:map(fun prioritize/1, Shared),
  io:format("Part 1: ~p ~n", [lists:sum(Priorities)]),
  ok.

part2() ->
  {ok, Data} = file:read_file("./input/day03.txt"),
  RawLines = binary:split(Data, [<<"\n">>], [global]),
  Lines = lists:map(fun binary_to_list/1, RawLines),

  GroupItems = getGroupItems(Lines),
  Priorities = lists:map(fun prioritize/1, GroupItems),
  io:format("Part 2: ~p ~n", [lists:sum(Priorities)]),
  ok.

findRepeatedCharacters(Lines, Result) when length(Lines) =:= 0 ->
  Result;

findRepeatedCharacters(Lines, Result) ->
  [First | Rest] = Lines,
  Line = binary_to_list(First),
  {Beginning, Ending} = lists:split(length(Line) div 2, Line),
  [Shared] = findShared(Beginning, Ending),

  findRepeatedCharacters(Rest, [Shared | Result]).

prioritize(Character) ->
  if
    97 =< Character andalso Character =< 122 ->
      Character - 96;
    65 =< Character andalso Character =< 90 ->
      Character - 64 + 26
  end.

findShared(Lines) when length(Lines) > 0 ->
  [First | Rest] = Lines,
  lists:foldl(fun findShared/2, First, Rest).

findShared(LineA, LineB) ->
  SortedA = lists:usort(LineA),
  SortedB = lists:usort(LineB),
  findShared(SortedA, SortedB, []).

findShared(A, B, Result) when length(A) =:= 0 orelse length(B) =:= 0 ->
  Result;

findShared(A, B, Result) ->
  [FirstA | RestA] = A,
  [FirstB | RestB] = B,
  if
    FirstA == FirstB -> findShared(RestA, RestB, [FirstA | Result]);
    FirstA < FirstB -> findShared(RestA, B, Result);
    FirstA > FirstB -> findShared(A, RestB, Result)
  end.

getGroupItems(Lines) ->
  getGroupItems(Lines, []).

getGroupItems(Lines, Result) when length(Lines) < 3 ->
  Result;

getGroupItems(Lines, Result) ->
  [Line1, Line2, Line3 | Rest] = Lines,
  [Shared] = findShared([Line1, Line2, Line3]),
  getGroupItems(Rest, [Shared | Result]).