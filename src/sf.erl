%%% @author Leonardo Rossi <leonardo.rossi@studenti.unipr.it>
%%% @copyright (C) 2017 Leonardo Rossi
%%%
%%% This software is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License as
%%% published by the Free Software Foundation; either version 2 of the
%%% License, or (at your option) any later version.
%%%
%%% This software is distributed in the hope that it will be useful, but
%%% WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%% General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with this software; if not, write to the Free Software Foundation,
%%% Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
%%%
%%% @doc Utilities to format a string
%%% @end

-module(sf).

-author('Leonardo Rossi <leonardo.rossi@studenti.unipr.it>').

-export([
  format/2,
  format/3,
  to_atom/1,
  to_string/1
]).

%%%_ * Types -----------------------------------------------------------

-export_type([subpairs/0, key/0, value/0]).

-type key()      :: binary().
-type value()    :: binary().
-type subpairs() :: list({key(), value()}) | map().

%% API

-spec format(binary(), subpairs()) -> binary().
format(Template, SubPair) when is_map(SubPair) ->
  format(Template, maps:to_list(SubPair));
format(Template, SubPair) ->
  format(Template, SubPair, []).

format(Template, SubPair, Opts) ->
  Result = lists:foldl(
    fun ({K, V}, Acc) ->
        replace(to_string(Acc), to_string(K), to_string(V))
    end, Template, SubPair),
  opts(Result, Opts).

to_string(Val) when is_map(Val) -> lists:flatten(io_lib:format("~p", [Val]));
to_string(Val) when is_number(Val) -> lists:flatten(io_lib:format("~p", [Val]));
to_string(Val) when is_binary(Val) -> binary_to_list(Val);
to_string(Val) when is_atom(Val) -> atom_to_list(Val);
to_string(Val) when is_pid(Val) -> pid_to_list(Val);
to_string(Val) when is_tuple(Val) -> lists:flatten(io_lib:format("~p", [Val]));
to_string(Val) -> Val.

to_atom(Val) -> list_to_atom(to_string(Val)).

%% Private functions

opts(Result, []) -> Result;
opts(Result, [string | Opts]) -> opts(to_string(Result), Opts);
opts(Result, [atom | Opts]) -> opts(to_atom(Result), Opts).

replace(String, Key, Value) ->
  % SValue = io_lib:format("~p", [Value]),
  re:replace(String, "{{" ++ Key ++ "}}", Value, [{return, binary}, global]).

