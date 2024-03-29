---
layout: default
title: output
parent: Core commands
grand_parent: M42PL
---

# `output`

Prints events

Beta
{: .label .label-yellow }

BufferingCommand
{: .label-blue }

---


## Aliases

* `output`
* `print`

## Synopsis

```shell
| output [[format=](hjson|raw|...)] [[buffer=]<number>]
```


## Description

`output` prints events on the standard output (i.e. the terminal).

`output` can print events using the specified `format`, which should match
an **encoder** name (e.g. `json`, `hjson`, ...).

It also buffers events and filters duplicate events id (only the latest event
with a given ID is kept in the internal buffer and then printed).


## Examples


Output events:

```
| output
```

Output events as they arrive (without buffer):

```
| output buffer=1
```

Output events as 'json' strings:

```
| output format='json'
```


---
layout: default
title: output
parent: Core commands
grand_parent: M42PL
---

# `output`

Prints events

Beta
{: .label .label-yellow }

BufferingCommand
{: .label-blue }

---


## Aliases

* `output`
* `print`

## Synopsis

```shell
| output [[format=](hjson|raw|...)] [[buffer=]<number>]
```


## Description

`output` prints events on the standard output (i.e. the terminal).

`output` can print events using the specified `format`, which should match
an **encoder** name (e.g. `json`, `hjson`, ...).

It also buffers events and filters duplicate events id (only the latest event
with a given ID is kept in the internal buffer and then printed).


## Examples


Output events:

```
| output
```

Output events as they arrive (without buffer):

```
| output buffer=1
```

Output events as 'json' strings:

```
| output format='json'
```


