---
layout: default
title: eval
parent: Core commands
grand_parent: M42PL
---

# `eval`

Evaluate a Python expression and assign result to a field

Beta
{: .label .label-yellow }

StreamingCommand
{: .label-blue }

---



## Aliases

* `eval`
* `evaluate`


## Synopsis

```shell
| eval <field_name> = <expression> [, ...]
```



## Description

`eval` evaluates an expression and returns its results.

The expression is evaluated by the underlying Python interpreter. Unlike
standard evaluation, `eval` uses a set of custom functions and a custom
variables resolution mechanism.


## Examples


```
| make showinfo=yes
| eval some.field = id + 1
```

```
| commands
| eval
    command.name = at(command.aliases, 0),
    command.markdown = joinpath('markdown', at(command.aliases, 0) + '.md')
```


## See also

