sf (String Formatter)
=====================

An OTP library to format a string.

Use
---

rebar.config

```erlang
{deps, [
  {sf,
    {git, "https://github.com/hachreak/sf.git", {branch, master}}}
]}.
```

How to format a binary:

```erlang
<<"Hello worlds! The answer is: 42">> =
    sf:format(<<"Hello {{name}}! The answer is: {{answer}}">>,
              [{name, <<"worlds">>}, {answer, 42}]).
```

Or (passing a map):

```erlang
<<"Hello worlds! The answer is: 42">> =
    sf:format(<<"Hello {{name}}! The answer is: {{answer}}">>,
              #{name => <<"worlds">>, answer => 42}).
```

How to format a string:

```erlang
"Hello worlds!" = sf:format(
      <<"Hello {{name}}!">>, [{name, <<"worlds">>}], [string]).
```

How to format a atom:

```erlang
'Hello worlds!' = sf:format(
      <<"Hello {{name}}!">>, [{name, <<"worlds">>}], [atom]).
```

Convert to string:

```erlang
"test" = sf:to_string(test).
"test" = sf:to_string("test").
"test" = sf:to_string(<<"test">>).
"123" = sf:to_string(123).
"12.3" = sf:to_string(12.3).
"<0.60.0>" = sf:to_string(self()).
"{1,2,3}" = sf:to_string({1,2,3}).

Build
-----

    $ rebar3 compile
