---
layout: default
title: make
parent: Core commands
grand_parent: M42PL
---

# `make`

Generates and returns new events

Beta
{: .label .label-yellow }

GeneratingCommand
{: .label-blue }

---



## Aliases

* `make`
* `makeevent`
* `makeevents`


## Synopsis

```shell
| make [[count=]<number>] [[showinfo=](yes|no)][[chunks=]<number>] [[frequency=]<seconds>]
```



## Description

`make` generates events. It is primarily used in local scripts, REPL mode and
debug operations.


## Examples


Generate a single, empty event:

```
| make
```

Generate a single event with basic generation information:

```
| make showinfo=yes
```


## See also

* [`echo`](/command_echo)

