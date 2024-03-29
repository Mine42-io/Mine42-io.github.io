---
layout: default
title: stats
parent: Core commands
grand_parent: M42PL
---

# `stats`

Performs statistical operations on an events stream

Beta
{: .label .label-yellow }

StreamingCommand
{: .label-blue }

---


## Aliases

* `stats`
* `aggr`
* `aggregate`


## Synopsis

```shell
| stats <function> [as <field>], ... by <field>, ... [with ...]
```


If no aggregation clause (the `by` word) is given, `stats` aggregates all events
together without distinction:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id
```

```json
{
  "min_id": 0,
  "max_id": 9
}
```

If an aggregation clause (the `by` word) is given, `stats` aggregates events
based on the `by` field(s). In the next example, events are aggregated _by_ the
value of the field `is_even`:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id by is_even
```

```json
{
  "is_even": true,
  "min_id": 0,
  "max_id": 8
}

{
  "is_even": false,
  "min_id": 1,
  "max_id": 9
}
```

One can also customize some aspect of `stats`'s internals by adding a `with`
clause at the end of the command. This is not a standard use case: Please
refers to the technical documentation for more information.



## Description

`stats` aggregates events by field(s) and compute _statistical values_ from the
events stream.

### Stats functions

| Function | Syntax            | Description                           |
|----------|-------------------|---------------------------------------|
| `count`  | `count`           | Count the number of events            |
| `min`    | `min(<field>)`    | Returns the minimum value of `field`  |
| `max`    | `max(<field>)`    | Returns the maximum value of `field`  |
| `values` | `values(<field>)` | Returns the list of values of `field` |
| `first`  | `first(<field>)`  | Returns the first value of `field`    |
| `last`   | `last(<field>)`   | Returns the latest value of `field`   |


## Examples

---
layout: default
title: stats
parent: Core commands
grand_parent: M42PL
---

# `stats`

Performs statistical operations on an events stream

Beta
{: .label .label-yellow }

StreamingCommand
{: .label-blue }

---


## Aliases

* `stats`
* `aggr`
* `aggregate`


## Synopsis

```shell
| stats <function> [as <field>], ... by <field>, ... [with ...]
```


If no aggregation clause (the `by` word) is given, `stats` aggregates all events
together without distinction:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id
```

```json
{
  "min_id": 0,
  "max_id": 9
}
```

If an aggregation clause (the `by` word) is given, `stats` aggregates events
based on the `by` field(s). In the next example, events are aggregated _by_ the
value of the field `is_even`:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id by is_even
```

```json
{
  "is_even": true,
  "min_id": 0,
  "max_id": 8
}

{
  "is_even": false,
  "min_id": 1,
  "max_id": 9
}
```

One can also customize some aspect of `stats`'s internals by adding a `with`
clause at the end of the command. This is not a standard use case: Please
refers to the technical documentation for more information.



## Description

`stats` aggregates events by field(s) and compute _statistical values_ from the
events stream.

### Stats functions

| Function | Syntax            | Description                           |
|----------|-------------------|---------------------------------------|
| `count`  | `count`           | Count the number of events            |
| `min`    | `min(<field>)`    | Returns the minimum value of `field`  |
| `max`    | `max(<field>)`    | Returns the maximum value of `field`  |
| `values` | `values(<field>)` | Returns the list of values of `field` |
| `first`  | `first(<field>)`  | Returns the first value of `field`    |
| `last`   | `last(<field>)`   | Returns the latest value of `field`   |


## Examples

---
layout: default
title: stats
parent: Core commands
grand_parent: M42PL
---

# `stats`

Performs statistical operations on an events stream

Beta
{: .label .label-yellow }

StreamingCommand
{: .label-blue }

---


## Aliases

* `stats`
* `aggr`
* `aggregate`


## Synopsis

```shell
| stats <function> [as <field>], ... by <field>, ... [with ...]
```


If no aggregation clause (the `by` word) is given, `stats` aggregates all events
together without distinction:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id
```

```json
{
  "min_id": 0,
  "max_id": 9
}
```

If an aggregation clause (the `by` word) is given, `stats` aggregates events
based on the `by` field(s). In the next example, events are aggregated _by_ the
value of the field `is_even`:

```
| make count=10 showinfo=yes
| eval is_even = even(id)

| stats min(id) as min_id, max(id) as max_id by is_even
```

```json
{
  "is_even": true,
  "min_id": 0,
  "max_id": 8
}

{
  "is_even": false,
  "min_id": 1,
  "max_id": 9
}
```

One can also customize some aspect of `stats`'s internals by adding a `with`
clause at the end of the command. This is not a standard use case: Please
refers to the technical documentation for more information.



## Description

`stats` aggregates events by field(s) and compute _statistical values_ from the
events stream.

### Stats functions

| Function | Syntax            | Description                           |
|----------|-------------------|---------------------------------------|
| `count`  | `count`           | Count the number of events            |
| `min`    | `min(<field>)`    | Returns the minimum value of `field`  |
| `max`    | `max(<field>)`    | Returns the maximum value of `field`  |
| `values` | `values(<field>)` | Returns the list of values of `field` |
| `first`  | `first(<field>)`  | Returns the first value of `field`    |
| `last`   | `last(<field>)`   | Returns the latest value of `field`   |


## Examples

