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

-export([format/2]).

%%%_ * Types -----------------------------------------------------------

-export_type([subpairs/0, key/0, value/0]).

-type key()      :: binary().
-type value()    :: binary().
-type subpairs() :: list({key(), value()}).

%% API

-spec format(binary(), subpairs()) -> binary().
format(Template, SubPair) ->
  lists:foldl(
    fun({K, V}, Acc) ->
        re:replace(Acc, << <<"{{">>/binary, K/binary, <<"}}">>/binary >>, V,
                   [{return, binary}, global])
    end, Template, SubPair).
