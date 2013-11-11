module(proj1_app).
%%-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").

%%-behaviour(application).

%% Application callbacks
-export([list/2,del/2,newlist/2,newlist1/1,check/1,check/2]).
-export([del/3,reverce/1,reverce/2,newlist/3,newlist1/3]).
%% ===================================================================
%% Application callbacks
%% ===================================================================

%% 1 
list([],_K) ->  io:format("Empty list~n");

list([Head|Tail],K) when is_integer(K)  -> 

   if 
      
 %%    K ==0 -> "error";
 %%    K< 0-> "error";
    
     K ==1 -> io:format("The element is ~w ~n",[Head]);

     
     K>1 -> list(Tail,(K-1))
   
  end.

reverce(List)-> reverce(List,[]).
reverce([Head|Tail],List)-> reverce(Tail,[Head|List]);
reverce([],List)-> List.

%% test for reverce
%%reverce_test()->
%% ?assertEqual([2,1], reverce([1,2])).


%% 2
del([],_K) ->  io:format("Empty list~n");
del(List,K) ->  del(List,K,[]).

del([Head|Tail],K,Newlist) when is_integer(K) -> 

   if 
      
     K ==0 -> "error";
     K ==1 -> io:format("New list is ~w ~n",[reverce(Newlist)++Tail]);

     K< 0-> "error";
     K>1 -> del(Tail,(K-1),[Head|Newlist])
   

end.


%% 3

newlist([],_K) ->  io:format("Empty list~n");
newlist(List,K) ->  newlist(List,K,[]).

newlist([Head|Tail],K,Newlist) when is_integer(K) -> 

   if 
      
     K ==0 -> "error";
     K ==1 -> io:format("New lists are ~w  and ~w ~n",[reverce([Head|Newlist]), Tail]);

     K< 0-> "error";
     K>1 -> newlist(Tail,(K-1),[Head|Newlist])
   

end.

%% 5





newlist1([]) ->  io:format("Empty list~n");
newlist1(List) ->  newlist1(List,length(List),[]).



newlist1([Head|Tail],K,Newlist) when is_integer(K) -> 

   if 
      
    
     K ==1 -> io:format("New lists is ~w  ~n",[reverce([Head|Newlist])]);

     
     K>1 -> newlist1(Tail,(K-1),[check(Head)|Newlist])
   

end.


%%prop_delete() ->
%%    ?FORALL({X,L}, {integer(),list(integer())},
 %%           not lists:member(X, lists:delete(X, L))).
 
%%proper_test() ->
 %% ?assertEqual(
 %%   [],
 %%   proper:module(?MODULE, [{to_file, user},
 %%                           {numtests, 1000}])
 %%   ).

