---
layout: default
title: Installation
nav_order: 2
parent: M42PL
---

# M42PL installation

## From the sources

### Requirements

* Python 3.9+
* PIP

### Steps

Create and activate a virtual environement:

```shell
python3 -m virtualenv m42pl
source m42pl/bin/activate
```

Install the core language `m42pl_core`:
```
git clone https://github.com/jpclipffel/m42pl-core
pip install m42pl-core
```

Install the core commands `m42pl_commands`:
```
git clone https://github.com/jpclipffel/m42pl-commands
pip install m42pl-commands
```

Install the core dispatchers `m42pl_dispatchers`:
```
git clone https://github.com/jpclipffel/m42pl-dispatchers
pip install m42pl-dispatchers
```

Install the core kvstores `m42pl_kvsotres`:
```
git clone https://github.com/jpclipffel/m42pl-kvstores
pip install m42pl-kvstores
```

Install the core encoders `m42pl_encoders`:
```
git clone https://github.com/jpclipffel/m42pl-encoders
pip install m42pl-encoders
```


---

[m42pl-core-install]: https://github.com/jpclipffel/m42pl-core#installation
