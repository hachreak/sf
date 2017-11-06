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

How format a string:

```erlang
sf:format(<<"Hello {{name}}! My pid: {{pid}}">>,
          [{name, <<"worlds">>}, {pid, self()}]).
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
