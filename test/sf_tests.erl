%% Tests

-module(sf_tests).

-author('Leonardo Rossi <leonardo.rossi@studenti.unipr.it>').

-include_lib("eunit/include/eunit.hrl").

string_formatting_test() ->
  <<"hello worlds!">> = sf:format(
          <<"hello {{name}}!">>, [{<<"name">>, <<"worlds">>}]),

  <<"hello string!">> = sf:format(
          "hello {{name}}!", [{"name", "string"}]),

  <<"hello 123!">> = sf:format(
          "hello {{name}}!", [{"name", 123}]),

  <<"hello 12.3!">> = sf:format(
          "hello {{name}}!", [{"name", 12.3}]),

  ok.

to_string_test() ->
  "test" = sf:to_string(test),
  "test" = sf:to_string(<<"test">>),
  "123" = sf:to_string(123),
  "12.3" = sf:to_string(12.3),
  "test" = sf:to_string("test").