---
layout: default
title: M42PL
nav_order: 1
has_children: true
---

# M42PL - A Data Processing Language

M42PL is a **data processing language**, inspired by Unix shells and [Splunk][].

The language is designed to be as easy as possible to use, and to make common 
scripting and programming tasks even easier. It does not have a tedious syntax
to learn, and hides advanced programming concepts from the user.

Some examples:

**Query an URL**

```
| url 'https://api.ipify.org'
| fields response.content, response.status
| eval message = 'Your external IP is ' + response.content
| output format=json
```

**Run a HTTP server**

```
| http_server with
    '*' on '/foo' = [
        | echo
        | eval path='foo', mode='infinite+iterator'
        | fields path, mode
    ],
    '*' on '/bar' = [
        | eval path='bar', mode='infinite+stream'
        | fields path, mode
    ],
    '*' on '/{path}' = []
```

**Capture and stream a video**

Read from the webcam:

```
| cv2_read
| cv2_resize ratio=0.5
| zmq_pub topic='webcam'
```

**Display a streamed video**

```
| zmq_sub topic='webcam'
| decode {zmq.frames[0]} with 'msgpack'
| cv2_show cv2.frame
```
