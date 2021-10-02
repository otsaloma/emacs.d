#!/usr/bin/env python3

import itertools

from pathlib import Path

clss = [bool, dict, float, int, list, set, str, tuple]
objs = [x() for x in clss]
names = itertools.chain.from_iterable(map(dir, objs))
names = sorted(set(filter(lambda x: x[0].isalpha(), names)))
text = "\n".join(names) + "\n"
Path("python-mode").write_text(text, "utf-8")
