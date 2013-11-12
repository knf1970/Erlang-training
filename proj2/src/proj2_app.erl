-module(proj2_app).

%%-behaviour(application).

%% Application callbacks
%%-export([start/2, stop/1]).
-export([go/0,new_proc/0,received/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

%%start(_StartType, _StartArgs) ->
%%    proj2_sup:start_link().


 go()-> Pid=spawn(proj2_app,new_proc,[]),register(proc,Pid),
        
  io:format("first Pid is r ~w~n",[self()]), 
  io:format("second Pid ~w is registered as ~w~n",[Pid,proc]), timer:send_after(100,self(),stop),
  
   proc!{self(), ping},received(Pid)
    
.


   new_proc()-> 

    receive 
{Pid1,Msg}-> io:format("Pid: ~w has received  message: ~w ~n",[self(),Msg]),Pid1!  {self(),pong}, new_proc();

stop->true
    end.
  

received(Pid)->

   receive
{Pid, Msg} -> io:format("Pid: ~w has received  message: ~w ~n",[self(),Msg]),Pid!{self(), ping},received(Pid);
stop-> Pid!{stop},true

    end.









