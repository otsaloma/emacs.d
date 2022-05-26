#!/usr/bin/env python3

import itertools

from pathlib import Path

objects = [
    __builtins__,
    bool(),
    dict(),
    float(),
    int(),
    list(),
    set(),
    str(),
    tuple(),
]
names = itertools.chain.from_iterable(map(dir, objects))
names = sorted(set(filter(lambda x: x[0].isalpha(), names)))
text = "\n".join(names) + "\n"
Path("python-mode").write_text(text, "utf-8")
