---
layout: default
title: foreach
parent: Core commands
grand_parent: M42PL
---

# `foreach`

Run a sub-pipeline for each event

Beta
{: .label .label-yellow }

StreamingCommand
{: .label-blue }

---



## Synopsis

```shell
| foreach <pipeline>
```



## Description

`foreach` runs a sub-pipeline for each event.
it is mostly useful to chain generating commands.


## Examples


Query an url for each event:

```
| readline 'urls.txt'
| foreach [
    | curl url=line
]
```


## See also

