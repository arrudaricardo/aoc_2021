-module(main).
-export([start/0]).
-import(file, [read_file/1]).
-import(string, [tokens/2]).
-import(lists, [first/1, last/1]).
-import(unicode, [characters_to_list/1]).


part1([], Map ) -> 
Horizontal = maps:get(x, Map),
Depth = maps:get(y, Map),
Solution = Horizontal * Depth,
io:fwrite("Solution 1: ~w~n", [Solution]),
ok;
part1([H | T], Map) -> 
  Horizontal = maps:get(x, Map),
	Depth = maps:get(y, Map),
	[A | _ ] = H,
	{V, _} = string:to_integer(last(H)),
	if
	 A == "forward" ->  part1(T, #{x => Horizontal + V, y => Depth});
	  A == "up" -> part1(T, #{x => Horizontal, y => Depth - V});
	  A == "down" -> part1(T, #{x => Horizontal , y => Depth + V}); 
	  true -> ok % Required
 end,
	ok
.

part2([], Map) ->
Horizontal = maps:get(x, Map),
Depth = maps:get(y, Map),
Solution = Horizontal * Depth,
io:fwrite("Solution 2: ~w~n", [Solution])
;
part2([H | T], Map) ->
  Horizontal = maps:get(x, Map),
	Depth = maps:get(y, Map),
	Aim = maps:get(aim, Map),
	[A | _ ] = H,
	{V, _} = string:to_integer(last(H)),
	if
	 A == "forward" ->
		NewHorizon = Horizontal + V,
		NewDepth = Depth + Aim * V,
	   part2(T, #{x => NewHorizon, y => NewDepth, aim => Aim});
	 A == "up" ->
	 	NewAim = Aim - V,
	  part2(T, #{x => Horizontal, y => Depth, aim => NewAim});
	 A == "down" ->
	 	NewAim = Aim + V,
	  part2(T, #{x => Horizontal, y => Depth, aim => NewAim});
	 true -> ok % Required 
 end,
ok
.

start() ->
  {ok, File} = file:read_file("input.txt"),
	R = string:tokens(unicode:characters_to_list(File), "\n"),
	D = lists:map(fun(X) -> string:tokens(X, " ") end, R),
	part1(D, #{x => 0, y => 0}),
	part2(D, #{x => 0, y => 0, aim => 0}),
	ok
.

