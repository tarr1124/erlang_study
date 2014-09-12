- module(primenum).
- export([primenum/1, printnum/2, countprime/1]).

primenum(Num) when Num >= 2 ->
	primecheck(2, Num);
primenum(_Others) ->
	false.

primecheck(TargetNum, TargetNum) ->
	true;
primecheck(Num, TargetNum) when TargetNum rem Num =:= 0 ->
	false;
primecheck(Num, TargetNum) ->
	primecheck(Num+1, TargetNum).


createlist(Num, List) when Num == 0 -> 
	List;
createlist(Num, List) ->
	createlist(Num-1 ,[Num | List]).


printnum(Num, Type) when Type =:= "Prime" ->
        List = createlist(Num, []),
        PrimeNum = lists:filter(fun(X) -> primenum(X) end, List);
printnum(Num, Type) when Type =:= "Composit" ->
        List = createlist(Num, []),
        PrimeNum = lists:filter(fun(X) -> primenum(X) end, List),
	CompositNum = List -- PrimeNum.

countprime(Num) -> 
	List = printnum(Num, "Prime"),
	length(List).
	
