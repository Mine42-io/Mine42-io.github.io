---
layout: default
title: Parsing
nav_order: 1
parent: Examples
grand_parent: M42PL
---

# Parsing

M42PL's core commands provides several commands to parse data.

## Regular expression

The `regex` command applies a regular expression to the given field.
The regular expression should contains _named groups_: each named group is
derived into a new field with the extracted data.

```
| eval msg = 'user="foo",user_id=12345,command="ls -al"'
| regex msg with 'user=\"(?<user>[^\"]*)\",user_id=(?<user_id>[0-9]*),command=\"(?<command>[^\"]?*\"'
```

```json
{
  "msg": "user=\"foo\",user_id=12345,command=\"ls -al\"",
  "user": "foo",
  "user_id": "12345",
  "command": "ls -al"
}
```

You may also specify in which parent field you want to extract the named groups:

```
| eval msg = 'user="foo",user_id=12345,command="ls -al"'
| regex msg with 'user=\"(?<user>[^\"]*)\",user_id=(?<user_id>[0-9]*),command=\"(?<command>[^\"]?*\"' as log
```

```json
{
  "msg": "user=\"foo\",user_id=12345,command=\"ls -al\"",
  "log": {
    "user": "foo",
    "user_id": "12345",
    "command": "ls -al"
  }
}
```


## Grok

The `grok` command applies a Grok pattern to the given field.
Grok works in a similar way than standard regular expression, but allows you to
use existing patterns to extract fields instead of writting regular expressions.

The `grok` command also support nested fields extraction and types casting.

```
| eval msg = 'user="foo",user_id=12345,command="ls -al"'
| grok msg with 'user="%{USER:user}",user_id=%{INT:user_id:int},command=%{QUOTEDSTRING:command}'
| eval command = strip(command, '"')
```

```json
{
  "msg": "user=\"foo\",user_id=12345,command=\"ls -al\"",
  "user": "foo",
  "user_id": 12345,
  "command": "ls -al"
}
```

You may also specify in which parent field you want to extract the named groups:

```
| eval msg = 'user="foo",user_id=12345,command="ls -al"'
| grok msg with 'user="%{USER:user}",user_id=%{INT:user_id:int},command=%{QUOTEDSTRING:command}' as log
| eval log.command = strip(log.command, '"')
```

```json
{
  "msg": "user=\"foo\",user_id=12345,command=\"ls -al\"",
  "log": {
    "user": "foo",
    "user_id": 12345,
    "command": "ls -al"
  }
}
```


## See also

* [Mapping]()
