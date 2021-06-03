---
layout: default
title: M42PL
nav_order: 1
has_children: true
---

# M42PL - A Data Processing Language

M42PL is a *data processing language*, inspired by Bash and Splunk's SPL.

The language is designed to be as easy as possible to use, and to make common 
scripting and programming tasks even easier. It does not have a tedious syntax
to learn, and hides advanced programming concepts from the user.

Example:

```shell
| url 'https://api.ipify.org'
| fields response.content, response.status
| eval message = 'Your external IP is ' + response.content
| output format=json
```
