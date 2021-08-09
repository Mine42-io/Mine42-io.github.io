---
layout: default
title: Concepts
nav_order: 1
parent: M42PL
---

# Concepts

M42PL - MPL for short - sees the world as a streams of data.

Everything is a _data_ from which some _information_ can be extracted using the
proper _algorithms_.

_Data_ is at the root of everything else: webcam streams, text files,
sensors feeds, etc. Data shape and content is heterogenous by nature.

_Information_ is the generic term used to describe the outcome of data
processing. Information is by nature temporary: as soon as an unit of
information is (re)used, it become data again.

_Algorithms_ refers to the M42PL pipelines, which consumes data and produces
information.

## Pipelines

Any M42PL script is a pipeline. A pipeline may reuse existing pipelines
templates named _macros_ and my be split into sub-pipelines.

Each pipeline produces _information_ from _data_. This information may be
stored into a storage backend, sent to a queue, etc.

## Commands

Commands manipulates events: they can change, remove and add events fields or
filter and create events.

## Events

Events store the data as chunks. They are similar to JSON objects.
Events can have nested structure and support any kind of object.
