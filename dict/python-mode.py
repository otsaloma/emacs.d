#!/usr/bin/env python3
import itertools
objs = [
    bool(),
    dict(),
    float(),
    int(),
    list(),
    set(),
    str(),
    tuple(),
]
names = itertools.chain(*list(map(dir, objs)))
names = sorted(set(filter(lambda x: x[0].isalpha(), names)))
open("python-mode", "w").write("\n".join(names) + "\n")
