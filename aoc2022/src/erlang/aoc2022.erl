-module(aoc2022).
-export([main/1]).

-define(DAYS_DONE, [1,2,3]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    read_args(Args).

%%====================================================================
%% Internal functions
%%====================================================================

read_args(Args) ->
    if
        length(Args) =:= 2 ->
            [First,Last] = Args,
            Day = erlang:list_to_integer(First),
            Part = erlang:list_to_integer(Last),
            run(Day, Part);
        length(Args) =:= 1 ->
            [First | _] = Args,
            Day = erlang:list_to_integer(First),
            run(Day, 0);
        length(Args) =:= 0 ->
            run(0, 0)
    end.

run(Day, _) when Day == 0 ->
    [run(EachDay, 0) || EachDay <- ?DAYS_DONE];

run(Day, Part) when Part == 0 ->
    io:format("~n", []),
    [run(Day, EachPart) || EachPart <- [1, 2]];

run(Day, Part) when 1 =< Day, Day =< 25, 1 =< Part, Part =< 2 ->
    io:format("~nRunning Day ~p, Part ~p ~n", [Day, Part]),
    if
        Day == 1 andalso Part == 1 ->
            day01:part1();
        Day =:= 1 andalso Part =:= 2 ->
            day01:part2();
        Day == 2 andalso Part == 1 ->
            day02:part1();
        Day =:= 2 andalso Part =:= 2 ->
            day02:part2();
        Day == 3 andalso Part == 1 ->
            day03:part1();
        Day =:= 3 andalso Part =:= 2 ->
            day03:part2();
        true ->
            io:format("Day ~p, Part ~p not found ~n", [Day, Part])
    end,
    ok;

run(Day, Part) ->
    io:format("Invalid Day ~p, Part ~p ~n", [Day, Part]).