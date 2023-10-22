-module(day02).
-export([part1/0, part2/0]).

-define(ROCK, 0).
-define(PAPER, 1).
-define(SCISSORS, 2).
-define(LOSE, 0).
-define(DRAW, 3).
-define(WIN, 6).

part1() ->
  {ok, Data} = file:read_file("./input/day02.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Answer = calculatePart1(Lines, 0),

  io:format("Part 1: ~p ~n", [Answer]),
  ok.

part2() ->
  {ok, Data} = file:read_file("./input/day02.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Answer = calculatePart2(Lines, 0),

  io:format("Part 2: ~p ~n", [Answer]),
  ok.

calculatePart1(Lines, Score) when length(Lines) =:= 0 ->
  Score;

calculatePart1(Lines, Score) ->
  [Line | Rest] = Lines,
  Parts = binary:split(Line, [<<" ">>], [global]),
  [First, Second] = Parts,
  Opponent = parseFirst(First),
  Player = parseSecondPart1(Second),
  OutcomeScore = getOutcome(Opponent, Player),
  calculatePart1(Rest, Score + 1 + Player + OutcomeScore).

parseFirst(First) ->
  case First of
    <<"A">> -> ?ROCK;
    <<"B">> -> ?PAPER;
    <<"C">> -> ?SCISSORS
  end.

parseSecondPart1(Second) ->
  case Second of
    <<"X">> -> ?ROCK;
    <<"Y">> -> ?PAPER;
    <<"Z">> -> ?SCISSORS
  end.

getOutcome(Opponent, Player) ->
  if
    Player =:= Opponent ->
      ?DRAW;
    (Player + 1) rem 3 =:= Opponent ->
      ?LOSE;
    (Opponent + 1) rem 3 =:= Player ->
      ?WIN
  end.

calculatePart2(Lines, Score) when length(Lines) =:= 0 ->
  Score;

calculatePart2(Lines, Score) ->
  [Line | Rest] = Lines,
  Parts = binary:split(Line, [<<" ">>], [global]),
  [First, Second] = Parts,
  Opponent = parseFirst(First),
  Outcome = parseSecondPart2(Second),
  Move = getMove(Opponent, Outcome),
  calculatePart2(Rest, Score + 1 + Move + Outcome).

parseSecondPart2(Second) ->
  case Second of
    <<"X">> -> ?LOSE;
    <<"Y">> -> ?DRAW;
    <<"Z">> -> ?WIN
  end.

getMove(Opponent, Outcome) ->
  if
    Outcome =:= ?LOSE ->
      (Opponent + 2) rem 3;
    Outcome =:= ?DRAW ->
      Opponent;
    Outcome =:= ?WIN ->
      (Opponent + 1) rem 3
  end.