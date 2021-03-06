% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License. You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations under
% the License.

-include_lib("eunit/include/eunit.hrl").

-define(BUILDDIR, filename:absname(
        filename:join([
                filename:dirname(code:which(?MODULE)),
                ".."]))).

-define(TEMPDIR,
    filename:join([
            ?BUILDDIR, "test", "temp"])).

-define(tempfile,
    fun() ->
        {A, B, C} = erlang:timestamp(),
        N = node(),
        FileName = lists:flatten(io_lib:format("~p-~p.~p.~p", [N, A, B, C])),
        filename:join([?TEMPDIR, FileName])
    end).
-define(tempdb,
    fun() ->
            Nums = tuple_to_list(erlang:timestamp()),
            Prefix = "eunit-test-db",
            Suffix = lists:concat([integer_to_list(Num) || Num <- Nums]),
            list_to_binary(Prefix ++ "-" ++ Suffix)
    end).

