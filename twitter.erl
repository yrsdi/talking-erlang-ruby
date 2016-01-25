-module(twitter).
-export([hello_world/0]).

hello_world() ->
  Cmd = "ruby twitter-erl.rb",
  Port = open_port({spawn, Cmd}, [{packet, 4}, nouse_stdio, exit_status, binary]),
  Payload = term_to_binary({post, <<"Hello World! (from Erlang, through Ruby)">>}),

 % send command to Ruby script & wait for response
  port_command(Port, Payload),

  receive
    {Port, {data, Data}} ->
      {result, Text} = binary_to_term(Data),

      % print out resulting tweet
      io:format("~p~n", [Text])
  end.