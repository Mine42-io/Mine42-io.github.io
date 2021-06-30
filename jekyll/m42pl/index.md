---
layout: default
title: M42PL
nav_order: 1
has_children: true
---

# M42PL - A Data Processing Language

M42PL is a **data processing language**, inspired by Unix shells and
[Splunk][splunk].

The language is designed for streams manipulation and provides a wide amount of
commands to collect and process data. It focuses on simplicity and hides
advanced programming concepts from the user.

Some code examples:

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

> This requires the installation of the [lab commands][m42pl-git-commands-lab]

```
| cv2_read
| cv2_resize ratio=0.5
| zmq_pub topic='webcam'
```

**Display a video stream**

> This requires the installation of the [lab commands][m42pl-git-commands-lab]

```
| zmq_sub topic='webcam'
| decode {zmq.frames[0]} with 'msgpack'
| cv2_show cv2.frame
```

---

[splunk]: https://splunk.com
[m42pl-git-core]: https://github.com/jpclipffel/m42pl-core
[m42pl-git-commands]: https://github.com/jpclipffel/m42pl-commands
[m42pl-git-commands-lab]: https://github.com/jpclipffel/m42pl-commands-lab
[m42pl-git-dispatchers]: https://github.com/jpclipffel/m42pl-dispatchers
[m42pl-git-kvstores]: https://github.com/jpclipffel/m42pl-kvstores
[m42pl-git-encoders]: https://github.com/jpclipffel/m42pl-encoders
[m42pl-docs-commands]: https://mine42.io/m42pl/m42pl-commands
