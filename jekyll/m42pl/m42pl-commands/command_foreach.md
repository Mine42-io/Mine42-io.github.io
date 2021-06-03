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


## Examples


Query an url for each event:

```
| read path='urls.txt' mode=line
| foreach [
    | curl url=line
]
```


## See also

* [`echo`](/command_echo)

