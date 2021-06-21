---
layout: default
title: Local REPL
parent: Core dispatchers
grand_parent: M42PL
---

# `local_repl`

Same as the `local` dispatcher (single CPU), but automatically adds an
`output` command to the script.

This dispatcher is used by default when running `m42pl repl`.

One can disable the output either by:
* Selecting another dispatcher such as `local`: `m42pl repl -d local`
* Adding a `noout` command at the end of the script: `| ... | noout`

One can also override the default `output` command by adding a custom command.
Example:

```
| ... | output buffer=1 format='raw'
```

---

## Aliases

* `local_repl`

## Synopsis

This dispatcher takes no argument.

```
m42pl run -d local_repl <script.mpl>
```
