---
layout: default
title: http_server
parent: Core commands
grand_parent: M42PL
---

# `http_server`

Runs an HTTP server

Beta
{: .label .label-yellow }

GeneratingCommand
{: .label-blue }

---


## Aliases

* `http_server`
* `server_http`

## Synopsis

```shell
| http_server [[host=]{host}] [[port]={port}] (<pipeline> | with 'method' on 'path' = <pipeline>, ...)
```


## Description

`http_server` starts an HTTP server and process each requests in the given
pipelines.

The server always returns (answers) the latest event processed, which is by
default the client request.



## Examples


Echo server:

```
| http_server [ | output buffer=1 ]
```

Process GET and POST requests:

```
| http_server with
    'GET' on '/objects/{name}' = [
        | output buffer=1
        | eval response = 'got some ' + at(split(path, '/'), -1)
        | fields response
    ],
    'POST' on '/objects' = [
        | fields jsdata
        | wrap 'stored'
    ]
```

Set host and port:

```
| http_server host='1.2.3.4' port=1234 [ | output buffer=1 ]
```


---
layout: default
title: http_server
parent: Core commands
grand_parent: M42PL
---

# `http_server`

Runs an HTTP server

Beta
{: .label .label-yellow }

GeneratingCommand
{: .label-blue }

---


## Aliases

* `http_server`
* `server_http`

## Synopsis

```shell
| http_server [[host=]{host}] [[port]={port}] (<pipeline> | with 'method' on 'path' = <pipeline>, ...)
```


## Description

`http_server` starts an HTTP server and process each requests in the given
pipelines.

The server always returns (answers) the latest event processed, which is by
default the client request.



## Examples


Echo server:

```
| http_server [ | output buffer=1 ]
```

Process GET and POST requests:

```
| http_server with
    'GET' on '/objects/{name}' = [
        | output buffer=1
        | eval response = 'got some ' + at(split(path, '/'), -1)
        | fields response
    ],
    'POST' on '/objects' = [
        | fields jsdata
        | wrap 'stored'
    ]
```

Set host and port:

```
| http_server host='1.2.3.4' port=1234 [ | output buffer=1 ]
```


