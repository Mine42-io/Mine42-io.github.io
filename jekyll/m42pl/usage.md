---
layout: default
title: Usage
nav_order: 3
parent: M42PL
---

# Usage

## Basis

M42PL can run scripts or can be run in REPL mode. M42PL scripts are
standard text files, which end with `.mpl` or `.m42pl` by convention.

To start an interpreter (REPL), run the command `m42pl repl`
(type `exit` to leave):

```
$ m42pl repl
m42pl |
```

Mandatory *hello world* script:

```
| make | eval hello = 'world !'
```

You may run a M42PL script using the `m42pl run` command:

```shell
$ m42pl run <filename.mpl>
```

## Syntax

A M42PL script is a **pipeline** (a list of **commands** starting with
pipes `|`):

```
| make | eval foo = 'bar' | output
```

You can separate commands with new lines too (new lines are ignored):

```
| make
| eval foo = 'bar'
| output
```

Most commands takes **parameters** (aka. **fields**):

```
| make 2 showinfo=yes
| output
```

* **positional parameters** have no name (ex: `2`)
* **named parameters** are prefixed with their name (ex: `showinfo=yes`)

Commands **parameters** (aka. **fields**) support various syntax:

| Example                              | Field                 | Description         |
|--------------------------------------|-----------------------|---------------------|
| ``` | make count=2 ```               | `2`                   | Nunber              |
| ``` | output format='json' ```       | `'json'`              | String              |
| ``` | make showinfo=`True` ```       | `` `True` ``          | Eval expression     |
| ``` | fields response.items ```      | `response.items`      | Field path variable |
| ``` | fields {response.items[0]} ``` | `{response.items[0]}` | JSON path variable  |
| ``` | wget url=[| read url.txt] ```  | `[| read url.txt]`    | Sub-pipeline        |

A comment is a call to the `| ignore` or `| comment` command:

```
| make
| ignore eval foo='bar'
| output format=json
```

Commands have **multiple names** (aka. **aliases**); The following snippets
are identical:

```
| make | eval foo='bar' | output
```

```
| makeevent | evaluate foo='bar' | print
```

Five types of commands exists:

* **Generating**: One per pipeline; Generate events (e.g. performs an HTTP
  request, read a file, consume a queue, etc.)
* **Streaming**: Process events as they arrive. As many as needed per pipeline.
* **Buffering**: Process events batches. As many as needed per pipeline.
* **Meta**: Control the pipeline behaviour and parameters. As many as needed
  per pipeline.
* **Merging**: Indicates that a split pipeline must be merged.

Having a single generating command per pipeline may looks limitating, but M42PL
supports **sub-pipelines**:

```
| readfile 'list_of_urls.txt'
| foreach [
    | wget url
    | fields response.content
]
```

Commands may also implements their own, custom grammar:

```
| make count=10 showinfo=yes
| rename id as event.id
| eval is_even = even(event.id)
| stats count by is_even
```

## Events

M42PL's commands generates or manipulates _events_. Events are JSON-like
data structure which contains keys associated with values (under the hood,
events are just Python's `dict` instances).

Example with the `make` command:

```
| make showinfo=yes | output
```

Output:

```json
{
  "id": 0,
  "chunk": {
    "chunk": 0,
    "chunks": 1
  },
  "count": {
    "begin": 0,
    "end": 1
  },
  "pipeline": {
    "name": "main"
  }
}
```

Events' keys can contains different kind of values:

* Scalars: _string_, _float_ and _integer_
* Compund: _map_ and _list_
* Complex: other data structure

The commands provided in M42PL [core commands][m42pl-git-commands] manipulates
or generates events keys and values.

During the execution of the pipeline, events may be stored into a remote
database, printed onto the stadard output, saved to a file, etc. M42PL uses
**encoders** to _encode_ (convert) events or fractions of events  to another
representation.

The `encode` command creates a new field in the event which contains its
encoded version:

```
| make showinfo=yes
| encode with 'json' as encoded
| output
```

Output:

```json
{
  "id": 0,
  "chunk": {
    "chunk": 0,
    "chunks": 1
  },
  "count": {
    "begin": 0,
    "end": 1
  },
  "pipeline": {
    "name": "main"
  },
  "encoded": "{\"id\": 0, \"chunk\": {\"chunk\": 0, \"chunks\": 1}, \"count\": {\"begin\": 0, \"end\": 1}, \"pipeline\": {\"name\": \"main\"}}"
}
```

**Decoding** is the counterpart of **encoding**: the `decode` command converts
a field into a native representation:

```
| make
| eval encoded="{\"id\": 0, \"chunk\": {\"chunk\": 0, \"chunks\": 1}, \"count\": {\"begin\": 0, \"end\": 1}, \"pipeline\": {\"name\": \"main\"}}"
| decode encoded with 'json'
```

Output:

```json
{
  "encoded": "{\"id\": 0, \"chunk\": {\"chunk\": 0, \"chunks\": 1}, \"count\": {\"begin\": 0, \"end\": 1}, \"pipeline\": {\"name\": \"main\"}}",
  "id": 0,
  "chunk": {
    "chunk": 0,
    "chunks": 1
  },
  "count": {
    "begin": 0,
    "end": 1
  },
  "pipeline": {
    "name": "main"
  }
}
```

---

[m42pl-git-commands]: https://github.com/jpclipffel/m42pl-commands
