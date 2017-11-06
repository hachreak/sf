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
sf:format(<<"Hello {{name}}!">>, [{<<"name">>, <<"worlds">>}]).
```


Build
-----

    $ rebar3 compile
